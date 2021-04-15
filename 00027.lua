function MovetoFlagTest( )
	while 1 do
		NPC_MoveToFlag( OwnerID() , 0 , 0 , 20 )
		Sleep( 20+ Rand(100) )
		NPC_MoveToFlag( OwnerID() , 0 , 1 , 20)
		Sleep( 20+ Rand(100) )
		NPC_MoveToFlag( OwnerID() , 0 , 2 , 20)
		Sleep( 20+ Rand(100) )
		NPC_MoveToFlag( OwnerID() , 0 , 3 , 20)
		Sleep( 20+ Rand(100) )
		NPC_MoveToFlag( OwnerID() , 0 , 2 , 20)
		Sleep( 20+ Rand(100) )
		NPC_MoveToFlag( OwnerID() , 0 , 1 , 20)
		Sleep( 10 )
	end




--	local FlagCount = GetMoveFlagCount ( 0 ) - 1
--	local ID = 0

--	while 1 do

--		for i = 0 , FlagCount , 1 do
--			NPC_MoveToFlag( OwnerID() , 0 , i )
--		end
	
--		for i = 0 , FlagCount  , 1 do
--			NPC_MoveToFlag( OwnerID() , 0 , FlagCount - i  )
--		end
--		sleep( 10 ) 
--	end
	
end