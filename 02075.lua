--/gm ? createFlag 780777 0 
--/gm ? delflaglist 780777

--NPC��Register1 �O�O�����a���q������
--NPC��Register2 �O�O�����a���}������
--NPC��Register3 �O�O�����a�ͦs�ɶ�
--NPC��Register4 �O�O�����a�{�b���ж����X
--NPC��Register5 �O�O�����a�{�b�O�_�b�԰����A0�����}�l�C���A1���԰����A2���𮧤��A3������
--NPC��Register6 �O�O�����a���S���ϥμW�T�]��
function Lua_AncientDreamSpace_DoorInSet()
	SetSpeakDetail(OwnerID(),"[ADS_DOOR]")
	
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_DOOR_OPTION]", "Lua_AncientDreamSpace_DoorIN", 0) --���`�i�J�ڹ�
end

function Lua_AncientDreamSpace_DoorIn()
	ChangeZone( OwnerID(), 356 , -1 , 4795, 8.5, 907, 269)
end

function Lua_AncientDreamSpace_DoorOutSet()
	SetPlot(OwnerID() ,"touch","Lua_AncientDreamSpace_DoorOut",150) 
end

function Lua_AncientDreamSpace_DoorOut()
	ChangeZone( OwnerID(), 2 , 0 , -1343, -370, 2117, 359)
end

function Lua_AncientDreamSpace_NPC_creat()
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register3,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register4,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register5,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register6,0)
end

function Lua_AncientDreamSpace_intro()
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID)
	if CheckFlag( OwnerID()  , 544419 ) == TRUE then	--�T�{���a�O�_���Ѥw�g���L
		SetSpeakDetail( OwnerID(), "[ADS_HAVEPLAY]"   )	--�w�g���L
	else
		SetSpeakDetail( OwnerID(), "[ADS_INTRO]"   )
		AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING01_1]", "Lua_AncientDreamSpace_Enter01", 0) --���`�i�J�ڹ�
		if ReadRoleValue(TargetID() , EM_RoleValue_Register5) == 0 then
			AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING01_2]", "Lua_AncientDreamSpace_Enter02", 0) --�ϥμW�T�]�۫�i�J�ڹ�
		end
		AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING02]", "Lua_AncientDreamSpace_Rule", 0) --
	end
	--�T�w�M������b���H
	if ADSPartyMember ~= nil and ADSPartyMember[RoomID] ~= nil then
		for i=1,table.getn(ADSPartyMember[RoomID]) do
			if ADSPartyMember[RoomID][i] ~= nil and CheckID(ADSPartyMember[RoomID][i]) ==FALSE then
				table.remove(ADSPartyMember[RoomID],i)
			end
		end
	end
end

function Lua_AncientDreamSpace_Rule()
	SetSpeakDetail( OwnerID(), "[ADS_RULE]"   )
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING03]", "Lua_AncientDreamSpace_intro", 0)
end

