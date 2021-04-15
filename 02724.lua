function Cl_Z23_Boss3_NpcObj( ZoneID , Value )  ---裝所有NPC編號的TABLE
	local Npc_Table = {}
	------------------{1=Boss,2=BossNpc,3=小螞蟻}
	Npc_Table[146] = {106604 , 106606 , 106605 , 106606 , 116660 , 107145 , 107146 } ---Raid
	Npc_Table[147] = {107218 , 107220 , 107219 , 107220 , 116660 , 107221 , 107222 } ---正常
	Npc_Table[148] = {107223 , 107225 , 107224 , 107225 , 116660 , 107226 , 107227 }---簡易
	Npc_Table[937] = {106604 , 106606 , 106605 , 106606 , 116660 , 107145 , 107146 }---測試
	---------------------------
	local SkillLv = {}
	if ZoneID == nil then
		return Npc_Table
	elseif ZoneID ~= nil then
		if Value == nil then
			return Npc_Table[ZoneID]
		elseif Value ~= nil then
			return Npc_Table[ZoneID][Value]
		end
	end
end

function Cl_Z23_Boss3_SkillTable( ZoneID , Value )
	local Skill_Table = {}
	---BOSSSKILL----
	Skill_Table["ThunderForPlay"] = { 0 , 0 , 499014 , 10 , "[]" }
	Skill_Table["ThunderForAnt"] = { 0 , 0 , 499011 , 10 , "[]" }
	Skill_Table["Tread"] = { 0 , 7 , 499012 , 20 , "[SC_Z23_BOSS3_TREAD]" }
	Skill_Table["TreadForBall"] = { 0 , 0 , 850173 , 10 , "[]" }
	Skill_Table["Dis_Far"] = { 0 , 9 , 850172 , 60 , "[SC_Z23_BOSS3_DIS_FAR]" }
	Skill_Table["AntDead"] = { 0 , 0 , 850168 , 10 , "[]" }
	Skill_Table["Battlebegins"] = { 0 , 0 , 0 , 0 , "[SC_Z23_BOSS3_BATTLEBEGINS]" }
	Skill_Table["BattleReSet"] = { 0 , 0 , 0 , 0 , "[SC_Z23_BOSS3_BATTLERESET]" }
	Skill_Table["BattleDead"] = { 0 , 0 , 0 , 0 , "[SC_Z23_BOSS3_BATTLEDEAD]" }
	Skill_Table["WinDmg"] = { 0 , 0 , 0 , 0 , "[SC_Z23_BOSS3_WINDMG]" }
	--其他SKILL-----
	if Value == nil then
		return Skill_Table
	elseif Value ~= nil then
		return Skill_Table[Value]
	end
end

function Cl_Z23_Boss3_SkillPlv( ZoneID , Value )
	local Power_Lv = {}
	if ZoneID == 146 or ZoneID == 937 then   ------EX困難12 and 測試區
		Power_Lv[499012] = 10 --雷電踐踏
		Power_Lv[850173] = 30 --
		Power_Lv[850171] = 4
		Power_Lv[850172] = 15
		Power_Lv[850168] = 30
	elseif ZoneID == 147 then    -----------N正常6
		Power_Lv[499012] = 5
		Power_Lv[850173] = 15
		Power_Lv[850171] = 2
		Power_Lv[850172] = 5
		Power_Lv[850168] = 0
	elseif ZoneID == 148 then   -------------Ez簡易6
		Power_Lv[499012] = 2
		Power_Lv[850173] = 5
		Power_Lv[850171] = 1
		Power_Lv[850172] = 0
		Power_Lv[850168] = 0
	end
	if Value == nil then
		return Power_Lv
	elseif Value ~= nil then
		return Power_Lv[Value]
	end
end

