-- WezTerm config, ported from kitty.conf
-- Works on both macOS and Windows.

local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

local is_mac = wezterm.target_triple:find 'darwin' ~= nil

-- cmd on macOS has no Windows equivalent, so each modifier group gets remapped.
--   mod  -> kitty's cmd+…        (tabs, copy/paste, splits, font size)
--   mod2 -> kitty's cmd+shift+…  (tab cycling, vsplit, zoom, close pane)
--   nav  -> kitty's cmd+alt+…    (directional pane navigation)
local mod = is_mac and 'SUPER' or 'CTRL|SHIFT'
local mod2 = is_mac and 'SUPER|SHIFT' or 'CTRL|ALT'
local nav = is_mac and 'SUPER|ALT' or 'CTRL|ALT'

--: Fonts {{{

-- Per-user fonts on Windows aren't reliably enumerated by DirectWrite; scan the dir directly.
if not is_mac then
  local home = os.getenv('USERPROFILE') or ''
  config.font_dirs = { home .. '/AppData/Local/Microsoft/Windows/Fonts' }
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
end

config.font = wezterm.font_with_fallback {
  { family = 'JetBrains Mono', weight = 'Regular' },
  'JetBrainsMono Nerd Font',
  'Symbols Nerd Font Mono',
}

-- Cursive italics from Victor Mono. WezTerm warns at startup if it isn't
-- installed (the fallback keeps text readable but does not silence the warning).
-- macOS:   brew install --cask font-victor-mono-nerd-font
-- Windows: grab VictorMono from https://www.nerdfonts.com/font-downloads
config.font_rules = {
  {
    italic = true,
    intensity = 'Normal',
    font = wezterm.font_with_fallback {
      { family = 'VictorMono Nerd Font Mono', weight = 'Medium', italic = true },
      { family = 'JetBrainsMono Nerd Font', italic = true },
    },
  },
  {
    italic = true,
    intensity = 'Bold',
    font = wezterm.font_with_fallback {
      { family = 'VictorMono Nerd Font Mono', weight = 'Bold', italic = true },
      { family = 'JetBrainsMono Nerd Font', weight = 'Bold', italic = true },
    },
  },
}

config.font_size = is_mac and 16.0 or 13.5

--: }}}

--: Appearance {{{

-- Kanagawa "wave" — the exact palette kanagawa.nvim emits with terminalColors,
-- so the terminal and neovim agree. Matches theme = "wave" in
-- nvim/.config/nvim/after/plugin/colorscheme.lua.
local kanagawa = {
  bg = '#1F1F28', -- sumiInk3
  fg = '#DCD7BA', -- fujiWhite
  cursor = '#C8C093', -- oldWhite
  sel_bg = '#2D4F67', -- waveBlue2
  sel_fg = '#C8C093',
  ansi = {
    '#090618', -- sumiInk0    black
    '#C34043', -- autumnRed   red
    '#76946A', -- autumnGreen green
    '#C0A36E', -- boatYellow2 yellow
    '#7E9CD8', -- crystalBlue blue
    '#957FB8', -- oniViolet   magenta
    '#6A9589', -- waveAqua1   cyan
    '#C8C093', -- oldWhite    white
  },
  brights = {
    '#727169', -- fujiGray
    '#E82424', -- samuraiRed
    '#98BB6C', -- springGreen
    '#E6C384', -- carpYellow
    '#7FB4CA', -- springBlue
    '#938AA9', -- springViolet1
    '#7AA89F', -- waveAqua2
    '#DCD7BA', -- fujiWhite
  },
}

config.colors = {
  foreground = kanagawa.fg,
  background = kanagawa.bg,
  cursor_bg = kanagawa.cursor,
  cursor_fg = kanagawa.bg,
  cursor_border = kanagawa.cursor,
  selection_bg = kanagawa.sel_bg,
  selection_fg = kanagawa.sel_fg,
  ansi = kanagawa.ansi,
  brights = kanagawa.brights,
  split = '#00ff00', -- kitty active_border_color
  tab_bar = {
    background = kanagawa.bg,
    new_tab = { bg_color = kanagawa.ansi[1], fg_color = kanagawa.brights[1] },
    new_tab_hover = { bg_color = kanagawa.brights[1], fg_color = kanagawa.fg },
  },
}

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- kitty hide_window_decorations titlebar-only, with the window buttons moved
-- into the tab bar rather than dropped.
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.integrated_title_button_style = is_mac and 'MacOsNative' or 'Windows'
config.integrated_title_buttons = { 'Hide', 'Maximize', 'Close' }
config.window_background_opacity = 1.0
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.4 } -- inactive_text_alpha 0.4
config.window_close_confirmation = 'NeverPrompt'

-- No cursor_trail equivalent in WezTerm; an eased blink is the nearest thing.
-- The actual trail comes from smear-cursor.nvim.
config.animation_fps = 60
config.max_fps = 120
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'EaseOut'
config.cursor_blink_ease_out = 'EaseOut'
config.default_cursor_style = 'BlinkingBlock'
config.visual_bell = {
  fade_in_duration_ms = 75,
  fade_out_duration_ms = 75,
  target = 'CursorColor',
}

if is_mac then
  config.send_composed_key_when_left_alt_is_pressed = false -- macos_option_as_alt yes
end

--: }}}

