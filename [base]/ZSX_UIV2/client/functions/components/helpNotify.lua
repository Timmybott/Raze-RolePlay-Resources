local L0_1, L1_1, L2_1
L0_1 = {}
HelpNotify = L0_1
L0_1 = HelpNotify
L0_1.IsATask = false
L0_1 = HelpNotify
L0_1.IsActive = false
L0_1 = HelpNotify
L0_1.IsOnTickStarted = false
L0_1 = HelpNotify
L1_1 = {}
L0_1.TasksList = L1_1
L0_1 = HelpNotify
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = Config
  L1_2 = L1_2.HelpNotify
  L1_2 = L1_2.Use
  if not L1_2 then
    return
  end
  L1_2 = HelpNotify
  L1_2.IsATask = false
  L1_2 = HelpNotify
  L2_2 = {}
  L1_2.TasksList = L2_2
  L1_2 = type
  L2_2 = A0_2.text
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = HelpNotify
    L1_2.IsATask = true
    L1_2 = HelpNotify
    L2_2 = A0_2.text
    L1_2.TasksList = L2_2
    L1_2 = false
    L2_2 = ipairs
    L3_2 = A0_2.text
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L7_2.name
      if L8_2 then
        L8_2 = L7_2.name
        if "" ~= L8_2 then
          goto lbl_41
        end
      end
      L8_2 = debugPrint
      L9_2 = "[^2HELPNOTIFICATION^7] Missing parameter ^1name^7 for id: [^1"
      L10_2 = L6_2
      L11_2 = "^7]."
      L9_2 = L9_2 .. L10_2 .. L11_2
      do return L8_2(L9_2) end
      ::lbl_41::
      L8_2 = L7_2.text
      if L8_2 then
        L8_2 = L7_2.text
        if "" ~= L8_2 then
          goto lbl_54
        end
      end
      L8_2 = debugPrint
      L9_2 = "[^2HELPNOTIFICATION^7] Missing parameter ^1text^7 for id: [^1"
      L10_2 = L6_2
      L11_2 = "^7]."
      L9_2 = L9_2 .. L10_2 .. L11_2
      do return L8_2(L9_2) end
      ::lbl_54::
      L8_2 = InputParser
      if L8_2 then
        L8_2 = InputParser
        L8_2 = L8_2.ParseInputs
        if L8_2 then
          L8_2 = InputParser
          L8_2 = L8_2.ParseInputs
          L9_2 = L7_2.text
          L8_2 = L8_2(L9_2)
          L7_2.text = L8_2
        end
      end
      L8_2 = L7_2.active
      if L8_2 and not L1_2 then
        L1_2 = true
      end
    end
    if not L1_2 then
      L2_2 = debugPrint
      L3_2 = "[^2HELPNOTIFICATION^7] Missing parameter ^1active^7 or is wrongly indexed."
      return L2_2(L3_2)
    end
  else
    L1_2 = InputParser
    if L1_2 then
      L1_2 = InputParser
      L1_2 = L1_2.ParseInputs
      if L1_2 then
        L1_2 = InputParser
        L1_2 = L1_2.ParseInputs
        L2_2 = A0_2.text
        L1_2 = L1_2(L2_2)
        A0_2.text = L1_2
      end
    end
  end
  L1_2 = TriggerEvent
  L2_2 = "ZSX_UIV2:Interfaces:HelpNotification:OnAdd"
  L1_2(L2_2)
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "ADD_HELP_NOTIFY"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.Add = L1_1
L0_1 = false
L1_1 = Config
L1_1 = L1_1.HelpNotify
L1_1 = L1_1.Use
if L1_1 then
  L1_1 = Citizen
  L1_1 = L1_1.CreateThread
  function L2_1()
    local L0_2, L1_2
    while true do
      L0_2 = L0_1
      if L0_2 then
        L0_2 = L0_1
        L1_2 = GetGameTimer
        L1_2 = L1_2()
        L0_2 = L0_2 - L1_2
        if L0_2 < 0 then
          L0_2 = HelpNotify
          L0_2 = L0_2.Remove
          L0_2()
          L0_2 = HelpNotify
          L0_2.IsOnTickStarted = false
        end
      end
      L0_2 = Wait
      L1_2 = 500
      L0_2(L1_2)
    end
  end
  L1_1(L2_1)
