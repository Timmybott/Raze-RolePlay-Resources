local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = require
L1_1 = "glm"
L0_1 = L0_1(L1_1)
L1_1 = {}
Cameras = L1_1
L1_1 = Cameras
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L7_2 = GetGameTimer
  L7_2 = L7_2()
  L8_2 = A2_2.coords
  L9_2 = A2_2.rot
  L10_2 = A2_2.fov
  L11_2 = L7_2
  L12_2 = L7_2 + A3_2
  L13_2 = 1.0
  L14_2 = {}
  L15_2 = A1_2.coords
  L15_2 = L15_2.x
  L16_2 = L8_2.x
  L15_2 = L15_2 - L16_2
  L14_2.x = L15_2
  L15_2 = A1_2.coords
  L15_2 = L15_2.y
  L16_2 = L8_2.y
  L15_2 = L15_2 - L16_2
  L14_2.y = L15_2
  L15_2 = math
  L15_2 = L15_2.floor
  L16_2 = A1_2.coords
  L16_2 = L16_2.z
  L17_2 = L8_2.z
  L16_2 = L16_2 - L17_2
  L16_2 = L16_2 * 1000
  L15_2 = L15_2(L16_2)
  L15_2 = L15_2 / 1000
  L14_2.z = L15_2
  L15_2 = {}
  L16_2 = A1_2.rot
  L16_2 = L16_2.x
  L17_2 = L9_2.x
  L16_2 = L16_2 - L17_2
  L15_2.x = L16_2
  L16_2 = A1_2.rot
  L16_2 = L16_2.y
  L17_2 = L9_2.y
  L16_2 = L16_2 - L17_2
  L15_2.y = L16_2
  L16_2 = A1_2.rot
  L16_2 = L16_2.z
  L17_2 = L9_2.z
  L16_2 = L16_2 - L17_2
  L15_2.z = L16_2
  L16_2 = A1_2.fov
  L16_2 = L16_2 - L10_2
  L17_2 = {}
  L17_2.coord = L8_2
  L17_2.rot = L9_2
  L17_2.fov = L10_2
  L18_2 = shortestAngularDistance
  L19_2 = L17_2.rot
  L19_2 = L19_2.x
  L20_2 = A1_2.rot
  L20_2 = L20_2.x
  L18_2 = L18_2(L19_2, L20_2)
  L19_2 = shortestAngularDistance
  L20_2 = L17_2.rot
  L20_2 = L20_2.y
  L21_2 = A1_2.rot
  L21_2 = L21_2.y
  L19_2 = L19_2(L20_2, L21_2)
  L20_2 = shortestAngularDistance
  L21_2 = L17_2.rot
  L21_2 = L21_2.z
  L22_2 = A1_2.rot
  L22_2 = L22_2.z
  L20_2 = L20_2(L21_2, L22_2)
  L21_2 = Citizen
  L21_2 = L21_2.CreateThread
  function L22_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    while true do
      L0_3 = L11_2
      L1_3 = L12_2
      if not (L0_3 < L1_3) then
        break
      end
      L0_3 = L11_2
      L1_3 = L7_2
      L0_3 = L0_3 - L1_3
      L1_3 = A3_2
      L0_3 = L0_3 / L1_3
      L1_3 = cubicBezier
      L2_3 = L0_3
      L3_3 = A5_2
      if L3_3 then
        L3_3 = A5_2
        L3_3 = L3_3[1]
        if L3_3 then
          goto lbl_22
        end
      end
      L3_3 = 0
      ::lbl_22::
      L4_3 = A5_2
      if L4_3 then
        L4_3 = A5_2
        L4_3 = L4_3[2]
        if L4_3 then
          goto lbl_30
        end
      end
      L4_3 = 0.5
      ::lbl_30::
      L5_3 = A5_2
      if L5_3 then
        L5_3 = A5_2
        L5_3 = L5_3[3]
        if L5_3 then
          goto lbl_38
        end
      end
      L5_3 = 1
      ::lbl_38::
      L6_3 = A5_2
      if L6_3 then
        L6_3 = A5_2
        L6_3 = L6_3[4]
        if L6_3 then
          goto lbl_46
        end
      end
      L6_3 = 1
      ::lbl_46::
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
      L2_3 = L13_2
      L2_3 = L1_3 * L2_3
      L3_3 = vector3
      L4_3 = L14_2.x
      L4_3 = L4_3 * L2_3
      L5_3 = L17_2.coord
      L5_3 = L5_3.x
      L4_3 = L4_3 + L5_3
      L5_3 = L14_2.y
      L5_3 = L5_3 * L2_3
      L6_3 = L17_2.coord
      L6_3 = L6_3.y
      L5_3 = L5_3 + L6_3
      L6_3 = math
      L6_3 = L6_3.floor
      L7_3 = L14_2.z
      L7_3 = L7_3 * L2_3
      L8_3 = L17_2.coord
      L8_3 = L8_3.z
      L7_3 = L7_3 + L8_3
      L7_3 = L7_3 * 1000
      L6_3 = L6_3(L7_3)
      L6_3 = L6_3 / 1000
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L4_3 = vector3
      L5_3 = smoothTransition
      L6_3 = L17_2.rot
      L6_3 = L6_3.x
      L7_3 = L18_2
      L8_3 = L2_3
      L5_3 = L5_3(L6_3, L7_3, L8_3)
      L6_3 = smoothTransition
      L7_3 = L17_2.rot
      L7_3 = L7_3.y
      L8_3 = L19_2
      L9_3 = L2_3
      L6_3 = L6_3(L7_3, L8_3, L9_3)
      L7_3 = smoothTransition
      L8_3 = L17_2.rot
      L8_3 = L8_3.z
      L9_3 = L20_2
      L10_3 = L2_3
      L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3, L9_3, L10_3)
      L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
      L5_3 = L16_2
      L5_3 = L5_3 * L2_3
      L6_3 = L17_2.fov
      L5_3 = L5_3 + L6_3
      L6_3 = SetCamCoord
      L7_3 = A0_2
      L8_3 = L3_3
      L6_3(L7_3, L8_3)
      L6_3 = SetCamRot
      L7_3 = A0_2
      L8_3 = L4_3
      L9_3 = A4_2
      L6_3(L7_3, L8_3, L9_3)
      L6_3 = SetCamFov
      L7_3 = A0_2
      L8_3 = L5_3
      L6_3(L7_3, L8_3)
      L6_3 = GetGameTimer
      L6_3 = L6_3()
      L11_2 = L6_3
      L6_3 = Wait
      L7_3 = 0
      L6_3(L7_3)
    end
    L0_3 = A6_2
    if nil ~= L0_3 then
      L0_3 = A6_2
      L0_3()
    end
  end
  L21_2(L22_2)
