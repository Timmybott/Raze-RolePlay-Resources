local L0_1, L1_1, L2_1, L3_1, L4_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = string
  L3_2 = L3_2.sub
  L4_2 = A2_2
  L5_2 = 1
  L6_2 = 3
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if "vec" == L3_2 then
    L3_2 = GetVehicleHandlingVector
    L4_2 = A0_2
    L5_2 = A1_2 or L5_2
    if not A1_2 then
      L5_2 = "CHandlingData"
    end
    L6_2 = A2_2
    return L3_2(L4_2, L5_2, L6_2)
  else
    L3_2 = string
    L3_2 = L3_2.sub
    L4_2 = A2_2
    L5_2 = 1
    L6_2 = 1
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if "f" == L3_2 then
      L3_2 = tonumber
      L4_2 = string
      L4_2 = L4_2.format
      L5_2 = "%.6f"
      L6_2 = GetVehicleHandlingFloat
      L7_2 = A0_2
      L8_2 = A1_2 or L8_2
      if not A1_2 then
        L8_2 = "CHandlingData"
      end
      L9_2 = A2_2
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2, L8_2, L9_2)
      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
      return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    else
      L3_2 = GetVehicleHandlingInt
      L4_2 = A0_2
      L5_2 = A1_2 or L5_2
      if not A1_2 then
        L5_2 = "CHandlingData"
      end
      L6_2 = A2_2
      return L3_2(L4_2, L5_2, L6_2)
    end
  end
end
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if "audioNameHash" == A2_2 then
    return
  end
  if "nInitialDriveGears" == A2_2 then
    L4_2 = L0_1
    L5_2 = A0_2
    L6_2 = A1_2
    L7_2 = A2_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    if L4_2 then
      goto lbl_14
    end
  end
  L4_2 = nil
  ::lbl_14::
  if "fDriveBiasFront" == A2_2 then
    L5_2 = GetVehicleNumberOfWheels
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    if L5_2 >= 4 then
      L6_2 = SetVehicleWheelIsPowered
      L7_2 = A0_2
      L8_2 = 0
      L9_2 = A3_2 > 0
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = SetVehicleWheelIsPowered
      L7_2 = A0_2
      L8_2 = 1
      L9_2 = A3_2 > 0
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = SetVehicleWheelIsPowered
      L7_2 = A0_2
      L8_2 = 2
      L9_2 = A3_2 < 1
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = SetVehicleWheelIsPowered
      L7_2 = A0_2
      L8_2 = 3
      L9_2 = A3_2 < 1
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = SetVehicleWheelIsPowered
      L7_2 = A0_2
      L8_2 = 4
      L9_2 = A3_2 < 1
      L6_2(L7_2, L8_2, L9_2)
    end
  end
  L5_2 = string
  L5_2 = L5_2.sub
  L6_2 = A2_2
  L7_2 = 1
  L8_2 = 3
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if "vec" == L5_2 then
    L5_2 = SetVehicleHandlingVector
    L6_2 = A0_2
    L7_2 = A1_2 or L7_2
    if not A1_2 then
      L7_2 = "CHandlingData"
    end
    L8_2 = A2_2
    L9_2 = vector3
    L10_2 = A3_2.x
    if not L10_2 then
      L10_2 = 0
    end
    L11_2 = A3_2.y
    if not L11_2 then
      L11_2 = 0
    end
    L12_2 = A3_2.z
    if not L12_2 then
      L12_2 = 0
    end
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2, L11_2, L12_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  else
    L5_2 = string
    L5_2 = L5_2.sub
    L6_2 = A2_2
    L7_2 = 1
    L8_2 = 1
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    if "f" == L5_2 then
      L5_2 = SetVehicleHandlingFloat
      L6_2 = A0_2
      L7_2 = A1_2 or L7_2
      if not A1_2 then
        L7_2 = "CHandlingData"
      end
      L8_2 = A2_2
      L9_2 = A3_2 + 0.0
      L5_2(L6_2, L7_2, L8_2, L9_2)
    else
      L5_2 = SetVehicleHandlingInt
      L6_2 = A0_2
      L7_2 = A1_2 or L7_2
      if not A1_2 then
        L7_2 = "CHandlingData"
      end
      L8_2 = A2_2
      L9_2 = A3_2
      L5_2(L6_2, L7_2, L8_2, L9_2)
    end
  end
  if "nInitialDriveGears" == A2_2 and L4_2 ~= A3_2 then
    L5_2 = SetVehicleHighGear
    L6_2 = A0_2
    L7_2 = A3_2
    L5_2(L6_2, L7_2)
    L5_2 = Citizen
    L5_2 = L5_2.InvokeNative
    L6_2 = 2300828994
    L7_2 = A0_2
    L8_2 = A3_2
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = Citizen
    L5_2 = L5_2.InvokeNative
    L6_2 = 977626868
    L7_2 = A0_2
    L8_2 = A3_2
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = SetTimeout
    L6_2 = 11
    function L7_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = Citizen
      L0_3 = L0_3.InvokeNative
      L1_3 = 2300828994
      L2_3 = A0_2
      L3_3 = 1
      L0_3(L1_3, L2_3, L3_3)
    end
    L5_2(L6_2, L7_2)
  end
  L5_2 = GetVehicleTopSpeedModifier
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = ModifyVehicleTopSpeed
  L7_2 = A0_2
  if -1.0 == L5_2 then
    L8_2 = 1.0
    if L8_2 then
      goto lbl_152
    end
  end
  L8_2 = L5_2
  ::lbl_152::
  L6_2(L7_2, L8_2)
end
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = {}
  L3_2 = pairs
  L4_2 = HANDLING_KEY_CLASS_MAP
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    if "CHandlingData" == L8_2 or L8_2 == A1_2 then
      L9_2 = L0_1
      L10_2 = A0_2
      L11_2 = L8_2
      L12_2 = L7_2
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      if "AIHandling" == L7_2 then
        L10_2 = AI_HANDLING_HASH_MAP
        L10_2 = L10_2[L9_2]
        L2_2.AIHandling = L10_2
      elseif "handlingName" == L7_2 then
        L10_2 = GetDisplayNameFromVehicleModel
        L11_2 = GetEntityModel
        L12_2 = A0_2
        L11_2, L12_2 = L11_2(L12_2)
        L10_2 = L10_2(L11_2, L12_2)
        L2_2.handlingName = L10_2
      else
        L2_2[L7_2] = L9_2
      end
    end
  end
  L3_2 = GetEntityArchetypeName
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2.audioNameHash = L3_2
  return L2_2
end
getVehicleHandling = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not A0_2 or 0 == A0_2 then
    return
  end
  if A1_2 then
    L2_2 = type
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if "table" == L2_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L2_2 = pairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L1_1
    L9_2 = A0_2
    L10_2 = HANDLING_KEY_CLASS_MAP
    L10_2 = L10_2[L6_2]
    L11_2 = L6_2
    L12_2 = L7_2
    L8_2(L9_2, L10_2, L11_2, L12_2)
  end
end
applyVehicleHandling = L2_1
L2_1 = RegisterNUICallback
L3_1 = "close"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = exitTimingTool
  L2_2()
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = TriggerScreenblurFadeOut
  L3_2 = 200
  L2_2(L3_2)
  L2_2 = LocalPlayer
  L2_2 = L2_2.state
  L3_2 = L2_2
  L2_2 = L2_2.set
  L4_2 = "isBusy"
  L5_2 = false
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L2_1(L3_1, L4_1)
