function LuaI_Treasure_Trove_Bridge()
	SetPlot( OwnerID() , "Touch" , "LuaS_Treasure_Trove_Bridge" , 30 )
end

function LuaI_Treasure_Trove_Bridge_BOSS()
	Sleep( 100 )	-- ������إߧ���
	local Switch = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112100 , 1000 )
	--Say( OwnerID() , Switch )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Switch )
	SetPlot( OwnerID() , "Dead" , "LuaS_Treasure_Trove_Bridge_DEAD" , 0 )
end

function LuaS_Treasure_Trove_Bridge_DEAD()
	local Switch = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	--Say( OwnerID() , Switch )
	WriteRoleValue( Switch , EM_RoleValue_PID , 1 )
end

function LuaS_Treasure_Trove_Bridge()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	if PID == 1 then
		local Bridge = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112098 , 50 )	-- ���x�Q��
		if Bridge ~= -1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_112100_1]" , C_SYSTEM )		-- �A�Ұʶ}���A�Q�����n���U�I
			--Say( OwnerID() , "[SC_112100_1]" )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
			PlayMotionEX( Bridge , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 2 )
		end
	elseif PID == 2 then
		-- nothing
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_112100_2]" , C_DEFAULT )
		--Say( OwnerID() , "[SC_112100_2]" )		-- �]���Y�ǽt�G�A�A�ثe�L�k�Ұʳo�Ӷ}���I
	end
end

function LuaI_Treasure_Trove_Door()
	SetPlot( OwnerID() , "Touch" , "LuaS_Treasure_Trove_Door" , 30 )
end

function LuaS_Treasure_Trove_Door()
	local KeyitemID = 203550		-- �����_��ID
	--if ReadRoleValue( TargetID() , EM_RoleValue_PID ) ~= 1 then
		if CountBodyItem( OwnerID() , KeyItemID ) >= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203550_1]" , C_SYSTEM )
			--Say( OwnerID() , "Door Open" )	-- �A�ϥ��_�ͥ��}�F�o�ӿ����I
			DelBodyItem( OwnerID() , KeyItemID , 1 )
			--WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
			Hide( TargetID() )
			--Sleep( 100 )
			--Show( TargetID() , 0 )
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203550_2]" , C_DEFAULT )
			--Say( OwnerID() , "No Key" )		-- �A�S���i�H���}�o�ӿ������_�͡I�I
		end
	--end
end

function LuaI_Tarunemo_Skull()
	local Room = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID )
	local Torch = {}
	for i = 1, 5 do
		Sleep( 5 )
		Torch[i] = CreateObjByFlag( 112103 , 780241 , i , 1 )
		AddToPartition( Torch[i] , Room )
	end
	SetPlot( OwnerID() , "Touch" , "LuaS_Tarunemo_Appear" , 30 )
end

function LuaS_Tarunemo_Appear()
	SetPlot( TargetID() , "Touch" , "" , 0 )

	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101532_1]" , C_DEFAULT )		-- ��۾��j���G�٬٧A�̪��O��a�I�ڤ��򳣤��|�����I
	Sleep( 50 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101532_2]" , C_SYSTEM )		-- ��۾��P�򪺫��ݤ����}�l�U�N�F�_�ӡI
	local Tarunemo = LuaFunc_CreateObjByObj ( 101532 , TargetID() )
	BeginPlot( Tarunemo , "LuaS_Tarunemo_Living" , 0 )
	SetAttack( Tarunemo , OwnerID() )

	local Room = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID )
	local FireTorch = {}
	local Torch = LuaFunc_SearchNPCbyOrgID( TargetID() , 112103 , 500 , 1 )
	for i = 1, 5 do
		Sleep( 5 )
		if Torch[i-1] ~= nil and CheckID( Torch[i-1] ) == true then	DelObj( Torch[i-1] )	end
		FireTorch[i] = CreateObjByFlag( 112101 , 780241 , i , 1 )
		AddToPartition( FireTorch[i] , Room )
		SetPlot( FireTorch[i] , "Touch" , "LuaS_Tarunemo_FireSeed" , 30 )
	end
end

