function Cl_Zone23_Boss7_Begin()
	local OwnerID = OwnerID()
	--say ( OwnerID , "OwnerID="..OwnerID)
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 937 or ZoneID == 146 then
		local CtarlAI = Cl_CreateObj_ForFlag( 106732 , 781036 , 0 , RoomID )
		CallPlot( CtarlAI , "cl_Zone23_Boss7_CtarlAI" , 0 )
	end
end
function Cl_Z23_Boss7_NpcObj( Value )  ---裝所有NPC編號的TABLE
	--1=BOSS 2=表演用BOSS 3=元素錨點 4=元素蟻 5=BOSS用透明球
	local Npc_Table = { 106414 , 119669 , 106654 , 106653 , 106449 ,106655}
	if Value == nil then
		return Npc_Table
	else
		return Npc_Table[Value]
	end
end
function Cl_Z23_Boss7_SkillTable(Value_1,Value_2)
	local Skill_Table = {}
	Skill_Table["Skill_P1_1"] = { 0 , 9 , 498498 , 10 , "[]" }
	Skill_Table["AnchorSkill_1"] = { 0 , 0 , 498500 , 10 , "[]" }
	Skill_Table["AnchorToAnt"] = { 0 , 0 , 850008 , 10 , "[]" }
	Skill_Table["AntDeadSkill"] = { 0 , 0 , 498504 , 10 , "[]" }
	Skill_Table["Skill_P1_2"] = { 0 , 13 , 498506 , 10 , "[]" } 
	Skill_Table["Skill_P2_1"] = { 0 , 0 , 498502 , 60 , "[]" }
	Skill_Table["AntSkill"] = { 0 , 0 , 850003 , 30 , "[]" }
	if Value_1 == nil then
		return Skill_Table
	else
		if Value_2 == nil then
			return Skill_Table[Value_1]
		else
			return Skill_Table[Value_1][Value_2]
		end
	end
end
function Cl_Z23_Boss7_Skill_Lv(Value_1)
	local Skill_Lv = {}
	Skill_Lv[498500] = 80
	Skill_Lv[498507] = 40
	Skill_Lv[498504] = 70
	Skill_Lv[850002] = 30
	Skill_Lv[498501] = 70
	Skill_Lv[498502] = 15
	Skill_Lv[850003] = 3
	Skill_Lv[498503] = 0
	Skill_Lv[850008] = 80
	Skill_Lv[498505] = 40
	if Value_1 == nil then
		return Skill_Lv
	else
		return Skill_Lv[Value_1]
	end
end
function Cl_Zone23_Boss7_String(Value)  --ScriptMessage( CtarlAI , -1 , 2 , Cl_Zone23_Boss7_String("Change_P1") , 2 )SC_BLACK_NPC_TACK_01
	local String = {}
	String["Energy"] = "[SC_ZONE23_BOSS7_ENERGY_BEGIN]" --能量傳導中
	String["CreateObj"] = "[SC_ZONE23_BOSS7_NPC_CREATE]" --
	String["BossDead"] = "[SC_ZONE23_BOSS7_NPC_DEAD]"
	String["BossDead_1"] = "[SC_ZONE23_BOSS7_NPC_DEAD_01]"
	String["BossFight"] = "[SC_ZONE23_BOSS7_FIGHT]"
	String["BossReset"] = "[SC_ZONE23_BOSS7_RESET]"
	String["CreateAnt"] = "[SC_ZONE23_BOSS7_P3]"
	String["Skill_1"] = "[SC_ZONE23_BOSS7_SKILL01]"
	String["Skill_2"] = "[SC_ZONE23_BOSS7_SKILL02]"
	String["Change_P2"] = "[SC_ZONE23_BOSS7_P2]"
	String["Change_P2_1"] = "[SC_ZONE23_BOSS7_SKILL06]"
	String["Change_P1"] = "[SC_ZONE23_BOSS7_SKILL03]"
	String["Energy_Over"] = "[SC_ZONE23_BOSS7_SKILL04]"
	String["Energy_Not"] = "[SC_ZONE23_BOSS7_ENERGY_NOT]"
	String["cazry"] = "[SC_ZONE23_BOSS7_CARZY]"
	if Value == nil then
		return String
	elseif Value ~= nil  then
		return String[Value]
	end
