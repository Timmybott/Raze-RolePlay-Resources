RegisterServerEvent("ry_rent:pay");
AddEventHandler("ry_rent:pay", function(amount, refund)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  
  if refund then
    xPlayer.addMoney(tonumber(amount))
    TriggerClientEvent("esx:showNotification", source, "Du bekommst " .. amount .. "$ weil du das Fahrzeug in der Zeit zurück gebracht hast.")
  else
    local Money = (xPlayer.getAccount("money")).money
    if Money >= amount then
      xPlayer.removeMoney(tonumber(amount))
      TriggerClientEvent("esx:showNotification", source, "Du bezahlst " .. amount .. "$ um das Fahrzeug zu mieten")
    end
  end
end)

ESX.RegisterServerCallback("ry_rent:check", function(source, cb, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local Money = xPlayer.getAccount("money").money
	if xPlayer ~= nil then
		if Money >= amount then
			cb(true)
		else
			cb(false)
		end;
	end;
end);