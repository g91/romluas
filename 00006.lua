function WaitMoveTo( ObjID , X , Y, Z )
	local Obj = Role:new( ObjID )
	if X == 0 and Z == 0 then
		DeBugLog( 6 , ObjID.." Will Move To 0 , Y , 0 ")
	end
	local Time = Obj:Move(  X , Y ,Z  )
	if Time ~= nil then
		Time = ( Time + 600*5 ) / 5 
	else
		Time = 1200
	end
	local Count = 0
	while 1 do
		Obj:Move(  X , Y ,Z  )
		for i = 0 , 60 , 1 do
			local NowX = Obj:X()
			local NowZ = Obj:Z();
		
			if Abs( NowX - X ) < 10 and Abs( NowZ - Z ) < 10 then
				return true
			end
			Sleep( 5 )
			Count = Count + 1
		end 

		if Count > Time then
			DeBugLog( 6 , ObjID.." Long Time to Move ! ")
			SetPos( ObjID , X , Y , Z , Obj:Dir() )
			return true
		end
	end
	return false

end

function LuaFunc_WaitMoveTo( ObjID , X , Y, Z )
	local Obj = Role:new( ObjID )
	if X == 0 and Z == 0 then
		DeBugLog( 6 , ObjID.." Will Move To 0 , Y , 0 ")
	end
	local Time = Obj:Move(  X , Y ,Z  )
	if Time ~= nil then
		Time = ( Time + 600*5 ) / 5 
	else
		Time = 1200
	end
	local Count = 0
	while 1 do
		Obj:Move(  X , Y ,Z  )
		for i = 0 , 60 , 1 do
			local NowX = Obj:X()
			local NowZ = Obj:Z();
		
			if Abs( NowX - X ) < 10 and Abs( NowZ - Z ) < 10 then
--				Say( ObjID  , " LuaFunc_WaitMoveTo: reach target" )
				return true
			end
			Sleep( 5 )
			Count = Count + 1
		end 

		if Count > Time then
			DeBugLog( 6 , ObjID.." Long Time to Move ! ")
			SetPos( ObjID , X , Y , Z , Obj:Dir() )
			return true
		end
	end
--	Say( ObjID  , " LuaFunc_WaitMoveTo: no reach target" )
	return false

end