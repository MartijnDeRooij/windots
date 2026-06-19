-- This is the configuration for wezterm. A terminal emulator with LUA customization.
-- One of the mayor reasons to use in tandem with TMUX/NVIM
-- https://wezfurlong.org/wezterm/
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration
local config = {}

-- This will hold the configuration.
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- Window appearance settings.
-- Remove the standard title bar while still allowing the window to be resized.
config.window_decorations = "NONE | RESIZE"
config.window_background_opacity = 0.9

-- config.window_padding = {
-- 	left = 0,
-- 	right = 0,
-- 	top = 0,
-- 	bottom = 0,
-- }

-- Theme and cursor colors.
-- Use the built-in Tokyo Night palette.
config.color_scheme = "tokyonight_night"
-- config.color_scheme = "Cloud (terminal.sexy)"
config.colors = {
    	cursor_border = "#bea3c7",
        cursor_bg = "#bea3c7",
}
-- config.default_domain = 'WSL:Ubuntu'

-- Font configuration.
-- Set the text size in points.
config.font_size = 10
-- Use the Nerd Font variant so icon glyphs render correctly.
config.font = wezterm.font('JetBrains Mono Nerd Font')

-- Rendering and animation behavior.
-- Use the OpenGL renderer for GPU-accelerated drawing.
config.front_end = "OpenGL"
-- Cap rendering at 144 frames per second.
config.max_fps = 144
-- Use a block cursor that blinks.
config.default_cursor_style = "BlinkingBlock"
-- Keep cursor-related animations effectively minimal.
config.animation_fps = 1
-- Blink the cursor every 500 ms.
config.cursor_blink_rate = 500 

-- Use a simple tab bar style.
config.use_fancy_tab_bar = false
-- Hide the tab bar when only one tab is open.
config.hide_tab_bar_if_only_one_tab = true

-- Keyboard shortcuts.
config.keys = {
  -- Paste from the system clipboard.
  { key = 'V', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
  -- Copy the current selection to the system clipboard.
  { key = 'C', mods = 'CTRL', action = wezterm.action.CopyTo 'Clipboard' },
  -- Scroll up one line in the scrollback buffer.
  { key = 'UpArrow', mods = 'SHIFT', action = wezterm.action.ScrollByLine(-1) },
  -- Scroll down one line in the scrollback buffer.
  { key = 'DownArrow', mods = 'SHIFT', action = wezterm.action.ScrollByLine(1) },
  -- Scroll up one page in the scrollback buffer.
  { key = 'PageUp', mods = 'SHIFT', action = wezterm.action.ScrollByPage(-1) },
  -- Scroll down one page in the scrollback buffer.
  { key = 'PageDown', mods = 'SHIFT', action = wezterm.action.ScrollByPage(1) },
}

-- Finally, return the configuration to wezterm:
return config  