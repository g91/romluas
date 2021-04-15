--==============�����]�w�ܼ�==============--

function Lua_Zone21_Boss2_GlobalSet()--�����ܼƳ]�w
	Zone21_Boss2_Global = {}
	local Global = Zone21_Boss2_Global
	Global["FlagID"] = 780984;--���󲣥ͺX��
	
	Global["SkillID"] = {}--�k�N���X
	Global["SkillID"][1] = 498005--�j�a�_��
	Global["SkillID"][2] = 498006--�}�a
	Global["SkillID"][3] = 498012--����
	Global["SkillID"][4] = 498007--���۱Y��
	Global["SkillID"][5] = 498008--�s�H����
	Global["SkillID"][6] = 498010--�L�����z
	
	Lua_Zone21_Boss2_GlobalLevel()--���׳]�w
end

function Lua_Zone21_Boss2_GlobalLevel( )--���׳]�w
	local level = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	local Global = Zone21_Boss2_Global
	
	if level == 1 then  --============ �x�� ============--
		Global["BossID"] = 105517--��
		Global["MstID"] = 105516--�p��
		Global["StoneNum"] = 12--�p���ۼƶq
		Global["MstCreateNum"] = 3--�p�ǨC�����ͼƶq
		
		Global["Lv"] = {}--�ޯ�I�񵥯�
		Global["Lv"][1] = 19--�j�a�_��--24000
		Global["Lv"][2] = 14--�}�a--18750
		Global["Lv"][3] = 10--����--8550
		Global["Lv"][4] = 11--���۱Y��--120%
		Global["Lv"][5] = 1--�s�H����--20%
		Global["Lv"][6] = 14--�L�����z--150%
		
	elseif level == 2 then  --============ ���q ============--
		Global["BossID"] = 106052--��
		Global["MstID"] = 106053--�p��
		Global["StoneNum"] = 12--�p���ۼƶq
		Global["MstCreateNum"] = 2--�p�ǨC�����ͼƶq
		
		Global["Lv"] = {}--�ޯ�I�񵥯�
		Global["Lv"][1] = 14--�j�a�_��--18000
		Global["Lv"][2] = 11--�}�a--15000
		Global["Lv"][3] = 10--����--8550
		Global["Lv"][4] = 11--���۱Y��--120%
		Global["Lv"][5] = 1--�s�H����--20%
		Global["Lv"][6] = 14--�L�����z--150%
		
	else--============ ²�� ============--
		Global["BossID"] = 106054--��
		Global["MstID"] = 106055--�p��
		Global["StoneNum"] = 10--�p���ۼƶq
		Global["MstCreateNum"] = 2--�p�ǨC�����ͼƶq
		
		Global["Lv"] = {}--�ޯ�I�񵥯�
		Global["Lv"][1] = 5--�j�a�_��--7200
		Global["Lv"][2] = 3--�}�a--5000
		Global["Lv"][3] = 6--����--6650
		Global["Lv"][4] = 8--���۱Y��--90%
		Global["Lv"][5] = 1--�s�H����--20%
		Global["Lv"][6] = 8--�L�����z--90%
	end
end

--==============�H�UAI�B�z �O�復==============--

function Lua_Zone21_Boss2_Fight()--�}�l�԰�
	CallPlot( OwnerID(), "Lua_Zone21_Boss2_AI" )
end

