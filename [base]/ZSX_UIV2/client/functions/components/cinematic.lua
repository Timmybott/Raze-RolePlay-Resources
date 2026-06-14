local L0_1, L1_1, L2_1
L0_1 = {}
Cinematic = L0_1
L0_1 = Cinematic
L0_1.IsCameraModeOn = false
L0_1 = Cinematic
L0_1.CameraID = -1
L0_1 = Cinematic
L0_1.CurrentPresetIndex = 1
L0_1 = Cinematic
L0_1.CameraMovementIsOn = false
L0_1 = Cinematic
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SET_CINEMATIC_MODE_STATE"
  L2_2 = {}
  L2_2.state = true
  L0_2(L1_2, L2_2)
end
L0_1.Init = L1_1
L0_1 = Cinematic
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = Cinematic
  L1_2 = Cinematic
  L1_2 = L1_2.IsCameraModeOn
  L1_2 = not L1_2
  L0_2.IsCameraModeOn = L1_2
  L0_2 = Cinematic
  L0_2 = L0_2.IsCameraModeOn
  if L0_2 then
    L0_2 = Threads
    L0_2 = L0_2.Players
    L0_2 = L0_2.Data
    L0_2 = L0_2.ped
    L1_2 = IsPedInAnyVehicle
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L2_2 = Threads
      L2_2 = L2_2.Vehicles
      L2_2 = L2_2.Data
      L0_2 = L2_2.vehicle
    end
    L2_2 = Config
    L2_2 = L2_2.CinematicPresets
    L2_2 = L2_2[1]
    L2_2 = L2_2.coords
    L3_2 = Config
    L3_2 = L3_2.CinematicPresets
    L3_2 = L3_2[1]
    L3_2 = L3_2.focus
    L3_2 = L3_2.type
    if "playerPed" == L3_2 then
      L3_2 = GetEntityCoords
      L4_2 = L0_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        goto lbl_56
      end
    end
    L3_2 = vector3
    L4_2 = Config
    L4_2 = L4_2.CinematicPresets
    L4_2 = L4_2[1]
    L4_2 = L4_2.focus
    L4_2 = L4_2.x
    L5_2 = Config
    L5_2 = L5_2.CinematicPresets
    L5_2 = L5_2[1]
    L5_2 = L5_2.focus
    L5_2 = L5_2.y
    L6_2 = Config
    L6_2 = L6_2.CinematicPresets
    L6_2 = L6_2[1]
    L6_2 = L6_2.focus
    L6_2 = L6_2.z
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    ::lbl_56::
    L4_2 = Config
    L4_2 = L4_2.CinematicPresets
    L4_2 = L4_2[1]
    L4_2 = L4_2.focus
    L4_2 = L4_2.type
    if "playerPed" ~= L4_2 then
      L4_2 = GetOffsetFromEntityInWorldCoords
      L5_2 = L0_2
      L6_2 = L3_2.x
      L7_2 = L3_2.y
      L8_2 = L3_2.z
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      if L4_2 then
        goto lbl_72
      end
    end
    L4_2 = L3_2
    ::lbl_72::
    L5_2 = GetOffsetFromEntityInWorldCoords
    L6_2 = L0_2
    if L1_2 then
      L7_2 = L2_2.x
      L7_2 = L7_2 + 2.0
      if L7_2 then
        goto lbl_82
      end
    end
    L7_2 = L2_2.x
    ::lbl_82::
    if L1_2 then
      L8_2 = L2_2.y
      L8_2 = L8_2 + 2.0
      if L8_2 then
        goto lbl_90
      end
    end
    L8_2 = L2_2.y
    ::lbl_90::
    L9_2 = L2_2.z
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L6_2 = Cameras
    L6_2 = L6_2.GetEulerRotationsFromCoords
    L7_2 = L4_2
    L8_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = Config
    L7_2 = L7_2.CinematicPresets
    L7_2 = L7_2[1]
    L7_2 = L7_2.fov
    L8_2 = Cinematic
    L9_2 = CreateCamWithParams
    L10_2 = "DEFAULT_SCRIPTED_CAMERA"
    L11_2 = L5_2
    L12_2 = L6_2
    L13_2 = L7_2
    L14_2 = true
    L15_2 = 2
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L8_2.CameraID = L9_2
    L8_2 = RenderScriptCams
    L9_2 = true
    L10_2 = true
    L8_2(L9_2, L10_2)
    L8_2 = SetCamActive
    L9_2 = Cinematic
    L9_2 = L9_2.CameraID
    L10_2 = true
    L8_2(L9_2, L10_2)
    L8_2 = SetCamUseShallowDofMode
    L9_2 = Cinematic
    L9_2 = L9_2.CameraID
    L10_2 = true
    L8_2(L9_2, L10_2)
    L8_2 = SetCamNearDof
    L9_2 = Cinematic
    L9_2 = L9_2.CameraID
    L10_2 = 0.0
    L8_2(L9_2, L10_2)
    L8_2 = SetCamFarDof
    L9_2 = Cinematic
    L9_2 = L9_2.CameraID
    L10_2 = 12.3
    L8_2(L9_2, L10_2)
    L8_2 = SetCamDofStrength
    L9_2 = Cinematic
    L9_2 = L9_2.CameraID
    L10_2 = 3.8
    L8_2(L9_2, L10_2)
    L8_2 = Citizen
    L8_2 = L8_2.CreateThread
    function L9_2()
      local L0_3, L1_3
      while true do
        L0_3 = Cinematic
        L0_3 = L0_3.CameraID
        if -1 == L0_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 0
        L0_3(L1_3)
        L0_3 = SetUseHiDof
        L0_3()
      end
    end
    L8_2(L9_2)
  else
    L0_2 = Cinematic
    L0_2.CurrentPresetIndex = 1
    L0_2 = DestroyCam
    L1_2 = Cinematic
    L1_2 = L1_2.CameraID
    L0_2(L1_2)
    L0_2 = SetCamActive
    L1_2 = Cinematic
    L1_2 = L1_2.CameraID
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = RenderScriptCams
    L1_2 = false
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = Cinematic
    L0_2.CameraID = -1
  end
