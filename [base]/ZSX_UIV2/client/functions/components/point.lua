local L0_1, L1_1, L2_1
L0_1 = {}
Point = L0_1
L0_1 = Point
L1_1 = CreateRuntimeTxd
L2_1 = "zsx_ui_points_txd"
L1_1 = L1_1(L2_1)
L0_1.TXD = L1_1
L0_1 = Point
L0_1.Amount = 0
L0_1 = Point
L1_1 = {}
L0_1.List = L1_1
L0_1 = Point
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = type
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if "number" == L4_2 then
    L4_2 = DoesEntityExist
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L4_2 = debugPrint
      L5_2 = "[^1ERROR^7] Attempt to create a point for entity that does not exists!"
      return L4_2(L5_2)
    end
  end
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  L7_2 = type
  L8_2 = A1_2
  L7_2 = L7_2(L8_2)
  if "number" == L7_2 then
    L7_2 = DoesEntityExist
    L8_2 = A1_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = GetEntityCoords
      L8_2 = A1_2
      L7_2 = L7_2(L8_2)
      A1_2 = L7_2
      L8_2 = GetHintPosition
      L9_2 = L7_2
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      L6_2 = L10_2
      L5_2 = L9_2
      L5_2 = L8_2
  end
  else
    L7_2 = GetHintPosition
    L8_2 = A1_2
    L7_2, L8_2, L9_2 = L7_2(L8_2)
    L6_2 = L9_2
    L5_2 = L8_2
    L5_2 = L7_2
  end
  L7_2 = "point_"
  L8_2 = _Lib
  L8_2 = L8_2.GenerateRandomString
  L9_2 = 10
  L8_2 = L8_2(L9_2)
  L7_2 = L7_2 .. L8_2
  L8_2 = math
  L8_2 = L8_2.floor
  L9_2 = 2560.0
  L8_2 = L8_2(L9_2)
  L9_2 = math
  L9_2 = L9_2.floor
  L10_2 = 1440.0
  L9_2 = L9_2(L10_2)
  L10_2 = CreateDui
  L11_2 = "https://cfx-nui-"
  L12_2 = GetCurrentResourceName
  L12_2 = L12_2()
  L13_2 = "/sprites/point.html"
  L11_2 = L11_2 .. L12_2 .. L13_2
  L12_2 = L8_2
  L13_2 = L9_2
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = GetDuiHandle
  L12_2 = L10_2
  L11_2 = L11_2(L12_2)
  while true do
    L12_2 = IsDuiAvailable
    L13_2 = L10_2
    L12_2 = L12_2(L13_2)
    if L12_2 then
      break
    end
    L12_2 = Wait
    L13_2 = 100
    L12_2(L13_2)
  end
  L12_2 = Point
  L12_2 = L12_2.List
  L13_2 = {}
  L13_2.id = L7_2
  L13_2.icon = A0_2
  L13_2.coords = A1_2
  L13_2.duiObj = L10_2
  L13_2.duiHandle = L11_2
  L13_2.requiredDistance = 3.0
  L13_2.hintIsOn = L6_2
  L13_2.options = A3_2
  L13_2.isInitialized = false
  L13_2.isClose = false
  L14_2 = CreateRuntimeTextureFromDuiHandle
  L15_2 = Point
  L15_2 = L15_2.TXD
  L16_2 = L7_2
  L17_2 = L11_2
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L13_2.txn = L14_2
  L12_2[L7_2] = L13_2
  L12_2 = SendDuiMessage
  L13_2 = L10_2
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = {}
  L15_2.type = "SET_COLOR"
  L16_2 = Storage
  L16_2 = L16_2.GetHudColor
  L16_2 = L16_2()
  L15_2.color = L16_2
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = SendDuiMessage
  L13_2 = L10_2
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = {}
  L15_2.type = "SET_ICON"
  L15_2.icon = A0_2
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = SendDuiMessage
  L13_2 = L10_2
  L14_2 = json
  L14_2 = L14_2.encode
  L15_2 = {}
  L15_2.type = "SET_TEXT"
  L16_2 = A2_2 or L16_2
  if not A2_2 then
    L16_2 = false
  end
  L15_2.text = L16_2
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L12_2 = Point
  L13_2 = Point
  L13_2 = L13_2.Amount
  L13_2 = L13_2 + 1
  L12_2.Amount = L13_2
  return L7_2
end
L0_1.Create = L1_1
L0_1 = Point
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = pairs
  L2_2 = Point
  L2_2 = L2_2.List
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = SendDuiMessage
    L8_2 = L6_2.duiObj
    L9_2 = json
    L9_2 = L9_2.encode
    L10_2 = {}
    L10_2.type = "SET_COLOR"
    L10_2.color = A0_2
    L9_2, L10_2 = L9_2(L10_2)
    L7_2(L8_2, L9_2, L10_2)
  end
end
L0_1.UpdateColor = L1_1
L0_1 = Point
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Point
  L1_2 = L1_2.List
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^1ERROR^7] Can not find point with ID:"
    L3_2 = A0_2
    return L1_2(L2_2, L3_2)
  end
  L1_2 = debugPrint
  L2_2 = "[^2POINT^7] Succesfully removed Point with ID:"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = SendDuiMessage
  L2_2 = Point
  L2_2 = L2_2.List
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.duiObj
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = {}
  L4_2.type = "REMOVE_ANIM"
  L3_2, L4_2 = L3_2(L4_2)
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = Wait
  L2_2 = 1250
  L1_2(L2_2)
  L1_2 = DestroyDui
  L2_2 = Point
  L2_2 = L2_2.List
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.duiObj
  L1_2(L2_2)
  L1_2 = Point
  L1_2 = L1_2.List
  L1_2[A0_2] = nil
  L1_2 = Point
  L2_2 = Point
  L2_2 = L2_2.Amount
  L2_2 = L2_2 - 1
  L1_2.Amount = L2_2
end
L0_1.Remove = L1_1
L0_1 = Point
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = SendDuiMessage
  L3_2 = A0_2
  L4_2 = json
  L4_2 = L4_2.encode
  L5_2 = {}
  L5_2.type = "SET_VISIBILITY"
  L5_2.state = A1_2
  L4_2, L5_2 = L4_2(L5_2)
  L2_2(L3_2, L4_2, L5_2)
end
L0_1.SetAsHint = L1_1
L0_1 = Point
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = SendDuiMessage
  L4_2 = A0_2
  L5_2 = json
  L5_2 = L5_2.encode
  L6_2 = {}
  L6_2.type = "SET_DISTANCE"
  L7_2 = {}
  L7_2.int = A1_2
  L7_2.metric = A2_2
  L6_2.distance = L7_2
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L0_1.SetDistance = L1_1
L0_1 = Point
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = SendDuiMessage
  L3_2 = A0_2
  L4_2 = json
  L4_2 = L4_2.encode
  L5_2 = {}
  L5_2.type = "SET_AS_CLOSE"
  L5_2.state = A1_2
  L4_2, L5_2 = L4_2(L5_2)
  L2_2(L3_2, L4_2, L5_2)
end
L0_1.SetAsClose = L1_1
