----------------------------------------------------------------------------
--�ֳt�]�w�˳ƨ禡���e
----------------------------------------------------------------------------
function YoYo_WriteBodyEQ( EQPart , OrgObjID , Inherent1 , Inherent2 , Inherent3 , Inherent4 , Inherent5 , Inherent6 , Rune1 , Rune2 , Rune3 ,  Rune4 , Level , Tier )
	--�]�w�˳ƻP���h
	if OrgObjID < 210000 or OrgObjID > 240000 then	--�P�_�˳ƽs���϶�
		Say( OwnerID() , "OrgObjID Errors!! range between 210000 ~ 240000 " )	--���~�T��
	else
		SetRoleEq_Player( OwnerID() , EQPart , OrgObjID )
		--SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_OrgObjID , OrgObjID )	--�ק�˳�ID
		
		local EQLimitLv = GameObjInfo_Int( OrgObjID , "LimitLv" )	--���o�Ӹ˳ƪ������
		local EQTier = math.ceil( EQLimitLv / 20 )	--���o�Ӹ˳ƪ����h
		--Say( OwnerID() , "EQLimitLv = " .. EQLimitLv .. " , EQTier = " ..  EQTier )
		
		if Tier <= EQTier or Tier > 20 then
			Say( OwnerID() , "Tier Errors!! This obj tier range between " .. EQTier .. " ~ 20 " )	--���~�T��
		else
			Tier = Tier - EQTier + 10
			SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_PowerQuality , Tier )	--�קﶥ�h
		end
	end	

	--�]�w���[��O
	local Inherent = { Inherent1 , Inherent2 , Inherent3 , Inherent4 , Inherent5 , Inherent6 }
	local InherentType = { EM_ItemValueType_Inherent1 , EM_ItemValueType_Inherent2 , EM_ItemValueType_Inherent3 , EM_ItemValueType_Inherent4 , EM_ItemValueType_Inherent5 , EM_ItemValueType_Inherent6 }
	for i = 1 , #Inherent do
		if Inherent[ i ] < 510000 or Inherent[ i ] > 520000 then
			if Inherent[ i ] ~= 0 then
				Say( OwnerID() , "Inherent" .. i .. " Errors!! range between 510000 ~ 520000 " )	--���~�T��
			else
				SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , InherentType[ i ] , 0 )	--�ק���[��O = 0
				Say( OwnerID() , "Inherent" .. i .. " = 0 " )
			end
		else
			SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , InherentType[ i ] , Inherent[ i ] )	--�ק�ѥͯ�O
		end
	end
	
	--�]�w�Ť�
	local Rune = { Rune1 , Rune2 , Rune3 ,  Rune4 }
	local RuneType = { EM_ItemValueType_Rune1 , EM_ItemValueType_Rune2 , EM_ItemValueType_Rune3 , EM_ItemValueType_Rune4 }
	for i = 1 , #Rune do
		if Rune[ i ] < 520000 or Rune[ i ] > 530000 then
			if Rune[ i ] ~= 0 then
				Say( OwnerID() , "Rune" .. i .. " Errors!! range between 520000 ~ 530000 " )	--���~�T��
			else
				SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , RuneType[ i ] , 0 )	--�ק�Ť� = 0
				Say( OwnerID() , "Rune" .. i .. " = 0 " )
			end
		else
			SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , RuneType[ i ] , Rune[ i ] )	--�ק�Ť�
		end
	end
	
	--�]�w���嵥��
	if Level < 0 or Level > 20 then
		Say( OwnerID() , "PowerLv Errors!! range between 0 ~ 20 " )	--���~�T��
	else	SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_Level , Level )	--�ק���嵥��
	end
	
	SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_MaxDurable , 20000 )	--�ק�̤j�@�[�� = 200
	SetItemInfo( OwnerID() , EM_ItemPacketType_EQ , EQPart , EM_ItemValueType_Durable , 20000 )	--�ק�@�[�� =200
end