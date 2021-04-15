--==============�����]�w�ܼ�==============--

function Lua_Zone22_Boss2_Global()--�ޯ�I�񵥯�
	local Global = Zone22_Boss2_Global
	
	Global["Level"] = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	Global["SkillID"] = {}
	Global["SkillID"]["Fire"] = { 498165,498136,498138 };--���K
	Global["SkillID"]["Ice"] = { 498166,498135,498137 };--�H�B
	
	if Global["Level"] == 1 then  --============ ���q ============--
		Global["BossID"] = {	105933, 105934	}
		Global["GiftID"]  = 106100	--�_�c

		Global["Lv"] = {}--�ޯ�I�񵥯�
		Global["Lv"][1] = 30;--����ˮ`
		Global["Lv"][2] = 35;--�e�记��
		Global["Lv"][3] = 40;--�d��AE 
	else --============ ²�� ============--
		Global["BossID"] = {	106706, 106707	}
		Global["GiftID"]  = 106708	--�_�c
		
		Global["Lv"] = {}--�ޯ�I�񵥯�
		Global["Lv"][1] = 4;--����ˮ`
		Global["Lv"][2] = 6;--�e�记��
		Global["Lv"][3] = 8;--�d��AE 
	end	
end

--==============�H�UAI�B�z �O�復==============--

