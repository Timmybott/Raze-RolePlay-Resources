local L0_1, L1_1
L0_1 = Data
L1_1 = {}
L0_1.Interface = L1_1
L0_1 = Data
L0_1 = L0_1.Interface
L1_1 = {}
L0_1.color = L1_1
L0_1 = Data
L0_1 = L0_1.Interface
L1_1 = {}
L0_1.hud = L1_1
L0_1 = Data
L0_1 = L0_1.Interface
L1_1 = {}
L0_1.carhud = L1_1
L0_1 = Data
L0_1 = L0_1.Interface
L1_1 = {}
L0_1.notify = L1_1
L0_1 = Data
L0_1 = L0_1.Interface
L1_1 = {}
L0_1.progressbar = L1_1
L0_1 = Data
L0_1 = L0_1.Interface
L1_1 = {}
L0_1.minimap = L1_1
L0_1 = Data
L0_1 = L0_1.Interface
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = Data
  L2_2 = L2_2.Interface
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = Data
    L2_2 = L2_2.Interface
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2[A1_2]
    if L2_2 then
      L2_2 = Data
      L2_2 = L2_2.Interface
      L2_2 = L2_2[A0_2]
      L2_2 = L2_2[A1_2]
      return L2_2
  end
  else
    L2_2 = "NO_DATA_FOUND"
    return L2_2
  end
end
L0_1.Get = L1_1
