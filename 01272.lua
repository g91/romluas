function LuaZone_1v1PVP_1_Main()
	SetZoneReviveScript( "LuaZone_1v1PVP_Revive" );
	SetZonePVPScript( "LuaZone_1v1PVP_PVPDead" );
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local CheckOK = 0
	local GateID = {}
	for i=1, 2 do 
		GateID[i] = CreateObjByFlag( 112334 , 780288 , i-1 , 1 )
		SetModeEx( GateID[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( GateID[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( GateID[i], EM_SetModeType_Obstruct, true )--����
		SetModeEx( GateID[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( GateID[i], EM_SetModeType_Move, false )--����
		SetModeEx( GateID[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( GateID[i], EM_SetModeType_HideName, false )--�W��
		SetModeEx( GateID[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( GateID[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( GateID[i], EM_SetModeType_Drag , true )--���O
		SetModeEx( GateID[i], EM_SetModeType_SearchenemyIgnore , true )--�����󤣷|�Q�j�M��
		AddToPartition(GateID[i] , RoomID)
	end
	-- �ˬd�H�Ƴ����F�~�}�l�˼�
	local CheckTime = 0;
	local Setp = 0
	while 1 do
		local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--�Ĥ@���`�M�H��
		local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --�ĤG���`�M�H��
		if (CountOneTeam + CountTwoTeam) == 2 then
			Setp = 1
			break
		elseif (CountOneTeam + CountTwoTeam) == 1 then
			if CheckTime >= 60 then
				--�ˬd�H�Ƥ������ܵ����Գ�
				if CountOneTeam == 0 or CountTwoTeam == 0 then
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_COUNTERROR]" , 0 )	--��⥼�i�J�A���ɵ���
					EndBattleGround( RoomID, -1 );
					Setp = 2
					break
				end
			elseif CheckTime < 60 then
				local Obj
				local Count = SetSearchAllPlayer(RoomID)
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsPlayer() == true then
						--ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_WAITEM]" , 0 )	--���ݹ��i�J�v�޳�
						Lua_PVPAllFull(ID)	--�ɺ����A
					end
				end		
			end
		end
		CheckTime = CheckTime + 1
		Sleep(10)
	end
	if Setp == 1 then	--�H�ƹF��n�D
		LuaZone_1v1PVP_CheckOK(30,30,1)	--�˼ƨt��
		local Xtime = 0
		local CheckTime2 = 0;
		local WinnerCount = 0
		local FirstTemp = 0
		local SecondTemp = 0
		-- �D�n�j��, �ˬd���L��Ӫ�
		while 1 do
			DebugMsg( 0, RoomID ,"CheckOK ="..CheckOK.."[RoomID] ="..RoomID)
			if CheckOK == 0 then
				if Xtime < 30 then
					if Xtime == 0 then
						DebugMsg( 0, RoomID ,"30SCheckOK="..CheckOK)
						ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_30TOSTART]" , 0 )	--���ɱN�b30���}�l
						ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_30TOSTART]" , 0 )	--���ɱN�b30���}�l
					end
					if Xtime == 5 then
					LuaZone_1v1PVP_CheckOK(25,25,1)
					end
					if Xtime == 10 then
					LuaZone_1v1PVP_CheckOK(20,20,1)
					end
					if Xtime == 15 then
						DebugMsg( 0, RoomID ,"15SCheckOK="..CheckOK)
						ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_15TOSTART]" , 0 )	--���ɱN�b15���}�l
						ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_15TOSTART]" , 0 )	--���ɱN�b15���}�l
						LuaZone_1v1PVP_CheckOK(15,15,1)
					end
					if Xtime == 20 then
					LuaZone_1v1PVP_CheckOK(10,10,1)
					LuaZone_1v1PVP_CheckOK(10,1,0)
					end
					if Xtime == 25 then
					LuaZone_1v1PVP_CheckOK(5,5,1)
					end
					--�ˬd�O�_���@��L�H
					local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--�Ĥ@���`�M�H��
					local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --�ĤG���`�M�H��
					if CountOneTeam == 0 then
						--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , 0 )	--��趤�����}�A���ɵ���
						ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--��趤�����}�A���ɵ���
						EndBattleGround( RoomID, -1 );
						Setp = 2
						break
					elseif CountTwoTeam == 0 then
						--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , 0 )	--��趤�����}�A���ɵ���
						ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--��趤�����}�A���ɵ���
						EndBattleGround( RoomID, -1 );
						Setp = 2
						break
					end
					local Obj
					local Count = SetSearchAllPlayer(RoomID)
					for i = 1 , Count , 1 do
						local ID = GetSearchResult()
						Obj = Role:New( ID )
						if Obj:IsPlayer() == true then
							--ScriptMessage( ID, ID, 2, "[SC_1V1PVP_WAITEM]" , 0 )	--���ݹ��i�J�Գ�
							Lua_PVPAllFull(ID)	--�ɺ����A
						end
					end
					Xtime = Xtime + 1	
					--DebugMsg( 0, RoomID ,"Xtime="..Xtime)
				else
					CheckOK = 1
					--ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_START]" , 0 )	--��ն}�l
					--�˼Ƶ����A�R����
					for i=1, 2 do
						Delobj(GateID[i])
					end
					DebugMsg( 0, RoomID ,"STARTCheckOK=DOORDEL")
				end
			elseif CheckOK == 1 then
				--DebugMsg( 0, RoomID ,"CheckTime2="..CheckTime2)
				CheckTime2 = CheckTime2 + 1;
				--�ˬd�O�_���@��L�H
				local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--�Ĥ@���`�M�H��
				local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --�ĤG���`�M�H��
				if CountOneTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , 0 )	--��趤�����}�A���ɵ���
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--��趤�����}�A���ɵ���
					SetScore( RoomID, 2, 1 )
				elseif CountTwoTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , 0 )	--��趤�����}�A���ɵ���
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--��趤�����}�A���ɵ���
					SetScore( RoomID, 1, 1 )
				end
				-- �ˬd���L�}��ì��
				for i=1, 2, 1 do			
					if( GetScore( RoomID, i ) == 1 ) then
						WinnerCount = WinnerCount + 1
						FirstTemp = i
					end
				end
				if FirstTemp == 1 then
					SecondTemp = 2
				elseif FirstTemp == 2 then
					SecondTemp = 1
				end
				if WinnerCount >= 1 then
					-- �ӧQ�̤w����, �ϥμ@��, �N�Ҧ����`�� buff ����, ����, 
					local Obj
					local Count = SetSearchAllPlayer(RoomID)
					local BornX 	= 0
					local BornY	= 0
					local BornZ 	= 0
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local ID = GetSearchResult()
							Obj = Role:New( ID )
							if( GetTeamID( ID ) == 1 ) then	
								BornX 	= 1171
								BornY	= 95
								BornZ 	= 2600.2
							elseif ( GetTeamID( ID ) == 2 ) then	
								BornX 	= 1601.9
								BornY	= 95
								BornZ 	= 2170.9
							end
							if Obj:IsPlayer() == true and Obj:IsDead() == true then
								Revive( ID, 410 , BornX, BornY, BornZ, 0 )
							end
							if Obj:IsPlayer() == true then
								Lua_PVPAllFull(ID)	--�ɺ����A
								AddBuff( ID, 502797, 0, -1)		--�]���ä[�������A�A���i�������i�Q����
							end
						end	
					end
					--�N�n���[�J���a���
					--iIndex : 1=�ѥ[���� 2=�n�� 3=���g�ӳ� 4=���g�ѳ� 5=��ӳ� 6=��ѳ� 7=�ӤH�ӳ� 8=�ӤH�ѳ�
					local WinTeamScore = GetArenaScore( RoomID, FirstTemp, 1, 2)		--���o�ثe�n��
					local LoseTeamScore = GetArenaScore( RoomID, SecondTemp, 1, 2)		--���o�ثe�n��
					local WinScore,LoseScore = CountPVPScore( WinTeamScore, LoseTeamScore )	--�p����o�]��h�^�n��
					--local WinTeamJoin = GetArenaScore( RoomID, FirstTemp, 1, 1)		--���o�ѥ[����
					--local LoseTeamJoin = GetArenaScore( RoomID, SecondTemp, 1, 1)		--���o�ѥ[����
					local WinTeamWeekWin = GetArenaScore( RoomID, FirstTemp, 1, 3)		--���o���g�ӳ�
					local LoseTeamWeekLose = GetArenaScore( RoomID, SecondTemp, 1, 4)	--���o���g�ѳ�
					--local WinTeamMonthWin = GetArenaScore( RoomID, FirstTemp, 1, 5)	--���o��ӳ�
					--local LoseTeamMonthLose = GetArenaScore( RoomID, SecondTemp, 1, 6)	--���o��ѳ�
					--local WinTeamAllWin = GetArenaScore( RoomID, FirstTemp, 1, 7)		--���o�ӤH�ӳ�
					--local LoseTeamAllLose = GetArenaScore( RoomID, SecondTemp, 1, 8)	--���o�ӤH�ѳ�
					--SetArenaScore( RoomID, FirstTemp, 1, 1, WinTeamJoin + 1)		--�g�J�ѥ[����
					SetArenaScore( RoomID, FirstTemp, 1, 2, WinTeamScore + WinScore)	--�g�J�n��
					SetArenaScore( RoomID, FirstTemp, 1, 3, WinTeamWeekWin + 1)		--�g�J���g�ӳ�
					--SetArenaScore( RoomID, FirstTemp, 1, 5, WinTeamMonthWin + 1)		--�g�J��ӳ�
					--SetArenaScore( RoomID, FirstTemp, 1, 7, WinTeamAllWin + 1)		--�g�J�ӤH�ӳ� 
					--SetArenaScore( RoomID, SecondTemp, 1, 1, LoseTeamJoin + 1)		--�g�J�ѥ[����
					SetArenaScore( RoomID, SecondTemp, 1, 2, LoseTeamScore - LoseScore)	--�g�J�n��
					SetArenaScore( RoomID, SecondTemp, 1, 4, LoseTeamWeekLose + 1)		--�g�J���g�ѳ�
					--SetArenaScore( RoomID, SecondTemp, 1, 6, LoseTeamMonthLose + 1)	--�g�J��ѳ� 
					--SetArenaScore( RoomID, SecondTemp, 1, 8, LoseTeamAllLose + 1)		--�g�J�ӤH�ѳ�

					--CheckBGWinner();
					EndBattleGround( RoomID, FirstTemp );
					Setp = 2
					break
				end
				-- �ˬd�Գ��}�l�ɶ��ܤ��w�h�[, �C�T��������L�O
				local Flag = 780290		--�X�l�s��
				local Count = GetMoveFlagCount(Flag)
				if CheckTime2 == 180 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_1V1PVP_TIMETOOLONG_SIDE]---" , 0 )	--���W�X�{�t�צL�O
					--�Ыسt�צL�O
					local Side = rand(Count-1)
					local Buff = CreateObjByFlag( 200966, Flag , Side , 1 )
					AddToPartition(Buff, RoomID)
					Debuglog(2 , "Create Mark 1 MarkID = "..Buff.." and RoomID = "..RoomID)
				elseif CheckTime2 == 360 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_1V1PVP_TIMETOOLONG_SIDE]---" , 0 )	--���W�X�{�t�צL�O
					--�Ыسt�צL�O
					local Side = rand(Count-1)
					local Buff = CreateObjByFlag( 200966, Flag , Side , 1 )
					AddToPartition(Buff, RoomID)
					Debuglog(2 , "Create Mark 2 MarkID = "..Buff.." and RoomID = "..RoomID)
				elseif CheckTime2 == 540 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_1V1PVP_TIMETOOLONG_SIDE_1]---" , 0 )	--���W�X�{�j�ƦL�O
					--�Ыرj�ƦL�O
					local Side = rand(Count-1)
					local Buff = CreateObjByFlag( 200965, Flag , Side , 1 )
					AddToPartition(Buff, RoomID)
					Debuglog(2 , "Create Mark 3 MarkID = "..Buff.." and RoomID = "..RoomID)
					CheckTime2 = 0
				end
			end
			Sleep( 10 )
		end
	end
	if Setp == 2 then
		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_CLOSEGROUND]" , 0 )	--���ɤw�����A�v�޳��N�b�����������
		Sleep(1200)
		CloseBattleGround(RoomID)
	end
end

function LuaZone_1v1PVP_1_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )

	local KillerTeamID	= GetTeamID( OwnerID() );

	if( KillerTeamID ~= GetTeamID( TargetID() ) ) then
		local 	RoomID 	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		local 	Score 	= GetScore( RoomID, KillerTeamID ) + 1;
		SetScore( RoomID, KillerTeamID, Score );
		GiveBodyItem( KillerID ,  203988  , 1 ) --��§��
		GiveBodyItem( DeadID ,  203988  , 1 ) --��§��
		--ScriptMessage( OwnerID(),  -1, 0 , GetScore( RoomID, KillerTeamID ) , 0 )
	else
		if KillerTeamID == 1 then
			local 	RoomID 	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
			local 	Score 	= GetScore( RoomID, 2 ) + 1;
			SetScore( RoomID, 2, Score );	
		elseif KillerTeamID == 2 then
			local 	RoomID 	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
			local 	Score 	= GetScore( RoomID, 1 ) + 1;
			SetScore( RoomID, 1, Score );			
		end
	end
end

function LuaZone_1v1PVP_1_Revive()
	
	-- �ϰ쭫�ͼ@��
	local 	TeamID	= GetTeamID( OwnerID() );
	local	X	= 0;
	local	Y	= 0;
	local	Z	= 0;
	local	Dir	= 0;

	if( TeamID == 1 ) then	
		X 	= 1171
		Y	= 95
		Z 	= 2600.2
		Dir	= 90
	else		
		X 	= 1601.9
		Y	= 95
		Z 	= 2170.9
		Dir	= 272.3
	end

	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );
	AddBuff(OwnerID(), 502797, 0, -1)		--�]���ä[�������A�A���i�������i�Q����
end

function LuaZone_1v1PVP_1_JoinQueue( dbid, isTeam, numTeamPeople )

	local totalteam 		= GetNumTeam();	-- ���o�o�Գ��̦h���\������ƶq
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember( i ); --���o

		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end

	return lowestTeamID;	-- �Ǧ^�ӤH���n�i���Ӧ�C
end

function LuaZone_1v1PVP_1_RoleEnterBattleGround( dbid, teamID )
	if( teamID == 1 ) then
		SetBattleGroundObjCampID( dbid, 8 );
		SetBattleGroundObjForceFlagID( dbid, 223091 )
	elseif( teamID == 2 ) then
		SetBattleGroundObjCampID( dbid, 9 );
		SetBattleGroundObjForceFlagID( dbid, 223090 )
	end
end

function LuaZone_1v1PVP_1_MoveRoleToBattleGround( srvID, dbid, teamid, roomid )
	local	ReX	= 0;
	local	ReY	= 0;
	local	ReZ	= 0;
	local	ReDir	= 0;
	if( teamID == 1 ) then
		ReX 	= 1171
		ReY	= 95
		ReZ 	= 2600.2
		ReDir	= 90
		MoveRoleToBattleGround( srvID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	elseif( teamID == 2 ) then
		ReX 	= 1601.9
		ReY	= 95
		ReZ 	= 2170.9
		ReDir	= 272.3
		MoveRoleToBattleGround( srvID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	end
end

function LuaZone_1v1PVP_1_CheckOK(time,type)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				local String = "[SC_1V1PVP_COUNTDOWN]"
				StartClientCountDown ( ID, time, 0, 0, 0, type, String )	--���aClient��ܭ˼�10��
				--StartClientCountDown( ID ,30,0,0)				--���aClient��ܭ˼�10��
				--AddBuff( ID , 502798 , 0 , 30)					--�]���������A�A���i�������i�Q�����]�ƾԪ��A�^
			end
		end	
	end
end
