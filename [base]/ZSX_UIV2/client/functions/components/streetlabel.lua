local L0_1, L1_1
L0_1 = {}
StreetLabel = L0_1
L0_1 = StreetLabel
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.UI
  L1_2 = L1_2.UseStreetLabel
  if not L1_2 then
    return
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_STREETLABEL_VISIBILITY"
  L3_2 = {}
  L3_2.state = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.SetVisible = L1_1
L0_1 = StreetLabel
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.UI
  L1_2 = L1_2.UseStreetLabel
  if not L1_2 then
    return
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_STREETLABEL_DATA"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.SetStreetLabelData = L1_1
