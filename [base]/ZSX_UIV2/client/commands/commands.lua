RegisterCommand('remove_nui_storage', function()
    NUI.SendMessage('REMOVE_STORAGE_FULLY', {})
end)

if not Config.Chat.Use then return debugPrint('Removing commands.') end
RegisterCommand('me', function(src, args, _)
    local argsOutput = _Lib.ConvertArgumentsToString(args) -- converting arguments to text ((args[n]))
    Chat.CreateMessage('ME', argsOutput, '#c94b5b', true, 10.0)
end)

RegisterCommand('do', function(src, args, _)
    local argsOutput = _Lib.ConvertArgumentsToString(args) -- converting arguments to text ((args[n]))
    Chat.CreateMessage('DO', argsOutput, '#1A1A1A', true, 10.0)
end)

RegisterCommand('twt', function(src, args, _)
    local argsOutput = _Lib.ConvertArgumentsToString(args) -- converting arguments to text ((args[n]))
    Chat.CreateMessage('fab fa-twitter', argsOutput, '#64A6FD', false, false)
end)

LocalOutOfCharacter = function(message)
    if not message or message == '' then return end
    Chat.CreateMessage('fas fa-globe', message, '#0c0c0cd9', true, 10.0)
end