local ENGLISH_INPUT_SOURCE = "com.apple.keylayout.ABC"

local function isFrontmostAppIn(bundleIds)
  local frontmost = hs.application.frontmostApplication():bundleID()
  for _, bundleId in ipairs(bundleIds) do
    if bundleId == frontmost then
      return true
    end
  end
  return false
end

local function switchToEnglish()
  hs.keycodes.currentSourceID(ENGLISH_INPUT_SOURCE)
end

local windowFilter

local M = {}

function M.enableFor(bundleIds)
  hs.hotkey.bind({ "ctrl" }, "[", nil, function()
    if isFrontmostAppIn(bundleIds) then
      switchToEnglish()
      hs.eventtap.keyStroke({}, "escape")
    end
  end)

  windowFilter = hs.window.filter.new()
  windowFilter:subscribe(hs.window.filter.windowFocused, function()
    if isFrontmostAppIn(bundleIds) then
      switchToEnglish()
    end
  end)
end

return M
