--Quest 421789 : Flag 780278 < 0~6 >
function LuaI_PhaseTrans()
	AddBuff( OwnerID() , 502715  , 1 , -1 )
end
function LuaQ_BeforClick_421789()
	local Str = "[SC_421789_0][$SETVAR1="..GetName( TargetID() ).."]"
	if CheckBuff( OwnerID() , 502714 ) ~= true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , Str, 0  )
		return false
	end
	return true
end
function LuaS_112214_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421789 ) == true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112214_0]","LuaS_112214_1",0) --我需要相位干擾魔法 
	end
end
function LuaS_112214_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_112214_2" , 0 )
end
function LuaS_112214_2()
	CastSpell( OwnerID() , TargetID() , 492486 )
	AddBuff( TargetID() , 502714 , 1 , 1800 )
end
function LuaQ_CompleteQuest_421789()
	if CheckBuff( TargetID() , 502714  ) == true then
		CancelBuff( TargetID() , 502714  )
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 5 then
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 5 )
	DisableQuest( OwnerID() , True )
	local Flag = 780278
	local BlackSwordman = CreateObjByFlag( 101607, Flag , 0 , 1 )
	SetFightMode ( BlackSwordman , 0, 1, 0 , 0 )
	local People = {}
	local RandStr = {[1] = "[SC_421789_1]" , [2] = "[SC_421789_2]" , [3] = "[SC_421789_3]"}
	local Str = {[1] = "[SC_421789_6]" , [2] = "[SC_421789_7]" , [3] = "[SC_421789_8]"}
	local NPC = {}
	NPC[1] =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,112169, 500 ) 
	local Dir1 = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Dir2 = ReadRoleValue( NPC[1], EM_RoleValue_Dir )
	DisableQuest( NPC[1] , True )
	People[1] = CreateObjByFlag( 112226, Flag , 1 , 1 )
	People[2] = CreateObjByFlag( 112227, Flag , 2 , 1 )
	People[3] = CreateObjByFlag( 112228, Flag , 3 , 1 )
	for i = 1 , 3 , 1 do
		AddToPartition( People[i] , 0 )
		WriteRoleValue( People[i] , EM_RoleValue_PID , i + 3 )
		WriteRoleValue( People[i] , EM_RoleValue_IsWalk , 1 )
		MoveToFlagEnabled( People[i] , false )
		BeginPlot( People[i] , "LuaQ_421789_Play" , 0 )
	end
	sleep( 10 )
	Say( OwnerID() , "[SC_421789_4]" )
	sleep( 30 )
	for i = 1 , 60 , 1 do
		if ReadRoleValue( People[1] , EM_RoleValue_PID ) == 777 then
			break
		else
			local RandNum = Rand( 30 )
			RandNum = math.floor( (RandNum/10) + 1 )
			Yell( People[RandNum] , RandStr[RandNum] , 2 )
		end
		sleep( 10 )
	end
	AddToPartition( BlackSwordman , 0 )
	Yell( BlackSwordman , "[SC_421789_5]" , 4 )
	PlayMotion( BlackSwordman ,ruFUSION_ACTORSTATE_EMOTE_THREATEN )
	AdjustFaceDir( OwnerID(), BlackSwordman , 0 ) 
	AdjustFaceDir( NPC[1]  , BlackSwordman , 0 ) 
	sleep( 50 )
	for i = 1 , 3 , 1 do
		WriteRoleValue( People[i] , EM_RoleValue_PID , i )
		WriteRoleValue( People[i] , EM_RoleValue_IsWalk , 0)
		Yell( People[i] , Str[i] , 2 )
		PlayMotion( People[i] , ruFUSION_ACTORSTATE_HURT_CRITICAL )
		BeginPlot( People[i] , "LuaQ_421789_Play2" , 0 )
	end
	sleep( 50 )
	Yell( BlackSwordman , "[SC_421789_9]" , 2 )
	PlayMotion( BlackSwordman ,ruFUSION_ACTORSTATE_EMOTE_WAVE )
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_WAVE )
	PlayMotion( NPC[1]  ,ruFUSION_ACTORSTATE_EMOTE_WAVE )
	sleep( 20 )
	AdjustDir( BlackSwordman, 180 )
	sleep( 15 )
	PlayMotion( BlackSwordman ,ruFUSION_ACTORSTATE_SP_SPINKICK )
	sleep(5)
	DelObj( BlackSwordman )
	SetDir( OwnerID(), Dir1)
	SetDir( NPC[1]  , Dir2)
	sleep(10)
	DisableQuest( NPC[1] , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	DisableQuest( OwnerID() , false )
end
function LuaQ_421789_Play()
	local Flag = 780278
	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	LuaFunc_MoveToFlag( OwnerID(), Flag , ID ,0 )
	sleep( 5 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 777 )
end

function LuaQ_421789_Play2()
	local Flag = 780278
	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	sleep( 15 )
	LuaFunc_MoveToFlag( OwnerID(), Flag , ID ,0 )
	sleep( 5 )
	DelObj( OwnerID() )
end