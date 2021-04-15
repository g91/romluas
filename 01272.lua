function LuaZone_1v1PVP_1_Main()
	SetZoneReviveScript( "LuaZone_1v1PVP_Revive" );
	SetZonePVPScript( "LuaZone_1v1PVP_PVPDead" );
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local CheckOK = 0
	local GateID = {}
	for i=1, 2 do 
		GateID[i] = CreateObjByFlag( 112334 , 780288 , i-1 , 1 )
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
		SetModeEx( GateID[i], EM_SetModeType_SearchenemyIgnore , true )--此物件不會被搜尋到
		AddToPartition(GateID[i] , RoomID)
	end
	-- 檢查人數都滿了才開始倒數
	local CheckTime = 0;
	local Setp = 0
	while 1 do
		local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--第一隊總和人數
		local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --第二隊總和人數
		if (CountOneTeam + CountTwoTeam) == 2 then
			Setp = 1
			break
		elseif (CountOneTeam + CountTwoTeam) == 1 then
			if CheckTime >= 60 then
				--檢查人數不足的話結束戰場
				if CountOneTeam == 0 or CountTwoTeam == 0 then
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_COUNTERROR]" , 0 )	--對手未進入，比賽結束
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
						--ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_WAITEM]" , 0 )	--等待對手進入競技場
						Lua_PVPAllFull(ID)	--補滿狀態
					end
				end		
			end
		end
		CheckTime = CheckTime + 1
		Sleep(10)
	end
	if Setp == 1 then	--人數達到要求
		LuaZone_1v1PVP_CheckOK(30,30,1)	--倒數系統
		local Xtime = 0
		local CheckTime2 = 0;
		local WinnerCount = 0
		local FirstTemp = 0
		local SecondTemp = 0
		-- 主要迴圈, 檢查有無獲勝者
		while 1 do
			DebugMsg( 0, RoomID ,"CheckOK ="..CheckOK.."[RoomID] ="..RoomID)
			if CheckOK == 0 then
				if Xtime < 30 then
					if Xtime == 0 then
						DebugMsg( 0, RoomID ,"30SCheckOK="..CheckOK)
						ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_30TOSTART]" , 0 )	--比賽將在30秒後開始
						ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_30TOSTART]" , 0 )	--比賽將在30秒後開始
					end
					if Xtime == 5 then
					LuaZone_1v1PVP_CheckOK(25,25,1)
					end
					if Xtime == 10 then
					LuaZone_1v1PVP_CheckOK(20,20,1)
					end
					if Xtime == 15 then
						DebugMsg( 0, RoomID ,"15SCheckOK="..CheckOK)
						ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_15TOSTART]" , 0 )	--比賽將在15秒後開始
						ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_15TOSTART]" , 0 )	--比賽將在15秒後開始
						LuaZone_1v1PVP_CheckOK(15,15,1)
					end
					if Xtime == 20 then
					LuaZone_1v1PVP_CheckOK(10,10,1)
					LuaZone_1v1PVP_CheckOK(10,1,0)
					end
					if Xtime == 25 then
					LuaZone_1v1PVP_CheckOK(5,5,1)
					end
					--檢查是否有一方無人
					local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--第一隊總和人數
					local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --第二隊總和人數
					if CountOneTeam == 0 then
						--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , 0 )	--對方隊伍離開，比賽結束
						ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--對方隊伍離開，比賽結束
						EndBattleGround( RoomID, -1 );
						Setp = 2
						break
					elseif CountTwoTeam == 0 then
						--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , 0 )	--對方隊伍離開，比賽結束
						ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--對方隊伍離開，比賽結束
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
							--ScriptMessage( ID, ID, 2, "[SC_1V1PVP_WAITEM]" , 0 )	--等待對手進入戰場
							Lua_PVPAllFull(ID)	--補滿狀態
						end
					end
					Xtime = Xtime + 1	
					--DebugMsg( 0, RoomID ,"Xtime="..Xtime)
				else
					CheckOK = 1
					--ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_START]" , 0 )	--比試開始
					--倒數結束，刪除門
					for i=1, 2 do
						Delobj(GateID[i])
					end
					DebugMsg( 0, RoomID ,"STARTCheckOK=DOORDEL")
				end
			elseif CheckOK == 1 then
				--DebugMsg( 0, RoomID ,"CheckTime2="..CheckTime2)
				CheckTime2 = CheckTime2 + 1;
				--檢查是否有一方無人
				local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--第一隊總和人數
				local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --第二隊總和人數
				if CountOneTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , 0 )	--對方隊伍離開，比賽結束
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--對方隊伍離開，比賽結束
					SetScore( RoomID, 2, 1 )
				elseif CountTwoTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , 0 )	--對方隊伍離開，比賽結束
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--對方隊伍離開，比賽結束
					SetScore( RoomID, 1, 1 )
				end
				-- 檢查有無陣營穫勝
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
					-- 勝利者已產生, 使用劇情, 將所有有害的 buff 消除, 等待, 
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
								Lua_PVPAllFull(ID)	--補滿狀態
								AddBuff( ID, 502797, 0, -1)		--設為永久消失狀態，不可攻擊不可被攻擊
							end
						end	
					end
					--將積分加入玩家資料
					--iIndex : 1=參加次數 2=積分 3=本週勝場 4=本週敗場 5=月勝場 6=月敗場 7=個人勝場 8=個人敗場
					local WinTeamScore = GetArenaScore( RoomID, FirstTemp, 1, 2)		--取得目前積分
					local LoseTeamScore = GetArenaScore( RoomID, SecondTemp, 1, 2)		--取得目前積分
					local WinScore,LoseScore = CountPVPScore( WinTeamScore, LoseTeamScore )	--計算獲得（減去）積分
					--local WinTeamJoin = GetArenaScore( RoomID, FirstTemp, 1, 1)		--取得參加次數
					--local LoseTeamJoin = GetArenaScore( RoomID, SecondTemp, 1, 1)		--取得參加次數
					local WinTeamWeekWin = GetArenaScore( RoomID, FirstTemp, 1, 3)		--取得本週勝場
					local LoseTeamWeekLose = GetArenaScore( RoomID, SecondTemp, 1, 4)	--取得本週敗場
					--local WinTeamMonthWin = GetArenaScore( RoomID, FirstTemp, 1, 5)	--取得月勝場
					--local LoseTeamMonthLose = GetArenaScore( RoomID, SecondTemp, 1, 6)	--取得月敗場
					--local WinTeamAllWin = GetArenaScore( RoomID, FirstTemp, 1, 7)		--取得個人勝場
					--local LoseTeamAllLose = GetArenaScore( RoomID, SecondTemp, 1, 8)	--取得個人敗場
					--SetArenaScore( RoomID, FirstTemp, 1, 1, WinTeamJoin + 1)		--寫入參加次數
					SetArenaScore( RoomID, FirstTemp, 1, 2, WinTeamScore + WinScore)	--寫入積分
					SetArenaScore( RoomID, FirstTemp, 1, 3, WinTeamWeekWin + 1)		--寫入本週勝場
					--SetArenaScore( RoomID, FirstTemp, 1, 5, WinTeamMonthWin + 1)		--寫入月勝場
					--SetArenaScore( RoomID, FirstTemp, 1, 7, WinTeamAllWin + 1)		--寫入個人勝場 
					--SetArenaScore( RoomID, SecondTemp, 1, 1, LoseTeamJoin + 1)		--寫入參加次數
					SetArenaScore( RoomID, SecondTemp, 1, 2, LoseTeamScore - LoseScore)	--寫入積分
					SetArenaScore( RoomID, SecondTemp, 1, 4, LoseTeamWeekLose + 1)		--寫入本週敗場
					--SetArenaScore( RoomID, SecondTemp, 1, 6, LoseTeamMonthLose + 1)	--寫入月敗場 
					--SetArenaScore( RoomID, SecondTemp, 1, 8, LoseTeamAllLose + 1)		--寫入個人敗場

					--CheckBGWinner();
					EndBattleGround( RoomID, FirstTemp );
					Setp = 2
					break
				end
				-- 檢查戰場開始時間至今已多久, 每三分鐘釋放印記
				local Flag = 780290		--旗子編號
				local Count = GetMoveFlagCount(Flag)
				if CheckTime2 == 180 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_1V1PVP_TIMETOOLONG_SIDE]---" , 0 )	--場上出現速度印記
					--創建速度印記
					local Side = rand(Count-1)
					local Buff = CreateObjByFlag( 200966, Flag , Side , 1 )
					AddToPartition(Buff, RoomID)
					Debuglog(2 , "Create Mark 1 MarkID = "..Buff.." and RoomID = "..RoomID)
				elseif CheckTime2 == 360 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_1V1PVP_TIMETOOLONG_SIDE]---" , 0 )	--場上出現速度印記
					--創建速度印記
					local Side = rand(Count-1)
					local Buff = CreateObjByFlag( 200966, Flag , Side , 1 )
					AddToPartition(Buff, RoomID)
					Debuglog(2 , "Create Mark 2 MarkID = "..Buff.." and RoomID = "..RoomID)
				elseif CheckTime2 == 540 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_1V1PVP_TIMETOOLONG_SIDE_1]---" , 0 )	--場上出現強化印記
					--創建強化印記
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
		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_CLOSEGROUND]" , 0 )	--比賽已結束，競技場將在兩分鐘後關閉
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
		GiveBodyItem( KillerID ,  203988  , 1 ) --給禮物
		GiveBodyItem( DeadID ,  203988  , 1 ) --給禮物
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
	
	-- 區域重生劇情
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
	AddBuff(OwnerID(), 502797, 0, -1)		--設為永久消失狀態，不可攻擊不可被攻擊
end

function LuaZone_1v1PVP_1_JoinQueue( dbid, isTeam, numTeamPeople )

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
				StartClientCountDown ( ID, time, 0, 0, 0, type, String )	--玩家Client顯示倒數10秒
				--StartClientCountDown( ID ,30,0,0)				--玩家Client顯示倒數10秒
				--AddBuff( ID , 502798 , 0 , 30)					--設為隱身狀態，不可攻擊不可被攻擊（備戰狀態）
			end
		end	
	end
end
