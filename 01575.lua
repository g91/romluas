function LuaZone_THAIRWIN_Main()
	SetZoneReviveScript( "LuaZone_THAIRWIN_Revive" );
	SetZonePVPScript( "LuaZone_THAIRWIN_PVPDead" );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	if RoomID~=0 then
		DesignLog(OwnerID(), 701575, "BG-Crystal Begin, Room: "..RoomID);
	end
	if RoomID == 0 then
		--return
	end
	if CrystalOwn == nil then
		CrystalOwn = {}
	end
	CrystalOwn[RoomID]= {}
	local CheckOK = 0
	local GateID = {}
	local Setp = 0
	local CrystalObj = {}
	--���ͤ���

	for i=1, 5 do 
		CrystalObj[i] = CreateObjByFlag( 111261 , 780288 , i-1 , 1 ) 
		SetModeEx( CrystalObj[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( CrystalObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( CrystalObj[i], EM_SetModeType_Obstruct, true )--����
		SetModeEx( CrystalObj[i], EM_SetModeType_Mark, true )--�аO
		SetModeEx( CrystalObj[i], EM_SetModeType_Move, false )--����
		SetModeEx( CrystalObj[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( CrystalObj[i], EM_SetModeType_HideName, true )--�W��
		SetModeEx( CrystalObj[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( CrystalObj[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( CrystalObj[i], EM_SetModeType_Drag , true )--���O
		SetPlot( CrystalObj[i] , "touch" , "Lua_THAIRWIN_StealCrystal" , 50 )
		SetRoleCampID( CrystalObj[i], 2 );					-- �N�w�]�X�l�]���Ǫ�
		AddToPartition(CrystalObj[i] , RoomID)
		Debuglog(2 , "Create CrystalObj = "..i.." and RoomID = "..RoomID)
		--�]�w�����������
		local pX = ReadRoleValue(CrystalObj[i],EM_RoleValue_X)
		local pY = ReadRoleValue(CrystalObj[i],EM_RoleValue_Y)
		local pZ = ReadRoleValue(CrystalObj[i],EM_RoleValue_Z)
		local pName = "[THAIRWIN_LANDMARK_NAME_" ..i.. "]"
		SetLandMarkInfo( RoomID, i, 57, pX, pY, pZ, pName, 57 );		-- �]�w�Գ����I���
		--�]�w�����֦��}��
		WriteRoleValue( CrystalObj[i], EM_RoleValue_PID, i );			--�N�����s���O���bpid
		SetPlot( CrystalObj[i] , "range" , "Lua_THAIRWIN_CrystalRange" , 250 )
		CrystalOwn[RoomID][i]=0
	end
	--���W��
	for i=1, 2 do 
		GateID[i] = CreateObjByFlag( 114314 , 780192 , i -1, 1 )
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
		AddToPartition(GateID[i] , RoomID)
	end
	-- �m��L�O �w�ɭ���
	local BuffBornCount = GetMoveFlagCount(780290)
	local BuffMaker = {}
	for i = 1, BuffBornCount do
		BuffMaker[i] = CreateObjByFlag( 100291, 780290 , i-1 , 1 ) --�ͥX�L�O���;�
		SetModeEx( BuffMaker[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( BuffMaker[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( BuffMaker[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( BuffMaker[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( BuffMaker[i], EM_SetModeType_Move, false )--����
		SetModeEx( BuffMaker[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( BuffMaker[i], EM_SetModeType_HideName, false )--�W��
		SetModeEx( BuffMaker[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( BuffMaker[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( BuffMaker[i], EM_SetModeType_Drag , false )--���O
		SetModeEx( BuffMaker[i], EM_SetModeType_Show, false )--���
		BeginPlot( BuffMaker[i],"Lua_THAIRWIN_BronFlag", 0 )
		AddToPartition(BuffMaker[i] , RoomID)
	end
	local Xtime = 0
	--�}�l�˼�
	while 1 do
		if Xtime < 90 then
			if Xtime == 0 then
				LuaZone_THAIRWIN_CheckOK(90,90,1)	--�˼ƨt��
				DebugMsg( 0, RoomID ,"90SCheckOK ="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_90TOSTART]" , C_SYSTEM )	--���ɱN�b90���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_90TOSTART]" , C_SYSTEM )	--���ɱN�b90���}�l
			end
			if math.fmod (Xtime , 5) == 0 then
				LuaZone_THAIRWIN_CheckOK(90,90-Xtime,1)	--�˼ƨt��
			end
			--�ˬd�O�_���@��L�H
			local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--�Ĥ@���`�M�H��
			local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) 	--�ĤG���`�M�H��
			if CountOneTeam == 0 and Xtime >= 80 then
				ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
				EndBattleGround( RoomID, -1 );
				Setp = 2
				break
			elseif CountTwoTeam == 0 and Xtime >= 80 then
				ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
				EndBattleGround( RoomID, -1 );
				Setp = 2
				break
			elseif CountOneTeam == GetMaxTeamMember() and CountTwoTeam == GetMaxTeamMember() and Xtime < 80 then	--�H���������
				Xtime = 80
				LuaZone_THAIRWIN_CheckOK(10,1,1)	--�˼ƨt��
			end
			if Xtime == 30 then
				DebugMsg( 0, RoomID ,"60SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_60TOSTART]" , C_SYSTEM )	--���ɱN�b60���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_60TOSTART]" , C_SYSTEM )	--���ɱN�b60���}�l
			end
			if Xtime == 45 then
				DebugMsg( 0, RoomID ,"45SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_45TOSTART]" , C_SYSTEM )	--���ɱN�b45���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_45TOSTART]" , C_SYSTEM )	--���ɱN�b45���}�l
			end
			if Xtime == 60 then
				DebugMsg( 0, RoomID ,"30SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_30TOSTART]" , C_SYSTEM )	--���ɱN�b30���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_30TOSTART]" , C_SYSTEM )	--���ɱN�b30���}�l
			end
			if Xtime == 75 then
				DebugMsg( 0, RoomID ,"15SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_15TOSTART]" , C_SYSTEM )	--���ɱN�b15���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_15TOSTART]" , C_SYSTEM )	--���ɱN�b15���}�l
			end
			if Xtime == 80 then
				LuaZone_THAIRWIN_CheckOK(10,1,0)	--�˼ƨt��
			end
			Sleep(10)
			Xtime = Xtime + 1
		else
			CheckOK = 1
			--�˼Ƶ����A�R����
			for i=1, 2 do
				PlayMotionEX( GateID[i], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
			end
			DebugMsg( 0, RoomID ,"STARTCheckOK="..CheckOK.."[RoomID] ="..RoomID)
			Setp = 1
			break
		end
	end
	--�ˬd�O�_���@��L�H
	local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--�Ĥ@���`�M�H��
	local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) 	--�ĤG���`�M�H��
	if CountOneTeam == 0 then
		ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
		EndBattleGround( RoomID, -1 );
		Setp = 2
	elseif CountTwoTeam == 0 then
		ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if	(CountOneTeam+CountTwoTeam)<10	 or
		math.abs(CountOneTeam-CountTwoTeam)>1	then
		ScriptMessage( OwnerID(), -1, 2, "[SC_1V1PVP_WILLSHOTDOWN]", 0 )--ĵ�i�T���G�H�Ƥ����A���ɧY�N����
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if Setp == 1 then	--�԰��}�l
		local CheckTime2 = 0;
		local WinnerCount = 0
		local FirstTemp = 0
		local SecondTemp = 0
		local GiveScoreTime = 0
		local SetpT = 0
		StandSec  = StandSec or {};
		StandSec[RoomID] = StandSec[RoomID] or 0;
		while 1 do
			--�D�n�j��, �ˬd���L��Ӫ�
			if GiveScoreTime >= 5 then
				--�ˬd�������k�ݡA�����n��
				for i = 1 , 5 do
					local T1Score = GetScore(RoomID,1)
					local T2Score = GetScore(RoomID,2)
					if CrystalOwn[RoomID][i] == 1 then
						if (T1Score+33) > 5000 then
							SetScore(RoomID,1,5000)
						else
							SetScore(RoomID,1,T1Score+33)
						end
						DebugMsg( 0, RoomID ,"####  TowerNm = "..i.." T1 +33")
					elseif CrystalOwn[RoomID][i] == 2 then
						if (T2Score+33) > 5000 then
							SetScore(RoomID,2,5000)
						else
							SetScore(RoomID,2,T2Score+33)
						end
						DebugMsg( 0, RoomID ,"####  TowerNm = "..i.." T2 +33")
					end
				end
				local T1Score = GetScore(RoomID,1)
				local T2Score = GetScore(RoomID,2)
				DebugMsg( 0, RoomID ,"####T1Score = "..T1Score)
				DebugMsg( 0, RoomID ,"####T2Score = "..T2Score)
				GiveScoreTime = 0
			end
			if CheckOK == 1 then
				--DebugMsg( 0, RoomID ,"CheckTime2="..CheckTime2)
				CheckTime2 = CheckTime2 + 1
				GiveScoreTime = GiveScoreTime + 1
				--�ˬd�O�_���@��L�H
				CountOneTeam = GetNumEnterTeamMember(RoomID,1)--�Ĥ@���`�M�H��
				CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --�ĤG���`�M�H��
				if CountOneTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , C_SYSTEM )	--��趤�����}�A���ɵ���
					ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
					WinnerCount = WinnerCount + 1
					FirstTemp = 2
				elseif CountTwoTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , C_SYSTEM )	--��趤�����}�A���ɵ���
					ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
					WinnerCount = WinnerCount + 1
					FirstTemp = 1
				end
				-- �ˬd���L�}��ì��
				local TeamName1 = ""
				local TeamName2 = ""
				local WinTeamScore = 0
				local LostTeamScore = 0
				for i=1, 2, 1 do
					if ( GetScore( RoomID, i ) >= 1000 ) and ( SetpT == 0 ) then
						if i == 1 then
							TeamName1 = "[BG_450_TEAM1_NAME]" 
							TeamName2 = "[BG_450_TEAM2_NAME]"
							WinTeamScore = GetScore( RoomID, 1 )
							LostTeamScore = GetScore( RoomID, 2 )
						else
							TeamName1 = "[BG_450_TEAM2_NAME]"
							TeamName2 = "[BG_450_TEAM1_NAME]" 
							WinTeamScore = GetScore( RoomID, 2 )
							LostTeamScore = GetScore( RoomID, 1 )
						end
						if WinTeamScore > LostTeamScore then
							ScriptMessage( OwnerID(),  -1, 2, "[SC_SCORE500][$SETVAR1="..TeamName1.."][$SETVAR2="..TeamName2.."][$SETVAR3="..WinTeamScore.."][$SETVAR4="..LostTeamScore.."]" , C_SYSTEM )	
						end
						SetpT = 1
					end
					if ( GetScore( RoomID, i ) >= 2000 ) and ( SetpT == 1 ) then
						if i == 1 then
							TeamName1 = "[BG_450_TEAM1_NAME]" 
							TeamName2 = "[BG_450_TEAM2_NAME]"
							WinTeamScore = GetScore( RoomID, 1 )
							LostTeamScore = GetScore( RoomID, 2 )
						else
							TeamName1 = "[BG_450_TEAM2_NAME]"
							TeamName2 = "[BG_450_TEAM1_NAME]" 
							WinTeamScore = GetScore( RoomID, 2 )
							LostTeamScore = GetScore( RoomID, 1 )
						end
						if WinTeamScore > LostTeamScore then
							ScriptMessage( OwnerID(),  -1, 2, "[SC_SCORE1000][$SETVAR1="..TeamName1.."][$SETVAR2="..TeamName2.."][$SETVAR3="..WinTeamScore.."][$SETVAR4="..LostTeamScore.."]" , C_SYSTEM )	
						end
						SetpT = 2
					end
					if ( GetScore( RoomID, i ) >= 3000 ) and ( SetpT == 2 ) then
						if i == 1 then
							TeamName1 = "[BG_450_TEAM1_NAME]" 
							TeamName2 = "[BG_450_TEAM2_NAME]"
							WinTeamScore = GetScore( RoomID, 1 )
							LostTeamScore = GetScore( RoomID, 2 )
						else
							TeamName1 = "[BG_450_TEAM2_NAME]"
							TeamName2 = "[BG_450_TEAM1_NAME]" 
							WinTeamScore = GetScore( RoomID, 2 )
							LostTeamScore = GetScore( RoomID, 1 )
						end
						if WinTeamScore > LostTeamScore then
							ScriptMessage( OwnerID(),  -1, 2, "[SC_SCORE1500][$SETVAR1="..TeamName1.."][$SETVAR2="..TeamName2.."][$SETVAR3="..WinTeamScore.."][$SETVAR4="..LostTeamScore.."]" , C_SYSTEM )	
						end
						SetpT = 3
					end
					if ( GetScore( RoomID, i ) >= 4000 ) and ( SetpT == 3 ) then
						if i == 1 then
							TeamName1 = "[BG_450_TEAM1_NAME]" 
							TeamName2 = "[BG_450_TEAM2_NAME]"
							WinTeamScore = GetScore( RoomID, 1 )
							LostTeamScore = GetScore( RoomID, 2 )
						else
							TeamName1 = "[BG_450_TEAM2_NAME]"
							TeamName2 = "[BG_450_TEAM1_NAME]" 
							WinTeamScore = GetScore( RoomID, 2 )
							LostTeamScore = GetScore( RoomID, 1 )
						end
						if WinTeamScore > LostTeamScore then
							ScriptMessage( OwnerID(),  -1, 2, "[SC_SCORE1800][$SETVAR1="..TeamName1.."][$SETVAR2="..TeamName2.."][$SETVAR3="..WinTeamScore.."][$SETVAR4="..LostTeamScore.."]" , C_SYSTEM )	
						end
						SetpT = 4
					end
				end

				if( GetScore( RoomID, 1 ) >= 5000 ) and ( GetScore( RoomID, 2 ) < 5000 )then
					WinnerCount = WinnerCount + 1
					FirstTemp = 1
					DebugMsg( 0, RoomID ,"####T1Win")
				elseif( GetScore( RoomID, 2 ) >= 5000 ) and ( GetScore( RoomID, 1 ) < 5000 )then
					WinnerCount = WinnerCount + 1
					FirstTemp = 2
					DebugMsg( 0, RoomID ,"####T2Win")
				elseif( GetScore( RoomID, 2 ) >= 5000 ) and ( GetScore( RoomID, 1 ) >= 5000 )then
					WinnerCount = WinnerCount + 1
					FirstTemp = -1
					DebugMsg( 0, RoomID ,"####NoOne Win")
					ScriptMessage( OwnerID(),  -1, 2, "[SC_THAIRWIN_NOWINER]" , C_SYSTEM )
				elseif FirstTemp	~= 0 then
					WinnerCount = WinnerCount + 1
					DebugMsg( 0, RoomID ,"####Wrong")
				end
				if FirstTemp == 1 then
					SecondTemp = 2
				elseif FirstTemp == 2 then
					SecondTemp = 1
				end
				if WinnerCount >= 1 then
					-- �ӧQ�̤w����, �ϥμ@��, �N�Ҧ����`�� buff ����, ����, 
					--CheckBGWinner();
					local WinnerHonor = 100

					--�������y
					if FirstTemp == -1 then
						--���⥭���a�A
						--AddTeamItem( RoomID, �� , 542943 , 1 )	--����ӺX��
						AddTeamHonor(RoomID , 1 , WinnerHonor/2)
						--AddTeamItem( RoomID, 2 , 542943 , 1 )	--����ӺX��
						AddTeamHonor(RoomID , 2 , WinnerHonor/2)
						EndBattleGround( RoomID, FirstTemp );
					else
						--�p����Ƥ��
						WinnerHonor = WinnerHonor*(GetScore( RoomID, FirstTemp ))/5000
						AddTeamHonor(RoomID , FirstTemp , WinnerHonor)
						--AddTeamItem( RoomID, FirstTemp , 542943 , 1 )	--����ӺX��
						EndBattleGround( RoomID, FirstTemp );
					end
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
								BornX 	= 4823
								BornY	= 200
								BornZ 	= 4914
							elseif ( GetTeamID( ID ) == 2 ) then	
								BornX 	= 2909
								BornY	= 200
								BornZ 	= 2776
							end
							if Obj:IsPlayer() == true and Obj:IsDead() == true then
								Revive( ID, ZoneID , BornX, BornY, BornZ, 0 )
							end
							if Obj:IsPlayer() == true then
								Lua_PVPAllFull(ID)	--�ɺ����A
								AddBuff( ID, 502797, 0, -1)		--�]���ä[�������A�A���i�������i�Q����
							end
						end	
					end
					Setp = 2
					DesignLog(OwnerID(), 701575, "BG-Crystal End, Room: "..RoomID);
					break
				end
			end
			Sleep( 10 )
			if	StandSec[RoomID]==30	then
				StandSec[RoomID] = 1;
			else
				
				StandSec[RoomID] = StandSec[RoomID] + 1
			end
		end
	end
	if Setp == 2 then
		if	StandSec  ~=nil	then
			StandSec[RoomID] = nil;
		end
		ScriptMessage( OwnerID(),  -1, 1, "[SC_SURVIVE_CLOSEGROUND]" , C_SYSTEM )	--���ɤw�����A�v�޳��N�b�����������
		ScriptMessage( OwnerID(),  -1, 0, "[SC_SURVIVE_CLOSEGROUND]" , C_SYSTEM )	--���ɤw�����A�v�޳��N�b�����������
		Sleep(1200)
		CloseBattleGround(RoomID)
	end
end


function LuaZone_THAIRWIN_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )

	local KillerTeamID = GetTeamID( OwnerID() );

	if( KillerTeamID ~= GetTeamID( TargetID() ) ) then
		local 	RoomID 	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		local 	Score 	= GetScore( RoomID, KillerTeamID ) ;
		SetScore( RoomID, KillerTeamID, Score+25 );
	end
end

function LuaZone_THAIRWIN_Revive()
	
	-- �ϰ쭫�ͼ@��
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local 	TeamID	= GetTeamID( OwnerID() );
	local	X	= 0;
	local	Y	= 0;
	local	Z	= 0;
	local	Dir	= 0;
	local NowX = ReadRoleValue(OwnerID(), EM_RoleValue_X );
	local NowY = ReadRoleValue( OwnerID(), EM_RoleValue_Y );
	local NowZ = ReadRoleValue( OwnerID(), EM_RoleValue_Z );
	local NowDir = ReadRoleValue( OwnerID(), EM_RoleValue_Dir );
	DebugMsg( 0, RoomID ,"#NowX = "..NowX.."#NowY = "..NowY.."#NowZ = "..NowZ)
	-- �����I�C��
	local MatchPoint = {}
	MatchPoint[1] = { 3839, 135, 3837, 322}	--1������
	MatchPoint[2] = { 3245, 326, 4319, 75}	--2������
	MatchPoint[3] = { 4478, 188, 4440, 112}	--3������
	MatchPoint[4] = { 3165, 188, 3201, 291}	--4������
	MatchPoint[5] = { 4430, 326, 3358, 261}	--5������
	
	local RevivePoint = {}
	RevivePoint[1] = { 4823, 200, 4914, 132}	--A��a�̭����I
	RevivePoint[2] = { 3736, 190, 4132, 70}	--A��1�������I
	RevivePoint[3] = { 3082, 335, 4447, 64}	--2�������I
	RevivePoint[4] = { 4410, 195, 4346, 147}	--3�������I 
	RevivePoint[5] = { 3229, 195, 3317, 325}	--4�������I 
	RevivePoint[6] = { 4556, 330, 3229, 221}	--5�������I
	RevivePoint[7] = { 2909, 200, 2776, 308}	--B��a�̭����I
	RevivePoint[8] = { 3938, 185, 3524, 248}	--B��1�������I
	local Dis = 0
	local ChangeXYZ = 0
	--�P�_�}��
	if TeamID == 1 then
		for i = 1, 5 do
			if CrystalOwn[RoomID][i] == 1 then
				local NewDis = ((NowX - MatchPoint[i][1])^2+(NowY - MatchPoint[i][2])^2+(NowZ - MatchPoint[i][3])^2)^0.5
				DebugMsg( 0, RoomID ,"T1 ~~  #i = "..i.." Dis = "..Dis.." NewDis = "..NewDis)
				if Dis == 0 or Dis > NewDis then
					Dis = NewDis
					ChangeXYZ = i
				end
			end
		end
		DebugMsg( 0, RoomID ,"T1 ~~ ChangeXYZ = "..ChangeXYZ)
		if ChangeXYZ == 0 then
			X 	= RevivePoint[1][1]
			Y	= RevivePoint[1][2]
			Z 	= RevivePoint[1][3]
			Dir	= RevivePoint[1][4]
		elseif ChangeXYZ == 1 then
			X 	= RevivePoint[2][1]
			Y	= RevivePoint[2][2]
			Z 	= RevivePoint[2][3]
			Dir	= RevivePoint[2][4]
		else
			X 	= RevivePoint[ChangeXYZ+1][1]
			Y	= RevivePoint[ChangeXYZ+1][2]
			Z 	= RevivePoint[ChangeXYZ+1][3]
			Dir	= RevivePoint[ChangeXYZ+1][4]
		end
	else
		for i = 1, 5 do
			if CrystalOwn[RoomID][i] == 2 then
				local NewDis = ((NowX - MatchPoint[i][1])^2+(NowY - MatchPoint[i][2])^2+(NowZ - MatchPoint[i][3])^2)^0.5
				if Dis == 0 or Dis > NewDis then
					Dis = NewDis
					ChangeXYZ = i
					DebugMsg( 0, RoomID ,"T2 ~~  #i = "..i.." Dis = "..Dis.." NewDis = "..NewDis)
				end
			end
		end
		DebugMsg( 0, RoomID ,"T2 ~~ ChangeXYZ = "..ChangeXYZ)
		if ChangeXYZ == 0 then
			X 	= RevivePoint[7][1]
			Y	= RevivePoint[7][2]
			Z 	= RevivePoint[7][3]
			Dir	= RevivePoint[7][4]
		elseif ChangeXYZ == 1 then
			X 	= RevivePoint[8][1]
			Y	= RevivePoint[8][2]
			Z 	= RevivePoint[8][3]
			Dir	= RevivePoint[8][4]
		else
			X 	= RevivePoint[ChangeXYZ+1][1]
			Y	= RevivePoint[ChangeXYZ+1][2]
			Z 	= RevivePoint[ChangeXYZ+1][3]
			Dir	= RevivePoint[ChangeXYZ+1][4]
		end
	end
	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );
	DebugMsg( 0, RoomID ,"#X = "..X.."#Y = "..Y.."#Z = "..Z)
	Lua_PVPAllFull( OwnerID())		--�ɺ����A
	StandSec = StandSec or {};
	StandSec[RoomID] = StandSec[RoomID] or 0;
	if	(30-StandSec[RoomID])<10	then
		AddBuff(OwnerID(), 500667, 0 , 10)	--���a���͵L��10��
	else
		AddBuff(OwnerID(), 500667, 0 , 30-StandSec[RoomID])--���a���͵L�ĲΤ@�ɶ�
	end
end

function LuaZone_THAIRWIN_JoinQueue( dbid, isTeam, numTeamPeople )

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
function LuaZone_THAIRWIN_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )


	local totalteam 		= GetNumTeam();	-- ���o�o�Գ��̦h���\������ƶq
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember(LevelGroupID, i ); --���o

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
function LuaZone_THAIRWIN_AssignLevelGroup( dbid, lv, worldid )
	local Group = nil;
	if lv < 30 then
		Group = 1
	else
		Group=math.floor((lv-30)/10)+2
	end
	return Group
end

function LuaZone_THAIRWIN_RoleEnterBattleGround( dbid, teamID )
	if( teamID == 1 ) then
		SetBattleGroundObjCampID( dbid, 8 );
		SetBattleGroundObjForceFlagID( dbid, 223091 )
	elseif( teamID == 2 ) then
		SetBattleGroundObjCampID( dbid, 9 );
		SetBattleGroundObjForceFlagID( dbid, 223090 )
	end
end


function LuaZone_THAIRWIN_MoveRoleToBattleGround( WorldID, ZoneID, dbid, teamid, roomid )
	local	ReX	= 0;
	local	ReY	= 0;
	local	ReZ	= 0;
	local	ReDir	= 0;
	if( teamID == 1 ) then
		ReX 	= 4889
		ReY	= 210
		ReZ 	= 4915
		ReDir	= 127
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	elseif( teamID == 2 ) then
		ReX 	= 2823
		ReY	= 210
		ReZ 	= 2769
		ReDir	= 306
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	end
end

function LuaZone_THAIRWIN_CheckOK(Time,NowTime,type)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local	ReX 	= 4889
	local	ReY	= 210
	local	ReZ 	= 4915
	local	ReDir	= 127
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				local tID = GetRoleCampID(ID)
				if( tID == 8 ) then
					ReX 	= 4889
					ReY	= 210
					ReZ 	= 4915
					ReDir	= 127
				elseif( tID == 9 ) then
					ReX 	= 2823
					ReY	= 210
					ReZ 	= 2769
					ReDir	= 306
				end
				local Dis = Lua_GetDisByXYZ(ID,ReX,ReY,ReZ)	--�ˬd�O�_���}�y�йL��
				if Dis > 200 then
					SetPos(ID,ReX,ReY,ReZ,ReDir)
				end
				StartClientCountDown ( ID, Time, NowTime, 0, 0, type, "[SC_1V1PVP_COUNTDOWN]" )	--���aClient��ܭ˼�10��
				--AddBuff( ID , 502798 , 0 , 10)			--�]���������A�A���i�������i�Q�����]�ƾԪ��A�^
			end
		end	
	end
end

function Lua_THAIRWIN_BronFlag()

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local firstX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
	local firstY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
	local firstZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
	local firstDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
	local BuffBorn
	local BuffID = {		200966,
				200965,
				204662,
				204663,
				204664,
				204665,
				204666,
				204667,	}
	local probability = { 	8,
				2,
				15,
				15,
				15,
				15,
				15,
				15,	}
	while 1 do
		local Obj
		local Count = SetSearchRangeInfo( OwnerID() , 50 )
		BuffBorn = "Dead"
		--DebugMsg( 0, RoomID ,"BG BuffBorn = "..BuffBorn)
		for i = 0 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			--�ˬd�P��O�_���L�O�A�S������Sleep30��A�ͥX�@��
			if ID ~= -1 then
				if Obj:RoomID() == RoomID and ID ~= OwnerID() then
					if ReadRoleValue( ID, EM_RoleValue_OrgID ) == BuffID[1] then
						BuffBorn = "Live"
					end
					if ReadRoleValue( ID, EM_RoleValue_OrgID ) == BuffID[2]  then
						BuffBorn = "Live"
					end
					if ReadRoleValue( ID, EM_RoleValue_OrgID ) == BuffID[3]  then
						BuffBorn = "Live"
					end
					if ReadRoleValue( ID, EM_RoleValue_OrgID ) == BuffID[4]  then
						BuffBorn = "Live"
					end
					if ReadRoleValue( ID, EM_RoleValue_OrgID ) == BuffID[5]  then
						BuffBorn = "Live"
					end
					if ReadRoleValue( ID, EM_RoleValue_OrgID ) == BuffID[6]  then
						BuffBorn = "Live"
					end
					if ReadRoleValue( ID, EM_RoleValue_OrgID ) == BuffID[7]  then
						BuffBorn = "Live"
					end
					if ReadRoleValue( ID, EM_RoleValue_OrgID ) == BuffID[8]  then
						BuffBorn = "Live"
					end
				end
			end
		end
		--DebugMsg( 0, RoomID ,"BuffBorn="..BuffBorn)
		--DebugMsg( 0, RoomID ,"EN BuffBorn = "..BuffBorn)
		if BuffBorn == "Dead" then
			Sleep(300)
			local BB = rand(100)+1	--�U���O�U�L�O�X�{���v
			local FlagDropObj 
			if BB >= (100 - probability[1]) then
				--�Ыسt�צL�O
				FlagDropObj = CreateObj( BuffID[1], firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2]) then
				--�Ыرj�ƦL�O
				FlagDropObj = CreateObj( BuffID[2] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3]) then
				--�Ыتv���L�O
				FlagDropObj = CreateObj( BuffID[3] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
				--�Ыئ^�_�L�O
				FlagDropObj = CreateObj( BuffID[4] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then
				--�Ыا����L�O
				FlagDropObj = CreateObj( BuffID[5] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then
				--�Ы��]��L�O
				FlagDropObj = CreateObj( BuffID[6] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then
				--�Ыب��m�L�O
				FlagDropObj = CreateObj( BuffID[7] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8]) then
				--�Ы��]���L�O
				FlagDropObj = CreateObj( BuffID[8] , firstX, firstY, firstZ, firstDir, 1 )
			end
			SetModeEx( FlagDropObj, EM_SetModeType_Fight , false )--�i�������
			SetModeEx( FlagDropObj, EM_SetModeType_Strikback, false )--����
			SetModeEx( FlagDropObj, EM_SetModeType_Mark, false )--�аO
			SetModeEx( FlagDropObj, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( FlagDropObj, EM_SetModeType_Obstruct, false )--����
			SetModeEx( FlagDropObj, EM_SetModeType_Gravity, true )--���O
			SetModeEx( FlagDropObj, EM_SetModeType_Move, false )--����
			SetModeEx( FlagDropObj, EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( FlagDropObj, EM_SetModeType_Searchenemy, false )--����
			AddToPartition(FlagDropObj , RoomID)
		end
		Sleep(10)
	end
end
	--int	GetEnterTeamMemberInfo ( int iRoomID, int iTeamID, int iID  )
	--iID �� -1 �����o�M��
	--void SetMemberVar( int iRoomID, int iTeamID, int iDBID, int iVarID, int iVar )
	--int GetMemberVar( int iRoomID, int iTeamID, int iDBID, int iVarID )
	--iVarID = 1 - 3
function LuaZone_PCall_THAIRWIN_CheckJoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	local Party = LuaFunc_PartyData(iObjID)
	if Party[0] == 1 then
		return 0;	-- �����[�J
	else
		ScriptMessage( iObjID, iObjID, 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		return 1;	-- ���[�J
	end	
end
function Lua_THAIRWIN_StealCrystal()
	local 	ObjID  		= 0;
	local 	CastResult	= 0;
	local	RoomID	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local	LandMarkID	= ReadRoleValue( TargetID(), EM_RoleValue_PID );
	local	PlayerCampID	= GetRoleCampID( OwnerID() );
	local	ObjCampID	= GetRoleCampID( TargetID() );
	local	Register	= ReadRoleValue( TargetID(), EM_RoleValue_Register1 );
	local	RegisterO = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 );
	if  ObjCampID ~= PlayerCampID then	--���P�}�� �m�ܼ@��
		if Register == 0 and RegisterO == 0 then
			DebugMsg( 0, RoomID ,"TargetID = "..Register)
			DebugMsg( 0, RoomID ,"OwnerID = "..RegisterO)
			AddBuff(OwnerID(),503368,0,1);	--��������
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,1 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,TargetID() )
			DebugMsg( 0, RoomID ,"TargetID = ".. ReadRoleValue( TargetID(), EM_RoleValue_Register1 ))
			DebugMsg( 0, RoomID ,"OwnerID = "..ReadRoleValue( OwnerID(), EM_RoleValue_Register1 ))
			if BeginCastBar( OwnerID(), GetName( TargetID() ) , 150 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ==0 then
				return
			else
				if( PlayerCampID == 8 ) then
					local PlayerName 	= GetName( OwnerID() );
					local FullKey 		= "[BG_450_MSG_ATTACKFLAG]" .. "[$SETVAR1=[THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=[BG_450_TEAM1_NAME]][$SETVAR3=" .. PlayerName .. "]"
					
					ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
					ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
				else
					local PlayerName 	= GetName( OwnerID() );
					local FullKey 		= "[BG_450_MSG_ATTACKFLAG]" .. "[$SETVAR1=[THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=[BG_450_TEAM2_NAME]][$SETVAR3=" .. PlayerName .. "]"

					ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
					ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
				end
				local CasTime = 0
				while 1 do
					sleep( 2 );
					local CastBarStatus = CheckCastBar( OwnerID() );
					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- ���\
							CastResult = 1;
							EndCastBar( OwnerID(), CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- ����
							CastResult = -1;
							EndCastBar( OwnerID(), CastBarStatus )
							break;
						end
					end
					if CasTime == 25 then
						if( PlayerCampID == 8 ) then
							local PlayerName 	= GetName( OwnerID() );
							local FullKey 		= "[BG_450_MSG_ATTACKFLAG]" .. "[$SETVAR1=[THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=[BG_450_TEAM1_NAME]][$SETVAR3=" .. PlayerName .. "]"
							
							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
						else
							local PlayerName 	= GetName( OwnerID() );
							local FullKey 		= "[BG_450_MSG_ATTACKFLAG]" .. "[$SETVAR1=[THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=[BG_450_TEAM2_NAME]][$SETVAR3=" .. PlayerName .. "]"

							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
						end					
						CasTime = 0
					end
					CasTime = CasTime + 1
				end
				if( CastResult == 1 ) then 
					local 	CampID		= GetRoleCampID( TargetID() );
					local 	TeamID 		= GetTeamID( OwnerID() );
					local 	OrgID 		= ReadRoleValue( TargetID(), EM_RoleValue_OrgID );
					-- �]���ۦP�}�窺��, �����I����, �ҥH�����N����]���I���H���}��Y�i
						if( PlayerCampID == 8 ) then 
							-- TEAM 1, ����
							-- SetRoleCampID �n�b ChangeObjID ���e, �]�� ChangeObjID �|���s AddToPartition, �|���ܪ��󤧶�������
							SetRoleCampID( TargetID(), PlayerCampID );
							ChangeObjID( TargetID(), 111264 );	-- TEAM 1 RED
							SetLandMark( RoomID, LandMarkID, 58 );
						else
							-- TEAM 2, �x��
							-- SetRoleCampID �n�b ChangeObjID ���e, �]�� ChangeObjID �|���s AddToPartition, �|���ܪ��󤧶�������
							SetRoleCampID( TargetID(), PlayerCampID );
							ChangeObjID( TargetID(), 111258 );	-- TEAM 2 BLUE
							SetLandMark( RoomID, LandMarkID, 59 );
						end
					-- �[�J�T�� XXX ��ŧ�F XXX

						if( PlayerCampID == 8 ) then

							local PlayerName 	= GetName( OwnerID() );
							local FullKey 		= "[BG_450_MSG_OWNFLAG]" .. "[$SETVAR1=[THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=|cffff3232[BG_450_TEAM1_NAME]|r][$SETVAR3=|cffff3232" .. PlayerName .. "|r]"
							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
							CrystalOwn[RoomID][LandMarkID] = 1
						else

							local PlayerName 	= GetName( OwnerID() );
							local FullKey 		= "[BG_450_MSG_OWNFLAG]" .. "[$SETVAR1=[THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=|cff00ffff[BG_450_TEAM2_NAME]|r][$SETVAR3=|cff00ffff" .. PlayerName .. "|r]"

							ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
							ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
							CrystalOwn[RoomID][LandMarkID] = 2
						end
					SetPlot( TargetID(), "Touch" , "Lua_THAIRWIN_StealCrystal" , 60 );
				end
			end
			WriteRoleValue(TargetID(), EM_RoleValue_Register1,0 )
			WriteRoleValue(OwnerID(), EM_RoleValue_Register1,0 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SAY_NPC_BUSY]" , 0 );
		end
	end
end
function Lua_THAIRWIN_CrystalRange()
	local LandMarkID = ReadRoleValue( TargetID(), EM_RoleValue_PID );
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	DebugMsg( 0, RoomID ,"-[THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "]-".." LandMarkID = "..LandMarkID)
	if CrystalOwn[RoomID][LandMarkID] == 1 then
		ScriptMessage( OwnerID(), OwnerID(), 2, "-- [THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "] --" , "0xffff3232" );
	elseif CrystalOwn[RoomID][LandMarkID] == 2 then
		ScriptMessage( OwnerID(), OwnerID(), 2, "-- [THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "] --" , "0xff003cff" );
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "-- [THAIRWIN_LANDMARK_NAME_" .. LandMarkID .. "] --" , "0xffffffff" );
	end
end