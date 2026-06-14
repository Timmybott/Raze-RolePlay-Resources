local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = Threads
L1_1 = {}
L0_1.Chat = L1_1
L0_1 = Threads
L0_1 = L0_1.Chat
L0_1.IsInputVisible = false
L0_1 = Threads
L0_1 = L0_1.Chat
function L1_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.Chat
  L0_2 = L0_2.Use
  if not L0_2 then
    return
  end
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3
    L0_3 = SetTextChatEnabled
    L1_3 = false
    L0_3(L1_3)
    L0_3 = SetNuiFocus
    L1_3 = false
    L0_3(L1_3)
  end
  L0_2(L1_2)
end
L0_1.Init = L1_1
L0_1 = RegisterCommand
L1_1 = "chat_set_visible_input"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.Chat
  L0_2 = L0_2.Use
  if not L0_2 then
    return
  end
  L0_2 = Workers
  L0_2 = L0_2.Chat
  L0_2 = L0_2.PreventInput
  L0_2 = L0_2()
  if L0_2 then
    return
  end
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "CHAT_SET_INPUT_VISIBLE"
  L2_2 = {}
  L2_2.state = true
  L0_2(L1_2, L2_2)
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "chat.inputVisibilityState"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = Threads
  L1_2 = L1_2.Chat
  L2_2 = A0_2.state
  L1_2.IsInputVisible = L2_2
end
L0_1(L1_1, L2_1)
L0_1 = RegisterKeyMapping
L1_1 = "chat_set_visible_input"
L2_1 = "Shows chat input"
L3_1 = "KEYBOARD"
L4_1 = "T"
L0_1(L1_1, L2_1, L3_1, L4_1)
