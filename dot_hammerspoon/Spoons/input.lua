local InputSource = {
  ENGLISH = "com.apple.keylayout.ABC",
  KOREAN = "com.apple.inputmethod.Korean.2SetKorean",
}

local M = {}

function M.toggleInputSource()
  local source = hs.keycodes.currentSourceID()
  if source == InputSource.ENGLISH then
    hs.keycodes.currentSourceID(InputSource.KOREAN)
  elseif source == InputSource.KOREAN then
    hs.keycodes.currentSourceID(InputSource.ENGLISH)
  end
end

return M
