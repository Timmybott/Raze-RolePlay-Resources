local L0_1, L1_1, L2_1
L0_1 = RegisterNUICallback
L1_1 = "create-profile"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = A0_2.profileName
  L3_2 = A0_2.handlingData
  if L2_2 and L3_2 then
    L4_2 = type
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if "table" == L4_2 then
      goto lbl_18
    end
  end
  L4_2 = A1_2
  L5_2 = {}
  L5_2.error = true
  do return L4_2(L5_2) end
  ::lbl_18::
  L4_2 = cache
  L4_2 = L4_2.vehicle
  if not L4_2 then
    L5_2 = A1_2
    L6_2 = {}
    L6_2.error = true
    return L5_2(L6_2)
  end
  L5_2 = GetEntityArchetypeName
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = lib
  L6_2 = L6_2.callback
  L6_2 = L6_2.await
  L7_2 = "jg-handling:server:create-profile"
  L8_2 = false
  L9_2 = L2_2
  L10_2 = L5_2
  L11_2 = L3_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  if not L6_2 then
    L7_2 = A1_2
    L8_2 = {}
    L8_2.error = true
    return L7_2(L8_2)
  end
  L7_2 = A1_2
  L8_2 = {}
  L8_2.insertId = L6_2
  return L7_2(L8_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "delete-profile"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2.id
  L3_2 = lib
  L3_2 = L3_2.callback
  L3_2 = L3_2.await
  L4_2 = "jg-handling:server:delete-profile"
  L5_2 = false
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = {}
    L5_2.error = true
    return L4_2(L5_2)
  end
  L4_2 = A1_2
  L5_2 = true
  return L4_2(L5_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "get-profiles"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = A0_2.query
  L3_2 = A0_2.pageIndex
  L4_2 = A0_2.pageSize
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-handling:server:get-profiles"
  L7_2 = false
  L8_2 = L2_2
  L9_2 = L4_2
  L10_2 = L3_2 * L4_2
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  if not L5_2 then
    L7_2 = A1_2
    L8_2 = {}
    L8_2.error = true
    return L7_2(L8_2)
  end
  L7_2 = ipairs
  L8_2 = L5_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = L5_2[L11_2]
    L14_2 = Framework
    L14_2 = L14_2.Client
    L14_2 = L14_2.GetVehicleLabel
    L15_2 = L12_2.vehicle
    L14_2 = L14_2(L15_2)
    L13_2.vehicle_label = L14_2
  end
  L7_2 = A1_2
  L8_2 = {}
  L8_2.profiles = L5_2
  L9_2 = math
  L9_2 = L9_2.ceil
  L10_2 = L6_2 / L4_2
  L9_2 = L9_2(L10_2)
  L8_2.pageCount = L9_2
  return L7_2(L8_2)
end
L0_1(L1_1, L2_1)