function Cl_Z23_Boss3_ctarlAI() ---控制器控制流程----產生物件含蟻群
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( ctarlAI , EM_RoleValue_ZoneID )
	local MedicineID = {}
	local Boss_GUID = Cl_Z23_Boss3_NpcObj( ZoneID )
	local BossID = CreateObjByFlag( Boss_GUID[1] , 781175 , 0 , 1 ) 
	WriteRoleValue( BossID , EM_RoleValue_PID , ctarlAI )
	AddToPartition( BossID , RoomID )
	CallPlot( BossID , "cl_Z23_Boss3_Fight" , ZoneID , RoomID )
	local Rang_Call = {}
	Rang_Call[937] = 5
	Rang_Call[146] = 5
	Rang_Call[147] = 5
	Rang_Call[148] = 5
	for i = 1 , 4 , 1 do
		MedicineID[i] = CreateObjByFlag( Boss_GUID[5] , 781175 , i , 1 )
		SetModeEx( MedicineID[i] , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( MedicineID[i] , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( MedicineID[i] , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( MedicineID[i] , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( MedicineID[i] , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
		SetModeEx( MedicineID[i] , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
		WriteRoleValue( MedicineID[i] , EM_RoleValue_PID , ctarlAI )
		AddToPartition( MedicineID[i] , RoomID )
	end
	Lua_Cl_Zone23_Boss3_little_Ant = Lua_Cl_Zone23_Boss3_little_Ant or {}
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID] = Lua_Cl_Zone23_Boss3_little_Ant[RoomID] or {}
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] = 0
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"] = {}
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] = 0
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"] = {}
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Boss"] = BossID
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AttackTarget"] = BossID
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] = 0
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["HateList"] = 0
	local Ant_ReCreate = {}
	Ant_ReCreate[937] = 8
	Ant_ReCreate[146] = 8
	Ant_ReCreate[147] = 4
	Ant_ReCreate[148] = 4
	local Ant_Create = 0
	CallPlot( ctarlAI , "Cl_Z23_Boss3_ByAnt" , Boss_GUID[3] , ZoneID , RoomID , Ant_ReCreate[ZoneID] )
	local Lightning_Time = 0
	local Lightning_Table = {}
	Lightning_Table[937] = 20
	Lightning_Table[146] = 20
	Lightning_Table[147] = 20
	Lightning_Table[148] = 25
	local SearchAll = 0
	local Player_Table = {}
	local DeadFlag = 0
	local Boss_cazry = 0
	local cazry_Time = 480
	local Open_Door = 0
	local front_door = 0
	local Ant_cazry = 0
	local Hate_Table = 0
	local After_Door = Cl_CreateObj_ForFlag( 106235 , 781175 , 90 , RoomID )
	SetModeEx ( After_Door , EM_SetModeType_Obstruct, true ) 		---阻擋(是)
	while Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] ~= 4 do
		--if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] ~= 0 then
			--DebugMsg( 0 , 0 , "stage="..Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] )
		--end
		if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] == 1 then
			--DebugMsg( 0 , 0 , "AntNum="..Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] )
			if Boss_cazry == 0 then
				cazry_Time = cazry_Time - 1
				if cazry_Time <= 0 then
					Addbuff (  BossID , 621004 , 0 , -1 ) 
					Boss_cazry = 1
				end
			end
			if SearchAll == 0 then
				Player_Table = Cl_Z23_Boss3_SearchAllPlayer(RoomID)
				SearchAll = 1
			end
			if Open_Door == 0 then
				front_door = Cl_CreateObj_ForFlag( 106235 , 781175 , 91 , RoomID )
				SetModeEx ( front_door , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				Open_Door = 1
			end
			--if ZoneID ~= 148 then
				if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] == 0 then
					Lightning_Time = Lightning_Time + 1
				end
			--end
			if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] == 0 then
				Ant_cazry = Ant_cazry + 1
				if Ant_cazry >= 10 then
					sysCastSpelllv ( BossID , BossID , 499010 , 0 )
					Ant_cazry = 0
				end
			end
			if Lightning_Time >= Lightning_Table[ZoneID] then
				if table.getn( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"] ) <= 4 then
					for i = 1 , 2 , 1 do
						Cl_Z23_Boss3_Create_Lightning( Boss_GUID[4] , ZoneID , RoomID )
					end
				end
				Lightning_Time = 0
			end
			if Cl_Read_BuffLv( BossID , 621866 , 0 ) >= Rang_Call[ZoneID] then
				if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] == 0 then
					CancelBuff_NoEvent( BossID , 621866 )
					CancelBuff_NoEvent( BossID , 622631 )
					for i = 1 , table.getn( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"] ) , 1 do
						CancelBuff_NoEvent (Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i] , 622628 )
					end
					Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["HateList"] = Cl_RandTarget_HateList( BossID )
					
					ScriptMessage( BossID , -1 , 2 , "[SC_Z23_BOSS3_CHANGEHUMAN]" , 1 )
					Addbuff ( BossID , 622632 , 0 , 90 ) 
					Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AttackTarget"] = ReadRoleValue( BossID , EM_RoleValue_AttackTargetID )
					SetRoleCampID( BossID , 8 )
					Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] = 1
					Cl_Z23_Boss3_SetAttack( BossID )
				end
			end
			if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] == 1 then
				Cl_Z23_Boss3_Ant_Ridicule_Boss( BossID )
				if Cl_Z23_Boss3_chackHateList( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["HateList"] ) ~= true then
					--say ( BossID , "off" )
					Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] = 3
				end
				--Hate_Table = Cl_RandTarget_HateList( BossID ) 
				--DebugMsg( 0 , 0 , "playerNum="..table.getn( Hate_Table ) )
				--for i = 1 , table.getn( Hate_Table ) , 1 do
					--Yell ( Hate_Table[i] , "1111111" )
					--if ReadRoleValue( Player_Table[i] , EM_RoleValue_IsPlayer ) == 1 then
						--DeadFlag = DeadFlag + 1
					--end
				--end
				--if DeadFlag == 0 then
				--	SetRoleCampID( BossID , 3 )
				--elseif DeadFlag >= 1 then
					--DeadFlag = 0
				--end
				if CheckBuff ( BossID , 622632 ) ~= true then
					SetRoleCampID( BossID , 3 )
					ScriptMessage( BossID , -1 , 2 , "[SC_Z23_BOSS3_CHANGEANT]" , 1 )
					CancelBuff_NoEvent( BossID , 508172 )
					for i = 1 , table.getn( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"] ) , 1 do
						CancelBuff_NoEvent( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i] , 508172 )
						Addbuff ( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i] , 622628 , 0 , -1 )
					end
					if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] < 8 then
						Ant_Create = Ant_ReCreate[ZoneID] - Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"]
						CallPlot( ctarlAI , "Cl_Z23_Boss3_ByAnt" , Boss_GUID[3] , ZoneID , RoomID , Ant_ReCreate[ZoneID] )
					end
					Cl_Z23_Boss3_SetAttack( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AttackTarget"] )
					Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AttackTarget"] = BossID
					Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] = 0
				end
			end
		elseif Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] == 2 then
			DebugMsg( 0 , 0 , "Dead="..Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] )
			delobj ( After_Door )
			delobj ( front_door )
			Cl_Z23_DelAllObj(RoomID)
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] = 0
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"] = {}
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"] = {}
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] = 0
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] = 4
		elseif Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] == 3 then
			DebugMsg( 0 , 0 , "ReSetFunction="..Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] )
			Cl_Z23_DelAllObj(RoomID)
			delobj ( BossID )
			delobj ( front_door )
			for i = 1 , 4 , 1 do
				delobj ( MedicineID[i] )
			end
			for i = 1 , table.getn( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"] ) , 1 do
				delobj ( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"][i] )
			end
			Boss_cazry = 0
			cazry_Time = 480
			sleep ( 30 )
			Lightning_Time = 0
			Open_Door = 0
			SearchAll = 0
			Player_Table = {}
			DeadFlag = 0
			Ant_cazry = 0
			BossID = CreateObjByFlag( Boss_GUID[1] , 781175 , 0 , 1 )
			WriteRoleValue( BossID , EM_RoleValue_PID , ctarlAI )
			AddToPartition( BossID , RoomID )
			CallPlot( BossID , "cl_Z23_Boss3_Fight" , ZoneID , RoomID )
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Boss"] = BossID
			CallPlot( ctarlAI , "Cl_Z23_Boss3_ByAnt" , Boss_GUID[3] , ZoneID , RoomID , Ant_ReCreate[ZoneID] )
			for i = 1 , 4 , 1 do
				MedicineID[i] = CreateObjByFlag( Boss_GUID[5] , 781175 , i , 1 )
				SetModeEx( MedicineID[i] , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( MedicineID[i] , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( MedicineID[i] , EM_SetModeType_Searchenemy, false)--索敵(否)
				SetModeEx( MedicineID[i] , EM_SetModeType_Fight, false) ---可砍殺(是)
				SetModeEx( MedicineID[i] , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
				SetModeEx( MedicineID[i] , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
				WriteRoleValue( MedicineID[i] , EM_RoleValue_PID , ctarlAI )
				AddToPartition( MedicineID[i] , RoomID )
			end
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] = 0
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"] = {}
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] = 0
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"] = {}
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AttackTarget"] = BossID
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] = 0
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["HateList"] = {}
		end
		sleep ( 10 )
	end
end

function cl_Z23_Boss3_Fight(ZoneID,RoomID) ---BOSS戰鬥劇情
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID ) --測試完畢刪除
	local ZoneID = ReadRoleValue ( Boss , EM_RoleValue_ZoneID ) --測試完畢刪除
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local CombatBegin = 0
	local ObjID = Cl_Z23_Boss3_NpcObj( ZoneID )
	local Skill_Table = Cl_Z23_Boss3_SkillTable( ZoneID )
	local PowerLv = Cl_Z23_Boss3_SkillPlv( ZoneID )
	local Ant_Num = 0
	local AttackTarget = 0
	local PlayerTargetID = 0
	MoveToFlagEnabled( Boss , false )
	LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.8 , "Cl_Z23_Boss3_BossLockHp" )
	SetPlot( Boss, "dead","cl_Z23_Boss3_dead", 0 ) 
	while Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] ~= 4 do	
		AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if HateListCount( Boss ) ~= 0 then
			if CombatBegin == 0 then
				CombatBegin = 1
				ScriptMessage( Boss , -1 , 2 , Skill_Table["Battlebegins"][5] , 1 )
				Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] = 1
			end
			for num , skill in pairs(skill_table) do
				skill_table[num][1] = skill_table[num][1] + 1
			end
			if skill_table["Tread"][1] >= skill_table["Tread"][2] then
				cl_chack_CastSpell()
				ScriptMessage( Boss , -1 , 2 , Skill_Table["Tread"][5] , 1 )
				CastSpelllv ( Boss , Boss , skill_table["Tread"][3] , 0 )
				sleep ( skill_table["Tread"][4] )
				skill_table["Tread"][1] = 0
			end
			if skill_table["Dis_Far"][1] >= skill_table["Dis_Far"][2] then
				cl_chack_CastSpell()
				ScriptMessage( Boss , -1 , 2 , Skill_Table["Dis_Far"][5] , 1 )
				Cl_Z23_Boss3_SearchDis()
				CastSpelllv ( Boss , Boss , skill_table["Dis_Far"][3] , PowerLv[skill_table["Dis_Far"][3]] )
				sleep ( skill_table["Dis_Far"][4] )
				skill_table["Dis_Far"][1] = 0
			end
		elseif HateListCount( Boss ) == 0 then 
			if CombatBegin == 1 then   
				CombatBegin = 0
				ScriptMessage( Boss , -1 , 2 , Skill_Table["BattleReSet"][5] , 1 )
				Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] = 3
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = 0
				end
			end
		end
		sleep ( 10 )
	end	
