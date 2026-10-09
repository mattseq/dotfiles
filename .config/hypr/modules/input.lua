---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",

		follow_mouse = 1,

		sensitivity = 0,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
	fingers = 2,
	direction = "pinchIn",
	action = "cursorZoom",
	scale = 2,
})

hl.gesture({
	fingers = 2,
	direction = "pinchOut",
	action = "cursorZoom",
	scale = 1,
})
