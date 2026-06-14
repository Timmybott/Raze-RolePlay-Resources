local L0_1, L1_1, L2_1
L0_1 = {}
DUIS = L0_1
L0_1 = DUIS
L1_1 = CreateRuntimeTxd
L2_1 = "zsx_ui_players_txd"
L1_1 = L1_1(L2_1)
L0_1.TXD = L1_1
L0_1 = DUIS
L1_1 = {}
L0_1.Players = L1_1
L0_1 = DUIS
L0_1 = L0_1.Players
L1_1 = {}
L0_1.List = L1_1
L0_1 = DUIS
L0_1 = L0_1.Players
L0_1.Amount = 0
L0_1 = DUIS
L0_1 = L0_1.Players
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = DUIS
  L4_2 = L4_2.Players
  L4_2 = L4_2.List
  L5_2 = tostring
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2[L5_2]
  if L4_2 then
    return
  end
  L4_2 = debugPrint
  L5_2 = "[^9DUI_HANDLER^7] Preparing DUI for PLY_SRC_"
  L6_2 = A0_2
  L5_2 = L5_2 .. L6_2
  L4_2(L5_2)
  L4_2 = _Lib
  L4_2 = L4_2.GenerateRandomString
  L5_2 = 10
  L4_2 = L4_2(L5_2)
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = 2560.0
  L5_2 = L5_2(L6_2)
  L6_2 = math
  L6_2 = L6_2.floor
  L7_2 = 1440.0
  L6_2 = L6_2(L7_2)
  L7_2 = CreateDui
  L8_2 = "https://cfx-nui-"
  L9_2 = GetCurrentResourceName
  L9_2 = L9_2()
  L10_2 = "/sprites/"
  L11_2 = A2_2
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
  L9_2 = L5_2
  L10_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = GetDuiHandle
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  while true do
    L9_2 = IsDuiAvailable
    L10_2 = L7_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      break
    end
    L9_2 = Wait
    L10_2 = 100
    L9_2(L10_2)
  end
  L9_2 = Wait
  L10_2 = 250
  L9_2(L10_2)
  L9_2 = DUIS
  L9_2 = L9_2.Players
  L9_2 = L9_2.List
  L10_2 = tostring
  L11_2 = A0_2
  L10_2 = L10_2(L11_2)
  L11_2 = {}
  L11_2.playerSource = A0_2
  L11_2.playerPedId = A1_2
  L11_2.url = A2_2
  L11_2.duiObject = L7_2
  L11_2.id = L4_2
  L12_2 = CreateRuntimeTextureFromDuiHandle
  L13_2 = DUIS
  L13_2 = L13_2.TXD
  L14_2 = L4_2
  L15_2 = L8_2
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L11_2.txn = L12_2
  L11_2.duiHandle = L8_2
  L11_2.lastMessageTimer = false
  function L12_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = debugPrint
    L2_3 = "[^9DUI_HANDLER^7] [^2DUI_"
    L3_3 = A0_2
    L4_3 = "^7] Sending [ME] message."
    L2_3 = L2_3 .. L3_3 .. L4_3
    L1_3(L2_3)
    L1_3 = SendDuiMessage
    L2_3 = L7_2
    L3_3 = json
    L3_3 = L3_3.encode
    L4_3 = {}
    L4_3.type = "ADD_MESSAGE"
    L4_3.messageType = "ME"
    L4_3.messageColor = "#c94b5b"
    L4_3.messageContent = A0_3
    L3_3, L4_3 = L3_3(L4_3)
    L1_3(L2_3, L3_3, L4_3)
  end
  L11_2.addMessageME = L12_2
  function L12_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = debugPrint
    L2_3 = "[^9DUI_HANDLER^7] [^2DUI_"
    L3_3 = A0_2
    L4_3 = "^7] Sending [DO] message."
    L2_3 = L2_3 .. L3_3 .. L4_3
    L1_3(L2_3)
    L1_3 = SendDuiMessage
    L2_3 = L7_2
    L3_3 = json
    L3_3 = L3_3.encode
    L4_3 = {}
    L4_3.type = "ADD_MESSAGE"
    L4_3.messageType = "DO"
    L4_3.messageColor = "#c94b5b"
    L4_3.messageContent = A0_3
    L3_3, L4_3 = L3_3(L4_3)
    L1_3(L2_3, L3_3, L4_3)
  end
  L11_2.addMessageDO = L12_2
  function L12_2()
    local L0_3, L1_3
  end
  L11_2.updateSelectedColor = L12_2
  L9_2[L10_2] = L11_2
  L9_2 = DUIS
  L9_2 = L9_2.Players
  L10_2 = DUIS
  L10_2 = L10_2.Players
  L10_2 = L10_2.Amount
  L10_2 = L10_2 + 1
  L9_2.Amount = L10_2
  L9_2 = debugPrint
  L10_2 = "[^9DUI_HANDLER^7] DUI PLY_SRC_"
  L11_2 = A0_2
  L12_2 = " has been loaded."
  L10_2 = L10_2 .. L11_2 .. L12_2
  L9_2(L10_2)
  if A3_2 then
    L9_2 = A3_2
    L10_2 = DUIS
    L10_2 = L10_2.Players
    L10_2 = L10_2.List
    L11_2 = tostring
    L12_2 = A0_2
    L11_2 = L11_2(L12_2)
    L10_2 = L10_2[L11_2]
    L9_2(L10_2)
  end
