--�Ԥh

function EliteSkillQuest_Warrior_0()
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 1 and (CheckAcceptQuest( OwnerID() , 422368 ) == true or CheckAcceptQuest( OwnerID() , 422379 ) == true ) and CheckFlag( OwnerID() ,542702 ) == false then
		SetSpeakDetail( OwnerID(), "[SC_LV50_WARRIOR_1]" ) --�ŦX���󪺹��
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_LV50_WARRIOR_2]", "EliteSkillQuest_Warrior_1",0 ); --�}�l�԰������
	else
		SetSpeakDetail( OwnerID(), "[SC_LV50_WARRIOR_3]" ) --���ŦX���󪺹��
	end
end

function EliteSkillQuest_Warrior_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) == 1 and (CheckAcceptQuest( OwnerID() , 422368 ) == true or CheckAcceptQuest( OwnerID() , 422379 ) == true ) and CheckFlag( OwnerID() ,542702 ) == false and ReadRoleValue(TargetID() , EM_RoleValue_PID) == 0 then
		Hide( TargetID() )
		BeginPlot( TargetID() , "EliteSkillQuest_Warrior_2" , 0 )
	else
		Tell( OwnerID() , TargetID() , "[SC_LV50_WARRIOR_4]" ) --���U�T�w�ᤣ�ŦX���󪺰T��
	end
end

function EliteSkillQuest_Warrior_2()
	local Player = TargetID()
	local Boss =Lua_CreateObjByDir(OwnerID(), 102117 , 0 , 180 )
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local DBID = ReadRoleValue( Player , EM_RoleValue_DBID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
	SetModeEX( Boss , EM_SetModeType_Move , false )
	AddToPartition( Boss , RoomID )

	Yell( Boss , "[SC_LV50_WARRIOR_5]" , 3 ) --���ܾ԰��}�l���T��
	AddBuff( Boss , 501469 , 1 , 65535 )
	SetAttack( Boss , TargetID() )
	WriteRoleValue( Boss, EM_RoleValue_PID , Player )
	WriteRoleValue( Boss, EM_RoleValue_Register , DBID )
	WriteRoleValue( Boss, EM_RoleValue_LiveTime , 480 )
	SetPlot( Boss , "dead" , "EliteSkillQuest_Warrior_BossD" , 0 )
	BeginPlot( Boss , "EliteSkillQuest_Warrior_3" , 0 )

	for i = 0 , 480 , 1  do
		if ReadRoleValue(Player , EM_RoleValue_IsDead ) == 1 or CheckID(Player ) == false then
			Yell( Boss , "[SC_LV50_WARRIOR_6]" , 3 ) --�D�ԥ��Ѫ��T��
			DelObj( Boss)
			break
		end
		if Luafunc_Player_Alive(Player , DBID , 200 ) == false then
			Yell( Boss , "[SC_LV50_WARRIOR_7]" , 3 ) --�D�ԥ��Ѫ��T��
			DelObj( Boss)
			break
		end
		if CheckID( Boss) == false or ReadRoleValue( Boss, EM_RoleValue_OrgID ) ~= 102117 then
			break
		end
		if i == 480 then
			Yell( Boss , "[SC_LV50_WARRIOR_8]" , 3 ) --�D�ԥ��Ѫ��T��
			DelObj( Boss)
			break
		end
		sleep( 10 )
	end
	Show( OwnerID() , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function EliteSkillQuest_Warrior_3()
	local Flag = 780365
	local Count = GetMoveFlagCount(Flag)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Num = 0
	local Pos = {}
	local Mob = {}
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local DBID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Timer = 0
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			if Timer == 0 then
				Num = DW_Rand(Count-1)
				for i = 1 , 3 , 1 do
					Pos["X"] = GetMoveFlagValue( Flag  , Num , EM_RoleValue_X ) + math.cos((math.pi/2)*i )*10
					Pos["Z"] = GetMoveFlagValue( Flag  , Num , EM_RoleValue_Z ) + math.sin((math.pi/2)*i )*10
					Pos["Y"] = GetMoveFlagValue( Flag  , Num , EM_RoleValue_Y )
					Pos["Y"] = GetHeight( Pos["X"] , Pos["Y"]  , Pos["Z"]  );
					Mob[i] = CreateObj( 102118 , Pos["X"] , Pos["Y"]  , Pos["Z"]  , 0 , 1 )
					WriteRoleValue( Mob[i]  , EM_RoleValue_PID , Player )
					WriteRoleValue( Mob[i]  , EM_RoleValue_Register , DBID )
					WriteRoleValue( Mob[i]  , EM_RoleValue_Register+1 , OwnerID() )
					SetModeEX(  Mob[i] , EM_SetModeType_Strikback , false )
					SetModeEX(  Mob[i] , EM_SetModeType_Searchenemy , false )
					AddToPartition( Mob[i] , RoomID)
					SetPlot( Mob[i] , "dead" , "EliteSkillQuest_Warrior_MobDead" , 0 )
					EnableNpcAI( Mob[i], false );
					MoveToFlagEnabled(  Mob[i], false );
					AddBuff( Mob[i] , 502707 , 1 , -1 )
					AddBuff( Mob[i]  , 501469 , 1 , 65535 )
					BeginPlot( Mob[i] , "EliteSkillQuest_Warrior_BossFood" , 0 )
				end
			end
			sleep( 10 )
			Timer = Timer + 1
			if Timer == 30 then
				Timer = 0
			end
		else
			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
				Yell( OwnerID()  , "[SC_LV50_WARRIOR_6]" , 3 ) --�D�ԥ��Ѫ��T��
			end
			break
		end
	end
	DelObj( OwnerID() )
end

function EliteSkillQuest_Warrior_BossD()
	local Player = ReadRoleValue( OwnerID() ,  EM_RoleValue_PID )
	local DBID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if CheckID( Player ) == true and ReadRoleValue( Player , EM_RoleValue_DBID ) == DBID and ReadRoleValue( Player , EM_RoleValue_IsDead ) == 0 then
		SetFlag( Player , 542702 , 1 )
		Yell( OwnerID() , "[SC_LV50_WARRIOR_9]" , 3 ) --�D�Ԧ��\���T��
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	end
	DelObj( OwnerID() )
	return false
end

function EliteSkillQuest_Warrior_MobDead()
	local Player = ReadRoleValue( OwnerID() ,  EM_RoleValue_PID )
	local DBID = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register +1 )
	if TargetID() == Player and ReadRoleValue(TargetID() , EM_RoleValue_DBID ) == DBID then
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102117 then
			local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )
			if ReadRoleValue( Boss , EM_RoleValue_HP ) > ( MaxHP*3/ 100 ) then
				AddRoleValue( Boss , EM_RoleValue_HP , -( MaxHP*3/100 ) )
			else
				BeginPlot( Boss, "EliteSkillQuest_Warrior_BossD" , 0 )
			end
		end
		return ture
	end
	return false
