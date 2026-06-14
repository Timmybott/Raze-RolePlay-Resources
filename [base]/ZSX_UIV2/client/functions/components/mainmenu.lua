local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
MainMenu = L0_1
L0_1 = MainMenu
L1_1 = {}
L1_1.vehicle = -1
L1_1.cam = -1
L0_1.Data = L1_1
L0_1 = false
L1_1 = MainMenu
function L2_1()
  local L0_2, L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = LocalPlayer
    L0_3 = L0_3.state
    L0_3 = L0_3.UIV2_Preloaded
    if L0_3 then
      while true do
        L0_3 = NUI
        L0_3 = L0_3.Loaded
        if L0_3 then
          L0_3 = Storage
          L0_3 = L0_3.HasBeenSent
          if L0_3 then
            break
          end
        end
        L0_3 = Wait
        L1_3 = 300
        L0_3(L1_3)
      end
      L0_3 = NUI
      L0_3 = L0_3.SetRoutePath
      L1_3 = "/blank"
      L0_3(L1_3)
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
      L0_3 = Storage
      L0_3 = L0_3.SetUIAsCreated
      L0_3()
      L0_3 = NUI
      L0_3 = L0_3.SwitchScreen
      L1_3 = "GAME"
      L0_3(L1_3)
      L0_3 = debugPrint
      L1_3 = "Player was already preloaded, skipping!"
      return L0_3(L1_3)
    end
    L0_3 = SetPlayerInvincible
    L1_3 = PlayerId
    L1_3 = L1_3()
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = DoScreenFadeOut
    L1_3 = 1
    L0_3(L1_3)
    L0_3 = Wait
    L1_3 = 1000
    L0_3(L1_3)
    while true do
      L0_3 = NUI
      L0_3 = L0_3.Loaded
      if L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
    L0_3 = NUI
    L0_3 = L0_3.SendMessage
    L1_3 = "SET_PLAYER_STEAM_NAME"
    L2_3 = {}
    L3_3 = GetPlayerName
    L4_3 = PlayerId
    L4_3 = L4_3()
    L3_3 = L3_3(L4_3)
    L2_3.name = L3_3
    L0_3(L1_3, L2_3)
    L0_3 = Config
    L1_3 = "BringPlayerAfterWelcomeScreenToInitialCoords"
    L0_3 = L0_3[L1_3]
    if L0_3 then
      L0_3 = GetEntityCoords
      L1_3 = PlayerPedId
      L1_3, L2_3, L3_3, L4_3 = L1_3()
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_1 = L0_3
    end
    L0_3 = Config
    L0_3 = L0_3.UI
    L0_3 = L0_3.UseWelcomeScreen
    if L0_3 then
      L0_3 = MainMenu
      L0_3 = L0_3.Init
      L0_3()
    else
      L0_3 = Wait
      L1_3 = 2000
      L0_3(L1_3)
      L0_3 = Config
      L0_3 = L0_3.AwaitShutdownLoadingScreen
      if L0_3 then
        L0_3 = debugPrint
        L1_3 = "Awaiting loading screen [/]"
        L0_3(L1_3)
        while true do
          L0_3 = GetIsLoadingScreenActive
          L0_3 = L0_3()
          if not L0_3 then
            break
          end
          L0_3 = Wait
          L1_3 = 1
          L0_3(L1_3)
        end
        L0_3 = debugPrint
        L1_3 = "Loading screen disabled, continue."
        L0_3(L1_3)
      else
        L0_3 = ShutdownLoadingScreen
        L0_3()
        L0_3 = ShutdownLoadingScreenNui
        L0_3()
        L0_3 = debugPrint
        L1_3 = "Shutting down loading screen [/]"
        L0_3(L1_3)
      end
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
      L0_3 = Config
      L0_3 = L0_3.UI
      L0_3 = L0_3.UseConfiguration
      if L0_3 then
        L0_3 = LocalPlayer
        L0_3 = L0_3.state
        L1_3 = L0_3
        L0_3 = L0_3.set
        L2_3 = "UIV2_Preloaded"
        L3_3 = true
        L0_3(L1_3, L2_3, L3_3)
        L0_3 = Storage
        L0_3 = L0_3.Data
        L0_3 = L0_3.UIConfigured
        if not L0_3 then
          L0_3 = DisplayRadar
          L1_3 = false
          L2_3 = true
          L3_3 = true
          L0_3(L1_3, L2_3, L3_3)
          L0_3 = NUI
          L0_3 = L0_3.WelcomePreload
          L0_3()
        else
          L0_3 = NUI
          L0_3 = L0_3.SwitchScreen
          L1_3 = "GAME"
          L0_3(L1_3)
          L0_3 = Storage
          L0_3 = L0_3.SetUIAsCreated
          L0_3()
        end
      else
        L0_3 = LocalPlayer
        L0_3 = L0_3.state
        L1_3 = L0_3
        L0_3 = L0_3.set
        L2_3 = "UIV2_Preloaded"
        L3_3 = true
        L0_3(L1_3, L2_3, L3_3)
        L0_3 = NUI
        L0_3 = L0_3.SwitchScreen
        L1_3 = "GAME"
        L0_3(L1_3)
        L0_3 = Storage
        L0_3 = L0_3.SetUIAsCreated
        L0_3()
      end
      L0_3 = debugPrint
      L1_3 = "Awaiting for UI to be created"
      L0_3(L1_3)
      while true do
        L0_3 = Storage
        L0_3 = L0_3.Data
        L0_3 = L0_3.createdUI
        if L0_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 100
        L0_3(L1_3)
      end
      L0_3 = Config
      L1_3 = "BringPlayerAfterWelcomeScreenToInitialCoords"
      L0_3 = L0_3[L1_3]
      if L0_3 then
        L0_3 = L0_1
        if L0_3 then
          L0_3 = SetEntityCoords
          L1_3 = PlayerPedId
          L1_3 = L1_3()
          L2_3 = L0_1
          L0_3(L1_3, L2_3)
        end
      end
      L0_3 = debugPrint
      L1_3 = "UI Created!"
      L0_3(L1_3)
      L0_3 = FreezeEntityPosition
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = false
      L0_3(L1_3, L2_3)
      L0_3 = SetPlayerInvincible
      L1_3 = PlayerId
      L1_3 = L1_3()
      L2_3 = false
      L0_3(L1_3, L2_3)
      L0_3 = TriggerServerEvent
      L1_3 = "ZSX_UIV2:Buckets:CreatePlayerBucket"
      L2_3 = false
      L0_3(L1_3, L2_3)
      L0_3 = GetResourceState
      L1_3 = ZSX_Multicharacter
      L0_3 = L0_3(L1_3)
      if "started" == L0_3 then
        L0_3 = debugPrint
        L1_3 = "Found ZSX_Multicharacter! Initializing [/]"
        L0_3(L1_3)
        L0_3 = exports
        L1_3 = ZSX_Multicharacter
        L0_3 = L0_3[L1_3]
        L1_3 = L0_3
        L0_3 = L0_3.Initialize
        L0_3(L1_3)
      else
        L0_3 = Workers
        L0_3 = L0_3.MainMenu
        L0_3 = L0_3.InitializeAfterConfigurationEnd
        L0_3()
      end
    end
  end
  L0_2(L1_2)
