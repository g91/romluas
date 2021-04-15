function Cl_Z25_Boss7_NpcTable(Value)
	local Npc_Table = {}
	--------------------Boss----瘟疫球---魁儡5王--魁儡6王--死靈----幽冥綠火-無頭手衛-嗜血黑影
	Npc_Table[151] = { 106833 , 106834 , 106451 , 106541 , 106842 , 106843 , 106844 , 106845 }
	Npc_Table[152] = { 106833 , 106834 , 106451 , 106541 , 106842 , 106843 , 106844 , 106845 }
	if Value == nil then
		return Npc_Table
	elseif Value ~= nil then
		return Npc_Table[Value]
	end
end
function Cl_Z25_Boss7_SkillTable(Value,ZoneID)
	local Skill_Table = {}
	Skill_Table["5_1"] = { 0 , 8 , 499358 , 10 , "[]" }
	Skill_Table["7_1"] = { 0 , 15 , 499356 , 40 , "[]" }
	Skill_Table["9_1"] = { 0 , 9 , 499357 , 20 , "[]" }
	Skill_Table["16_1"] = { 0 , 16 , 499368 , 10 , "[]" }
	Skill_Table["20_1"] = { 0 , 20 , 499369 , 10 , "[]" }
	Skill_Table["CorruptCurse"] = { 0 , 0 , 499365 , 20 , "[]" }
	Skill_Table["EatSoulFire"] = { 0 , 0 , 499359 , 0 , "[]" }
	Skill_Table["ChackRange"] = { 0 , 0 , 499360 , 10 , "[]" }
	Skill_Table["ReBossHp"] = { 0 , 0 , 499367 , 10 , "[]" }
	if Value == nil then
		return Skill_Table
	elseif Value ~= nil then
		return Skill_Table[Value]
	end
end
function Cl_Z25_Boss7SkillPLv(Value,ZoneID)
	local Power_Lv = {}
	if ZoneID == 151 or ZoneID == 152 then   ------EX困難12 and 測試區
		Power_Lv[499360] = 0
		Power_Lv[499359] = 0
		Power_Lv[499358] = 0
		Power_Lv[499356] = 0	
		Power_Lv[499365] = 0	
		Power_Lv[499357] = 0	
		Power_Lv[499367] = 0
		Power_Lv[499368] = 0
		Power_Lv[499369] = 0
		Power_Lv[499354] = 0
	elseif ZoneID == 152 then    -----------N正常6
		Power_Lv[499360] = 0
		Power_Lv[499359] = 0
		Power_Lv[499358] = 0
		Power_Lv[499356] = 0
	elseif ZoneID == 153 then   -------------Ez簡易6
		Power_Lv[499360] = 0
		Power_Lv[499359] = 0
		Power_Lv[499358] = 0
		Power_Lv[499357] = 0
		Power_Lv[499356] = 0
	end
	if Value == nil then
		return Power_Lv
	elseif Value ~= nil then
		return Power_Lv[Value]
	end
end
function Cl_Z25_Boss7_ctarlAI()
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( ctarlAI , EM_RoleValue_ZoneID )
	local NpcOrgID = Cl_Z25_Boss7_NpcTable(ZoneID)
	local Close_door = 0
	local BossNpc = CreateObjByFlag( NpcOrgID[1] , 781137 , 0 , 1 )  ------------生出魔術帽
	SetModeEx( BossNpc , EM_SetModeType_Move, false) ---移動	(否)3
	SetModeEx( BossNpc , EM_SetModeType_Fight, false) ---可砍殺(是)7
	WriteRoleValue( BossNpc , EM_RoleValue_PID , ctarlAI )
	AddToPartition( BossNpc , RoomID )
	CallPlot( BossNpc , "cl_Z25_Boss7_FightAI" , ZoneID )
	local Door = 0
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) ~= 4 do
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 then
			if Close_door == 0 then
				Door = Cl_CreateObj_ForFlag( 106832 , 781137 , 1 , RoomID ) ----產生透明球專用
				SetModeEx ( Door , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				Close_door = 1
			end
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 2 then
			delobj ( Door )
			WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 4 )
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 3 then
			ScriptMessage( BossNpc, -1 , 2 , "[SC_106833_02]" , 2 )
			delobj ( BossNpc )
			delobj ( Door )
			Close_door = 0
			WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 0 )
			sleep ( 30 )
			BossNpc = CreateObjByFlag( NpcOrgID[1] , 781137 , 0 , 1 )  ------------生出魔術帽
			SetModeEx( BossNpc , EM_SetModeType_Move, false) ---移動	(否)3
			SetModeEx( BossNpc , EM_SetModeType_Fight, false) ---可砍殺(是)7
			WriteRoleValue( BossNpc , EM_RoleValue_PID , ctarlAI )
			AddToPartition( BossNpc , RoomID )
			CallPlot( BossNpc , "cl_Z25_Boss7_FightAI" , ZoneID )
		end
		sleep (10) 
	end
