local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
Interaction = L0_1
L0_1 = Interaction
L1_1 = CreateRuntimeTxd
L2_1 = "zsx_ui_interaction_txd"
L1_1 = L1_1(L2_1)
L0_1.TXD = L1_1
L0_1 = Interaction
L0_1.Amount = 0
L0_1 = Interaction
L1_1 = {}
L0_1.List = L1_1
L0_1 = Interaction
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 then
    L1_2 = A0_2.options
    if L1_2 then
      goto lbl_10
    end
  end
  L1_2 = debugPrint
  L2_2 = "Could not create interaction. No options or data has been parsed."
  do return L1_2(L2_2) end
  ::lbl_10::
  L1_2 = A0_2.coords
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "Could not create interaction. No coords has been set."
    return L1_2(L2_2)
  end
  L1_2 = type
  L2_2 = A0_2.coords
  L1_2 = L1_2(L2_2)
  if "number" == L1_2 then
    L1_2 = DoesEntityExist
    L2_2 = coords
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = debugPrint
      L2_2 = "[^1ERROR^7] Attempt to create a point for entity that does not exists!"
      return L1_2(L2_2)
    end
  end
  L1_2 = "interaction_"
  L2_2 = _Lib
  L2_2 = L2_2.GenerateRandomString
  L3_2 = 10
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2 .. L2_2
  L2_2 = math
  L2_2 = L2_2.floor
  L3_2 = 2560.0
  L2_2 = L2_2(L3_2)
  L3_2 = math
  L3_2 = L3_2.floor
  L4_2 = 1440.0
  L3_2 = L3_2(L4_2)
  L4_2 = CreateDui
  L5_2 = "https://cfx-nui-"
  L6_2 = GetCurrentResourceName
  L6_2 = L6_2()
  L7_2 = "/sprites/interaction.html"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L6_2 = L2_2
  L7_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = GetDuiHandle
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  while true do
    L6_2 = IsDuiAvailable
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      break
    end
    L6_2 = Wait
    L7_2 = 100
    L6_2(L7_2)
  end
  L6_2 = Interaction
  L6_2 = L6_2.List
  L7_2 = {}
  L7_2.id = L1_2
  L8_2 = pointIcon
  L7_2.icon = L8_2
  L8_2 = A0_2.coords
  L7_2.coords = L8_2
  L7_2.duiObj = L4_2
  L7_2.duiHandle = L5_2
  L8_2 = {}
  L8_2.selected = 1
  L9_2 = A0_2.options
  L9_2 = L9_2[1]
  L8_2.object = L9_2
  L7_2.elementData = L8_2
  L7_2.data = A0_2
  L8_2 = CreateRuntimeTextureFromDuiHandle
  L9_2 = Interaction
  L9_2 = L9_2.TXD
  L10_2 = L1_2
  L11_2 = L5_2
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L7_2.txn = L8_2
  L8_2 = A0_2.radius
  if not L8_2 then
    L8_2 = 5.0
  end
  L7_2.radius = L8_2
  L6_2[L1_2] = L7_2
  L6_2 = SendDuiMessage
  L7_2 = L4_2
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L9_2.type = "SET_COLOR"
  L10_2 = Storage
  L10_2 = L10_2.GetHudColor
  L10_2 = L10_2()
  L9_2.color = L10_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L6_2 = Wait
  L7_2 = 1000
  L6_2(L7_2)
  L6_2 = SendDuiMessage
  L7_2 = L4_2
  L8_2 = json
  L8_2 = L8_2.encode
  L9_2 = {}
  L9_2.type = "INIT"
  L10_2 = Interaction
  L10_2 = L10_2.ConvertElements
  L11_2 = A0_2.options
  L10_2 = L10_2(L11_2)
  L9_2.elements = L10_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L6_2 = Interaction
  L7_2 = Interaction
  L7_2 = L7_2.Amount
  L7_2 = L7_2 + 1
  L6_2.Amount = L7_2
  return L1_2
end
L0_1.Create = L1_1
L0_1 = Interaction
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L1_2
    L10_2 = {}
    L11_2 = L7_2.label
    L10_2.label = L11_2
    L8_2(L9_2, L10_2)
  end
  return L1_2
end
L0_1.ConvertElements = L1_1
L0_1 = Interaction
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = pairs
  L2_2 = Interaction
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
L0_1 = Interaction
function L1_1(A0_2)
  local L1_2
