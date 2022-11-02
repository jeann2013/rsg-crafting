local QRCore = exports['qr-core']:GetCoreObject()

--------------------------------------------------------------------------

-- get crafting rep
QRCore.Commands.Add('craftingrep', 'get your crafting reputation', {}, false, function(source)
    local src = source
	local Player = QRCore.Functions.GetPlayer(src)
    local craftingRep = Player.PlayerData.metadata['craftingrep']
	TriggerClientEvent('QRCore:Notify', src, 'Your Crafting Rep is: '..craftingRep, 'primary')
end)

--------------------------------------------------------------------------

-- bpo shovel copy
QRCore.Functions.CreateUseableItem('bposhovel', function(source, item)
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	------------------------
	local bpo = 'bposhovel'
	local bpc = 'bpcshovel'
	local name = 'Shovel'
	local repneeded = Config.ShovelRepRequired
	local copycost = Config.ShovelCopyCost
	------------------------
	local cashBalance = Player.PlayerData.money["cash"]
	local craftingRep = Player.PlayerData.metadata['craftingrep']
	if craftingRep >= repneeded then
		if cashBalance >= copycost then
			Player.Functions.RemoveMoney("cash", copycost, "copy-bpo")
			TriggerClientEvent('QRCore:Notify', src, '$'..copycost..' taken for the copy', 'success')
			TriggerClientEvent('rsg-crafting:client:makecopy', src, bpo, bpc, name)
		else 
			TriggerClientEvent('QRCore:Notify', src, 'you don\'t have enough cash to do that!', 'error')
		end
	else
		TriggerClientEvent('QRCore:Notify', src, 'not enough reputation '..repneeded..' required!', 'error')
	end
end)

-- craft shovel
RegisterServerEvent('rsg-crafting:server:craftshovel')
AddEventHandler('rsg-crafting:server:craftshovel', function()
	local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	local craftingRep = Player.PlayerData.metadata["craftingrep"]
	if craftingRep >= Config.ShovelRepRequired then
		-- remove items
		Player.Functions.RemoveItem('bpcshovel', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['bpcshovel'], "remove")
		Player.Functions.RemoveItem('steel', 3)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['steel'], "remove")
		Player.Functions.RemoveItem('wood', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['wood'], "remove")
		-- add items
		Player.Functions.AddItem('shovel', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['shovel'], "add")
		Player.Functions.SetMetaData("craftingrep", Player.PlayerData.metadata["craftingrep"] + 1)
		TriggerClientEvent('QRCore:Notify', src, 'crafting successful', 'success')
		Wait(5000)
		TriggerEvent('rsg-crafting:server:craftingrep', src)
	else
		TriggerClientEvent('QRCore:Notify', src, 'not enough crafting reputation to make this!', 'success')
	end
end)

--------------------------------------------------------------------------

-- bpo axe copy
QRCore.Functions.CreateUseableItem('bpoaxe', function(source, item)
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	------------------------
	local bpo = 'bpoaxe'
	local bpc = 'bpcaxe'
	local name = 'Axe'
	local repneeded = Config.AxeRepRequired
	local copycost = Config.AxeCopyCost
	------------------------
	local cashBalance = Player.PlayerData.money["cash"]
	local craftingRep = Player.PlayerData.metadata['craftingrep']
	if craftingRep >= repneeded then
		if cashBalance >= copycost then
			Player.Functions.RemoveMoney("cash", copycost, "copy-bpo")
			TriggerClientEvent('QRCore:Notify', src, '$'..copycost..' taken for the copy', 'success')
			TriggerClientEvent('rsg-crafting:client:makecopy', src, bpo, bpc, name)
		else 
			TriggerClientEvent('QRCore:Notify', src, 'you don\'t have enough cash to do that!', 'error')
		end
	else
		TriggerClientEvent('QRCore:Notify', src, 'not enough reputation '..repneeded..' required!', 'error')
	end
end)