function Lua_Zone21_Boss2_Ctrl()--����
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	
	if Zone21_Boss2_Global == nil then
		Lua_Zone21_Boss2_GlobalSet();
	else
		Lua_Zone21_Boss2_GlobalSet();
	end
	
	if Zone21_Boss2_Global[RoomID] == nil then
		Zone21_Boss2_Global[RoomID] = {}
	else 
		Zone21_Boss2_Global[RoomID] = {}
	end
	
	local Global = Zone21_Boss2_Global[RoomID];
	local FlagID = Zone21_Boss2_Global["FlagID"];
	Global["Ctrl"] = OwnerID();
	local PID = ReadRoleValue( Global["Ctrl"], EM_RoleValue_PID )		
	Global["Phase"] = 1;
	
	if	Global["Boss"] == nil or 
		CheckID( Global["Boss"] ) ~= true or
		ReadRoleValue( Global["Boss"], EM_RoleValue_OrgID ) ~= Zone21_Boss2_Global["BossID"] then
		
		Global["Boss"] = kg_GetPosRX( {FlagID, 0}, Zone21_Boss2_Global["BossID"] );
		WriteRoleValue( Global["Boss"], EM_RoleValue_PID, PID )
		AddToPartition( Global["Boss"], RoomID );
	else
		ks_resetObj( Global["Boss"], 0 );
	end
	
	SetPlot( Global["Boss"], "dead", "Lua_Zone21_Boss2_Dead", 0 );--���`�P�_
	
	if Global["Door"] == nil then
		Global["Door"] = {};
	end

	local DoorID = 106012;
	if PID == 1 then
		DoorID = 105811
	end
	for i=1, 2 do
		if Global["Door"][i] == nil or CheckID(Global["Door"][i]) ~= true or 
		ReadRoleValue( Global["Door"][i], EM_RoleValue_OrgID ) ~= DoorID then	
			Global["Door"][i] = kg_GetPosRX( {FlagID, i}, DoorID );		--���ת�
			SetModeEx( Global["Door"][i], EM_SetModeType_Fight, false );		--�L�k���
			SetModeEx( Global["Door"][i], EM_SetModeType_Searchenemy, false );	-- ����
			SetModeEx( Global["Door"][i] , EM_SetModeType_Strikback , false );	-- ����
			SetModeEx( Global["Door"][i] , EM_SetModeType_Mark , false )		-- �аO
			SetModeEx( Global["Door"][i], EM_SetModeType_Obstruct , true )	-- ����
			SetRoleCamp( Global["Door"][i], "Visitor" )
			AddToPartition( Global["Door"][i], RoomID );--�w�]����}��
		end
	end
	SetDefIdleMotion( Global["Door"][1], ruFUSION_MIME_ACTIVATE_LOOP )--�O���}��
	SetDefIdleMotion( Global["Door"][2], ruFUSION_MIME_IDLE_STAND )--�O������
end

function Lua_Zone21_Boss2_Crazy()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local FlagID = Zone21_Boss2_Global["FlagID"];
	local level = ReadRoleValue( Boss, EM_RoleValue_PID )
	local FlagX = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local FlagZ = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );
	local time = 0
	local X;
	local Z;
	local Dis;
	local CrazyTime = { 480, 360 }
	
	while true do
		Sleep(10)
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - FlagX )^2 +( Z - FlagZ )^2 )^0.5);
		
		if KS_InCombat( Boss ) ~= true or Dis > 500 then
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_EXIT]", 2 );--�����԰�
			ks_TransTo( FlagID, 0, nil, 0, 0 )--�ǰe��S�w��m( Rnd = �H���Z�� min=�̤p�Z�� )
			Lua_Zone21_Boss2_Reset();--���m
			return
		end
		
		if level < 3 and time >= CrazyTime[level] and CheckBuff( Boss, 620276 ) ~= true then--8/6�����g��
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_CRAZY]", 2 )
			AddBuff( Boss, 620276, 0, -1 )
		end
		time = time+1
	end
end

function Lua_Zone21_Boss2_AI()--Boss �԰�AI
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local SkillID = Zone21_Boss2_Global["SkillID"]
	local Lv = Zone21_Boss2_Global["Lv"];
	local time = 0;
	local ID = 0;
	local TID = 0;
	local SpellMagicID = 0;
	Global["Phase"] = 1;
	Global["SetLockHP"] = 9
	Global["PhaseTime"] = 0;
	
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_START]", 2 );--�}�l
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", true, Boss )--����
	AddBuff( Boss, 502707, 0, -1 );--�D�԰����^��
	LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.9 , "Lua_Zone21_Boss2_ChangePhase" );--���q����
	
	CallPlot( Boss, "Lua_Zone21_Boss2_PhaseDo", 0 )
	CallPlot( Boss, "Lua_Zone21_Boss2_Crazy", 0 )
	while true do
		sleep(10)
		
		time = time+1;--�ɶ����W
		--DebugMsg(0,0,"Battle Time = "..time.."; Phase = "..Global["Phase"].."; PhaseTime = "..Global["PhaseTime"] );
		SpellMagicID = ReadRoleValue( Boss, EM_RoleValue_SpellMagicID );
		if SpellMagicID == 0 then
			if time%7 == 0 then
				ID = rand(2)+1;
			elseif time%4 == 0 then
				ID = 3;
				local Hate = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
				
				while table.getn(Hate) > 0 do
					local Rnd = rand( table.getn(Hate) )+1;
					if CheckID( Hate[Rnd] ) ==true and ReadRoleValue( Hate[Rnd], EM_RoleValue_IsDead ) == 0 then--�H���ؼ�
						TID = Hate[Rnd];
						table.remove( Hate, Rnd );
						break
					end
					table.remove( Hate, Rnd );
				end
			end
			if ID ~= 0 and GetModeEx( Boss, EM_SetModeType_Move ) then
				TID = TID or ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );
				StopMove( Boss, false );
				ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_SKILL_0"..ID.."]", 2 )--�T��
				CastSpellLv( Boss, TID, SkillID[ID], Lv[ID] );--�I��ޯ�
				ID = 0;
				TID = nil;
				Sleep(10)
			end
		end
	end
end

function Lua_Zone21_Boss2_ChangePhase()--���q����
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	Global["SetLockHP"] = Global["SetLockHP"]-1
	
	if Global["SetLockHP"] == 1 then
		Global["Phase"] = 3;
		LockHP( Boss, 0, "" );
	else
		Global["Phase"] = 3 - Global["Phase"];
		LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.1*Global["SetLockHP"], "Lua_Zone21_Boss2_ChangePhase" );
	end
	if Global["SetLockHP"]%2 == 1 then
		Global["ChangePhase"] = true
	end
	
	Global["PhaseTime"] = 0;
	
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_PHASE"..Global["Phase"].."]", 2 );--�������q	
end

function Lua_Zone21_Boss2_PhaseDo()--�ĤG���q
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local CreateNum = 0
	local PhaseLoop = false
	local MstArray = {}
	
	CallPlot( Global["Boss"], "Lua_Zone21_Boss2_SetLock", 14 )
	sleep(10)
	while true do
			sleep(10)
			if Global["Phase"] > 1 then
				--DebugMsg(0,0,"PhaseTime = "..Global["PhaseTime"] )
				if Global["ChangePhase"] or Global["PhaseTime"]%30 == 0 then--���p��
					Global["MstNum"] = Global["MstNum"] or 0;
					if Global["MstNum"] < 15 then
						local ObjNum = 15-Global["MstNum"];
						if ObjNum > Zone21_Boss2_Global["MstCreateNum"] then 
							ObjNum = Zone21_Boss2_Global["MstCreateNum"];
						end
						if ObjNum > 0 then
							for Key,GUID in pairs(MstArray) do
								if CheckID(GUID) == true and ReadRoleValue(GUID, EM_RoleValue_IsDead ) == 0 then
									AddBuff( GUID, 620423, 0, -1 )--�p�Ǳj��
								else
									table.remove( MstArray, key )
								end
							end
							
							Global["MstNum"] = Global["MstNum"]+ObjNum;
							DebugMsg(0,0,"MstNum = "..Global["MstNum"] )
							local Mst = KS_CreateObjMode( Zone21_Boss2_Global["MstID"], Global["Boss"], nil,  100, ObjNum, false, 80 )
							if Type( Mst ) == "number" then
								LockHP( Mst, ReadRoleValue( Mst, EM_RoleValue_MaxHP )*0.1 , "Lua_Zone21_Boss2_MstSetLock" )
								SetPlot( Mst, "dead", "Lua_Zone21_Boss2_MstDead", 0 )
								AddToPartition( Mst, RoomID );
								AddBuff( Mst, 620418, 0, -1 );--���ۨ��@
								AddBuff( Mst, 502707, 0, -1 );--�D�԰����^��
								BeginPlot( Mst, "Lua_Zone21_Boss2_MstCheck", 0 );--�԰��ˬd
								table.insert( MstArray, Mst )
							else
								for i=1, table.getn(Mst) do
									LockHP( Mst[i], ReadRoleValue( Mst[i], EM_RoleValue_MaxHP )*0.1 , "Lua_Zone21_Boss2_MstSetLock" )
									SetPlot( Mst[i], "dead", "Lua_Zone21_Boss2_MstDead", 0 )
									AddToPartition( Mst[i], RoomID );
									AddBuff( Mst[i], 620418, 0, -1 );--���ۨ��@
									AddBuff( Mst[i], 502707, 0, -1 );--�D�԰����^��
									BeginPlot( Mst[i], "Lua_Zone21_Boss2_MstCheck", 0 );--�԰��ˬd
									table.insert( MstArray, Mst[i] )
								end
							end						
						end
					end
					Global["ChangePhase"] = false
				end
				
				if Global["PhaseTime"]%3 == 0 then--�p����
					CallPlot( Global["Ctrl"], "Lua_Zone21_Boss2_CreateStone", 2 )--���͸���
				end
			end
		
			if Global["Phase"] ~= 2 and Global["PhaseTime"]%25 == 0 then--�j����				
				while ReadRoleValue( Global["Boss"], EM_RoleValue_SpellMagicID ) ~= 0 do
					sleep(5)
				end				
				StopMove( Global["Boss"], false );				
				if PhaseLoop == true then
					CallPlot( Global["Boss"], "Lua_Zone21_Boss2_SetLock", 11 )
				else
					PhaseLoop = true
				end
				
				Lua_Zone21_Boss2_CreateStone( 1 )--���͸���			
				CallPlot( Global["Boss"], "Lua_Zone21_Boss2_BoomMsg", Global["Boss"] )--�r��
				Sleep(15)
				CastSpellLv( Global["Boss"], Global["Boss"], 498010,  Zone21_Boss2_Global["Lv"][6] );--����AE
			end
			Global["PhaseTime"] = Global["PhaseTime"]+1;
	end
end

function Lua_Zone21_Boss2_BoomMsg( Boss )
	Sleep(50)
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_BOOMS]", 2 );--����AE	
end

function Lua_Zone21_Boss2_SetLock( time )
	time = time or 12
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local lockTime = math.floor(time/3)-1
	SetModeEx( Global["Boss"], EM_SetModeType_Move, false )
	sleep( lockTime*10 )
	SetModeEx( Global["Boss"], EM_SetModeType_Fight, false )
	Sleep( 50 )
	SetModeEx( Global["Boss"], EM_SetModeType_Fight, true )
	Sleep( (time-5-lockTime)*10 )
	SetModeEx( Global["Boss"], EM_SetModeType_Move, true )	
end

function Lua_Zone21_Boss2_Reset()--���m
	DebugMsg(0,0,"Zone21_Boss2_Reset")
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	
	--DelFromPartition( Global["Door"][1] );--�e������
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", false, Global["Boss"] )--����
	magicinterrupt( Global["Boss"] );
	if Global["Stone"] ~= nil then
		for i=1, table.getn(Global["Stone"]) do
			if Global["Stone"][i] ~= nil then
				DelObj(ReadRoleValue( Global["Stone"][i], EM_RoleValue_PID ))
				DelObj(Global["Stone"][i])
			end
		end
	end

	local BuffTable = {};
	for i = 1 , BuffCount(Global["Boss"] ) do
		table.insert( BuffTable, BuffInfo( Global["Boss"] , i-1, EM_BuffInfoType_BuffID) );
	end

	for i=1, table.getn(BuffTable) do
		CancelBuff( Global["Boss"]  , BuffTable[i] )
		DebugMsg( 0,0,"BuffID = "..BuffTable[i] )
	end	
	
	SetStopAttack( Global["Boss"] );
	ClearHateList( Global["Boss"], -1 );
	WriteRoleValue( Global["Boss"], EM_RoleValue_HP, ReadRoleValue( Global["Boss"], EM_RoleValue_MaxHP ) );--����
	ks_resetObj( Global["Boss"], 5 );
end

function Lua_Zone21_Boss2_Dead()--���`
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_DEAD]", 2 );
	for i=1, 2 do
		CallPlot( Zone21_Boss2_Global[RoomID]["Door"][i], "Lua_Zone21_CloseDoor", false, Boss )--����
		--DelFromPartition( Zone21_Boss2_Global[RoomID]["Door"][i] );
	end

	Zone21_Boss2_Global[RoomID] = {};
	return true;
