function LuaFunc_NPCWalkByMatrix(ObjMatrix,Matrix,dis,count,checktime , Circle )  --�����󨫨�}���y���I���禡
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

	local A
	local B
	local RC = 0
	local OID = Role:new(OwnerID())

	local X0 = OID:X()
	local Y0 = OID:Y()
	local Z0 = OID:Z()
	local MoveIdentify = "Yes"

	local ObjRecord = LuaFunc_ObjMatrix_Record(ObjMatrix) --�����Ҧ� NPC ����ơA�H�ѭ��ͨϥ�

	if Circle <= 0 or Circle == nil or Type(Circle) ~= "number" then
		Circle = -1
	else
		Circle = math.ceil( Circle  ) --�L����i��j�� Circle  �����
	end

	if checktime < 15 or checktime== nil or Type(checktime) ~= "number" then --�j��j�骺�ˬd���j�� 1.5 ��H�W�A�õ��� 0.5 ���üƭ�
		CheckTime = 15 + DW_Rand(5) 
	else
		CheckTime = CheckTime + DW_Rand(5) 
	end

	if count <= 0 or count == nil or Type(count) ~= "number" then
		return
	end

	if dis < 0 or dis == nil or Type(dis) ~= "number" then
		return
	end

	local Num = 0
	for pry , obj in pairs(ObjMatrix)  do --�p��x�}���X�k��NPC�ƶq
		if obj ~= nil then
			Num = Num + 1
		end
	end

	while 1 do
		--�ˬd�ۤv���ʪ��Z���O�_����
		if ( ( X0 - OID:X() )^2 + ( Y0 - OID:Y() )^2 +( Z0 - OID:Z() )^2 ) > 100 and MoveIdentify == "No" then
			MoveIdentify = "Yes"
			X0 = OID:X() 
			Y0 = OID:Y() 
			Z0 = OID:Z() 
		else
			MoveIdentify = "No"
		end

		if MoveIdentify == "Yes" then
--			SetModeEX( OwnerID() , EM_SetModeType_Move , false )
			--��M�s����m
			Matrix = LuaFunc_Matrix_Maker( dis , count )
 
			--�R�O�L�̲��ʨ�s����m
			for pry , obj in pairs(ObjMatrix) do
				if obj ~= nil then
					if ReadRoleValue(obj, EM_RoleValue_IsNPC) == 1 and ReadRoleValue(obj, EM_RoleValue_RoomID) == ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) and ReadRoleValue(obj, EM_RoleValue_IsDead) == 0 then --�ˬd�O���O NPC
						if ReadRoleValue( obj , EM_RoleValue_AttackTargetID) ~= 0 then 
							if ReadRoleValue( obj , EM_RoleValue_IsWalk ) == 1 then
								WriteRoleValue( obj ,EM_RoleValue_IsWalk , 0  ) --�]�w���]�B
							end
						else
							MoveToFlagEnabled( obj , false )
							A = ObjRecord["A"][pry] --���X�����󪫫~�W�� A ��
							B = ObjRecord["B"][pry] --���X�����󪫫~�W�� B ��

							Local Role = Role:new(obj)
							Local DeltaX = Matrix[A][B]["X"]-Role:X()
							Local DeltaY = Matrix[A][B]["Y"]-Role:Y()
							Local DeltaZ = Matrix[A][B]["Z"]-Role:Z()
							local Distance = ( DeltaX*DeltaX ) + ( DeltaY*DeltaY ) + ( DeltaZ*DeltaZ )
							local FinalDis = 10*dis
							local LongMove = 0

							if 10*dis < 150 then
								FinalDis = 150
							end
							if Distance >= (300)*(300) then --���F�`�ٸ귽�A�����Υ���Ƨ@�P�w
								SetPos( obj, Matrix[A][B]["X"], Matrix[A][B]["Y"], Matrix[A][B]["Z"] , Matrix[A][B]["Dir"] )
							elseif Distance >= (FinalDis)*(FinalDis) then
								WriteRoleValue( Obj , EM_RoleValue_IsWalk , 0 )
								LongMove = 1
							else
								WriteRoleValue( Obj , EM_RoleValue_IsWalk , 1 )
							end
							
							if LongMove ~= 0 or HateListCount( OwnerID() ) > 0 then
								Move( obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
							else
								MoveDirect(obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
							end
						end
					end
				end
			end
		end

		sleep(checktime)

		--�ˬd�O�_���w�g��F�s����m�F
		for i = 1 , 10 , 1 do --���Ӥ[�������U�@�Ӧ�m
			local Check = 0
			for pry , obj in pairs(ObjMatrix) do
				if obj ~= nil then
					if ReadRoleValue(obj, EM_RoleValue_IsNPC) == 1 and ReadRoleValue( obj , EM_RoleValue_AttackTargetID) == 0 and ReadRoleValue(obj, EM_RoleValue_RoomID) == ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then --�O NPC �åB���b�԰����~�ˬd
						A = ObjRecord["A"][pry] --���X�����󪫫~�W�� A ��
						B = ObjRecord["B"][pry] --���X�����󪫫~�W�� B ��
						local Role = Role:new(obj)
						if Role:X() == Matrix[A][B]["X"] or Role:Y() == Matrix[A][B]["Y"] or Role:Z() == Matrix[A][B]["Z"] then
							Check = Check + 1
						end
					end
				end
			end
			if Check == Num then
				break
			end
			sleep( 3 )
		end
--		SetModeEX( OwnerID() , EM_SetModeType_Move , true )
		--�C���� Circle ��A�ˬd�O�_�n���Ͱ}�C���Ҧ�NPC
		if Circle > 0 then
			RC = RC + 1
			if RC >= Circle then
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

		--�ˬd�}�C��������O�_���٦s�b�A�p�G�����s�b�A�K�����^��
		local Reset = 0
		for pry , obj in pairs(ObjMatrix) do 
			if obj ~= nil then
				if ReadRoleValue(obj, EM_RoleValue_IsNPC) ~= 1 or ReadRoleValue(obj, EM_RoleValue_IsDead) ~= 0 or CheckID(obj) ~= true or ReadRoleValue(obj, EM_RoleValue_RoomID) ~= ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then -- NPC �O�_�s�b
					Reset = Reset + 1
				end
			end
		end
		if Reset == Num then
			break
		end
	end

end