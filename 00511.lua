-- �s��Z���]
function New_Hand_Weapon( Option )
	local PlayerID = OwnerID()
	local PackageID = 201704		-- ��}�Z���]
	local WeaponGroup = { 210511 , 210512 , 210513 , 210514 , 210515 , 210516 , 210511 , 210515 , 210514 , 210511}	-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h�B�˪L���̡B�۵M���x�B�F��̡B�Ť�u�K
	local WeaponID = ReadRoleJob_Give( PlayerID , WeaponGroup )

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , WeaponID , 1 )
		GiveBodyItem( PlayerID , 209577 , 1)	--2011/3/14�s�W
	end
end
-- �s�⨾��]
function New_Hand_Armor( Option )
	local PlayerID = OwnerID()
	local PackageID = 201705		-- ��}����]
	local ArmorGroup = { 221581 , 221582 , 221583 , 221584 , 221585 , 221586 , 221581 , 221585 ,221584 , 221581 }	-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h�B�˪L���̡B�۵M���x�B�F��̡B�Ť�u�K
	local ArmorID = ReadRoleJob_Give( PlayerID , ArmorGroup )

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , ArmorID , 1 )
	end
end
-- �s���Ĥ��]
function New_Hand_Potion( Option )
	local PlayerID = OwnerID()
	local PackageID = 201706		-- ���Ĥ��]
	local RedPotionID = 200151
	local BluePotionID = 200152
	local RedPotionGroup = { 5 , 5 , 5 , 2 , 2 , 3 , 5 , 2 , 5 , 5 }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h�B�˪L���̡B�۵M���x�B�F��̡B�Ť�u�K
	local BluePotionGroup = { 0 , 0 , 0 , 3 , 3 , 2 , 0 , 3 , 0 , 0 }		-- �Ԥh�B�C�L�B�v��B�k�v�B���q�B�M�h�B�˪L���̡B�۵M���x�B�F��̡B�Ť�u�K
	local RedPotionNum = ReadRoleJob_Give( PlayerID , RedPotionGroup )
	local BluePotionNum = ReadRoleJob_Give( PlayerID , BluePotionGroup )

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , RedPotionID , RedPotionNum )
		if ( BluePotionNum ~= 0 ) then
			GiveBodyItem( PlayerID , BluePotionID , BluePotionNum )
		end
	end
end
-- �׫p��§��
function New_Hand_Present( Option )
	local PlayerID = OwnerID()
	local PackageID = 201709		-- �׫p��§��
	local Item1 = { 200151 , 5 }		-- ��¦������
	local Item2 = { 220098 , 1 }		-- �ʥ���
	local Item3 = { 520121 , 1}		-- ��O I

	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , Item1[1] , Item1[2] )
		GiveBodyItemEx( PlayerID , Item2[1] , Item2[2] ,  1 , 0 ,0 ,0  , 0 , 0 )
		GiveBodyItem( PlayerID , Item3[1] , Item3[2] )
	end
end
function	CheckDelBodyItem( PlayerID , ItemID , DeleteNumber )
	if ( CountBodyItem( PlayerID , ItemID ) >= DeleteNumber ) then
		DelBodyItem( PlayerID , ItemID , DeleteNumber )
		return true
	else
		return false
	end
end

function ReadRoleJob_Give( PlayerID , ItemGroup )
	local job = ReadRoleValue( PlayerID , EM_RoleValue_VOC )
	if ( job == 0 ) then	-- �޲z��
		ScriptMessage( PlayerID , PlayerID , 2 , "Please don't use GM to test this !!" , C_SYSTEM )	-- �e�������T��
		return ItemGroup[1]
	else
		return ItemGroup[job]
	end
end

-- �ɱϥ�����Ť�����ҩ�
function NoGiveCrystal()
-- ������¾���� 420691-420696
-- ���W�S���Ť�����ҩ� 201467
-- �S����¾ EM_RoleValue_LV_SUB
-- �S����¾�X�� 540820
-- ���W�٦��Ŧ� EmptyPacketCount
-- �Ȧs�ϬO�Ū� QueuePacketCount
	if ( CheckCompleteQuest( OwnerID() , 420691 ) == true or CheckCompleteQuest( OwnerID() , 420692 ) == true or CheckCompleteQuest( OwnerID() , 420693 ) == true or CheckCompleteQuest( OwnerID() , 420694 ) == true or CheckCompleteQuest( OwnerID() , 420695 ) == true or CheckCompleteQuest( OwnerID() , 420696 ) == true ) and CountBodyItem( OwnerID() , 201467 ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB ) == 0 and CheckFlag( OwnerID() , 540820 ) == false and EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then
		GiveBodyItem( OwnerID() , 201467 , 1 )
		Sleep(100)
	end
end

-- �P�_¾�~��
function JobCount()

	local JCount = 0

	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Warrior ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Ranger ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Rogue ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Wizard ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Priest ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Knight ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_RuneDancer ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Druid ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_HARPSYN ) > 0 then
		JCount = JCount + 1
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_PSYRON ) > 0 then
		JCount = JCount + 1
	end

	local JNUM = ReadRoleValue( OwnerID() , EM_RoleValue_VocCount )

	if JCount < JNUM then
		return true
	else
		return false
	end

end