function Lua_Zone22_Boss2_Ctrl()--����
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	
	if Zone22_Boss2_Global == nil then
		Zone22_Boss2_Global = {}
		Lua_Zone22_Boss2_Global()
	end
	if Zone22_Boss2_Global[RoomID] == nil then		
		Zone22_Boss2_Global[RoomID] = {}
	end
	
	local Global = Zone22_Boss2_Global[RoomID]
	Global["FlagID"] = 780984;--�H_�ƥ���_02
	
	if Global["Ctrl"] == nil then
		Global["Boss"] = {};
		Global["Door"] = {};
		for i=1, 2 do
			--if Global["Door"][i] == nil or CheckID(Global["Door"][i]) ~= true then
				Global["Door"][i] = kg_GetPosRX( {Global["FlagID"], i+2}, 106012 );		--���ת�
				SetModeEx( Global["Door"][i], EM_SetModeType_Fight, false );		--�L�k���
				SetModeEx( Global["Door"][i], EM_SetModeType_Searchenemy, false );	-- ����
				SetModeEx( Global["Door"][i] , EM_SetModeType_Strikback , false );	-- ����
				SetModeEx( Global["Door"][i] , EM_SetModeType_Mark , false )		-- �аO
				SetRoleCamp( Global["Door"][i], "Visitor" )
				AddToPartition( Global["Door"][i], RoomID );--�w�]����}��
			--end
		end
		SetModeEx( Global["Door"][1], EM_SetModeType_Show , false )
		SetModeEx( Global["Door"][2], EM_SetModeType_Obstruct , true )	-- ����
	end
	Global["Ctrl"] = OwnerID();
	
	local CreateNum = 0;
	DebugMsg(0,0,"CreateCheck")
	for i=1, 2 do
		--if	Global["Boss"][i] == nil or 
		--	CheckID(Global["Boss"][i]) ~= true then
			
			Global["Boss"][i] = kg_GetPosRX( {Global["FlagID"], i}, Zone22_Boss2_Global["BossID"][i] );
			AddToPartition( Global["Boss"][i], RoomID );
			AddBuff( Global["Boss"][i], 620595, 0, -1 );--���99%
			SetPlot( Global["Boss"][i], "dead", "Lua_Zone22_Boss2_Dead", 0 );--���`�P�_
			CreateNum = CreateNum+1;
		--[[else
			if ReadRoleValue( Global["Boss"][i], EM_RoleValue_IsDead ) == 1 then
				WriteRoleValue( Global["Boss"][i], EM_RoleValue_IsDead, 0 )
				AddToPartition( Global["Boss"][i], RoomID )
			else
				CallPlot( Global["Boss"][i], "ks_resetObj", Global["Boss"][i], 5 );
			end
			DebugMsg(0,0,"Reset Boss "..i )
		end--]]
	end
	
	Global["Fight"] = false;

end

function Lua_Zone22_Boss2_Fight()--�}�l�԰�
	local boss = OwnerID()
	local OrgID = ReadRoleValue( boss, EM_RoleValue_OrgID )
	if OrgID  == 105933 or OrgID == 106706 then
		CallPlot( boss , "Lua_Zone22_Boss2_AI", "Fire", 1 );
	else
		CallPlot( boss , "Lua_Zone22_Boss2_AI", "Ice", 2 );
	end
end

function Lua_Zone22_Boss2_AI( mode, Site )--Boss �԰�AI
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	local FlagX = GetMoveFlagValue( Global["FlagID"] , Site, EM_RoleValue_X );
	local FlagZ = GetMoveFlagValue( Global["FlagID"] , Site, EM_RoleValue_Z );
	local SkillID = Zone22_Boss2_Global["SkillID"];
	local Lv = Zone22_Boss2_Global["Lv"];
	local time = 0;
	local X;
	local Z;
	local Dis;
	
	if Global["Fight"] == false then
		Global["Fight"] = true;
		Global["Stop"] = false;
		Global["Special"] = false
		ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_START]", 2 );--�}�l
		CallPlot( Global["Door"][1], "Lua_CloseTranDoor", true, Boss )--����
		Callplot( Global["Ctrl"], "Lua_Zone22_Boss2_CheckDis", 0 );--�ˬd�Z��
	end
	Lua_Zone22_Boss2_GetHate( Boss )--��������
	AddBuff( Boss, 502707, 0, -1 );--�D�԰����^��
	
	if Zone22_Boss2_Global["Level"] == 1 then
		CallPlot( Boss, "Lua_Zone22_Boss2_BattleCheck" )--�԰��ɶ��ˬd
	end	
	
	while true do
		sleep(10);
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - FlagX )^2 +( Z - FlagZ )^2 )^0.5);
		
		if ( KS_InCombat( Boss ) ~= true or Dis > 500 or CheckBuff( Boss, 502707 ) ~= true ) and Global["Fight"] == true then
			Global["Fight"] = false;			
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_EXIT]", 2 );--�����԰�
			Callplot( Global["Ctrl"], "Lua_Zone22_Boss2_Reset", 0 );--���m
			return
		end
		
		time = time+1;
		if Global["Stop"] == false then
			if time%7 == 0 then
				local TID;
				local Rnd = rand(3)+1;
				if Rnd > 1 then
					TID = Boss;
				end
				TID = TID or ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );
				CastSpellLv( Boss, TID, SkillID[mode][Rnd], Lv[Rnd] );
			end
		end
	end	
end

function Lua_Zone22_Boss2_BattleCheck()--�԰��ɶ��ˬd
	local Boss = OwnerID()
	local time = 0
	while true do
		sleep(10)
		time = time +1
		if not KS_InCombat( Boss ) then
			break
		elseif time >= 360 and not CheckBuff( Boss, 620561 ) then--6�����g��
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_CRAZY]", 2 )--�g��
			AddBuff( Boss, 620561, 0, -1 )
			break
		end
	end
end

function Lua_Zone22_Boss2_Reset()--���m
	DebugMsg(0,0,"Reset Start")
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	CallPlot( Global["Door"][1], "Lua_CloseTranDoor", false, Global["Boss"] )--����
	
	for i= 1, 2 do
		local Num = BuffCount(Global["Boss"][i] );
		for j = 1 , Num do
			CancelBuff( Global["Boss"][i], BuffInfo( Global["Boss"][i] , Num-j, EM_BuffInfoType_BuffID) )
		end
		
		magicinterrupt( Global["Boss"][i] );
		SetStopAttack( Global["Boss"][i] );
		ClearHateList( Global["Boss"][i], -1 );
		CallPlot( Global["Boss"][i], "ks_TransTo", Global["FlagID"], i, nil, 0, 0 )--�ǰe��S�w��m( Rnd = �H���Z�� min=�̤p�Z�� )
		Sleep(5)

		if not CheckID(Global["Boss"][i]) or ReadRoleValue( Global["Boss"][i], EM_RoleValue_IsDead ) == 1 then
			Global["Boss"][i] = kg_GetPosRX( {Global["FlagID"], i}, Zone22_Boss2_Global["BossID"][i] );
			WriteRoleValue( Global["Boss"][i], EM_RoleValue_IsDead, 0 )
			AddToPartition( Global["Boss"][i], RoomID )
			WriteRoleValue( Global["Boss"][i], EM_RoleValue_HP, ReadRoleValue( Global["Boss"][i], EM_RoleValue_MaxHP ) );--����
			SetPlot( Global["Boss"][i], "dead", "Lua_Zone22_Boss2_Dead", 0 );--���`�P�_
			AddBuff( Global["Boss"][i], 620595, 0, -1 );--���99%
		else
			CallPlot( Global["Boss"][i], "ks_resetObj", Global["Boss"][i], 5, 620595 );
		end
		DebugMsg(0,0,"Reset Boss "..i )
	end
	
	local Player = SetSearchAllPlayer( RoomID );
	local ID;
	for i=1, Player do
		ID = GetSearchResult();
		CancelBuff( ID, 620569 );
		CancelBuff( ID, 620570 );
		CancelBuff( ID, 620587 );
	end
	DebugMsg(0,0,"Reset End")
end

