local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L2_2 = A0_2
  L1_2 = A0_2.match
  L3_2 = "^[A-Za-z_][A-Za-z0-9_]*$"
  return L1_2(L2_2, L3_2)
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = string
  L1_2 = L1_2.format
  L2_2 = "%q"
  L3_2 = A0_2
  return L1_2(L2_2, L3_2)
end
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L4_2 = table_to_string
    L5_2 = A0_2
    L6_2 = A1_2
    L7_2 = A2_2
    return L4_2(L5_2, L6_2, L7_2)
  elseif "string" == L3_2 then
    L4_2 = L1_1
    L5_2 = A0_2
    return L4_2(L5_2)
  else
    L4_2 = tostring
    L5_2 = A0_2
    return L4_2(L5_2)
  end
end
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  if not A1_2 then
    A1_2 = 0
  end
  L3_2 = string
  L3_2 = L3_2.rep
  L4_2 = "    "
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L3_2
  L5_2 = "    "
  L4_2 = L4_2 .. L5_2
  L5_2 = {}
  L6_2 = "{"
  L5_2[1] = L6_2
  L6_2 = {}
  L7_2 = {}
  if A2_2 then
    L8_2 = ipairs
    L9_2 = A2_2
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = A0_2[L13_2]
      if nil ~= L14_2 then
        L14_2 = table
        L14_2 = L14_2.insert
        L15_2 = L6_2
        L16_2 = L13_2
        L14_2(L15_2, L16_2)
        L7_2[L13_2] = true
      end
    end
  end
  L8_2 = pairs
  L9_2 = A0_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2 in L8_2, L9_2, L10_2, L11_2 do
    L13_2 = L7_2[L12_2]
    if not L13_2 then
      L13_2 = table
      L13_2 = L13_2.insert
      L14_2 = L6_2
      L15_2 = L12_2
      L13_2(L14_2, L15_2)
    end
  end
  L8_2 = table
  L8_2 = L8_2.sort
  L9_2 = L6_2
  function L10_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = tostring
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L3_3 = tostring
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L2_3 = L2_3 < L3_3
    return L2_3
  end
  L8_2(L9_2, L10_2)
  L8_2 = ipairs
  L9_2 = L6_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = A0_2[L13_2]
    L15_2 = type
    L16_2 = L13_2
    L15_2 = L15_2(L16_2)
    if "string" == L15_2 then
      L15_2 = L0_1
      L16_2 = L13_2
      L15_2 = L15_2(L16_2)
      if L15_2 and L13_2 then
        goto lbl_87
        L15_2 = L13_2 or L15_2
      end
      L15_2 = "['"
      L16_2 = L13_2
      L17_2 = "']"
      L15_2 = L15_2 .. L16_2 .. L17_2
      if L15_2 then
        goto lbl_87
      end
    end
    L15_2 = "["
    L16_2 = tostring
    L17_2 = L13_2
    L16_2 = L16_2(L17_2)
    L17_2 = "]"
    L15_2 = L15_2 .. L16_2 .. L17_2
    ::lbl_87::
    L16_2 = table
    L16_2 = L16_2.insert
    L17_2 = L5_2
    L18_2 = L4_2
    L19_2 = L15_2
    L20_2 = " = "
    L21_2 = L2_1
    L22_2 = L14_2
    L23_2 = A1_2 + 1
    L24_2 = A2_2
    L21_2 = L21_2(L22_2, L23_2, L24_2)
    L22_2 = ","
    L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
    L16_2(L17_2, L18_2)
  end
  L8_2 = table
  L8_2 = L8_2.insert
  L9_2 = L5_2
  L10_2 = L3_2
  L11_2 = "}"
  L10_2 = L10_2 .. L11_2
  L8_2(L9_2, L10_2)
  L8_2 = table
  L8_2 = L8_2.concat
  L9_2 = L5_2
  L10_2 = "\n"
  return L8_2(L9_2, L10_2)
end
table_to_string = L3_1
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = table_to_string
  L4_2 = A0_2
  L5_2 = 0
  L6_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if A1_2 then
    L4_2 = A1_2
    L5_2 = " = "
    L6_2 = L3_2
    L4_2 = L4_2 .. L5_2 .. L6_2
    if L4_2 then
      goto lbl_15
    end
  end
  L4_2 = L3_2
  ::lbl_15::
  return L4_2
