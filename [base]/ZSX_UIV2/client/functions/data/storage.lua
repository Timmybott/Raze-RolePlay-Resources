local L0_1, L1_1, L2_1
L0_1 = {}
Storage = L0_1
L0_1 = Storage
L0_1.HasBeenSent = false
L0_1 = Storage
L0_1.CurrentScreen = ""
L0_1 = Storage
L1_1 = {}
L0_1.Data = L1_1
L0_1 = Storage
L1_1 = {}
L1_1.hud = true
L1_1.carhud = true
L1_1.notifies = true
L1_1.helpnotify = true
L1_1.progressbar = true
L1_1.minimap = true
L1_1.color = true
L1_1.progressBar = true
L1_1.misc = true
L0_1.UITypes = L1_1
L0_1 = Storage
function L1_1(A0_2)
  local L1_2
  L1_2 = Storage
  L1_2.CurrentScreen = A0_2
end
L0_1.SetCurrentScreen = L1_1
L0_1 = Storage
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Storage
  L1_2 = L1_2.CurrentScreen
  L2_2 = TriggerEvent
  L3_2 = "ZSX_UIV2:Storage:OnScreenSwitched"
  L4_2 = L1_2
  L5_2 = A0_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "INDICATE_UNFASTEN_SEATBELT"
  L4_2 = {}
  L4_2.state = false
  L2_2(L3_2, L4_2)
  if "game" == A0_2 then
    L2_2 = NUI
    L2_2 = L2_2.SetFocus
    L3_2 = false
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = MusicPlayer
    L2_2 = L2_2.HandleVolume
    L3_2 = "STOP"
    L2_2(L3_2)
  end
  if "game" == L1_2 then
    L2_2 = MusicPlayer
    L2_2 = L2_2.HandleVolume
    L3_2 = "START"
    L2_2(L3_2)
    L2_2 = Menu
    L2_2 = L2_2.ForceClose
    L2_2()
  end
  if "position" == L1_2 or "preview" == L1_2 then
    L2_2 = Config
    L2_2 = L2_2.PersistentMinimap
    if not L2_2 then
      L2_2 = Threads
      L2_2 = L2_2.Vehicles
      L2_2 = L2_2.IsRadarVisible
      L3_2 = IsRadarHidden
      L3_2 = L3_2()
      L3_2 = not L3_2
      if L2_2 ~= L3_2 then
        L2_2 = DisplayRadar
        L3_2 = false
        L4_2 = true
        L2_2(L3_2, L4_2)
        L2_2 = NUI
        L2_2 = L2_2.SendMessage
        L3_2 = "SET_PERSPECTIVE_IN_VEH"
        L4_2 = {}
        L4_2.state = false
        L2_2(L3_2, L4_2)
        L2_2 = StreetLabel
        L2_2 = L2_2.SetVisible
        L3_2 = false
        L2_2(L3_2)
      end
    end
  end
  if ("game_menu" == L1_2 or "position" == L1_2) and "game" == A0_2 then
    L2_2 = Config
    L2_2 = L2_2.PersistentMinimap
    if L2_2 then
      L2_2 = DisplayRadar
      L3_2 = true
      L2_2(L3_2)
    end
  end
end
L0_1.OnScreenSwitched = L1_1
L0_1 = RegisterNUICallback
L1_1 = "storage.switchedScreen"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Storage
  L1_2 = L1_2.OnScreenSwitched
  L2_2 = A0_2.path
  L1_2(L2_2)
  L1_2 = Storage
  L2_2 = A0_2.path
  L1_2.CurrentScreen = L2_2
  L1_2 = debugPrint
  L2_2 = "[^3SCREENS^7] Screen has been switched to: [^3"
  L3_2 = A0_2.path
  L4_2 = L3_2
  L3_2 = L3_2.upper
  L3_2 = L3_2(L4_2)
  L4_2 = "^7]"
  L2_2 = L2_2 .. L3_2 .. L4_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "storage.setCreatedUI"
function L2_1()
  local L0_2, L1_2
  L0_2 = Storage
  L0_2 = L0_2.SetUIAsCreated
  L0_2()
