local L0_1, L1_1, L2_1
L0_1 = {}
Preview = L0_1
L0_1 = Preview
L0_1.Cam = false
L0_1 = Preview
L0_1.Veh = -1
L0_1 = Preview
L0_1.PreCoords = -1
L0_1 = Preview
L0_1.PreHeading = -1
L0_1 = Preview
L0_1.NotifySerial = -1
L0_1 = Preview
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = Threads
  L0_2 = L0_2.Players
  L0_2 = L0_2.Data
  L0_2 = L0_2.ped
  L1_2 = CameraAngles
  L1_2 = L1_2.Preview
  L1_2 = L1_2.vehicle
  L2_2 = Preview
  L3_2 = GetEntityCoords
  L4_2 = L0_2
  L3_2 = L3_2(L4_2)
  L2_2.PreCoords = L3_2
  L2_2 = Preview
  L3_2 = GetEntityHeading
  L4_2 = L0_2
  L3_2 = L3_2(L4_2)
  L2_2.PreHeading = L3_2
  L2_2 = SetEntityHeading
  L3_2 = L0_2
  L4_2 = L1_2.heading
  L2_2(L3_2, L4_2)
  L2_2 = SetEntityCoords
  L3_2 = L0_2
  L4_2 = L1_2.coords
  L2_2(L3_2, L4_2)
  L2_2 = SpawnVehicle
  L3_2 = L1_2.model
  L4_2 = L1_2.coords
  L5_2 = L1_2.heading
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = Preview
    L1_3.Veh = A0_3
    L1_3 = TaskWarpPedIntoVehicle
    L2_3 = L0_2
    L3_3 = A0_3
    L4_3 = -1
    L1_3(L2_3, L3_3, L4_3)
  end
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = Wait
  L3_2 = 1000
  L2_2(L3_2)
  L2_2 = NUI
  L2_2 = L2_2.SwitchScreen
  L3_2 = "PREVIEW"
  L2_2(L3_2)
  L2_2 = CameraAngles
  L2_2 = L2_2.Preview
  L2_2 = L2_2.cam
  L3_2 = CameraAngles
  L3_2 = L3_2.Preview
  L3_2 = L3_2.focus
  L4_2 = GetOffsetFromEntityInWorldCoords
  L5_2 = L0_2
  L6_2 = L3_2.x
  L7_2 = L3_2.y
  L8_2 = L3_2.z
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = GetOffsetFromEntityInWorldCoords
  L6_2 = L0_2
  L7_2 = L2_2.x
  L8_2 = L2_2.y
  L9_2 = L2_2.z
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L6_2 = Cameras
  L6_2 = L6_2.GetEulerRotationsFromCoords
  L7_2 = L4_2
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = CameraAngles
  L7_2 = L7_2.Preview
  L7_2 = L7_2.fov
  L8_2 = Preview
  L9_2 = CreateCamWithParams
  L10_2 = "DEFAULT_SCRIPTED_CAMERA"
  L11_2 = L5_2
  L12_2 = L6_2
  L13_2 = L7_2
  L14_2 = true
  L15_2 = 2
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L8_2.Cam = L9_2
  L8_2 = RenderScriptCams
  L9_2 = true
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetCamActive
  L9_2 = Preview
  L9_2 = L9_2.Cam
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetCamUseShallowDofMode
  L9_2 = Preview
  L9_2 = L9_2.Cam
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetCamNearDof
  L9_2 = Preview
  L9_2 = L9_2.Cam
  L10_2 = 0.0
  L8_2(L9_2, L10_2)
  L8_2 = SetCamFarDof
  L9_2 = Preview
  L9_2 = L9_2.Cam
  L10_2 = 12.3
  L8_2(L9_2, L10_2)
  L8_2 = SetCamDofStrength
  L9_2 = Preview
  L9_2 = L9_2.Cam
  L10_2 = 3.8
  L8_2(L9_2, L10_2)
  L8_2 = ShakeCam
  L9_2 = Preview
  L9_2 = L9_2.Cam
  L10_2 = "HAND_SHAKE"
  L11_2 = 0.3
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = Minimap
  L8_2 = L8_2.Prepare
  L9_2 = "Basic"
  L8_2(L9_2)
  L8_2 = Preview
  L8_2.IsActive = true
  L8_2 = Citizen
  L8_2 = L8_2.CreateThread
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = DoScreenFadeIn
    L1_3 = 1
    L0_3(L1_3)
    L0_3 = NUI
    L0_3 = L0_3.SendMessage
    L1_3 = "SET_STAGGER_VISIBILITY"
    L2_3 = {}
    L2_3.state = false
    L0_3(L1_3, L2_3)
    L0_3 = Preview
    L1_3 = Notify
    L1_3 = L1_3.Add
    L2_3 = "Preview"
    L3_3 = "You can drag, scale and convert your components!"
    L4_3 = "fas fa-envelope"
    L5_3 = -1
    L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
    L0_3.NotifySerial = L1_3
    while true do
      L0_3 = Preview
      L0_3 = L0_3.Cam
      if false == L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
    end
    L0_3 = Notify
    L0_3 = L0_3.Remove
    L1_3 = Preview
    L1_3 = L1_3.NotifySerial
    L0_3(L1_3)
    L0_3 = Preview
    L0_3.NotifySerial = -1
  end
  L8_2(L9_2)
  L8_2 = Citizen
  L8_2 = L8_2.CreateThread
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    while true do
      L0_3 = Preview
      L0_3 = L0_3.Cam
      if false == L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = GetOffsetFromEntityInWorldCoords
      L1_3 = L0_2
      L2_3 = L3_2.x
      L3_3 = L3_2.y
      L4_3 = L3_2.z
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
      L1_3 = GetOffsetFromEntityInWorldCoords
      L2_3 = L0_2
      L3_3 = L2_2.x
      L4_3 = L2_2.y
      L5_3 = L2_2.z
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
      L2_3 = Cameras
      L2_3 = L2_3.GetEulerRotationsFromCoords
      L3_3 = L0_3
      L4_3 = L1_3
      L2_3 = L2_3(L3_3, L4_3)
      L3_3 = SetCamCoord
      L4_3 = Preview
      L4_3 = L4_3.Cam
      L5_3 = L1_3
      L3_3(L4_3, L5_3)
      L3_3 = SetCamRot
      L4_3 = Preview
      L4_3 = L4_3.Cam
      L5_3 = L2_3
      L6_3 = 2
      L3_3(L4_3, L5_3, L6_3)
      L3_3 = SetUseHiDof
      L3_3()
    end
  end
  L8_2(L9_2)