end
L1_1 = HelpNotify
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = Config
  L1_2 = L1_2.HelpNotify
  L1_2 = L1_2.Use
  if not L1_2 then
    return
  end
  L1_2 = HelpNotify
  L1_2 = L1_2.IsActive
  if L1_2 then
    L1_2 = GetGameTimer
    L1_2 = L1_2()
    L1_2 = L1_2 + 500
    L0_1 = L1_2
  end
  L1_2 = HelpNotify
  L1_2.IsOnTickStarted = true
  L1_2 = HelpNotify
  L1_2.IsActive = true
  L1_2 = HelpNotify
  L1_2.IsATask = false
  L1_2 = HelpNotify
  L2_2 = {}
  L1_2.TasksList = L2_2
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  L1_2 = L1_2 + 500
  L0_1 = L1_2
  L1_2 = type
  L2_2 = A0_2.text
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = HelpNotify
    L1_2.IsATask = true
    L1_2 = HelpNotify
    L2_2 = A0_2.text
    L1_2.TasksList = L2_2
    L1_2 = false
    L2_2 = ipairs
    L3_2 = A0_2.text
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L7_2.name
      if L8_2 then
        L8_2 = L7_2.name
        if "" ~= L8_2 then
          goto lbl_59
        end
      end
      L8_2 = debugPrint
      L9_2 = "[^2HELPNOTIFICATION^7] Missing parameter ^1name^7 for id: [^1"
      L10_2 = L6_2
      L11_2 = "^7]."
      L9_2 = L9_2 .. L10_2 .. L11_2
      do return L8_2(L9_2) end
      ::lbl_59::
      L8_2 = L7_2.text
      if L8_2 then
        L8_2 = L7_2.text
        if "" ~= L8_2 then
          goto lbl_72
        end
      end
      L8_2 = debugPrint
      L9_2 = "[^2HELPNOTIFICATION^7] Missing parameter ^1text^7 for id: [^1"
      L10_2 = L6_2
      L11_2 = "^7]."
      L9_2 = L9_2 .. L10_2 .. L11_2
      do return L8_2(L9_2) end
      ::lbl_72::
      L8_2 = InputParser
      if L8_2 then
        L8_2 = InputParser
        L8_2 = L8_2.ParseInputs
        if L8_2 then
          L8_2 = InputParser
          L8_2 = L8_2.ParseInputs
          L9_2 = L7_2.text
          L8_2 = L8_2(L9_2)
          L7_2.text = L8_2
        end
      end
      L8_2 = L7_2.active
      if L8_2 and not L1_2 then
        L1_2 = true
      end
    end
    if not L1_2 then
      L2_2 = debugPrint
      L3_2 = "[^2HELPNOTIFICATION^7] Missing parameter ^1active^7 or is wrongly indexed."
      return L2_2(L3_2)
    end
  else
    L1_2 = InputParser
    if L1_2 then
      L1_2 = InputParser
      L1_2 = L1_2.ParseInputs
      if L1_2 then
        L1_2 = InputParser
        L1_2 = L1_2.ParseInputs
        L2_2 = A0_2.text
        L1_2 = L1_2(L2_2)
        A0_2.text = L1_2
      end
    end
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "ADD_HELP_NOTIFY"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L1_1.OnTick = L2_1
L1_1 = HelpNotify
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = HelpNotify
  L1_2 = L1_2.IsATask
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^2HELPNOTIFICATION^7] Could not update a stage."
    return L1_2(L2_2)
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "UPDATE_HELP_NOTIFY_STAGE"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L1_1.UpdateStage = L2_1
L1_1 = HelpNotify
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = HelpNotify
  L1_2 = L1_2.IsATask
  if L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^2HELPNOTIFICATION^7] Could not update a text. Current Help Notification is not a task listed, you should use ^2exports[\"ZSX_UIV2\"]:HelpNotification_UpdateTextTask^7 instead"
    return L1_2(L2_2)
  end
  L1_2 = InputParser
  if L1_2 then
    L1_2 = InputParser
    L1_2 = L1_2.ParseInputs
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_19
    end
  end
  L1_2 = A0_2
  ::lbl_19::
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "UPDATE_HELP_NOTIFY_TEXT"
  L4_2 = {}
  L4_2.text = L1_2
  L2_2(L3_2, L4_2)
end
L1_1.UpdateText = L2_1
L1_1 = HelpNotify
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = HelpNotify
  L2_2 = L2_2.IsATask
  if not L2_2 then
    L2_2 = debugPrint
    L3_2 = "[^2HELPNOTIFICATION^7] Could not update a text. Current Help Notification is not a task listed, you should use ^2exports[\"ZSX_UIV2\"]:HelpNotification_UpdateTextTask^7 instead"
    return L2_2(L3_2)
  end
  L2_2 = false
  L3_2 = InputParser
  if L3_2 then
    L3_2 = InputParser
    L3_2 = L3_2.ParseInputs
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_20
    end
  end
  L3_2 = A1_2
  ::lbl_20::
  L4_2 = ipairs
  L5_2 = HelpNotify
  L5_2 = L5_2.TasksList
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.name
    if L10_2 == A0_2 then
      L10_2 = HelpNotify
      L10_2 = L10_2.UpdateStage
      L11_2 = {}
      L11_2.stage = L8_2
      L11_2.key = "text"
      L11_2.value = L3_2
      L10_2(L11_2)
      L2_2 = true
      break
    end
  end
  if not L2_2 then
    L4_2 = debugPrint
    L5_2 = "[^2HELPNOTIFICATION^7] Could not update a text. There is no stage named: "
    L6_2 = A0_2
    L5_2 = L5_2 .. L6_2
    L4_2(L5_2)
  end
end
L1_1.UpdateTextTask = L2_1
L1_1 = HelpNotify
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = HelpNotify
  L1_2 = L1_2.IsATask
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^2HELPNOTIFICATION^7] Could not update a stage."
    return L1_2(L2_2)
  end
  L1_2 = false
  L2_2 = ipairs
  L3_2 = HelpNotify
  L3_2 = L3_2.TasksList
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.name
    if L8_2 == A0_2 then
      L1_2 = true
      break
    end
  end
  if not L1_2 then
    L2_2 = debugPrint
    L3_2 = "[^2HELPNOTIFICATION^7] Could not a find stage with name ^1"
    L4_2 = A0_2
    L5_2 = "^7"
    L3_2 = L3_2 .. L4_2 .. L5_2
    return L2_2(L3_2)
  end
  L2_2 = ipairs
  L3_2 = HelpNotify
  L3_2 = L3_2.TasksList
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.active
    if L8_2 then
      L8_2 = L7_2.name
      if L8_2 ~= A0_2 then
        L8_2 = HelpNotify
        L8_2 = L8_2.UpdateStage
        L9_2 = {}
        L9_2.stage = L6_2
        L9_2.key = "active"
        L9_2.value = false
        L8_2(L9_2)
      end
    end
    L8_2 = L7_2.name
    if L8_2 == A0_2 then
      L8_2 = HelpNotify
      L8_2 = L8_2.UpdateStage
      L9_2 = {}
      L9_2.stage = A0_2
      L9_2.key = "active"
      L9_2.value = true
      L8_2(L9_2)
      break
    end
  end
