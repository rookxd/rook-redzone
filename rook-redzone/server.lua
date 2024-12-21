QBCore = exports['qb-core']:GetCoreObject()
local redzone = false
local gerisayim = false
local cooldown = false
local odul = false

QBCore.Commands.Add(RookConfig.Redzone_Start_And_Stop_Command, "Redzone Aktif/Pasif.", {}, true, function(source, args) 
    if redzone then
        redzone = false
        TriggerClientEvent("QBCore:Notify", -1, Locales.Redzone_Deactivated, "primary")
    else
        redzone = true
        TriggerClientEvent("QBCore:Notify", -1, Locales.Redzone_Activated, "primary")
    end
end, RookConfig.Admin_Group)

RegisterNetEvent('redzone:server:cooldown', function()
    if redzone then
        Citizen.Wait((1000 * 60) * RookConfig.CooldownTime)
        cooldown = false
        TriggerClientEvent("QBCore:Notify", -1, Locales.Redzone_Cooldown_Ended, "primary")
    end
end)

RegisterNetEvent('redzone:server:gerisayim', function()
    if redzone then
        if not odul then
            if not cooldown then
                if not gerisayim then
                    gerisayim = true
                    TriggerClientEvent("QBCore:Notify", -1, Locales.Countdown_Started, "primary")

                    Citizen.SetTimeout((1000 * 60) * RookConfig.RemainingTime, function()
                        gerisayim = false
                        cooldown = true
                        odul = true
                        TriggerClientEvent("QBCore:Notify", -1, Locales.RemainingTime_Ended, "primary")
                    end)
                else
                    TriggerClientEvent("QBCore:Notify", source, Locales.Countdown_Already_Started, "error")
                end
            else
                TriggerClientEvent("QBCore:Notify", source, Locales.Cooldown_Not_Ended, "error")
            end
        else
            TriggerClientEvent("QBCore:Notify", source, Locales.Reward_Not_Allowed_During_Active, "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, Locales.Redzone_Not_Active, "error")
    end
end)

function GetRandomItem()
    local items = RookConfig.Items
    local randomIndex = math.random(1, #items)
    return items[randomIndex]
end

RegisterNetEvent('redzone:server:odul', function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if redzone then
        if odul then
            local randomItem = GetRandomItem()
            xPlayer.Functions.AddItem(randomItem.item, randomItem.amount)
            odul = false
            TriggerEvent('redzone:server:cooldown')
            TriggerClientEvent("QBCore:Notify", -1, Locales.Player_Reward_Claimed, "primary")
        end
    end
end)