function Lua_AncientDreamSpace_Enter01() --���`�i�J�ڹ�
	local NPC = TargetID()
	WriteRoleValue(NPC,EM_RoleValue_Register6,0)
	Lua_AncientDreamSpace_Start(TargetID(),OwnerID())
end

function Lua_AncientDreamSpace_Enter02() --�ϥμW�T�]�۫�i�J�ڹ�
	local NPC = TargetID()
	if CountBodyItem( OwnerID(), 208680 ) >= 1 then
		WriteRoleValue(NPC,EM_RoleValue_Register6,1)	
		Lua_AncientDreamSpace_Start(TargetID(),OwnerID())
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING14]", 0 )
		CloseSpeak(OwnerID())
	end
end

function Lua_AncientDreamSpace_Start(NPC,Player)
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	--local NPC = TargetID()
	--local Player = OwnerID()
	local TempID
	local PartyNum = GetPartyID(Player , -1)	--Ū�����a����H��
	--�ˬd���a����
	CloseSpeak(Player)
	if PartyNum == 0 then
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_NOTINPARTY]" , C_SYSTEM ) --�A���b�@�Ӷ��
		return
	else
		if ReadRoleValue(NPC , EM_RoleValue_Register5) == 0 then
			for i=1,PartyNum do
				TempID = GetPartyID(OwnerID() , i )
				
				if ReadRoleValue( TempID , EM_RoleValue_ZoneID) ~= ZoneID or ReadRoleValue( TempID , EM_RoleValue_RoomID) ~= RoomID then
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_PARTYNOTREADY]" , C_SYSTEM ) --�A��������|�����
					return
				elseif CheckFlag( TempID  , 544419 ) == TRUE then	--�T�{���a�O�_���Ѥw�g���L
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_CHECKFLAG]" , C_SYSTEM ) --��������H���W�Ҳֿn���ڹү�q�i�ʤw��F�w���з�
					return
				end
			end
		end
	end
	--�ˬd�q�L����
	--�إߥΨӭp��s�����ƪ������ܼ�
	if ADSSurviveTimes == nil then
		ADSSurviveTimes = {}
	end
	if ADSSurviveTimes[RoomID] == nil then
		ADSSurviveTimes[RoomID] = 3
	end
	--�إ߰O����������ܼ�
	if ADSPartyMember == nil then
		ADSPartyMember = {}
	end
	if ADSPartyMember[RoomID] == nil then
		ADSPartyMember[RoomID] = {}
	end
	--�إ߰O����e��������̰����Ū������ܼ�
	if ADSPlayerMaxLV == nil then
		ADSPlayerMaxLV = ReadRoleValue( Player, EM_RoleValue_MaxLv )
	end
	--��JTable
	if ReadRoleValue(NPC , EM_RoleValue_Register5) == 0 then
		--�P�_���a�O�_���μW�T�]�ۨӼW�[�ɶ�
		if ReadRoleValue(NPC , EM_RoleValue_Register6) == 1 then
			DelBodyItem(OwnerID(),208680,1)
			WriteRoleValue(NPC,EM_RoleValue_Register3,3600)
		else
			WriteRoleValue(NPC,EM_RoleValue_Register3,1800)
		end
		--
		for i=1,PartyNum do
			TempID= GetPartyID(Player , i )	--Ū�����w���a����i�Ӷ���
			table.insert(ADSPartyMember[RoomID],TempID)
			Lua_AncientDreamSpace_PlayerSet(TempID,NPC)
			CloseSpeak(TempID)	--��Ҧ��H�}�Ҫ������������K�����Ͱ��D
		end
		Lua_AncientDreamSpace_Teleport(ADSPartyMember[RoomID],NPC)	--�s��ǰe
	else
		if CheckFlag(Player,544419) == FALSE then
			table.insert(ADSPartyMember[RoomID],Player)
			Lua_AncientDreamSpace_PlayerSet(Player,NPC)
			--
			if ReadRoleValue(NPC , EM_RoleValue_Register5) == 1 then	--�ˬd�O�_�԰���
				SetSpeakDetail( OwnerID(), "[ADS_PARTYINFIGHT]")
			elseif ReadRoleValue(NPC , EM_RoleValue_Register5) == 2 then --�ˬd�O�_�𮧤�
				Lua_AncientDreamSpace_Teleport(Player,NPC)	--����ǰe
			end
		end
	end

	--
	if ReadRoleValue(NPC , EM_RoleValue_Register1) == 0 then
		BeginPlot(NPC,"Lua_AncientDreamSpace_Main",0)
	end
end

function Lua_AncientDreamSpace_Main()
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local NPC = OwnerID()
	local Player = TargetID()
	local ADSCheck = TRUE
	local TempX
	local TempY
	local TempZ
	--=========�D�n���i��A�q�Y�}�l���~�]�o�q�A�i�J�j��=========--
	if ReadRoleValue(NPC , EM_RoleValue_Register1) == 0 then
		BeginPlot( NPC,"Lua_AncientDreamSpace_NPCSet",0)	--�}�l�ͦs�ɶ��˼�
		while TRUE do
			ADSCheck = Lua_AncientDreamSpace_Spawn(NPC)
			if ADSCheck == TRUE then
				for i=1,table.getn(ADSPartyMember[RoomID]) do	--��s�p���O
					Timer = ReadRoleValue( NPC , EM_RoleValue_Register3)
					TempX = ReadRoleValue(NPC , EM_RoleValue_Register1) 
					TempY = ReadRoleValue(NPC , EM_RoleValue_Register2)
					TempZ = TempX+TempY*30
					SetSmallGameMenuType( ADSPartyMember[RoomID][i] , 10 , 1 )
					SetSmallGameMenuStr( ADSPartyMember[RoomID][i] , 10 , 1 , "[ADS_BOARD_STATE][$SETVAR1="..ADSSurviveTimes[RoomID].."]" )
					SetSmallGameMenuStr( ADSPartyMember[RoomID][i] , 10 , 2 , "[ADS_BOARD_SCORE][$SETVAR1="..TempZ.."]" )
					ClockOpen( ADSPartyMember[RoomID][i] , EM_ClockCheckValue_15  , Timer , Timer , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--�ɶ��H���
				end

				Lua_AncientDreamSpace_Teleport(ADSPartyMember[RoomID],NPC)
			elseif ADSCheck == FALSE then
				WriteRoleValue(NPC,EM_RoleValue_Register5,3) --�O�����a�{�b�O�_�b�԰����A3������
				Lua_AncientDreamSpace_END(NPC)
				return
			end
			Sleep(50)	--�𮧮ɶ�
--			Sleep(100)
		end
	end
end
--=======================================================================================--
--									���̳]�w
--=======================================================================================--
function Lua_AncientDreamSpace_PlayerSet(Player,NPC)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local Timer = ReadRoleValue( NPC , EM_RoleValue_Register3)
	local TempX = ReadRoleValue(NPC , EM_RoleValue_Register1)
	local TempY = ReadRoleValue(NPC , EM_RoleValue_Register2)
	local TempZ = TempX+TempY*30
	if CheckFlag(Player,544419) == FALSE then
		SetFlag( Player, 544419 , 1 )
		AddBuff(Player,508008,0,-1)
		SetSmallGameMenuType( Player , 10 , 1 ) --�O���O�A��1���гy�A��2������
		SetSmallGameMenuStr( Player , 10 , 1 , "[ADS_BOARD_STATE][$SETVAR1="..ADSSurviveTimes[RoomID].."]" )	--�������`����
		SetSmallGameMenuStr( Player , 10 , 2 , "[ADS_BOARD_SCORE][$SETVAR1="..TempZ.."]" )	--��}�h��
		ClockOpen( Player , EM_ClockCheckValue_15  , Timer , Timer , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--�ɶ��H���
	end
end
-- INSTANCE_SCORE_10 �� INSTANCE_STATE_10
--=======================================================================================--
--									NPC����
--=======================================================================================--
function Lua_AncientDreamSpace_NPCSet()
	local NPC = OwnerID()
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID)
	local Timer = ReadRoleValue( NPC , EM_RoleValue_Register3)
	--
	while TRUE do
		Sleep(10)
		--
		if Timer == 0 then
			return
		else
			Timer = Timer -1
			WriteRoleValue(NPC,EM_RoleValue_Register3,Timer)
			if ReadRoleValue(NPC,EM_RoleValue_Register5) == 3 then
				return
			end
		end
	end
