local canScrap = true
local currentDeliveryLocation = nil
local deliveryBlip = nil
local scrapCount = 0

local function onScrapItemUsed()
    if not canScrap then
        exports.ox_lib:notify({type = 'error', description = 'You need to deliver the package first'})
        return
    end
    exports.ox_lib:notify({type = 'inform', description = 'Find a junk car in the junkyard to scrap'})
end

RegisterNetEvent('qbx_junkyard:client:scrapSuccess', function(items)
    scrapCount = scrapCount + 1
    local itemList = {}
    for item, amount in pairs(items) do
        table.insert(itemList, string.format('%s x%d', item, amount))
    end
    
    exports.ox_lib:notify({
        type = 'success',
        description = 'You received: ' .. table.concat(itemList, ', ')
    })
    if scrapCount >= Config.ScrapsBeforeDelivery then
        exports.ox_lib:notify({
            type = 'inform',
            description = 'You need to collect a delivery package from the foreman'
        })
        canScrap = false
    else
        canScrap = false
        SetTimeout(Config.ScrapCooldown * 1000, function()
            canScrap = true
        end)
    end
end)

RegisterNetEvent('qbx_junkyard:client:startDelivery', function(location)
    currentDeliveryLocation = location
    if deliveryBlip then RemoveBlip(deliveryBlip) end
    deliveryBlip = AddBlipForCoord(location.x, location.y, location.z)
    SetBlipSprite(deliveryBlip, 1)
    SetBlipColour(deliveryBlip, 5)
    SetBlipRoute(deliveryBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Delivery Location")
    EndTextCommandSetBlipName(deliveryBlip)
    
    exports.ox_lib:notify({
        type = 'success',
        description = 'Package collected! Deliver it to the marked location'
    })
end)

RegisterNetEvent('qbx_junkyard:client:deliveryComplete', function()
    if deliveryBlip then RemoveBlip(deliveryBlip) end
    currentDeliveryLocation = nil
    scrapCount = 0
    canScrap = true
    
    exports.ox_lib:notify({
        type = 'success',
        description = string.format('Delivery complete! You received $%d. You can continue scrapping.', Config.DeliveryReward)
    })
end)

exports('useScrapTool', onScrapItemUsed)