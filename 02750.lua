
--�ƥ��ٸ��q�Ψ禡----------------------------------------------------------------------------------

function sasa_ZoneDungeon_title_01(TitleID)		--�ƥ��ؼ�����
	Cl_Resist_HackersBossDead();
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do  
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == RoomID then
			if CountBodyItem ( ID , TitleID ) == 0 then
				GiveBodyItem( ID , TitleID , 1 )
			end
		end
	end
end

------------�¸�ơA�Ű�--------------------------------------------------------------------

--ZONE146------------------�ٸ�2�������b�p��SCRIPT��----------------------------------------

function sasa_Zone146_title_01()		--146 ��Z�i������
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do  
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == RoomID then
			if CountBodyItem ( ID , 530930 ) == 0 then
				GiveBodyItem( ID , 530930 , 1 )
			end
		end
	end
end

--ZONE149------------------�ٸ�2�������b�p��SCRIPT��----------------------------------------

function sasa_Zone149_title_01()		--149 �ĪL�ര����
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do  
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == RoomID then
			if CountBodyItem ( ID , 530931 ) == 0 then
				GiveBodyItem( ID , 530931 , 1 )
			end
		end
	end
end

--ZONE152------------------�ٸ�2�������b�p��SCRIPT��----------------------------------------

function sasa_Zone152_title_01()		--152 ����������
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(RoomID)
	for i = 1 , PPL , 1 do  
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == RoomID then
			if CountBodyItem ( ID , 530951 ) == 0 then
				GiveBodyItem( ID , 530951 , 1 )
			end
		end
	end
end