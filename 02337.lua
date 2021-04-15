function Lua_ZONE14_PE05_GlobalSet()--�ܼƫŧi
	ZONE14_PE05_PEIndex = 1405
	
	ZONE14_PE05_Good = {}
	ZONE14_PE05_Var = {}
	ZONE14_PE05_Var["MapID"] = 437
	ZONE14_PE05_Var["FlagID"] = 780755
	ZONE14_PE05_Var["FighterDead"] = 0
	ZONE14_PE05_Var["Controller"] = 0
	ZONE14_PE05_Var["Door1"] = 0
	ZONE14_PE05_Var["Door2"] = 0
	ZONE14_PE05_Var["BossDoor1"] = 0
	ZONE14_PE05_Var["BossDoor2"] = 0
	
	ZONE14_PE05_Var["GoodID"] = {	105618,	--�ͤ�j�N
						105619,
						105620,
						105553,	--����5+4
						105554,
						105555,
						105556,
						105557,
						105567,
						105568,
						105569,
						105570
					}
	ZONE14_PE05_Var["FighterID"] = {	105403,	--�|�j�N
						105404,
						105405,
						105406
					}
	ZONE14_PE05_Var["Fighter"] = {}
	ZONE14_PE05_Var["BossID"] = 105402 -- �o�Q��
	ZONE14_PE05_Var["Boss"] = 0
	ZONE14_PE05_Var["Dir"] = 0
	ZONE14_PE05_Var["BadDir"] = 0	
end

function Lua_ZONE14_PE05_PESet()--PE�\��
	local PEIndex = ZONE14_PE05_PEIndex
	local MapID = ZONE14_PE05_Var["MapID"]
	local PHIndex = 100
	local TestID = 1
	
	PE_AddPE( "", "", PEIndex , 0 ) 						-- �s�W�@�Өƥ�
	PE_AddRegion( PEIndex , MapID )					-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )					-- ��PE��i���հ�
			
	PE_AddPhase( PEIndex , PHIndex, "", "", 0 , 1 , 1 , 0 )

	PE_PH_AddObjective_Equal( PEIndex , PHIndex, PHIndex, "", "", "ZONE14_PE05_Phase1" , 0, 1,  true )
	
	PE_SetCallBackOnPlayerEnter( PEIndex, "Lua_ZONE14_PE05_Enter" )--�i�J�ϰ�
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_ZONE14_PE05_Leave" )--���}�ϰ�
	
	 PE_SetUIVisible( PEIndex, false )--�����PE����
	-- �ƥ�Ұ�
	PE_Start( PEIndex , PHIndex )
end


function Lua_ZONE14_PE05_Enter( PEIndex, Player )--�i�J�ϰ�
	local FlagID = ZONE14_PE05_Var["FlagID"]
	local X1 = GetMoveFlagValue( FlagID , 8 , EM_RoleValue_X )
	local Y1 = GetMoveFlagValue( FlagID , 8 , EM_RoleValue_Y )
	local Z1 = GetMoveFlagValue( FlagID , 8 , EM_RoleValue_Z )
	local X2 = GetMoveFlagValue( FlagID , 9 , EM_RoleValue_X )
	local Y2 = GetMoveFlagValue( FlagID , 9 , EM_RoleValue_Y )
	local Z2 = GetMoveFlagValue( FlagID , 9 , EM_RoleValue_Z )
	
	local Vx = X1 -X2;
	local Vy = Y1-Y2;
	local Vz = Z1-Z2;

	local Ux = 0;
	local Uy = 1;
	local Uz = 0;

	local Nx = (Uy*Vz-Uz*Vy)
	local Ny = -(Uz*Vx -Ux*Vz)
	local Nz = (Ux*Vy-Uy*Vx)
	local Dis = ((Nx*Nx+Ny*Ny+Nz*Nz)^0.5)
	Nx = Nx / Dis
	Ny = Ny / Dis
	Nz = Nz / Dis
	
	local Px = ReadRoleValue( Player, EM_RoleValue_X )
	local Py = ReadRoleValue( Player, EM_RoleValue_Y )
	local Pz = ReadRoleValue( Player, EM_RoleValue_Z )
	local D = -( Nx*X1+Ny*Y1+Nz*Z1 )
	local plane = Nx*Px+Ny*Py+Nz*Pz +D
	--DebugMsg(0,0,"ZONE14_PE05_Enter   plane = "..plane )
	if plane >= 0 and CheckBuff( Player, 509461 ) ~= true then
		ScriptMessage( Player, Player, 0, "[SC_ZONE14_PE05_ENTER]", 0 )--���ǥѬ�V�ǰe���覡�i�J���ϰ�
		ScriptMessage( Player, Player, 1, "[SC_ZONE14_PE05_ENTER]", 0 )--���ǥѬ�V�ǰe���覡�i�J���ϰ�
		CallPlot( Player, "Lua_ZONE14_PE05_SetPosOut", 0 )
	end
end

function Lua_ZONE14_PE05_Leave( PEIndex, Player )--���}�ϰ�
	CancelBuff( Player, 509461 )--�i�J�ϰ��ˬdBUFF
end