end

function Lua_Zone21_Boss2_CreateStone( mode )--���͸���
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];	
	local ShadowID = { 118837, 118887 };--�j/�p
	local StoneID = { 105518, 105519 };--�j/�p
	local min = 30;
	local Num
	
	if mode == 1 then
		--PlayMotion( Global["Boss"], ruFUSION_ACTORSTATE_CAST_BEGIN )
		ScriptMessage( Global["Boss"], -1 , 2 , "[SC_ZONE21_BOSS2_EARTH]", 2 );--�_�a
		--CastSpellLv( Global["Boss"], Global["Boss"], 498011, 0 );--�_�a
		Global["Stone"] = {};
		Num = 8
	else
		Num = Zone21_Boss2_Global["StoneNum"];
	end
	
	local Shadow = ks_RandBornByMultilateral( ShadowID[mode], Global["Ctrl"], nil, Num , 230, 0, 0, 0, -1, false, true )--���w��m�üƲ���
	--ObjID = ����ID; var1+var2 = �X�Ц�m; only var1=�����m; Num = ���ͼƶq; 
	--radius = �b�|�d��; height = ���Ͱ���; min=�̤p�Z��; time=���Ͷ���; LiveTime = �s�b�ɶ�
	
	local Stone;
	for i=1, Num do
		if GetDistance( Shadow[i], Global["Boss"] ) > 50 or mode == 2 then
			Lua_Zone21_Boss2_ObjMode( Shadow[i] );--����]�w
			AddToPartition( Shadow[i], RoomID );
			local x = ReadRoleValue( Shadow[i], EM_RoleValue_X )
			local y = ReadRoleValue( Shadow[i], EM_RoleValue_Y )
			local z = ReadRoleValue( Shadow[i], EM_RoleValue_Z )
			
			Y = GetHeight( X, Y, Z )
			Stone = CreateObj( StoneID[mode], x, y+250, z, 0, 1 );
			Lua_Zone21_Boss2_ObjMode( Stone )--����]�w
			WriteRoleValue( Stone, EM_RoleValue_IsWalk, 0 );
			MoveToFlagEnabled( Stone, false )			
			AddToPartition( Stone, RoomID );
			CallPlot( Stone, "Lua_Zone21_Boss2_StoneDown", x,y,z, Shadow[i], mode )--���Y���U			
			if mode == 1 then
				Global["Stone"][i] = Stone;
			end
		else
			DelObj(Shadow[i])
		end
		Sleep(mode)
	end
	--PlayMotion( Global["Boss"], ruFUSION_ACTORSTATE_CAST_LOOP )
