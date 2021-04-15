--==============�����]�w�ܼ�==============--

function Lua_Zone21_Boss1_GlobalSet()--�����ܼƳ]�w
	Zone21_Boss1_Global = {}
	local Global = Zone21_Boss1_Global
	Global["FlagID"] = 780983;--���󲣥ͺX��
	
	Global["SkillID"] = {}--�k�N���X
	Global["SkillID"][1] = 497862--�e���b
	Global["SkillID"][2] = 497863--��z�g��
	Global["SkillID"][3] = 497864--�z���g��
	Global["SkillID"][4] = 497865--�d�нb
	Global["SkillID"][5] = 497866--�H�P�f
	Global["SkillID"][6] = 498004--����g��	
	
	Lua_Zone21_Boss1_GlobalLevel()--���׳]�w
end

function Lua_Zone21_Boss1_GlobalLevel( )--���׳]�w
	local level = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	local Global = Zone21_Boss1_Global
	
	if level == 1 then  --============ �x�� ============--
		Global["BossID"] = 105807
		Global["FakeBoss"] = 118789--���H
		
		Global["Lv"] = {}--�ޯ�I�񵥯�
		Global["Lv"][1] = 130--�e���b
		Global["Lv"][2] = 25--��z�g��
		Global["Lv"][3] = 25--�z���g��
		Global["Lv"][4] = 3--�d�нb
		Global["Lv"][5] = 3--�H�P�f
		Global["Lv"][6] = 40--����g��
		Global["Lv"][7] = 30--����N��

		--�Ĥ@�ӭȬ��{���� �ĤG�ӭȬ����î�
		Global["SkillTarget"] = {}--�ޯ઺�ؼмƶq
		Global["SkillTarget"][1] = {	1,	3	};--�e���b
		Global["SkillTarget"][2] = {	1,	3	};--��z�g��
		Global["SkillTarget"][3] = {	6,	0	};--�z���g��
		Global["SkillTarget"][4] = {	2,	0	};--�d�нb
		Global["SkillTarget"][5] = {	0,	4	};--�H�P�f
		Global["SkillTarget"][6] = {	1,	0	};--����g��
			
	elseif level == 2 then  --============ ���q ============--
		Global["BossID"] = 106043--���q��
		Global["FakeBoss"] = 119011--���H
		Global["Lv"]= {}--�ޯ�I�񵥯�(���q)
		Global["Lv"][1] = 100--�e���b
		Global["Lv"][2] = 25--��z�g��
		Global["Lv"][3] = 25--�z���g��
		Global["Lv"][4] = 6--�d�нb
		Global["Lv"][5] = 6--�H�P�f
		Global["Lv"][6] = 60--����g��
		Global["Lv"][7] = 20--����N��

		--�Ĥ@�ӭȬ��{���� �ĤG�ӭȬ����î�
		Global["SkillTarget"] = {}--�ޯ઺�ؼмƶq(���q)
		Global["SkillTarget"][1] = {	1,	2	};--�e���b
		Global["SkillTarget"][2] = {	1,	2	};--��z�g��
		Global["SkillTarget"][3] = {	3,	0	};--�z���g��
		Global["SkillTarget"][4] = {	1,	0	};--�d�нb
		Global["SkillTarget"][5] = {	0,	1	};--�H�P�f
		Global["SkillTarget"][6] = {	1,	0	};--����g��
		
	else--============ ²�� ============--
		Global["BossID"] = 106044
		Global["FakeBoss"] = 119012--���H	
		Global["Lv"] = {}--�ޯ�I�񵥯�
		Global["Lv"][1] = 25--�e���b
		Global["Lv"][2] = 10--��z�g��
		Global["Lv"][3] = 20--�z���g��
		Global["Lv"][4] = 4--�d�нb
		Global["Lv"][5] = 4--�H�P�f
		Global["Lv"][6] = 10--����g��
		Global["Lv"][7] = 10--����N��
		
		--�Ĥ@�ӭȬ��{���� �ĤG�ӭȬ����î�
		Global["SkillTarget"] = {}--�ޯ઺�ؼмƶq(
		Global["SkillTarget"][1] = {	1,	2	};--�e���b
		Global["SkillTarget"][2] = {	1,	1	};--��z�g��
		Global["SkillTarget"][3] = {	3,	0	};--�z���g��
		Global["SkillTarget"][4] = {	1,	0	};--�d�нb
		Global["SkillTarget"][5] = {	0,	1	};--�H�P�f
		Global["SkillTarget"][6] = {	1,	0	};--����g��
	end
end

function Lua_Zone21_Boss1_SetLightColor()--�]�w�ܶ��C�����
	local LightColor = 0x00000000;--�]�w�C��(�Ъ������X)
	return LightColor;
end

function Lua_Zone21_Boss1_ErrorTime( Time )--�]�w�I�����Ѯɶ�
	Zone21_Boss1_Global["FireTime"] = Time;
end

--==============�H�UAI�B�z �O�復==============--

function Lua_Zone21_Boss1_Fight()--�}�l�԰�
	CallPlot( OwnerID(), "Lua_Zone21_Boss1_AI" )
