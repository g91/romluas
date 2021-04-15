--? zone 193 0 2491.1 -0.3 -2374.1

function LuaZone_worldBattle01_RoleEnterBattleGround( dbid, teamID )
	--do nothing
end

function LuaZone_worldBattle01_MoveRoleToBattleGround( WorldID, ZoneID, dbid, teamid, roomid )
	local	ReX	= 2363.6
	local	ReY	= -3
	local	ReZ	= -2350.7
	local	ReDir	= 190
	MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir )
end

function LuaZone_worldBattle01_AssignLevelGroup( dbid, lv, worldid )
	return 1
end

function LuaZone_worldBattle01_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )
	return 1
end

function LuaZone_worldBattle01_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )
	return 1
end

function  LuaZone_worldBattle01_Revive()
--SetZoneReviveScript( "LuaZone_worldBattle01_Revive" )
-- �ϰ쭫�ͼ@��
	local	X 	= 2491.1
	local	Y	= -0.3
	local	Z 	= -2374.1
	local	Dir	= 356.8
	local Player = OwnerID()
	--SetPos(Player , X,Y,Z,Dir)
	WriteRoleValue( Player, EM_RoleValue_X, X )
	WriteRoleValue( Player, EM_RoleValue_Y, Y )
	WriteRoleValue( Player, EM_RoleValue_Z, Z )
	WriteRoleValue( Player, EM_RoleValue_Dir, Dir )
	--Lua_PVPAllFull( Player )		--�ɺ����A
	--AddBuff( Player, 500667, 0 , 10)	--���a���͵L��10��
end

function LuaZone_worldBattle01_CheckJoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	
end

function LuaZone_wb01_ExitInit()
	SetPlot( OwnerID() , "Collision" , "LuaZone_wb01_ExitPortal" , 50 )
end

function LuaZone_wb01_EnterInit()
	SetPlot( OwnerID() , "Collision" , "LuaZone_wb01_EnterPortal" , 0 )
end

function LuaZone_wb01_ExitPortal()
	local oid = OwnerID()--���a
	local tid = TargetID()--�ǰe��
	LeaveBattleGround( oid )
	ScriptMessage(tid,oid,0,"[SC_WB01_LEAVE]", C_YELLOW )
--[[
	--��Sever���a�˼�10�����}�Գ�
	local Player = oid
	local timer=0
	local RoomID = ReadRoleValue(tid,EM_RoleValue_RoomID)
	local count=SetSearchAllPlayer( RoomID )
	while 1 do
		ScriptMessage(tid,-2,1, 10-timer.."!!", C_YELLOW )
		if timer==10 then
			ScriptMessage(tid,-2,1, "time's up!!", C_YELLOW )
			for i=1 ,count do
				Player = GetSearchResult()
				ScriptMessage(tid,Player,0,"[SC_WB01_LEAVE]", C_YELLOW )
				Sleep(1)
				LeaveBattleGround( Player )
			end
			break
		end
		Sleep(10)
		timer=timer+1
	end
]]--
end

