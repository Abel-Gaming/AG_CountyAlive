function ShowHelpNotification(message, makeSound, duration)
	BeginTextCommandDisplayHelp("THREESTRINGS")
	AddTextComponentSubstringPlayerName(message)
    EndTextCommandDisplayHelp(0, false, makeSound, duration)
end

function DrawGroundMarker(x, y, z)
	DrawMarker(25, x, y, z - 1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 5.0, 5.0, 5.0, 3, 15, 250, 75, false, true, 2, nil, nil, false)
end

function sendChatMessage(message)
	TriggerEvent("chatMessage", "", {0, 0, 0}, "^7" .. message)
end

function ShowNotification(message)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName(message)
	DrawNotification(false, true)
end

function SuccessMessage(successMessage)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~g~[SUCCESS]~w~ ' .. successMessage)
	DrawNotification(false, true)
end

function ErrorMessage(errorMessage)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~r~[ERROR]~w~ ' .. errorMessage)
	DrawNotification(false, true)
end

function InfoMessage(message)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~y~[INFO]~w~ ' .. message)
	DrawNotification(false, true)
end

function DrawText3D(x, y, z, text, scl_factor)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215) -- Red, Green, Blue, Alpha (Transparency)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function SetTent()
	if tentSet then
		DeleteEntity(tent)
		ESX.ShowNotification('~r~Tent removed!')
		tentLocked = false
		tentSet = false
	else
		local playerCoords = GetEntityCoords(PlayerPedId())
		tent = CreateObject(Config.TentModelHash, playerCoords.x + 1.25, playerCoords.y, playerCoords.z - 2, true, false, false)
		ESX.ShowNotification('~g~Tent placed!')
		tentSet = true
	end
end

function SetFire()
	if fireStarted then
		DeleteEntity(fire)
		ESX.ShowNotification('~r~Fire removed!')
		fireStarted = false
		fireLocked = false
	else
		local playerCoords = GetEntityCoords(PlayerPedId())
		fire = CreateObject(Config.CampFireModelHash, playerCoords.x + 1.25, playerCoords.y, playerCoords.z - 1.5, true, false, false)
		ESX.ShowNotification('~g~Fire placed!')
		fireStarted = true
	end
end

function SetGrill()
	if grillSet then
		DeleteEntity(grill)
		ESX.ShowNotification('~r~Grill removed!')
		grillSet = false
		grillLocked = false
	else
		local playerCoords = GetEntityCoords(PlayerPedId())
		grill = CreateObject(Config.GrillModelHash, playerCoords.x + 1.25, playerCoords.y, playerCoords.z - 1.0, true, false, false)
		FreezeEntityPosition(grill, true)
		ESX.ShowNotification('~g~Grill placed!')
		grillSet = true
	end
end

function SetChair()
	if chairSet then
		DeleteEntity(chair)
		ESX.ShowNotification('~r~Chair removed!')
		chairSet = false
		chairLocked = false
	else
		local playerCoords = GetEntityCoords(PlayerPedId())
		chair = CreateObject(Config.ChairModelHash, playerCoords.x + 1.25, playerCoords.y, playerCoords.z - 1.0, true, false, false)
		FreezeEntityPosition(chair, true)
		ESX.ShowNotification('~g~Chair placed!')
		chairSet = true
	end
end