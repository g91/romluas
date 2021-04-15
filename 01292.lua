function LuaZone_CAPTUREFLAG_Main()
	SetZoneReviveScript( "LuaZone_CAPTUREFLAG_Revive" );
	SetZonePVPScript( "LuaZone_CAPTUREFLAG_PVPDead" );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	if StoneBuff == nil then
		StoneBuff = {}
	end
	if FlagSetp1 == nil then
		FlagSetp1 = {}
	end
	if FlagSetp2 == nil then
		FlagSetp2 = {}
	end
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	if RoomID~=0 then
		DesignLog(OwnerID(), 701292, "BG-FlagRobbing Begin, Room: "..RoomID)
	end
	if RoomID == 0 then
		return
	end
	local CheckOK = 0
	local GateID = {}
	local Setp = 0
	local FlagObj = {}
--���ͺX�l
		StoneBuff[RoomID] = {0,0}
		FlagObj[1] = CreateObjByFlag( 112565 , 780288 , 0 , 1 ) --������Y
		FlagObj[2] = CreateObjByFlag( 112564 , 780288 , 1 , 1 )	--�Ŧ���Y
	for i=1, 2 do 
		SetModeEx( FlagObj[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( FlagObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( FlagObj[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( FlagObj[i], EM_SetModeType_Mark, true )--�аO
		SetModeEx( FlagObj[i], EM_SetModeType_Move, false )--����
		SetModeEx( FlagObj[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( FlagObj[i], EM_SetModeType_HideName, true )--�W��
		SetModeEx( FlagObj[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( FlagObj[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( FlagObj[i], EM_SetModeType_Drag , true )--���O
	end
		FlagObj[3] = CreateObjByFlag( 100291 , 780288 , 0 , 1 )
		FlagObj[4] = CreateObjByFlag( 100291 , 780288 , 1 , 1 )
		FlagObj[5] = CreateObjByFlag( 100291 , 780288 , 0 , 1 )--�ˬdbuff��
		FlagObj[6] = CreateObjByFlag( 100291 , 780288 , 1 , 1 )--�ˬdbuff��
	for i=3, 6 do 
		SetModeEx( FlagObj[i], EM_SetModeType_Strikback, false )--����
		SetModeEx( FlagObj[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( FlagObj[i], EM_SetModeType_Obstruct, false )--����
		SetModeEx( FlagObj[i], EM_SetModeType_Mark, false )--�аO
		SetModeEx( FlagObj[i], EM_SetModeType_Move, false )--����
		SetModeEx( FlagObj[i], EM_SetModeType_Searchenemy, false )--����
		SetModeEx( FlagObj[i], EM_SetModeType_HideName, false )--�W��
		SetModeEx( FlagObj[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( FlagObj[i], EM_SetModeType_Fight , false )--�i�������
		SetModeEx( FlagObj[i], EM_SetModeType_Drag , false )--���O
		SetModeEx( FlagObj[i], EM_SetModeType_Show, false )--���
		AddToPartition(FlagObj[i] , RoomID)
	end
		BeginPlot(FlagObj[5],"Lua_CAPTUREFLAG_BuffAdd",0)
		BeginPlot(FlagObj[6],"Lua_CAPTUREFLAG_BuffAdd",0)
		SetRoleCampID( FlagObj[1], 8 );	--�]�w�X�l�}��
		SetRoleCampID( FlagObj[2], 9 );	--�]�w�X�l�}��
		SetRoleCampID( FlagObj[5], 8 );	--�]�w�X�l�}��
		SetRoleCampID( FlagObj[6], 9 );	--�]�w�X�l�}��
		AddToPartition(FlagObj[1] , RoomID)
		AddToPartition(FlagObj[2] , RoomID)
		SetPlot( FlagObj[1] , "touch" , "Lua_CAPTUREFLAG_StealFlagRed" , 50 )
		SetPlot( FlagObj[2] , "touch" , "Lua_CAPTUREFLAG_StealFlagBlue" , 50 )
		FlagSetp1[RoomID] = FlagObj[1]
		FlagSetp2[RoomID] = FlagObj[2]
--���W��
	local GateFlagNm = 1
	for i=1, 2 do 
		GateID[i] = CreateObjByFlag( 112334 , 780288 , GateFlagNm + i , 1 )
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
		BeginPlot( BuffMaker[i],"Lua_CAPTUREFLAG_BronFlag", 0 )
		AddToPartition(BuffMaker[i] , RoomID)
	end
	local Xtime = 0
--�}�l�˼�
	while 1 do
		if Xtime < 90 then
			if Xtime == 0 then
				LuaZone_CAPTUREFLAG_CheckOK(90,90,1)	--�˼ƨt��
				DebugMsg( 0, RoomID ,"90SCheckOK ="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_90TOSTART]" , C_SYSTEM )	--���ɱN�b90���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_90TOSTART]" , C_SYSTEM )	--���ɱN�b90���}�l
			end
			if math.fmod (Xtime , 5) == 0 then
				LuaZone_CAPTUREFLAG_CheckOK(90,90-Xtime,1)	--�˼ƨt��
			end
			--�ˬd�O�_���@��L�H
			local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--�Ĥ@���`�M�H��
			local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) 	--�ĤG���`�M�H��
			if CountOneTeam == GetMaxTeamMember() and CountTwoTeam == GetMaxTeamMember() and Xtime < 80 then	--�H���������
				Xtime = 80
				LuaZone_CAPTUREFLAG_CheckOK(10,1,1)	--�˼ƨt��
			end

			--if Xtime == 10 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,80,1)	--�˼ƨt��
			--end
			--if Xtime == 15 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,75,1)	--�˼ƨt��
			--end
			--if Xtime == 20 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,70,1)	--�˼ƨt��
			--end
			--if Xtime == 25 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,65,1)	--�˼ƨt��
			--end
			if Xtime == 30 then
				--LuaZone_CAPTUREFLAG_CheckOK(90,60,1)	--�˼ƨt��
				DebugMsg( 0, RoomID ,"60SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_60TOSTART]" , C_SYSTEM )	--���ɱN�b60���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_60TOSTART]" , C_SYSTEM )	--���ɱN�b60���}�l
			end
			--if Xtime == 35 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,55,1)	--�˼ƨt��
			--end
			--if Xtime == 40 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,50,1)	--�˼ƨt��
			--end
			if Xtime == 45 then
				DebugMsg( 0, RoomID ,"45SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_45TOSTART]" , C_SYSTEM )	--���ɱN�b45���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_45TOSTART]" , C_SYSTEM )	--���ɱN�b45���}�l
			end
			--if Xtime == 50 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,40,1)	--�˼ƨt��
			--end
			--if Xtime == 55 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,35,1)	--�˼ƨt��
			--end
			if Xtime == 60 then
				DebugMsg( 0, RoomID ,"30SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_30TOSTART]" , C_SYSTEM )	--���ɱN�b30���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_30TOSTART]" , C_SYSTEM )	--���ɱN�b30���}�l
			end
			--if Xtime == 65 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,25,1)	--�˼ƨt��
			--end
			--if Xtime == 70 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,20,1)	--�˼ƨt��
			--end
			if Xtime == 75 then
				DebugMsg( 0, RoomID ,"15SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_15TOSTART]" , C_SYSTEM )	--���ɱN�b15���}�l
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_15TOSTART]" , C_SYSTEM )	--���ɱN�b15���}�l
			end
			if Xtime == 80 then
				--LuaZone_CAPTUREFLAG_CheckOK(90,10,1)	--�˼ƨt��
				LuaZone_CAPTUREFLAG_CheckOK(10,1,0)	--�˼ƨt��
			end
			--if Xtime == 85 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,5,1)	--�˼ƨt��
			--end
			Sleep(10)
			Xtime = Xtime + 1
		else
			CheckOK = 1
			--ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_START]" , C_SYSTEM )	--��ն}�l
			--�˼Ƶ����A�R����
			for i=1, 2 do
				Delobj(GateID[i])
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
		--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , C_SYSTEM )	--��趤�����}�A���ɵ���
		ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
		EndBattleGround( RoomID, -1 );
		Setp = 2
	elseif CountTwoTeam == 0 then
		--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , C_SYSTEM )	--��趤�����}�A���ɵ���
		ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if	(CountOneTeam+CountTwoTeam)<9.6	or
		math.abs(CountOneTeam-CountTwoTeam)>1	then
		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_WILLSHOTDOWN]" , 0 )	--�H�Ƥ����A���ɧY�N����
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if Setp == 1 then	--����}��Ҧ��H
		local CheckTime2 = 0;
		local WinnerCount = 0
		local FirstTemp = 0
		local SecondTemp = 0
		local GiveScoreTime = 0
		local SetpT = 0
		StandSec  = StandSec or {};
		StandSec[RoomID] = StandSec[RoomID] or 0;
		while 1 do
			-- �ˬd�X�y����O�_���H�֦��Ĥ�X�lBUFF(Team 1)
			--DebugMsg( 0, RoomID ,"Searchobjing...Time = "..Time)
			local T1Obj
			local T1Count = SetSearchRangeInfo( FlagObj[3] , 50 )
			--DebugMsg( 0, RoomID ,"===Red Team Checking T1ID = "..T1ID)
			for i = 1 , T1Count , 1 do
				local T1ID = GetSearchResult()
				T1Obj = Role:New( T1ID )
				if T1Obj:IsPlayer() == true and T1Obj:RoomID() == RoomID then	--�ˬd��BUFF�����a�NBUFF����
					--	DebugMsg( 0, RoomID ,"Red Team CheckBuffing...".." CampID = "..GetRoleCampID(FlagObj[1]))
					local CountBuff = BuffCount ( T1ID)
					for j = 0 , CountBuff do
						--DebugMsg( 0, RoomID ,"Red Team SearchBuffing..."..j)
						local BuffID = BuffInfo ( T1ID , j , EM_BuffInfoType_BuffID )
						--DebugMsg( 0, RoomID ,"Red Team BuffID="..BuffID)
						if (BuffID == 503051) then
							CancelBuff_NoEvent( T1ID , BuffID )
							--local Team = GetEnterTeamMemberInfo ( RoomID , 1 , -1 )
							--for i = 1, table.getn(Team) do
								--if Team[i] == T1ID then
							local Team = GetTeamID( T1ID )
									local FlagScore = GetMemberVar( RoomID, Team, T1ID, 1 )
									DebugMsg( 0, RoomID ,GetName(T1ID).."'s Old FlagScore ="..FlagScore)
									SetMemberVar( RoomID, Team, T1ID, 1, FlagScore + 1)
									FlagScore = GetMemberVar( RoomID, Team, T1ID, 1 )
									DebugMsg( 0, RoomID ,GetName(T1ID).."'s New FlagScore ="..FlagScore)
								--end
							--end
							--local Score = GetScore( RoomID, Team ) + 500;
							local Score = GetScore( RoomID, Team ) + 1000;
							SetScore( RoomID, Team, Score );
							--DebugMsg( 0, RoomID ,"Red Team Get Flag !!!")
							local TeamName = "[BG_450_TEAM1_NAME]" 
							BeginPlot( FlagObj[2],"Lua_CAPTUREFLAG_ReShowFlag", 0 )
							ScriptMessage( OwnerID(),  -1, 1, "[SC_CAPTUREFLAG_GETFLAG][$SETVAR1="..TeamName.."]" , C_SYSTEM )	--�������o���X�m
						end
					end
				end
				--�ˬd�P��O�_���Ĥ�}�窺���N�X�l�A�����ܱN�X�l�R���A�N�Ĥ�X�y�W���Ѥl��ܥX��
					--if T1Obj:RoomID() == RoomID and T1ID ~= FlagObj[1] then
					--	--DebugMsg( 0, RoomID ,"CheckFlaging...".." CampID = "..GetRoleCampID(FlagObj[1]))
					--	local FlagOrgID = T1Obj:OrgID()
					--	--DebugMsg( 0, RoomID ,"FlagOrgID="..FlagOrgID)
					--	if (FlagOrgID == 112564) then
					--		--Say(FlagObj[1],"FlagOrgID="..FlagOrgID)
					--		DelObj( T1ID )
					--		--Show(FlagObj[2],RoomID)
					--		BeginPlot( FlagObj[2],"Lua_CAPTUREFLAG_ReShowFlag", C_SYSTEM )
					--	end
					--end
			end
			-- �ˬd�X�y����O�_���H�֦��Ĥ�X�lBUFF(Team 2)
			--DebugMsg( 0, RoomID ,"Searchobjing...Time = "..Time)
			local T2Obj
			local T2Count = SetSearchRangeInfo( FlagObj[4] , 50 )
			--DebugMsg( 0, RoomID ,"===Blue Team Checking T2ID = "..T2ID)
			for i = 1 , T2Count , 1 do
				local T2ID = GetSearchResult()
				T2Obj = Role:New( T2ID )
				if T2Obj:IsPlayer() == true and T2Obj:RoomID() == RoomID then	--�ˬd��BUFF�����a�NBUFF����
					--	DebugMsg( 0, RoomID ,"Blue Team CheckBuffing...".." CampID = "..GetRoleCampID(FlagObj[2]))
					local CountBuff = BuffCount ( T2ID)
					for j = 0 , CountBuff do
						--DebugMsg( 0, RoomID ,"Blue Team SearchBuffing..."..j)
						local BuffID = BuffInfo ( T2ID , j , EM_BuffInfoType_BuffID )
						--DebugMsg( 0, RoomID ,"Blue Team BuffID="..BuffID)
						if (BuffID == 503052) then
							--DebugMsg( 0, RoomID ,"Blue Team CancelBuff  BuffID="..BuffID)
							CancelBuff_NoEvent( T2ID , BuffID )
							--local Team = GetEnterTeamMemberInfo ( RoomID , 2 , -1 )
							--for i = 1, table.getn(Team) do
								--if Team[i] == T2ID then
							local Team = GetTeamID( T2ID )
									local FlagScore = GetMemberVar( RoomID, Team, T2ID , 1 )
									DebugMsg( 0, RoomID ,GetName(T2ID).."'s Old FlagScore ="..FlagScore)
									SetMemberVar( RoomID, Team, T2ID, 1, FlagScore + 1)
									FlagScore = GetMemberVar( RoomID, Team, T2ID , 1 )
									DebugMsg( 0, RoomID ,GetName(T2ID).."'s New FlagScore ="..FlagScore)
								--end
							--end

							--local Score = GetScore( RoomID, Team ) + 500;
							local Score = GetScore( RoomID, Team ) + 1000;
							SetScore( RoomID, Team, Score );
							--DebugMsg( 0, RoomID ,"Blue Team Get Flag !!!")
							local TeamName = "[BG_450_TEAM2_NAME]" 
							BeginPlot( FlagObj[1],"Lua_CAPTUREFLAG_ReShowFlag", 0 )
							ScriptMessage( OwnerID(),  -1, 1, "[SC_CAPTUREFLAG_GETFLAG][$SETVAR1="..TeamName.."]" , C_SYSTEM )	--�Ŷ����o���X�m
						end
					end
				end
				--�ˬd�P��O�_���Ĥ�}�窺���N�X�l�A�����ܱN�X�l�R���A�N�Ĥ�X�y�W���Ѥl��ܥX��
					--if T2Obj:RoomID() == RoomID and T2ID ~= FlagObj[2] then
					--	--DebugMsg( 0, RoomID ,"CheckFlaging...".." CampID = "..GetRoleCampID(FlagObj[2]))
					--	local FlagOrgID = T2Obj:OrgID()
					--	--DebugMsg( 0, RoomID ,"FlagOrgID="..FlagOrgID)
					--	if (FlagOrgID == 112565) then
					--		--DebugMsg( 0, RoomID ,"FlagOrgID="..FlagOrgID)
					--		DelObj( T2ID )
					--		--Show(FlagObj[1],RoomID)
					--		BeginPlot( FlagObj[1],"Lua_CAPTUREFLAG_ReShowFlag", C_SYSTEM )
					--	end
					--end
			end
			--�D�n�j��, �ˬd���L��Ӫ�
			if GiveScoreTime >= 15 then
				local T1Score = GetScore(RoomID,1)
				local T2Score = GetScore(RoomID,2)
				DebugMsg( 0, RoomID ,"####T1Score = "..T1Score)
				DebugMsg( 0, RoomID ,"####T2Score = "..T2Score)
				SetScore( RoomID, 1, T1Score + 10 )
				SetScore( RoomID, 2, T2Score + 10 )
				GiveScoreTime = 0
			end
			if CheckOK == 1 then
				--DebugMsg( 0, RoomID ,"CheckTime2="..CheckTime2)
				CheckTime2 = CheckTime2 + 1
				GiveScoreTime = GiveScoreTime + 1
				--�ˬd�O�_���@��L�H
				CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--�Ĥ@���`�M�H��
				CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --�ĤG���`�M�H��
				if CountOneTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , C_SYSTEM )	--��趤�����}�A���ɵ���
					ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
					WinnerCount = WinnerCount + 1
					FirstTemp = -1
				elseif CountTwoTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , C_SYSTEM )	--��趤�����}�A���ɵ���
					ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
					WinnerCount = WinnerCount + 1
					FirstTemp = -1
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
						ScriptMessage( OwnerID(),  -1, 2, "[SC_SCORE500][$SETVAR1="..TeamName1.."][$SETVAR2="..TeamName2.."][$SETVAR3="..WinTeamScore.."][$SETVAR4="..LostTeamScore.."]" , C_SYSTEM )	
						SetpT = 1
					end
					if ( GetScore( RoomID, i ) >= 1500 ) and ( SetpT == 1 ) then
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
						ScriptMessage( OwnerID(),  -1, 2, "[SC_SCORE1000][$SETVAR1="..TeamName1.."][$SETVAR2="..TeamName2.."][$SETVAR3="..WinTeamScore.."][$SETVAR4="..LostTeamScore.."]" , C_SYSTEM )	
						SetpT = 2
					end
					if ( GetScore( RoomID, i ) >= 2000 ) and ( SetpT == 2 ) then
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
						ScriptMessage( OwnerID(),  -1, 2, "[SC_SCORE1500][$SETVAR1="..TeamName1.."][$SETVAR2="..TeamName2.."][$SETVAR3="..WinTeamScore.."][$SETVAR4="..LostTeamScore.."]" , C_SYSTEM )	
						SetpT = 3
					end
					if ( GetScore( RoomID, i ) >= 2500 ) and ( SetpT == 3 ) then
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
						ScriptMessage( OwnerID(),  -1, 2, "[SC_SCORE1800][$SETVAR1="..TeamName1.."][$SETVAR2="..TeamName2.."][$SETVAR3="..WinTeamScore.."][$SETVAR4="..LostTeamScore.."]" , C_SYSTEM )	
						SetpT = 4
					end
				end
				if( GetScore( RoomID, 1 ) >= 3000 ) and ( GetScore( RoomID, 2 ) < 3000 )then
					--�����ӧQ�̢������a�A
					AddTeamHonor(RoomID , 1 , 100)
					AddTeamItem( RoomID, 1 , 542943 , 1 )	--����ӺX��
					WinnerCount = WinnerCount + 1
					FirstTemp = 1
				end
				if( GetScore( RoomID, 2 ) >= 3000 ) and ( GetScore( RoomID, 1 ) < 3000 )then
					--�����ӧQ�̢������a�A
					AddTeamHonor(RoomID , 2 , 100)
					AddTeamItem( RoomID, 2 , 542943 , 1 )	--����ӺX��
					WinnerCount = WinnerCount + 1
					FirstTemp = 2
				end
				if( GetScore( RoomID, 2 ) >= 3000 ) and ( GetScore( RoomID, 1 ) >= 3000 )then
					WinnerCount = WinnerCount + 1
					FirstTemp = -1
				end
				if FirstTemp == 1 then
					SecondTemp = 2
				elseif FirstTemp == 2 then
					SecondTemp = 1
				end
				if WinnerCount >= 1 then
					-- �ӧQ�̤w����, �ϥμ@��, �N�Ҧ����`�� buff ����, ����, 
					--CheckBGWinner();
					EndBattleGround( RoomID, FirstTemp );
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
								BornX 	= 3866.2
								BornY	= 700
								BornZ 	= 2903
							elseif ( GetTeamID( ID ) == 2 ) then	
								BornX 	= 3851.8
								BornY	= 700
								BornZ 	= 6130.4
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
					DesignLog(OwnerID(), 701292, "BG-FlagRobbing End, Room: "..RoomID);
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


function LuaZone_CAPTUREFLAG_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )

	local KillerTeamID = GetTeamID( OwnerID() );

	if( KillerTeamID ~= GetTeamID( TargetID() ) ) then
		local 	RoomID 	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		--local 	Score 	= GetScore( RoomID, KillerTeamID ) + 50;
		local 	Score 	= GetScore( RoomID, KillerTeamID ) + 5;
		SetScore( RoomID, KillerTeamID, Score );
	end
end

function LuaZone_CAPTUREFLAG_Revive()
	
	-- �ϰ쭫�ͼ@��
	local 	TeamID	= GetTeamID( OwnerID() );
	local	X	= 0;
	local	Y	= 0;
	local	Z	= 0;
	local	Dir	= 0;

	if( TeamID == 1 ) then	
		X 	= 3866.2
		Y	= 700
		Z 	= 2903
		Dir	= 268.3
	else		
		X 	= 3851.8
		Y	= 700
		Z 	= 6130.4
		Dir	= 89
	end

	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );
	Lua_PVPAllFull( OwnerID())		--�ɺ����A
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	StandSec = StandSec or {};
	StandSec[RoomID] = StandSec[RoomID] or 0;
	if	(30-StandSec[RoomID])<10	then
		AddBuff(OwnerID(), 500667, 0 , 10)	--���a���͵L��10��
	else
		AddBuff(OwnerID(), 500667, 0 , 30-StandSec[RoomID])--���a���͵L�ĲΤ@�ɶ�
	end
end

function LuaZone_CAPTUREFLAG_JoinQueue( dbid, isTeam, numTeamPeople )


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
function LuaZone_CAPTUREFLAG_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )


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
function LuaZone_CAPTUREFLAG_AssignLevelGroup( dbid, lv, worldid )
	local Group = nil;
	if lv < 30 then
		Group = 1
	else
		Group=math.floor((lv-30)/10)+2
	end
	return Group
end

function LuaZone_CAPTUREFLAG_RoleEnterBattleGround( dbid, teamID )
	if( teamID == 1 ) then
		SetBattleGroundObjCampID( dbid, 8 );
		SetBattleGroundObjForceFlagID( dbid, 223091 )
	elseif( teamID == 2 ) then
		SetBattleGroundObjCampID( dbid, 9 );
		SetBattleGroundObjForceFlagID( dbid, 223090 )
	end
end


function LuaZone_CAPTUREFLAG_MoveRoleToBattleGround( WorldID, ZoneID, dbid, teamid, roomid )
	local	ReX	= 0;
	local	ReY	= 0;
	local	ReZ	= 0;
	local	ReDir	= 0;
	if( teamID == 1 ) then
		ReX 	= 3866.2
		ReY	= 700
		ReZ 	= 2903
		ReDir	= 268.3
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	elseif( teamID == 2 ) then
		ReX 	= 3851.8
		ReY	= 700
		ReZ 	= 6130.4
		ReDir	= 89
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	end
end

function LuaZone_CAPTUREFLAG_CheckOK(Time,NowTime,type)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local	ReX 	= 3866.2
	local	ReY	= 700
	local	ReZ 	= 2903
	local	ReDir	= 268.3
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				local tID = GetRoleCampID(ID)
				if( tID == 8 ) then
					ReX 	= 3866.2
					ReY	= 700
					ReZ 	= 2903
					ReDir	= 268.3
				elseif( tID == 9 ) then
					ReX 	= 3851.8
					ReY	= 700
					ReZ 	= 6130.4
					ReDir	= 89
				end
				local Dis = Lua_GetDisByXYZ(ID,ReX,ReY,ReZ)	--�ˬd�O�_���}�y�йL��
				if Dis > 150 then
					SetPos(ID,ReX,ReY,ReZ,ReDir)
				end
				StartClientCountDown ( ID, Time, NowTime, 0, 1, type, "[SC_1V1PVP_COUNTDOWN]" )	--���aClient��ܭ˼�10��
				--AddBuff( ID , 502798 , 0 , 10)			--�]���������A�A���i�������i�Q�����]�ƾԪ��A�^
			end
		end	
	end
end

function Lua_CAPTUREFLAG_StealFlagRed()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 and BuffID ~= 503051 and BuffID ~= 503052 then
			ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_NOTCHANGE]", C_SYSTEM )
			return
		end
	end
	SetPlot( TargetID() , "touch" , "" , 0 )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG1][$SETVAR1="..Name.."]", C_SYSTEM )
	CastSpell(OwnerID(), OwnerID(),492900)	--�ܨ���a�X�l
	StoneBuff[RoomID][1] = 1
	DebugMsg( 0, RoomID ,"StoneBuff[RoomID][1] = 1")
	Hide(TargetID())
end
function Lua_CAPTUREFLAG_StealFlagBlue()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 and BuffID ~= 503051 and BuffID ~= 503052 then
			ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_NOTCHANGE]", C_SYSTEM )
			return
		end
	end
	SetPlot( TargetID() , "touch" , "" , 0 )
	local Name = GetName( OwnerID() )
	ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG2][$SETVAR1="..Name.."]", C_SYSTEM )
	CastSpell(OwnerID(), OwnerID(),492899)	--�ܨ���a�X�l
	StoneBuff[RoomID][2] = 1
	DebugMsg( 0, RoomID ,"StoneBuff[RoomID][2] = 1")
	Hide(TargetID())
end
function Lua_CAPTUREFLAG_DropFlag1()	--�Ĥ@�������X�l
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local Count = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
	local Obj
	if Zone == 31 or Zone == 444 then
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
				Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
				if Obj:IsNPC() == true then --IsNPC = �O���Onpc
					if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 112564 then
						Hide(ID)
					end
				end
			end	
		end
		local firstX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
		local firstY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
		local firstZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
		local firstDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
		local FlagDropObj = CreateObj( 112564, firstX, firstY, firstZ, firstDir, 1 )
		SetModeEx( FlagDropObj, EM_SetModeType_Strikback, false )--����
		SetModeEx( FlagDropObj, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( FlagDropObj, EM_SetModeType_Obstruct, false )--����
		SetModeEx( FlagDropObj, EM_SetModeType_Mark, true )--�аO
		SetModeEx( FlagDropObj, EM_SetModeType_Move, false )--����
		SetModeEx( FlagDropObj, EM_SetModeType_Searchenemy, false )--����
		SetModeEx( FlagDropObj, EM_SetModeType_HideName, true )--�W��
		SetModeEx( FlagDropObj, EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( FlagDropObj, EM_SetModeType_Fight , false )--�i�������
		SetModeEx( FlagDropObj, EM_SetModeType_Drag , true )--���O
		SetRoleCampID( FlagDropObj, 7 );	--�]�w�X�l�}��
		AddToPartition(FlagDropObj , RoomID)
		SetPlot( FlagDropObj , "touch" , "Lua_CAPTUREFLAG_DropMagic" , 50 )
		StoneBuff[RoomID][2] = 0
		--Say(FlagDropObj, "MyCampID = "..GetRoleCampID(FlagDropObj))
		DebugMsg( 0, RoomID ,"StoneBuff[RoomID][2] = 0")
	end
end
function Lua_CAPTUREFLAG_DropFlag2()	--�ĤG�������X�l
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local Count = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
	local Obj
	if Zone == 31 or Zone == 444 then
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
				Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
				if Obj:IsNPC() == true then --IsNPC = �O���Onpc
					if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 112565 then
						Hide(ID)
					end
				end
			end	
		end
		local firstX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
		local firstY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
		local firstZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
		local firstDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
		local FlagDropObj = CreateObj( 112565, firstX, firstY, firstZ, firstDir, 1 )
		SetModeEx( FlagDropObj, EM_SetModeType_Strikback, false )--����
		SetModeEx( FlagDropObj, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( FlagDropObj, EM_SetModeType_Obstruct, false )--����
		SetModeEx( FlagDropObj, EM_SetModeType_Mark, true )--�аO
		SetModeEx( FlagDropObj, EM_SetModeType_Move, false )--����
		SetModeEx( FlagDropObj, EM_SetModeType_Searchenemy, false )--����
		SetModeEx( FlagDropObj, EM_SetModeType_HideName, true )--�W��
		SetModeEx( FlagDropObj, EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( FlagDropObj, EM_SetModeType_Fight , false )--�i�������
		SetModeEx( FlagDropObj, EM_SetModeType_Drag , true )--���O
		SetRoleCampID( FlagDropObj, 7 );	--�]�w�X�l�}��
		AddToPartition(FlagDropObj , RoomID)
		SetPlot( FlagDropObj , "touch" , "Lua_CAPTUREFLAG_DropMagic2" , 50 )
		StoneBuff[RoomID][1] = 0
		--Say(FlagDropObj, "MyCampID = "..GetRoleCampID(FlagDropObj))
		DebugMsg( 0, RoomID ,"StoneBuff[RoomID][1] = 0")
	end
end
function Lua_CAPTUREFLAG_DropMagic()	--�����b���W�X�l��Ĳ�I�@��
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 and BuffID ~= 503051 and BuffID ~= 503052 then
			ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_NOTCHANGE]", C_SYSTEM )
			return
		end
	end
	SetPlot( TargetID() , "touch" , "" , 0 )
	--DebugMsg( 0, RoomID ,"Lua_CAPTUREFLAG_DropMagic")
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local TeamID = GetTeamID( OwnerID() )
	--DebugMsg( 0, RoomID ,"TeamID = "..TeamID)
	if TeamID == 1 then
		--DebugMsg( 0, RoomID ,"TeamID = 1 !="..TeamID)
		CastSpell(OwnerID(), OwnerID(),492899)	--�ܨ���a�X�l
		StoneBuff[RoomID][2] = 1
		DebugMsg( 0, RoomID ,"StoneBuff[RoomID][2] = 1")
	elseif TeamID == 2 then
		--DebugMsg( 0, RoomID ,"TeamID = 2 !="..TeamID)
		local Name = GetName( OwnerID() )
		ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_RETURN2][$SETVAR1="..Name.."]", C_SYSTEM )
		BeginPlot( FlagSetp2[RoomID],"Lua_CAPTUREFLAG_ReShowFlag", 0 )
	end
	DelObj(TargetID())
end
function Lua_CAPTUREFLAG_DropMagic2()	--�����b���W�X�l��Ĳ�I�@��
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 58 and BuffID ~= 503051 and BuffID ~= 503052 then
			ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_NOTCHANGE]", C_SYSTEM )
			return
		end
	end
	SetPlot( TargetID() , "touch" , "" , 0 )
	--DebugMsg( 0, RoomID ,"Lua_CAPTUREFLAG_DropMagic2")
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local TeamID = GetTeamID( OwnerID() )
	--DebugMsg( 0, RoomID ,"TeamID = "..TeamID)
	if TeamID == 1 then
		local Name = GetName( OwnerID() )
		ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_RETURN2][$SETVAR1="..Name.."]", C_SYSTEM )
		BeginPlot( FlagSetp1[RoomID],"Lua_CAPTUREFLAG_ReShowFlag", 0 )
	elseif TeamID == 2 then
		--DebugMsg( 0, RoomID ,"TeamID = 2 !="..TeamID)
		CastSpell(OwnerID(), OwnerID(),492900)	--�ܨ���a�X�l
		StoneBuff[RoomID][1] = 1
		DebugMsg( 0, RoomID ,"StoneBuff[RoomID][1] = 1")
	end
	DelObj(TargetID())
end
function Lua_CAPTUREFLAG_BronFlag()

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
function Lua_CAPTUREFLAG_ReShowFlag()
	--���@�����e�^�X�l��n�D�ť۰����@���A15���N�ۤv��ܥX��
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local OwnerOrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID)
	local Count = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
	local Obj
	if (OwnerOrgID == 112564) then
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
				Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
				if Obj:IsNPC() == true then --IsNPC = �O���Onpc
					if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 112564 and ID ~= OwnerID() then
						DelObj(ID)
					end
				end
			end	
		end
		StoneBuff[RoomID][2] = 0
		DebugMsg( 0, RoomID ,"StoneBuff[RoomID][2] = 0")
		Debuglog(2 , "StoneBuff[RoomID][2] = 0")
		Sleep(150)
		SetPlot( OwnerID() , "touch" , "Lua_CAPTUREFLAG_StealFlagBlue" , 50 )
		Show(OwnerID(),RoomID)
		ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_RESHOWSTONE1]", C_SYSTEM )	--[STONE]�w�g�^����W
	elseif (OwnerOrgID == 112565) then
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
				Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
				if Obj:IsNPC() == true then --IsNPC = �O���Onpc
					if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 112565 and ID ~= OwnerID() then
						DelObj(ID)
					end
				end
			end	
		end
		StoneBuff[RoomID][1] = 0
		DebugMsg( 0, RoomID ,"StoneBuff[RoomID][1] = 0")
		Debuglog(2 , "StoneBuff[RoomID][1] = 0")
		Sleep(150)
		SetPlot( OwnerID() , "touch" , "Lua_CAPTUREFLAG_StealFlagRed" , 50 )
		Show(OwnerID(),RoomID)
		ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_RESHOWSTONE2]", C_SYSTEM )	--[STONE]�w�g�^����W
	end
end
function Lua_CAPTUREFLAG_NOHIDE()
	--�ˬd���W�O�_��a�ťۡA�����ܴ��ܪ��a����ϥΦ��ޯ�
	local CountBuff = BuffCount ( OwnerID())
	for j = 0 , CountBuff do
		--DebugMsg( 0, RoomID ,"Blue Team SearchBuffing..."..j)
		local BuffID = BuffInfo ( OwnerID() , j , EM_BuffInfoType_BuffID )
		--DebugMsg( 0, RoomID ,"Blue Team BuffID="..BuffID)
		if (BuffID == 503052) or (BuffID == 503051) then
			ScriptMessage( OwnerID(),  OwnerID(), 1, "[SC_CAPTUREFLAG_NOHIDE]" , C_SYSTEM )
			return false
		end
	end
	return true
end



	--int	GetEnterTeamMemberInfo ( int iRoomID, int iTeamID, int iID  )
	--iID �� -1 �����o�M��
	--void SetMemberVar( int iRoomID, int iTeamID, int iDBID, int iVarID, int iVar )
	--int GetMemberVar( int iRoomID, int iTeamID, int iDBID, int iVarID )
	--iVarID = 1 - 3
function Lua_CAPTUREFLAG_buffclear()	
	local Count = BuffCount ( OwnerID())
	local BuffID = 0
	local BuffList = {}
	local CheckBuffID = {	503378,
				503379,	
				503380,	
				503381,	
				503382,	
				503383,	}
	for i = 1 , Count do
		table.insert(BuffList,BuffInfo ( OwnerID() , i-1 , EM_BuffInfoType_BuffID))
	end
	for i,v in ipairs(BuffList) do
		for k,j in ipairs(CheckBuffID) do
			if v == j then
				CancelBuff( OwnerID() , v );
			end
		end
	end
end
function Lua_CAPTUREFLAG_BuffAdd()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local CheckOK = {}
	local CheckBuffID = {503052,503051}
	While 1 do
	--	DebugMsg( 0, RoomID ,"######StoneBuff[RoomID][1] = "..StoneBuff[RoomID][1].." StoneBuff[RoomID][2] = "..StoneBuff[RoomID][2].."#####")
		CheckOK[1] = 0
		if StoneBuff[RoomID][1] == 0 then	--0�O��ܪ��A1�O���ê��A
			CheckOK[1] = 1
		elseif StoneBuff[RoomID][1] == 1 then
			local Obj
			local Count = SetSearchAllPlayer(RoomID)
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsPlayer() == true then
					local CountBuff = BuffCount ( ID)
						for j = 0 , CountBuff do
							local BuffID = BuffInfo ( ID , j , EM_BuffInfoType_BuffID )
							if (BuffID == CheckBuffID[1]) then
								CheckOK[1] = 1
								break
							end
						end
					end
				end	
			end
		end
		if CheckOK[1] == 0 then --�X���D�Ť夣���F
			BeginPlot( FlagSetp1[RoomID],"Lua_CAPTUREFLAG_ReShowFlag", 0 )
		end
		CheckOK[2] = 0
		if StoneBuff[RoomID][2] == 0 then	--0�O��ܪ��A1�O���ê��A
			CheckOK[2] = 1
		elseif StoneBuff[RoomID][2] == 1 then
			local Obj
			local Count = SetSearchAllPlayer(RoomID)
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsPlayer() == true then
					local CountBuff = BuffCount ( ID)
						for j = 0 , CountBuff do
							local BuffID = BuffInfo ( ID , j , EM_BuffInfoType_BuffID )
							if (BuffID == CheckBuffID[2]) then
								CheckOK[2] = 1
								break
							end
						end
					end
				end	
			end
		end
		if CheckOK[2] == 0 then --�X���D�Ť夣���F
			BeginPlot( FlagSetp2[RoomID],"Lua_CAPTUREFLAG_ReShowFlag", 0 )			
		end
		CastSpell(OwnerID(),OwnerID(),493856)
		Sleep(150)
	end
end
function LuaZone_PCall_CAPTUREFLAG_CheckJoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	local Party = LuaFunc_PartyData(iObjID)
	if Party[0] == 1 then
		return 0;	-- �����[�J
	else
		ScriptMessage( iObjID, iObjID, 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		return 1;	-- ���[�J
	end	
end