end
function Cl_Zone23_Boss7_EnergyLocal()
	local Energy = OwnerID()
	local RoomID = ReadRoleValue( Energy , EM_RoleValue_RoomID )
	Lua_Cl_Zone23_Boss7_Setanbofei = Lua_Cl_Zone23_Boss7_Setanbofei or {}
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID] = Lua_Cl_Zone23_Boss7_Setanbofei[RoomID] or {}
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Energy"] = Energy
end
function Cl_Zone23_Boss7_CtarlAI()
	sleep ( 50 )
	local CtarlAI = OwnerID()
	local RoomID = ReadRoleValue( CtarlAI , EM_RoleValue_RoomID )
	ScriptMessage( CtarlAI , -1 , 2 , Cl_Zone23_Boss7_String("CreateObj") , 2 )
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["CtarlAI"] = CtarlAI
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] = 0
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage_2"] = 0
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"] = {}
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"] = {}
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"] = {}
	local Boss_ShowNpc = CreateObjByFlag( Cl_Z23_Boss7_NpcObj(2) , 781036 , 1 , 1 )
	MoveToFlagEnabled( Boss_ShowNpc , false ) ---系統內建的路徑關掉
	AdjustFaceDir ( Boss_ShowNpc , Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Energy"] , 0 )
	AddToPartition( Boss_ShowNpc , RoomID )
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Boss"] = Boss_ShowNpc
	SetPlot( Boss_ShowNpc, "touch" , "cl_Zone23_Boss7_touch", 30 )
	local Boss = 0
	local Boss_cazry = 0
	local cazry_Time = 480
	local Skill = Cl_Z23_Boss7_SkillTable(nil,nil)
	local Skilllv = Cl_Z23_Boss7_Skill_Lv(nil)
	local Element_Flow = 0
	local Ant_Time = 0
	local Anchor_X , Anchor_Y , Anchor_Z = 0
	local AntID = 0
	local Rand_X = 0
	local Rand_Z = 0
	local Open_Door = 0
	local front_door = 0
	while Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] ~= 4 do
		Boss = Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Boss"]
		if Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] == 1 then
			if Boss_cazry == 0 then
				cazry_Time = cazry_Time - 1
				if cazry_Time <= 0 then
					ScriptMessage( CtarlAI , -1 , 2 , Cl_Zone23_Boss7_String("cazry") , 2 )
					Addbuff (  OwnerID() , 622038 , 0 , -1 ) 
					Boss_cazry = 1
				end
			end
			if Open_Door == 0 then
				front_door = Cl_CreateObj_ForFlag( 106235 , 781036 , 91 , RoomID )
				SetModeEx ( front_door , EM_SetModeType_Obstruct, true ) 		---阻擋(是)
				Open_Door = 1
			end
			if Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage_2"] == 0 then
				Element_Flow = Element_Flow + 1
			end
			if Element_Flow >= 12 then
				if table.getn( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"] ) >= 1 then
					for i = 1 , table.getn( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"] ) , 1 do
						if CheckID ( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"][i] ) == true then
							sysCastSpelllv ( Boss , Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"][i] , Skill["AntDeadSkill"][3] , Skilllv[Skill["AntDeadSkill"][3]] )
						end
					end
				end
				Element_Flow = 0
			end
			if table.getn( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"] ) < 12 then
				Ant_Time = Ant_Time + 1
				if Ant_Time >= 12 then
					ScriptMessage( CtarlAI , -1 , 2 , Cl_Zone23_Boss7_String("CreateAnt") , 2 )
					Anchor_X , Anchor_Y , Anchor_Z = Cl_Read_OwnerXYZ( CtarlAI )
					Rand_X = math.random( -150, 150 )
					Rand_Z = math.random( -150, 150 )
					AntID = CreateObj( Cl_Z23_Boss7_NpcObj(4) , Anchor_X+Rand_X , Anchor_Y , Anchor_Z+Rand_Z , 0 , 1 )
					AddToPartition( AntID , RoomID )
					CallPlot( AntID , "Cl_Z23_Boss7_AntID_Ai" , RoomID )
					table.insert( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"] , AntID )
					Ant_Time = 0
				end
			end
				
		elseif Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] == 2 then
			DebugMsg( 0 , 0 , "stage="..Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] )
			delobj ( front_door )
			Cl_Z23_Boss7_ReSet_Global_Variable(RoomID)
			Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] = 4
		elseif Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] == 3 then
			DebugMsg( 0 , 0 , "stage="..Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] )
			ScriptMessage( CtarlAI , -1 , 2 , Cl_Zone23_Boss7_String("BossReset") , 2 )
			Cl_Z23_Boss7_ReSet_Global_Variable(RoomID)
			Boss_cazry = 0
			cazry_Time = 480
			Element_Flow = 0
			Open_Door = 0
			delobj( Boss )
			delobj ( front_door )
			sleep ( 30 )
			Boss =  CreateObjByFlag( Cl_Z23_Boss7_NpcObj(1) , 781036 , 1 , 1 )
			AddToPartition( Boss , RoomID )
			Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Boss"] = Boss
			CallPlot( Boss , "cl_Zone23_Boss7_Fight" , RoomID )
			Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] = 0
		end
		sleep ( 10 )
	end
	DebugMsg( 0 , 0 , "stage="..Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] )
