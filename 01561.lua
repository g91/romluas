function LuaFunc_NPCWalkByMatrix_2(ObjMatrix,Matrix,dis,count,checktime , Circle )  --�����󨫨�}���y���I���禡
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--�U�Ѽƪ��B�z--
	local ObjRecord = LuaFunc_ObjMatrix_Record(ObjMatrix) --�����Ҧ� NPC ����ơA�H�ѭ��ͨϥ�

	if Circle <= 0 or Circle == nil or Type(Circle) ~= "number" then
		Circle = -1
	else
		Circle = math.ceil( Circle  ) --�L����i��j�� Circle  �����
	end

	if checktime== nil or Type(checktime) ~= "number" then --�p�G Checktime ���X�k�h��J 10 
		checktime = 10
	end

	if count <= 0 or count == nil or Type(count) ~= "number" then
		return
	end

	if dis < 0 or dis == nil or Type(dis) ~= "number" then
		return
	end

	--
	local A
	local B
	local RC = 0

	local WaitCount = 0 --�ݭn���ݪ��ƶq
	local Wait = 0 --�O�_���ݪ����A
	local GoFight = 1
	local GetTarget = 0

	local OID = Role:new(OwnerID())
	local Dir0 = OID:Dir()
	local Time = math.floor(25 *(100/GameObjInfo_int( ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) , "MoveSpeed" ) ) ) + DW_Rand(5)
	 --�ξɤު����t�רӭp��j�骺�ˬd���j�A���ɶ������ɤު������u 50 ���k���Z���A�A�[�W 0.5 ���üƭȨӿ��}
	local CheckDis  = math.floor(75*(GameObjInfo_int( ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ), "MoveSpeed" ) ) / 100 )
	 --�ξɤު����t�רӭp�����}�h���n�}�l�ζ]���A�P�_��Ǭ��t�� 100 ���ܡA��@�y�жb�t�Z 50 �� 1.5 ���N�������]�B

	--�p��x�}���X�k��NPC�ƶq�A�ê�l�Ʀ��������󲾰ʪ�����
	local Num = 0
	for pry , obj in pairs(ObjMatrix)  do 
		if obj ~= nil then
			MoveToFlagEnabled( obj , false )  --����MoveToFlag
			WriteRoleValue( obj ,EM_RoleValue_IsWalk , 1 ) --�]�w������
			Num = Num + 1
		end
	end
	----------------------------------------------------------------------------------------------------------
--	local tick = GetTickCount()
	--�j��}�l--------------------------------------------------------------------------------------------
	while 1 do
--		tick = GetTickCount() 

		--��M�s����m
		Matrix = LuaFunc_Matrix_Maker( dis , count )
		--���m�ݭn���ݪ��H��
		WaitCount = 0
		--�R�O�L�̲��ʨ�s����m���ˬd�O�_���w�g��F�s����m�F
		for pry , obj in pairs(ObjMatrix) do
			if obj ~= nil then
				--�O NPC �åB���b�԰����~�ˬd
				if ReadRoleValue(obj, EM_RoleValue_IsNPC) == 1 and ReadRoleValue(obj, EM_RoleValue_RoomID) == ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then 
					if ReadRoleValue( obj , EM_RoleValue_AttackTargetID) ~= 0 then 
