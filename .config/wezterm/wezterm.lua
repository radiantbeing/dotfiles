local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("Sarasa Term K")
config.font_size = 16.0
config.normalize_output_to_unicode_nfc = true

config.keys = {
  {
    key = "}",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Next"),
  },
  {
    key = "{",
    mods = "CTRL|SHIFT",
    action = wezterm.action.ActivatePaneDirection("Prev"),
  },
  {
    key = "Enter",
    mods = "ALT",
    action = wezterm.action.DisableDefaultAssignment,
  },
}

return config