end
L1_1.SetStageAsActive = L2_1
L1_1 = HelpNotify
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = HelpNotify
  L1_2 = L1_2.IsATask
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^2HELPNOTIFICATION^7] Could not update a stage."
    return L1_2(L2_2)
  end
  L1_2 = false
  L2_2 = ipairs
  L3_2 = HelpNotify
  L3_2 = L3_2.TasksList
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.name
    if L8_2 == A0_2 then
      L1_2 = true
      break
    end
  end
  if not L1_2 then
    L2_2 = debugPrint
    L3_2 = "[^2HELPNOTIFICATION^7] Could not a find stage with name ^1"
    L4_2 = A0_2
    L5_2 = "^7"
    L3_2 = L3_2 .. L4_2 .. L5_2
    return L2_2(L3_2)
  end
  L2_2 = ipairs
  L3_2 = HelpNotify
  L3_2 = L3_2.TasksList
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.name
    if L8_2 == A0_2 then
      L8_2 = HelpNotify
      L8_2 = L8_2.UpdateStage
      L9_2 = {}
      L9_2.stage = A0_2
      L9_2.key = "complete"
      L9_2.value = true
      L8_2(L9_2)
      break
    end
  end
end
L1_1.SetStageAsCompleted = L2_1
L1_1 = HelpNotify
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "REMOVE_HELP_NOTIFY"
  L2_2 = {}
  L0_2(L1_2, L2_2)
  L0_2 = false
  L0_1 = L0_2
  L0_2 = HelpNotify
  L0_2.IsOnTickStarted = false
  L0_2 = HelpNotify
  L0_2.IsActive = false
  L0_2 = TriggerEvent
  L1_2 = "ZSX_UIV2:Interfaces:HelpNotification:OnRemove"
  L0_2(L1_2)
end
L1_1.Remove = L2_1
