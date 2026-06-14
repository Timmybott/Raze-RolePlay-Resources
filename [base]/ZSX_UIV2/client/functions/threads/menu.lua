local L0_1, L1_1
L0_1 = Threads
L1_1 = {}
L0_1.Menu = L1_1
L0_1 = Threads
L0_1 = L0_1.Menu
L0_1.Use = false
L0_1 = Threads
L0_1 = L0_1.Menu
function L1_1()
  local L0_2, L1_2
  L0_2 = Threads
  L0_2 = L0_2.Menu
  L0_2.Use = true
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3
    while true do
      L0_3 = Threads
      L0_3 = L0_3.Menu
      L0_3 = L0_3.Use
      if not L0_3 then
        break
      end
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = 172
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = NUI
        L0_3 = L0_3.SendMessage
        L1_3 = "MENU_ON_CHANGE"
        L2_3 = {}
        L2_3.isArrowUp = false
        L0_3(L1_3, L2_3)
      else
        L0_3 = IsControlJustPressed
        L1_3 = 0
        L2_3 = 173
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          L0_3 = NUI
          L0_3 = L0_3.SendMessage
          L1_3 = "MENU_ON_CHANGE"
          L2_3 = {}
          L2_3.isArrowUp = true
          L0_3(L1_3, L2_3)
        else
          L0_3 = IsControlJustPressed
          L1_3 = 0
          L2_3 = 177
          L0_3 = L0_3(L1_3, L2_3)
          if L0_3 then
            L0_3 = Menu
            L0_3 = L0_3.ForceClose
            L0_3()
          else
            L0_3 = IsControlJustPressed
            L1_3 = 0
            L2_3 = 191
            L0_3 = L0_3(L1_3, L2_3)
            if L0_3 then
              L0_3 = NUI
              L0_3 = L0_3.SendMessage
              L1_3 = "ON_MENU_SELECT"
              L2_3 = {}
              L0_3(L1_3, L2_3)
            end
          end
        end
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L0_2(L1_2)
end
L0_1.Init = L1_1
L0_1 = Threads
L0_1 = L0_1.Menu
function L1_1()
  local L0_2, L1_2
  L0_2 = Threads
  L0_2 = L0_2.Menu
  L0_2.Use = false
end
L0_1.Disable = L1_1
