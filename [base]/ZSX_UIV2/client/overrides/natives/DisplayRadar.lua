local L0_1, L1_1
L0_1 = _G
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = Minimap
  L3_2.Visible = A0_2
  if A2_2 then
    L3_2 = _DisplayRadar
    L4_2 = A0_2
    L3_2(L4_2)
  else
    while true do
      L3_2 = Minimap
      L3_2 = L3_2.Prepared
      if L3_2 then
        L3_2 = NUI
        L3_2 = L3_2.Loaded
        if L3_2 then
          break
        end
      end
      L3_2 = Wait
      L4_2 = 0
      L3_2(L4_2)
    end
    L3_2 = Minimap
    L3_2 = L3_2.Animate
    L4_2 = A0_2
    L5_2 = A1_2
    L3_2(L4_2, L5_2)
    if not A1_2 then
      L3_2 = Wait
      L4_2 = 400
      L3_2(L4_2)
    end
    L3_2 = Storage
    L3_2 = L3_2.GetCurrentScreen
    L3_2 = L3_2()
    if "pausemenu" == L3_2 and A0_2 then
      return
    end
    L4_2 = _DisplayRadar
    L5_2 = A0_2
    L4_2(L5_2)
  end
  L3_2 = Workers
  L3_2 = L3_2.Minimap
  L3_2 = L3_2.OnVisibilityStateChange
  L4_2 = A0_2
  L3_2(L4_2)
end
L0_1.DisplayRadar = L1_1
