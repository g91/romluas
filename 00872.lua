function LuaYU_100699_0()
	SetPlot( OwnerID() , "Range" , "LuaYU_100699_1" , 20 )
end

function LuaYU_100699_1()
	if CountBodyItem( OwnerID() , 202982 ) >= 1 or CheckBuff( OwnerID() , 502159 ) == true then

		local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
--		local Key

		ScriptMessage(OwnerID(), OwnerID() , 1 , GetString("SAY_MYSTERYLAND_2") , C_SYSTEM )	-- �A�Q���������~�l�F�i�h�C

--		Key = CountBodyItem( OwnerID() , 202982 )
--		DelBodyItem( OwnerID() , 202982 , Key )

			if ChangeZone( OwnerID(), 250 , -1 , 2425, 16, 256, Dir) then   --ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
					local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--���o���a����
					local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--���o���a��¾����
					DesignLog(OwnerID(),250,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--�����i�J�H��
			else
					ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
			end


						
	else
			ScriptMessage(OwnerID(), OwnerID() , 1 , GetString("SAY_MYSTERYLAND_3") , 0)	-- �A�ݭn���]�ۤ~��i�J�C
	end
end
