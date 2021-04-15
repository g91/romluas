-- game
-- create_object(object_id, x, y, z, direction) 將物件創造出來
function create_object(object_id, x, y, z, direction, mode, room)
--	DebugMsg(OwnerID(), 0, "function create_object(" .. object_id .. "," .. x .. "," .. y .. "," .. z .. "," .. direction .. ")")

	local mode = mode or {}
	local room = room or 0

	local object_guid = CreateObj(object_id, x, y, z, direction, 1)

	if mode then
		for index = 1, #mode, 2 do
			SetModeEx(object_guid, mode[index], mode[index + 1])
		end
	end

	AddToPartition(object_guid, room)

	return object_guid
end

function set_position_to_flag(guid, flag_group, flag_id, x, y, z, direction)
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if z == nil then z = 0 end
	if direction == nil then direction = 0 end

	SetPos(
		guid,
		GetMoveFlagValue(flag_group, flag_id, EM_RoleValue_X) + x,
		GetMoveFlagValue(flag_group, flag_id, EM_RoleValue_Y) + y,
		GetMoveFlagValue(flag_group, flag_id, EM_RoleValue_Z) + z,
		GetMoveFlagValue(flag_group, flag_id, EM_RoleValue_Dir) + direction
	)
end

function Lua_624152()
	CloseSpeak(OwnerID())
end

-- multiplayer 最多10人

--party
function get_player_from_party(player)
	local result = {}
	local number_of_people = GetPartyID(player, -1)

	for index = 1, number_of_people do
		result[index] = GetPartyID(player, index)
	end

	return result
end

-- table handler
function table.inserttable(table1, table2)
	for k, v in pairs(table2) do
		if type(k) == "number" then
			table.insert(table1, v)
		else
			table1[k] = v
		end
	end
end

--function get_random_table(table, _amount) -- 傳入table，隨機不排序取出value組成新table傳回。 #RandRange( Int Min, Int Max )
--	local _result = {}
--	local _result_table = {}
--	while #_result < _amount do
--		_random_int = RandRange(1, #table)
--
--		for index, value in pairs(_result) do
--			if _random_int == value then
--				_random_int = nil
--			end
--		end
--		if _random_int ~= nil then
----			DebugMsg(OwnerID(), 0, "function >> type(table.insert) >> " .. type(table.insert))
----			table.insert(_result, _random_int)
--			_result[#_result + 1] = _random_int
--		end
--	end
--
--	for index, value in pairs(_result) do
----		table.insert(_result_table, table[value])
--		_result_table[index] = table[value]
--	end
--
--	return _result_table
--end

function table.print(table)
	local _result = ""
	for key, value in pairs(table) do
		if type(key) == "string" then
			_result = _result .. key .. "="
		end
		if type(value) == "table" then
--			_result = _result .. table.print(value) .. " , "
			_result = _result .. "{...} , "
		else
			_result = _result .. tostring(value) .. " , "
		end
	end
	return string.sub(_result, 1, #_result - 3)
end

function cast_spell(skill)
	CastSpell(OwnerID(), TargetID(), skill)
end

--

function Lua_get_integer(_number)
	local dot = string.find(tostring(_number), "%.") or #tostring(_number) + 1
	return tonumber(string.sub(tostring(_number), 1, dot - 1))
end

--