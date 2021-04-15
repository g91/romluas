function LuaN_111769_Quest()

	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),421576)==true )and(CheckFlag( OwnerID() , 542211 )==false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421576]","LuaS_111769_1",0) --這個位置是我的，麻煩你讓讓。
	end
end	


function LuaS_111769_1()
	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_111769_2",0)
end



function LuaS_111769_2()							
	DisableQuest( OwnerID() , true )
	local ANPC = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542287, 0 )
	local NPC = LuaFunc_CreateObjByObj ( 101442 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(NPC,"dead" , "LuaS_111769_3",0)
	BeginPlot(NPC,"LuaS_111769_4",0)
	SetAttack( NPC , TargetID() )
	Say( NPC , "[SC_421576_1]" ) --/*你是在挑釁我嗎？
	sleep( 10 )
	while true do
		if CheckID(NPC) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			--CastSpell( OwnerID(),OwnerID(),490098)
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),ANPC,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542287 ) == true then 
				Say( OwnerID() , "[SC_421576_2]" ) --/*痛死了！算了，不想跟你一番見識，繼續喝我的酒。
				SetFlag(TargetID() , 542211 , 1 )
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end


function LuaS_111769_3()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542287, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_111769_4()
	LuaFunc_Obj_Suicide(50)
end