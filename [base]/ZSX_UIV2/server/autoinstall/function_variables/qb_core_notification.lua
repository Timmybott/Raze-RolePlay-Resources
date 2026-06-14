local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
L0_1.action = "notify"
L1_1 = texttype
if not L1_1 then
  L1_1 = "primary"
end
L0_1.type = L1_1
L1_1 = length
if not L1_1 then
  L1_1 = 5000
end
L0_1.length = L1_1
L1_1 = type
L2_1 = text
L1_1 = L1_1(L2_1)
if "table" == L1_1 then
  L1_1 = text
  L1_1 = L1_1.text
  if not L1_1 then
    L1_1 = "Placeholder"
  end
  L0_1.text = L1_1
  L1_1 = text
  L1_1 = L1_1.caption
  if not L1_1 then
    L1_1 = false
  end
  L0_1.caption = L1_1
else
  L1_1 = text
  L0_1.text = L1_1
end
L1_1 = icon
if L1_1 then
  L1_1 = icon
  L0_1.icon = L1_1
else
  L1_1 = texttype
  if "success" == L1_1 then
    L1_1 = "fas fa-check"
    if L1_1 then
      goto lbl_54
    end
  end
  L1_1 = texttype
  if "error" == L1_1 then
    L1_1 = "fas fa-exclamation-triangle"
    if L1_1 then
      goto lbl_54
    end
  end
  L1_1 = "fas fa-info"
  ::lbl_54::
  L0_1.icon = L1_1
end
L1_1 = exports
L1_1 = L1_1.ZSX_UIV2
L2_1 = L1_1
L1_1 = L1_1.Notification
L3_1 = L0_1.caption
L4_1 = L0_1.text
L5_1 = L0_1.icon
L6_1 = L0_1.length
L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