function LuaS_Tarunemo_FireSeed()
	local Tarunemo = LuaFunc_CreateObjByObj ( 112103 , TargetID() )
	if TargetID() ~= nil and CheckID( TargetID() ) == true then	DelObj( TargetID() )	end
	--Say( OwnerID() , "Get Seed" )
	GiveBodyItem( OwnerID() , 203609 , 1 )
	--BeginPlot( Tarunemo , "LuaS_Tarunemo_FireSeed_LivingTime" , 0 )
end

function LuaS_Tarunemo_FireSeed_LivingTime()
	local LivingTime = 10	-- 10 ��

	Sleep( LivingTime * 10 )
	local Tarunemo = LuaFunc_CreateObjByObj ( 112101 , OwnerID() )
	if OwnerID() ~= nil and CheckID( OwnerID() ) == true then	DelObj( OwnerID() )	end
	SetPlot( Tarunemo , "Touch" , "LuaS_Tarunemo_FireSeed" , 30 )
end

function LuaS_Tarunemo_FireSeed_USE()
	local Tarunemo = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if Tarunemo == 101532 then	-- ���ݤ��D
		if CheckBuff( TargetID() , 502688 ) == false then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101532_3]" , C_SYSTEM )		-- ���ݤ��ع��۾����ͤF�ĪG�I�I
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101532_5]" , C_DEFAULT )		-- ��㤣�n��⨺�Ǥ����}�I�I
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101532_6]" , C_DEFAULT )		-- ��۾����W�w�g�s�b���ݤ��D�����A�I�I
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_101532_4]" , C_DEFAULT )		-- �o�Ӥ��إu�����۾����ġI�I
		return false
	end
end

function LuaS_Tarunemo_Living()
	SetPlot( OwnerID() , "Dead" , "LuaS_Tarunemo_Dead" , 30 )

	local AttackTargetID = 0
	local Torch = {}
	local Torch2 = {}
	while true do
		Sleep( 50 )	-- �����ˬd�@��
		AttackTargetID = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTargetID ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  --�ˬd�O�_���}�԰�
			-- nothing
		else
			local FireTorch = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112101 , 1000 , 1 )
			if FireTorch ~= -1 then
				for i = 1, table.getn(FireTorch) do
					Sleep( 1 )
					Torch[i] = LuaFunc_CreateObjByObj ( 112103 , FireTorch[i-1] )
					if FireTorch[i-1] ~= nil and CheckID( FireTorch[i-1] ) == true then	DelObj( FireTorch[i-1] )	end
				end
			end

			if FireTorch2 ~= -1 then
				local FireTorch2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112103 , 1000 , 1 )
				for i = 1, table.getn(FireTorch2) do
					Sleep( 1 )
					Torch2[i] = LuaFunc_CreateObjByObj ( 112103 , FireTorch2[i-1] )
					if FireTorch2[i-1] ~= nil and CheckID( FireTorch2[i-1] ) == true then	DelObj( FireTorch2[i-1] )	end
				end
			end
			local Skull = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112102 , 1000 )	-- ���s�\��
			SetPlot( Skull , "Touch" , "LuaS_Tarunemo_Appear" , 30 )

			if OwnerID() ~= nil and CheckID( OwnerID() ) == true then	DelObj( OwnerID() )	end
		end
	end
end

function LuaS_Tarunemo_Dead()
	local Torch = {}
	local Torch2 = {}
	local FireTorch = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112101 , 1000 , 1 )
	if FireTorch ~= -1 then
		for i = 1, table.getn(FireTorch) do
			Sleep( 1 )
			Torch[i] = LuaFunc_CreateObjByObj ( 112103 , FireTorch[i-1] )
			if FireTorch[i-1] ~= nil and CheckID( FireTorch[i-1] ) == true then	DelObj( FireTorch[i-1] )	end
		end
	end

	local FireTorch2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112103 , 1000 , 1 )
	if FireTorch2 ~= -1 then
		for i = 1, table.getn(FireTorch2) do
			Sleep( 1 )
			Torch2[i] = LuaFunc_CreateObjByObj ( 112103 , FireTorch2[i-1] )
			if FireTorch2[i-1] ~= nil and CheckID( FireTorch2[i-1] ) == true then	DelObj( FireTorch2[i-1] )	end
		end
	end
end