end
L0_1.Append = L1_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = DUIS
  L3_2 = L3_2.Players
  L3_2 = L3_2.List
  L4_2 = tostring
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2[L4_2]
  if L3_2 then
    L3_2 = DUIS
    L3_2 = L3_2.Players
    L3_2 = L3_2.List
    L4_2 = tostring
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    if "ME" == A1_2 then
      L4_2 = "addMessageME"
      if L4_2 then
        goto lbl_23
      end
    end
    L4_2 = "addMessageDO"
    ::lbl_23::
    L3_2 = L3_2[L4_2]
    L4_2 = A2_2
    L3_2(L4_2)
    L3_2 = DUIS
    L3_2 = L3_2.Players
    L3_2 = L3_2.List
    L4_2 = tostring
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    L4_2 = L4_2 + 13000
    L3_2.endMessageTimer = L4_2
  else
    L3_2 = DUIS
    L3_2 = L3_2.Players
    L3_2 = L3_2.Append
    L4_2 = A0_2
    L5_2 = GetPlayerPed
    L6_2 = GetPlayerFromServerId
    L7_2 = A0_2
    L6_2, L7_2 = L6_2(L7_2)
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = "ply_dui.html"
    function L7_2(A0_3)
      local L1_3, L2_3, L3_3
      L1_3 = A1_2
      if "ME" == L1_3 then
        L1_3 = "addMessageME"
        if L1_3 then
          goto lbl_8
        end
      end
      L1_3 = "addMessageDO"
      ::lbl_8::
      L1_3 = A0_3[L1_3]
      L2_3 = A2_2
      L1_3(L2_3)
      L1_3 = DUIS
      L1_3 = L1_3.Players
      L1_3 = L1_3.List
      L2_3 = tostring
      L3_3 = A0_2
      L2_3 = L2_3(L3_3)
      L1_3 = L1_3[L2_3]
      L2_3 = GetGameTimer
      L2_3 = L2_3()
      L2_3 = L2_3 + 13000
      L1_3.endMessageTimer = L2_3
    end
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
end
Create3DDUIHandle = L0_1
L0_1 = RegisterNetEvent
L1_1 = "ZSX_UIV2:PlayerDUIS:Add"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "ZSX_UIV2:PlayerDUIS:Add"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = DUIS
  L3_2 = L3_2.Players
  L3_2 = L3_2.List
  L4_2 = tostring
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2[L4_2]
  if L3_2 then
    L3_2 = DUIS
    L3_2 = L3_2.Players
    L3_2 = L3_2.List
    L4_2 = tostring
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    if "ME" == A1_2 then
      L4_2 = "addMessageME"
      if L4_2 then
        goto lbl_23
      end
    end
    L4_2 = "addMessageDO"
    ::lbl_23::
    L3_2 = L3_2[L4_2]
    L4_2 = A2_2
    L3_2(L4_2)
    L3_2 = DUIS
    L3_2 = L3_2.Players
    L3_2 = L3_2.List
    L4_2 = tostring
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2[L4_2]
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    L4_2 = L4_2 + 13000
    L3_2.endMessageTimer = L4_2
  else
    L3_2 = DUIS
    L3_2 = L3_2.Players
    L3_2 = L3_2.Append
    L4_2 = A0_2
    L5_2 = GetPlayerPed
    L6_2 = GetPlayerFromServerId
    L7_2 = A0_2
    L6_2, L7_2 = L6_2(L7_2)
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = "ply_dui.html"
    function L7_2(A0_3)
      local L1_3, L2_3, L3_3
      L1_3 = A1_2
      if "ME" == L1_3 then
        L1_3 = "addMessageME"
        if L1_3 then
          goto lbl_8
        end
      end
      L1_3 = "addMessageDO"
      ::lbl_8::
      L1_3 = A0_3[L1_3]
      L2_3 = A2_2
      L1_3(L2_3)
      L1_3 = DUIS
      L1_3 = L1_3.Players
      L1_3 = L1_3.List
      L2_3 = tostring
      L3_3 = A0_2
      L2_3 = L2_3(L3_3)
      L1_3 = L1_3[L2_3]
      L2_3 = GetGameTimer
      L2_3 = L2_3()
      L2_3 = L2_3 + 13000
      L1_3.endMessageTimer = L2_3
    end
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "ZSX_UIV2:PlayerDUIS:Remove"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "ZSX_UIV2:PlayerDUIS:Remove"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = DUIS
  L1_2 = L1_2.Players
  L1_2 = L1_2.Remove
  L2_2 = A0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = DUIS
