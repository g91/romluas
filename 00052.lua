function MovetoFlag02( )
	local Obj = Role:new( OwnerID() )

	while 1 do
		NPC_MoveToFlag( OwnerID() , 5 , 0 , 0 )
		Sleep( 80 + Rand(150) )
--		sleep 8 ~ 23 ¬í
		Obj:IsWalk( 0 )
--		0 ¡÷ false¡A¶]¨B	1 ¡÷ true ¡A¨«¸ô
		NPC_MoveToFlag( OwnerID() , 5 , 1 , 0)
		Sleep( 80+ Rand(120) )
--		sleep 8 ~ 20 ¬í
		Obj:IsWalk( 1 )
		NPC_MoveToFlag( OwnerID() , 5 , 2 , 0)
		Sleep( 120+ Rand( 180) )
--		sleep 12 ~ 30¬í
		
	end



end