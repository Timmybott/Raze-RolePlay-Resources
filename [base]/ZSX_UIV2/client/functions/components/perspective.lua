local L0_1, L1_1, L2_1
L0_1 = {}
Perspective = L0_1
L0_1 = Perspective
L0_1.UseThread = false
L0_1 = Perspective
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.UsePerspective
  if L1_2 then
    L1_2 = Perspective
    L1_2.UseThread = A0_2
    L1_2 = Config
    L1_2 = L1_2.Intervals
    L1_2 = L1_2.perspective
    L1_2 = L1_2.active
    L2_2 = Citizen
    L2_2 = L2_2.CreateThread
    function L3_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
      L0_3 = nil
      L1_3 = nil
      while true do
        L2_3 = Perspective
        L2_3 = L2_3.UseThread
        if not L2_3 then
          break
        end
        L2_3 = GetGameplayCamRot
        L3_3 = 0
        L2_3 = L2_3(L3_3)
        L3_3 = L2_3.x
        L4_3 = L2_3.z
        if L0_3 then
          L5_3 = math
          L5_3 = L5_3.abs
          L6_3 = L3_3 - L0_3
          L5_3 = L5_3(L6_3)
          L6_3 = 0.05
          if not (L5_3 > L6_3) then
            L5_3 = math
            L5_3 = L5_3.abs
            L6_3 = L4_3 - L1_3
            L5_3 = L5_3(L6_3)
            L6_3 = 0.05
            if not (L5_3 > L6_3) then
              goto lbl_57
            end
          end
        end
        L5_3 = SendNUIMessage
        L6_3 = {}
        L6_3.type = "UPDATE_ROTATIONS"
        L7_3 = {}
        L8_3 = {}
        L8_3.x = L3_3
        L9_3 = 0.0
        L9_3 = L9_3 - L4_3
        L9_3 = L9_3 - 75.0
        L9_3 = L9_3 * 0.2
        L8_3.y = L9_3
        L8_3.z = 0.01
        L7_3.offsets = L8_3
        L6_3.data = L7_3
        L5_3(L6_3)
        L5_3 = L3_3
        L1_3 = L4_3
        L0_3 = L5_3
        L5_3 = Wait
        L6_3 = L1_2
        L5_3(L6_3)
        goto lbl_62
        ::lbl_57::
        L5_3 = Wait
        L6_3 = L1_2
        L6_3 = L6_3 + 50
        L5_3(L6_3)
        ::lbl_62::
      end
    end
    L2_2(L3_2)
  end
end
L0_1.Thread = L1_1
L0_1 = Perspective
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "SET_STATUS_VISIBILITY"
  L4_2 = {}
  L4_2.key = A0_2
  L4_2.state = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.SetStatusVisibility = L1_1
L0_1 = Perspective
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "SET_STATUS_VALUE"
  L4_2 = {}
  L4_2.key = A0_2
  L4_2.value = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.SetStatusValue = L1_1
L0_1 = Perspective
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "SET_PERSPECTIVE_CONTENT_VISIBILITY"
  L3_2 = {}
  L3_2.state = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.ShowHiddenContent = L1_1
L0_1 = Config
L0_1 = L0_1.UI
L0_1 = L0_1.StaticPerspective
if L0_1 then
  while true do
    L0_1 = NUI
    L0_1 = L0_1.Loaded
    if L0_1 then
      L0_1 = Storage
      L0_1 = L0_1.HasBeenSent
      if L0_1 then
        break
      end
    end
    L0_1 = Wait
    L1_1 = 100
    L0_1(L1_1)
  end
  L0_1 = Perspective
  L0_1 = L0_1.ShowHiddenContent
  L1_1 = true
  L0_1(L1_1)
end
L0_1 = RegisterCommand
L1_1 = "+"
L2_1 = Config
L2_1 = L2_1.Commands
L2_1 = L2_1["3d_perspective"]
L1_1 = L1_1 .. L2_1
function L2_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.StaticPerspective
  if L0_2 then
    return
  end
  L0_2 = Perspective
  L0_2 = L0_2.ShowHiddenContent
  L1_2 = true
  L0_2(L1_2)
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.Use3DVoiceIndicator
  if L0_2 then
    L0_2 = Voice
    L0_2 = L0_2.Init
    L1_2 = true
    L0_2(L1_2)
  else
    L0_2 = TopContent
    L0_2 = L0_2.SetScreen
    L1_2 = "proximity"
    L0_2(L1_2)
    L0_2 = TopContent
    L0_2 = L0_2.Init
    L1_2 = true
    L0_2(L1_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterCommand
L1_1 = "-"
L2_1 = Config
L2_1 = L2_1.Commands
L2_1 = L2_1["3d_perspective"]
L1_1 = L1_1 .. L2_1
function L2_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.StaticPerspective
  if L0_2 then
    return
  end
  L0_2 = Wait
  L1_2 = 250
  L0_2(L1_2)
  L0_2 = Perspective
  L0_2 = L0_2.ShowHiddenContent
  L1_2 = false
  L0_2(L1_2)
  L0_2 = Voice
  L0_2 = L0_2.Init
  L1_2 = false
  L0_2(L1_2)
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.Use3DVoiceIndicator
  if L0_2 then
    L0_2 = Voice
    L0_2 = L0_2.Init
    L1_2 = false
    L0_2(L1_2)
  else
    L0_2 = TopContent
    L0_2 = L0_2.Init
    L1_2 = false
    L0_2(L1_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = Perspective
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "UPDATE_ROTATIONS"
  L3_2 = {}
  L3_2.offsets = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.UpdateRotations = L1_1
L0_1 = Perspective
L0_1 = L0_1.Thread
L1_1 = true
L0_1(L1_1)
