local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
Math = L0_1
L0_1 = Math
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = GetScreenCoordFromWorldCoord
  L2_2 = A0_2.x
  L3_2 = A0_2.y
  L4_2 = A0_2.z
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2, L4_2)
  if not L1_2 then
    L4_2 = Threads
    L4_2 = L4_2.Players
    L4_2 = L4_2.Data
    L4_2 = L4_2.ped
    L5_2 = GetGameplayCamRot
    L6_2 = 2
    L5_2 = L5_2(L6_2)
    L6_2 = RotationToDirection
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    L7_2 = GetGameplayCamCoord
    L7_2 = L7_2()
    L8_2 = vector3
    L9_2 = A0_2.x
    L10_2 = L7_2.x
    L9_2 = L9_2 - L10_2
    L10_2 = A0_2.y
    L11_2 = L7_2.y
    L10_2 = L10_2 - L11_2
    L11_2 = A0_2.z
    L12_2 = L7_2.z
    L11_2 = L11_2 - L12_2
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = vector3
    L10_2 = L8_2.x
    L11_2 = L8_2.y
    L12_2 = L8_2.z
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L11_2 = L9_2
    L10_2 = L9_2.normalize
    L10_2(L11_2)
    L10_2 = math
    L10_2 = L10_2.acos
    L11_2 = L9_2.x
    L12_2 = L6_2.x
    L11_2 = L11_2 * L12_2
    L12_2 = L9_2.y
    L13_2 = L6_2.y
    L12_2 = L12_2 * L13_2
    L11_2 = L11_2 + L12_2
    L12_2 = L9_2.z
    L13_2 = L6_2.z
    L12_2 = L12_2 * L13_2
    L11_2 = L11_2 + L12_2
    L10_2 = L10_2(L11_2)
    L11_2 = math
    L11_2 = L11_2.rad
    L12_2 = 90
    L11_2 = L11_2(L12_2)
    if L10_2 > L11_2 then
      L11_2 = -1.0
      L3_2 = -1.0
      L2_2 = L11_2
    else
      L11_2 = -2.0
      L3_2 = -2.0
      L2_2 = L11_2
    end
  end
  L4_2 = L2_2
  L5_2 = L3_2
  return L4_2, L5_2
end
L0_1.GetScreenCoordFromWorldCoord = L1_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if not A1_2 then
    A1_2 = 1
  end
  L2_2 = 10
  L2_2 = L2_2 ^ A1_2
  L3_2 = math
  L3_2 = L3_2.floor
  L4_2 = A0_2 * L2_2
  L4_2 = L4_2 + 0.5
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 / L2_2
  return L3_2
end
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2 / A1_2
  L2_2 = L2_2 * 100
  return L2_2
end
function L2_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2 / A1_2
  L2_2 = L2_2 * 100
  return L2_2
end
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "%."
  L4_2 = A1_2
  L5_2 = "fvw"
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = L0_1
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "%."
  L4_2 = A1_2
  L5_2 = "fvh"
  L3_2 = L3_2 .. L4_2 .. L5_2
  L4_2 = L0_1
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end
L5_1 = Math
function L6_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  if not A3_2 then
    A3_2 = 1
  end
  L4_2 = {}
  L5_2 = A0_2.x
  if L5_2 then
    L5_2 = L3_1
    L6_2 = L1_1
    L7_2 = A0_2.x
    L8_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = A3_2
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      goto lbl_19
    end
  end
  L5_2 = false
  ::lbl_19::
  L4_2.x = L5_2
  L5_2 = A0_2.y
  if L5_2 then
    L5_2 = L4_1
    L6_2 = L2_1
    L7_2 = A0_2.y
    L8_2 = A2_2
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = A3_2
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      goto lbl_33
    end
  end
  L5_2 = false
  ::lbl_33::
  L4_2.y = L5_2
  return L4_2
