function LuaInit_BG_110748()

	SetCrystalID( OwnerID(), 450 ); 	
	SetPlot( OwnerID() , "Touch" , "LuaTouch_BG_110748" , 50 );
end

function LuaTouch_BG_110748()

	-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
	-- OpenGuildWarBid( OwnerID(), TargetID() );	

	SendBGInfoToClient( 450, OwnerID() );
	-- RunningMsg( OwnerID() , 2 , "<CN>TEST</CN>" );
	
end


function Lua_BG_111258_Init()

	SetPlot( OwnerID() , "Touch" , "Lua_BG_111258_Touch" , 60 );
	--SetRoleCamp( OwnerID(), "Monster" );

end

function Lua_BG450_Touch_Tower()

	local 	ObjID  		= 0;
	local 	CastResult	= 0;
	local	RoomID		= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local	LandMarkID	= ReadRoleValue( TargetID(), EM_RoleValue_PID );
	local	PlayerCampID	= GetRoleCampID( OwnerID() );

	BeginCastBar( OwnerID(), GetName( TargetID() ) , 150 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 );

	if( PlayerCampID == 8 ) then

		local PlayerName 	= GetName( OwnerID() );
		local FullKey 		= "[BG_450_MSG_ATTACKFLAG]" .. "[$SETVAR1=[BG_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=[BG_450_TEAM1_NAME]][$SETVAR3=" .. PlayerName .. "]"
		
		ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
		ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
	
	else

		local PlayerName 	= GetName( OwnerID() );
		local FullKey 		= "[BG_450_MSG_ATTACKFLAG]" .. "[$SETVAR1=[BG_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=[BG_450_TEAM2_NAME]][$SETVAR3=" .. PlayerName .. "]"

		ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
		ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );

	end
	
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

	end

	-- ���� [ TEAM 1 ] [ CAMPID = 8 ][ ���� ][ �w�]�X�ͦa�n�� ]
	-- �x�� [ TEAM 2 ] [ CAMPID = 9 ][ �x�� ][ �w�]�X�ͦa�_�� ]

	if( CastResult == 1 ) then 

		local 	CampID		= GetRoleCampID( TargetID() );
		local 	TeamID 		= GetTeamID( OwnerID() );
		local 	OrgID 		= ReadRoleValue( TargetID(), EM_RoleValue_OrgID );
		

		--if( CampID == 2 ) then -- �Ǫ��}��, ��ܥثe�𤴬O���ߪ�, ���Q�H�e��
		-- �]���ۦP�}�窺��, �����I����, �ҥH�����N����]���I���H���}��Y�i

			if( PlayerCampID == 8 ) then 
				-- TEAM 1, ����

				-- SetRoleCampID �n�b ChangeObjID ���e, �]�� ChangeObjID �|���s AddToPartition, �|���ܪ��󤧶�������
				SetRoleCampID( TargetID(), PlayerCampID );


				ChangeObjID( TargetID(), 111264 );	-- TEAM 1 RED
				SetLandMark( RoomID, LandMarkID, 46 );
			else
				-- TEAM 2, �x��
				
				-- SetRoleCampID �n�b ChangeObjID ���e, �]�� ChangeObjID �|���s AddToPartition, �|���ܪ��󤧶�������
				SetRoleCampID( TargetID(), PlayerCampID );

				ChangeObjID( TargetID(), 111258 );	-- TEAM 2 BLUE
				SetLandMark( RoomID, LandMarkID, 47 );
				
			end

		--else		
		--	if( PlayerCampID == 1 ) then
		--		ChangeObjID( TargetID(), 111258 );	-- TEAM 2 BLUE
	--			SetLandMark( RoomID, LandMarkID, 2 );
	--		else
	--			ChangeObjID( TargetID(), 111264 );	-- TEAM 2 BLUE
	--			SetLandMark( RoomID, LandMarkID, 1 );
	--		end
	--	end

		-- �[�J�T�� XXX ��ŧ�F XXX

			if( PlayerCampID == 8 ) then

				local PlayerName 	= GetName( OwnerID() );
				local FullKey 		= "[BG_450_MSG_OWNFLAG]" .. "[$SETVAR1=[BG_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=[BG_450_TEAM1_NAME]][$SETVAR3=" .. PlayerName .. "]"
				
				ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
				ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );
			
			else

				local PlayerName 	= GetName( OwnerID() );
				local FullKey 		= "[BG_450_MSG_OWNFLAG]" .. "[$SETVAR1=[BG_LANDMARK_NAME_" .. LandMarkID .. "]][$SETVAR2=[BG_450_TEAM2_NAME]][$SETVAR3=" .. PlayerName .. "]"

				ScriptMessage( OwnerID(), -1, 0, FullKey , 0 );
				ScriptMessage( OwnerID(), -1, 2, FullKey , 0 );

			end
		

		
		SetPlot( TargetID(), "Touch" , "Lua_BG450_Touch_Tower" , 60 );

	end

