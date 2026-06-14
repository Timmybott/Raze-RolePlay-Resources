local L0_1, L1_1
L0_1 = Threads
L1_1 = {}
L0_1.DUI = L1_1
L0_1 = Threads
L0_1 = L0_1.DUI
L0_1.Use = false
L0_1 = Threads
L0_1 = L0_1.DUI
L1_1 = {}
L0_1.Cache = L1_1
L0_1 = Threads
L0_1 = L0_1.DUI
L0_1.Sleep = true
L0_1 = Threads
L0_1 = L0_1.DUI
function L1_1()
  local L0_2, L1_2
  L0_2 = Threads
  L0_2 = L0_2.DUI
  L0_2.Use = true
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3
    while true do
      L0_3 = Threads
      L0_3 = L0_3.DUI
      L0_3 = L0_3.Use
      if not L0_3 then
        break
      end
      L0_3 = Threads
      L0_3 = L0_3.DUI
      L1_3 = DUIS
      L1_3 = L1_3.Players
      L1_3 = L1_3.Amount
      L1_3 = 0 == L1_3
      L0_3.Sleep = L1_3
      L0_3 = Threads
      L0_3 = L0_3.DUI
      L0_3 = L0_3.Sleep
      if L0_3 then
        L0_3 = 1000
        if L0_3 then
          goto lbl_25
        end
      end
      L0_3 = 0
      ::lbl_25::
      L1_3 = Threads
      L1_3 = L1_3.DUI
      L1_3 = L1_3.Sleep
      if not L1_3 then
        L1_3 = GetEntityCoords
        L2_3 = Threads
        L2_3 = L2_3.Players
        L2_3 = L2_3.Data
        L2_3 = L2_3.ped
        L1_3 = L1_3(L2_3)
        L2_3 = pairs
        L3_3 = DUIS
        L3_3 = L3_3.Players
        L3_3 = L3_3.List
        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
        for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
          L8_3 = LocalPlayer
          L8_3 = L8_3.state
          L8_3 = L8_3.LowFPSDetected
          if L8_3 then
            L8_3 = DUIS
            L8_3 = L8_3.Players
            L8_3 = L8_3.Remove
            L9_3 = L6_3
            L8_3(L9_3)
            L8_3 = debugPrint
            L9_3 = "[^9DUI_HANDLER^7] Removing DUI for: DUI_"
            L10_3 = L6_3
            L11_3 = " | LOW_FPS_DETECT"
            L9_3 = L9_3 .. L10_3 .. L11_3
            L8_3(L9_3)
          else
            L8_3 = DUIS
            L8_3 = L8_3.Players
            L8_3 = L8_3.List
            L8_3 = L8_3[L6_3]
            L8_3 = L8_3.endMessageTimer
            if L8_3 then
              L8_3 = GetGameTimer
              L8_3 = L8_3()
              L9_3 = DUIS
              L9_3 = L9_3.Players
              L9_3 = L9_3.List
              L9_3 = L9_3[L6_3]
              L9_3 = L9_3.endMessageTimer
              if L8_3 > L9_3 then
                L8_3 = DUIS
                L8_3 = L8_3.Players
                L8_3 = L8_3.Remove
                L9_3 = L6_3
                L8_3(L9_3)
                L8_3 = debugPrint
                L9_3 = "[^9DUI_HANDLER^7] Removing DUI for: DUI_"
                L10_3 = L6_3
                L9_3 = L9_3 .. L10_3
                L8_3(L9_3)
            end
            else
              L8_3 = GetOffsetFromEntityInWorldCoords
              L9_3 = L7_3.playerPedId
              L10_3 = 0
              L11_3 = 0
              L12_3 = 0.4
              L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3)
              L9_3 = GetScreenCoordFromWorldCoord
              L10_3 = L8_3.x
              L11_3 = L8_3.y
              L12_3 = L8_3.z
              L9_3, L10_3, L11_3 = L9_3(L10_3, L11_3, L12_3)
              if L9_3 then
                L12_3 = Config
                L12_3 = L12_3.UI
                L12_3 = L12_3.DUI3D_CheckForIntersectWorld
                if L12_3 then
                  L12_3 = HasEntityClearLosToEntity
                  L13_3 = Threads
                  L13_3 = L13_3.Players
                  L13_3 = L13_3.Data
                  L13_3 = L13_3.ped
                  L14_3 = L7_3.playerPedId
                  L15_3 = 1
                  L12_3 = L12_3(L13_3, L14_3, L15_3)
                  L9_3 = L12_3
                end
              end
              if L9_3 then
                L12_3 = L8_3 - L1_3
                L12_3 = #L12_3
                if L12_3 <= 10 then
                  L13_3 = L12_3 / 15
                  if L13_3 then
                    goto lbl_125
                  end
                end
                L13_3 = 0.66
                ::lbl_125::
                L14_3 = DrawSprite
                L15_3 = "zsx_ui_players_txd"
                L16_3 = L7_3.id
                L17_3 = L10_3
                L18_3 = L11_3
                L19_3 = 0.5 * L13_3
                L20_3 = 0.5
                L19_3 = L20_3 - L19_3
                L20_3 = 0.5 * L13_3
                L21_3 = 0.5
                L20_3 = L21_3 - L20_3
                L21_3 = 0.0
                L22_3 = 255
                L23_3 = 255
                L24_3 = 255
                L25_3 = 255
                L14_3(L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3)
              end
            end
          end
        end
      end
      L1_3 = Wait
      L2_3 = L0_3
      L1_3(L2_3)
    end
  end
  L0_2(L1_2)
end
L0_1.Init = L1_1