end
L1_1.CamEaseIn = L2_1
L1_1 = Cameras
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L7_2 = GetGameTimer
  L7_2 = L7_2()
  L8_2 = A2_2.coords
  L9_2 = A2_2.rot
  L10_2 = A2_2.fov
  L11_2 = L7_2
  L12_2 = L7_2 + A3_2
  L13_2 = 1.0
  L14_2 = {}
  L15_2 = A1_2.coords
  L15_2 = L15_2.x
  L16_2 = L8_2.x
  L15_2 = L15_2 - L16_2
  L14_2.x = L15_2
  L15_2 = A1_2.coords
  L15_2 = L15_2.y
  L16_2 = L8_2.y
  L15_2 = L15_2 - L16_2
  L14_2.y = L15_2
  L15_2 = math
  L15_2 = L15_2.floor
  L16_2 = A1_2.coords
  L16_2 = L16_2.z
  L17_2 = L8_2.z
  L16_2 = L16_2 - L17_2
  L16_2 = L16_2 * 1000
  L15_2 = L15_2(L16_2)
  L15_2 = L15_2 / 1000
  L14_2.z = L15_2
  L15_2 = {}
  L16_2 = A1_2.rot
  L16_2 = L16_2.x
  L17_2 = L9_2.x
  L16_2 = L16_2 - L17_2
  L15_2.x = L16_2
  L16_2 = A1_2.rot
  L16_2 = L16_2.y
  L17_2 = L9_2.y
  L16_2 = L16_2 - L17_2
  L15_2.y = L16_2
  L16_2 = A1_2.rot
  L16_2 = L16_2.z
  L17_2 = L9_2.z
  L16_2 = L16_2 - L17_2
  L15_2.z = L16_2
  L16_2 = A1_2.fov
  L16_2 = L16_2 - L10_2
  L17_2 = {}
  L17_2.coord = L8_2
  L17_2.rot = L9_2
  L17_2.fov = L10_2
  L18_2 = shortestAngularDistance
  L19_2 = L17_2.rot
  L19_2 = L19_2.x
  L20_2 = A1_2.rot
  L20_2 = L20_2.x
  L18_2 = L18_2(L19_2, L20_2)
  L19_2 = shortestAngularDistance
  L20_2 = L17_2.rot
  L20_2 = L20_2.y
  L21_2 = A1_2.rot
  L21_2 = L21_2.y
  L19_2 = L19_2(L20_2, L21_2)
  L20_2 = shortestAngularDistance
  L21_2 = L17_2.rot
  L21_2 = L21_2.z
  L22_2 = A1_2.rot
  L22_2 = L22_2.z
  L20_2 = L20_2(L21_2, L22_2)
  L21_2 = Citizen
  L21_2 = L21_2.CreateThread
  function L22_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    while true do
      L0_3 = L11_2
      L1_3 = L12_2
      if not (L0_3 < L1_3) then
        break
      end
      L0_3 = L11_2
      L1_3 = L7_2
      L0_3 = L0_3 - L1_3
      L1_3 = A3_2
      L0_3 = L0_3 / L1_3
      L1_3 = cubicBezier
      L2_3 = L0_3
      L3_3 = A5_2
      if L3_3 then
        L3_3 = A5_2
        L3_3 = L3_3[1]
        if L3_3 then
          goto lbl_22
        end
      end
      L3_3 = 0
      ::lbl_22::
      L4_3 = A5_2
      if L4_3 then
        L4_3 = A5_2
        L4_3 = L4_3[2]
        if L4_3 then
          goto lbl_30
        end
      end
      L4_3 = 0.5
      ::lbl_30::
      L5_3 = A5_2
      if L5_3 then
        L5_3 = A5_2
        L5_3 = L5_3[3]
        if L5_3 then
          goto lbl_38
        end
      end
      L5_3 = 1
      ::lbl_38::
      L6_3 = A5_2
      if L6_3 then
        L6_3 = A5_2
        L6_3 = L6_3[4]
        if L6_3 then
          goto lbl_46
        end
      end
      L6_3 = 1
      ::lbl_46::
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
      L2_3 = L13_2
      L2_3 = L1_3 * L2_3
      L3_3 = vector3
      L4_3 = L14_2.x
      L4_3 = L4_3 * L2_3
      L5_3 = L17_2.coord
      L5_3 = L5_3.x
      L4_3 = L4_3 + L5_3
      L5_3 = L14_2.y
      L5_3 = L5_3 * L2_3
      L6_3 = L17_2.coord
      L6_3 = L6_3.y
      L5_3 = L5_3 + L6_3
      L6_3 = math
      L6_3 = L6_3.floor
      L7_3 = L14_2.z
      L7_3 = L7_3 * L2_3
      L8_3 = L17_2.coord
      L8_3 = L8_3.z
      L7_3 = L7_3 + L8_3
      L7_3 = L7_3 * 1000
      L6_3 = L6_3(L7_3)
      L6_3 = L6_3 / 1000
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L4_3 = vector3
      L5_3 = smoothTransition
      L6_3 = L17_2.rot
      L6_3 = L6_3.x
      L7_3 = L18_2
      L8_3 = L2_3
      L5_3 = L5_3(L6_3, L7_3, L8_3)
      L6_3 = smoothTransition
      L7_3 = L17_2.rot
      L7_3 = L7_3.y
      L8_3 = L19_2
      L9_3 = L2_3
      L6_3 = L6_3(L7_3, L8_3, L9_3)
      L7_3 = smoothTransition
      L8_3 = L17_2.rot
      L8_3 = L8_3.z
      L9_3 = L20_2
      L10_3 = L2_3
      L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3, L9_3, L10_3)
      L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
      L5_3 = L16_2
      L5_3 = L5_3 * L2_3
      L6_3 = L17_2.fov
      L5_3 = L5_3 + L6_3
      L6_3 = SetFlyCamCoordAndConstrain
      L7_3 = A0_2
      L8_3 = L3_3
      L6_3(L7_3, L8_3)
      L6_3 = SetCamRot
      L7_3 = A0_2
      L8_3 = L4_3
      L9_3 = A4_2
      L6_3(L7_3, L8_3, L9_3)
      L6_3 = SetCamFov
      L7_3 = A0_2
      L8_3 = L5_3
      L6_3(L7_3, L8_3)
      L6_3 = GetGameTimer
      L6_3 = L6_3()
      L11_2 = L6_3
      L6_3 = Wait
      L7_3 = 0
      L6_3(L7_3)
    end
    L0_3 = A6_2
    if nil ~= L0_3 then
      L0_3 = A6_2
      L0_3()
    end
  end
  L21_2(L22_2)
