local vim = require("Spoons.vim")

local TARGET_APPLICATIONS = {
  "com.google.Chrome",
  "net.kovidgoyal.kitty",
  "org.mozilla.firefox",
}

hs.hotkey.bind({ "ctrl" }, "[", nil, function()
  vim.handleCtrlOpeningBracketRelease(TARGET_APPLICATIONS)
end)

hs.window.filter.new():subscribe(hs.window.filter.windowFocused, function()
  vim.handleWindowFocused(TARGET_APPLICATIONS)
end)