end

function Cl_Z23_Boss3_BossLockHp()
	local Boss = OwnerID()
	local Boss_Hp = Cl_ReadRoleNowHp( Boss )
	if Boss_Hp <= 80 and Boss_Hp >= 61 then
		CallPlot( Boss , "Cl_Z23_Boss3_HPInSetSkill" , 0)
		LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.6 , "Cl_Z23_Boss3_BossLockHp" )
	elseif Boss_Hp <= 60 and Boss_Hp >= 41 then
		CallPlot( Boss , "Cl_Z23_Boss3_HPInSetSkill" , 0)
		LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.4 , "Cl_Z23_Boss3_BossLockHp" )
	elseif Boss_Hp <= 40 and Boss_Hp >= 21 then
		CallPlot( Boss , "Cl_Z23_Boss3_HPInSetSkill" , 0)
		LockHP( Boss , ReadRoleValue( Boss , EM_RoleValue_MaxHP )* 0.2 , "Cl_Z23_Boss3_BossLockHp" )
	elseif Boss_Hp <= 20 then
		CallPlot( Boss , "Cl_Z23_Boss3_HPInSetSkill" , 0)
		LockHP( OwnerID() , 0 , "" )
	end
end

function cl_Z23_Boss3_dead()  ---Boss死亡劇情
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( Boss , EM_RoleValue_ZoneID )
	local Skill_Table = Cl_Z23_Boss3_SkillTable( ZoneID )
	ScriptMessage( Boss , -1 , 2 , Skill_Table["BattleDead"][5] , 1 )
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] = 2
end

