local L0_1, L1_1
L0_1 = Threads
L1_1 = {}
L0_1.Point = L1_1
L0_1 = Threads
L0_1 = L0_1.Point
L0_1.Use = false
L0_1 = Threads
L0_1 = L0_1.Point
function L1_1()
  local L0_2, L1_2
  L0_2 = Threads
  L0_2 = L0_2.Point
  L0_2.Use = true
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3
    L0_3 = Config
    L0_3 = L0_3.Intervals
    L0_3 = L0_3.point
    L0_3 = L0_3.idle
    L1_3 = Threads
    L1_3 = L1_3.Players
    L1_3 = L1_3.Data
    L1_3 = L1_3.player
    while true do
      L2_3 = Threads
      L2_3 = L2_3.Point
      L2_3 = L2_3.Use
      if not L2_3 then
        break
      end
      L2_3 = Point
      L2_3 = L2_3.Amount
      if L2_3 > 0 then
        L2_3 = Config
        L2_3 = L2_3.Intervals
        L2_3 = L2_3.point
        L0_3 = L2_3.active
        L2_3 = Threads
        L2_3 = L2_3.Players
        L2_3 = L2_3.Data
        L2_3 = L2_3.coords
        L2_3 = L1_3 ~= L2_3
        if L2_3 then
          L3_3 = Threads
          L3_3 = L3_3.Players
          L3_3 = L3_3.Data
          L1_3 = L3_3.coords
        end
        L3_3 = pairs
        L4_3 = Point
        L4_3 = L4_3.List
        L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
        for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
          L9_3 = nil
          L10_3 = nil
          L11_3 = nil
          L12_3 = nil
          L13_3 = type
          L14_3 = L8_3.coords
          L13_3 = L13_3(L14_3)
          L13_3 = "number" == L13_3
          if L13_3 then
            L14_3 = DoesEntityExist
            L15_3 = L8_3.coords
            L14_3 = L14_3(L15_3)
            if L14_3 then
              L14_3 = GetEntityCoords
              L15_3 = L8_3.coords
              L14_3 = L14_3(L15_3)
              L9_3 = L14_3
              L14_3 = GetHintPosition
              L15_3 = L9_3
              L14_3, L15_3, L16_3 = L14_3(L15_3)
              L12_3 = L16_3
              L11_3 = L15_3
              L10_3 = L14_3
              L8_3.lastCoords = L9_3
          end
          elseif not L13_3 then
            L9_3 = L8_3.coords
            L14_3 = GetHintPosition
            L15_3 = L8_3.coords
            L14_3, L15_3, L16_3 = L14_3(L15_3)
            L12_3 = L16_3
            L11_3 = L15_3
            L10_3 = L14_3
          else
            L14_3 = L8_3.lastCoords
            if L14_3 then
              L14_3 = GetHintPosition
              L15_3 = L8_3.lastCoords
              L14_3, L15_3, L16_3 = L14_3(L15_3)
              L12_3 = L16_3
              L11_3 = L15_3
              L10_3 = L14_3
            end
          end
          if L9_3 then
            L14_3 = Threads
            L14_3 = L14_3.Players
            L14_3 = L14_3.Data
            L14_3 = L14_3.coords
            L14_3 = L14_3 - L9_3
            L14_3 = #L14_3
            L15_3 = L8_3.requiredDistance
            L15_3 = L14_3 < L15_3
            L16_3 = L8_3.options
            if L16_3 then
              L16_3 = L16_3.drawDistance
            end
            L16_3 = not L16_3
            if L16_3 then
              L17_3 = 1000
              if L14_3 > L17_3 then
                L17_3 = math
                L17_3 = L17_3.floor
                L18_3 = L14_3 / 10
                L17_3 = L17_3(L18_3)
                L17_3 = L17_3 / 100
                if L17_3 then
                  goto lbl_131
                end
              end
              L17_3 = math
              L17_3 = L17_3.floor
              L18_3 = L14_3
              L17_3 = L17_3(L18_3)
              ::lbl_131::
              L18_3 = 1000
              if L14_3 > L18_3 then
                L18_3 = "km"
                if L18_3 then
                  goto lbl_138
                end
              end
              L18_3 = "m"
              ::lbl_138::
              L19_3 = DrawSprite
              L20_3 = "zsx_ui_points_txd"
              L21_3 = L8_3.id
              L22_3 = L10_3
              L23_3 = L11_3
              L24_3 = 0.5
              L25_3 = 0.5
              L26_3 = 0.0
              L27_3 = 255
              L28_3 = 255
              L29_3 = 255
              L30_3 = 255
              L19_3(L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
              L19_3 = L8_3.isInitialized
              if not L19_3 then
                L19_3 = SendDuiMessage
                L20_3 = L8_3.duiObj
                L21_3 = json
                L21_3 = L21_3.encode
                L22_3 = {}
                L22_3.type = "INIT"
                L22_3.state = true
                L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L21_3(L22_3)
                L19_3(L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                L8_3.isInitialized = true
              end
              L19_3 = L8_3.hintIsOn
              L20_3 = not L12_3
              if L19_3 ~= L20_3 then
                L19_3 = not L12_3
                L8_3.hintIsOn = L19_3
                L19_3 = Point
                L19_3 = L19_3.SetAsHint
                L20_3 = L8_3.duiObj
                L21_3 = not L12_3
                L19_3(L20_3, L21_3)
              end
              L19_3 = L8_3.isClose
              if L19_3 ~= L15_3 then
                L8_3.isClose = L15_3
                if L15_3 then
                  L19_3 = L8_3.options
                  if L19_3 then
                    L19_3 = L19_3.onNearby
                  end
                  if L19_3 then
                    L19_3 = L8_3.options
                    L19_3 = L19_3.onNearby
                    L20_3 = L8_3.id
                    L19_3(L20_3)
                  end
                  L19_3 = L8_3.options
                  if L19_3 then
                    L19_3 = L19_3.removeOnNearby
                  end
                  if L19_3 then
                    L19_3 = Point
                    L19_3 = L19_3.Remove
                    L20_3 = L8_3.id
                    L19_3(L20_3)
                  end
                end
                L19_3 = Point
                L19_3 = L19_3.SetAsClose
                L20_3 = L8_3.duiObj
                L21_3 = L15_3
                L19_3(L20_3, L21_3)
              end
              if L2_3 then
                L19_3 = L8_3.hintIsOn
                if L19_3 then
                  L19_3 = SendDuiMessage
                  L20_3 = L8_3.duiObj
                  L21_3 = json
                  L21_3 = L21_3.encode
                  L22_3 = {}
                  L22_3.type = "SET_DISTANCE"
                  L23_3 = {}
                  L23_3.int = L17_3
                  L23_3.metric = L18_3
                  L22_3.distance = L23_3
                  L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L21_3(L22_3)
                  L19_3(L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                end
              end
            end
          end
        end
      end
      L2_3 = Citizen
      L2_3 = L2_3.Wait
      L3_3 = L0_3
      L2_3(L3_3)
    end
  end
  L0_2(L1_2)
end
L0_1.Init = L1_1
