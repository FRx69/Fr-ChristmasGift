local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('Franko:Client:TakeGift', function(source)
	TriggerEvent('animations:client:EmoteCommandStart', {"petting"})
	QBCore.Functions.Progressbar('Taking Gift Box...', 'Taking Gift Box...', Config.takinggifttime, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = '',
		anim = '',
		flags = 16,
	}, {}, {}, function()
		for i=1, Config.AmountOfGifts do
			local item = math.random(#Config.takinggift)
			TriggerServerEvent('takegift:server:recieveItem', Config.takinggift[item].item, math.random (Config.takinggift[item].minAmount, Config.takinggift[item].maxAmount))
			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[Config.takinggift[item].item], "add")
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end
		end, function()
	end)
end)

-- gift box item 

RegisterNetEvent('Franko:Client:UseGiftBox', function(source)
    RequestAnimDict("mp_arresting")
	while (not HasAnimDictLoaded("mp_arresting")) do
        Citizen.Wait(0)
        end
        TaskPlayAnim(PlayerPedId(), "mp_arresting" ,"a_uncuff" ,8.0, -8.0, -1, 1, 0, false, false, false )
          local PedCoords = GetEntityCoords(PlayerPedId())
          propbox = CreateObject(GetHashKey('hei_prop_hei_drug_pack_01a'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
          AttachEntityToEntity(propbox, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.1, 0.1, 0.0, 0.0, 10.0, 90.0, false, false, false, false, 2, true)
        Citizen.Wait(5)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "boxopen", 0.8)
	QBCore.Functions.Progressbar('Frankogiftbox', 'Opening gift!!', Config.OpengiftTime, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = '',
		anim = '',
		flags = 16,
	}, {}, {}, function()
		for i=1, Config.AmountOfItems do
			local item = math.random(#Config.Joingiftitem)
			TriggerServerEvent('FrankoOpenBox:server:recieveItems', Config.Joingiftitem[item].item, math.random (Config.Joingiftitem[item].minAmount, Config.Joingiftitem[item].maxAmount))
			TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[Config.Joingiftitem[item].item], "add")
			DeleteEntity(propbox)
			ClearPedTasks(PlayerPedId())
		end
		end, function()
	end)
end)

