#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
exec sudo "$0" "$@"
fi

USER_NAME=${SUDO_USER:-$(whoami)}

install_if_missing() {
if ! pacman -Qi "$1" &>/dev/null; then
pacman -S --noconfirm --needed "$1"
fi
}

install_if_missing docker
install_if_missing tlp
install_if_missing tlp-rdw
install_if_missing ufw

systemctl daemon-reexec

systemctl enable --now docker.service
systemctl enable --now tlp.service
systemctl enable --now ufw.service

getent group docker >/dev/null || groupadd docker
usermod -aG docker "$USER_NAME"

if ! ufw status | grep -q "Status: active"; then
ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw default deny routed
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow from 192.168.1.0/24 to any port 53317 proto tcp
ufw allow from 192.168.1.0/24 to any port 53317 proto udp
ufw allow from 192.168.1.0/24 to any port 5353 proto udp
ufw allow from fe80::/10 to any port 53317 proto tcp
ufw allow from fe80::/10 to any port 53317 proto udp
ufw --force enable
else
ufw reload
fi

ufw status verbose

echo "Done"
