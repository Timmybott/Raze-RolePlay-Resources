local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
ContextMenu = L0_1
L0_1 = ContextMenu
L1_1 = {}
L0_1.RegisteredData = L1_1
L0_1 = ContextMenu
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.id
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^2CONTEXT^7] Could not register menu. No ID has been parsed."
    return L1_2(L2_2)
  end
  L1_2 = ContextMenu
  L1_2 = L1_2.RegisteredData
  L2_2 = A0_2.id
  L1_2[L2_2] = A0_2
  L1_2 = debugPrint
  L2_2 = "[^2CONTEXT^7] Registered menu with ID [^2'"
  L3_2 = A0_2.id
  L4_2 = "'^7]"
  L2_2 = L2_2 .. L3_2 .. L4_2
  L1_2(L2_2)
end
L0_1.Register = L1_1
L0_1 = ContextMenu
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if not A0_2 then
    L1_2 = debugPrint
    L2_2 = "[^2CONTEXT^7] Could not open menu. No ID has been parsed."
    return L1_2(L2_2)
  end
  L1_2 = ContextMenu
  L1_2 = L1_2.RegisteredData
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^2CONTEXT^7] Could not open menu. No ID has been found in registered object."
    return L1_2(L2_2)
  end
  L1_2 = ContextMenu
  L1_2 = L1_2.ConvertData
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "SET_CONTEXT_DATA"
  L4_2 = ContextMenu
  L4_2 = L4_2.RegisteredData
  L4_2 = L4_2[A0_2]
  L2_2(L3_2, L4_2)
end
L0_1.Open = L1_1
L0_1 = ContextMenu
L0_1 = L0_1.Register
L1_1 = {}
L1_1.id = "some_menu"
L1_1.title = "Some context menu"
L2_1 = {}
L3_1 = {}
L3_1.title = "Empty button"
L4_1 = {}
L4_1.title = "Disabled button"
L4_1.description = "This button is disabled"
L4_1.icon = "hand"
L4_1.disabled = true
L5_1 = {}
L5_1.title = "Example button"
L5_1.description = "Example button description"
L5_1.icon = "circle"
function L6_1()
  local L0_2, L1_2
  L0_2 = print
  L1_2 = "Pressed the button!"
  L0_2(L1_2)
end
L5_1.onSelect = L6_1
L6_1 = {}
L7_1 = {}
L7_1.label = "Value 1"
L7_1.value = "Some value"
L8_1 = {}
L8_1.label = "Value 2"
L8_1.value = 300
L6_1[1] = L7_1
L6_1[2] = L8_1
L5_1.metadata = L6_1
L6_1 = {}
L6_1.title = "Menu button"
L6_1.description = "Takes you to another menu!"
L6_1.menu = "other_menu"
L6_1.icon = "bars"
L7_1 = {}
L7_1.title = "Event button"
L7_1.description = "Open a menu from the event and send event data"
L7_1.icon = "check"
L7_1.event = "test_event"
L7_1.arrow = true
L8_1 = {}
L8_1.someValue = 500
L7_1.args = L8_1
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L1_1.options = L2_1
L0_1(L1_1)
L0_1 = ContextMenu
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  function L1_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L1_3 = pairs
    L2_3 = A0_3
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = type
      L8_3 = L6_3
      L7_3 = L7_3(L8_3)
      if "function" == L7_3 then
        A0_3[L5_3] = nil
      else
        L7_3 = type
        L8_3 = L6_3
        L7_3 = L7_3(L8_3)
        if "table" == L7_3 then
          L7_3 = L1_2
          L8_3 = L6_3
          L7_3(L8_3)
        end
      end
    end
  end
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if "table" == L8_2 then
      L8_2 = L1_2
      L9_2 = L7_2
      L8_2(L9_2)
    end
  end
  return A0_2
end
L0_1.ConvertData = L1_1
