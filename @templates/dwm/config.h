static const unsigned int borderpx = 2; /* border pixel of windows */
static const unsigned int snap = 32;    /* snap pixel */
static const int showbar = 1;           /* 0 means no bar */
static const int topbar = 1;            /* 0 means bottom bar */
static const char* fonts[] = {"PragmataPro:pixelsize=16", "JoyPixels:pixelsize=36"};
static const char* colors[][3] = {
	/*               fg         bg         border   */
	[SchemeNorm] = {"#e5e6e6", "#171717", "#444444"},
	[SchemeSel] = {"#e5e6e6", "#0f3a4b", "#affe69"},
};

/* tagging */
static const char* tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	// {"Gimp", NULL, NULL, 0, 1, -1},
	// {"Firefox", NULL, NULL, 1 << 8, 0, -1},
	{"Code", "code", NULL, 1 << 1, 0, -1},
};

static const float mfact = 0.5373352766f;
static const int nmaster = 1;
static const int resizehints = 1;

static void deck(Monitor* m)
{
	unsigned int i, n, h, mw, my;
	Client* c;

	for (n = 0, c = nexttiled(m->clients); c; c = nexttiled(c->next), n++)
		;
	if (n == 0) return;

	if (n > m->nmaster) {
		mw = m->nmaster ? m->ww * m->mfact : 0;
		snprintf(m->ltsymbol, sizeof m->ltsymbol, "[][%d]", n - m->nmaster);
	} else
		mw = m->ww;
	for (i = my = 0, c = nexttiled(m->clients); c; c = nexttiled(c->next), i++)
		if (i < m->nmaster) {
			h = (m->wh - my) / (MIN(n, m->nmaster) - i);
			resize(c, m->wx, m->wy + my, mw - (2 * c->bw), h - (2 * c->bw), 0);
			my += HEIGHT(c);
		} else
			resize(c, m->wx + mw, m->wy, m->ww - mw - (2 * c->bw), m->wh - (2 * c->bw),
			       0);
}

static const Layout layouts[] = {
	/* symbol     arrange function */
	{"[]=", tile}, /* first entry is default */
	{"><>", NULL}, /* no layout function means floating behavior */
	{"[M]", monocle},
	{"[][]", deck}};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                                          \
	{MODKEY, KEY, view, {.ui = 1 << TAG}},                                                     \
		{MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},                         \
		{MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                                  \
	{                                                                                          \
		MODKEY | ControlMask | ShiftMask, KEY, toggletag,                                  \
		{                                                                                  \
			.ui = 1 << TAG                                                             \
		}                                                                                  \
	}

#define SHCMD(cmd)                                                                                 \
	{                                                                                          \
		.v = (const char*[])                                                               \
		{                                                                                  \
			"/run/current-system/sw/bin/bash", "-c", cmd, NULL                         \
		}                                                                                  \
	}

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char* dmenucmd[] = {"dmenu_run", "-m", dmenumon, NULL};
static const char* termcmd[] = {"urxvtc", NULL};

static Key keys[] = {
	/* modifier                     key        function        argument */
	{MODKEY, XK_p, spawn, {.v = dmenucmd}},
	{MODKEY | ShiftMask, XK_Return, spawn, {.v = termcmd}},
	{MODKEY, XK_b, togglebar, {0}},
	{MODKEY, XK_j, focusstack, {.i = +1}},
	{MODKEY, XK_k, focusstack, {.i = -1}},
	{MODKEY, XK_i, incnmaster, {.i = +1}},
	{MODKEY, XK_d, incnmaster, {.i = -1}},
	{MODKEY, XK_h, setmfact, {.f = -0.001464128844f}},
	{MODKEY, XK_l, setmfact, {.f = 0.001464128844f}},
	{MODKEY, XK_Return, zoom, {0}},
	{MODKEY, XK_Tab, view, {0}},
	{MODKEY | ShiftMask, XK_c, killclient, {0}},
	{MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
	{MODKEY, XK_f, setlayout, {.v = &layouts[1]}},
	{MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
	{MODKEY, XK_c, setlayout, {.v = &layouts[3]}},
	{MODKEY, XK_space, setlayout, {0}},
	{MODKEY | ShiftMask, XK_space, togglefloating, {0}},
	{MODKEY, XK_0, view, {.ui = ~0}},
	{MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
	{MODKEY, XK_comma, focusmon, {.i = -1}},
	{MODKEY, XK_period, focusmon, {.i = +1}},
	{MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
	{MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},
	TAGKEYS(XK_1, 0),
	TAGKEYS(XK_2, 1),
	TAGKEYS(XK_3, 2),
	TAGKEYS(XK_4, 3),
	TAGKEYS(XK_5, 4),
	TAGKEYS(XK_6, 5),
	TAGKEYS(XK_7, 6),
	TAGKEYS(XK_8, 7),
	TAGKEYS(XK_9, 8),
	{MODKEY | ShiftMask, XK_q, quit, {0}},
	{MODKEY, XK_Escape, spawn, {.v = (const char*[]){"slock", NULL}}},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ClkLtSymbol, 0, Button1, setlayout, {0}},
	{ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
	{ClkWinTitle, 0, Button2, zoom, {0}},
	{ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
	{ClkClientWin, MODKEY, Button1, movemouse, {0}},
	{ClkClientWin, MODKEY, Button2, togglefloating, {0}},
	{ClkClientWin, MODKEY, Button3, resizemouse, {0}},
	{ClkTagBar, 0, Button1, view, {0}},
	{ClkTagBar, 0, Button3, toggleview, {0}},
	{ClkTagBar, MODKEY, Button1, tag, {0}},
	{ClkTagBar, MODKEY, Button3, toggletag, {0}},
};

/* vim: set ft=c: */