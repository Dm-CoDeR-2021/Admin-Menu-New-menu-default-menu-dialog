--[[
	Joker Leak On Top
	Discord : https://discord.gg/vtPDqf8DpQ
]]


DM = nil

Citizen.CreateThread(function()
	while DM == nil do
		TriggerEvent('esx:getSharedObject', function(obj) DM = obj end)
		Citizen.Wait(0)
	end
end)

local visable = false
local superjump = false
local vehgod = false
local reason = 'none'
local id = 'none'
local weapon_list = {

	"WEAPON_ADVANCEDRIFLE",

	"WEAPON_APPISTOL",

	"WEAPON_ASSAULTRIFLE",

	"WEAPON_ASSAULTSHOTGUN",

	"WEAPON_ASSAULTSMG",

	"WEAPON_AUTOSHOTGUN",

	"WEAPON_BAT",

	"WEAPON_BATTLEAXE",

	"WEAPON_BOTTLE",

	"WEAPON_BULLPUPRIFLE",

	"WEAPON_BULLPUPSHOTGUN",

	"WEAPON_CARBINERIFLE",

	"WEAPON_COMBATMG",

	"WEAPON_COMBATPDW",

	"WEAPON_COMBATPISTOL",

	"WEAPON_COMPACTLAUNCHER",

	"WEAPON_COMPACTRIFLE",

	"WEAPON_CROWBAR",

	"WEAPON_DAGGER",

	"WEAPON_DBSHOTGUN",

	"WEAPON_FIREWORK",

	"WEAPON_FLAREGUN",

	"WEAPON_FLASHLIGHT",

	"WEAPON_GRENADE",

	"WEAPON_GRENADELAUNCHER",

	"WEAPON_GUSENBERG",

	"WEAPON_GOLFCLUB",

	"WEAPON_HAMMER",

	"WEAPON_HATCHET",

	"WEAPON_HEAVYPISTOL",

	"WEAPON_HEAVYSHOTGUN",

	"WEAPON_HEAVYSNIPER",

	"WEAPON_HOMINGLAUNCHER",

	"WEAPON_KNIFE",

	"WEAPON_KNUCKLE",

	"WEAPON_MACHETE",

	"WEAPON_MACHINEPISTOL",

	"WEAPON_MARKSMANPISTOL",

	"WEAPON_MARKSMANRIFLE",

	"WEAPON_MG",

	"WEAPON_MICROSMG",

	"WEAPON_MINIGUN",

	"WEAPON_MINISMG",

	"WEAPON_MOLOTOV",

	"WEAPON_MUSKET",

	"WEAPON_NIGHTSTICK",

	"WEAPON_PETROLCAN",

	"WEAPON_PIPEBOMB",

	"WEAPON_PISTOL",

	"WEAPON_PISTOL50",

	"WEAPON_POOLCUE",

	"WEAPON_PROXMINE",

	"WEAPON_PUMPSHOTGUN",

	"WEAPON_RAILGUN",

	"WEAPON_REVOLVER",

	"WEAPON_RPG",

	"WEAPON_SAWNOFFSHOTGUN",

	"WEAPON_SMG",

	"WEAPON_SMOKEGRENADE",

	"WEAPON_SNIPERRIFLE",

	"WEAPON_SNSPISTOL",

	"WEAPON_SPECIALCARBINE",

	"WEAPON_STICKYBOMB",

	"WEAPON_STUNGUN",

	"WEAPON_SWITCHBLADE",

	"WEAPON_VINTAGEPISTOL",

	"WEAPON_WRENCH",

	"WEAPON_RAYCARBINE",

}

