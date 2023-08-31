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

-- create a table to store menu options by category
local categoryMenus = {}

-- iterate through recipes and organize them by category
for _, v in ipairs(Config.Crafting) do
    local option = {
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
    }

    -- check if a menu already exists for this category
    if not categoryMenus[v.category] then
        categoryMenus[v.category] = {
            id = 'crafting_menu_' .. v.category,
            title = 'Crafting Menu - ' .. v.category,
            options = { option }
        }
    else
        table.insert(categoryMenus[v.category].options, option)
    end
end

-- log menu events by category
for category, menuData in pairs(categoryMenus) do
    RegisterNetEvent('rsg-crafting:client:' .. category)
    AddEventHandler('rsg-crafting:client:' .. category, function()
        lib.registerContext(menuData)
        lib.showContext(menuData.id)
    end)
end

-- main event to open main menu
RegisterNetEvent('rsg-crafting:client:craftingmenu')
AddEventHandler('rsg-crafting:client:craftingmenu', function()
    -- show main menu with categories
    local mainMenu = {
        id = 'crafting_menu',
        title = 'Crafting Menu',
        options = {}
    }

    for category, menuData in pairs(categoryMenus) do
        table.insert(mainMenu.options, {
            title = category,
            description = 'Explore the recipes for ' .. category,
            icon = 'fa-solid fa-pen-ruler',
            event = 'rsg-crafting:client:' .. category
        })
    end

    lib.registerContext(mainMenu)
    lib.showContext(mainMenu.id)
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
