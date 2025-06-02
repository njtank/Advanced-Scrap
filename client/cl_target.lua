local function canScrapVehicle(entity)
    return true
end

local function scrapVehicle(entity)
    if not canScrap then
        exports.ox_lib:notify({type = 'error', description = 'You need to deliver the package first'})
        return
    end
    if lib.progressBar({
        duration = Config.ScrapProgress.duration,
        label = Config.ScrapProgress.label,
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
        },
        anim = {
            dict = Config.ScrapProgress.animation.dict,
            clip = Config.ScrapProgress.animation.clip,
            flag = 1,
        },
    }) then
        lib.callback('qbx_junkyard:server:scrapVehicle', false, function(success)
            if not success then
                exports.ox_lib:notify({type = 'error', description = 'Failed to scrap vehicle'})
            end
        end)
    else
        exports.ox_lib:notify({type = 'error', description = 'Scrapping canceled'})
        ClearPedTasks(cache.ped)
    end
end

CreateThread(function()
    for _, location in ipairs(Config.Locations) do
        exports.ox_target:addSphereZone({
            coords = location,
            radius = 2.5,
            debug = false,
            options = {
                {
                    label = Config.TargetOptions.scrapLabel,
                    icon = Config.TargetOptions.scrapIcon,
                    distance = Config.TargetOptions.distance,
                    canInteract = function(entity, distance, coords, name)
                        return canScrapVehicle(entity)
                    end,
                    onSelect = function(data)
                        scrapVehicle(data.entity)
                    end
                }
            }
        })
    end
end)