end

function Lua_Zone21_Boss1_Ctrl()--����
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	
	if Zone21_Boss1_Global == nil then
		Lua_Zone21_Boss1_GlobalSet();
	end
	
	if Zone21_Boss1_Global[RoomID] == nil then
		Zone21_Boss1_Global[RoomID] = {}
	end
	
	local Global = Zone21_Boss1_Global[RoomID]
	local FlagID = Zone21_Boss1_Global["FlagID"];
	Global["Ctrl"] = OwnerID();
	
	if	Global["Boss"] == nil or 
		CheckID( Global["Boss"] ) ~= true or
		ReadRoleValue( Global["Boss"], EM_RoleValue_OrgID ) ~= Zone21_Boss1_Global["BossID"] then
		
		Global["Boss"] = kg_GetPosRX( { FlagID, 0}, Zone21_Boss1_Global["BossID"] );
		WriteRoleValue( Global["Boss"], EM_RoleValue_PID, ReadRoleValue( Global["Ctrl"], EM_RoleValue_PID ) )
		AddToPartition( Global["Boss"], RoomID );
	else
		ks_resetObj( Global["Boss"], 0 );
	end		
	
	Lua_Zone21_Boss1_CreateObj();--������x
	SetDefIdleMotion( Global["Door"][1], ruFUSION_MIME_ACTIVATE_LOOP )--�O���}��
	SetDefIdleMotion( Global["Door"][2], ruFUSION_MIME_IDLE_STAND )--�O������
	
	SetPlot( Global["Boss"], "dead", "Lua_Zone21_Boss1_Dead", 0 );--���`�P�_
end

function Lua_Zone21_Boss1_AI()--Boss �԰�AI
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local FlagID = Zone21_Boss1_Global["FlagID"];
	local Global = Zone21_Boss1_Global[RoomID];
	local FlagX = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local FlagZ = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );
	local time = 0;
	local TransTime = 0;
	local SpellMagicID = 0;
	local ATID = 0;	
	Global["Show"] = 1;--Boss���A
	Global["Interval"] = 0;--�i�J�·t�P��
	Global["DarkTime"] = 0;--�·t��
	Global["AddNum"] = 0;--�·t�g���l�[���ؼФH��
	Global["Phase"] = 1
	local X;
	local Z;
	local Dis;
	
	SetDefIdleMotion( Boss, ruFUSION_MIME_ATTACK_BOW_LOOP )
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS1_START]", 2 );--�}�l
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", true, Boss )--����
	AddBuff( Boss, 502707, 0, -1 );--�D�԰����^��
	LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.8 , "Lua_Zone21_Boss1_InDark" );--��������
	CallPlot( Global["Ctrl"], "Lua_Zone21_Boss1_TimeCheck", Boss )--�·t�p�ɾ�
	
	while true do
		sleep(10)
		
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - FlagX )^2 +( Z - FlagZ )^2 )^0.5);
		
		if KS_InCombat( Boss ) ~= true or Dis > 500 then
			SetDefIdleMotion( Boss, ruFUSION_MIME_IDLE_STAND )
			ScriptMessage( Global["Door"][1], -1 , 2 , "[SC_ZONE21_BOSS1_EXIT]", 2 );--�����԰�
			ks_TransTo( FlagID, 0, nil, 0, 0 )--�ǰe��S�w��m( Rnd = �H���Z�� min=�̤p�Z�� )
			Lua_Zone21_Boss1_Reset();--���m
			return
		end
		
		
		ATID = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );		
		if ATID ~= 0 and CheckID( ATID ) == true and GetDistance( Boss, ATID ) <= 60 then
			if TransTime >= 6 then
				TransTime = 0;
				ks_TransTo( FlagID, rand(9)+12, nil, 30, 0 )--�ǰe��S�w��m( Rnd = �H���Z�� min=�̤p�Z�� )
			else
				TransTime = TransTime+1;
			end
		else
			TransTime = 0;
		end	
		
		if ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) == 0 then
			time = time+1;--�ɶ����W
			--DebugMsg(0,0,"Battle Time = "..time.."; Hide Time = "..Global["Interval"]);
			if Global["Show"] == 1 then--�դ�
				if time%13 == 0 then
					local sTime = Lua_Zone21_Boss1_SpecialSkill()--�d�нb
					sleep(sTime*10)
				elseif time%9 == 0 then
					Lua_Zone21_Boss1_SpellSkill( 3 )--�z���g��
				elseif time%7 == 0 then
					Lua_Zone21_Boss1_SpellSkill( rand(2)+1 )--�e���b/��z�g��
				else
					Lua_Zone21_Boss1_SpellSkill( 6 )--����g��
				end
			elseif time%7 == 0 then--�·t
				if rand(2) == 0 then
					local sTime = Lua_Zone21_Boss1_SpellSkill( 2 )--��z�g��
					time = time + sTime
				else
					Lua_Zone21_Boss1_SpellSkill( 5 )--�H�P�f
				end
			end

		end
	end
end

function Lua_Zone21_CloseDoor( close, Boss )--�}��
	local door = OwnerID()
	if close == true then
		for i=1, 2 do
			Sleep(10)
			if Boss ~= nil and CheckID(Boss) == true and 
			KS_InCombat( Boss ) == not close then
				return
			end
		end
	else
		Sleep(20)
	end
	
	if close == true then		
		PlayMotion( door, ruFUSION_ACTORSTATE_ACTIVATE_END )		
		SetDefIdleMotion( door, ruFUSION_MIME_IDLE_STAND )
		--SetDefIdleMotion( door, ruFUSION_MIME_ACTIVATE_END )
	else
		PlayMotion( door, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
		SetDefIdleMotion( door, ruFUSION_MIME_ACTIVATE_LOOP )
	end
end

function Lua_Zone21_Boss1_ClearItem( RoomID )--�M�����a���~
	local Player = SetSearchAllPlayer( RoomID );
	local ID;
	for i=1, Player do
		ID = GetSearchResult();
		DelBodyItem( ID, 240095, CountBodyItem( ID, 240095 ) )--�R������
		DelBodyItem( ID, 240284, CountBodyItem( ID, 240284 ) )--�R��������
		DelBodyItem( ID, 240285, CountBodyItem( ID, 240285 ) )--�R���I�U������
		CancelBuff( ID, 620268 )--�w�t
	end
end

function Lua_Zone21_Boss1_Reset()--���m
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	
	Lua_Zone21_Boss1_ClearItem( RoomID )--�M�����a���~

	local BuffTable = {};
	for i = 1 , BuffCount(Global["Boss"] ) do
		table.insert( BuffTable, BuffInfo( Global["Boss"] , i-1, EM_BuffInfoType_BuffID) );
	end

	for i=1, table.getn(BuffTable) do
		CancelBuff( Global["Boss"]  , BuffTable[i] )
	end
	
	SetStopAttack( Global["Boss"] );
	ClearHateList( Global["Boss"], -1 );
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", false, Global["Boss"] )--����
	
	Lua_Zone21_Boss1_CreateObj();--���ͪ���	
	WriteRoleValue( Global["Boss"], EM_RoleValue_HP, ReadRoleValue( Global["Boss"], EM_RoleValue_MaxHP ) );--����
	if Global["Show"] == 0 then
		Lua_Zone21_Boss1_ExitDark( false, RoomID )--���}�·t
	end	
	ks_resetObj( Global["Boss"], 5 );
end

function Lua_Zone21_Boss1_InDark()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local LightColor = Lua_Zone21_Boss1_SetLightColor() or 0x00000000;
	if KS_InCombat( Global["Boss"] ) ~= true then
		LockHP( Global["Boss"], 0, "" )
		KillID( Global["Boss"], Global["Boss"] )
		return
	end

	Global["Show"] = 0;
	Global["Interval"] = 0;
	Global["AddNum"] = 0;
	Global["DarkTime"] = 0;
	Global["Phase"] = Global["Phase"]+1
	ScriptMessage( Global["Boss"], -1 , 2 , "[SC_ZONE21_BOSS1_HIDE]", 2 );

	ResetRoomValue( RoomID );--���]��������
	SetRoomValue( RoomID , 2 , LightColor );--�]�w����������X
	
	magicinterrupt( Global["Boss"] );
	DebugMsg(0,0,"SetHide");
	SetModeEx( Global["Boss"] , EM_SetModeType_Mark, false )--�L�аO
	SetModeEx( Global["Boss"] , EM_SetModeType_Show, false );--�ݤ���
	SetModeEx( Global["Boss"] , EM_SetModeType_Move, false );--�ݤ���
	SetModeEx( Global["Boss"] , EM_SetModeType_Fight, false );--�L�k���

	Sleep(10)
	StopMove( Global["Boss"], false );
	local FlagID = Zone21_Boss1_Global["FlagID"];
	local X = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local Y = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Y );
	local Z = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );
	AddBuff( Global["Boss"], 507899, 0, -1 );--�L�k����
	CallPlot( Global["Boss"], "ks_TransTo", X, Y, Z, 0, 0 )--�ǰe��S�w��m( Rnd = �H���Z�� min=�̤p�Z�� )
	
	for i=1, table.getn(Global["Candlestick"]) do
		if CheckBuff( Global["Candlestick"][i], 620325 ) == true then
			SysCastSpellLv( Global["Boss"], Global["Candlestick"][i], 497868,0 )--�M����x��
			sleep(5);
		end
	end
	Global["FireCheck"] = false;
	LockHP( Global["Boss"], ReadRoleValue( Global["Boss"], EM_RoleValue_MaxHP )*0.2*(5-Global["Phase"]), "Lua_Zone21_Boss1_InDark" );--��������
end

function Lua_Zone21_Boss1_TimeCheck( Boss )--�p�ɾ�
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local level = ReadRoleValue( Boss, EM_RoleValue_PID )
	local Time = 0;
	local CheckTime = 30
	local CrazyTime = { 480, 360 }
	
	while true do
		sleep(10)
		if KS_InCombat(Boss) == true then
			Time = Time+1;
			if level < 3 and time >= CrazyTime[level] and CheckBuff( Boss, 620276 ) ~= true then--8�����g��
				ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS1_CRAZY]", 2 )
				AddBuff( Boss, 620276, 0, -1 )
			end
			
			if Global["Show"] == 1 then
				if Global["Interval"] > 60 then--�������j
					CheckTime = 30
					magicinterrupt(Boss);
					Lua_Zone21_Boss1_InDark();
				else
					Global["Interval"] = Global["Interval"] +1;
				end
			elseif Global["AddNum"] < 12 then
				Global["DarkTime"] = Global["DarkTime"]+1;
				if Global["DarkTime"] >= CheckTime then
					CheckTime = CheckTime+10
					Global["AddNum"] = Global["AddNum"] + 2
				end
			end
		else
			return;
		end
		--DebugMsg(0,0,"Interval = "..Global["Interval"] )
	end
end


function Lua_Zone21_Boss1_ExitDark( ShowMsg, RoomID )--���}�·t
	RoomID = RoomID or ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	Global["Show"] = 1;
	if ShowMsg == true then
		ScriptMessage( Global["Boss"], -1 , 2 , "[SC_ZONE21_BOSS1_SHOW]", 2 );
	end
	
	DebugMsg(0,0,"SetShow");
	SetModeEx( Global["Boss"] , EM_SetModeType_Mark, true )--���аO
	SetModeEx( Global["Boss"] , EM_SetModeType_Show, true );--�i��
	SetModeEx( Global["Boss"] , EM_SetModeType_Fight, true );--�i���	
	SetModeEx( Global["Boss"] , EM_SetModeType_Move, true );--�ݤ���
	CancelBuff( Global["Boss"], 507899 );--�L�k����
	
	local FlagID = Zone21_Boss1_Global["FlagID"];
	local X = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local Y = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Y );
	local Z = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );	
	CallPlot( Global["Boss"], "ks_TransTo", X, Y, Z, 50, 0 )
	ClsRoomValue( RoomID , 2 )--���������w�]��
end

function Lua_Zone21_Boss1_SpellSkill( ID )--�I��ޯ�
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local SkillID = Zone21_Boss1_Global["SkillID"]
	local Lv = Zone21_Boss1_Global["Lv"];--�ޯ�I�񵥯�
	local Num = Zone21_Boss1_Global["SkillTarget"][ID][2-Global["Show"]];
	local HatePlayer = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
	local TID;
	local times = 0
	
	if ID ~= 6 then
		ScriptMessage( Global["Door"][1], -1 , 2 , "[SC_ZONE21_BOSS1_SKILL_0"..ID.."]", 2 )--�T��
	end
	if Global["Show"] == 0 then
		Num = Num+Global["AddNum"]
	end
	--DebugMsg(0,0, "ID = "..ID.."; Attack Num = "..Num.."; HateNum = "..table.getn(HatePlayer) )
	
	for i=1, Num do
		if Global["Show"] == 0 and i == 1 then
			local Firer = {}--���������
			for j=1, table.getn(HatePlayer) do
				if CheckBuff( HatePlayer[j], 620332 ) == true then
					table.insert( Firer, HatePlayer[j] )
				end
			end

			if table.getn(Firer) > 0 then
				local Rnd = rand( table.getn(Firer) )+1;
				TID = Firer[Rnd];--�����̧�
				for k=1, table.getn(HatePlayer) do
					if HatePlayer[k] ==  TID then
						table.remove( HatePlayer, k );
						break;
					end
				end
			end
		end
		if Num > 1 and TID == nil then
			if table.getn(HatePlayer) > 0 then
				local Rnd = rand( table.getn(HatePlayer) )+1;
				TID = HatePlayer[Rnd];
				table.remove( HatePlayer, Rnd );
			end
		end
		
		TID = TID or ReadRoleValue( Global["Boss"], EM_RoleValue_AttackTargetID );--��e�ؼ�
		if Global["Show"] == 0 and Global["Boss"] == Boss then--�гy���H
			Boss = kg_GetPosRX( TID, Zone21_Boss1_Global["FakeBoss"], 50, 0, math.random(90,270), 0, nil );--�̲רM�w��
			MoveToFlagEnabled( Boss, false );
			SetModeEx( Boss , EM_SetModeType_Fight, false )--�L�k���
			SetModeEx( Boss , EM_SetModeType_Mark, false )--�L�аO
			SetModeEx( Boss , EM_SetModeType_ShowRoleHead, false )--�L�Y��
			SetModeEx( Boss , EM_SetModeType_HideName, true )--�L�W��
			SetModeEx( Boss , EM_SetModeType_NotShowHPMP, true )--�L��
			SetDefIdleMotion( Boss, ruFUSION_MIME_ATTACK_BOW_LOOP )
			AddToPartition( Boss, RoomID );
			AdjustFaceDir( Boss, TID, 0 )
			Sleep(5)
		end
		
		if ID == 2 then
			local Bx = ReadRoleValue( Boss, EM_RoleValue_X )
			local By = ReadRoleValue( Boss, EM_RoleValue_Y )
			local Bz = ReadRoleValue( Boss, EM_RoleValue_Z )
			local Tx = ReadRoleValue( TID, EM_RoleValue_X )
			local Tz = ReadRoleValue( TID, EM_RoleValue_Z )
			local radian = (math.pi/180)*CalDir( (Tx-Bx), (Tz-Bz) )--�|��
			local Final = CreateObj( 114264, Bx  +(250*math.cos(radian)), By, Bz - (250*math.sin(radian)), 0, 1 )--114264
			AddToPartition( Final, RoomID )
			WriteRoleValue( Final, EM_RoleValue_LiveTime, 1 )
			if Global["Show"] == 0 then--�·t��
				SysCastSpellLv( Boss, Final, SkillID[ID], Lv[ID] );--�I��ޯ�
			else
				CastSpellLv( Boss, Final, SkillID[ID], Lv[ID] );--�I��ޯ�
			end
		else
			if Global["Show"] == 0 or ( ID == 3 and i ~= 1 ) then--�·t��
				SysCastSpellLv( Boss, TID, SkillID[ID], Lv[ID] );--�I��ޯ�
			elseif ( ID == 3 and i == 1 ) or ID ~= 3 then
				CastSpellLv( Boss, TID, SkillID[ID], Lv[ID] );--�I��ޯ�
			end
		end
		TID = nil;
		if table.getn(HatePlayer ) == 0 then
			break
		elseif ID == 2 or ID == 3 then
			Sleep(2)
			times = times+1
		end
	end
	if Global["Boss"] ~= Boss then
		WriteRoleValue( Boss, EM_RoleValue_LiveTime, 1 )
	end
	Sleep(5)
	return math.floor(times*0.2)
end

function Lua_Zone21_Boss1_SpecialSkill()--�d�нb
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local SkillID = Zone21_Boss1_Global["SkillID"]
	local Lv = Zone21_Boss1_Global["Lv"];--�ޯ�I�񵥯�
	local Num = Zone21_Boss1_Global["SkillTarget"][4][1]
	local HatePlayer = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
	local TID = {}
	
	for i=1, Num do
		if table.getn(HatePlayer) < 1 then break end
		
		local Rnd = rand( table.getn(HatePlayer) )+1;
		--DebugMsg(0,0,"Rnd ="..Rnd.."; HateNum = "..table.getn(HatePlayer) )
		if CheckID( HatePlayer[Rnd] ) ==true and 
		ReadRoleValue( HatePlayer[Rnd], EM_RoleValue_IsDead ) == 0 then--�H���ؼ�
			table.insert( TID, HatePlayer[Rnd] );
		end
		table.remove( HatePlayer, Rnd );
	end
	
	if table.getn(TID) > 0 then
		ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS1_SKILL_04]", 2 )--�T��
	else
		return 0
	end
	
	SetModeEx( Boss, EM_SetModeType_DisableRotate , true );
	for i=1, table.getn(TID) do
		TID[i] = LuaFunc_CreateObjByObj( 118858, TID[i] );
		WriteRoleValue( TID[i], EM_RoleValue_LiveTime, 4 );
		AdjustFaceDir( Boss, TID[i], 0 )
		if i > 1 then
			CallPlot( Boss, "Lua_Zone21_Boss1_SpecialSkillLoop", Boss, TID[i], SkillID[4], Lv[4] )
			--SysCastSpellLv( Boss, TID[i], SkillID[4], Lv[4] )
		else
			CastSpellLv( Boss, TID[i], SkillID[4], Lv[4] )
		end
	end
	SetModeEx( Boss, EM_SetModeType_DisableRotate , false );
	return 4
end

function Lua_Zone21_Boss1_SpecialSkillLoop( Boss, TID, SkillID, Lv )--�d�нb
	for i=1, 4 do
		SysCastSpellLv( Boss, TID, SkillID, Lv )
		Sleep(10)
	end
end

function Lua_Zone21_Boss1_Dead()--���`
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS1_DEAD]", 2 );
	
	if Zone21_Boss1_Global[RoomID]["Show"] == 0 then
		Lua_Zone21_Boss1_ExitDark( false, RoomID )--���}�·t
	end
	
	Lua_Zone21_Boss1_ClearItem( RoomID )--�M�����a���~
	
	for i=1, 2 do
		CallPlot( Zone21_Boss1_Global[RoomID]["Door"][i], "Lua_Zone21_CloseDoor", false, Boss )--����
		--DelFromPartition( Zone21_Boss1_Global[RoomID]["Door"][i] );
	end	
	Zone21_Boss1_Global[RoomID] = {};
	return true;