function cl_Zone23_Create_little_Ant( OrgID , ZoneID , RoomID ) --小馬蟻產生劇情
	local ctarlAI = OwnerID()
	local ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ( ctarlAI )
	local Rand_X = math.random( -150, 150 )
	local Rand_Z = math.random( -150, 150 )
	local AntID = CreateObj( OrgID , ctarl_X+Rand_X , ctarl_Y , ctarl_Z+Rand_Z , 0 , 1 )
	WriteRoleValue( AntID , EM_RoleValue_PID , ctarlAI )
	AddToPartition( AntID , RoomID )
	CallPlot( AntID , "cl_Zone23_little_Ant_FightAI" , ZoneID , RoomID  )
	table.insert( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"] , AntID )
	return AntID
end

function cl_Zone23_little_Ant_FightAI( ZoneID ,RoomID ) --小螞蟻戰鬥劇情
	local AntID = OwnerID()
	local ctarlAI = ReadRoleValue ( AntID , EM_RoleValue_PID )
	local Move_Rand = DW_Rand(180)
	local SleepTime_Rand = 0
	local BossID = Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Boss"]
	local CombatBegin = 0
	if ZoneID ~= 148 then
		LockHP( AntID , 1 , "Cl_Z23_Boss3_AntLockHp" )
	end
	SetPlot( AntID, "dead","cl_Z23_AntID_dead", 0 )
	Addbuff ( AntID , 622630 , 0 , -1 )
	while Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] ~= 4 do
		AttackTarget = ReadRoleValue( AntID , EM_RoleValue_AttackTargetID )
		if HateListCount( AntID ) ~= 0 then ---
			if CombatBegin == 0 then   -----
				CombatBegin = 1
				if HateListCount( BossID ) == 0 then
					SetAttack( BossID , AttackTarget )
				end
			end
		elseif HateListCount( AntID ) == 0 then 
			if CombatBegin == 1 then   
				CombatBegin = 0
			end
			SleepTime_Rand = DW_Rand(60)
			Cl_Z23_Boss3_CheckBossInFight( BossID , ctarlAI , SleepTime_Rand , Move_Rand )
		end
		sleep ( 10 )
	end
	delobj ( AntID )