end
L1_1.CamEaseInFly = L2_1
L1_1 = RegisterCommand
L2_1 = "testrotset"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = tonumber
  L4_2 = A1_2[1]
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 + 0.0
  L4_2 = tonumber
  L5_2 = A1_2[2]
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 + 0.0
  L5_2 = tonumber
  L6_2 = A1_2[3]
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2 + 0.0
  L6_2 = SetCamRot
  L7_2 = Entity
  L7_2 = L7_2.Vars
  L7_2 = L7_2.MainCamera
  L8_2 = L3_2
  L9_2 = L4_2
  L10_2 = L5_2
  L11_2 = 2
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
end
L1_1(L2_1, L3_1)
L1_1 = Cameras
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L6_2 = GetGameTimer
  L6_2 = L6_2()
  L7_2 = A2_2
  L8_2 = L6_2
  L9_2 = L6_2 + A3_2
  L10_2 = 1.0
  L11_2 = {}
  L12_2 = A1_2.x
  L13_2 = L7_2.x
  L12_2 = L12_2 - L13_2
  L11_2.x = L12_2
  L12_2 = A1_2.y
  L13_2 = L7_2.y
  L12_2 = L12_2 - L13_2
  L11_2.y = L12_2
  L12_2 = math
  L12_2 = L12_2.floor
  L13_2 = A1_2.z
  L14_2 = L7_2.z
  L13_2 = L13_2 - L14_2
  L13_2 = L13_2 * 1000
  L12_2 = L12_2(L13_2)
  L12_2 = L12_2 / 1000
  L11_2.z = L12_2
  L12_2 = {}
  L12_2.coord = L7_2
  L13_2 = Citizen
  L13_2 = L13_2.CreateThread
  function L14_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    while true do
      L0_3 = L8_2
      L1_3 = L9_2
      if not (L0_3 < L1_3) then
        break
      end
      L0_3 = L8_2
      L1_3 = L6_2
      L0_3 = L0_3 - L1_3
      L1_3 = A3_2
      L0_3 = L0_3 / L1_3
      L1_3 = cubicBezier
      L2_3 = L0_3
      L3_3 = A4_2
      if L3_3 then
        L3_3 = A4_2
        L3_3 = L3_3[1]
        if L3_3 then
          goto lbl_22
        end
      end
      L3_3 = 0
      ::lbl_22::
      L4_3 = A4_2
      if L4_3 then
        L4_3 = A4_2
        L4_3 = L4_3[2]
        if L4_3 then
          goto lbl_30
        end
      end
      L4_3 = 0.5
      ::lbl_30::
      L5_3 = A4_2
      if L5_3 then
        L5_3 = A4_2
        L5_3 = L5_3[3]
        if L5_3 then
          goto lbl_38
        end
      end
      L5_3 = 1
      ::lbl_38::
      L6_3 = A4_2
      if L6_3 then
        L6_3 = A4_2
        L6_3 = L6_3[4]
        if L6_3 then
          goto lbl_46
        end
      end
      L6_3 = 1
      ::lbl_46::
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
      L2_3 = L10_2
      L2_3 = L1_3 * L2_3
      L3_3 = vector3
      L4_3 = L11_2.x
      L4_3 = L4_3 * L2_3
      L5_3 = L12_2.coord
      L5_3 = L5_3.x
      L4_3 = L4_3 + L5_3
      L5_3 = L11_2.y
      L5_3 = L5_3 * L2_3
      L6_3 = L12_2.coord
      L6_3 = L6_3.y
      L5_3 = L5_3 + L6_3
      L6_3 = math
      L6_3 = L6_3.floor
      L7_3 = L11_2.z
      L7_3 = L7_3 * L2_3
      L8_3 = L12_2.coord
      L8_3 = L8_3.z
      L7_3 = L7_3 + L8_3
      L7_3 = L7_3 * 1000
      L6_3 = L6_3(L7_3)
      L6_3 = L6_3 / 1000
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L4_3 = SetCamCoord
      L5_3 = A0_2
      L6_3 = L3_3
      L4_3(L5_3, L6_3)
      L4_3 = GetGameTimer
      L4_3 = L4_3()
      L8_2 = L4_3
      L4_3 = Wait
      L5_3 = 0
      L4_3(L5_3)
    end
    L0_3 = A5_2
    if nil ~= L0_3 then
      L0_3 = A5_2
      L0_3()
    end
  end
  L13_2(L14_2)
