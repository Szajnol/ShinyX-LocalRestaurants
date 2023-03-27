ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

xSound = exports['xsound']

Citizen.CreateThread(function()
    for k, v in pairs(Config.Blips) do
        local blip = AddBlipForCoord(vector3(v["Coords"]["x"], v["Coords"]["y"], v["Coords"]["z"]))

        SetBlipSprite (blip, v.Sprite)
        SetBlipDisplay(blip, v.Display)
        SetBlipScale  (blip, v.Scale)
        SetBlipColour (blip, v.Colour)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Label)
        EndTextCommandSetBlipName(blip)
    end

    for jobName, conf in pairs(Config.Zones) do
        exports.qtarget:AddBoxZone(conf.name, conf.pos, conf.width, conf.length, {
            name = conf.name,
            heading = conf.heading,
            debugPoly = false,
            minZ = conf.minZ,
            maxZ = conf.maxZ,
        }, {
            options = {
                {
                    icon = "fas fa-user-tie",
                    label = Config.BuyLabel,
                    action = function(data)
                        Menu()
                    end,
                },
            },
            distance = 2
        })
    end

    exports.qtarget:AddTargetModel(Config.Models, {
        options = {
            {
                action = function(data)
					Menu()
				end,
                icon = "fas fa-user-tie",
                label = Config.BuyLabel,
            },
        },
        distance = 1
    })
end)




function Menu()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
    })
end

RegisterNUICallback("buy", function()
    SetNuiFocus(false, false)

    ESX.TriggerServerCallback('moneycheck', function(has)
        if has == true then
            ESX.ShowNotification(Config.Notify2)
            ESX.ShowProgressBar('Jedzenie', Config.EatingTimeinMinutes * 60000)
            FreezeEntityPosition(PlayerPedId(), true)
            Wait(Config.EatingTimeinMinutes * 60000)
            TriggerEvent('esx_status:add', 'thirst', 700000000)
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('esx_status:add', 'hunger', 700000000)
        else
            ESX.ShowNotification(Config.Notify1)
        end
    end, Config.BuyPrice)
end)

RegisterNUICallback("closeui", function()
	SetNuiFocus(false, false)
end)


    function LoadAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            RequestAnimDict(animDict)
            Citizen.Wait(0)
        end
    end	