end
L5_1.Pixels_to_viewport = L6_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2.x
  L2_2 = A0_2.y
  L3_2 = A0_2.z
  L4_2 = math
  L4_2 = L4_2.sin
  L5_2 = math
  L5_2 = L5_2.rad
  L6_2 = L3_2
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2 = -L4_2
  L5_2 = math
  L5_2 = L5_2.abs
  L6_2 = math
  L6_2 = L6_2.cos
  L7_2 = math
  L7_2 = L7_2.rad
  L8_2 = L1_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2 = L4_2 * L5_2
  L5_2 = math
  L5_2 = L5_2.cos
  L6_2 = math
  L6_2 = L6_2.rad
  L7_2 = L3_2
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L6_2 = math
  L6_2 = L6_2.abs
  L7_2 = math
  L7_2 = L7_2.cos
  L8_2 = math
  L8_2 = L8_2.rad
  L9_2 = L1_2
  L8_2, L9_2, L10_2 = L8_2(L9_2)
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2, L10_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L5_2 = L5_2 * L6_2
  L6_2 = math
  L6_2 = L6_2.sin
  L7_2 = math
  L7_2 = L7_2.rad
  L8_2 = L1_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L7_2 = vector3
  L8_2 = L4_2
  L9_2 = L5_2
  L10_2 = L6_2
  return L7_2(L8_2, L9_2, L10_2)
end
RotationToDirection = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = math
  L2_2 = L2_2.sqrt
  L3_2 = A0_2 - 0.5
  L3_2 = L3_2 ^ 2
  L4_2 = A1_2 - 0.5
  L4_2 = L4_2 ^ 2
  L3_2 = L3_2 + L4_2
  return L2_2(L3_2)
end
calculateDistanceBetweenObjects = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "number" ~= L2_2 or not A0_2 then
    L2_2 = joaat
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    A0_2 = L2_2
  end
  L2_2 = HasModelLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = IsModelInCdimage
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = RequestModel
      L3_2 = A0_2
      L2_2(L3_2)
      while true do
        L2_2 = HasModelLoaded
        L3_2 = A0_2
        L2_2 = L2_2(L3_2)
        if L2_2 then
          break
        end
        L2_2 = Wait
        L3_2 = 0
        L2_2(L3_2)
      end
    end
  end
  if nil ~= A1_2 then
    L2_2 = A1_2
    L2_2()
  end
end
PreRequestModel = L5_1
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = type
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L5_2 = A0_2 or L5_2
  if "number" ~= L5_2 or not A0_2 then
    L5_2 = joaat
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
  end
  L6_2 = type
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  L6_2 = A1_2 or L6_2
  if "vector3" ~= L6_2 or not A1_2 then
    L6_2 = vec
    L7_2 = A1_2.x
    L8_2 = A1_2.y
    L9_2 = A1_2.z
    L6_2 = L6_2(L7_2, L8_2, L9_2)
  end
  if nil == A4_2 then
    L7_2 = true
    A4_2 = L7_2 or A4_2
    if not L7_2 then
    end
  end
  L7_2 = GetEntityCoords
  L8_2 = PlayerPedId
  L8_2, L9_2 = L8_2()
  L7_2 = L7_2(L8_2, L9_2)
  if not L6_2 or not L7_2 then
    return
  end
  L8_2 = CreateThread
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = PreRequestModel
    L1_3 = L5_2
    L0_3(L1_3)
    L0_3 = CreateVehicle
    L1_3 = L5_2
    L2_3 = L6_2.xyz
    L3_3 = A2_2
    L4_3 = A4_2
    L5_3 = true
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
    L1_3 = A4_2
    if L1_3 then
      L1_3 = NetworkGetNetworkIdFromEntity
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = SetNetworkIdCanMigrate
      L3_3 = L1_3
      L4_3 = true
      L2_3(L3_3, L4_3)
      L2_3 = SetEntityAsMissionEntity
      L3_3 = L0_3
      L4_3 = true
      L5_3 = true
      L2_3(L3_3, L4_3, L5_3)
    end
    L1_3 = SetVehicleHasBeenOwnedByPlayer
    L2_3 = L0_3
    L3_3 = true
    L1_3(L2_3, L3_3)
    L1_3 = SetVehicleNeedsToBeHotwired
    L2_3 = L0_3
    L3_3 = false
    L1_3(L2_3, L3_3)
    L1_3 = SetModelAsNoLongerNeeded
    L2_3 = L5_2
    L1_3(L2_3)
    L1_3 = SetVehRadioStation
    L2_3 = L0_3
    L3_3 = "OFF"
    L1_3(L2_3, L3_3)
    L1_3 = RequestCollisionAtCoord
    L2_3 = L6_2.xyz
    L1_3(L2_3)
    while true do
      L1_3 = HasCollisionLoadedAroundEntity
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      if L1_3 then
        break
      end
      L1_3 = Wait
      L2_3 = 0
      L1_3(L2_3)
    end
    L1_3 = A3_2
    if L1_3 then
      L1_3 = A3_2
      L2_3 = L0_3
      L1_3(L2_3)
    end
    return L0_3
  end
  L8_2(L9_2)
end
SpawnVehicle = L5_1
