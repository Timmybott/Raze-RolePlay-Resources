local L0_1, L1_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = {}
  L3_2 = string
  L3_2 = L3_2.gmatch
  L4_2 = A0_2
  L5_2 = "([^"
  L6_2 = A1_2
  L7_2 = "]+)"
  L5_2 = L5_2 .. L6_2 .. L7_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2)
  for L7_2 in L3_2, L4_2, L5_2, L6_2 do
    L8_2 = string
    L8_2 = L8_2.gsub
    L9_2 = L7_2
    L10_2 = "^%s*(.-)%s*$"
    L11_2 = "%1"
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = table
    L9_2 = L9_2.insert
    L10_2 = L2_2
    L11_2 = L8_2
    L9_2(L10_2, L11_2)
  end
  return L2_2
end
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = Config
  L1_2 = L1_2.AutoRunSQL
  if L1_2 then
    L1_2 = pcall
    function L2_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = assert
      L1_3 = io
      L1_3 = L1_3.open
      L2_3 = GetResourcePath
      L3_3 = GetCurrentResourceName
      L3_3, L4_3 = L3_3()
      L2_3 = L2_3(L3_3, L4_3)
      L3_3 = "/install/database.sql"
      L2_3 = L2_3 .. L3_3
      L3_3 = "rb"
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3, L3_3)
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
      L2_3 = L0_3
      L1_3 = L0_3.read
      L3_3 = "*all"
      L1_3 = L1_3(L2_3, L3_3)
      L3_3 = L0_3
      L2_3 = L0_3.close
      L2_3(L3_3)
      L2_3 = L0_1
      L3_3 = L1_3
      L4_3 = ";"
      L2_3 = L2_3(L3_3, L4_3)
      -- File-based storage initialization is handled by Storage.init()
      L3_3 = A0_2
      L3_3()
    end
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = print
      L2_2 = "^1[STORAGE ERROR] There was an error while initializing file-based storage. Check console for details.^0"
      L1_2(L2_2)
    end
  end
end
initSQL = L1_1
