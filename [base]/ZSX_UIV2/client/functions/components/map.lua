local L0_1, L1_1, L2_1, L3_1, L4_1
do return end
L0_1 = {}
Map = L0_1
L0_1 = Map
L0_1.UseThreads = false
L0_1 = Map
L0_1.Camera = -1
L0_1 = Map
L1_1 = {}
L0_1.CurrentOffsets = L1_1
L0_1 = Map
L0_1.SwitchToCoords = -1
L0_1 = Map
L0_1.SwitchCoordsOriginalDiff = 0
L0_1 = Map
L1_1 = {}
L0_1.Offsets = L1_1
L0_1 = Map
L0_1.ZOffsetOriginalDiff = -1
L0_1 = Map
L0_1.ZOffset = -1
L0_1 = Map
L1_1 = {}
L0_1.Blips = L1_1
L0_1 = Map
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = Wait
  L1_2 = 100
  L0_2(L1_2)
  L0_2 = Threads
  L0_2 = L0_2.Players
  L0_2 = L0_2.Data
  L0_2 = L0_2.ped
  L1_2 = 40.0
  L2_2 = vector3
  L3_2 = -90.0
  L4_2 = 0.0
  L5_2 = 0.0
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = GetEntityCoords
  L4_2 = L0_2
  L3_2 = L3_2(L4_2)
  L4_2 = Map
  L5_2 = CreateCamWithParams
  L6_2 = "DEFAULT_SCRIPTED_FLY_CAMERA"
  L7_2 = L3_2
  L8_2 = L2_2
  L9_2 = L1_2
  L10_2 = false
  L11_2 = 2
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L4_2.Camera = L5_2
  L4_2 = SetFlyCamCoordAndConstrain
  L5_2 = Map
  L5_2 = L5_2.Camera
  L6_2 = L3_2.x
  L7_2 = L3_2.y
  L8_2 = L3_2.z
  L8_2 = L8_2 + 3000.0
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = SetCamActive
  L5_2 = Map
  L5_2 = L5_2.Camera
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SetFlyCamMaxHeight
  L5_2 = Map
  L5_2 = L5_2.Camera
  L6_2 = 15000.0
  L4_2(L5_2, L6_2)
  L4_2 = RenderScriptCams
  L5_2 = true
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = Map
  L4_2.ZOffset = 6000.0
  L4_2 = Map
  L5_2 = Map
  L5_2 = L5_2.ZOffset
  L6_2 = L3_2.z
  L5_2 = L5_2 - L6_2
  L5_2 = L5_2 + 3000.0
  L4_2.ZOffsetOriginalDiff = L5_2
  L4_2 = Map
  L5_2 = vector3
  L6_2 = L3_2.x
  L7_2 = L3_2.y
  L8_2 = 0.0
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2.SwitchToCoords = L5_2
  L4_2 = Map
  L5_2 = {}
  L6_2 = L2_2.x
  L5_2.x = L6_2
  L6_2 = L2_2.y
  L5_2.y = L6_2
  L6_2 = L2_2.z
  L5_2.z = L6_2
  L4_2.CurrentRotation = L5_2
  L4_2 = Map
  L5_2 = {}
  L6_2 = L3_2.x
  L5_2.x = L6_2
  L6_2 = L3_2.y
  L5_2.y = L6_2
  L6_2 = L3_2.z
  L6_2 = L6_2 + 10000.0
  L5_2.z = L6_2
  L4_2.CurrentOffsets = L5_2
  L4_2 = Cameras
  L4_2 = L4_2.CamEaseRot
  L5_2 = Map
  L5_2 = L5_2.Camera
  L6_2 = vector3
  L7_2 = -90.0
  L8_2 = 0.0
  L9_2 = 0.0
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = L2_2
  L8_2 = 2000
  L9_2 = 2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = SetNuiFocus
  L5_2 = true
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = NUI
  L4_2 = L4_2.SendMessage
  L5_2 = "HANDLE_MAP_VIEW"
  L6_2 = {}
  L6_2.state = true
  L4_2(L5_2, L6_2)
  L4_2 = Map
  L4_2 = L4_2.Threads
  L4_2()
  L4_2 = Map
  L4_2.UseThreads = true
  L4_2 = SetTimecycleModifier
  L5_2 = "fogless"
  L4_2(L5_2)
  L4_2 = SetWeatherTypeNow
  L5_2 = "CLEAR"
  L4_2(L5_2)
  L4_2 = ClearWeatherTypePersist
  L4_2()
end
L0_1.Init = L1_1
L0_1 = Map
function L1_1()
  local L0_2, L1_2
  L0_2 = Map
  L0_2 = L0_2.Camera
  if L0_2 then
  end
