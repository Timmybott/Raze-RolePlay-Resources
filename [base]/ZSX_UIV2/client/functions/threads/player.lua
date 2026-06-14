local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = Threads
L1_1 = {}
L0_1.Players = L1_1
L0_1 = Threads
L0_1 = L0_1.Players
L0_1.Use = false
L0_1 = Threads
L0_1 = L0_1.Players
L1_1 = {}
L1_1.ped = 0
L1_1.player = -1
L2_1 = vector3
L3_1 = 0
L4_1 = 0
L5_1 = 0
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1.coords = L2_1
L1_1.heading = 0
L0_1.Data = L1_1
L0_1 = Threads
L0_1 = L0_1.Players
function L1_1()
  local L0_2, L1_2
  L0_2 = Threads
  L0_2 = L0_2.Players
  L0_2.Use = true
  L0_2 = Threads
  L0_2 = L0_2.Players
  L0_2 = L0_2.Data
  L1_2 = PlayerId
  L1_2 = L1_2()
  L0_2.player = L1_2
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = Threads
      L0_3 = L0_3.Players
      L0_3 = L0_3.Use
      if not L0_3 then
        break
      end
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetEntityCoords
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = math
      L2_3 = L2_3.floor
      L3_3 = GetEntityHeading
      L4_3 = L0_3
      L3_3, L4_3 = L3_3(L4_3)
      L2_3 = L2_3(L3_3, L4_3)
      L3_3 = Threads
      L3_3 = L3_3.Players
      L3_3 = L3_3.Data
      L3_3.ped = L0_3
      L3_3 = Threads
      L3_3 = L3_3.Players
      L3_3 = L3_3.Data
      L3_3.coords = L1_3
      L3_3 = Threads
      L3_3 = L3_3.Players
      L3_3 = L3_3.Data
      L3_3.heading = L2_3
      L3_3 = Threads
      L3_3 = L3_3.Players
      L3_3 = L3_3.Data
      L4_3 = PlayerId
      L4_3 = L4_3()
      L3_3.player = L4_3
      L3_3 = Wait
      L4_3 = 200
      L3_3(L4_3)
    end
  end
  L0_2(L1_2)
end
L0_1.Init = L1_1
