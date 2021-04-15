function MoveFlagTest11( )
	local Obj = Role:new( OwnerID() )
	Obj:IsWalk( 0 )
	local X ;
	local Y;
	local Z;

	while 1 do
	
		NPC_MoveToFlag( OwnerID() , 5 , 0 , 0 )
		NPC_MoveToFlag( OwnerID() , 5 , 1 , 0)
		NPC_MoveToFlag( OwnerID() , 5 , 2 , 0)

		Obj:IsWalk( 0 )
		NPC_MoveToFlag( OwnerID() , 5 , 3 , 0)
		Obj:IsWalk( 1 )

		NPC_MoveToFlag( OwnerID() , 5 , 2 , 0)
		NPC_MoveToFlag( OwnerID() , 5 , 1 , 0)

		NPC_MoveToFlag( OwnerID() , 5 , 0 , 100 ) 
		Sleep( 10 )
		X = Obj :X() + rand( 10 ) - 5 
		Y = Obj:Y()
		Z = Obj:Z() + rand( 10 ) - 5 
		WaitMoveTo( OwnerID() , X , Y ,Z   )
		Sleep( 100 )
	end

end