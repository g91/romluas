--============================
-- �D���H���W��Register
--			+1	�������ɬO�_�i�椤���}�� 0�O�i�� 1�O���b�i��
--			+2

-- Model���W��Register
--			+1	�����D���H
--			+2	������ܦ�Model�����a
--			+3	������Model�O�ĴX�^�X����
--			+4	�����O�����C��

-- �X��781305		1~4	�C�^�X�|��Model�X�{����m
--			5	���f�X�{����m
--			6~9	�|�Ӫ��a����m
--============================

function FN_textile2013_NPC()
	local Player = OwnerID()
	local NPC = TargetID()

	if ReadRoleValue( NPC, EM_RoleValue_Register+1 ) == 0 then
		SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_01]" )
	--	AddSpeakOption( Player, NPC, "Let's solo play!", "FN_textile2013_Solo", 0 )
		AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_01_2]", "FN_textile2013_Team", 0 )
	else
		SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_ING]" )
	end
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_01_1]", "FN_textile2013_GameRule", 0 )
end

function FN_textile2013_GameRule()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_02]" )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_02_1]", "FN_textile2013_GameRule2", 0 )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_02_2]", "FN_textile2013_GameRule3", 0 )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_NPC", 0 )
end

function FN_textile2013_GameRule2()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_04]" )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_GameRule", 0 )
end

function FN_textile2013_GameRule3()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_05]" )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_GameRule", 0 )
end

function FN_textile2013_Solo()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "About solo play" )
	AddSpeakOption( Player, NPC, "I sure solo", "FN_textile2013_Speak(1)", 0 )	
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_NPC", 0 )
end
function FN_textile2013_Team()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail( Player, "[TEXTILE2013_FN_SPEAK_03]" )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_03_1]", "FN_textile2013_Speak(2)", 0 )
	AddSpeakOption( Player, NPC, "[TEXTILE2013_FN_SPEAK_BACK]", "FN_textile2013_NPC", 0 )
end

