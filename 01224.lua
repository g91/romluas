function DW_CreateObjEX( CreateType , V1 , V2 , V3 , V4 , V5 )
--�üƲ��� 1 �� �O Lua_DW_CreateObj ���i����
--�L�k�����x���ФŨϥ�
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

--	�ܽd1�G���w�y�в��ͪ���
--	local XYZ = { x�y�� , y�y�� , z�y�� }
--	local ObjID = Lua_DW_CreateObj( "xyz" , 100052 , XYZ , 1 , 180 , 1 )
--	�Բӻ���
--	local  Array = { X , Y , Z }
--	local ObjID = Lua_DW_CreateObj( "xyz" , CreateObjID , Array , IfAdd , Dir , Amount )
--	Array--�ˮy�Ъ��x�}
--	CreateObjID--�ҪO�N��
--	IfAdd--	�@�묰1�A�n���addtopartition�h��0
--	Dir--���V
--	Amount--���ͪ��ƶq
--	ObjID--�^�Ǫ���N��

--	�ܽd2�G�q���w�X�l���ͪ���
--	local ObjID = Lua_DW_CreateObj( "flag" , 100052 , 500006 , 0 , 1 , 1 )
--	�Բӻ���
--	local ObjID = Lua_DW_CreateObj( "flag" , CreateObjID , FlagID , FlagNum , IsAdd , Amount )
--	CreateObjID--�ҪO�N��
--	FlagID--�㹳�X�l���ҪO�N��
--	FlagNum--�X�l���s��
--	IfAdd--	�@�묰1�A�n���addtopartition�h��0
--	Amount--���ͪ��ƶq�A�w�]��1
--	ObjID--�^�Ǫ���N��


--	�ܽd3�G�q���w�ؼЪ���m���ͪ���
--	local ObjID = Lua_DW_CreateObj( "obj" , 100052 , TargetID() , 0 , 1 )
--	�Բӻ���
--	local ObjID = Lua_DW_CreateObj( "obj" , CreateObjID , ObjGUID , IsAdd , Amount )
--	CreateObjID--�ҪO�N��
--	ObjGUID--���w�ؼЪ��N��
--	IfAdd--	�@�묰1�A�n���addtopartition�h��0
--	Amount--���ͪ��ƶq�A�w�]��1
--	ObjID--�^�Ǫ���N��


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
