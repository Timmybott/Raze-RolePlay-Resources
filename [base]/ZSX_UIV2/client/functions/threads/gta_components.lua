local L0_1, L1_1
L0_1 = Threads
L1_1 = {}
L0_1.Components = L1_1
L0_1 = Threads
L0_1 = L0_1.Components
function L1_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = SetPedConfigFlag
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L2_3 = 48
    L3_3 = true
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = ipairs
    L1_3 = Config
    L1_3 = L1_3.HideComponents
    L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
    for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
      if L5_3 then
        L6_3 = SetHudComponentPosition
        L7_3 = L4_3
        L8_3 = -5.0
        L9_3 = -5.0
        L6_3(L7_3, L8_3, L9_3)
      end
    end
    L0_3 = Config
    L0_3 = L0_3.RemoveFeedsAndDefaultNotifications
    if L0_3 then
      while true do
        L0_3 = ThefeedHideThisFrame
        L0_3()
        L0_3 = Wait
        L1_3 = 7
        L0_3(L1_3)
      end
    end
  end
  L0_2(L1_2)
end
L0_1.Init = L1_1