--: Tab bar (powerline-ish, mirroring kitty's tab_bar_style powerline) {{{

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 32

local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

wezterm.on('format-tab-title', function(tab, tabs, _, _, hover, max_width)
  local bar_bg = kanagawa.bg
  local bg = tab.is_active and kanagawa.ansi[5] or kanagawa.ansi[1]
  local fg = tab.is_active and kanagawa.bg or kanagawa.fg

  if hover and not tab.is_active then
    bg = kanagawa.brights[1]
  end

  local title = tab.tab_title
  if not title or #title == 0 then
    title = tab.active_pane.title
  end
  title = wezterm.truncate_right(title, max_width - 4)

  -- The arrow bleeds into whatever follows: the next tab, or the empty bar.
  local next_bg = bar_bg
  for i, t in ipairs(tabs) do
    if t.tab_id == tab.tab_id and tabs[i + 1] then
      next_bg = tabs[i + 1].is_active and kanagawa.ansi[5] or kanagawa.ansi[1]
    end
  end

  return {
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. (tab.tab_index + 1) .. ': ' .. title .. ' ' },
    { Background = { Color = next_bg } },
    { Foreground = { Color = bg } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

--: }}}

--: Keys {{{

config.disable_default_key_bindings = true -- kitty clear_all_shortcuts

config.keys = {
  -- Word-wise motion, and delete-line (kitty send_text bindings)
  { key = 'LeftArrow', mods = 'ALT', action = act.SendString '\x1bb' },
  { key = 'RightArrow', mods = 'ALT', action = act.SendString '\x1bf' },
  { key = 'Backspace', mods = mod, action = act.SendString '\x15' },

  -- Clipboard
  { key = 'c', mods = mod, action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = mod, action = act.PasteFrom 'Clipboard' },

  -- Tabs
  { key = 't', mods = mod, action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = mod, action = act.CloseCurrentTab { confirm = false } },
  { key = '1', mods = mod, action = act.ActivateTab(0) },
  { key = '2', mods = mod, action = act.ActivateTab(1) },
  { key = '3', mods = mod, action = act.ActivateTab(2) },
  { key = '4', mods = mod, action = act.ActivateTab(3) },
  { key = '5', mods = mod, action = act.ActivateTab(4) },
  { key = ']', mods = mod2, action = act.ActivateTabRelative(1) },
  { key = '[', mods = mod2, action = act.ActivateTabRelative(-1) },

  -- Splits. SplitVertical puts the new pane BELOW; SplitHorizontal to the RIGHT.
  { key = 'd', mods = mod, action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = mod2, action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'w', mods = mod2, action = act.CloseCurrentPane { confirm = false } },

  -- Pane navigation
  { key = 'LeftArrow', mods = nav, action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = nav, action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = nav, action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = nav, action = act.ActivatePaneDirection 'Down' },
  { key = '[', mods = mod, action = act.ActivatePaneDirection 'Prev' },
  { key = ']', mods = mod, action = act.ActivatePaneDirection 'Next' },

  -- Zoom (kitty's stack layout) + resize
  { key = 'Enter', mods = mod2, action = act.TogglePaneZoomState },
  { key = '6', mods = 'ALT', action = act.TogglePaneZoomState },
  { key = 'LeftArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Left', 2 } },
  { key = 'RightArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Right', 2 } },
  { key = 'UpArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Up', 2 } },
  { key = 'DownArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Down', 2 } },

  -- Window
  { key = 'f', mods = is_mac and 'SUPER|CTRL' or 'CTRL|SHIFT', action = act.ToggleFullScreen },
  { key = 'F11', action = act.ToggleFullScreen },

  -- Scrollback
  { key = 'PageUp', action = act.ScrollByPage(-1) },
  { key = 'PageDown', action = act.ScrollByPage(1) },
  { key = 'k', mods = mod, action = act.ClearScrollback 'ScrollbackAndViewport' },

  -- Font size
  { key = '+', mods = mod, action = act.IncreaseFontSize },
  { key = '=', mods = mod, action = act.IncreaseFontSize },
  { key = '-', mods = mod, action = act.DecreaseFontSize },
  { key = '0', mods = mod, action = act.ResetFontSize },

  -- Config
  { key = ',', mods = mod, action = act.ReloadConfiguration },
}

--: }}}

return config