end
function cl_Z25_Boss7_FightAI(ZoneID)
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local Skill_Table = Cl_Z25_Boss7_SkillTable( nil , ZoneID )
	local Power_Lv = Cl_Z25_Boss7SkillPLv( nil , ZoneID )
	local Npc_Table = Cl_Z25_Boss7_NpcTable(ZoneID)
	local AttackTarget = 0
	local CombatBegin = 0
	local BossHp = 0
	local P2_Flag = 0
	local Player_Target = 0
	local crytime = 0 --狂暴時間
	
	LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.95 , "Cl_Z25_Boss7_LockHp" )
	SetPlot( Boss, "dead","cl_Z25_Boss7_dead", 0 ) ---塞入BOSS的戰鬥給他
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) ~= 4 do
		AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( Boss ) ~= 0 then ---
			if CombatBegin == 0 then   -----
				ScriptMessage( Boss, -1 , 2 , "[SC_106833_01]" , 2 )
				CombatBegin = 1
				if ZoneID == 151 or ZoneID == 152 then
					if ReadRoleValue ( ctarlAI , EM_RoleValue_Register2 ) ~= 1 then
						WriteRoleValue( ctarlAI , EM_RoleValue_Register2 , 1 )
					elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register2 ) == 1 then
					end
					Cl_Z25_Boss7_CreatePlagueBall( 106834 , RoomID , ctarlAI )
					SetModeEx( Boss , EM_SetModeType_Move, true) ---移動	(否)3
					SetModeEx( Boss , EM_SetModeType_Fight, true) ---可砍殺(是)7
				end
				WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 1 )
			end
			if CombatBegin == 1 then
				crytime = crytime +1
				if crytime>=400 then
					ScriptMessage( Boss, -1 , 2 ,"[SC_106833_04]" , 2 )
					Addbuff(Boss,623851,0,-1)
				end
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = skill_table[num][1] + 1
				end
				BossHp = Cl_ReadRoleNowHp( Boss )
				if BossHp <= 70 then
					if P2_Flag == 0 then
						Cl_Z25_Boss7_P2_FightAI(ZoneID)
						P2_Flag = 1
					end
				end
				Player_Target = CL_Z25_Boss7_ChackRangePlayer(30)
				if ReadRoleValue ( Boss , EM_RoleValue_Register3 )  == 1 then
					cl_chack_CastSpell()
					CastSpelllv ( Boss , Player_Target , skill_table["ChackRange"][3] , Power_Lv[skill_table["ChackRange"][3]] )
					WriteRoleValue( Boss , EM_RoleValue_Register3 , 0 )
					sleep ( 10 )
				end
				if skill_table["5_1"][1] >= skill_table["5_1"][2] then
					cl_chack_CastSpell()
					CastSpelllv ( Boss , AttackTarget , skill_table["5_1"][3] , Power_Lv[skill_table["5_1"][3]] )
					sleep ( skill_table["5_1"][4] )
					skill_table["5_1"][1] = 0
				end
				if ReadRoleValue ( Boss , EM_RoleValue_Register4 )  == 1 then
				--say(OwnerID(),"1......12")
					skill_table["7_1"][1] = skill_table["7_1"][2]
					WriteRoleValue( Boss , EM_RoleValue_Register4 , 0 )
				end
				if skill_table["7_1"][1] >= skill_table["7_1"][2] then
					--say(OwnerID(),"1......1")
					DebugMsg( 0 , 0 , "Shadow_Num="..ReadRoleValue ( Boss , EM_RoleValue_Register2 ) )
					if ReadRoleValue ( Boss , EM_RoleValue_Register2 ) <= 11 then
						cl_chack_CastSpell()
						CastSpelllv ( Boss , Boss , skill_table["7_1"][3] , Power_Lv[skill_table["7_1"][3]] )
						sleep ( skill_table["7_1"][4] )

					end
					skill_table["7_1"][1] = 0
				end
				if P2_Flag == 1 then
					if skill_table["9_1"][1] >= skill_table["9_1"][2] then
						cl_chack_CastSpell()
						CastSpelllv ( Boss , AttackTarget , skill_table["9_1"][3] , Power_Lv[skill_table["9_1"][3]] )
						sleep ( skill_table["9_1"][4] )
						skill_table["9_1"][1] = 0
					end
					if skill_table["16_1"][1] >= skill_table["16_1"][2] then
						cl_chack_CastSpell()
						local hite 
						--local hite1 = Cl_Rand_HateList( 0 , 0 ) --2013/2/22 修改，修正回傳nill會出錯
						--if hite1 == 0 or hite1 == nil then
							hite = AttackTarget
						--else
						--	hite = hite1[1]
						--end
						CastSpelllv ( Boss , hite , skill_table["16_1"][3] , Power_Lv[skill_table["16_1"][3]] )
						sleep ( skill_table["16_1"][4] )
						skill_table["16_1"][1] = 0
					end
				end
			end
		elseif HateListCount( Boss ) == 0 then ---
			if CombatBegin == 1 then
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = 0
				end
				WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 3 )
				CombatBegin = 0
			end
		end
		sleep ( 10 )
	end
