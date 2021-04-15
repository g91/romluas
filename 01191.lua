function LuaS_112163_0()
	if CheckCompleteQuest(OwnerID() , 421786 ) == true then
		SetSpeakDetail( OwnerID(), "[SC_112163_0]" )
	elseif CheckAcceptQuest( OwnerID() , 421781 ) == true and CheckFlag(OwnerID() , 542298 ) == false then
		SetSpeakDetail( OwnerID(), "[SC_112163_11]" )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112163_1]", "LuaS_112163_1", 0 ) 
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_112163_1()
	SetSpeakDetail( OwnerID(), "[SC_112163_2]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112163_3]", "LuaS_112163_2", 0 ) 
end

function LuaS_112163_2()
	SetSpeakDetail( OwnerID(), "[SC_112163_4]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112163_3]", "LuaS_112163_3", 0 ) 
end

function LuaS_112163_3()
	SetSpeakDetail( OwnerID(), "[SC_112163_5]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112163_3]", "LuaS_112163_4", 0 ) 
end

function LuaS_112163_4()
	SetSpeakDetail( OwnerID(), "[SC_112163_6]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112163_7]", "LuaS_112163_5", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112163_8]", "LuaS_112163_6", 0 ) 
end

function LuaS_112163_5()
	SetSpeakDetail( OwnerID(), "[SC_112163_9]" )
	SetFlag( OwnerID() , 542298 , 1 )
end

function LuaS_112163_6()
	SetSpeakDetail( OwnerID(), "[SC_112163_10]" )
	SetFlag( OwnerID() , 542298 , 1 )
end

function LuaS_112169_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421788 ) == true and CheckFlag( OwnerID() , 542300 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112169_0]", "LuaS_112169_1", 0 ) 
	end
end

function LuaS_112169_1()
	SetSpeakDetail( OwnerID(), "[SC_112169_1]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112169_2]", "LuaS_112169_2", 0 ) 
end

function LuaS_112169_2()
	SetSpeakDetail( OwnerID(), "[SC_112169_3]" )
	SetFlag( OwnerID() , 542300 , 1 )
end

function LuaQ_421786_Complete()
	local NPC =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,112168, 200 ) 
	if CheckID( NPC ) == true then
		tell( TargetID() , NPC , "[SC_112168_1]")
	end 
end

function LuaQ_421782_Complete()
	local Count = CountBodyitem( TargetID() , 203659 )
	DelBodyItem( TargetID() , 203659 , Count )
end

function LuaQ_421783_Complete()
	local Count = CountBodyitem( TargetID() , 203660 )
	DelBodyItem( TargetID() , 203660 , Count )
end

function LuaQ_421784_Complete()
	local Count = CountBodyitem( TargetID() , 203661)
	DelBodyItem( TargetID() , 203661 , Count )
end

function LuaQ_421785_Complete()
	local Count = CountBodyitem( TargetID() , 203662 )
	DelBodyItem( TargetID() , 203662 , Count )
end

function LuaI_203663_Check()
	local Check = 0
	Check = LuaFunc_SearchNPCbyOrgID( OwnerID() ,112189, 500 )
	if Check < 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203663_0]" , 0 )
		return false
	else
		return true
	end
end

function LuaI_203663_Use()
	BeginPlot( OwnerID() , "LuaI_203663_THROW" , 0 )
end
function LuaI_203663_THROW()
	local result = ""
	if BeginCastBar( OwnerID(), "[SC_203663_2]", 10 , ruFUSION_ACTORSTATE_THROW , ruFUSION_ACTORSTATE_NORMAL, 0 ) ~= 1 then
		ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
		return
	end	
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( OwnerID() );

		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- жие\
				result = "OKOK"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- ев▒╤
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			end
		end
	end
	if result == "OKOK" then
		SetFlag( OwnerID() , 542299 , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203663_1]" , 0 )
		local Check = 0
		Check = LuaFunc_SearchNPCbyOrgID( OwnerID() ,112189, 500 )
		if Check ~= -1 and ReadroleValue(Check , EM_RoleValue_PID ) == 0 then
			WriteRoleValue(Check, EM_RoleValue_PID , 1 )
			Beginplot( Check , "LuaI_203663_Play" , 0 )
		end
	end
end

function LuaI_203663_Play()
	local Boy =  CreateObjByFlag( 112168, 780243 , 1 , 1 )
	local NPC = CreateObjByFlag( 112169, 780243 , 0 , 1 )
	DisableQuest( NPC, True )
	DisableQuest( Boy , True )
	AddToPartition(NPC, 0 )
	if CheckID( TargetID() ) == true then
		AdjustFaceDir( NPC , TargetID(), 0 ) 
		AdjustFaceDir( Boy, TargetID(), 0 ) 
	end
	sleep( 5 )
	AddToPartition( Boy , 0 )
	sleep( 10 )
	Yell( Boy , "[SC_112168_0]" , 3)
	PlayMotion( Boy , ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(15)
	Yell( NPC , "[SC_112169_4]" , 3 )
	PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_THREATEN)	
	sleep(100)
	Delobj( Boy)
	Delobj( NPC)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end