end
L0_1(L1_1, L2_1)
L0_1 = Storage
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = Storage
  L0_2 = L0_2.Data
  L0_2.createdUI = true
  L0_2 = Minimap
  L0_2 = L0_2.Prepare
  L1_2 = "Basic"
  L0_2(L1_2)
  L0_2 = SetBlipAlpha
  L1_2 = GetNorthRadarBlip
  L1_2 = L1_2()
  L2_2 = 0
  L0_2(L1_2, L2_2)
  L0_2 = SetRadarBigmapEnabled
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = Threads
  L0_2 = L0_2.FPSCount
  L0_2 = L0_2.Init
  L0_2()
end
L0_1.SetUIAsCreated = L1_1
L0_1 = Storage
function L1_1()
  local L0_2, L1_2
  L0_2 = Storage
  L0_2 = L0_2.CurrentScreen
  return L0_2
end
L0_1.GetCurrentScreen = L1_1
L0_1 = Storage
function L1_1()
  local L0_2, L1_2
  L0_2 = Storage
  L0_2 = L0_2.CurrentScreen
  L0_2 = "pausemenu" == L0_2
  return L0_2
end
L0_1.IsInPauseMenu = L1_1
L0_1 = Storage
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  if A0_2 then
    L3_2 = Storage
    L3_2 = L3_2.UITypes
    L3_2 = L3_2[A0_2]
    if L3_2 then
      goto lbl_18
    end
  end
  L3_2 = debugPrint
  L4_2 = "[^1ERROR^7] Could not find UI Type. UI_TYPE/ERROR_CODE "
  L5_2 = A0_2 or L5_2
  if not A0_2 or not A0_2 then
    L5_2 = "NOT_GIVEN"
  end
  L4_2 = L4_2 .. L5_2
  do return L3_2(L4_2) end
  ::lbl_18::
end
L0_1.Update = L1_1
L0_1 = Storage
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  if A0_2 then
    L3_2 = Storage
    L3_2 = L3_2.UITypes
    L3_2 = L3_2[A0_2]
    if L3_2 then
      goto lbl_18
    end
  end
  L3_2 = debugPrint
  L4_2 = "[^1ERROR^7] Could not find UI Type. UI_TYPE/ERROR_CODE "
  L5_2 = A0_2 or L5_2
  if not A0_2 or not A0_2 then
    L5_2 = "NOT_GIVEN"
  end
  L4_2 = L4_2 .. L5_2
  do return L3_2(L4_2) end
  ::lbl_18::
  L3_2 = NUI
  L3_2 = L3_2.SendMessage
  L4_2 = "SEND_STORAGE"
  L5_2 = {}
  L5_2.ui = A0_2
  L5_2.key = A1_2
  L5_2.value = A2_2
  L3_2(L4_2, L5_2)
end
L0_1.Send = L1_1
L0_1 = Storage
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "REMOVE_STORAGE"
  L2_2 = {}
  L0_2(L1_2, L2_2)
  L0_2 = debugPrint
  L1_2 = "[^3STORAGE^7] Removed saved storage data."
  L0_2(L1_2)
end
L0_1.Remove = L1_1
L0_1 = Storage
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SEND_FULL_CFG"
  L2_2 = {}
  L3_2 = Config
  L2_2.config = L3_2
  L0_2(L1_2, L2_2)
  L0_2 = NUI
  L0_2 = L0_2.SendAspectRatio
  L0_2()
