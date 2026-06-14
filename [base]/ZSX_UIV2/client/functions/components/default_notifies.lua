local L0_1, L1_1
L0_1 = {}
DefaultNotifies = L0_1
L0_1 = DefaultNotifies
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = _Lib
  L1_2 = L1_2.GenerateRandomString
  L2_2 = 10
  L1_2 = L1_2(L2_2)
  A0_2.serial = L1_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "ADD_DEFAULT_NOTIFIES"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = TriggerEvent
  L2_2 = "ZSX_UIV2:Interfaces:DefaultNotifications:OnAdd"
  L3_2 = A0_2.serial
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.serial
  return L1_2
end
L0_1.Add = L1_1
L0_1 = DefaultNotifies
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = debugPrint
    L2_2 = "[^2DEFAULT NOTIFICATION^7] You need to fulfill serial in order to remove notification!"
    return L1_2(L2_2)
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "REMOVE_DEFAULT_NOTIFY"
  L3_2 = {}
  L3_2.serial = A0_2
  L1_2(L2_2, L3_2)
  L1_2 = TriggerEvent
  L2_2 = "ZSX_UIV2:Interfaces:DefaultNotifications:OnRemove"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.Remove = L1_1
L0_1 = DefaultNotifies
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if not A0_2 then
    L2_2 = debugPrint
    L3_2 = "[^2DEFAULT NOTIFICATION^7] You need to fulfill serial in order to update notification!"
    return L2_2(L3_2)
  end
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "UPDATE_DEFAULT_NOTIFY"
  L4_2 = {}
  L4_2.serial = A0_2
  L4_2.text = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.Update = L1_1
L0_1 = DefaultNotifies
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if not A0_2 then
    L2_2 = debugPrint
    L3_2 = "[^2DEFAULT NOTIFICATION^7] You need to fulfill serial in order to update notification!"
    return L2_2(L3_2)
  end
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "UPDATE_DEFAULT_NOTIFY_PROGRESS"
  L4_2 = {}
  L4_2.serial = A0_2
  L4_2.value = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.UpdateProgress = L1_1
