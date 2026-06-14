local L0_1, L1_1, L2_1
L0_1 = RegisterCommand
L1_1 = Config
L1_1 = L1_1.Commands
L1_1 = L1_1.menu
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.UseInGameSettings
  if not L0_2 then
    return
  end
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
L0_1(L1_1, L2_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = LocalPlayer
  L0_2 = L0_2.state
  L1_2 = L0_2
  L0_2 = L0_2.set
  L2_2 = "UI_InSettings"
  L3_2 = false
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = TriggerServerEvent
  L1_2 = "ZSX_UIV2:Player:Prepare"
  L0_2(L1_2)
  L0_2 = Config
  L0_2.MusicHandlerUpdated = true
end
L0_1(L1_1)