end
L0_1.ToggleCamera = L1_1
L0_1 = Cinematic
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = Cinematic
  L0_2 = L0_2.CameraID
  if -1 == L0_2 then
    L0_2 = debugPrint
    L1_2 = "Camera is not active!"
    return L0_2(L1_2)
  end
  L0_2 = Cinematic
  L0_2 = L0_2.CameraMovementIsOn
  if L0_2 then
    L0_2 = debugPrint
    L1_2 = "Camera is moving. Wait!"
    return L0_2(L1_2)
  end
  L0_2 = Cinematic
  L1_2 = Cinematic
  L1_2 = L1_2.CurrentPresetIndex
  L1_2 = L1_2 + 1
  L0_2.CurrentPresetIndex = L1_2
  L0_2 = Cinematic
  L0_2 = L0_2.CurrentPresetIndex
  if L0_2 > 2 then
    L0_2 = Cinematic
    L0_2.CurrentPresetIndex = 1
  end
  L0_2 = Threads
  L0_2 = L0_2.Players
  L0_2 = L0_2.Data
  L0_2 = L0_2.ped
  L1_2 = IsPedInAnyVehicle
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = Threads
    L2_2 = L2_2.Vehicles
    L2_2 = L2_2.Data
    L0_2 = L2_2.vehicle
  end
  L2_2 = Config
  L2_2 = L2_2.CinematicPresets
  L3_2 = Cinematic
  L3_2 = L3_2.CurrentPresetIndex
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.coords
  L3_2 = Config
  L3_2 = L3_2.CinematicPresets
  L4_2 = Cinematic
  L4_2 = L4_2.CurrentPresetIndex
  L3_2 = L3_2[L4_2]
  L3_2 = L3_2.focus
  L3_2 = L3_2.type
  if "playerPed" == L3_2 then
    L3_2 = GetEntityCoords
    L4_2 = L0_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_85
    end
  end
  L3_2 = vector3
  L4_2 = Config
  L4_2 = L4_2.CinematicPresets
  L5_2 = Cinematic
  L5_2 = L5_2.CurrentPresetIndex
  L4_2 = L4_2[L5_2]
  L4_2 = L4_2.focus
  L4_2 = L4_2.x
  L5_2 = Config
  L5_2 = L5_2.CinematicPresets
  L6_2 = Cinematic
  L6_2 = L6_2.CurrentPresetIndex
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2.focus
  L5_2 = L5_2.y
  L6_2 = Config
  L6_2 = L6_2.CinematicPresets
  L7_2 = Cinematic
  L7_2 = L7_2.CurrentPresetIndex
  L6_2 = L6_2[L7_2]
  L6_2 = L6_2.focus
  L6_2 = L6_2.z
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  ::lbl_85::
  L4_2 = Config
  L4_2 = L4_2.CinematicPresets
  L5_2 = Cinematic
  L5_2 = L5_2.CurrentPresetIndex
  L4_2 = L4_2[L5_2]
  L4_2 = L4_2.focus
  L4_2 = L4_2.type
  if "playerPed" ~= L4_2 then
    L4_2 = GetOffsetFromEntityInWorldCoords
    L5_2 = L0_2
    L6_2 = L3_2.x
    L7_2 = L3_2.y
    L8_2 = L3_2.z
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    if L4_2 then
      goto lbl_103
    end
  end
  L4_2 = L3_2
  ::lbl_103::
  L5_2 = GetOffsetFromEntityInWorldCoords
  L6_2 = L0_2
  if L1_2 then
    L7_2 = L2_2.x
    L7_2 = L7_2 + 2.0
    if L7_2 then
      goto lbl_113
    end
  end
  L7_2 = L2_2.x
  ::lbl_113::
  if L1_2 then
    L8_2 = L2_2.y
    L8_2 = L8_2 + 2.0
    if L8_2 then
      goto lbl_121
    end
  end
  L8_2 = L2_2.y
  ::lbl_121::
  L9_2 = L2_2.z
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L6_2 = Cameras
  L6_2 = L6_2.GetEulerRotationsFromCoords
  L7_2 = L4_2
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = Config
  L7_2 = L7_2.CinematicPresets
  L8_2 = Cinematic
  L8_2 = L8_2.CurrentPresetIndex
  L7_2 = L7_2[L8_2]
  L7_2 = L7_2.fov
  L8_2 = Cinematic
  L8_2.CameraMovementIsOn = true
  L8_2 = Cameras
  L8_2 = L8_2.AsyncEaseIn
  L9_2 = Cinematic
  L9_2 = L9_2.CameraID
  L10_2 = {}
  L10_2.coords = L5_2
  L10_2.rot = L6_2
  L10_2.fov = L7_2
  L11_2 = {}
  L12_2 = GetCamCoord
  L13_2 = Cinematic
  L13_2 = L13_2.CameraID
  L12_2 = L12_2(L13_2)
  L11_2.coords = L12_2
  L12_2 = GetCamRot
  L13_2 = Cinematic
  L13_2 = L13_2.CameraID
  L14_2 = 2
  L12_2 = L12_2(L13_2, L14_2)
  L11_2.rot = L12_2
  L12_2 = GetCamFov
  L13_2 = Cinematic
  L13_2 = L13_2.CameraID
  L12_2 = L12_2(L13_2)
  L11_2.fov = L12_2
  L12_2 = 650
  L13_2 = 2
  L14_2 = nil
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L8_2 = Cinematic
  L8_2.CameraMovementIsOn = false
