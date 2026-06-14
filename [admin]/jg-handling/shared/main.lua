local L0_1, L1_1
L0_1 = Locales
L1_1 = Config
L1_1 = L1_1.Locale
if not L1_1 then
  L1_1 = "en"
end
L0_1 = L0_1[L1_1]
Locale = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_10
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_10::
  L1_2 = GetVehicleNumberPlateText
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = L1_2
  L4_2 = "^%s*(.-)%s*$"
  L5_2 = "%1"
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  return L2_2
end
getTrimmedVehiclePlate = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A1_2 and A1_2 > 0 then
    L2_2 = A1_2 or L2_2
    if not A1_2 then
      L2_2 = 0
    end
    L3_2 = 10
    L2_2 = L3_2 ^ L2_2
    L3_2 = math
    L3_2 = L3_2.floor
    L4_2 = A0_2 * L2_2
    L4_2 = L4_2 + 0.5
    L3_2 = L3_2(L4_2)
    L3_2 = L3_2 / L2_2
    return L3_2
  end
  L2_2 = math
  L2_2 = L2_2.floor
  L3_2 = A0_2 + 0.5
  return L2_2(L3_2)
end
round = L0_1
