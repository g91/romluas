----�ƥ��X�J�f��Script
-------102678   110578  112224
-----�ƥ��ǰe���ȩw��
--function zone_17_NOOPEN_Enter()
	--SetPlot( OwnerID() , "Collision" , "bk_17_NOOPEN_enter" , 1 )
--end
--function bk_17_NOOPEN_enter()
	--ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_17NOOPEN]" , 0 )
--end

--�Ƕi�I�G/GM ? zone 139 -1 909.8 1470.6 -1420.9 180.5
--�ǥX�I�G/GM ? Zone 20 0 -18371.4 191.1 33711.4
--�~�����I�G/GM ? Zone 20 0 -18372 191.1 33667
--�������I�G/GM ? zone 139 -1 935.9 1472.2 -1419.4

function zone_20_139_140_Enter()
	SetPlot( OwnerID() , "Collision" , "sasa_20_139_140_Enter" , 1 )
end
function sasa_20_139_140_Enter()
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local y=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	if GetPartyID( OwnerID() , -1 ) == 0 then			--�P�_���S������
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then				--Ū���ӤH���x���׿��
			if ChangeZone( OwnerID() , 140 , -1 , 909.8 , 1470.6 , -1420.9 , 180.5 ) then	--���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
				DesignLog( OwnerID() , 140 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		--�����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then			--Ū���ӤH���x���׿��
			if ChangeZone( OwnerID() , 139 , -1 , 909.8 , 1470.6 , -1420.9 , 180.5 ) then	--���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
				DesignLog( OwnerID() , 139 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		--�����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		--elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 2 then			--Ū���ӤH���x���׿��
			--if ChangeZone( OwnerID() , 133 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then		--���i�h�ƥ����y��
				--PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--���o���a����
				--PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
				--DesignLog( OwnerID() , 133 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	--�����i�J�H��	
			--else
				--ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			--end
		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then			--�P�_���S������
		if PartyInstanceLv( OwnerID() ) == 0 then										--Ū���ӤH���x���׿��
			if ChangeZone( OwnerID() , 140 , -1 , 909.8 , 1470.6 , -1420.9 , 180.5 ) then	--���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
				DesignLog( OwnerID() , 140 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		--�����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif PartyInstanceLv( OwnerID() ) == 1 then										--Ū���ӤH���x���׿��
			if ChangeZone( OwnerID() , 139 , -1 , 909.8 , 1470.6 , -1420.9 , 180.5 ) then	--���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
				DesignLog( OwnerID() , 139 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		--�����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		--elseif PartyInstanceLv( OwnerID() ) == 2 then										--Ū���ӤH���x���׿��
			--if ChangeZone( OwnerID() , 133 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then		--���i�h�ƥ����y��
				--PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
				--PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			--���o���a��¾����
				--DesignLog( OwnerID() , 133 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	--�����i�J�H��	
			--else
				--ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			--end
		end	
	end	
end

function zone_20_139_140_Out()
	SetPlot( OwnerID() , "Collision" , "sasa_20_139_140_Out" , 0 )
end
function sasa_20_139_140_Out()
	if ChangeZone( OwnerID() , 20 , 0 , -18371.4 , 191.1 , 33711.4 , 0 ) then			--�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end