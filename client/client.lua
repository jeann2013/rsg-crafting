local RSGCore = exports['rsg-core']:GetCoreObject()
local options = {}

------------------------------------------------------------------------------------------------------

-- crafting locations
Citizen.CreateThread(function()
    for crafting, v in pairs(Config.CraftingLocations) do
        exports['rsg-core']:createPrompt(v.location, v.coords, RSGCore.Shared.Keybinds[Config.Keybind], Lang:t('label.open_crafting_menu'), {
            type = 'client',
            event = 'rsg-crafting:client:craftingmenu',
        })
        if v.showblip == true then
            local CraftingBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(CraftingBlip, 3535996525, 1)
            SetBlipScale(CraftingBlip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, CraftingBlip, v.name)
        end
    end
end)

------------------------------------------------------------------------------------------------------

for _, v in ipairs(Config.Crafting) do
    table.insert(options, {
        title = v.title,
        description = v.description,
        icon = 'fa-solid fa-pen-ruler',
        event = 'rsg-crafting:client:checkingredients',
        args = {
            title = v.title,
            ingredients = v.ingredients,
            crafttime = v.crafttime,
            receive = v.receive,
            giveamount = v.giveamount
        }
    })
end

RegisterNetEvent('rsg-crafting:client:craftingmenu', function()
    lib.registerContext({
        id = 'crafting_menu',
        title = 'Crafting Menu',
        options = options
    })
    lib.showContext('crafting_menu')
end)

------------------------------------------------------------------------------------------------------

-- check player has the ingredients to craft item
RegisterNetEvent('rsg-crafting:client:checkingredients', function(data)
    RSGCore.Functions.TriggerCallback('rsg-crafting:server:checkingredients', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-crafting:client:craftitem', data.title, data.ingredients, tonumber(data.crafttime), data.receive, data.giveamount)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, data.ingredients)
end)

-- do crafting
RegisterNetEvent('rsg-crafting:client:craftitem', function(title, ingredients, crafttime, receive, giveamount)
    RSGCore.Functions.Progressbar('cook-meal', Lang:t('progressbar.crafting_a')..title, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('rsg-crafting:server:finishcrafting', ingredients, receive, giveamount)
    end)
end)

------------------------------------------------------------------------------------------------------
