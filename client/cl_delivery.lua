local npcSpawned = false
local deliveryNPC = nil

CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(cache.ped)
        local npcCoords = Config.DeliveryNPC.xyz
        local distance = #(playerCoords - npcCoords)

        if distance < 50.0 and not npcSpawned then
            RequestModel(Config.NPCModel)
            while not HasModelLoaded(Config.NPCModel) do
                Wait(0)
            end

            deliveryNPC = CreatePed(4, Config.NPCModel, Config.DeliveryNPC.xyzw, false, true)
            FreezeEntityPosition(deliveryNPC, true)
            SetEntityInvincible(deliveryNPC, true)
            SetBlockingOfNonTemporaryEvents(deliveryNPC, true)
            npcSpawned = true

            exports.ox_target:addLocalEntity(deliveryNPC, {
                {
                    label = Config.TargetOptions.deliveryLabel,
                    icon = Config.TargetOptions.deliveryIcon,
                    distance = Config.TargetOptions.distance,
                    canInteract = function()
                        return not canScrap and not currentDeliveryLocation
                    end,
                    onSelect = function()
                        TriggerServerEvent('qbx_junkyard:server:requestDelivery')
                    end
                }
            })
        elseif distance >= 50.0 and npcSpawned then
            DeleteEntity(deliveryNPC)
            npcSpawned = false
        end

        Wait(1000)
    end
end)

CreateThread(function()
    for _, location in ipairs(Config.DeliveryLocations) do
        exports.ox_target:addSphereZone({
            coords = location,
            radius = 2.5,
            debug = false,
            options = {
                {
                    label = Config.TargetOptions.dropoffLabel,
                    icon = Config.TargetOptions.dropoffIcon,
                    distance = Config.TargetOptions.distance,
                    canInteract = function()
                        return currentDeliveryLocation and #(GetEntityCoords(cache.ped) - currentDeliveryLocation) < 3.0
                    end,
                    onSelect = function()
                        TriggerServerEvent('qbx_junkyard:server:completeDelivery')
                    end
                }
            }
        })
    end
end)