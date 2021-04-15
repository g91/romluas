function LuaN_111690()

	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),421551)==true )and(CheckFlag( OwnerID() , 542187 )==false)then	--符文能力的試驗
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111690]","LuaS_421551",0)
	end

	if (CheckAcceptQuest(OwnerID(),421553)==true )and(CheckFlag( OwnerID() , 542188 )==false)then	--符文能力的試驗II
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111690]","LuaS_421553",0)
	end
end	


function LuaS_421551()
	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_421551_1",0)
end

function LuaS_421553()
	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_421553_1",0)
end


function LuaS_421551_1()							--符文能力的試驗
	DisableQuest( OwnerID() , true )
	local DBIDA = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542280, 0 )
	local AFA = LuaFunc_CreateObjByObj ( 101439 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(AFA,"dead" , "LuaS_421551_2",0)
	BeginPlot(AFA,"LuaS_421551_3",0)
	SetAttack( AFA , TargetID() )
	sleep( 10 )
	while true do
		if CheckID(AFA) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			--CastSpell( OwnerID(),OwnerID(),490098)
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),DBIDA,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542280 ) == true then 
				Say( OwnerID() , "[SC_11690_1]" ) --/*停停停，可以了，我知道這些符文的威力有多少了！
				SetFlag(TargetID() , 542187 , 1 )
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end


function LuaS_421551_2()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542280, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_421551_3()
	LuaFunc_Obj_Suicide(50)
end


function LuaS_421553_1()	                                                                                      --符文能力的試驗II
	DisableQuest( OwnerID() , true )
	local DBIDB = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542281, 0 )
	local AFB = LuaFunc_CreateObjByObj ( 101440 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(AFB,"dead" , "LuaS_421553_2",0)
	BeginPlot(AFB,"LuaS_421553_3",0)
	SetAttack( AFB , TargetID() )
	sleep( 10 )
	while true do
		if CheckID(AFB) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			--CastSpell( OwnerID(),OwnerID(),490098)
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),DBIDB,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542281 ) == true then 
				Say( OwnerID() , "[SC_11690_1]" ) --/*停停停，可以了，我知道這些符文的威力有多少了！
				SetFlag(TargetID() , 542188 , 1 )
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end


function LuaS_421553_2()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542281, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_421553_3()
	LuaFunc_Obj_Suicide(50)
end