end

function Cl_Z23_Boss3_AntLockHp()
	local AntID = OwnerID()
	local RoomID = ReadRoleValue ( AntID , EM_RoleValue_RoomID )
	if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] == 1 then
		LockHP( AntID , 0 , "" )
	elseif Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] ~= 1 then
		LockHP( AntID , 1 , "Cl_Z23_Boss3_AntLockHp" )
	end
end

function cl_Z23_AntID_dead()  ---小螞蟻死亡劇情
	local AntID = OwnerID()
	local RoomID = ReadRoleValue ( AntID , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( AntID , EM_RoleValue_ZoneID )
	local SkillDead = Cl_Z23_Boss3_SkillTable( ZoneID , "AntDead" )
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(AntID)
	local NpcID = Cl_CreateObj_ForHideBall( Cl_Z23_Boss3_NpcObj( ZoneID , 7 ) , Npc_X , Npc_Y , Npc_Z , RoomID )
	WriteRoleValue ( NpcID , EM_RoleValue_LiveTime , 3 )
	CastSpelllv ( NpcID , NpcID , SkillDead[3] , Cl_Z23_Boss3_SkillPlv( ZoneID , SkillDead[3] ) )
	if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] == 1 then
		Cl_Z23_Boss3_CancelBuffTime(RoomID)
	end
	Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] = Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] - 1
	for i = 1 , table.getn(Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"]) , 1 do
		if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i] == AntID then
			table.remove ( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"] , i )
			return
		end
	end
end

function Cl_Z23_DelAllObj(RoomID) --刪除蟻群
	for i = 1 , table.getn(Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"]) , 1 do
		if CheckID( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i] ) == true then
			delobj(Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i])
		end
	end
	for i = 1 , table.getn(Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"]) , 1 do
		if CheckID( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"][i] ) == true then
			delobj(Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"][i])
		end
	end
end

function Cl_Z23_Boss3_ByAnt( AntOrgID , ZoneID , RoomID , For_Num) --產生蟻群
	local AntID = 0
	for i = 1 , For_Num , 1 do	
		if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] < 8 then
			AntID = cl_Zone23_Create_little_Ant( AntOrgID , ZoneID , RoomID )
			Addbuff ( AntID , 622628 , 0 , -1 )
			Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] = Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntNum"] + 1
		end
	end
end

function Cl_Z23_Boss3_CheckBossInFight(BossID,ctarlAI,SleepTime_Rand,Move_Rand) ---螞蟻非戰鬥中隨機移動
	local AntID = OwnerID()
	local CombatBegin = 0
	if HateListCount( BossID ) == 0 then
		if CombatBegin == 1 then
			CombatBegin = 0
		end
		Cl_RandMove( ctarlAI , SleepTime_Rand , Move_Rand )  
		sleep ( 1 )
	elseif HateListCount( BossID ) ~= 0 then
		if CombatBegin == 0 then
			CombatBegin = 1
			StopMove( AntID , false )
			local Hate_Table = Cl_RandTarget_HateList( BossID )
			local Hate_Num = table.getn( Hate_Table )
			local Hate_Rand = DW_Rand( Hate_Num )
			SetAttack( AntID , Hate_Table[Hate_Rand] )
		end
	end
end

function Cl_Z23_Boss3_MedicineSetTouch() --物件呼叫觸碰劇情
	if ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID ) ~= 148 then
		SetPlot( OwnerID(), "touch","Cl_Z23_Boss3_MedicineReadTouch", 30 )
	end
