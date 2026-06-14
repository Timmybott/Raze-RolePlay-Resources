local L0_1, L1_1, L2_1, L3_1
L0_1 = false
L1_1 = -1
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  while true do
    L0_2 = Wait
    L1_2 = 1000
    L0_2(L1_2)
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = GetInteriorAtCoords
    L3_2 = L1_2.x
    L4_2 = L1_2.y
    L5_2 = L1_2.z
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = GetInteriorAtCoords
    L4_2 = -326.075836
    L5_2 = -588.350952
    L6_2 = 36.8315964
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if L2_2 == L3_2 then
      L4_2 = vector3
      L5_2 = -326.075836
      L6_2 = -588.350952
      L7_2 = 36.8315964
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L4_2 = L1_2 - L4_2
      L4_2 = #L4_2
      if L4_2 <= 10.0 then
        L5_2 = L0_1
        if not L5_2 then
          L5_2 = vector3
          L6_2 = -326.075836
          L7_2 = -588.350952
          L8_2 = 36.8315964
          L5_2 = L5_2(L6_2, L7_2, L8_2)
          L6_2 = "water_rain_twinloop_1_reduced"
          L7_2 = GetSoundId
          L7_2 = L7_2()
          L1_1 = L7_2
          L7_2 = PlaySoundFromCoord
          L8_2 = L1_1
          L9_2 = L6_2
          L10_2 = L5_2.x
          L11_2 = L5_2.y
          L12_2 = L5_2.z
          L13_2 = ""
          L14_2 = false
          L15_2 = 0
          L16_2 = false
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          L7_2 = true
          L0_1 = L7_2
        end
      else
        L5_2 = L0_1
        if L5_2 then
          L5_2 = StopSound
          L6_2 = L1_1
          L5_2(L6_2)
          L5_2 = ReleaseSoundId
          L6_2 = L1_1
          L5_2(L6_2)
          L5_2 = false
          L0_1 = L5_2
        end
      end
    else
      L4_2 = L0_1
      if L4_2 then
        L4_2 = StopSound
        L5_2 = L1_1
        L4_2(L5_2)
        L4_2 = ReleaseSoundId
        L5_2 = L1_1
        L4_2(L5_2)
        L4_2 = false
        L0_1 = L4_2
      end
    end
  end
end
L2_1(L3_1)
