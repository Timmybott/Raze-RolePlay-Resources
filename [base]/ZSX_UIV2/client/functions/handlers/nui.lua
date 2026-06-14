local L0_1, L1_1, L2_1
L0_1 = {}
NUI = L0_1
L0_1 = NUI
L0_1.HandlingCam = false
L0_1 = NUI
L0_1.Loaded = false
L0_1 = NUI
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.type = A0_2
  L3_2.data = A1_2
  L2_2(L3_2)
end
L0_1.SendMessage = L1_1
L0_1 = NUI
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = 1.7777777777777777
  L1_2 = GetActiveScreenResolution
  L1_2, L2_2 = L1_2()
  L3_2 = L1_2 / L2_2
  L4_2 = NUI
  L4_2 = L4_2.SendMessage
  L5_2 = "UPDATE_ASPECT_RATIO"
  L6_2 = {}
  L7_2 = L0_2 / L3_2
  L6_2.ratio = L7_2
  L4_2(L5_2, L6_2)
end
L0_1.SendAspectRatio = L1_1
L0_1 = NUI
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SetNuiFocus
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.SetFocus = L1_1
L0_1 = NUI
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = debugPrint
  L2_2 = "[^2NUI^7] Setting UI visibility to state: ["
  L3_2 = tostring
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = "]"
  L2_2 = L2_2 .. L3_2 .. L4_2
  L1_2(L2_2)
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_UI_VISIBLE"
  L3_2 = {}
  L3_2.state = A0_2
  L4_2 = IsRadarHidden
  L4_2 = L4_2()
  L4_2 = 1 ~= L4_2
  L3_2.radarVisible = L4_2
  L1_2(L2_2, L3_2)
end
L0_1.SetUIVisible = L1_1
L0_1 = NUI
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = debugPrint
  L2_2 = "[^2NUI^7] Setting UI data status to: ["
  if A0_2 then
    L3_2 = "^2LOADED^7"
    if L3_2 then
      goto lbl_9
    end
  end
  L3_2 = "^1UNLOADED^7"
  ::lbl_9::
  L4_2 = "]"
  L2_2 = L2_2 .. L3_2 .. L4_2
  L1_2(L2_2)
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_UI_DATA_STATUS"
  L3_2 = {}
  L3_2.state = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.SetDataLoadedStatus = L1_1
L0_1 = NUI
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = NUI
  L3_2 = L3_2.SendMessage
  L4_2 = "SET_MINICOMPONENT_VISIBILITY"
  L5_2 = {}
  L5_2.component = A0_2
  L5_2.element = A1_2
  L5_2.state = A2_2
  L3_2(L4_2, L5_2)
end
L0_1.SetMinicomponentVisibility = L1_1
L0_1 = NUI
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_SCREEN"
  L3_2 = {}
  L3_2.screen = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.SwitchScreen = L1_1
L0_1 = NUI
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "LOAD_UP_TRANSLATIONS"
  L2_2 = Translations
  L0_2(L1_2, L2_2)
  L0_2 = debugPrint
  L1_2 = "[^2NUI^7] Translations has been set."
  L0_2(L1_2)
end
L0_1.SendTranslations = L1_1
L0_1 = NUI
function L1_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = NUI
    L0_2 = L0_2.Loaded
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  while true do
    L0_2 = Storage
    L0_2 = L0_2.HasBeenSent
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = NUI
  L0_2 = L0_2.SwitchScreen
  L1_2 = "WELCOME"
  L0_2(L1_2)
  L0_2 = NUI
  L0_2 = L0_2.SetFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
end
L0_1.WelcomePreload = L1_1
L0_1 = NUI
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = debugPrint
  L3_2 = "[^2COMPONENTS^7] Setting visibility for component [^2"
  L5_2 = A0_2
  L4_2 = A0_2.upper
  L4_2 = L4_2(L5_2)
  L5_2 = "^7] as "
  if A1_2 then
    L6_2 = "visible."
    if L6_2 then
      goto lbl_12
    end
  end
  L6_2 = "not visible."
  ::lbl_12::
  L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2
  L2_2(L3_2)
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "SET_COMPONENT_VISIBILITY"
  L4_2 = {}
  L4_2.component = A0_2
  L4_2.state = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.SetComponentVisibility = L1_1
L0_1 = NUI
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_ROUTER_PATH"
  L3_2 = {}
  L3_2.path = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.SetRoutePath = L1_1
L0_1 = NUI
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SendLoadingScreenMessage
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = {}
  L4_2.action = A0_2
  L4_2.data = A1_2
  L3_2, L4_2 = L3_2(L4_2)
  L2_2(L3_2, L4_2)
end
L0_1.SendLoadingMessage = L1_1
L0_1 = NUI
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = NUI
  L3_2 = L3_2.SendMessage
  L4_2 = "APPLY_EFFECT_ON_INTERFACE"
  L5_2 = {}
  L5_2.interface = A0_2
  L5_2.element = A1_2
  L5_2.state = A2_2
  L3_2(L4_2, L5_2)
end
L0_1.ApplyEffectOnInterfaceElement = L1_1
L0_1 = RegisterCommand
L1_1 = "applyeffect"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = NUI
  L0_2 = L0_2.ApplyEffectOnInterfaceElement
  L1_2 = "hud"
  L2_2 = "hunger"
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = Wait
  L1_2 = 1250
  L0_2(L1_2)
  L0_2 = NUI
  L0_2 = L0_2.ApplyEffectOnInterfaceElement
  L1_2 = "hud"
  L2_2 = "hunger"
  L3_2 = false
  L0_2(L1_2, L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "base.handleFocus"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SetFocus
  L2_2 = A0_2.state
  L3_2 = A0_2.state
  L1_2(L2_2, L3_2)
  L1_2 = GameMenu
  L1_2 = L1_2.DestroyCamera
  L1_2()
  L1_2 = PauseMenu
  L1_2 = L1_2.DestroyCam
  L1_2()
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "base.onBodyLoaded"
function L2_1()
  local L0_2, L1_2
  L0_2 = debugPrint
  L1_2 = "[^2NUI^7] NUI Body has been loaded."
  L0_2(L1_2)
  L0_2 = NUI
  L0_2.Loaded = true
  L0_2 = Menu
  L0_2 = L0_2.SetData
  L1_2 = AIO
  L1_2 = L1_2.Options
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