function FN_textile2013_Speak( PlayStyleCheck )
	local Player = OwnerID()
	local NPC = TargetID()
	local PartyNum = GetPartyID( Player , -1 )

	if PartyNum == 0 then
		ScriptMessage( Player, Player, 1 , "[FN_FAIRYTALE2012_NOTTEAM]" , C_SYSTEM ) --�A���b�@�Ӷ��
	elseif ReadRoleValue( NPC, EM_RoleValue_Register+1 ) == 0 then	--�}���O���}��
		local ZoneID = ReadRoleValue( NPC, EM_RoleValue_ZoneID )
		local AllZoneCheck = true
		local AllLiveCheck = true
		for i = 1, PartyNum do
			local PartyPlayer = GetPartyID( Player , i )
			if ReadRoleValue( PartyPlayer, EM_RoleValue_ZoneID ) ~= ZoneID then
				AllZoneCheck = false
			end
			if ReadRoleValue( PartyPlayer, EM_RoleValue_IsDead ) == 1 then
				AllLiveCheck = false
			end
		end
		if AllZoneCheck == true and AllLiveCheck == true then
			for i = 1, PartyNum do
				local PartyPlayer = GetPartyID( Player , i )
				DW_CancelTypeBuff( 68,  PartyPlayer ) --�M�����M�ɡA�U��
			end
			WriteRoleValue( NPC, EM_RoleValue_Register+1, 1 )
			CallPlot( NPC, "FN_textile2013_Main", Player, PlayStyleCheck )
		elseif AllZoneCheck == false then
			ScriptMessage( NPC, Player, 1, "[TEXTILE2013_FN_SPEAK_PARTY]", 0 )	--���M�����ɪ̥�����A�n�ХL�̻��ֹL�Ӥ��ɤ~�i�H�}�l��I
		elseif AllLiveCheck == false then
			ScriptMessage( NPC, Player, 1, "[TEXTILE2013_FN_SPEAK_ALLLIVE]", 0 )	--���ɪ̷����H���B�󦺤`���A�I
		end
	end
	CloseSpeak( Player )
end

function FN_textile2013_Main( Player, PlayStyleCheck )
	DebugMsg( 0 , 0 , "FN_textile2013_Main" );
	--local Player = OwnerID()
	local NPC = OwnerID()
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )

	local PartyTable = {}
-- 	�p�G PlayStyleCheck �O1=Solo, 2=Team
--	if PlayStyleCheck == 1 then
		
--	elseif PlayStyleCheck == 2 then

	if PlayStyleCheck == 2 then
		local PartyNum = GetPartyID( Player , -1 )
		for i = 1, PartyNum do
			if i <= 4 then						--�̦h�u�঳4�Ӫ��a�ѻP
				PartyTable[i] = GetPartyID( Player , i )
				SetPosByFlag( PartyTable[i], 781305, (5+i) )	--�⪱�a���ʹL�h�T�w
				AddBuff( PartyTable[i], 505340, 0, -1 )		--�������a����BUFF
			end
		end
	end
	--
	local MasterTable = { 122532, 122533, 122534, 122535 }	--���f
	local Round = 0			--�^�X��	
	local StyleTable = { 5, 5, 5, 5 }		--�ȡB���B��B��
	local AllModelTable = {}		--Model�`��
	--���X�Ӧ^�X���f
	local Ax, Ay, Az, Adir = DW_Location( 781305, 5 )
	local MasterOrgID = MasterTable[DW_Rand(4)]
	local Master = CreateObj( MasterOrgID, Ax, Ay, Az, Adir, 1 )
	AddToPartition( Master, RoomID )
	Yell(NPC, "[TEXTILE2013_FN_001][$SETVAR1=".."["..MasterOrgID.."]".."]", 2)
	Sleep(20)
	--
	Yell( NPC, "[TEXTILE2013_FN_002]", 2 )
	--
	while true do
		Round = Round + 1
		DebugMsg( 0 , 0 , "--Round : "..Round );
		--�����u�����a������
		for x = #PartyTable, 1, -1 do
			if CheckID( PartyTable[x] ) == false then
				table.remove( PartyTable, x )
			end
		end
		--���X�Ӧ^�X�n�����a�諸�үS
--		Say( NPC, "--------------------------------------CreatModel" )
		local ModelTable = {}
		StyleTable, ModelTable  = FN_textile2013_CreatModel( Round, StyleTable, NPC )