end

function LuaZone_BG15_Init( ZoneID, RoomID )

	-- �Գ��ϰ��l�@��, �Ω󲣥ͪ���, �]�w����
	--SetBGScore( RoomID, 1, 0 );
	--SetBGScore( RoomID, 2, 0 );
	local ObjID = 0;

	-- ���ͦǦ����
	--ObjID = CreateObj( 111261, 131.7, -3.4, -84.5, 0, 1 );
	--AddtoPartition( ObjID, RoomID );

	--ObjID = CreateObj( 111261, 54.6, -5.1, -153.8, 0, 1 );
	--AddtoPartition( ObjID, RoomID );

	-- ���ͤ@��������������a��, �w�ɳB�z���ˬd�Գ����A

	--ObjID = CreateObj( 111278, 0, 0, 0, 0, 1 );	-- ���ͤ@�ӱ����, �Ψӱ���Գ��欰
	--BeginPlot( ObjID, "LuaZone_BG15_Main", 0 );

end

function LuaZone_BG15_Main()

	local 	RoomID 	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local	ObjID	= 0;
	local	Flag	= {};
	local 	FlagID 	= 1;
	local	pX, pY, pZ;
	local	ObjName;
	

	SetZonePVPScript( "LuaZone_BG15_PVPDead" );
	SetZoneReviveScript( "LuaZone_BG15_Revive" );

	-- �]�w�Գ����I���
	--SetLandMarkInfo( RoomID, 0, 0, 131.7, -3.4, -84.5, "TEST-1", 1 );
	--SetLandMarkInfo( RoomID, 1, 0, 54.6, -5.1, -153.8, "TEST-2", 1 );

	-- ���ͦǦ����

	-- �n��������
	----------------------------------------------------------------
	pX	= 1673.37;
	pY	= 7.20;
	pZ	= 1592.80;
	FlagID 	= 1;
	ObjName = "BG_LANDMARK_NAME_01";
	

	SetLandMarkInfo( RoomID, FlagID, 45, pX, pY, pZ, ObjName, 45 );		-- �]�w�Գ����I���
		
	Flag[ FlagID ] 	= CreateObj( 111278, pX, pY, pZ, 0, 1 );			-- ���ͤ��ߺX�l
	FlagBaseID	= CreateObj( 111275, pX, pY, pZ, 0, 1 );			-- ���ͺX�y

	WriteRoleValue( Flag[ FlagID ], EM_RoleValue_PID, FlagID );
	
	SetModeEx( FlagBaseID, EM_SetModeType_Mark, false );
	SetModeEx( FlagBaseID, EM_SetModeType_Obstruct, true );

	AddToPartition( Flag[ FlagID ] 	, RoomID );
	AddToPartition( FlagBaseID	, RoomID );

	SetPlot( Flag[ FlagID ], "Touch" , "Lua_BG450_Touch_Tower" , 60 );
	SetRoleCampID( Flag[ FlagID ], 2 );	-- �N�w�]�X�l�]���Ǫ�

	-- �F�n��������
	----------------------------------------------------------------
	pX	= 1880.41;
	pY	= 15.09;
	pZ	= -495.62;
	FlagID 	= 2;
	ObjName = "BG_LANDMARK_NAME_02";

	SetLandMarkInfo( RoomID, FlagID, 45, pX, pY, pZ, ObjName, 45 );		-- �]�w�Գ����I���
		
	Flag[ FlagID ] 	= CreateObj( 111278, pX, pY, pZ, 0, 1 );			-- ���ͤ��ߺX�l
	FlagBaseID	= CreateObj( 111275, pX, pY, pZ, 0, 1 );			-- ���ͺX�y

	WriteRoleValue( Flag[ FlagID ], EM_RoleValue_PID, FlagID );

	SetModeEx( FlagBaseID, EM_SetModeType_Mark, false );
	SetModeEx( FlagBaseID, EM_SetModeType_Obstruct, true );

	AddToPartition( Flag[ FlagID ] 	, RoomID );
	AddToPartition( FlagBaseID	, RoomID );

	SetPlot( Flag[ FlagID ], "Touch" , "Lua_BG450_Touch_Tower" , 60 );
	SetRoleCampID( Flag[ FlagID ], 2 );	-- �N�w�]�X�l�]���Ǫ�

	-- ����������
	----------------------------------------------------------------
	pX	= 39.55
	pY	= -6.19
	pZ	= -53.54
	FlagID 	= 3;
	ObjName = "BG_LANDMARK_NAME_03";

	SetLandMarkInfo( RoomID, FlagID, 45, pX, pY, pZ, ObjName, 45 );		-- �]�w�Գ����I���
		
	Flag[ FlagID ] 	= CreateObj( 111278, pX, pY, pZ, 0, 1 );			-- ���ͤ��ߺX�l
	FlagBaseID	= CreateObj( 111275, pX, pY, pZ, 0, 1 );			-- ���ͺX�y

	WriteRoleValue( Flag[ FlagID ], EM_RoleValue_PID, FlagID );

	SetModeEx( FlagBaseID, EM_SetModeType_Mark, false );
	SetModeEx( FlagBaseID, EM_SetModeType_Obstruct, true );

	AddToPartition( Flag[ FlagID ] 	, RoomID );
	AddToPartition( FlagBaseID	, RoomID );

	SetPlot( Flag[ FlagID ], "Touch" , "Lua_BG450_Touch_Tower" , 60 );
	SetRoleCampID( Flag[ FlagID ], 2 );	-- �N�w�]�X�l�]���Ǫ�

	--�@��n��������
	----------------------------------------------------------------
	pX	= -344.03
	pY	= 11.46
	pZ	= 1794.47
	FlagID 	= 4;
	ObjName = "BG_LANDMARK_NAME_04";

	SetLandMarkInfo( RoomID, FlagID, 45, pX, pY, pZ, ObjName, 45 );		-- �]�w�Գ����I���
		
	Flag[ FlagID ] 	= CreateObj( 111278, pX, pY, pZ, 0, 1 );			-- ���ͤ��ߺX�l
	FlagBaseID	= CreateObj( 111275, pX, pY, pZ, 0, 1 );			-- ���ͺX�y

	WriteRoleValue( Flag[ FlagID ], EM_RoleValue_PID, FlagID );

	SetModeEx( FlagBaseID, EM_SetModeType_Mark, false );
	SetModeEx( FlagBaseID, EM_SetModeType_Obstruct, true );

	AddToPartition( Flag[ FlagID ] 	, RoomID );
	AddToPartition( FlagBaseID	, RoomID );

	SetPlot( Flag[ FlagID ], "Touch" , "Lua_BG450_Touch_Tower" , 60 );
	SetRoleCampID( Flag[ FlagID ], 2 );	-- �N�w�]�X�l�]���Ǫ�

	--�@�F�_��������
	----------------------------------------------------------------
	pX	= 822.11
	pY	= 3.34
	pZ	= -2013.12
	FlagID 	= 5;
	ObjName = "BG_LANDMARK_NAME_05";

	SetLandMarkInfo( RoomID, FlagID, 45, pX, pY, pZ, ObjName, 45 );		-- �]�w�Գ����I���
		
	Flag[ FlagID ] 	= CreateObj( 111278, pX, pY, pZ, 0, 1 );			-- ���ͤ��ߺX�l
	FlagBaseID	= CreateObj( 111275, pX, pY, pZ, 0, 1 );			-- ���ͺX�y

	WriteRoleValue( Flag[ FlagID ], EM_RoleValue_PID, FlagID );

	SetModeEx( FlagBaseID, EM_SetModeType_Mark, false );
	SetModeEx( FlagBaseID, EM_SetModeType_Obstruct, true );

	AddToPartition( Flag[ FlagID ] 	, RoomID );
	AddToPartition( FlagBaseID	, RoomID );

	SetPlot( Flag[ FlagID ], "Touch" , "Lua_BG450_Touch_Tower" , 60 );
	SetRoleCampID( Flag[ FlagID ], 2 );	-- �N�w�]�X�l�]���Ǫ�

	--�@��_��������
	----------------------------------------------------------------
	pX	= -1519.78
	pY	= 14.96
	pZ	= 802.45
	FlagID 	= 6;
	ObjName = "BG_LANDMARK_NAME_06";

	SetLandMarkInfo( RoomID, FlagID, 45, pX, pY, pZ, ObjName, 45 );		-- �]�w�Գ����I���
		
	Flag[ FlagID ] 	= CreateObj( 111278, pX, pY, pZ, 0, 1 );			-- ���ͤ��ߺX�l
	FlagBaseID	= CreateObj( 111275, pX, pY, pZ, 0, 1 );			-- ���ͺX�y

	WriteRoleValue( Flag[ FlagID ], EM_RoleValue_PID, FlagID );

	SetModeEx( FlagBaseID, EM_SetModeType_Mark, false );
	SetModeEx( FlagBaseID, EM_SetModeType_Obstruct, true );

	AddToPartition( Flag[ FlagID ] 	, RoomID );
	AddToPartition( FlagBaseID	, RoomID );

	SetPlot( Flag[ FlagID ], "Touch" , "Lua_BG450_Touch_Tower" , 60 );
	SetRoleCampID( Flag[ FlagID ], 2 );	-- �N�w�]�X�l�]���Ǫ�

	--�@�_��������
	----------------------------------------------------------------
	pX	= -1601.96
	pY	= -30.81
	pZ	= -1579.83
	FlagID 	= 7;
	ObjName = "BG_LANDMARK_NAME_07";

	SetLandMarkInfo( RoomID, FlagID, 45, pX, pY, pZ, ObjName, 45 );		-- �]�w�Գ����I���
		
	Flag[ FlagID ] 	= CreateObj( 111278, pX, pY, pZ, 0, 1 );			-- ���ͤ��ߺX�l
	FlagBaseID	= CreateObj( 111275, pX, pY, pZ, 0, 1 );			-- ���ͺX�y

	WriteRoleValue( Flag[ FlagID ], EM_RoleValue_PID, FlagID );

	SetModeEx( FlagBaseID, EM_SetModeType_Mark, false );
	SetModeEx( FlagBaseID, EM_SetModeType_Obstruct, true );

	AddToPartition( Flag[ FlagID ] 	, RoomID );
	AddToPartition( FlagBaseID	, RoomID );

	SetPlot( Flag[ FlagID ], "Touch" , "Lua_BG450_Touch_Tower" , 60 );
	SetRoleCampID( Flag[ FlagID ], 2 );	-- �N�w�]�X�l�]���Ǫ�

	----------------------------------------------------------------


	-- ���ͬ]��
	
	-- �ˬd����H�Ƴ����F�~�}�]��

	-- �ˬd�Գ��}�l�ɶ��ܤ��w�h�[, �Y�F�����������F�H��, �h�����Գ�

	-- �ˬd����

	-- �D�n�j��, �ˬd�����ݩ󨺭Ӱ}��, �íp��

	local CheckFlag = 0;

	while 1 do

		sleep( 10 );

		CheckFlag = CheckFlag + 1;
		
		-- �ˬd�X�l�[��
		if( CheckFlag == 10  ) then
			
			CheckFlag = 0;

			for i, FlagID in Flag do
			
				local TeamID	= 0;
				--local OrgID 	= ReadRoleValue( FlagID, EM_RoleValue_OrgID );

				local FlagCamp	= GetRoleCampID( FlagID );
				
				--if( OrgID == 111264 ) then	-- �ݩ� TEAM 1
				--	TeamID = 1;
				--elseif( OrgID == 111258 ) then	-- �ݩ� TEAM 2
				--	TeamID = 2;
				--end
				
				if( FlagCamp == 8 ) then 
					TeamID = 1;
				elseif( FlagCamp == 9 ) then
					TeamID = 2;
				else
					TeamID = 0;
				end
					

				if( TeamID ~= 0 ) then

					local Score = GetScore( RoomID, TeamID ) + 10;
					
					if( Score >= 2000 ) then
						Score = 2000;
					end

					SetScore( RoomID, TeamID, Score );

					if( Score >= 2000 ) then
						break;
					end
				end
			end
		end

		-- �ˬd����}��ì��
		for i=1, 2, 1 do			
			if( GetScore( RoomID, i ) >= 2000 ) then
				-- �w�g��Ĺ�a����, �ϥμ@��, �N�Ҧ����`�� buff ����, ����			
				--CheckBGWinner();
				SetWinner( RoomID, i );
				break;
			end
		end
	end
end
function LuaZone_BG15_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )

	local KillerTeamID	= GetTeamID( OwnerID() );

	if( KillerTeamID ~= GetTeamID( TargetID() ) ) then

		local 	RoomID 	= ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
		local 	Score 	= GetScore( RoomID, KillerTeamID ) + 1;

		if( Score >= 2000 ) then
			Score = 2000;
		end
		
		SetScore( RoomID, KillerTeamID, Score );
	end
end

function LuaZone_BG15_Revive()
	
	-- �ϰ쭫�ͼ@��
	local 	TeamID	= GetTeamID( OwnerID() );
	local	X	= 0;
	local	Y	= 0;
	local	Z	= 0;
	local	Dir	= 0;

	if( TeamID == 1 ) then	
		X 	= 1673.37
		Y	= 7.20;
		Z 	= 1592.8;
		Dir	= 0;
	else		
		X 	= -1601.96
		Y	= -30.81;
		Z 	= -1579.83;
		Dir	= 0;
	end

	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );

end

function Lua_BG_JoinQueue( dbid, isTeam, numTeamPeople )

	local totalteam 		= GetNumTeam();	-- ���o�o�Գ��̦h���\������ƶq
	local lowestTeamID		= 0;
	local lowestTeamPeopleNumer	= 0;

	for i = 1, totalteam, 1 do
		
		local TeamPeopleNumber = GetNumQueueMember( i );
		
		if( TeamPeopleNumber <= lowestTeamPeopleNumer ) then
			lowestTeamID 		= i;
			lowestTeamPeopleNumer	= TeamPeopleNumber;
		end		
	end

	return lowestTeamID;	-- �Ǧ^�ӤH���n�i���Ӧ�C
end

function Lua_BG_RoleEnterBattleGround( dbid, teamID )

	if( teamID == 1 ) then
		SetBattleGroundObjCampID( dbid, 8 );
	elseif( teamID == 2 ) then
		SetBattleGroundObjCampID( dbid, 9 );
	end

end

function Lua_BG_MoveRoleToBattleGround( srvID, dbid, teamid, roomid )
	
	if( teamID == 1 ) then
		MoveRoleToBattleGround( srvID, dbid, roomid, -2138, 126, -2136, 45 );
	elseif( teamID == 2 ) then
		MoveRoleToBattleGround( srvID, dbid, roomid, 2051, 156, 2132, 225 );
	end

end
