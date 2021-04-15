--==================================
--			區域INI相關 / 系統相關
--==================================
function LuaZone_BG_AA__RoleEnterBattleGround( dbid, teamID )
	if( teamID == 1 ) then
		SetBattleGroundObjCampID( dbid, 8 );
		SetBattleGroundObjForceFlagID( dbid, 223091 )
	elseif( teamID == 2 ) then
		SetBattleGroundObjCampID( dbid, 9 );
		SetBattleGroundObjForceFlagID( dbid, 223090 )
	end
end

function LuaZone_BG_AA_MoveRoleToBattleGround( WorldID, ZoneID, dbid, teamid, roomid )
	local	ReX	= 0;
	local	ReY	= 0;
	local	ReZ	= 0;
	local	ReDir	= 0;
	if( teamID == 1 ) then
		ReX 	= -1688.5
		ReY	= 86
		ReZ 	= -1682.2
		ReDir	= 315
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	elseif( teamID == 2 ) then
		ReX 	= 1686.5
		ReY	= 76.7
		ReZ 	= 1687.8
		ReDir	= 135
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	end
end

function LuaZone_BG_AA_AssignLevelGroup( dbid, lv, worldid )
	local Group = 1
	-- 祕法棋戰適合全等級的玩家，所以不分等級區間
	return Group
end

function LuaZone_BG_AA_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )
--	這個是用來判定當玩家進入戰場之後，要把玩家分配到哪一隊

	local totalteam 		= GetNumTeam();	-- 取得這戰場最多允許的隊伍數量
	local lowestTeamID		= nil;
	local lowestTeamPeopleNumer	= nil;
--	DebugLog( 6, "<BGAA>dbid="..dbid )
	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember(LevelGroupID, i ); --取得隊伍人數
--			DebugLog( 6, "<BGAA>Team="..i )
--			DebugLog( 6, "<BGAA>TeamPeopleNumber="..TeamPeopleNumber )
		if( lowestTeamID == nil ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		elseif( TeamPeopleNumber < lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end
	end
--	DebugLog( 6, "<BGAA>lowestTeamID="..lowestTeamID )
	return lowestTeamID;	-- 傳回該人物要進那個佇列
end

function LuaZone_BG_AA_BackOrgWorld()
--	BG_OrgWorld_LeaveScript	LuaZone_BG_AA_BackOrgWorld
	local Player = OwnerID()
	local TrophyCount = ReadRoleValue( Player, EM_RoleValue_BG_Return_Value+0 )	--讀取先前寫在玩家身上的勝敗獎賞值
	local Reward = ReadRoleValue( Player, EM_RoleValue_DuelistReward )	-- 讀取玩家持有的勇士勳章總量
	DebugMsg(0,0,"Player="..GetName( Player ))
	DebugMsg(0,0,"TrophyCount="..TrophyCount)
	DebugMsg(0,0,"Reward="..Reward)
--	WriteRoleValue( Player, EM_RoleValue_DuelistReward, ( Reward+TrophyCount ) )
	AddSpeicalCoin( Player , 11 , 14 , TrophyCount )	-- 2014.04.29 調整為會回傳 Log 的函式
	ScriptMessage( Player, Player, 3, "[BG_AA_GETTROPHY][$SETVAR1="..TrophyCount.."]", 0 )
end


function BG_AA_BaseGuard_Creat()
	local BaseGuard = OwnerID()
	local Pid = ReadRoleValue(BaseGuard, EM_RoleValue_PID )
	SetRoleCampID(BaseGuard, Pid)
	SetPlot( OwnerID(), "range" , "BG_AA_BaseGuard_plot" , 100 )			-- 範圍劇情
end

function BG_AA_BaseGuard_plot()
	local Player = OwnerID()
	local Guard = TargetID()

	if CheckBuff( Player, 623617 ) == true then
		CancelBuff( Player, 623617 )
	end
end