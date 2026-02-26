local ENABLED_APPS = {
  ["com.mitchellh.ghostty"] = true,
  ["com.jetbrains.intellij"] = true,
  ["com.microsoft.VSCode"] = true,
}

local INPUT_ENGLISH = "com.apple.keylayout.ABC"

local ctrlBracketHotkey
local appFocusWatcher

local function getFrontmostBundleId()
  local app = hs.application.frontmostApplication()
  return app and app:bundleID() or nil
end

local function shouldEnableForFrontApp()
  local bundleId = getFrontmostBundleId()
  return bundleId and ENABLED_APPS[bundleId] == true
end

local function switchToEnglishIfNeeded()
  if hs.keycodes.currentSourceID() ~= INPUT_ENGLISH then
    hs.keycodes.currentSourceID(INPUT_ENGLISH)
  end
end

local function handleCtrlBracketReleased()
  switchToEnglishIfNeeded()
  hs.eventtap.keyStroke({}, "escape")
end

local function updateStateOnFocus()
  if shouldEnableForFrontApp() then
    ctrlBracketHotkey:enable()
    switchToEnglishIfNeeded()
  else
    ctrlBracketHotkey:disable()
  end
end

ctrlBracketHotkey = hs.hotkey.new({ "ctrl" }, "[", nil, handleCtrlBracketReleased)

appFocusWatcher = hs.window.filter.new()
appFocusWatcher:subscribe(hs.window.filter.windowFocused, updateStateOnFocus)

updateStateOnFocus()
