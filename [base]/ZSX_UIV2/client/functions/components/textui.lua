local L0_1, L1_1, L2_1
L0_1 = {}
TextUI = L0_1
L0_1 = TextUI
L1_1 = {}
L0_1.List = L1_1
L0_1 = TextUI
L0_1.Amount = 0
L0_1 = TextUI
L1_1 = {}
L0_1.TextBuffer = L1_1
L0_1 = TextUI
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = TextUI
  L5_2 = L5_2.List
  L5_2 = L5_2.textui_persistent
  if L5_2 then
    return
  end
  L5_2 = "textui_persistent"
  L6_2 = NUI
  L6_2 = L6_2.SendMessage
  L7_2 = "ADD_TEXT_UI_ELEMENT"
  L8_2 = {}
  L8_2.serial = L5_2
  L8_2.key = A0_2
  L8_2.text = A1_2
  L9_2 = A2_2 or L9_2
  if not (A2_2 and A3_2) or not A2_2 then
    L9_2 = -1
  end
  L8_2.duration = L9_2
  L6_2(L7_2, L8_2)
  L6_2 = TextUI
  L6_2 = L6_2.List
  L7_2 = {}
  L7_2.serial = L5_2
  L7_2.key = A0_2
  L7_2.text = A1_2
  L8_2 = A2_2 or L8_2
  if not A2_2 then
    L8_2 = "permament"
  end
  L7_2.duration = L8_2
  L8_2 = A3_2 or L8_2
  if not A3_2 or not A3_2 then
    L8_2 = "NO_CALLBACK_FOR_ONCOMPLETE"
  end
  L7_2.onComplete = L8_2
  L8_2 = A4_2 or L8_2
  if not A4_2 or not A4_2 then
    L8_2 = "NO_CALLBACK_FOR_ONFAILURE"
  end
  L7_2.onFailure = L8_2
  L6_2[L5_2] = L7_2
  L6_2 = TextUI
  L6_2 = L6_2.TextBuffer
  L6_2[A1_2] = L5_2
  if A2_2 or -1 == A2_2 then
    if not A3_2 then
      L6_2 = debugPrint
      L7_2 = "[^2TEXTUI^7] No onComplete callback was created. Switching to non-controllable TextUI."
      return L6_2(L7_2)
    end
    if not A4_2 then
      L6_2 = debugPrint
      L7_2 = "[^2TEXTUI^7] No onFailure callback was created. You will not get the access to that feature."
      return L6_2(L7_2)
    end
    L6_2 = Citizen
    L6_2 = L6_2.CreateThread
    function L7_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      L0_3 = false
      while true do
        L1_3 = TextUI
        L1_3 = L1_3.List
        L2_3 = L5_2
        L1_3 = L1_3[L2_3]
        if not L1_3 then
          break
        end
        L1_3 = IsControlJustPressed
        L2_3 = 0
        L3_3 = Keys
        L4_3 = A0_2
        L5_3 = L4_3
        L4_3 = L4_3.upper
        L4_3 = L4_3(L5_3)
        L3_3 = L3_3[L4_3]
        L1_3 = L1_3(L2_3, L3_3)
        if L1_3 then
          L0_3 = true
          break
        end
        L1_3 = Wait
        L2_3 = 0
        L1_3(L2_3)
      end
      if L0_3 then
        L1_3 = A3_2
        if L1_3 then
          L1_3 = A3_2
          L1_3()
        end
        L1_3 = TextUI
        L1_3 = L1_3.Remove
        L2_3 = L5_2
        L3_3 = true
        L1_3(L2_3, L3_3)
      else
        L1_3 = A4_2
        if L1_3 then
          L1_3 = A4_2
          L1_3()
        end
      end
    end
    L6_2(L7_2)
  end
end
L0_1.CreatePersistent = L1_1
L0_1 = TextUI
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TextUI
  L1_2 = L1_2.List
  L1_2 = L1_2.textui_persistent
  if not L1_2 then
    return
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "REMOVE_TEXT_UI_ELEMENT"
  L3_2 = {}
  L3_2.serial = "textui_persistent"
  L3_2.anim = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = TextUI
  L1_2 = L1_2.List
  L1_2.textui_persistent = nil
