function LuaI_Enter_BossPass()
	SetPlot( OwnerID() , "Range" , "Enter_BossPass" ,  65 )
end

function Enter_BossPass()
	if ChangeZone( OwnerID() , 106, -1 , 2800 , 78.6 ,  3000 , 269 ) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
		DesignLog(OwnerID(),106,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
		if PlayerLV <= 45 then
			AddBuff( OwnerID() ,502180,1 ,1200);							--�[�J�p��
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaI_Out_BossPass()
	SetPlot( OwnerID() , "Range" , "Out_BossPass" ,  65 )
end

function Out_BossPass()
	ChangeZone( OwnerID() , 10 , 0 , -42554 , 168.7 ,  2276.4 , 302 )
end