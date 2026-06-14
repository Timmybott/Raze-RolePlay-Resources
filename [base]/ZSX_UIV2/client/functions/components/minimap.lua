local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = DisplayRadar
_DisplayRadar = L0_1
L0_1 = {}
Minimap = L0_1
L0_1 = Minimap
L0_1.Visible = false
L0_1 = Minimap
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = "L"
L5_1 = "B"
L6_1 = -0.0045
L7_1 = 0.002
L8_1 = 0.15
L9_1 = 0.188888
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L2_1.minimap = L3_1
L3_1 = {}
L4_1 = "L"
L5_1 = "B"
L6_1 = 0.02
L7_1 = 0.032
L8_1 = 0.111
L9_1 = 0.159
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L2_1.minimap_mask = L3_1
L3_1 = {}
L4_1 = "L"
L5_1 = "B"
L6_1 = -0.03
L7_1 = 0.022
L8_1 = 0.266
L9_1 = 0.237
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L2_1.minimap_blur = L3_1
L2_1.txt = "basic"
L2_1.type = 0
L1_1.Basic = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = "L"
L5_1 = "B"
L6_1 = -0.0045
L7_1 = 0.002
L8_1 = 0.15
L9_1 = 0.188888
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L2_1.minimap = L3_1
L3_1 = {}
L4_1 = "L"
L5_1 = "B"
L6_1 = 0.02
L7_1 = 0.032
L8_1 = 0.111
L9_1 = 0.159
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L2_1.minimap_mask = L3_1
L3_1 = {}
L4_1 = "L"
L5_1 = "B"
L6_1 = -0.03
L7_1 = 0.022
L8_1 = 0.266
L9_1 = 0.237
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L2_1.minimap_blur = L3_1
L2_1.txt = "radial"
L2_1.type = 0
L1_1.Radial = L2_1
L2_1 = {}
L3_1 = {}
L4_1 = "L"
L5_1 = "B"
L6_1 = -0.0045
L7_1 = -0.122
L8_1 = 0.24
L9_1 = 0.21
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L2_1.minimap = L3_1
L3_1 = {}
L4_1 = "L"
L5_1 = "B"
L6_1 = 0.0
L7_1 = 0.032
L8_1 = 0.111
L9_1 = 0.05
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L2_1.minimap_mask = L3_1
L3_1 = {}
L4_1 = "L"
L5_1 = "B"
L6_1 = -0.03
L7_1 = 0.042
L8_1 = 0.266
L9_1 = 0.65
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L2_1.minimap_blur = L3_1
L2_1.txt = "wide"
L2_1.type = 0
L1_1.Wide = L2_1
L0_1.Types = L1_1
L0_1 = Minimap
L1_1 = Minimap
L1_1 = L1_1.Types
L1_1 = L1_1.Wide
L0_1.Selected = L1_1
L0_1 = Minimap
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = 1.7777777777777777
  L1_2 = GetActiveScreenResolution
  L1_2, L2_2 = L1_2()
  L3_2 = L1_2 / L2_2
  L4_2 = 0
  L5_2 = 0
  if L0_2 < L3_2 then
    L6_2 = L0_2 - L3_2
    L4_2 = L6_2 / 3.6
  end
  return L4_2
