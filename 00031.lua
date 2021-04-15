function MoveAllFlag( FlagID )

	local FlagCount = GetMoveFlagCount ( FlagID ) - 1
	local ID = 0

	while 1 do

		for i = 0 , FlagCount , 1 do
			NPC_MoveToFlag( OwnerID() ,FlagID , i , 0 )
		end
	
		for i = 0 , FlagCount  , 1 do
			NPC_MoveToFlag( OwnerID() , FlagID , FlagCount - i  ,0)
		end
		sleep( 10 ) 
	end

end

function LuaFunc_MoveAllFlag( ObjID, FlagID )

	local FlagCount = GetMoveFlagCount ( FlagID ) - 1
	local ID = 0

	while 1 do

		for i = 0 , FlagCount , 1 do
			NPC_MoveToFlag( ObjID, FlagID , i , 0 )
		end
	
		for i = 0 , FlagCount  , 1 do
			NPC_MoveToFlag( ObjID, FlagID , FlagCount - i  ,0)
		end
		sleep( 10 ) 
	end

end