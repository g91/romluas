function Cl_ACWB_P3Boss4_CtarlAI()  ---41號入口門
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local Big_ctarlAI = ReadRoleValue ( ctarlAI , EM_RoleValue_PID )
	local NpcID_Table = {}
	NpcID_Table["Hard_Boss"] =  106555
	NpcID_Table["Boss"] =  106550
	NpcID_Table["Old_Npc"] =  120116
	local FlagID = 781062
	local Npc_Table = {}
	local Function_Table = {}
	Function_Table["Hard_Boss"] = "Cl_ACWB_P3Boss4_Flght_1"
	Npc_Table["Hard_Boss"] = Cl_CreateObj_ForBoss ( NpcID_Table["Hard_Boss"] , FlagID , 0 , Function_Table["Hard_Boss"] , 0 )
	WriteRoleValue ( ctarlAI , EM_RoleValue_Register5 , Npc_Table["Hard_Boss"] )
	local boss = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
	SetModeEx( Npc_Table["Hard_Boss"] , EM_SetModeType_Move, false) ---移動	(否)
	Npc_Table["Old_Npc"] = Cl_CreateObj_Npc ( NpcID_Table["Old_Npc"] , FlagID , 1 , nil , 0 )
	local cazry_Time = 0
	local cazry_Flag = 0
	local Close_Door = 0
	local Buff_Time = 0
	local BuffLV = 0
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) ~= 4 do
		sleep ( 10 )
		boss = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 then
			if cazry_Flag == 0 then
				cazry_Time = cazry_Time + 1
				--DebugMsg( 0 , RoomID , "cazry_Time="..cazry_Time )
				if cazry_Time == 480 then
					boss = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
					Addbuff (  boss , 622092 , 0 , -1 ) ---兔子變大
					cazry_Flag = 1
				end
			end
			if cazry_Flag == 1 then
				DebugMsg( 0 , RoomID , "622092" )
			end
			if Close_Door == 0 then
				Npc_Table["Door"]  = Cl_CreateObj_ForFlag( 106237 , FlagID , 41 , RoomID ) ----產生透明球專用
				SetModeEx ( Npc_Table["Door"] , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				MoveToFlagEnabled( Npc_Table["Door"] , false ) ---系統內建的路徑關掉
				Close_Door = 1
			end
			if ReadRoleValue ( boss , EM_RoleValue_OrgID ) == 106550 then
				Buff_Time = Buff_Time + 1
				if Buff_Time >= 8 then
					BuffLV = ReadRoleValue ( boss , EM_RoleValue_Register9 )
					if BuffLV ~= 0 then
						CancelBuff_NoEvent( boss , 621738 ) ---清除BUFF3
						Addbuff (  boss , 621738 , BuffLV-1 , 9 ) ---兔子變大
						Buff_Time = 0
					end
				end
			end
			WriteRoleValue ( Big_ctarlAI , EM_RoleValue_Register1 , 1 )
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 2 then
			local Door_Time = GetWorldVar( "SC_BLACKWATER_P3_TIME" )	-- 世界變數1
			if Door_Time > 1800 then
				SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 3 )	-- 字串、值
			elseif Door_Time <= 1800 then
				SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 2 )	-- 字串、值
			end
			WriteRoleValue ( Big_ctarlAI , EM_RoleValue_Register1 , 1 )
			WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 4 )
			WriteRoleValue ( ctarlAI , EM_RoleValue_Register4 , 1 )
			SetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" , 0 )	-- 字串、值   ---	-- 字串、值
			delobj ( Npc_Table["Door"] )
			cazry_Time = 0
			cazry_Flag = 0
			Close_Door = 0
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 3 then
			sleep ( 30 )
			local Play_Table = SearchRangePlayer ( ctarlAI , 400 )
			local Play_Num = table.getn( Play_Table )
			for i = 0 , Play_Num-1 , 1 do
				CancelBuff(	Play_Table[i], 621741 )
			end
			delobj ( Npc_Table["Door"] )
			Npc_Table["Hard_Boss"] = Cl_CreateObj_ForBoss ( NpcID_Table["Hard_Boss"] , FlagID , 0 , Function_Table["Hard_Boss"] , 0 )
			SetModeEx( Npc_Table["Hard_Boss"] , EM_SetModeType_Move, false) ---移動	(否)
			WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 0 )
			WriteRoleValue ( Big_ctarlAI , EM_RoleValue_Register1 , 0 )
			cazry_Time = 0
			cazry_Flag = 0
			Close_Door = 0
		end
	end
