local vim = require("Spoons.vim")

local TARGET_APPLICATIONS = {
  "com.google.Chrome",
  "com.jetbrains.intellij",
  "com.microsoft.VSCode",
  "com.mitchellh.ghostty",
  "dev.zed.Zed",
  "md.obsidian",
}

hs.hotkey.bind({ "ctrl" }, "[", nil, function()
  vim.handleCtrlOpeningBracketRelease(TARGET_APPLICATIONS)
end)

hs.window.filter.new():subscribe(hs.window.filter.windowFocused, function()
  vim.handleWindowFocused(TARGET_APPLICATIONS)
end)