end
L0_1.SendFullCFG = L1_1
L0_1 = RegisterCommand
L1_1 = "dumpStorage"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = print
  L1_2 = ESX
  L1_2 = L1_2.DumpTable
  L2_2 = Storage
  L2_2 = L2_2.Data
  L1_2, L2_2 = L1_2(L2_2)
  L0_2(L1_2, L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = Storage
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = debugPrint
  L2_2 = "[^2NUI^7] Sending data [/]"
  L1_2(L2_2)
  L1_2 = Config
  L2_2 = GetResourceState
  L3_2 = ZSX_Multicharacter
  L2_2 = L2_2(L3_2)
  L2_2 = "started" == L2_2
  L1_2.IsMulticharacterStarted = L2_2
  L1_2 = Storage
  L1_2 = L1_2.SendFullCFG
  L1_2()
  while true do
    L1_2 = Storage
    L1_2 = L1_2.HasBeenSent
    if L1_2 then
      break
    end
    L1_2 = Wait
    L2_2 = 50
    L1_2(L2_2)
  end
  L1_2 = debugPrint
  L2_2 = "[^2NUI^7] Received Config data"
  L1_2(L2_2)
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SEND_PAUSEMENU_DATA_BUTTONS"
  L3_2 = {}
  L4_2 = Config
  L4_2 = L4_2.PauseMenu
  L4_2 = L4_2.Buttons
  L3_2.buttons = L4_2
  L4_2 = Config
  L4_2 = L4_2.PauseMenu
  L4_2 = L4_2.UseCustomOrder
  L3_2.useCustomOrder = L4_2
  L4_2 = Config
  L4_2 = L4_2.PauseMenu
  L4_2 = L4_2.Order
  L3_2.order = L4_2
  L1_2(L2_2, L3_2)
  L1_2 = debugPrint
  L2_2 = "[^2NUI^7] Updated Pause Menu buttons."
  L1_2(L2_2)
  if A0_2 then
    L1_2 = A0_2
    L1_2()
  end
end
L0_1.Prepare = L1_1
L0_1 = RegisterNUICallback
L1_1 = "storage.onLoad"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = debugPrint
  L2_2 = "[^5CB^7] Storage preloaded"
  L1_2(L2_2)
  L1_2 = Storage
  L1_2.Data = A0_2
  L1_2 = Storage
  L1_2.HasBeenSent = true
  L1_2 = Threads
  L1_2 = L1_2.Vehicles
  L2_2 = A0_2.carhud
  L2_2 = L2_2.refreshInterval
  L1_2.RefreshInterval = L2_2
  L1_2 = TriggerEvent
  L2_2 = "ZSX_UI:Storage:Set"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = Storage
function L1_1(A0_2)
  local L1_2
  L1_2 = Storage
  L1_2.Data = A0_2
end
L0_1.SetData = L1_1
L0_1 = Storage
function L1_1()
  local L0_2, L1_2
end
L0_1.GetLocalData = L1_1
L0_1 = RegisterNUICallback
L1_1 = "storage.nuiRetrieve"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = debugPrint
  L2_2 = "[^5CB^7] Gathered storage from LocalStorage."
  L1_2(L2_2)
  L1_2 = Storage
  L1_2 = L1_2.SetData
  L2_2 = A0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = Storage
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Storage
  L2_2 = L2_2.UITypes
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L2_2 = debugPrint
    L3_2 = "Attempt to update nil component: "
    L4_2 = A0_2
    L3_2 = L3_2 .. L4_2
    return L2_2(L3_2)
  end
  L2_2 = Storage
  L2_2 = L2_2.Data
  L2_2[A0_2] = A1_2
  if "color" == A0_2 then
    L2_2 = Storage
    L2_2 = L2_2.OnColorChange
    L2_2()
  end
  if "carhud" == A0_2 then
    L2_2 = Threads
    L2_2 = L2_2.Vehicles
    L3_2 = A1_2.refreshInterval
    L2_2.RefreshInterval = L3_2
  elseif "hud" == A0_2 then
    L2_2 = Threads
    L2_2 = L2_2.Hud
    L3_2 = A1_2.refreshInterval
    L2_2.RefreshInterval = L3_2
  end
  L2_2 = TriggerEvent
  L3_2 = "ZSX_UI:Storage:Updated"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = debugPrint
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "[^5CB^7] Component ^3[%s]^7 has been updated."
  L6_2 = A0_2
  L5_2 = A0_2.upper
  L5_2, L6_2 = L5_2(L6_2)
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1.Updated = L1_1
L0_1 = RegisterNUICallback
L1_1 = "storage.onUpdate"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = debugPrint
  L2_2 = "[^5CB^7] Storage for component ^3["
  L3_2 = A0_2.component
  L4_2 = L3_2
  L3_2 = L3_2.upper
  L3_2 = L3_2(L4_2)
  L4_2 = "]^7 has been updated. Retrieving values [/]"
  L2_2 = L2_2 .. L3_2 .. L4_2
  L1_2(L2_2)
  L1_2 = Storage
  L1_2 = L1_2.Updated
  L2_2 = A0_2.component
  L3_2 = A0_2.componentData
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "storage.onPositionUpdate"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = TriggerEvent
  L2_2 = "ZSX_UI:Storage:OnPositionUpdate"
  L3_2 = A0_2.component
  L4_2 = A0_2.position
  L5_2 = A0_2.width
  L6_2 = A0_2.height
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = Storage
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 then
    L1_2 = Storage
    L1_2 = L1_2.Data
    L1_2 = L1_2.color
    L1_2 = L1_2.primaryColor
    L2_2 = L1_2
    L1_2 = L1_2.gsub
    L3_2 = "#"
    L4_2 = ""
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    hex = L1_2
    L1_2 = {}
    L2_2 = tonumber
    L3_2 = "0x"
    L4_2 = hex
    L5_2 = L4_2
    L4_2 = L4_2.sub
    L6_2 = 1
    L7_2 = 2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2.r = L2_2
    L2_2 = tonumber
    L3_2 = "0x"
    L4_2 = hex
    L5_2 = L4_2
    L4_2 = L4_2.sub
    L6_2 = 3
    L7_2 = 4
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2.g = L2_2
    L2_2 = tonumber
    L3_2 = "0x"
    L4_2 = hex
    L5_2 = L4_2
    L4_2 = L4_2.sub
    L6_2 = 5
    L7_2 = 6
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2.b = L2_2
    return L1_2
  end
  L1_2 = Storage
  L1_2 = L1_2.Data
  L1_2 = L1_2.color
  L1_2 = L1_2.primaryColor
  return L1_2
end
L0_1.GetHudColor = L1_1
L0_1 = Storage
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = Storage
  L0_2 = L0_2.GetHudColor
  L1_2 = true
  L0_2 = L0_2(L1_2)
  L1_2 = ReplaceHudColourWithRgba
  L2_2 = 116
  L3_2 = L0_2.r
  L4_2 = L0_2.g
  L5_2 = L0_2.b
  L6_2 = 255
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = Point
  L1_2 = L1_2.UpdateColor
  L2_2 = Storage
  L2_2 = L2_2.GetHudColor
  L2_2, L3_2, L4_2, L5_2, L6_2 = L2_2()
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = TriggerEvent
  L2_2 = "ZSX_UIV2:Storage:OnColorUpdate"
  L3_2 = L0_2
  L4_2 = Storage
  L4_2 = L4_2.GetHudColor
  L4_2, L5_2, L6_2 = L4_2()
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end
L0_1.OnColorChange = L1_1
L0_1 = Storage
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Storage
  L2_2 = L2_2.Data
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L2_2 = debugPrint
    L3_2 = "[^1ERROR^7] Could not find UI Type. UI: "
    L4_2 = A0_2 or L4_2
    if not A0_2 or not A0_2 then
      L4_2 = "NOT_GIVEN"
    end
    L3_2 = L3_2 .. L4_2
    return L2_2(L3_2)
  end
  if A1_2 then
    L2_2 = Storage
    L2_2 = L2_2.Data
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2[A1_2]
    if not L2_2 then
      L2_2 = debugPrint
      L3_2 = "[^1ERROR^7] Could not find key for "
      L4_2 = A0_2
      L5_2 = ". Key: "
      L6_2 = A1_2 or L6_2
      if not A1_2 or not A1_2 then
        L6_2 = "NOT_GIVEN"
      end
      L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2
      return L2_2(L3_2)
    end
  end
  if A1_2 then
    L2_2 = Storage
    L2_2 = L2_2.Data
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2[A1_2]
    if L2_2 then
      goto lbl_47
    end
  end
  L2_2 = Storage
  L2_2 = L2_2.Data
  L2_2 = L2_2[A0_2]
  ::lbl_47::
  return L2_2
end
L0_1.GetElementData = L1_1
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2
  while true do
    L0_2 = NUI
    L0_2 = L0_2.Loaded
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
  end
  L0_2 = Storage
  L0_2 = L0_2.Prepare
  function L1_2()
    local L0_3, L1_3
    L0_3 = Storage
    L0_3 = L0_3.GetLocalData
    L0_3()
    L0_3 = NUI
    L0_3 = L0_3.SendTranslations
    L0_3()
    while true do
      L0_3 = Storage
      L0_3 = L0_3.Data
      if L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
    end
  end
  L0_2(L1_2)
end
L0_1(L1_1)
