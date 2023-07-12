Framework = nil
Delay = 0

TriggerEvent('Framework:GetObject', function(obj) Framework = obj end)

Framework.Functions.CreateCallback('qb-back:police', function(source, cb)
    local number = 0
    for _, v in pairs(Framework.Functions.GetPlayers()) do
        local Player = Framework.Functions.GetPlayer(v)
        if Player ~= nil then 
            if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
                number = number +1
            end
        end
    end
    cb(number)
end)

Framework.Functions.CreateCallback('qb-back:mechanic', function(source, cb)
    local number = 0
    for _, v in pairs(Framework.Functions.GetPlayers()) do
        local Player = Framework.Functions.GetPlayer(v)
        if Player ~= nil then 
            if Player.PlayerData.job.name == "mechanic" and Player.PlayerData.job.onduty then
                number = number +1
            end
        end
    end
    cb(number)
end)

Framework.Functions.CreateCallback('qb-back:ambulance', function(source, cb)
    local number = 0
    for _, v in pairs(Framework.Functions.GetPlayers()) do
        local Player = Framework.Functions.GetPlayer(v)
        if Player ~= nil then 
            if Player.PlayerData.job.name == "ambulance" and Player.PlayerData.job.onduty then
                number = number +1
            end
        end
    end
    cb(number)
end)


Framework.Functions.CreateCallback('qb-back:perms', function(source, cb)
    Framework.Functions.ExecuteSql(true, "SELECT permission FROM `server_extra` WHERE steam = '"..GetPlayerIdentifiers(source)[1].."';", function(result)
        if result[1] ~= nil then
         cb(true)
        else
         cb(false)
        end
    end)
end)

RegisterServerEvent("qb-back:Delay:add")
AddEventHandler("qb-back:Delay:add",function()
    Delay = Delay + 1
    print(Delay.." dodaje")
end)


Framework.Functions.CreateCallback('qb-back:delay', function(source, cb, add)
    if add then
        if Delay < 3 then
            cb(true)
            print(Delay.." true [without]") 
        else
            print(Delay.." false [without]")
            cb(false)
        end 
    else
        if Delay < 3 then
            cb(true)
            print(Delay.." true")
            Delay = Delay + 1 
        else
            print(Delay.." false")
            cb(false)
        end 
    end
end)

RegisterServerEvent("qb-back:delay:end")
AddEventHandler("qb-back:delay:end",function(time)
    if Delay ~= 0 then
        if time ~= nil then
            Citizen.SetTimeout(1000 * 60 * time, function()
                Delay = Delay - 1
                print(Delay.." delete after time")
            end)
        else 
            Delay = Delay - 1
            print(Delay.." delete")
        end 
    end 
end)


Framework.Commands.Add("back-reset", "reset delay", {}, true, function(source, args)
	Delay = 0
    print(Delay.." reset")
end, "admin")
