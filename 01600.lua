----�ƥ��X�J�f��Script

-----�ƥ��ǰe���ȩw��

function LuaI_zone_119_Enter()
	SetPlot( OwnerID() , "Collision" , "LuaS_zone_119_Enter" , 0 )
end
function LuaS_zone_119_Enter()
	if ChangeZone( OwnerID() , 119 , -1 , 3407 , 1502 , 3462 , 200 ) then ---���i�h�ƥ����y��
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
		DesignLog( OwnerID() , 119 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

function LuaI_zone_119_Out()
	SetPlot( OwnerID() , "Collision" , "LuaS_zone_119_Out" , 0 )
end
function LuaS_zone_119_Out()
	if ChangeZone( OwnerID() , 9 , 0, -18430 , 904 , 27013 , 259 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