end
L0_1.UltraWide = L1_1
L0_1 = RegisterCommand
L1_1 = "radar"
function L2_1()
  local L0_2, L1_2
  L0_2 = _DisplayRadar
  L1_2 = true
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = Minimap
L0_1.Prepared = false
L0_1 = Minimap
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = Config
  L1_2 = L1_2.DisableMinimapHandler
  if L1_2 then
    L1_2 = Minimap
    L1_2.Prepared = true
    return
  end
  L1_2 = Minimap
  L1_2 = L1_2.Prepared
  if L1_2 then
    return
  end
  L1_2 = Citizen
  L1_2 = L1_2.CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = IsScreenFadedOut
    L0_3 = L0_3()
    if L0_3 then
      L0_3 = Minimap
      L0_3 = L0_3.Prepared
      if not L0_3 then
        while true do
          L0_3 = IsScreenFadedOut
          L0_3 = L0_3()
          if not L0_3 then
            break
          end
          L0_3 = Wait
          L1_3 = 100
          L0_3(L1_3)
        end
      end
    end
    L0_3 = debugPrint
    L1_3 = "[^5MINIMAP^7] Preparing [/]"
    L0_3(L1_3)
    L0_3 = Minimap
    L1_3 = Minimap
    L1_3 = L1_3.Types
    L2_3 = A0_2
    L1_3 = L1_3[L2_3]
    L0_3.Selected = L1_3
    L0_3 = Workers
    L0_3 = L0_3.Minimap
    L0_3 = L0_3.BeforePrepare
    L0_3()
    L0_3 = Wait
    L1_3 = 500
    L0_3(L1_3)
    L0_3 = RequestScaleformMovie
    L1_3 = "minimap"
    L0_3 = L0_3(L1_3)
    L1_3 = RequestStreamedTextureDict
    L2_3 = "zsx_map"
    L3_3 = false
    L1_3(L2_3, L3_3)
    while true do
      L1_3 = HasStreamedTextureDictLoaded
      L2_3 = "zsx_map"
      L1_3 = L1_3(L2_3)
      if L1_3 then
        break
      end
      L1_3 = Wait
      L2_3 = 100
      L1_3(L2_3)
    end
    L1_3 = Minimap
    L1_3 = L1_3.UltraWide
    L1_3 = L1_3()
    L2_3 = AddReplaceTexture
    L3_3 = "platform:/textures/graphics"
    L4_3 = "radarmasksm"
    L5_3 = "zsx_map"
    L6_3 = Minimap
    L6_3 = L6_3.Selected
    L6_3 = L6_3.txt
    L2_3(L3_3, L4_3, L5_3, L6_3)
    L2_3 = _DisplayRadar
    L3_3 = true
    L2_3(L3_3)
    L2_3 = SetMinimapClipType
    L3_3 = Minimap
    L3_3 = L3_3.Selected
    L3_3 = L3_3.type
    L2_3(L3_3)
    L2_3 = SetMinimapComponentPosition
    L3_3 = "minimap"
    L4_3 = "L"
    L5_3 = "B"
    L6_3 = Minimap
    L6_3 = L6_3.Selected
    L6_3 = L6_3.minimap
    L6_3 = L6_3[3]
    L6_3 = L6_3 + L1_3
    L7_3 = Minimap
    L7_3 = L7_3.Selected
    L7_3 = L7_3.minimap
    L7_3 = L7_3[4]
    L8_3 = Minimap
    L8_3 = L8_3.Selected
    L8_3 = L8_3.minimap
    L8_3 = L8_3[5]
    L9_3 = Minimap
    L9_3 = L9_3.Selected
    L9_3 = L9_3.minimap
    L9_3 = L9_3[6]
    L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    L2_3 = SetMinimapComponentPosition
    L3_3 = "minimap_mask"
    L4_3 = "L"
    L5_3 = "B"
    L6_3 = Minimap
    L6_3 = L6_3.Selected
    L6_3 = L6_3.minimap_mask
    L6_3 = L6_3[3]
    L6_3 = L6_3 + L1_3
    L7_3 = Minimap
    L7_3 = L7_3.Selected
    L7_3 = L7_3.minimap_mask
    L7_3 = L7_3[4]
    L8_3 = Minimap
    L8_3 = L8_3.Selected
    L8_3 = L8_3.minimap_mask
    L8_3 = L8_3[5]
    L9_3 = Minimap
    L9_3 = L9_3.Selected
    L9_3 = L9_3.minimap_mask
    L9_3 = L9_3[6]
    L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    L2_3 = SetMinimapComponentPosition
    L3_3 = "minimap_blur"
    L4_3 = "L"
    L5_3 = "B"
    L6_3 = Minimap
    L6_3 = L6_3.Selected
    L6_3 = L6_3.minimap_blur
    L6_3 = L6_3[3]
    L6_3 = L6_3 + L1_3
    L7_3 = Minimap
    L7_3 = L7_3.Selected
    L7_3 = L7_3.minimap_blur
    L7_3 = L7_3[4]
    L8_3 = Minimap
    L8_3 = L8_3.Selected
    L8_3 = L8_3.minimap_blur
    L8_3 = L8_3[5]
    L9_3 = Minimap
    L9_3 = L9_3.Selected
    L9_3 = L9_3.minimap_blur
    L9_3 = L9_3[6]
    L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    L2_3 = SetRadarBigmapEnabled
    L3_3 = true
    L4_3 = false
    L2_3(L3_3, L4_3)
    L2_3 = SetRadarBigmapEnabled
    L3_3 = false
    L4_3 = false
    L2_3(L3_3, L4_3)
    L2_3 = SetRadarZoom
    L3_3 = 1100
    L2_3(L3_3)
    L2_3 = Minimap
    L2_3 = L2_3.GetSize
    L2_3()
    L2_3 = Wait
    L3_3 = 100
    L2_3(L3_3)
    L2_3 = _DisplayRadar
    L3_3 = false
    L2_3(L3_3)
    L2_3 = Workers
    L2_3 = L2_3.Minimap
    L2_3 = L2_3.AfterPrepare
    L2_3()
    L2_3 = Minimap
    L2_3.Prepared = true
    L2_3 = debugPrint
    L3_3 = "[^5MINIMAP^7] Minimap prepared."
    L2_3(L3_3)
  end
  L1_2(L2_2)
