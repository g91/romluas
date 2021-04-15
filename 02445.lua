--==============�����]�w�ܼ�==============--

function Lua_Zone22_Boss1_GlobalSet()--�`�Ƴ]�w
	Zone22_Boss1_Global = {}
	local _Global = Zone22_Boss1_Global

	_Global["FlagID"] = 780983;--�H_�ƥ���_01
	_Global["DoorID"] = 104499;--�ƥ���
	
	_Global["SkillID"] = {}
	_Global["SkillID"][1] = 498129;--����ˮ`
	_Global["SkillID"][2] = 498130;--����q�y
	_Global["SkillID"][3] = 498128; --�q�y����
	_Global["SkillID"][4] = 498133;-- �s�����q�y 
	_Global["SkillID"][5] = 498131;-- �����q�y
	_Global["SkillID"][6] = 498132;-- �t���q�y
	
	Lua_Zone22_Boss1_GlobalLevel()--���׳]�w
end

function Lua_Zone22_Boss1_GlobalLevel( )--���׳]�w
	local Global = Zone22_Boss1_Global
	Global["Level"] = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	
	if Global["Level"] == 1 then  --============ ���q ============--
		Global["BossID"] = 105931
		
		Global["Lv"] = {}--�ޯ�I�񵥯�
		Global["Lv"][3] = 0;--����ˮ`
		Global["Lv"][4] = 0;--����q�y
		Global["Lv"][5] = 0;--�q�y���� 
		Global["Lv"][6] = 0;--�����q�y
	else --============ ²�� ============--
		Global["BossID"] = 106442
		
		Global["Lv"] = {}--�ޯ�I�񵥯�
		Global["Lv"][3] = 0;--����ˮ`
		Global["Lv"][4] = 0;--����q�y
		Global["Lv"][5] = 0;--�q�y���� 
		Global["Lv"][6] = 0;--�����q�y
	end
end

--==============�H�UAI�B�z �O�復==============--

