local L0_1, L1_1

-- FIX: Sicherstellen, dass die Tabelle 'Effects' existiert
if Effects == nil then
    Effects = {}
end

L0_1 = Effects
L1_1 = {}
L0_1.Focus = L1_1

L0_1 = Effects.Focus
L0_1.InitialFov = 0

-- Die Funktion für Effects.Focus.Init
function L1_1(enable)
  local currentCam = GetRenderingCam()
  
  if enable then
    -- Speichere aktuelles FOV und setze es auf 120.0
    Effects.Focus.InitialFov = GetCamFov(currentCam)
    SetCamFov(currentCam, 120.0)
  else
    -- Setze FOV auf den ursprünglichen Wert zurück
    local oldFov = Effects.Focus.InitialFov
    SetCamFov(currentCam, oldFov)
  end
end

-- Zuweisung der Funktion
Effects.Focus.Init = L1_1