local L0_1, L1_1, L2_1
L0_1 = Threads
L1_1 = {}
L0_1.FPSCount = L1_1
L0_1 = Threads
L0_1 = L0_1.FPSCount
L1_1 = {}
L2_1 = GetFrameCount
L2_1 = L2_1()
L1_1.last = L2_1
L2_1 = GetFrameCount
L2_1 = L2_1()
L1_1.current = L2_1
L1_1.fps = 0
L1_1.lowestRecordedFPS = 99999
L2_1 = GetGameTimer
L2_1 = L2_1()
L1_1.startTime = L2_1
L1_1.notificationSerial = false
L0_1.Data = L1_1
L0_1 = Citizen
L0_1 = L0_1.CreateThread
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = LocalPlayer
  L0_2 = L0_2.state
  L1_2 = L0_2
  L0_2 = L0_2.set
  L2_2 = "LowFPSDetected"
  L3_2 = false
  L0_2(L1_2, L2_2, L3_2)
end
L0_1(L1_1)
L0_1 = Threads
L0_1 = L0_1.FPSCount
function L1_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.UseAutomaticOptimizationCheck
  if not L0_2 then
    return
  end
  L0_2 = debugPrint
  L1_2 = "[^6FPS COUNTER^7] Started calculating FPS [/]"
  L0_2(L1_2)
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = Threads
    L0_3 = L0_3.FPSCount
    L0_3 = L0_3.Data
    L1_3 = GetGameTimer
    L1_3 = L1_3()
    L0_3.startTime = L1_3
    L0_3 = startTime
    L1_3 = Threads
    L1_3 = L1_3.FPSCount
    L1_3 = L1_3.Data
    L1_3 = L1_3.startTime
    L1_3 = L1_3 + 5000
    while "current" do
      L2_3 = GetGameTimer
      L2_3 = L2_3()
      L0_3 = L2_3
      L2_3 = Threads
      L2_3 = L2_3.FPSCount
      L2_3 = L2_3.Data
      L3_3 = GetFrameCount
      L3_3 = L3_3()
      L2_3.current = L3_3
      L2_3 = Threads
      L2_3 = L2_3.FPSCount
      L2_3 = L2_3.Data
      L2_3 = L2_3.current
      L3_3 = Threads
      L3_3 = L3_3.FPSCount
      L3_3 = L3_3.Data
      L3_3 = L3_3.last
      L2_3 = L2_3 - L3_3
      L2_3 = L2_3 - 1
      L2_3 = L2_3 * 2
      L3_3 = Threads
      L3_3 = L3_3.FPSCount
      L3_3 = L3_3.Data
      L4_3 = Threads
      L4_3 = L4_3.FPSCount
      L4_3 = L4_3.Data
      L4_3 = L4_3.current
      L3_3.last = L4_3
      L3_3 = Threads
      L3_3 = L3_3.FPSCount
      L3_3 = L3_3.Data
      L4_3 = Threads
      L4_3 = L4_3.FPSCount
      L4_3 = L4_3.Data
      L4_3 = L4_3.lowestRecordedFPS
      L4_3 = L2_3 or L4_3
      if not (L2_3 < L4_3) or not L2_3 then
        L4_3 = Threads
        L4_3 = L4_3.FPSCount
        L4_3 = L4_3.Data
        L4_3 = L4_3.lowestRecordedFPS
      end
      L3_3.lowestRecordedFPS = L4_3
      L3_3 = Threads
      L3_3 = L3_3.FPSCount
      L3_3 = L3_3.Data
      L3_3.fps = L2_3
      L3_3 = Threads
      L3_3 = L3_3.FPSCount
      L3_3 = L3_3.Data
      L3_3 = L3_3.fps
      if L3_3 < 60 and L1_3 < L0_3 then
        L3_3 = LocalPlayer
        L3_3 = L3_3.state
        L3_3 = L3_3.LowFPSDetected
        if not L3_3 then
          L3_3 = LocalPlayer
          L3_3 = L3_3.state
          L4_3 = L3_3
          L3_3 = L3_3.set
          L5_3 = "LowFPSDetected"
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
      end
      else
        L3_3 = Threads
        L3_3 = L3_3.FPSCount
        L3_3 = L3_3.Data
        L3_3 = L3_3.fps
        if L3_3 > 60 and L1_3 < L0_3 then
          L3_3 = LocalPlayer
          L3_3 = L3_3.state
          L3_3 = L3_3.LowFPSDetected
          if L3_3 then
            L3_3 = LocalPlayer
            L3_3 = L3_3.state
            L4_3 = L3_3
            L3_3 = L3_3.set
            L5_3 = "LowFPSDetected"
            L6_3 = false
            L3_3(L4_3, L5_3, L6_3)
          end
        end
      end
      L3_3 = Wait
      L4_3 = 500
      L3_3(L4_3)
    end
  end
  L0_2(L1_2)
end
L0_1.Init = L1_1
