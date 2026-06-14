local L0_1, L1_1, L2_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Config
  L1_2 = L1_2.EditorAdminOnly
  if L1_2 then
    L1_2 = Framework
    L1_2 = L1_2.Server
    L1_2 = L1_2.IsAdmin
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = Framework
      L1_2 = L1_2.Server
      L1_2 = L1_2.Notify
      L2_2 = A0_2
      L3_2 = Locale
      L3_2 = L3_2.requiresAdmin
      L4_2 = "error"
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = false
      return L1_2
    end
  else
    L1_2 = type
    L2_2 = Config
    L2_2 = L2_2.EditorJobRestriction
    L1_2 = L1_2(L2_2)
    if "table" == L1_2 then
      L1_2 = Config
      L1_2 = L1_2.EditorJobRestriction
      L1_2 = #L1_2
      if L1_2 > 0 then
        L1_2 = Framework
        L1_2 = L1_2.Server
        L1_2 = L1_2.GetPlayerJob
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if not L1_2 then
          L2_2 = Framework
          L2_2 = L2_2.Server
          L2_2 = L2_2.Notify
          L3_2 = A0_2
          L4_2 = "Could not get job - you need to have set a framework if you are trying to use this functionality!"
          L5_2 = "error"
          L2_2(L3_2, L4_2, L5_2)
          L2_2 = false
          return L2_2
        end
        L2_2 = lib
        L2_2 = L2_2.table
        L2_2 = L2_2.contains
        L3_2 = Config
        L3_2 = L3_2.EditorJobRestriction
        L4_2 = L1_2
        if L4_2 then
          L4_2 = L4_2.name
        end
        L2_2 = L2_2(L3_2, L4_2)
        if not L2_2 then
          L2_2 = Framework
          L2_2 = L2_2.Server
          L2_2 = L2_2.IsAdmin
          L3_2 = A0_2
          L2_2 = L2_2(L3_2)
          if not L2_2 then
            L2_2 = Framework
            L2_2 = L2_2.Server
            L2_2 = L2_2.Notify
            L3_2 = A0_2
            L4_2 = Locale
            L4_2 = L4_2.noPermission
            L5_2 = "error"
            L2_2(L3_2, L4_2, L5_2)
            L2_2 = false
            return L2_2
          end
        end
      end
    end
  end
  L1_2 = true
  return L1_2
end
hasEditorAccess = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Config
  L1_2 = L1_2.TimingToolAdminOnly
  if L1_2 then
    L1_2 = Framework
    L1_2 = L1_2.Server
    L1_2 = L1_2.IsAdmin
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = Framework
      L1_2 = L1_2.Server
      L1_2 = L1_2.Notify
      L2_2 = A0_2
      L3_2 = Locale
      L3_2 = L3_2.requiresAdmin
      L4_2 = "error"
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = false
      return L1_2
    end
  else
    L1_2 = type
    L2_2 = Config
    L2_2 = L2_2.TimingToolJobRestriction
    L1_2 = L1_2(L2_2)
    if "table" == L1_2 then
      L1_2 = Config
      L1_2 = L1_2.TimingToolJobRestriction
      L1_2 = #L1_2
      if L1_2 > 0 then
        L1_2 = Framework
        L1_2 = L1_2.Server
        L1_2 = L1_2.GetPlayerJob
        L2_2 = A0_2
        L1_2 = L1_2(L2_2)
        if not L1_2 then
          L2_2 = Framework
          L2_2 = L2_2.Server
          L2_2 = L2_2.Notify
          L3_2 = A0_2
          L4_2 = "Could not get job - you need to have set a framework if you are trying to use this functionality!"
          L5_2 = "error"
          L2_2(L3_2, L4_2, L5_2)
          L2_2 = false
          return L2_2
        end
        L2_2 = lib
        L2_2 = L2_2.table
        L2_2 = L2_2.contains
        L3_2 = Config
        L3_2 = L3_2.TimingToolJobRestriction
        L4_2 = L1_2
        if L4_2 then
          L4_2 = L4_2.name
        end
        L2_2 = L2_2(L3_2, L4_2)
        if not L2_2 then
          L2_2 = Framework
          L2_2 = L2_2.Server
          L2_2 = L2_2.IsAdmin
          L3_2 = A0_2
          L2_2 = L2_2(L3_2)
          if not L2_2 then
            L2_2 = Framework
            L2_2 = L2_2.Server
            L2_2 = L2_2.Notify
            L3_2 = A0_2
            L4_2 = Locale
            L4_2 = L4_2.noPermission
            L5_2 = "error"
            L2_2(L3_2, L4_2, L5_2)
            L2_2 = false
            return L2_2
          end
        end
      end
    end
  end
  L1_2 = true
  return L1_2
end
hasTimingToolAccess = L0_1
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-handling:server:has-editor-access"
L2_1 = hasEditorAccess
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "jg-handling:server:has-timing-tool-access"
L2_1 = hasTimingToolAccess
L0_1(L1_1, L2_1)

-- Initialize database tables
initSQL(function()
    print("^2[JG Handling] Database tables initialized successfully^0")
end)