/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 1;		    /* -c option; centers dmenu on screen */
static int min_width = 500;			/* min width when centered */
static int fuzzy = 1; 			    /* -F option; if 0, dmenu doesnt use fuzzy matching */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Noto Sans Mono:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#dedede", "#111111" },
	[SchemeSel] = { "#eeeeee", "#00998f" },
	[SchemeNormHighlight] = { "#e27474", "#111111" },
	[SchemeSelHighlight] = { "#e27474", "#00998f" },
	[SchemeOut] = { "#ffffff", "#000000" },
	[SchemeBorder] = { "#111111", NULL },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 10;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
/* Size of the window border */
static unsigned int border_width = 3;
