require("modules.animations")
require("modules.appearance")
require("modules.input")
require("modules.keybinds")
require("modules.layouts")

------------------
---- MONITORS ----
------------------

-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
-- hl.monitor({ output = "DP-1", mode = "1920x1080@60", position = "0x0", scale = 1.57 })
-- hl.monitor({ output = "eDP-1", mode = "preferred", position = "1080x0", scale = 1.57 })
hl.monitor({
	output = "eDP-1",
	mode = "2256x1504@60",
	position = "0x0",
	scale = 1.57,
})

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
	-- hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- hl.exec_cmd("hyprpaper")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- hl.env("XDG_MENU_PREFIX", "arch-")

---------------
---- MISC ----
---------------

hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,

		enable_swallow = false,
		-- swallow_regex = "^(kitty)$",
	},
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
	name = "btop-float",
	match = { class = "^btop$" },

	float = true,
	size = "1200 600",
	center = true,
})

hl.window_rule({
	name = "kitty-opacity",
	match = { class = "^kitty$" },

	opacity = "0.9 0.8",
})

------------------
---- INCLUDES ----
------------------

-- Ensure noctalia-colors is either converted to a Lua file or required accordingly
-- require("noctalia/noctalia-colors")

-- For Noctalia Color templates
require("noctalia").apply_theme()
