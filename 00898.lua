function LuaQ_421069_AfterClick()
	BeginPlot( TargetID() , "LuaQ_421069_0", 0 )
	Hide(TargetID() )
	return true
end

function LuaQ_421069_0()
	local GuardCaptain = CreateObjByFlag( 100792, 780080 , 0 , 1 );
	WriteRoleValue( GuardCaptain ,EM_RoleValue_IsWalk , 0 )
	MoveToFlagEnabled( GuardCaptain , false )
	AddToPartition( GuardCaptain , 0 )
	SetFightMode (GuardCaptain,0, 1, 0,0 )
	FaceObj(GuardCaptain , TargetID() )
	SetPlot( GuardCaptain , "dead" , "LuaFunc_DeadPlay" , 40 )
	Say( GuardCaptain , GetString("SC_421069_1" ) )
	sleep(30)

	local Ponder = CreateObjByFlag( 101010, 780080 , 0 , 1 );
	MoveToFlagEnabled( Ponder  , false )
	WriteRoleValue( Ponder ,EM_RoleValue_IsWalk , 0 )
	AddToPartition( Ponder , 0 )
	Say( Ponder , GetString("SC_421069_2" ) )
	FaceObj(Ponder, TargetID() )
	SetPlot( Ponder  , "dead" , "LuaQ_421069_1" , 40 )
	SetFightMode (GuardCaptain,1, 1, 1,1 )
	SetAttack(Ponder , GuardCaptain  )
	sleep(15)
	Say( GuardCaptain , GetString("SC_421069_3" ) )	
	SetAttack(GuardCaptain ,Ponder )

	for i = 1 , 100 , 1 do
		if CheckID( GuardCaptain ) == false then
			break
		else
			SetAttack( Ponder , GuardCaptain  )
		end
		sleep(30)
	end

	if CheckID( GuardCaptain ) == true and ReadRoleValue( GuardCaptain,EM_RoleValue_IsDead) == 0 then
		NPCDead( GuardCaptain ,Ponder)
		sleep(30)
		DelObj( GuardCaptain)
	end

	Say( Ponder , GetString("SC_421069_4" ) )
	sleep(15)
	DelObj( Ponder )
	Show( OwnerID() , 0 )
end

function LuaQ_421069_1()
	Say( OwnerID() , GetString("SC_421069_5" ) )	
	return false	
end