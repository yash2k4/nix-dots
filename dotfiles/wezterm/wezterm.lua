local wezterm = require("wezterm")

return {
	term = "xterm-256color",

	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",

	font = wezterm.font_with_fallback({
		{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
	}),
	font_size = 23.0,

	line_height = 0.80,

	adjust_window_size_when_changing_font_size = false,

	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},

	default_cursor_style = "SteadyBlock",
	cursor_blink_rate = 0,

	hide_mouse_cursor_when_typing = true,

	scrollback_lines = 10000,

	keys = {
		{
			key = "Home",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ScrollToTop,
		},
		{
			key = "End",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ScrollToBottom,
		},
	},

	colors = {
		foreground = "#cdd6f4",
		background = "#1e1e2e",

		cursor_bg = "#f5e0dc",
		cursor_fg = "#11111b",

		selection_fg = "#cdd6f4",
		selection_bg = "#3e3a5e",

		ansi = {
			"#45475a",
			"#f38ba8",
			"#a6e3a1",
			"#f9e2af",
			"#cba6f7",
			"#cba6f7",
			"#94e2d5",
			"#bac2de",
		},

		brights = {
			"#585b70",
			"#f38ba8",
			"#a6e3a1",
			"#f9e2af",
			"#cba6f7",
			"#cba6f7",
			"#94e2d5",
			"#a6adc8",
		},
	},

	window_background_opacity = 0.95,
}
