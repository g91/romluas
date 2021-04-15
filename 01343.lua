function LuaZone_DEFEND_Main()
	SetZoneReviveScript( "LuaZone_DEFEND_Revive" );
	SetZonePVPScript( "LuaZone_DEFEND_PVPDead" );
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	if RoomID~=0 then
		DesignLog(OwnerID(), 701343, "BG-DT Begin, Room: "..RoomID);
	end
	if RoomID == 0 then
		return
	end
	local Ground = LuaZone_DEFEND_Gound()
	local Tower = LuaZone_DEFEND_MadeTower()
	if T1Score == nil then
		T1Score = {}
	end
	if T2Score == nil then
		T2Score = {}
	end
	if T1BaseScore == nil then
		T1BaseScore = {}
	end
	if T2BaseScore == nil then
		T2BaseScore = {}
	end
	if T1Point == nil then
		T1Point = {}
	end
	if T2Point == nil then
		T2Point = {}
	end
	if T1Honor == nil then
		T1Honor = {}
	end
	if T2Honor == nil then
		T2Honor = {}
	end
	T1Score[RoomID] = 10
	T2Score[RoomID] = 10
	T1BaseScore[RoomID] = 10
	T2BaseScore[RoomID] = 10
	T1Point[RoomID] = 100
	T2Point[RoomID] = 100
	T1Honor[RoomID] = 0
	T2Honor[RoomID] = 0
	local TimeCheck = 10
	local TimeAdd = 30
	local Setp = 0
	local BornMonster = LuaFun_BornHideObj(100292)	--�إ����ê���
	local BornMonster1 = LuaFun_BornHideObj(100292)--�إ����ê���
	local Xtime = 0
	SetVar(RoomID, 1 , T1Score[RoomID])
	SetVar(RoomID, 2 , T2Score[RoomID])
	SetScore( RoomID, 1, T1Point[RoomID] )
	SetScore( RoomID, 2, T2Point[RoomID] )
	if Setp == 0 then
		--�ˬd�H��
		LuaZone_DEFEND_CheckOK(65,65,1)	--�˼ƨt��
		--�ˬd�O�_���@��L�H
		While 1 do
			if Xtime < 65 then
				LuaZone_DEFEND_CheckOK(65,65-Xtime,1)
				if Xtime == 55 then
					LuaZone_DEFEND_CheckOK(10,10,0)	
				end
			else
				Setp = 1
				break
			end
			Xtime = Xtime + 1
			Sleep(10)
		end
	end
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
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				AddBuff( ID , 504121 , 0 , -1)	--�[�J�i�l��Ǫ����ޯ�
			end
		end	
	end
	if Setp == 1 then
			local Honor1 = 0
			local Honor2 = 0
		--�}�l�ͩ�
		While 1 do
			StandSec  = StandSec or 0;
			local Obj
			Count = SetSearchAllPlayer(RoomID)
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsPlayer() == True then
						if CheckBuff( ID, 504121) == true then
						else
							AddBuff(ID  , 504121, 0 , -1)
						end
					end
				end	
			end
			--DebugMsg( 0, RoomID ,"T1Honor[RoomID] = "..T1Honor[RoomID].."Honor1 = "..Honor1)
			--DebugMsg( 0, RoomID ,"T2Honor[RoomID] = "..T2Honor[RoomID].."Honor2 = "..Honor2)
			CountOneTeam = GetNumEnterTeamMember(RoomID,1)	--�Ĥ@���`�M�H��
			CountTwoTeam = GetNumEnterTeamMember(RoomID,2) 	--�ĤG���`�M�H��
			if CountOneTeam == 0 then
				--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , C_SYSTEM )	--��趤�����}�A���ɵ���
				ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
				EndBattleGround( RoomID, 2 );
				Setp = 2
				break
			elseif CountTwoTeam == 0 then
				--ScriptMessage( OwnerID(),  -1, 1, " in 30s end" , C_SYSTEM )	--��趤�����}�A���ɵ���
				ScriptMessage( OwnerID(),  -1, 1, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
				EndBattleGround( RoomID, 1 );
				Setp = 2
				break
			end
			local Ponit = T1Point[RoomID]
			local Money = T1Score[RoomID]
			local AddMoney = T1BaseScore[RoomID]
			local Ponit2 = T2Point[RoomID]
			local Money2 = T2Score[RoomID]
			local AddMoney2 = T2BaseScore[RoomID]

			if TimeAdd > 30 then
				--�����ê���Ͱ�¦��
				BeginPlot(BornMonster,"LuaZone_DEFEND_BaseMonsterBorn288",0)
				BeginPlot(BornMonster1,"LuaZone_DEFEND_BaseMonsterBorn192",0)
				Honor1 = Honor1 + 1
				Honor2 = Honor2 + 1
				TimeAdd = 0
				--DebugMsg( 0, RoomID ,"SetVar team1 = "..T1Score[RoomID])
				--DebugMsg( 0, RoomID ,"SetVar team2 = "..T2Score[RoomID])
			end
			if TimeCheck > 10 then
				--�o�~���F
				T1Score[RoomID] = T1Score[RoomID] +  T1BaseScore[RoomID]
				T2Score[RoomID] = T2Score[RoomID] +  T2BaseScore[RoomID]
				SetVar(RoomID, 2 , T1Score[RoomID])
				SetVar(RoomID, 1 , T2Score[RoomID])
				--ScriptMessage( OwnerID(),  -1, 1, "Life = "..Ponit.."    Energy = "..Money.."  Add = "..T1BaseScore[RoomID], C_Red )
				--ScriptMessage( OwnerID(),  -1, 1, "Life = "..Ponit2.."    Energy = "..Money2.."  Add = "..T2BaseScore[RoomID], C_LightBlue )
				TimeCheck = 0
			end
			Sleep(10)
			if	StandSec==30	then
				StandSec = 1;
			else
				StandSec = StandSec + 1
			end
			TimeAdd = TimeAdd + 1
			TimeCheck = TimeCheck + 1
			if Ponit <= 0 then
				local GetHonor = T2Honor[RoomID]/Honor2
				--DebugMsg( 0, RoomID ,"T2GetHonor = "..GetHonor)
				AddTeamHonor(RoomID , 2 , 50*GetHonor)
				EndBattleGround( RoomID, 2 );
				Setp = 2
				DesignLog(OwnerID(), 701343, "BG-DT End, Room: "..RoomID);
				ScriptMessage( OwnerID(),  -1, 2, "[SC_THEWINNER][$SETVAR1=".."[BG_450_TEAM2_NAME]".."]" , C_SYSTEM )
				--ScriptMessage( OwnerID(),  -1, 0, "[SC_THEWINNER][$SETVAR1=".."[BG_450_TEAM2_NAME]".."]" , C_SYSTEM )
				local TempObj = {	102404,102396,102397,102398,102399,102400,
						 	101944,101945,101946,101947,101948,101949,101950,101951,101952,101953,
						 	101954,101955,101956,101957,101958,101959,101960,101961,101962,101963,
						 	101964,101965,101966,101967,101968,101969,101970,101971,101972,101973,
						 	101974,101975,101976,101977,101978,101979,101980,101981,101982,101983,
						 	101984,101985,101986,101987,101988,101989,101990,101991,101992,101993 }
				local CountTempObj = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
				if CountTempObj ~= 0 then
					for i = 1 , CountTempObj , 1 do
						local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
						Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
						if Obj:IsNPC() == true then --IsNPC = �O���Onpc
							for j = 1, table.getn(TempObj) do
								if ReadRoleValue(ID ,EM_RoleValue_OrgID) == TempObj[j]  then
									DelObj(ID)
							end	end
						end
					end	
				end
				Count = SetSearchAllPlayer(RoomID)
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
							CancelBuff_NoEvent(ID, 504121)
						end
					end	
				end
				break
			elseif Ponit2 <= 0 then
				local GetHonor = T1Honor[RoomID]/Honor1
				--DebugMsg( 0, RoomID ,"T1GetHonor = "..GetHonor)
				AddTeamHonor(RoomID , 1 , 50*GetHonor)
				EndBattleGround( RoomID, 1 );
				Setp = 2
				DesignLog(OwnerID(), 701343, "BG-DT End, Room: "..RoomID);
				ScriptMessage( OwnerID(),  -1, 2, "[SC_THEWINNER][$SETVAR1=".."[BG_450_TEAM1_NAME]".."]" , C_SYSTEM )
				--ScriptMessage( OwnerID(),  -1, 0, "[SC_THEWINNER][$SETVAR1=".."[BG_450_TEAM1_NAME]".."]" , C_SYSTEM )
				local TempObj = {	102404,102396,102397,102398,102399,102400,
						 	101944,101945,101946,101947,101948,101949,101950,101951,101952,101953,
						 	101954,101955,101956,101957,101958,101959,101960,101961,101962,101963,
						 	101964,101965,101966,101967,101968,101969,101970,101971,101972,101973,
						 	101974,101975,101976,101977,101978,101979,101980,101981,101982,101983,
						 	101984,101985,101986,101987,101988,101989,101990,101991,101992,101993 }
				local CountTempObj = SetSearchAllNPC(RoomID) -- �j���ϰ줺���Ҧ�NPC �A�^�ǭȬ���ƶq
				if CountTempObj ~= 0 then
					for i = 1 , CountTempObj , 1 do
						local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
						Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
						if Obj:IsNPC() == true then --IsNPC = �O���Onpc
							for j = 1, table.getn(TempObj) do
								if ReadRoleValue(ID ,EM_RoleValue_OrgID) == TempObj[j]  then
									DelObj(ID)
							end	end
						end
					end	
				end
				Count = SetSearchAllPlayer(RoomID)
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
							Revive( ID, 432 , BornX, BornY, BornZ, 0 )
						end
						if Obj:IsPlayer() == true then
							Lua_PVPAllFull(ID)	--�ɺ����A
							AddBuff( ID, 502797, 0, -1)		--�]���ä[�������A�A���i�������i�Q����
							CancelBuff_NoEvent(ID, 504121)
						end
					end	
				end
				break
			end
		end

	end
	if Setp == 2 then
		ScriptMessage( OwnerID(),  -1, 1, "[SC_SURVIVE_CLOSEGROUND]" , C_SYSTEM )	--���ɤw�����A�v�޳��N�b�����������
		ScriptMessage( OwnerID(),  -1, 0, "[SC_SURVIVE_CLOSEGROUND]" , C_SYSTEM )	--���ɤw�����A�v�޳��N�b�����������
		Sleep(1200)
		CloseBattleGround(RoomID)
	end
end


function LuaZone_DEFEND_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )
	local KillerTeamID = GetTeamID( OwnerID() );
	if( KillerTeamID ~= GetTeamID( TargetID() ) ) then
	end
