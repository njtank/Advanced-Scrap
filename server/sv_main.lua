local PlayerData = {}

lib.callback.register('qbx_junkyard:server:scrapVehicle', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return false end
    Wait(500)
    local items = {}
    local itemCount = math.random(Config.MinItems, Config.MaxItems)
    
    for i = 1, itemCount do
        local randomItem = Config.ScrapItems[math.random(#Config.ScrapItems)]
        items[randomItem] = (items[randomItem] or 0) + 1
    end

    for item, amount in pairs(items) do
        exports.ox_inventory:AddItem(source, item, amount)
    end

    TriggerClientEvent('qbx_junkyard:client:scrapSuccess', source, items)
    return true
end)