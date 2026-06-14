local L0_1, L1_1
L0_1 = {}
WeaponIndicator = L0_1
L0_1 = WeaponIndicator
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_WEAPON_INDICATOR_AS_ACTIVE"
  L3_2 = {}
  L3_2.state = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.SetAsActive = L1_1
L0_1 = WeaponIndicator
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_WEAPON_INDICATOR_NAME"
  L3_2 = {}
  L3_2.name = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.SetName = L1_1
L0_1 = WeaponIndicator
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = NUI
  L3_2 = L3_2.SendMessage
  L4_2 = "SET_WEAPON_INDICATOR_AMMO"
  L5_2 = {}
  L5_2.current = A0_2
  L5_2.max = A1_2
  L5_2.magazine = A2_2
  L3_2(L4_2, L5_2)
end
L0_1.SetAmmo = L1_1