function Lua_ZONE14_PE05_CreateCtrl()--�гy����
	if ZONE14_PE05_Var["Controller"] == 0 then
		local FlagID = ZONE14_PE05_Var["FlagID"]
		local X1 = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_X )
		local X2 = GetMoveFlagValue( FlagID , 2 , EM_RoleValue_X )
		local X3 = GetMoveFlagValue( FlagID , 3 , EM_RoleValue_X )
		local Z1 = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_Z )
		local Z2 = GetMoveFlagValue( FlagID , 2 , EM_RoleValue_Z )
		local Z3 = GetMoveFlagValue( FlagID , 3 , EM_RoleValue_Z )
		local Y = GetMoveFlagValue( FlagID , 2 , EM_RoleValue_Y )
		local Dir = CalDir( (X2-X1), (Z2-Z1) )
		local BadDir = CalDir( (X1-X2), (Z1-Z2) )
		ZONE14_PE05_Var["Dir"] = Dir
		ZONE14_PE05_Var["BadDir"] = BadDir		
		
		local Controller = CreateObjByFlag( 115053 , FlagID , 1 , 1 )
		SetModeEx( Controller , EM_SetModeType_SearchenemyIgnore , false )		-- �Q�j�M
		SetModeEx( Controller , EM_SetModeType_Mark , false )			-- �аO
		SetModeEx( Controller , EM_SetModeType_Searchenemy , false )		-- ����
		SetModeEx( Controller , EM_SetModeType_HideName , true )			-- �W��
		SetModeEx( Controller , EM_SetModeType_Fight , false )			-- �i�������
		SetModeEx( Controller , EM_SetModeType_Show , false )			-- ���		
		AddToPartition( Controller , 0 )
		ZONE14_PE05_Var["Controller"] = Controller
		
		local BossDoor1 = CreateObjByFlag( 118111 , FlagID , 3 , 1 )--���e���ת�
		SetModeEx( BossDoor1 , EM_SetModeType_SearchenemyIgnore , false )		-- �Q�j�M
		SetModeEx( BossDoor1 , EM_SetModeType_Mark , false )			-- �аO
		SetModeEx( BossDoor1 , EM_SetModeType_Searchenemy , false )		-- ����
		SetModeEx( BossDoor1 , EM_SetModeType_HideName , true )		-- �W��
		SetModeEx( BossDoor1 , EM_SetModeType_Obstruct, true )			-- ����
		SetModeEx( BossDoor1 , EM_SetModeType_Fight , false )			-- �i�������
		SetModeEx( BossDoor1 , EM_SetModeType_Show , true )			-- ���
		SetModeEx( BossDoor1 , EM_SetModeType_Gravity, false )			-- ���O
		AddToPartition( BossDoor1 , 0 )
		MoveToFlagEnabled( BossDoor1 , false )
		local DoorX = ReadRoleValue( BossDoor1, EM_RoleValue_X )
		local DoorY = ReadRoleValue( BossDoor1, EM_RoleValue_Y )
		local DoorZ = ReadRoleValue( BossDoor1, EM_RoleValue_Z )
		local DoorDir = ReadRoleValue( BossDoor1, EM_RoleValue_Dir )
		SetPos( BossDoor1, DoorX, DoorY+50, DoorZ, DoorDir )
		ZONE14_PE05_Var["BossDoor1"] = BossDoor1

		local BossDoor2 = CreateObjByFlag( 114771 , FlagID , 3 , 1 )--���e���ת�
		SetModeEx( BossDoor2 , EM_SetModeType_SearchenemyIgnore , false )		-- �Q�j�M
		SetModeEx( BossDoor2 , EM_SetModeType_Mark , false )			-- �аO
		SetModeEx( BossDoor2 , EM_SetModeType_Searchenemy , false )		-- ����
		SetModeEx( BossDoor2 , EM_SetModeType_HideName , true )		-- �W��
		SetModeEx( BossDoor2 , EM_SetModeType_Obstruct, true )			-- ����
		SetModeEx( BossDoor2 , EM_SetModeType_Fight , false )			-- �i�������
		SetModeEx( BossDoor2 , EM_SetModeType_Show , true )			-- ���
		SetModeEx( BossDoor2 , EM_SetModeType_Gravity, false )			-- ���O
		AddToPartition( BossDoor2 , 0 )
		MoveToFlagEnabled( BossDoor2 , false )
		local DoorX = ReadRoleValue( BossDoor2, EM_RoleValue_X )
		local DoorY = ReadRoleValue( BossDoor2, EM_RoleValue_Y )
		local DoorZ = ReadRoleValue( BossDoor2, EM_RoleValue_Z )
		--local DoorDir = ReadRoleValue( BossDoor2, EM_RoleValue_Dir )

		local PosDir = Dir
		if PosDir < 0 then PosDir = PosDir + 360
		elseif PosDir > 360 then PosDir = PosDir -360 end
	
		local Dis = 5	
		local radian = (math.pi/180)*( PosDir )--�|��
		local PosX = DoorX +(Dis*math.cos(radian))
		local PosZ = DoorZ - (Dis*math.sin(radian))	
		SetPos( BossDoor2, PosX, DoorY, PosZ, BadDir )		
		--SetPos( BossDoor2, DoorX, DoorY, DoorZ, DoorDir )
		ZONE14_PE05_Var["BossDoor2"] = BossDoor2
		
		CallPlot( Controller, "Lua_ZONE14_PE05_Start", Dir, BadDir )
	end
end