function Lua_Zone22_Boss2_Dead()--���`
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	
	ic_ha_de_22_02()--���b��
	
	for i=1, 2 do
		if Global["Boss"][i] ~= Boss and CheckID( Global["Boss"][i] ) == true and ReadRoleValue( Global["Boss"][i], EM_RoleValue_IsDead ) ~= 1 then
			return true;
		end
	end
	
	local gift = kg_GetPosRX( {Global["FlagID"], rand(2)+1}, Zone22_Boss2_Global["GiftID"]   );
	AddToPartition( gift, RoomID );--�w�]����}��	
	ScriptMessage( gift, -1 , 2 , "[SC_ZONE22_BOSS2_DEAD]", 2 );
	
	for i=1, 2 do
		DelFromPartition( Zone22_Boss2_Global[RoomID]["Door"][i] );
	end
	
	Zone22_Boss2_Global[RoomID] = {};
	local Player = SetSearchAllPlayer( RoomID );
	local ID;
	for i=1, Player do
		ID = GetSearchResult();
		CancelBuff( ID, 620569 )--�`������
		CancelBuff( ID, 620570 )--���H����
	end
	return true;
end

function Lua_Zone22_Boss2_GetHate( Boss )--��������	
	local Player = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
	for i=1, GetPartyID( Player, -1 ) do
		local GUID = GetPartyID( Player, i );
		if GetDistance( GUID, Boss ) < 500  then
			SysCastSpellLv( GUID, Boss, 496946, 0 );--����
			SysCastSpellLv( Boss, GUID, 496946, 0 );--����
		end
	end
end

function Lua_Zone22_Boss2_CheckDis()--�ˬd�Z��
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	local Dis;
	
	while Global["Fight"] do
		Sleep(10)
		for i=1, 2 do
			if ReadRoleValue( Global["Boss"][i], EM_RoleValue_IsDead ) == 1 then
				return;
			end
		end
		
		Dis = GetDistance( Global["Boss"][1], Global["Boss"][2] );
		if Dis <= 100 and Global["Special"] == true then			
			for i=1, 2 do
				ScriptMessage( Global["Boss"][i], -1 , 2 , "[SC_ZONE22_BOSS2_CHAOS]", 2 );
				SysCastSpellLv( Global["Boss"][i], Global["Boss"][i], 498145, 0 );--�������P
			end
		elseif Dis <= 35 and Global["Special"] == false and Global["Stop"] == false then
			Global["Stop"] = true;
			Callplot( Global["Boss"][1], "Lua_Zone22_Boss2_AreaEffect", 1 );
			Callplot( Global["Boss"][2], "Lua_Zone22_Boss2_AreaEffect", 2 );
		end
		
		DebugMsg(0,0,"BossDis = "..Dis)
	end
end

function Lua_Zone22_Boss2_AreaEffect( mode )--�F��
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_NOBUFF]", 2 );
	CancelBuff( Boss, 620595 );--���99%
	SysCastSpellLv( Boss, Boss, 498134, 0 );--�z��
	
	for i=1, 5 do
		Sleep(10)
		if KS_InCombat( Boss ) ~= true then
			return
		end
	end
	
	Global["Stop"] = false;
	Global["Special"] = true;
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_AE]", 2 );
	for j=1, 30 do
		if KS_InCombat( Boss ) ~= true then
			return
		end
		SysCastSpellLv( Boss, Boss, 498138+( 3-mode), 0 );--�I���F��
		Sleep(10)
	end
	
	AddBuff( Boss, 620595, 0, -1 )--���99%
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_BUFF]", 2 );
	Global["Special"] = false;
end

function Lua_Zone22_Boss2_FireDebuff()--���
	local OID = OwnerID();
	local LV = KS_CheckBuffLV( OID, 620587 );
	if Lv < 10 then
		AddBuff( OID, 620587, 0, 10-LV );
	end
end

function Lua_Zone22_Boss2_PlayerSkill( mode )--���a�ޯ��ˬd
	local OID = OwnerID();
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	if Global["Boss"] == nil then
		ScriptMessage( OID, OID, 0 , "[SC_204638_0]", 0 );--���ݨϥ�
		ScriptMessage( OID, OID, 1 , "[SC_204638_0]", 0 );--���ݨϥ�
		return false;
	end
	
	if TargetID() == Global["Boss"][mode] then
		return true;
	end
	
	ScriptMessage( OID, OID, 0 , "[EM_200928_2]", 0 );--�ؼп��~
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]", 0 );--�ؼп��~
	return false;
end

function Lua_Zone22_Boss2_DebuffCheck( mode )--�F��BUFF�P�_
	local TID = TargetID()	
	if Zone22_Boss2_Global["Level"] == 1 then
		if mode >2 then
			return false
		elseif not CheckBuff( TID, 620568+(3-mode) ) then--��1/�B2  620569/620570
			return true
		end
		CancelBuff( TID, 620569 );
		CancelBuff( TID, 620570 );
	else
		if mode <3 then
			return false
		elseif not CheckBuff( TID, 622280+(mode-2) ) then--��/�B 622281/622282
			return true
		end
		CancelBuff( TID, 622281 );
		CancelBuff( TID, 622282 );
	end
	
	if not CheckBuff( TID, 620584 ) and not CheckBuff( TID, 620585 ) then
		if mode< 3 then
			AddBuff( TID, 620583+(3-mode), 0, -1 );--�ᵲ/���
		else
			AddBuff( TID, 620583+(mode-2), 0, -1 );--�ᵲ/���
		end
	end
	return false;
end