--@diagnostic disable: undefined-global
hl.monitor({ output = "DP-1", mode = "2560x1440@60", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "2560x1440@60", position = "-2560x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1680x1050@60", position = "0x-1050", scale = 1 })
hl.monitor({ output = "HDMI-A-2", mode = "1280x1024@60", position = "2560x416", scale = 1 })

hl.workspace_rule({ workspace = "1", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "7", monitor = "DP-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", persistent = true })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-2", persistent = true })

-- Variables
local terminal = "ghostty"
local browser = "chromium"
local launcher = "rofi -show drun"
local runner = "rofi -show run"
local mainMod = "SUPER"
-- local reload_waybar = "pkill waybar && waybar &"
local reload_waybar = "killall -SIGUSR2 waybar"

-- Environment Variables
hl.env = {
	"XCURSOR_SIZE,24",
	"HYPRCURSOR_SIZE,24",
}

-- Autostart Applications
hl.on("hyprland.start", function()
	hl.exec_cmd("sleep 1 && waybar")
	-- hl.exec_cmd(%)
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("swaync")
	hl.exec_cmd("wl-clipboard-history -t")
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd('rm "$HOME/.cache/cliphist/db"')
end)

-- General Settings
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 1,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 6,
		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 10,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
		-- bezier = "myBezier, 0.05, 0.9, 0.1, 1.05",
		-- animation = "windows, 1, 7, myBezier",
		-- animation = {
		-- 	"windows, 1, 8, default, popin 80%",
		-- 	"windowsOut, 1, 8, default, popin 80%",
		-- 	"border, 1, 10, default",
		-- 	"borderangle, 1, 8, default",
		-- 	"fade, 1, 7, default",
		-- 	"workspaces, 1, 6, default",
		-- 	"specialWorkspace, 1, 6, default, fade",
		-- },
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = false,
	},
	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},
	scrolling = {
		fullscreen_on_one_column = true,
	},

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 1.0,
		touchpad = {
			natural_scroll = false,
		},
		repeat_rate = 50,
		repeat_delay = 300,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device = {
	{
		name = "epic-mouse-v1",
		sensitivity = -0.5,
	},
}

hl.bind(mainMod .. " + SHIFT + CTRL + W", hl.dsp.exec_cmd(reload_waybar))

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
-- hl.bind(mainMod .. " + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "centerwindow" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(runner))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + ALT + GRAVE", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mainMod .. " + ALT + ESCAPE", hl.dsp.exec_cmd("hyprctl dispatch exit"))

-- Focus Navigation
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + H", hl.dsp.focus({ direction = "left" }))
hl.bind("ALT + L", hl.dsp.focus({ direction = "right" }))
hl.bind("ALT + K", hl.dsp.focus({ direction = "up" }))
hl.bind("ALT + J", hl.dsp.focus({ direction = "down" }))

-- Window Manipulation
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ direction = "down" }))

-- Resize Active
hl.bind("ALT + left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind("ALT + right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind("ALT + up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind("ALT + down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
-- hl.bind("ALT + R", hl.dsp.submap("resize"))
-- hl.define_submap("resize", function()
--   hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true}), { repeating = true})
--   hl.bind("left", hl.dsp.window.resize({ x = -20, y = 0, relative = true}), { repeating = true})
--   hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true})
--   hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true})
-- end)

-- Workspace Switching
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move to Workspace
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Monitor Focus
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ monitor = "e+1" }))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ monitor = "e-1" }))
hl.bind(mainMod .. " + S", hl.dsp.focus({ monitor = "DP-1" }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Audio & Brightness
hl.bind(
	mainMod .. " + CTRL + up",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind(
	mainMod .. " + CTRL + down",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
-- hl.bind(
-- 	mainMod .. " + SHIFT + up",
-- 	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	mainMod .. " + SHIFT + down",
-- 	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
-- 	{ locked = true, repeating = true }
-- )
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.window_rule({
	name = "pwvucontrol",
	match = { class = "^(com.saivert.pwvucontrol)$" },
	float = true,
	size = { "monitor_w*0.75", "monitor_h*0.75" },
})
hl.window_rule({
	name = "qpwgraph",
	match = { class = "^(org.rncbc.qpwgraph)$" },
	float = true,
	size = { "monitor_w*0.75", "monitor_h*0.75" },
	center = true,
})
hl.window_rule({
	name = "spotify",
	match = { class = "^(Spotify)$" },
	workspace = 8,
})
hl.window_rule({
	name = "virt-viewer",
	match = { class = "^(virt-viewer)$" },
	workspace = 7,
})
hl.window_rule({
	name = "gstreamer",
	match = { class = "^(GStreamer)$" },
	workspace = 6,
})
hl.window_rule({
	name = "alacritty",
	match = { class = "^(Alacritty)$" },
	workspace = 9,
})
hl.window_rule({
	name = "kitty",
	match = { class = "^(Kitty)$" },
	workspace = 10,
})
hl.window_rule({
	name = "specialWorkspace",
	match = { workspace = "special:magic" },
	opacity = "0.8",
})
hl.window_rule({
	name = "waydroid",
	match = { class = "^(Waydroid)$" },
	workspace = 5,
})
hl.window_rule({
	name = "Vial",
	match = { class = "^(Vial)$" },
	workspace = 7,
})

-- XWayland Setup
-- xwayland = {
--     force_zero_scaling = true
-- }
