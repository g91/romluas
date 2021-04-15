function LuaN_112108_Quest()

	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),421682)==true )and(CheckFlag( OwnerID() , 542313 )==false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112108_1]","LuaS_112108_1",0) --皮拉耶克要我來討回你欠他的賭債。
	end
end	


function LuaS_112108_1()
	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_112108_2",0)
end



function LuaS_112108_2()							
	DisableQuest( OwnerID() , true )
	local ANPC = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542315, 0 )
	local NPC = LuaFunc_CreateObjByObj ( 101540 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(NPC,"dead" , "LuaS_112108_3",0)
	BeginPlot(NPC,"LuaS_112108_4",0)
	SetAttack( NPC , TargetID() )
	Say( NPC , "[SC_112108_2]" ) --米古達就是想耍賴，我不想還錢，你能拿我怎麼辦？
	sleep( 10 )
	while true do
		if CheckID(NPC) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			--CastSpell( OwnerID(),OwnerID(),490098)
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),ANPC,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542315 ) == true then 
				Say( OwnerID() , "[SC_112108_3]" ) --別打了，米古達還錢就是了！
				SetFlag(TargetID() , 542313 , 1 )
				GiveBodyItem( TargetID(), 203619, 1 )


			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end


function LuaS_112108_3()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542315, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_112108_4()
	LuaFunc_Obj_Suicide(50)
end



----------------------------------------------------------------

function LuaS_112104_Quest()

	LoadQuestOption( OwnerID() )

	if (CheckFlag( OwnerID() , 542313 )==true)and(CheckFlag( OwnerID() , 542314 )==false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112104_1]","LuaS_112104_1",0) --我把米古達欠的賭債拿回來了，請告訴我觀察員路克的故事。
	end
end

function LuaS_112104_1()

	DelBodyItem( OwnerID() , 203619 , 1 ) 
	SetSpeakDetail(OwnerID(),"[SC_112104_2]")	
	SetFlag(OwnerID() , 542314 , 1 )

end