function Lua_Zone22_Boss1_Ctrl()--����
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	
	if Zone22_Boss1_Global == nil then
		Lua_Zone22_Boss1_GlobalSet();
	else
	Lua_Zone22_Boss1_GlobalSet();
	end
	if Zone22_Boss1_Global[RoomID] == nil then		
		Zone22_Boss1_Global[RoomID] = {}
	else
		Zone22_Boss1_Global[RoomID] = {}
	end
	
	local Global = Zone22_Boss1_Global[RoomID]
	local _Global = Zone22_Boss1_Global
	Global["Ctrl"] = OwnerID();
	
	Global["Boss"] = kg_GetPosRX( {_Global["FlagID"], 3}, _Global["BossID"] );
	AddToPartition( Global["Boss"], RoomID );
	DebugMsg(0,0,"Create")
	
	SetPlot( Global["Boss"], "dead", "Lua_Zone22_Boss1_Dead", 0 );--���`�P�_

	if Global["Door"] == nil then
		Global["Door"] = {};
		for i=1, 2 do
			--if Global["Door"][i] == nil or CheckID(Global["Door"][i]) ~= true then
				Global["Door"][i] = kg_GetPosRX( {_Global["FlagID"], i}, _Global["DoorID"] );		--���ת�
				SetModeEx( Global["Door"][i], EM_SetModeType_Fight, false );		--�L�k���
				SetModeEx( Global["Door"][i], EM_SetModeType_Searchenemy, false );	-- ����
				SetModeEx( Global["Door"][i] , EM_SetModeType_Strikback , false );	-- ����
				SetModeEx( Global["Door"][i] , EM_SetModeType_Mark , false )		-- �аO
				SetRoleCamp( Global["Door"][i], "Visitor" )
				AddToPartition( Global["Door"][i], RoomID );
			--end
		end
		SetModeEx( Global["Door"][1], EM_SetModeType_Show, false )
		SetModeEx( Global["Door"][2], EM_SetModeType_Obstruct , true )	-- ����
	end
end

function Lua_Zone22_Boss1_Fight()--�}�l�԰�
	CallPlot( OwnerID(), "Lua_Zone22_Boss1_AI" )
end

function Lua_Zone22_Boss1_CloseDoor( close, boss )--����
	local door = OwnerID()
	if close == true then
		if Boss ~= nil and CheckID(Boss) == true and 
		KS_InCombat( Boss ) == not close then
			return
		end
	end

	SetModeEx( door, EM_SetModeType_Show, close )
	SetModeEx( door, EM_SetModeType_Obstruct , close )	-- ����
end

function Lua_Zone22_Boss1_AI()--Boss �԰�AI
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone22_Boss1_Global[RoomID];
	local _Global = Zone22_Boss1_Global;
	local FlagX = GetMoveFlagValue( _Global["FlagID"] , 3 , EM_RoleValue_X );
	local FlagZ = GetMoveFlagValue( _Global["FlagID"] , 3 , EM_RoleValue_Z );
	local _Global = Zone22_Boss1_Global
	Global["BuffArray"] = {};
	Global["EatBuff"] = false;
	local time1 = 0;
	local X;
	local Z;
	local Dis;
		
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS1_START]", 2 );--�}�l
	CallPlot( Global["Door"][1], "Lua_Zone22_Boss1_CloseDoor", true, Boss )--����
	Lua_Zone22_Boss1_GetHate( Boss )--��������
	AddBuff( Boss, 502707, 0, -1 );--�D�԰����^��
	CallPlot( Boss, "Lua_Zone22_Boss1_CreateWind", RoomID );--���ͭ�
	if Zone22_Boss1_Global["Level"] == 1 then
		CallPlot( Boss, "Lua_Zone22_Boss1_BattleCheck" )--�԰��ɶ��ˬd
	end
	
	while true do
		sleep(10);
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - FlagX )^2 +( Z - FlagZ )^2 )^0.5);
		
		if KS_InCombat( Boss ) ~= true or Dis > 240 then
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS1_EXIT]", 2 );--�����԰�
			ks_TransTo( _Global["FlagID"], 3, nil, 0, 0 )--�ǰe��S�w��m( Rnd = �H���Z�� min=�̤p�Z�� )
			Lua_Zone22_Boss1_Reset();--���m
			return
		end
		
		if Global["EatBuff"] == true then
			Global["EatBuff"] = false;
			
			CancelBuff( Boss, 507181 )--����������w
			if	Global["BuffArray"][1] ~= nil and 
				CheckID(Global["BuffArray"][1]) == true and
				ReadRoleValue( Global["BuffArray"][1],EM_RoleValue_IsDead ) == 0 then
				
				StopMove( Boss , false );
				AddBuff( Boss, 507899, 0,100 );--���i����
				SetModeEx( Boss, EM_SetModeType_Move, false );
				SetModeEx( Boss, EM_SetModeType_DisableRotate, true );
				local Y = ReadRoleValue( Boss, EM_RoleValue_Y )+20;
				local NewDir = CalDir( FlagX - ReadRoleValue( Boss, EM_RoleValue_X ), FlagZ - ReadRoleValue( Boss, EM_RoleValue_Z ) )
				Setdir( Boss, 27.32 )
				local radian = (math.pi/180)*NewDir;
				
				ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS1_CATCH][$SETVAR1="..getName(Global["BuffArray"][1]).."]", 2 );--��H
				AddBuff( Global["BuffArray"][1], 620557, 0, 10 )--�·�
				Callplot( Global["BuffArray"][1], "ks_TransTo",  X +(35*math.cos(radian)), Y,  Z - (35*math.sin(radian)) )--�ǰe��S�w��m
				CallPlot( Global["BuffArray"][1], "Lua_Zone22_Boss1_Heal", Boss );
				
				Sleep(20)
				SetModeEx( Boss, EM_SetModeType_DisableRotate, false );
				SetModeEx( Boss, EM_SetModeType_Move, true );
				CancelBuff( Boss, 507899 );--���i����
			end
		end
		
		time1 = time1+1;
		DebugMsg(0,0,"time1 = "..time1 );
		
		if CheckBuff( Boss, 620561 ) then--6�����g��
			CastSpellLv( Boss, Boss, 498181, 0 );
		else
			if time1%18 == 0 then
				Global["BuffArray"] = {};
				local Hate = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
				while table.getn(Hate) > 0 do
					local Rnd = rand( table.getn(Hate) )+1;
					if	CheckID( Hate[Rnd] ) == true and 
						ReadRoleValue( Hate[Rnd], EM_RoleValue_IsDead ) == 0 then
						
						table.insert( Global["BuffArray"],Hate[Rnd] );
						if table.getn(Global["BuffArray"]) == 2 then
							break
						end
					end
					table.remove( Hate, Rnd );
				end
				
				if table.getn(Global["BuffArray"]) > 0 then
					ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS1_SPECIAL]", 2 );--���t��
					CallPlot( Boss, "Lua_Zone22_Boss1_SPECIAL", 0 )
				end
			end
			
			if time1%3 == 0 then
				AddBuff( Boss, 620589, 0, -1 )--����W�q
			end
		
			if ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) == 0 and time1%7 == 0 then
				ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS1_SINGLE]", 2 );--����ޯ�
				StopMove( Boss, false );
				local Rnd = rand(2)+1;
				local TID;
				if Rnd == 2 then
					local Hate = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
					while table.getn(Hate) > 0 do
						local Rnd = rand( table.getn(Hate) )+1;
						if	CheckID( Hate[Rnd] ) == true and 
							ReadRoleValue( Hate[Rnd], EM_RoleValue_IsDead ) == 0 then
							
							TID = Hate[Rnd];
							break;
						end
						table.remove( Hate, Rnd );
					end
				end
				
				TID = TID or ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );				
				CastSpellLv( Boss, TID, _Global["SkillID"][Rnd], 0 );
			end
		end
	end
end

function Lua_Zone22_Boss1_BattleCheck()--�԰��ɶ��ˬd
	local Boss = OwnerID()
	local time1 = 0
	while true do
		sleep(10)
		time1 = time1 +1
		if not KS_InCombat( Boss ) then
			break
		elseif time1 >= 360 and not CheckBuff( Boss, 620561 ) then--6�����g��
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS1_CRAZY]", 2 )--�g��
			AddBuff( Boss, 620561, 0, -1 )
			break
		end
	end
end


function Lua_Zone22_Boss1_Reset()--���m
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone22_Boss1_Global[RoomID];
	CallPlot( Global["Door"][1], "Lua_Zone22_Boss1_CloseDoor", false, Global["Boss"] )--����
	
	local Num = BuffCount(Global["Boss"] );
	for i = 1 , Num do
		CancelBuff( Global["Boss"], BuffInfo( Global["Boss"] , Num-i, EM_BuffInfoType_BuffID) )
	end
	
	SetStopAttack( Global["Boss"] );
	ClearHateList( Global["Boss"], -1 );
	WriteRoleValue( Global["Boss"], EM_RoleValue_HP, ReadRoleValue( Global["Boss"], EM_RoleValue_MaxHP ) );--����
	
	if ReadRoleValue( Global["Boss"], EM_RoleValue_IsDead ) == 1 then
		WriteRoleValue( Global["Boss"], EM_RoleValue_IsDead, 0 )
		AddToPartition( Global["Boss"], RoomID )		
	else
		ks_resetObj( Global["Boss"], 5 );
	end
end

function Lua_Zone22_Boss1_GetHate( Boss )--��������
	local Player = GetPartyID( ReadRoleValue( Boss, EM_RoleValue_AttackTargetID ), -1 );
	for i=1, GetPartyID( Player, -1 ) do
		local GUID = GetPartyID( Player, i );
		if GetDistance( GUID, Boss ) < 500  then
			SysCastSpellLv( GUID, Boss, 496946, 0 );--����
			SysCastSpellLv( Boss, GUID, 496946, 0 );--����
		end
	end
end

function Lua_Zone22_Boss1_Dead()--���`	
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	ScriptMessage( OwnerID(), -1 , 2 , "[SC_ZONE22_BOSS1_DEAD]", 2 );
	
	for i=1, 2 do
		DelFromPartition( Zone22_Boss1_Global[RoomID]["Door"][i] );
	end
		
	Zone22_Boss1_Global[RoomID] = {};
	return true;