end
--=======================================================================================--
--									�ǰe��ж����禡
--=======================================================================================--
function Lua_AncientDreamSpace_Teleport(Party,NPC)
	local ZoneID = ReadRoleValue( NPC , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID)
	--�ǰe
	if type(Party) == "table" then	--�s��
		local NUM = DW_Rand(4)	--�H����n�⪱�a�ǰe����өж�
		WriteRoleValue(NPC , EM_RoleValue_Register4, NUM)	--NPC��Register4�O�O�����a�{�b���ж����X
		--
		for i=1,table.getn(Party) do
			if Party[i] ~= nil then
				if ReadRoleValue( Party[i] , EM_RoleValue_ZoneID) == ZoneID then
					AddBuff( Party[i] ,503693 ,1 , 1 )
					FN_ChangeZoneByFlag(Party[i] , 780777 ,NUM)
				else
					table.remove(Party,i)
				end
			end
		end
	else	--����
		local NUM = ReadRoleValue(NPC,EM_RoleValue_Register4)
		AddBuff( Party ,503693 ,1 , 1 )
		FN_ChangeZoneByFlag(Party, 780777 ,NUM)		
	end
end

--=======================================================================================--
--									���Ǩ禡
--=======================================================================================--
function Lua_AncientDreamSpace_Spawn(NPC)
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID)
	local ADS_Level = ReadRoleValue(NPC , EM_RoleValue_Register1)
	local ADS_HARD = ReadRoleValue( NPC , EM_RoleValue_Register2)
	local MonsterGroup = {}
	local MonsterID
	local TempX
	local TempY
	local RandX
	local FlagNum
	local RoomNum = ReadRoleValue(NPC,EM_RoleValue_Register4)
	local MonsterTable = {[1] = {104827,104828,104829};
				[2] = {104830,104831,104832};
				[3] = {104833,104834,104835};
				[4] = {104836,104837,104838};
				[5] = {104839,104840,104841};	
				[6] = {104827,104828,104829,104830,104831,104832,104833,104834,104835,104836,104837,104838,104839,104840,104841};
				}--�o��O���n�X���Ǫ���
	local BossTable = {104821,104822,104823,104824,104825,104826} --�O���n�X����

	--�p��üg�J���a�{�b���h�ơANPC��Register1�O�O�����a���q������
	ADS_Level = ADS_Level+1
	--�o��O�p�⪱�a���}���᪺�s�@������
	if ADS_Level >= 31 then 
		ADS_Level = 1
		ADS_HARD = ADS_HARD+1
	end --�p�G�O��31�h
	WriteRoleValue(NPC , EM_RoleValue_Register1, ADS_Level)	--�g�J�q������
	WriteRoleValue(NPC , EM_RoleValue_Register2, ADS_HARD)	--�g�J�}������
	--NPC��Register5�O�O�����a�{�b�O�_�b�԰����A0�����}�l�C���A1���԰����A2���𮧤�
	WriteRoleValue(NPC , EM_RoleValue_Register5, 1)	
	--
	if ADS_Level%5 == 0 then --�X����
		TempX = ADS_Level/5 --�M�w�n�έ��@�ӱj��list
		FlagNum = (RoomNum*10)+1	--�ж�FLAG�O1~9�AEX 11�N�O��1���ж����Y����L��m
