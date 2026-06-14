local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = false
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Entity
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = L1_2.state
  end
  if L1_2 then
    L1_2 = L1_2.baseHandling
  end
  if not L1_2 then
    return
  end
  L2_2 = applyVehicleHandling
  L3_2 = A0_2
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = false
  L0_1 = L1_2
  L1_2 = resetTimingTool
  L1_2()
  L1_2 = L1_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = SetNuiFocus
  L2_2 = true
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SendNUIMessage
  L2_2 = {}
  L3_2 = GetGameTimer
  L3_2 = L3_2()
  L2_2.exitPreviewMode = L3_2
  L1_2(L2_2)
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = L0_1
  if L1_2 then
    return
  end
  L1_2 = cache
  L1_2 = L1_2.vehicle
  if not L1_2 or 0 == L1_2 then
    L2_2 = Framework
    L2_2 = L2_2.Client
    L2_2 = L2_2.Notify
    L3_2 = Locale
    L3_2 = L3_2.notInVehicle
    L4_2 = "error"
    return L2_2(L3_2, L4_2)
  end
  L2_2 = GetEntityModel
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = GetEntityArchetypeName
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = Framework
  L4_2 = L4_2.Client
  L4_2 = L4_2.GetVehicleLabel
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = IsThisModelACar
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = "CCarHandlingData"
    if L5_2 then
      goto lbl_78
    end
  end
  L5_2 = IsThisModelABike
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = IsThisModelAQuadbike
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    if not L5_2 then
      goto lbl_51
    end
  end
  L5_2 = "CBikeHandlingData"
  ::lbl_51::
  if not L5_2 then
    L5_2 = IsThisModelABoat
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    if not L5_2 then
      L5_2 = IsThisModelAJetski
      L6_2 = L2_2
      L5_2 = L5_2(L6_2)
      if not L5_2 then
        goto lbl_64
      end
    end
    L5_2 = "CBoatHandlingData"
    ::lbl_64::
    if not L5_2 then
      L5_2 = IsThisModelAHeli
      L6_2 = L2_2
      L5_2 = L5_2(L6_2)
      if not L5_2 then
        L5_2 = IsThisModelAPlane
        L6_2 = L2_2
        L5_2 = L5_2(L6_2)
        if not L5_2 then
          goto lbl_77
        end
      end
      L5_2 = "CFlyingHandlingData"
      ::lbl_77::
      if not L5_2 then
        L5_2 = false
      end
    end
  end
  ::lbl_78::
  L6_2 = Entity
  L7_2 = L1_2
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2.state
  if not L5_2 then
    L7_2 = Framework
    L7_2 = L7_2.Client
    L7_2 = L7_2.Notify
    L8_2 = Locale
    L8_2 = L8_2.notCompatibleWithHandlingEditor
    L9_2 = "error"
    return L7_2(L8_2, L9_2)
  end
  L7_2 = getVehicleHandling
  L8_2 = L1_2
  L9_2 = L5_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = L6_2.baseHandling
  L9_2 = L6_2.tuningConfig
  L10_2 = L6_2.servicingData
  L11_2 = L6_2.editorHandlingApplied
  if not L8_2 then
    L8_2 = L7_2
    L13_2 = L6_2
    L12_2 = L6_2.set
    L14_2 = "baseHandling"
    L15_2 = L7_2
    L16_2 = true
    L12_2(L13_2, L14_2, L15_2, L16_2)
  end
  if not L11_2 then
    L12_2 = GetResourceState
    L13_2 = "jg-mechanic"
    L12_2 = L12_2(L13_2)
    if "started" == L12_2 then
      if not A0_2 and (L9_2 or L10_2) then
        L12_2 = SetNuiFocus
        L13_2 = true
        L14_2 = true
        L12_2(L13_2, L14_2)
        L12_2 = SendNUIMessage
        L13_2 = {}
        L13_2.type = "show-select-mechanic-data"
        L14_2 = Locale
        L13_2.locale = L14_2
        L12_2(L13_2)
        return
      end
      L12_2 = pcall
      function L13_2()
        local L0_3, L1_3, L2_3, L3_3
        L0_3 = A0_2
        if "WITHOUT_SERVICING" == L0_3 then
          L0_3 = L9_2
          if L0_3 then
            L0_3 = exports
            L0_3 = L0_3["jg-mechanic"]
            L1_3 = L0_3
            L0_3 = L0_3.calculateTuningHandling
            L2_3 = L8_2
            L3_3 = L9_2
            L0_3 = L0_3(L1_3, L2_3, L3_3)
            L7_2 = L0_3
          else
            L0_3 = L8_2
            L7_2 = L0_3
          end
        else
          L0_3 = A0_2
          if "BASE_HANDLING" == L0_3 then
            L0_3 = L8_2
            L7_2 = L0_3
          end
        end
      end
      L12_2 = L12_2(L13_2)
      if not L12_2 then
        L12_2 = print
        L13_2 = "^1[ERROR] You must be using JG Mechanic v1.4 or newer.^0"
        L12_2(L13_2)
      end
    end
  end
  L12_2 = TriggerScreenblurFadeIn
  L13_2 = 200
  L12_2(L13_2)
  L12_2 = SetNuiFocus
  L13_2 = true
  L14_2 = true
  L12_2(L13_2, L14_2)
  L12_2 = SendNUIMessage
  L13_2 = {}
  L13_2.type = "show-handling-editor"
  L14_2 = Config
  L13_2.config = L14_2
  L14_2 = Locale
  L13_2.locale = L14_2
  L13_2.vehicleHandling = L7_2
  L13_2.baseVehicleHandling = L8_2
  L13_2.editorHandlingApplied = L11_2
  L13_2.vehicleArchetypeName = L3_2
  L13_2.vehicleLabel = L4_2
  L13_2.vehicleSubHandlingClass = L5_2
  L12_2(L13_2)