end

function Lua_Zone21_Boss1_BombShotCheck()
	if ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 3 then
		return false;
	end
	return true;
end

--==============�S�������==============--

function Lua_Zone21_Boss1_CreateObj()--���ͪ���
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local FlagID = Zone21_Boss1_Global["FlagID"];

	if Global["Candlestick"] == nil then
		Global["Candlestick"] = {};
		Global["barrels"] = {};
		Global["Torch"] = {};
		Global["Door"] = {};
	end
	
	for i=1, 4 do
		if Global["Candlestick"][i] == nil or CheckID(Global["Candlestick"][i]) ~= true then
			Global["Candlestick"][i] = kg_GetPosRX( { FlagID, i}, 118787 );--��x
			SetPlot( Global["Candlestick"][i], "touch" , "Lua_Zone21_Boss1_CTouch1" , 30 )--Ĳ�I�@��
			AddToPartition( Global["Candlestick"][i], RoomID )
		end
		AddBuff( Global["Candlestick"][i], 620325, 0, -1 )--�I��
		if Global["barrels"][i] == nil or CheckID(Global["barrels"][i]) ~= true then
			local Ox = ReadRoleValue( Global["Candlestick"][i], EM_RoleValue_X );			
			local Oz = ReadRoleValue( Global["Candlestick"][i], EM_RoleValue_Z );
			local Tx = ReadRoleValue( Global["Boss"], EM_RoleValue_X );
			local Y = ReadRoleValue( Global["Boss"], EM_RoleValue_Y );
			local Tz = ReadRoleValue( Global["Boss"], EM_RoleValue_Z );
			local radian = (math.pi/180)*CalDir( Tx-Ox, Tz-Oz );--�|��
			Ox = Ox  +(25*math.cos(radian))
			Oz = Oz - (25*math.sin(radian))
			--Global["barrels"][i] = KS_CreateObjMode( 118788, Global["Candlestick"][i], nil,  15, 1, false, 20 );--�o��
			Global["barrels"][i] = CreateObj( 118788, Ox, y, Oz, 0, 1 );--�o��
			SetPlot( Global["barrels"][i], "touch" , "Lua_Zone21_Boss1_barrelsTouch1", 30 )--Ĳ�I�@��
			AddToPartition( Global["barrels"][i], RoomID )
		end
	end

	for i=1, 2 do
		if	Global["Door"][i] == nil or 
			CheckID(Global["Door"][i]) ~= true or 
			ReadRoleValue( Global["Door"][i], EM_RoleValue_OrgID ) ~= 106012 then
			Global["Door"][i] = kg_GetPosRX( { FlagID, i+4}, 106012 );		--���ת�
			SetModeEx( Global["Door"][i], EM_SetModeType_Fight, false );		--�L�k���
			SetModeEx( Global["Door"][i], EM_SetModeType_Searchenemy, false );	-- ����
			SetModeEx( Global["Door"][i] , EM_SetModeType_Strikback , false );	-- ����
			SetModeEx( Global["Door"][i] , EM_SetModeType_Mark , false )		-- �аO
			SetModeEx( Global["Door"][i], EM_SetModeType_Obstruct , true )	-- ����
			AddToPartition( Global["Door"][i], RoomID );--�w�]����}��
			SetRoleCamp( Global["Door"][i], "Visitor" )			
		end
	end

	
	if Global["Stone"] == nil or CheckID(Global["Stone"]) ~= true then
		Global["Stone"] = kg_GetPosRX( { FlagID, 7 }, 118697 );--���o������
		SetPlot( Global["Stone"], "touch" , "Lua_Zone21_Boss1_StoneTouch1" , 30 );--Ĳ�I�@��
	end
	AddToPartition( Global["Stone"], RoomID );

	for i=1, 4 do
		if Global["Torch"][i] == nil or CheckID(Global["Torch"][i]) ~= true then
			Global["Torch"][i] = kg_GetPosRX( { FlagID, i+7 }, 118880 );--���o����
			SetPlot( Global["Torch"][i], "touch" , "Lua_Zone21_Boss1_GetTorch1" , 30 )--Ĳ�I�@��			
		end
		AddToPartition( Global["Torch"][i], RoomID );
	end
