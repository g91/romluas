----�ƥ��X�J�f��Script
-------102678   110578  112224
-----�ƥ��ǰe���ȩw��
function zone_17_NOOPEN_Enter()
	SetPlot( OwnerID() , "Collision" , "bk_17_NOOPEN_enter" , 1 )
end
function bk_17_NOOPEN_enter()
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_17NOOPEN]" , 0 )
end
function zone_17_130_132_133_Enter()
	SetPlot( OwnerID() , "Collision" , "bk_17_130_132_133_Enter" , 1 )
end
function bk_17_130_132_133_Enter()
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local y=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	if GetPartyID( OwnerID() , -1 ) == 0 then		-----�P�_���S������
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then
			if ChangeZone( OwnerID() , 132 , -1 , 1857 , 297 , 1161 , 350 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 132 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then
			if ChangeZone( OwnerID() , 130 , -1 , 1857 , 297 , 1161 , 350 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 130 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		--elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 2 then ------------Ū���ӤH���x���׿��
		--	if ChangeZone( OwnerID() , 133 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then ---���i�h�ƥ����y��
		--		PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
		--		PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
		--		DesignLog( OwnerID() , 133 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
		--	else
		---		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		---	end
		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		if PartyInstanceLv( OwnerID() ) == 0 then
			if ChangeZone( OwnerID() , 132 , -1 , 1857 , 297 , 1161 , 350 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 132 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif PartyInstanceLv( OwnerID() ) == 1 then
			if ChangeZone( OwnerID() , 130 , -1 , 1857 , 297 , 1161 , 350 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 130 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
	--	elseif PartyInstanceLv( OwnerID() ) == 2 then-------------Ū������x���׿��
		--	if ChangeZone( OwnerID() , 133 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then ---���i�h�ƥ����y��
		--		PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
		--		PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
		--		DesignLog( OwnerID() , 133 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		--	end
		end	
	end	
end

function zone_17_130_132_133_Out()
	SetPlot( OwnerID() , "Collision" , "bk_17_130_132_133_Out" , 0 )
end
function bk_17_130_132_133_Out()
	if ChangeZone( OwnerID() , 17 , 0, -3544.1 , 833 , 32921 , 0 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end