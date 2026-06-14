local L0_1, L1_1, L2_1, L3_1
L0_1 = Threads
L1_1 = {}
L0_1.Hud = L1_1
L0_1 = Threads
L0_1 = L0_1.Hud
L0_1.Use = false
L0_1 = Threads
L0_1 = L0_1.Hud
L1_1 = Config
L1_1 = L1_1.UI
L1_1 = L1_1.Preset
L1_1 = L1_1.hud
L1_1 = L1_1.refreshInterval
L0_1.RefreshInterval = L1_1
L0_1 = Threads
L0_1 = L0_1.Hud
L1_1 = {}
L0_1.Data = L1_1
L0_1 = {}
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if nil == L2_2 then
    L3_2 = L0_1
    L3_2[A0_2] = A1_2
    L3_2 = true
    return L3_2
  end
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if "number" == L3_2 then
    L3_2 = type
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if "number" == L3_2 then
      L3_2 = math
      L3_2 = L3_2.abs
      L4_2 = A1_2 - L2_2
      L3_2 = L3_2(L4_2)
      if L3_2 > 1 then
        L3_2 = L0_1
        L3_2[A0_2] = A1_2
        L3_2 = true
        return L3_2
      end
      L3_2 = false
      return L3_2
  end
  else
    if L2_2 ~= A1_2 then
      L3_2 = L0_1
      L3_2[A0_2] = A1_2
      L3_2 = true
      return L3_2
    end
    L3_2 = false
    return L3_2
  end
end
L2_1 = Threads
L2_1 = L2_1.Hud
function L3_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.Hud
  L0_2 = L0_2.Use
  if not L0_2 then
    return
  end
  L0_2 = Threads
  L0_2 = L0_2.Hud
  L0_2.Use = true
  L0_2 = FrameworkSelected
  if "QBCore" ~= L0_2 then
    L0_2 = FrameworkSelected
    if "QBOX" ~= L0_2 then
      goto lbl_29
    end
  end
  while true do
    L0_2 = json
    L0_2 = L0_2.encode
    L1_2 = QBCore
    L1_2 = L1_2.Functions
    L1_2 = L1_2.GetPlayerData
    L1_2 = L1_2()
    L0_2 = L0_2(L1_2)
    if "[]" ~= L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
  end
  ::lbl_29::
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L0_3 = debugPrint
    L1_3 = "[^6THREADS^7] HUD interval set to ^2"
    L2_3 = math
    L2_3 = L2_3.floor
    L3_3 = Threads
    L3_3 = L3_3.Hud
    L3_3 = L3_3.RefreshInterval
    L3_3 = L3_3.current
    L2_3 = L2_3(L3_3)
    L3_3 = "ms^7"
    L1_3 = L1_3 .. L2_3 .. L3_3
    L0_3(L1_3)
    while true do
      L0_3 = Threads
      L0_3 = L0_3.Hud
      L0_3 = L0_3.Use
      if not L0_3 then
        break
      end
      L0_3 = pairs
      L1_3 = Config
      L1_3 = L1_3.Hud
      L1_3 = L1_3.Status
      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
        L6_3 = L5_3.get
        if L6_3 then
          L6_3 = pcall
          L7_3 = L5_3.get
          L6_3, L7_3 = L6_3(L7_3)
          if L6_3 and nil ~= L7_3 then
            L8_3 = L1_1
            L9_3 = L4_3
            L10_3 = L7_3
            L8_3 = L8_3(L9_3, L10_3)
            if L8_3 then
              L8_3 = Hud
              L8_3 = L8_3.UpdateKeyValue
              L9_3 = L5_3.name
              L10_3 = L7_3
              L8_3(L9_3, L10_3)
            end
          end
        end
      end
      L0_3 = Wait
      L1_3 = math
      L1_3 = L1_3.floor
      L2_3 = Threads
      L2_3 = L2_3.Hud
      L2_3 = L2_3.RefreshInterval
      L2_3 = L2_3.current
      L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L1_3(L2_3)
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    end
  end
  L0_2(L1_2)
end
L2_1.Init = L3_1