end
function cl_Zone23_Boss7_touch() ----NPC表演對話後產生真正的BOSS
	local play = OwnerID()
	local Boss_ShowNPC = TargetID()
	local RoomID = ReadRoleValue( Boss_ShowNPC , EM_RoleValue_RoomID )
	if ReadRoleValue ( Boss_ShowNPC , EM_RoleValue_Register1 ) ~= 1 then
		WriteRoleValue( Boss_ShowNPC , EM_RoleValue_Register1 , 1 )
		SetIdleMotion ( Boss_ShowNPC , ruFUSION_ACTORSTATE_NORMAL )
		sleep ( 10 )
		AdjustFaceDir ( Boss_ShowNPC , play , 0 )
		sleep ( 20 )
		Yell ( Boss_ShowNPC , "[SC_ZONE23_BOSS7_NPC_01]" ,3)
		sleep ( 30 )
		Yell ( Boss_ShowNPC , "[SC_ZONE23_BOSS7_NPC_02]" ,3)
		sleep ( 30 )
		Yell ( Boss_ShowNPC , "[SC_ZONE23_BOSS7_NPC_03]",3 )
		sleep ( 30 )
		local Boss_Npc = CreateObjByFlag( Cl_Z23_Boss7_NpcObj(1) , 781036 , 1 , 1 )  ------------生出魔術帽
		AddToPartition( Boss_Npc , RoomID )
		Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Boss"] = Boss_Npc
		Hide ( Boss_ShowNPC )
		SetModeEx( Boss_ShowNPC , EM_SetModeType_Mark, false)			---可點選(是)
		SetModeEx( Boss_ShowNPC , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
		CallPlot( Boss_Npc , "cl_Zone23_Boss7_Fight" , RoomID )
		SetAttack( Boss_Npc , play )
		delobj ( Boss_ShowNPC )
	end
end
function cl_Zone23_Boss7_Fight(RoomID)
	local BossID = OwnerID()
	local CtarlAI =  Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["CtarlAI"]
	local AttackTarget = 0
	local CombatBegin = 0
	local Skill_Table = Cl_Z23_Boss7_SkillTable(nil)
	local SkillLV = Cl_Z23_Boss7_Skill_Lv(nil)
	local p2time = 0
	SetPlot( BossID, "dead","cl_Z23_Boss7_dead", 0 ) 
	LockHP( BossID , ReadRoleValue( BossID , EM_RoleValue_MaxHP )*0.75 , "Cl_Z23_Boss7_LockBossHP" )
	CallPlot( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Energy"] , "Cl_Z23_Boss7_EnergyAI" , 0 )
	--local P_2 = 0
	while Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] ~= 4 do
		sleep ( 10 )
		p2time = p2time +1
		AttackTarget = ReadRoleValue( BossID , EM_RoleValue_AttackTargetID )
		if HateListCount( BossID ) ~= 0 then
			if CombatBegin == 0 then
				ScriptMessage( BossID , -1 , 2 , Cl_Zone23_Boss7_String("BossFight") , 2 )
				Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] = 1
				CombatBegin = 1
			end
			if CombatBegin == 1 then
			
				if CheckBuff( BossID , 622045 ) ~= true then
					if Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage_2"] == 2 then
						--Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"] = {}
						ScriptMessage( BossID , -1 , 2 , Cl_Zone23_Boss7_String("Change_P1") , 2 )
						SetModeEx( BossID , EM_SetModeType_Move , true )
						Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage_2"] = 0
					end
					for num , skill in pairs(skill_table) do
						skill_table[num][1] = skill_table[num][1] + 1
					end
					if skill_table["Skill_P1_1"][1] >= skill_table["Skill_P1_1"][2] then
						cl_chack_CastSpell()
						if table.getn(Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"]) < 8 then
							ScriptMessage( BossID , -1 , 2 , Cl_Zone23_Boss7_String("Skill_1") , 2 )
							CastSpelllv( BossID , BossID , skill_table["Skill_P1_1"][3] , 0 )
						end
						sleep ( skill_table["Skill_P1_1"][4] )
						skill_table["Skill_P1_1"][1] = 0
					end
					if skill_table["Skill_P1_2"][1] >= skill_table["Skill_P1_2"][2] then
						cl_chack_CastSpell()
						ScriptMessage( BossID , -1 , 2 , Cl_Zone23_Boss7_String("Skill_2") , 2 )
						CastSpelllv( BossID , BossID , skill_table["Skill_P1_2"][3] , 0 )
						sleep ( skill_table["Skill_P1_2"][4] )
						skill_table["Skill_P1_2"][1] = 0
					end
				else
					if Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage_2"] == 0 then
						SetModeEx( BossID , EM_SetModeType_Move, false)
						SetPosByFlag( BossID , 781036 , 0 )
						Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage_2"] = 1
					end
					cl_chack_CastSpell()
					if Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage_2"] == 1 then
						ScriptMessage( BossID , -1 , 2 , Cl_Zone23_Boss7_String("Change_P2_1") , 2 )
						Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage_2"] = 2
					end
					sleep ( 10 )
					if p2time % 4 == 0 then
						CastSpelllv( BossID , BossID , skill_table["Skill_P2_1"][3] , SkillLV[skill_table["Skill_P2_1"][3]] )
					end
				end
			end
		elseif HateListCount( BossID ) == 0 then
			if CombatBegin == 1 then
				Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] = 3
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = 0
				end
				CombatBegin = 0
			end
		end
	end
