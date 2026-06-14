local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-handling:server:lookup-vehicle-handling"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = Storage
  L3_2 = L3_2.lookupVehicleHandling
  L4_2 = A1_2
  L5_2 = A2_2
  return L3_2(L4_2, L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-handling:server:save-vehicle-handling"
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L6_2 = hasEditorAccess
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = Storage
  L6_2 = L6_2.saveVehicleHandling
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L10_2 = A4_2
  L11_2 = A5_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  return L6_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-handling:server:delete-vehicle-handling"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = hasEditorAccess
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = Storage
  L3_2 = L3_2.deleteVehicleHandling
  L4_2 = A1_2
  L5_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2)
  return L3_2
end
L0_1(L1_1, L2_1)
