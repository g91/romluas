--------------------------------------------------生出魔法印記用
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
		SetModeEx( hindrance[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( hindrance[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( hindrance[i], EM_SetModeType_Mark, false )--標記
		SetModeEx( hindrance[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( hindrance[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( hindrance[i], EM_SetModeType_Gravity, true )--重力
		SetModeEx( hindrance[i], EM_SetModeType_Move, false )--移動
		SetModeEx( hindrance[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( hindrance[i], EM_SetModeType_Searchenemy, false )--索敵
		AddToPartition( hindrance[i] ,  RoomID  )
	end
	return hindrance	--回傳兩邊印記陣列
end
function Lua_Race_BronFlagMiddle(Owner)
	local RoomID = ReadRoleValue(  Owner , EM_RoleValue_RoomID)
	local Flag = 780242		--旗子編號
	local FlagCount = GetMoveFlagCount(Flag)
	local Mark = {}
	local hindrance = {}
	for i = 0, FlagCount do
		Mark[i] = CreateObjByFlag( 200964, Flag , i , 1 )
		hindrance[i] = Lua_Race_BronFlagSide( Mark[i],RoomID )
		AddToPartition( Mark[i] ,  RoomID  )
	end
	return Mark,hindrance	--回傳所有印記陣列
end


--------------------------------------------------------------------------------終點碰撞劇情

function Lua_Race_CollisionWin()
	local ZoneID =   ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue(  OwnerID() , EM_RoleValue_RoomID)
	local TeamID = GetTeamID( OwnerID() )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_WIN1][$SETVAR1="..Name.."]", 0 )
	SetScore( RoomID, TeamID, 1 );	--設定第一名分數
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
	SetScore( RoomID, TeamID, 2 );	--設定第二名分數
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
	SetScore( RoomID, TeamID, 3 );	--設定第三名分數
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
	SetScore( RoomID, TeamID, 4 );	--設定第四名分數
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
	SetScore( RoomID, TeamID, 5 );	--設定第五名分數
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
	SetScore( RoomID, TeamID, 6 );	--設定第六名分數
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
	SetScore( RoomID, TeamID, 7 );	--設定第七名分數
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
	SetScore( RoomID, TeamID, 8 );	--設定第八名分數
	ChangeZone( OwnerID(), ZoneID , RoomID , 4842 , -4 , 3961, 216)
	Lua_race_FireworkMade()
	SetPlot( TargetID() , "Collision" , "" , 0 )
end
---------------------------------------------------------------------------------------------

--觀眾劇情
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

function Lua_race_FireworkMade()	--煙火劇情
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Firework = {}
	Firework[0] = CreateObj( 101330, 4417, -20, 4179, 20, 1)
	Firework[1] = CreateObj( 101330, 4483, -20, 4313, 20, 1)
	Firework[2] = CreateObj( 101330, 4452, -20, 4240, 20, 1)
	Firework[3] = CreateObj( 101330, 4427, -20, 4203, 20, 1)
	Firework[4] = CreateObj( 101330, 4466, -20, 4271, 20, 1)
	for i = 0, table.getn(Firework) do
		SetModeEx( Firework[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Firework[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Firework[i], EM_SetModeType_Mark, false )--標記
		SetModeEx( Firework[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Firework[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Firework[i], EM_SetModeType_Gravity, false )--重力
		SetModeEx( Firework[i], EM_SetModeType_Move, false )--移動
		SetModeEx( Firework[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Firework[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Firework[i], EM_SetModeType_Show, true )--顯示
		AddToPartition( Firework[i] ,  RoomID  )
		CastSpell(Firework[i],Firework[i],492036)
		BeginPlot(Firework[i],"Lua_race_DelOwner", 0 )
	end
end

function Lua_Clockending()
	ClockClose(OwnerID())
end