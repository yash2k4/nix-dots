#!/bin/bash

CRIT_ID=9999

prev_battery=100

while true; do
    battery=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    status=$(acpi -b | grep -oE 'Charging|Discharging|Full')

    if [ "$status" = "Discharging" ]; then
        if [ "$battery" -le 5 ] && [ "$prev_battery" -gt 5 ]; then
            dunstify -u critical -r $CRIT_ID \
            "󰂃 Critical Battery — ${battery}%" \
            "Charge immediately to prevent shutdown."
        fi
    else
        # Clear critical notification when plugged in
        dunstify -r $CRIT_ID -t 1 ""
    fi

    prev_battery=$battery
    sleep 10
done
