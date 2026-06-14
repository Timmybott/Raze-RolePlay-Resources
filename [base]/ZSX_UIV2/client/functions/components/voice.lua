local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
Voice = L0_1
L0_1 = Voice
L0_1.Visibility = false
L0_1 = Voice
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.UI
  L2_2 = L2_2.DisableVoiceIndicator
  if L2_2 then
    return
  end
  L2_2 = Config
  L2_2 = L2_2.UI
  L2_2 = L2_2.Use3DVoiceIndicator
  if not L2_2 then
    if not A0_2 and A1_2 then
      L2_2 = TopContent
      L2_2 = L2_2.CurrentScreen
      if L2_2 ~= A1_2 then
        return
      end
    end
    L2_2 = NUI
    L2_2 = L2_2.SendMessage
    L3_2 = "SET_TOP_CONTENT_VISIBILITY"
    L4_2 = {}
    L4_2.state = A0_2
    L2_2(L3_2, L4_2)
  else
    L2_2 = NUI
    L2_2 = L2_2.SendMessage
    L3_2 = "SET_VOICE_INDICATOR_AS_VISIBLE"
    L4_2 = {}
    L4_2.state = A0_2
    L2_2(L3_2, L4_2)
  end
end
L0_1.Init = L1_1
L0_1 = Voice
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_VOICE_INDICATOR_DATA"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.SetData = L1_1
L0_1 = AddStateBagChangeHandler
L1_1 = "proximity"
L2_1 = nil
function L3_1(A0_2, A1_2, A2_2)
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
  L3_2 = TopContent
  L3_2 = L3_2.SetScreen
  L4_2 = "proximity"
  L3_2(L4_2)
  L3_2 = Voice
  L3_2 = L3_2.SetData
  L4_2 = {}
  L5_2 = Config
  L5_2 = L5_2.Voice
  L5_2 = L5_2.NameToProgress
  L6_2 = A2_2.mode
  L5_2 = L5_2[L6_2]
  L4_2.value = L5_2
  L5_2 = A2_2.mode
  L4_2.label = L5_2
  L3_2(L4_2)
  L3_2 = Voice
  L3_2 = L3_2.Visibility
  if not L3_2 then
    L3_2 = Citizen
    L3_2 = L3_2.CreateThread
    function L4_2()
      local L0_3, L1_3, L2_3
      L0_3 = Voice
      L0_3.Visibility = true
      L0_3 = Voice
      L0_3 = L0_3.Init
      L1_3 = true
      L2_3 = "proximity"
      L0_3(L1_3, L2_3)
      L0_3 = Wait
      L1_3 = 3000
      L0_3(L1_3)
      L0_3 = Voice
      L0_3 = L0_3.Init
      L1_3 = false
      L2_3 = "proximity"
      L0_3(L1_3, L2_3)
      L0_3 = Voice
      L0_3.Visibility = false
    end
    L3_2(L4_2)
  end
end
L0_1(L1_1, L2_1, L3_1)
L0_1 = RegisterNetEvent
L1_1 = "SaltyChat_VoiceRangeChanged"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "SaltyChat_VoiceRangeChanged"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = #A2_2
  L4_2 = A2_2[L3_2]
  L5_2 = A0_2
  L6_2 = A0_2 / L4_2
  L6_2 = L6_2 * 100
  L7_2 = Config
  L7_2 = L7_2.Voice
  L7_2 = L7_2.SaltyChatProgress
  L8_2 = tostring
  L9_2 = L5_2
  L8_2 = L8_2(L9_2)
  L7_2 = L7_2[L8_2]
  if not L7_2 then
    L7_2 = "Proximity"
  end
  L8_2 = Voice
  L8_2 = L8_2.SetData
  L9_2 = {}
  L10_2 = Config
  L10_2 = L10_2.Voice
  L10_2 = L10_2.NameToProgress
  L11_2 = val
  L11_2 = L11_2.mode
  L10_2 = L10_2[L11_2]
  L9_2.value = L10_2
  L10_2 = val
  L10_2 = L10_2.mode
  L9_2.label = L10_2
  L8_2(L9_2)
  L8_2 = TopContent
  L8_2 = L8_2.SetScreen
  L9_2 = "proximity"
  L8_2(L9_2)
  L8_2 = Voice
  L8_2 = L8_2.Visibility
  if not L8_2 then
    L8_2 = Citizen
    L8_2 = L8_2.CreateThread
    function L9_2()
      local L0_3, L1_3, L2_3
      L0_3 = Voice
      L0_3.Visibility = true
      L0_3 = Voice
      L0_3 = L0_3.Init
      L1_3 = true
      L2_3 = "proximity"
      L0_3(L1_3, L2_3)
      L0_3 = Wait
      L1_3 = 3000
      L0_3(L1_3)
      L0_3 = Voice
      L0_3 = L0_3.Init
      L1_3 = false
      L2_3 = "proximity"
      L0_3(L1_3, L2_3)
      L0_3 = Voice
      L0_3.Visibility = false
    end
    L8_2(L9_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = false
L1_1 = RegisterNetEvent
L2_1 = "SaltyChat_TalkStateChanged"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "SaltyChat_TalkStateChanged"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.UI
  L1_2 = L1_2.UseListenerForMumble
  if L1_2 then
    L1_2 = Config
    L1_2 = L1_2.UI
    L1_2 = L1_2.Use3DVoiceIndicator
    if not L1_2 then
      if A0_2 then
        L1_2 = TopContent
        L1_2 = L1_2.SetScreen
        L2_2 = "voice"
        L1_2(L2_2)
      end
      L1_2 = TopContent
      L1_2 = L1_2.Init
      L2_2 = A0_2
      L1_2(L2_2)
    else
      L1_2 = NUI
      L1_2 = L1_2.SendMessage
      L2_2 = "SET_VOICE_INDICATOR_PLAYER_TALKING"
      L3_2 = {}
      L3_2.state = A0_2
      L1_2(L2_2, L3_2)
    end
    L0_1 = A0_2
  end
end
L1_1(L2_1, L3_1)
L1_1 = {}
TopContent = L1_1
L1_1 = TopContent
L1_1.CurrentScreen = ""
L1_1 = TopContent
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TopContent
  L1_2 = L1_2.CurrentScreen
  if L1_2 == A0_2 then
    return
  end
  L1_2 = TopContent
  L1_2.CurrentScreen = A0_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_TOP_CONTENT_SCREEN"
  L3_2 = {}
  L3_2.name = A0_2
  L1_2(L2_2, L3_2)
end
L1_1.SetScreen = L2_1
L1_1 = TopContent
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_TOP_CONTENT_VISIBILITY"
  L3_2 = {}
  L3_2.state = A0_2
  L1_2(L2_2, L3_2)
end
L1_1.Init = L2_1