--						yell( Obj , " Fight" , 3 )
						WaitCount = WaitCount + 1
						WriteRoleValue( obj ,EM_RoleValue_IsWalk , 0  ) --�]�w���]�B
					else
						MoveToFlagEnabled( obj , false )  --����MoveToFlag
						A = ObjRecord["A"][pry] --���X�����󪫫~�W�� A ��
						B = ObjRecord["B"][pry] --���X�����󪫫~�W�� B ��
						Local Role = Role:new(obj)
						Local DeltaX = math.abs(Matrix[A][B]["X"]-Role:X() )
						Local DeltaY = math.abs(Matrix[A][B]["Y"]-Role:Y() )
						Local DeltaZ = math.abs(Matrix[A][B]["Z"]-Role:Z() )

						if DeltaX > CheckDis or DeltaZ > CheckDis or DeltaY > CheckDis  then
							WriteRoleValue( obj , EM_RoleValue_IsWalk , 0 )
							if DeltaX < 2*CheckDis and DeltaZ < 2*CheckDis and DeltaY < 2*CheckDis then 
								local CastTime = MoveDirect(obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
--								yell( Obj , " Run :"..CastTime  , 3 )
							else
								WaitCount = WaitCount + 1
								local CastTime =Move( obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
--								yell( Obj , " Long Run :"..CastTime  , 3 )
							end
						else
							WriteRoleValue( obj , EM_RoleValue_IsWalk , 1 )
							local CastTime =MoveDirect(obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
--							yell( Obj , " Walk :"..CastTime  , 3 )
						end

					end
				end
			end
		end
--		Yell( OwnerID() , "Waitting Number : "..WaitCount , 3)
		--�Ӧh�H�涤�ɵ���
		if ( ( Num < 4 and WaitCount > 0 ) or WaitCount >=3 ) and Wait == 0 then
			SetModeEX( OwnerID() , EM_SetModeType_Move , false )
			Wait = 1
--			Yell( OwnerID() , "Waitting for Mobs" , 3)
		end
		if ( ( Num < 4 and WaitCount == 0 ) or WaitCount < 3 )  and Wait == 1 then
			SetModeEX( OwnerID() , EM_SetModeType_Move , true )
			Wait = 0
--			Yell( OwnerID() , "Cancel Waitting" , 3)
		end

		--���s�ɵ���
		if math.abs( OID:Dir()-Dir0) > 30 then
			SetModeEX( OwnerID() , EM_SetModeType_Move , false )
			sleep( count* ( 1+math.floor( (math.abs( OID:Dir()-Dir0)-30) / 30 ) ) )
--			Yell( OwnerID() , "Angel A = "..Dir0.." Angel B = "..OID:Dir().." Waitting :"..count*( 1+math.floor( (math.abs( OID:Dir()-Dir0)-30) / 30 ) ) , 3 )
			Dir0 = OID:Dir()
			SetModeEX( OwnerID() , EM_SetModeType_Move , true )
		end
		--�C�T�w�ɶ��]Circle*checktime) �N�ˬd�O�_�n���Ͱ}�C���Ҧ�NPC
		if Circle > 0 then
			RC = RC + 1
			if RC*Time >= Circle*CheckTime then
				for pry , obj in pairs(ObjMatrix)  do --�ˬd�p�G NPC ���b�A�N���ͤ@�� NPC
					if obj ~= nil then
						if ReadRoleValue(obj, EM_RoleValue_IsNPC) ~= 1 or ReadRoleValue(obj, EM_RoleValue_IsDead) ~= 0 or CheckID(obj) ~= true or ReadRoleValue(obj, EM_RoleValue_RoomID) ~= ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then -- NPC �O�_�s�b
							ObjMatrix[pry] = LuaFunc_CreateNPCByMatrix(ObjRecord["OrgID"][pry],Matrix,ObjRecord["A"][pry],ObjRecord["B"][pry] )
						end
					end
				end
				RC = 0
			end
		end

		--�ˬd�}�C��������O�_���٦s�b�A�p�G�����s�b�A�K�����j��
		local Reset = 0
		for pry , obj in pairs(ObjMatrix) do 
			if obj ~= nil then
				if ReadRoleValue(obj, EM_RoleValue_IsNPC) ~= 1 or ReadRoleValue(obj, EM_RoleValue_IsDead) ~= 0 or CheckID(obj) ~= true or ReadRoleValue(obj, EM_RoleValue_RoomID) ~= ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then -- NPC �O�_�s�b
					Reset = Reset + 1
				end
			end
		end

		if Reset >= Num then
			break
		end
--		Yell( OwnerID() , "A Circle Time :"..GetTickCount() - tick , 3 )
		sleep(Time)
	end
end
function LuaS_102523_test()--�a�����޼@��
--�ŧi�Ҧ��ܼƤγ]�w��
	local dis = 20
	local count = 4 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local circle = 30  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
--��w�}�C��m
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--�]�w�Ǫ����
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102523,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102523,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102523,Matrix,1,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102524,Matrix,2,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102524,Matrix,2,0)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102524,Matrix,2,1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102523,Matrix,3,-1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(102523,Matrix,3,0)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(102523,Matrix,3,1)
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(102525,Matrix,2,-2)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],1,1,0,1 )
	end
--�j��R�O�Ǫ����H
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle )
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end
