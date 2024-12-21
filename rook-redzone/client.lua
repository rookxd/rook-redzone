QBCore = exports['qb-core']:GetCoreObject()

function redzone()
	if RookConfig.Menu == 'qb' then
		local RedzoneMenu = {
			{
				header = Locales.Menu_Header,
				isMenuHeader = true
			},
			{
				header = Locales.Menu_Reward,
				params = {
					event = 'odulal',
				}
			},
			{
				header = Locales.Menu_StartRemainingTime,
				params = {
					event = 'gerisayim',
				}
			}
		}   
		exports['qb-menu']:openMenu(RedzoneMenu)
	elseif RookConfig.Menu == 'ox' then
		local RedzoneMenu = {
			{
				title = Locales.Menu_Reward,
				event = 'odulal',
				args = {}
			},
			{
				title = Locales.Menu_StartRemainingTime,
				event = 'gerisayim',
				args = {}
			}
		}
		lib.registerContext({
			id = 'redzoneMenu',
			title = Locales.Menu_Header,
			options = RedzoneMenu
		})
		lib.showContext('redzoneMenu')
	end
end


RegisterNetEvent('odulal', function()
	TriggerServerEvent('redzone:server:odul')
end)

RegisterNetEvent('gerisayim', function()
	TriggerServerEvent('redzone:server:gerisayim')
end)

Citizen.CreateThread(function()

    RequestModel(RookConfig.PedName)
    while not HasModelLoaded(RookConfig.PedName) do
        Wait(1)
    end

    local npc = CreatePed(4, RookConfig.PedName, RookConfig.PedCoords.x, RookConfig.PedCoords.y, RookConfig.PedCoords.z, RookConfig.PedCoords.h, false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)

	if RookConfig.Target == 'qb' then
        exports['qb-target']:AddBoxZone("redzonebabo", RookConfig.TargetCoords, 1.5, 1.6, {
            name = "redzonebabo",
            heading = RookConfig.TargetHeading,
            debugPoly = RookConfig.Debug,
            minZ = RookConfig.TargetMinZ,
            maxZ = RookConfig.TargetMaxZ,
        }, {
            options = {
                {
                    num = 1,
                    type = "client",
                    label = RookConfig.TargetLabel,
                    action = function()
                        redzone()
                    end
                }
            },
            distance = RookConfig.TargetDistance
        })
    elseif RookConfig.Target == 'ox' then
        exports['ox_target']:addBoxZone({
            coords = RookConfig.TargetCoords,
            size = vec3(1.5, 1.6, 1),
            rotation = RookConfig.TargetHeading,
            debug = RookConfig.Debug,
            options = {
                {
                    name = "redzonebabo",
                    label = RookConfig.TargetLabel,
                    onSelect = function()
                        redzone()
                    end,
                    distance = RookConfig.TargetDistance
                }
            }
        })
    end
end)
