function LuaFunc_Robot_Attack()

	local	Robots	= {};
	local 	Flag = 780011
	local	Camp = 0
	local 	ObjID;		

	while 1 do
		for i = 0 , 20 , 1 do

			if CheckID( Robots[i] ) ~= true then
				Say( OwnerID() , "Now is "..i )
				local RandFlag = rand(9)
				if i == 0 then
					ObjID = CreateObjByFlag( 100049, Flag, RandFlag, 1 );
					AddToPartition( ObjID , 0 )
					SetRoleCamp( ObjID , "SNPC" )
					Say(ObjID,"SNPC")
				else
					ObjID = CreateObjByFlag( 100001, Flag, RandFlag, 1 );
					AddToPartition( ObjID , 0 )
					SetRoleCamp( ObjID , "Monster" )
					Say(ObjID,"Monster")
				end

				Robots[i] = ObjID
			end
			sleep( 5 )
		end

		sleep( 10 )
	end
end