end
function cl_Z25_Boss7_dead()
	local Boss = OwnerID()
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 2 )
	ScriptMessage( Boss, -1 , 2 , "[SC_106833_03]" , 2 )
	sasa_Zone152_title_01()
end
function Cl_Z25_Boss7_Monster(OrgID)
	local FunctionID = {}
	FunctionID[106451] = "Cl_Z25_Boss7_MonsterBoss_LaSo"
	FunctionID[106541] = "Cl_Z25_Boss7_MonsterBoss_Lin"
	return FunctionID[OrgID]
end
function Cl_Z25_Boss7_P2_FightAI(ZoneID)
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local Boss_Lin = 0
	local Boss_LaSo = 0
	local Hideobj = 0
	local Boss_Flag = 0
	local Boss_Time = 0
	local OrgID = Cl_Z25_Boss7_NpcTable(ZoneID)
	MagicInterrupt( Boss )
	SetModeEx( Boss , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Boss , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( Boss , EM_SetModeType_Gravity, false) ---可砍殺(是)
	SetPosByFlag( Boss , 781137 , 2 )
	sleep ( 10 )
	sleep ( 20 )
	PlayMotionex ( Boss , ruFUSION_ACTORSTATE_FLY_BEGIN , ruFUSION_ACTORSTATE_FLY_LOOP )---------------第1ㄍ動作
	sleep ( 10 )
	SetIdleMotion( Boss ,ruFUSION_ACTORSTATE_FLY_LOOP )----------------------維持動作
	sleep ( 10 )
	while ReadRoleValue ( Boss , EM_RoleValue_Register1 ) ~= 4 do
		--DebugMsg( 0 , 0 , "P_2="..ReadRoleValue ( Boss , EM_RoleValue_Register1 ).."_"..Boss_Time )
		sleep ( 10 )
		if HateListCount( Boss ) ~= 0 then ---
			if Boss_Flag == 0 then
				Boss_LaSo = Cl_Z25_Boss7_P2CreateBoss( OrgID[3] , Boss , ctarlAI , RoomID , Cl_Z25_Boss7_Monster(OrgID[3]) ,Boss_Lin, ZoneID ) --212/12/20修改增加
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 )
				Boss_Flag = 1
			end
			if ReadRoleValue ( Boss , EM_RoleValue_Register1 ) == 1 then
				Boss_Time = Boss_Time + 1
				if Boss_Time >= 120 or ReadRoleValue( Boss_LaSo , EM_RoleValue_IsDead)==1 or checkid(Boss_LaSo) ==false then
					WriteRoleValue( Boss , EM_RoleValue_Register1 , 2 )
				end
			elseif ReadRoleValue ( Boss , EM_RoleValue_Register1 ) == 2 then
				if Boss_Flag == 1 then
					Boss_Lin = Cl_Z25_Boss7_P2CreateBoss( OrgID[4] , Boss , ctarlAI , RoomID , Cl_Z25_Boss7_Monster(OrgID[4]) , Boss_LaSo , ZoneID )
					WriteRoleValue( Boss , EM_RoleValue_Register1 , 3 )
					Boss_Flag = 2
					Boss_Time = 0
				end
			elseif ReadRoleValue ( Boss , EM_RoleValue_Register1 ) == 3 then
				Boss_Time = Boss_Time + 1
				if Boss_Time >= 120 or ReadRoleValue( Boss_Lin , EM_RoleValue_IsDead)==1 or checkid(Boss_Lin) ==false then
					WriteRoleValue( Boss , EM_RoleValue_Register1 , 4 )
				end
			end
		elseif HateListCount( Boss ) == 0 then ---
			return
		end
	end
	sleep ( 10 )
	sleep ( 20 )
	PlayMotionex ( Boss , ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_END )---------------第1ㄍ動作
	sleep ( 10 )
	SetModeEx( Boss , EM_SetModeType_Move, true ) ---移動	(否)
	SetModeEx( Boss , EM_SetModeType_Fight, true ) ---可砍殺(是)
	SetModeEx( Boss , EM_SetModeType_Gravity, true ) ---可砍殺(是)
	SetPosByFlag( Boss , 781137 , 0 )
	SetIdleMotion( Boss ,ruFUSION_ACTORSTATE_NORMAL )----------------------維持動作
	sleep ( 10 )