end
L0_1.Prepare = L1_1
L0_1 = Minimap
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = Config
  L1_2 = L1_2.DisableMinimapHandler
  if L1_2 then
    return
  end
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = Minimap
    L1_3 = Minimap
    L1_3 = L1_3.Types
    L2_3 = A0_2
    L1_3 = L1_3[L2_3]
    L0_3.Selected = L1_3
    L0_3 = false
    L1_3 = IsRadarHidden
    L1_3 = L1_3()
    if not L1_3 then
      L0_3 = true
      L1_3 = DisplayRadar
      L2_3 = false
      L1_3(L2_3)
    end
    L1_3 = Wait
    L2_3 = 500
    L1_3(L2_3)
    L1_3 = RequestScaleformMovie
    L2_3 = "minimap"
    L1_3 = L1_3(L2_3)
    L2_3 = RequestStreamedTextureDict
    L3_3 = "zsx_map"
    L4_3 = false
    L2_3(L3_3, L4_3)
    while true do
      L2_3 = HasStreamedTextureDictLoaded
      L3_3 = "zsx_map"
      L2_3 = L2_3(L3_3)
      if L2_3 then
        break
      end
      L2_3 = Wait
      L3_3 = 100
      L2_3(L3_3)
    end
    L2_3 = AddReplaceTexture
    L3_3 = "platform:/textures/graphics"
    L4_3 = "radarmasksm"
    L5_3 = "zsx_map"
    L6_3 = Minimap
    L6_3 = L6_3.Selected
    L6_3 = L6_3.txt
    L2_3(L3_3, L4_3, L5_3, L6_3)
    L2_3 = SetMinimapClipType
    L3_3 = Minimap
    L3_3 = L3_3.Selected
    L3_3 = L3_3.type
    L2_3(L3_3)
    L2_3 = SetMinimapComponentPosition
    L3_3 = "minimap"
    L4_3 = "L"
    L5_3 = "B"
    L6_3 = Minimap
    L6_3 = L6_3.Selected
    L6_3 = L6_3.minimap
    L6_3 = L6_3[3]
    L7_3 = Minimap
    L7_3 = L7_3.Selected
    L7_3 = L7_3.minimap
    L7_3 = L7_3[4]
    L8_3 = Minimap
    L8_3 = L8_3.Selected
    L8_3 = L8_3.minimap
    L8_3 = L8_3[5]
    L9_3 = Minimap
    L9_3 = L9_3.Selected
    L9_3 = L9_3.minimap
    L9_3 = L9_3[6]
    L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    L2_3 = SetMinimapComponentPosition
    L3_3 = "minimap_mask"
    L4_3 = "L"
    L5_3 = "B"
    L6_3 = Minimap
    L6_3 = L6_3.Selected
    L6_3 = L6_3.minimap_mask
    L6_3 = L6_3[3]
    L7_3 = Minimap
    L7_3 = L7_3.Selected
    L7_3 = L7_3.minimap_mask
    L7_3 = L7_3[4]
    L8_3 = Minimap
    L8_3 = L8_3.Selected
    L8_3 = L8_3.minimap_mask
    L8_3 = L8_3[5]
    L9_3 = Minimap
    L9_3 = L9_3.Selected
    L9_3 = L9_3.minimap_mask
    L9_3 = L9_3[6]
    L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    L2_3 = SetMinimapComponentPosition
    L3_3 = "minimap_blur"
    L4_3 = "L"
    L5_3 = "B"
    L6_3 = Minimap
    L6_3 = L6_3.Selected
    L6_3 = L6_3.minimap_blur
    L6_3 = L6_3[3]
    L7_3 = Minimap
    L7_3 = L7_3.Selected
    L7_3 = L7_3.minimap_blur
    L7_3 = L7_3[4]
    L8_3 = Minimap
    L8_3 = L8_3.Selected
    L8_3 = L8_3.minimap_blur
    L8_3 = L8_3[5]
    L9_3 = Minimap
    L9_3 = L9_3.Selected
    L9_3 = L9_3.minimap_blur
    L9_3 = L9_3[6]
    L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    L2_3 = A0_2
    if "Wide" == L2_3 then
      L2_3 = SetMinimapOverlayDisplay
      L3_3 = "minimap_mask"
      L4_3 = -0.0045
      L5_3 = 0.002
      L6_3 = 100
      L7_3 = 150
      L8_3 = 100
      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
    end
    L2_3 = SetRadarBigmapEnabled
    L3_3 = true
    L4_3 = false
    L2_3(L3_3, L4_3)
    L2_3 = SetRadarBigmapEnabled
    L3_3 = false
    L4_3 = false
    L2_3(L3_3, L4_3)
    L2_3 = SetRadarZoom
    L3_3 = 1100
    L2_3(L3_3)
    L2_3 = Minimap
    L2_3 = L2_3.GetSize
    L2_3()
    L2_3 = Wait
    L3_3 = 100
    L2_3(L3_3)
    if L0_3 then
      L2_3 = DisplayRadar
      L3_3 = true
      L2_3(L3_3)
    end
  end
  L1_2(L2_2)
