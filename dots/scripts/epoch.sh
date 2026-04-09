#!/usr/bin/env bash
set -euo pipefail

install_time=$(date -d "2025-09-20 23:47:23" +%s)
current_time=$(date +%s)
install_datetime=$(date -d "@$install_time" "+%d-%m-%Y %H:%M:%S")
current_datetime=$(date "+%d-%m-%Y %H:%M:%S")

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

echo "initial linux install time:$install_datetime"
echo "current time:$current_datetime"
echo
echo "time elapsed since then:"
printf "in seconds:%s\n" "$(p "$age_seconds" second)"
printf "in minutes:%s, %s\n" "$(p "$total_minutes" minute)" "$(p "$seconds" second)"
printf "in hours:%s, %s, %s\n" "$(p "$total_hours" hour)" "$(p "$minutes" minute)" "$(p "$seconds" second)"
printf "in days:%s, %s, %s, %s\n" "$(p "$total_days" day)" "$(p "$hours" hour)" "$(p "$minutes" minute)" "$(p "$seconds" second)"
printf "in months:%s, %s, %s, %s, %s\n" "$(p "$total_months" month)" "$(p "$days" day)" "$(p "$hours" hour)" "$(p "$minutes" minute)" "$(p "$seconds" second)"
printf "in years:%s, %s, %s, %s, %s, %s\n" "$(p "$years" year)" "$(p "$months" month)" "$(p "$days" day)" "$(p "$hours" hour)" "$(p "$minutes" minute)" "$(p "$seconds" second)"