end
L0_1.RemovePersistent = L1_1
L0_1 = TextUI
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = Keys
  L7_2 = A0_2
  L6_2 = A0_2.upper
  L6_2 = L6_2(L7_2)
  L5_2 = L5_2[L6_2]
  if not L5_2 then
    L5_2 = debugPrint
    L6_2 = "[^2TEXTUI^7] Key: ["
    L8_2 = A0_2
    L7_2 = A0_2.upper
    L7_2 = L7_2(L8_2)
    L8_2 = "] does not exists. Returning."
    L6_2 = L6_2 .. L7_2 .. L8_2
    return L5_2(L6_2)
  end
  L5_2 = TextUI
  L5_2 = L5_2.TextBuffer
  L5_2 = L5_2[A1_2]
  if L5_2 then
    return
  end
  L5_2 = "textui_"
  L6_2 = _Lib
  L6_2 = L6_2.GenerateRandomString
  L7_2 = 10
  L6_2 = L6_2(L7_2)
  L5_2 = L5_2 .. L6_2
  L6_2 = NUI
  L6_2 = L6_2.SendMessage
  L7_2 = "ADD_TEXT_UI_ELEMENT"
  L8_2 = {}
  L8_2.serial = L5_2
  L8_2.key = A0_2
  L8_2.text = A1_2
  L9_2 = A2_2 or L9_2
  if not (A2_2 and A3_2) or not A2_2 then
    L9_2 = -1
  end
  L8_2.duration = L9_2
  L6_2(L7_2, L8_2)
  L6_2 = TextUI
  L6_2 = L6_2.List
  L7_2 = {}
  L7_2.serial = L5_2
  L7_2.key = A0_2
  L7_2.text = A1_2
  L8_2 = A2_2 or L8_2
  if not A2_2 then
    L8_2 = "permament"
  end
  L7_2.duration = L8_2
  L8_2 = A3_2 or L8_2
  if not A3_2 or not A3_2 then
    L8_2 = "NO_CALLBACK_FOR_ONCOMPLETE"
  end
  L7_2.onComplete = L8_2
  L8_2 = A4_2 or L8_2
  if not A4_2 or not A4_2 then
    L8_2 = "NO_CALLBACK_FOR_ONFAILURE"
  end
  L7_2.onFailure = L8_2
  L6_2[L5_2] = L7_2
  L6_2 = TextUI
  L6_2 = L6_2.TextBuffer
  L6_2[A1_2] = L5_2
  if A2_2 or -1 == A2_2 then
    if not A3_2 then
      L6_2 = debugPrint
      L7_2 = "[^2TEXTUI^7] No onComplete callback was created. Switching to non-controllable TextUI."
      return L6_2(L7_2)
    end
    if not A4_2 and -1 ~= A2_2 then
      L6_2 = debugPrint
      L7_2 = "[^2TEXTUI^7] No onFailure callback was created. You will not get the access to that feature."
      return L6_2(L7_2)
    end
    L6_2 = Citizen
    L6_2 = L6_2.CreateThread
    function L7_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      L0_3 = false
      while true do
        L1_3 = TextUI
        L1_3 = L1_3.List
        L2_3 = L5_2
        L1_3 = L1_3[L2_3]
        if not L1_3 then
          break
        end
        L1_3 = IsControlJustPressed
        L2_3 = 0
        L3_3 = Keys
        L4_3 = TextUI
        L4_3 = L4_3.List
        L5_3 = L5_2
        L4_3 = L4_3[L5_3]
        L4_3 = L4_3.key
        L5_3 = L4_3
        L4_3 = L4_3.upper
        L4_3 = L4_3(L5_3)
        L3_3 = L3_3[L4_3]
        L1_3 = L1_3(L2_3, L3_3)
        if L1_3 then
          L0_3 = true
          break
        end
        L1_3 = Wait
        L2_3 = 0
        L1_3(L2_3)
      end
      if L0_3 then
        L1_3 = A3_2
        if L1_3 then
          L1_3 = A3_2
          L1_3()
        end
        L1_3 = TextUI
        L1_3 = L1_3.Remove
        L2_3 = L5_2
        L3_3 = true
        L1_3(L2_3, L3_3)
      else
        L1_3 = A4_2
        if L1_3 then
          L1_3 = A4_2
          L1_3()
        end
        L1_3 = TextUI
        L1_3 = L1_3.Remove
        L2_3 = L5_2
        L3_3 = false
        L1_3(L2_3, L3_3)
      end
    end
    L6_2(L7_2)
  end
  return L5_2
end
L0_1.Add = L1_1
L0_1 = TextUI
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TextUI
  L2_2 = L2_2.List
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    return
  end
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "UPDATE_TEXT_UI_ELEMENT"
  L4_2 = {}
  L4_2.serial = A0_2
  L4_2.key = "text"
  L4_2.value = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.UpdateText = L1_1
L0_1 = TextUI
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TextUI
  L1_2 = L1_2.UpdateText
  L2_2 = "textui_persistent"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.UpdatePersistentText = L1_1
L0_1 = TextUI
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TextUI
  L2_2 = L2_2.List
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    return
  end
  L2_2 = TextUI
  L2_2 = L2_2.List
  L2_2 = L2_2[A0_2]
  L2_2.key = A1_2
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "UPDATE_TEXT_UI_ELEMENT"
  L4_2 = {}
  L4_2.serial = A0_2
  L4_2.key = "key"
  L4_2.value = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.UpdateKey = L1_1
L0_1 = TextUI
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TextUI
  L1_2 = L1_2.UpdateKey
  L2_2 = "textui_persistent"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.UpdatePersistentKey = L1_1
L0_1 = RegisterNUICallback
L1_1 = "textui.forceRemoveOnFailure"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TextUI
  L1_2 = L1_2.Remove
  L2_2 = A0_2.serial
  L3_2 = false
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = TextUI
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TextUI
  L2_2 = L2_2.List
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    return
  end
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "REMOVE_TEXT_UI_ELEMENT"
  L4_2 = {}
  L4_2.serial = A0_2
  L4_2.anim = A1_2
  L2_2(L3_2, L4_2)
  L2_2 = TextUI
  L2_2 = L2_2.TextBuffer
  L3_2 = TextUI
  L3_2 = L3_2.List
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.text
  L2_2[L3_2] = nil
  L2_2 = TextUI
  L2_2 = L2_2.List
  L2_2[A0_2] = nil
end
L0_1.Remove = L1_1
