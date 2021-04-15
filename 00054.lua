function MovetoFlag0to3( )
--	local Obj = Role:new( OwnerID() )

	while 1 do
--		Obj:IsWalk( 0 )
		NPC_MoveToFlag( OwnerID() , 5 , 0 , 0 )
		Sleep( 80 + Rand(150) )
--		sleep 8 ~ 23 ¬í
		NPC_MoveToFlag( OwnerID() , 5 , 1 , 0)
		Sleep( 80+ Rand(120) )
--		sleep 8 ~ 20 ¬í
		NPC_MoveToFlag( OwnerID() , 5 , 2 , 0)
		Sleep( 60+ Rand( 180) )
--		sleep 6 ~ 24¬í
--		Obj:IsWalk( 1 )
		NPC_MoveToFlag( OwnerID() , 5 , 3 , 0)
		Sleep( 80+ Rand(100) )
--		sleep 8 ~ 18 ¬í
		NPC_MoveToFlag( OwnerID() , 5 , 2 , 0)
		Sleep( 90+ Rand(150) )
--		sleep 9 ~ 24 ¬í
		NPC_MoveToFlag( OwnerID() , 5 , 1 , 0)
		Sleep( 50 )
--		sleep 5 ¬í 
		
	end



end