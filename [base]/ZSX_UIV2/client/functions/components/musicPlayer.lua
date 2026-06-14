local L0_1, L1_1, L2_1
L0_1 = {}
MusicPlayer = L0_1
L0_1 = MusicPlayer
L0_1.Ready = false
L0_1 = MusicPlayer
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.UI
  L1_2 = L1_2.UseMusic
  if not L1_2 then
    return
  end
  L1_2 = MusicPlayer
  L1_2 = L1_2.Ready
  if not L1_2 then
    L1_2 = debugPrint
    L2_2 = "[^2MUSIC^7] [^1ERROR^7] Music content is not ready!"
    return L1_2(L2_2)
  end
  L1_2 = NUI
  L1_2 = L1_2.SendMessage
  L2_2 = "HANDLE_MUSIC"
  L3_2 = {}
  L3_2.state = A0_2
  L1_2(L2_2, L3_2)
end
L0_1.HandleVolume = L1_1
L0_1 = MusicPlayer
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = debugPrint
  L1_2 = "[^2MUSIC^7] Manually overriding for ready state."
  L0_2(L1_2)
  L0_2 = NUI
  L0_2 = L0_2.SendMessage
  L1_2 = "OVERRIDE_MUSIC_STATE"
  L2_2 = {}
  L0_2(L1_2, L2_2)
end
L0_1.SetAsReady = L1_1
L0_1 = RegisterNUICallback
L1_1 = "player.created"
function L2_1()
  local L0_2, L1_2
  L0_2 = MusicPlayer
  L0_2.Ready = true
  L0_2 = MusicPlayer
  L0_2 = L0_2.SetAsReady
  L0_2()
end
L0_1(L1_1, L2_1)
