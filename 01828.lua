----�ƥ��X�J�f��Script

-----�ƥ��ǰe���ȩw��

function zone_15_127_128_Enter()
	SetPlot( OwnerID() , "Collision" , "bk_15_127_128_Enter" , 0 )
end
function bk_15_127_128_Enter()
	local PlayerLV = 0
	local PlayerSUBLV = 0
	if GetPartyID( OwnerID() , -1 ) == 0 then		-----�P�_���S������
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then
			if ChangeZone( OwnerID() , 128 , -1 , 1793 , 434 , 2880 , 350 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 128 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then
			if ChangeZone( OwnerID() , 127 , -1 , 1793 , 434 , 2880 , 350 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 127 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		if PartyInstanceLv( OwnerID() ) == 0 then
			if ChangeZone( OwnerID() , 128 , -1 , 1793 , 434 , 2880 , 350 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 128 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif PartyInstanceLv( OwnerID() ) == 1 then
			if ChangeZone( OwnerID() , 127 , -1 , 1793 , 434 , 2880 , 350 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 127 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	end	
end

function zone_15_127_128_Out()
	SetPlot( OwnerID() , "Collision" , "bk_15_127_128_Out" , 0 )
end
function bk_15_127_128_Out()
	if ChangeZone( OwnerID() , 209 , 0, 1645 , 753, -4909 , 272 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
function zone_15_127_128_End()
	SetPlot( OwnerID() , "Collision" , "zone_15_127_128_Interface" , 0 )
end
function zone_15_127_128_Interface()
	local OwnerID = OwnerID()
	local Target = TargetID()
	--say( OwnerID , "1111" )
	CallPlot(OwnerID,"DW_ChooseOneFromTwo",OwnerID,"[SC_ZONE15_ENDDOOR]","bk_15_127_128_End"); 
	--OpenClientMenu( OwnerID , 0 )  
end
function bk_15_127_128_End()
	if ChangeZone( OwnerID() , 15 , 0, -2904 , -93, 7232 , 340 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end