end
L0_1.Update = L1_1
L0_1 = LocalPlayer
L0_1 = L0_1.state
L1_1 = L0_1
L0_1 = L0_1.set
L2_1 = "IsInteractionCooldownActive"
L3_1 = false
L0_1(L1_1, L2_1, L3_1)
L0_1 = Interaction
L0_1.ProgressVar = 0
L0_1 = Interaction
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = LocalPlayer
  L2_2 = L2_2.state
  L2_2 = L2_2.IsInteractionCooldownActive
  if L2_2 and 1 == A1_2 then
    return
  end
  if "ON_COOLDOWN" == A1_2 then
    L2_2 = Interaction
    L2_2.ProgressVar = 0
  end
  if 1 == A1_2 then
    L2_2 = Interaction
    L3_2 = Interaction
    L3_2 = L3_2.ProgressVar
    L3_2 = L3_2 + 1
    L2_2.ProgressVar = L3_2
    L2_2 = Interaction
    L2_2 = L2_2.ProgressVar
    if L2_2 > 100 then
      L2_2 = Interaction
      L2_2.ProgressVar = 100
    end
  elseif 0 == A1_2 then
    L2_2 = Interaction
    L3_2 = Interaction
    L3_2 = L3_2.ProgressVar
    L3_2 = L3_2 - 1
    L2_2.ProgressVar = L3_2
  end
  L2_2 = SendDuiMessage
  L3_2 = A0_2
  L4_2 = json
  L4_2 = L4_2.encode
  L5_2 = {}
  L5_2.type = "UPDATE_PROGRESS"
  L6_2 = Interaction
  L6_2 = L6_2.ProgressVar
  L5_2.progress = L6_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = Interaction
  L2_2 = L2_2.ProgressVar
  if L2_2 >= 100 then
    L2_2 = LocalPlayer
    L2_2 = L2_2.state
    L3_2 = L2_2
    L2_2 = L2_2.set
    L4_2 = "IsInteractionCooldownActive"
    L5_2 = true
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = Citizen
    L2_2 = L2_2.CreateThread
    function L3_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
      L0_3 = debugPrint
      L1_3 = "[^2TEXTUI^7] Cooldown is not active anymore."
      L0_3(L1_3)
      L0_3 = LocalPlayer
      L0_3 = L0_3.state
      L1_3 = L0_3
      L0_3 = L0_3.set
      L2_3 = "IsInteractionCooldownActive"
      L3_3 = false
      L0_3(L1_3, L2_3, L3_3)
    end
    L2_2(L3_2)
  end
  L2_2 = Interaction
  L2_2 = L2_2.ProgressVar
  L2_2 = L2_2 >= 100
  return L2_2
end
L0_1.UpdateProgress = L1_1
L0_1 = Interaction
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = pairs
  L4_2 = Interaction
  L4_2 = L4_2.List
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.id
    if L9_2 == A2_2 then
      L9_2 = Interaction
      L9_2 = L9_2.List
      L9_2 = L9_2[L7_2]
      L9_2 = L9_2.data
      L9_2 = L9_2.options
      L9_2 = #L9_2
      L10_2 = Interaction
      L10_2 = L10_2.List
      L10_2 = L10_2[L7_2]
      L10_2 = L10_2.elementData
      L10_2 = L10_2.selected
      L11_2 = Interaction
      L11_2 = L11_2.List
      L11_2 = L11_2[L7_2]
      L11_2 = L11_2.elementData
      if A1_2 then
        L12_2 = L10_2 + 1
        if L9_2 >= L12_2 then
          L12_2 = L10_2 + 1
          if L12_2 then
            goto lbl_51
          end
        end
        L12_2 = 1
      end
      L12_2 = L10_2 - 1
      if L12_2 >= 1 then
        L12_2 = L10_2 - 1
      end
      L12_2 = L12_2 or not A1_2 and (L12_2 or L12_2)
      ::lbl_51::
      L11_2.selected = L12_2
      L11_2 = Interaction
      L11_2 = L11_2.List
      L11_2 = L11_2[L7_2]
      L11_2 = L11_2.elementData
      L12_2 = Interaction
      L12_2 = L12_2.List
      L12_2 = L12_2[L7_2]
      L12_2 = L12_2.data
      L12_2 = L12_2.options
      L13_2 = Interaction
      L13_2 = L13_2.List
      L13_2 = L13_2[L7_2]
      L13_2 = L13_2.elementData
      L13_2 = L13_2.selected
      L12_2 = L12_2[L13_2]
      L11_2.object = L12_2
      break
    end
  end
  L3_2 = SendDuiMessage
  L4_2 = A0_2
  L5_2 = json
  L5_2 = L5_2.encode
  L6_2 = {}
  L6_2.type = "CHANGE_SELECTED"
  L6_2.isRight = A1_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L0_1.ChangeSelectedElement = L1_1
L0_1 = Interaction
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
L0_1 = Interaction
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Interaction
  L1_2 = L1_2.List
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^1ERROR^7] Can not find Interaction with ID:"
    L3_2 = A0_2
    return L1_2(L2_2, L3_2)
  end
  L1_2 = debugPrint
  L2_2 = "[^2POINT^7] Succesfully removed Interaction with ID:"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = Interaction
  L1_2 = L1_2.List
  L1_2[A0_2] = nil
  L1_2 = Interaction
  L2_2 = Interaction
  L2_2 = L2_2.Amount
  L2_2 = L2_2 - 1
  L1_2.Amount = L2_2
end
L0_1.Remove = L1_1
