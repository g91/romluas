
function LuaS_Zone7to115_0()
	SetPlot(OwnerID(),"range","LuaS_Zone7to115_1",50)
end

function LuaS_Zone7to115_1()
	if	CheckFlag(OwnerID(),542696)	then
		local PlayerLV = 0
		local PlayerSUBLV = 0
		if GetPartyID( OwnerID() , -1 ) == 0 then		-----�P�_���S������
			if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then
				if ChangeZone( OwnerID(), 126 , -1 , 2346 , 663 , 3338  , 25 ) then ---���i�h�ƥ����y��
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
					DesignLog( OwnerID() , 126 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then
				if ChangeZone( OwnerID(), 115 , -1 , 2346 , 663 , 3338  , 25 ) then ---���i�h�ƥ����y��
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
					DesignLog( OwnerID() , 115 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end	
		elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
			if PartyInstanceLv( OwnerID() ) == 0 then
				if ChangeZone( OwnerID(), 126 , -1 , 2346 , 663 , 3338  , 25 ) then ---���i�h�ƥ����y��
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
					DesignLog( OwnerID() , 126 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			elseif PartyInstanceLv( OwnerID() ) == 1 then
				if ChangeZone( OwnerID(), 115 , -1 , 2346 , 663 , 3338  , 25 ) then ---���i�h�ƥ����y��
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
					DesignLog( OwnerID() , 115 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end	
		end			
	else
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_ZONE7TO115_0]",0 );
	end
end

function LuaS_Zone7to115_2()
	SetPlot(OwnerID(),"range","LuaS_Zone7to115_3",100)
end

function LuaS_Zone7to115_3()
	if	not	CheckBuff(OwnerID(),503499)	then
		AddBuff(OwnerID(),503499,1,-1)
	end
end

function LuaS_115toZone7_0()
	SetPlot(OwnerID(),"range","LuaS_115toZone7_1",50)
end

function LuaS_115toZone7_1()
	ChangeZone( OwnerID(), 7 , 0 , 24932 ,-30  , 19051 , 210 );
end