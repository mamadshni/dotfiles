hs = hs

-- Simple example: Reload Hammerspoon config with Cmd+Shift+R
hs.hotkey.bind({ "cmd", "shift" }, "R", function()
	hs.reload()
end)

-- Window layout definitions
local layouts = {
	left = hs.layout.left50,
	right = hs.layout.right50,
	maximize = hs.layout.maximized,
	top = hs.layout.top50,
	bottom = hs.layout.bottom50,
}

-- Function to move current window to a position
local function moveTo(position)
	local win = hs.window.focusedWindow()
	if win then
		hs.layout.apply({ { nil, win, nil, position } })
	end
end

-- Keyboard shortcuts for window positioning
hs.hotkey.bind({ "cmd", "alt" }, "Left", function()
	moveTo(layouts.left)
end)
hs.hotkey.bind({ "cmd", "alt" }, "Right", function()
	moveTo(layouts.right)
end)
hs.hotkey.bind({ "cmd", "alt" }, "Up", function()
	moveTo(layouts.maximize)
end)
hs.hotkey.bind({ "cmd", "alt" }, "Down", function()
	moveTo(layouts.bottom)
end)
hs.hotkey.bind({ "cmd", "alt" }, "M", function()
	moveTo(layouts.maximize)
end)