end

function Cl_Z23_Boss3_MedicineReadTouch() --執行處碰劇情檢查
	local PlayerID = OwnerID()
	local MedicineID = TargetID()
	if CheckBuff(  PlayerID , 621867 ) ~= true then
		if	BeginCastBarEvent( PlayerID , MedicineID , "[SC_Z23_BOSS3_TAKE_MED]" , 10 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Cl_Z23_Boss3_Medicine_Touch") ~= 1 then  
			ScriptMessage( PlayerID, PlayerID, 1,"[SAY_NPC_BUSY]", 0 )	
		end
	elseif CheckBuff(  PlayerID , 621867 ) == true then
		ScriptMessage( PlayerID, PlayerID, 1,"[SC_Z23_BOSS3_TAKE_MED_NOT]", 0 )
	end
end

function Cl_Z23_Boss3_Medicine_Touch(Executer,Result) --觸碰劇情條件達成執行
	if	Result > 0 then
		EndCastBar(Executer,Result)
		CallPlot( OwnerID() , "Cl_Z23_Boss3_Medicine" , 0)
		CallPlot( TargetID() , "Cl_Z23_Boss3_MedicineHide" , 0 )
	else
		EndCastBar(Executer,Result)
	end
end

function Cl_Z23_Boss3_Medicine() --給自己技能BUFF
	Addbuff (  OwnerID() , 621867 , 0 , -1 ) 
end

function Cl_Z23_Boss3_MedicineHide() ---藥劑隱藏20秒
	local MedicineID = OwnerID()
	SetModeEx( MedicineID , EM_SetModeType_Show, false) ---秀出(否)
	SetModeEx( MedicineID , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( MedicineID , EM_SetModeType_Mark, false)			---可點選(是)
	sleep ( 200 )
	SetModeEx( MedicineID , EM_SetModeType_Show, true) ---秀出(否)
	SetModeEx( MedicineID , EM_SetModeType_Move, true) ---移動	(否)
	SetModeEx( MedicineID , EM_SetModeType_Mark, true)			---可點選(是)
end

function Cl_Z23_Boss3_Create_Lightning( OrgID , ZoneID , RoomID ) --產生狂亂雷電核心
	local ctarlAI = OwnerID()
	local ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Boss"] )
	local Rand_X = math.random( -75, 75 )
	local Rand_Z = math.random( -75, 75 )
	local LightningID = CreateObj( OrgID , ctarl_X+Rand_X , ctarl_Y , ctarl_Z+Rand_Z , 0 , 1 )
	SetModeEx( LightningID , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( LightningID , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( LightningID , EM_SetModeType_Searchenemy, false)--索敵(否)
	WriteRoleValue( LightningID , EM_RoleValue_PID , ctarlAI )
	AddToPartition( LightningID , RoomID )
	CallPlot( LightningID , "Cl_Z23_Boss3_Lightning_FightAI" , ZoneID , RoomID )
	table.insert( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"] , LightningID )
end

function Cl_Z23_Boss3_Lightning_FightAI( ZoneID , RoomID )  --狂亂雷電核心施放技能
	local LightningID =  OwnerID()
	local zone = ReadRoleValue(LightningID,EM_RoleValue_ZoneID)
	addbuff ( LightningID , 621862 , 0 , -1 )
	addbuff ( LightningID , 509476 , 0 , -1 )
	SetPlot( LightningID, "dead","cl_Z23_Boss3_Lightning_dead", 0 )
	local Play_Table = {}
	local New_number = 0
	local Owner_HP = 0
	local Ant_Table = {}
	local SkillPlay = Cl_Z23_Boss3_SkillTable( ZoneID , "ThunderForPlay" )
	local SkillAnt = Cl_Z23_Boss3_SkillTable( ZoneID , "ThunderForAnt" )
	while Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] ~= 4 do
		sleep ( 40 )
		Owner_HP = Cl_ReadRoleNowHp(LightningID)
		Owner_HP = Owner_HP / 10
		Owner_HP = math.floor(Owner_HP)
		if zone == 146 then
			CastSpelllv ( LightningID , LightningID , SkillPlay[3] , Owner_HP )
		elseif zone == 147 then
			CastSpelllv ( LightningID , LightningID , SkillPlay[3] , math.floor(Owner_HP/2) )
		elseif zone == 148 then
			CastSpelllv ( LightningID , LightningID , SkillPlay[3] , math.floor(Owner_HP/4) )
		end
		
		Ant_Table = Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"]
		for i = 1 , table.getn(Ant_Table) , 1 do
			sysCastSpelllv ( Ant_Table[i] , Ant_Table[i] , SkillAnt[3] , Owner_HP )
		end
	end
	delobj ( LightningID )
end

function cl_Z23_Boss3_Lightning_dead() --狂亂雷電核心死亡施放電擊
	local LightningID =  OwnerID()
	local RoomID = ReadRoleValue ( LightningID , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( LightningID , EM_RoleValue_ZoneID )
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(LightningID)
	local NpcID = Cl_CreateObj_ForHideBall( Cl_Z23_Boss3_NpcObj( ZoneID , 6 ) , Npc_X , Npc_Y , Npc_Z , RoomID )
	WriteRoleValue ( NpcID , EM_RoleValue_LiveTime , 3 )
	CastSpelllv ( NpcID , NpcID , 499015 , 0 )
	for i = 1 , table.getn(Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"]) , 1 do
		if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"][i] == LightningID then
			table.remove ( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Lightning"] , i )
			delobj ( LightningID )
			return
		end
	end
end

function Cl_Z23_Boss3_Electric_Shock() --電擊命中檢查目標
	local OwnerID =  OwnerID()
	local TargetID = TargetID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	if TargetID == Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Boss"] then
		if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] == 0 then
			return true
		elseif Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] == 1 then
			return false
		end
	else
		return false
	end
end

function Cl_Z23_Boss3_SetAttack( AttackID ) ---改變攻擊對象
	local RoomID = ReadRoleValue ( OwnerID() , EM_RoleValue_RoomID )
	for i = 1 , table.getn(Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"]) , 1 do
		if CheckID( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i] ) == true then
			SetStopAttack( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i] )  
			SetAttack( Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i] , AttackID )
			if AttackID == Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Boss"] then
				SysCastSpelllv ( AttackID , Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][i] , 496266 , 0 )
			end
		end
	end
end

function Cl_Z23_Boss3_CancelBuffTime(RoomID) ---螞蟻死亡減少人形心智時間
	local AntID =  OwnerID()
	local ZoneID = ReadRoleValue ( AntID , EM_RoleValue_ZoneID )
	local Time_Table = {}
	Time_Table[937] = 15
	Time_Table[146] = 15
	Time_Table[147] = 10
	Time_Table[148] = 8
	local BossID = Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Boss"]
	local BUFF = Lua_BuffPosSearch( BossID , 622632 )
	local BUFFTime_Now = BuffInfo( BossID , BUFF , EM_BuffInfoType_Time )---讀取技能等級
	if BUFFTime_Now >= Time_Table[ZoneID] then
		local BuffTime = BUFFTime_Now - Time_Table[ZoneID]
		CancelBuff_NoEvent( BossID , 622632 )
		ScriptMessage( AntID , -1 , 2 , "[SC_Z23_BOSS3_REDUCE_S]" , 1 )
		Addbuff ( BossID , 622632 , 0 , BuffTime )
	elseif BUFFTime_Now < Time_Table[ZoneID] then
		CancelBuff_NoEvent( BossID , 622632 )
	end
end

function Cl_Z23_Boss3_Ant_Ridicule_Boss( BossID )
	local RoomID = ReadRoleValue ( OwnerID() , EM_RoleValue_RoomID )
	if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][1] ~= nil then
		SetAttack( BossID , Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][1] )
		SysCastSpelllv (  Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["AntGUID"][1] , BossID , 496266 , 0 )
	end
