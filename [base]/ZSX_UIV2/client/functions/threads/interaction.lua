local L0_1, L1_1
L0_1 = Threads
L1_1 = {}
L0_1.Interaction = L1_1
L0_1 = Threads
L0_1 = L0_1.Interaction
L0_1.Use = false
L0_1 = Threads
L0_1 = L0_1.Interaction
L0_1.CurrentlyUsed = false
L0_1 = Threads
L0_1 = L0_1.Interaction
L1_1 = {}
L0_1.Chunked = L1_1
L0_1 = Threads
L0_1 = L0_1.Interaction
function L1_1()
  local L0_2, L1_2
  L0_2 = Threads
  L0_2 = L0_2.Interaction
  L0_2.Use = true
  L0_2 = Threads
  L0_2 = L0_2.Interaction
  L0_2 = L0_2.Chunks
  L0_2()
  L0_2 = Threads
  L0_2 = L0_2.Interaction
  L0_2 = L0_2.Visibility
  L0_2()
  L0_2 = Threads
  L0_2 = L0_2.Interaction
  L0_2 = L0_2.Keys
  L0_2()
end
L0_1.Init = L1_1
L0_1 = Threads
L0_1 = L0_1.Interaction
function L1_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    while true do
      L0_3 = Threads
      L0_3 = L0_3.Interaction
      L0_3 = L0_3.Use
      if not L0_3 then
        break
      end
      L0_3 = Threads
      L0_3 = L0_3.Interaction
      L0_3 = L0_3.CurrentlyUsed
      if L0_3 then
        L0_3 = IsControlJustPressed
        L1_3 = 0
        L2_3 = 85
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = "Q"
          if L0_3 then
            goto lbl_30
          end
        end
        L0_3 = IsControlJustPressed
        L1_3 = 0
        L2_3 = 86
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = "E"
          if L0_3 then
            goto lbl_30
          end
        end
        L0_3 = false
        ::lbl_30::
        if false ~= L0_3 then
          L1_3 = print
          L2_3 = L0_3
          L1_3(L2_3)
        end
        if false ~= L0_3 then
          L1_3 = Interaction
          L1_3 = L1_3.ChangeSelectedElement
          L2_3 = Threads
          L2_3 = L2_3.Interaction
          L2_3 = L2_3.CurrentlyUsed
          L2_3 = L2_3.duiObj
          L3_3 = "E" == L0_3
          L4_3 = Threads
          L4_3 = L4_3.Interaction
          L4_3 = L4_3.CurrentlyUsed
          L4_3 = L4_3.id
          L1_3(L2_3, L3_3, L4_3)
          L1_3 = Threads
          L1_3 = L1_3.Interaction
          L1_3 = L1_3.CurrentlyUsed
          L2_3 = numericKeyPressed
          L1_3.key = L2_3
        else
          L1_3 = Interaction
          L1_3 = L1_3.ProgressVar
          if not (L1_3 > 0) then
            L1_3 = IsDisabledControlPressed
            L2_3 = 0
            L3_3 = 73
            L1_3 = L1_3(L2_3, L3_3)
            if not L1_3 then
              goto lbl_117
            end
          end
          L1_3 = Interaction
          L1_3 = L1_3.UpdateProgress
          L2_3 = Threads
          L2_3 = L2_3.Interaction
          L2_3 = L2_3.CurrentlyUsed
          L2_3 = L2_3.duiObj
          L3_3 = LocalPlayer
          L3_3 = L3_3.state
          L3_3 = L3_3.IsInteractionCooldownActive
          if not L3_3 then
            L3_3 = IsDisabledControlPressed
            L4_3 = 0
            L5_3 = 73
            L3_3 = L3_3(L4_3, L5_3)
            if L3_3 then
              goto lbl_86
            end
          end
          L3_3 = "ON_COOLDOWN"
          ::lbl_86::
          L1_3 = L1_3(L2_3, L3_3)
          if L1_3 then
            L2_3 = Threads
            L2_3 = L2_3.Interaction
            L2_3 = L2_3.CurrentlyUsed
            L2_3 = L2_3.elementData
            if L2_3 then
              L2_3 = Threads
              L2_3 = L2_3.Interaction
              L2_3 = L2_3.CurrentlyUsed
              L2_3 = L2_3.elementData
              L2_3 = L2_3.object
              if L2_3 then
                L2_3 = Threads
                L2_3 = L2_3.Interaction
                L2_3 = L2_3.CurrentlyUsed
                L2_3 = L2_3.elementData
                L2_3 = L2_3.object
                L2_3 = L2_3.onAction
                if L2_3 then
                  L2_3 = Threads
                  L2_3 = L2_3.Interaction
                  L2_3 = L2_3.CurrentlyUsed
                  L2_3 = L2_3.elementData
                  L2_3 = L2_3.object
                  L2_3 = L2_3.onAction
                  L2_3()
                end
              end
            end
          end
        end
        ::lbl_117::
        L1_3 = Wait
        L2_3 = 0
        L1_3(L2_3)
      else
        L0_3 = Wait
        L1_3 = 1000
        L0_3(L1_3)
      end
    end
  end
  L0_2(L1_2)
