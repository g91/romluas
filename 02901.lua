function AddyRole_initialize()
	-------------------------------------------------------------
	--	Role
	-------------------------------------------------------------
	AddyProperty = {
		hp = EM_RoleValue_HP,
		mp = EM_RoleValue_MP,
		max_hp = EM_RoleValue_MaxHP,
		race = EM_RoleValue_RACE,
		voc = EM_RoleValue_VOC,
		sex = EM_RoleValue_SEX,
		exp = EM_RoleValue_EXP,
		lv = EM_RoleValue_LV,
		x = EM_RoleValue_X,
		y = EM_RoleValue_Y,
		z = EM_RoleValue_Z,
		direction = EM_RoleValue_Dir,
		str = EM_RoleValue_STR,
		sta = EM_RoleValue_STA,
		int = EM_RoleValue_INT,
		mnd = EM_RoleValue_MND,
		agi = EM_RoleValue_AGI,
		point = EM_RoleValue_Point,
		skill_point = EM_RoleValue_SkillPoint,
		sp = EM_RoleValue_SP,
		sub_sp = EM_RoleValue_SP_Sub,
		sub_voc = EM_RoleValue_VOC_SUB,
		sub_lv = EM_RoleValue_LV_SUB,
		this_lv_exp = EM_RoleValue_ThisLVExp,
		live_time = EM_RoleValue_LiveTime,
		body_count = EM_RoleValue_BodyCount,
		bank_count = EM_RoleValue_BankCount,
		room_id = EM_RoleValue_RoomID,
		tp_exp = EM_RoleValue_TpExp,
		money = EM_RoleValue_Money,
		account_money = EM_RoleValue_Money_Account,
		kill_rate = EM_RoleValue_KillRate,
		stomach_point = EM_RoleValue_StomachPoint,
		system_flag = EM_RoleValue_SysFlag,
		add_exp = EM_RoleValue_AddExp,
		add_tp = EM_RoleValue_AddTP,
		play_time_quota = EM_RoleValue_PlayTimeQuota,
		good_evil = EM_RoleValue_GoodEvil,
		voc_count = EM_RoleValue_VocCount,
		box_energy = EM_RoleValue_BoxEnergy,
		medal_count = EM_RoleValue_MedalCount,
		bonus_money = EM_RoleValue_BonusMoney,
		max_lv = EM_RoleValue_MaxLv,
		debt_exp = EM_RoleValue_DebtExp,
		debt_tp = EM_RoleValue_DebtTP,
		honor = EM_RoleValue_Honor,
		max_plant_count = EM_RoleValue_MaxPlantCount,
		attack_delay = EM_RoleValue_AttackDelay,
		total_tp_exp = EM_RoleValue_TotalTpExp,
		vip_flag = EM_RoleValue_VIP_Flag,
		famous = EM_RoleValue_Famous,
		register1 = EM_RoleValue_Register1,
		register2 = EM_RoleValue_Register2,
		register3 = EM_RoleValue_Register3,
		register4 = EM_RoleValue_Register4,
		register5 = EM_RoleValue_Register5,
		register6 = EM_RoleValue_Register6,
		register7 = EM_RoleValue_Register7,
		register8 = EM_RoleValue_Register8,
		register9 = EM_RoleValue_Register9,
		register10 = EM_RoleValue_Register10,
		is_npc = EM_RoleValue_IsNPC,
		is_player = EM_RoleValue_IsPlayer,
		ORGID  = EM_RoleValue_OrgID,
		attack_target_GUID = EM_RoleValue_AttackTargetID,
		pid = EM_RoleValue_PID,
		is_walk = EM_RoleValue_IsWalk,
		max_hit = EM_RoleValue_MaxHit,
		DBID = EM_RoleValue_DBID,
		is_dead = EM_RoleValue_IsDead,
		group_id = EM_RoleValue_GroupID,
		guild_id = EM_RoleValue_GuildID,
		zone_id = EM_RoleValue_ZoneID,
		house_dbid = EM_RoleValue_HouseDBID,
		pet_id = EM_RoleValue_PetID,
		is_attack_mode = EM_RoleValue_IsAttackMode,
		is_unholster = EM_RoleValue_IsUnholster,
		spell_magic_ORGID = EM_RoleValue_SpellMagicID,
		camp_id = EM_RoleValue_CampID,
		owner_DBID = EM_RoleValue_OwnerDBID,
		owner_GUID = EM_RoleValue_OwnerGUID,
		dodge = EM_RoleValue_DodgeState,
		be_dodge = EM_RoleValue_BeDodgeState,
		miss = EM_RoleValue_MissState,
		parry = EM_RoleValue_ParryState,
		be_parry = EM_RoleValue_BeParryState,
		critial = EM_RoleValue_CritialState,
		be_critial = EM_RoleValue_BeCritialState,
		magic_critial = EM_RoleValue_MagicCritialState,
		be_magic_critial = EM_RoleValue_BeMagicCritialState,
		shield_block = EM_RoleValue_ShieldBlockState,
		be_shield_block = EM_RoleValue_BeShieldBlockState,
		last_change_amount_of_hp = EM_RoleValue_LastDHp,
		last_changer_of_hp = EM_RoleValue_LastDHpTarget
	}
	AddyTranslateProperty = {
		is_stop_bgm = EM_LuaValueFlag_IsStopBGM
	}
	AddyMode = {
		show = EM_SetModeType_Show,
		mark = EM_SetModeType_Mark,
		obstruct = EM_SetModeType_Obstruct,
		gravity = EM_SetModeType_Gravity,
		save = EM_SetModeType_Save,
		drag = EM_SetModeType_Drag,
		hide = EM_SetModeType_GMHide,
		is_all_zone_visible = EM_SetModeType_IsAllZoneVisible,
		disable_rotate = EM_SetModeType_DisableRotate,
		strike_back = EM_SetModeType_Strikback,
		movable = EM_SetModeType_Move,
		search_enemy = EM_SetModeType_Searchenemy,
		revive = EM_SetModeType_Revive,
		fight = EM_SetModeType_Fight,
		escape = EM_SetModeType_Escape,
		enemy_ignore = EM_SetModeType_SearchenemyIgnore,
		align_to_ground = EM_SetModeType_AlignToSurface,
		hide_name = EM_SetModeType_HideName,
		hide_from_mini_map = EM_SetModeType_HideMinimap,
		show_role_head = EM_SetModeType_ShowRoleHead,
		collision_plot = EM_SetModeType_CollisionPlot,
		treasure = EM_SetModeType_Treasure,
		ignore_npc_kill = EM_SetModeType_IgnoreNpcKill,
		hide_hp_mp = EM_SetModeType_NotShowHPMP,
		disable_action = EM_SetModeType_DisableAction
	}
	-------------------------------------------------------------
	AddyRoleEvent = AddyEvent:new()
	AddyRoleEvent.class = "RoleEvent"
	AddyRoleEvent.Create = "AddyRoleEvent_Create"
	AddyRoleEvent.Delete = "AddyRoleEvent_Delete"
	AddyRoleEvent.AddToPartition = "AddyRoleEvent_AddToPartition"
	AddyRoleEvent.DelFromPartition = "AddyRoleEvent_DelFromPartition"
	AddyRoleEvent.ChangeCamp = "AddyRoleEvent_ChangeCamp"
	AddyRoleEvent.Die = "AddyRoleEvent_Die"
	-------------------------------------------------------------
	AddyRole = AddyEventDispatcher:new()
	AddyRole.class = "Role"
	function AddyRole:new(_guid)
		local _inheritor =  {}
		if _guid then _inheritor.GUID = _guid end
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			if AddyProperty[_key] then
				return ReadRoleValue(_object.GUID, AddyProperty[_key])
			elseif AddyMode[_key] then
				return GetModeEx(_object.GUID, AddyMode[_key])
			elseif AddyTranslateProperty[_key] then
				return ReadRoleValue(_object.GUID, AddyTranslateProperty[_key]) == 1
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
			if AddyProperty[_key] then
				if _key == "camp_id" then
					SetRoleCampID(_object.GUID, _value)
					_object:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.ChangeCamp))
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
	-- ///特殊指令
	function AddyRole:beginPlot(_function_name, _delay)
		local _delay = _delay or 0
		if type(_delay) ~= "number" then
			DebugMsg(0, 0, "[ERROR] type error. AddyRole:beginPlot( _function_name:string, _delay:number )")
			return
		end
		BeginPlot(self.GUID, _function_name, _delay)
	end
	-- ///劇情表演
	function AddyRole:say(_string, _range)
		if type(_range) == "number" then
			Yell(self.GUID, tostring(_string), _range)
		else
			Say(self.GUID, tostring(_string))
		end
	end
	function AddyRole:tell(_target, _string)
		local _target = _target
		if type(_target) == "table" then _target = _target.GUID end
		Tell(self.GUID, _target, tostring(_string))
	end
	function AddyRole:adjustDirection(...)
		local _arguments_length = select("#", ...)
		if _arguments_length == 1 then
			-- AddyRole:adjustDirection(_angle)
			AdjustDir(self.GUID, select(1, ...))
		elseif _arguments_length == 2 then
			-- AddyRole:adjustDirection(_target, _angle)
			local _target = select(1, ...)
			if type(_target) == "table" then _target = _target.GUID end
			AdjustFaceDir(self.GUID, _target, select(2, ...))
		else
			DebugMsg(0, 0, "[ERROR] arguments error. AddyRole:adjustDirection( _angle:number ) or adjustDirection( _target:Role or GUID, _angle:number )")
			return
		end
	end
	function AddyRole:faceTo(_target)
		if not _target.isInheritorOf and _target:isInheritorOf("Role") then
			DebugMsg(0, 0, "[ERROR] argument error. AddyRole:faceTo( _target:role )")
			return
		end
		AdjustFaceDir(self.GUID, _target.GUID, 0)
		
	end
	function AddyRole:playMotion(_motion_id)
		if type(_motion_id) ~= "number" then
			DebugMsg(0, 0, "[ERROR] type error. AddyRole:playerMotion( _motion_id:number )")
			return
		end
		PlayMotion(self.GUID, _motion_id)
	end
	-- ///訊息
	function AddyRole:scriptMessage(_target, _string, _type, _color)
		local _type = _type or 0
		local _color = _color or 0
		if type(_target) ~= "table" and type(_target) ~= "number" or type(_string) ~= "string" then
			DebugMsg(0, 0, "[ERROR] type error. AddyRole:scriptMessage( _target:Role or GUID, _content:string[, _type:number, _color:number] )")
			return
		end
		if type(_target) == "table" then _target = _target.GUID end
		ScriptMessage(self.GUID, _target, _type, tostring(_string), _color)
	end
	-- ///物件移動
	function AddyRole:setPosition(_x, _y, _z, _direction)
		local _x = _x or 0
		local _y = _y or 0
		local _z = _z or 0
		local _direction = _direction or 0
		if type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" or type(_direction) ~= "number" then
			DebugMsg(0, 0, "[ERROR] type error. AddyRole:setPosition( _x:number, _y:number, _z:number, _direction:number ")
			return
		end
		SetPos(self.GUID, _x, _y, _z, _direction)
	end
	function AddyRole:changeZone(_zone_id, _room_id, _x, _y, _z, _direction)
		local _room_id = _room_id or 0
		local _x = _x or 0
		local _y = _y or 0
		local _z = _z or 0
		local _direction = _direction or 0
		if type(_zone_id) ~= "number" or type(_room_id) ~= "number" or type(_x) ~= "number" or type(_y) ~= "number" or type(_z) ~= "number" or type(_direction) ~= "number" then
			DebugMsg(0, 0, "[ERROR] type error. AddyRole:changeZone( _zone_id:number, _room_id:number, _x:number, _y:number, _z:number, _direction:number )")
			return
		end
		ChangeZone(self.GUID, _zone_id, _room_id, _x, _y, _z, _direction)
	end
	-- ///物件處理
	function AddyRole:addToPartition(_room_id)
		local _room_id = _room_id or 0
		if type(_room_id) ~= "number" then
			DebugMsg(0, 0, "[ERROR] type error. AddyRole:addToPartition(  _room_id:number )")
			return
		end
		AddToPartition(self.GUID, _room_id)
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.AddToPartition))
	end
	function AddyRole:delFromPartition()
		DelFromPartition(self.GUID)
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.DelFromPartition))
	end