end

function Cl_Z23_Boss3_SearchAllPlayer(RoomID)
	local Player_Table = {}
	local Player_Num = SetSearchAllPlayer(RoomID )
	local PlayerID = 0
	local Num = 0
	for i = 1 , Player_Num , 1 do
		PlayerID = GetSearchResult()
		if ReadRoleValue( PlayerID , EM_RoleValue_IsDead ) ~= 1 and
			ReadRoleValue( PlayerID, EM_RoleValue_VOC) ~= 0  and
			ReadRoleValue( PlayerID , EM_RoleValue_RoomID  ) == RoomID then		
			Player_Table[Num] =  PlayerID
			Num = Num + 1
		end
	end
	return Player_Table
end

function Cl_Z23_Boss3_AntLinkBuff()
	local OwnerID =  OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local BuffLv = 0
	if Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["stage"] == 1 and
		Lua_Cl_Zone23_Boss3_little_Ant[RoomID]["Change_Camp"] == 0 then
		local AntID = SearchRangeNPC ( OwnerID , 40 ) 
		local Ant_Num = table.getn(AntID) 
		for i=0 , Ant_Num-1 , 1 do 
			if ReadRoleValue( AntID[i] , EM_RoleValue_OrgID ) == Cl_Z23_Boss3_NpcObj( ZoneID , 3 ) and 
				ReadRoleValue( AntID[i] , EM_RoleValue_OrgID ) ~= 1 then 
				if AntID[i] ~= OwnerID then
					BuffLv = BuffLv + 1
				end
			end
		end
		if BuffLv ~= 0 then
			CancelBuff_NoEvent( OwnerID , 622629 )
			Addbuff ( OwnerID , 622629 , BuffLv , 2 )
		end
	end