end
L0_1.Keys = L1_1
L0_1 = Threads
L0_1 = L0_1.Interaction
function L1_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    while true do
      L0_3 = Threads
      L0_3 = L0_3.Interaction
      L0_3 = L0_3.Use
      if not L0_3 then
        break
      end
      L0_3 = pairs
      L1_3 = Interaction
      L1_3 = L1_3.List
      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
        L6_3 = L5_3.coords
        L7_3 = Threads
        L7_3 = L7_3.Players
        L7_3 = L7_3.Data
        L7_3 = L7_3.coords
        L6_3 = L6_3 - L7_3
        L6_3 = #L6_3
        if L6_3 < 30.0 then
          L6_3 = Threads
          L6_3 = L6_3.Interaction
          L6_3 = L6_3.Chunked
          L7_3 = L5_3.id
          L6_3[L7_3] = L5_3
        else
          L6_3 = Threads
          L6_3 = L6_3.Interaction
          L6_3 = L6_3.Chunked
          L7_3 = L5_3.id
          L6_3 = L6_3[L7_3]
          if L6_3 then
            L6_3 = Threads
            L6_3 = L6_3.Interaction
            L6_3 = L6_3.Chunked
            L7_3 = L5_3.id
            L6_3[L7_3] = nil
          end
        end
      end
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
    end
  end
  L0_2(L1_2)
end
L0_1.Chunks = L1_1
L0_1 = Threads
L0_1 = L0_1.Interaction
function L1_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    while true do
      L0_3 = Threads
      L0_3 = L0_3.Interaction
      L0_3 = L0_3.Use
      if not L0_3 then
        break
      end
      L0_3 = {}
      L0_3.element = false
      L0_3.distance = 999999.0
      L1_3 = pairs
      L2_3 = Threads
      L2_3 = L2_3.Interaction
      L2_3 = L2_3.Chunked
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        L7_3 = GetScreenCoordFromWorldCoord
        L8_3 = L6_3.coords
        L8_3 = L8_3.x
        L9_3 = L6_3.coords
        L9_3 = L9_3.y
        L10_3 = L6_3.coords
        L10_3 = L10_3.z
        L7_3, L8_3, L9_3 = L7_3(L8_3, L9_3, L10_3)
        if L7_3 then
          L10_3 = DrawSprite
          L11_3 = "zsx_ui_interaction_txd"
          L12_3 = L6_3.id
          L13_3 = L8_3
          L14_3 = L9_3
          L15_3 = 0.5
          L16_3 = 0.5
          L17_3 = 0.0
          L18_3 = 255
          L19_3 = 255
          L20_3 = 255
          L21_3 = 255
          L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
          L10_3 = calculateDistanceBetweenObjects
          L11_3 = L8_3
          L12_3 = L9_3
          L10_3 = L10_3(L11_3, L12_3)
          L11_3 = L0_3.distance
          if L10_3 < L11_3 then
            L11_3 = L6_3.coords
            L12_3 = Threads
            L12_3 = L12_3.Players
            L12_3 = L12_3.Data
            L12_3 = L12_3.coords
            L11_3 = L11_3 - L12_3
            L11_3 = #L11_3
            L12_3 = L6_3.radius
            if L11_3 < L12_3 then
              L0_3.element = L6_3
              L0_3.distance = L10_3
            end
          end
        end
      end
      L1_3 = L0_3.element
      if L1_3 then
        L1_3 = Threads
        L1_3 = L1_3.Interaction
        L1_3 = L1_3.CurrentlyUsed
        if L1_3 then
          L1_3 = Threads
          L1_3 = L1_3.Interaction
          L1_3 = L1_3.CurrentlyUsed
          L1_3 = L1_3.id
          L2_3 = L0_3.element
          L2_3 = L2_3.id
          if L1_3 ~= L2_3 then
            L1_3 = Interaction
            L1_3 = L1_3.SetAsClose
            L2_3 = L0_3.element
            L2_3 = L2_3.duiObj
            L3_3 = true
            L1_3(L2_3, L3_3)
            L1_3 = Interaction
            L1_3 = L1_3.SetAsClose
            L2_3 = Threads
            L2_3 = L2_3.Interaction
            L2_3 = L2_3.CurrentlyUsed
            L2_3 = L2_3.duiObj
            L3_3 = false
            L1_3(L2_3, L3_3)
            L1_3 = Threads
            L1_3 = L1_3.Interaction
            L2_3 = L0_3.element
            L1_3.CurrentlyUsed = L2_3
          end
        else
          L1_3 = Threads
          L1_3 = L1_3.Interaction
          L2_3 = L0_3.element
          L1_3.CurrentlyUsed = L2_3
          L1_3 = Interaction
          L1_3 = L1_3.SetAsClose
          L2_3 = L0_3.element
          L2_3 = L2_3.duiObj
          L3_3 = true
          L1_3(L2_3, L3_3)
        end
      else
        L1_3 = Threads
        L1_3 = L1_3.Interaction
        L1_3 = L1_3.CurrentlyUsed
        if L1_3 then
          L1_3 = Interaction
          L1_3 = L1_3.SetAsClose
          L2_3 = Threads
          L2_3 = L2_3.Interaction
          L2_3 = L2_3.CurrentlyUsed
          L2_3 = L2_3.duiObj
          L3_3 = false
          L1_3(L2_3, L3_3)
        end
        L1_3 = Threads
        L1_3 = L1_3.Interaction
        L1_3.CurrentlyUsed = false
      end
      L1_3 = Wait
      L2_3 = 0
      L1_3(L2_3)
    end
  end
  L0_2(L1_2)
end
L0_1.Visibility = L1_1