end

function Lua_Zone21_Boss1_CandlestickFireCheck()--�ˬd�Ҧ���x�O�_�I�U
	local ErrorTime = Zone21_Boss1_Global["FireTime"] or 5;
	Sleep(ErrorTime*10)	
	local Global = Zone21_Boss1_Global[ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )];
	if Global["Show"] == 0 then
		Global["FireCheck"] = false;
		for i=1, table.getn(Global["Candlestick"]) do
			if CheckBuff( Global["Candlestick"][i], 620325 ) == true then
				SysCastSpellLv( Global["Boss"], Global["Candlestick"][i], 497868, 0 )--�M����x��
				sleep(5);
			end
		end
	end
end

function Lua_Zone21_Boss1_CandlestickFireCancel()--�M����x��
	CancelBuff( TargetID(), 620325 );
end

function Lua_Zone21_Boss1_Flint()--�����ۮĪG
	local TID = TargetID();
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID]
	if Global == nil then
		return false
	end
		
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 118788 then--�U�o��
		ScriptMessage( TID, -1 , 2 , "[SC_ZONE21_BOSS1_BOMB]", 2 )--�T��
		SysCastSpellLv( TID, TID, 498003, 0 )--�U�o���z��
		WriteRoleValue( TID, EM_RoleValue_LiveTime, 1 );
	elseif CountBodyItem( TID, 240095 ) > 0 and CheckBuff( TID, 620275 ) == true then--������P�U�o����
		DelBodyItem( TID, 240095, 1 )--�R������
		CancelBuff( TID, 620275 )--�M���U�o���A
		AddBuff( TID, 620324, Zone21_Boss1_Global["Lv"][7], -1 )--����N��
		AddBuff( TID, 620332, 0, -1 )--�I�U����ɶ��ˬd
		GiveBodyItem( TID, 240285, 1 )--�I�U������
	end
