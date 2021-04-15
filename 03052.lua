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
	--	死亡不消失 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 9) end,
	--	下線算時間 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 10) end,
	--	攻擊增加時間 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 11) end,
	--	擊殺增加時間 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 12) end,
	--	不同施法者不蓋蓋 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 13) end,
	--	變身顯示原本裝備 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 14) end,
	--	顯示power lv = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 15) end,
	--	dot不殺死目標 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 16) end,
	--	最高等級為角色等級 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 17) end,
	--	client不顯示加減hp資訊 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 18) end,
	--	dot不計算攻防數值 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 19) end,
	--	騎乘-攻擊不下馬 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 20) end,
	--	騎乘-寵物做攻擊動作 = function(_object) return CheckBit(GameObjInfo_Int(BuffInfo(_object.owner.GUID, _object.index, EM_BuffInfoType_BuffID),"SettingFlag"), 21) end
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