end

function Lua_Zone22_Boss1_Heal( Boss )--�v��
	Sleep(10)
	SysCastSpellLv( OwnerID(), Boss, 498153, 0 )
end

function Lua_Zone22_Boss1_SPECIAL()--���t��
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone22_Boss1_Global[RoomID];
	local _Global = Zone22_Boss1_Global;
	for i=1, table.getn(Global["BuffArray"]) do
		AddBuff( Global["BuffArray"][i], 620591, 0, 3 )
	end
	Sleep(28)
	local num = 0;
	for i=1, 2 do
		if	Global["BuffArray"][i] ~= nil and 
			CheckID(Global["BuffArray"][i]) == true and
			ReadRoleValue( Global["BuffArray"][i],EM_RoleValue_IsDead ) == 0 then	
			
			SysCastSpellLv( Global["Boss"], Global["BuffArray"][i], _Global["SkillID"][i+4], _Global["Lv"][i+4] )
			num = num+1;
			if i==1 then
				SysCastSpellLv( Global["BuffArray"][1], Global["Boss"], 495767, 0 )--�D�]�ꦺ
			end
		end
	end
	
	if num == 2 then
		CastSpell( Global["BuffArray"][1], Global["BuffArray"][2], 498147 )
		CallPlot( Global["Boss"], "Lua_Zone22_Boss1_CheckElectrode", 0 )--�ˬd�q��
	elseif num == 1 then
		Sleep(65)
		Global["EatBuff"] = true;
	end