function LuaZone_wb01_EnterPortal()
	local oid = OwnerID()--���a
	local tid = TargetID()--�ǰe��
	local X,Y,Z,Dir = kg_GetRangePos( tid , nil , 50 , 0 , -2)	--���o�ǰe���e��50�X��m�A�åB�I��ǰe��
	SetPos( oid , X,Y,Z,Dir )
	if ReadRoleValue(oid,EM_RoleValue_LV)>=30 then
		if GetPartyID( oid , -1 ) == 0 then	--���
			--AddBuff( oid ,508560,0,1 )--���i����1����
			--JoinBattleGround( oid , 0, -1, 190 )
			
			--local CurrentZone = GetWorldVar("LuaZone_wb01_CurrentZone")--�ثe�n�h��Zone
			local CurrentZone = LuaZone_wb01_ZoneFilter()
			if CurrentZone>0 then
				DebugMsg(0,0,oid.." SingleJoin "..CurrentZone)
				ScriptMessage(oid,oid,0,"[SC_WB01_SINGLE_JOIN]", C_YELLOW )--�A�w�[�J�F�@�ɾԳ�
				JoinBattleGround( oid , 0, -1, CurrentZone )
			else
				ScriptMessage(oid,oid,0,"[SC_WB01_SEVERFULL]" , C_YELLOW )
			end
			--LuaZone_wb01_EnterPortalCount(CurrentZone )
			--�T�w���
		elseif GetPartyID( oid , -1 ) ~= 0 then	--�α�
			if oid==GetPartyID( oid , 1 ) then --�����T�{
				--AddBuff( oid ,508560,0,1 )--���i����1����
				--JoinBattleGroundWithTeam( oid , 190 )
				DebugMsg(0,0,"MemberCount="..GetPartyID( oid , -1 ) )
				--local CurrentZone = GetWorldVar("LuaZone_wb01_CurrentZone")--�ثe�n�h��Zone
				local CurrentZone = LuaZone_wb01_ZoneFilter( GetPartyID( oid , -1 ) )
				if CurrentZone>0 then
					DebugMsg(0,0,oid.." TeamJoin"..CurrentZone)
					ScriptMessage(oid,oid,0,"[SC_WB01_TEAM_JOIN]", C_YELLOW )--�A������w�[�J�F�@�ɾԳ�
			 		JoinBattleGroundWithTeam( oid , CurrentZone )
			 	else
					ScriptMessage(oid,oid,0,"[SC_WB01_SEVERFULL]" , C_YELLOW )
			 	end
				--LuaZone_wb01_EnterPortalCount( CurrentZone , GetPartyID( oid , -1 ) )
				--�T�w�α�
			else
				ScriptMessage(oid,oid,0,"[SC_WB01_MEMBER_JOIN]", C_YELLOW )
				--�D����
			end
		end
		--DebugMsg(0,0,"JoinBattleGround!")
	else
		ScriptMessage(oid,oid,1,"[SAY_110990_5][$SETVAR1="..GetName(oid).."]" , 0 )
		--[$VAR1]�A�z�����Ť���
	end
end

function LuaZone_wb01_ZoneFilter( MemberCount )
	MemberCount = MemberCount or 1
	local ZoneID = 190;
	local ZoneNum = 5;--���y�ƶq
	local ZoneInfo = {};
	local PlayerMaxNum = 180--GameObjInfo_Int(750190,"PlayRoomCount")*GameObjInfo_Int(750190,"RoomPlayerCount")--�h��*�C�h�H��
	local ZonePlayerCount = 0; local ZoneTickCount = 0;
	local PlayerCountString = "LuaZone_wb01_PlayerCount_"..ZoneID;
	local TickCountString = "LuaZone_wb01_TickCount_"..ZoneID;
	for i =0 , ZoneNum-1 do
		ZoneID = 190 + 1000*i;
		PlayerCountString = "LuaZone_wb01_PlayerCount_"..ZoneID;
		TickCountString = "LuaZone_wb01_TickCount_"..ZoneID;
		ZonePlayerCount = GetWorldVar( PlayerCountString );
		ZoneTickCount = GetWorldVar( TickCountString );
		if ZoneTickCount~=0 then
			if GetSystime(0)-ZoneTickCount > 120 then--�ɶ��t�W�L120��Y���Ӧ��A�����I
				DebugMsg(0,0,ZoneID.." Error!!!")
				Debuglog(2,ZoneID.." Error!!!")
				SetWorldVar( TickCountString,0 )
			else
				DebugMsg(0,0,ZoneID.."_PlayerCount= "..ZonePlayerCount.." ,MemberCount="..MemberCount.." , SeverMax="..PlayerMaxNum)
				if (ZonePlayerCount+MemberCount) <= PlayerMaxNum then
					return ZoneID
				else
					table.insert(ZoneInfo,ZoneID)
				end
			end
		end
	end
	
	local ZoneCount = table.getn(ZoneInfo);
	DebugMsg(0,0,"ZoneCount= "..ZoneCount )
	if ZoneCount>0 then
		return ZoneInfo[kg_Rand(ZoneCount)]
	end
	return 0
end

--[[
function LuaZone_wb01_EnterPortalCount( CurrentZone , MemberCount )
	MemberCount = MemberCount or 1
	local JoinMax = 24
	local JoinCount = GetWorldVar("LuaZone_wb01_JoinCount")--�i�J�p��
	JoinCount = JoinCount +MemberCount
	if JoinCount>JoinMax then
		JoinCount = JoinCount-JoinMax
		SetWorldVar("LuaZone_wb01_JoinCount", JoinCount )
		CurrentZone = CurrentZone+1
		if CurrentZone>1 then CurrentZone=0 end
		SetWorldVar("LuaZone_wb01_CurrentZone", CurrentZone )
	else
		SetWorldVar("LuaZone_wb01_JoinCount", JoinCount )
	end
	DebugMsg(0,0,"wb01_JoinCount = "..JoinCount )
	DebugMsg(0,0,"wb01_NextZone = "..CurrentZone )
	--return CurrentZone
end
]]--
function LuaZone_wb01_CounterInit()
	local Ctrl = CreateObj(117201 ,2363,-2,-2351,-190,1)
	kg_InvisibleObjInit(Ctrl)
	AddToPartition(Ctrl,0)
	BeginPlot(Ctrl,"LuaZone_wb01_PlayerCounter",0)
end

function LuaZone_wb01_PlayerCounter()--���a�p�ƾ�
	local Ctrl = OwnerID();
	local ZoneID = GetIniValueSetting("ZoneID")
	local PlayerCount=0;TickCount=0;
	local PlayerCountString = "LuaZone_wb01_PlayerCount_"..ZoneID
	local TickCountString = "LuaZone_wb01_TickCount_"..ZoneID
	while 1 do
		DebugMsg(0,0,"CurrentZoneID="..ZoneID)
		PlayerCount=GetNumPlayer();
		TickCount = GetSystime(0);
		SetWorldVar(PlayerCountString,PlayerCount )
		SetWorldVar(TickCountString,TickCount )
		DebugMsg(0,0,PlayerCountString.." ,var="..GetWorldVar(PlayerCountString) )
		DebugMsg(0,0,"PlayerCount="..PlayerCount.." ,TickCount="..TickCount )
		Sleep(300);
	end
end

function LuaZone_wb01_PrintSeverInfo()
	local ZoneID = 190;
	for i=0,4 do
		ZoneID = 190+1000*i;
		DebugMsg(0,0,"--------------------------")
		DebugMsg(0,0,"ZoneID="..ZoneID)
		DebugMsg(0,0, GetWorldVar("LuaZone_wb01_PlayerCount_"..ZoneID) )
		DebugMsg(0,0,GetWorldVar("LuaZone_wb01_TickCount_"..ZoneID))
	end
end