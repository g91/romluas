function ChristineRoleHandler_initialize()
	Christine.role_get = {
		hp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_HP) end,
		mp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_MP) end,
		max_hp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_MaxHP) end,
		race = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_RACE) end,
		voc = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_VOC) end,
		sex = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_SEX) end,
		exp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_EXP) end,
		lv = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_LV) end,
		x = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_X) end,
		y = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Y) end,
		z = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Z) end,
		direction = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Dir) end,
		str = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_STR) end,
		sta = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_STA) end,
		int = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_INT) end,
		mnd = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_MND) end,
		agi = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_AGI) end,
		point = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Point) end,
		skill_point = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_SkillPoint) end,
		sp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_SP) end,
		sub_sp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_SP_Sub) end,
		sub_voc = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_VOC_SUB) end,
		sub_lv = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_LV_SUB) end,
		this_lv_exp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_ThisLVExp) end,
		live_time = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_LiveTime) end,
		body_count = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_BodyCount) end,
		bank_count = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_BankCount) end,
		room_id = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_RoomID) end,
		tp_exp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_TpExp) end,
		money = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Money) end,
		account_money = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Money_Account) end,
		kill_rate = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_KillRate) end,
		stomach_point = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_StomachPoint) end,
		system_flag = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_SysFlag) end,
		add_exp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_AddExp) end,
		add_tp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_AddTP) end,
		play_time_quota = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_PlayTimeQuota) end,
		good_evil = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_GoodEvil) end,
		voc_count = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_VocCount) end,
		box_energy = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_BoxEnergy) end,
		medal_count = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_MedalCount) end,
		bonus_money = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_BonusMoney) end,
		max_lv = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_MaxLv) end,
		debt_exp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_DebtExp) end,
		debt_tp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_DebtTP) end,
		honor = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Honor) end,
		max_plant_count = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_MaxPlantCount) end,
		attack_delay = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_AttackDelay) end,
		total_tp_exp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_TotalTpExp) end,
		vip_flag = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_VIP_Flag) end,
		famous = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Famous) end,
		register1 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register1) end,
		register2 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register2) end,
		register3 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register3) end,
		register4 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register4) end,
		register5 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register5) end,
		register6 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register6) end,
		register7 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register7) end,
		register8 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register8) end,
		register9 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register9) end,
		register10 = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_Register10) end,
		is_npc = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_IsNPC) == 1 end,
		is_player = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_IsPlayer) == 1 end,
		ORGID  = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_OrgID) end,
		attack_target_GUID = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_AttackTargetID) end,
		pid = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_PID) end,
		is_walk = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_IsWalk) == 1 end,
		max_hit = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_MaxHit) end,
		DBID = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_DBID) end,
		is_dead = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_IsDead) == 1 end,
		group_id = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_GroupID) end,
		guild_id = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_GuildID) end,
		zone_id = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_ZoneID) end,
		house_dbid = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_HouseDBID) end,
		pet_id = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_PetID) end,
		is_attack_mode = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_IsAttackMode) == 1 end,
		is_unholster = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_IsUnholster) == 1 end,
		spell_magic_ORGID = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_SpellMagicID) end,
		camp_id = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_CampID) end,
		owner_DBID = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_OwnerDBID) end,
		owner_GUID = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_OwnerGUID) end,
		dodge = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_DodgeState) end,
		be_dodge = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_BeDodgeState) end,
		miss = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_MissState) end,
		parry = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_ParryState) end,
		be_parry = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_BeParryState) end,
		critial = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_CritialState) end,
		be_critial = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_BeCritialState) end,
		magic_critial = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_MagicCritialState) end,
		be_magic_critial = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_BeMagicCritialState) end,
		shield_block = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_ShieldBlockState) end,
		be_shield_block = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_BeShieldBlockState) end,
		last_change_amount_of_hp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_LastDHp) end,
		last_changer_of_hp = function(_object) return ReadRoleValue(_object.GUID, EM_RoleValue_LastDHpTarget) end,
		is_stop_bgm = function(_object) return ReadRoleValue(_object.GUID, EM_LuaValueFlag_IsStopBGM) == 1 end,
		is_legal = function(_object) return CheckID(_object.GUID) end,
	
		show = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Show) end,
		mark = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Mark) end,
		obstruct = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Obstruct) end,
		gravity = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Gravity) end,
		save = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Save) end,
		drag = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Drag) end,
		gm_hide = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_GMHide) end,
		is_all_zone_visible = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_IsAllZoneVisible) end,
		disable_rotate = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_DisableRotate) end,
		strike_back = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Strikback) end,
		movable = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Move) end,
		search_enemy = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Searchenemy) end,
		revive = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Revive) end,
		fight = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Fight) end,
		escape = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Escape) end,
		enemy_ignore = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_SearchenemyIgnore) end,
		align_to_ground = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_AlignToSurface) end,
		hide_name = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_HideName) end,
		hide_from_mini_map = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_HideMinimap) end,
		show_role_head = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_ShowRoleHead) end,
		collision_plot = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_CollisionPlot) end,
		treasure = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_Treasure) end,
		ignore_npc_kill = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_IgnoreNpcKill) end,
		hide_hp_mp = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_NotShowHPMP) end,
		disable_action = function(_object) return GetModeEx(_object.GUID, EM_SetModeType_DisableAction) end,

		patrol = function(_object) _object:error(2, "property patrol is write only") return false end,
		disable_quest = function(_object) _object:error(2, "property disable_quest is write only") return false end,

		buff = function(_object)
			local _buff = {}
			for index = 0, BuffCount(_object.GUID) - 1 do
				_buff[BuffInfo(_object.GUID, index, EM_BuffInfoType_BuffID)] = Christine.Buff:new(_object, index)
			end
			return _buff
		end,

		hate_list = function(_object)
			local hate_list = {}
			for index = 1, HateListCount(_object.GUID) do
				local _role = Christine.Role:new(HateListInfo(_object.GUID, index - 1, EM_HateListInfoType_GItemID))
				if _role.is_player then
					hate_list[index] = Christine.Player:new(_role.GUID)
				elseif _role.is_npc then
					hate_list[index] = Christine.Npc:new(_role.GUID)
				else
					hate_list[index] = _role
				end
				hate_list[index].hate_point = HateListInfo(_object.GUID, index - 1, EM_HateListInfoType_HatePoint)
				hate_list[index].hit_point = HateListInfo(_object.GUID, index - 1, EM_HateListInfoType_HitPoint)
			end
			return hate_list
		end
	}
	Christine.role_set = {
		hp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_HP, _value) end,
		mp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_MP, _value) end,
		max_hp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_MaxHP, _value) end,
		race = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_RACE, _value) end,
		voc = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_VOC, _value) end,
		sex = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_SEX, _value) end,
		exp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_EXP, _value) end,
		lv = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_LV, _value) end,
		x = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_X, _value) end,
		y = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Y, _value) end,
		z = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Z, _value) end,
		direction = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Dir, _value) end,
		str = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_STR, _value) end,
		sta = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_STA, _value) end,
		int = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_INT, _value) end,
		mnd = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_MND, _value) end,
		agi = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_AGI, _value) end,
		point = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Point, _value) end,
		skill_point = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_SkillPoint, _value) end,
		sp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_SP, _value) end,
		sub_sp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_SP_Sub, _value) end,
		sub_voc = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_VOC_SUB, _value) end,
		sub_lv = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_LV_SUB, _value) end,
		this_lv_exp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_ThisLVExp, _value) end,
		live_time = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_LiveTime, _value) end,
		body_count = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_BodyCount, _value) end,
		bank_count = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_BankCount, _value) end,
		room_id = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_RoomID, _value) end,
		tp_exp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_TpExp, _value) end,
		money = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Money, _value) end,
		account_money = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Money_Account, _value) end,
		kill_rate = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_KillRate, _value) end,
		stomach_point = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_StomachPoint, _value) end,
		system_flag = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_SysFlag, _value) end,
		add_exp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_AddExp, _value) end,
		add_tp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_AddTP, _value) end,
		play_time_quota = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_PlayTimeQuota, _value) end,
		good_evil = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_GoodEvil, _value) end,
		voc_count = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_VocCount, _value) end,
		box_energy = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_BoxEnergy, _value) end,
		medal_count = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_MedalCount, _value) end,
		bonus_money = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_BonusMoney, _value) end,
		max_lv = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_MaxLv, _value) end,
		debt_exp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_DebtExp, _value) end,
		debt_tp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_DebtTP, _value) end,
		honor = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Honor, _value) end,
		max_plant_count = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_MaxPlantCount, _value) end,
		attack_delay = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_AttackDelay, _value) end,
		total_tp_exp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_TotalTpExp, _value) end,
		vip_flag = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_VIP_Flag, _value) end,
		famous = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Famous, _value) end,
		register1 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register1, _value) end,
		register2 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register2, _value) end,
		register3 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register3, _value) end,
		register4 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register4, _value) end,
		register5 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register5, _value) end,
		register6 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register6, _value) end,
		register7 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register7, _value) end,
		register8 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register8, _value) end,
		register9 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register9, _value) end,
		register10 = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_Register10, _value) end,
		is_npc = function(_object, _value) 
			if _value then WriteRoleValue(_object.GUID, EM_RoleValue_IsNPC, 1)
			else WriteRoleValue(_object.GUID, EM_RoleValue_IsNPC, 0) end
		end,
		is_player = function(_object, _value) 
			if _value then WriteRoleValue(_object.GUID, EM_RoleValue_IsPlayer, 1)
			else WriteRoleValue(_object.GUID, EM_RoleValue_IsPlayer, 0) end
		end,
		ORGID  = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_OrgID, _value) end,
		attack_target_GUID = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_AttackTargetID, _value) end,
		pid = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_PID, _value) end,
		is_walk = function(_object, _value)
			if _value then WriteRoleValue(_object.GUID, EM_RoleValue_IsWalk, 1)
			else WriteRoleValue(_object.GUID, EM_RoleValue_IsWalk, 0) end
		end,
		max_hit = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_MaxHit, _value) end,
		DBID = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_DBID, _value) end,
		is_dead = function(_object, _value)
			if _value then WriteRoleValue(_object.GUID, EM_RoleValue_IsDead, 1)
			else WriteRoleValue(_object.GUID, EM_RoleValue_IsDead, 0) end
		end,
		group_id = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_GroupID, _value) end,
		guild_id = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_GuildID, _value) end,
		zone_id = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_ZoneID, _value) end,
		house_dbid = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_HouseDBID, _value) end,
		pet_id = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_PetID, _value) end,
		is_attack_mode = function(_object, _value)
			if _value then WriteRoleValue(_object.GUID, EM_RoleValue_IsAttackMode, 1)
			else WriteRoleValue(_object.GUID, EM_RoleValue_IsAttackMode, 0) end
		end,
		is_unholster = function(_object, _value)
			if _value then WriteRoleValue(_object.GUID, EM_RoleValue_IsUnholster, 1)
			else WriteRoleValue(_object.GUID, EM_RoleValue_IsUnholster, 0) end
		end,
		spell_magic_ORGID = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_SpellMagicID, _value) end,
		camp_id = function(_object, _value)
			SetRoleCampID(_object.GUID, _value)
			_object:dispatchEvent(Christine.RoleEvent:new(Christine.RoleEvent.CHANGE_CAMP))
		end,
		owner_DBID = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_OwnerDBID, _value) end,
		owner_GUID = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_OwnerGUID, _value) end,
		dodge = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_DodgeState, _value) end,
		be_dodge = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_BeDodgeState, _value) end,
		miss = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_MissState, _value) end,
		parry = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_ParryState, _value) end,
		be_parry = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_BeParryState, _value) end,
		critial = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_CritialState, _value) end,
		be_critial = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_BeCritialState, _value) end,
		magic_critial = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_MagicCritialState, _value) end,
		be_magic_critial = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_BeMagicCritialState, _value) end,
		shield_block = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_ShieldBlockState, _value) end,
		be_shield_block = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_BeShieldBlockState, _value) end,
		last_change_amount_of_hp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_LastDHp, _value) end,
		last_changer_of_hp = function(_object, _value)  WriteRoleValue(_object.GUID, EM_RoleValue_LastDHpTarget, _value) end,
		is_stop_bgm = function(_object, _value)
			if _value then WriteRoleValue(_object.GUID, EM_LuaValueFlag_IsStopBGM, 1)
			else WriteRoleValue(_object.GUID, EM_LuaValueFlag_IsStopBGM, 0) end
		end,
		is_legal = function(_object, _value) _object:error(2, "property is_legal is read only") end,

		show = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Show, _value) end,
		mark = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Mark, _value) end,
		obstruct = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Obstruct, _value) end,
		gravity = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Gravity, _value) end,
		save = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Save, _value) end,
		drag = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Drag, _value) end,
		gm_hide = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_GMHide, _value) end,
		is_all_zone_visible = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_IsAllZoneVisible, _value) end,
		disable_rotate = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_DisableRotate, _value) end,
		strike_back = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Strikback, _value) end,
		movable = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Move, _value) end,
		search_enemy = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Searchenemy, _value) end,
		revive = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Revive, _value) end,
		fight = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Fight, _value) end,
		escape = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Escape, _value) end,
		enemy_ignore = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_SearchenemyIgnore, _value) end,
		align_to_ground = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_AlignToSurface, _value) end,
		hide_name = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_HideName, _value) end,
		hide_from_mini_map = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_HideMinimap, _value) end,
		show_role_head = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_ShowRoleHead, _value) end,
		collision_plot = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_CollisionPlot, _value) end,
		treasure = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_Treasure, _value) end,
		ignore_npc_kill = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_IgnoreNpcKill, _value) end,
		hide_hp_mp = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_NotShowHPMP, _value) end,
		disable_action = function(_object, _value) SetModeEx(_object.GUID, EM_SetModeType_DisableAction, _value) end,

		patrol = function(_object, _value) MoveToFlagEnabled(_object.GUID, _value) end,
		disable_quest = function(_object, _value) DisableQuest(_object.GUID, _value) end,

		buff = function(_object, _value) _object:error(2, "property buff is read only") end,

		hate_list = function(_object, _value) _object:error(2, "property hate_list is read only") end
	}
end