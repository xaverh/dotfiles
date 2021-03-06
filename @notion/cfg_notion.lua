
-- META="Mod4+"
-- ALTMETA="Mod4+Shift+"
XTERM = 'st'
-- Edit file command, mod_query.query_editfile
-- EDIT_COMMAND="run-mailcap --action=edit"
-- View file command, mod_query.query_viewfile
VIEW_COMMAND = 'brave'

-- Some basic settings.
ioncore.set {
	-- Maximum delay between clicks in milliseconds to be considered a
	-- double click.
	-- dblclick_delay=250,

	-- For keyboard resize, time (in milliseconds) to wait after latest
	-- key press before automatically leaving resize mode (and doing
	-- the resize in case of non-opaque move).
	-- kbresize_delay=1500,

	-- Opaque resize?
	opaque_resize = true,

	-- Movement commands warp the pointer to frames instead of just
	-- changing focus. Enabled by default.
	-- warp=true,

	-- Margin to use when warping the cursor (in pixels),
	-- to inset from the edge of the frame.
	-- warp_margin=5,

	-- Placement to use when positioning the cursor in the frame
	-- (as a factor from 0-1).
	-- Where an x,y value:
	-- * (0.0, 0.0) for top-left.
	-- * (1.0, 1.0) for bottom-right.
	-- * (0.5, 0.5) for the center of the frame.
	-- warp_factor_x=0.0,
	-- warp_factor_y=0.0,

	-- Should a managing MPlex switch to a newly mapped client window?
	-- switchto=true,

	-- Should notification tooltips be displayed for hidden workspaces with
	-- activity?
	-- screen_notify=true,

	-- Specifies where to add new regions on the mutually exclusive list of a
	-- frame. One of ''last'', ''next'' (for after current), ''next-act''
	-- (for after current and anything with activity right after it).
	frame_default_index = 'next-act',

	-- Put transients in nested frames.
	-- framed_transients=true,

	-- Float window placement method:
	-- one of 'udlr' (up down left right), 'lrud' (left right up down), 'pointer' or 'random'.
	-- float_placement_method="udlr",

	-- Auto-unsqueeze transients/menus/queries/etc.
	unsqueeze = false,

	-- Float non-transient dialog type windows.
	-- Can be useful for applications that try to place their own dialog windows.
	window_dialog_float = true,

	-- Autoraise regions in groups on goto.
	-- autoraise=true,

	-- Automatically save layout on restart and exit.
  autosave_layout = false,

	-- Mouse focus mode; set to "sloppy" if you want the focus to follow the
	-- mouse, and to "disabled" otherwise.
	mousefocus = 'sloppy',

	-- Controls Notion's reaction to stacking requests sent by clients. Set to
	-- "ignore" to ignore these requests, and to "activate" to set the activity
	-- flag on a window that requests to be stacked "Above".
	-- window_stacking_request="ignore",

	-- Time (in ms) that a window has to be focussed in order to be added to the
	-- focus list. Set this to <=0 (or comment it out) to disable the logic, and
	-- update the focus list immediately.
	-- focuslist_insert_delay=1000,
	focuslist_insert_delay = 0,

	-- If enabled, activity notifiers are displayed on ALL the screens, not just
	-- the screen that contains the window producing the notification. This is
	-- only relevant on multi-head setups. By default this is disabled.
	-- activity_notification_on_all_screens=false,

	-- If enabled, a workspace indicator comes up at the bottom-left of the
	-- screen when a new workspace is selected. This indicator stays active for
	-- only as long as indicated by this variable (in ms). Timeout values <=0
	-- disable the indicator altogether. This is disabled by default.
	workspace_indicator_timeout = 0
}

-- Note that mod_dock and mod_statusbar are mutually exclusive.
dopath 'cfg_kludges'
dopath 'cfg_layouts'
dopath 'mod_query'
dopath 'mod_menu'
dopath 'mod_tiling'
dopath 'mod_statusbar'
-- dopath 'mod_dock'
dopath 'mod_sp'
-- dopath 'mod_notionflux'
dopath 'mod_xrandr'
dopath 'net_client_list'
dopath 'cfg_notioncore'

--
-- Common customisations
--

-- Uncommenting the following lines should get you plain-old-menus instead
-- of query-menus.

defbindings('WMPlex.toplevel', { kpress(META .. 'm', 'mod_menu.menu(_, _sub, "ctxmenu")') })

