----�ƥ��X�J�f��Script

-----�ƥ��ǰe���ȩw��

function LuaI_the_hall_Enter()
	SetPlot( OwnerID() , "Collision" , "LuaS_the_hall_Enter" , 0 )
end
function LuaS_the_hall_Enter()
	local PlayerLV = 0
	local PlayerSUBLV = 0
	if GetPartyID( OwnerID() , -1 ) == 0 then		-----�P�_���S������
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then
			if ChangeZone( OwnerID() , 123 , -1 , -1472 , 1437 , -2596 , 92 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 123 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then
			if ChangeZone( OwnerID() , 117 , -1 , -1472 , 1437 , -2596 , 92 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 117 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		if PartyInstanceLv( OwnerID() ) == 0 then
			if ChangeZone( OwnerID() , 123 , -1 , -1472 , 1437 , -2596 , 92 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 123 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif PartyInstanceLv( OwnerID() ) == 1 then
			if ChangeZone( OwnerID() , 117 , -1 , -1472 , 1437 , -2596 , 92 ) then ---���i�h�ƥ����y��
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
				DesignLog( OwnerID() , 117 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		end	
	end	
end

function LuaI_the_hall_Out()
	SetPlot( OwnerID() , "Collision" , "LuaS_the_hall_Out" , 0 )
end
function LuaS_the_hall_Out()
	if ChangeZone( OwnerID() , 2 , 0, 3629 , -45, 11499 , 201 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end


function Lua_apon_hall_idle_mob_1()
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(10)
		local Idle_mob_1 = CreateObjByFlag( 102468 , 780362 , 1 , 1 )
		SetModeEx( Idle_mob_1   , EM_SetModeType_ShowRoleHead, false )--���q�Y����
		SetFightMode ( Idle_mob_1,0, 1, 0,0 )
		AddToPartition( Idle_mob_1,roomid1 )
		local Idle_mob_2 = CreateObjByFlag( 102468 , 780362 , 3 , 1 )
		SetModeEx( Idle_mob_2   , EM_SetModeType_ShowRoleHead, false )--���q�Y����
		SetFightMode ( Idle_mob_2,0, 1, 0,0 )
		AddToPartition( Idle_mob_2,roomid1 )
		LuaFunc_MoveToFlag( Idle_mob_1, 780362 , 2 , 0 )
		LuaFunc_MoveToFlag( Idle_mob_2, 780362 , 4 , 0 )
		sleep(30)
		Delobj(Idle_mob_1)
		Delobj(Idle_mob_2)
	end
end

function Lua_apon_hall_idle_mob_2()
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(10)
		local Idle_mob_1 = CreateObjByFlag( 102471 , 780362 , 5 , 1 )
		SetModeEx( Idle_mob_1   , EM_SetModeType_ShowRoleHead, false )--���q�Y����
		SetFightMode ( Idle_mob_1,0, 1, 0,0 )
		AddToPartition( Idle_mob_1,roomid1 )
		AddBuff(Idle_mob_1,502585,1,-1)
		LuaFunc_MoveToFlag( Idle_mob_1, 780362 , 6 , 0 )
		sleep(20)
		Delobj(Idle_mob_1)
	end
end


