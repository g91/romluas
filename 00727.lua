function LuaFunc_Matrix_Maker( dis , count) --�إ߯x�}���禡
--dis ���l�ͪ��P��Ǫ������Z
--Count ���N�ͦ� Count X Count ���}�C�]�ͦ����}�C�����_�ơA�p�G��J���ơA�h�۰�+1�����_�Ʀ�^
--�Ҧp��J 4 �A�h�ͦ� 5 X 4 ���}�C
	local Matrix = {}
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z )
	local Dir  = ReadRoleValue( OwnerID()  , EM_RoleValue_Dir )
	local Cal = dir*math.pi/180

	if Count == 0 then
		Count = 1
	else
		Count = math.abs(count)
	end

	for i = 1 ,count , 1 do
		local X2 = X - (i-1)*dis*math.cos(Cal)
		local Z2 = Z + (i-1)*dis*math.sin(Cal)
		Matrix[i] =LuaFunc_Count_LeftRight(X2,Y,Z2,Dir,dis,Count)
	end
	return Matrix
end

function LuaFunc_Count_LeftRight(X,Y,Z,Dir,dis,Count) --�p��x�}����V���c
--DIR�� 0 -359
-- X , Y , Z , Dir �����߰ѦҮy�Ъ���Ǽƭ�
--dis ���l�ͪ��P��Ǫ������Z
--Count ���@�榳�h�֭ӡ]�ѩ��ƥ����������I�A�]���������_�ơF�p�G��J���ơA�h�۰ʲ��ͷs���@��^
--�N���״��⦨�|��
	local Cal
	Cal = (math.pi/180)*(dir) 
--�p��l�ͪ����ͪ���m���x�s�� TABLE ����
	local Matrix = {}

	local Loc = math.floor(count/2)
	if Loc ~= 0 then
		for i = -Loc , Loc , 1 do
			Matrix[i] = {}
		end
	else
		Matrix[0] = {}
	end

	Matrix[0]["X"] = X
	Matrix[0]["Y"] = Y
	Matrix[0]["Z"] = Z
	Matrix[0]["Dir"] = Dir

	for i = 1 , Loc , 1 do
		Matrix[i]["X"] = X - i*Dis * math.sin( Cal )
		Matrix[-i]["X"] = X + i*Dis * math.sin( Cal )
		Matrix[i]["Y"] = Y
		Matrix[-i]["Y"] = Y
		Matrix[i]["Z"]  = Z - i*Dis * math.cos( Cal )
		Matrix[-i]["Z"] = Z + i*Dis * math.cos( Cal )
		Matrix[i]["Dir"] = Dir
		Matrix[-i]["Dir"] = Dir
	end

--�^�ǭl�ͪ�
	return Matrix
end

function LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) --�b�T�w�y���I���ͪ��󪺨禡
	-- ObjID �n�ͦ�������ID
	-- Matrix �إ߮ɨ̾ڪ���m�x�}
	-- A �إߦb�ĴX�C
	-- B �إߦb�ĴX��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local Count = table.getn(Matrix)
	--�T�w A�BB �b�d�򤺡A���b�d�򤺫h���|����
	if A < 0 or Type(A) ~= "number" or A > Count then
		return nil
	else
		A = math.floor(A)
	end

	if  Type(B) ~= "number" or B == nil then
		return nil
	elseif B > 0 then
		if B > count/2 then
			return nil
		else
			B = math.floor(B)
		end
	elseif B < 0 then
		if B < -count/2 then
			return nil
		else
			B = math.ceil(B)
		end
	end
	--�}�l�]�m��m
	local X = Matrix[A][B]["X"] 
	local Y = Matrix[A][B]["Y"] 
	local Z = Matrix[A][B]["Z"] 
	local Dir = Matrix[A][B]["Dir"] 
	local Obj = CreateObj (ObjID,X, Y, Z,Dir, 1)

	WriteRoleValue( Obj , EM_RoleValue_Register + 8  , A ) --����A����m�AA���w�j��0 �A�� EM_RoleValue_Register + 8 �ӰO��
	WriteRoleValue( Obj , EM_RoleValue_PID , B ) --���� B ����m�A�ѩ� B ���t�ơA�ҥH B ������ PID �ӰO��

	AddToPartition( Obj ,RoomID)
	return Obj
end

function LuaFunc_ObjMatrix_Record(ObjMatrix)--�������NPC���W����ơA�H�ѭ��ͨϥ�
	local ObjRecord = {}
	ObjRecord["OrgID"] = {}
	ObjRecord["A"] = {}
	ObjRecord["B"] = {}
	local OrgID = {} --�⪫�� OrgID �s�J�A���ͮɥi�H��
	local OrgA = {} --�⪫�� �C�� �s�J�A���ͮɥi�H��
	local OrgB = {} --�⪫�� ��� �s�J�A���ͮɥi�H��
	for pry , obj in pairs(ObjMatrix) do 
		if obj ~= nil and CheckID(obj) == true then

			ObjRecord["OrgID"][pry] = ReadRoleValue( obj , EM_RoleValue_OrgID )
			ObjRecord["A"][pry] = ReadRoleValue( obj , EM_RoleValue_Register + 8 )
			ObjRecord["B"][pry] = ReadRoleValue( obj , EM_RoleValue_PID )

		end

	end

	return ObjRecord
end

--�N�x�}�ѦҪ���e�^���I���ݭ���
function LuaFunc_ResetMatrix( ReviveTime , Matrix)
	local Time = ReviveTime 
	if ReviveTime < 0 or Type(Revivetime) ~= "number" then
		Time = ReSetNPCInfo( OwnerID() ) --��J 0 �H�U�άO�D�Ʀr�����ͮɶ��A�N�Ѧ�NPC���������ͮɶ��i�歫��
		Time = Time *10
	else
		Time = math.ceil( ReviveTime ) --�L����i��j�� ReviveTime �����
	end
 	MoveToFlagEnabled( OwnerID() , false )
	SetPos( OwnerID(), Matrix[1][0]["X"], Matrix[1][0]["Y"], Matrix[1][0]["Z"] , Matrix[1][0]["Dir"] )
	Sleep( Time +1 )
 	MoveToFlagEnabled( OwnerID() , true )
end

function  LuaFunc_MatrixCircleRecord()
	local RC = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 )
	RC = RC + 1
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +9 , RC )
end