local wezterm = require("wezterm")

-- Fonts
local font = wezterm.font_with_fallback({
  "Comic Code Ligatures",
  "Symbols Nerd Font",
})

return {
  color_scheme = "Catppuccin",
  default_prog = { '/usr/bin/zsh', '-l' },
  font = font,
  font_size = 16,
  hide_tab_bar_if_only_one_tab = true,
}
