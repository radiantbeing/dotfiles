local InputSource = {
  ENGLISH = "com.apple.keylayout.ABC",
  KOREAN = "com.apple.inputmethod.Korean.2SetKorean",
}

local function isFrontmostApplicationIn(targetApplications)
  local frontmostApplicationBundleId = hs.application.frontmostApplication():bundleID()
  for _, bundleId in ipairs(targetApplications) do
    if bundleId == frontmostApplicationBundleId then
      return true
    end
  end
  return false
end

local M = {}

function M.handleCtrlOpeningBracketRelease(targetApplications)
  if not isFrontmostApplicationIn(targetApplications) then
    return
  end
  hs.keycodes.currentSourceID(InputSource.ENGLISH)
  hs.eventtap.keyStroke({}, "escape")
end

function M.handleWindowFocused(targetApplications)
  if not isFrontmostApplicationIn(targetApplications) then
    return
  end
  hs.keycodes.currentSourceID(InputSource.ENGLISH)
end

return M
