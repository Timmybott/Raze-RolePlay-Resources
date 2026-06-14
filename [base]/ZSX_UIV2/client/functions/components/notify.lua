local L0_1, L1_1, L2_1
L0_1 = {}
Notify = L0_1
L0_1 = Notify
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = Config
  L4_2 = L4_2.Notify
  L4_2 = L4_2.Use
  if not L4_2 then
    return
  end
  L4_2 = NUI
  L4_2 = L4_2.Loaded
  if not L4_2 then
    while true do
      L4_2 = NUI
      L4_2 = L4_2.Loaded
      if L4_2 then
        break
      end
      L4_2 = Storage
      L4_2 = L4_2.Current
      if "game" == L4_2 then
        break
      end
      L4_2 = Wait
      L5_2 = 0
      L4_2(L5_2)
    end
  end
  L4_2 = InputParser
  if L4_2 then
    L4_2 = InputParser
    L4_2 = L4_2.ParseInputs
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_33
    end
  end
  L4_2 = A0_2
  ::lbl_33::
  L5_2 = InputParser
  if L5_2 then
    L5_2 = InputParser
    L5_2 = L5_2.ParseInputs
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_43
    end
  end
  L5_2 = A1_2
  ::lbl_43::
  L6_2 = "notify_"
  L7_2 = _Lib
  L7_2 = L7_2.GenerateRandomString
  L8_2 = 10
  L7_2 = L7_2(L8_2)
  L6_2 = L6_2 .. L7_2
  L7_2 = NUI
  L7_2 = L7_2.SendMessage
  L8_2 = "ADD_NOTIFY"
  L9_2 = {}
  L9_2.header = L4_2
  L9_2.text = L5_2
  L9_2.icon = A2_2
  L10_2 = A3_2 or L10_2
  if not A3_2 then
    L10_2 = 5000
  end
  L9_2.duration = L10_2
  L9_2.serial = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = Citizen
  L7_2 = L7_2.CreateThread
  function L8_2()
    local L0_3, L1_3, L2_3
    L0_3 = Wait
    L1_3 = 100
    L0_3(L1_3)
    L0_3 = NUI
    L0_3 = L0_3.SendMessage
    L1_3 = "HANDLE_SFX_MESSAGE"
    L2_3 = {}
    L2_3.sfx = "notify_enter"
    L0_3(L1_3, L2_3)
  end
  L7_2(L8_2)
  return L6_2
end
L0_1.Add = L1_1
L0_1 = RegisterCommand
L1_1 = "addnotify"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = Notify
  L0_2 = L0_2.Add
  L1_2 = "Test"
  L2_2 = "Press ~INPUT_ENTER~ to interact and ~INPUT_SPRINT~ to run!"
  L3_2 = "fas fa-envelope-open"
  L4_2 = 12000
  L0_2(L1_2, L2_2, L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = Notify
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = debugPrint
    L2_2 = "[^1ERROR^7] You need send proper serial in order to remove described notify."
    return L1_2(L2_2)
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "REMOVE_NOTIFY"
  L3_2 = {}
  L3_2.serial = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.Remove = L1_1
