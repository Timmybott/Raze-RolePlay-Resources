local L0_1, L1_1, L2_1
L0_1 = Threads
L1_1 = {}
L0_1.Weapon = L1_1
L0_1 = Threads
L0_1 = L0_1.Weapon
L0_1.Use = false
L0_1 = Threads
L0_1 = L0_1.Weapon
L1_1 = {}
L0_1.HashList = L1_1
L0_1 = Threads
L0_1 = L0_1.Weapon
L1_1 = {}
L0_1.BlackListHash = L1_1
L0_1 = Threads
L0_1 = L0_1.Weapon
L1_1 = {}
L1_1.weapon = -1
L2_1 = {}
L2_1.current = 0
L2_1.max = 0
L2_1.magazine = 0
L1_1.ammo = L2_1
L1_1.isPedAiming = false
L0_1.Data = L1_1
L0_1 = Threads
L0_1 = L0_1.Weapon
function L1_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.UI
  L0_2 = L0_2.UseWeaponIndicator
  if not L0_2 then
    return
  end
  L0_2 = Threads
  L0_2 = L0_2.Weapon
  L0_2.Use = true
  L0_2 = Citizen
  L0_2 = L0_2.CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    L0_3 = Config
    L0_3 = L0_3.Intervals
    L0_3 = L0_3.weapon
    L0_3 = L0_3.idle
    L1_3 = Threads
    L1_3 = L1_3.Weapon
    L1_3 = L1_3.Data
    L1_3.isPedAiming = false
    L1_3 = pairs
    L2_3 = Translations
    L2_3 = L2_3.Weapons
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = Threads
      L7_3 = L7_3.Weapon
      L7_3 = L7_3.HashList
      L8_3 = tostring
      L9_3 = GetHashKey
      L10_3 = L5_3
      L9_3, L10_3 = L9_3(L10_3)
      L8_3 = L8_3(L9_3, L10_3)
      L7_3[L8_3] = L6_3
    end
    L1_3 = pairs
    L2_3 = Config
    L2_3 = L2_3.WeaponBlacklist
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = Threads
      L7_3 = L7_3.Weapon
      L7_3 = L7_3.BlackListHash
      L8_3 = tostring
      L9_3 = GetHashKey
      L10_3 = L5_3
      L9_3, L10_3 = L9_3(L10_3)
      L8_3 = L8_3(L9_3, L10_3)
      L7_3[L8_3] = true
    end
    while true do
      L1_3 = Threads
      L1_3 = L1_3.Weapon
      L1_3 = L1_3.Use
      if not L1_3 then
        break
      end
      L1_3 = IsAimCamActive
      L1_3 = L1_3()
      L1_3 = 1 == L1_3
      L2_3 = Threads
      L2_3 = L2_3.Weapon
      L2_3 = L2_3.Data
      L2_3 = L2_3.isPedAiming
      if L2_3 ~= L1_3 then
        L2_3 = Threads
        L2_3 = L2_3.Weapon
        L2_3 = L2_3.Data
        L2_3.isPedAiming = L1_3
        L2_3 = nil
        if L1_3 then
          L3_3 = GetSelectedPedWeapon
          L4_3 = Threads
          L4_3 = L4_3.Players
          L4_3 = L4_3.Data
          L4_3 = L4_3.ped
          L3_3 = L3_3(L4_3)
          L2_3 = L3_3
          L3_3 = GetHashKey
          L4_3 = "weapon_unarmed"
          L3_3 = L3_3(L4_3)
          if L2_3 ~= L3_3 then
            L3_3 = Threads
            L3_3 = L3_3.Weapon
            L3_3 = L3_3.BlackListHash
            L4_3 = tostring
            L5_3 = L2_3
            L4_3 = L4_3(L5_3)
            L3_3 = L3_3[L4_3]
            if not L3_3 then
              goto lbl_90
            end
          end
          L1_3 = false
          goto lbl_104
          ::lbl_90::
          L3_3 = Threads
          L3_3 = L3_3.Weapon
          L3_3 = L3_3.Data
          L3_3.weapon = L2_3
          L3_3 = WeaponIndicator
          L3_3 = L3_3.SetName
          L4_3 = Threads
          L4_3 = L4_3.Weapon
          L4_3 = L4_3.HashList
          L5_3 = tostring
          L6_3 = L2_3
          L5_3 = L5_3(L6_3)
          L4_3 = L4_3[L5_3]
          L3_3(L4_3)
        end
        ::lbl_104::
        L3_3 = WeaponIndicator
        L3_3 = L3_3.SetAsActive
        L4_3 = L1_3
        L3_3(L4_3)
      end
      L2_3 = Threads
      L2_3 = L2_3.Weapon
      L2_3 = L2_3.Data
      L2_3 = L2_3.isPedAiming
      if L2_3 then
        L2_3 = GetAmmoInClip
        L3_3 = Threads
        L3_3 = L3_3.Players
        L3_3 = L3_3.Data
        L3_3 = L3_3.ped
        L4_3 = Threads
        L4_3 = L4_3.Weapon
        L4_3 = L4_3.Data
        L4_3 = L4_3.weapon
        L2_3, L3_3 = L2_3(L3_3, L4_3)
        L4_3 = Threads
        L4_3 = L4_3.Weapon
        L4_3 = L4_3.Data
        L5_3 = {}
        L5_3.current = L3_3
        L6_3 = GetWeaponClipSize
        L7_3 = Threads
        L7_3 = L7_3.Weapon
        L7_3 = L7_3.Data
        L7_3 = L7_3.weapon
        L6_3 = L6_3(L7_3)
        L5_3.max = L6_3
        L6_3 = GetWeaponAmmo
        L7_3 = Threads
        L7_3 = L7_3.Players
        L7_3 = L7_3.Data
        L7_3 = L7_3.ped
        L8_3 = Threads
        L8_3 = L8_3.Weapon
        L8_3 = L8_3.Data
        L8_3 = L8_3.weapon
        L6_3 = L6_3(L7_3, L8_3)
        L5_3.magazine = L6_3
        L4_3.ammo = L5_3
        L4_3 = WeaponIndicator
        L4_3 = L4_3.SetAmmo
        L5_3 = Threads
        L5_3 = L5_3.Weapon
        L5_3 = L5_3.Data
        L5_3 = L5_3.ammo
        L5_3 = L5_3.current
        L6_3 = Threads
        L6_3 = L6_3.Weapon
        L6_3 = L6_3.Data
        L6_3 = L6_3.ammo
        L6_3 = L6_3.max
        L7_3 = Threads
        L7_3 = L7_3.Weapon
        L7_3 = L7_3.Data
        L7_3 = L7_3.ammo
        L7_3 = L7_3.magazine
        L4_3(L5_3, L6_3, L7_3)
        L4_3 = Config
        L4_3 = L4_3.Intervals
        L4_3 = L4_3.weapon
        L0_3 = L4_3.active
      else
        L2_3 = Config
        L2_3 = L2_3.Intervals
        L2_3 = L2_3.weapon
        L0_3 = L2_3.idle
      end
      L2_3 = Wait
      L3_3 = L0_3
      L2_3(L3_3)
    end
  end
  L0_2(L1_2)
end
L0_1.Init = L1_1