end

function Lua_Zone21_Boss2_StoneDown( x, y, z, Shadow, mode )--���Y���U
	local Stone = OwnerID();
	local Global = Zone21_Boss2_Global
	WriteRoleValue( Stone, EM_RoleValue_PID, Shadow )
	if mode == 1 then
		Sleep(10)
		Hide(Stone)
		SetModeEx( Stone, EM_SetModeType_Obstruct , true )		-- ����
		Show( Stone, ReadRoleValue( Shadow, EM_RoleValue_RoomID ) )
		MoveDirect( Stone, x, y, z )
		Sleep(14)
		WriteRoleValue( Shadow, EM_RoleValue_LiveTime, 1 );
		SysCastSpellLv( Stone, Shadow, 498007, Global["Lv"][4] )--�y���ˮ`
		WriteRoleValue( Stone, EM_RoleValue_LiveTime, 8 );
		Sleep(3)
		StopMove( Stone, true )
		SetPos( Stone, x, y, z, 0 )
		
	else
		Sleep(12)
		MoveDirect( Stone, x, y, z )
		sleep(7)
		WriteRoleValue( Shadow, EM_RoleValue_LiveTime, 1 );
		sleep(10)
		SysCastSpellLv( Stone, Shadow, 498008, Global["Lv"][5] )--�y���ˮ`
		WriteRoleValue( Stone, EM_RoleValue_LiveTime, 1 );
		sleep(3)
		PlayMotion( Stone, ruFUSION_ACTORSTATE_DEAD )
	end
