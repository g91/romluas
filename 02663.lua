function CL_Z24_Boss5_SetcollisionPlot()
	SetPlot( OwnerID(), "collision","CL_Z24_Boss5_begin", 50 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function CL_Z24_Boss5_begin()
	local OwnerID =OwnerID()
	local TargetID = TargetID()
	--say ( OwnerID , "go" )
	local RoomID = ReadRoleValue ( TargetID , EM_RoleValue_RoomID )
	if ReadRoleValue ( TargetID , EM_RoleValue_Register9 ) ~= 1 then
		WriteRoleValue( TargetID , EM_RoleValue_Register9 , 1 )
		if ReadRoleValue ( OwnerID , EM_RoleValue_IsPlayer ) == 1 and
			ReadRoleValue ( OwnerID , EM_RoleValue_VOC ) ~= 0 then
			ScriptMessage( OwnerID , -1 , 2 , "[SC_Z24_BOSS5_AI_BEGIN]" , 2 )  ---���{��������ǨӤ@�}�g�k�����n�A�b��ӪשФ��j����
			local ctarlAI = Cl_CreateObj_ForFlag( 106815 , 781024 , 0 , RoomID ) ----���ͳz���y�M��   wdb/dungeon/dgn_bedim.wdb
			
			Addbuff ( ctarlAI , 622496 , 0 , -1 ) ---�ߤl�ܤj
			CallPlot( ctarlAI , "Cl_Z24_Boss5_ctarlAI" , 0 )
			delobj ( TargetID )
		end
	end
end
function Cl_Z24_Boss5_Choose_Level(Value1,Value2)
	local Npc_Table = {}
	------------------{1=Boss,2=���F����y}
	Npc_Table[149] = {106814,106827} ---���`��
	Npc_Table[150] = {106816,106627}---²����
	Npc_Table[937] = {106814,106827}---���հ�
	----------------------------
	local SkillLv = {}
	if Value1 == nil then
		if Value2 == nil then
			return Npc_Table
		elseif Value2 ~= nil then
			return Npc_Table[Value2]
		end
	elseif Value1 == 149 then  ----------------------------------���`��
		SkillLv[499313] = 0 ---����
		SkillLv[499314] = 0 ---����
		SkillLv[499315] = 9 ---���{����
		SkillLv[499316] = 0 ---�j�۱�(��)
		SkillLv[499317] = 0 ---�j�۱�(�k)
		SkillLv[499318] = 7 ---����AE
		SkillLv[499319] = 0 ---���F����
		SkillLv[499320] = 0 ---�ܨ��W���ɨȤH
		SkillLv[499322] = 1 ---�j�۱ٹ�ڶˮ`
		if Value2 == nil then
			return SkillLv
		elseif Value2 ~= nil then
			return SkillLv[Value2]
		end
	elseif Value1 == 150 then  ---------------------------------²����
		SkillLv[499313] = 0 ---����
		SkillLv[499314] = 0 ---����
		SkillLv[499315] = 2 ---���{����
		SkillLv[499316] = 0 ---�j�۱�(��)
		SkillLv[499317] = 0 ---�j�۱�(�k)
		SkillLv[499759] = 2 ---����AE
		SkillLv[499319] = 0 ---���F����
		SkillLv[499320] = 0 ---�ܨ��W���ɨȤH
		SkillLv[499322] = 0 ---�j�۱ٹ�ڶˮ`
		if Value2 == nil then
			return SkillLv
		elseif Value2 ~= nil then
			return SkillLv[Value2]
		end
	elseif Value1 == 937 then  -------------------------------------���հ�
		SkillLv[499313] = 0 ---����
		SkillLv[499314] = 0 ---����
		SkillLv[499315] = 0 ---���{����
		SkillLv[499316] = 0 ---�j�۱�(��)
		SkillLv[499317] = 0 ---�j�۱�(�k)
		SkillLv[499318] = 0 ---����AE
		SkillLv[499319] = 0 ---���F����
		SkillLv[499320] = 0 ---�ܨ��W���ɨȤH
		SkillLv[499758] = 0 ---�j�۱ٹ�ڶˮ`
		if Value2 == nil then
			return SkillLv
		elseif Value2 ~= nil then
			return SkillLv[Value2]
		end
	end
end
function Cl_Z24_Boss7_Skill_Table(Value)---1=�����ɶ�,2=CD�ɶ�,3=�k�N�s��,4=�I�k���d�ɶ�,5=�r��
	local SkillID = {}
	SkillID["5"] = { 0 , 5 , 499313 , 10 , "[]" } ---����
	SkillID["5_2"] = { 0 , 5 , 499314 , 20 , "[]" } ---����
	SkillID["7"] = { 0 , 7 , 499315 , 20 , "[SC_Z24_BOSS5_AI_SKILL_1]" } ---���{����
	SkillID["13"] = { 0 , 13 , 499316 , 20 , "[SC_Z24_BOSS5_AI_SKILL_2]" } ---�j�۱�(��)
	SkillID["13_1"] = { 0 , 13 , 499317 , 20 , "[SC_Z24_BOSS5_AI_SKILL_3]" } ---�j�۱�(�k)
	SkillID["13_6"] = { 0 , 13 , 499318 , 50 , "[SC_Z24_BOSS5_AI_SKILL_4]" } ---����AE
	SkillID["15"] = { 0 , 13 , 499319 , 30 , "[SC_Z24_BOSS5_AI_SKILL_5]" } ---���F����
	SkillID["P_3"] = { 0 , 13 , 499320 , 30 , "[SC_Z24_BOSS5_AI_SKILL_6]" } ---�ܨ��W���ɨȤH
	--SkillID["crazy"] = { 0 , 400 ,"[SC_Z24_BOSS5_AI_CRAZY]"} --�g��
	if Value == nil then
		return SkillID
	elseif Value ~= nil then
		return SkillID[Value]
	end
end
function Cl_Z24_Boss5_ctarlAI()
	local ctarlAI = OwnerID()
	sleep ( 40 )
	CancelBuff_NoEvent( ctarlAI , 622496 ) ---�M��BUFF
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( ctarlAI , EM_RoleValue_ZoneID )
	local Npc_Table = Cl_Z24_Boss5_Choose_Level(nil)
	local Door = 0
	local Close_door = 0
	local Carzy_Time = 480 ---�g�ɮɶ��Цb�o�̳]�w
	local Carzy_Flag = 0
	local BossNpc = CreateObjByFlag( Npc_Table[ZoneID][1] , 781024 , 0 , 1 )  ------------�ͥX�]�N�U
	SetModeEx( BossNpc , EM_SetModeType_Searchenemy, false)--����(�_)
	WriteRoleValue( BossNpc , EM_RoleValue_PID , ctarlAI )
	AddToPartition( BossNpc , RoomID )
	CallPlot( BossNpc , "cl_Z24_Boss5_Fight" , ZoneID )
	ScriptMessage( ctarlAI , -1 , 2 , "[SC_Z24_BOSS5_AI_BEGIN_2]" , 2 )  ---�g�L�F���������ݡA�ש󦳤H��V�o�ӸӦ������ɡA�u�n����A�̡A����ڴN�����}�o�̡I
	sleep ( 20 )
	SetPosByFlag( ctarlAI , 781024 , 3 )
	SetModeEx( BossNpc , EM_SetModeType_Searchenemy, true )--����(�_)
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) ~= 4 do
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 then
			if Close_door == 0 then
				Door = Cl_CreateObj_ForFlag( 106832 , 781024 , 11 , RoomID ) ----���ͳz���y�M��
				SetModeEx ( Door , EM_SetModeType_Obstruct, true) 		---����(�O)
				Close_door = 1
			end
			Carzy_Time = Carzy_Time - 1
			if Carzy_Flag == 0 and Carzy_Time <= 0 then
				if ZoneID == 149 then
					ScriptMessage( BossNpc , -1 , 2 , "[SC_Z24_BOSS5_AI_SKILL_6]" , 2 )
					addbuff( BossNpc , 623667 , 0 , -1 )
				end	
				Carzy_Flag = 1
			end
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 2 then
			Carzy_Flag = 0
			delobj ( Door )
			WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 4 )
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 3 then
			delobj ( BossNpc )
			delobj ( Door )
			Close_door = 0
			Carzy_Flag = 0
			sleep ( 30 )
			Carzy_Time = 480
			BossNpc = CreateObjByFlag( Npc_Table[ZoneID][1] , 781024 , 0 , 1 )  ------------�ͥX�]�N�U
			WriteRoleValue( BossNpc , EM_RoleValue_PID , ctarlAI )
			AddToPartition( BossNpc , RoomID )
			CallPlot( BossNpc , "cl_Z24_Boss5_Fight" , ZoneID )
			WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 0 )
		end
		sleep ( 10 )
	end
end
--Boss   Register1=�j�۱٥ؼ�1  Register2=�j�۱٥ؼ�2  Register3=�ǰe�X�аO��
function cl_Z24_Boss5_Fight(ZoneID)
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local skill_table = Cl_Z24_Boss7_Skill_Table(nil)
	local skillLV = Cl_Z24_Boss5_Choose_Level(ZoneID)
	local AttackTarget = 0
	local CombatBegin = 0
	local Rand_Skill = 0
	local DisPlay = {}
	local SkillTarget = {}
	local TargetNum = 0
	local Ball_Obj = 0
	local Play_Table = {}
	local OverSkill_Time = 0
	local OverSkill_Flag = 0
	SetPlot( Boss, "dead","cl_Z24_Boss5_dead", 0 ) ---��JBOSS���԰����L
	local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )
	local bosshp = ReadRoleValue( Boss , EM_RoleValue_HP )	---�����ª�BOSS����e��q
	local HPPercent = ( bosshp / MaxHP )*100
	local OverBuff = 0
	local CtarlPlay = 0
	local Play_X , Play_Y , Play_Z = 0
	local CtarlBall = 0
	WriteRoleValue( Boss , EM_RoleValue_Register3 , 0 )
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( Boss ) ~= 0 then ---
			if CombatBegin == 0 then   -----
				CombatBegin = 1
				Play_Table = Cl_Z24_Boss5_BeginFight(RoomID)
				ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_FIGHT]" , 2 )  ---�ڭn�}�l�j�֦��[�A���@�I�@�w���٭����A�̨��W�y�ʪ��ɶ��I
				WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 1 )
			end
			if CombatBegin == 1 then
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = skill_table[num][1] + 1
				end
				MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )
				bosshp = ReadRoleValue( Boss , EM_RoleValue_HP )	---�����ª�BOSS����e��q
				HPPercent = ( bosshp / MaxHP )*100
				if skill_table["5"][1] >= skill_table["5"][2] then
					cl_chack_CastSpell()
					Rand_Skill = DW_Rand(80)
					if ( Rand_Skill >= 1 and Rand_Skill <= 20) or( Rand_Skill >=41 and Rand_Skill <= 60 ) then
						CastSpelllv ( Boss , AttackTarget , skill_table["5"][3] , skillLV[skill_table["5"][3]] )
						sleep ( skill_table["5"][4] )
					elseif ( Rand_Skill >= 21 and Rand_Skill <= 40 ) or( Rand_Skill >= 61 and Rand_Skill <= 80 ) then
						
						CastSpelllv ( Boss , Boss , skill_table["5_2"][3] , skillLV[skill_table["5_2"][3]] )
						sleep ( skill_table["5_2"][4] )
					end
					skill_table["5"][1] = 0
				end
				if skill_table["7"][1] >= skill_table["7"][2] then
					cl_chack_CastSpell()
					ScriptMessage( Boss , -1 , 2 , skill_table["7"][5] , 2 )  ---���ӸոլݧA�̪��N�Ӱ�������w�I
					DisPlay = KS_GetHateList( Boss , 2 )--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4 �L�oGM)
					CastSpelllv ( Boss , DisPlay[1] , skill_table["7"][3] , skillLV[skill_table["7"][3]] )
					sleep ( skill_table["7"][4] )
					skill_table["7"][1] = 0
				end
				if skill_table["13"][1] >= skill_table["13"][2] then
					ScriptMessage( Boss , -1 , 2 , skill_table["13"][5] , 2 )  ---���ӸոլݧA�̪��N�Ӱ�������w�I
					cl_chack_CastSpell()
					OverSkill_Flag = 0
					SkillTarget = CL_Z24_Boss5_TargetTable()
					if(SkillTarget==nil)or(#SkillTarget==0)then
						table.insert( SkillTarget , AttackTarget )
					end
					TargetNum = table.getn( SkillTarget )
					if(TargetNum==nil)or(TargetNum==0)then
						table.insert( SkillTarget , AttackTarget )  ----�p�G���a���W�S���H�WBUFF�åB�s��~�N�N�L���t�~�@��TABLE
						TargetNum = table.getn( SkillTarget )
					end
					SetModeEx( Boss , EM_SetModeType_Move , false ) ---����	(�_)
					PlayMotionEX( Boss, ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_MIME_IDLE_SIT )
					sleep ( 10 )
					SetIdleMotion( Boss ,  ruFUSION_MIME_IDLE_SIT)--------�O���a�U�Ҧ�
					Ball_Obj = CL_Z24_Boss5_SkillTarget_Obj( 106817 , SkillTarget[1] , Play_Table , 20 , 90 )
					CastSpelllv ( Boss , Ball_Obj , skill_table["13"][3] , 0 )
					addbuff(SkillTarget[1],623796,0,5)
						--say(Boss,"playball1 = "..Getname(SkillTarget[1]))
					sleep ( 5 )	
					ScriptMessage( Boss , -1 , 2 , skill_table["13_1"][5] , 2 )  ---���ӸոլݧA�̪��N�Ӱ�������w�I
					Ball_Obj = CL_Z24_Boss5_SkillTarget_Obj( 106817 , SkillTarget[TargetNum] , Play_Table , 10 , -90 )
					sysCastSpelllv ( Boss , Ball_Obj , skill_table["13_1"][3] , 0 )
					addbuff(SkillTarget[TargetNum],623796,0,5)
						--say(Boss,"playball2 = "..Getname(SkillTarget[TargetNum]))
					SetIdleMotion( Boss ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
					sleep ( 15 )
					--ScriptMessage( Boss , -1 , 2 , skill_table["13_1"][5] , 2 )  ---���ӸոլݧA�̪��N�Ӱ�������w�I
					--Ball_Obj = CL_Z24_Boss5_SkillTarget_Obj( 106817 , SkillTarget[TargetNum] , Play_Table , 10 )
					--CastSpelllv ( Boss , Ball_Obj , skill_table["13_1"][3] , 0 )
					--	say(Boss,"playball2 = "..Getname(SkillTarget[TargetNum]))
					sleep ( 10 )	 
					SetModeEx( Boss , EM_SetModeType_Move , true ) ---����	(�_)
					SkillTarget = {}
					skill_table["13"][1] = 0
					TargetNum = 0
					OverSkill_Flag = 1
				end
				--if skill_table["crazy"][1] >= skill_table["crazy"][2] then  --�g��
					--ScriptMessage( Boss , -1 , 2 , skill_table["crazy"][3] , 2 )
					--addbuff(boss,623667,0,-1)
				--end
				if OverSkill_Flag == 1 then
					OverSkill_Time = OverSkill_Time + 1
					if OverSkill_Time >= 6 then
						ScriptMessage( Boss , -1 , 2 , skill_table["13_6"][5] , 2 )  ---���ӸոլݧA�̪��N�Ӱ�������w�I
						SetModeEx( Boss , EM_SetModeType_Move , false ) ---����	(�_)
						sleep ( 10 )
						PlayMotionex ( Boss , ruFUSION_MIME_SLEEP_DOWN , ruFUSION_MIME_SLEEP_LOOP )---------------��1�|�ʧ@
						sleep ( 7 )
						SetIdleMotion( Boss ,ruFUSION_MIME_SLEEP_LOOP )----------------------�����ʧ@
						CastSpelllv ( Boss , Boss , skill_table["13_6"][3] , skillLV[skill_table["13_6"][3]] )
						cl_chack_CastSpell()
						PlayMotion ( Boss , ruFUSION_MIME_SLEEP_UP )
						sleep ( 5 )
						SetIdleMotion( Boss ,ruFUSION_ACTORSTATE_NORMAL )----------------------�����ʧ@
						SetModeEx( Boss , EM_SetModeType_Move , true ) ---����	(�_)
						skill_table["13_6"][1] = 0
						OverSkill_Time = 0
						OverSkill_Flag = 0
					end
				end
				if HPPercent >= 20 and HPPercent <= 60 then
					if skill_table["15"][1] >= skill_table["15"][2] then
						cl_chack_CastSpell()
						CtarlPlay = Cl_Rand_HateList( 0 , 0 )
						if CtarlPlay == nil then   --�קK��nil����
							CtarlPlay = 0
						end
						while ReadRoleValue(CtarlPlay,EM_RoleValue_IsPlayer) ~= 1 do
							CtarlPlay = Cl_Rand_HateList( 0 , 0 )
						end
						ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_SKILL_5][$SETVAR1="..GetName( CtarlPlay ).."]" , 2 )
						CastSpelllv ( Boss , CtarlPlay , skill_table["15"][3] , skillLV[skill_table["15"][3]] )
						sleep ( skill_table["15"][4] )
						sleep ( 10 )
						Cl_Z24_Boss5_CtarBall(CtarlPlay)
						skill_table["15"][1] = 0
					end
				elseif HPPercent <= 19 then
					if OverBuff == 0 then
						cl_chack_CastSpell()
						ScriptMessage( Boss , -1 , 2 , skill_table["P_3"][5] , 2 )  ---���ӸոլݧA�̪��N�Ӱ�������w�I
						CastSpelllv ( Boss , Boss , skill_table["P_3"][3] , skillLV[skill_table["P_3"][3]] )
						sleep ( 10 )
						OverBuff = 1
					end
				end
			end
		elseif HateListCount( Boss ) == 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 1 then   -----�p�G������������H~�N�N�o�ӭȧ���
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = 0
				end
				ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_FIGHT_END]" , 2 )
				OverBuff = 0
				OverSkill_Flag = 0
				OverSkill_Time = 0
				Play_Table = {}
				CombatBegin = 0
				WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 3 )
			end
		end
	end
end
function cl_Z24_Boss5_dead()
	local Boss = OwnerID()
	sasa_Zone149_title_01()
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_DEAD]" , 2 )
	WriteRoleValue( ctarlAI , EM_RoleValue_Register1 , 2 )
end
function CL_Z24_Boss5_TargetTable()
	local New_Table = DW_HateSequence( 0 )
	local New_number = table.getn( New_Table )
	if New_number >= 2 then
		local Hate_Table = DW_HateSequence( 1 )
		local Hate_number = table.getn( Hate_Table )
		local Play_Table = {}
		local PlayNum = 0
		local SkillTarget = {}
		if Hate_number ~= 0 then
			for i = 1 , Hate_number , 1 do
				if ReadRoleValue( Hate_Table[i] , EM_RoleValue_IsPlayer ) ==  1 and
					CheckBuff(Hate_Table[i],622476) ~= true then
					table.insert( Play_Table , Hate_Table[i] )  ----�p�G���a���W�S���H�WBUFF�åB�s��~�N�N�L���t�~�@��TABLE
				end
			end
			PlayNum = table.getn( Play_Table )
			if PlayNum > 2 then
				SkillTarget = Lua_GetFormHate( Play_Table , 2 )
				return SkillTarget
			elseif PlayNum > 0 and PlayNum <= 2 then
				return Play_Table
			end
		elseif Hate_number == 0 or Hate_number == nil then
			return Play_Table
		end
	elseif New_number < 2 then
		return New_Table
	end
end
function CL_Z24_Boss5_SkillTarget_Obj(OrgID,TargetID,Play_Table,SleepLv,BossDis)
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	--local Ball = kg_GetPosRX( Boss , OrgID , 65 )
	local x,y,z,dir=DW_Location(Boss)
	x,y,z,dir=DW_NewLocation(60,BossDis,x,y,z,Dir)
	local Ball = CreateObj( OrgID , x , y , z , 0 , 1 )
	SetModeEx( Ball , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( Ball , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( Ball , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( Ball , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��  
	AddToPartition( Ball , RoomID )
	WriteRoleValue( Ball , EM_RoleValue_PID , ctarlAI )
	WriteRoleValue( Ball , EM_RoleValue_Register1 , Boss )
	CallPlot( Ball , "cl_Z24_Boss5_Ball" , TargetID,Play_Table,SleepLv )
	return Ball
end
function Cl_Z24_Boss5_Ball(TargetID,Play_Table,SleepLv)
	local Ball_Obj = OwnerID()
	sleep ( SleepLv )
	Addbuff ( Ball_Obj , 622416 , 0 , -1 ) ---�ߤl�ܤj
	local ctarlAI = ReadRoleValue ( Ball_Obj , EM_RoleValue_PID )
	local Boss = ReadRoleValue ( Ball_Obj , EM_RoleValue_Register1 ) 
	---Cl_Cl_Z24_Boss5_Begin_Move(Boss)
	CallPlot( Ball_Obj , "Cl_Z23_Boss5_ReadAllPlayDis" , Play_Table )
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
		if CheckID( TargetID ) == true and
			ReadRoleValue( TargetID , EM_RoleValue_IsDead ) ~= 1 then
			Cl_Z24_Boss5_Ball_Move(TargetID)
		else
			local Hate_Table = DW_HateSequence( 1 )
			local Hate_Num = table.getn(Hate_Table)
			if Hate_Num == 0 then
				TargetID = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
			elseif Hate_Num >= 1 then
				local HateRand = DW_Rand(Hate_Num)
				TargetID = Hate_Table[HateRand]
			end
		end
		sleep ( 10 )
	end
	delobj ( Ball_Obj )
end
function Cl_Cl_Z24_Boss5_Begin_Move(Boss)
	local Obj = OwnerID();
	local RoomID = ReadRoleValue( Obj , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local Boss = ReadRoleValue( Obj , EM_RoleValue_Register4 ) --Ū�����ê��������Zone
	local Tx = ReadRoleValue( Obj, EM_RoleValue_X );
	local Tz = ReadRoleValue( Obj, EM_RoleValue_Z );
	local Od = ReadRoleValue( Boss, EM_RoleValue_Dir );
	local Ox = ReadRoleValue( Boss, EM_RoleValue_X );
	local Oz = ReadRoleValue( Boss, EM_RoleValue_Z );
	local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  
	MoveToFlagEnabled(Obj, false) ---�t�Τ��ت����|����
	WriteRoleValue( Obj ,EM_RoleValue_IsWalk , 0 )
	local deltaDir = (Dir-Od);
	local X , Y , Z = kg_GetPosRX( Boss , nil , 50 , 0 , deltaDir )
	LuaFunc_WaitMoveTo( Obj , X , Y , Z )
end
function Cl_Z24_Boss5_Ball_Move(TargetID)
	local Ball_Obj = OwnerID()
	local RoomID = ReadRoleValue( Ball_Obj , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local Tx = ReadRoleValue( Ball_Obj, EM_RoleValue_X );
	local Tz = ReadRoleValue( Ball_Obj, EM_RoleValue_Z );
	local Od = ReadRoleValue( TargetID, EM_RoleValue_Dir );
	local Ox = ReadRoleValue( TargetID, EM_RoleValue_X );
	local Oz = ReadRoleValue( TargetID, EM_RoleValue_Z );
	local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  
	MoveToFlagEnabled(Ball_Obj, false) ---�t�Τ��ت����|����
	WriteRoleValue( Ball_Obj ,EM_RoleValue_IsWalk , 0 )
	local deltaDir = (Dir-Od);
	local X , Y , Z = kg_GetPosRX( TargetID , nil , -50 , 0 , deltaDir )
	LuaFunc_WaitMoveTo( Ball_Obj , X , Y , Z )
end
function Cl_Z23_Boss5_ReadAllPlayDis(Play_Table)
	local Ball_Obj = OwnerID()
	local ctarlAI = ReadRoleValue ( Ball_Obj , EM_RoleValue_PID )
	local Boss = ReadRoleValue ( Ball_Obj , EM_RoleValue_Register1 ) 
	local Play_Num = table.getn(Play_Table)
	local PlayDis = 0
	local KillFlag = 0
	local Boss_Dis = 0
	local ZoneID = ReadRoleValue ( Ball_Obj , EM_RoleValue_ZoneID )
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
		sleep ( 2 )
		Boss_Dis = GetDistance( Ball_Obj , Boss )
		if Boss_Dis <= 50 then
			if Cl_Z24_Boss5_CheckDir(Boss,Ball_Obj) == true then
				SetModeEx( Ball_Obj , EM_SetModeType_Move, false) ---����	(�_)
				MagicInterrupt( Boss )
				sysCastSpelllv ( Ball_Obj , Boss , 499321 , 0 )
				ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_SKILL_HIT]" , 2 )
				KillFlag = 1
			elseif Cl_Z24_Boss5_CheckDir(Boss,Ball_Obj) == false then
				ScriptMessage( Boss , -1 , 2 , "[SC_Z24_BOSS5_AI_SKILL_MISS]" , 2 )
				SetPosByFlag( Boss , 781024 , 1 )
				Cl_Z24_Boss5_SetPos(Boss)
			end
		end
		for i = 1 , Play_Num , 1 do
			if ReadRoleValue( Play_Table[i] , EM_RoleValue_IsDead ) ~=  1 then
				PlayDis = GetDistance( Ball_Obj , Play_Table[i] )
				if PlayDis <= 23 then
					SetModeEx( Ball_Obj , EM_SetModeType_Move, false) ---����	(�_)
					sysCastSpelllv ( Ball_Obj , Play_Table[i] , 499322 , Cl_Z24_Boss5_Choose_Level(ZoneID,499322) )
					KillFlag = 1
				end
			end
		end
		if KillFlag == 1 then
			sleep ( 10 )
			delobj ( Ball_Obj )
			KillFlag = 0
		end
	end
end
function Cl_Z24_Boss5_BeginFight(RoomID)
	local OwnerID = OwnerID()
	local Play_Table  = {}
	local PlayNum = SetSearchAllPlayer(RoomID ) -----Ū�����ZONE���Ҧ����a�o��Ū���쪺�O�ƶq
	for i = 1 , PlayNum , 1 do ---�⪱�a��J�ж��� Ū���쪺���a�ƶq�U�h�M�wfor�j��]�X��
		local Player = GetSearchResult()  ---�N����ZONE�̪��Ҧ����a�̧Ǧs�J�o�ӼȦs��
		if ReadRoleValue( Player, EM_RoleValue_VOC) ~= 0  and  ---�O�_��GM
			ReadRoleValue( Player , EM_RoleValue_IsPlayer ) ==  1 then
			table.insert( Play_Table , Player )  ----�p�G���a���W�S���H�WBUFF�åB�s��~�N�N�L���t�~�@��TABLE
		end
	end
	return Play_Table
end
function Cl_Z24_Boss5_CheckDir( Target , OwnerID )
	local Dir = KS_FrontOrBack( Target , OwnerID )
	if Dir >= 0 then
		return false
	elseif Dir < 0 then
		return true
	end
end
function Cl_Z24_Boss5_JobSkill(JobID)
	local JobSkill = {}
	JobSkill[1] = {499331,499332}  --�Ԥh=�z���ۭ�.���x
	JobSkill[2] = {499333,499334}  --�C�L=�e���b.���V����
	JobSkill[3] = {499335,499336}  --�v��=�v���c.�{���ۧ�
	JobSkill[4] = {499337,499338}  --�k�v=�q���N.�p�q����
	JobSkill[5] = {499339,499340}  --���q=�v¡�N.�F���u
	JobSkill[6] = {499341,499342}  --�M�h=�t����.��������
	JobSkill[7] = {499343,499344}  --�˪�=��v.�Q�r��
	JobSkill[8] = {499345,499346}  --���x=�ͩR���.�j�a��u
	JobSkill[9] = {499347,499348}  --�F��=���m��.�N�ѱ�
	JobSkill[10] = {499349,499350} --�u�K=�ů�o��.���X���m
	if JobID == nil then
		return JobSkil
	elseif JobID ~= nil then
		return JobSkill[JobID]
	end
end
function Cl_Z24_Boss5_JobSkillLv(SkillID)  --nil=������H���ؼСA0=��Boss,1=��ۤv,2=��y�Ц�m
	local skillLv = {}
	skillLv[499331] = { 16 , 1 }--�z���ۭ�      X
	skillLv[499332] = { 12 , nil}--���x    
	skillLv[499333] = { 1 , nil}--�e���b
	skillLv[499334] = { 10 , nil}--���V����
	skillLv[499335] = { 16 , nil}--�v���c    v
	skillLv[499336] = { 14 , 0}--�{���ۧ�
	skillLv[499337] = { 4 , 1}--�q���N  v
	skillLv[499338] = { 12 , 2}--�p�q����   v=
	skillLv[499339] = { 2 , 0}--�v¡�N
	skillLv[499340] = { 0 , 1}--�F���u
	skillLv[499341] = { 0 , 0}--�t����
	skillLv[499342] = { 16 , nil}--��������
	skillLv[499343] = { 18 , nil}--��v v
	skillLv[499344] = { 25 , nil}--�Q�r��
	skillLv[499345] = { 4 , 0}--�ͩR���
	skillLv[499346] = { 17 , 0}--�j�a��u
	skillLv[499347] = { 11 , 0}--���m��
	skillLv[499348] = { 3 , nil}--�N�ѱ�
	skillLv[499349] = { 1 , nil}--�ů�o��
	skillLv[499350] = { 14 , 0}--���X���m
	if SkillID == nil then
		return skillLv
	elseif SkillID ~= nil then
		return skillLv[SkillID]
	end
end
function Cl_Z24_Boss5_CtarBall(Target)
	local Boss = OwnerID()
	local RoomID = ReadRoleValue ( Boss , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local ZoneID = ReadRoleValue ( Boss , EM_RoleValue_ZoneID )
	local Npc_Table = Cl_Z24_Boss5_Choose_Level(nil)
	local Play_X , Play_Y , Play_Z = Cl_Read_OwnerXYZ(Target)
	local CtarlBall = CreateObj( Npc_Table[ZoneID][2] , Play_X , Play_Y , Play_Z , 0 , 1 ) ----���ͳz���y�M��
	SetModeEx( CtarlBall , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( CtarlBall , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( CtarlBall , EM_SetModeType_Searchenemy, false)--����(�_)
	WriteRoleValue( CtarlBall , EM_RoleValue_PID , Boss )
	WriteRoleValue( CtarlBall , EM_RoleValue_Register1 , Target )
	AddToPartition( CtarlBall , RoomID )
	Addbuff (  CtarlBall , 502707 , 0 , -1 ) ---�ߤl�ܤj
	CallPlot( CtarlBall , "Cl_Z24_Boss5_ctarlPlayer" , 0 )
end
function Cl_Z24_Boss5_ctarlPlayer()
	local CtarBall = OwnerID()
	local RoomID = ReadRoleValue ( CtarBall , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue ( CtarBall , EM_RoleValue_PID )
	local ctarlAI = ReadRoleValue ( Boss , EM_RoleValue_PID )
	local Target = ReadRoleValue ( CtarBall , EM_RoleValue_Register1 )
	local JobID = ReadRoleValue ( Target , EM_RoleValue_VOC )
	local PlaySkill = Cl_Z24_Boss5_JobSkill(JobID)
	local SkillLV = Cl_Z24_Boss5_JobSkillLv(nil)
	local powerLV = 0
	local skill_Time = 0
	local AttackTarget = 0
	local RandSkill = DW_Rand(2)
	local ctarl_X , ctarl_Y , ctarl_Z = 0
	SetPlot( ctarlAI, "dead","Cl_Z24_Boss5_ctarlDead", 0 ) ---��JBOSS���԰����L
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
			--say ( Target , "skill_Time="..skill_Time )
			if CheckID( Target ) ~= true then
				delobj ( CtarBall )
			elseif CheckID( Target ) == true then
				if ReadRoleValue ( Target , EM_RoleValue_IsDead ) == 1 then
					delobj ( CtarBall )
				elseif ReadRoleValue ( Target , EM_RoleValue_IsDead ) ~= 1 then
					if CheckBuff ( Target , 622476 ) == true then
						skill_Time = skill_Time + 1
						if skill_Time >= 3 then
							RandSkill = DW_Rand(2)
							if SkillLV[PlaySkill[RandSkill]][2] == nil then
								AttackTarget = Cl_Z24_Boss_RandTarget(Boss,Target)
								powerLV = ReadRoleValue( Target , EM_RoleValue_MagicPowerLv_SP+SkillLV[PlaySkill[RandSkill]][1] )
								--say ( Target , "PlaySkill[RandSkill]="..PlaySkill[RandSkill].."             ".."PLV="..powerLV )
								--say ( Target , "AttackTarget="..Getname(AttackTarget) )
								CastSpelllv ( Target , AttackTarget , PlaySkill[RandSkill] , powerLV )
							elseif SkillLV[PlaySkill[RandSkill]][2] == 0 then
								powerLV = ReadRoleValue( Target , EM_RoleValue_MagicPowerLv_SP+SkillLV[PlaySkill[RandSkill]][1] )
								--say ( Target , "PlaySkill[RandSkill]="..PlaySkill[RandSkill].."             ".."PLV="..powerLV )
								--say ( Target , "AttackTarget="..Getname(Boss) )
								CastSpelllv ( Target , Boss , PlaySkill[RandSkill] , powerLV )
							elseif SkillLV[PlaySkill[RandSkill]][2] == 1 then
								powerLV = ReadRoleValue( Target , EM_RoleValue_MagicPowerLv_SP+SkillLV[PlaySkill[RandSkill]][1] )
								--say ( Target , "PlaySkill[RandSkill]="..PlaySkill[RandSkill].."             ".."PLV="..powerLV )
								--say ( Target , "Target="..Getname(Target) )
								CastSpelllv ( Target , Target , PlaySkill[RandSkill] , powerLV )
							elseif SkillLV[PlaySkill[RandSkill]][2] == 2 then
								AttackTarget = Cl_Z24_Boss_RandTarget(Boss)
								ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ(AttackTarget)
								powerLV = ReadRoleValue( Target , EM_RoleValue_MagicPowerLv_SP+SkillLV[PlaySkill[RandSkill]][1] )
								--say ( Target , "PlaySkill[RandSkill]="..PlaySkill[RandSkill].."             ".."PLV="..powerLV )
								--say ( Target , "AttackTarget_______XYZ="..Getname(AttackTarget) )
								CastSpellPos ( Target , ctarl_X , ctarl_Y , ctarl_Z , PlaySkill[RandSkill] , powerLV )
							end
							skill_Time = 0
						end
					elseif CheckBuff ( Target , 622476 ) ~= true then
						delobj ( CtarBall )
					end
				end
		end
		sleep ( 10 )
	end
	delobj ( CtarBall )
end
function Cl_Z24_Boss5_ctarlDead()
	local CtarBall = OwnerID()
	local Target = ReadRoleValue ( CtarBall , EM_RoleValue_Register1 )
	CancelBuff_NoEvent( Target , 622476 ) ---�M��BUFF
	delobj ( CtarBall )
end
function Cl_Z24_Boss_RandTarget( ObjID , Target )
	local Hate_Table = Cl_RandTarget_HateList( ObjID )
	local Hate_Num = table.getn(Hate_Table)
	local Player = {}
	for i = 1 , Hate_Num , 1 do
		if Hate_Table[i] ~= Target then
			table.insert( Player , Hate_Table[i] ) 
		end
	end
	local Hate_Num = table.getn(Player)
	local Hate_Rand = DW_Rand(Hate_Num)
	return Player[Hate_Rand]
end
function Cl_Z24_Boss5_SetPos(ObjID)
	local OwnerID = OwnerID()
	if ReadRoleValue( ObjID , EM_RoleValue_Register3 ) == 0 then
		WriteRoleValue( ObjID , EM_RoleValue_Register3 , 1 )
		local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
		local ctarlAI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
		local ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ(ctarlAI)
		local Rand_X = math.random( -150, 150 )
		local Rand_Z = math.random( -150, 150 )
		local NpcID = CreateObj( 106829 , ctarl_X+Rand_X , ctarl_Y , ctarl_Z+Rand_Z , 0 , 1 )  ------------�ͥX�]�N�U
		SetModeEx( NpcID , EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( NpcID , EM_SetModeType_Move, false) ---����	(�_)
		SetModeEx( NpcID , EM_SetModeType_Searchenemy, false)--����(�_)
		SetModeEx( NpcID , EM_SetModeType_Mark, false)			---�i�I��(�O)
		SetModeEx( NpcID , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
		SetModeEx( NpcID , EM_SetModeType_Fight, false) ---�i���(�O)
		SetModeEx( NpcID , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��  
		AddToPartition( NpcID , RoomID )
		Addbuff ( NpcID , 622496 , 0 , -1 ) ---�ߤl�ܤj
		CallPlot( NpcID , "CL_Z24_Boss5_Show" , ObjID )
	end
end
function CL_Z24_Boss5_Show(NpcID)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	sleep ( 10 )
	local ctarl_X , ctarl_Y , ctarl_Z = Cl_Read_OwnerXYZ(OwnerID)
	SetPos( NpcID , ctarl_X , ctarl_Y , ctarl_Z , 0 )
	WriteRoleValue( NpcID , EM_RoleValue_Register3 , 0 )
	sleep ( 10 )
	delobj( OwnerID )
end
function Cl_Z24_Boss5_Job5_Skill499341()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_OrgID ) == 106814 or
		ReadRoleValue( TargetID , EM_RoleValue_OrgID ) == 106827 then
		return true
	else
		return false
	end
end
function Cl_Z24_Boss5CheckctarlAI()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_OrgID ) == 106827 or
		ReadRoleValue( TargetID , EM_RoleValue_OrgID ) == 106815 then
		return false
	else
		return true
	end
end