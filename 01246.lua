function LuaZone_SURVIVE_Main()
	SetZoneReviveScript( "LuaZone_SURVIVE_Revive" );
	SetZonePVPScript( "LuaZone_SURVIVE_PVPDead" );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	if RoomID~=0 then
		DesignLog(OwnerID(), 701246, "BG 3v3 Begin, Room: "..RoomID);
	end
	local CheckOK = 0
	local GateID = {}
	local Setp = 0
--闽
	for i=1, 2 do 
		GateID[i] = CreateObjByFlag( 112334 , 780288 , i-1 , 1 )
		SetModeEx( GateID[i], EM_SetModeType_Strikback, false )--は阑
		SetModeEx( GateID[i], EM_SetModeType_SearchenemyIgnore, false )--砆穓碝
		SetModeEx( GateID[i], EM_SetModeType_Obstruct, true )--咀
		SetModeEx( GateID[i], EM_SetModeType_Mark, false )--夹癘
		SetModeEx( GateID[i], EM_SetModeType_Move, false )--簿笆
		SetModeEx( GateID[i], EM_SetModeType_Searchenemy, false )--寄
		SetModeEx( GateID[i], EM_SetModeType_HideName, false )--嘿
		SetModeEx( GateID[i], EM_SetModeType_ShowRoleHead, false )--繷钩
		SetModeEx( GateID[i], EM_SetModeType_Fight , false )--炳ю阑
		SetModeEx( GateID[i], EM_SetModeType_Drag , true )--
		SetModeEx( GateID[i], EM_SetModeType_SearchenemyIgnore , true )--ンぃ穦砆穓碝
		AddToPartition(GateID[i] , RoomID)
	end
	local Xtime = 0
