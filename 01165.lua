--------------------------------------------------�ͥX�]�k�L�O��
function Lua_Race_BronFlagSide(Owner,RoomID)
	local dis = 30
	local hindrance = {}
	local OldX = ReadRoleValue(  Owner , EM_RoleValue_X )
	local OldY = ReadRoleValue(  Owner , EM_RoleValue_Y )
	local OldZ = ReadRoleValue(  Owner , EM_RoleValue_Z )
	local OldDir = ReadRoleValue(  Owner , EM_RoleValue_Dir )
	local Cal = (math.pi/180)*(OldDir) 
	dis = 20
	hindrance[0] = CreateObj( 200964, OldX+dis*math.sin(Cal) ,OldY+5 ,OldZ +dis*math.cos(Cal),OldDir , 1 )
	hindrance[1] = CreateObj( 200964, OldX-dis*math.sin(Cal) ,OldY+5 ,OldZ -dis*math.cos(Cal),OldDir , 1 )
	dis = 40
	hindrance[2] = CreateObj( 200964, OldX+dis*math.sin(Cal) ,OldY+5 ,OldZ +dis*math.cos(Cal),OldDir , 1 )
	hindrance[3] = CreateObj( 200964, OldX-dis*math.sin(Cal) ,OldY+5 ,OldZ -dis*math.cos(Cal),OldDir , 1 )
	for i=0,table.getn(hindrance) do
		SetModeEx( hindrance[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( hindrance[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( hindrance[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( hindrance[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( hindrance[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( hindrance[i], EM_SetModeType_Gravity, true )--���O
		SetModeEx( hindrance[i], EM_SetModeType_Move, false )--����
		SetModeEx( hindrance[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( hindrance[i], EM_SetModeType_Searchenemy, false )--����
		AddToPartition( hindrance[i] ,  RoomID  )
	end
	return hindrance	--�^�Ǩ���L�O�}�C
end
function Lua_Race_BronFlagMiddle(Owner)
	local RoomID = ReadRoleValue(  Owner , EM_RoleValue_RoomID)
	local Flag = 780242		--�X�l�s��
	local FlagCount = GetMoveFlagCount(Flag)
	local Mark = {}
	local hindrance = {}
	for i = 0, FlagCount do
		Mark[i] = CreateObjByFlag( 200964, Flag , i , 1 )
		hindrance[i] = Lua_Race_BronFlagSide( Mark[i],RoomID )
		AddToPartition( Mark[i] ,  RoomID  )
	end
	return Mark,hindrance	--�^�ǩҦ��L�O�}�C
end


--------------------------------------------------------------------------------���I�I���@��

function Lua_Race_CollisionWin()
	local ZoneID =   ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local TeamID = GetTeamID( OwnerID() )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_WIN1][$SETVAR1="..Name.."]", 0 )
	SetScore( RoomID, TeamID, 1 );	--�]�w�Ĥ@�W����
	ChangeZone( OwnerID(), ZoneID , RoomID , 4842 , -4 , 3961, 216)
	Lua_race_FireworkMade()
	SetPlot( TargetID() , "Collision" , "Lua_Race_CollisionWin2" , 50 )
end

function Lua_Race_CollisionWin2()
	local ZoneID =   ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local TeamID = GetTeamID( OwnerID() )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_WIN2][$SETVAR1="..Name.."]", 0 )
	SetScore( RoomID, TeamID, 2 );	--�]�w�ĤG�W����
	ChangeZone( OwnerID(), ZoneID , RoomID , 4842 , -4 , 3961, 216)
	Lua_race_FireworkMade()
	SetPlot( TargetID() , "Collision" , "Lua_Race_CollisionWin3" , 50 )
end

function Lua_Race_CollisionWin3()
	local ZoneID =   ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )

	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local TeamID = GetTeamID( OwnerID() )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_WIN3][$SETVAR1="..Name.."]", 0 )
	SetScore( RoomID, TeamID, 3 );	--�]�w�ĤT�W����
	ChangeZone( OwnerID(), ZoneID , RoomID , 4842 , -4 , 3961, 216)
	Lua_race_FireworkMade()
	SetPlot( TargetID() , "Collision" , "Lua_Race_CollisionWin4" , 50 )
end

function Lua_Race_CollisionWin4()
	local ZoneID =   ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )

	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local TeamID = GetTeamID( OwnerID() )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_WIN4][$SETVAR1="..Name.."]", 0 )
	SetScore( RoomID, TeamID, 4 );	--�]�w�ĥ|�W����
	ChangeZone( OwnerID(), ZoneID , RoomID , 4842 , -4 , 3961, 216)
	Lua_race_FireworkMade()
	SetPlot( TargetID() , "Collision" , "Lua_Race_CollisionWin5" , 50 )
