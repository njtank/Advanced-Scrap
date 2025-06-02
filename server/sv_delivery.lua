RegisterNetEvent('qbx_junkyard:server:requestDelivery', function()
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end
    local deliveryLocation = Config.DeliveryLocations[math.random(#Config.DeliveryLocations)]
    exports.ox_inventory:AddItem(src, 'delivery_package', 1)
    TriggerClientEvent('qbx_junkyard:client:startDelivery', src, deliveryLocation)
end)

RegisterNetEvent('qbx_junkyard:server:completeDelivery', function()
    local src = source
    local player = exports.qbx_core:GetPlayer(src)
    if not player then return end

    local hasItem = exports.ox_inventory:GetItem(src, 'delivery_package', nil, true)
    if hasItem < 1 then
        TriggerClientEvent('ox_lib:notify', src, {type = 'error', description = 'You don\'t have the delivery package'})
        return
    end
    exports.ox_inventory:RemoveItem(src, 'delivery_package', 1)
    player.Functions.AddMoney('cash', Config.DeliveryReward, 'delivery-complete')
    TriggerClientEvent('qbx_junkyard:client:deliveryComplete', src)
end)