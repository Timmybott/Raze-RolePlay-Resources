local L0_1, L1_1, L2_1
L0_1 = {}
Overrides = L0_1
L0_1 = Overrides
L1_1 = {}
L0_1.Chat = L1_1
L0_1 = Overrides
L0_1 = L0_1.Chat
L1_1 = {}
L0_1.Commands = L1_1
L0_1 = Config
L0_1 = L0_1.Chat
L0_1 = L0_1.Use
if not L0_1 then
  return
end
L0_1 = RegisterNetEvent
L1_1 = "chat:addMessage"
L0_1(L1_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:addSuggestion"
L0_1(L1_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:addSuggestions"
L0_1(L1_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:addMode"
L0_1(L1_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:removeMode"
L0_1(L1_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:removeSuggestion"
L0_1(L1_1)
L0_1 = RegisterNetEvent
L1_1 = "chat:clear"
L0_1(L1_1)
L0_1 = RegisterNetEvent
L1_1 = "__cfx_internal:serverPrint"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "chat:addMessage"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.IsZSXMessage
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^1ERROR^7] Found message that was not created from UIV2 chat, returning."
    return L1_2(L2_2)
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "CHAT_ADD_MESSAGE"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "__cfx_internal:serverPrint"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = A0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "__cfx_export_chat_addMessage"
function L2_1()
  local L0_2, L1_2
  return
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "chat:addSuggestion"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = {}
  L4_2 = Overrides
  L4_2 = L4_2.Chat
  L4_2 = L4_2.Commands
  L4_2 = L4_2[A0_2]
  if L4_2 then
    L4_2 = debugPrint
    L5_2 = "[^2CHAT^7] Command ["
    L6_2 = A0_2
    L7_2 = "] was already registered. Overwriting in progress."
    L5_2 = L5_2 .. L6_2 .. L7_2
    L4_2(L5_2)
  end
  if A2_2 then
    L4_2 = ipairs
    L5_2 = A2_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = {}
      L11_2 = L9_2.help
      L10_2.label = L11_2
      L11_2 = L9_2.name
      L12_2 = L11_2
      L11_2 = L11_2.lower
      L11_2 = L11_2(L12_2)
      L10_2.name = L11_2
      L3_2[L8_2] = L10_2
    end
  end
  L4_2 = Overrides
  L4_2 = L4_2.Chat
  L4_2 = L4_2.Commands
  L5_2 = {}
  L5_2.command = A0_2
  L5_2.params = L3_2
  L5_2.info = A1_2
  L4_2[A0_2] = L5_2
  L4_2 = GlobalState
  L5_2 = Overrides
  L5_2 = L5_2.Chat
  L5_2 = L5_2.Commands
  L4_2.Suggestions = L5_2
  L4_2 = NUI
  L4_2 = L4_2.SendMessage
  L5_2 = "CHAT_ADD_SUGGESTION"
  L6_2 = Overrides
  L6_2 = L6_2.Chat
  L6_2 = L6_2.Commands
  L6_2 = L6_2[A0_2]
  L4_2(L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "chat:addSuggestions"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = nil
  if A0_2 then
    L2_2 = next
    L3_2 = A0_2
    L4_2 = nil
    L5_2 = nil
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = next
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      if L8_2 then
        L8_2 = L7_2.name
        if L8_2 then
          L8_2 = Overrides
          L8_2 = L8_2.Chat
          L8_2 = L8_2.Commands
          L9_2 = L7_2.name
          L8_2 = L8_2[L9_2]
          if L8_2 then
            L8_2 = debugPrint
            L9_2 = "[^2CHAT^7] Command ["
            L10_2 = L7_2.name
            L11_2 = "] was already registered. Overwriting in progress."
            L9_2 = L9_2 .. L10_2 .. L11_2
            L8_2(L9_2)
          end
        end
      end
      L8_2 = {}
      L9_2 = L7_2.name
      L10_2 = {}
      L11_2 = {}
      L10_2.params = L11_2
      L8_2[L9_2] = L10_2
      if L7_2 then
        L9_2 = next
        L10_2 = L7_2
        L9_2 = L9_2(L10_2)
        if L9_2 then
          L9_2 = L7_2.params
          if L9_2 then
            L9_2 = next
            L10_2 = L7_2.params
            L9_2 = L9_2(L10_2)
            if L9_2 then
              L9_2 = next
              L10_2 = L7_2.params
              L11_2 = nil
              L12_2 = nil
              for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
                L15_2 = L7_2.name
                L15_2 = L8_2[L15_2]
                L15_2 = L15_2.params
                L16_2 = {}
                L17_2 = L14_2.help
                if L17_2 then
                  L17_2 = L14_2.help
                  if L17_2 then
                    goto lbl_69
                  end
                end
                L17_2 = ""
                ::lbl_69::
                L16_2.label = L17_2
                L17_2 = L14_2.name
                L18_2 = L17_2
                L17_2 = L17_2.lower
                L17_2 = L17_2(L18_2)
                L16_2.name = L17_2
                L15_2[L13_2] = L16_2
              end
            end
          end
        end
      end
      L9_2 = Overrides
      L9_2 = L9_2.Chat
      L9_2 = L9_2.Commands
      L10_2 = L7_2.name
      L11_2 = {}
      L12_2 = L7_2.name
      L11_2.command = L12_2
      L12_2 = L7_2.name
      L12_2 = L8_2[L12_2]
      L12_2 = L12_2.params
      if L12_2 then
        L12_2 = L7_2.name
        L12_2 = L8_2[L12_2]
        L12_2 = L12_2.params
        if L12_2 then
          goto lbl_98
        end
      end
      L12_2 = {}
      ::lbl_98::
      L11_2.params = L12_2
      L12_2 = L7_2.help
      if L12_2 then
        L12_2 = L7_2.help
        if L12_2 then
          goto lbl_106
        end
      end
      L12_2 = ""
      ::lbl_106::
      L11_2.info = L12_2
      L9_2[L10_2] = L11_2
      L9_2 = NUI
      L9_2 = L9_2.SendMessage
      L10_2 = "CHAT_ADD_SUGGESTION"
      L11_2 = Overrides
      L11_2 = L11_2.Chat
      L11_2 = L11_2.Commands
      L12_2 = L7_2.name
      L11_2 = L11_2[L12_2]
      L9_2(L10_2, L11_2)
    end
    L2_2 = GlobalState
    L3_2 = Overrides
    L3_2 = L3_2.Chat
    L3_2 = L3_2.Commands
    L2_2.Suggestions = L3_2
  end
  L2_2 = GlobalState
  L3_2 = Overrides
  L3_2 = L3_2.Chat
  L3_2 = L3_2.Commands
  L2_2.Suggestions = L3_2
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "chat:addMode"
function L2_1()
  local L0_2, L1_2
  return
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "chat:removeMode"
function L2_1()
  local L0_2, L1_2
  return
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "chat:removeSuggestion"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Overrides
  L1_2 = L1_2.Chat
  L1_2 = L1_2.Commands
  L1_2[A0_2] = nil
  L1_2 = GlobalState
  L1_2 = L1_2.Suggestions
  if L1_2 then
    L1_2 = GlobalState
    L1_2 = L1_2.Suggestions
    L1_2 = L1_2[A0_2]
    if L1_2 then
      L1_2 = GlobalState
      L1_2 = L1_2.Suggestions
      L1_2[A0_2] = nil
    end
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "CHAT_REMOVE_SUGGESTION"
  L3_2 = {}
  L3_2.command = A0_2
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = AddEventHandler
L1_1 = "chat:clear"
function L2_1()
  local L0_2, L1_2
end
L0_1(L1_1, L2_1)
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = GlobalState
  L0_2 = L0_2.Suggestions
  if nil ~= L0_2 then
    L0_2 = debugPrint
    L1_2 = "[^2CHAT^7] Found registered suggestions, restoring [/]"
    L0_2(L1_2)
    while true do
      L0_2 = NUI
      L0_2 = L0_2.Loaded
      if L0_2 then
        break
      end
      L0_2 = Wait
      L1_2 = 1
      L0_2(L1_2)
    end
    L0_2 = pairs
    L1_2 = GlobalState
    L1_2 = L1_2.Suggestions
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = Overrides
      L6_2 = L6_2.Chat
      L6_2 = L6_2.Commands
      L6_2[L4_2] = L5_2
      L6_2 = NUI
      L6_2 = L6_2.SendMessage
      L7_2 = "CHAT_ADD_SUGGESTION"
      L8_2 = Overrides
      L8_2 = L8_2.Chat
      L8_2 = L8_2.Commands
      L8_2 = L8_2[L4_2]
      L6_2(L7_2, L8_2)
    end
    L0_2 = debugPrint
    L1_2 = "[^2CHAT^7] Suggestions restored!"
    L0_2(L1_2)
  end
end
L0_1(L1_1)