end
function Cl_Z23_Boss7_LockBossHP()
	local BossID = OwnerID()
	local Boss_Hp = Cl_ReadRoleNowHp( BossID )
	if Boss_Hp <= 75 and Boss_Hp >= 51 then
		CallPlot( BossID , "Cl_Z23_Boss7_HPInSetSkill" , 0 )
		LockHP( BossID , ReadRoleValue( BossID , EM_RoleValue_MaxHP )*0.5 , "Cl_Z23_Boss7_LockBossHP" )
	elseif Boss_Hp <= 50 and Boss_Hp >= 26 then
		CallPlot( BossID , "Cl_Z23_Boss7_HPInSetSkill" , 0 )
		LockHP( BossID , ReadRoleValue( BossID , EM_RoleValue_MaxHP )*0.25 , "Cl_Z23_Boss7_LockBossHP" )
	elseif Boss_Hp <= 25 then
		CallPlot( BossID , "Cl_Z23_Boss7_HPInSetSkill" , 0 )
		LockHP( BossID , ReadRoleValue( BossID , EM_RoleValue_MaxHP )*0.01 , "CL_Zone23_Boss7_KillBoss" )
	end
end
function Cl_Z23_Boss7_HPInSetSkill()
	local BossID = OwnerID()
	ScriptMessage( BossID , -1 , 2 , Cl_Zone23_Boss7_String("Change_P2") , 2 )
	cl_chack_CastSpell()
	CastSpelllv ( BossID , BossID , 498501 , Cl_Z23_Boss7_Skill_Lv(498501) )
