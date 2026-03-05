static char *font = "JetBrainsMono Nerd Font:size=17.5:antialias=true:autohint=true";
static int borderpx = 2;

static char *shell = "/bin/zsh";
char *utmp = NULL;
char *scroll = NULL;
char *stty_args = "stty raw pass8 nl -echo -iexten -cstopb 38400";

char *vtiden = "\033[?6c";

static float cwscale = 1.0;
static float chscale = 1.0;

wchar_t *worddelimiters = L" ";

static unsigned int doubleclicktimeout = 300;
static unsigned int tripleclicktimeout = 600;

int allowaltscreen = 1;
int allowwindowops = 0;

static double minlatency = 2;
static double maxlatency = 33;

static unsigned int blinktimeout = 800;
static unsigned int cursorthickness = 2;

static int bellvolume = 0;

char *termname = "st-256color";

unsigned int tabspaces = 8;

static const char *colorname[] = {
	"#181825",
	"#f38ba8",
	"#a6e3a1",
	"#f9e2af",
	"#89b4fa",
	"#cba6f7",
	"#94e2d5",
	"#cdd6f4",

	"#585b70",
	"#f38ba8",
	"#a6e3a1",
	"#f9e2af",
	"#89b4fa",
	"#cba6f7",
	"#94e2d5",
	"#ffffff",

	[255] = 0,

	"#cdd6f4",
	"#313244",
	"#cdd6f4",
	"#1e1e2e",
};

unsigned int defaultfg = 258;
unsigned int defaultbg = 259;
unsigned int defaultcs = 256;
static unsigned int defaultrcs = 257;

static unsigned int cursorshape = 2;

static unsigned int cols = 80;
static unsigned int rows = 24;

static unsigned int mouseshape = XC_xterm;
static unsigned int mousefg = 7;
static unsigned int mousebg = 0;

static unsigned int defaultattr = 11;

static uint forcemousemod = ShiftMask;

static MouseShortcut mshortcuts[] = {
	{ XK_ANY_MOD, Button2, selpaste, {.i = 0}, 1 },
	{ ShiftMask, Button4, ttysend, {.s = "\033[5;2~"} },
	{ XK_ANY_MOD, Button4, ttysend, {.s = "\031"} },
	{ ShiftMask, Button5, ttysend, {.s = "\033[6;2~"} },
	{ XK_ANY_MOD, Button5, ttysend, {.s = "\005"} },
};

#define MODKEY Mod1Mask
#define TERMMOD (ControlMask|ShiftMask)

static Shortcut shortcuts[] = {
	{ XK_ANY_MOD, XK_Break, sendbreak, {.i = 0} },
	{ ControlMask, XK_Print, toggleprinter, {.i = 0} },
	{ ShiftMask, XK_Print, printscreen, {.i = 0} },
	{ XK_ANY_MOD, XK_Print, printsel, {.i = 0} },
	{ TERMMOD, XK_Prior, zoom, {.f = +1} },
	{ TERMMOD, XK_Next, zoom, {.f = -1} },
	{ TERMMOD, XK_Home, zoomreset, {.f = 0} },
	{ TERMMOD, XK_C, clipcopy, {.i = 0} },
	{ TERMMOD, XK_V, clippaste, {.i = 0} },
	{ TERMMOD, XK_Y, selpaste, {.i = 0} },
	{ ShiftMask, XK_Insert, selpaste, {.i = 0} },
	{ TERMMOD, XK_Num_Lock, numlock, {.i = 0} },
};

static KeySym mappedkeys[] = { -1 };

static uint ignoremod = Mod2Mask|XK_SWITCH_MOD;

static Key key[] = {
	{ XK_BackSpace, XK_NO_MOD, "\177", 0, 0 },
	{ XK_BackSpace, Mod1Mask, "\033\177", 0, 0 },
	{ XK_Return, XK_ANY_MOD, "\r", 0, 0 },
};

static uint selmasks[] = {
	[SEL_RECTANGULAR] = Mod1Mask,
};

static char ascii_printable[] =
	" !\"#$%&'()*+,-./0123456789:;<=>?"
	"@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_"
	"`abcdefghijklmnopqrstuvwxyz{|}~";
