function LuaI_Enter_Mirror()
	SetPlot( OwnerID() , "Range" , "Enter_Mirror" ,  65 )
end

function Enter_Mirror()
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
	if PlayerLV <= 30 then
			AddBuff( OwnerID() ,502040,1 ,1200);							--�[�J�p��
			AddBuff( OwnerID() ,502041,1 ,1200);							--�[�J�p��
	end
	sleep(10)
	if ChangeZone( OwnerID() , 103, -1 , 725 , -146 , 940 , 290 ) then

		DesignLog(OwnerID(),103,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaI_Outer_Mirror()
	SetPlot( OwnerID() , "Collision" , "Outer_Mirror" ,  0 )
end

function Outer_Mirror()
	ChangeZone( OwnerID() , 4 , 0 , -3905 , 385 , -840 , 175 )
end