end
L4_1 = RegisterNUICallback
L5_1 = "select-mechanic-data-mode"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L3_1
  L3_2 = A0_2.mode
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNUICallback
L5_1 = "preview-handling"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = TriggerScreenblurFadeOut
  L3_2 = 200
  L2_2(L3_2)
  if A0_2 then
    L2_2 = type
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if "table" == L2_2 then
      goto lbl_12
    end
  end
  do return end
  ::lbl_12::
  L2_2 = cache
  L2_2 = L2_2.vehicle
  if not L2_2 or 0 == L2_2 then
    L3_2 = A1_2
    L4_2 = {}
    L4_2.error = true
    return L3_2(L4_2)
  end
  L3_2 = applyVehicleHandling
  L4_2 = L2_2
  L5_2 = A0_2
  L3_2(L4_2, L5_2)
  L3_2 = SetNuiFocus
  L4_2 = false
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = initTimingTool
  L3_2()
  L3_2 = true
  L0_1 = L3_2
  L3_2 = Citizen
  L3_2 = L3_2.CreateThreadNow
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3
    while true do
      L0_3 = L0_1
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = DisableControlAction
      L1_3 = 0
      L2_3 = 75
      L3_3 = true
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = IsControlJustPressed
      L1_3 = 0
      L2_3 = 194
      L0_3 = L0_3(L1_3, L2_3)
      if L0_3 then
        L0_3 = L2_1
        L1_3 = L2_2
        L0_3(L1_3)
        L0_3 = TriggerScreenblurFadeIn
        L1_3 = 200
        L0_3(L1_3)
      end
    end
  end
  L3_2(L4_2)
  L3_2 = A1_2
  L4_2 = true
  L3_2(L4_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNUICallback
L5_1 = "apply-handling"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = A0_2.handlingData
  L3_2 = A0_2.applyType
  L4_2 = cache
  L4_2 = L4_2.vehicle
  if L2_2 then
    L5_2 = type
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    if "table" == L5_2 then
      goto lbl_18
    end
  end
  L5_2 = A1_2
  L6_2 = {}
  L6_2.error = true
  do return L5_2(L6_2) end
  ::lbl_18::
  if not L4_2 or 0 == L4_2 then
    L5_2 = A1_2
    L6_2 = {}
    L6_2.error = true
    return L5_2(L6_2)
  end
  L5_2 = applyVehicleHandling
  L6_2 = L4_2
  L7_2 = L2_2
  L5_2(L6_2, L7_2)
  L5_2 = Entity
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2.state
  L6_2 = L5_2
  L5_2 = L5_2.set
  L7_2 = "editorHandlingApplied"
  L8_2 = true
  L9_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = Entity
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2.state
  L6_2 = L5_2
  L5_2 = L5_2.set
  L7_2 = "editorHandling"
  L8_2 = L2_2
  L9_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2)
  if "applyTemporarily" ~= L3_2 then
    L5_2 = GetEntityModel
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L6_2 = Framework
    L6_2 = L6_2.Client
    L6_2 = L6_2.GetPlate
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      return
    end
    L7_2 = Entity
    L8_2 = L4_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = L7_2.state
    end
    if L7_2 then
      L7_2 = L7_2.baseHandling
    end
    if not L7_2 then
      L8_2 = print
      L9_2 = "^1Could not save handling data to DB. Vehicle does not have baseHandling statebag set."
      L8_2(L9_2)
      L8_2 = A1_2
      L9_2 = {}
      L9_2.error = true
      return L8_2(L9_2)
    end
    L8_2 = lib
    L8_2 = L8_2.callback
    L8_2 = L8_2.await
    L9_2 = "jg-handling:server:save-vehicle-handling"
    L10_2 = false
    L11_2 = L3_2
    L12_2 = L6_2
    L13_2 = L5_2
    L14_2 = L7_2
    L15_2 = L2_2
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  L5_2 = Framework
  L5_2 = L5_2.Client
  L5_2 = L5_2.Notify
  L6_2 = Locale
  L6_2 = L6_2.handlingApplied
  L7_2 = "success"
  L5_2(L6_2, L7_2)
  L5_2 = A1_2
  L6_2 = true
  L5_2(L6_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNUICallback
L5_1 = "reset-handling"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = cache
  L2_2 = L2_2.vehicle
  if not L2_2 then
    L3_2 = A1_2
    L4_2 = {}
    L4_2.error = true
    L3_2(L4_2)
  end
  L3_2 = L1_1
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = Entity
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.state
  L4_2 = L3_2
  L3_2 = L3_2.set
  L5_2 = "editorHandlingApplied"
  L6_2 = false
  L7_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = Entity
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.state
  L4_2 = L3_2
  L3_2 = L3_2.set
  L5_2 = "editorHandling"
  L6_2 = nil
  L7_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = GetEntityModel
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = Framework
  L4_2 = L4_2.Client
  L4_2 = L4_2.GetPlate
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = lib
  L5_2 = L5_2.callback
  L5_2 = L5_2.await
  L6_2 = "jg-handling:server:delete-vehicle-handling"
  L7_2 = false
  L8_2 = L4_2
  L9_2 = L3_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = GetResourceState
  L6_2 = "jg-mechanic"
  L5_2 = L5_2(L6_2)
  if "started" == L5_2 then
    L5_2 = pcall
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = Entity
      L1_3 = L2_2
      L0_3 = L0_3(L1_3)
      L0_3 = L0_3.state
      L0_3 = L0_3.tuningConfig
      L1_3 = exports
      L1_3 = L1_3["jg-mechanic"]
      L2_3 = L1_3
      L1_3 = L1_3.applyVehicleTuningHandling
      L3_3 = L2_2
      L4_3 = L0_3 or L4_3
      if not L0_3 then
        L4_3 = {}
      end
      L1_3(L2_3, L3_3, L4_3)
    end
    L5_2 = L5_2(L6_2)
    if not L5_2 then
      L5_2 = print
      L6_2 = "^1[ERROR] Can't re-apply servicing & tuning; you must be using JG Mechanic v1.4 or newer.^0"
      L5_2(L6_2)
    end
  end
  L5_2 = A1_2
  L6_2 = true
  L5_2(L6_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "jg-handling:client:open-editor"
function L6_1()
  local L0_2, L1_2
  L0_2 = lib
  L0_2 = L0_2.callback
  L0_2 = L0_2.await
  L1_2 = "jg-handling:server:has-editor-access"
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    return
  end
  L0_2 = L3_1
  L0_2()
end
L4_1(L5_1, L6_1)
L4_1 = Config
L4_1 = L4_1.EditorCommand
if L4_1 then
  L4_1 = RegisterCommand
  L5_1 = Config
  L5_1 = L5_1.EditorCommand
  function L6_1()
    local L0_2, L1_2
    L0_2 = TriggerEvent
    L1_2 = "jg-handling:client:open-editor"
    L0_2(L1_2)
  end
  L4_1(L5_1, L6_1)
end
L4_1 = lib
L4_1 = L4_1.onCache
L5_1 = "vehicle"
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = cache
  L1_2 = L1_2.vehicle
  if A0_2 then
    if 0 ~= A0_2 then
      goto lbl_22
    end
    L2_2 = L0_1
    if not L2_2 then
      goto lbl_22
    end
  end
  L2_2 = L2_1
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.type = "none"
  L2_2(L3_2)
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  ::lbl_22::
end
L4_1(L5_1, L6_1)