end

function Lua_Zone21_Boss1_CTouch1()--��x�I��
	local OID = OwnerID() 	-- ���a
	local TID = TargetID()  	-- ����
	
	if CheckBuff( TID, 620325 ) ~= true then--��x����
		local item = 240285;
		if CountBodyItem( OID, item ) > 0 then --���I�U������
			if BeginCastBarEvent( OID, TID,"[SC_USING]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_Zone21_Boss1_CTouch2" ) ~= 1 then 
				ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
				return
			end
		else		
			ScriptMessage( OID, OID, 1 , "[NO_ITEM][$SETVAR1=["..item.."]]" , 0 )--�A�S��[�I�U������]
			ScriptMessage( OID, OID, 0 , "[NO_ITEM][$SETVAR1=["..item.."]]" , 0 )--�A�S��[�I�U������]
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_ZONE21_BOSS1_NONEED_TOUCH]", 0 )--�ثe���ݨϥοU�N������
		ScriptMessage( OID, OID, 0,"[SC_ZONE21_BOSS1_NONEED_TOUCH]", 0 )--�ثe���ݨϥοU�N������
	end
end

function Lua_Zone21_Boss1_CTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- ���\
			local TID = TargetID();--���
			ScriptMessage( OID, -1 , 2 , "[SC_ZONE21_BOSS1_LIGHT]", 2 )--�T��
			CancelBuff( OID, 620332 );--�I�U�����ˬd
			AddBuff( TID, 620325, 0, -1 )--�I��
			local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID );
			if Zone21_Boss1_Global[RoomID]["Show"] == 0 then--�·t��
				local Global = Zone21_Boss1_Global[RoomID];
				for i=1, table.getn(Global["Candlestick"]) do
					if CheckBuff( Global["Candlestick"][i], 620325 ) ~= true and Global["Candlestick"][i] ~= TID then
						if Global["FireCheck"] == false then
							Global["FireCheck"] = true;
							BeginPlot( Global["Ctrl"], "Lua_Zone21_Boss1_CandlestickFireCheck", 0 )--�ˬd�Ҧ���x�O�_�I�U
						end
						EndCastBar( OID, CheckStatus );
						return;
					end
				end
				Lua_Zone21_Boss1_ExitDark( true, RoomID )--Boss���}�·t
			end
		end
		EndCastBar( OID, CheckStatus );
	end
