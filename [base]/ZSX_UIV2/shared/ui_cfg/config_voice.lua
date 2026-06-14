Config.Voice = {}
Config.Voice.NameToProgress = {
    ['Shouting'] = 100,
    ['Normal'] = 50,
    ['Whisper'] = 25 
}

Config.Voice.SaltyChatProgress = {
    ['3.5'] = 'Whisper',
    ['8'] = 'Normal',
    ['15'] = 'Shout',
    ['32'] = 'Max'
}

Config.Voice.DoesSaltyChatExists = GetResourceState("saltychat") ~= 'missing'