
function ESFR_Initialize()
	DebugMsg(0,0, "This is ESFR initializing")
	CloseSpeak( OwnerID())
	CallPlot(OwnerID(),"Event_Story_Fest_RedRidinghood");
end

------------------------------------------------------------------------------------------------------------------------------------------------------
	--���ʧ���B�@�禡--
------------------------------------------------------------------------------------------------------------------------------------------------------
function Event_Story_Fest_RedRidinghood()
	AddBuff(OwnerID() , 503217, 0, -1)
	DebugMsg(0,0," this is plot Wy_02959!!")

	local EndEvent = false;	-- 2015.08.31 ���E:�N�����ܼ��ܧ󬰰ϰ��ܼơA�ΥH�P�_���m����A�U�O�b���ȧ����ɡB�ؼФ��s�b(���u)�ɡBBuff����(���`�����u)�ɡB�W�X���ʽd��ɭ��m�C

	local PlayerTable = {}							--�������a��GUID table
	local player = 0							--�ѻP���a��GUID
	local EventOwner = false
	local iDebug = false							--(�Ц��H��)��l�ư��Υζ}��
	local Debug = true							--(�Ц��H��)���Υζ}��
	local waiting = true							--���ʫݩR�}��
	local activated = false							--���ʳ����Ұ�
	local tempTarget = 0							--�ե��|�Ψ쪺�ܼ�(?)
	local tempX, tempY, tempZ, tempDir = 0, 0, 0, 0				--�ե��|�Ψ쪺�ܼ�(��?)
	local wolf_OrgID = 107846						--�j���T��OrgID
	local RedRidinghood_OrgID = 122609					--�p���U��OrgID
	local Roadsigns_OrgID = 122690						--���Ъ�OrgID
	local Flowers_OrgTable = {0,122621, 122718, 122721} 			--�T���᪺OrgID_table
	local Flags = 781318							--�㹳�X�mOrgID
	local AllFlags = GetMoveFlagCount(Flags);				--���o�㹳�X�m
	local Roadsigns_GUID_table = {}						--���Ъ�GUID_Table
	local Wolves_GUID_table = {}						--�j���T��GUID_Table
	local Flowers_GUID_table = {}						--�T���᪺GUID_Table
	local RedRidinghood = 0						--(�|�@�����S�@�����g��)�p���UGUID
	local score = 0
	local halt = false							--�p���U���Ȱ��}��
	local halt_timer = 0							--�p���U���Ȱ��p�ɾ�
	local red_moving = true							--�p���U���ʶ}��									
	local restart = true							--�p���U�^��_�I�}��
	local RRH_now = 1							--�Ҧ��H�@�Ϊ��Ȧs��m�P�_
	local RRH_Dir = 1							--�Ҧ��H�@�Ϊ��Ȧs��V�P�_
	local RRH_Des = 1							--�Ҧ��H�@�Ϊ��Ȧs�ت��a�P�_
	local Wolf_now = {}							--�T��e����table
	local Wolf_Dir = {}							--�T��e���Ф��table
	local Wolf_Des = {}							--�T��e�ت��a���� table
	local All_Roadsigns_Where_To_GO_table = {				--(��������)���Ы��V��
		{2,0,0,0},
		{5,0,1,3},
		{6,2,0,4},
		{7,3,0,0},
		{10,0,2,6},
		{8,5,3,7},
		{9,6,4,0},
		{11,0,6,9},
		{0,8,7,0},
		{0,0,5,11},
		{12,10,8,0},
		{0,0,11,0}
	}				
	local Wolf_Temp_Position = {						--�j���T��m�n��table	{ {1x,1y,1z} , {2x, 2y, 2z } }
		{ 	},							--�Ĥ@����XYZ
		{	}							--�ĤG����XYZ
	}			
	local Score_Position = {}							--�o��(�p��B���I)��m�n��table	{ {1x,1y,1z} , {2x, 2y, 2z } , {3x, 3y, 3z } , {4x, 4y, 4z } }
	Score_Position[1] = {	}						--�Ĥ@����XYZ
	Score_Position[2] = {	}						--�ĤG����XYZ
	Score_Position[3] = {	}						--�ĤT����XYZ
	Score_Position[4]= {1,2,3}						--���I��XYZ	
	local RRH_Position = {}							--�p���U��e��mtable
	local wolf_spawn_num = {
		{4, 6, 9},
		{ 10,11,8}
	}
------------------------------------------------------------------------------------------------------------------------------------------------------
	--�̷ӺX�m���͸��Шè̷ӽs������GUID--
------------------------------------------------------------------------------------------------------------------------------------------------------
	for a = 1, 12 do
		tempX = GetMoveFlagValue( Flags, a , EM_RoleValue_X )  
		tempY = GetMoveFlagValue( Flags, a , EM_RoleValue_Y)  
		tempZ = GetMoveFlagValue( Flags, a , EM_RoleValue_Z )  
		tempDir = GetMoveFlagValue( Flags, a , EM_RoleValue_Dir ) 
		local CreateRoadsigns = CreateObj(Roadsigns_OrgID, tempX, tempY,tempZ,tempDir,1)
		table.insert(Roadsigns_GUID_table, CreateRoadsigns)
		MoveToFlagEnabled( CreateRoadsigns , false ); 
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register1, All_Roadsigns_Where_To_GO_table[a][1])
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register2, All_Roadsigns_Where_To_GO_table[a][2])
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register3, All_Roadsigns_Where_To_GO_table[a][3])
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register4, All_Roadsigns_Where_To_GO_table[a][4])
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register5, a)
		local random = RandRange(1,4)
		local not_finish = true
		while not_finish do
			random = random+1
			-----------------------				
			if random > 4 then
				random = 1
			end
			-----------------------
			if All_Roadsigns_Where_To_GO_table[a][random] ~=0 then
				WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register9, random)
				-----------------------
				if  ReadRoleValue(CreateRoadsigns , EM_RoleValue_Register9) == 2 then
					AdjustDir(CreateRoadsigns , 90)
				elseif ReadRoleValue(CreateRoadsigns , EM_RoleValue_Register9) == 3 then
					AdjustDir(CreateRoadsigns , 180)
				elseif ReadRoleValue(CreateRoadsigns , EM_RoleValue_Register9) == 4 then
					AdjustDir(CreateRoadsigns , 270)
				else
					AdjustDir(CreateRoadsigns , 0)				
				end
				not_finish=false
				SetPlot(CreateRoadsigns , "touch" , "Roadsigns_Plot" , 15)
				-----------------------
			end
			-----------------------
		sleep(1)
		end
		AddToPartition(CreateRoadsigns ,0)
		-----------------------
	end
	-----------------------
	local PointBuff = CreateObj(113117 ,tempX, 65 ,tempZ ,tempDir,1)
	Score_Position[4][1]= tempX
	Score_Position[4][2]= tempY
	Score_Position[4][3]= tempZ
------------------------------------------------------------------------------------------------------------------------------------------------------
	--�̷Ӹ��в��ͤp���U--
------------------------------------------------------------------------------------------------------------------------------------------------------
	local CreateRRH = Lua_CreateObjByDir( Roadsigns_GUID_table[1] , 122609 , -9 , 45); 				--122609���ͤp���U��1�����Ы��
	AddToPartition(CreateRRH , 0)
	RedRidinghood = (CreateRRH)
	WriteRoleValue(RedRidinghood,EM_RoleValue_Register10,1)
	MoveToFlagEnabled( RedRidinghood , false );								--�����p���U���w�]����
	WriteRoleValue(RedRidinghood , EM_RoleValue_IsWalk , 1)						--�ҥΦ樫�Ҧ�
	RRH_Des = 1												--���U�n�e�������и��X
	WriteRoleValue(RedRidinghood, EM_RoleValue_Register5, 10 )	
	AddBuff(RedRidinghood , 624228, 0, -1)									--���U��tNURF
------------------------------------------------------------------------------------------------------------------------------------------------------
	--���ʫݩR��--
------------------------------------------------------------------------------------------------------------------------------------------------------
	while waiting do
		if ReadRoleValue(OwnerID(),EM_RoleValue_Register8) == 1 then
			player = ReadRoleValue(OwnerID(), EM_RoleValue_Register7)
			DesignLog(Player ,122722 ,"Accept" )
			waiting = false
			activated = true
			AddBuff ( player, 624633, 0, 90 )
			AddBuff ( player, 624635, 0, -1)
			SetFlag( player , 548188 , 1 ) 
			ScriptMessage( player , player , 2, "[WY_STORY_REDRIDINGHOOD_START]", 0)
			Yell(OwnerID(), "[WY_STORY_REDRIDINGHOOD_REDSTART]"..GetName(player).." !", 3)
		end
		sleep(10)
		if activated then												--�ҰʫᲣ�ͳ��T�B�p��--
			SetModeEx(PointBuff, EM_SetModeType_Gravity , false)
			SetModeEx(PointBuff, EM_SetModeType_AlignToSurface , false)
			SetModeEx(PointBuff, EM_SetModeType_Mark, false)
			AddToPartition(PointBuff ,0)
			----------------------------------------------------------------------------------------------------------------------------------------------------	
			local  random_number = RandRange(1,#wolf_spawn_num[1])
			for b = 1 , 2 do
				local TempNumber = wolf_spawn_num[b][random_number]
				tempX = ReadRoleValue(Roadsigns_GUID_table[TempNumber] , EM_RoleValue_X)
				tempY = ReadRoleValue(Roadsigns_GUID_table[TempNumber] , EM_RoleValue_Y)
				tempZ = ReadRoleValue(Roadsigns_GUID_table[TempNumber] , EM_RoleValue_Z)
				tempDir = ReadRoleValue(Roadsigns_GUID_table[TempNumber] , EM_RoleValue_Dir)
				local CreateWolves = CreateObj(wolf_OrgID, tempX, tempY, tempZ, tempDir , 1)		--107846���ͤj���T��椤���H����Ӹ��Ц�m�W
				AddToPartition(CreateWolves , 0)
				table.insert(Wolves_GUID_table , CreateWolves)
				WriteRoleValue(Wolves_GUID_table[b] , EM_RoleValue_Register10 , TempNumber)		--�U�O���U�Ⱖ�T���X���I
				table.insert(Wolf_now, TempNumber)								--�إ߲ŦX�T�X���I����e��mtable
				table.insert(Wolf_Des, TempNumber)
				AddBuff (Wolves_GUID_table[b], 624635, 0, -1)
				MoveToFlagEnabled( Wolves_GUID_table[b] , false );						--�����T���w�]����
				WriteRoleValue(Wolves_GUID_table[b] , EM_RoleValue_IsWalk , 1)				--�ҥΦ樫�Ҧ�
				WriteRoleValue(Wolves_GUID_table[b], EM_RoleValue_Register5, 18 )
				WriteRoleValue(Wolves_GUID_table[b], EM_RoleValue_Register1, TempNumber)
				Wolf_now[b] = TempNumber
				AddBuff(Wolves_GUID_table[b] , 624228, 0, -1)						--���U��tNURF
				SetModeEx(Wolves_GUID_table[b] ,EM_SetModeType_Strikback , false)				--���n����
				SetModeEx(Wolves_GUID_table[b] ,EM_SetModeType_Searchenemy , false)			--���n����
				SetModeEx(Wolves_GUID_table[b] ,EM_SetModeType_Fight , false)				--���n�Q����
			end
------------------------------------------------------------------------------------------------------------------------------------------------------
			flower_spawn_num = {6,9,10}
			for c =  1 , 3 do
				local TempNumber  = flower_spawn_num[c]
				local CreateFlowers = Lua_CreateObjByDir( Roadsigns_GUID_table[TempNumber] , Flowers_OrgTable[c+1] , 13 , 180)	 --���ͤT�ؤp���6�B9�B10�T�Ӹ��Ц�m�e
				AddToPartition(CreateFlowers , 0)
				table.insert(Flowers_GUID_table , CreateFlowers)
				Score_Position[c][1]=ReadRoleValue(Flowers_GUID_table[c],EM_RoleValue_X)
				Score_Position[c][2]=ReadRoleValue(Flowers_GUID_table[c],EM_RoleValue_Y)
				Score_Position[c][3]=ReadRoleValue(Flowers_GUID_table[c],EM_RoleValue_Z)
			end
		end
	end
	sleep(25)
------------------------------------------------------------------------------------------------------------------------------------------------------
	--���ʨ��Ұ�--
------------------------------------------------------------------------------------------------------------------------------------------------------
	while activated do
		PlayerTable = SearchRangePlayer (Roadsigns_GUID_table[9] , 135)
		for n = 0, #PlayerTable-1 do
			tempTarget = PlayerTable[n]
			if tempTarget ~= player then
				ScriptMessage( OwnerID() ,OwnerID()  , 2, "[WY_STORY_REDRIDINGHOOD_INVAID]", 0)
				SetPos(tempTarget, 3200, 45, 65, ReadRoleValue(tempTarget, EM_RoleValue_Dir))
				AddBuff(tempTarget, 624678, 0, 1)
			end
		end
-----------------------------------------------------
	--�j���T�n���--
-----------------------------------------------------
		for n = 1,2 do	
			Wolf_Temp_Position[n][1] = ReadRoleValue(Wolves_GUID_table[n],EM_RoleValue_X)						--�O���j���T��e��m���K�ϥΪ�table
			Wolf_Temp_Position[n][2] = ReadRoleValue(Wolves_GUID_table[n],EM_RoleValue_Y)						--^
			Wolf_Temp_Position[n][3] = ReadRoleValue(Wolves_GUID_table[n],EM_RoleValue_Z)						--^
			tempX = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_X)
			tempY = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Y)
			tempZ = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Z)
			tempDir = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Dir)	
			if math.abs(Wolf_Temp_Position[n][1] - tempX)<10 and math.abs(Wolf_Temp_Position[n][3] - tempZ)<10 then			--�p�G��F���Э��s���V
				-----------------------�j���T���������
				if ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]], EM_RoleValue_Register5) == ReadRoleValue(Wolves_GUID_table[n], EM_RoleValue_Register1) then
					CallPlot(Roadsigns_GUID_table[Wolf_Des[n]], "Roadsigns_Org_Plot")
				else
					WriteRoleValue(Wolves_GUID_table[n], EM_RoleValue_Register1, Wolf_now[n])
				end
				-----------------------
				Wolf_now[n] = Wolf_Des[n]												--���s�w�q�T��e���и��X
				if Wolf_now[n] ~= ReadRoleValue(Wolves_GUID_table[n], EM_RoleValue_Register5) then
					Wolf_Dir[n] = ReadRoleValue(Roadsigns_GUID_table[Wolf_now[n]],EM_RoleValue_Register9)			--�T��e�ؼФ��
					Wolf_Des[n] = All_Roadsigns_Where_To_GO_table[Wolf_now[n]][Wolf_Dir[n]]
					tempX = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_X)
					tempY = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Y)
					tempZ = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Z)
					tempDir = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Dir)								
					move(Wolves_GUID_table[n], tempX , tempY , tempZ)
					WriteRoleValue(Wolves_GUID_table[n],EM_RoleValue_Register10,Wolf_now[n])
					WriteRoleValue(Wolves_GUID_table[n],EM_RoleValue_Register10,Wolf_des[n])					--�T�N�n�e�������и��X
				end
			end
		end
-----------------------------------------------------
	--�p���U�n���--
-----------------------------------------------------
		if ReadRoleValue(RedRidinghood,EM_RoleValue_Register4) == 0 then
			halt = false
		end
		if not halt then
			RRH_Position[1] = ReadRoleValue(RedRidinghood,EM_RoleValue_X)
			RRH_Position[2] = ReadRoleValue(RedRidinghood,EM_RoleValue_Y)
			RRH_Position[3] = ReadRoleValue(RedRidinghood,EM_RoleValue_Z)
			tempX = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_X)
			tempY = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Y)
			tempZ = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Z)
			tempDir = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Dir)
			-----------------------
			if math.abs(RRH_Position[1] - tempX)<10 and math.abs(RRH_Position[3] - tempZ)<10 then							--�p�G��F���Э��s���V
				RRH_now = RRH_Des
				if RRH_now ~= ReadRoleValue(RedRidinghood ,EM_RoleValue_Register5 ) then
					StopMove(RedRidinghood,false)  
					RRH_Dir = ReadRoleValue(Roadsigns_GUID_table[RRH_now],EM_RoleValue_Register9)					--���U�e�ؼФ��
					RRH_Des = All_Roadsigns_Where_To_GO_table[RRH_now][RRH_Dir]							--���U�n�e�������и��X
					tempX = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_X)
					tempY = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Y)
					tempZ = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Z)
					tempDir = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Dir)
					move(RedRidinghood, tempX , tempY , tempZ)		
					WriteRoleValue(RedRidinghood, EM_RoleValue_Register5, RRH_now )							--���U�p���U���X�o�I	
					WriteRoleValue(RedRidinghood, EM_RoleValue_Register10, RRH_Des)							--���s�w�q���U�Ҧb�����и��X
				end
			end
		end
		for m = 1,2 do	
			if math.abs(Wolf_Temp_Position[m][1] - RRH_Position[1]) <15 and math.abs(Wolf_Temp_Position[m][3] - RRH_Position[3] )<15 then		--�p�J�쳥�TĲ�o���U����
				ScriptMessage( player , player  , 2, "[WY_STORY_REDRIDINGHOOD_FAIL]", 0)
				Say(RedRidinghood, "[WY_STORY_REDRIDINGHOOD_FAIL]")
				StopMove(RedRidinghood,0)
				tempX = 3188
				tempY = 45
				tempZ = -30
				tempDir = ReadRoleValue(Roadsigns_GUID_table[1] , EM_RoleValue_Dir)
				RRH_Position[1] = ReadRoleValue(RedRidinghood, EM_RoleValue_X)
				RRH_Position[2] = ReadRoleValue(RedRidinghood, EM_RoleValue_Y)
				RRH_Position[3] = ReadRoleValue(RedRidinghood, EM_RoleValue_Z)
				while math.abs(tempX - RRH_Position[1])>5 or math.abs(tempZ - RRH_Position[3]) >5 do
					RRH_Position[1] = ReadRoleValue(RedRidinghood,EM_RoleValue_X)
					RRH_Position[2] = ReadRoleValue(RedRidinghood,EM_RoleValue_Y)
					RRH_Position[3] = ReadRoleValue(RedRidinghood,EM_RoleValue_Z)
					WriteRoleValue(RedRidinghood, EM_RoleValue_IsWalk, 0)
					move(RedRidinghood, tempX, tempY, tempZ)
					RRH_now = 1
					RRH_Des = 1
					sleep(10)
				end
				WriteRoleValue(RedRidinghood, EM_RoleValue_IsWalk, 1)
				StopMove(RedRidinghood,0)
				WriteRoleValue(RedRidinghood, EM_RoleValue_Register4, 5)
				halt = true
				WriteRoleValue(RedRidinghood, EM_RoleValue_Register5, 18)
			end
		end
		WriteRoleValue(RedRidinghood, EM_RoleValue_Register10, RRH_now)
		---------------------
		for index , value in ipairs(Score_Position) do	-- �o���I���y��
			if math.abs(value[1] - RRH_Position[1])<10 and math.abs(value[3] - RRH_Position[3])<10 then						--�p�G�J��p��άO���I�o��
				if value[1] == ReadRoleValue(Roadsigns_GUID_table[12], EM_RoleValue_X) and value[3] == ReadRoleValue(Roadsigns_GUID_table[12], EM_RoleValue_Z) then
					Say(RedRidinghood, "[WY_STORY_REDRIDINGHOOD_FIN]"..GetName(player).. "[WY_STORY_REDRIDINGHOOD_FINISH]")	-- �p���U�ܲ��I�ɪ����
					EndEvent = true;
					halt_timer = GetSystime( 0 )
					RRH_Position[1] = 0
					RRH_Position[2] = 0
					RRH_Position[3] = 0
					AddBuff ( player, 624516, 0, -1 )
					CancelBuff(player , 624633)
					ScriptMessage( OwnerID() ,OwnerID()  , 2, "[WY_STORY_REDRIDINGHOOD_END]", 0)
				else	-- �����ɱo��
					Say(RedRidinghood, "[WY_STORY_REDRIDINGHOOD_FLOWER]")
					AddBuff ( player, 624516, 0, -1 )
					AddBuff ( RedRidinghood, 621971 , 0 , 1)
					DelObj(Flowers_GUID_table[index])
					table.remove(Flowers_GUID_table, index)
					table.remove(Score_Position , index)
				end
			score = score +1
			end
		end
		if not CheckID(player) or not CheckBuff(player, 624633) then	-- ��ؼФ��s�b�Φ]���`�P�� Buff ������
			halt_timer = GetSystime( 0 )
			RRH_Position[1] = 0
			RRH_Position[2] = 0
			RRH_Position[3] = 0
			EndEvent = true;
		end
		if not CheckDistance( player, Roadsigns_GUID_table[9], 190 ) then
			CancelBuff(player , 624633)
			ScriptMessage( player , player , 2, "[WY_STORY_REDRIDINGHOOD_OOR]", 0)	-- �z�w�W�X���ʽd��A�ɭP���ʤ���C
			EndEvent = true;
		elseif not CheckDistance( player, Roadsigns_GUID_table[9], 175 ) then	-- �`�N�I �z�ثe�Z�����ʽd��L���A�������ʽd��N�ɭP���ʤ��_�I
			ScriptMessage( player ,player  , 2, "[WY_STORY_REDRIDINGHOOD_WARNING]", 0)
		end
		if EndEvent then
			StopMove(RedRidinghood,0)
			for index , value in ipairs(Wolves_GUID_table) do
				StopMove(value, 0)
			end
			Sleep(50);
		--	for Countdown = 1,5 do
		--		if Countdown == 5 then
					activated = false
					Delobj(RedRidinghood)
					for index , value in ipairs(Wolves_GUID_table) do
						Delobj(value)
					end
					for i , v in ipairs(Roadsigns_GUID_table) do
						Delobj(v)
					end
					for i, v in ipairs(Flowers_GUID_table) do
						DelObj(v)
					end
					EndEvent = false;
					DelObj(PointBuff)
					Yell(OwnerID(),"[WY_STORY_REDRIDINGHOOD_REDEND]"..GetName(player).."!", 3)
		--		end
		--		sleep(10)
		--	end
		--	WriteRoleValue(OwnerID(), EM_RoleValue_Register8, 0)
		end
	sleep(10)
	end --while end here
	WriteRoleValue(OwnerID(), EM_RoleValue_Register8, 0)
	CallPlot(OwnerID(),"ESFR_Initialize");
end 
------------------------------------------------------------------------------------------------------------------------------------------------------
	--����Plot�Ұʨ禡--
------------------------------------------------------------------------------------------------------------------------------------------------------
function Roadsigns_Plot()
	if CheckBuff( OwnerID() , 624635) then
		Roadsigns_Org_Plot()
	else
		ScriptMessage( OwnerID() ,OwnerID()  , 2, "[WY_STORY_REDRIDINGHOOD_MESSAGE]", 0)
	end
end

function Roadsigns_Org_Plot()
	local n = ReadRoleValue(TargetID(),EM_RoleValue_Register9)
	local current_Displace = ReadRoleValue(TargetID(), EM_RoleValue_Dir) %90
	local Displace_Value = n
	local Adj_Value = 0
	n = n+1
	local Direction_Table={
		ReadRoleValue(TargetID(), EM_RoleValue_Register1), 
		ReadRoleValue(TargetID(), EM_RoleValue_Register2),
		ReadRoleValue(TargetID(), EM_RoleValue_Register3),
		ReadRoleValue(TargetID(), EM_RoleValue_Register4)
				}
	-----------------------
	while not Direction_Table[n] or Direction_Table[n] == 0 do
		if not Direction_Table[n] then n = 1
		else n = n+1 end
	end
	WriteRoleValue(TargetID(), EM_RoleValue_Register9, n)
	-----------------------�P�_�����Цb�U�ر��p�Ӧp�����-----------------------
	if n <Displace_Value then
		Adj_Value = ( 4 - Displace_Value  +  n) * 90
	else
		Adj_Value = ( n - Displace_Value )*90
	end
	AdjustDir(TargetID(), Adj_Value)
end
------------------------------------------------------------------------------------------------------------------------------------------------------
	--���ʹ�ܱҰʨ禡--
------------------------------------------------------------------------------------------------------------------------------------------------------
function Event_Story_Fest_RedRidinghood_Dialogue()
	if ReadRoleValue(TargetID(), EM_RoleValue_Register7) == OwnerID() and ReadRoleValue(TargetID(), EM_RoleValue_Register8) == 1 then
		SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_INPLAY]")
		return
	end
	if CheckFlag( OwnerID() , 548188) then
		SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_ALREADY]")
	else
		if ReadRoleValue(TargetID(), EM_RoleValue_Register8) == 1 then
			SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_WAIT]")
		else
			SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_GREET] ")
			AddSpeakOption(OwnerID(),TargetID(), "[WY_STORY_REDRIDINGHOOD_HOW]", "Event_Story_Fest_Explan" , 0)
			AddSpeakOption(OwnerID(),TargetID(), "[WY_STORY_REDRIDINGHOOD_OPT_JOIN]", "ESFR_start" , 0)
		end
	end
end

function Event_Story_Fest_Explan()
	SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_EXPLANE]")
	AddSpeakOption(OwnerID(),TargetID(), "[WY_STORY_REDRIDINGHOOD_OPT_JOIN]", "ESFR_start" , 0)
	WriteRoleValue(TargetID(),EM_RoleValue_Register7,OwnerID())
	CloseSpeak(OwnerID())
end

function Event_Story_Fest_Restart()
	CloseSpeak(OwnerID())
	WriteRoleValue(TargetID(), EM_RoleValue_Register4, 0)
	Say(TargetID(), "[WY_STORY_REDRIDINGHOOD_GO]")
end

function ESFR_start()

	local Owner = OwnerID();
	local Target = TargetID();
	local Running = ReadRoleValue( Target, EM_RoleValue_Register8 );

	if Running == 1 then
		SetSpeakDetail( Owner, "[WY_STORY_REDRIDINGHOOD_WAIT]" );	-- ���ȶi�椤
	else
		WriteRoleValue( Target, EM_RoleValue_Register7, Owner );	-- �N���a�g�J���� Npc �� Reg+7 ��
		WriteRoleValue( Target, EM_RoleValue_Register8, 1 );	-- �N�w�������Ȫ��A�g�J�� Npc �� Reg+8 ��
	end

	local TempTable = SearchRangePlayer( Target, 80 );	-- �����d�򤺨�L�w�}�ҹ�ܵ��������a
	for i,v in pairs(TempTable) do
		CloseSpeak(v);
	end
end

function ESFR_Buff_Count()
	local X = BuffCount(OwnerID())
	DebugMsg(0,0, "X = "..X)
	local TempID = 0
	local score = 10
	local score_count_buff = 624516
	for Y = 0, X-1 do
		DebugMsg(0,0, "found buff ID = "..BuffInfo(OwnerID(), Y ,EM_BuffInfoType_BuffID ))
		if BuffInfo(OwnerID(), Y ,EM_BuffInfoType_BuffID ) == score_count_buff then
			DebugMsg(0,0, "Buff Power = "..BuffInfo(OwnerID(), Y ,EM_BuffInfoType_Power ))
			score = BuffInfo(OwnerID(), Y ,EM_BuffInfoType_Power )
		end
	end
	if score <= 2 then
		GiveBodyItem(OwnerID(), 240059 , score+1 )
	elseif  score == 10 then
		GiveBodyItem(OwnerID(), 724509 , 1)
	elseif score == 3 then
		GiveBodyItem(OwnerID(), 240059 , 5)
	end
	CancelBuff(OwnerID() , score_count_buff)
	CancelBuff (OwnerID(), 624635)
end

function RED_122609()
	if CheckBuff( OwnerID() , 624635) then
		if ReadRoleValue(TargetID(), EM_RoleValue_Register4) ==5 then
			SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_RESTART]")
			AddSpeakOption(OwnerID(),TargetID(),"[WY_STORY_REDRIDINGHOOD_RSOP]","Event_Story_Fest_Restart", 0)
		else
			SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_RED]")
		end
	else
		SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_WHORU]")
	end
end

function kill_all_event_NPC()
	local TempTable = {}
	local TempID = 0
	TempTable = SearchRangeNPC(OwnerID(), 800)
	for a = 1, #TempTable do
		TempID = TempTable[a]
		if ReadRoleValue(TempID, EM_RoleValue_OrgID) == 122609 or ReadRoleValue(TempID, EM_RoleValue_OrgID) == 122690 or ReadRoleValue(TempID, EM_RoleValue_OrgID) == 122722 or
		   ReadRoleValue(TempID, EM_RoleValue_OrgID) == 113117 then
			DelObj(TempID)
		end
	end
end

function Event_RRH_Add_Score()
	AddBuff (OwnerID(), 624516, 0, -1 )
end