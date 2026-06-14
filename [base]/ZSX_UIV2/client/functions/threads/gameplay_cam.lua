local Threads = Threads or {}

Threads.GameplayCam = {}
Threads.GameplayCam.Id = -1

local function FindGameplayCameraID()
  Citizen.CreateThread(function()
    local checkInterval = 5000
    while true do
      local gameplayCamId = Threads.GameplayCam.Id
      if not DoesCamExist(gameplayCamId) then
        FindGameplayCameraID()
      end
      Wait(checkInterval)
    end
  end)
end

Threads.GameplayCam.Init = FindGameplayCameraID

local function FindGameplayCamera()
  local gameplayCamCoord = GetGameplayCamCoord()
  local currentCamCoord = GetCamCoord(Threads.GameplayCam.Id)

  if currentCamCoord ~= gameplayCamCoord then
    local currentCamCoord = GetCamCoord(Threads.GameplayCam.Id)
    local zeroVector = vector3(0, 0, 0)
    if currentCamCoord == zeroVector then
      goto lbl_23
    end
  end
  do return end

  ::lbl_23::
  for camId = 1, 10000, 1 do
    if DoesCamExist(camId) then
      local camCoord = GetCamCoord(camId)
      if camCoord == gameplayCamCoord then
        Threads.GameplayCam.Id = camId
        debugPrint("[^4CAMERA^7] Restored Gameplay Camera ID.")
        break
      end
    end
  end
end

FindGameplayCameraID = FindGameplayCamera

local function GetGameplayCameraID()
  return Threads.GameplayCam.Id
end

GetGameplayCameraID = GetGameplayCameraID