--秨﹍计
	while 1 do
		if Xtime < 90 then
			if Xtime == 0 then
				LuaZone_SURVIVE_CheckOK(90,90,1)	--计╰参
				DebugMsg( 0, RoomID ,"90SCheckOK ="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_90TOSTART]" , 0 )	--ゑ辽盢90秨﹍
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_90TOSTART]" , 0 )	--ゑ辽盢90秨﹍
			end
			if Xtime == 5 then
				LuaZone_SURVIVE_CheckOK(90,85,1)	--计╰参
			end
			if Xtime == 10 then
				LuaZone_SURVIVE_CheckOK(90,80,1)	--计╰参
			end
			if Xtime == 15 then
				LuaZone_SURVIVE_CheckOK(90,75,1)	--计╰参
			end
			if Xtime == 20 then
				LuaZone_SURVIVE_CheckOK(90,70,1)	--计╰参
			end
			if Xtime == 25 then
				LuaZone_SURVIVE_CheckOK(90,65,1)	--计╰参
			end
			if Xtime == 30 then
				LuaZone_SURVIVE_CheckOK(90,60,1)	--计╰参
				DebugMsg( 0, RoomID ,"60SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_60TOSTART]" , 0 )	--ゑ辽盢60秨﹍
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_60TOSTART]" , 0 )	--ゑ辽盢60秨﹍
			end
			if Xtime == 35 then
				LuaZone_SURVIVE_CheckOK(90,55,1)	--计╰参
			end
			if Xtime == 40 then
				LuaZone_SURVIVE_CheckOK(90,50,1)	--计╰参
			end
			if Xtime == 45 then
				LuaZone_SURVIVE_CheckOK(90,45,1)	--计╰参
				DebugMsg( 0, RoomID ,"45SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_45TOSTART]" , 0 )	--ゑ辽盢45秨﹍
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_45TOSTART]" , 0 )	--ゑ辽盢45秨﹍
			end
			if Xtime == 50 then
				LuaZone_SURVIVE_CheckOK(90,40,1)	--计╰参
			end
			if Xtime == 55 then
				LuaZone_SURVIVE_CheckOK(90,35,1)	--计╰参
			end
			if Xtime == 60 then
				LuaZone_SURVIVE_CheckOK(90,30,1)	--计╰参
				DebugMsg( 0, RoomID ,"30SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_30TOSTART]" , 0 )	--ゑ辽盢30秨﹍
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_30TOSTART]" , 0 )	--ゑ辽盢30秨﹍
			end
			if Xtime == 65 then
				LuaZone_SURVIVE_CheckOK(90,25,1)	--计╰参
			end
			if Xtime == 70 then
				LuaZone_SURVIVE_CheckOK(90,20,1)	--计╰参
			end
			if Xtime == 75 then
				LuaZone_SURVIVE_CheckOK(90,15,1)	--计╰参
				DebugMsg( 0, RoomID ,"15SCheckOK="..CheckOK.."[RoomID] ="..RoomID)
				ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_15TOSTART]" , 0 )	--ゑ辽盢15秨﹍
				ScriptMessage( OwnerID(),  -1, 0, "[SC_1V1PVP_15TOSTART]" , 0 )	--ゑ辽盢15秨﹍
			end
			if Xtime == 80 then
				LuaZone_SURVIVE_CheckOK(90,10,1)	--计╰参
				LuaZone_SURVIVE_CheckOK(10,1,0)	--计╰参
			end
			if Xtime == 85 then
				LuaZone_SURVIVE_CheckOK(90,5,1)	--计╰参
			end
			Sleep(10)
			Xtime = Xtime + 1
		else
			CheckOK = 1
			--ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_START]" , 0 )	--ゑ刚秨﹍
			--计挡埃
			for i=1, 2 do
				Delobj(GateID[i])
			end
			DebugMsg( 0, RoomID ,"STARTCheckOK="..CheckOK.."[RoomID] ="..RoomID)
			Setp = 1
			break
		end
	end
	--浪琩琌Τよ礚
	local CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--材钉羆㎝计
	local CountTwoTeam = GetNumEnterTeamMember(RoomID,2) 	--材钉羆㎝计
	if CountOneTeam == 0 then
		--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , 0 )	--癸よ钉ヮ瞒秨ゑ辽挡
		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--癸よ钉ヮ瞒秨ゑ辽挡
		EndBattleGround( RoomID, -1 );
		Setp = 2
	elseif CountTwoTeam == 0 then
		--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , 0 )	--癸よ钉ヮ瞒秨ゑ辽挡
		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--癸よ钉ヮ瞒秨ゑ辽挡
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if	(CountOneTeam+CountTwoTeam)<4.8	or
		math.abs(CountOneTeam-CountTwoTeam)>1	then
		ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_WILLSHOTDOWN]" , 0 )	--计ぃìゑ辽盢挡
		EndBattleGround( RoomID, -1 );
		Setp = 2
	end
	if Setp == 1 then	--蛮よ皚犁Τ
		local CheckTime2 = 0;
		local WinnerCount = 0
		local FirstTemp = 0
		local SecondTemp = 0
		local GiveScoreTime = 0
		local SetpT = 0
		-- 璶癹伴, 浪琩Τ礚莉秤
		StandSec  = StandSec or {};
		StandSec[RoomID] = StandSec[RoomID] or 0;
		while 1 do
			if GiveScoreTime >= 15 then
				local T1Score = GetScore(RoomID,1)
				local T2Score = GetScore(RoomID,2)
				SetScore( RoomID, 1, T1Score + 10 )
				SetScore( RoomID, 2, T2Score + 10 )
				GiveScoreTime = 0
			end
			if CheckOK == 1 then
				--DebugMsg( 0, RoomID ,"CheckTime2="..CheckTime2)
				CheckTime2 = CheckTime2 + 1
				GiveScoreTime = GiveScoreTime + 1
				--浪琩琌Τよ礚
				CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--材钉羆㎝计
				CountTwoTeam = GetNumEnterTeamMember(RoomID,2) --材钉羆㎝计
				if CountOneTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , 0 )	--癸よ钉ヮ瞒秨ゑ辽挡
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--癸よ钉ヮ瞒秨ゑ辽挡
					SetScore( RoomID, 2, 2000 )
				elseif CountTwoTeam == 0 then
					--ScriptMessage( OwnerID(),  -1, 1, " out 30s end" , 0 )	--癸よ钉ヮ瞒秨ゑ辽挡
					ScriptMessage( OwnerID(),  -1, 2, "[SC_1V1PVP_EMLEAVEERROR]" , 0 )	--癸よ钉ヮ瞒秨ゑ辽挡
					SetScore( RoomID, 1, 2000 )
				end
				-- 浪琩Τ礚皚犁矛秤
				local TeamName1 = ""
				local TeamName2 = ""
				local WinTeamScore = 0
				local LostTeamScore = 0
				for i=1, 2, 1 do
					if ( GetScore( RoomID, i ) >= 500 ) and ( SetpT == 0 ) then
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
					if ( GetScore( RoomID, i ) >= 1000 ) and ( SetpT == 1 ) then
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
					if ( GetScore( RoomID, i ) >= 1500 ) and ( SetpT == 2 ) then
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
					if ( GetScore( RoomID, i ) >= 1800 ) and ( SetpT == 3 ) then
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
					if( GetScore( RoomID, i ) >= 2000 ) then
						--倒ぉ秤篴臕
						AddTeamHonor(RoomID , i , 100)
						AddTeamItem( RoomID, i , 542941 , 1 )	--倒莉秤篨夹
						--2011/08/10 穝糤篨夹..笆惠―
						for k=1,2 do
							AddTeamItem( RoomID, k , 545620 , 1 )	--倒篨夹
						end
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
					-- 秤玻ネ, ㄏノ粿薄, 盢┮ΤΤ甡 buff 埃, 单, 
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
								Revive( ID, ZoneID , BornX, BornY, BornZ, 0 )
							end
							if Obj:IsPlayer() == true then
								Lua_PVPAllFull(ID)	--干骸篈
								AddBuff( ID, 502797, 0, -1)		--砞ッア篈ぃю阑ぃ砆ю阑
							end
						end	
					end
					--CheckBGWinner();
					EndBattleGround( RoomID, FirstTemp );
					Setp = 2
					DesignLog(OwnerID(), 701246, "BG 3v3 End, Room: "..RoomID);
					break
				end
				-- 浪琩驹初秨﹍丁さ, –だ牧睦癘
				local Flag = 780290		--篨絪腹
				local Count = GetMoveFlagCount(Flag)
				if CheckTime2 == 180 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_1V1PVP_TIMETOOLONG_SIDE]---" , 0 )	--初瞷硉癘
					--承硉癘
					local Side = rand(Count-1)
					local Buff = CreateObjByFlag( 200966, Flag , Side , 1 )
					AddToPartition(Buff, RoomID)
				elseif CheckTime2 == 360 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_1V1PVP_TIMETOOLONG_SIDE]---" , 0 )	--初瞷硉癘
					--承硉癘
					local Side = rand(Count-1)
					local Buff = CreateObjByFlag( 200966, Flag , Side , 1 )
					AddToPartition(Buff, RoomID)
				elseif CheckTime2 == 540 then
					ScriptMessage( OwnerID(),  -1, 2, "---[SC_1V1PVP_TIMETOOLONG_SIDE_1]---" , 0 )	--初瞷眏て癘
					--承眏て癘
					local Side = rand(Count-1)
					local Buff = CreateObjByFlag( 200965, Flag , Side , 1 )
					AddToPartition(Buff, RoomID)
					CheckTime2 = 0
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
		ScriptMessage( OwnerID(),  -1, 2, "[SC_SURVIVE_CLOSEGROUND]" , 0 )	--ゑ辽挡膙м初盢ㄢだ牧闽超
		ScriptMessage( OwnerID(),  -1, 0, "[SC_SURVIVE_CLOSEGROUND]" , 0 )	--ゑ辽挡膙м初盢ㄢだ牧闽超
		Sleep(1200)
		CloseBattleGround(RoomID)
	end
