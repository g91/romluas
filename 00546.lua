function LuaFunc_Random_Transport()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 780067
	local FlagCount = GetMoveFlagCount ( Flag )
	local Num = Rand( FlagCount ) 
--	Say( OwnerID() , FlagCount )
	if SetPosByFlag( TargetID(), Flag , Num ) then
--		AddToPartition( TargetID() , RoomID )
	end

end

function LuaFunc_Random_TransportEX(Target , Flag,Transport) --�ǰe�ƼƤH��
	-- Flag �n�ǰe���X�l�s��
	-- Transport �n�ǰe���H��
	local ReturnTag = {}
	local FlagCount = GetMoveFlagCount ( Flag ) - 1 --�p��ӺX�l�s�����Ӽ�(���]�A��0���X)
	local Pos = {} --�x�s�ϥΪ��X�и��
	local PC = {} --�x�s�Q�ǰe�����a���
	local Player = LuaFunc_PartyData(Target) --���o���a������

	if FlagCount < 1 then
		Say( OwnerID() , "Error Flag" )
		return
	end

	for i = 1 , Player[0] , 1 do --��l�ư}�C PC 
		PC[i] = 0
	end

	for i = 1 , FlagCount , 1 do --��l�ư}�C Pos 
		Pos[i] = 0
	end

	for i = 1 , Player[0] , 1 do --���}�C PC ����üƱƦC�����a�}�C

		local Num = Rand(Player[0]) + 1

		for j = 1 , table.getn( PC ) , 1 do
			if PC[Num] ~= 0 then
				Num = Num + 1
				if Num > table.getn(PC) then
					Num = 1
					for k = 1 , table.getn(PC) , 1 do
						if PC[Num] ~= 0 then
							Num = Num + 1
						end
					end
				end
			else
				break
			end
		end

		PC[Num] = Player[i]

	end

	for i = 1 , FlagCount , 1 do --���}�C Pos ����üƱƦC���X���}�C
		local Num = Rand(FlagCount) + 1

		for j = 1 , table.getn(Pos) , 1 do
			if Pos[Num] ~= 0 then
				Num = Num + 1
				if Num > table.getn(Pos) then
					Num = 1
					for k = 1 , table.getn(Pos) , 1 do
						if Pos[Num] ~= 0 then
							Num = Num + 1
						else
							break
						end
					end
				end
			else
				break
			end
		end
		Pos[Num] = i
	end

--	local temp = ""
--	for i = 1 , table.getn(PC) , 1 do --��l�ư}�C PC 
--		temp = temp..PC[i]..", "
--	end
--	Say( OwnerID() , "Player : "..temp )
--	temp = ""
--	for i = 1 , table.getn(Pos) , 1 do --��l�ư}�C PC 
--		temp = temp..Pos[i]..", "
--	end
--	Say( OwnerID() , "Flag : "..temp )

	for i = 1 , Transport , 1 do --�N�}�C PC �������a�ǰe��������}�C Pos ��m�N���X��

		if PC[i] == nill or Pos[i] == nill then
			break
		end
		if ReadRoleValue( PC[i] , EM_RoleValue_IsDead ) ~= 1 then
			SetPosByFlag( PC[i], Flag , Pos[i] ) --�N�Ө���ǰe��S�w�X��
			ReturnTag[i] = PC[i]
		end
--		Say( PC[i],  PC[i].." GoTo "..Pos[i] )
	end
	return ReturnTag
end