end
L0_1.Change = L1_1
L0_1 = Minimap
function L1_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = GetSafeZoneSize
  L0_2 = L0_2()
  L1_2 = 0.05
  L2_2 = 0.05
  L3_2 = GetAspectRatio
  L4_2 = 0
  L3_2 = L3_2(L4_2)
  L4_2 = GetActiveScreenResolution
  L4_2, L5_2 = L4_2()
  L6_2 = 1.0
  L6_2 = L6_2 / L4_2
  L7_2 = 1.0
  L7_2 = L7_2 / L5_2
  L8_2 = {}
  L9_2 = 4 * L3_2
  L9_2 = L4_2 / L9_2
  L9_2 = L6_2 * L9_2
  L9_2 = L9_2 * 100
  L9_2 = L9_2 + 0.05
  L8_2.width = L9_2
  L9_2 = L5_2 / 5.674
  L9_2 = L7_2 * L9_2
  L9_2 = L9_2 * 100
  L9_2 = L9_2 - 0.95
  L8_2.height = L9_2
  L9_2 = math
  L9_2 = L9_2.abs
  L10_2 = L0_2 - 1.0
  L9_2 = L9_2(L10_2)
  L9_2 = L9_2 * 10
  L9_2 = L1_2 * L9_2
  L9_2 = L4_2 * L9_2
  L9_2 = L6_2 * L9_2
  L9_2 = L9_2 * 100
  L8_2.left_x = L9_2
  L9_2 = math
  L9_2 = L9_2.abs
  L10_2 = L0_2 - 1.0
  L9_2 = L9_2(L10_2)
  L9_2 = L9_2 * 10
  L9_2 = L2_2 * L9_2
  L9_2 = L5_2 * L9_2
  L9_2 = L7_2 * L9_2
  L10_2 = 1.0
  L9_2 = L10_2 - L9_2
  L9_2 = L9_2 * 100
  L9_2 = L9_2 - 1
  L8_2.bottom_y = L9_2
  L9_2 = L8_2.left_x
  L10_2 = L8_2.width
  L9_2 = L9_2 + L10_2
  L8_2.right_x = L9_2
  L9_2 = L8_2.bottom_y
  L10_2 = L8_2.height
  L9_2 = L9_2 - L10_2
  L8_2.top_y = L9_2
  L9_2 = L8_2.left_x
  L9_2 = L9_2 * 100
  L8_2.x = L9_2
  L9_2 = L8_2.top_y
  L9_2 = L9_2 * 100
  L8_2.y = L9_2
  L8_2.xunit = L6_2
  L8_2.yunit = L7_2
  L9_2 = NUI
  L9_2 = L9_2.SendMessage
  L10_2 = "SET_RADAR_SIZE"
  L11_2 = L8_2
  L9_2(L10_2, L11_2)
end
L0_1.GetSize = L1_1
L0_1 = Minimap
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.DisableMinimapHandler
  if L2_2 then
    return
  end
  L2_2 = NUI
  L2_2 = L2_2.SendMessage
  L3_2 = "SET_RADAR_VISIBILITY"
  L4_2 = {}
  L4_2.state = A0_2
  L4_2.force = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.Animate = L1_1
