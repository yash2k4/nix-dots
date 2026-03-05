const unsigned int interval = 1000;

static const char unknown_str[] = "n/a";

#define MAXLEN 2048

static const struct arg args[] = {
	{ wifi_essid, "󰖩%s ", "wlan0" },
	{ wifi_perc,  "%s%% | ", "wlan0" },

	{ run_command, "󰃠 %s%% | ",
	  "brightnessctl -m | awk -F, '{print $4}' | tr -d '%'" },

	{ run_command, "%s | ",
	  "pamixer --get-mute && echo 󰖁 || echo 󰕾 $(pamixer --get-volume)%" },

	{ run_command, "%s | ",
	  "perc=$(cat /sys/class/power_supply/BAT1/capacity); "
	  "state=$(cat /sys/class/power_supply/BAT1/status); "
	  "if [ \"$state\" = Charging ]; then icon=󰂄; "
	  "elif [ \"$perc\" -ge 90 ]; then icon=󰁹; "
	  "elif [ \"$perc\" -ge 70 ]; then icon=󰂀; "
	  "elif [ \"$perc\" -ge 50 ]; then icon=󰁿; "
	  "elif [ \"$perc\" -ge 30 ]; then icon=󰁼; "
	  "else icon=󰂎; fi; "
	  "echo \"$icon $perc%\"" },

	{ datetime, "%s", "%d/%m/%Y %H:%M:%S" },
};