end

function Lua_Zone21_Boss2_StoneCheck()--���Y��H�ˬd
	local TID = TargetID();
	local OID = OwnerID();
	local Global = Zone21_Boss2_Global[ReadRoleValue( OID, EM_RoleValue_RoomID )];
	
	if	TID == OID or 
		TID == Global["Boss"] or
		(ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( TID, EM_RoleValue_VOC ) == 0 ) or
		CheckBuff( TID, 620418 ) == true or --���ۨ��@
		ReadRoleValue( TID, EM_RoleValue_CampID ) == 6 then
		return false;
	elseif CheckBuff( TID, 620422 ) == true and ReadRoleValue( OID, EM_RoleValue_OrgID ) == 105519 then
		Global["MstNum"] = Global["MstNum"]-1;
		DebugMsg(0,0,"MstNum = "..Global["MstNum"] )
		DelObj(TID);
	end
	return true;
end

function Lua_Zone21_Boss2_StoneObstruct()--���Y����
	local OID = OwnerID();
	local TID = TargetID();
	local Num = 15;
	if ReadRoleValue( OID, EM_RoleValue_OrgID ) == 105518 then
		Num = 25;
	end
	
	if ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 and GetDistance( TID, OID ) < Num then
		local Ox = ReadRoleValue( OID, EM_RoleValue_X );			
		local Oz = ReadRoleValue( OID, EM_RoleValue_Z );
		local Tx = ReadRoleValue( TID, EM_RoleValue_X );
		local Y = ReadRoleValue( TID, EM_RoleValue_Y );
		local Tz = ReadRoleValue( TID, EM_RoleValue_Z );
		local Dir = CalDir( Tx-Ox, Tz-Oz )
		
		local radian = (math.pi/180)*Dir;--�|��
		Num = Num+10;
		Ox = Ox  +(Num*math.cos(radian))
		Oz = Oz - (Num*math.sin(radian))
		SetPos( TID, Ox, Y, Oz, Dir );
		PlayMotion( TID, ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN )
	end
