
--副本稱號通用函式----------------------------------------------------------------------------------

function sasa_ZoneDungeon_title_01(TitleID)		--副本目標擊殺
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

------------舊資料，勿動--------------------------------------------------------------------

--ZONE146------------------稱號2直接掛在小怪SCRIPT內----------------------------------------

function sasa_Zone146_title_01()		--146 瑟坦波菲擊殺
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

--ZONE149------------------稱號2直接掛在小怪SCRIPT內----------------------------------------

function sasa_Zone149_title_01()		--149 薩林戈敦擊殺
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

--ZONE152------------------稱號2直接掛在小怪SCRIPT內----------------------------------------

function sasa_Zone152_title_01()		--152 奎爾諾擊殺
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