end

function Lua_Zone22_Boss1_CheckElectrode()--�ˬd�q��
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone22_Boss1_Global[RoomID];
	local _Global = Zone22_Boss1_Global;
	for i=1, 7 do
		Sleep(9)
		for j=1, 2 do
			if	Global["BuffArray"][j] == nil or 
				CheckID(Global["BuffArray"][j]) ~= true or 
				ReadRoleValue( Global["BuffArray"][j],EM_RoleValue_IsDead ) == 1 then			
				return;
			end
		end
		
		if GetDistance( Global["BuffArray"][1], Global["BuffArray"][2] ) <= 30 then--����b�d�� �����q�y
			CancelBuff( Global["Boss"], 507181 )--����������w
			for k=1, 2 do
				SysCastSpellLv( Global["BuffArray"][k], Global["BuffArray"][k], _Global["SkillID"][3], _Global["Lv"][3] )
			end
			Sleep(5)
			for k=1, 2 do
				magicinterrupt( Global["BuffArray"][k] );
				CancelBuff( Global["BuffArray"][k], 620554+k)
			end
			return;
		end
	end
	
	Global["EatBuff"] = true;
end

function Lua_Zone22_Boss1_AECheck( mode )--�q�y�����ˬd
	local TID = TargetID();
	
	if ks_NoGM( TID ) == false then
		return false
	end
	
	if mode == 1 and ( CheckBuff( TID, 620555 ) == true or CheckBuff( TID, 620556 ) == true ) then
		return true;
	elseif mode == 2 and CheckBuff( TID, 620555 ) ~= true and CheckBuff( TID, 620556 ) ~= true then
		return true;
	end
	return false
end

function Lua_Zone22_Boss1_CreateWind( RoomID )--�s����
	Sleep(50)
	if KS_InCombat( OwnerID() ) == true then
		for i=1, 2 do
			local Wind = kg_GetPosRX( OwnerID(), 105932, 85, 0, ((i-1)*180)-90 );
			SetModeEx( Wind, EM_SetModeType_Fight, false );	--�L�k���
			SetModeEx( Wind, EM_SetModeType_Searchenemy, false );	-- ����
			SetModeEx( Wind, EM_SetModeType_Strikback , false );	-- ����
			SetModeEx( Wind, EM_SetModeType_Mark , false );	-- �аO
			SetModeEx( Wind, EM_SetModeType_NotShowHPMP, true );--�S�����
			AddToPartition( Wind, RoomID );
			AddBuff( Wind, 620554, 0, -1 );--�~�[
			BeginPlot( Wind, "Lua_Zone22_Boss1_WindAI", 0 );
		end
	end
end

function Lua_Zone22_Boss1_WindAI()--�s����
	local Wind = OwnerID();
	local RoomID = ReadRoleValue( Wind, EM_RoleValue_RoomID );
	local Global = Zone22_Boss1_Global[RoomID];
	local _Global = Zone22_Boss1_Global
	local Site = rand(9)+3;
	local X;	
	local Z;
	local Y = ReadRoleValue( Wind, EM_RoleValue_Y );
	local Fx = GetMoveFlagValue( _Global["FlagID"], Site, EM_RoleValue_X )
	local Fz = GetMoveFlagValue( _Global["FlagID"], Site, EM_RoleValue_Z )
	KS_Move( Wind, 30, Fx, Y, Fz );
	WriteRoleValue( Wind, EM_RoleValue_PID, Site )
	
	while true do
		if KS_InCombat( Global["Boss"] ) ~= true then
			ks_WaitToDie( 1 );--Time�ɶ�  X���ۤv���ۤv
			return
		end
		
		SysCastSpellLv( Wind, Wind, _Global["SkillID"][4], _Global["Lv"][4] );--�q�y
		X = ReadRoleValue( Wind, EM_RoleValue_X );
		Z = ReadRoleValue( Wind, EM_RoleValue_Z );
		local Dis = math.floor( ( ( X - Fx )^2 +( Z - Fz )^2 )^0.5)
		if Dis <=60 then
			local Array = {};
			for i=1, 9 do
				if i+2 ~= Site then
					table.insert( Array, i+2);
				end
			end
			Site = Array[rand(8)+1];
			WriteRoleValue( Wind, EM_RoleValue_PID, Site )
			Fx = GetMoveFlagValue( _Global["FlagID"], Site, EM_RoleValue_X )
			Fz = GetMoveFlagValue( _Global["FlagID"], Site, EM_RoleValue_Z )
		end
		KS_Move( Wind, 30, Fx, Y, Fz );
		Sleep(10)
	end
end