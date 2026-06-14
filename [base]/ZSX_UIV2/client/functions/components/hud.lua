local L0_1, L1_1
L0_1 = {}
Hud = L0_1
L0_1 = Hud
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "UPDATE_HUD_VALUE"
  L4_2 = {}
  L4_2.key = A0_2
  L4_2.value = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.UpdateKeyValue = L1_1