--		MonsterID = Lua_DW_CreateObj( "flag" , BossTable[TempX] , 780777 , FlagNum , 1 , 1 )
		local fx, fy, fz, fdir = DW_Location( 780777, FlagNum )
		MonsterID = CreateObj( BossTable[TempX], fx, fy, fz, fdir, 1 )
		WriteRoleValue( MonsterID, EM_RoleValue_Lv, ADSPlayerMaxLV )
		AddToPartition( MonsterID, RoomID )

		if ADS_HARD >= 1 then AddBuff(MonsterID,508010,ADS_HARD-1,-1) end
		table.insert(MonsterGroup,MonsterID)
	else	--�X�p�ǡ�

		TempX = (math.floor(ADS_Level/5))+1 --�M�w�n�έ��@�ӱj��list
		for i=1,5 do
			TempY = table.getn(MonsterTable[TempX])
			RandX = DW_Rand(TempY)	--�qlist���Y��ǥX�Ӳ�
			FlagNum = (RoomNum*10)+i	--�P�w�n�έ��өж����X�l�ӥͩ�
			if type(MonsterTable[TempX][RandX]) == "table" then
				for j=1,table.getn(MonsterTable[TempX][RandX]) do
--					MonsterID = Lua_DW_CreateObj( "flag" , MonsterTable[TempX][RandX][j] , 780777 , FlagNum , 1 , 1 )
					local fx, fy, fz, fdir = DW_Location( 780777, FlagNum )
					MonsterID = CreateObj( MonsterTable[TempX][RandX][j], fx, fy, fz, fdir, 1 )
					WriteRoleValue( MonsterID, EM_RoleValue_Lv, ADSPlayerMaxLV )
					AddToPartition( MonsterID, RoomID )
					table.insert(MonsterGroup,MonsterID)
				end
			else
