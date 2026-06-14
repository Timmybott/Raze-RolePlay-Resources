GetUserWallets = function(source)
    local xPlayer = FrameworkSelected == 'ESX' and ESX.GetPlayerFromId(source) or FrameworkSelected == 'QBCore' and QBCore.Functions.GetPlayer(source) or FrameworkSelected == 'QBOX' and exports['qbox_core']:GetPlayer(source) or false
    local wallets
    if FrameworkSelected == 'ESX' then
        wallets = {
            cash = {
                type = 'cash',
                label = 'Cash',
                text = xPlayer.getAccount('money').money,
                icon = 'fas fa-wallet',
            },
            bank = {
                type = 'bank',
                label = 'Bank',
                text = xPlayer.getAccount('bank').money,
                icon = 'fas fa-credit-card'
            },
        }
    elseif FrameworkSelected == 'QBOX' or FrameworkSelected == 'QBCore' then
        wallets = {
            cash = {
                type = 'cash',
                label = 'Cash',
                text = xPlayer.Functions.GetMoney('cash'),
                icon = 'fas fa-wallet',
            },
            bank = {
                type = 'bank',
                label = 'Bank',
                text = xPlayer.Functions.GetMoney('bank'),
                icon = 'fas fa-credit-card'
            }, 
        }
    end
    return wallets
end

GetBaseRows = function(source)
    local xPlayer = FrameworkSelected == 'ESX' and ESX.GetPlayerFromId(source) or FrameworkSelected == 'QBCore' and QBCore.Functions.GetPlayer(source) or FrameworkSelected == 'QBOX' and exports['qbox_core']:GetPlayer(source) or false
    local base
    if FrameworkSelected == 'ESX' then
        base = {
            job = {
                type = 'job',
                text = xPlayer.job.name ~= 'unemployed' and (xPlayer.job.label..' - '..xPlayer.job.grade_label) or xPlayer.job.label,
                icon = 'fas fa-briefcase',
                name = xPlayer.job.name,
                label = xPlayer.job.label,
                grade = xPlayer.job.name == 'unemployed' and '' or xPlayer.job.grade_label
            },
            -- Example of adding more rows [job2 example]
            -- job2 = {
            --     type = 'job',
            --     text = xPlayer.job2.name ~= 'unemployed' and (xPlayer.job2.label..' - '..xPlayer.job2.grade_label) or xPlayer.job2.label,
            --     icon = 'fas fa-briefcase',
            -- },
        }
    elseif FrameworkSelected == 'QBOX' or FrameworkSelected == 'QBCore' then
        base = {
            job = {
                type = 'job',
                text = xPlayer.PlayerData.job.name ~= 'unemployed' and (xPlayer.PlayerData.job.label..' - '..xPlayer.PlayerData.job.grade.name) or xPlayer.PlayerData.job.label,
                icon = 'fas fa-briefcase',
                label = xPlayer.PlayerData.job.label,
                name = xPlayer.PlayerData.job.name,
                grade = xPlayer.PlayerData.job.name == 'unemployed' and '' or xPlayer.PlayerData.job.grade.name
            },
        }
    end
    return base
end

while not FrameworkSelected do
    Wait(0)
end

if FrameworkSelected == 'ESX' then
    RegisterNetEvent('esx:addAccountMoney')
    AddEventHandler('esx:addAccountMoney', function(source, account, money)
        if not source or not Player(source).state['UI_UserData'] then return end
        
        account = account == 'money' and 'cash' or account
        if Player(source).state['UI_UserData'].wallets[account] then
            local object = Player(source).state['UI_UserData']
            object.wallets[account].text = object.wallets[account].text + money
            Player(source).state:set('UI_UserData', object, true)
        end
    end)

    RegisterNetEvent('esx:removeAccountMoney')
    AddEventHandler('esx:removeAccountMoney', function(source, account, money)
        if not source or not Player(source).state['UI_UserData'] then return end
        
        account = account == 'money' and 'cash' or account
        if Player(source).state['UI_UserData'].wallets[account] then
            local object = Player(source).state['UI_UserData']
            object.wallets[account].text = object.wallets[account].text - money
            Player(source).state:set('UI_UserData', object, true)
        end
    end)

    RegisterNetEvent('esx:setAccountMoney')
    AddEventHandler('esx:setAccountMoney', function(source, account, money)
        if not source or not Player(source).state['UI_UserData'] then return end
        
        account = account == 'money' and 'cash' or account
        if Player(source).state['UI_UserData'].wallets[account] then
            local object = Player(source).state['UI_UserData']
            object.wallets[account].text = money
            Player(source).state:set('UI_UserData', object, true)
        end
    end)

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(source, job, lastJob)
        if not source or not Player(source).state['UI_UserData'] then return end
        
        if Player(source).state['UI_UserData'].base.job then
            local object = Player(source).state['UI_UserData']
            object.base.job.text = job.name ~= 'unemployed' and (job.label..' - '..job.grade_label) or job.label
            object.base.job.label = job.label
            object.base.job.grade = job.name ~= 'unemployed' and job.grade_label or ''
            Player(source).state:set('UI_UserData', object, true)
        end
    end)
    

elseif FrameworkSelected == 'QBOX' or FrameworkSelected == 'QBCore' then
    AddEventHandler('QBCore:Server:OnMoneyChange', function(source, moneyType, amount, operation, reason)
        if not source or not Player(source).state['UI_UserData'] then return end
        if Player(source).state['UI_UserData'].wallets[moneyType] then
            local object = Player(source).state['UI_UserData']
            local xPlayer = QBCore.Functions.GetPlayer(source)
            object.wallets[moneyType].text = xPlayer.Functions.GetMoney(moneyType)
            -- if operation == 'add' then
            --     object.wallets[moneyType].text = object.wallets[moneyType].text + amount
            -- elseif operation == 'remove' then
            --     object.wallets[moneyType].text = object.wallets[moneyType].text - amount
            -- elseif operation == 'set' then
            --     local xPlayer = QBCore.Functions.GetPlayer(source)
            --     object.wallets[moneyType].text = xPlayer.Functions.GetMoney('cash')
            -- end
            Player(source).state:set('UI_UserData', object, true)
        end
    end)

    RegisterNetEvent('QBCore:Server:OnJobUpdate')
    AddEventHandler('QBCore:Server:OnJobUpdate', function(source, job)
        if not source or not Player(source).state['UI_UserData'] then return end
        
        if Player(source).state['UI_UserData'].base.job then
            local object = Player(source).state['UI_UserData']
            object.base.job.text = job.name ~= 'unemployed' and (job.label..' - '..job.grade.name) or job.label
            object.base.job.label = job.label
            object.base.job.grade = job.name ~= 'unemployed' and job.grade.name or ''
            Player(source).state:set('UI_UserData', object, true)
        end
    end)
end