end
L0_1.CreateCamera = L1_1
L0_1 = Preview
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = Preview
  L1_2 = L1_2.Cam
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^1ERROR^7] Attempted to animate preview camera, but it does not exists?"
    return L1_2(L2_2)
  end
  L1_2 = Threads
  L1_2 = L1_2.Players
  L1_2 = L1_2.Data
  L1_2 = L1_2.ped
  L2_2 = GetOffsetFromEntityInWorldCoords
  L3_2 = L1_2
  L4_2 = 0.0
  L5_2 = 0.3
  L6_2 = 0.0
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L3_2 = GetOffsetFromEntityInWorldCoords
  L4_2 = L1_2
  L5_2 = -5.0
  L6_2 = 5.0
  L7_2 = 0.0
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = Cameras
  L4_2 = L4_2.GetEulerRotationsFromCoords
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = TriggerServerEvent
  L6_2 = "ZSX_UIV2:Buckets:CreatePlayerBucket"
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = Citizen
  L5_2 = L5_2.CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3
    L0_3 = NUI
    L0_3 = L0_3.SendMessage
    L1_3 = "HANDLE_SFX_MESSAGE"
    L2_3 = {}
    L2_3.sfx = "hard_woosh"
    L0_3(L1_3, L2_3)
    L0_3 = Wait
    L1_3 = 250
    L0_3(L1_3)
    L0_3 = NUI
    L0_3 = L0_3.SendMessage
    L1_3 = "HANDLE_BLACK_SCREEN"
    L2_3 = {}
    L2_3.state = true
    L2_3.duration = 2500
    L0_3(L1_3, L2_3)
    L0_3 = NUI
    L0_3 = L0_3.SendMessage
    L1_3 = "SET_PREVIEW_VISIBILITY"
    L2_3 = {}
    L2_3.state = false
    L0_3(L1_3, L2_3)
    L0_3 = Wait
    L1_3 = 2800
    L0_3(L1_3)
    L0_3 = NUI
    L0_3 = L0_3.SendMessage
    L1_3 = "SET_STAGGER_VISIBILITY"
    L2_3 = {}
    L2_3.state = true
    L0_3(L1_3, L2_3)
    L0_3 = NUI
    L0_3 = L0_3.SetRoutePath
    L1_3 = "/"
    L0_3(L1_3)
    L0_3 = DeleteEntity
    L1_3 = Preview
    L1_3 = L1_3.Veh
    L0_3(L1_3)
    L0_3 = RenderScriptCams
    L1_3 = false
    L2_3 = false
    L0_3(L1_3, L2_3)
    L0_3 = SetCamActive
    L1_3 = Preview
    L1_3 = L1_3.Cam
    L2_3 = false
    L0_3(L1_3, L2_3)
    L0_3 = DestroyCam
    L1_3 = Preview
    L1_3 = L1_3.Cam
    L0_3(L1_3)
    L0_3 = DisplayRadar
    L1_3 = false
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = Preview
    L0_3.Cam = false
    L0_3 = NUI
    L0_3 = L0_3.SetFocus
    L1_3 = false
    L2_3 = false
    L0_3(L1_3, L2_3)
    L0_3 = Wait
    L1_3 = 1000
    L0_3(L1_3)
    L0_3 = NUI
    L0_3 = L0_3.SendMessage
    L1_3 = "HANDLE_BLACK_SCREEN"
    L2_3 = {}
    L2_3.state = false
    L2_3.duration = 1
    L0_3(L1_3, L2_3)
    L0_3 = Wait
    L1_3 = 100
    L0_3(L1_3)
    L0_3 = NUI
    L0_3 = L0_3.SendMessage
    L1_3 = "SET_STAGGER_VISIBILITY"
    L2_3 = {}
    L2_3.state = false
    L0_3(L1_3, L2_3)
    L0_3 = SetEntityCoords
    L1_3 = L1_2
    L2_3 = Preview
    L2_3 = L2_3.PreCoords
    L0_3(L1_3, L2_3)
    L0_3 = SetEntityHeading
    L1_3 = L1_2
    L2_3 = Preview
    L2_3 = L2_3.PreHeading
    L0_3(L1_3, L2_3)
    L0_3 = Storage
    L0_3 = L0_3.SetUIAsCreated
    L0_3()
    L0_3 = NUI
    L0_3 = L0_3.SwitchScreen
    L1_3 = "GAME"
    L0_3(L1_3)
    L0_3 = TriggerServerEvent
    L1_3 = "ZSX_UIV2:Buckets:CreatePlayerBucket"
    L2_3 = false
    L0_3(L1_3, L2_3)
  end
  L5_2(L6_2)
  L5_2 = Cameras
  L5_2 = L5_2.CamEaseIn
  L6_2 = Preview
  L6_2 = L6_2.Cam
  L7_2 = {}
  L7_2.coords = L3_2
  L7_2.rot = L4_2
  L8_2 = CameraAngles
  L8_2 = L8_2.Preview
  L8_2 = L8_2.fov
  L7_2.fov = L8_2
  L8_2 = {}
  L9_2 = GetCamCoord
  L10_2 = Preview
  L10_2 = L10_2.Cam
  L9_2 = L9_2(L10_2)
  L8_2.coords = L9_2
  L9_2 = GetCamRot
  L10_2 = Preview
  L10_2 = L10_2.Cam
  L11_2 = 2
  L9_2 = L9_2(L10_2, L11_2)
  L8_2.rot = L9_2
  L9_2 = GetCamFov
  L10_2 = Preview
  L10_2 = L10_2.Cam
  L9_2 = L9_2(L10_2)
  L8_2.fov = L9_2
  L9_2 = 5000
  L10_2 = 2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