--	function AddyRole:show(_room_id)
--		local _room_id = _room_id or 0
--		if type(_room_id) ~= "number" then
--			DebugMsg(0, 0, "[ERROR] type error. AddyRole:addToPartition(  _room_id:number )")
--			return
--		end
--		Show(self.GUID, _room_id)
--	end
--	function AddyRole:hide()
--		Hide(self.GUID)
--	end
	-- ///法術相關
	function AddyRole:addBuff(_buff_orgid, _lv, _time)
		local _lv = _lv or 0
		local _time = _time or -1
		AddBuff(self.GUID, _buff_orgid, _lv, _time)
	end
	function AddyRole:cancelBuff(_buff_id, _dispatch_event)
		local _dispatch_event = _dispatch_event
		if _dispatch_event == nil then _dispatch_event = true end
		if _dispatch_event then
			CancelBuff(self.GUID, _buff_id)
		else
			CancelBuff_NoEvent(self.GUID, _buff_id)
		end
	end
	function AddyRole:castSpell(...)
		local _arguments_length = select("#", ...)
		if _arguments_length < 4 then
			-- AddyRole:castSpell(_target, _magic_id)
			local _target = select(1, ...)
			if type(_target) == "table" then _target = _target.GUID end
			local _lv = select(3, ...) or 1
			CastSpellLV(self.GUID, _target, select(2, ...), _lv)
		elseif _arguments_length >= 4 and _arguments_length <= 5 then
			-- AddyRole:castSpell(_x, _y, _z, _magic_id, _lv = 1)
			local _lv = select(5, ...) or 1
			CastSpellPos(self.GUID, select(1, ...), select(2, ...), select(3, ...), select(4, ...), _lv)
		else
			DebugMsg(0, 0, "[ERROR] arguments error. AddyRole:castSpell(_target:Role or GUID, _magic_id:number) or castSpell(_x:number, _y:number, _z:number, _magic_id:number, _lv:number)")
		end
	end
	function AddyRole:systemCastSpell(...)
		local _arguments_length = select("#", ...)
		if _arguments_length >= 2 and _arguments_length <= 3 then
			-- AddyRole:systemCastSpell(_target, _magic_id, _lv)
			local _lv = select(3, ...) or 1
			local _target = select(1, ...)
			if type(_target) == "table" then _target = _target.GUID end
			SysCastSpellLv(self.GUID, _target, select(2, ...), _lv)
		elseif _arguments_length >= 4 and _arguments_length <= 5 then
			-- AddyRole:systemCastSpell(_x, _y, _z, _magic_id, _lv = 1)
			local _lv = select(5, ...) or 1
			SysCastSpellLv_Pos(self.GUID, select(1, ...), select(2, ...), select(3, ...), select(4, ...), _lv)
		else
			DebugMsg(0, 0, "[ERROR] arguments error. AddyRole:systemCastSpell(_target, _magic_id, _lv)  or  AddyRole:systemCastSpell(_x, _y, _z, _magic_id, _lv = 1)")
		end
	end
	function AddyRole:interruptMagic()
		MagicInterrupt(self.GUID)
	end
	--
	function AddyRole:setCampId(_camp_id)
		SetRoleCampID(self.GUID, _camp_id)
		self:dispatchEvent(AddyRoleEvent:new(AddyRoleEvent.ChangeCamp))
	end
	--
	function AddyRole:distanceTo(_target)
		if not _target or not _target.isInheritorOf or not _target:isInheritorOf("Role") then
			DebugMsg(0, 0, "[ERROR] arguments type error. AddyRole:distanceTo( _target:AddyRole )")
			return
		end
		return GetDistance(self.GUID, _target.GUID)
	end
	--
	function AddyRole:setPlot(_type, _callback, _range)
		if _type ~= "touch" and _type ~= "range" and _type ~= "dead" and _type ~= "collision"then
			DebugMsg(0, 0, "[ERROR] arguments error. first argument is [type] : touch, range, dead or collision")
		end
		local _range = _range or 0
		SetPlot(self.GUID, _type, _callback, _range)
	end
	--
	function AddyRole:setCursorType(_type)
		SetCursorType(self.GUID, _type or 0)
	end
	--
	 function AddyRole:setIdleMotion(_type)
		SetIdleMotion(self.GUID, _type or 0)
	end
	function AddyRole:alert(_target, _string)
		ScriptMessage(self.GUID, _target.GUID, 1, _string, 0)
	end
	function AddyRole:message(_target, _string, _color)
		if type(_target) == "number" then ScriptMessage(self.GUID, _target, 2, _string, _color or 0)
		else ScriptMessage(self.GUID, _target.GUID, 2, _string, _color or 0) end
	end
	function AddyRole:lockhp(_hp, _function_name)
		LockHP(self.GUID, _hp, _function_name)
	end
	function AddyRole:unlockhp()
		LockHP(self.GUID, 0, "")
	end
	function AddyRole:kill(target)
		KillID(self.GUID, target.GUID)
	end

	DebugLog(2, "[ROM Class] AddyRole initialized")
end