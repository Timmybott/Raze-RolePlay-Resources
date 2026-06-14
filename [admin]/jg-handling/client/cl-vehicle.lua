local L0_1, L1_1, L2_1, L3_1, L4_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = Entity
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2.state
  L3_2 = L2_2.editorHandlingApplied
  if L3_2 then
    L3_2 = L2_2.editorHandling
    if L3_2 then
      L3_2 = applyVehicleHandling
      L4_2 = A0_2
      L5_2 = L2_2.editorHandling
      L3_2(L4_2, L5_2)
      return
    end
  end
  L3_2 = GetEntityModel
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = lib
  L4_2 = L4_2.callback
  L4_2 = L4_2.await
  L5_2 = "jg-handling:server:lookup-vehicle-handling"
  L6_2 = false
  L7_2 = A1_2
  L8_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  if not L4_2 then
    return
  end
  L5_2 = json
  L5_2 = L5_2.decode
  L6_2 = L4_2.base_handling_data
  if not L6_2 then
    L6_2 = "{}"
  end
  L5_2 = L5_2(L6_2)
  L6_2 = json
  L6_2 = L6_2.decode
  L7_2 = L4_2.handling_data
  if not L7_2 then
    L7_2 = "{}"
  end
  L6_2 = L6_2(L7_2)
  L7_2 = applyVehicleHandling
  L8_2 = A0_2
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L8_2 = L2_2
  L7_2 = L2_2.set
  L9_2 = "baseHandling"
  L10_2 = L5_2
  L11_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L8_2 = L2_2
  L7_2 = L2_2.set
  L9_2 = "editorHandlingApplied"
  L10_2 = true
  L11_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2)
  L8_2 = L2_2
  L7_2 = L2_2.set
  L9_2 = "editorHandling"
  L10_2 = L6_2
  L11_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2)
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if not A0_2 or 0 == A0_2 then
    return
  end
  L1_2 = Framework
  L1_2 = L1_2.Client
  L1_2 = L1_2.GetPlate
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = L0_1
    L3_2 = A0_2
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
  end
end
L2_1 = lib
L2_1 = L2_1.onCache
L3_1 = "vehicle"
function L4_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetTimeout
  L1_2 = 1000
  function L2_2()
    local L0_3, L1_3
    L0_3 = L1_1
    L1_3 = cache
    L1_3 = L1_3.vehicle
    L0_3(L1_3)
  end
  L0_2(L1_2, L2_2)
end
L2_1(L3_1, L4_1)
L2_1 = cache
L2_1 = L2_1.vehicle
if L2_1 then
  L2_1 = L1_1
  L3_1 = cache
  L3_1 = L3_1.vehicle
  L2_1(L3_1)
end
