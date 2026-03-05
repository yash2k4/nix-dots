#!/usr/bin/env bash

set -euo pipefail
trap 'echo -e "\n[!] Interrupted"; exit 1' INT TERM

PACCACHE_KEEP=2
USER_CACHE_DAYS=15
AUR_CACHE_DAYS=15
JOURNAL_RETAIN="15d"
NON_INTERACTIVE=false

[[ "${1:-}" == "--yes" ]] && NON_INTERACTIVE=true

if command -v paru &>/dev/null; then
  AUR="paru"
elif command -v yay &>/dev/null; then
  AUR="yay"
else
  echo "No supported AUR helper found (paru/yay required)"
  exit 1
fi

LOG_DIR="$HOME/.local/var/log"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/arch-maintenance-$(date +%F_%H-%M-%S).log"
exec > >(tee -a "$LOG_FILE") 2>&1

announce() {
  printf "\n\033[1;36m==> %s\033[0m\n" "$1"
}

confirm() {
  if $NON_INTERACTIVE; then
    return 0
  fi
  read -r -p "${1:-Proceed?} [y/N]: " ans
  [[ "$ans" =~ ^([yY][eE][sS]|[yY])$ ]]
}

print_array() {
  ((${#@})) && printf '%s\n' "$@"
}

SECONDS=0

announce "Arch Maintenance Started"
echo "Date: $(date)"
echo "Host: $(hostnamectl --static)"
echo "User: $USER"
echo "AUR Helper: $AUR"

sudo -v

announce "Failed systemd services"
FAILED_SERVICES=$(systemctl --failed --no-legend || true)
if [[ -n "$FAILED_SERVICES" ]]; then
  echo "$FAILED_SERVICES"
else
  echo "No failed services"
fi

announce "Checking for updates"
if command -v checkupdates &>/dev/null; then
  checkupdates || true
fi

announce "System upgrade"
if confirm "Run full system upgrade?"; then
  $AUR -Syu
fi

announce "Pacnew/Pacsave files"
mapfile -t PACFILES < <(sudo find /etc -type f \( -name "*.pacnew" -o -name "*.pacsave" \) 2>/dev/null || true)
if ((${#PACFILES[@]})); then
  print_array "${PACFILES[@]}"
else
  echo "None found"
fi

announce "Pacman cache"
sudo du -sh /var/cache/pacman/pkg 2>/dev/null || true
if command -v paccache &>/dev/null; then
  if confirm "Trim cache (keep $PACCACHE_KEEP versions)?"; then
    sudo paccache -rk"$PACCACHE_KEEP"
  fi
else
  if confirm "Run pacman -Sc?"; then
    sudo pacman -Sc
  fi
fi
sudo du -sh /var/cache/pacman/pkg 2>/dev/null || true

announce "Orphaned packages"
mapfile -t ORPHANS < <(pacman -Qtdq 2>/dev/null || true)
if ((${#ORPHANS[@]})); then
  printf "Found %d orphan(s):\n" "${#ORPHANS[@]}"
  print_array "${ORPHANS[@]}"
  if confirm "Remove orphans?"; then
    sudo pacman -Rns "${ORPHANS[@]}"
  fi
else
  echo "None found"
fi

announce "User cache"
du -sh ~/.cache 2>/dev/null || true
if confirm "Remove files older than $USER_CACHE_DAYS days?"; then
  find ~/.cache -type f -mtime +"$USER_CACHE_DAYS" -delete 2>/dev/null || true
  find ~/.cache -type d -empty -delete 2>/dev/null || true
fi
du -sh ~/.cache 2>/dev/null || true

announce "AUR cache"
AUR_CACHE="$HOME/.cache/$AUR"
if [[ -d "$AUR_CACHE" ]]; then
  du -sh "$AUR_CACHE" || true
  if confirm "Remove AUR packages older than $AUR_CACHE_DAYS days?"; then
    find "$AUR_CACHE" -type f \( -name '*.pkg.tar*' -o -name '*.src.tar.gz' \) -mtime +"$AUR_CACHE_DAYS" -delete 2>/dev/null || true
    find "$AUR_CACHE" -type d -empty -delete 2>/dev/null || true
  fi
  du -sh "$AUR_CACHE" || true
fi

announce "Flatpak unused packages"
if command -v flatpak &>/dev/null; then
  if confirm "Remove unused Flatpak runtimes?"; then
    flatpak uninstall --unused -y || true
  fi
fi

announce "Docker cleanup"
if command -v docker &>/dev/null; then
  if confirm "Prune unused Docker data?"; then
    docker system prune -f
  fi
fi

announce "Systemd journal"
journalctl --disk-usage
if confirm "Vacuum journal (retain $JOURNAL_RETAIN)?"; then
  sudo journalctl --rotate
  sudo journalctl --vacuum-time="$JOURNAL_RETAIN"
fi
journalctl --disk-usage

announce "Maintenance Finished"
echo "Log file: $LOG_FILE"
echo "Elapsed: ${SECONDS}s"
