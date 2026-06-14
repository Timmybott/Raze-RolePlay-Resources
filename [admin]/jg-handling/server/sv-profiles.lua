local L0_1, L1_1, L2_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-handling:server:create-profile"
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = hasEditorAccess
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = Framework
  L4_2 = L4_2.Server
  L4_2 = L4_2.GetPlayerInfo
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = Storage
  L5_2 = L5_2.createProfile
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = L4_2
  if L8_2 then
    L8_2 = L8_2.name
  end
  if not L8_2 then
    L8_2 = "Admin"
  end
  L9_2 = A3_2
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  return L5_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-handling:server:delete-profile"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = hasEditorAccess
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = Storage
  L2_2 = L2_2.deleteProfile
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  return L2_2
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-handling:server:get-profiles"
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = hasEditorAccess
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = Storage
  L4_2 = L4_2.getProfiles
  L5_2 = A1_2
  L6_2 = A2_2
  L7_2 = A3_2
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2)
  return L4_2, L5_2
end
L0_1(L1_1, L2_1)