end
serialize = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L1_2
    L10_2 = L6_2
    L8_2(L9_2, L10_2)
  end
  return L1_2
end
L4_1 = RegisterCommand
L5_1 = "get_config_preset"
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = A1_2[1]
  L4_2 = Storage
  L4_2 = L4_2.Data
  L4_2 = L4_2[L3_2]
  if not L4_2 then
    L4_2 = debugPrint
    L5_2 = "[^2PRESET_GEN^7] Error. Could not find any interface named ^1"
    L6_2 = L3_2
    L7_2 = "^7"
    L5_2 = L5_2 .. L6_2 .. L7_2
    return L4_2(L5_2)
  end
  L4_2 = {}
  L5_2 = Storage
  L5_2 = L5_2.Data
  L5_2 = L5_2[L3_2]
  L5_2 = L5_2.selected
  L4_2.selected = L5_2
  L5_2 = Storage
  L5_2 = L5_2.Data
  L5_2 = L5_2[L3_2]
  L5_2 = L5_2.options
  L4_2.options = L5_2
  L5_2 = Storage
  L5_2 = L5_2.Data
  L5_2 = L5_2[L3_2]
  L5_2 = L5_2.refreshInterval
  if L5_2 then
    L5_2 = Storage
    L5_2 = L5_2.Data
    L5_2 = L5_2[L3_2]
    L5_2 = L5_2.refreshInterval
    L4_2.refreshInterval = L5_2
  end
  L5_2 = Storage
  L5_2 = L5_2.Data
  L5_2 = L5_2[L3_2]
  L5_2 = L5_2.position
  if L5_2 then
    L5_2 = {}
    L6_2 = GetActualScreenResolution
    L6_2, L7_2 = L6_2()
    if "hud" == L3_2 then
      L8_2 = Storage
      L8_2 = L8_2.Data
      L8_2 = L8_2[L3_2]
      L8_2 = L8_2.position
      L8_2 = L8_2.minimap_on
      L9_2 = Storage
      L9_2 = L9_2.Data
      L9_2 = L9_2[L3_2]
      L9_2 = L9_2.position
      L9_2 = L9_2.minimap_off
      L10_2 = {}
      L11_2 = Math
      L11_2 = L11_2.Pixels_to_viewport
      L12_2 = L8_2
      L13_2 = L6_2
      L14_2 = L7_2
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L10_2.minimap_on = L11_2
      L11_2 = Math
      L11_2 = L11_2.Pixels_to_viewport
      L12_2 = L9_2
      L13_2 = L6_2
      L14_2 = L7_2
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L10_2.minimap_off = L11_2
      L5_2 = L10_2
    else
      L8_2 = Math
      L8_2 = L8_2.Pixels_to_viewport
      L9_2 = Storage
      L9_2 = L9_2.Data
      L9_2 = L9_2[L3_2]
      L9_2 = L9_2.position
      L10_2 = L6_2
      L11_2 = L7_2
      L8_2 = L8_2(L9_2, L10_2, L11_2)
      L5_2 = L8_2
    end
    L4_2.position = L5_2
  end
  L5_2 = L3_1
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = serialize
  L7_2 = L4_2
  L8_2 = "Config.UI.Preset['"
  L9_2 = L3_2
  L10_2 = "']"
  L8_2 = L8_2 .. L9_2 .. L10_2
  L9_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = print
  L8_2 = [[




]]
  L7_2(L8_2)
  L7_2 = debugPrint
  L8_2 = "[^2PRESET_GEN^7] Copy the content and replace it in /shared/config_ui.lua for ^2Config.UI.Preset[\""
  L9_2 = L3_2
  L10_2 = "\"]"
  L8_2 = L8_2 .. L9_2 .. L10_2
  L7_2(L8_2)
  L7_2 = print
  L8_2 = [[


]]
  L7_2(L8_2)
  L7_2 = print
  L8_2 = L6_2
  L7_2(L8_2)
end
L4_1(L5_1, L6_1)