--		Say( NPC, "--------------------------------------CreatModel Over" )
		AllModelTable = FN_TableCombine( AllModelTable, ModelTable )	--��X����Model�[��Model�`����Y
		--���a���
--		Say( NPC, "-----------------------Player Choose" )
		Yell( NPC, "[TEXTILE2013_FN_003][$SETVAR1="..Round.."]", 2 )
		Sleep(20)
		for i = 1, #PartyTable do						--�C�ӰѻP�����a�U�ʤ@��
				DebugMsg( 0 , 0 , "--Rotary : "..PartyTable[i] );
				SetFlag( PartyTable[i], 544955, 1 )				--����o��Flag�����a�~�����L�A�i�H��Model�@����
				if FN_textile2013_PlayerTurn( PartyTable[i], NPC ) == 2 then	--���a�ɶ���S����A�ҥH�H�����L��@��
					for r = 1, #ModelTable do
						if ReadRoleValue( ModelTable[r], EM_RoleValue_Register+2 ) == 0 then
							WriteRoleValue( ModelTable[r], EM_RoleValue_Register+2, PartyTable[i] )
							--
							local x,y,z,Dir = DW_Location( PartyTable[i] )
							local Nx,Ny,Nz,Ndir = DW_NewLocation( (60+40*Round),10,x,y,z,Dir)
							SetPos( ModelTable[r], Nx, Ny, Nz, Ndir )				--�⪱�a��W��Model���ʨ�L����Ʀn
							SetModeEx( ModelTable[r], EM_SetModeType_Mark, false )
							break
						end
					end
	--			elseif  FN_textile2013_PlayerTurn( PartyTable[i], NPC ) == 1 then
				end
		end
		--�C�Ӫ��a���粒��A�K��o�^�X���Ҧ��үS����Ĳ�I�@���A�B��S�H�諸����
--		Say( NPC, "Model no one choose go Hide" )
		for m = 1, #ModelTable do						
			SetPlot( ModelTable[m], "touch", "", 0 )
			if ReadRoleValue( ModelTable[m], EM_RoleValue_Register+2 ) == 0 then
				Hide( ModelTable[m] )
			end
		end
		Yell( NPC, "[TEXTILE2013_FN_008][$SETVAR1="..Round.."]", 2 )
		--�p�G��F�Ĥ��^�X��ܳo�����ɵ����F
		if Round == 5 then
			Yell( NPC, "[TEXTILE2013_FN_009]", 2 )
			Sleep(20)
			Yell( NPC, "[TEXTILE2013_FN_010]", 2 )
			Sleep(20)
			local WinnerTable = FN_textile2013_CountScore( AllModelTable, MasterOrgID, PartyTable )
			--
			Yell( NPC, "[TEXTILE2013_FN_012]", 2 )
			Sleep(20)
			if #WinnerTable == 1 then
				Yell( NPC, "[TEXTILE2013_FN_013]", 2 )
				Sleep(15)
				Yell( NPC, "[TEXTILE2013_FN_014][$SETVAR1="..GetName( WinnerTable[1] ).."]", 2 )
			elseif #WinnerTable > 1 then
				Yell( NPC, "[TEXTILE2013_FN_015]", 2 )
				Sleep(15)
				--
				local NameString = ""
				for s = 1, #WinnerTable do
					NameString = NameString..GetName( WinnerTable[s] )..", "
				end
				--
				Yell( NPC, "[TEXTILE2013_FN_016][$SETVAR1="..NameString.."]", 2 )
			end
			--�����AĹ�a������n�����y
			for p = 1, #PartyTable do
				if CheckFlag( PartyTable[p], 548131 ) == false then
					if FN_InTableCheck( PartyTable[p], WinnerTable ) == true then
						GiveBodyItem( PartyTable[p], 241646, 1 )	--�k����´���ƥ]
					else
						GiveBodyItem( PartyTable[p], 241645, 1 )	--��ί�´���ƥ]
					end
					SetFlag( PartyTable[p], 548131, 1 )
				end
				Lua_Festival_07_All(PartyTable[p]) 			--���Լ�
			end
			--
			FN_textile2013_AllClear( AllModelTable, Master, NPC )
			DebugMsg( 0 , 0 , "--5 Round End : " );
			return
		end
		--��PartyTable���Y���Ĥ@�ӤH����table�̫᭱ �n���U�^�X�i�H���H��Ĥ@�Ӱʪ�
		local TempPlayer = PartyTable[1]
		table.remove( PartyTable, 1 )
		table.insert( PartyTable, TempPlayer )
		--
		Sleep(10)
	end
end

--===================================================
--				��L�禡
--===================================================

function FN_textile2013_CreatModel( Round, StyleTable, NPC )	--�гyModel
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )

	local RoundTable = { [1]= {122508, 122513, 122518, 122523};
				[2]= {122509, 122514, 122519, 122524};
				[3]= {122510, 122515, 122520, 122525};
				[4]= {122511, 122516, 122521, 122526};
				[5]= {122512, 122517, 122522, 122527}	}

	local TempTable = { 0, 0, 0, 0 }			--4��Model�X���O�����C��
	local Modelable = {}				--�O�����X��Model�ΡA�̫�n�^��

	local whileTemp = 0
	while whileTemp < 4 do			--��o�^�X�n�X�����C��
		local TempRand = DW_Rand(4)	--Rand�X�䤤�@���C�� 1,2,3,4 ���� ��,��,��,��
		if StyleTable[TempRand] >= 1 then	--�T�{���C��O�_�٦���
			whileTemp = whileTemp + 1
			StyleTable[TempRand] = StyleTable[TempRand] - 1	--���C���X��������-1
			TempTable[whileTemp] = TempRand			--����Model�X���O�����C��
		end
		--���C�⤣��X�����ܴN�~��Rand�즳����
	end
	--
	local ModelTable = {}
	for i = 1, 4 do
		local x, y, z, dir = DW_Location( 781305, i )
		local ColorStyle = TempTable[i]					--��K�\Ū�ҥHlocal�@�U
		ModelTable[i] = CreateObj( RoundTable[Round][ColorStyle], x, y, z, dir, 1 )
		AddToPartition( ModelTable[i], RoomID )
		SetPlot( ModelTable[i], "touch", "FN_textile2013_ModelPlot", 150 )
		WriteRoleValue( ModelTable[i], EM_RoleValue_Register+1, NPC )
		WriteRoleValue( ModelTable[i], EM_RoleValue_Register+3, Round )
		WriteRoleValue( ModelTable[i], EM_RoleValue_Register+4, ColorStyle )
		SetModeEx( ModelTable[i], EM_SetModeType_Move, false )
	end
	return StyleTable, ModelTable
end

function FN_textile2013_ModelPlot()	--Model��Ĳ�I�ƥ�
	local Player = OwnerID()
	local Model = TargetID()
	local MainNPC = ReadRoleValue( Model, EM_RoleValue_Register+1 )
	local Round = ReadRoleValue( Model, EM_RoleValue_Register+3 )
	local FlagCheck = CheckFlag( Player, 544955 )

	if FlagCheck == true then	--�IĲ�����a�p�G�O�o���i��ʪ����a�A�N�|��Flag
		SetFlag( Player, 544955, 0 )					--���a����F�A��L�o���i��ʸ�殳��
		--
		WriteRoleValue( Model, EM_RoleValue_Register+2, Player )	--���a��ܤF�o��Model�A�⪱�a�O�W
		--
		local x,y,z,Dir = DW_Location( Player )
		local Nx,Ny,Nz,Ndir = DW_NewLocation( (60+40*Round),10,x,y,z,Dir)
		SetPos( Model, Nx, Ny, Nz, Ndir )				--�⪱�a��W��Model���ʨ�L����Ʀn
		SetFlag( Player, 548123, 1 )					--���a����F�A���L�@�ӰO��
		SetModeEx( Model, EM_SetModeType_Mark, false )
	else
		ScriptMessage( Player, Player, 1, "[TEXTILE2013_FN_017]", 0 )
		return
	end
end
 
function FN_textile2013_PlayerTurn( Player, NPC )	--����Ӫ��a���^�X
	if CheckID( Player ) == false then
		return 1
	end
	Yell( NPC, "[TEXTILE2013_FN_004][$SETVAR1="..GetName( Player ).."]", 2 )
	ScriptMessage( Player, Player, 2, "[TEXTILE2013_FN_005]", C_SYSTEM )
	StartClientCountDown( Player, 20, 0, 0, 0, 0, "Time" )	--�˼ƭp�ɡA�����a���D�ٳѤU�h�֮ɶ��i�H���M�w
	--
	local TimeCount = 0
	while true do
		Sleep( 10 )
		TimeCount = TimeCount + 1
		--
		if CheckFlag( Player, 548123 ) == true then	--���a����Flag
			Yell( NPC, "[TEXTILE2013_FN_006][$SETVAR1="..GetName( Player ).."]", 2 )
			StartClientCountDown( Player, 0, 0, 0, 0, 0, "Time" )	--�˼ƭp���k�s
			SetFlag( Player, 548123, 0 )				--�⪱�a����L���O������
--			SetFlag( Player, 544955, 0 )				--���a�������殳��
			return 1
		elseif TimeCount == 20 then			--20��S�������a�H�����@��
			SetFlag( Player, 544955, 0 )				--���a�������殳��
			StartClientCountDown( Player, 0, 0, 0, 0, 0, "Time" )	--�˼ƭp���k�s
			return 2
		end
		--
		if TimeCount % 5 == 0 then
			Say( NPC, "[TEXTILE2013_FN_007][$SETVAR1="..GetName( Player ).."][$SETVAR2="..(20-TimeCount).."]")
		end
	end
end

function FN_textile2013_CountScore( AllModelTable, MasterOrgID, PartyTable )	--�p�⪱�a�o��
	local MasterCount ={ [122532] = { 3, 2, 2, 1 };
				[122533] = { 1, 3, 2, 2 };
				[122534] = { 2, 1, 3, 2 };
				[122535] = { 2, 2, 1, 3 }; }
	--
	DEBUGMsg(0,0,"P1")
	local PlayerChoose = {}
	for i = 1, #PartyTable do
		DEBUGMsg(0,0,"Player="..PartyTable[i])
		PlayerChoose[PartyTable[i]] = {}
	end
	--
	DEBUGMsg(0,0,"P2")
	for i = 1, #AllModelTable do						--�Ҧ��X����Model�����L�@���AŪ���o��Model�Q���Ӫ��a�ҿ��
		local PlayerID = ReadRoleValue( AllModelTable[i], EM_RoleValue_Register+2 )
		local ColorStyle = ReadRoleValue( AllModelTable[i], EM_RoleValue_Register+4 )
		if PlayerID ~= 0 and CheckID( PlayerID ) == true then
			table.insert( PlayerChoose[PlayerID], ColorStyle )			--�H���aID�����ޡA�b���Y�������a��ܤF�����C��
		end
	end
	--�{�b��o��C�Ӫ��a�ҿ�ܪ��C�ⳣ��z�n�F �Ӷ}�l���
	--�榡 ex: PlayerChoose[PlayerID]={ 1,2,1,4,3 }	1,2,3,4 ���� ��,��,��,��
	local PlayerStyle = {}
	--
	DEBUGMsg(0,0,"P3")
	local ScoreTable = {}
	for i = 1, #PartyTable do
		DEBUGMsg(0,0,"P4 - "..i.." - 1")
		local PlayerID = PartyTable[i]
		local BaseScore = 0
		PlayerStyle[PlayerID] = {0, 0, 0, 0}		
		for s = 1, 5 do							--���a�|��5���үS�A�ҥH��5��
			local Color = PlayerChoose[PlayerID][s]			--�o�X�o�ӼүS�O�����C��
			local MasterGive = MasterCount[MasterOrgID][Color]	--�q�C��h�o�X���f���h�֤�
			BaseScore = BaseScore + MasterGive
			--if PlayerStyle[PlayerID] == nil then
			--	PlayerStyle[PlayerID] = {}
			--end
			--if PlayerStyle[PlayerID][Color] == nil then
			--	PlayerStyle[PlayerID][Color] = 1
			--else
				PlayerStyle[PlayerID][Color] = PlayerStyle[PlayerID][Color]+1	--�o��O�έp���a�|���C�⪺��ҡA�n�b�᭱�@�[�v�����p��
			--end
		end
		--�{�b��o�䪾�D�C�Ӫ��a�ҿ�ܪ��C����
		--�榡 ex: PlayerStyle[PlayerID]={ 2,2,0,1 }	�C�ӯ��� ���� ��,��,��,�� �U���X��
		DEBUGMsg(0,0,"P4 - "..i.." - 2")
		local MultiCheck = true			--�h���� �[�v�P�w
		local SingleCheck = false		--�椸�� �[�v�P�w
		local AntiCheck = false			--�ϫ��� �[�v�P�w
		for c = 1, 4 do
			local ColorStringTable = { "Silver", "Red", "Green", "Purple" }
--			Say( PlayerID, "I pick"..PlayerStyle[PlayerID][c].." "..ColorStringTable[c] )
			if PlayerStyle[PlayerID][c] == 2 then	--�S�w���榳2�ӡA+4��
				BaseScore = BaseScore + 4
				SingleCheck = false	--��2��ܪ��a���i��u���@���C��A���ŦX�椸�����[�v�P�w
			elseif PlayerStyle[PlayerID][c] == 5 then
				SingleCheck = true	--��5��ܪ��a�u���@���C��A�ŦX�椸�����[�v�P�w
				if MasterCount[MasterOrgID][c] == 1 then
					AntiCheck = true	--���f�̧C����3�өΥH�W�A�ŦX�ϫ��Ъ��[�v�P�w
				end
			elseif PlayerStyle[PlayerID][c] >= 3 then	--�S�w���榳3�ӥH�W�A+6��
				BaseScore = BaseScore + 6
				if MasterCount[MasterOrgID][c] == 1 then
					AntiCheck = true	--���f�̧C����3�өΥH�W�A�ŦX�ϫ��Ъ��[�v�P�w
				end
			elseif PlayerStyle[PlayerID][c] == 0 then
				MultiCheck = false	--��0��ܪ��a�֮��@���C��A���ŦX�h�������[�v�P�w
			end
		end
		DEBUGMsg(0,0,"P4 - "..i.." - 3")
		if MultiCheck == true then
			BaseScore = BaseScore + 8
		end
		if SingleCheck == true then
			BaseScore = BaseScore + 11			
		end
		if AntiCheck == true then
			BaseScore = BaseScore + 12
		end
		--
		ScoreTable[PlayerID] = BaseScore
	end
	DEBUGMsg(0,0,"P5")
--	return ScoreTable
	--�p��Ĺ�a�O�֡A�B�z���i��|�X�{�����⪬�p
	local TopScore = 0
	for i = 1, #PartyTable do
		local ScorePlayer = PartyTable[i]
		ScriptMessage( ScorePlayer, ScorePlayer, 3, "[TEXTILE2013_FN_011][$SETVAR1="..ScoreTable[ScorePlayer].."]" , 0 )
		if ScoreTable[ScorePlayer] > TopScore then
			TopScore = ScoreTable[ScorePlayer]
		end
		--
		CancelBuff( PartyTable[i], 505340 )
	end
	DEBUGMsg(0,0,"TopScore="..TopScore)
	--���D�X�̰����A�M��ݬݦ��S���h�H�P�ɳ̰��������⪬�p
	local WinnerTable = {}
	for i = 1, #PartyTable do
		local TopPlayer = PartyTable[i]
		if ScoreTable[TopPlayer] == TopScore then
			DEBUGMsg(0,0,"Player"..GetName(TopPlayer).."="..ScoreTable[TopPlayer])
			table.insert( WinnerTable, TopPlayer )
		end
	end
	return WinnerTable
end

function FN_textile2013_AllClear( AllModelTable, Master, NPC )
	DelObj( Master )
	for i = #AllModelTable, 1, -1 do
		DelObj( AllModelTable[i] )
	end
	WriteRoleValue( NPC, EM_RoleValue_Register+1, 0 )
end


--===================================================
--				�B�~�禡
--===================================================

function FN_TableCombine( table1, table2 )	--��table2�����F��X�֨�table1��
	for i = 1, #table2 do
		table.insert( table1, table2[i] )
	end
	return table1
end

function FN_textile2013_Del()
	local RoundTable = { [1]= {122508, 122513, 122518, 122523};
				[2]= {122509, 122514, 122519, 122524};
				[3]= {122510, 122515, 122520, 122525};
				[4]= {122511, 122516, 122521, 122526};
				[5]= {122512, 122517, 122522, 122527}	}

	for i = 1, #RoundTable do
		for h = 1, #RoundTable[i] do
			Lua_DavisDelObj( RoundTable[i][h] )
		end
	end
end