end


function Lua_Zone21_Boss1_barrelsTouch1()
	local OID = OwnerID() 	-- ���a
	local TID = TargetID()  	-- ����
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
	local Boss = Zone21_Boss1_Global[RoomID]["Boss"]
	
	if Boss == nil or CheckID(Boss) ~= true or ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 then
		ScriptMessage( OID, OID, 1,"[SC_204638_0]", 0 )--���ݨϥ�
		ScriptMessage( OID, OID, 0,"[SC_204638_0]", 0 )--���ݨϥ�
		return
	end
	
	if CheckBuff( OID, 620275 ) == true then--��g���o
		ScriptMessage( OID, OID, 1,"[SC_ZONE21_BOSS1_NONEED_BARREL]", 0 )--�A�w�g�g���U�o
		ScriptMessage( OID, OID, 0,"[SC_ZONE21_BOSS1_NONEED_BARREL]", 0 )--�A�w�g�g���U�o
		return
	end
	
	if CheckBuff( OID, 620324 ) == true then--����U�N
		ScriptMessage( OID, OID, 1,"[SC_ZONE21_BOSS1_CANT_BARREL]", 0 )--�A�{�b�L�k�ϥοU�o��
		ScriptMessage( OID, OID, 0,"[SC_ZONE21_BOSS1_CANT_BARREL]", 0 )--�A�{�b�L�k�ϥοU�o��
		return		
	end
	
	if BeginCastBarEvent( OID, TID,"[SC_USING]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_Zone21_Boss1_barrelsTouch2" ) ~= 1 then 
		ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
		return
	end
end

function Lua_Zone21_Boss1_barrelsTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- ���\
			AddBuff( OID, 620275, 0, -1 )--��g�o
		end
		EndCastBar( OID, CheckStatus );
	end
end

function Lua_Zone21_Boss1_StoneTouch1()--���o������
	local OID = OwnerID() 	-- ���a
	local TID = TargetID()  	-- ����
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
	local Boss = Zone21_Boss1_Global[RoomID]["Boss"]
	
	if Boss ~= nil and CheckID(Boss) == true and ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 then
		if BeginCastBarEvent( OID, TID,"[SC_USING]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_Zone21_Boss1_StoneTouch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_204638_0]", 0 )--���ݨϥ�
		ScriptMessage( OID, OID, 0,"[SC_204638_0]", 0 )--���ݨϥ�
	end
end

function Lua_Zone21_Boss1_StoneTouch2( OID, CheckStatus )
	local TID = TargetID();
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- ���\
			GiveBodyItem( OID, 240284, 6 )--������
			DelFromPartition( TID );
		end
		EndCastBar( OID, CheckStatus );
	end
end

function Lua_Zone21_Boss1_GetTorch1()--���o����
	local OID = OwnerID() 	-- ���a
	local TID = TargetID()  	-- ����
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
	local Boss = Zone21_Boss1_Global[RoomID]["Boss"]
	
	if Boss ~= nil and CheckID(Boss) == true and ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 and 
	CountBodyItem( OID, 240095 ) == 0 and CountBodyItem( OID, 240285 ) == 0 then --�S������
		
		if BeginCastBarEvent( OID, TID,"[SC_USING]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_Zone21_Boss1_GetTorch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_204638_0]", 0 )--���ݨϥ�
		ScriptMessage( OID, OID, 0,"[SC_204638_0]", 0 )--���ݨϥ�
	end
end

function Lua_Zone21_Boss1_GetTorch2( OID, CheckStatus )
	local TID = TargetID();
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- ���\
			GiveBodyItem( OID, 240095, 1 )--����
			local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
			local Boss = Zone21_Boss1_Global[RoomID]["Boss"]
			if ReadRoleValue( Boss, EM_RoleValue_PID ) == 1 then
				DelFromPartition( TID );
			end
		end
		EndCastBar( OID, CheckStatus );
	end
end

function Lua_Zone21_Boss1_ClearTorch()--�M���U�N������
	local OID = OwnerID()
	DebugMsg(0,0,"ClearTorch")
	DelBodyItem( OID, 240285, CountBodyItem( OID, 240285 ) );--�R���I�U������
	GiveBodyItem( OID, 240095, 1 )--���P����
end