function Lua_ZONE14_PE05_Start( Dir, BadDir )--�}�l�@��
	local FighterID = ZONE14_PE05_Var["FighterID"]
	local FlagID = ZONE14_PE05_Var["FlagID"]
	local GoodID = ZONE14_PE05_Var["GoodID"]
	local Good = ZONE14_PE05_Good

	local X1 = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_X )
	local X2 = GetMoveFlagValue( FlagID , 2 , EM_RoleValue_X )
	local X3 = GetMoveFlagValue( FlagID , 3 , EM_RoleValue_X )
	local Z1 = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_Z )
	local Z2 = GetMoveFlagValue( FlagID , 2 , EM_RoleValue_Z )
	local Z3 = GetMoveFlagValue( FlagID , 3 , EM_RoleValue_Z )
	local Y = GetMoveFlagValue( FlagID , 2 , EM_RoleValue_Y )
		
	local Fighter = ZONE14_PE05_Var["Fighter"]
	for i=1, 4 do--���ͼĤj�N
		local Dis = 40
		local PosDir =(BadDir-60)+(120/3)*(i-1)
		if PosDir < 0 then PosDir = PosDir + 360
		elseif PosDir > 360 then PosDir = PosDir -360 end
		
		local radian = (math.pi/180)*( PosDir )--�|��
		local PosX = X3 +(Dis*math.cos(radian))
		local PosZ = Z3 - (Dis*math.sin(radian))
		Y = GetHeight( PosX, Y, PosZ )
		Fighter[i] = CreateObj ( FighterID[i] , PosX , Y, PosZ , BadDir , 1)
		SetModeEx( Fighter[i] , EM_SetModeType_Searchenemy , false )		-- ����
		SetModeEx( Fighter[i] , EM_SetModeType_Fight , false )			-- �i�������
		SetModeEx( Fighter[i] , EM_SetModeType_Show , true )			-- ���
		AddToPartition( Fighter[i] , 0 )
		SetPlot( Fighter[i], "dead", "Lua_ZONE14_PE05_FighterDead", 0 )
		AddBuff( Fighter[i], 502546, 0, -1 )--��j1.3
	end
	
	for i=1, table.getn(GoodID) do--��������
		local PosDir
		local Dis = 60
		if i < 4 then
			PosDir =(Dir-40)+(60/3)*i
		elseif i < 9 then
			PosDir =(Dir-70)+(120/5)*(i-3)
			Dis = 40
		else
			PosDir =(Dir-70)+(120/4)*(i-8)
			Dis = 20
		end
		if PosDir < 0 then PosDir = PosDir + 360
		elseif PosDir > 360 then PosDir = PosDir -360 end
		local radian = (math.pi/180)*( PosDir )--�|��
		local PosX = X2 +(Dis*math.cos(radian))
		local PosZ = Z2 - (Dis*math.sin(radian))
		Y = GetHeight( PosX, Y, PosZ )
		Good[i] = CreateObj ( GoodID[i] , PosX , Y, PosZ , Dir , 1)
		SetModeEx( Good[i] , EM_SetModeType_Searchenemy , false )		-- ����
		SetModeEx( Good[i] , EM_SetModeType_Fight , false )			-- �i�������
		SetModeEx( Good[i] , EM_SetModeType_Show , true )			-- ���
		MoveToFlagEnabled( Good[i] , false )
		AddToPartition( Good[i] , 0 )
		SetPlot( Good[i], "dead", "Lua_ZONE14_PE05_GoodDead", 0 )
	end

	sleep(50)
	local Door1 = CreateObjByFlag( 118110 , FlagID , 1 , 1 )--�i�J�ǰe��
	SetModeEx( Door1 , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Door1 , EM_SetModeType_Mark , false )			-- �аO
	SetModeEx( Door1 , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( Door1 , EM_SetModeType_HideName , true )			-- �W��
	SetModeEx( Door1 , EM_SetModeType_Fight , false )			-- �i�������
	SetModeEx( Door1 , EM_SetModeType_Show , true )			-- ���
	SetModeEx( Door1 , EM_SetModeType_Gravity, false )			-- ���O
	AddToPartition( Door1 , 0 )
	MoveToFlagEnabled( Door1 , false )
	local DoorX = ReadRoleValue( Door1, EM_RoleValue_X )
	local DoorY = ReadRoleValue( Door1, EM_RoleValue_Y )
	local DoorZ = ReadRoleValue( Door1, EM_RoleValue_Z )
	SetPos( Door1, DoorX, DoorY+50, DoorZ, BadDir )
	ZONE14_PE05_Var["Door1"] = Door1
	SetPlot( Door1, "collision", "Lua_ZONE14_PE05_SetPosIn", 0 )

	local Door2 = CreateObjByFlag( 118110 , FlagID , 2 , 1 )--���}�ǰe��
	SetModeEx( Door2 , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Door2 , EM_SetModeType_Mark , false )			-- �аO
	SetModeEx( Door2 , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( Door2 , EM_SetModeType_HideName , true )			-- �W��
	SetModeEx( Door2 , EM_SetModeType_Fight , false )			-- �i�������
	SetModeEx( Door2 , EM_SetModeType_Show , true )			-- ���
	SetModeEx( Door2 , EM_SetModeType_Gravity, false )			-- ���O
	AddToPartition( Door2 , 0 )
	MoveToFlagEnabled( Door2 , false )
	local DoorX = ReadRoleValue( Door2, EM_RoleValue_X )
	local DoorY = ReadRoleValue( Door2, EM_RoleValue_Y )
	local DoorZ = ReadRoleValue( Door2, EM_RoleValue_Z )
	SetPos( Door2, DoorX, DoorY+50, DoorZ, Dir )
	ZONE14_PE05_Var["Door2"] = Door2
	SetPlot( Door2, "collision", "Lua_ZONE14_PE05_SetPosOut", 0 )
	
	local Count = SetSearchAllPlayer( ReadRoleValue( OwnerID(), EM_RoleValue_RoomID ) )
	for i=1, count do
		local GUID = GetSearchResult()
		if CheckFlag( GUID, 544988 ) ~= true and ( CheckAcceptQuest( GUID, 424086 ) == true or CheckAcceptQuest( GUID, 424087 ) == true ) then
			ScriptMessage( GUID, GUID, 1 , "[SC_424086_4]" , "0xffffff00" )--�U��A�E�F�k�}���o���z�F�I�Ҧ��H���n�ǳơI
			ScriptMessage( GUID, GUID, 0 , "[SC_424086_4]" , "0xffffff00" )--�U��A�E�F�k�}���o���z�F�I�Ҧ��H���n�ǳơI
		end
	end
	
	sleep(30)
	local Count = SetSearchAllPlayer( ReadRoleValue( OwnerID(), EM_RoleValue_RoomID ) )
	for i=1, count do
		local GUID = GetSearchResult()
		if CheckFlag( GUID, 544988 ) ~= true and ( CheckAcceptQuest( GUID, 424086 ) == true or CheckAcceptQuest( GUID, 424087 ) == true ) then
			ScriptMessage( GUID, GUID, 1 , "[SC_424086_5]" , "0xffffff00" )--�N�O�{�b�I���I�ϥ�[209414]�I
			ScriptMessage( GUID, GUID, 0 , "[SC_424086_5]" , "0xffffff00" )--�N�O�{�b�I���I�ϥ�[209414]�I
		end
	end
	sleep(20)
	
	local GoodNum = table.getn(Good)
	for i=1, table.getn(Fighter) do
		SetModeEx( Fighter[i] , EM_SetModeType_Searchenemy , true )		-- ����
		SetModeEx( Fighter[i] , EM_SetModeType_Fight , true )			-- �i�������
	end
	for i=1, GoodNum do
		SetModeEx( Good[i] , EM_SetModeType_Searchenemy , true )		-- ����
		SetModeEx( Good[i] , EM_SetModeType_Fight , true )			-- �i�������		
	end
	
	local MoveX = GetMoveFlagValue( FlagID , 3 , EM_RoleValue_X )
	local MoveY = GetMoveFlagValue( FlagID , 3 , EM_RoleValue_Y )
	local MoveZ = GetMoveFlagValue( FlagID , 3 , EM_RoleValue_Z )
	while CheckID(ZONE14_PE05_Var["BossDoor1"]) do--���|�j�N��V����
		for i=1, GoodNum do
			if GetModeEX( Good[i], EM_SetModeType_Fight ) == true and KS_InCombat( Good[i] ) ~= true then
				for j=1, GoodNum do
					for j=1, table.getn(Fighter) do
						if CheckID(Fighter[j]) == true and GetDistance( Fighter[j], Good[i] ) <250 and KS_InCombat( Fighter[j] ) ~= true then
							SysCastSpellLv( Fighter[j], Good[i], 496946, 9 )--�s�y����
							SysCastSpellLv( Good[i], Good[i], 496946, 9 )--�s�y����
						end
					end				
				
					if Good[j] ~= Good[i] and GetModeEX( Good[j], EM_SetModeType_Fight ) == true then
						if KS_InCombat( Good[j] ) == true then
							WriteRoleValue( Good[i], EM_RoleValue_IsWalk, 0 )
							local Attack = ReadRoleValue( Good[j], EM_RoleValue_AttackTargetID )
							SysCastSpellLv( Attack, Good[i], 496946, 9 )--�s�y����
						else
							WriteRoleValue( Good[i], EM_RoleValue_IsWalk, 1 )
							KS_Move( Good[i], 50, ZONE14_PE05_Var["BossDoor1"] )
						end
					end
				end
			end
		end
		sleep(10)
	end
	
	local GetGoal = 0
	local dead =0
	local MoveX = GetMoveFlagValue( FlagID , 4 , EM_RoleValue_X )
	local MoveY = GetMoveFlagValue( FlagID , 4 , EM_RoleValue_Y )
	local MoveZ = GetMoveFlagValue( FlagID , 4 , EM_RoleValue_Z )
	
	while (GetGoal+dead) < GoodNum do--��BOSS�ж�����
		for i=1, GoodNum do
			if GetModeEX( Good[i], EM_SetModeType_Fight ) == true and GetModeEx( Good[i], EM_SetModeType_Drag ) == true and KS_InCombat( Good[i] ) ~= true then
				local CanMove = true
				for j=1, GoodNum do
					if Good[j] ~= Good[i] and GetModeEX( Good[j], EM_SetModeType_Fight ) == true and KS_InCombat( Good[j] ) == true then							
						SysCastSpellLv( ReadRoleValue( Good[j], EM_RoleValue_AttackTargetID ), Good[i], 496946, 9 )--�s�y����
						CanMove = false
						break
					end
				end
				if CanMove == true and DW_CheckDis( Good[i], FlagID, 4, 25 ) ~= true then
					local Rnd = {	[1] = Rand(30),
							[2] = Rand(30)
							}
					local RndMove = { 	[1] = 1+Rnd[rand(2)+1],
								[2] = 1-Rnd[rand(2)+1] }
					MoveDirect( Good[i], MoveX+RndMove[rand(2)+1] , MoveY, MoveZ+RndMove[rand(2)+1]  )
				elseif CanMove == true then
					GetGoal = GetGoal +1
					SetDir( Good[i], Dir )
					SetModeEx( Good[i], EM_SetModeType_Drag, false ) 
				end
			elseif GetModeEX( Good[i], EM_SetModeType_Fight ) == false and GetModeEx( Good[i], EM_SetModeType_Drag ) == true then
				SetModeEx( Good[i], EM_SetModeType_Drag, false ) 
				dead = dead+1
			end
		end
		--DebugMsg( 0,0,"GetGoal = "..GetGoal.."; dead = "..dead )
		sleep(10)
	end

	Sleep(10)
	local Boss = CreateObjByFlag( ZONE14_PE05_Var["BossID"], FlagID , 5 , 1 )--����BOSS
	SetModeEx( Boss , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( Boss , EM_SetModeType_Fight , false )			-- �i�������
	SetModeEx( Boss , EM_SetModeType_Show , true )			-- ���
	SetModeEx( Boss , EM_SetModeType_Strikback , false )			-- ����
	AddToPartition( Boss , 0 )
	SetPlot( Boss, "dead", "Lua_ZONE14_PE05_BossDead", 0 )
	SetDir( Boss, BadDir )
	ZONE14_PE05_Var["Boss"] = Boss
	AddBuff( Boss, 502546, 0, -1 )--��j1.3

	GetGoal = 0
	dead =0	
	local MoX = GetMoveFlagValue( FlagID , 5 , EM_RoleValue_X )
	local MoY = GetMoveFlagValue( FlagID , 5 , EM_RoleValue_Y )
	local MoZ = GetMoveFlagValue( FlagID , 5 , EM_RoleValue_Z )
	while ( GetGoal+dead ) < GoodNum do	
		for i=1, GoodNum do--�]���
			if GetModeEX( Good[i], EM_SetModeType_Fight ) == true and GetModeEx( Good[i], EM_SetModeType_Drag ) == false then
				if KS_InCombat( Good[i] ) ~= true then
					local NowX = ReadRoleValue( Good[i], EM_RoleValue_X )
					local NowZ = ReadRoleValue( Good[i], EM_RoleValue_Z )
					local PosX = MoX-50*math.cos(math.pi*2*(i/GoodNum))
					local PosZ = MoZ+50*math.sin(math.pi*2*(i/GoodNum))
					local DisX = ( NowX - PosX )^2
					local DisZ = ( NowZ - PosZ )^2
					local Dis = math.floor(( DisX + DisZ )^0.5)--�D�Z��
					if Dis > 30 then
						MoveDirect( Good[i], PosX, MoY, PosZ )
					else
						GetGoal = GetGoal +1
						AdjustFaceDir( Good[i], Boss, 0 )
						SetIdleMotion( Good[i], ruFUSION_ACTORSTATE_COMBAT_1H )	-- �w�]�O�԰��ʧ@
						SetModeEx( Good[i], EM_SetModeType_Drag, true ) 
					end
				end
			elseif GetModeEx( Good[i], EM_SetModeType_Drag ) == false then
				SetModeEx( Good[i], EM_SetModeType_Drag, true ) 
				dead = dead+1
			end
		end
		Sleep(10)
	end
	
	sleep(10)
	local Count = PE_GetActivePlayerGUIDCount( ZONE14_PE05_PEIndex )
	for i = 1 , Count do
		local GUID = PE_GetActivePlayerGUID( ZONE14_PE05_PEIndex )
		AddBuff( GUID, 503977, 0, 8 )--�ĨĬ���
		if GetDistance( Boss, GUID ) > 250 and ReadRoleValue( GUID, EM_RoleValue_IsDead ) ~= 1 then
			local Rnd = {	[1] = Rand(30)+20,
					[2] = Rand(30)+20
					}
			local RndMove = { 	[1] = 1+Rnd[rand(2)+1],
						[2] = 1-Rnd[rand(2)+1] 
						}
						
			SetPos( GUID, MoX+RndMove[rand(2)+1], MoY, MoZ+RndMove[rand(2)+1], Dir )
			AdjustFaceDir( GUID, Boss, 0 )
		end
	end

	sleep(15)	
	NPCSay( Boss, "[SC_ZONE14_PE05_SAY01]" )--�S�Q��A�̳o�ǧC�⪺�Τl���i����o�̡I
	sleep(20)
	NPCSay( Good[1], "[SC_ZONE14_PE05_SAY02]" )--�A���M���F�@�v���p�ݮ`�o��h���L�d���F�I
	sleep(20)
	NPCSay( Good[1], "[SC_ZONE14_PE05_SAY03]" )--���ѧA�N���F�A�ҧ@���@���I�X�N���I
	sleep(20)
	NPCSay( Boss, "[SC_ZONE14_PE05_SAY04]" )--�L�����å�I�A�̥u���L�O�_���ڥS���Ϊ����ƦӤw
	sleep(20)
	NPCSay( Boss, "[SC_ZONE14_PE05_SAY05]" )--�@�_�L�Ӥ]�n�A�����h���a�I
	
	Hide(Boss)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true )		-- ����
	SetModeEx( Boss , EM_SetModeType_Fight , true )			-- �i�������
	SetModeEx( Boss , EM_SetModeType_Strikback , true )		-- ����
	Show( Boss, 0 )
	sleep(10)
	BeginPlot( Boss, "Lua_ZONE14_PE05_BossCheck", 0 )--�ˬdBOSS
end

function Lua_ZONE14_PE05_FighterDead()
	local OID = OwnerID();
	if ZONE14_PE05_Var["FighterDead"] == 3 and GetModeEx( OID , EM_SetModeType_Fight ) == true then
		ZONE14_PE05_Var["FighterDead"] = 0
		DelObj(ZONE14_PE05_Var["BossDoor1"])
		DelObj(ZONE14_PE05_Var["BossDoor2"])
	else
		SetModeEx( OID , EM_SetModeType_Fight, false )
		ZONE14_PE05_Var["FighterDead"] = ZONE14_PE05_Var["FighterDead"]+1
	end
	
	for i=1, HateListCount( OID ) do
		local Hate = HateListInfo( OID , i-1, EM_HateListInfoType_GItemID )
		if CheckBuff( Hate, 508814 ) == true then--�̨Ψ�U��
			Lua_Zone14_PE04_QuestKill( Hate, 10 )--�����{���o
		end
	end
	
	DelObj(OID)
	return true
end

function Lua_ZONE14_PE05_GoodDead()
	local OID = OwnerID()
	PlayMotion( OID, ruFUSION_ACTORSTATE_DYING )
	SetModeEx( OID , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( OID , EM_SetModeType_Fight , false )			-- �i�������
	SetModeEx( OID , EM_SetModeType_Strikback , false )			-- ����
	SetModeEx( OID , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( OID , EM_SetModeType_NotShowHPMP , true )		-- ����ܦ��
	SetModeEx( OID , EM_SetModeType_Move , false )			-- ����
	SetModeEx( OID , EM_SetModeType_HideName , true )			-- �W��
	SetStopAttack( OID )
	ClearHateList( OID, -1 )
	AddBuff( OID, 508946, 0, -1 )--�L��+�˦�
	SetDefIdleMotion( OID, ruFUSION_MIME_IDLE_DEAD )
	return false
end

function Lua_ZONE14_PE05_BossCheck()--BOSS�԰��ˬd
	local Boss = OwnerID()
	local FlagID = ZONE14_PE05_Var["FlagID"]
	local MaxHP = ReadRoleValue( Boss, EM_RoleValue_MaxHP )
	local Good = ZONE14_PE05_Good
	local GoodNum = table.getn(Good)
	
	SysCastSpellLv( Good[1], Boss, 496946, 19 )--�s�y����
	SysCastSpellLv( Good[2], Boss, 496946, 19 )--�s�y����
	SysCastSpellLv( Good[3], Boss, 496946, 19 )--�s�y����
	while true do
		for i=1, GoodNum do
			if GetModeEX( Good[i], EM_SetModeType_Fight ) == true and KS_InCombat( Good[i] ) ~= true then
				SysCastSpellLv( Boss, Good[i], 496946, 9 )--�s�y����
				SysCastSpellLv( Good[i], Boss, 496946, 9 )--�s�y����
			end
		end
	
		local Count = PE_GetActivePlayerGUIDCount( ZONE14_PE05_PEIndex )
		for i = 1 , Count do
			local GUID = PE_GetActivePlayerGUID( ZONE14_PE05_PEIndex )
			if GetDistance( Boss, GUID ) < 250 and ReadRoleValue( GUID, EM_RoleValue_IsDead ) ~= 1 then
				SysCastSpellLv( GUID, Boss, 496946, 9 )--�s�y����
			end
		end
		sleep(10)
		local HP = ReadRoleValue( Boss, EM_RoleValue_HP )
		if HP <= MaxHP*0.7 then
			CallPlot( Boss, "Lua_ZONE14_PE05_BossDead", 0 )
			return
		end
		local HateCount = HateListCount( Boss )
		--DebugMsg(0,0,"BossHateCount = "..HateCount)
		if  HateCount < 1 then
			DelObj( ZONE14_PE05_Var["Door1"] )--�R���i�J�I
			DelObj( ZONE14_PE05_Var["Door2"] )--�R���i�J�I
			SysCastSpellLv( Boss, Boss, 497119, 0 )--�w���ȩw���N
			
			NPCSay( Boss, "[SC_ZONE14_PE05_BAD01]" )--���F�A�ڤw�g���¤F�I
			sleep(20)
			NPCSay( Boss, "[SC_ZONE14_PE05_BAD02]" )--�A�̳o�ǳI�ΧO�Q��ż�ڪ������A�u�I
			Sleep(20)
			
			local Pos = {}
			Pos[1] = GetMoveFlagValue( FlagID , 7 , EM_RoleValue_X )
			Pos[2] = GetMoveFlagValue( FlagID , 7 , EM_RoleValue_Y )
			Pos[3] = GetMoveFlagValue( FlagID , 7 , EM_RoleValue_Z )
			Pos[4] = ZONE14_PE05_Var["BadDir"]
			
			local Count = PE_GetActivePlayerGUIDCount( ZONE14_PE05_PEIndex )
			for i = 1 , Count do					
				local GUID = PE_GetActivePlayerGUID( ZONE14_PE05_PEIndex )
				AddBuff( GUID, 506098, 0, 2 )--�e���@��
				SetPos( GUID, kg_GetPosRX( Pos, nil , 50 ) )
				--SetPos( GUID, X+RndMove[rand(2)+1], Y, Z+RndMove[rand(2)+1], 0 )				
			end
			
			CallPlot( ZONE14_PE05_Var["Controller"], "Lua_ZONE14_PE05_End", 0 )
			DelObj( ZONE14_PE05_Var["Boss"] )
			return
		end
	end
end

function Lua_ZONE14_PE05_BossDead()--BOSS��F
	local Boss = OwnerID()
	SetStopAttack( Boss )
	ClearHateList( Boss, -1 )
	Hide( Boss )
	SetModeEx( Boss , EM_SetModeType_Searchenemy , false )		-- ����	
	SetModeEx( Boss , EM_SetModeType_Strikback , false )			-- ����
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( Boss , EM_SetModeType_NotShowHPMP , true )		-- ����ܦ��	
	Show( Boss, 0 )
	MagicInterrupt( Boss )
	AddBuff( Boss, 509459, 0, -1 )--�w���ȵL��
	CallPlot( ZONE14_PE05_Var["Controller"], "Lua_ZONE14_PE05_GoodEnd", 0 )
	return false
end

function Lua_ZONE14_PE05_GoodEnd()--�n������
	local Good = ZONE14_PE05_Good
	local FlagID = ZONE14_PE05_Var["FlagID"]
	local Boss = ZONE14_PE05_Var["Boss"]	
	
	local PosX = ReadRoleValue( Boss, EM_RoleValue_X )
	local PosZ = ReadRoleValue( Boss, EM_RoleValue_Z )
	
	DelObj( ZONE14_PE05_Var["Door1"] )--�R���i�J�I
	DelObj( ZONE14_PE05_Var["Door2"] )--�R���i�J�I
	
	for i=1, table.getn(Good) do--�����
		if GetModeEx( Good[i] , EM_SetModeType_Fight ) == true then
			SetModeEx( Good[i] , EM_SetModeType_NotShowHPMP , true )		-- ����ܦ��
		end
	end
	local Count = SetSearchRangeInfo( Boss, 60 )
	for i=1, Count do
		local GUID = GetSearchResult()
		if GUID ~= Boss then
			SysCastSpellLv( Boss, GUID, 497119, 0 )--�w�������h�N
		end
	end
	sleep(10)
	SysCastSpellLv( Boss, Boss, 497118, 0 )--�w���ȩw���N
	local Count = PE_GetActivePlayerGUIDCount( ZONE14_PE05_PEIndex )
	local Pos = {}
	Pos[1] = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_X )
	Pos[2] = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_Y )
	Pos[3] = GetMoveFlagValue( FlagID , 1 , EM_RoleValue_Z )
	Pos[4] = ZONE14_PE05_Var["BadDir"]
	
	for i = 1 , Count do
		local GUID = PE_GetActivePlayerGUID( ZONE14_PE05_PEIndex )
		if GetDistance( Boss, GUID ) > 300 then
			AddBuff( GUID, 506098, 0, 2 )--�e���@��
			SetPos( OwnerID(), kg_GetPosRX( Pos, nil , 60 , 0, math.random(-45,45) ) )
		end
	end
	
	NPCSay( Boss, "[SC_ZONE14_PE05_GOOD01]" )--��A�A�̳o�X�ӯu��²��......
	sleep(30)
	NPCSay( Boss, "[SC_ZONE14_PE05_GOOD02]" )--�ڨM�w���A�̨Ӭ��ڥS�����_���ĤO�I
	sleep(30)
	NPCSay( Boss, "[SC_ZONE14_PE05_GOOD03]" )--�A�̴N�u�n�d�U����N�n�F�I
	sleep(10)
			
	local Core = KS_CreateObjMode( 118112, Boss, nil,  20, 1, false, 20 )--�ؼЪ��񲣥ͪ���	
	SetModeEx( Core , EM_SetModeType_Fight , false )			-- �i�������
	SetModeEx( Core , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( Core , EM_SetModeType_NotShowHPMP , true )		-- ����ܦ��
	AddToPartition( Core , 0 )
	AddBuff( Core, 509462, 0, -1 )--�S��
	AddBuff( Core, 506984, 0, -1 )--�[�t
	sleep(10)

	local Count = PE_GetActivePlayerGUIDCount( ZONE14_PE05_PEIndex )
	for i = 1 , Count do
		local GUID = PE_GetActivePlayerGUID( ZONE14_PE05_PEIndex )
		if GetDistance( Core, GUID ) < 250 then
			ScriptMessage( Core, GUID, 0, "[SC_ZONE14_PE05_GOOD04]", "0xffffff00" )--�o�{�Ĥ@�ؼСI
			ScriptMessage( Core, GUID, 1, "[SC_ZONE14_PE05_GOOD04]", "0xffffff00" )--�o�{�Ĥ@�ؼСI
		end
	end
	--NPCSay( Core, "[SC_ZONE14_PE05_GOOD04]" )--�o�{�Ĥ@�ؼСI
	Sleep(20)
	local Count = PE_GetActivePlayerGUIDCount( ZONE14_PE05_PEIndex )
	for i = 1 , Count do
		local GUID = PE_GetActivePlayerGUID( ZONE14_PE05_PEIndex )
		if GetDistance( Core, GUID ) < 250 then
			ScriptMessage( Core, GUID, 0, "[SC_ZONE14_PE05_GOOD05]", "0xffffff00" )--���R���G�K�K�L�k�^��
			ScriptMessage( Core, GUID, 1, "[SC_ZONE14_PE05_GOOD05]", "0xffffff00" )--���R���G�K�K�L�k�^��
		end
	end
	--NPCSay( Core, "[SC_ZONE14_PE05_GOOD05]" )--���R���G�K�K�L�k�^��
	sleep(20)
	local Count = PE_GetActivePlayerGUIDCount( ZONE14_PE05_PEIndex )
	for i = 1 , Count do
		local GUID = PE_GetActivePlayerGUID( ZONE14_PE05_PEIndex )
		if GetDistance( Core, GUID ) < 250 then
			ScriptMessage( Core, GUID, 0, "[SC_ZONE14_PE05_GOOD06]", "0xffffff00" )--�Ұʳ̲׷����Ҧ��I
			ScriptMessage( Core, GUID, 1, "[SC_ZONE14_PE05_GOOD06]", "0xffffff00" )--�Ұʳ̲׷����Ҧ��I
		end
	end	
	--NPCSay( Core, "[SC_ZONE14_PE05_GOOD06]" )--�Ұʳ̲׷����Ҧ��I
	KS_Move( Core, 0, Boss )
	Sleep(10)
	local fakeCore = LuaFunc_CreateObjByObj( 116755, Core )
	ks_ActorMode( fakeCore, true )--�]�w�t����NPC
	SysCastSpellLv( Core, fakeCore, 497117, 0 )--�O�Ю֤ߦV�w���ȽľW�A�åB�z��
	--�Ҧ����a&�͵�NPC�e����t�B�˦a
	Sleep(5)
	DelObj( fakeCore )
	DelObj( Core )
	local PosX = ReadRoleValue( Boss, EM_RoleValue_X )
	local PosY = ReadRoleValue( Boss , EM_RoleValue_Y )
	local PosZ = ReadRoleValue( Boss , EM_RoleValue_Z )
	DelObj( Boss )
	local Count = PE_GetActivePlayerGUIDCount( ZONE14_PE05_PEIndex )
	for i = 1 , Count do
		local GUID = PE_GetActivePlayerGUID( ZONE14_PE05_PEIndex )
		AddBuff( GUID, 506098, 0, 3 )--�e����+��ʤ���
	end

	for i=1, table.getn(Good) do
		local Rnd = {	[1] = Rand(30)+10,
				[2] = Rand(30)+10
				}
		local RndMove = { 	[1] = 1+Rnd[rand(2)+1],
					[2] = 1-Rnd[rand(2)+1]
					}
		SetPos( Good[i], PosX+RndMove[rand(2)+1], PosY, PosZ+RndMove[rand(2)+1], 0 )
		SetDefIdleMotion( Good[i], ruFUSION_MIME_IDLE_STAND )
		local X = ReadRoleValue( Good[i] , EM_RoleValue_X )
		local Z = ReadRoleValue( Good[i] , EM_RoleValue_Z )
		local Dir = CalDir( (PosX-X), (PosZ-Z) )
		SetDir( Good[i], Dir )
		SetModeEx( Good[i], EM_SetModeType_Move , false )--����
		ClearHateList( Good[i], -1 )
		if i < 4 then
			SetModeEx( Good[i], EM_SetModeType_HideName , false )-- �W��
		end
	end
	
	sleep(20)
	NPCSay( Good[2], "[SC_ZONE14_PE05_GOOD07]" )--�o�O���^�ơH
	sleep(30)
	--(��L�͵�npc�]���_)
	NPCSay( Good[1], "[SC_ZONE14_PE05_GOOD08]" )--�ݨӬO�O�Ю֤߻P�]�ڦP�k��ɤF�C
	sleep(30)
	NPCSay( Good[3], "[SC_ZONE14_PE05_GOOD09]" )--���צp��A�ڭ��٬O���^��a�A���a�I
	sleep(30)
	local X = GetMoveFlagValue( FlagID , 6 , EM_RoleValue_X )
	local Y = GetMoveFlagValue( FlagID , 6 , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( FlagID , 6 , EM_RoleValue_Z )
	
	--(�Ҧ����a�Q�ǰe�^�M�ԥ��W��a�A����o�������Ȫ��X�СA�i�Jstep1)
	local Count = PE_GetActivePlayerGUIDCount( ZONE14_PE05_PEIndex )
	for i = 1 , Count do
		local Rnd = {	[1] = Rand(30),
				[2] = Rand(30)
				}
		local RndMove = { 	[1] = 1+Rnd[rand(2)+1],
					[2] = 1-Rnd[rand(2)+1] 
					}
					
		local GUID = PE_GetActivePlayerGUID( ZONE14_PE05_PEIndex )
		if CheckAcceptQuest( GUID, 424087 ) == true and CheckFlag( GUID, 544988 ) ~= true then
			-- 2013/3/28 ���B�ק�G�W�[debug�A�T�{���a�Q�T�{�i������n���~
			DebugMsg(GUID, 0, ">>>>>>>  got flag 544988")
			SetFlag( GUID, 544988 , 1 )--������������
		else
			-- 2013/3/28 ���B�ק�G�W�[debug�A�T�{���a�Q�T�{�i������n���~
			DebugMsg(GUID, 0, ">>>>>>>  you can't get flag 544988!")
		end
		SetPos( GUID, X+RndMove[rand(2)+1],Y, Z+RndMove[rand(2)+1], 0 )
	end	
	Lua_ZONE14_PE05_End()
end

function Lua_ZONE14_PE05_End()--�����B�z
	local Ctrl = ZONE14_PE05_Var["Controller"]
	local Good = ZONE14_PE05_Good
	for i=1, table.getn(Good) do
		DelObj( Good[i] )
	end
	local Fighter = ZONE14_PE05_Var["Fighter"]
	for i=1, table.getn(Fighter) do
		if CheckID(Fighter[i]) == true then
			DelObj(Fighter[i])
		end
	end
	if CheckID(ZONE14_PE05_Var["BossDoor1"]) == true then
		DelObj(ZONE14_PE05_Var["BossDoor1"])
	end
	if CheckID(ZONE14_PE05_Var["BossDoor2"]) == true then
		DelObj(ZONE14_PE05_Var["BossDoor2"])
	end
	if CheckID(ZONE14_PE05_Var["Door1"]) == true then
		DelObj(ZONE14_PE05_Var["Door1"])
	end
	if CheckID(ZONE14_PE05_Var["Door2"]) == true then
		DelObj(ZONE14_PE05_Var["Door2"])
	end	
	Lua_ZONE14_PE05_GlobalSet()
	ZONE14_PE04_Count = 0 
	DelObj( Ctrl )
end

function Lua_ZONE14_PE05_SetPosIn()--�ǰe�i�J
	if CheckFlag( OwnerID(), 544979 ) == true then
		AddBuff( OwnerID(), 509461, 0, -1 )--�i�J�ϰ��ˬdBUFF
		sleep(10)
		AddBuff( OwnerID(), 506098, 0, 2 )--�e���@��
		local FlagID = ZONE14_PE05_Var["FlagID"]
		local Pos = {}
		Pos[1] = GetMoveFlagValue( FlagID , 2 , EM_RoleValue_X )
		Pos[2] = GetMoveFlagValue( FlagID , 2 , EM_RoleValue_Y )
		Pos[3] = GetMoveFlagValue( FlagID , 2 , EM_RoleValue_Z )
		Pos[4] = ZONE14_PE05_Var["Dir"]

		SetPos( OwnerID(), kg_GetPosRX( Pos, nil , 15 , 0, math.random(-45,45) ) )		
	end
end

function Lua_ZONE14_PE05_SetPosOut()--�ǰe���}
	local FlagID = ZONE14_PE05_Var["FlagID"]
	local Pos = {}
	Pos[1] = GetMoveFlagValue( FlagID , 7 , EM_RoleValue_X )
	Pos[2] = GetMoveFlagValue( FlagID , 7 , EM_RoleValue_Y )
	Pos[3] = GetMoveFlagValue( FlagID , 7 , EM_RoleValue_Z )
	Pos[4] = ZONE14_PE05_Var["BadDir"]
	AddBuff( OwnerID(), 506098, 0, 2 )--�e���@��
	
	SetPos( OwnerID(), kg_GetPosRX( Pos, nil , 50 ) )
end