-- Load and install the Hyper key extension. Binding to F18
-- local hyper = require('hyper')
local am = require("app-management")
local wm = require("window-management")

-- global application keyboard shortcuts
-- hyper.install({ "alt", "cmd", "shift", "ctrl" }) -- quick reloading of hammerspoon
-- hyper.bindkey('r', hs.reload) -- global application keyboard shortcuts
-- hyper.bindkey('p', function() am.switchtoandfromapp("com.spotify.client") end)
-- hyper.bindshiftkey('p', function() hs.spotify.displaycurrenttrack() end)
-- hyper.bindkey('[', function() am.switchtoandfromapp("com.apple.activitymonitor") end)
-- hyper.bindkey(']', function() am.switchtoandfromapp("com.googlecode.iterm2") end)
-- hyper.bindkey('`', function() am.switchtoandfromapp("com.apple.finder") end)
-- hyper.bindkey('1', function() am.switchtoandfromapp("com.google.chrome") end)
-- hyper.bindkey('2', function() am.switchtoandfromapp("org.mozilla.firefox") end)
-- hyper.bindkey('3', function() am.switchtoandfromapp("com.microsoft.vscode") end)
--
-- -- window management
-- hyper.bindkey("up", function() wm.windowmaximize(0) end)
-- hyper.bindkey("right", function() wm.movewindowtoposition(wm.screenpositions.right) end)
-- hyper.bindshiftkey("right", function() wm.movewindowtoposition(wm.screenpositions.rightcode) end)
-- hyper.bindkey("down", function() hs.window.focusedwindow():moveonescreeneast() end)
-- hyper.bindshiftkey("down", function() hs.window.focusedwindow():moveonescreenwest() end)
-- hyper.bindkey("left", function() wm.movewindowtoposition(wm.screenpositions.left) en1111d)
--
--
-- local function pressfn(mods, key)
--     if key == nil then
--         key = mods
--         mods = {}
--     end
--
--     return function() hs.eventtap.keystroke(mods, key, 1000) end
-- end
--
-- local function remap(mods, key, pressfn)
--     hs.hotkey.bind(mods, key, pressfn, nil, pressfn)
-- end
--
-- remap({ 'ctrl' }, ',', pressfn('pageup'))
-- remap({ 'ctrl' }, '.', pressfn('pagedown'))

local hyper = { "alt", "cmd", "shift", "ctrl" }
-- hs.hotkey.bind(hyper, 'p', function() am.switchtoandfromapp("com.spotify.client") end)
hs.hotkey.bind(hyper, "p", function()
	hs.spotify.play()
end)
-- hs.hotkey.bind(hyper, 'pp', function() hs.spotify.pause() end)
hs.hotkey.bind(hyper, "r", hs.reload)
-- hs.hotkey.bind(hyper, 't', function() am.switchToAndFromApp("com.googlecode.iterm2") end)
hs.hotkey.bind(hyper, "t", function()
	am.switchToAndFromApp("org.alacritty")
end)
hs.hotkey.bind(hyper, "m", function()
	am.switchToAndFromApp("org.mozilla.nightly")
end)
hs.hotkey.bind(hyper, "f", function()
	am.switchToAndFromApp("com.apple.finder")
end)
hs.hotkey.bind(hyper, "c", function()
	am.switchToAndFromApp("com.google.chrome")
end)
hs.hotkey.bind(hyper, "a", function()
	am.switchToAndFromApp("com.apple.activitymonitor")
end)
hs.hotkey.bind(hyper, "v", function()
	am.switchToAndFromApp("com.microsoft.vscode")
end)
hs.hotkey.bind(hyper, "w", function()
	am.switchToAndFromApp("net.whatsapp.WhatsApp")
end)
hs.hotkey.bind(hyper, "s", function()
	am.switchToAndFromApp("org.whispersystems.signal-desktop")
end)

-- window management
hs.hotkey.bind(hyper, "k", function()
	wm.windowMaximize(0)
end)
hs.hotkey.bind(hyper, "l", function()
	wm.moveWindowToPosition(wm.screenPositions.right)
end)
-- hs.hotkey.bind(hyper, 'j', function() wm.windowMinimize(0) end)
-- hs.hotkey.bind(hyper, 'j', function() hs.window.focusedWindow():moveonescreeneast() end)
hs.hotkey.bind(hyper, "h", function()
	wm.moveWindowToPosition(wm.screenPositions.left)
end)

-- space management
-- hs.hotkey.bind(hyper, '1', function()
--     local cur_screen = hs.screen.mainScreen()
--     local cur_screen_id = cur_screen:getUUID()
--     local all_spaces = hs.spaces.allSpaces()
--     local spacesID = all_spaces[cur_screen_id][2]
--     hs.spaces.gotoSpace(spacesID)
-- end)
-- hs.hotkey.bind(hyper, '2', function() hs.spaces.gotoSpace(2) end)