end
function Cl_Z25_Boss7_P2CreateBoss( OrgID , Boss , ctarlAI , RoomID , FunctionID , Boss_LaSo , ZoneID )
	local Hideobj = Cl_CreateObj_ForFlag( 106841 , 781137 , 3 , RoomID ) ----產生透明球專用
	CastSpelllv ( Hideobj , Hideobj , 496764 , 0 )
	sleep ( 20 )
	local Boss_Monster = CreateObjByFlag( OrgID , 781137 , 0 , 1 )  ------------生出魔術帽
	WriteRoleValue( Boss_Monster , EM_RoleValue_PID , ctarlAI )
	WriteRoleValue( Boss_Monster , EM_RoleValue_Register1 , Boss )
	if OrgID == 106541 then
		WriteRoleValue( Boss_Monster , EM_RoleValue_Register2 , Boss_LaSo )
	end
	AddToPartition( Boss_Monster , RoomID )
	CallPlot( Boss_Monster , FunctionID , ZoneID )
	return Boss_Monster
end
function Cl_Z25_Boss7_LockHp()

	local Boss = OwnerID()
	local Boss_Hp = Cl_ReadRoleNowHp( Boss )
	--say(Boss,"2......1 = "..Boss_Hp)
	if Boss_Hp <= 95.1 and Boss_Hp >= 91.1 then
		--say(Boss,"3......1 = "..Boss_Hp)
		WriteRoleValue( Boss , EM_RoleValue_Register4 , 1 )
		LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.90 , "Cl_Z25_Boss7_LockHp" )
	elseif Boss_Hp <= 90.1 and Boss_Hp >= 86.1 then
		WriteRoleValue( Boss , EM_RoleValue_Register4 , 1 )
		LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.85 , "Cl_Z25_Boss7_LockHp" )
	elseif Boss_Hp <= 85.1 and Boss_Hp >= 81.1 then
		WriteRoleValue( Boss , EM_RoleValue_Register4 , 1 )
		LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.80 , "Cl_Z25_Boss7_LockHp" )
	elseif Boss_Hp <= 80.1 and Boss_Hp >= 76.1 then
		WriteRoleValue( Boss , EM_RoleValue_Register4 , 1 )
		LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.75 , "Cl_Z25_Boss7_LockHp" )
	elseif Boss_Hp <= 75.1 and Boss_Hp >= 71.1 then
		WriteRoleValue( Boss , EM_RoleValue_Register4 , 1 )
		LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.70 , "Cl_Z25_Boss7_LockHp" )
	elseif Boss_Hp <= 70.1 then
		LockHP( OwnerID() , 0 , "" )
	end