end
L0_1.AnimateCameraToEnd = L1_1
L0_1 = RegisterNUICallback
L1_1 = "preview.init"
function L2_1()
  local L0_2, L1_2
  L0_2 = Preview
  L0_2 = L0_2.CreateCamera
  L0_2()
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "preview.end"
function L2_1()
  local L0_2, L1_2
  L0_2 = Preview
  L0_2 = L0_2.AnimateCameraToEnd
  L0_2()
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "preview.goBackToCustomize"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = NUI
  L0_2 = L0_2.SetFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SET_STAGGER_VISIBILITY"
  L2_2 = {}
  L2_2.state = true
  L0_2(L1_2, L2_2)
  L0_2 = Wait
  L1_2 = 650
  L0_2(L1_2)
  L0_2 = DeleteEntity
  L1_2 = Preview
  L1_2 = L1_2.Veh
  L0_2(L1_2)
  L0_2 = DisplayRadar
  L1_2 = false
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = RenderScriptCams
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = SetCamActive
  L1_2 = Preview
  L1_2 = L1_2.Cam
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = DestroyCam
  L1_2 = Preview
  L1_2 = L1_2.Cam
  L0_2(L1_2)
  L0_2 = Preview
  L0_2.Cam = false
  L0_2 = NUI
  L0_2 = L0_2.SetRoutePath
  L1_2 = "/welcome/customize"
  L0_2(L1_2)
  L0_2 = Wait
  L1_2 = 500
  L0_2(L1_2)
  L0_2 = NUI
  L0_2 = L0_2.SetFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SET_STAGGER_VISIBILITY"
  L2_2 = {}
  L2_2.state = false
  L0_2(L1_2, L2_2)
end
L0_1(L1_1, L2_1)
