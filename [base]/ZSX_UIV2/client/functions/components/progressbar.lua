local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = {}
ProgressBar = L0_1
L0_1 = ProgressBar
L0_1.IsActive = false
L0_1 = ProgressBar
L0_1.CanCancel = false
L0_1 = ProgressBar
L0_1.LeftState = -1
L0_1 = ProgressBar
L1_1 = {}
L0_1.PlayerProps = L1_1
L0_1 = ProgressBar
L1_1 = {}
L2_1 = {}
L3_1 = 1
L4_1 = 2
L5_1 = 106
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L1_1.disable_mouse = L2_1
L2_1 = {}
L3_1 = 30
L4_1 = 31
L5_1 = 36
L6_1 = 21
L7_1 = 75
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L1_1.disable_walk = L2_1
L2_1 = {}
L3_1 = 63
L4_1 = 64
L5_1 = 71
L6_1 = 72
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L1_1.disable_driving = L2_1
L2_1 = {}
L3_1 = 24
L4_1 = 25
L5_1 = 37
L6_1 = 47
L7_1 = 58
L8_1 = 140
L9_1 = 141
L10_1 = 142
L11_1 = 143
L12_1 = 263
L13_1 = 264
L14_1 = 257
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L2_1[12] = L14_1
L1_1.disable_combat = L2_1
L0_1.TypeToControls = L1_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L2_2 = A1_2.model
  if not L2_2 then
    L2_2 = debugPrint
    L3_2 = "[^1ERROR^7] Could not find a model."
    L2_2(L3_2)
    L2_2 = false
    return L2_2
  end
  L2_2 = A1_2.model
  L3_2 = type
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if "number" ~= L3_2 then
    L3_2 = joaat
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
  end
  L3_2 = RequestModel
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = GetGameTimer
  L3_2 = L3_2()
  L4_2 = L3_2 + 3000
  L5_2 = L3_2
  while true do
    L6_2 = HasModelLoaded
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    if not (not L6_2 and L4_2 > L5_2) then
      break
    end
    L6_2 = GetGameTimer
    L6_2 = L6_2()
    L5_2 = L6_2
    L6_2 = Wait
    L7_2 = 50
    L6_2(L7_2)
  end
  L6_2 = HasModelLoaded
  L7_2 = L2_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = debugPrint
    L7_2 = "[^1ERROR^7] Could not load model."
    L6_2(L7_2)
    L6_2 = false
    return L6_2
  end
  L6_2 = GetEntityCoords
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  L7_2 = CreateObject
  L8_2 = A1_2.model
  L9_2 = L6_2.x
  L10_2 = L6_2.y
  L11_2 = L6_2.z
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L8_2 = A1_2.coords
  if L8_2 then
    L8_2 = A1_2.coords
    A1_2.pos = L8_2
  end
  L8_2 = A1_2.rotation
  if L8_2 then
    L8_2 = A1_2.rotation
    A1_2.rot = L8_2
  end
  L8_2 = AttachEntityToEntity
  L9_2 = L7_2
  L10_2 = A0_2
  L11_2 = GetPedBoneIndex
  L12_2 = A0_2
  L13_2 = A1_2.bone
  if not L13_2 then
    L13_2 = 60309
  end
  L11_2 = L11_2(L12_2, L13_2)
  L12_2 = A1_2.pos
  L12_2 = L12_2.x
  if not L12_2 then
    L12_2 = 0.0
  end
  L13_2 = A1_2.pos
  L13_2 = L13_2.y
  if not L13_2 then
    L13_2 = 0.0
  end
  L14_2 = A1_2.pos
  L14_2 = L14_2.z
  if not L14_2 then
    L14_2 = 0.0
  end
  L15_2 = A1_2.rot
  L15_2 = L15_2.x
  if not L15_2 then
    L15_2 = 0.0
  end
  L16_2 = A1_2.rot
  L16_2 = L16_2.y
  if not L16_2 then
    L16_2 = 0.0
  end
  L17_2 = A1_2.rot
  L17_2 = L17_2.z
  if not L17_2 then
    L17_2 = 0.0
  end
  L18_2 = true
  L19_2 = true
  L20_2 = false
  L21_2 = true
  L22_2 = A1_2.rotOrder
  if not L22_2 then
    L22_2 = 0
  end
  L23_2 = true
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L8_2 = SetModelAsNoLongerNeeded
  L9_2 = A1_2.model
  L8_2(L9_2)
  return L7_2