end


function LuaZone_SURVIVE_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )

	local KillerTeamID = GetTeamID( OwnerID() );

	if( KillerTeamID ~= GetTeamID( TargetID() ) ) then
		local 	RoomID 	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		local 	Score 	= GetScore( RoomID, KillerTeamID ) + 100;
		SetScore( RoomID, KillerTeamID, Score );
	end
end

function LuaZone_SURVIVE_Revive()
	
	-- 跋办ネ粿薄
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
	Lua_PVPAllFull( OwnerID())	--干骸篈
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	StandSec = StandSec or {};
	StandSec[RoomID] = StandSec[RoomID] or 0;
	if	(30-StandSec[RoomID])<10	then
		AddBuff(OwnerID(), 500667, 0 , 10)	--產ネ礚寄10
	else
		AddBuff(OwnerID(), 500667, 0 , 30-StandSec[RoomID])--產ネ礚寄参丁
	end
end

function LuaZone_SURVIVE_JoinQueue( dbid, isTeam, numTeamPeople )


	local totalteam 		= GetNumTeam();	-- 眔硂驹初程す砛钉ヮ计秖
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember( i ); --眔

		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end

	return lowestTeamID;	-- 肚赣璶秈ê︻
end
function LuaZone_SURVIVE_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )


	local totalteam 		= GetNumTeam();	-- 眔硂驹初程す砛钉ヮ计秖
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember(LevelGroupID, i ); --眔

		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end

	return lowestTeamID;	-- 肚赣璶秈ê︻