L0_1 = L0_1.Players
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = debugPrint
    L2_2 = "[^9DUI_HANDLER^7] Invalid param value for [playerSource]. Param output: "
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    return L1_2(L2_2)
  end
  L1_2 = DUIS
  L1_2 = L1_2.Players
  L1_2 = L1_2.List
  L2_2 = tostring
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2[L2_2]
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^9DUI_HANDLER^7] No DUI has been found for: "
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    return L1_2(L2_2)
  end
  L1_2 = DUIS
  L1_2 = L1_2.Players
  L1_2 = L1_2.List
  L2_2 = tostring
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2[L2_2]
  return L1_2
end
L0_1.GetDUI = L1_1
L0_1 = DUIS
L0_1 = L0_1.Players
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = DUIS
  L1_2 = L1_2.Players
  L1_2 = L1_2.List
  L2_2 = tostring
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2[L2_2]
  if L1_2 then
    L1_2 = DestroyDui
    L2_2 = DUIS
    L2_2 = L2_2.Players
    L2_2 = L2_2.List
    L3_2 = tostring
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.duiObject
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
    L1_2 = DUIS
    L1_2 = L1_2.Players
    L2_2 = DUIS
    L2_2 = L2_2.Players
    L2_2 = L2_2.Amount
    L2_2 = L2_2 - 1
    L1_2.Amount = L2_2
    L1_2 = DUIS
    L1_2 = L1_2.Players
    L1_2 = L1_2.List
    L2_2 = tostring
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L1_2[L2_2] = nil
    L1_2 = debugPrint
    L2_2 = "[^9DUI_HANDLER^7] Removed DUI for PLY_SRC_"
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
  end
end
L0_1.Remove = L1_1
