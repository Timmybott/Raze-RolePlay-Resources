local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = false
L1_1 = nil
L2_1 = "idle"
L3_1 = 0
L4_1 = 0
L5_1 = 0
L6_1 = nil
L7_1 = {}
L7_1.mph = 2.236936
L7_1.kph = 3.6
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = GetEntitySpeed
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = math
  L2_2 = L2_2.floor
  L3_2 = Config
  L4_2 = L3_2.SpeedUnit
  L3_2 = L7_1
  L3_2 = L3_2[L4_2]
  if not L3_2 then
    L3_2 = L7_1.mph
  end
  L3_2 = L1_2 * L3_2
  L2_2 = L2_2(L3_2)
  L3_2 = GetVehicleCurrentGear
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = L1_2
  L5_2 = L2_2
  L6_2 = L3_2
  return L4_2, L5_2, L6_2
end
function L9_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = L1_1
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = {}
  L4_2 = pairs
  L5_2 = Config
  L5_2 = L5_2.SpeedTargets
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    if L9_2 <= A1_2 then
      L10_2 = L1_1.targetsReached
      L10_2 = L10_2[L8_2]
      if not L10_2 then
        L10_2 = #L3_2
        L10_2 = L10_2 + 1
        L11_2 = {}
        L11_2.name = L8_2
        L11_2.time = A0_2
        L3_2[L10_2] = L11_2
        L10_2 = L1_1.targetsReached
        L10_2[L8_2] = A0_2
      end
    end
  end
  L4_2 = pairs
  L5_2 = Config
  L5_2 = L5_2.DistanceTargets
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    if L9_2 <= A2_2 then
      L10_2 = L1_1.targetsReached
      L10_2 = L10_2[L8_2]
      if not L10_2 then
        L10_2 = #L3_2
        L10_2 = L10_2 + 1
        L11_2 = {}
        L11_2.name = L8_2
        L11_2.time = A0_2
        L3_2[L10_2] = L11_2
        L10_2 = L1_1.targetsReached
        L10_2[L8_2] = A0_2
      end
    end
  end
  return L3_2
end
function L10_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L0_1
  if not L0_2 then
    return
  end
  L0_2 = false
  L1_2 = "idle"
  L2_2 = nil
  L1_1 = L2_2
  L2_1 = L1_2
  L0_1 = L0_2
  L0_2 = 0
  L1_2 = 0
  L2_2 = 0
  L3_2 = nil
  L6_1 = L3_2
  L5_1 = L2_2
  L4_1 = L1_2
  L3_1 = L0_2
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.type = false
  L1_2.showTimingTool = false
  L0_2(L1_2)
end
exitTimingTool = L10_1
function L10_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = "idle"
  L2_1 = L0_2
  L0_2 = 0
  L1_2 = 0
  L2_2 = 0
  L3_2 = nil
  L6_1 = L3_2
  L5_1 = L2_2
  L4_1 = L1_2
  L3_1 = L0_2
  L0_2 = L1_1
  if L0_2 then
    L0_2 = {}
    L1_1.targetsReached = L0_2
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  L1_2.resetTimingTool = L2_2
  L0_2(L1_2)
