function DW_CreateObjEX( CreateType , V1 , V2 , V3 , V4 , V5 )
--亂數產生 1 隻 是 Lua_DW_CreateObj 的進階版
--無法完全掌握請勿使用
	local x,y,z,dir
	local ID
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	if	CreateType == nil	then
		return nil
	end

	if	type(CreateType )~="string"	then
		return nil
	end

	if	CreateType == "obj"	then
		if	V1 == nil	or
			V2 == nil	then
			return false
		end
		if	V4 == nil	then
			V4 = 0
		end
		x = ReadRoleValue( V2 , EM_RoleValue_X )-(V4/2)+DW_Rand(V4)
		y = ReadRoleValue( V2 , EM_RoleValue_Y )
		z = ReadRoleValue( V2 , EM_RoleValue_Z )-(V4/2)+DW_Rand(V4)
		y = GetHeight( x , y , z )
		dir = ReadRoleValue( V2 , EM_RoleValue_Dir )

		if	V3 == nil		then
			V3 = 1
		end

		ID = CreateObj ( V1 , x , y , z , dir , 1)

		if	V3 == 1		then
			if	ID == nil	then
				return nil
			else
				AddToPartition( ID , RoomID )
			end
		end
	end

	if	CreateType == "flag"	then

		if	V1 == nil	or
			V2 == nil	or
			V3 == nil	then
			return nil
		end

		if	V4 == nil	then
			V4 = 1
		end


		if	V5 == nil	then
			V5 = 0
		end
		x = GetMoveFlagValue(V2,V3,EM_RoleValue_X)-(V5/2)+DW_Rand(V5)
		y = GetMoveFlagValue(V2,V3,EM_RoleValue_Y)
		z = GetMoveFlagValue(V2,V3,EM_RoleValue_Z)-(V5/2)+DW_Rand(V5)
		dir = GetMoveFlagValue(V2,V3,EM_RoleValue_Dir)
		y = GetHeight( x , y , z )

		ID = CreateObj ( V1 , x , y , z , dir , 1)
		if	V4 == 1		then
			if	ID == nil	then
				return nil
			else
				AddToPartition( ID , RoomID )
			end
		end
	end

	if	CreateType == "xyz"	then

		if	type(V2)~= "table"	then
			return nil
		else

			for i=1,3 do
				if	V2[i] == nil	then
					return nil
				end
			end

		end

		if	V1 == nil	then
			return nil
		end

		if	V3 == nil	then
			V3 = 1
		end

		if	V4 == nil	then
			V4 = 0
		end

		if	V5 == nil	then
			V5 = 0
		end
		V2[1] = V2[1]-(V5/2)+DW_Rand(V5)
		V2[3] = V2[3]-(V5/2)+DW_Rand(V5)
		V2[2] = GetHeight( V2[1] , V2[2] , V2[3] )
		
		ID = CreateObj ( V1 , V2[1] , V2[2] , V2[3] , V4 ,1)

		if	V3 == 1		then

			if	ID == nil	then
				return nil
			else
				AddToPartition( ID , RoomID )
			end

		end
	end
	
	if	ID == nil	then
		return nil
	else
		return ID
	end
end


function Lua_DW_CreateObj( CreateType , V1 , V2 , V3 , V4 , V5 )

--	示範1：指定座標產生物件
--	local XYZ = { x座標 , y座標 , z座標 }
--	local ObjID = Lua_DW_CreateObj( "xyz" , 100052 , XYZ , 1 , 180 , 1 )
--	詳細說明
--	local  Array = { X , Y , Z }
--	local ObjID = Lua_DW_CreateObj( "xyz" , CreateObjID , Array , IfAdd , Dir , Amount )
--	Array--裝座標的矩陣
--	CreateObjID--模板代號
--	IfAdd--	一般為1，要手動addtopartition則填0
--	Dir--面向
--	Amount--產生的數量
--	ObjID--回傳物件代號

--	示範2：從指定旗子產生物件
--	local ObjID = Lua_DW_CreateObj( "flag" , 100052 , 500006 , 0 , 1 , 1 )
--	詳細說明
--	local ObjID = Lua_DW_CreateObj( "flag" , CreateObjID , FlagID , FlagNum , IsAdd , Amount )
--	CreateObjID--模板代號
--	FlagID--顯像旗子的模板代號
--	FlagNum--旗子的編號
--	IfAdd--	一般為1，要手動addtopartition則填0
--	Amount--產生的數量，預設為1
--	ObjID--回傳物件代號


--	示範3：從指定目標的位置產生物件
--	local ObjID = Lua_DW_CreateObj( "obj" , 100052 , TargetID() , 0 , 1 )
--	詳細說明
--	local ObjID = Lua_DW_CreateObj( "obj" , CreateObjID , ObjGUID , IsAdd , Amount )
--	CreateObjID--模板代號
--	ObjGUID--指定目標的代號
--	IfAdd--	一般為1，要手動addtopartition則填0
--	Amount--產生的數量，預設為1
--	ObjID--回傳物件代號


	local ID
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	if	CreateType == nil	then
		return nil
	end

	if	type(CreateType )~="string"	then
		return nil
	end

	if	CreateType == "obj"	then
		if	V1 == nil	or
			V2 == nil	then
			return false
		end

		local x = ReadRoleValue( V2 , EM_RoleValue_X )
		local y = ReadRoleValue( V2 , EM_RoleValue_Y )
		local z = ReadRoleValue( V2 , EM_RoleValue_Z )
		local dir = ReadRoleValue( V2 , EM_RoleValue_Dir )

		if	V3 == nil		then
			V3 = 1
		end

		if	V4 == nil	then
			V4 = 1
		end


		ID = CreateObj ( V1 , x , y , z , dir , V4)

		if	V3 == 1		then
			if	ID == nil	then
				return nil
			else
				AddToPartition( ID , RoomID )
			end
		end
	end

	if	CreateType == "flag"	then

		if	V1 == nil	or
			V2 == nil	or
			V3 == nil	then
			return nil
		end

		if	V4 == nil	then
			V4 = 1
		end


		if	V5 == nil	then
			V5 = 1
		end


		ID = CreateObjByFlag( V1, V2 , V3 , V5 )

		if	V4 == 1		then
			if	ID == nil	then
				return nil
			else
				AddToPartition( ID , RoomID )
			end
		end
	end

	if	CreateType == "xyz"	then

		if	type(V2)~= "table"	then
			return nil
		else

			for i=1,3 do
				if	V2[i] == nil	then
					return nil
				end
			end

		end

		if	V1 == nil	then
			return nil
		end

		if	V3 == nil	then
			V3 = 1
		end

		if	V4 == nil	then
			V4 = 0
		end

		if	V5 == nil	then
			V5 = 1
		end

		ID = CreateObj ( V1 , V2[1] , V2[2] , V2[3] , V4 , V5)

		if	V3 == 1		then

			if	ID == nil	then
				return nil
			else
				AddToPartition( ID , RoomID )
			end

		end
	end
	
	if	ID == nil	then
		return nil
	else
		return ID
	end
end