end
L1_1 = ProgressBar
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = pairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if L6_2 then
      L7_2 = ProgressBar
      L7_2 = L7_2.TypeToControls
      L7_2 = L7_2[L5_2]
      if L7_2 then
        L7_2 = ipairs
        L8_2 = ProgressBar
        L8_2 = L8_2.TypeToControls
        L8_2 = L8_2[L5_2]
        L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
        for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
          L13_2 = DisableControlAction
          L14_2 = 0
          L15_2 = L12_2
          L16_2 = true
          L13_2(L14_2, L15_2, L16_2)
        end
      end
    end
  end
  L1_2 = A0_2.disableCombat
  if L1_2 then
    L1_2 = DisablePlayerFiring
    L2_2 = PlayerId
    L2_2 = L2_2()
    L3_2 = true
    L1_2(L2_2, L3_2)
  end
end
L1_1.Thread = L2_1
L1_1 = ProgressBar
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2, A9_2, A10_2)
  local L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L11_2 = Config
  L11_2 = L11_2.ProgressBar
  L11_2 = L11_2.Use
  if not L11_2 then
    return
  end
  L11_2 = ProgressBar
  L11_2 = L11_2.IsActive
  if L11_2 then
    L11_2 = debugPrint
    L12_2 = "[^1ERROR^7] Progressbar is currently active. Returning."
    return L11_2(L12_2)
  end
  if not A2_2 then
    A2_2 = 5000
  end
  if not A10_2 then
    L11_2 = NUI
    L11_2 = L11_2.SendMessage
    L12_2 = "PROGRESS_BAR_INIT"
    L13_2 = {}
    L13_2.text = A1_2
    L13_2.icon = A0_2
    L13_2.duration = A2_2
    L11_2(L12_2, L13_2)
    L11_2 = ProgressBar
    L12_2 = true == A5_2
    L11_2.CanCancel = L12_2
    L11_2 = ProgressBar
    L11_2.LeftState = -1
    L11_2 = ProgressBar
    L11_2.IsActive = true
    if A8_2 then
      L11_2 = type
      L12_2 = A8_2
      L11_2 = L11_2(L12_2)
      if "table" ~= L11_2 then
        L11_2 = A8_2.model
        if L11_2 then
          goto lbl_63
        end
      end
      L11_2 = ProgressBar
      L11_2 = L11_2.PlayerProps
      L12_2 = ProgressBar
      L12_2 = L12_2.PlayerProps
      L12_2 = #L12_2
      L12_2 = L12_2 + 1
      L13_2 = L0_1
      L14_2 = PlayerPedId
      L14_2 = L14_2()
      L15_2 = A8_2
      L13_2 = L13_2(L14_2, L15_2)
      L11_2[L12_2] = L13_2
      goto lbl_66
      ::lbl_63::
      L11_2 = debugPrint
      L12_2 = "[^2PROGRESSBAR^7] [^1ERROR^7] Could not add prop for argument [prop]. Parameter is not an object!"
      L11_2(L12_2)
    end
    ::lbl_66::
    if A9_2 then
      L11_2 = type
      L12_2 = A9_2
      L11_2 = L11_2(L12_2)
      if "table" ~= L11_2 then
        L11_2 = A9_2.model
        if L11_2 then
          goto lbl_90
        end
      end
      L11_2 = ProgressBar
      L11_2 = L11_2.PlayerProps
      L12_2 = ProgressBar
      L12_2 = L12_2.PlayerProps
      L12_2 = #L12_2
      L12_2 = L12_2 + 1
      L13_2 = L0_1
      L14_2 = PlayerPedId
      L14_2 = L14_2()
      L15_2 = A9_2
      L13_2 = L13_2(L14_2, L15_2)
      L11_2[L12_2] = L13_2
      goto lbl_93
      ::lbl_90::
      L11_2 = debugPrint
      L12_2 = "[^2PROGRESSBAR^7] [^1ERROR^7] Could not add prop for argument [prop2]. Parameter is not an object!"
      L11_2(L12_2)
    end
    ::lbl_93::
    if A7_2 then
      L11_2 = A7_2.task
      if L11_2 then
        L11_2 = A7_2.task
        A7_2.scenario = L11_2
      end
      L11_2 = A7_2.animDict
      if L11_2 then
        L11_2 = A7_2.animDict
        A7_2.dict = L11_2
      end
      L11_2 = A7_2.anim
      if L11_2 then
        L11_2 = A7_2.anim
        A7_2.clip = L11_2
      end
      L11_2 = A7_2.flags
      if L11_2 then
        L11_2 = A7_2.flags
        A7_2.flag = L11_2
      end
      L11_2 = A7_2.dict
      if L11_2 then
        L11_2 = type
        L12_2 = A7_2.dict
        L11_2 = L11_2(L12_2)
        if "string" ~= L11_2 then
          goto lbl_194
        end
        L11_2 = DoesAnimDictExist
        L12_2 = A7_2.dict
        L11_2 = L11_2(L12_2)
        if not L11_2 then
          goto lbl_194
        end
        L11_2 = HasAnimDictLoaded
        L12_2 = A7_2.dict
        L11_2 = L11_2(L12_2)
        if not L11_2 then
          L11_2 = RequestAnimDict
          L12_2 = A7_2.dict
          L11_2(L12_2)
          while true do
            L11_2 = HasAnimDictLoaded
            L12_2 = A7_2.dict
            L11_2 = L11_2(L12_2)
            if L11_2 then
              break
            end
            L11_2 = Wait
            L12_2 = 10
            L11_2(L12_2)
          end
        end
        L11_2 = TaskPlayAnim
        L12_2 = PlayerPedId
        L12_2 = L12_2()
        L13_2 = A7_2.dict
        L14_2 = A7_2.clip
        L15_2 = A7_2.blendIn
        if not L15_2 then
          L15_2 = 3.0
        end
        L16_2 = A7_2.blendOut
        if not L16_2 then
          L16_2 = 1.0
        end
        L17_2 = A7_2.duration
        if not L17_2 then
          L17_2 = -1
        end
        L18_2 = A7_2.flag
        if not L18_2 then
          L18_2 = 49
        end
        L19_2 = A7_2.playbackRate
        if not L19_2 then
          L19_2 = 0
        end
        L20_2 = A7_2.lockX
        L21_2 = A7_2.lockY
        L22_2 = A7_2.lockZ
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L11_2 = RemoveAnimDict
        L12_2 = A7_2.dict
        L11_2(L12_2)
      else
        L11_2 = A7_2.scenario
        if L11_2 then
          L11_2 = TaskStartScenarioInPlace
          L12_2 = PlayerPedId
          L12_2 = L12_2()
          L13_2 = A7_2.scenario
          L14_2 = 0
          L15_2 = A7_2.playEnter
          if nil ~= L15_2 then
            L15_2 = A7_2.playEnter
            if L15_2 then
              goto lbl_193
            end
          end
          L15_2 = true
          ::lbl_193::
          L11_2(L12_2, L13_2, L14_2, L15_2)
        end
      end
    end
    ::lbl_194::
    while true do
      L11_2 = ProgressBar
      L11_2 = L11_2.IsActive
      if not L11_2 then
        break
      end
      if A6_2 then
        L11_2 = type
        L12_2 = A6_2
        L11_2 = L11_2(L12_2)
        if "table" == L11_2 then
          L11_2 = ProgressBar
          L11_2 = L11_2.Thread
          L12_2 = A6_2
          L11_2(L12_2)
        end
      end
      L11_2 = Wait
      L12_2 = 0
      L11_2(L12_2)
    end
    if A8_2 or A9_2 then
      L11_2 = ProgressBar
      L11_2 = L11_2.PlayerProps
      L11_2 = #L11_2
      if L11_2 > 0 then
        L11_2 = ipairs
        L12_2 = ProgressBar
        L12_2 = L12_2.PlayerProps
        L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
        for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
          L17_2 = DoesEntityExist
          L18_2 = L16_2
          L17_2 = L17_2(L18_2)
          if L17_2 then
            L17_2 = DeleteEntity
            L18_2 = L16_2
            L17_2(L18_2)
          end
        end
      end
    end
    if A7_2 then
      L11_2 = A7_2.dict
      if L11_2 then
        L11_2 = StopAnimTask
        L12_2 = PlayerPedId
        L12_2 = L12_2()
        L13_2 = A7_2.dict
        L14_2 = A7_2.clip
        L15_2 = 1.0
        L11_2(L12_2, L13_2, L14_2, L15_2)
        L11_2 = Wait
        L12_2 = 0
        L11_2(L12_2)
      else
        L11_2 = ClearPedTasks
        L12_2 = PlayerPedId
        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2()
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      end
    end
    L11_2 = TriggerEvent
    L12_2 = "ZSX_UIV2:ProgressComplete"
    L11_2(L12_2)
    L11_2 = NUI
    L11_2 = L11_2.SendMessage
    L12_2 = "PROGRESS_BAR_REMOVE"
    L13_2 = {}
    L11_2(L12_2, L13_2)
    if A3_2 then
      L11_2 = ProgressBar
      L11_2 = L11_2.LeftState
      if "DONE" == L11_2 then
        L11_2 = A3_2
        L11_2()
      end
    end
    if A4_2 then
      L11_2 = ProgressBar
      L11_2 = L11_2.LeftState
      if "CANCELED" == L11_2 then
        L11_2 = A4_2
        L11_2()
      end
    end
    L11_2 = ProgressBar
    L11_2 = L11_2.LeftState
    L11_2 = "DONE" == L11_2
    return L11_2
  else
    L11_2 = Wait
    L12_2 = 50
    L11_2(L12_2)
    L11_2 = Citizen
    L11_2 = L11_2.CreateThread
    function L12_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = NUI
      L0_3 = L0_3.SendMessage
      L1_3 = "PROGRESS_BAR_INIT"
      L2_3 = {}
      L3_3 = A1_2
      L2_3.text = L3_3
      L3_3 = A0_2
      L2_3.icon = L3_3
      L3_3 = A2_2
      L2_3.duration = L3_3
      L0_3(L1_3, L2_3)
      L0_3 = ProgressBar
      L1_3 = A5_2
      L1_3 = true == L1_3
      L0_3.CanCancel = L1_3
      L0_3 = ProgressBar
      L0_3.LeftState = -1
      L0_3 = ProgressBar
      L0_3.IsActive = true
      while true do
        L0_3 = ProgressBar
        L0_3 = L0_3.IsActive
        if not L0_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 10
        L0_3(L1_3)
      end
      L0_3 = NUI
      L0_3 = L0_3.SendMessage
      L1_3 = "PROGRESS_BAR_REMOVE"
      L2_3 = {}
      L0_3(L1_3, L2_3)
      L0_3 = ProgressBar
      L0_3 = L0_3.LeftState
      if "DONE" == L0_3 then
        L0_3 = TriggerEvent
        L1_3 = "ZSX_UIV2:ProgressComplete"
        L0_3(L1_3)
      end
    end
    L11_2(L12_2)
  end
