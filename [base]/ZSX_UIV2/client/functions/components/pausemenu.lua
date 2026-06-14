local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
PauseMenu = L0_1
L0_1 = PauseMenu
L0_1.Cam = false
L0_1 = PauseMenu
L0_1.IsActive = false
L0_1 = PauseMenu
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.UsePauseMenu
  if not L0_2 then
    return
  end
  L0_2 = PauseMenu
  L0_2 = L0_2.Cam
  if false ~= L0_2 then
    return
  end
  L0_2 = LocalPlayer
  L0_2 = L0_2.state
  L0_2 = L0_2.UI_UserData
  if not L0_2 then
    return
  end
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SHOW_PAUSEMENU"
  L2_2 = {}
  L2_2.state = true
  L0_2(L1_2, L2_2)
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = DisplayRadar
  L1_2 = false
  L2_2 = true
  L0_2(L1_2, L2_2)
end
L0_1.Init = L1_1
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = LocalPlayer
  L0_2 = L0_2.state
  L1_2 = L0_2
  L0_2 = L0_2.set
  L2_2 = "UI_DataLoaded"
  L3_2 = false
  L0_2(L1_2, L2_2, L3_2)
end
L0_1(L1_1)
L0_1 = PauseMenu
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SHOW_PAUSEMENU"
  L2_2 = {}
  L2_2.state = false
  L0_2(L1_2, L2_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
end
L0_1.Disable = L1_1
L0_1 = RegisterCommand
L1_1 = "switchhud"
function L2_1()
  local L0_2, L1_2
  L0_2 = NUI
  L0_2 = L0_2.SetUIVisible
  L1_2 = false
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = false
L1_1 = AddStateBagChangeHandler
L2_1 = "UI_UserData"
L3_1 = nil
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = "player:%s"
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = GetPlayerServerId
  L6_2 = PlayerId
  L6_2 = L6_2()
  L5_2, L6_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if A0_2 ~= L3_2 then
    return
  end
  if "UI_UserData" == A1_2 then
    L3_2 = debugPrint
    L4_2 = "[^2UI_DATA^7] Awaiting for NUI to be loaded [/]"
    L3_2(L4_2)
    while true do
      L3_2 = NUI
      L3_2 = L3_2.Loaded
      if L3_2 then
        break
      end
      L3_2 = Wait
      L4_2 = 0
      L3_2(L4_2)
    end
    L3_2 = debugPrint
    L4_2 = "[^2UI_DATA^7] NUI loaded, continue"
    L3_2(L4_2)
    L3_2 = debugPrint
    L4_2 = "[^2UI_DATA^7] Attempting to load player data [/]"
    L3_2(L4_2)
    L3_2 = GetResourceState
    L4_2 = "MugShotBase64"
    L3_2 = L3_2(L4_2)
    if "started" == L3_2 then
      L3_2 = Config
      L3_2 = L3_2.UI
      L3_2 = L3_2.UseMugShotBase64
      if L3_2 then
        L3_2 = debugPrint
        L4_2 = "[^2UI_DATA^7] [MUGSHOT] Mugshot available, creating instance [/]"
        L3_2(L4_2)
        L3_2 = promise
        L4_2 = L3_2
        L3_2 = L3_2.new
        L3_2 = L3_2(L4_2)
        L4_2 = Citizen
        L4_2 = L4_2.CreateThread
        function L5_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
          L0_3 = GetGameTimer
          L0_3 = L0_3()
          L1_3 = L0_3
          L2_3 = L1_3 + 3000
          L3_3 = exports
          L3_3 = L3_3.MugShotBase64
          L4_3 = L3_3
          L3_3 = L3_3.GetMugShotBase64
          L5_3 = PlayerPedId
          L5_3 = L5_3()
          L3_3 = L3_3(L4_3, L5_3)
          L4_3 = debugPrint
          L5_3 = "[^2UI_DATA^7] [MUGSHOT] Awaiting for the instance to be created [/]"
          L4_3(L5_3)
          while L0_3 < L2_3 and not L3_3 do
            L4_3 = GetGameTimer
            L4_3 = L4_3()
            L0_3 = L4_3
            L4_3 = Wait
            L5_3 = 10
            L4_3(L5_3)
          end
          L4_3 = debugPrint
          L5_3 = "[^2UI_DATA^7] [MUGSHOT] Instance created, continue."
          L4_3(L5_3)
          if L3_3 then
            L4_3 = debugPrint
            L5_3 = "[^2UI_DATA^7] [MUGSHOT] Applied mugshot."
            L4_3(L5_3)
            A2_2.mugshot = L3_3
          end
          L4_3 = debugPrint
          L5_3 = "[^2UI_DATA^7] [MUGSHOT] Resolving promise."
          L4_3(L5_3)
          L4_3 = L3_2
          L5_3 = L4_3
          L4_3 = L4_3.resolve
          L4_3(L5_3)
        end
        L4_2(L5_2)
        L4_2 = Citizen
        L4_2 = L4_2.Await
        L5_2 = L3_2
        L4_2(L5_2)
        L4_2 = debugPrint
        L5_2 = "[^2UI_DATA^7] [MUGSHOT] Promise resolved."
        L4_2(L5_2)
      end
    end
    L3_2 = Wait
    L4_2 = 100
    L3_2(L4_2)
    L3_2 = Config
    L3_2 = L3_2.HandleUIVisibilityOnBaseEvents
    if L3_2 then
      L3_2 = debugPrint
      L4_2 = "[^2UI_DATA^7] Applying visibility on UI."
      L3_2(L4_2)
      L3_2 = LocalPlayer
      L3_2 = L3_2.state
      L3_2 = L3_2.UI_DataLoaded
      if not L3_2 then
        L3_2 = LocalPlayer
        L3_2 = L3_2.state
        L4_2 = L3_2
        L3_2 = L3_2.set
        L5_2 = "UI_DataLoaded"
        L6_2 = true
        L3_2(L4_2, L5_2, L6_2)
        L3_2 = NUI
        L3_2 = L3_2.SetDataLoadedStatus
        L4_2 = true
        L3_2(L4_2)
        L3_2 = NUI
        L3_2 = L3_2.SetUIVisible
        L4_2 = true
        L3_2(L4_2)
      end
    end
    L3_2 = debugPrint
    L4_2 = "[^2UI_DATA^7] Setting player data."
    L3_2(L4_2)
    L3_2 = NUI
    L3_2 = L3_2.SendMessage
    L4_2 = "SET_PLAYER_DATA"
    L5_2 = A2_2
    L3_2(L4_2, L5_2)
    L3_2 = Config
    L3_2 = L3_2.PersistentMinimap
    if L3_2 then
      L3_2 = debugPrint
      L4_2 = "[^2UI_DATA^7] Preparing Minimap [/]"
      L3_2(L4_2)
      while true do
        L3_2 = NUI
        L3_2 = L3_2.Loaded
        if L3_2 then
          break
        end
        L3_2 = Minimap
        L3_2 = L3_2.Prepared
        if L3_2 then
          break
        end
        L3_2 = Screen
        L3_2 = L3_2.CurrentScreen
        L3_2 = not L3_2
        if "game" ~= L3_2 then
          break
        end
        L3_2 = Wait
        L4_2 = 0
        L3_2(L4_2)
      end
      L3_2 = debugPrint
      L4_2 = "[^2UI_DATA^7] Minimap prepared."
      L3_2(L4_2)
      L3_2 = DisplayRadar
      L4_2 = true
      L3_2(L4_2)
    end
    L3_2 = debugPrint
    L4_2 = "[^2UI_DATA^7] Returning values back to the UI."
    L3_2(L4_2)
    L3_2 = PauseMenu
    L3_2 = L3_2.Update
    L4_2 = A2_2
    return L3_2(L4_2)
  end
end
L1_1(L2_1, L3_1, L4_1)
L1_1 = RegisterNetEvent
L2_1 = "ZSX_UIV2:Client:UnloadPlayer"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "ZSX_UIV2:Client:UnloadPlayer"
function L3_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = debugPrint
  L1_2 = "[^2UI_DATA^7] Unloading player data."
  L0_2(L1_2)
  L0_2 = LocalPlayer
  L0_2 = L0_2.state
  L0_2 = L0_2.UI_DataLoaded
  if L0_2 then
    L0_2 = LocalPlayer
    L0_2 = L0_2.state
    L1_2 = L0_2
    L0_2 = L0_2.set
    L2_2 = "UI_DataLoaded"
    L3_2 = false
    L0_2(L1_2, L2_2, L3_2)
    L0_2 = NUI
    L0_2 = L0_2.SetDataLoadedStatus
    L1_2 = false
    L0_2(L1_2)
    L0_2 = NUI
    L0_2 = L0_2.SetUIVisible
    L1_2 = false
    L0_2(L1_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "ZSX_UIV2:Client:PlayerInitialized"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "ZSX_UIV2:Client:PlayerInitialized"
function L3_1()
  local L0_2, L1_2
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "ZSX_UI:Player:State:Set"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "ZSX_UI:Player:State:Set"
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = PauseMenu
  L1_2 = L1_2.Update
  L2_2 = A0_2
  L1_2(L2_2)
end
L1_1(L2_1, L3_1)
L1_1 = PauseMenu
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "UPDATE_PAUSEMENU"
  L3_2 = {}
  L3_2.userData = A0_2
  L1_2(L2_2, L3_2)
end
L1_1.Update = L2_1
L1_1 = PauseMenu
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = Threads
  L0_2 = L0_2.Players
  L0_2 = L0_2.Data
  L0_2 = L0_2.ped
  L1_2 = IsPedInAnyVehicle
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L1_2 = 1 == L1_2
  L2_2 = nil
  if L1_2 then
    L3_2 = GetVehicleType
    L4_2 = GetVehiclePedIsIn
    L5_2 = L0_2
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L4_2(L5_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    if "bike" ~= L3_2 then
      L3_2 = GetVehiclePedIsIn
      L4_2 = L0_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    else
      L1_2 = false
      L2_2 = L0_2
    end
  else
    L2_2 = L0_2
  end
  if L1_2 then
    L3_2 = CameraAngles
    L3_2 = L3_2.Vehicle
    L3_2 = L3_2.pause_menu
    L3_2 = L3_2.cam
    if L3_2 then
      goto lbl_43
    end
  end
  L3_2 = CameraAngles
  L3_2 = L3_2.Player
  L3_2 = L3_2.pause_menu
  L3_2 = L3_2.cam
  ::lbl_43::
  if L1_2 then
    L4_2 = CameraAngles
    L4_2 = L4_2.Vehicle
    L4_2 = L4_2.pause_menu
    L4_2 = L4_2.focus
    if L4_2 then
      goto lbl_55
    end
  end
  L4_2 = CameraAngles
  L4_2 = L4_2.Player
  L4_2 = L4_2.pause_menu
  L4_2 = L4_2.focus
  ::lbl_55::
  L5_2 = GetOffsetFromEntityInWorldCoords
  L6_2 = L2_2
  L7_2 = L4_2.x
  L8_2 = L4_2.y
  L9_2 = L4_2.z
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L6_2 = GetOffsetFromEntityInWorldCoords
  L7_2 = L2_2
  L8_2 = L3_2.x
  L9_2 = L3_2.y
  L10_2 = L3_2.z
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L7_2 = Cameras
  L7_2 = L7_2.GetEulerRotationsFromCoords
  L8_2 = L5_2
  L9_2 = L6_2
  L7_2 = L7_2(L8_2, L9_2)
  if L1_2 then
    L8_2 = CameraAngles
    L8_2 = L8_2.Vehicle
    L8_2 = L8_2.pause_menu
    L8_2 = L8_2.fov
    if L8_2 then
      goto lbl_84
    end
  end
  L8_2 = CameraAngles
  L8_2 = L8_2.Player
  L8_2 = L8_2.pause_menu
  L8_2 = L8_2.fov
  ::lbl_84::
  L9_2 = PauseMenu
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
  L10_2 = PauseMenu
  L10_2 = L10_2.Cam
  L11_2 = true
  L9_2(L10_2, L11_2)
  L9_2 = SetCamUseShallowDofMode
  L10_2 = PauseMenu
  L10_2 = L10_2.Cam
  L11_2 = true
  L9_2(L10_2, L11_2)
  L9_2 = SetCamNearDof
  L10_2 = PauseMenu
  L10_2 = L10_2.Cam
  L11_2 = 0.0
  L9_2(L10_2, L11_2)
  L9_2 = SetCamFarDof
  L10_2 = PauseMenu
  L10_2 = L10_2.Cam
  L11_2 = 12.3
  L9_2(L10_2, L11_2)
  L9_2 = SetCamDofStrength
  L10_2 = PauseMenu
  L10_2 = L10_2.Cam
  L11_2 = 20.8
  L9_2(L10_2, L11_2)
  while true do
    L9_2 = DoesCamExist
    L10_2 = PauseMenu
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
      L0_3 = PauseMenu
      L0_3 = L0_3.Cam
      if false == L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = GetOffsetFromEntityInWorldCoords
      L1_3 = L2_2
      L2_3 = L4_2.x
      L3_3 = L4_2.y
      L4_3 = L4_2.z
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
      L1_3 = GetOffsetFromEntityInWorldCoords
      L2_3 = L2_2
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
      L4_3 = PauseMenu
      L4_3 = L4_3.Cam
      L5_3 = L1_3
      L3_3(L4_3, L5_3)
      L3_3 = SetCamRot
      L4_3 = PauseMenu
      L4_3 = L4_3.Cam
      L5_3 = L2_3
      L6_3 = 2
      L3_3(L4_3, L5_3, L6_3)
      L3_3 = SetUseHiDof
      L3_3()
    end
    L0_3 = StopAudioScene
    L1_3 = "DEATH_SCENE"
    L0_3(L1_3)
  end
  L9_2(L10_2)
end
L1_1.CreateCamInstance = L2_1
L1_1 = PauseMenu
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = PauseMenu
  L1_2 = L1_2.Cam
  if not L1_2 then
    return
  end
  L1_2 = DestroyCam
  L2_2 = PauseMenu
  L2_2 = L2_2.Cam
  L1_2(L2_2)
  L1_2 = RenderScriptCams
  L2_2 = false
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = PauseMenu
  L1_2.Cam = false
end
L1_1.DestroyCam = L2_1
L1_1 = RegisterNUICallback
L2_1 = "pausemenu.handleCamera"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.state
  L2_2 = PauseMenu
  L2_2.IsActive = L1_2
  if L1_2 then
    L2_2 = PauseMenu
    L2_2 = L2_2.CreateCamInstance
    L2_2()
  else
    L2_2 = PauseMenu
    L2_2 = L2_2.DestroyCam
    L3_2 = A0_2.force
    L2_2(L3_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "pauseMenu.left"
function L3_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = Config
  L0_2 = L0_2.PersistentMinimap
  if L0_2 then
    L0_2 = Citizen
    L0_2 = L0_2.CreateThread
    function L1_2()
      local L0_3, L1_3
      L0_3 = Wait
      L1_3 = 100
      L0_3(L1_3)
      L0_3 = DisplayRadar
      L1_3 = true
      L0_3(L1_3)
    end
    L0_2(L1_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "pausemenu.disconnect"
function L3_1()
  local L0_2, L1_2
  L0_2 = debugPrint
  L1_2 = "Disconnecting [/]"
  L0_2(L1_2)
  L0_2 = TriggerServerEvent
  L1_2 = "ZSX_UIV2:Quit"
  L0_2(L1_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNUICallback
L2_1 = "pausemenu.handleNav"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2.path
  L2_2 = PauseMenu
  L2_2 = L2_2.SomePartIsStillOpening
  if L2_2 then
    return
  end
  L2_2 = PauseMenu
  L2_2 = L2_2.Disable
  L2_2()
  L2_2 = L1_2.type
  if "game" == L2_2 then
    L2_2 = L1_2.value
    if "map" == L2_2 then
      L2_2 = Citizen
      L2_2 = L2_2.CreateThread
      function L3_2()
        local L0_3, L1_3, L2_3, L3_3
        L0_3 = PauseMenu
        L0_3.SomePartIsStillOpening = true
        L0_3 = NUI
        L0_3 = L0_3.SetUIVisible
        L1_3 = false
        L0_3(L1_3)
        L0_3 = ActivateFrontendMenu
        L1_3 = GetHashKey
        L2_3 = "FE_MENU_VERSION_MP_PAUSE"
        L1_3 = L1_3(L2_3)
        L2_3 = 0
        L3_3 = -1
        L0_3(L1_3, L2_3, L3_3)
        L0_3 = Wait
        L1_3 = 100
        L0_3(L1_3)
        L0_3 = GameMenu
        L0_3 = L0_3.CreateCameraAngle
        L1_3 = "map"
        L0_3(L1_3)
        L0_3 = Citizen
        L0_3 = L0_3.CreateThread
        function L1_3()
          local L0_4, L1_4
          L0_4 = Wait
          L1_4 = 50
          L0_4(L1_4)
          L0_4 = PauseMenuceptionGoDeeper
          L1_4 = 0
          L0_4(L1_4)
        end
        L0_3(L1_3)
        L0_3 = DisplayRadar
        L1_3 = false
        L2_3 = true
        L0_3(L1_3, L2_3)
        L0_3 = StartAudioScene
        L1_3 = "DEATH_SCENE"
        L0_3(L1_3)
        while true do
          L0_3 = Citizen
          L0_3 = L0_3.Wait
          L1_3 = 0
          L0_3(L1_3)
          L0_3 = IsControlJustPressed
          L1_3 = 0
          L2_3 = 200
          L0_3 = L0_3(L1_3, L2_3)
          if not L0_3 then
            L0_3 = IsControlJustPressed
            L1_3 = 0
            L2_3 = 177
            L0_3 = L0_3(L1_3, L2_3)
            if not L0_3 then
              L0_3 = IsControlJustPressed
              L1_3 = 0
              L2_3 = 202
              L0_3 = L0_3(L1_3, L2_3)
              if not L0_3 then
                goto lbl_58
              end
            end
          end
          L0_3 = SetFrontendActive
          L1_3 = 0
          L0_3(L1_3)
          do break end
          ::lbl_58::
        end
        L0_3 = PauseMenu
        L0_3.SomePartIsStillOpening = false
        L0_3 = StopAudioScene
        L1_3 = "DEATH_SCENE"
        L0_3(L1_3)
        L0_3 = NUI
        L0_3 = L0_3.SetUIVisible
        L1_3 = true
        L0_3(L1_3)
        L0_3 = GameMenu
        L0_3 = L0_3.DestroyCamera
        L0_3()
        L0_3 = PauseMenu
        L0_3 = L0_3.Init
        L0_3()
      end
      L2_2(L3_2)
    else
      L2_2 = L1_2.value
      if "settings" == L2_2 then
        L2_2 = Citizen
        L2_2 = L2_2.CreateThread
        function L3_2()
          local L0_3, L1_3, L2_3, L3_3
          L0_3 = PauseMenu
          L0_3.SomePartIsStillOpening = true
          L0_3 = NUI
          L0_3 = L0_3.SetUIVisible
          L1_3 = false
          L0_3(L1_3)
          L0_3 = ActivateFrontendMenu
          L1_3 = GetHashKey
          L2_3 = "FE_MENU_VERSION_LANDING_MENU"
          L1_3 = L1_3(L2_3)
          L2_3 = 0
          L3_3 = -1
          L0_3(L1_3, L2_3, L3_3)
          L0_3 = Wait
          L1_3 = 100
          L0_3(L1_3)
          L0_3 = GameMenu
          L0_3 = L0_3.CreateCameraAngle
          L1_3 = "settings"
          L0_3(L1_3)
          L0_3 = DisplayRadar
          L1_3 = false
          L2_3 = true
          L0_3(L1_3, L2_3)
          L0_3 = StartAudioScene
          L1_3 = "DEATH_SCENE"
          L0_3(L1_3)
          L0_3 = LocalPlayer
          L0_3 = L0_3.state
          L1_3 = L0_3
          L0_3 = L0_3.set
          L2_3 = "UI_InSettings"
          L3_3 = true
          L0_3(L1_3, L2_3, L3_3)
          while true do
            L0_3 = GetCurrentFrontendMenuVersion
            L0_3 = L0_3()
            L1_3 = GetHashKey
            L2_3 = "FE_MENU_VERSION_LANDING_MENU"
            L1_3 = L1_3(L2_3)
            if L0_3 ~= L1_3 then
              break
            end
            L0_3 = Citizen
            L0_3 = L0_3.Wait
            L1_3 = 0
            L0_3(L1_3)
          end
          L0_3 = PauseMenu
          L0_3.SomePartIsStillOpening = false
          L0_3 = LocalPlayer
          L0_3 = L0_3.state
          L1_3 = L0_3
          L0_3 = L0_3.set
          L2_3 = "UI_InSettings"
          L3_3 = false
          L0_3(L1_3, L2_3, L3_3)
          L0_3 = StopAudioScene
          L1_3 = "DEATH_SCENE"
          L0_3(L1_3)
          L0_3 = NUI
          L0_3 = L0_3.SetUIVisible
          L1_3 = true
          L0_3(L1_3)
          L0_3 = GameMenu
          L0_3 = L0_3.DestroyCamera
          L0_3()
          L0_3 = PauseMenu
          L0_3 = L0_3.Init
          L0_3()
        end
        L2_2(L3_2)
      end
    end
  else
    L2_2 = L1_2.type
    if "custom_payload" == L2_2 then
      L2_2 = L1_2.export
      if L2_2 then
        L2_2 = exports
        L3_2 = L1_2.export
        L3_2 = L3_2.resource
        L2_2 = L2_2[L3_2]
        L3_2 = L1_2.export
        L3_2 = L3_2.exportFunction
        L2_2 = L2_2[L3_2]
        L3_2 = L1_2.params
        if L3_2 then
          L3_2 = table
          L3_2 = L3_2.unpack
          L4_2 = L1_2.params
          L3_2 = L3_2(L4_2)
          if L3_2 then
            goto lbl_52
          end
        end
        L3_2 = ""
        ::lbl_52::
        L2_2(L3_2)
      else
        L2_2 = L1_2.event
        if L2_2 then
          L2_2 = L1_2.event
          L2_2 = L2_2.type
          if "client" == L2_2 then
            L2_2 = TriggerEvent
            L3_2 = L1_2.event
            L3_2 = L3_2.name
            L4_2 = L1_2.params
            if L4_2 then
              L4_2 = table
              L4_2 = L4_2.unpack
              L5_2 = L1_2.params
              L4_2 = L4_2(L5_2)
              if L4_2 then
                goto lbl_74
              end
            end
            L4_2 = ""
            ::lbl_74::
            L2_2(L3_2, L4_2)
          else
            L2_2 = L1_2.event
            L2_2 = L2_2.type
            if "server" == L2_2 then
              L2_2 = TriggerServerEvent
              L3_2 = L1_2.event
              L3_2 = L3_2.name
              L4_2 = L1_2.params
              if L4_2 then
                L4_2 = table
                L4_2 = L4_2.unpack
                L5_2 = L1_2.params
                L4_2 = L4_2(L5_2)
                if L4_2 then
                  goto lbl_93
                end
              end
              L4_2 = ""
              ::lbl_93::
              L2_2(L3_2, L4_2)
            end
          end
        end
      end
    end
  end
end
L1_1(L2_1, L3_1)
L1_1 = RegisterCommand
L2_1 = "pause_menu"
function L3_1()
  local L0_2, L1_2
  L0_2 = Storage
  L0_2 = L0_2.CurrentScreen
  if "cinematic_mode" == L0_2 then
    return
  end
  L0_2 = Workers
  L0_2 = L0_2.PauseMenu
  L0_2 = L0_2.PreventOpen
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = debugPrint
    L1_2 = "[^1PREVENT^7] Can not open up pause menu. Something else is open!"
    return L0_2(L1_2)
  end
  L0_2 = PauseMenu
  L0_2 = L0_2.Init
  L0_2()
end
L1_1(L2_1, L3_1)
L1_1 = RegisterKeyMapping
L2_1 = "pause_menu"
L3_1 = "Opens Pause Menu"
L4_1 = "KEYBOARD"
L5_1 = "ESCAPE"
L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = Config
L1_1 = L1_1.UI
L1_1 = L1_1.UsePauseMenu
if L1_1 then
  L1_1 = Citizen
  L1_1 = L1_1.CreateThread
  function L2_1()
    local L0_2, L1_2
    while true do
      L0_2 = SetPauseMenuActive
      L1_2 = false
      L0_2(L1_2)
      L0_2 = Wait
      L1_2 = Config
      L1_2 = L1_2.DisablePauseMenuInterval
      if not L1_2 then
        L1_2 = 5
      end
      L0_2(L1_2)
    end
  end
  L1_1(L2_1)
else
  L1_1 = Citizen
  L1_1 = L1_1.CreateThread
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2
    L0_2 = false
    while true do
      L1_2 = IsPauseMenuActive
      L1_2 = L1_2()
      if L1_2 ~= L0_2 then
        L2_2 = NUI
        L2_2 = L2_2.SetRoutePath
        if L1_2 then
          L3_2 = "/blank"
          if L3_2 then
            goto lbl_14
          end
        end
        L3_2 = "/"
        ::lbl_14::
        L2_2(L3_2)
        L0_2 = L1_2
      end
      L2_2 = Wait
      L3_2 = 1000
      L2_2(L3_2)
    end
  end
  L1_1(L2_1)
end
L1_1 = Config
L1_1 = L1_1.UI
L1_1 = L1_1.UseListenerForMumble
if L1_1 then
  L1_1 = Config
  L1_1 = L1_1.Voice
  L1_1 = L1_1.DoesSaltyChatExists
  if not L1_1 then
    L1_1 = Citizen
    L1_1 = L1_1.CreateThread
    function L2_1()
      local L0_2, L1_2, L2_2, L3_2
      while true do
        L0_2 = MumbleIsPlayerTalking
        L1_2 = Threads
        L1_2 = L1_2.Players
        L1_2 = L1_2.Data
        L1_2 = L1_2.player
        L0_2 = L0_2(L1_2)
        L0_2 = 1 == L0_2
        L1_2 = playerTalkingLastState
        if L1_2 ~= L0_2 then
          L1_2 = Config
          L1_2 = L1_2.UI
          L1_2 = L1_2.Use3DVoiceIndicator
          if not L1_2 then
            if L0_2 then
              L1_2 = TopContent
              L1_2 = L1_2.SetScreen
              L2_2 = "voice"
              L1_2(L2_2)
            end
            L1_2 = TopContent
            L1_2 = L1_2.Init
            L2_2 = L0_2
            L1_2(L2_2)
          else
            L1_2 = NUI
            L1_2 = L1_2.SendMessage
            L2_2 = "SET_VOICE_INDICATOR_PLAYER_TALKING"
            L3_2 = {}
            L3_2.state = L0_2
            L1_2(L2_2, L3_2)
          end
          playerTalkingLastState = L0_2
        end
        L1_2 = Wait
        L2_2 = 300
        L1_2(L2_2)
      end
    end
    L1_1(L2_1)
  end
end
