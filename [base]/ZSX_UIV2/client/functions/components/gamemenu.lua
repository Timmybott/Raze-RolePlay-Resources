local L0_1, L1_1, L2_1
L0_1 = {}
GameMenu = L0_1
L0_1 = GameMenu
L0_1.Cam = false
L0_1 = GameMenu
L0_1.IsActive = false
L0_1 = GameMenu
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if not A0_2 then
    A0_2 = "game_menu"
  end
  L1_2 = Threads
  L1_2 = L1_2.Players
  L1_2 = L1_2.Data
  L1_2 = L1_2.ped
  L2_2 = IsPedInAnyVehicle
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L2_2 = 1 == L2_2
  if L2_2 then
    L3_2 = GetVehicleType
    L4_2 = GetVehiclePedIsIn
    L5_2 = L1_2
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L4_2(L5_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    if "bike" == L3_2 then
      L3_2 = Threads
      L3_2 = L3_2.Players
      L3_2 = L3_2.Data
      L1_2 = L3_2.ped
    else
      L3_2 = GetVehiclePedIsIn
      L4_2 = L1_2
      L3_2 = L3_2(L4_2)
      L1_2 = L3_2
    end
  end
  L3_2 = CameraAngles
  if L2_2 then
    L4_2 = "Vehicle"
    if L4_2 then
      goto lbl_40
    end
  end
  L4_2 = "Player"
  ::lbl_40::
  L3_2 = L3_2[L4_2]
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2.cam
  L4_2 = CameraAngles
  if L2_2 then
    L5_2 = "Vehicle"
    if L5_2 then
      goto lbl_50
    end
  end
  L5_2 = "Player"
  ::lbl_50::
  L4_2 = L4_2[L5_2]
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2.focus
  L5_2 = GetOffsetFromEntityInWorldCoords
  L6_2 = L1_2
  L7_2 = L4_2.x
  L8_2 = L4_2.y
  L9_2 = L4_2.z
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L6_2 = GetOffsetFromEntityInWorldCoords
  L7_2 = L1_2
  L8_2 = L3_2.x
  L9_2 = L3_2.y
  L10_2 = L3_2.z
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L7_2 = Cameras
  L7_2 = L7_2.GetEulerRotationsFromCoords
  L8_2 = L5_2
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = CameraAngles
  if L2_2 then
    L9_2 = "Vehicle"
    if L9_2 then
      goto lbl_77
    end
  end
  L9_2 = "Player"
  ::lbl_77::
  L8_2 = L8_2[L9_2]
  L8_2 = L8_2[A0_2]
  L8_2 = L8_2.fov
  L9_2 = GameMenu
  L10_2 = CreateCamWithParams
  L11_2 = "DEFAULT_SCRIPTED_CAMERA"
  L12_2 = L6_2
  L13_2 = L7_2
  L14_2 = L8_2
  L15_2 = true
  L16_2 = 2
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L9_2.Cam = L10_2
  L9_2 = RenderScriptCams
  L10_2 = true
  L11_2 = true
  L9_2(L10_2, L11_2)
  L9_2 = SetCamActive
  L10_2 = GameMenu
  L10_2 = L10_2.Cam
  L11_2 = true
  L9_2(L10_2, L11_2)
  L9_2 = SetCamUseShallowDofMode
  L10_2 = GameMenu
  L10_2 = L10_2.Cam
  L11_2 = true
  L9_2(L10_2, L11_2)
  L9_2 = SetCamNearDof
  L10_2 = GameMenu
  L10_2 = L10_2.Cam
  L11_2 = 0.0
  L9_2(L10_2, L11_2)
  L9_2 = SetCamFarDof
  L10_2 = GameMenu
  L10_2 = L10_2.Cam
  L11_2 = 12.3
  L9_2(L10_2, L11_2)
  L9_2 = SetCamDofStrength
  L10_2 = GameMenu
  L10_2 = L10_2.Cam
  L11_2 = 3.8
  L9_2(L10_2, L11_2)
  L9_2 = GameMenu
  L9_2.IsActive = true
  while true do
    L9_2 = DoesCamExist
    L10_2 = GameMenu
    L10_2 = L10_2.Cam
    L9_2 = L9_2(L10_2)
    if L9_2 then
      break
    end
    L9_2 = Wait
    L10_2 = 0
    L9_2(L10_2)
  end
  L9_2 = Citizen
  L9_2 = L9_2.CreateThread
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = StartAudioScene
    L1_3 = "DEATH_SCENE"
    L0_3(L1_3)
    while true do
      L0_3 = GameMenu
      L0_3 = L0_3.Cam
      if false == L0_3 then
        break
      end
      L0_3 = SetUseHiDof
      L0_3()
      L0_3 = GetOffsetFromEntityInWorldCoords
      L1_3 = L1_2
      L2_3 = L4_2.x
      L3_3 = L4_2.y
      L4_3 = L4_2.z
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
      L1_3 = GetOffsetFromEntityInWorldCoords
      L2_3 = L1_2
      L3_3 = L3_2.x
      L4_3 = L3_2.y
      L5_3 = L3_2.z
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
      L2_3 = Cameras
      L2_3 = L2_3.GetEulerRotationsFromCoords
      L3_3 = L0_3
      L4_3 = L1_3
      L2_3 = L2_3(L3_3, L4_3)
      L3_3 = SetCamCoord
      L4_3 = GameMenu
      L4_3 = L4_3.Cam
      L5_3 = L1_3
      L3_3(L4_3, L5_3)
      L3_3 = SetCamRot
      L4_3 = GameMenu
      L4_3 = L4_3.Cam
      L5_3 = L2_3
      L6_3 = 2
      L3_3(L4_3, L5_3, L6_3)
      L3_3 = Wait
      L4_3 = 0
      L3_3(L4_3)
    end
    L0_3 = StopAudioScene
    L1_3 = "DEATH_SCENE"
    L0_3(L1_3)
  end
  L9_2(L10_2)
end
L0_1.CreateCameraAngle = L1_1
L0_1 = GameMenu
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = GameMenu
  L0_2 = L0_2.Cam
  if not L0_2 then
    return
  end
  L0_2 = DestroyCam
  L1_2 = GameMenu
  L1_2 = L1_2.Cam
  L0_2(L1_2)
  L0_2 = RenderScriptCams
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = GameMenu
  L0_2.Cam = false
  L0_2 = GameMenu
  L0_2.IsActive = false
end
L0_1.DestroyCamera = L1_1
L0_1 = RegisterNUICallback
L1_1 = "gamemenu.handleCamera"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.state
  if L1_2 then
    L2_2 = GameMenu
    L2_2 = L2_2.CreateCameraAngle
    L2_2()
  else
    L2_2 = GameMenu
    L2_2 = L2_2.DestroyCamera
    L2_2()
  end
end
L0_1(L1_1, L2_1)
L0_1 = GameMenu
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = DisplayRadar
  L1_2 = false
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = GameMenu
  L0_2 = L0_2.CreateCameraAngle
  L0_2()
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SHOW_SETTINGS"
  L2_2 = {}
  L2_2.state = true
  L0_2(L1_2, L2_2)
  L0_2 = NUI
  L0_2 = L0_2.SetFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
end
L0_1.Init = L1_1
L0_1 = GameMenu
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = GameMenu
  L0_2 = L0_2.DestroyCamera
  L0_2()
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SHOW_SETTINGS"
  L2_2 = {}
  L2_2.state = false
  L0_2(L1_2, L2_2)
  L0_2 = NUI
  L0_2 = L0_2.SetFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
end
L0_1.ForceClose = L1_1