end
function LuaZone_SURVIVE_AssignLevelGroup( dbid, lv, worldid )
	local Group = nil;
	if lv < 30 then
		Group = 1
	else
		Group=math.floor((lv-30)/10)+2
	end
	return Group
end
function LuaZone_SURVIVE_RoleEnterBattleGround( dbid, teamID )
	if( teamID == 1 ) then
		SetBattleGroundObjCampID( dbid, 8 );
		SetBattleGroundObjForceFlagID( dbid, 223091 )
	elseif( teamID == 2 ) then
		SetBattleGroundObjCampID( dbid, 9 );
		SetBattleGroundObjForceFlagID( dbid, 223090 )
	end
end

function LuaZone_SURVIVE_MoveRoleToBattleGround( WorldID, ZoneID, dbid, teamid, roomid )
	local	ReX	= 0;
	local	ReY	= 0;
	local	ReZ	= 0;
	local	ReDir	= 0;
	if( teamID == 1 ) then
		ReX 	= 1171
		ReY	= 95
		ReZ 	= 2600.2
		ReDir	= 90
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	elseif( teamID == 2 ) then
		ReX 	= 1601.9
		ReY	= 95
		ReZ 	= 2170.9
		ReDir	= 272.3
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	end
end

function LuaZone_SURVIVE_CheckOK(Time,NowTime,type)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	local	ReX 	= 1171
	local	ReY	= 95
	local	ReZ 	= 2600.2
	local	ReDir	= 90
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				local tID = GetRoleCampID(ID)
				if( tID == 8 ) then
					ReX 	= 1171
					ReY	= 95
					ReZ 	= 2600.2
					ReDir	= 90
				elseif( tID == 9 ) then
					ReX 	= 1601.9
					ReY	= 95
					ReZ 	= 2170.9
					ReDir	= 272.3
				end
				local Dis = Lua_GetDisByXYZ(ID,ReX,ReY,ReZ)	--浪琩琌瞒秨畒夹筁环
				if Dis > 120 then
					SetPos(ID,ReX,ReY,ReZ,ReDir)
				end
				StartClientCountDown ( ID, Time, NowTime, 0, 1, type, "[SC_1V1PVP_COUNTDOWN]" )	--產Client陪ボ计10
				--AddBuff( ID , 502798 , 0 , 10)			--砞留ō篈ぃю阑ぃ砆ю阑称驹篈
			end
		end	
	end
end
function LuaZone_PCall_SURVIVE_CheckJoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	local Party = LuaFunc_PartyData(iObjID)
	if Party[0] == 1 then
		return 0;	-- 钡
	else
		ScriptMessage( iObjID, iObjID, 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--叫叉瞒钉ヮ厨
		return 1;	-- ぃ
	end	
end