--				MonsterID = Lua_DW_CreateObj( "flag" , MonsterTable[TempX][RandX] , 780777 , FlagNum , 1 , 1 )
				local fx, fy, fz, fdir = DW_Location( 780777, FlagNum )
				MonsterID = CreateObj( MonsterTable[TempX][RandX], fx, fy, fz, fdir, 1 )
				WriteRoleValue( MonsterID, EM_RoleValue_Lv, ADSPlayerMaxLV )
				AddToPartition( MonsterID, RoomID )
				table.insert(MonsterGroup,MonsterID)
			end
			if ADS_HARD >= 1 then AddBuff(MonsterID,508011,ADS_HARD-1,-1) end
		end
	end

	--

	while TRUE do	--�Ǫ��гy�X�Ӥ���A�C���ˬd
		if ADSSurviveTimes[RoomID] > 4 or ReadRoleValue( NPC , EM_RoleValue_Register3) == 0 then
			for i=1,table.getn(MonsterGroup) do

					if MonsterGroup[i] ~= nil then
						local DelGroup= SearchRangeNPC ( MonsterGroup[i] , 500 )
						for j=0,table.getn(DelGroup) do

							if DelGroup[j] ~= nil and ReadRoleValue(DelGroup[j],EM_RoleValue_OwnerGUID) ==-1 then
								NPCDead( DelGroup[j],DelGroup[j])
								Hide(DelGroup[j])
								DelObj(DelGroup[j])
							end
						end
						--
						--DelObj(MonsterGroup[i])
					end
			end
			--�S�O�B�z--
			for i=1,table.getn(ADSPartyMember[RoomID]) do
					local Player = ADSPartyMember[RoomID][i]
					local BuffTable = {508153,508013,508158}
					for v=1,table.getn(BuffTable) do
						if CheckBuff(Player,BuffTable[v]) == TRUE then
							CancelBuff(Player,BuffTable[v])
						end
					end
			end
			-------------
			return FALSE	--�p�G�Υ��F���|�A�^��FALSE
		else
			if table.getn(MonsterGroup) == 0 then --�ˬd�Ǫ�������
				WriteRoleValue(NPC , EM_RoleValue_Register5, 2)	--NPC��Register5�O�O�����a�{�b�O�_�b�԰����A0�����}�l�C���A1���԰����A2���𮧤�
				for i=1,table.getn(ADSPartyMember[RoomID]) do
					local Player = ADSPartyMember[RoomID][i]
					ScriptMessage(Player, Player , 1 , "[ADS_PASS][$SETVAR1="..ADS_Level+(ADS_HARD*30).."]" , C_SYSTEM )
				end
				Sleep(50)
				return TRUE	--�����F�^��TRUE
			else
				for i=1,table.getn(MonsterGroup) do
					if MonsterGroup[i] ~= nil then
						if CheckID(MonsterGroup[i]) == FALSE then
							table.remove(MonsterGroup,i)
--						elseif ReadRoleValue( MonsterGroup[i],EM_RoleValue_IsDead) == 1 then
--							DelObj(MonsterGroup[i])
--							table.remove(MonsterGroup,i)
						end
					end
				end
			end
		end
		--
		Sleep(10)
	end
