Config.Chat = {}
Config.Chat.Use = true
Config.Chat.Icons = {
    ['me'] = 'ME',
    ['do'] = 'DO',
    ['ooc'] = 'OOC',
    ['twt'] = 'fas fa-twitter',
}

Config.Chat.AllowUserChangeSize = true
Config.Chat.Size = 'small'

Config.Chat.Translate = {
    ['player_with_id'] = 'Spieler mit ID',
    ['enter_message'] = 'Gebe Command/Nachricht ein'
}

Config.Chat.UseCommandsWithoutSyntax = true

-- If you'd like to prevent high GPU usage for rendering not used messages, we suggest applying some kind of maximal pool size for messages
Config.Chat.MaxPoolSize = false
-- Example with max messages set to 30
-- Config.Chat.MaxPoolSize = 30
