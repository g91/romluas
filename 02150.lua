function ADS_MagicTools_221396( Durable )	--��ù�J������
	local Obj = Role:new( OwnerID() )		
	local MaxHP = Obj:MaxHP()
	local HP = Obj:HP();
	local DHP = MaxHP- HP;
	local PlayerLV = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if PlayerLV < 62 then return Durable end
	--
	ADS_MagicTools_NoUseBuff_Cancel(OwnerID(),0)
	--
	if MaxHP < HP*2 then
		return Durable;
	end
	--
	AddBuff(OwnerID(),509306,0,10)
	return Durable - 100;
end

function ADS_MagicTools_221397( Durable )	--í�w���w�կS�y��
	local Obj = Role:new( OwnerID() )		
	local MaxHP = Obj:MaxHP()
	local HP = Obj:HP();
	local DHP = MaxHP- HP;
	local PlayerLV = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if PlayerLV < 62 then return Durable end
	--
	ADS_MagicTools_NoUseBuff_Cancel(OwnerID(),0)
	--
	if MaxHP < HP*2 then
		return Durable;
	end
	--
	AddBuff(OwnerID(),509307,0,10)
	return Durable - 100;
end

function ADS_MagicTools_221398( Durable )	--�[�Ԫ��V�ë��
	--�[�Ԥ��q
	--Say(OwnerID(),"Check!")
	--
	ADS_MagicTools_NoUseBuff_Cancel(OwnerID(),509312)
	--
	if CheckBuff(OwnerID(),509312) == FALSE and CheckBuff(OwnerID(),509308) == FALSE then
		--Say(OwnerID(),"ADD!")
		AddBuff(OwnerID(),509312,0,-1)
		return Durable
	end
	if CheckBuff(OwnerID(),509312) == FALSE and CheckBuff(OwnerID(),509308) == TRUE then
		--Say(OwnerID(),"COST!")
		return Durable - 100
	end
	return Durable
end

function ADS_MagicTools_221398_509312check()	--�[�Ԫ��V�ë���P�_���v
	local PlayerLV = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if PlayerLV < 62 then 
		AddBuff(OwnerID(),509312,0,-1)
		return
	end
	if ADS_MagicTools_ExistCheck(OwnerID(),221398) == FALSE then
		return
	end
	--
	local Probability = DW_Rand(5)
	--Say(OwnerID(),"Probability "..Probability.."/5")
	--Say(OwnerID(),"Success!")
	if Probability == 1 then
		--Say(OwnerID(),"Success!")
		AddBuff(OwnerID(),509308,0,15)
	else
		AddBuff(OwnerID(),509312,0,-1)
	end
end

function ADS_MagicTools_221399( Durable )	--�̯I������y��
	ADS_MagicTools_NoUseBuff_Cancel(OwnerID(),509313)
	--
	if CheckBuff(OwnerID(),509313) == FALSE and CheckBuff(OwnerID(),509309) == FALSE then
		AddBuff(OwnerID(),509313,0,-1)
		return Durable
	end
	if CheckBuff(OwnerID(),509313) == FALSE and CheckBuff(OwnerID(),509309) == TRUE then
		return Durable - 100
	end
	return Durable
end

function ADS_MagicTools_221399_509313check()	--�̯I������y��P�_���v
	local PlayerLV = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if PlayerLV < 62 then 
		AddBuff(OwnerID(),509312,0,-1)
		return
	end
	if ADS_MagicTools_ExistCheck(OwnerID(),221399) == FALSE then
		return
	end
	--
	local Probability = DW_Rand(5)
	--Say(OwnerID(),"Probability "..Probability.."/5")
	if Probability == 1 then
		--Say(OwnerID(),"Success!")
		AddBuff(OwnerID(),509309,0,15)
	else
		AddBuff(OwnerID(),509313,0,-1)
	end
end

function ADS_MagicTools_221400( Durable )	--���@�̥R��
	ADS_MagicTools_NoUseBuff_Cancel(OwnerID(),509316)
	--
	if CheckBuff(OwnerID(),509316) == FALSE and CheckBuff(OwnerID(),509310) == FALSE then
		AddBuff(OwnerID(),509316,0,-1)
		return Durable
	end
	if CheckBuff(OwnerID(),509316) == FALSE and CheckBuff(OwnerID(),509310) == TRUE then
		return Durable - 100
	end
	return Durable
end

function ADS_MagicTools_221400_509316check()	--���@�̥R��P�_���v
	local PlayerLV = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if PlayerLV < 62 then 
		AddBuff(OwnerID(),509312,0,-1)
		return
	end
	if ADS_MagicTools_ExistCheck(OwnerID(),221400) == FALSE then
		return
	end
	--
	local Probability = DW_Rand(10)
	--Say(OwnerID(),"Probability "..Probability.."/10")
	if Probability == 1 then
		--Say(OwnerID(),"Success!")
		AddBuff(OwnerID(),509310,0,10)
	else
		AddBuff(OwnerID(),509316,0,-1)
	end
end

function ADS_MagicTools_221401( Durable )	--���Ϭ�������
	ADS_MagicTools_NoUseBuff_Cancel(OwnerID(),509317)
	--
	if CheckBuff(OwnerID(),509317) == FALSE and CheckBuff(OwnerID(),509311) == FALSE then
		AddBuff(OwnerID(),509317,0,-1)
		return Durable
	end
	if CheckBuff(OwnerID(),509317) == FALSE and CheckBuff(OwnerID(),509311) == TRUE then
		return Durable - 100
	end
	return Durable
end

function ADS_MagicTools_221401_509317check()	--���Ϭ��������P�_���v
	local PlayerLV = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if PlayerLV < 62 then 
		AddBuff(OwnerID(),509312,0,-1)
		return
	end
	if ADS_MagicTools_ExistCheck(OwnerID(),221401) == FALSE then
		return
	end
	--
	local Probability = DW_Rand(10)
	--Say(OwnerID(),"Probability "..Probability.."/10")
	if Probability == 1 then
		--Say(OwnerID(),"Success!")
		AddBuff(OwnerID(),509311,0,10)
	else
		AddBuff(OwnerID(),509317,0,-1)
	end
end

function ADS_MagicTools_221402( Durable )	--�c�ڼC�b�H��
	ADS_MagicTools_NoUseBuff_Cancel(OwnerID(),509392)
	--
	if CheckBuff(OwnerID(),509392) == FALSE and CheckBuff(OwnerID(),509391) == FALSE then
		AddBuff(OwnerID(),509392,0,-1)
	end
	return Durable
end

function ADS_MagicTools_221402_509392check()	--�c�ڼC�b�H���P�_���v
	local PlayerLV = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if ADS_MagicTools_ExistCheck(OwnerID(),221402) == FALSE then
		return
	end
	if PlayerLV >= 62 then 
		local Probability = DW_Rand(4)
		--Say(OwnerID(),"Probability "..Probability.."/3")
		if Probability == 1 then
			--Say(OwnerID(),"Success!")
			local BuffLV = FN_CountBuffLevel(OwnerID(),509320)
			--
			if BuffLV ~= -1 then
				CancelBuff_NoEvent(OwnerID(),509320)
				if BuffLV <= 8 then
					AddBuff(OwnerID(),509320,BuffLV+1,15)
				else
					AddBuff(OwnerID(),509320,9,15)
				end
			else
				AddBuff(OwnerID(),509320,0,15)
			end
		end
	end
	AddBuff(OwnerID(),509392,0,-1)
end

function ADS_MagicTools_221402_use()	--�c�ڼC�b�H��use
	--Say(OwnerID(),"yes")
	local Durable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_Durable )
	local BuffLV = FN_CountBuffLevel(OwnerID(),509320)
	local PlayerLV = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if PlayerLV < 62 then 
		return
	end
	--
	if BuffLV ~= -1 then
		--BuffLV = BuffLV + 1
		--
		CancelBuff_NoEvent(OwnerID(),509320)
		CancelBuff_NoEvent(OwnerID(),509392)
		AddBuff(OwnerID(),509391,BuffLV,(BuffLV+1)*2) --�ɶ����p�ⳡ���n��+1�A*2
		SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_Durable , Durable-100)
		if Durable-100 == 0 then
			UseItemDestroy()
			CancelBuff_NoEvent(OwnerID(),509392)
		end
	end
end

function ADS_MagicTools_221403_use()
	local PlayerLV = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if PlayerLV < 62 then 
		AddBuff(OwnerID(),509312,0,-1)
		return
	end
	--
	local Durable = GetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_Durable )
	SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , -1 , EM_ItemValueType_Durable , Durable-100)
	if Durable-100 == 0 then
		UseItemDestroy()
		CancelBuff_NoEvent(OwnerID(),509394)
	end
	ADS_MagicTools_NoUseBuff_Cancel(OwnerID(),509395)
	--
	AddBuff(OwnerID(),509394,0,10)
	AddBuff(OwnerID(),509395,0,14)