end

--=======================================================================================--
--									�������禡
--=======================================================================================--
function Lua_AncientDreamSpace_END(NPC)
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID)
	local ZoneID = ReadRoleValue( NPC , EM_RoleValue_ZoneID)
	local ADS_Level = ReadRoleValue(NPC , EM_RoleValue_Register1)
	for i=1,table.getn(ADSPartyMember[RoomID]) do
		local Player = ADSPartyMember[RoomID][i]
		SetSmallGameMenuType( Player , 10 , 2 )
		ScriptMessage(Player, Player , 0 , "[ADS_END]" , C_SYSTEM )
		ClockClose( Player)
		CancelBuff_NoEvent(Player,508008)
	end
	Sleep(100)
	for i=1,table.getn(ADSPartyMember[RoomID]) do
		if ReadRoleValue( ADSPartyMember[RoomID][i] , EM_RoleValue_ZoneID) == ZoneID then
			FN_ChangeZoneByFlag(ADSPartyMember[RoomID][i] , 780777 ,0)
		end
	end
	--
	WriteRoleValue(NPC,EM_RoleValue_Register1,0)
	WriteRoleValue(NPC,EM_RoleValue_Register2,0)
	WriteRoleValue(NPC,EM_RoleValue_Register3,0)
	WriteRoleValue(NPC,EM_RoleValue_Register4,0)
	WriteRoleValue(NPC,EM_RoleValue_Register5,0)
	WriteRoleValue(NPC,EM_RoleValue_Register6,0)
	ADSSurviveTimes[RoomID] = nil
	ADSPartyMember[RoomID] = nil
end

