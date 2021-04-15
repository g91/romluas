--Quest 421790 : Flag 780278 < 7~9 >
function LuaQ_Complete_421790()
	DisableQuest( OwnerID() , true)
	local Flag = 780278
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,112271 , 50 , 1 )
	local Str = {[1] = "[SC_421790_1]" , [2] = "[SC_421790_2]",[3] = "[SC_421790_3]"}
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	for i = 1 , 3 , 1 do
		if NPC[i] == -1 then
			break
		end
--		PlayMotion( NPC[i] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Yell( NPC[i] , Str[i] , 3 )
		sleep( 20 )
	end
	local Girl = CreateObjByFlag(112213 , Flag , 7 , 1 )
	DisableQuest( Girl , true )
	MoveToflagEnabled( Girl , false )
	WriteRoleValue( Girl , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Girl , 0 )
	AdjustFaceDir( OwnerID(), Girl, 0 ) 
	LuaFunc_MoveToFlag( Girl , Flag , 8 ,0 )
	sleep(10)
	AdjustFaceDir( Girl , OwnerID() , 0 ) 
	sleep(10)
	Yell( Girl , "[SC_421790_4]" , 2 )
	PlayMotion( Girl , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep( 20 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)
	Yell( Girl , "[SC_421790_5]" , 2 )
	BeginPlot( Girl , "LuaQ_421790_Play" , 0 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_421790_6]" , 2 )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep( 20 )
	SetDir( OwnerID(), Dir)
	sleep( 5 )
	DisableQuest( OwnerID() , false )
end

function LuaQ_421790_Play()
	local Flag = 780278
	LuaFunc_MoveToFlag( OwnerID(), Flag , 9 ,0 )
	sleep(5)
	DelObj( OwnerID() )
end
--Quest 421792
function LuaQ_421792_AfterClick()
	local Num = CountBodyItem( OwnerID() , 203706 ) 
	if Num == 11 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421792_1]" , 0 )
	end
	if Num > 5 and Num < 11 then
		local RandNum = Rand( 100 )
		RandNum = RandNum - 10*math.floor(RandNum/10)
		if RandNum < 5 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421792_0]" , 0 )
		end
	end
	return 1
end

function LuaQ_421792_Complete()
	local NPC =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,112226, 210 ) 
	if CheckID( NPC ) == true then
		tell( TargetID() , NPC , "[SC_112226_0]")
	end 
end
--Quest421793: Flag 780278 <1, 10 , 11 >
function LuaQ_421793_Complete()
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 5 then
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 5 )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Flag = 780278
	DisableQuest( OwnerID() , true )
	local Girl = CreateObjByFlag( 112213 , Flag , 1 , 1 )
	DisableQuest( Girl , true )
	MoveToflagEnabled( Girl , false )
	WriteRoleValue( Girl , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Girl , 0 )
	AdjustFaceDir( OwnerID(), Girl, 0 ) 
	LuaFunc_MoveToFlag( Girl , Flag , 10 ,0 )
	sleep(10)
	AdjustFaceDir( Girl , OwnerID() , 0 ) 
	sleep(10)
	Yell( Girl , "[SC_421793_0]" , 2 )
	PlayMotion( Girl , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep( 20 )
	Yell( OwnerID() , "[SC_421793_1]" , 2 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
	sleep(20)
	Yell( Girl , "[SC_421793_2]" , 2 )
	PlayMotion( Girl , ruFUSION_ACTORSTATE_EMOTE_VICTORY)
	sleep( 20 )
	Yell( OwnerID() , "[SC_421793_3]" , 2 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Yell( Girl , "[SC_421793_4]" , 2 )
	PlayMotion( Girl , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep( 20 )
	Yell( OwnerID() , "[SC_421793_5]" , 2 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
	sleep(20)
	Yell( Girl , "[SC_421793_6]" , 2 )
	PlayMotion( Girl , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 20 )
	Yell( Girl , "[SC_421793_7]" , 2 )
	PlayMotion( Girl , ruFUSION_ACTORSTATE_EMOTE_WAVE )
	sleep( 20 )
	BeginPlot( Girl , "LuaQ_421793_Play" , 0 )
	sleep( 10 )
	Yell( OwnerID() , "[SC_421790_8]" , 2 )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep( 20 )
	SetDir( OwnerID(), Dir)
	sleep( 5 )	
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	DisableQuest( OwnerID() , false )
end
function LuaQ_421793_Play()
	local Flag = 780278
	LuaFunc_MoveToFlag( OwnerID(), Flag , 11 ,0 )
	sleep(5)
	DelObj( OwnerID() )
end
--Quest421794
function LuaQ_421794_Accept()
	if CheckFlag( TargetID() , 542379 ) == false then
		SetFlag( TargetID() , 542379 , 1 )
		local NPC =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,112211,200 ) 
		if CheckID( NPC ) == true then
			tell( TargetID() , NPC , "[SC_112211_0]")
		end 
	end
end
function LuaI_203720_Check()
	local Check = 0
	local NPC = 0
	Check = LuaFunc_SearchNPCbyOrgID( OwnerID() ,112274, 100 )
	NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() ,112212, 250 )
	
	if CheckFlag( OwnerID() , 542360 ) == true or CheckCompleteQuest(OwnerID() , 421797) == true or CheckAcceptQuest(OwnerID() , 421797)== false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203720_1]" , 0 )
		return false
	elseif Check < 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203720_0]" , 0 )
		return false
	elseif NPC > 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203720_2]" , 0 )
		return false		
	else
		return true
	end