end

function ADS_MagicTools_221403_509395check()
	local BuffLV = FN_CountBuffLevel(OwnerID(),509394)
	if BuffLV ~= -1 then
		CancelBuff(OwnerID(),509394)
		if BuffLV == 9 then
			AddBuff(OwnerID(),509394,9,10)
			AddBuff(OwnerID(),509395,0,20)
		else
			AddBuff(OwnerID(),509394,BuffLV+1,10)
			AddBuff(OwnerID(),509395,0,20)
		end
	end
end
--============--
	
--============--
function ADS_MagicTools_NoUseBuff_Cancel(player,ignoreBuff)	--�����R�����n���򥻪k�N
	BuffTable = {509312,509313,509316,509317,509392,509395}
	for i = 1,table.getn(BuffTable) do
		if BuffTable[i] ~= ignoreBuff then
			CancelBuff_NoEvent(player,BuffTable[i])
		end
	end
end

function ADS_MagicTools_ExistCheck(PlayerID,MagicTools)	--�ˬd���a���W�O���O�˦��S�w�k�_
	for i=18,20 do	
		if GetItemInfo(PlayerID,EM_ItemPacketType_EQ ,i,EM_ItemValueType_OrgObjID) == MagicTools then
			return TRUE
		end
	end
	return FALSE
end