end

function Lua_Zone21_Boss2_BoomsCheck( )--����AE
	local OID = OwnerID();--Boss
	local TID = TargetID();--Player
	if ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( TID, EM_RoleValue_VOC ) ~= 0  then
		local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
		local Global = Zone21_Boss2_Global[RoomID];

		for i=1, table.getn(Global["Stone"]) do
			if Global["Stone"][i] ~= nil then
				local Ox = ReadRoleValue( OID, EM_RoleValue_X );
				local Oz = ReadRoleValue( OID, EM_RoleValue_Z );
				local Tx = ReadRoleValue( TID, EM_RoleValue_X );
				local Tz = ReadRoleValue( TID, EM_RoleValue_Z );
				local Sx = ReadRoleValue( Global["Stone"][i], EM_RoleValue_X );
				local Sz = ReadRoleValue( Global["Stone"][i], EM_RoleValue_Z );
				local m = math.floor( ((Tz-Oz)/(Tx-Ox))*100 ) /100
				local b = Oz-m*Ox;
				local d = math.abs(m*Sx-Sz+b ) / (m^2+1)^0.5;--�p�� �I�쪽�u�Z��
							
				if d < 20 and GetDistance( Global["Stone"][i], OID ) < GetDistance( TID, OID ) then
					--Callplot( TID, "ks_TransTo", Global["Stone"][i] )--�ǰe��S�w��m
					--Say( Global["Stone"][i], "d = "..d.."; Boss Dis = "..GetDistance( OID, Global["Stone"][i] ).."; Player Dis = "..GetDistance( TID, OID ) )				
					return false;
				end
			end
		end
		return true;
	end
	--Say( TID, "not OK")
	return false;