end
--Quest421797: Flag 780278 <12 ~ 20>
function LuaI_203720_USE()
	local NPC = CreateObjByFlag( 112212, 780278 , 12 , 1 )
	BeginPlot( NPC , "LuaQ_421797_PLAY" , 0 )
end
function LuaQ_421797_PLAY()
	local Player = TargetID()
	local PlayerDBID = ReadRoleValue( TargetID() , EM_RoleValue_DBID )
	local Pirate ={}
	MoveToFlagEnabled( OwnerID() , false )
	DisableQuest( OwnerID() , true)
	AddToPartition( OwnerID() , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	sleep( 5 )
	LuaFunc_MoveToFlag( OwnerID() , 780278 , 16 ,0 )
	sleep( 5 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	for i = 1 , 3 , 1 do
		Pirate[i] = CreateObjByFlag( 100336, 780278 , 12+i , 1 )
		MoveToFlagEnabled(Pirate[i]  , false )
		WriteRoleValue( Pirate[i] , EM_RoleValue_PID , 16 + i )
		WriteRoleValue( Pirate[i] , EM_RoleValue_IsWalk , 1 )
		WriteRoleValue( Pirate[i] , EM_RoleValue_Register , 1 )
		SetModeEx( Pirate[i] , EM_SetModeType_Fight , false)
		SetModeEx( Pirate[i] , EM_SetModeType_Searchenemy , false)
		SetModeEx( Pirate[i] , EM_SetModeType_Strikback , false)
		AddToPartition( Pirate[i] , 0 )
		BeginPlot( Pirate[i] , "LuaQ_421797_Pirate" , 0 )
	end
	for i = 1 , 120 , 1 do
		if ReadRoleValue( Pirate[1] , EM_RoleValue_Register ) == 0 then
			break
		end
		sleep(10)
	end
	for i = 1 , 3 , 1 do
		AdjustFaceDir( Pirate[i] , OwnerID() , 0 ) 
	end
	sleep( 5 )
	Yell( Pirate[1] , "[SC_421797_1]" , 2 )
	PlayMotion( Pirate[1] , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	sleep( 15 )
	Yell( Pirate[2] , "[SC_421797_2]" , 2 )
	PlayMotion( Pirate[2] , ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	sleep( 15 )
	Yell( Pirate[1] , "[SC_421797_3]" , 2 )
	PlayMotion( Pirate[1] , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep( 15 )
	Yell( Pirate[3] , "[SC_421797_4]" , 2 )
	PlayMotion( Pirate[3] , ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	sleep( 15 )
	for i = 1 , 3 , 1 do
		PlayMotion( Pirate[i] , ruFUSION_ACTORSTATE_CAST_BEGIN)
		Yell( Pirate[i] , "[SC_421797_5]" , 2 )
	end
	sleep(20)
	for i = 1 , 3 , 1 do
		PlayMotion( Pirate[i] , ruFUSION_ACTORSTATE_CAST_END)
	end
	Yell( Pirate[1] , "[SC_421797_6]" , 2 )
	sleep( 20 )
	for i = 1 , 3 , 1 do
		WriteRoleValue( Pirate[i] , EM_RoleValue_Register , 2 )
		BeginPlot( Pirate[i] , "LuaQ_421797_Pirate" , 0 )
	end
	for i = 1 , 120 , 1 do
		if ReadRoleValue( Pirate[1] , EM_RoleValue_Register ) == 0 then
			break
		end
		sleep(10)
	end
	for i = 1 , 3 , 1 do
		Delobj( Pirate[i] )
	end
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_REVIVING)
	Hide( OwnerID() )
	Show( OwnerID() , 0 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(15)
	if CheckID( TargetID() ) == true and Luafunc_Player_Alive( Player , PlayerDBID , 300 ) == true then
		if CheckAcceptQuest( TargetID() , 421797 ) == true then
			SetFlag(  TargetID()  , 542360 , 1 )
		end
		local Party =  LuaFunc_PartyData(Player) 
		for i = 1 , Party[0] , 1 do
			if CheckAcceptQuest( Party[i] , 421797 ) == true then
				SetFlag( Party[i] , 542360 , 1 )
			end
		end
	end
	DisableQuest( OwnerID() , false )
	sleep( 300 )
	DisableQuest( OwnerID() , true)
	Yell( OwnerID() , "[SC_421797_0]" , 2 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_END )
	sleep( 20 )
	LuaFunc_MoveToFlag( OwnerID() , 780278 , 20 ,0 )
	sleep( 5 )
	DelObj( OwnerID() )
end

function LuaQ_421797_Pirate()
	local FlagID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) ~= 1 then
		FlagID = FlagID - 4
	end
	LuaFunc_MoveToFlag( OwnerID() , 780278 , FlagID , 0 )
	sleep(5)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end
--Quest421798
function LuaS_112212_0()
	if CheckAcceptQuest( OwnerID() , 421798 ) == true and CheckFlag( OwnerID() , 542361) == false then
		SetSpeakDetail( OwnerID(), "[SC_112212_6]" )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112212_0]", "LuaS_112212_1", 0 ) 
	else
		LoadQuestOption( OwnerID() )
	end
end
function LuaS_112212_1()
	SetSpeakDetail( OwnerID(), "[SC_112212_1]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112212_2]", "LuaS_112212_2", 0 ) 
end
function LuaS_112212_2()
	SetSpeakDetail( OwnerID(), "[SC_112212_3]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112212_4]", "LuaS_112212_3", 0 ) 
end
function LuaS_112212_3()
	SetSpeakDetail( OwnerID(), "[SC_112212_5]" )
	SetFlag( OwnerID() , 542361 , 1 )
end