end

function Cl_Z23_Boss3_SkillTread()
	local OwnerID =  OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(AttackTarget)
	local HideBall = Cl_CreateObj_ForHideBall( Cl_Z23_Boss3_NpcObj( ZoneID , 6 ) , Npc_X , Npc_Y , Npc_Z , RoomID )
	WriteRoleValue ( HideBall , EM_RoleValue_LiveTime , 8 )
	CallPlot( HideBall , "Cl_Z23_Boss3_SetBallSkill" , Npc_X , Npc_Y , Npc_Z )
end

function Cl_Z23_Boss3_SetBallSkill( Npc_X , Npc_Y , Npc_Z )
	local OwnerID =  OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Skill = Cl_Z23_Boss3_SkillTable( ZoneID , "TreadForBall" )
	sleep ( 10 )
	while 1 do
		sleep ( 10 )
		CastSpelllv ( OwnerID , OwnerID , Skill[3] , Cl_Z23_Boss3_SkillPlv( ZoneID , Skill[3] ) )
	end
end

function Cl_Z23_Boss3_HPInSetSkill()
	local OwnerID =  OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	ScriptMessage( OwnerID , -1 , 2 , "[SC_Z23_BOSS3_WINDMG]" , 1 )
	cl_chack_CastSpell()
	CastSpelllv ( OwnerID , OwnerID , 850171 , Cl_Z23_Boss3_SkillPlv( ZoneID , 850171 ) )
end

function Cl_Z23_Boss3_SearchDis()
	local OwnerID =  OwnerID()
	local Hate_Table = Cl_RandTarget_HateList( OwnerID )
	local Dis_Far = 0
	local Dis = 0
	local Player = 0
	for i = 1 , table.getn( Hate_Table ) , 1 do
		Dis = GetDistance( OwnerID , Hate_Table[i] )
		if Dis > Dis_Far then
			Dis_Far = Dis
			Player = Hate_Table[i]
		end
	end
	AdjustFaceDir ( OwnerID , Player , 0 )
end

function Cl_Z23_Boss3_ChackAntZone()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local NpcID = Cl_Z23_Boss3_NpcObj( ZoneID , 3 )
	if ReadRoleValue( TargetID , EM_RoleValue_OrgID ) == NpcID then
		return true
	else
		ScriptMessage ( OwnerID , OwnerID , 1 , "[SC_Z23_BOSS3_TARGET_NOT_ANT]" , 0 )
		return false
	end
end

function Cl_Z23_Boss_Chack_Zone( Zone ) --檢查施放物件目標
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == Zone then
		return true
	else
		return false
	end
end

function Cl_Z23_Boss3_ChackFight()
	local TargetID = TargetID()
	if GetModeEx ( TargetID , EM_SetModeType_Fight ) == true then
		return true
	else
		return false
	end
end
function Cl_Z23_Boss3_chackHateList(Hate_Table)
	local Table_Num = table.getn( Hate_Table )
	--say ( OwnerID() , "Table_Num="..Table_Num )
	local Player = 0
	for i = 1 , Table_Num , 1 do
		---say ( Hate_Table[i] , "111111=" )
		if ReadRoleValue( Hate_Table[i] , EM_RoleValue_IsPlayer ) == 1 and
			ReadRoleValue( Hate_Table[i] , EM_RoleValue_IsDead ) ~= 1 then
			Player = Player + 1
		end
	end
	if Player >= 1 then
		return true
	elseif Player == 0 then
		return false
	end
end