----�ƥ��X�J�f��Script
function LuaI_the_origin_Enter()
	SetPlot( OwnerID() , "Collision" , "LuaS_the_origin_Enter" , 0 )
end
function LuaS_the_origin_Enter()
	if ChangeZone( OwnerID() , 116 , -1 , 828 , 263 , 963 , 343 ) then ---���i�h�ƥ����y��
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
		DesignLog( OwnerID() , 116 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

function LuaI_the_origin_Out()
	SetPlot( OwnerID() , "Collision" , "LuaS_the_origin_Out" , 0 )
end
function LuaS_the_origin_Out()
	if ChangeZone( OwnerID() , 4 , 0 , -11724, 119 , 8629 , 360 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