end
function cl_Z23_Boss7_dead()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	local Npc_X, Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(Boss)
	local QuestNpc = CreateObj( 120754 , Npc_X, Npc_Y , Npc_Z , 0 , 1 )  ------------生出魔術帽
	SetModeEx( QuestNpc , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( QuestNpc , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( QuestNpc , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( QuestNpc , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
	AddToPartition( QuestNpc , RoomID )
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["stage"] = 2
end
function Cl_Z23_Boss7_Skill_P1_1()
	local BossID = OwnerID()
	local RoomID = ReadRoleValue( BossID , EM_RoleValue_RoomID )
	local CtarlAI = Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["CtarlAI"]
	local ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ( ctarlAI )
	local Rand_X = math.random( -150, 150 )
	local Rand_Z = math.random( -150, 150 )
	local Anchor_Ball = Cl_CreateObj_ForHideBall( Cl_Z23_Boss7_NpcObj(3) , ctarl_X+Rand_X , ctarl_Y , ctarl_Z+Rand_Z , RoomID )
	table.insert( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"] , Anchor_Ball )
	local Skill = Cl_Z23_Boss7_SkillTable( "AnchorSkill_1" , 3 )
	CallPlot( Anchor_Ball , "Cl_Z23_Boss7_Anchor_setCollision" , RoomID )
	sysCastSpelllv( Anchor_Ball , Anchor_Ball , Skill , Cl_Z23_Boss7_Skill_Lv( Skill ) )
end
function Cl_Z23_Boss7_Anchor_setCollision()
	SetPlot( OwnerID(), "Collision","Cl_Z23_Boss7_Anchor_Collision", 0 )
end
function Cl_Z23_Boss7_Anchor_Collision()
	local PlayerID = OwnerID()
	if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
		local AnchorID = TargetID()
		local Skill = Cl_Z23_Boss7_SkillTable("AnchorToAnt",3)
		local RoomID = ReadRoleValue( PlayerID , EM_RoleValue_RoomID )
		sysCastSpelllv( AnchorID , AnchorID , Skill , Cl_Z23_Boss7_Skill_Lv( Skill ) )
		if table.getn( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"] ) < 12 then
			local Anchor_X , Anchor_Y , Anchor_Z = Cl_Read_OwnerXYZ( AnchorID )
			local AntID = CreateObj( Cl_Z23_Boss7_NpcObj(4) , Anchor_X , Anchor_Y , Anchor_Z , 0 , 1 )
			AddToPartition( AntID , RoomID )
			CallPlot( AntID , "Cl_Z23_Boss7_AntID_Ai" , RoomID )
			table.insert( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"] , AntID )
			SetAttack( AntID , AnchorID )
		end
		sleep ( 10 )
		for i = 1 , table.getn(Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"]) , 1 do
			if Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"][i] == AnchorID then
				table.remove ( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"] , i )
				delobj ( AnchorID )
				return
			end
		end
	end
end
function Cl_Z23_Boss7_AntID_Ai(RoomID)
	local AntID = OwnerID()
	local Skill = Cl_Z23_Boss7_SkillTable( "AntSkill" , 3 )
	local skilltime = 5
	local HateLis = {}
	local Hate_Rand = 0
	local Hate_Num = 0
	SetPlot( AntID, "dead","cl_Z23_Boss7_Ant_dead", 0 )
	while ReadRoleValue ( AntID , EM_RoleValue_Register1 ) ~= 1 do
		skilltime = skilltime + 1
		if skilltime >= 12 then
			HateLis = Cl_RandTarget_HateList( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Boss"] )
			Hate_Num = table.getn(HateLis)
			Hate_Rand = DW_Rand(Hate_Num)
			if HateLis[Hate_Rand] ~= nil then
				CastSpelllv( AntID , HateLis[Hate_Rand] , Skill , Cl_Z23_Boss7_Skill_Lv( Skill ) )
			end
			skilltime = 0
			sleep(110)
		end
		sleep ( 10 )
	end
end
function cl_Z23_Boss7_Ant_dead()  --
	local AntID = OwnerID()
	local RoomID = ReadRoleValue( AntID , EM_RoleValue_RoomID )
	MagicInterrupt( AntID )
	WriteRoleValue ( AntID , EM_RoleValue_Register1 , 1 )
	local Anchor_X , Anchor_Y , Anchor_Z = Cl_Read_OwnerXYZ( AntID , nil )
	local HideBall = Cl_CreateObj_ForHideBall( Cl_Z23_Boss7_NpcObj(6) , Anchor_X , Anchor_Y , Anchor_Z , RoomID )
	AddToPartition( HideBall , RoomID )
	CallPlot( HideBall , "Cl_Z23_Boss7_AntID_DeadAi" , 3 )
	for i = 1 , table.getn(Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"]) , 1 do
		if Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"][i] == AntID then
			table.remove ( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"] , i )
			if table.getn( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"]) < 12 then
				table.insert( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"] , AntID )
				PlayMotionex ( AntID , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				Cl_EM_SetModeType( AntID , false , false , false , false , false , false , true , false , true )
				return false
			else
				delobj ( AntID )
			end
		end
	end
end
function Cl_Z23_Boss7_AntID_DeadAi()
	sysCastSpelllv( OwnerID() , OwnerID() , 498505 , Cl_Z23_Boss7_Skill_Lv( 498505 ) )
	sleep ( 20 )
	delobj ( OwnerID() )
end
function CL_Zone23_Boss7_KillBoss()
	local OwnerID = OwnerID()
	CallPlot( OwnerID , "Cl_Zone23_Boss7_PlayerVictory" , 0 )
end
function Cl_Zone23_Boss7_PlayerVictory()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	Addbuff (  OwnerID , 502707 , 0 , -1 )
	MagicInterrupt( OwnerID )
	local Hate_Table = DW_HateRemain( 0 )
	local Hate_rand = table.getn(Hate_Table)
	SetModeEx( OwnerID , EM_SetModeType_Move, false)
	SetModeEx( OwnerID , EM_SetModeType_Searchenemy, false)
	SetModeEx( OwnerID , EM_SetModeType_Fight, false)
	ScriptMessage( OwnerID , -1 , 2 , Cl_Zone23_Boss7_String("BossDead") , 2 )
	sleep ( 20 )
	sysCastSpelllv ( OwnerID , OwnerID , 850003 , 0 )
	ScriptMessage( OwnerID , -1 , 2 , Cl_Zone23_Boss7_String("BossDead_1") , 2 )
	sleep ( 30 )
	SetModeEx( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Energy"] , EM_SetModeType_Mark, false )
	Addbuff (  OwnerID , 622046 , 0 , -1 )
	for i = 1 , Hate_rand , 1 do
		if Hate_Table[i] ~= nil then
			if CheckID ( Hate_Table[i] ) == true then
				LockHP( OwnerID , 0 , "" )
				KillID ( Hate_Table[i] , OwnerID )
				return
			end
		end
	end
	SetModeEx( OwnerID , EM_SetModeType_Move, true ) ---移動	(否)
	SetModeEx( OwnerID , EM_SetModeType_Searchenemy, true )--索敵(否)
	SetModeEx( OwnerID , EM_SetModeType_Fight, true ) ---可砍殺(是)
end
function Cl_Z23_Boss7_ReSet_Global_Variable(RoomID)
	for i = 1 , table.getn(Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"]) , 1 do
		if CheckID ( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"][i] ) == true then
			delobj ( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"][i] )
		end
	end
	for i = 1 , table.getn(Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"]) , 1 do
		if CheckID ( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"][i] ) == true then
			delobj ( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"][i] )
		end
	end
	for i = 1 , table.getn(Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"]) , 1 do
		if CheckID ( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"][i] ) == true then
			delobj ( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"][i] )
		end
	end
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Ant_Dead"] = {}
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Anchor"] = {}
	Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Element_Ant"] = {}
end
function Cl_Z23_Boss7_Skill_P1_2()
	local BossID = OwnerID()
	local RoomID = ReadRoleValue( BossID , EM_RoleValue_RoomID )
	local CtarlAI = Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["CtarlAI"]
	local ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ( ctarlAI )
	local Rand_X = math.random( -200, 200 )
	local Rand_Z = math.random( -200, 200 )
	local hideBall = Cl_CreateObj_ForHideBall( Cl_Z23_Boss7_NpcObj( 5 ) , ctarl_X , ctarl_Y , ctarl_Z , RoomID )
	sysCastSpelllv( hideBall , hideBall , 498507 , Cl_Z23_Boss7_Skill_Lv(498507) )
	CallPlot( hideBall , "Cl_Z23_Boss7_hideBallSkill" , RoomID )
end
function Cl_Z23_Boss7_hideBallSkill(RoomID)
	local hideBall = OwnerID()
	local Hate_Table = Cl_RandTarget_HateList( Lua_Cl_Zone23_Boss7_Setanbofei[RoomID]["Boss"] )
	local Hate_Num = table.getn(Hate_Table)
	local Hate_Rand = 0
	local Target_Table = {}
	local Npc_X,Npc_Y,Npc_Z = 0
	local terget_Ball = {}
	for i = 1 , 3 , 1 do
		Hate_Rand = DW_Rand(Hate_Num)
		Target_Table[i] = Hate_Table[Hate_Rand]
	end
	for i = 1 , 3 , 1 do
		if Target_Table[i] ~= nil then
			Npc_X,Npc_Y,Npc_Z = Cl_Read_OwnerXYZ(Target_Table[i])
			terget_Ball[i] = Cl_CreateObj_ForHideBall( Cl_Z23_Boss7_NpcObj( 5 ) , Npc_X , Npc_Y , Npc_Z , RoomID )
			WriteRoleValue ( terget_Ball[i] , EM_RoleValue_LiveTime , 8 )
			sysCastSpelllv( hideBall , terget_Ball[i] , 850063 , 0 )
		end
	end
	sleep ( 20 )
	for i = 1 , 3 , 1 do
		if Target_Table[i] ~= nil then
			sysCastSpelllv( hideBall , terget_Ball[i] , 850002 , Cl_Z23_Boss7_Skill_Lv(850002) )
		end
	end
	sleep ( 20 )
	delobj ( hideBall )
end
function Cl_Z23_Boss7_EnergyAI()
	--say ( OwnerID() , "OwnerID" )
	SetPlot( OwnerID(), "touch" , "Cl_Z23_Boss7_EnergyReadTouch", 40 )
end
function Cl_Z23_Boss7_EnergyReadTouch() --執行處碰劇情檢查
	local PlayerID = OwnerID()
	local MedicineID = TargetID()
	if CheckBuff(  PlayerID , 621133 ) ~= true and CheckBuff(  PlayerID , 621130 ) ~= true then
		if	BeginCastBarEvent( PlayerID , MedicineID , Cl_Zone23_Boss7_String("Energy") , 10 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Cl_Z23_Boss7_Medicine_Touch") ~= 1 then  
			ScriptMessage( PlayerID, PlayerID, 1,"[SAY_NPC_BUSY]", 0 )	
		end
	else
		ScriptMessage( PlayerID, PlayerID, 1,Cl_Zone23_Boss7_String("Energy_Over"), 0 )
	end
end
function Cl_Z23_Boss7_Medicine_Touch(Executer,Result) --觸碰劇情條件達成執行
	if	Result > 0 then
		EndCastBar(Executer,Result)
		CallPlot( OwnerID() , "cl_Zone23_Boss7_Energytouch" , 0)
	else
		EndCastBar(Executer,Result)
	end
end
function cl_Zone23_Boss7_Energytouch()
	local play = OwnerID()
	local Energ = TargetID()
	local RoomID = ReadRoleValue( Energ , EM_RoleValue_RoomID )
	if ReadRoleValue ( Energ , EM_RoleValue_Register1 ) ~= 1 then
		Addbuff ( play , 621133 , 0 , -1 )
	end
end
function Cl_Z23_Boss7_BuffInSkill()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue ( TargetID , EM_RoleValue_IsPlayer ) == 1 then
		if CheckBuff(  TargetID , 621133 ) ~= true and CheckBuff(  TargetID , 621130 ) ~= true then
			return true
		else
			ScriptMessage( OwnerID, OwnerID, 1,Cl_Zone23_Boss7_String("Energy_Not"), 0 )
			return false
		end
	else
		if ReadRoleValue ( TargetID , EM_RoleValue_OrgID ) == 106414 then
			return true
		else
			ScriptMessage( OwnerID, OwnerID, 1,"[SC_102706_13]", 0 )
			return false
		end
	end
end
function Cl_Z23_Boss7_IsCheckBoss()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue ( TargetID , EM_RoleValue_OrgID ) == 106414 then
		return true
	else
		return false
	end
end
function Cl_Z23_Boss7_IsCheckPlayer()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue ( TargetID , EM_RoleValue_IsPlayer ) == 1 then
		if CheckBuff(  TargetID , 621133 ) ~= true or CheckBuff(  TargetID , 621130 ) ~= true then
			return true
		else
			return false
		end
	else
		return false
	end
end
function Cl_Z23_Boss7_CheckBuff(Num)
	local OwnerID = OwnerID()
	local Buff_Num = BuffCount(OwnerID)
	local BuffID = 0
	local Buff_flag = 0
	for i = 0 , Buff_Num-1 , 1 do
		BuffID = BuffInfo( OwnerID , i , EM_BuffInfoType_BuffID )
		if BuffID == 622037 then
			Buff_flag = Buff_flag + 1
		end
		if Buff_flag >= Num then
			CancelBuff_NoEvent( OwnerID , 622045 )
			return
		end
	end
end
function Cl_Z23_Boss7_CheckBuffLv50(Num)
	local OwnerID = OwnerID()
	if Cl_Read_BuffLv( OwnerID , 621140 , 0 ) >= Num then
		sysCastSpelllv( OwnerID , OwnerID , 498503 , 0 )
	end
end
--------------Z23 BOSS6的任務給予完成旗標-----------------
function Cl_Z23_Boss6_QuestFlag()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do ---TempPlayer等於數量代表for迴圈要做幾次
		ThesePlayer[i] = GetSearchResult() --將找到的玩家GID暫時存到這個值內
		if CheckAcceptQuest ( ThesePlayer[i] , 424454 ) == true then
			GiveBodyItem ( ThesePlayer[i], 546282 , 1 )
		end
	end
end