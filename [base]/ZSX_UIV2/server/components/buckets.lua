RegisterNetEvent('ZSX_UIV2:Buckets:CreatePlayerBucket')
AddEventHandler('ZSX_UIV2:Buckets:CreatePlayerBucket', function(state)
    local src = source
    if state then
        debugPrint('Player ['..src..'] ('..GetPlayerName(src)..') is in bucket.')
        SetPlayerRoutingBucket(src, src)
        SetRoutingBucketPopulationEnabled(src, false)
    else
        debugPrint('Player ['..src..'] ('..GetPlayerName(src)..') is no longer in bucket.')
        SetPlayerRoutingBucket(src, 0)
        SetRoutingBucketPopulationEnabled(src, true)
    end
end)