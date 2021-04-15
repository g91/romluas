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
	--產生水晶

	for i=1, 5 do 
		CrystalObj[i] = CreateObjByFlag( 111261 , 780288 , i-1 , 1 ) 
		SetModeEx( CrystalObj[i], EM_SetModeType_Strikback, false )--反擊
		SetModeEx( CrystalObj[i], EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( CrystalObj[i], EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( CrystalObj[i], EM_SetModeType_Mark, true )--標記
		SetModeEx( CrystalObj[i], EM_SetModeType_Move, false )--移動
		SetModeEx( CrystalObj[i], EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( CrystalObj[i], EM_SetModeType_HideName, true )--名稱
		SetModeEx( CrystalObj[i], EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( CrystalObj[i], EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( CrystalObj[i], EM_SetModeType_Drag , true )--阻力
		SetPlot( CrystalObj[i] , "touch" , "Lua_THAIRWIN_StealCrystal" , 50 )
		SetRoleCampID( CrystalObj[i], 2 );					-- 將預設旗子設為怪物
		AddToPartition(CrystalObj[i] , RoomID)
		Debuglog(2 , "Create CrystalObj = "..i.." and RoomID = "..RoomID)
		--設定水晶相關資料
		local pX = ReadRoleValue(CrystalObj[i],EM_RoleValue_X)
		local pY = ReadRoleValue(CrystalObj[i],EM_RoleValue_Y)
		local pZ = ReadRoleValue(CrystalObj[i],EM_RoleValue_Z)
		local pName = "[THAIRWIN_LANDMARK_NAME_" ..i.. "]"
		SetLandMarkInfo( RoomID, i, 57, pX, pY, pZ, pName, 57 );		-- 設定戰場據點資料
		--設定水晶擁有陣營
		WriteRoleValue( CrystalObj[i], EM_RoleValue_PID, i );			--將水晶編號記錄在pid
		SetPlot( CrystalObj[i] , "range" , "Lua_THAIRWIN_CrystalRange" , 250 )
		CrystalOwn[RoomID][i]=0
	end
	--關上門
	for i=1, 2 do 
		GateID[i] = CreateObjByFlag( 114314 , 780192 , i -1, 1 )
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
		BeginPlot( BuffMaker[i],"Lua_THAIRWIN_BronFlag", 0 )
		AddToPartition(BuffMaker[i] , RoomID)
	end
	local Xtime = 0
	--開始倒數
	while 1 do
		if Xtime < 90 then
			if Xtime == 0 then
				LuaZone_THAIRWIN_CheckOK(90,90,1)	--倒數系統
				DebugMsg( 0, RoomID ,"90SCheckOK ="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_90TOSTART]" , C_SYSTEM )	--比賽將在90秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_90TOSTART]" , C_SYSTEM )	--比賽將在90秒後開始
			end
			if math.fmod (Xtime , 5) == 0 then
				LuaZone_THAIRWIN_CheckOK(90,90-Xtime,1)	--倒數系統
			end
			--檢查是否有一方無人
			local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--第一隊總和人數
			local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) 	--第二隊總和人數
			if CountOneTeam == 0 and Xtime >= 80 then
				ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
				EndBattleGround( RoomID, -1 );
				Setp = 2
				break
			elseif CountTwoTeam == 0 and Xtime >= 80 then
				ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
				EndBattleGround( RoomID, -1 );
				Setp = 2
				break
			elseif CountOneTeam == GetMaxTeamMember() and CountTwoTeam == GetMaxTeamMember() and Xtime < 80 then	--人員全部到齊
				Xtime = 80
				LuaZone_THAIRWIN_CheckOK(10,1,1)	--倒數系統
			end
			if Xtime == 30 then
				DebugMsg( 0, RoomID ,"60SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_60TOSTART]" , C_SYSTEM )	--比賽將在60秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_60TOSTART]" , C_SYSTEM )	--比賽將在60秒後開始
			end
			if Xtime == 45 then
				DebugMsg( 0, RoomID ,"45SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_45TOSTART]" , C_SYSTEM )	--比賽將在45秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_45TOSTART]" , C_SYSTEM )	--比賽將在45秒後開始
			end
			if Xtime == 60 then
				DebugMsg( 0, RoomID ,"30SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_30TOSTART]" , C_SYSTEM )	--比賽將在30秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_30TOSTART]" , C_SYSTEM )	--比賽將在30秒後開始
			end
			if Xtime == 75 then
				DebugMsg( 0, RoomID ,"15SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_15TOSTART]" , C_SYSTEM )	--比賽將在15秒後開始
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_15TOSTART]" , C_SYSTEM )	--比賽將在15秒後開始
			end
			if Xtime == 80 then
				LuaZone_THAIRWIN_CheckOK(10,1,0)	--倒數系統
			end
			Sleep(10)
			Xtime = Xtime + 1
		else
			CheckOK = 1
			--倒數結束，刪除門
			for i=1, 2 do
				PlayMotionEX( GateID[i], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
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
		ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
		EndBattleGround( RoomID, -1 );
		Setp = 2
	elseif CountTwoTeam == 0 then
		ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if	(CountOneTeam+CountTwoTeam)<10	 or
		math.abs(CountOneTeam-CountTwoTeam)>1	then
		ScriptMessage( OwnerID(), -1, 2, "[SC_1V1PVP_WILLSHOTDOWN]", 0 )--警告訊息：人數不足，比賽即將結束
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if Setp == 1 then	--戰鬥開始
		local CheckTime2 = 0;
		local WinnerCount = 0
		local FirstTemp = 0
		local SecondTemp = 0
		local GiveScoreTime = 0
		local SetpT = 0
		StandSec  = StandSec or {};
		StandSec[RoomID] = StandSec[RoomID] or 0;
		while 1 do
			--主要迴圈, 檢查有無獲勝者
			if GiveScoreTime >= 5 then
				--檢查水晶塔歸屬，給予積分
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
				--檢查是否有一方無人
				CountOneTeam = GetNumEnterTeamMember(RoomID,1)--第一隊總和人數
				CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --第二隊總和人數
				if CountOneTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , C_SYSTEM )	--對方隊伍離開，比賽結束
					ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
					WinnerCount = WinnerCount + 1
					FirstTemp = 2
				elseif CountTwoTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , C_SYSTEM )	--對方隊伍離開，比賽結束
					ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
					WinnerCount = WinnerCount + 1
					FirstTemp = 1
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
					-- 勝利者已產生, 使用劇情, 將所有有害的 buff 消除, 等待, 
					--CheckBGWinner();
					local WinnerHonor = 100

					--給予獎勵
					if FirstTemp == -1 then
						--平手平分榮譽
						--AddTeamItem( RoomID, １ , 542943 , 1 )	--給獲勝旗標
						AddTeamHonor(RoomID , 1 , WinnerHonor/2)
						--AddTeamItem( RoomID, 2 , 542943 , 1 )	--給獲勝旗標
						AddTeamHonor(RoomID , 2 , WinnerHonor/2)
						EndBattleGround( RoomID, FirstTemp );
					else
						--計算分數比例
						WinnerHonor = WinnerHonor*(GetScore( RoomID, FirstTemp ))/5000
						AddTeamHonor(RoomID , FirstTemp , WinnerHonor)
						--AddTeamItem( RoomID, FirstTemp , 542943 , 1 )	--給獲勝旗標
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
								Lua_PVPAllFull(ID)	--補滿狀態
								AddBuff( ID, 502797, 0, -1)		--設為永久消失狀態，不可攻擊不可被攻擊
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
		ScriptMessage( OwnerID(),  -1, 1, "[SC_SURVIVE_CLOSEGROUND]" , C_SYSTEM )	--比賽已結束，競技場將在兩分鐘後關閉
		ScriptMessage( OwnerID(),  -1, 0, "[SC_SURVIVE_CLOSEGROUND]" , C_SYSTEM )	--比賽已結束，競技場將在兩分鐘後關閉
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
	
	-- 區域重生劇情
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
	-- 重生點列表
	local MatchPoint = {}
	MatchPoint[1] = { 3839, 135, 3837, 322}	--1號水晶
	MatchPoint[2] = { 3245, 326, 4319, 75}	--2號水晶
	MatchPoint[3] = { 4478, 188, 4440, 112}	--3號水晶
	MatchPoint[4] = { 3165, 188, 3201, 291}	--4號水晶
	MatchPoint[5] = { 4430, 326, 3358, 261}	--5號水晶
	
	local RevivePoint = {}
	RevivePoint[1] = { 4823, 200, 4914, 132}	--A方家裡重生點
	RevivePoint[2] = { 3736, 190, 4132, 70}	--A方1號重生點
	RevivePoint[3] = { 3082, 335, 4447, 64}	--2號重生點
	RevivePoint[4] = { 4410, 195, 4346, 147}	--3號重生點 
	RevivePoint[5] = { 3229, 195, 3317, 325}	--4號重生點 
	RevivePoint[6] = { 4556, 330, 3229, 221}	--5號重生點
	RevivePoint[7] = { 2909, 200, 2776, 308}	--B方家裡重生點
	RevivePoint[8] = { 3938, 185, 3524, 248}	--B方1號重生點
	local Dis = 0
	local ChangeXYZ = 0
	--判斷陣營
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
	Lua_PVPAllFull( OwnerID())		--補滿狀態
	StandSec = StandSec or {};
	StandSec[RoomID] = StandSec[RoomID] or 0;
	if	(30-StandSec[RoomID])<10	then
		AddBuff(OwnerID(), 500667, 0 , 10)	--玩家重生無敵10秒
	else
		AddBuff(OwnerID(), 500667, 0 , 30-StandSec[RoomID])--玩家重生無敵統一時間
	end