end
L1_1.CamEaseCoord = L2_1
L1_1 = Cameras
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L7_2 = GetGameTimer
  L7_2 = L7_2()
  L8_2 = A2_2
  L9_2 = L7_2
  L10_2 = L7_2 + A3_2
  L11_2 = 1.0
  L12_2 = {}
  L13_2 = A1_2.x
  L14_2 = L8_2.x
  L13_2 = L13_2 - L14_2
  L12_2.x = L13_2
  L13_2 = A1_2.y
  L14_2 = L8_2.y
  L13_2 = L13_2 - L14_2
  L12_2.y = L13_2
  L13_2 = A1_2.z
  L14_2 = L8_2.z
  L13_2 = L13_2 - L14_2
  L12_2.z = L13_2
  L13_2 = {}
  L13_2.rot = L8_2
  L14_2 = shortestAngularDistance
  L15_2 = A2_2.x
  L16_2 = A1_2.x
  L14_2 = L14_2(L15_2, L16_2)
  L15_2 = shortestAngularDistance
  L16_2 = A2_2.y
  L17_2 = A1_2.y
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = shortestAngularDistance
  L17_2 = A2_2.z
  L18_2 = A1_2.z
  L16_2 = L16_2(L17_2, L18_2)
  L17_2 = Citizen
  L17_2 = L17_2.CreateThread
  function L18_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    while true do
      L0_3 = L9_2
      L1_3 = L10_2
      if not (L0_3 < L1_3) then
        break
      end
      L0_3 = L9_2
      L1_3 = L7_2
      L0_3 = L0_3 - L1_3
      L1_3 = A3_2
      L0_3 = L0_3 / L1_3
      L1_3 = cubicBezier
      L2_3 = L0_3
      L3_3 = A6_2
      if L3_3 then
        L3_3 = A6_2
        L3_3 = L3_3[1]
        if L3_3 then
          goto lbl_22
        end
      end
      L3_3 = 0
      ::lbl_22::
      L4_3 = A6_2
      if L4_3 then
        L4_3 = A6_2
        L4_3 = L4_3[2]
        if L4_3 then
          goto lbl_30
        end
      end
      L4_3 = 0.5
      ::lbl_30::
      L5_3 = A6_2
      if L5_3 then
        L5_3 = A6_2
        L5_3 = L5_3[3]
        if L5_3 then
          goto lbl_38
        end
      end
      L5_3 = 1
      ::lbl_38::
      L6_3 = A6_2
      if L6_3 then
        L6_3 = A6_2
        L6_3 = L6_3[4]
        if L6_3 then
          goto lbl_46
        end
      end
      L6_3 = 1
      ::lbl_46::
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
      L2_3 = L11_2
      L2_3 = L1_3 * L2_3
      L3_3 = vector3
      L4_3 = smoothTransition
      L5_3 = A2_2.x
      L6_3 = L14_2
      L7_3 = L2_3
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      L5_3 = smoothTransition
      L6_3 = A2_2.y
      L7_3 = L15_2
      L8_3 = L2_3
      L5_3 = L5_3(L6_3, L7_3, L8_3)
      L6_3 = smoothTransition
      L7_3 = A2_2.z
      L8_3 = L16_2
      L9_3 = L2_3
      L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3, L8_3, L9_3)
      L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
      L4_3 = SetCamRot
      L5_3 = A0_2
      L6_3 = L3_3
      L7_3 = A4_2
      L4_3(L5_3, L6_3, L7_3)
      L4_3 = GetGameTimer
      L4_3 = L4_3()
      L9_2 = L4_3
      L4_3 = Wait
      L5_3 = 0
      L4_3(L5_3)
    end
    L0_3 = A5_2
    if nil ~= L0_3 then
      L0_3 = A5_2
      L0_3()
    end
  end
  L17_2(L18_2)