end
function Cl_Z25_Boss7_CallShadow()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local ZoneID = ReadRoleValue ( ctarlAI , EM_RoleValue_ZoneID )
	local NpcOrgID = Cl_Z25_Boss7_NpcTable(ZoneID)
	local PlayerID = CL_RandHata_TargetTable( 0 , 3 ) ---Value_TanK是否排坦0=不排 1=排    Play_Num最低需求玩家數量，不達此數量則直接丟出現有數量
	local Target_Num = table.getn( PlayerID )
	local Tar_X , Tar_Y , Tar_Z = 0
	local HideBall = 0
	local Shadow_Num = ReadRoleValue ( Boss , EM_RoleValue_Register2 )
	if Target_Num >= 1 then
		for i = 1 , Target_Num , 1 do
			if ReadRoleValue ( Boss , EM_RoleValue_Register2 ) <= 11 then
				Tar_X , Tar_Y , Tar_Z = Cl_Read_OwnerXYZ( PlayerID[i] )
				HideBall = Cl_CreateObj_ForHideBall( 106841 , Tar_X , Tar_Y , Tar_Z , RoomID ) ----產生透明球專用
				WriteRoleValue( HideBall , EM_RoleValue_PID , ctarlAI )
				WriteRoleValue( HideBall , EM_RoleValue_Register1 , PlayerID[i] )
				CallPlot( HideBall , "Cl_Z25_Boss7_CreateShadow" , NpcOrgID[5] , Tar_X , Tar_Y , Tar_Z )
				Shadow_Num = ReadRoleValue ( Boss , EM_RoleValue_Register2 )
				WriteRoleValue( Boss , EM_RoleValue_Register2 , Shadow_Num+1 )
			end
		end
	end
end
function Cl_Z25_Boss7_CreateShadow( OrgID , Tar_X , Tar_Y , Tar_Z )
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	local PlayerID = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	CastSpelllv ( OwnerID , OwnerID , 496764 , 0 )
	sleep( 20 )
	local Shadow = CreateObj( OrgID , Tar_X , Tar_Y , Tar_Z , 0 , 1 ) ----產生透明球專用
	WriteRoleValue( Shadow , EM_RoleValue_PID , ctarlAI )
	WriteRoleValue( Shadow , EM_RoleValue_Register1 , PlayerID )
	AddToPartition( Shadow , RoomID )
	CallPlot( Shadow , "Cl_Z25_Boss7_ShadowAI" , 0 )
	SetAttack ( Shadow , PlayerID )
	delobj ( OwnerID )
end
function Cl_Z25_Boss7_ShadowAI()
	local OwnerID = OwnerID()
	--WriteRoleValue(OwnerID,EM_RoleValue_Livetime,5)
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
		sleep ( 10 )
	end
	delobj ( OwnerID )
