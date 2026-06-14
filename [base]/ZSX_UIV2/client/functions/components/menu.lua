local L0_1, L1_1, L2_1
L0_1 = {}
Menu = L0_1
L0_1 = Menu
L0_1.Visible = false
L0_1 = Menu
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.UseAIOMenu
  if not L0_2 then
    return
  end
  L0_2 = Menu
  L1_2 = Menu
  L1_2 = L1_2.Visible
  L1_2 = not L1_2
  L0_2.Visible = L1_2
  L0_2 = Menu
  L0_2 = L0_2.Visible
  if L0_2 then
    L0_2 = PauseMenu
    L0_2 = L0_2.SomePartIsStillOpening
    if L0_2 then
      return
    end
    L0_2 = Storage
    L0_2 = L0_2.CurrentScreen
    if "game" ~= L0_2 then
      return
    end
  end
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SHOW_MENU"
  L2_2 = {}
  L3_2 = Menu
  L3_2 = L3_2.Visible
  L2_2.state = L3_2
  L0_2(L1_2, L2_2)
  L0_2 = Menu
  L0_2 = L0_2.Visible
  if L0_2 then
    L0_2 = Threads
    L0_2 = L0_2.Menu
    L0_2 = L0_2.Init
    L0_2()
  else
    L0_2 = Threads
    L0_2 = L0_2.Menu
    L0_2 = L0_2.Disable
    L0_2()
  end
end
L0_1.Init = L1_1
L0_1 = Menu
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "SHOW_MENU"
  L2_2 = {}
  L2_2.state = false
  L0_2(L1_2, L2_2)
  L0_2 = Menu
  L0_2.Visible = false
  L0_2 = Threads
  L0_2 = L0_2.Menu
  L0_2 = L0_2.Disable
  L0_2()
end
L0_1.ForceClose = L1_1
L0_1 = RegisterNUICallback
L1_1 = "menu.onSelect"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = ipairs
  L2_2 = AIO
  L2_2 = L2_2.Options
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.name
    L8_2 = A0_2.name
    if L7_2 == L8_2 then
      L7_2 = L6_2.onUse
      L7_2()
      L7_2 = Menu
      L7_2 = L7_2.ForceClose
      L7_2()
      break
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = Menu
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = Config
  L1_2 = L1_2.UI
  L1_2 = L1_2.UseAIOMenu
  if not L1_2 then
    return
  end
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L1_2
    L10_2 = {}
    L11_2 = L7_2.label
    L10_2.label = L11_2
    L11_2 = L7_2.name
    L10_2.name = L11_2
    L8_2(L9_2, L10_2)
  end
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "SET_MENU_DATA"
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
end
L0_1.SetData = L1_1
L0_1 = Config
L0_1 = L0_1.UI
L0_1 = L0_1.UseAIOMenu
if L0_1 then
  L0_1 = RegisterCommand
  L1_1 = Config
  L1_1 = L1_1.Commands
  L1_1 = L1_1.aio_menu
  function L2_1()
    local L0_2, L1_2
    L0_2 = Menu
    L0_2 = L0_2.Init
    L0_2()
  end
  L0_1(L1_1, L2_1)
end