end
--ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_04]" , 2 )----vaistain'vaistain'vaistain(聽不懂得龍語)
function Cl_ACWB_P3Boss4_Flght_1()
	local Boss_4 = OwnerID()
	local RoomID = ReadRoleValue ( Boss_4 , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss_4 , EM_RoleValue_PID )
	local OrgId = ReadRoleValue ( Boss_4 , EM_RoleValue_OrgID )
	local AttackTarget = 0
	local CombatBegin = 0
	local FlagID = 781062
	local Flag = 1
	local FunctionID = {}
	FunctionID["Magic_Npc"] = "cl_WB_MagicToFight"
	FunctionID["dead_1"] = "Cl_HardBoss_NotDead"
	FunctionID["dead_2"] = "Cl_HardBoss_IsDead"
	local String_Table = {}
	String_Table["START"] = "[SC_ACWB_BOSS4_START]"
	String_Table["DEAD"] = "[SC_ACWB_BOSS4_DEAD]"
	String_Table["RESET"] = "[SC_ACWB_BOSS4_RESET]"
	String_Table["SKILL01"] = "[SC_ACWB_BOSS4_SKILL01]"
	String_Table["SKILL02"] = "[SC_ACWB_BOSS4_SKILL02]"
	String_Table["SKILL03"] = "[SC_ACWB_BOSS4_SKILL03]"
	String_Table["SKILL04"] = "[SC_ACWB_BOSS4_SKILL04]"
	String_Table["CHANG"] = "[SC_ACWB_BOSS4_CHANG]"
	String_Table["EAT_NPC"] = "[SC_ACWB_BOSS4_EAT_NPC]"
	String_Table["MONSTER"] = "[SC_ACWB_BOSS4_MONSTER]"
	--String_Table["Flght_Star"] =
	if OrgId == 106555 then
		SetPlot( Boss_4, "dead",FunctionID["dead_1"], 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	elseif OrgId == 106550 then
		SetPlot( Boss_4, "dead",FunctionID["dead_2"], 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	end
	local skill_table = {}
	if OrgId == 106555 then
		skill_table[3] = { 3 , 3 , 499007 , 5 , 40 }  ---衝鋒
		skill_table[7] = { 0 , 7 , 499008 , 6 , 10 } ---案影彈
		skill_table[13] = { 0 , 13 , 499009 , 0 , 0 } ---震地坡
		skill_table[99] = { 0 , 0 , 499006 , 0 , 10 } ---開場無敵
	elseif OrgId == 106550 then
		skill_table[7] = { 0 , 7 , 499001 , 14 , 10 }  ---衝鋒
		skill_table[8] = { 0 , 7 , 499002 , 11 , 20 }  ---衝鋒
		skill_table[9] = { 0 , 9 , 499003 , 0 , 10 }  ---衝鋒
		skill_table[10] = { 0 , 0 , 499004 , 6 , 30 }  ---衝鋒
		skill_table[13] = { 0 , 13 , 499005 , 10 , 30 }  ---衝鋒
		skill_table[15] = { 0 , 15 , 0 , 0 , 0  }  ---衝鋒
		skill_table[20] = { 0 , 20 , 499016 , 0 , 80 }  ---衝鋒
		skill_table[30] = { 0 , 22 , 499017 , 0 , 10 }  ---衝鋒
	end
	local Buff_Table = {}
	Buff_Table[1] = { 621872 , 119 , 9 }
	local Magic_NpcID = 120101
	local Npc_Table = {}
	local Hate_X , Hate_Y , Hate_Z = 0
	local rand_skill = 0
	local rand_number = 0
	local KillNpc = 0
	local NPC_skill = 0
	local Rand_Table = {}
	local Npc_number = 0
	local Flag_Npc = 0
	local BuffLV = ReadRoleValue( Boss_4 , EM_RoleValue_Register9 )
	if OrgId == 106550 then
		Addbuff (  Boss_4 , 621738 , 7 , 8 ) ---兔子變大
		for i = 1 , 8 , 1 do
			Npc_Table[i] = Cl_CreateObj_Npc( Magic_NpcID , FlagID , Flag+i , FunctionID["Magic_Npc"] )
			WriteRoleValue ( Npc_Table[i] , EM_RoleValue_Register2 , i )
		end
		WriteRoleValue ( Boss_4 , EM_RoleValue_Register9 , 8 )
	end
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( Boss_4 , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( Boss_4 ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				ScriptMessage( Boss_4 , -1 , 2 , String_Table["START"] , 2 )
				if OrgId == 106555 then
					WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 1 )
					CastSpelllv ( Boss_4 , Boss_4 , skill_table[99][3] , skill_table[99][4] ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
				end
				sleep ( 10 )
				CombatBegin = 1
			end
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = skill_table[num][1] + 1
				end
				if OrgId == 106555 then
					ClearHateList( Boss_4 , -1 )
					if skill_table[3][1] >= skill_table[3][2] then
						cl_chack_CastSpell()
						Cl_ACWB_Skill_499007( skill_table[3][3] , skill_table[3][4] , RoomID )
						SetModeEx( Boss_4 , EM_SetModeType_Move, false) ---移動	(否)
						sleep ( skill_table[3][5] )
						skill_table[3][1] = 0
					end
					if skill_table[7][1] >= skill_table[7][2] then
						ScriptMessage( Boss_4 , -1 , 2 , String_Table["SKILL01"] , 2 )
						for i = 1 , 5 , 1 do
							cl_chack_CastSpell()
							Hate_X , Hate_Y , Hate_Z = Cl_Rand_HateList( 1 , 0 )
							if Hate_X ~= nil or Hate_Y ~= nil or Hate_Z ~= nil then
								CastSpellPos ( Boss_4 , Hate_X , Hate_Y , Hate_Z , skill_table[7][3] , skill_table[7][4] )
							end
						end
						skill_table[7][1] = 0
					end
					if skill_table[13][1] >= skill_table[13][2] then
						cl_chack_CastSpell()
						ScriptMessage( Boss_4 , -1 , 2 , String_Table["SKILL02"] , 2 )
						CastSpelllv ( Boss_4 , Boss_4 , skill_table[13][3] , skill_table[13][4] )
						sleep ( skill_table[13][5] )
						skill_table[13][1] = 0
					end
				elseif OrgId == 106550 then
					if skill_table[7][1] >= skill_table[7][2] then
						cl_chack_CastSpell()
						rand_skill = DW_Rand(100)  ----->有100個亂數去隨機一個值出來
						if ( rand_skill >= 1 and rand_skill <= 10) or( rand_skill >=21 and rand_skill <= 30 ) or
						   ( rand_skill >= 41 and rand_skill <= 50 ) or ( rand_skill >= 61 and rand_skill <= 70 ) or
						   ( rand_skill >= 81 and rand_skill <= 90 ) then      ------------>當隨機出來的值等於以上的亂數就施放第一招
						   CastSpelllv ( Boss_4 , AttackTarget , skill_table[7][3] , skill_table[7][4] )
						   sleep ( skill_table[7][5] )   --------->放玩法術後整個迴圈停兩秒
						elseif ( rand_skill >= 11 and rand_skill <= 20 ) or( rand_skill >= 31 and rand_skill <= 40 ) or
						   ( rand_skill >= 51 and rand_skill <= 60 ) or( rand_skill >= 70 and rand_skill <= 80 ) or
						   ( rand_skill >= 91 and rand_skill <= 100 ) then   ------------>當隨機出來的值等於以上的亂數就施放第二招
						   CastSpelllv ( Boss_4 , Boss_4 , skill_table[8][3] , skill_table[8][4] )----噴火
						   sleep ( skill_table[8][5] )   --------->放玩法術後整個迴圈停兩秒
						end
						skill_table[7][1] = 0
					end
					if skill_table[9][1] >= skill_table[9][2] then
						cl_chack_CastSpell()
						ScriptMessage( Boss_4 , -1 , 2 , String_Table["SKILL03"] , 2 )
						CastSpelllv ( Boss_4 , Boss_4 , skill_table[9][3] , skill_table[9][4] )
						sleep ( skill_table[9][5] )
						Cl_ACWB_Skill_499002( skill_table[10][3] , skill_table[10][4] , RoomID )
						skill_table[9][1] = 0
					end
					if skill_table[13][1] >= skill_table[13][2] then
						cl_chack_CastSpell()
						CastSpelllv ( Boss_4 , AttackTarget , skill_table[13][3] , skill_table[13][4] )
						sleep ( skill_table[13][5] )
						skill_table[13][1] = 0
					end
					if skill_table[15][1] >= skill_table[15][2] then
						ScriptMessage( Boss_4 , -1 , 2 , String_Table["MONSTER"] , 2 )
						Cl_WbBoss4_Skill_15()
						skill_table[15][1] = 0
					end
					if skill_table[20][1] >= skill_table[20][2] then
						cl_chack_CastSpell()
						Npc_number = table.getn(Npc_Table)
						for i = 1 , Npc_number , 1 do
							if CheckID( Npc_Table[i] )  == true and
								ReadRoleValue ( Npc_Table[i] , EM_RoleValue_IsDead ) ~= 1 then
								table.insert( Rand_Table , Npc_Table[i] )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
							end
						end
						rand_number = table.getn(Rand_Table)
						cl_chack_CastSpell()
						if rand_number > 0 then
							ScriptMessage( Boss_4 , -1 , 2 , String_Table["EAT_NPC"] , 2 )
							NPC_skill = DW_Rand(rand_number)  ----->有100個亂數去隨機一個值出來
							--flag_Npc = ReadRoleValue ( Rand_Table[NPC_skill] , EM_RoleValue_Register2 )
							Addbuff( Boss_4 , Buff_Table[1][1] , Buff_Table[1][2] , Buff_Table[1][3] )
							Cl_WBAC_CtarlForg_Move( Rand_Table[NPC_skill],Boss_4 )
							CastSpelllv ( Boss_4 , Rand_Table[NPC_skill] , skill_table[20][3] , skill_table[20][4] )
							sleep ( skill_table[20][5] )
						end
						Rand_Table = {}
						KillNpc = 1
						skill_table[20][1] = 0
					end
					--[[if skill_table[30][1] >= skill_table[30][2] then
						cl_chack_CastSpell()
						ScriptMessage( Boss_4 , -1 , 2 , String_Table["SKILL04"] , 2 )
						CastSpelllv ( Boss_4 ,Boss_4 , skill_table[30][3] , skill_table[30][4] )
						sleep ( skill_table[30][5] )
						skill_table[30][1] = 0
					end]]--
				end
			end
		elseif HateListCount( Boss_4 ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = 0
				end
				ScriptMessage( Boss_4 , -1 , 2 , String_Table["RESET"] , 2 )
				if OrgId == 106550 then
					rand_number = table.getn(Npc_Table)
					for i = 1 , rand_number , 1 do
						if Npc_Table[i] ~= nil then
							delobj ( Npc_Table[i] )
						end
					end
				end
				Npc_Table = {}
				Rand_Table = {}
				WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 3 )
				CombatBegin = 0
				delobj ( Boss_4 )
			end
		end
	end
end
function Cl_WBAC_CtarlForg_Move(NPC,Boss_4)
	local Boss_4 = OwnerID();
	local RoomID = ReadRoleValue( Boss_4 , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Tx = ReadRoleValue( Boss_4, EM_RoleValue_X );
	local Tz = ReadRoleValue( Boss_4, EM_RoleValue_Z );
	local Od = ReadRoleValue( NPC, EM_RoleValue_Dir );
	local Ox = ReadRoleValue( NPC, EM_RoleValue_X );
	local Oz = ReadRoleValue( NPC, EM_RoleValue_Z );
	local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  
	local deltaDir = (Dir-Od);
	local X , Y , Z = kg_GetPosRX( NPC , nil , -40 , 0 , deltaDir )
	setpos( Boss_4 , X , Y , Z , Od );
end
function Cl_ACWB_Skill_499007( SkillID , SkillLv , RoomID )
	local Boss_4 = OwnerID()
	local Hid_eBallID = 106608
	local Hate_X,Hate_Y,Hate_Z = Cl_Rand_HateList( 1 , 0 )
	if Hate_X ~= nil and Hate_Y ~= nil and Hate_Z ~= nil then
		local HideBall = Cl_CreateObj_ForHideBall( Hid_eBallID , Hate_X , Hate_Y , Hate_Z , RoomID )
		WriteRoleValue( HideBall , EM_RoleValue_Livetime, 5 )  --存活時間
		SetModeEx( Boss_4 , EM_SetModeType_Move , true ) ---移動	(否)
		CastSpelllv ( Boss_4 , HideBall , SkillID , SkillLv ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
	end
end
function Cl_ACWB_Skill_499002( SkillID , SkillLv , RoomID )
	local Boss_4 = OwnerID()
	local Hid_eBallID = 106608
	local HideBall = {}
	local Hate_X,Hate_Y,Hate_Z = 0
	local Hate_Table = DW_HateRemain( 0 )
	local Hate_rand = table.getn(Hate_Table)
	local Hate_number = DW_Rand(Hate_rand)
	local for_Num = 0
	if Hate_rand < 3 then
		for_Num = 1
	elseif Hate_rand >= 3 then
		for_Num = Hate_rand - 1 
	end
	for i = 1 , for_Num , 1 do
		Hate_number = DW_Rand(Hate_rand)
		if CheckID( Hate_Table[Hate_number] ) == true then
			Hate_X,Hate_Y,Hate_Z = Cl_Read_OwnerXYZ(Hate_Table[Hate_number])
			if  Hate_X ~= nil and Hate_Y ~= nil and Hate_Z ~= nil then	
				HideBall[i] = Cl_CreateObj_ForHideBall( Hid_eBallID , Hate_X , Hate_Y , Hate_Z , RoomID )
				Addbuff (  HideBall[i] , 622248 , 0 , -1 ) ---兔子變大
				WriteRoleValue( HideBall[i] , EM_RoleValue_Livetime, 3 )  --存活時間
				CallPlot( HideBall[i] , "Cl_ACWB_Skill499004_ForBall" , 0 ) ---塞入BOSS的戰鬥給他
			end
		end
	end
end
function Cl_ACWB_Skill499004_ForBall()
	local OwnerID = OwnerID()
	sleep ( 15 )
	CastSpelllv ( OwnerID , OwnerID , 499004 , 6 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
end
function Cl_HardBoss_NotDead()
	local Boss_4 = OwnerID()
	local RoomID = ReadRoleValue ( Boss_4 , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss_4 , EM_RoleValue_PID )
	local FunctionID = {}
	FunctionID["P3Boss4"] = "Cl_ACWB_P3Boss4_Flght_1"
	local String_Table = {}
	String_Table["CHANG"] = "[SC_ACWB_BOSS4_CHANG]"
	ScriptMessage( Boss_4 , -1 , 2 , String_Table["CHANG"] , 2 )
	local ObjID = 106550
	local Boss_X = ReadRoleValue ( Boss_4 , EM_RoleValue_X)
	local Boss_Y = ReadRoleValue ( Boss_4 , EM_RoleValue_Y)
	local Boss_Z = ReadRoleValue ( Boss_4 , EM_RoleValue_Z)
	local Boss = CreateObj( ObjID , Boss_X, Boss_Y , Boss_Z , 0 , 1 )  ------------生出魔術帽
	WriteRoleValue ( Boss , EM_RoleValue_PID , ctarlAI ) ---
	WriteRoleValue ( ctarlAI , EM_RoleValue_Register5 , Boss )
	AddToPartition( Boss , RoomID )
	local AttackTarget = ReadRoleValue( Boss_4 , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
	SetAttack( Boss , AttackTarget )
	if CheckBuff( Boss_4 , 622092 ) == true then
		Addbuff (  boss , 622092 , 0 , -1 ) ---兔子變大
	end
	BeginPlot( Boss , FunctionID["P3Boss4"] , 0 ) ---塞入BOSS的戰鬥給他
	local Play_Table = SearchRangePlayer ( ctarlAI , 400 )
	local Play_Num = table.getn( Play_Table )
	for i = 0 , Play_Num-1 , 1 do
		CancelBuff(	Play_Table[i], 621741 )
	end
	delobj ( Boss_4 )
end
function Cl_HardBoss_IsDead()
	local Boss_4 = OwnerID()
	local ctarlAI = ReadRoleValue ( Boss_4 , EM_RoleValue_PID )
	local String_Table = {}
	String_Table["DEAD"] = "[SC_ACWB_BOSS4_DEAD]"
	ScriptMessage( Boss_4 , -1 , 2 , String_Table["DEAD"] , 2 )
	WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 2 ) ---
end
function Cl_ACWB_P3_Old_Npc()
	local OwnerID = OwnerID()
	local Target = TargetID()
	local FunctionID = {}
	FunctionID["ToPlayer"] = "Cl_ToPlayer_skill"
	local String_Table = {}
	String_Table["SetSkill"] = "[SC_ACWB_BOSS4_SETSKILL]"
	if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 0 then
		LoadQuestOption( OwnerID )
		AddSpeakOption( OwnerID , Target , String_Table["SetSkill"] , FunctionID["ToPlayer"] , 0 )
	end
end
function Cl_ToPlayer_skill()
	local OwnerID = OwnerID()
	local Target = TargetID()
	AdjustFaceDir( Target , OwnerID , 0 )
	CloseSpeak( OwnerID )
	SysCastSpelllv ( Target , OwnerID , 498919 , 0 )----對當前目標釋放一個巨大傷害
end
function Cl_CreateObj_ForBoss( OrgID , FlagID , Flag , FunctionID , Hard )
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local NpcID = CreateObjByFlag( OrgID , FlagID , Flag , 1 ) ------------誰是boss要在哪裡產生
	AddToPartition ( NpcID , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( NpcID , EM_RoleValue_PID , ctarlAI ) ---
	BeginPlot( NpcID , FunctionID , 0 ) ---塞入BOSS的戰鬥給他
	return NpcID
end
function Cl_CreateObj_Npc( OrgID , FlagID , Flag , FunctionID )
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local NpcID = CreateObjByFlag( OrgID , FlagID , Flag , 1 ) ------------誰是boss要在哪裡產生
	local Magic_NpcID = 120101
	if OrgID == Magic_NpcID then
		SetModeEx( NpcID , EM_SetModeType_Strikback, false ) ---反擊(否)
		SetModeEx( NpcID, EM_SetModeType_Move, false ) ---移動	(否)
		SetModeEx( NpcID , EM_SetModeType_Searchenemy, false )--索敵(否)
		SetModeEx( NpcID , EM_SetModeType_Mark, false )			---可點選(是)
		SetModeEx( NpcID , EM_SetModeType_ShowRoleHead, false ) 		---頭像框(是)
		SetModeEx( NpcID , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
		WriteRoleValue ( NpcID , EM_RoleValue_PID , OwnerID ) ---
		AddToPartition ( NpcID , RoomID ) ----物件加入場景,例行公事
		CallPlot( NpcID , FunctionID , 0 ) ---塞入BOSS的戰鬥給他
	else
		AddToPartition ( NpcID , RoomID ) ----物件加入場景,例行公事
	end
	return NpcID
end
function Cl_ACWB_CheckOrgID()
	local OwnerID = OwnerID()
	local Target = TargetID()
	local String_Table = {}
	String_Table["Target_Not"] = "[SC_102706_13]"
	if ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106555 then
		return true
	else
		ScriptMessage( OwnerID , OwnerID , 1 , String_Table["Target_Not"] , 0 )
		return false
	end
end
function Cl_ACWB_BossSkill_CheckID()
	local OwnerID = OwnerID()
	local Target = TargetID()
	local String_Table = {}
	if ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 120101 then
		return false
	else
		return true
	end
end
function Cl_ACWB_CheckTargetID()
	local OwnerID = OwnerID()
	local Target = TargetID()
	local String_Table = {}
	if ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 120101 then
		return true
	else
		return false
	end
end
function cl_WB_MagicToFight()
	local Magic_Npc = OwnerID() ----我叫做AI
	local PaRorguez = ReadRoleValue( Magic_Npc , EM_RoleValue_PID ) ----紀錄讀取到的層數
	local skillTime = 7
	local CombatBegin = 0
	local skill_Num = 498917
	SetPlot( Magic_Npc, "dead","cl_WB_MagicTodead", 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	sysCastSpelllv ( Magic_Npc , PaRorguez , skill_Num , 0 )----前方扇形
	while 1 do
		sleep ( 10 )
		if CheckID( PaRorguez )  == true and 
			ReadRoleValue( PaRorguez , EM_RoleValue_IsDead  ) == 0 then
				CastSpelllv ( Magic_Npc , PaRorguez , skill_Num , 0 )----前方扇形
		elseif CheckID( PaRorguez )  ~= true then
			delobj ( Magic_Npc )
		end
	end
end
function Cl_CancelBuff_621856() ---清除BUFF
	local OwnerID = OwnerID()
	local Target = TargetID()
	if CheckBuff( Target , 621856 ) == true then
		CancelBuff_NoEvent( Target , 621856 ) ---清除BUFF
		return true
	elseif CheckBuff( Target , 621856 ) == false then
		return false
	end
end
function Cl_WbBoss4_Skill_15()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local Ball = {}
	hset_table = DW_HateRemain(0)
	local hset = table.getn(hset_table)
	--say ( OwnerID , "hset="..hset)
	if hset > 1 then
		hset = hset / 2
		--say ( OwnerID , "hset="..hset)
	end
	local play_num = math.floor(hset)
	--say ( OwnerID , "play_num="..play_num)
	local paly_Table = {}
	if play_num >= 1 then
		for i = 1 , play_num , 1 do ----抓6個玩家
			Rand_Num = DW_Rand(hset)
			if hset >= 1 then
				table.insert( paly_Table , hset_table[Rand_Num] )  ---將抓取到的玩家塞入一個新的TABLE
				table.remove ( hset_table , Rand_Num )  ---抓到後移除掉本來的
				hset = table.getn(hset_table) -----然後重取一次數量
			end
		end
	end
	local player = table.getn(paly_Table)
	local flagID = DW_Rand(10)
	for i = 1 , player , 1 do
		flagID = DW_Rand(15)
		Ball[i] = CreateObjByFlag( 106716 , 781112, flagID , 1 )  ------------生出魔術帽
		SetModeEx( Ball[i] , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( Ball[i] , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( Ball[i] , EM_SetModeType_Strikback, false) ---反擊(否)
		WriteRoleValue( Ball[i] , EM_RoleValue_Livetime , 10 )  --存活時間
		AddToPartition( Ball[i] , RoomID )
		CastSpelllv ( Ball[i] , Ball[i] , 496764 , 0 )----前方扇形
	end
	sleep ( 20 )
	local Ball_Num = table.getn(Ball)
	for i = 1 , Ball_Num , 1 do
		SetModeEx( Ball[i] , EM_SetModeType_Move, true ) ---移動	(否)
		CallPlot( Ball[i] , "Cl_Wb_Boss4_106716" , paly_Table[i] )
	end
end
function Cl_Wb_Boss4_106716(player)
	local OwnerID = OwnerID()
	--say ( player , "player")
	SetAttack( OwnerID , player )
	sysCastSpelllv ( player , OwnerID , 850054 , 0 )----前方扇形
	SetPlot( OwnerID , "range","Cl_Wb_Boss4_106716_range" , 30 )
end
function Cl_Wb_Boss4_106716_range()
	local OwnerID = OwnerID()
	local Target = TargetID()
	if ReadRoleValue ( OwnerID , EM_RoleValue_VOC ) ~= 0 and
		ReadRoleValue ( OwnerID , EM_RoleValue_IsDead ) ~= 1 then
		CastSpelllv ( Target , Target , 850055 , 0 )----前方扇形
		sleep ( 10 )
		delobj ( Target )
	end
end
function cl_WB_MagicTodead()
	local OwnerID = OwnerID()
	local PaRorguez = ReadRoleValue( OwnerID , EM_RoleValue_PID ) ----紀錄讀取到的層數
	local BuffID = ReadRoleValue( PaRorguez , EM_RoleValue_Register9 ) ----紀錄讀取到的層數
	WriteRoleValue ( PaRorguez , EM_RoleValue_Register9 , BuffID-1 )
end