end

function LuaZone_DEFEND_Revive()
	
	-- �ϰ쭫�ͼ@��
	local 	TeamID	= GetTeamID( OwnerID() );
	local	X	= 0;
	local	Y	= 0;
	local	Z	= 0;
	local	Dir	= 0;

	if( TeamID == 2 ) then	
		X 	= 2219.7
		Y	= 40
		Z 	= 909.7
		Dir	= 179.3
	else		
		X 	= 1621.6
		Y	= 40
		Z 	= 909.6
		Dir	= 356.9
	end

	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );
	Lua_PVPAllFull( OwnerID())		--�ɺ����A
	StandSec = StandSec or 0;
	if	(30-StandSec)<10	then
		AddBuff(OwnerID(), 500667, 0 , 10)	--���a���͵L��10��
	else
		AddBuff(OwnerID(), 500667, 0 , 30-StandSec)--���a���͵L�ĲΤ@�ɶ�
	end
end
function LuaZone_DEFEND_JoinQueue( dbid, isTeam, numTeamPeople )


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
function LuaZone_DEFEND_World_JoinQueue( dbid, BattleGroundType, WorldGroupID, LevelGroupID )


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
function LuaZone_DEFEND_AssignLevelGroup( dbid, lv, worldid )
	local Group = nil;
	if lv < 30 then
		Group = 1
	else
		Group=math.floor((lv-30)/10)+2
	end
	return Group
