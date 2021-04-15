function MovetoFlag0to2( )
	while 1 do
--		Obj:IsWalk( 0 )
		NPC_MoveToFlag( OwnerID() , 5 , 0 , 0 )
		Sleep( 80 + Rand(150) )
--		sleep 8 ~ 23 ¬í
		NPC_MoveToFlag( OwnerID() , 5 , 1 , 0)
		Sleep( 80+ Rand(120) )
--		sleep 8 ~ 20 ¬í
		NPC_MoveToFlag( OwnerID() , 5 , 2 , 0)
		Sleep( 100+ Rand( 180) )
--		sleep 10 ~ 24¬í
		NPC_MoveToFlag( OwnerID() , 5 , 1 , 0)
		Sleep( 50 )
--		sleep 5 ¬í 
		
	end



end