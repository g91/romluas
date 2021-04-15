function copy(orig)
	local result
	if type(orig) == "table" then
		result = {}
		for orig_key, orig_value in pairs(orig) do
			result[orig_key] = copy(orig_value)
		end
		setmetatable(result, getmetatable(orig))
	else result = orig end
	return result
end

function addy_add_buf(buff_id)
	this():addBuff(buff_id)
end

function get_random_table(_table, _amount)
	if type(_table) ~= "table" or type(_amount) ~= "number" then
		return {}
	end
	local result = {}
	local random_index = {}
	if _amount > #_table then _amount = #_table end
	for index, value in ipairs(_table) do
		table.insert(random_index, index)
	end
	for index = 1, _amount do
		table.insert(result, _table[table.remove(random_index, RandRange(1, #random_index))])
	end
	return result
end

function table.random(_table, _amount)
	return get_random_table(_table, _amount)
end

function thisPlayer()
	return Christine.Player:new(OwnerID())
end

function thisNpc()
	return Christine.Npc:new(OwnerID())
end

function this()
	local this = Christine.Role:new(OwnerID())
	if this.is_player then
		return thisPlayer()
	elseif this.is_npc then
		return thisNpc()
	else
		return this
	end
end

function that(guid)
	local target = Christine.Role:new(guid or TargetID())
	if target.is_player then
		return Christine.Player:new(guid or TargetID())
	elseif target.is_npc then
		return Christine.Npc:new(guid or TargetID())
	else
		return target
	end
end

function cleanAllDebuff()
	for buff_id, buff in pairs(this().buff) do
		if not buff.is_positive then buff:remove(false) end
	end
end

function removeAllNPC()
	local s = Christine.System:new("Remove All NPC", false, true)
	local count = SetSearchAllNPC(this().room_id)
	s:debug("count : " .. count)
	for i = 0, count - 1 do
		Christine.Npc:new(GetSearchResult()):delete()
	end
end