end
L1_1.Create = L2_1
L1_1 = ProgressBar
function L2_1()
  local L0_2, L1_2
  L0_2 = ProgressBar
  L0_2 = L0_2.IsActive
  return L0_2
end
L1_1.IsCurrentlyActive = L2_1
L1_1 = ProgressBar
function L2_1()
  local L0_2, L1_2
  L0_2 = ProgressBar
  L0_2 = L0_2.IsActive
  if not L0_2 then
    L0_2 = debugPrint
    L1_2 = "[^1ERROR^7] Non-active progressbar. Returning cancel event."
    return L0_2(L1_2)
  end
  L0_2 = ProgressBar
  L0_2 = L0_2.CanCancel
  if not L0_2 then
    L0_2 = debugPrint
    L1_2 = "[^1ERROR^7] Can not cancel progressbar."
    return L0_2(L1_2)
  end
  L0_2 = ProgressBar
  L0_2.LeftState = "CANCELED"
  L0_2 = ProgressBar
  L0_2.IsActive = false
end
L1_1.Cancel = L2_1
L1_1 = ProgressBar
function L2_1()
  local L0_2, L1_2
  L0_2 = ProgressBar
  L0_2 = L0_2.IsActive
  if not L0_2 then
    L0_2 = debugPrint
    L1_2 = "[^1ERROR^7] Non-active progressbar. Returning complete event."
    return L0_2(L1_2)
  end
  L0_2 = ProgressBar
  L0_2.LeftState = "DONE"
  L0_2 = ProgressBar
  L0_2.IsActive = false
end
L1_1.Finish = L2_1
L1_1 = RegisterNUICallback
L2_1 = "progress.onFinish"
L3_1 = ProgressBar
L3_1 = L3_1.Finish
L1_1(L2_1, L3_1)
L1_1 = RegisterCommand
L2_1 = Config
L2_1 = L2_1.Commands
L2_1 = L2_1.cancel_progress
function L3_1()
  local L0_2, L1_2
  L0_2 = ProgressBar
  L0_2 = L0_2.Cancel
  L0_2()
end
L1_1(L2_1, L3_1)