end
function CL_Z25_Boss7_ShadowDead()
	local OwnerID = OwnerID()
	PlayMotionex ( OwnerID , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )---------------第1ㄍ動作
	----------------- 1.物件ID  2.反擊 3.移動 4.索敵  5.標記  6.頭像 7.砍殺  8.血條   9.阻擋  10.重力
	Cl_EM_SetModeType( OwnerID , false , false , false , false , false , false , true , false , true )
	--Addbuff (  OwnerID , 504831 , 0 , -1 ) 
	return false
end
function Cl_Z25_Boss7_SkillRebirth()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue ( TargetID , EM_RoleValue_OrgID ) == 106842 then
		local Skill_Num =  Cl_Z25_Boss7_SkillTable("ReBossHp",nil)
		local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
		local Power_Lv = Cl_Z25_Boss7SkillPLv( nil , ZoneID )
		sysCastSpelllv ( TargetID , OwnerID , Skill_Num[3] , Power_Lv[Skill_Num[3]] )
		CallPlot( TargetID , "Cl_Z25_Boss7_ShadowRebirth" , 0 )
		return true
	else
		return false
	end
end
function Cl_Z25_Boss7_ShadowRebirth()
	local OwnerID = OwnerID()
	local MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
	WriteRoleValue( OwnerID , EM_RoleValue_HP , MaxHP-1 )
	Cl_Addbuff_ForPlvUp( OwnerID , 622546 , 1 , 0 )
	PlayMotionex ( OwnerID , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )---------------第1ㄍ動作
	----------------- 1.物件ID  2.反擊 3.移動 4.索敵  5.標記 6.頭像 7.砍殺 8.血條  9.阻擋 10.重力
	sleep ( 10 )
	Cl_EM_SetModeType( OwnerID , true , true , true , true , true , true , false , false , true )
end 
function CL_Z25_Boss7_CreateEatSoulFire()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local Tar_X , Tar_Y , Tar_Z = Cl_Read_OwnerXYZ( TargetID )
	local HideBall = Cl_CreateObj_ForHideBall( 106841 , Tar_X , Tar_Y , Tar_Z , RoomID ) ----產生透明球專用
	WriteRoleValue( HideBall , EM_RoleValue_Livetime , 30 )
	CallPlot( HideBall , "CL_Z25_Boss7_EatSoulFire" , 0 )
end
function CL_Z25_Boss7_EatSoulFire()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Skill_Table = Cl_Z25_Boss7_SkillTable( nil , ZoneID )
	local Power_Lv = Cl_Z25_Boss7SkillPLv( nil , ZoneID )
	AddBuff ( OwnerID , 622550 , 0 , -1 )
	while 1 do
		sysCastSpelllv ( OwnerID , OwnerID , skill_table["EatSoulFire"][3] , Power_Lv[skill_table["EatSoulFire"][3]] )
		sleep ( 10 )
	end
end
function CL_Z25_Boss7_ChackRangePlayer(Range)
	local OwnerID = OwnerID()
	local Hate_Table = DW_HateRemain( 0 )
	if Hate_Table == nil or Hate_Table == false then
		Hate_Table = {}
	end
	local Hate_number = table.getn( Hate_Table )
	local Player_Table = {}
	local Player_Num = 0
	for i = 1 , Hate_number , 1 do
		Player_Table = SearchRangePlayer ( Hate_Table[i] , Range )----找魔術帽裡面的所有玩家"TempPlayer"這是一個TABLE
		Player_Num = table.getn(Player_Table) ----讀取TABLE裡抓到的數量
		if Player_Num >= 3 then
			WriteRoleValue( OwnerID , EM_RoleValue_Register3 , 1 )
			return Hate_Table[i]
		end
	end
end
function Cl_Z25_Boss7_CorruptCurse()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Skill_Table = Cl_Z25_Boss7_SkillTable( nil , ZoneID )
	local Power_Lv = Cl_Z25_Boss7SkillPLv( nil , ZoneID )
	local Hate_Table = CL_RandHata_TargetTable(1,3)
	local Hate_number = table.getn( Hate_Table )
	for i = 1 , Hate_number , 1 do
		sysCastSpelllv ( OwnerID , Hate_Table[i] , skill_table["CorruptCurse"][3] , Power_Lv[skill_table["CorruptCurse"][3]] )
	end