end

function EliteSkillQuest_Warrior_BossFood()
	local Boss = TargetID()
	local Obj = Role:new( Boss )
	while 1 do
		if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 or CheckID(Boss) == false then
			Delobj( OwnerID() )
			return
		end
		if ReadRoleValue(OwnerID(), EM_RoleValue_IsDead ) == 1 then
			return
		end
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 102117 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(10)
	end

	local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )
	if ReadRoleValue( Boss , EM_RoleValue_HP ) < ( MaxHP * 98 / 100 ) then
		CastSpell( OwnerID() , Boss , 492365 )
		AddRoleValue( Boss , EM_RoleValue_HP , ( 3*MaxHP/100 ) )
	else
		CastSpell( OwnerID() , Boss , 492365 )
		WriteRoleValue( Boss , EM_RoleValue_HP , MaxHP )
	end

	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end



-------------------------------���q------------------------------------------------



function LuaS_422383_0()--��ܼ@��
	LoadQuestOption( OwnerID() );
	if	(CheckAcceptQuest( OwnerID(), 422383 )	or
		CheckAcceptQuest( OwnerID(), 422372 ))	and
		CheckFlag(OwnerID(),542701 )==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422372_0]","LuaS_422383_4",0)
	end
end

function LuaS_422383_4()--��ܼ@��
	SetSpeakDetail ( OwnerID(),"[SC_422372_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422372_2]","LuaS_422383_1",0)

end

function LuaS_422383_1()
	CloseSpeak( OwnerID() );
	DisableQuest( TargetID() , true ) -- luck
	BeginPlot(TargetID(),"LuaS_422383_2",0)
end

function LuaS_422383_2() -- �o���I�O  ��ۤv�ð_�� �إߴ����h�԰�
	sleep(10)
	Say(OwnerID(),"[SC_422372_3]")
	sleep(15)
	Say(OwnerID(),"[SC_422372_4]")
	local Fighter = Lua_DW_CreateObj("obj",102111,OwnerID()) --�ش���
	Hide(OwnerID()) --���_��
	local BadGuy = Lua_DW_CreateObj("flag",102112,780088,1) --���a�J
	SetPlot(BadGuy,"dead","LuaS_422383_3",0)
	SetAttack(Fighter,BadGuy)
	SetAttack(BadGuy,Fighter)
	while true do
		sleep(10)
		if	not CheckID(Fighter)	then
			if	BadGuy ~= nil	then
				DelObj(BadGuy)
				break
			end
		end
		if	not CheckID(BadGuy)	then
			if	Fighter ~= nil	then
				DelObj(Fighter)
				break
			end
		end
	end
	Show(OwnerID(),0)
	DisableQuest( OwnerID() , false ) -- unluck
end

function LuaS_422383_3()
	local Killer
	local Reset = 0
	for	i=0,HateListCount(OwnerID())-1	do
		Killer = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID );
		if	ReadRoleValue(Killer,EM_RoleValue_OrgID) == 102111	and
			Reset == 0						then
			if	ReadRoleValue(Killer,EM_RoleValue_IsDead) == 0	then
				Reset = 1	--���}�}��
				i = 0		--���Ӥ@��
			end
		end
		if	Reset == 1	then
			if	ReadRoleValue(Killer,EM_RoleValue_IsPlayer)==1	then
				if	(CheckAcceptQuest(Killer,422383)	or
					CheckAcceptQuest( Killer, 422372 ))	and  --�������ȴN��
					CheckFlag(Killer,542701 )==false	then
					SetFlag(Killer,542701,1)
				end
			end
		end
	end
	return true
end