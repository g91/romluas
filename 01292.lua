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
--產生旗子
		StoneBuff[RoomID] = {0,0}
		FlagObj[1] = CreateObjByFlag( 112565 , 780288 , 0 , 1 ) --紅色石頭
		FlagObj[2] = CreateObjByFlag( 112564 , 780288 , 1 , 1 )	--藍色石頭
	for i=1, 2 do 
		SetModeEx( FlagObj[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( FlagObj[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( FlagObj[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( FlagObj[i], EM_SetModeType_Mark, true )--標記
		SetModeEx( FlagObj[i], EM_SetModeType_Move, false )--移動
		SetModeEx( FlagObj[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( FlagObj[i], EM_SetModeType_HideName, true )--名稱
		SetModeEx( FlagObj[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( FlagObj[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( FlagObj[i], EM_SetModeType_Drag , true )--阻力
	end
		FlagObj[3] = CreateObjByFlag( 100291 , 780288 , 0 , 1 )
		FlagObj[4] = CreateObjByFlag( 100291 , 780288 , 1 , 1 )
		FlagObj[5] = CreateObjByFlag( 100291 , 780288 , 0 , 1 )--檢查buff用
		FlagObj[6] = CreateObjByFlag( 100291 , 780288 , 1 , 1 )--檢查buff用
	for i=3, 6 do 
		SetModeEx( FlagObj[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( FlagObj[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( FlagObj[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( FlagObj[i], EM_SetModeType_Mark, false )--標記
		SetModeEx( FlagObj[i], EM_SetModeType_Move, false )--移動
		SetModeEx( FlagObj[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( FlagObj[i], EM_SetModeType_HideName, false )--名稱
		SetModeEx( FlagObj[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( FlagObj[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( FlagObj[i], EM_SetModeType_Drag , false )--阻力
		SetModeEx( FlagObj[i], EM_SetModeType_Show, false )--顯示
		AddToPartition(FlagObj[i] , RoomID)
	end
		BeginPlot(FlagObj[5],"Lua_CAPTUREFLAG_BuffAdd",0)
		BeginPlot(FlagObj[6],"Lua_CAPTUREFLAG_BuffAdd",0)
		SetRoleCampID( FlagObj[1], 8 );	--設定旗子陣營
		SetRoleCampID( FlagObj[2], 9 );	--設定旗子陣營
		SetRoleCampID( FlagObj[5], 8 );	--設定旗子陣營
		SetRoleCampID( FlagObj[6], 9 );	--設定旗子陣營
		AddToPartition(FlagObj[1] , RoomID)
		AddToPartition(FlagObj[2] , RoomID)
		SetPlot( FlagObj[1] , "touch" , "Lua_CAPTUREFLAG_StealFlagRed" , 50 )
		SetPlot( FlagObj[2] , "touch" , "Lua_CAPTUREFLAG_StealFlagBlue" , 50 )
		FlagSetp1[RoomID] = FlagObj[1]
		FlagSetp2[RoomID] = FlagObj[2]
--關上門
	local GateFlagNm = 1
	for i=1, 2 do 
		GateID[i] = CreateObjByFlag( 112334 , 780288 , GateFlagNm + i , 1 )
		SetModeEx( GateID[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( GateID[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( GateID[i], EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( GateID[i], EM_SetModeType_Mark, false )--標記
		SetModeEx( GateID[i], EM_SetModeType_Move, false )--移動
		SetModeEx( GateID[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( GateID[i], EM_SetModeType_HideName, false )--名稱
		SetModeEx( GateID[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( GateID[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( GateID[i], EM_SetModeType_Drag , true )--阻力
		AddToPartition(GateID[i] , RoomID)
	end
	-- 置放印記 定時重生
	local BuffBornCount = GetMoveFlagCount(780290)
	local BuffMaker = {}
	for i = 1, BuffBornCount do
		BuffMaker[i] = CreateObjByFlag( 100291, 780290 , i-1 , 1 ) --生出印記產生器
		SetModeEx( BuffMaker[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( BuffMaker[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( BuffMaker[i], EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( BuffMaker[i], EM_SetModeType_Mark, false )--標記
		SetModeEx( BuffMaker[i], EM_SetModeType_Move, false )--移動
		SetModeEx( BuffMaker[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( BuffMaker[i], EM_SetModeType_HideName, false )--名稱
		SetModeEx( BuffMaker[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( BuffMaker[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( BuffMaker[i], EM_SetModeType_Drag , false )--阻力
		SetModeEx( BuffMaker[i], EM_SetModeType_Show, false )--顯示
		BeginPlot( BuffMaker[i],"Lua_CAPTUREFLAG_BronFlag", 0 )
		AddToPartition(BuffMaker[i] , RoomID)
	end
	local Xtime = 0
--開始倒數
	while 1 do
		if Xtime < 90 then
			if Xtime == 0 then
				LuaZone_CAPTUREFLAG_CheckOK(90,90,1)	--倒數系統
				DebugMsg( 0, RoomID ,"90SCheckOK ="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_90TOSTART]" , C_SYSTEM )	--比賽將在90秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_90TOSTART]" , C_SYSTEM )	--比賽將在90秒後開始
			end
			if math.fmod (Xtime , 5) == 0 then
				LuaZone_CAPTUREFLAG_CheckOK(90,90-Xtime,1)	--倒數系統
			end
			--檢查是否有一方無人
			local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--第一隊總和人數
			local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) 	--第二隊總和人數
			if CountOneTeam == GetMaxTeamMember() and CountTwoTeam == GetMaxTeamMember() and Xtime < 80 then	--人員全部到齊
				Xtime = 80
				LuaZone_CAPTUREFLAG_CheckOK(10,1,1)	--倒數系統
			end

			--if Xtime == 10 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,80,1)	--倒數系統
			--end
			--if Xtime == 15 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,75,1)	--倒數系統
			--end
			--if Xtime == 20 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,70,1)	--倒數系統
			--end
			--if Xtime == 25 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,65,1)	--倒數系統
			--end
			if Xtime == 30 then
				--LuaZone_CAPTUREFLAG_CheckOK(90,60,1)	--倒數系統
				DebugMsg( 0, RoomID ,"60SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_60TOSTART]" , C_SYSTEM )	--比賽將在60秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_60TOSTART]" , C_SYSTEM )	--比賽將在60秒後開始
			end
			--if Xtime == 35 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,55,1)	--倒數系統
			--end
			--if Xtime == 40 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,50,1)	--倒數系統
			--end
			if Xtime == 45 then
				DebugMsg( 0, RoomID ,"45SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_45TOSTART]" , C_SYSTEM )	--比賽將在45秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_45TOSTART]" , C_SYSTEM )	--比賽將在45秒後開始
			end
			--if Xtime == 50 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,40,1)	--倒數系統
			--end
			--if Xtime == 55 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,35,1)	--倒數系統
			--end
			if Xtime == 60 then
				DebugMsg( 0, RoomID ,"30SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_30TOSTART]" , C_SYSTEM )	--比賽將在30秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_30TOSTART]" , C_SYSTEM )	--比賽將在30秒後開始
			end
			--if Xtime == 65 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,25,1)	--倒數系統
			--end
			--if Xtime == 70 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,20,1)	--倒數系統
			--end
			if Xtime == 75 then
				DebugMsg( 0, RoomID ,"15SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_15TOSTART]" , C_SYSTEM )	--比賽將在15秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_15TOSTART]" , C_SYSTEM )	--比賽將在15秒後開始
			end
			if Xtime == 80 then
				--LuaZone_CAPTUREFLAG_CheckOK(90,10,1)	--倒數系統
				LuaZone_CAPTUREFLAG_CheckOK(10,1,0)	--倒數系統
			end
			--if Xtime == 85 then
			--	LuaZone_CAPTUREFLAG_CheckOK(90,5,1)	--倒數系統
			--end
			Sleep(10)
			Xtime = Xtime + 1
		else
			CheckOK = 1
			--ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_START]" , C_SYSTEM )	--比試開始
			--倒數結束，刪除門
			for i=1, 2 do
				Delobj(GateID[i])
			end
			DebugMsg( 0, RoomID ,"STARTCheckOK="..CheckOK.."[RoomID] ="..RoomID)
			Setp = 1
			break
		end
	end
	--檢查是否有一方無人
	local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--第一隊總和人數
	local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) 	--第二隊總和人數
	if CountOneTeam == 0 then
		--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , C_SYSTEM )	--對方隊伍離開，比賽結束
		ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
		EndBattleGround( RoomID, -1 );
		Setp = 2
	elseif CountTwoTeam == 0 then
		--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , C_SYSTEM )	--對方隊伍離開，比賽結束
		ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if	(CountOneTeam+CountTwoTeam)<9.6	or
		math.abs(CountOneTeam-CountTwoTeam)>1	then
		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_WILLSHOTDOWN]" , 0 )	--人數不足，比賽即將結束
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if Setp == 1 then	--雙方陣營皆有人
		local CheckTime2 = 0;
		local WinnerCount = 0
		local FirstTemp = 0
		local SecondTemp = 0
		local GiveScoreTime = 0
		local SetpT = 0
		StandSec  = StandSec or {};
		StandSec[RoomID] = StandSec[RoomID] or 0;
		while 1 do
			-- 檢查旗座附近是否有人擁有敵方旗子BUFF(Team 1)
			--DebugMsg( 0, RoomID ,"Searchobjing...Time = "..Time)
			local T1Obj
			local T1Count = SetSearchRangeInfo( FlagObj[3] , 50 )
			--DebugMsg( 0, RoomID ,"===Red Team Checking T1ID = "..T1ID)
			for i = 1 , T1Count , 1 do
				local T1ID = GetSearchResult()
				T1Obj = Role:New( T1ID )
				if T1Obj:IsPlayer() == true and T1Obj:RoomID() == RoomID then	--檢查有BUFF的玩家將BUFF消除
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
							ScriptMessage( OwnerID(),  -1, 1, "[SC_CAPTUREFLAG_GETFLAG][$SETVAR1="..TeamName.."]" , C_SYSTEM )	--紅隊取得對方旗幟
						end
					end
				end
				--檢查周圍是否有敵方陣營的替代旗子，有的話將旗子刪除，將敵方旗座上的棋子顯示出來
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
			-- 檢查旗座附近是否有人擁有敵方旗子BUFF(Team 2)
			--DebugMsg( 0, RoomID ,"Searchobjing...Time = "..Time)
			local T2Obj
			local T2Count = SetSearchRangeInfo( FlagObj[4] , 50 )
			--DebugMsg( 0, RoomID ,"===Blue Team Checking T2ID = "..T2ID)
			for i = 1 , T2Count , 1 do
				local T2ID = GetSearchResult()
				T2Obj = Role:New( T2ID )
				if T2Obj:IsPlayer() == true and T2Obj:RoomID() == RoomID then	--檢查有BUFF的玩家將BUFF消除
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
							ScriptMessage( OwnerID(),  -1, 1, "[SC_CAPTUREFLAG_GETFLAG][$SETVAR1="..TeamName.."]" , C_SYSTEM )	--藍隊取得對方旗幟
						end
					end
				end
				--檢查周圍是否有敵方陣營的替代旗子，有的話將旗子刪除，將敵方旗座上的棋子顯示出來
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
			--主要迴圈, 檢查有無獲勝者
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
				--檢查是否有一方無人
				CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--第一隊總和人數
				CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --第二隊總和人數
				if CountOneTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , C_SYSTEM )	--對方隊伍離開，比賽結束
					ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
					WinnerCount = WinnerCount + 1
					FirstTemp = -1
				elseif CountTwoTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , C_SYSTEM )	--對方隊伍離開，比賽結束
					ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
					WinnerCount = WinnerCount + 1
					FirstTemp = -1
				end
				-- 檢查有無陣營穫勝
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
					--給予勝利者１００榮譽
					AddTeamHonor(RoomID , 1 , 100)
					AddTeamItem( RoomID, 1 , 542943 , 1 )	--給獲勝旗標
					WinnerCount = WinnerCount + 1
					FirstTemp = 1
				end
				if( GetScore( RoomID, 2 ) >= 3000 ) and ( GetScore( RoomID, 1 ) < 3000 )then
					--給予勝利者１００榮譽
					AddTeamHonor(RoomID , 2 , 100)
					AddTeamItem( RoomID, 2 , 542943 , 1 )	--給獲勝旗標
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
					-- 勝利者已產生, 使用劇情, 將所有有害的 buff 消除, 等待, 
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
								Lua_PVPAllFull(ID)	--補滿狀態
								AddBuff( ID, 502797, 0, -1)		--設為永久消失狀態，不可攻擊不可被攻擊
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
		ScriptMessage( OwnerID(),  -1, 1, "[SC_SURVIVE_CLOSEGROUND]" , C_SYSTEM )	--比賽已結束，競技場將在兩分鐘後關閉
		ScriptMessage( OwnerID(),  -1, 0, "[SC_SURVIVE_CLOSEGROUND]" , C_SYSTEM )	--比賽已結束，競技場將在兩分鐘後關閉
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
	
	-- 區域重生劇情
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
	Lua_PVPAllFull( OwnerID())		--補滿狀態
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	StandSec = StandSec or {};
	StandSec[RoomID] = StandSec[RoomID] or 0;
	if	(30-StandSec[RoomID])<10	then
		AddBuff(OwnerID(), 500667, 0 , 10)	--玩家重生無敵10秒
	else
		AddBuff(OwnerID(), 500667, 0 , 30-StandSec[RoomID])--玩家重生無敵統一時間
	end
end

function LuaZone_CAPTUREFLAG_JoinQueue( dbid, isTeam, numTeamPeople )


	local totalteam 		= GetNumTeam();	-- 取得這戰場最多允許的隊伍數量
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember( i ); --取得

		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end

	return lowestTeamID;	-- 傳回該人物要進那個佇列
end
function LuaZone_CAPTUREFLAG_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )


	local totalteam 		= GetNumTeam();	-- 取得這戰場最多允許的隊伍數量
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember(LevelGroupID, i ); --取得

		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end

	return lowestTeamID;	-- 傳回該人物要進那個佇列
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
				local Dis = Lua_GetDisByXYZ(ID,ReX,ReY,ReZ)	--檢查是否離開座標過遠
				if Dis > 150 then
					SetPos(ID,ReX,ReY,ReZ,ReDir)
				end
				StartClientCountDown ( ID, Time, NowTime, 0, 1, type, "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數10秒
				--AddBuff( ID , 502798 , 0 , 10)			--設為隱身狀態，不可攻擊不可被攻擊（備戰狀態）
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
	CastSpell(OwnerID(), OwnerID(),492900)	--變身攜帶旗子
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
	CastSpell(OwnerID(), OwnerID(),492899)	--變身攜帶旗子
	StoneBuff[RoomID][2] = 1
	DebugMsg( 0, RoomID ,"StoneBuff[RoomID][2] = 1")
	Hide(TargetID())
end
function Lua_CAPTUREFLAG_DropFlag1()	--第一隊掉落旗子
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local Count = SetSearchAllNPC(RoomID) -- 搜索區域內的所有NPC ，回傳值為其數量
	local Obj
	if Zone == 31 or Zone == 444 then
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
				Obj = Role:New( ID ) -- 等同於 ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = 資料庫內的ID
				if Obj:IsNPC() == true then --IsNPC = 是不是npc
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
		SetModeEx( FlagDropObj, EM_SetModeType_Strikback, false )--反擊
		SetModeEx( FlagDropObj, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( FlagDropObj, EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( FlagDropObj, EM_SetModeType_Mark, true )--標記
		SetModeEx( FlagDropObj, EM_SetModeType_Move, false )--移動
		SetModeEx( FlagDropObj, EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( FlagDropObj, EM_SetModeType_HideName, true )--名稱
		SetModeEx( FlagDropObj, EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( FlagDropObj, EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( FlagDropObj, EM_SetModeType_Drag , true )--阻力
		SetRoleCampID( FlagDropObj, 7 );	--設定旗子陣營
		AddToPartition(FlagDropObj , RoomID)
		SetPlot( FlagDropObj , "touch" , "Lua_CAPTUREFLAG_DropMagic" , 50 )
		StoneBuff[RoomID][2] = 0
		--Say(FlagDropObj, "MyCampID = "..GetRoleCampID(FlagDropObj))
		DebugMsg( 0, RoomID ,"StoneBuff[RoomID][2] = 0")
	end
end
function Lua_CAPTUREFLAG_DropFlag2()	--第二隊掉落旗子
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local Count = SetSearchAllNPC(RoomID) -- 搜索區域內的所有NPC ，回傳值為其數量
	local Obj
	if Zone == 31 or Zone == 444 then
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
				Obj = Role:New( ID ) -- 等同於 ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = 資料庫內的ID
				if Obj:IsNPC() == true then --IsNPC = 是不是npc
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
		SetModeEx( FlagDropObj, EM_SetModeType_Strikback, false )--反擊
		SetModeEx( FlagDropObj, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( FlagDropObj, EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( FlagDropObj, EM_SetModeType_Mark, true )--標記
		SetModeEx( FlagDropObj, EM_SetModeType_Move, false )--移動
		SetModeEx( FlagDropObj, EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( FlagDropObj, EM_SetModeType_HideName, true )--名稱
		SetModeEx( FlagDropObj, EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( FlagDropObj, EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( FlagDropObj, EM_SetModeType_Drag , true )--阻力
		SetRoleCampID( FlagDropObj, 7 );	--設定旗子陣營
		AddToPartition(FlagDropObj , RoomID)
		SetPlot( FlagDropObj , "touch" , "Lua_CAPTUREFLAG_DropMagic2" , 50 )
		StoneBuff[RoomID][1] = 0
		--Say(FlagDropObj, "MyCampID = "..GetRoleCampID(FlagDropObj))
		DebugMsg( 0, RoomID ,"StoneBuff[RoomID][1] = 0")
	end
end
function Lua_CAPTUREFLAG_DropMagic()	--掉落在場上旗子的觸碰劇情
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
		CastSpell(OwnerID(), OwnerID(),492899)	--變身攜帶旗子
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
function Lua_CAPTUREFLAG_DropMagic2()	--掉落在場上旗子的觸碰劇情
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
		CastSpell(OwnerID(), OwnerID(),492900)	--變身攜帶旗子
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
			--檢查周圍是否有印記，沒有的話Sleep30秒，生出一個
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
			local BB = rand(100)+1	--下面是各印記出現機率
			local FlagDropObj 
			if BB >= (100 - probability[1]) then
				--創建速度印記
				FlagDropObj = CreateObj( BuffID[1], firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2]) then
				--創建強化印記
				FlagDropObj = CreateObj( BuffID[2] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3]) then
				--創建治療印記
				FlagDropObj = CreateObj( BuffID[3] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
				--創建回復印記
				FlagDropObj = CreateObj( BuffID[4] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then
				--創建攻擊印記
				FlagDropObj = CreateObj( BuffID[5] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then
				--創建魔攻印記
				FlagDropObj = CreateObj( BuffID[6] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then
				--創建防禦印記
				FlagDropObj = CreateObj( BuffID[7] , firstX, firstY, firstZ, firstDir, 1 )
			elseif BB >= (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8]) then
				--創建魔防印記
				FlagDropObj = CreateObj( BuffID[8] , firstX, firstY, firstZ, firstDir, 1 )
			end
			SetModeEx( FlagDropObj, EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( FlagDropObj, EM_SetModeType_Strikback, false )--反擊
			SetModeEx( FlagDropObj, EM_SetModeType_Mark, false )--標記
			SetModeEx( FlagDropObj, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( FlagDropObj, EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( FlagDropObj, EM_SetModeType_Gravity, true )--重力
			SetModeEx( FlagDropObj, EM_SetModeType_Move, false )--移動
			SetModeEx( FlagDropObj, EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( FlagDropObj, EM_SetModeType_Searchenemy, false )--索敵
			AddToPartition(FlagDropObj , RoomID)
		end
		Sleep(10)
	end
end
function Lua_CAPTUREFLAG_ReShowFlag()
	--此劇情為送回旗子後要求符石做的劇情，15秒後將自己顯示出來
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local OwnerOrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID)
	local Count = SetSearchAllNPC(RoomID) -- 搜索區域內的所有NPC ，回傳值為其數量
	local Obj
	if (OwnerOrgID == 112564) then
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
				Obj = Role:New( ID ) -- 等同於 ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = 資料庫內的ID
				if Obj:IsNPC() == true then --IsNPC = 是不是npc
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
		ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_RESHOWSTONE1]", C_SYSTEM )	--[STONE]已經回到場上
	elseif (OwnerOrgID == 112565) then
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
				Obj = Role:New( ID ) -- 等同於 ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = 資料庫內的ID
				if Obj:IsNPC() == true then --IsNPC = 是不是npc
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
		ScriptMessage( OwnerID(), -1, 2, "[SC_CAPTUREFLAG_RESHOWSTONE2]", C_SYSTEM )	--[STONE]已經回到場上
	end
end
function Lua_CAPTUREFLAG_NOHIDE()
	--檢查身上是否攜帶符石，有的話提示玩家不能使用此技能
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
	--iID 傳 -1 先取得清單
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
		if StoneBuff[RoomID][1] == 0 then	--0是顯示狀態1是隱藏狀態
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
		if CheckOK[1] == 0 then --出問題符文不見了
			BeginPlot( FlagSetp1[RoomID],"Lua_CAPTUREFLAG_ReShowFlag", 0 )
		end
		CheckOK[2] = 0
		if StoneBuff[RoomID][2] == 0 then	--0是顯示狀態1是隱藏狀態
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
		if CheckOK[2] == 0 then --出問題符文不見了
			BeginPlot( FlagSetp2[RoomID],"Lua_CAPTUREFLAG_ReShowFlag", 0 )			
		end
		CastSpell(OwnerID(),OwnerID(),493856)
		Sleep(150)
	end
end
function LuaZone_PCall_CAPTUREFLAG_CheckJoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	local Party = LuaFunc_PartyData(iObjID)
	if Party[0] == 1 then
		return 0;	-- 直接加入
	else
		ScriptMessage( iObjID, iObjID, 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		return 1;	-- 不加入
	end	
end