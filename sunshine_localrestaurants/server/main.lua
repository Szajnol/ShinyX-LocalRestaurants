ESX = exports["es_extended"]:getSharedObject()
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



ESX.RegisterServerCallback('moneycheck', function(source, cb, args)
    local xPlayer = ESX.GetPlayerFromId(source)

    print(args)
    
    if xPlayer.getMoney() >= args then
      cb(true)
      xPlayer.removeMoney(args)
    else
      cb(false)
    end

end)