end
L1_1.CamEaseRot = L2_1
L1_1 = Cameras
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2)
  local L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L7_2 = GetGameTimer
  L7_2 = L7_2()
  L8_2 = A2_2.coords
  L9_2 = A2_2.rot
  L10_2 = A2_2.fov
  L11_2 = L7_2
  L12_2 = L7_2 + A3_2
  L13_2 = 1.0
  L14_2 = {}
  L15_2 = A1_2.coords
  L15_2 = L15_2.x
  L16_2 = L8_2.x
  L15_2 = L15_2 - L16_2
  L14_2.x = L15_2
  L15_2 = A1_2.coords
  L15_2 = L15_2.y
  L16_2 = L8_2.y
  L15_2 = L15_2 - L16_2
  L14_2.y = L15_2
  L15_2 = math
  L15_2 = L15_2.floor
  L16_2 = A1_2.coords
  L16_2 = L16_2.z
  L17_2 = L8_2.z
  L16_2 = L16_2 - L17_2
  L16_2 = L16_2 * 1000
  L15_2 = L15_2(L16_2)
  L15_2 = L15_2 / 1000
  L14_2.z = L15_2
  L15_2 = {}
  L16_2 = A1_2.rot
  L16_2 = L16_2.x
  L17_2 = L9_2.x
  L16_2 = L16_2 - L17_2
  L15_2.x = L16_2
  L16_2 = A1_2.rot
  L16_2 = L16_2.y
  L17_2 = L9_2.y
  L16_2 = L16_2 - L17_2
  L15_2.y = L16_2
  L16_2 = A1_2.rot
  L16_2 = L16_2.z
  L17_2 = L9_2.z
  L16_2 = L16_2 - L17_2
  L15_2.z = L16_2
  L16_2 = A1_2.fov
  L16_2 = L16_2 - L10_2
  L17_2 = {}
  L17_2.coord = L8_2
  L17_2.rot = L9_2
  L17_2.fov = L10_2
  L18_2 = shortestAngularDistance
  L19_2 = L17_2.rot
  L19_2 = L19_2.x
  L20_2 = A1_2.rot
  L20_2 = L20_2.x
  L18_2 = L18_2(L19_2, L20_2)
  L19_2 = shortestAngularDistance
  L20_2 = L17_2.rot
  L20_2 = L20_2.y
  L21_2 = A1_2.rot
  L21_2 = L21_2.y
  L19_2 = L19_2(L20_2, L21_2)
  L20_2 = shortestAngularDistance
  L21_2 = L17_2.rot
  L21_2 = L21_2.z
  L22_2 = A1_2.rot
  L22_2 = L22_2.z
  L20_2 = L20_2(L21_2, L22_2)
  while L11_2 < L12_2 do
    L21_2 = L11_2 - L7_2
    L21_2 = L21_2 / A3_2
    L22_2 = cubicBezier
    L23_2 = L21_2
    if A5_2 then
      L24_2 = A5_2[1]
      if L24_2 then
        goto lbl_97
      end
    end
    L24_2 = 0
    ::lbl_97::
    if A5_2 then
      L25_2 = A5_2[2]
      if L25_2 then
        goto lbl_103
      end
    end
    L25_2 = 0.5
    ::lbl_103::
    if A5_2 then
      L26_2 = A5_2[3]
      if L26_2 then
        goto lbl_109
      end
    end
    L26_2 = 1
    ::lbl_109::
    if A5_2 then
      L27_2 = A5_2[4]
      if L27_2 then
        goto lbl_115
      end
    end
    L27_2 = 1
    ::lbl_115::
    L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
    L23_2 = L22_2 * L13_2
    L24_2 = vector3
    L25_2 = L14_2.x
    L25_2 = L25_2 * L23_2
    L26_2 = L17_2.coord
    L26_2 = L26_2.x
    L25_2 = L25_2 + L26_2
    L26_2 = L14_2.y
    L26_2 = L26_2 * L23_2
    L27_2 = L17_2.coord
    L27_2 = L27_2.y
    L26_2 = L26_2 + L27_2
    L27_2 = math
    L27_2 = L27_2.floor
    L28_2 = L14_2.z
    L28_2 = L28_2 * L23_2
    L29_2 = L17_2.coord
    L29_2 = L29_2.z
    L28_2 = L28_2 + L29_2
    L28_2 = L28_2 * 1000
    L27_2 = L27_2(L28_2)
    L27_2 = L27_2 / 1000
    L24_2 = L24_2(L25_2, L26_2, L27_2)
    L25_2 = vector3
    L26_2 = smoothTransition
    L27_2 = L17_2.rot
    L27_2 = L27_2.x
    L28_2 = L18_2
    L29_2 = L23_2
    L26_2 = L26_2(L27_2, L28_2, L29_2)
    L27_2 = smoothTransition
    L28_2 = L17_2.rot
    L28_2 = L28_2.y
    L29_2 = L19_2
    L30_2 = L23_2
    L27_2 = L27_2(L28_2, L29_2, L30_2)
    L28_2 = smoothTransition
    L29_2 = L17_2.rot
    L29_2 = L29_2.z
    L30_2 = L20_2
    L31_2 = L23_2
    L28_2, L29_2, L30_2, L31_2 = L28_2(L29_2, L30_2, L31_2)
    L25_2 = L25_2(L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    L26_2 = L16_2 * L23_2
    L27_2 = L17_2.fov
    L26_2 = L26_2 + L27_2
    L27_2 = SetCamCoord
    L28_2 = A0_2
    L29_2 = L24_2
    L27_2(L28_2, L29_2)
    L27_2 = SetCamRot
    L28_2 = A0_2
    L29_2 = L25_2
    L30_2 = A4_2
    L27_2(L28_2, L29_2, L30_2)
    L27_2 = SetCamFov
    L28_2 = A0_2
    L29_2 = L26_2
    L27_2(L28_2, L29_2)
    L27_2 = GetGameTimer
    L27_2 = L27_2()
    L11_2 = L27_2
    L27_2 = Wait
    L28_2 = 0
    L27_2(L28_2)
  end
  if nil ~= A6_2 then
    L21_2 = A6_2
    L21_2()
  end
end
L1_1.AsyncEaseIn = L2_1
L1_1 = Cameras
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  if "left" == A0_2 then
    if A1_2 then
      L4_2 = GetOffsetFromEntityInWorldCoords
      L5_2 = L3_2
      L6_2 = -2.0
      L7_2 = 5.0
      L8_2 = 0.0
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      if A2_2 then
        L5_2 = NUI
        L5_2 = L5_2.HandleScreen
        L6_2 = A2_2
        L7_2 = A1_2
        L5_2(L6_2, L7_2)
      end
      L5_2 = Cameras
      L5_2 = L5_2.CamEaseIn
      L6_2 = Entity
      L6_2 = L6_2.Vars
      L6_2 = L6_2.MainCamera
      L7_2 = {}
      L7_2.coords = L4_2
      L8_2 = GetCamRot
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L10_2 = 2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.rot = L8_2
      L8_2 = GetCamFov
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L8_2 = L8_2(L9_2)
      L7_2.fov = L8_2
      L8_2 = {}
      L9_2 = GetCamCoord
      L10_2 = Entity
      L10_2 = L10_2.Vars
      L10_2 = L10_2.MainCamera
      L9_2 = L9_2(L10_2)
      L8_2.coords = L9_2
      L9_2 = GetCamRot
      L10_2 = Entity
      L10_2 = L10_2.Vars
      L10_2 = L10_2.MainCamera
      L11_2 = 2
      L9_2 = L9_2(L10_2, L11_2)
      L8_2.rot = L9_2
      L9_2 = GetCamFov
      L10_2 = Entity
      L10_2 = L10_2.Vars
      L10_2 = L10_2.MainCamera
      L9_2 = L9_2(L10_2)
      L8_2.fov = L9_2
      L9_2 = 700
      L10_2 = 2
      L11_2 = nil
      function L12_2()
        local L0_3, L1_3
        L0_3 = WorkerAfterSettingsInitiated
        L0_3()
      end
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    else
      if A2_2 then
        L4_2 = NUI
        L4_2 = L4_2.HandleScreen
        L5_2 = A2_2
        L6_2 = A1_2
        L4_2(L5_2, L6_2)
      end
      L4_2 = Cameras
      L4_2 = L4_2.CamEaseIn
      L5_2 = Entity
      L5_2 = L5_2.Vars
      L5_2 = L5_2.MainCamera
      L6_2 = {}
      L7_2 = Entity
      L7_2 = L7_2.Vars
      L7_2 = L7_2.BaseData
      L7_2 = L7_2.coords
      L6_2.coords = L7_2
      L7_2 = Entity
      L7_2 = L7_2.Vars
      L7_2 = L7_2.BaseData
      L7_2 = L7_2.rot
      L6_2.rot = L7_2
      L7_2 = GetCamFov
      L8_2 = Entity
      L8_2 = L8_2.Vars
      L8_2 = L8_2.MainCamera
      L7_2 = L7_2(L8_2)
      L6_2.fov = L7_2
      L7_2 = {}
      L8_2 = GetCamCoord
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L8_2 = L8_2(L9_2)
      L7_2.coords = L8_2
      L8_2 = GetCamRot
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L10_2 = 2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.rot = L8_2
      L8_2 = GetCamFov
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L8_2 = L8_2(L9_2)
      L7_2.fov = L8_2
      L8_2 = 700
      L9_2 = 2
      L10_2 = nil
      function L11_2()
        local L0_3, L1_3
        L0_3 = WorkerAfterSettingsUnloaded
        L0_3()
      end
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    end
  elseif "center" == A0_2 then
    if A1_2 then
      if A2_2 then
        L4_2 = NUI
        L4_2 = L4_2.HandleScreen
        L5_2 = A2_2
        L6_2 = A1_2
        L4_2(L5_2, L6_2)
      end
      L4_2 = Cameras
      L4_2 = L4_2.CamEaseIn
      L5_2 = Entity
      L5_2 = L5_2.Vars
      L5_2 = L5_2.MainCamera
      L6_2 = {}
      L7_2 = Entity
      L7_2 = L7_2.Vars
      L7_2 = L7_2.BaseData
      L7_2 = L7_2.centerData
      L7_2 = L7_2.coords
      L6_2.coords = L7_2
      L7_2 = Entity
      L7_2 = L7_2.Vars
      L7_2 = L7_2.BaseData
      L7_2 = L7_2.centerData
      L7_2 = L7_2.rot
      L6_2.rot = L7_2
      L7_2 = GetCamFov
      L8_2 = Entity
      L8_2 = L8_2.Vars
      L8_2 = L8_2.MainCamera
      L7_2 = L7_2(L8_2)
      L6_2.fov = L7_2
      L7_2 = {}
      L8_2 = GetCamCoord
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L8_2 = L8_2(L9_2)
      L7_2.coords = L8_2
      L8_2 = GetCamRot
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L10_2 = 2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.rot = L8_2
      L8_2 = GetCamFov
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L8_2 = L8_2(L9_2)
      L7_2.fov = L8_2
      L8_2 = 700
      L9_2 = 2
      L10_2 = nil
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    else
      if A2_2 then
        L4_2 = NUI
        L4_2 = L4_2.HandleScreen
        L5_2 = A2_2
        L6_2 = A1_2
        L4_2(L5_2, L6_2)
      end
      L4_2 = Cameras
      L4_2 = L4_2.CamEaseIn
      L5_2 = Entity
      L5_2 = L5_2.Vars
      L5_2 = L5_2.MainCamera
      L6_2 = {}
      L7_2 = Entity
      L7_2 = L7_2.Vars
      L7_2 = L7_2.BaseData
      L7_2 = L7_2.coords
      L6_2.coords = L7_2
      L7_2 = Entity
      L7_2 = L7_2.Vars
      L7_2 = L7_2.BaseData
      L7_2 = L7_2.rot
      L6_2.rot = L7_2
      L7_2 = GetCamFov
      L8_2 = Entity
      L8_2 = L8_2.Vars
      L8_2 = L8_2.MainCamera
      L7_2 = L7_2(L8_2)
      L6_2.fov = L7_2
      L7_2 = {}
      L8_2 = GetCamCoord
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L8_2 = L8_2(L9_2)
      L7_2.coords = L8_2
      L8_2 = GetCamRot
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L10_2 = 2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2.rot = L8_2
      L8_2 = GetCamFov
      L9_2 = Entity
      L9_2 = L9_2.Vars
      L9_2 = L9_2.MainCamera
      L8_2 = L8_2(L9_2)
      L7_2.fov = L8_2
      L8_2 = 700
      L9_2 = 2
      L10_2 = nil
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    end
  end
end
L1_1.HandleScreens = L2_1
L1_1 = Cameras
function L2_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = Citizen
    L1_2 = L1_2.CreateThread
    function L2_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L0_3
      L2_3 = 2000
      L3_3 = L0_3 + L2_3
      L4_3 = 0.0
      L5_3 = 30.0
      L6_3 = L5_3 - 12.3
      while L1_3 < L3_3 do
        L7_3 = L1_3 - L0_3
        L7_3 = L7_3 / L2_3
        L8_3 = 3.8 * L7_3
        L8_3 = L4_3 + L8_3
        L9_3 = L6_3 * L7_3
        L9_3 = L5_3 - L9_3
        L10_3 = SetCamFarDof
        L11_3 = Entity
        L11_3 = L11_3.Vars
        L11_3 = L11_3.MainCamera
        L12_3 = L9_3
        L10_3(L11_3, L12_3)
        L10_3 = SetCamDofStrength
        L11_3 = Entity
        L11_3 = L11_3.Vars
        L11_3 = L11_3.MainCamera
        L12_3 = L8_3
        L10_3(L11_3, L12_3)
        L10_3 = GetGameTimer
        L10_3 = L10_3()
        L1_3 = L10_3
        L10_3 = Citizen
        L10_3 = L10_3.Wait
        L11_3 = 0
        L10_3(L11_3)
      end
    end
    L1_2(L2_2)
  else
    L1_2 = Citizen
    L1_2 = L1_2.CreateThread
    function L2_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L0_3
      L2_3 = 2000
      L3_3 = L0_3 + L2_3
      L4_3 = GetCamDofStrength
      L5_3 = Entity
      L5_3 = L5_3.Vars
      L5_3 = L5_3.MainCamera
      L4_3 = L4_3(L5_3)
      L5_3 = GetCamFarDof
      L6_3 = Entity
      L6_3 = L6_3.Vars
      L6_3 = L6_3.MainCamera
      L5_3 = L5_3(L6_3)
      while L1_3 < L3_3 do
        L6_3 = L1_3 - L0_3
        L6_3 = L6_3 / L2_3
        L7_3 = L4_3 * L6_3
        L7_3 = L4_3 - L7_3
        L8_3 = 10.0
        L9_3 = SetCamFarDof
        L10_3 = Entity
        L10_3 = L10_3.Vars
        L10_3 = L10_3.MainCamera
        L11_3 = L8_3
        L9_3(L10_3, L11_3)
        L9_3 = SetCamDofStrength
        L10_3 = Entity
        L10_3 = L10_3.Vars
        L10_3 = L10_3.MainCamera
        L11_3 = L7_3
        L9_3(L10_3, L11_3)
        L9_3 = GetGameTimer
        L9_3 = L9_3()
        L1_3 = L9_3
        L9_3 = Citizen
        L9_3 = L9_3.Wait
        L10_3 = 0
        L9_3(L10_3)
      end
    end
    L1_2(L2_2)
  end
end
L1_1.HandleMotionBlur = L2_1
L1_1 = Cameras
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2 - A1_2
  L3_2 = quat
  L4_2 = vec
  L5_2 = 0
  L6_2 = 1
  L7_2 = 0
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2)
  return L3_2