end

function Cl_Z25_Boss7_CreatePlagueBall(OrgID,RoomID,ctarlAI)
	local ctarl_X , ctarl_Y , ctarl_Z = 0
	local Rand_X , Rand_Z = 0
	local NpcID = 0
	for i = 1 , 3 , 1 do
		ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ(ctarlAI)
		Rand_X = math.random( -100, 100 )
		Rand_Z = math.random( -100, 100 )
		NpcID = CreateObj( OrgID , ctarl_X+Rand_X , ctarl_Y , ctarl_Z+Rand_Z , 0 , 1 )  ------------生出魔術帽
		SetModeEx( NpcID , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( NpcID , EM_SetModeType_Searchenemy, false)--索敵(否)
		WriteRoleValue( NpcID , EM_RoleValue_PID , ctarlAI )
		WriteRoleValue( NpcID , EM_RoleValue_Register1 , OwnerID() )
		AddToPartition( NpcID , RoomID )
		Addbuff ( NpcID , 622684 , 0 , -1 ) ---兔子變大
		CallPlot( NpcID , "Cl_Z25_PlagueBallAI" , 0 )
	end
end
function Cl_Z25_PlagueBallAI()
	local OwnerID = OwnerID()
	local ctarlAI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	local Boss = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	local Player_Table = {}
	local Rand_Player = 0
	local Player_Num = 0
	CallPlot( OwnerID , "Cl_Z25_PlagueBallcollision" , 0 )
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do

		--say(OwnerID,"reg1 = "..ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ))
		if CheckBuff ( OwnerID , 622687 ) ~= true then
			--say(OwnerID,"buff1 = bufftrue")
			Player_Table = Cl_RandTarget_HateList( Boss )
			Player_Num = table.getn( Player_Table )
			Rand_Player	= DW_Rand( Player_Num )
			--say(Player_Table[Rand_Player],"hay , it's me...")
			Cl_Straight_Line_Move_2(Player_Table[Rand_Player],-50) --2013/6/24修改成一次性移動
		end
		sleep ( 10 )
	end
	delobj ( OwnerID )
end
function Cl_Z25_PlagueBallcollision()
	local OwnerID = OwnerID()
	local ctarlAI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	local Boss = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	local Player_Table = {}
	local Player_Num = 0
	local PlayDis = 0
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
		--say(OwnerID,"reg3 = "..ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ))
		Player_Table = Cl_RandTarget_HateList( Boss )
		Player_Num = table.getn( Player_Table )
		for i = 1 , Player_Num , 1 do
			PlayDis = GetDistance( OwnerID , Player_Table[i] )
			if PlayDis <= 12 then
				sysCastSpelllv ( OwnerID , Player_Table[i] , 499354 , 0 )  --******************2013/2/2先移除傷害，等要測試傷害再還原
			end
		end
		sleep ( 3 )
	end
	--say(OwnerID,"reg4 = "..ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ))
end
function Cl_Z25_Boss7_BuffOpenMode()
	local OwnerID = OwnerID()
	SetModeEx( OwnerID , EM_SetModeType_Move, true) ---移動	(否)3
	SetModeEx( OwnerID , EM_SetModeType_Fight, true) ---可砍殺(是)7
	Addbuff ( OwnerID , 622684 , 0 , 15 ) ---兔子變大
end
function Cl_Z25_Boss7_BuffOffMode()
	local OwnerID = OwnerID()
	SetModeEx( OwnerID , EM_SetModeType_Move, false ) ---移動	(否)3
	SetModeEx( OwnerID , EM_SetModeType_Fight, false ) ---可砍殺(是)7
	Addbuff ( OwnerID , 622687 , 0 , -1 ) ---兔子變大
end