print("Active keymap:")
for k, v in pairs(hs.keycodes.map) do
    print(string.format("Name: %-12s Code: %s", k, v))
end

local ignoreNext = false

local remapTap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
  if ignoreNext then
    ignoreNext = false
    return false
  end

  local keyCode = event:getKeyCode()
  local flags = event:getFlags()
  local kn = hs.keycodes.map[keyCode] or "unknown"

   print("Key code:", keyCode, "Key name:", kn)

  -- Remap Shift+2 → "
  if flags.shift and keyCode == 19 then
    ignoreNext = true
    hs.eventtap.keyStroke({"shift"}, "'", 0.01)
    return true
  end

  -- Remap apostrophe (39) → @
  if flags.shift and keyCode == 39 then
    ignoreNext = true
    hs.eventtap.keyStroke({"shift"}, "2", 0.01)
    return true
  end

  -- Remap backslash key (\) to Option+Shift+7
  if keyCode == 10 then
    ignoreNext = true
    hs.eventtap.keyStroke({}, "`", 0.01)
    return true
  end

  -- Remap hash #
  if flags.shift and keyCode == 42 then
    ignoreNext = true
    hs.eventtap.keyStroke({"shift"}, "`", 0.01)
    return true
  end

  -- Remap hash #
  if keyCode == 42 then
    ignoreNext = true
    hs.eventtap.keyStroke({"alt"}, "3", 0.01)
    return true
  end

  -- Remap pipe |
  if flags.shift and keyCode == 50 then
    ignoreNext = true
    hs.eventtap.keyStroke({"shift"}, "\\", 0.01)
    return true
  end

  -- Remap slash \ 
  if keyCode == 50 then
    ignoreNext = true
    hs.eventtap.keyStroke({}, "\\", 0.01)
    return true
  end

  -- Remap Cut 
  if flags.ctrl and keyCode == 7 then
    ignoreNext = true
    hs.eventtap.keyStroke({"cmd"}, "x", 0.01)
    return true
  end

  -- Remap Save 
  if flags.ctrl and keyCode == 1 then
    ignoreNext = true
    hs.eventtap.keyStroke({"cmd"}, "s", 0.01)
    return true
  end

  -- Remap Paste 
  if flags.ctrl and keyCode == 9 then
    ignoreNext = true
    hs.eventtap.keyStroke({"cmd"}, "v", 0.01)
    return true
  end

  -- Remap Copy 
  if flags.ctrl and keyCode == 8 then
    ignoreNext = true
    hs.eventtap.keyStroke({"cmd"}, "c", 0.01)
    return true
  end

  -- Remap All 
  if flags.ctrl and keyCode == 0 then
    ignoreNext = true
    hs.eventtap.keyStroke({"cmd"}, "a", 0.01)
    return true
  end

  -- Remap Find 
  if flags.ctrl and keyCode == 3 then
    ignoreNext = true
    hs.eventtap.keyStroke({"cmd"}, "f", 0.01)
    return true
  end

  -- Remap Alt Tab
  if flags.alt and keyCode == 48 then
    ignoreNext = true
    hs.eventtap.keyStroke({"cmd"}, "tab", 0.01)
    return true
  end

  return false
end)

remapTap:start()