end
function LuaZone_DEFEND_RoleEnterBattleGround( dbid, teamID )
	if( teamID == 2 ) then
		SetBattleGroundObjCampID( dbid, 8 );
		SetBattleGroundObjForceFlagID( dbid, 223090 )
	elseif( teamID == 1 ) then
		SetBattleGroundObjCampID( dbid, 9 );
		SetBattleGroundObjForceFlagID( dbid, 223091 )
	end
end
function LuaZone_DEFEND_ClientLoad( dbid, teamID )
	local GUID = GetGUIDByDBID(dbid)
	AddBuff( GUID , 504121 , 0 , -1)	--�[�J�i�l��Ǫ����ޯ�
	if CheckBuff( GUID, 504121) == true then
		Say( GUID, "NOT GET BUFF")
	end
end
function LuaZone_DEFEND_MoveRoleToBattleGround(WorldID, ZoneID, dbid, teamid, roomid)
	local	ReX	= 0;
	local	ReY	= 0;
	local	ReZ	= 0;
	local	ReDir	= 0;
	if( teamID == 2 ) then
		ReX 	= 2219.7
		ReY	= 40
		ReZ 	= 909.7
		ReDir	= 179.3
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	elseif( teamID == 1 ) then
		ReX 	= 1621.6
		ReY	= 40
		ReZ 	= 909.6
		ReDir	= 356.9
		MoveRoleToBattleGround( WorldID, ZoneID, dbid, roomid, ReX, ReY, ReZ, ReDir );
	end
end

function LuaZone_DEFEND_CheckOK(Time,NowTime,type)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				StartClientCountDown ( ID, Time, NowTime, 0, 1, type, "[SC_1V1PVP_COUNTDOWN]" )	--���aClient��ܭ˼�10��
				AddBuff( ID , 504121 , 0 , -1)	--�[�J�i�l��Ǫ����ޯ�
			end
		end	
	end
end

function LuaZone_DEFEND_Gound()
		local OldX = 2196
		local OldY = 4.2
		local OldZ = 970.5
		local OldDir = 0
		local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
		local Cal = (math.pi/180)*(OldDir) 
		local hindrance = {}
		local CC = 1
		local dis = 0
		local NewX
		local NewY
		local NewZ
		local NewDir
--��
		--hindrance[CC] = CreateObj( 112987, OldX ,OldY ,OldZ ,OldDir+180 , 1 )
		--CC = CC + 1
--�@�h
		dis = 78
		hindrance[CC] = CreateObj( 112592, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir+180 , 1 )
		NewX = OldX- dis*math.cos(Cal)
		NewY = OldY
		NewZ = OldZ +dis*math.sin(Cal)
		CC = CC + 1
		dis = 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
--�G�h
		dis = 118
		hindrance[CC] = CreateObj( 112592, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir+180 , 1 )
		NewX = OldX- dis*math.cos(Cal)
		NewY = OldY
		NewZ = OldZ +dis*math.sin(Cal)
		CC = CC + 1
		dis = 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
--�T�h
		dis = 158
		hindrance[CC] = CreateObj( 112592, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir+180 , 1 )
		NewX = OldX- dis*math.cos(Cal)
		NewY = OldY
		NewZ = OldZ +dis*math.sin(Cal)
		CC = CC + 1
		dis = 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
--�|�h
		dis = 198
		hindrance[CC] = CreateObj( 112592, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir+180 , 1 )
		NewX = OldX- dis*math.cos(Cal)
		NewY = OldY
		NewZ = OldZ +dis*math.sin(Cal)
		CC = CC + 1
		dis = 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
		CC = CC + 1

--���h
		dis = 352
		hindrance[CC] = CreateObj( 112592, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
		NewX = OldX- dis*math.cos(Cal)
		NewY = OldY
		NewZ = OldZ +dis*math.sin(Cal)
		CC = CC + 1
		dis = 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
--�C�h
		dis = 392
		hindrance[CC] = CreateObj( 112592, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
		NewX = OldX- dis*math.cos(Cal)
		NewY = OldY
		NewZ = OldZ +dis*math.sin(Cal)
		CC = CC + 1
		dis = 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
--�K�h
		dis = 432
		hindrance[CC] = CreateObj( 112592, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
		NewX = OldX- dis*math.cos(Cal)
		NewY = OldY
		NewZ = OldZ +dis*math.sin(Cal)
		CC = CC + 1
		dis = 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
--�E�h
		dis = 472
		hindrance[CC] = CreateObj( 112592, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
		NewX = OldX- dis*math.cos(Cal)
		NewY = OldY
		NewZ = OldZ +dis*math.sin(Cal)
		CC = CC + 1
		dis = 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		hindrance[CC] = CreateObj( 112592, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
		dis = dis + 25
		hindrance[CC] = CreateObj( 112592, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
		CC = CC + 1
--��
		--dis = 550
		--hindrance[CC] = CreateObj( 112988, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
		for i=1,table.getn(hindrance) do
			local hindranceOrgID = ReadRoleValue( hindrance[i] , EM_RoleValue_OrgID)
			SetModeEx( hindrance[i], EM_SetModeType_Fight, false )--�i�������
			SetModeEx(  hindrance[i], EM_SetModeType_Strikback, false )--����
			SetModeEx(  hindrance[i], EM_SetModeType_Mark, false )--�аO
			SetModeEx(  hindrance[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx(  hindrance[i], EM_SetModeType_Obstruct, true )--����
			SetModeEx(  hindrance[i], EM_SetModeType_Drag , true )--���O
			SetModeEx(  hindrance[i], EM_SetModeType_Gravity, false )--���O
			SetModeEx(  hindrance[i], EM_SetModeType_Move, false )--����
			SetModeEx(  hindrance[i], EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx(  hindrance[i], EM_SetModeType_Searchenemy, false )--����
			AddToPartition( hindrance[i] ,  RoomID  )
			NewX = ReadRoleValue(  hindrance[i] , EM_RoleValue_X )
			NewY = ReadRoleValue(  hindrance[i] , EM_RoleValue_Y )
			NewZ = ReadRoleValue(  hindrance[i] , EM_RoleValue_Z )
			NewDir = ReadRoleValue(  hindrance[i] , EM_RoleValue_Dir )
			--Yell(hindrance[i],"i	=	"..i.."	NewX	=	"..NewX.."	NewY	=	"..NewY.."	NewZ	=	"..NewZ.."	NewDir	=	"..NewDir,5)
		end
end
function LuaZone_DEFEND_MadeTower()
--���ͺX�l
	local BuidID = 112759
	local OldX = 2196
	local OldY = 4.2
	local OldZ = 970.5
	local OldDir = 0
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Cal = (math.pi/180)*(OldDir) 
	local hindrance = {}
	local CC = 1
	local dis = 0
	local NewX
	local NewY
	local NewZ
	local NewDir
--��
	hindrance[CC] = CreateObj( 112987, OldX ,OldY ,OldZ ,OldDir+180 , 1 )
	CC = CC + 1
--�@�h
	dis = 78
	hindrance[CC] = CreateObj( BuidID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir+180 , 1 )
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	CC = CC + 1
	dis = 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
--�G�h
	dis = 118
	hindrance[CC] = CreateObj( BuidID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir+180 , 1 )
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	CC = CC + 1
	dis = 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
--�T�h
	dis = 158
	hindrance[CC] = CreateObj( BuidID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir+180 , 1 )
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	CC = CC + 1
	dis = 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
--�|�h
	dis = 198
	hindrance[CC] = CreateObj( BuidID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir+180 , 1 )
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	CC = CC + 1
	dis = 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+180 , 1 )
	CC = CC + 1
--������
	dis = 240
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	dis = 60
	hindrance[CC] = CreateObj( 112989, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+45 , 1 )
	CC = CC + 1

--������
	dis = 310
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	dis = 60
	hindrance[CC] = CreateObj( 112989, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir+45 , 1  )
	CC = CC + 1

--���h
	dis = 352
	hindrance[CC] = CreateObj( BuidID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	CC = CC + 1
	dis = 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
--�C�h
	dis = 392
	hindrance[CC] = CreateObj( BuidID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	CC = CC + 1
	dis = 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
--�K�h
	dis = 432
	hindrance[CC] = CreateObj( BuidID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	CC = CC + 1
	dis = 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
--�E�h
	dis = 472
	hindrance[CC] = CreateObj( BuidID, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
	NewX = OldX- dis*math.cos(Cal)
	NewY = OldY
	NewZ = OldZ +dis*math.sin(Cal)
	CC = CC + 1
	dis = 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	hindrance[CC] = CreateObj( BuidID, NewX-dis*math.sin(Cal) ,NewY ,NewZ -dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
	dis = dis + 25
	hindrance[CC] = CreateObj( BuidID, NewX+dis*math.sin(Cal) ,NewY ,NewZ +dis*math.cos(Cal),OldDir , 1 )
	CC = CC + 1
--��
	dis = 550
	hindrance[CC] = CreateObj( 112988, OldX- dis*math.cos(Cal),OldY ,OldZ +dis*math.sin(Cal),OldDir , 1 )
	for i=1,table.getn(hindrance) do
		local hindranceOrgID = ReadRoleValue( hindrance[i] , EM_RoleValue_OrgID)
		SetModeEx( hindrance[i], EM_SetModeType_Fight, false )--�i�������
		SetModeEx(  hindrance[i], EM_SetModeType_Strikback, false )--����
		SetModeEx(  hindrance[i], EM_SetModeType_Mark, true )--�аO
		SetModeEx(  hindrance[i], EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx(  hindrance[i], EM_SetModeType_Obstruct, false )--����
		if hindranceOrgID == 112988 or hindranceOrgID == 112987 or hindranceOrgID == 112989 then
			SetModeEx(  hindrance[i], EM_SetModeType_Obstruct, true )--����	
		else
			SetModeEx(  hindrance[i], EM_SetModeType_Obstruct, false )--����			
		end		
		SetModeEx(  hindrance[i], EM_SetModeType_Drag , true )--���O
		SetModeEx(  hindrance[i], EM_SetModeType_Gravity, true )--���O
		SetModeEx(  hindrance[i], EM_SetModeType_Move, false )--����
		SetModeEx(  hindrance[i], EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx(  hindrance[i], EM_SetModeType_Searchenemy, false )--����
		AddToPartition( hindrance[i] ,  RoomID  )
		NewX = ReadRoleValue(  hindrance[i] , EM_RoleValue_X )
		NewY = ReadRoleValue(  hindrance[i] , EM_RoleValue_Y )
		NewZ = ReadRoleValue(  hindrance[i] , EM_RoleValue_Z )
		NewDir = ReadRoleValue(  hindrance[i] , EM_RoleValue_Dir )
		--Yell(hindrance[i],"i	=	"..i.."	NewX	=	"..NewX.."	NewY	=	"..NewY.."	NewZ	=	"..NewZ.."	NewDir	=	"..NewDir,5)

		if hindranceOrgID == BuidID then
			if i <= 25 then
				SetRoleCampID( hindrance[i], 8 );	--�]�w�X�l�}��
			elseif i > 26 then
				SetRoleCampID( hindrance[i], 9 );	--�]�w�X�l�}��
			end
			--SetPlot(hindrance[i],"touch","LuaZone_DEFEND_Upgrade",30)
		end
	end
	return hindrance
end
function LuaFun_BornHideObj(MonsterID)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local OldX = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_X )
	local OldY = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Y )
	local OldZ = ReadRoleValueFloat(  OwnerID() , EM_RoleValue_Z )
	local BornObj = CreateObj( MonsterID, OldX ,OldY ,OldZ ,0 , 1 )
	SetModeEx( BornObj, EM_SetModeType_Fight, false )--�i�������
	SetModeEx(  BornObj, EM_SetModeType_Strikback, false )--����
	SetModeEx(  BornObj, EM_SetModeType_Mark, false )--�аO
	SetModeEx(  BornObj, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx(  BornObj, EM_SetModeType_Obstruct, false )--����
	SetModeEx(  BornObj, EM_SetModeType_Drag , false )--���O
	SetModeEx(  BornObj, EM_SetModeType_Gravity, false )--���O
	SetModeEx(  BornObj, EM_SetModeType_Move, false )--����
	SetModeEx(  BornObj, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx(  BornObj, EM_SetModeType_Searchenemy, false )--����
	SetModeEx(  BornObj, EM_SetModeType_Show, false )--���
	AddToPartition( BornObj ,  RoomID  )
	return BornObj
end
function LuaZone_PCall_DEFEND_CheckJoinBattleGround( iObjID, iBattleGroundID, iPartyID, iSrvID )
	local Party = LuaFunc_PartyData(iObjID)
	if Party[0] == 1 then
		return 0;	-- �����[�J
	else
		ScriptMessage( iObjID, iObjID, 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		return 1;	-- ���[�J
	end	
end