end
L1_1.Handler = L2_1
L1_1 = RegisterCommand
L2_1 = "fade1"
function L3_1()
  local L0_2, L1_2
  L0_2 = DoScreenFadeIn
  L1_2 = 1
  L0_2(L1_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterCommand
L2_1 = "fade2"
function L3_1()
  local L0_2, L1_2
  L0_2 = DoScreenFadeOut
  L1_2 = 1
  L0_2(L1_2)
end
L1_1(L2_1, L3_1)
L1_1 = MainMenu
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = Config
  L0_2 = L0_2.Scenes
  L1_2 = math
  L1_2 = L1_2.random
  L2_2 = 1
  L3_2 = Config
  L3_2 = L3_2.Scenes
  L3_2 = #L3_2
  L1_2 = L1_2(L2_2, L3_2)
  L0_2 = L0_2[L1_2]
  L1_2 = L0_2.dofAdjust
  L2_2 = TriggerServerEvent
  L3_2 = "ZSX_UIV2:Buckets:CreatePlayerBucket"
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = vector3
  L3_2 = L0_2.camCoords
  L3_2 = L3_2.x
  L4_2 = L0_2.camCoords
  L4_2 = L4_2.y
  L5_2 = L0_2.playerZIndex
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = SetEntityCoords
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityVisible
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = FreezeEntityPosition
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = DisplayRadar
  L4_2 = false
  L5_2 = true
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = debugPrint
  L4_2 = "Loading camera angles"
  L3_2(L4_2)
  L3_2 = Threads
  L3_2 = L3_2.Players
  L3_2 = L3_2.Data
  L3_2 = L3_2.ped
  L4_2 = L0_2.focusCoords
  L5_2 = L0_2.camCoords
  L6_2 = Cameras
  L6_2 = L6_2.GetEulerRotationsFromCoords
  L7_2 = L4_2
  L8_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L0_2.fov
  L8_2 = MainMenu
  L8_2 = L8_2.Data
  L9_2 = CreateCamWithParams
  L10_2 = "DEFAULT_SCRIPTED_CAMERA"
  L11_2 = L5_2
  L12_2 = L6_2
  L13_2 = L7_2
  L14_2 = true
  L15_2 = 2
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L8_2.cam = L9_2
  L8_2 = L0_2.shake
  if "none" ~= L8_2 then
    L8_2 = ShakeCam
    L9_2 = MainMenu
    L9_2 = L9_2.Data
    L9_2 = L9_2.cam
    L10_2 = L0_2.shake
    L11_2 = L0_2.shakeAmplitude
    L8_2(L9_2, L10_2, L11_2)
  end
  L8_2 = RenderScriptCams
  L9_2 = true
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetCamActive
  L9_2 = MainMenu
  L9_2 = L9_2.Data
  L9_2 = L9_2.cam
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = debugPrint
  L9_2 = "Setting DoF"
  L8_2(L9_2)
  L8_2 = SetCamUseShallowDofMode
  L9_2 = MainMenu
  L9_2 = L9_2.Data
  L9_2 = L9_2.cam
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetCamNearDof
  L9_2 = MainMenu
  L9_2 = L9_2.Data
  L9_2 = L9_2.cam
  if L1_2 then
    L10_2 = L1_2.near
    if L10_2 then
      L10_2 = L1_2.near
      if L10_2 then
        goto lbl_111
      end
    end
  end
  L10_2 = 0.0
  ::lbl_111::
  L8_2(L9_2, L10_2)
  L8_2 = SetCamFarDof
  L9_2 = MainMenu
  L9_2 = L9_2.Data
  L9_2 = L9_2.cam
  if L1_2 then
    L10_2 = L1_2.far
    if L10_2 then
      L10_2 = L1_2.far
      if L10_2 then
        goto lbl_125
      end
    end
  end
  L10_2 = 12.3
  ::lbl_125::
  L8_2(L9_2, L10_2)
  L8_2 = SetCamDofStrength
  L9_2 = MainMenu
  L9_2 = L9_2.Data
  L9_2 = L9_2.cam
  if L1_2 then
    L10_2 = L1_2.strength
    if L10_2 then
      L10_2 = L1_2.strength
      if L10_2 then
        goto lbl_139
      end
    end
  end
  L10_2 = 20.8
  ::lbl_139::
  L8_2(L9_2, L10_2)
  L8_2 = Citizen
  L8_2 = L8_2.CreateThread
  function L9_2()
    local L0_3, L1_3
    L0_3 = debugPrint
    L1_3 = "Awaiting Camera to be active"
    L0_3(L1_3)
    while true do
      L0_3 = DoesCamExist
      L1_3 = MainMenu
      L1_3 = L1_3.Data
      L1_3 = L1_3.cam
      L0_3 = L0_3(L1_3)
      if L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
    L0_3 = debugPrint
    L1_3 = "Camera active!"
    L0_3(L1_3)
    L0_3 = Citizen
    L0_3 = L0_3.CreateThread
    function L1_3()
      local L0_4, L1_4, L2_4
      L0_4 = GetResourceState
      L1_4 = ZSX_Loading
      L0_4 = L0_4(L1_4)
      if "started" == L0_4 then
        L0_4 = SendLoadingScreenMessage
        L1_4 = json
        L1_4 = L1_4.encode
        L2_4 = {}
        L2_4.action = "DONE_ALL"
        L1_4, L2_4 = L1_4(L2_4)
        L0_4(L1_4, L2_4)
        L0_4 = Wait
        L1_4 = 1000
        L0_4(L1_4)
        L0_4 = NUI
        L0_4 = L0_4.SetRoutePath
        L1_4 = "/mainmenu"
        L0_4(L1_4)
        L0_4 = DoScreenFadeIn
        L1_4 = 1
        L0_4(L1_4)
        L0_4 = Wait
        L1_4 = 2000
        L0_4(L1_4)
        L0_4 = ShutdownLoadingScreen
        L0_4()
        L0_4 = Wait
        L1_4 = 3500
        L0_4(L1_4)
        L0_4 = ShutdownLoadingScreenNui
        L0_4()
        while true do
          L0_4 = GetIsLoadingScreenActive
          L0_4 = L0_4()
          if not L0_4 then
            break
          end
          L0_4 = Wait
          L1_4 = 1
          L0_4(L1_4)
        end
        L0_4 = SetNuiFocus
        L1_4 = true
        L2_4 = true
        L0_4(L1_4, L2_4)
      else
        L0_4 = Config
        L0_4 = L0_4.AwaitShutdownLoadingScreen
        if L0_4 then
          L0_4 = debugPrint
          L1_4 = "Awaiting loading screen [/]"
          L0_4(L1_4)
          while true do
            L0_4 = GetIsLoadingScreenActive
            L0_4 = L0_4()
            if not L0_4 then
              break
            end
            L0_4 = Wait
            L1_4 = 1
            L0_4(L1_4)
          end
          L0_4 = debugPrint
          L1_4 = "Loading screen disabled, continue."
          L0_4(L1_4)
        else
          L0_4 = ShutdownLoadingScreen
          L0_4()
          L0_4 = ShutdownLoadingScreenNui
          L0_4()
          L0_4 = debugPrint
          L1_4 = "Shutting down loading screen [/]"
          L0_4(L1_4)
        end
        L0_4 = SetNuiFocus
        L1_4 = true
        L2_4 = false
        L0_4(L1_4, L2_4)
        L0_4 = Wait
        L1_4 = 2000
        L0_4(L1_4)
        L0_4 = NUI
        L0_4 = L0_4.SetRoutePath
        L1_4 = "/mainmenu"
        L0_4(L1_4)
        L0_4 = ShutdownLoadingScreenNui
        L0_4()
        L0_4 = DoScreenFadeIn
        L1_4 = 2000
        L0_4(L1_4)
        L0_4 = Wait
        L1_4 = 1250
        L0_4(L1_4)
        L0_4 = SetNuiFocus
        L1_4 = true
        L2_4 = true
        L0_4(L1_4, L2_4)
      end
    end
    L0_3(L1_3)
    while true do
      L0_3 = MainMenu
      L0_3 = L0_3.Data
      L0_3 = L0_3.cam
      if -1 == L0_3 then
        break
      end
      L0_3 = SetUseHiDof
      L0_3()
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L8_2(L9_2)
end
L1_1.Init = L2_1
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetEntityVisible
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = true
  L0_2(L1_2, L2_2)
end
L1_1(L2_1)
L1_1 = MainMenu
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = DoScreenFadeOut
  L1_2 = 2000
  L0_2(L1_2)
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  while true do
    L0_2 = IsScreenFadedOut
    L0_2 = L0_2()
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
  end
  L0_2 = DestroyCam
  L1_2 = MainMenu
  L1_2 = L1_2.Data
  L1_2 = L1_2.cam
  L0_2(L1_2)
  L0_2 = SetCamActive
  L1_2 = MainMenu
  L1_2 = L1_2.Data
  L1_2 = L1_2.cam
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = RenderScriptCams
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = LocalPlayer
  L0_2 = L0_2.state
  L1_2 = L0_2
  L0_2 = L0_2.set
  L2_2 = "UIV2_Preloaded"
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = Wait
  L1_2 = 200
  L0_2(L1_2)
  L0_2 = SetEntityVisible
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = GetResourceState
  L1_2 = ZSX_Multicharacter
  L0_2 = L0_2(L1_2)
  if "started" == L0_2 then
  end
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.UseConfiguration
  if L0_2 then
    L0_2 = Storage
    L0_2 = L0_2.Data
    L0_2 = L0_2.UIConfigured
    if not L0_2 then
      L0_2 = NUI
      L0_2 = L0_2.WelcomePreload
      L0_2()
    else
      L0_2 = NUI
      L0_2 = L0_2.SwitchScreen
      L1_2 = "GAME"
      L0_2(L1_2)
      L0_2 = Storage
      L0_2 = L0_2.SetUIAsCreated
      L0_2()
    end
  else
    L0_2 = NUI
    L0_2 = L0_2.SwitchScreen
    L1_2 = "GAME"
    L0_2(L1_2)
    L0_2 = Storage
    L0_2 = L0_2.SetUIAsCreated
    L0_2()
  end
  L0_2 = MainMenu
  L0_2 = L0_2.Data
  L0_2.cam = -1
  L0_2 = debugPrint
  L1_2 = "Awaiting for UI to be created"
  L0_2(L1_2)
  while true do
    L0_2 = Storage
    L0_2 = L0_2.Data
    L0_2 = L0_2.createdUI
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = debugPrint
  L1_2 = "UI Created!"
  L0_2(L1_2)
  L0_2 = FreezeEntityPosition
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = SetPlayerInvincible
  L1_2 = PlayerId
  L1_2 = L1_2()
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = TriggerServerEvent
  L1_2 = "ZSX_UIV2:Buckets:CreatePlayerBucket"
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = GetResourceState
  L1_2 = ZSX_Multicharacter
  L0_2 = L0_2(L1_2)
  if "started" == L0_2 then
    L0_2 = debugPrint
    L1_2 = "Found ZSX_Multicharacter! Initializing [/]"
    L0_2(L1_2)
    L0_2 = exports
    L1_2 = ZSX_Multicharacter
    L0_2 = L0_2[L1_2]
    L1_2 = L0_2
    L0_2 = L0_2.Initialize
    L0_2(L1_2)
  else
    L0_2 = Workers
    L0_2 = L0_2.MainMenu
    L0_2 = L0_2.InitializeAfterConfigurationEnd
    L0_2()
  end
end
L1_1.Destroy = L2_1
L1_1 = Config
L1_1 = L1_1.AutoStartMainMenu
if L1_1 then
  L1_1 = MainMenu
  L1_1 = L1_1.Handler
  L1_1()
else
  L1_1 = Citizen
  L1_1 = L1_1.CreateThread
  function L2_1()
    local L0_2, L1_2
    while true do
      L0_2 = NUI
      L0_2 = L0_2.Loaded
      if L0_2 then
        L0_2 = Storage
        L0_2 = L0_2.HasBeenSent
        if L0_2 then
          break
        end
      end
      L0_2 = Wait
      L1_2 = 100
      L0_2(L1_2)
    end
    L0_2 = NUI
    L0_2 = L0_2.SetRoutePath
    L1_2 = "/blank"
    L0_2(L1_2)
    L0_2 = Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = NUI
    L0_2 = L0_2.SwitchScreen
    L1_2 = "GAME"
    L0_2(L1_2)
    L0_2 = Storage
    L0_2 = L0_2.SetUIAsCreated
    L0_2()
  end
  L1_1(L2_1)
end
L1_1 = RegisterNUICallback
L2_1 = "mainMenu.finished"
function L3_1()
  local L0_2, L1_2
  L0_2 = MainMenu
  L0_2 = L0_2.Destroy
  L0_2()
end
L1_1(L2_1, L3_1)