end

function LuaZone_THAIRWIN_JoinQueue( dbid, isTeam, numTeamPeople )

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
function LuaZone_THAIRWIN_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )


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
				local Dis = Lua_GetDisByXYZ(ID,ReX,ReY,ReZ)	--檢查是否離開座標過遠
				if Dis > 200 then
					SetPos(ID,ReX,ReY,ReZ,ReDir)
				end
				StartClientCountDown ( ID, Time, NowTime, 0, 0, type, "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數10秒
				--AddBuff( ID , 502798 , 0 , 10)			--設為隱身狀態，不可攻擊不可被攻擊（備戰狀態）
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
	--int	GetEnterTeamMemberInfo ( int iRoomID, int iTeamID, int iID  )
	--iID 傳 -1 先取得清單
	--void SetMemberVar( int iRoomID, int iTeamID, int iDBID, int iVarID, int iVar )
	--int GetMemberVar( int iRoomID, int iTeamID, int iDBID, int iVarID )
	--iVarID = 1 - 3
function LuaZone_PCall_THAIRWIN_CheckJoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	local Party = LuaFunc_PartyData(iObjID)
	if Party[0] == 1 then
		return 0;	-- 直接加入
	else
		ScriptMessage( iObjID, iObjID, 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		return 1;	-- 不加入
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
	if  ObjCampID ~= PlayerCampID then	--不同陣營 搶奪劇情
		if Register == 0 and RegisterO == 0 then
			DebugMsg( 0, RoomID ,"TargetID = "..Register)
			DebugMsg( 0, RoomID ,"OwnerID = "..RegisterO)
			AddBuff(OwnerID(),503368,0,1);	--取消隱形
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
						if ( CastBarStatus > 0) then -- 成功
							CastResult = 1;
							EndCastBar( OwnerID(), CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- 失敗
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
					-- 因為相同陣營的話, 不能點物件, 所以直接將物件設成點擊人的陣營即可
						if( PlayerCampID == 8 ) then 
							-- TEAM 1, 紅隊
							-- SetRoleCampID 要在 ChangeObjID 之前, 因為 ChangeObjID 會重新 AddToPartition, 會改變物件之間的關希
							SetRoleCampID( TargetID(), PlayerCampID );
							ChangeObjID( TargetID(), 111264 );	-- TEAM 1 RED
							SetLandMark( RoomID, LandMarkID, 58 );
						else
							-- TEAM 2, 籃隊
							-- SetRoleCampID 要在 ChangeObjID 之前, 因為 ChangeObjID 會重新 AddToPartition, 會改變物件之間的關希
							SetRoleCampID( TargetID(), PlayerCampID );
							ChangeObjID( TargetID(), 111258 );	-- TEAM 2 BLUE
							SetLandMark( RoomID, LandMarkID, 59 );
						end
					-- 加入訊息 XXX 突襲了 XXX

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