end
L1_1.GetBasicQuaterion = L2_1
L1_1 = Cameras
L1_1._prevQuat = nil
L1_1 = vec3
L2_1 = 0
L3_1 = 0
L4_1 = 1
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = vec3
L3_1 = 0
L4_1 = 1
L5_1 = 0
L2_1 = L2_1(L3_1, L4_1, L5_1)
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A0_2.w
  L3_2 = A1_2.w
  L2_2 = L2_2 * L3_2
  L3_2 = A0_2.x
  L4_2 = A1_2.x
  L3_2 = L3_2 * L4_2
  L2_2 = L2_2 + L3_2
  L3_2 = A0_2.y
  L4_2 = A1_2.y
  L3_2 = L3_2 * L4_2
  L2_2 = L2_2 + L3_2
  L3_2 = A0_2.z
  L4_2 = A1_2.z
  L3_2 = L3_2 * L4_2
  L2_2 = L2_2 + L3_2
  return L2_2
end
L4_1 = Cameras
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if not A2_2 then
    A2_2 = 0.0
  end
  if not A3_2 then
    A3_2 = false
  end
  if not A4_2 then
    A4_2 = 0.0
  end
  L5_2 = L0_1.normalize
  L6_2 = A0_2 - A1_2
  L5_2 = L5_2(L6_2)
  L6_2 = L0_1.normalize
  L7_2 = L0_1.cross
  L8_2 = L5_2
  L9_2 = L1_1
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L7_2(L8_2, L9_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L7_2 = L0_1.length
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = 1.0E-4
  if L7_2 < L8_2 then
    L7_2 = L0_1.vec3
    L8_2 = 1
    L9_2 = 0
    L10_2 = 0
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L6_2 = L7_2
  end
  L7_2 = L0_1.cross
  L8_2 = L6_2
  L9_2 = L5_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = L0_1.mat3
  L9_2 = L6_2
  L10_2 = L5_2
  L11_2 = L7_2
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = L0_1.quat_cast
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  L10_2 = Cameras
  L10_2 = L10_2._prevQuat
  if L10_2 then
    L10_2 = L3_1
    L11_2 = Cameras
    L11_2 = L11_2._prevQuat
    L12_2 = L9_2
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 < 0 then
      L9_2 = -L9_2
    end
  end
  L10_2 = Cameras
  L10_2._prevQuat = L9_2
  L10_2 = L0_1.deg
  L11_2 = L0_1.eulerAngles
  L12_2 = L9_2
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  L11_2 = L0_1.vec3
  L12_2 = L10_2.x
  L12_2 = L12_2 + 180
  L12_2 = L12_2 + A2_2
  L12_2 = L12_2 % 360
  L12_2 = L12_2 - 180
  if A3_2 then
    L13_2 = L10_2.y
    L13_2 = L13_2 + A3_2
    L13_2 = L13_2 % 360
    if L13_2 then
      goto lbl_83
    end
  end
  L13_2 = 0.0
  ::lbl_83::
  L14_2 = L10_2.z
  L14_2 = L14_2 + 180
  L14_2 = L14_2 + A4_2
  L14_2 = L14_2 % 360
  L14_2 = L14_2 - 180
  return L11_2(L12_2, L13_2, L14_2)
end
L4_1.GetEulerRotationsFromCoords = L5_1
L4_1 = Cameras
L5_1 = {}
L4_1.Data = L5_1
function L4_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = 1
  L5_2 = L5_2 - A0_2
  L6_2 = A0_2 * A0_2
  L7_2 = L5_2 * L5_2
  L8_2 = L7_2 * L5_2
  L9_2 = L6_2 * A0_2
  L10_2 = L8_2 * A1_2
  L11_2 = 3 * L7_2
  L11_2 = L11_2 * A0_2
  L11_2 = L11_2 * A2_2
  L10_2 = L10_2 + L11_2
  L11_2 = 3 * L5_2
  L11_2 = L11_2 * L6_2
  L11_2 = L11_2 * A3_2
  L10_2 = L10_2 + L11_2
  L11_2 = L9_2 * A4_2
  L10_2 = L10_2 + L11_2
  return L10_2
end
cubicBezier = L4_1
function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2 - A0_2
  L3_2 = L2_2 + 180
  L3_2 = L3_2 % 360
  L2_2 = L3_2 - 180
  return L2_2
end
shortestAngularDistance = L4_1
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = A0_2 + A1_2
  L4_2 = shortestAngularDistance
  L5_2 = A0_2
  L6_2 = L3_2
  L7_2 = printOut
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L4_2 = L4_2 * A2_2
  L4_2 = A0_2 + L4_2
  return L4_2
end
smoothTransition = L4_1
