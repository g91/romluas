function Cl_Z25_Boss7_CallForLaSo_Skill(Value)
	local Skill_Table = {}
	Skill_Table["7_1"] = { 0 , 7 , 499394 , 20 , "[]" }
	Skill_Table["9_1"] = { 0 , 9 , 499395 , 30 , "[]" }
	Skill_Table["15_1"] = { 0 , 15 , 499397 , 50 , "[]" }
	if Value == nil then
		return Skill_Table
	elseif Value ~= nil then
		return Skill_Table[Value]
	end
end
function Cl_Z25_Boss7_CallForLaSo_SkillPvl(Value,ZoneID)
	local Power_Lv = {}
	if ZoneID == 151 or 937 then
		Power_Lv[499394] = 0
		Power_Lv[499395] = 0
		Power_Lv[499396] = 0
		Power_Lv[499397] = 11
	end
	if Value == nil then
		return Power_Lv
	elseif Value ~= nil then
		return Power_Lv[Value]
	end
end
function Cl_Z25_Boss7_MonsterBoss_LaSo(ZoneID)
	local OwnerID = OwnerID()
	DebugMsg( 0 , 0 , "Boss_LaSo" )
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	local Boss = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	local AttackTarget = 0
	local CombatBegin = 0
	local Skill_Table = Cl_Z25_Boss7_CallForLaSo_Skill( nil , ZoneID )
	local Power_Lv = Cl_Z25_Boss7_CallForLaSo_SkillPvl( nil , ZoneID )
	SetAttack( OwnerID , ReadRoleValue( Boss , EM_RoleValue_AttackTargetID ) )
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( OwnerID ) ~= 0 then ---
			if CombatBegin == 0 then   -----
				CombatBegin = 1
			end
			if CombatBegin == 1 then
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = skill_table[num][1] + 1
				end
				if skill_table["7_1"][1] >= skill_table["7_1"][2] then
					cl_chack_CastSpell()
					CastSpelllv ( OwnerID , OwnerID , skill_table["7_1"][3] , Power_Lv[skill_table["7_1"][3]] )
					sleep ( skill_table["7_1"][4] )
					skill_table["7_1"][1] = 0
				end
				if skill_table["9_1"][1] >= skill_table["9_1"][2] then
					cl_chack_CastSpell()
					CastSpelllv ( OwnerID , OwnerID , skill_table["9_1"][3] , Power_Lv[skill_table["9_1"][3]] )
					sleep ( skill_table["9_1"][4] )
					skill_table["9_1"][1] = 0
				end
				if skill_table["15_1"][1] >= skill_table["15_1"][2] then
					DebugMsg( 0 , 0 , "111111=" )
					cl_chack_CastSpell()
					SetModeEx( OwnerID , EM_SetModeType_Move, false ) ---����	(�_)3
					SetModeEx( OwnerID , EM_SetModeType_Fight, false) ---�i���(�O)7
					PlayMotionex ( OwnerID , ruFUSION_MIME_CRAFTING_BEGIN , ruFUSION_MIME_CRAFTING_LOOP )---------------��1�|�ʧ@
					sleep ( 10 )
					SetIdleMotion( OwnerID ,ruFUSION_MIME_CRAFTING_LOOP )----------------------�����ʧ@
					sleep ( 5 )
					Hate_X , Hate_Y , Hate_Z  = Cl_Rand_HateList( 1 , 0 )
					CastSpellPos ( OwnerID , Hate_X , Hate_Y , Hate_Z , skill_table["15_1"][3] , Power_Lv[skill_table["15_1"][3]] )----�C3����e�ؼЬI�����k�N
					sleep ( skill_table["15_1"][4] )
					PlayMotionex ( OwnerID , ruFUSION_MIME_CRAFTING_LOOP , ruFUSION_MIME_CRAFTING_END )---------------��1�|�ʧ@
					sleep ( 10 )
					SetIdleMotion( OwnerID ,ruFUSION_ACTORSTATE_NORMAL )----------------------�����ʧ@
					SetModeEx( OwnerID , EM_SetModeType_Move, true) ---����	(�_)3
					SetModeEx( OwnerID , EM_SetModeType_Fight, true) ---�i���(�O)7
					skill_table["15_1"][1] = 0
				end
			end
		elseif HateListCount( OwnerID ) == 0 then ---
			if CombatBegin == 1 then
				for num , skill in pairs(skill_table) do
					skill_table[num][1] = 0
				end
				CombatBegin = 0
			end
		end
		sleep ( 10 )
	end
	delobj ( OwnerID )
