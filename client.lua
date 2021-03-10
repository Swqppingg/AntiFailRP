-- Speed Limiter --
if Config.speedlimiter then
Citizen.CreateThread(function()
	while true do 
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(ped, false)
		local speed = GetEntitySpeed(vehicle)
        local class = GetVehicleClass(vehicle)
		Citizen.Wait(20)
			if (ped) then
                if class == 16 then
                    -- planes
                else
                if class == 15 then
                    -- helicopters
                else
                if class == 18 then
                    if math.floor(speed*2.2369) == Config.emergencyclassSpeedlimit then
                        cruise = speed
                        SetEntityMaxSpeed(vehicle, cruise)
                    end
                else
				if math.floor(speed*2.2369) == Config.speedlimit then
					cruise = speed
					SetEntityMaxSpeed(vehicle, cruise)
					end
				end
			end
		end
    end
end
end)
end

-- Anti VDM --
if Config.antivdm then
Citizen.CreateThread(function()
    while true do
        SetWeaponDamageModifier(-1553120962, 0.0)
        Citizen.Wait(10)
    end
end)
end

-- Disable Vehicle Weapons --
if Config.disablevehicleweapons then
Citizen.CreateThread(function()
    while true do
	local wait = 500
        local playerped = PlayerPedId()
        if IsPedInAnyVehicle(playerped, false) then
			wait = 0
			local veh = GetVehiclePedIsUsing(playerped)
			if DoesVehicleHaveWeapons(veh) == 1 and vehicleweaponhash ~= 1422046295 then
				vehicleweapon, vehicleweaponhash = GetCurrentPedVehicleWeapon(playerped)
				if vehicleweapon == 1 then
					DisableVehicleWeapon(true, vehicleweaponhash, veh, playerped)
				end
			end
		end
        Citizen.Wait(wait)
	end
end)
end
