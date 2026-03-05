#include <X11/XF86keysym.h>
#include <X11/keysym.h>

static const unsigned int borderpx = 1;
static const unsigned int snap = 32;
static const int showbar = 1;
static const int topbar = 1;
static const char *fonts[] = {
	"JetBrainsMono Nerd Font:size=15"
};
static const char dmenufont[] =
	"JetBrainsMono Nerd Font:size=15";

static const char col_bg[]     = "#1e1e2e";
static const char col_bg_alt[] = "#313244";
static const char col_fg[]     = "#cdd6f4";
static const char col_fg_alt[] = "#f5e0dc";
static const char col_mauve[]  = "#cba6f7";

static const char *colors[][3] = {
	[SchemeNorm] = { col_fg,     col_bg,     col_bg_alt },
	[SchemeSel]  = { col_fg_alt, col_mauve,  col_mauve  },
};

static const char *tags[] = {
	"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"
};

static const float mfact = 0.55;
static const int nmaster = 1;
static const int resizehints = 1;
static const int lockfullscreen = 1;
static const int refreshrate = 120;

static const Layout layouts[] = {
	{ "[]=", tile },
	{ "><>", NULL },
	{ "[M]", monocle },
};

#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY, view,       {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY, toggleview, {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY, tag,        {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY, toggletag,  {.ui = 1 << TAG} },

#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static char dmenumon[2] = "0";
static const char *dmenucmd[] = {
	"dmenu_run", "-m", dmenumon, "-fn", dmenufont,
	"-nb", col_bg,    "-nf", col_fg,
	"-sb", col_mauve, "-sf", col_fg_alt,
	NULL
};

static const char *termcmd[] = { "st", NULL };

static const char *screenshot[] = {
	"scrot",
	"-s",
	"/home/yashy/Pictures/Screenshots/%Y-%m-%d-%T-screenshot.jpg",
	NULL
};

static const char *lockcmd[] = { "slock", NULL };

static const Key keys[] = {
	{ MODKEY, XK_d, spawn, {.v = dmenucmd } },
	{ MODKEY, XK_Return, spawn, {.v = termcmd } },
	{ MODKEY, XK_b, togglebar, {0} },
	{ MODKEY, XK_j, focusstack, {.i = +1 } },
	{ MODKEY, XK_k, focusstack, {.i = -1 } },
	{ MODKEY, XK_i, incnmaster, {.i = +1 } },
	{ MODKEY, XK_p, incnmaster, {.i = -1 } },
	{ MODKEY, XK_h, setmfact, {.f = -0.05} },
	{ MODKEY, XK_l, setmfact, {.f = +0.05} },
	{ MODKEY, XK_z, zoom, {0} },
	{ MODKEY, XK_Tab, view, {0} },
	{ MODKEY, XK_q, killclient, {0} },
	{ MODKEY, XK_t, setlayout, {.v = &layouts[0]} },
	{ MODKEY, XK_f, setlayout, {.v = &layouts[1]} },
	{ MODKEY, XK_m, setlayout, {.v = &layouts[2]} },
	{ MODKEY, XK_space, setlayout, {0} },
	{ MODKEY|ShiftMask, XK_space, togglefloating, {0} },
	{ MODKEY, XK_0, view, {.ui = ~0 } },
	{ MODKEY|ShiftMask, XK_0, tag, {.ui = ~0 } },
	{ MODKEY, XK_comma, focusmon, {.i = -1 } },
	{ MODKEY, XK_period, focusmon, {.i = +1 } },
	{ MODKEY|ShiftMask, XK_comma, tagmon, {.i = -1 } },
	{ MODKEY|ShiftMask, XK_period, tagmon, {.i = +1 } },
	{ 0, XK_Print, spawn, {.v = screenshot } },
	{ MODKEY|ShiftMask, XK_l, spawn, {.v = lockcmd } },
	{ 0, XF86XK_AudioRaiseVolume, spawn, SHCMD("pamixer -i 5") },
	{ 0, XF86XK_AudioLowerVolume, spawn, SHCMD("pamixer -d 5") },
	{ 0, XF86XK_AudioMute, spawn, SHCMD("pamixer -t") },
	{ 0, XF86XK_MonBrightnessUp, spawn, SHCMD("brightnessctl set +5%") },
	{ 0, XF86XK_MonBrightnessDown, spawn, SHCMD("brightnessctl set 5%-") },

	TAGKEYS( XK_1, 0 )
	TAGKEYS( XK_2, 1 )
	TAGKEYS( XK_3, 2 )
	TAGKEYS( XK_4, 3 )
	TAGKEYS( XK_5, 4 )
	TAGKEYS( XK_6, 5 )
	TAGKEYS( XK_7, 6 )
	TAGKEYS( XK_8, 7 )
	TAGKEYS( XK_9, 8 )

	{ MODKEY|ShiftMask, XK_q, quit, {0} },
};

static const Button buttons[] = {
	{ ClkLtSymbol,   0,      Button1, setlayout,      {0} },
	{ ClkLtSymbol,   0,      Button3, setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,   0,      Button2, zoom,           {0} },
	{ ClkStatusText, 0,      Button2, spawn,          {.v = termcmd } },
	{ ClkClientWin,  MODKEY, Button1, movemouse,      {0} },
	{ ClkClientWin,  MODKEY, Button2, togglefloating, {0} },
	{ ClkClientWin,  MODKEY, Button3, resizemouse,    {0} },
	{ ClkTagBar,     0,      Button1, view,           {0} },
	{ ClkTagBar,     0,      Button3, toggleview,     {0} },
	{ ClkTagBar,     MODKEY, Button1, tag,            {0} },
	{ ClkTagBar,     MODKEY, Button3, toggletag,      {0} },
};