end
resetTimingTool = L10_1
function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L0_1
  if L1_2 then
    return
  end
  L1_2 = cache
  L1_2 = L1_2.vehicle
  if not L1_2 then
    return
  end
  L2_2 = getTrimmedVehiclePlate
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = true
  L0_1 = L3_2
  L3_2 = {}
  L3_2.vehicle = L1_2
  L3_2.plate = L2_2
  L4_2 = {}
  L3_2.targetsReached = L4_2
  L1_1 = L3_2
  L3_2 = SetNuiFocus
  L4_2 = false
  L5_2 = false
  L3_2(L4_2, L5_2)
  if A0_2 then
    openedStandalone = true
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.type = "show-timing-tool"
    L5_2 = Config
    L4_2.config = L5_2
    L5_2 = Locale
    L4_2.locale = L5_2
    L3_2(L4_2)
  else
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.showTimingTool = true
    L5_2 = Config
    L4_2.config = L5_2
    L5_2 = Locale
    L4_2.locale = L5_2
    L3_2(L4_2)
  end
  L3_2 = Citizen
  L3_2 = L3_2.CreateThreadNow
  function L4_2()
    local L0_3, L1_3, L2_3
    while true do
      L0_3 = L0_1
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = Config
      L2_3 = L2_3.TimingToolResetKeyBind
      if not L2_3 then
        L2_3 = 36
      end
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = resetTimingTool
        L0_3()
      end
    end
  end
  L3_2(L4_2)
  L3_2 = Citizen
  L3_2 = L3_2.CreateThreadNow
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    while true do
      L0_3 = L0_1
      if not L0_3 then
        break
      end
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = {}
      L2_3 = L8_1
      L3_3 = L1_2
      L2_3, L3_3, L4_3 = L2_3(L3_3)
      L5_3 = L2_1
      if "recording" == L5_3 then
        L5_3 = GetEntityCoords
        L6_3 = L1_2
        L5_3 = L5_3(L6_3)
        L6_3 = round
        L7_3 = L3_1
        L7_3 = L0_3 - L7_3
        L7_3 = L7_3 / 1000
        L8_3 = 1
        L6_3 = L6_3(L7_3, L8_3)
        L4_1 = L6_3
        L6_3 = L6_1
        L6_3 = L6_3 - L5_3
        L6_3 = #L6_3
        L6_3 = L6_3 * 3.28084
        distanceSinceLastCoords = L6_3
        L6_3 = L5_1
        L7_3 = distanceSinceLastCoords
        L6_3 = L6_3 + L7_3
        L5_1 = L6_3
        L6_1 = L5_3
        L6_3 = L9_1
        L7_3 = L4_1
        L8_3 = L3_3
        L9_3 = L5_1
        L6_3 = L6_3(L7_3, L8_3, L9_3)
        L1_3 = L6_3 or L1_3
        if not L6_3 then
          L6_3 = {}
          L1_3 = L6_3
        end
      else
        L5_3 = 0.5
        if L2_3 >= L5_3 then
          L5_3 = L2_1
          if "ready" == L5_3 then
            L5_3 = "recording"
            L2_1 = L5_3
            L5_3 = L0_3 - 100
            L3_1 = L5_3
            L5_3 = 0
            L5_1 = L5_3
            L5_3 = 0
            L4_1 = L5_3
            L5_3 = GetEntityCoords
            L6_3 = L1_2
            L5_3 = L5_3(L6_3)
            L6_1 = L5_3
          end
        end
        L5_3 = 0.5
        if L2_3 < L5_3 then
          L5_3 = L2_1
          if "stopVehicle" ~= L5_3 then
            L5_3 = L2_1
            if "idle" ~= L5_3 then
              goto lbl_83
            end
          end
          L5_3 = "ready"
          L2_1 = L5_3
          L5_3 = 0
          L4_1 = L5_3
          L3_3 = 0
        end
        ::lbl_83::
        L5_3 = 0.5
        if L2_3 >= L5_3 then
          L5_3 = L2_1
          if "idle" == L5_3 then
            L5_3 = "stopVehicle"
            L2_1 = L5_3
            L5_3 = 0
            L4_1 = L5_3
          end
        end
      end
      L5_3 = L2_1
      if "idle" ~= L5_3 then
        L5_3 = SendNUIMessage
        L6_3 = {}
        L7_3 = {}
        L8_3 = L2_1
        L7_3.status = L8_3
        L8_3 = L4_1
        L7_3.time = L8_3
        L7_3.gear = L4_3
        L7_3.speed = L3_3
        L7_3.targets = L1_3
        L6_3.timingToolData = L7_3
        L5_3(L6_3)
      end
      L5_3 = Wait
      L6_3 = 100
      L5_3(L6_3)
    end
  end
  L3_2(L4_2)
end
initTimingTool = L10_1
L10_1 = RegisterNetEvent
L11_1 = "jg-handling:client:open-timing-tool"
function L12_1()
  local L0_2, L1_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-handling:server:has-timing-tool-access"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    return
  end
  L0_2 = initTimingTool
  L1_2 = true
  L0_2(L1_2)
end
L10_1(L11_1, L12_1)
L10_1 = RegisterNetEvent
L11_1 = "jg-handling:client:close-timing-tool"
function L12_1()
  local L0_2, L1_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-handling:server:has-timing-tool-access"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    return
  end
  L0_2 = exitTimingTool
  L0_2()
end
L10_1(L11_1, L12_1)
L10_1 = Config
L10_1 = L10_1.EnableStandaloneTimingTool
if L10_1 then
  L10_1 = Config
  L10_1 = L10_1.TimingToolOpenCommand
  if L10_1 then
    L10_1 = RegisterCommand
    L11_1 = Config
    L11_1 = L11_1.TimingToolOpenCommand
    function L12_1()
      local L0_2, L1_2
      L0_2 = TriggerEvent
      L1_2 = "jg-handling:client:open-timing-tool"
      L0_2(L1_2)
    end
    L10_1(L11_1, L12_1)
  end
  L10_1 = Config
  L10_1 = L10_1.TimingToolExitCommand
  if L10_1 then
    L10_1 = RegisterCommand
    L11_1 = Config
    L11_1 = L11_1.TimingToolExitCommand
    function L12_1()
      local L0_2, L1_2
      L0_2 = TriggerEvent
      L1_2 = "jg-handling:client:close-timing-tool"
      L0_2(L1_2)
    end
    L10_1(L11_1, L12_1)
  end
end
L10_1 = lib
L10_1 = L10_1.onCache
L11_1 = "vehicle"
function L12_1(A0_2)
  local L1_2
  if not A0_2 then
    L1_2 = L0_1
    if L1_2 then
      L1_2 = exitTimingTool
      L1_2()
    end
  end
end
L10_1(L11_1, L12_1)
