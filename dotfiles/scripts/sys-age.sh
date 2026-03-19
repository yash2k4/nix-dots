#!/usr/bin/env bash
set -euo pipefail

if ! install_time=$(stat -c %W /nix/store 2>/dev/null) || [[ "$install_time" -le 0 ]]; then
  install_time=$(stat -c %Y /nix/var/nix/profiles/system-1-link 2>/dev/null || echo 0)
fi

if [[ "$install_time" -le 0 ]]; then
  echo "Cannot determine install date."
  exit 1
fi

current_time=$(date +%s)
install_datetime=$(date -d "@$install_time" "+%Y-%m-%d %H:%M:%S")
age_seconds=$((current_time - install_time))

seconds=$((age_seconds % 60))
total_minutes=$((age_seconds / 60))
minutes=$((total_minutes % 60))
total_hours=$((total_minutes / 60))
hours=$((total_hours % 24))
total_days=$((total_hours / 24))
days=$((total_days % 30))
total_months=$((total_days / 30))
months=$((total_months % 12))
years=$((total_months / 12))

p() {
  if [[ $1 -eq 1 ]]; then
    printf "%s %s" "$1" "$2"
  else
    printf "%s %ss" "$1" "$2"
  fi
}

echo "System Install Date & Time: $install_datetime"
echo

echo "Time Since Install:"
printf "In Seconds: %s\n" "$(p "$age_seconds" second)"
printf "In Minutes: %s, %s\n" "$(p "$total_minutes" minute)" "$(p "$seconds" second)"
printf "In Hours:   %s, %s, %s\n" "$(p "$total_hours" hour)" "$(p "$minutes" minute)" "$(p "$seconds" second)"
printf "In Days:    %s, %s, %s, %s\n" "$(p "$total_days" day)" "$(p "$hours" hour)" "$(p "$minutes" minute)" "$(p "$seconds" second)"
printf "In Months:  %s, %s, %s, %s, %s\n" "$(p "$total_months" month)" "$(p "$days" day)" "$(p "$hours" hour)" "$(p "$minutes" minute)" "$(p "$seconds" second)"
printf "In Years:   %s, %s, %s, %s, %s, %s\n" "$(p "$years" year)" "$(p "$months" month)" "$(p "$days" day)" "$(p "$hours" hour)" "$(p "$minutes" minute)" "$(p "$seconds" second)"