end
L0_1.Destroy = L1_1
L0_1 = {}
L1_1 = vector3
L2_1 = 2770.1
L3_1 = 4451.18
L4_1 = 48.05
L1_1 = L1_1(L2_1, L3_1, L4_1)
L0_1[1] = L1_1
L1_1 = vector3
L2_1 = -496.83
L3_1 = 5803.09
L4_1 = 36.59
L1_1 = L1_1(L2_1, L3_1, L4_1)
L0_1[2] = L1_1
L1_1 = RegisterNUICallback
L2_1 = "mapChangeCoordinates"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = A0_2.coords
  L2_2 = GetCamCoord
  L3_2 = Map
  L3_2 = L3_2.Camera
  L2_2 = L2_2(L3_2)
  L3_2 = Map
  L4_2 = vector3
  L5_2 = L1_2.x
  L6_2 = L1_2.y
  L7_2 = 0.0
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L3_2.SwitchToCoords = L4_2
  L3_2 = Map
  L4_2 = vector3
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = 0.0
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = vector3
  L6_2 = L1_2.x
  L7_2 = L1_2.y
  L8_2 = 0.0
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2 = L4_2 - L5_2
  L4_2 = #L4_2
  L3_2.SwitchCoordsOriginalDiff = L4_2
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "mapOffsetView"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = Map
  L1_2 = L1_2.Offsets
  L2_2 = A0_2.offset
  L2_2 = L2_2.x
  L2_2 = L2_2 * 3
  L3_2 = 0.0
  L2_2 = L3_2 - L2_2
  L1_2.x = L2_2
  L1_2 = Map
  L1_2 = L1_2.Offsets
  L2_2 = A0_2.offset
  L2_2 = L2_2.y
  L2_2 = L2_2 * 3
  L1_2.y = L2_2
  L1_2 = Map
  L1_2 = L1_2.CurrentOffsets
  L1_2 = L1_2.x
  L2_2 = Map
  L2_2 = L2_2.Offsets
  L2_2 = L2_2.x
  L1_2 = L1_2 + L2_2
  L2_2 = Map
  L2_2 = L2_2.CurrentOffsets
  L2_2 = L2_2.y
  L3_2 = Map
  L3_2 = L3_2.Offsets
  L3_2 = L3_2.y
  L2_2 = L2_2 + L3_2
  L3_2 = Map
  L3_2 = L3_2.Offsets
  L3_2.x = 0.0
  L3_2 = Map
  L3_2 = L3_2.Offsets
  L3_2.y = 0.0
  L3_2 = Map
  L3_2 = L3_2.CurrentOffsets
  L3_2.x = L1_2
  L3_2 = Map
  L3_2 = L3_2.CurrentOffsets
  L3_2.y = L2_2
  L3_2 = Map
  L3_2 = L3_2.InterruptMovement
  L4_2 = L1_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = SetFlyCamCoordAndConstrain
  L4_2 = Map
  L4_2 = L4_2.Camera
  L5_2 = Map
  L5_2 = L5_2.CurrentOffsets
  L5_2 = L5_2.x
  L6_2 = Map
  L6_2 = L6_2.CurrentOffsets
  L6_2 = L6_2.y
  L7_2 = Map
  L7_2 = L7_2.CurrentOffsets
  L7_2 = L7_2.z
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "mapZOffsetView"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Map
  L1_2 = L1_2.Offsets
  L2_2 = Map
  L2_2 = L2_2.CurrentOffsets
  L2_2 = L2_2.z
  L3_2 = A0_2.offset
  L2_2 = L2_2 + L3_2
  L1_2.z = L2_2
  L1_2 = Map
  L1_2 = L1_2.CurrentOffsets
  L2_2 = Map
  L2_2 = L2_2.Offsets
  L2_2 = L2_2.z
  L1_2.z = L2_2
end
L1_1(L2_1, L3_1)
L1_1 = Map
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Map
  L3_2 = vector3
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = 0.0
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2.SwitchToCoords = L3_2
  L2_2 = Map
  L2_2.SwitchCoordsOriginalDiff = -1
