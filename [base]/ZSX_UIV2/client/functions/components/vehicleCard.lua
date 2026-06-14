local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
VehicleCard = L0_1
L0_1 = VehicleCard
L1_1 = {}
L2_1 = {}
L2_1.width = 1400
L2_1.height = 500
L1_1.dimensions = L2_1
L1_1.stream = "generic_texture_renderer"
L1_1.TXD_name = "zsx_ui_vehiclecard"
L2_1 = CreateRuntimeTxd
L3_1 = "zsx_ui_vehiclecard"
L4_1 = "_main"
L3_1 = L3_1 .. L4_1
L2_1 = L2_1(L3_1)
L1_1.TXD = L2_1
L2_1 = "https://cfx-nui-"
L3_1 = GetCurrentResourceName
L3_1 = L3_1()
L4_1 = "/sprites/vehiclecard.html"
L2_1 = L2_1 .. L3_1 .. L4_1
L1_1.URL = L2_1
L0_1.PreData = L1_1
L0_1 = VehicleCard
L1_1 = {}
L0_1.DUI = L1_1
L0_1 = VehicleCard
L0_1.ScaleformID = false
L0_1 = VehicleCard
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = VehicleCard
  L0_2 = L0_2.DUI
  L1_2 = CreateDui
  L2_2 = VehicleCard
  L2_2 = L2_2.PreData
  L2_2 = L2_2.URL
  L3_2 = VehicleCard
  L3_2 = L3_2.PreData
  L3_2 = L3_2.dimensions
  L3_2 = L3_2.width
  L4_2 = VehicleCard
  L4_2 = L4_2.PreData
  L4_2 = L4_2.dimensions
  L4_2 = L4_2.height
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L0_2.name = L1_2
  while true do
    L0_2 = IsDuiAvailable
    L1_2 = VehicleCard
    L1_2 = L1_2.DUI
    L1_2 = L1_2.name
    L0_2 = L0_2(L1_2)
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = VehicleCard
  L0_2 = L0_2.DUI
  L1_2 = GetDuiHandle
  L2_2 = VehicleCard
  L2_2 = L2_2.DUI
  L2_2 = L2_2.name
  L1_2 = L1_2(L2_2)
  L0_2.handle = L1_2
  L0_2 = VehicleCard
  L0_2 = L0_2.DUI
  L1_2 = CreateRuntimeTextureFromDuiHandle
  L2_2 = VehicleCard
  L2_2 = L2_2.PreData
  L2_2 = L2_2.TXD
  L3_2 = VehicleCard
  L3_2 = L3_2.PreData
  L3_2 = L3_2.TXD_name
  L4_2 = VehicleCard
  L4_2 = L4_2.DUI
  L4_2 = L4_2.handle
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L0_2.txt = L1_2
  L0_2 = debugPrint
  L1_2 = "[^2VEHICLE CARD^7] Invoked frame [/]"
  L0_2(L1_2)
end
L0_1.InvokeFrame = L1_1
L0_1 = VehicleCard
function L1_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = debugPrint
  L1_2 = "[^2VEHICLE CARD^7] Preparing Scaleform [/]"
  L0_2(L1_2)
  L0_2 = RequestScaleformMovie
  L1_2 = VehicleCard
  L1_2 = L1_2.PreData
  L1_2 = L1_2.stream
  L0_2 = L0_2(L1_2)
  while true do
    L1_2 = HasScaleformMovieLoaded
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
  L1_2 = debugPrint
  L2_2 = "[^2VEHICLE CARD^7] Scaleform created"
  L1_2(L2_2)
  L1_2 = VehicleCard
  L1_2.ScaleformID = L0_2
  L1_2 = PushScaleformMovieFunction
  L2_2 = VehicleCard
  L2_2 = L2_2.ScaleformID
  L3_2 = "SET_TEXTURE"
  L1_2(L2_2, L3_2)
  L1_2 = PushScaleformMovieMethodParameterString
  L2_2 = VehicleCard
  L2_2 = L2_2.PreData
  L2_2 = L2_2.TXD_name
  L3_2 = "_main"
  L2_2 = L2_2 .. L3_2
  L1_2(L2_2)
  L1_2 = PushScaleformMovieMethodParameterString
  L2_2 = VehicleCard
  L2_2 = L2_2.PreData
  L2_2 = L2_2.TXD_name
  L1_2(L2_2)
  L1_2 = PushScaleformMovieFunctionParameterInt
  L2_2 = 0
  L1_2(L2_2)
  L1_2 = PushScaleformMovieFunctionParameterInt
  L2_2 = 0
  L1_2(L2_2)
  L1_2 = PushScaleformMovieFunctionParameterInt
  L2_2 = 1400
  L1_2(L2_2)
  L1_2 = PushScaleformMovieFunctionParameterInt
  L2_2 = 500
  L1_2(L2_2)
  L1_2 = PopScaleformMovieFunctionVoid
  L1_2()
end
L0_1.PrepareScaleform = L1_1
L0_1 = VehicleCard
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = DrawScaleformMovie_3dSolid
  L3_2 = VehicleCard
  L3_2 = L3_2.ScaleformID
  L4_2 = A0_2
  L5_2 = 0.0
  L6_2 = 0.0
  L7_2 = A1_2.z
  L8_2 = 0.0
  L7_2 = L8_2 - L7_2
  L8_2 = 90.0
  L9_2 = 90.0
  L10_2 = 90.0
  L11_2 = 0.11
  L12_2 = 0.061875
  L13_2 = 1
  L14_2 = 0
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
L0_1.FrameTick = L1_1
L0_1 = VehicleCard
function L1_1(A0_2, A1_2)
end
L0_1.SetScreen = L1_1
L0_1 = VehicleCard
function L1_1()
  local L0_2, L1_2
  L0_2 = VehicleCard
  L0_2 = L0_2.ScaleformID
  if L0_2 then
    L0_2 = debugPrint
    L1_2 = "[^2VEHICLE CARD^7] Destroying [/]"
    L0_2(L1_2)
    L0_2 = SetScaleformMovieAsNoLongerNeeded
    L1_2 = VehicleCard
    L1_2 = L1_2.ScaleformID
    L0_2(L1_2)
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
    L0_2 = VehicleCard
    L0_2.ScaleformID = false
    L0_2 = debugPrint
    L1_2 = "[^2VEHICLE CARD^7] Destroyed"
    L0_2(L1_2)
  end
end
L0_1.Destroy = L1_1