end

function Lua_Zone21_Boss2_MstDead()--�p�Ǧ��`
	local OID = OwnerID();
	local TID = TargetID();
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	Global["MstNum"] = Global["MstNum"]-1;
	DebugMsg(0,0,"MstNum = "..Global["MstNum"] )
	
	SetStopAttack( OID )
	SetModeEx( OID, EM_SetModeType_Fight , false )	-- �i�������
	SetModeEx( OID, EM_SetModeType_Move, false )	--���i����
	CastSpell( OID, OID, 498009 ) --���z
	WriteRoleValue( OID, EM_RoleValue_LiveTime, 1 );
	return false;
end

function Lua_Zone21_Boss2_ObjMode( Obj )--����]�w
	SetModeEx( Obj, EM_SetModeType_Gravity, false )
	SetModeEx( Obj, EM_SetModeType_Mark , false )		-- �аO
	SetModeEx( Obj, EM_SetModeType_Fight , false )		-- �i�������
	SetModeEx( Obj, EM_SetModeType_HideName , false )		-- �W��
	SetModeEx( Obj, EM_SetModeType_NotShowHPMP , false )	-- ����ܦ��
end

function Lua_Zone21_Boss2_MstCheck()--�p�� �԰��ˬd
	local OID = OwnerID();
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local MaxHP = ReadRoleValue( OID, EM_RoleValue_MaxHP );
	
	while true do		
		if ReadRoleValue( Global["Boss"], EM_RoleValue_AttackTargetID ) == 0 and HateListCount( Global["Boss"] ) == 0 then
			if Global["MstNum"] ~= nil then
				Global["MstNum"] = Global["MstNum"]-1;
			end
			DelObj( OID );
			return;
		elseif ReadRoleValue( OID, EM_RoleValue_AttackTargetID ) == 0 then
			local Hate = KS_GetHateList( Global["Boss"], 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
			local Rnd = rand( table.getn(Hate) )+1;
			local TID = Hate[Rnd] or ReadRoleValue( Global["Boss"], EM_RoleValue_AttackTargetID );
			SetAttack( OID, TID );
		end
		Sleep(10)
	end
end

function Lua_Zone21_Boss2_MstSetLock()--�p�����
	local OID = OwnerID()
	CancelBuff( OID, 620418 )--���ۨ��@
	AddBuff( OID, 620422, 0, -1 )--���a�ˮ`��K
end