end
L0_1.SwitchPreset = L1_1
L0_1 = RegisterCommand
L1_1 = Config
L1_1 = L1_1.Commands
L1_1 = L1_1.cinematic_mode
function L2_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.UseCinematicModeOnKeybind
  if not L0_2 then
    return
  end
  L0_2 = Cinematic
  L0_2 = L0_2.Init
  L0_2()
end
L0_1(L1_1, L2_1)
L0_1 = RegisterCommand
L1_1 = Config
L1_1 = L1_1.Commands
L1_1 = L1_1.cinematic_focus
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = Storage
  L0_2 = L0_2.CurrentScreen
  if "cinematic_mode" == L0_2 then
    L0_2 = NUI
    L0_2 = L0_2.SetFocus
    L1_2 = true
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = NUI
    L0_2 = L0_2.SendMessage
    L1_2 = "SET_CINEMATIC_FOCUS_MODE"
    L2_2 = {}
    L2_2.state = true
    L0_2(L1_2, L2_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "cinematicMode.setFocusOff"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = Storage
  L0_2 = L0_2.CurrentScreen
  if "cinematic_mode" == L0_2 then
    L0_2 = NUI
    L0_2 = L0_2.SetFocus
    L1_2 = false
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = NUI
    L0_2 = L0_2.SendMessage
    L1_2 = "SET_CINEMATIC_FOCUS_MODE"
    L2_2 = {}
    L2_2.state = false
    L0_2(L1_2, L2_2)
    L0_2 = Cinematic
    L0_2.CurrentPresetIndex = 1
    L0_2 = DestroyCam
    L1_2 = Cinematic
    L1_2 = L1_2.CameraID
    L0_2(L1_2)
    L0_2 = SetCamActive
    L1_2 = Cinematic
    L1_2 = L1_2.CameraID
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = RenderScriptCams
    L1_2 = false
    L2_2 = false
    L0_2(L1_2, L2_2)
    L0_2 = Cinematic
    L0_2.CameraID = -1
    L0_2 = Cinematic
    L0_2.IsCameraModeOn = false
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "cinematicMode.toggleCamera"
function L2_1(A0_2)
  local L1_2
  L1_2 = Cinematic
  L1_2 = L1_2.ToggleCamera
  L1_2()
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "cinematicMode.switchPreset"
function L2_1(A0_2)
  local L1_2
  L1_2 = Cinematic
  L1_2 = L1_2.SwitchPreset
  L1_2()
end
L0_1(L1_1, L2_1)
