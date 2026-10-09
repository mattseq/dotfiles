-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 6,

		border_size = 2,

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		allow_tearing = true,

		layout = "dwindle",
	},

	decoration = {
		rounding = 8,
		rounding_power = 3,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.7,

		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 0.3,
		},
	},

	animations = {
		enabled = true,
	},
})