-- craft axe
RegisterServerEvent('rsg-crafting:server:craftaxe')
AddEventHandler('rsg-crafting:server:craftaxe', function()
	local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	local craftingRep = Player.PlayerData.metadata["craftingrep"]
	if craftingRep >= Config.AxeRepRequired then
		-- remove items
		Player.Functions.RemoveItem('bpcaxe', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['bpcaxe'], "remove")
		Player.Functions.RemoveItem('steel', 3)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['steel'], "remove")
		Player.Functions.RemoveItem('wood', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['wood'], "remove")
		-- add items
		Player.Functions.AddItem('axe', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['axe'], "add")
		Player.Functions.SetMetaData("craftingrep", Player.PlayerData.metadata["craftingrep"] + 1)
		TriggerClientEvent('QRCore:Notify', src, 'crafting successful', 'success')
		Wait(5000)
		TriggerEvent('rsg-crafting:server:craftingrep', src)
	else
		TriggerClientEvent('QRCore:Notify', src, 'not enough crafting reputation to make this!', 'success')
	end
end)

--------------------------------------------------------------------------

-- bpo pickaxe copy
QRCore.Functions.CreateUseableItem('bpopickaxe', function(source, item)
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	------------------------
	local bpo = 'bpopickaxe'
	local bpc = 'bpcpickaxe'
	local name = 'PickAxe'
	local repneeded = Config.PickAxeRepRequired
	local copycost = Config.PickAxeCopyCost
	------------------------
	local cashBalance = Player.PlayerData.money["cash"]
	local craftingRep = Player.PlayerData.metadata['craftingrep']
	if craftingRep >= repneeded then
		if cashBalance >= copycost then
			Player.Functions.RemoveMoney("cash", copycost, "copy-bpo")
			TriggerClientEvent('QRCore:Notify', src, '$'..copycost..' taken for the copy', 'success')
			TriggerClientEvent('rsg-crafting:client:makecopy', src, bpo, bpc, name)
		else 
			TriggerClientEvent('QRCore:Notify', src, 'you don\'t have enough cash to do that!', 'error')
		end
	else
		TriggerClientEvent('QRCore:Notify', src, 'not enough reputation '..repneeded..' required!', 'error')
	end
end)

-- craft pickaxe
RegisterServerEvent('rsg-crafting:server:craftpickaxe')
AddEventHandler('rsg-crafting:server:craftpickaxe', function()
	local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	local craftingRep = Player.PlayerData.metadata["craftingrep"]
	if craftingRep >= Config.AxeRepRequired then
		-- remove items
		Player.Functions.RemoveItem('bpcpickaxe', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['bpcpickaxe'], "remove")
		Player.Functions.RemoveItem('steel', 3)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['steel'], "remove")
		Player.Functions.RemoveItem('wood', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['wood'], "remove")
		-- add items
		Player.Functions.AddItem('pickaxe', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items['pickaxe'], "add")
		Player.Functions.SetMetaData("craftingrep", Player.PlayerData.metadata["craftingrep"] + 1)
		TriggerClientEvent('QRCore:Notify', src, 'crafting successful', 'success')
		Wait(5000)
		TriggerEvent('rsg-crafting:server:craftingrep', src)
	else
		TriggerClientEvent('QRCore:Notify', src, 'not enough crafting reputation to make this!', 'success')
	end
end)

--------------------------------------------------------------------------

-- give blueprint copy
RegisterServerEvent('rsg-crafting:server:givecopy')
AddEventHandler('rsg-crafting:server:givecopy', function(copy)
	local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(copy, 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QRCore.Shared.Items[copy], "add")
end)

-- get new craftingrep
RegisterServerEvent('rsg-crafting:server:craftingrep')
AddEventHandler('rsg-crafting:server:craftingrep', function(source)
    local src = source
	local Player = QRCore.Functions.GetPlayer(src)
	local curRep = Player.PlayerData.metadata["craftingrep"]
	TriggerClientEvent('QRCore:Notify', src, 'Your crafting reputation increased to '.. curRep, 'primary')
end)