function DrawTx(text)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.5, 0.13)
end
function DrawTx2(text)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.5, 0.10)
end
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustPressed(0, Config.key) then
			TriggerServerEvent('get:perm:menu')
		end
		if visable then
			SetEntityVisible(GetPlayerPed(-1), false)
		elseif visable == false then
			SetEntityVisible(GetPlayerPed(-1), true)
		end
		if superjump then
			SetSuperJumpThisFrame(PlayerId())
		elseif superjump == false then
		end
		if vehgod then
			DrawTx('~g~Engine Health ~w~: ' .. GetVehicleEngineHealth(GetVehiclePedIsUsing(GetPlayerPed(-1))))
			DrawTx2('~g~Body Health ~w~: ' .. GetVehicleBodyHealth((GetVehiclePedIsUsing(GetPlayerPed(-1)))))
		elseif vehgod == false then
		end
	end
end)
RegisterNetEvent('open:admin:menu')
AddEventHandler('open:admin:menu', function()
	OpenAdminMenu()
end)
function OpenAdminMenu()
	DM.TriggerServerCallback('get:perm:svmng:admenu', function(perm)
	local elements = {}
	table.insert(elements, {label = 'Visable', value = 'vs'})
	table.insert(elements, {label = 'Announce', value = 'an'})
	table.insert(elements, {label = 'KickPlayer', value = 'kick'})
	table.insert(elements, {label = 'SuperJump', value = 'sp'})
	table.insert(elements, {label = 'Teleport', value = 'tp'})
	table.insert(elements, {label = _U('sp_veh'), value = 'veh'})
	table.insert(elements, {label = _U('safe_loc'), value = 'sf'})
	table.insert(elements, {label = 'weapon', value = 'wp'})
	if perm then
		table.insert(elements, {label = _U('gva'), value = 'gva'})
		table.insert(elements, {label = _U('rmv'), value = 'rmv'})
		table.insert(elements, {label = _U('mng_sv'), value = 'sv'})
	end
	table.insert(elements, {label = _U('pl_menu'), value = 'pl'})
	
	DM.UI.Menu.Open('default', GetCurrentResourceName(), 'Admin_Menu', {
		title = 'Admin_Menu',
		align = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'vs' then
			if not visable then
				visable = true
				DM.ShowNotification('Visable : ~g~On')
				TriggerEvent('aduty:tag', false)
			elseif visable then
				visable = false
				DM.ShowNotification('Visable : ~r~Off')
				TriggerEvent('aduty:tag', true)
			end
		elseif data.current.value == 'an' then
			OpenAnnounceMenu()
		elseif data.current.value == 'sp' then
			if not superjump then
				superjump = true
				DM.ShowNotification('Super Jump : ~g~On')
			elseif superjump then
				superjump = false
				DM.ShowNotification('Super Jump : ~r~Off')
			end
		elseif data.current.value == 'kick' then
			menu.close()
			OpenKickMenu()
		elseif data.current.value == 'pl' then
			menu.close()
			OpenPlayerOnMenu()
		elseif data.current.value == 'tp' then
			TeleportWy()
		elseif data.current.value == 'sv' then
			menu.close()
			OpenMngSvMenu()
		elseif data.current.value == 'sf' then
			menu.close()
			OpenLocationMenu()
		elseif data.current.value == 'veh' then
			menu.close()
			OpenSpawnVehMenu()
		elseif data.current.value == 'wp' then
			AddWeaponMenu()
		elseif data.current.value == 'gva' then
			for _, weplist in pairs(weapon_list) do
				GiveWeaponToPed(GetPlayerPed(-1), weplist, 250)
			end
		elseif data.current.value == 'rmv' then
			for _, nowep in pairs(weapon_list) do
				RemoveWeaponFromPed(GetPlayerPed(-1), nowep)
			end
		end
	end, function(data, menu)
		menu.close()
	end)
	end)

end
AddWeaponMenu = function()
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'wep', {
		title = 'Weapon',
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		GiveWeaponToPed(GetPlayerPed(-1), dm, 260)
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

OpenLocationMenu = function()
	local elements = {
		{label = 'Police', value = 'pl'},
		{label = 'Medic', value = 'md'},
		{label = 'Mechanic', value = 'mc'},
	}
	DM.UI.Menu.Open('default', GetCurrentResourceName(), 'loc',{
		title = _U('safe_loc'),
		align = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'pl' then
			TriggerEvent('bringandtp:admin:menu', 426.82, -975.79, 30.70)
		end
		if data.current.value == 'md' then
			TriggerEvent('bringandtp:admin:menu', 296.80, -588.33, 43.25)
		end
		if data.current.value == 'mc' then
			TriggerEvent('bringandtp:admin:menu', -366.62, -129.89, 38.70)
		end
	end, function(data, menu)
		menu.close()
		OpenAdminMenu()
	end)
end
local total
function OpenPlayerOnMenu()
	DM.TriggerServerCallback('getplayeronline:admin:menu', function(pl)
		local elements = {}
		for i=1, #pl, 1 do
		table.insert(elements, {
			label = '[' .. pl[i].source .. ']' .. _U('fasele') .. '(' .. pl[i].name .. ')',
			value = pl[i].source,
			name = pl[i].name,
			identifier = pl[i].identifier,
			job = pl[i].job,
			grade = pl[i].grade,
			perm = pl[i].perm,
			group = pl[i].group
		})
		total = pl
		end
		DM.UI.Menu.Open('default', GetCurrentResourceName(), 'Dm', {
			title    = _U('all_tot') .. #total .. '/' .. Config.maxplayer,
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			menu.close()
			OpenMangagePlayer(data.current.name, data.current.identifier, data.current.value, data.current.job, data.current.grade, data.current.perm, data.current.group)
		end, function(data, menu)
			OpenAdminMenu()
			menu.close()
		end)
	end)
end
function OpenMangagePlayer(name, steam, src, job, grade, perm, group)
	local elements = {} 
	table.insert(elements, {label = _U('pl_name') .. name, value = 'pname'})
	table.insert(elements, {label = _U('id') .. src, value = 'pid'})
	table.insert(elements, {label = _U('steam') .. steam, value = 'st'})
	table.insert(elements, {label = _U('job') .. job, value = 'jb'})
	table.insert(elements, {label = _U('grade') .. grade, value = 'gd'})
	table.insert(elements, {label = _U('perm') .. perm, value = 'pm'})
	table.insert(elements, {label = _U('gr') .. group, value = 'gm'})
	table.insert(elements, {label = '--------------------', value = '---'})
	table.insert(elements, {label = 'Teleport', value = 'tp'})
	table.insert(elements, {label = 'Bring', value = 'br'})
	table.insert(elements, {label = 'Heal', value = 'rv'})
	table.insert(elements, {label = 'Slay', value = 'sly'})
	table.insert(elements, {label = _U('sp_car_id'), value = 'vhid'})
	DM.TriggerServerCallback('get:perm:svmng:admenu', function(hasperm)
		if hasperm then
			table.insert(elements, {label = _U('setjob'), value = 'setjob'})
			table.insert(elements, {label = _U('setgang'), value = 'setgang'})
			table.insert(elements, {label = _U('setjobrank'), value = 'setjobrank'})
			table.insert(elements, {label = _U('setgangrank'), value = 'setgangrank'})
			table.insert(elements, {label = _U('kckc') .. name, value = 'kc'})
		end


	DM.UI.Menu.Open('default', GetCurrentResourceName(), 'Admin_Menu', {
		title = name,
		align = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'kc' then
			DM.UI.Menu.Open('default', GetCurrentResourceName(), 'kick', {
				title = 'YesOrNo',
				align = 'top-left',
				elements = {
					{label = 'Yes', value = 'yes'},
					{label = 'No', value = 'no'},			
				}
			}, function(data2, menu2)
				if data2.current.value == 'yes' then
					TriggerServerEvent('kick:admin:menu', src, 'Kicked By Staff')
					menu2.close()
				elseif data2.current.value == 'no' then
					menu2.close()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'br' then
			TriggerServerEvent('bring:admin:menu', src)
		elseif data.current.value == 'tp' then
			TriggerServerEvent('tp:admin:menu', src)
		elseif data.current.value == 'rv' then
			TriggerServerEvent('revive:adminmenu', src)
		elseif data.current.value == 'sly' then
			TriggerServerEvent('slay:adminmenu', src)
		elseif data.current.value == 'vhid' then
			SpVehOnId(src, name)
		elseif data.current.value == 'setjob' then
			OpenSetJobOrGangMenu(src)
		elseif data.current.value == 'setgang' then
			OpenSetJobOrGangMenu(src)
		elseif data.current.value == 'setjobrank' then
			OpenJobRankMenu(src)
		elseif data.current.value == 'setgangrank' then
			OpenGangRankMenu(src)
		end
	end, function(data, menu)
		OpenPlayerOnMenu()
		menu.close()
	end)
	end)
end

OpenSetJobOrGangMenu = function(plsrc)
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'admenu4', {
		title = _U('setjob_or_setgag'),
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
			TriggerServerEvent('setjob:or:setgang:admin:menu', plsrc, dm)
			menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

OpenJobRankMenu = function(plpk)
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'admenu2', {
		title = _U('setjobrank'),
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		TriggerServerEvent('setrank:gangorjob:admenu', plpk, 'job', dm)
			menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

OpenGangRankMenu = function(plpk)
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'admenu3', {
		title = _U('setgangrank'),
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		TriggerServerEvent('setrank:gangorjob:admenu', plpk, 'gang', dm)
			menu.close()
	end, function(data, menu)
		menu.close()
	end)
end
		
RegisterNetEvent('revive:slay:admenu')
AddEventHandler('revive:slay:admenu', function(rvsl, pkid)
	if rvsl == 'heal' then
		SetEntityHealth(GetPlayerPed(-1), 200)
	end
	if rvsl == 'slay' then
		SetEntityHealth(GetPlayerPed(-1), 0)
	end
end)
RegisterNetEvent('bringandtp:admin:menu')
AddEventHandler('bringandtp:admin:menu', function(x, y, z)
	SetEntityCoords(GetPlayerPed(-1), x, y, z + 0.3)
end)
function OpenSpawnVehMenu()
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Veh', {
		title = _U('sp_veh'),
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		SpawnVeh(dm)
	end, function(data, menu)
		menu.close()
	end)
end
function SpVehOnId(idpl, name)
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Veh', {
		title = _U('sp_veh'),
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		TriggerServerEvent('sp:veh:on:id:admenu', idpl, dm)
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function SpawnVeh(vhname)
	local entity = GetEntityCoords(GetPlayerPed(-1))
	DM.Game.SpawnVehicle(vhname, {
		x = entity.x,
		y = entity.y,
		z = entity.z
	}, 330.0, function(vehicle)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
	end)
end 

RegisterNetEvent('car:sp:onid:veh:admenu')
AddEventHandler('car:sp:onid:veh:admenu', function(vh)
	local entity = GetEntityCoords(GetPlayerPed(-1))
	DM.Game.SpawnVehicle(vh, {
		x = entity.x,
		y = entity.y,
		z = entity.z
	}, 330.0, function(vehicle)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
	end)
end)

function TeleportWy()
	local playerPed = GetPlayerPed(-1)
	local blip = GetFirstBlipInfoId(8)
	if DoesBlipExist(blip) then
		local coord = GetBlipInfoIdCoord(blip)
		local groundFound, coordZ = false, 0
		local groundCheckHeights = { 0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0,450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0 }
		for i, height in ipairs(groundCheckHeights) do
			Citizen.CreateThread(function()
				DoScreenFadeOut(2000)
				while not IsScreenFadedOut() do
					Citizen.Wait(50)
				end
				DM.Game.Teleport(playerPed, {
					x = coord.x,
					y = coord.y,
					z = height 
				})
				local foundGround, z = GetGroundZFor_3dCoord(coord.x, coord.y, height)
				if foundGround then
					coordZ = z + 3
					groundFound = true
					return
				end
				if not groundFound then
					coordZ = 100
				end
				DM.Game.Teleport(playerPed, {
					x = coord.x,
					y = coord.y,
					z = coordZ
				})
				Wait(5000)
				StopScreenEffect('DeathFailOut')
				DoScreenFadeIn(2000)
			end)
		end
	end
end

function OpenIdMenu()
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'id', {
		title = 'Id',
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		id = dm
		menu.close()
	end, function(data, menu)
		menu.close()
		OpenKickMenu()
	end)
end
function OpenResMenu()
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Reason', {
		title = 'Reason',
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		reason = dm
		menu.close()
	end, function(data, menu)
		menu.close()
		OpenKickMenu()
	end)
end
function OpenKickMenu()
		local elements = {}
		table.insert(elements, {label = _U('id') .. id, value = 'id'})
		table.insert(elements, {label = _U('reason') .. reason, value = 'res'})
		table.insert(elements, {label = 'KickPlayer', value = 'kick'})
		DM.UI.Menu.Open('default', GetCurrentResourceName(), 'kick', {
			title = 'Kick_Menu',
			align = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'id' then
				OpenIdMenu()
				menu.close()
			elseif data.current.value == 'res'then
				OpenResMenu()
				menu.close()
			elseif data.current.value == 'kick' then
				TriggerServerEvent('kick:admin:menu', id, reason)
				menu.close()
			end
		end, function(data, menu)
			menu.close()
			OpenAdminMenu()
		end)
end		
function OpenAnnounceMenu()
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'announce', {
		title = 'Announce',
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		TriggerServerEvent('announce:admin:menu', dm)
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end
function OpenMngSvMenu()
	local elements = {}
		table.insert(elements, {label = _U('st_res'), value = 'st'})
		table.insert(elements, {label = _U('rs_res'), value = 'rs'})
		table.insert(elements, {label = _U('sp_obj'), value = 'obj'})
		table.insert(elements, {label = _U('veh_god'), value = 'gmode'})
		DM.UI.Menu.Open('default', GetCurrentResourceName(), 'Admin_Menu', {
			title = _U('mng_sv'),
			align = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'st' then
				OpenStartMenu()
			end
			if data.current.value == 'rs' then
				OpenStopMenu()
			end
			if data.current.value == 'obj' then
				OpenObjectMenu()
			end
			if data.current.value == 'gmode' then
				if vehgod == false then
					vehgod = true
					DM.ShowNotification('Vehicle Info : ~g~On')
				elseif vehgod == true then
					vehgod = false
					DM.ShowNotification('Vehicle Info : ~r~Off')
				end
			end
		end, function(data, menu)
			menu.close()
			OpenAdminMenu()
		end)
end
OpenObjectMenu = function()
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Object', {
		title = _U('sp_obj'),
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		SpawnObject(dm)
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end
SpawnObject = function(object)
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local forward   = GetEntityForwardVector(playerPed)
	local x, y, z   = table.unpack(coords + forward * 1.0)
	DM.Game.SpawnObject(object, {
		x = x,
		y = y,
		z = z
	}, function(obj)
		SetEntityHeading(obj, GetEntityHeading(playerPed))
		PlaceObjectOnGroundProperly(obj)
	end)
end
OpenStartMenu = function()
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Admin_Menu', {
		title = _U('st_res'),
		align = 'top-left'
	}, function(data, menu)
		local dm = data.value
		TriggerServerEvent('resource:mng:admenu', 'start', dm)
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end
OpenStopMenu = function()
	DM.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Admin_Menu', {
		title = _U('rs_res'),
		align = 'top-left',
		elements = elements
	}, function(data, menu)
		local dm = data.value
		if dm == GetCurrentResourceName() then
			Citizen.Trace('~w~Not Perm To Stop Current Resouece')
		else
			TriggerServerEvent('resource:mng:admenu', 'stop', dm)
		end
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

--[[RegisterCommand('jo', function(source, args, user)
	local rs = LoadResourceFile(GetCurrentResourceName(), "var.json")
	local js = json.encode(rs)
	if js then
		print('jon')
	end
end)--]]