end
function Cl_Z25_Boss7_MonsterBoss_Lin()
	local OwnerID = OwnerID()
	DebugMsg( 0 , 0 , "Boss_Lin" )
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	local Boss = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	SetAttack( OwnerID , ReadRoleValue( Boss , EM_RoleValue_AttackTargetID ) )
	while ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 do
		sleep ( 10 )
	end
	delobj ( OwnerID )
end
function Cl_Z25_Boss7_MonsterBossDead()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	local OrgId = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Boss_LaSo = ReadRoleValue ( OwnerID , EM_RoleValue_Register2 )
	if OrgId == 106541 then
		if CheckID( Boss_LaSo ) ~= true or
			ReadRoleValue( Boss_LaSo , EM_RoleValue_IsDead ) ==  1 then
			WriteRoleValue( Boss , EM_RoleValue_Register1 , 4 )	
		end
	elseif OrgId ~= 106541 then
		if ZoneID == 151 or 937 then
			if ReadRoleValue ( Boss , EM_RoleValue_Register1 ) == 1 then
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 2 )
			elseif ReadRoleValue ( Boss , EM_RoleValue_Register1 ) == 3 then
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 4 )
			end
		elseif ZoneID == 152 or 153 then
			if ReadRoleValue ( Boss , EM_RoleValue_Register1 ) == 1 then
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 4 )
			end
		end
	end
	return true
end
function Cl_Z25_Boss7_CheakInZoneID()
	local OwnerID = OwnerID()
	if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 151 then
		return true
	elseif ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) ~= 151 then
		return false
	end
end
function Cl_Z25_CallForBoss_SkilBomb()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local BombObj = 0
	local Owner_X , Owner_Y , Owner_Z = Cl_Read_OwnerXYZ(OwnerID)
	local Owner_Dir = ReadRoleValue( OwnerID, EM_RoleValue_Dir )
	for i = 1 , 3 , 1 do
		BombObj = CreateObj( 106844 , Owner_X , Owner_Y , Owner_Z , Owner_Dir , 1 ) ----���ͳz���y�M��
	----Cl_EM_SetModeType 1.����ID  2.���� 3.���� 4.����  5.�аO  6.�Y�� 7.���  8.���   9.����    10.���O
		Cl_EM_SetModeType( BombObj , false , true , false , true , true , true , false , false , true )
		SetDir( BombObj , Owner_Dir )  
		MoveToFlagEnabled( BombObj , false) ---�t�Τ��ت����|����
		AddToPartition ( BombObj , RoomID ) ----����[�J����,�Ҧ椽��
		CallPlot( BombObj , "Cl_Z25_CallForBoss_BombMove" , i )
	end
end
function Cl_Z25_CallForBoss_BombMove( Valu )
	local OwnerID = OwnerID()
	Addbuff (  OwnerID , 622703 , 0 , -1 ) 
	local Dir_Table = { -20 , 0 , 20 }
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	AdjustDir( OwnerID , Dir_Table[Valu] ) 
	local Owner_Dir = ReadRoleValue( OwnerID, EM_RoleValue_Dir )
	local X , Y , Z = kg_GetPosRX( OwnerID , nil , 200 , 0 , Owner_Dir )
	LuaFunc_WaitMoveTo( OwnerID , X , Y , Z )
	sysCastSpelllv ( OwnerID , OwnerID , 499396 , Cl_Z25_Boss7_CallForLaSo_SkillPvl( 499396 , ZoneID ) )
	sleep ( 5 )
	delobj ( OwnerID )
end