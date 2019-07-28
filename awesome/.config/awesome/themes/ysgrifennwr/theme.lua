local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme_path = "/home/xha/.config/awesome/themes/ysgrifennwr/"

local theme = {}

theme.font          = ".Helvetica Neue DeskInterface 11"
theme.taglist_font  = ".Helvetica Neue DeskInterface 12"

theme.bg_focus      = "linear:0,0:0,12:0,#b6d4ef:1,#a3c3e3"
theme.bg_normal     = "linear:0,0:0,12:0,#e5e5e4:1,#cdcdcd"
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#424242"
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = "#E32791"
theme.fg_minimize   = "#868584"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#868584"
theme.border_focus  = "#424242"
theme.border_marked = "#A25D0E"

theme.titlebar_bg_normal     = "#edece8"
theme.titlebar_bg_focus      = theme.titlebar_bg_normal
theme.titlebar_fg_normal     = "#868584"
theme.titlebar_fg_focus      = "#424242"

theme.hotkeys_modifiers_fg = "#868584"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon  = theme_path.."submenu.svg"
theme.menu_height        = dpi(22)
theme.menu_width         = dpi(150)
theme.menu_bg_focus      = "#aacae8"
theme.menu_bg_normal     = "#d9d8d7"
theme.menu_fg_focus      = "#424242"
theme.menu_fg_normal     = "#424242"
theme.menu_border_width  = 1
theme.menu_border_color  = "#1e1e1e"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme_path.."titlebar/close_normal.svg"
theme.titlebar_close_button_focus  = theme_path.."titlebar/close_focus.svg"
theme.titlebar_close_button_normal_hover = theme_path.."titlebar/close_hover.svg"
theme.titlebar_close_button_focus_hover  = theme.titlebar_close_button_normal_hover
theme.titlebar_close_button_normal_press = theme_path.."titlebar/close_press.svg"
theme.titlebar_close_button_focus_press  = theme.titlebar_close_button_normal_press

theme.titlebar_minimize_button_normal = theme_path.."titlebar/minimize_normal.svg"
theme.titlebar_minimize_button_focus  = theme_path.."titlebar/minimize_focus.svg"
theme.titlebar_minimize_button_normal_hover = theme_path.."titlebar/minimize_hover.svg"
theme.titlebar_minimize_button_focus_hover  = theme.titlebar_minimize_button_normal_hover
theme.titlebar_minimize_button_normal_press = theme_path.."titlebar/minimize_press.svg"
theme.titlebar_minimize_button_focus_press  = theme.titlebar_minimize_button_normal_press

theme.titlebar_ontop_button_normal_inactive = theme_path.."titlebar/ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive  = theme_path.."titlebar/ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = theme_path.."titlebar/ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active  = theme_path.."titlebar/ontop_focus_active.svg"
theme.titlebar_ontop_button_normal_inactive_hover = theme_path.."titlebar/ontop_hover_inactive.svg"
theme.titlebar_ontop_button_focus_inactive_hover  = theme.titlebar_ontop_button_normal_inactive_hover
theme.titlebar_ontop_button_normal_active_hover = theme_path.."titlebar/ontop_hover_active.svg"
theme.titlebar_ontop_button_focus_active_hover  = theme.titlebar_ontop_button_normal_active_hover
theme.titlebar_ontop_button_normal_inactive_press = theme_path.."titlebar/ontop_press_inactive.svg"
theme.titlebar_ontop_button_focus_inactive_press  = theme.titlebar_ontop_button_normal_inactive_press
theme.titlebar_ontop_button_normal_active_press = theme_path.."titlebar/ontop_press_active.svg"
theme.titlebar_ontop_button_focus_active_press  = theme.titlebar_ontop_button_normal_active_press

