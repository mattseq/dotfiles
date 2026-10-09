local terminal = "kitty"
local browser = "firefox"
local filemanager = "dolphin"
local code = "code"
local monitor_app = "kitty --class btop -e btop"
local ipc = "noctalia msg"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- App keybinds
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd(browser .. " --private-window"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(filemanager))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(code))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(monitor_app))
hl.bind(mainMod .. " + X", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.close({ force = true }))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 0 }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- VIM focus keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- VIM move keys
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Workspaces 1-9
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Noctalia Shell keybinds
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mainMod .. " + grave", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"))
hl.bind(mainMod .. " + delete", hl.dsp.exec_cmd(ipc .. " panel-toggle session"))
hl.bind(mainMod .. " + SHIFT + delete", hl.dsp.exec_cmd("shutdown now"))
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd(ipc .. " session lock"))
hl.bind(mainMod .. " + SHIFT + escape", hl.dsp.exec_cmd(ipc .. " session suspend"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center system"))

-- Media & Audio keybinds
hl.bind("XF86AudioMedia", hl.dsp.exec_cmd(ipc .. " settings-open"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. " media toggle"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. " media next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(ipc .. " media previous"))
-- hl.bind(mainMod .. " + XF86AudioPlay", hl.dsp.exec_cmd(ipc .. " media toggle"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume-mute"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down"), { locked = true, repeating = true })

-- Cheatsheet & Grimblast Screenshot
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(ipc .. " panel-toggle kenn/keybind-cheatsheet:cheatsheet"))
hl.bind("Print", hl.dsp.exec_cmd(ipc .. " screenshot-region"))
-- hl.bind(
-- 	"Print",
-- 	hl.dsp.exec_cmd("grimblast --freeze --notify copysave area ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png")
-- )

-- layout switcher
hl.bind("SUPER + P", function()
	local layouts = { "scrolling", "dwindle", "master" }
	local workspace = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

	local next_layout = "dwindle"

	if not workspace then
		return
	end

	for i = 1, #layouts do
		if layouts[i] == workspace.tiled_layout then
			local next_layout_idx = (i % #layouts) + 1
			next_layout = layouts[next_layout_idx]
			break
		end
	end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
end)

-- Toggle layout scripts
-- hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-layout.sh dwindle"))
-- hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-layout.sh master"))
-- hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-layout.sh scrolling"))

-- Drag and resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
