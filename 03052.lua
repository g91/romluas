function ChristineBuff_initialize()
	Christine.buff_get = {
		caster_GUID = function(_object) return BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_OwnerID) end,
		ORGID = function(_object) return BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID) end,
		time = function(_object) return BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_Time) end,
		power = function(_object) return BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_Power) end,
		point = function(_object) return BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_Point) end,
		is_positive = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 0) end,
		is_visible = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 1) end,
		keep_casting = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 2) end,
		is_dot = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 3) end,
		transfiguration = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 4) end,
		is_cancelable = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 5) end,
		show_time = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 6) end,
		trigger_magic = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 7) end,
		magic_shield = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 8) end
	--	���`������ = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 9) end,
	--	�U�u��ɶ� = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 10) end,
	--	�����W�[�ɶ� = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 11) end,
	--	�����W�[�ɶ� = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 12) end,
	--	���P�I�k�̤��\�\ = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 13) end,
	--	�ܨ���ܭ쥻�˳� = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 14) end,
	--	���power lv = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 15) end,
	--	dot�������ؼ� = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 16) end,
	--	�̰����Ŭ����ⵥ�� = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 17) end,
	--	client����ܥ[��hp��T = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 18) end,
	--	dot���p��𨾼ƭ� = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 19) end,
	--	�M��-�������U�� = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 20) end,
	--	�M��-�d���������ʧ@ = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 21) end
	}

	Christine.Buff = Christine.Object:new()
	Christine.Buff.class = "Buff"

	function Christine.Buff:new(_owner, _index)
		local _inheritor = {}
		_inheritor.owner = _owner
		_inheritor.index = _index
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			if Christine.buff_get[_key] then
				return Christine.buff_get[_key](_object)
			else
				return self[_key]
			end
		end
		self.__newindex = function(_object, _key, _value)
			if Christine.buff_get[_key] then
				_object:error(2, "property of buff is read only") 
			else
				rawset(_object, _key, _value)
			end
		end
		return _inheritor
	end

	function Christine.Buff:remove(_dispatch_event)
		if _dispatch_event == nil then _dispatch_event = true end
		self.owner:cancelBuff(self.ORGID, _dispatch_event)
		return true
	end

	DebugLog(2, "[Christine Class] Buff initialized")
end