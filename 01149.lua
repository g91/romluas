function LuaI_101503_Set()
	local Door = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112078 , 500 , 0)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Door )
	SetPlot( OwnerID() , "Dead" , "LuaI_101503_Dead" , 0)
end

function LuaI_101503_Dead()
	local Door = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	SetPlot( Door , "touch" , "LuaI_101503_Door" , 70 )
	return true
end

function LuaI_101503_Door()
	SetPlot( TargetID()  , "touch" , "" , 0 )
	BeginPlot( TargetID() , "LuaI_101503_DootDrama" ,0 )
end

function LuaI_101503_DootDrama()
	local Siaf = CreateObjByFlag( 112077 , 780239 , 0 , 1 )
	WriteRoleValue( Siaf, EM_RoleValue_PID , TargetID() )
	BeginPlot( Siaf , "LuaI_Siaf112077_KnockDoor" , 0 )
end

function LuaI_Siaf112077_KnockDoor()
	DisableQuest( OwnerID() , True )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Party = LuaFunc_PartyData(Player) 
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	sleep( 5 )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_112077_OD_0]" , 1 ) --空氣中突然飄來一陣甜膩的香味，讓你感到昏昏欲睡
	for i = 1 , Party[0] , 1 do
		if ReadRoleValue( Party[i] , EM_RoleValue_IsDead ) ~= 1 then
			AddBuff( Party[i] , 502502 , 30 , 30 )
		end
	end
	sleep(50)
	AddToPartition( OwnerID() , RoomID )
	LuaFunc_MoveToFlag( OwnerID(), 780239 , 1 , 10 )
	sleep(5)
	AdjustFaceDir( OwnerID(), Player, 0 ) 
	sleep(5)
	Yell( OwnerID() , "[SC_112077_OD_1]",5 ) --這麼多擋路的都被你們幹掉了，厲害！
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	sleep(10)
	Yell( OwnerID() , "[SC_112077_OD_2]" , 5) --現在，來看看怎麼打開這扇門吧！
	LuaFunc_MoveToFlag( OwnerID(), 780239 , 2 , 10 )
	sleep(5)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	sleep(15)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep(15)
	local Door = TargetID()
	PlayMotionEX(Door ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	CastSpell( Door, OwnerID() , 491248)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_HURT_CRITICAL )
	sleep(5)
	Yell( OwnerID() , "[SC_112077_OD_3]",5 ) --呃啊！
	sleep(15)
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(50)
	for i = 1 , Party[0] , 1 do
		CancelBuff( Party[i] , 502502 )
	end
	sleep(100)
	Delobj( OwnerID() )
end

-------剛進副本遇到的席爾夫----------------


function LuaS_112077_1()
	SetPlot(OwnerID() , "range" , "LuaS_112077_2" , 50)
	local Boss = CreateObjByFlag( 112077, 780088 , 0 , 1 )
	AddToPartition( Boss , ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) )
	DisableQuest( Boss  , true )
	local Monster = {}
	for i = 1 , GetMoveFlagCount(780088)-2 , 2 do
		Monster[i] = CreateObjByFlag( 101517, 780088 , i , 1 )
		AddToPartition( Monster[i] , ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) )	
	end
	for i = 2 , GetMoveFlagCount(780088)-1 , 2 do
		Monster[i] = CreateObjByFlag( 101518, 780088 , i , 1 )
		AddToPartition( Monster[i] , ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) )
	end
	if ReadRoleValue(OwnerID() , EM_RoleValue_PID) ~= 0 then
		WriteRoleValue(OwnerID() , EM_RoleValue_PID , 0 )
	end
	while true do
		sleep(10)
		if ReadRoleValue(OwnerID() , EM_RoleValue_PID) ~= 0 then
			sleep(10)
--			ScriptMessage( OwnerID(), -1 , 0 , "[SC_112077_1]", C_DEFAULT )
			Say( Boss , "[SC_112077_1]" )
			sleep(20)
--			ScriptMessage( OwnerID(), -1 , 0 , "[SC_112077_2]", C_DEFAULT )
			Say( Boss , "[SC_112077_2]" )
			sleep(10)
			for i = 1 , table.getn(Monster) do
				SetAttack( Monster[i] , ReadRoleValue(OwnerID() , EM_RoleValue_PID) )
			end
			break
		else
			sleep(20)
		end
		
	end
	while true do
		sleep(10)
		for i = 1 , table.getn(Monster) do
			if CheckID(Monster[i]) then
				if ReadRoleValue( Monster[i] , EM_RoleValue_RoomID ) == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then
					if ReadRoleValue( Monster[i] , EM_RoleValue_IsDead ) == 1 then
					else
						break
					end
				else
				end
			end
			if  i == table.getn(Monster) then
				WriteRoleValue( Boss , EM_RoleValue_PID , 1 )
				DisableQuest( Boss  , false )
				SetPlot(OwnerID() , "range" , "" , 0 )
				return
			end
		end
	end
end


function LuaS_112077_2()
	WriteRoleValue( TargetID() , EM_RoleValue_PID , OwnerID() )
end

function LuaS_112077_3()
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_BEG)
		SetSpeakDetail ( OwnerID(), "[SC_112077_3]"  )
		AddSpeakOption ( OwnerID(), TargetID( ), "[SC_112077_4]" , "LuaS_112077_4", 0 )
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_112077_4()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )
	BeginPlot( TargetID() , "LuaS_112077_6" , 0 )
end


function LuaS_112077_5()
	WriteRoleValue(OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaS_112077_6()
	Tell( TargetID() , OwnerID() , "[SC_112077_5]"  )
--	Say( OwnerID() , "[SC_112077_5]" )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)
	sleep(20)
	local Box = LuaFunc_CreateObjByObj ( 112092 , OwnerID() )
	ScriptMessage( TargetID(), -1 , 0 , "[SC_112077_6]", 0 )
	ScriptMessage( TargetID(), -1 , 2 , "[SC_112077_6]", 0 )
	DelObj(OwnerID())
end




function LuaS_112077_8()
	SetPlot(OwnerID() , "touch" , "LuaS_112077_9" , 80 )
end

function LuaS_112077_9()
	Hide(TargetID())
end
