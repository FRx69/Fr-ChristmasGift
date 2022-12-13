local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('takegift:server:recieveItem', function(item, itemAmount)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    ply.Functions.AddItem(item, itemAmount)
end)



-- franko gift box

QBCore.Functions.CreateUseableItem("present", function(source, item)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(source)
    if Ply.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent('Franko:Client:UseGiftBox', src, item)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["present"], "remove")
    end
end)

RegisterNetEvent('FrankoOpenBox:server:recieveItems', function(item, itemAmount)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    ply.Functions.AddItem(item, itemAmount)
end)