--=======================================================================================--
--									�N�Ӥ���Ĳ�o
--=======================================================================================--
function Lua_AncientDreamSpace_SurviveTimes()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID)
	local Player = OwnerID()
	local OnlineCheck = FALSE

	if ZoneID == 356 then
		for v=1,table.getn(ADSPartyMember[RoomID]) do
			if ADSPartyMember[RoomID][v] == Player then
				OnlineCheck = TRUE
				break
			end
		end
		if OnlineCheck == TRUE then
			if ADSSurviveTimes[RoomID] > 0 then
				ADSSurviveTimes[RoomID] = ADSSurviveTimes[RoomID] -1
			elseif ADSSurviveTimes[RoomID] == 0 then
				ADSSurviveTimes[RoomID] = 99
			end
			for i=1,table.getn(ADSPartyMember[RoomID]) do
				local TempID = ADSPartyMember[RoomID][i]
				ScriptMessage(TempID, TempID , 1 , "[ADS_DIE]" , C_SYSTEM )
				if ADSSurviveTimes[RoomID] >= 0 and ADSSurviveTimes[RoomID] < 4 then
					SetSmallGameMenuStr( TempID , 10 , 1 , "[ADS_BOARD_STATE][$SETVAR1="..ADSSurviveTimes[RoomID].."]" )	--�������`����
				end
			end
			--
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_PRE_REVIVE]" , C_SYSTEM )
			AddBuff(OwnerID(),508239,0,3)
			Sleep(25)
			AddBuff(OwnerID(),508008,0,-1)
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[ADS_REVIVE]" , C_SYSTEM )
		else
			for i=1,table.getn(ADSPartyMember[RoomID]) do
				if CheckID(ADSPartyMember[RoomID][i]) ==FALSE then
					table.remove(ADSPartyMember[RoomID],i)
				end
			end
			table.insert(ADSPartyMember[RoomID],Player)
			AddBuff(OwnerID(),508008,0,-1)
		end
	else
		SetSmallGameMenuType( Player , 10 , 2 )
	end
end

--=======================================================================================--
--									�����̦l�_
--=======================================================================================--
function Lua_AncientDreamSpace_NPC115697()
	if CheckAcceptQuest(OwnerID(),426472)==true then
		LoadQuestOption(OwnerID())		
	end
	SetSpeakDetail( OwnerID(), "[ADS_NPC115697]" )
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING04_1]", "Lua_AncientDreamSpace_NPC115697_1_1", 0) --���S����k�h���ڨ��W���ڹү�q�i�ʡH
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING04_2]", "Lua_AncientDreamSpace_NPC115697_2_1", 0) --���S����k���ڦb�ڹҷ��i�H���M��[�H
end
--------------------------
function Lua_AncientDreamSpace_NPC115697_1_1()
	SetSpeakDetail( OwnerID(), "[ADS_NPC115697_1]" )
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING05_1]", "Lua_AncientDreamSpace_NPC115697_1_2", 0) --
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING05_2]", "Lua_AncientDreamSpace_NPC115697_1_4", 0) --
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING06]", "Lua_AncientDreamSpace_NPC115697_1_3", 0) --
end

function Lua_AncientDreamSpace_NPC115697_1_2()
	if CountBodyItem( OwnerID(), 208682 ) >= 20 then
		DelBodyItem( OwnerID(), 208682, 20 )
		Lua_AncientDreamSpace_NPC115697_1_5(OwnerID(),TargetID())
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_1_3()
	if CountBodyItem( OwnerID(), 207919 ) >= 2 then
		DelBodyItem( OwnerID(), 207919, 2 )
		Lua_AncientDreamSpace_NPC115697_1_5(OwnerID(),TargetID())
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING08]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_1_4()
	if CountBodyItem( OwnerID(), 208679 ) >= 4 then
		DelBodyItem( OwnerID(), 208679, 4 )
		Lua_AncientDreamSpace_NPC115697_1_5(OwnerID(),TargetID())
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING13]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_1_5(Player,NPC)
	ScriptMessage(Player, Player , 1 , "[ADS_NPC115697_3]" , C_SYSTEM )
	ScriptMessage(Player, Player , 0 , "[ADS_NPC115697_3]" , C_SYSTEM )
	SetFlag( Player, 544419 , 0 )
end
--------------------------
function Lua_AncientDreamSpace_NPC115697_2_1()
	SetSpeakDetail( OwnerID(), "[ADS_NPC115697_2]" )	--�j��"�N�Ӥ���"���O�q�ϫ���ɶ�����
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING09_1]", "Lua_AncientDreamSpace_NPC115697_2_2", 0) --
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING09_2]", "Lua_AncientDreamSpace_NPC115697_2_4", 0) --
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING10]", "Lua_AncientDreamSpace_NPC115697_2_3", 0) --
end

function Lua_AncientDreamSpace_NPC115697_2_2()
	if CountBodyItem( OwnerID(), 208682 ) >= 15 then
		DelBodyItem( OwnerID(), 208682, 15 )
		GiveBodyItem(OwnerID(),208680,1)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_2_3()
	if CountBodyItem( OwnerID(), 207919 ) >= 1 then
		DelBodyItem( OwnerID(), 207919, 1 )
		GiveBodyItem(OwnerID(),208680,1)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING08]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115697_2_4()
	if CountBodyItem( OwnerID(), 208679 ) >= 2 then
		DelBodyItem( OwnerID(), 208679, 2 )
		GiveBodyItem(OwnerID(),208680,1)
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING13]", 0 )
	end
	CloseSpeak(OwnerID())
end

--=======================================================================================--
--									�����̼ǥ�
--=======================================================================================--
function Lua_AncientDreamSpace_NPC115696()
	SetSpeakDetail( OwnerID(), "[ADS_NPC115696]" )
--	AddSpeakOption(OwnerID(), TargetID(), "[ADS_SHOP]", "Lua_ADS_NPC115696_shop_1", 0) --
--	AddSpeakOption(OwnerID(), TargetID(), "[ADS_SHOP_MAGICTOOLS]", "Lua_ADS_NPC115696_shop_2", 0) --
	--�洫�ڹҥ����L�O
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING11_1]", "Lua_AncientDreamSpace_NPC115696_1_1", 0) 
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING11_2]", "Lua_AncientDreamSpace_NPC115696_1_2", 0) 
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING11_3]", "Lua_AncientDreamSpace_NPC115696_1_3", 0) 
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING12_1]", "Lua_AncientDreamSpace_NPC115696_2_1", 0) 
	AddSpeakOption(OwnerID(), TargetID(), "[ADS_STRING12_2]", "Lua_AncientDreamSpace_NPC115696_2_2", 0) 
end

function Lua_AncientDreamSpace_NPC115696_1_1()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208682 ) >= 5 then
			DelBodyItem( OwnerID(), 208682, 5 )
			YOYO_GetTokenValue( 3 , 1 ) --�����ڹҥ����L�O�f���ƭ�
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115696_1_2()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208682 ) >= 10 then
			DelBodyItem( OwnerID(), 208682, 10 )
			YOYO_GetTokenValue( 3 , 2 ) --�����ڹҥ����L�O�f���ƭ�
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115696_1_3()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208682 ) >= 20 then
			DelBodyItem( OwnerID(), 208682, 20 )
			YOYO_GetTokenValue( 3 , 4 ) --�����ڹҥ����L�O�f���ƭ�
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING07]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115696_2_1()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208679 ) >= 1 then
			DelBodyItem( OwnerID(), 208679, 1 )
			YOYO_GetTokenValue( 3 , 2 ) --�����ڹҥ����L�O�f���ƭ�
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING13]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_AncientDreamSpace_NPC115696_2_2()
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , 1 )
	if NeedSpaceStatus == TRUE then
		if CountBodyItem( OwnerID(), 208679 ) >= 5 then
			DelBodyItem( OwnerID(), 208679, 5 )
			YOYO_GetTokenValue( 3 , 10 ) --�����ڹҥ����L�O�f���ƭ�
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[ADS_STRING13]", 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_111490_DIALOG10]", 0 )
	end
	CloseSpeak(OwnerID())
end

function Lua_ADS_NPC115696_shop_1()
	SetShop( TargetID() , 600267 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end

function Lua_ADS_NPC115696_shop_2()
	SetShop( TargetID() , 600320 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
--=======================================================================================--
--									���HNPC
--=======================================================================================--
function Lua_AncientDreamSpace_NPCTalk01()
	local X = DW_Rand(3)
	local StringTable = {[1]="[ADS_NPC_TALK01]";
				[2]="[ADS_NPC_TALK02]";
				[3]="[ADS_NPC_TALK03]";
				}
	SetSpeakDetail(OwnerID(), StringTable[X])
end

function Lua_AncientDreamSpace_NPCTalk02()
	local X = DW_Rand(3)
	local StringTable = {[1]="[ADS_NPC_TALK04]";
				[2]="[ADS_NPC_TALK05]";
				[3]="[ADS_NPC_TALK06]";
				}
	SetSpeakDetail(OwnerID(), StringTable[X])
end
--=======================================================================================--
--									���~
--=======================================================================================--
function ADS_Item_208744()
	local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	if ZoneID == 356 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_CANTHOME]" , 0 )
	else
		ChangeZone( OwnerID(), 2 , 0 , -1343, -370, 2117, 359)
	end
end
--=======================================================================================--
--									���ի��
--=======================================================================================--
function Lua_ADS_BD()
	local X = ReadRoleValue(TargetID() , EM_RoleValue_Register1)
	local Y = ReadRoleValue(TargetID() , EM_RoleValue_Register2)
	X = X+1
	if X >= 31 then
		X = 1
		Y = Y+1
	end
	WriteRoleValue(TargetID() , EM_RoleValue_Register1, X)
	WriteRoleValue(TargetID() , EM_RoleValue_Register2, Y)
	X = ReadRoleValue(TargetID() , EM_RoleValue_Register1)
	Y = ReadRoleValue(TargetID() , EM_RoleValue_Register2)
	local Z = X+30*Y
end