end
L1_1.InterruptMovement = L2_1
L1_1 = Map
function L2_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    while true do
      L0_3 = Map
      L0_3 = L0_3.UseThreads
      if not L0_3 then
        break
      end
      L0_3 = SetWeatherTypePersist
      L1_3 = "CLEAR"
      L0_3(L1_3)
      L0_3 = SetWeatherTypeNowPersist
      L1_3 = "CLEAR"
      L0_3(L1_3)
      L0_3 = SetWeatherTypeNow
      L1_3 = "CLEAR"
      L0_3(L1_3)
      L0_3 = SetOverrideWeather
      L1_3 = "CLEAR"
      L0_3(L1_3)
      L0_3 = SetArtificialLightsState
      L1_3 = true
      L0_3(L1_3)
      L0_3 = DisableWorldhorizonRendering
      L1_3 = true
      L0_3(L1_3)
      L0_3 = SetCloudsAlpha
      L1_3 = 0.0
      L0_3(L1_3)
      L0_3 = GetCamCoord
      L1_3 = Map
      L1_3 = L1_3.Camera
      L0_3 = L0_3(L1_3)
      L1_3 = vector3
      L2_3 = L0_3.x
      L3_3 = L0_3.y
      L4_3 = 0.0
      L1_3 = L1_3(L2_3, L3_3, L4_3)
      L2_3 = Map
      L2_3 = L2_3.SwitchToCoords
      L1_3 = L1_3 - L2_3
      L1_3 = #L1_3
      L2_3 = false
      if L1_3 > 1.0 then
        L3_3 = Map
        L3_3 = L3_3.SwitchCoordsOriginalDiff
        if L3_3 > 0 then
          L3_3 = L1_3 - 1.0
          L4_3 = Map
          L4_3 = L4_3.SwitchCoordsOriginalDiff
          L3_3 = L3_3 / L4_3
          L4_3 = 1.0
          L3_3 = L4_3 - L3_3
          L3_3 = 0.25 * L3_3
          L4_3 = {}
          L5_3 = L0_3.x
          L6_3 = Map
          L6_3 = L6_3.SwitchToCoords
          L6_3 = L6_3.x
          L7_3 = L0_3.x
          L6_3 = L6_3 - L7_3
          L6_3 = L3_3 * L6_3
          L5_3 = L5_3 + L6_3
          L4_3.x = L5_3
          L5_3 = L0_3.y
          L6_3 = Map
          L6_3 = L6_3.SwitchToCoords
          L6_3 = L6_3.y
          L7_3 = L0_3.y
          L6_3 = L6_3 - L7_3
          L6_3 = L3_3 * L6_3
          L5_3 = L5_3 + L6_3
          L4_3.y = L5_3
          L5_3 = L0_3.z
          L4_3.z = L5_3
          L2_3 = L4_3
          L4_3 = Map
          L4_3 = L4_3.CurrentOffsets
          L5_3 = L2_3.x
          L4_3.x = L5_3
          L4_3 = Map
          L4_3 = L4_3.CurrentOffsets
          L5_3 = L2_3.y
          L4_3.y = L5_3
        end
      end
      L3_3 = Map
      L3_3 = L3_3.ZOffset
      L4_3 = L0_3.z
      L3_3 = L3_3 - L4_3
      if L3_3 > 1.0 then
        L4_3 = L3_3 - 1.0
        L5_3 = Map
        L5_3 = L5_3.ZOffsetOriginalDiff
        L4_3 = L4_3 / L5_3
        L5_3 = 1.0
        L4_3 = L5_3 - L4_3
        L4_3 = 0.25 * L4_3
        if not L2_3 then
          L5_3 = {}
          L6_3 = L0_3.x
          L5_3.x = L6_3
          L6_3 = L0_3.y
          L5_3.y = L6_3
          L2_3 = L5_3
        end
        L5_3 = L0_3.z
        L6_3 = Map
        L6_3 = L6_3.ZOffset
        L7_3 = L0_3.z
        L6_3 = L6_3 - L7_3
        L6_3 = L4_3 * L6_3
        L5_3 = L5_3 + L6_3
        L2_3.z = L5_3
        L5_3 = Map
        L5_3 = L5_3.CurrentOffsets
        L6_3 = L2_3.z
        L5_3.z = L6_3
      end
      if L2_3 then
        L4_3 = SetFlyCamCoordAndConstrain
        L5_3 = Map
        L5_3 = L5_3.Camera
        L6_3 = L2_3.x
        L7_3 = L2_3.y
        L8_3 = L2_3.z
        L4_3(L5_3, L6_3, L7_3, L8_3)
      end
      L4_3 = Wait
      L5_3 = 0
      L4_3(L5_3)
    end
  end
  L0_2(L1_2)
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    while true do
      L0_3 = Map
      L0_3 = L0_3.UseThreads
      if not L0_3 then
        break
      end
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = pairs
      L2_3 = Blips
      L2_3 = L2_3.List
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
          L11_3 = "zsx_ui_blips_txd"
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
        end
      end
      L1_3 = Wait
      L2_3 = 0
      L1_3(L2_3)
    end
  end
  L0_2(L1_2)
end
L1_1.Threads = L2_1
L1_1 = Map
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = "blip_"
  L5_2 = _Lib
  L5_2 = L5_2.GenerateRandomString
  L6_2 = 10
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2 .. L5_2
  L5_2 = Map
  L5_2 = L5_2.Blips
  L6_2 = {}
  L6_2.id = L4_2
  L6_2.label = A0_2
  L6_2.type = A1_2
  L6_2.icon = A2_2
  L6_2.size = 1.5
  L6_2.coords = A3_2
  L7_2 = {}
  L7_2.x = -100
  L7_2.y = -100
  L6_2.position = L7_2
  L5_2[L4_2] = L6_2
  L5_2 = NUI
  L5_2 = L5_2.SendMessage
  L6_2 = "ADD_BLIP"
  L7_2 = Map
  L7_2 = L7_2.Blips
  L7_2 = L7_2[L4_2]
  L5_2(L6_2, L7_2)
end
L1_1.CreateBlip = L2_1