end

function Lua_Race_CollisionWin5()
	local ZoneID =   ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )

	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local TeamID = GetTeamID( OwnerID() )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_WIN5][$SETVAR1="..Name.."]", 0 )
	SetScore( RoomID, TeamID, 5 );	--�]�w�Ĥ��W����
	ChangeZone( OwnerID(), ZoneID , RoomID , 4842 , -4 , 3961, 216)
	Lua_race_FireworkMade()
	SetPlot( TargetID() , "Collision" , "Lua_Race_CollisionWin6" , 50 )
end

function Lua_Race_CollisionWin6()
	local ZoneID =   ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )

	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local TeamID = GetTeamID( OwnerID() )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_WIN6][$SETVAR1="..Name.."]", 0 )
	SetScore( RoomID, TeamID, 6 );	--�]�w�Ĥ��W����
	ChangeZone( OwnerID(), ZoneID , RoomID , 4842 , -4 , 3961, 216)
	Lua_race_FireworkMade()
	SetPlot( TargetID() , "Collision" , "Lua_Race_CollisionWin7" , 50 )
end

function Lua_Race_CollisionWin7()
	local ZoneID =   ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )

	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local TeamID = GetTeamID( OwnerID() )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_WIN7][$SETVAR1="..Name.."]", 0 )
	SetScore( RoomID, TeamID, 7 );	--�]�w�ĤC�W����
	ChangeZone( OwnerID(), ZoneID , RoomID , 4842 , -4 , 3961, 216)
	Lua_race_FireworkMade()
	SetPlot( TargetID() , "Collision" , "Lua_Race_CollisionWin8" , 50 )
end

function Lua_Race_CollisionWin8()
	local ZoneID =   ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )

	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local TeamID = GetTeamID( OwnerID() )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_WIN8][$SETVAR1="..Name.."]", 0 )
	SetScore( RoomID, TeamID, 8 );	--�]�w�ĤK�W����
	ChangeZone( OwnerID(), ZoneID , RoomID , 4842 , -4 , 3961, 216)
	Lua_race_FireworkMade()
	SetPlot( TargetID() , "Collision" , "" , 0 )
end
---------------------------------------------------------------------------------------------

--�[���@��
function Lua_race_victor()
	MoveToFlagEnabled( OwnerID(), false );
	while 1 do
	Local Speak={}
	Local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_APPLAUSE
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_APPROVAL
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_LAUGH
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_PROVOKE
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[5] = ruFUSION_ACTORSTATE_EMOTE_DANCE
	Speak[6] = ruFUSION_ACTORSTATE_EMOTE_WAVE

	for n = 1 , 2  do 
		math.randomseed(math.random(10000, 99999))
		local RandBox = math.random(1,6)
--		Say(OwnerID(),RandBox )
		Motion = Speak[RandBox]
		PlayMotion( OwnerID(),Motion )
		local RandTime = math.random(10,40)
		sleep(RandTime )
	end
	Sleep(20)
	end
end

function Lua_race_FireworkMade()	--�Ϥ��@��
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Firework = {}
	Firework[0] = CreateObj( 101330, 4417, -20, 4179, 20, 1)
	Firework[1] = CreateObj( 101330, 4483, -20, 4313, 20, 1)
	Firework[2] = CreateObj( 101330, 4452, -20, 4240, 20, 1)
	Firework[3] = CreateObj( 101330, 4427, -20, 4203, 20, 1)
	Firework[4] = CreateObj( 101330, 4466, -20, 4271, 20, 1)
	for i = 0, table.getn(Firework) do
		SetModeEx( Firework[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Firework[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( Firework[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( Firework[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Firework[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( Firework[i], EM_SetModeType_Gravity, false )--���O
		SetModeEx( Firework[i], EM_SetModeType_Move, false )--����
		SetModeEx( Firework[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Firework[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Firework[i], EM_SetModeType_Show, true )--���
		AddToPartition( Firework[i] ,  RoomID  )
		CastSpell(Firework[i],Firework[i],492036)
		BeginPlot(Firework[i],"Lua_race_DelOwner", 0 )
	end
end

function Lua_Clockending()
	ClockClose(OwnerID())
end