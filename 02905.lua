function AddyFighter_initialize()
	-------------------------------------------------------------
	--	Fighter
	-------------------------------------------------------------
	AddyFighterProperty = {
		hate_list = function(object)
			local lenght = HateListCount(object.GUID)
			local hate_list = {}
			for index = 1, lenght do
				local _guid = HateListInfo(object.GUID, index - 1, EM_HateListInfoType_GItemID)
				if ReadRoleValue(_guid, EM_RoleValue_IsPlayer) == 1 then
					hate_list[index] = AddyPlayer:new(_guid)
					hate_list[index].hate_point = HateListInfo(object.GUID, index - 1, EM_HateListInfoType_HatePoint)
					hate_list[index].hit_point = HateListInfo(object.GUID, index - 1, EM_HateListInfoType_HitPoint)
				elseif ReadRoleValue(_guid, EM_RoleValue_IsNPC) == 1 then
					hate_list[index] = AddyFighter:new(_guid)
					hate_list[index].hate_point = HateListInfo(object.GUID, index - 1, EM_HateListInfoType_HatePoint)
					hate_list[index].hit_point = HateListInfo(object.GUID, index - 1, EM_HateListInfoType_HitPoint)
				end
			end
			return hate_list
		end
	}
	-------------------------------------------------------------
	AddyFighter = AddyNpc:new()
	AddyFighter.class = "Fighter"
	function AddyFighter:new(_guid)
		local _inheritor = {}
		if _guid then _inheritor.GUID = _guid end
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			if AddyFighterProperty[_key] then
				return AddyFighterProperty[_key](_object)
			elseif AddyProperty[_key] then
				return ReadRoleValue(_object.GUID, AddyProperty[_key])
			elseif AddyMode[_key] then
				return GetModeEx(_object.GUID, AddyMode[_key])
			elseif _key == "patrol" or _key == "disable_quest" then
				DebugMsg(0, 0, "[ERROR] variable namespace error. " .. _key .. " is a key name of Mode.")
				return
			elseif _key == "buff" then
				local _buff = {}
				local _count = BuffCount(_object.GUID)
				for index = 0, _count - 1 do
					_buff[BuffInfo(_object.GUID, index, EM_BuffInfoType_BuffID)] = AddyBuff:new(_object.GUID, index)
				end
				return _buff
			else
				return self[_key]
			end
		end
		self.__newindex = function(_object, _key, _value)
			if AddyFighterProperty[_key] then
				DebugMsg(0, 0, "[ERROR] variable namespace error. " .. _key .. " is a key name of FighterProperty.")
			elseif AddyProperty[_key] then
				if _key == "camp_id" then
					SetRoleCampID(_object.GUID, _value)
					self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.ChangeCamp))
				end
				WriteRoleValue(_object.GUID, AddyProperty[_key], _value)
				return
			elseif AddyMode[_key] then
				SetModeEx(_object.GUID, AddyMode[_key], _value)
				return
			elseif _key == "buff" then
				DebugMsg(0, 0, "[ERROR] variable namespace error. " .. _key .. " is a key name of RoleProperty.")
				return
			elseif _key == "patrol" then
				MoveToFlagEnabled(_object.GUID, _value)
				return
			elseif _key == "disable_quest" then
				DisableQuest(_object.GUID, _value)
			else
				rawset(_object, _key, _value)
				return
			end
		end
		return _inheritor
	end
	function AddyFighter:clearHateList(_target)
		local _target = _target or -1
		if type(_target) == "table" then _target = _target.GUID end
		ClearHateList(self.GUID, _target)
	end
	function AddyFighter:hate(_target)
		if not _target then return end
		_target:systemCastSpell(self, 495751)
	end

	DebugLog(2, "[ROM Class] AddyFighter initialized")
end