theme.titlebar_sticky_button_normal_inactive = theme_path.."titlebar/sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive  = theme_path.."titlebar/sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = theme_path.."titlebar/sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active  = theme_path.."titlebar/sticky_focus_active.svg"
theme.titlebar_sticky_button_normal_inactive_hover = theme_path.."titlebar/sticky_hover_inactive.svg"
theme.titlebar_sticky_button_focus_inactive_hover  = theme.titlebar_sticky_button_normal_inactive_hover
theme.titlebar_sticky_button_normal_active_hover = theme_path.."titlebar/sticky_hover_active.svg"
theme.titlebar_sticky_button_focus_active_hover  = theme.titlebar_sticky_button_normal_active_hover
theme.titlebar_sticky_button_normal_inactive_press = theme_path.."titlebar/sticky_press_inactive.svg"
theme.titlebar_sticky_button_focus_inactive_press  = theme.titlebar_sticky_button_normal_inactive_press
theme.titlebar_sticky_button_normal_active_press = theme_path.."titlebar/sticky_press_active.svg"
theme.titlebar_sticky_button_focus_active_press  = theme.titlebar_sticky_button_normal_active_press

theme.titlebar_floating_button_normal_inactive = theme_path.."titlebar/floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive  = theme_path.."titlebar/floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = theme_path.."titlebar/floating_normal_active.svg"
theme.titlebar_floating_button_focus_active  = theme_path.."titlebar/floating_focus_active.svg"
theme.titlebar_floating_button_normal_inactive_hover = theme_path.."titlebar/floating_hover_inactive.svg"
theme.titlebar_floating_button_focus_inactive_hover  = theme.titlebar_floating_button_normal_inactive_hover
theme.titlebar_floating_button_normal_active_hover = theme_path.."titlebar/floating_hover_active.svg"
theme.titlebar_floating_button_focus_active_hover  = theme.titlebar_floating_button_normal_active_hover
theme.titlebar_floating_button_normal_inactive_press = theme_path.."titlebar/floating_press_inactive.svg"
theme.titlebar_floating_button_focus_inactive_press  = theme.titlebar_floating_button_normal_inactive_press
theme.titlebar_floating_button_normal_active_press = theme_path.."titlebar/floating_press_active.svg"
theme.titlebar_floating_button_focus_active_press  = theme.titlebar_floating_button_normal_active_press

theme.titlebar_maximized_button_normal_inactive = theme_path.."titlebar/maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = theme_path.."titlebar/maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = theme_path.."titlebar/maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = theme_path.."titlebar/maximized_focus_active.svg"
theme.titlebar_maximized_button_normal_inactive_hover = theme_path.."titlebar/maximized_hover_inactive.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = theme.titlebar_maximized_button_normal_inactive_hover
theme.titlebar_maximized_button_normal_active_hover = theme_path.."titlebar/maximized_hover_active.svg"
theme.titlebar_maximized_button_focus_active_hover  = theme.titlebar_maximized_button_normal_active_hover
theme.titlebar_maximized_button_normal_inactive_press = theme_path.."titlebar/maximized_press_inactive.svg"
theme.titlebar_maximized_button_focus_inactive_press  = theme.titlebar_maximized_button_normal_inactive_press
theme.titlebar_maximized_button_normal_active_press = theme_path.."titlebar/maximized_press_active.svg"
theme.titlebar_maximized_button_focus_active_press  = theme.titlebar_maximized_button_normal_active_press

-- this should be in rc.lua
theme.wallpaper = function ()
    return "/home/xha/var/wallpapers/alena-aenami-1.png"
end

-- You can use your own layout icons like this:
theme.layout_fairh = theme_path.."layouts/fair.svg"
theme.layout_fairv = theme_path.."layouts/fair.svg"
theme.layout_floating  = theme_path.."layouts/floating.svg"
theme.layout_magnifier = theme_path.."layouts/magnifier.svg"
theme.layout_max = theme_path.."layouts/max.svg"
theme.layout_fullscreen = theme_path.."layouts/fullscreen.svg"
theme.layout_tilebottom = theme_path.."layouts/tile.svg"
theme.layout_tileleft   = theme_path.."layouts/tile.svg"
theme.layout_tile = theme_path.."layouts/tile.svg"
theme.layout_tiletop = theme_path.."layouts/tile.svg"
theme.layout_spiral  = theme_path.."layouts/spiral.svg"
theme.layout_dwindle = theme_path.."layouts/spiral.svg"
theme.layout_cornernw = theme_path.."layouts/corner.svg"
theme.layout_cornerne = theme_path.."layouts/corner.svg"
theme.layout_cornersw = theme_path.."layouts/corner.svg"
theme.layout_cornerse = theme_path.."layouts/corner.svg"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_normal, theme.fg_normal
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
