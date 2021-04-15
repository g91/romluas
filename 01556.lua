--==================================================--
-- �W�u�e�ݭn�վ㪺����
-- 1.����422431�_���u�þԪ�����Script(LuaS_422431_War)�n����
-- 2.�վ��N�D��¿��q����m�A�X��780392
-- 3.���m���ɶ��n�վ�
--==================================================--

--==================================================--
--  ���ը禡��                                      --
--==================================================--
function LuaPE_ZONE8_01BBD_DeleteAll( DeleteMode )
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local StartNum = 1

	if DeleteMode ~= nil and DeleteMode == 1 then
		StartNum = 2
	end

	for i = StartNum, table.getn(Obj) do
		if CheckID(Obj[i]) == true then
			DelObj( Obj[i] )
		end
	end

	if DeleteMode == nil then
		LuaPE_ZONE8_01BBD_QuestNPC_Show()
	end

end
function LuaPE_ZONE8_01BBD_KillSnake()
	local Var = LuaPE_ZONE8_01BBD_Var
	local SnakeKillNum = Var[5]	-- �ثe�����D�H�ƥ�

	SnakeKillNum = SnakeKillNum + 100
	LuaPE_ZONE8_01BBD_Var[5] = SnakeKillNum
end
function LuaPE_ZONE8_01BBD_KillGuard()
	local Var = LuaPE_ZONE8_01BBD_Var
	local GuardKillNum = Var[4]	-- �ثe�Q�������ƥ�

	GuardKillNum = GuardKillNum + 25
	LuaPE_ZONE8_01BBD_Var[4] = GuardKillNum
end
--==================================================--



--==================================================--
--  �����ܼư�                                      --
--==================================================--
function LuaPE_ZONE8_01BBD_GlobalSet()
	LuaPE_ZONE8_01BBD_Obj = {}		-- �ϥΪ���޲z�}�C
	LuaPE_ZONE8_01BBD_Var = {}		-- �ϥΰѼƺ޲z�}�C
	LuaPE_ZONE8_01BBD_Phase = 0		-- �i���ġH���q

	LuaPE_ZONE8_01BBD_Var[1] = 0	-- ��ɪ���GID(�X�m)

	LuaPE_ZONE8_01BBD_Var[2] = 8	-- �@���������ͼƶq
	LuaPE_ZONE8_01BBD_Var[3] = 5	-- �@���D�H���ͼƶq
	LuaPE_ZONE8_01BBD_Var[4] = 0	-- �ثe�Q�������ƥ�
	LuaPE_ZONE8_01BBD_Var[5] = 0	-- �ثe�����D�H�ƥ�
	LuaPE_ZONE8_01BBD_Var[6] = 25	-- �ƥ󥢱ѻݭn�Q�������ƥ�
	LuaPE_ZONE8_01BBD_Var[7] = 50	-- �ƥ���ӻݭn�����D�H�ƥ�

	LuaPE_ZONE8_01BBD_Var[8] = 0	-- ��N�D��¿��q(�@����)
	LuaPE_ZONE8_01BBD_Var[9] = 0	-- �S��H���X�{�X��	1 ��N�D��¿��q�n��, 2 �ɦ嶤���n��
	LuaPE_ZONE8_01BBD_Var[10] = 0	-- �԰���N�D��¿��q�Q�F��
	LuaPE_ZONE8_01BBD_Var[11] = 7200	-- �������ȭ��m�ɶ�(��)2�p��
	LuaPE_ZONE8_01BBD_Var[12] = 0	-- ��N�D��¿��q(���Ѽ@���M��)
end
--==================================================--



--==================================================--
--  �T���B�z��                                      --
--==================================================--
--�ǰe�T��
function LuaPE_ZONE8_01BBD_Message( Index , Color )
	local AreaPlayer = LuaPE_ZONE8_01BBD_GetAreaPlayer()
	local Message = ""
	local Var = LuaPE_ZONE8_01BBD_Var
	local SnakeKillNum = Var[5]		-- �ثe�����D�H�ƥ�
	local SnakeKill_WinNum = Var[7]		-- �ƥ���ӻݭn�����D�H�ƥ�
	local GuardKillNum = Var[4]		-- �ثe�Q�������ƥ�
	local GuardKill_LostNum = Var[6]	-- �ƥ󥢱ѻݭn�Q�������ƥ�

	    if Index == 1 then
		Message = "[SC_PE_ZONE8_01][$SETVAR1=[SC_PE_ZONE8_01BBD_M01]]"	-- �ƥ� [$VAR1] �}�l�i��I�I $VAR1=�����۾��𨾾�
	elseif Index == 2 then
		Message = "[SC_PE_ZONE8_02][$SETVAR1=[SC_PE_ZONE8_01BBD_M02]][$SETVAR2="..SnakeKillNum.."][$SETVAR3="..SnakeKill_WinNum.."]"	-- �ƥ���ӱ���: [$VAR1] $VAR1=����D�H������( [$VAR2] / [$VAR3] )
	elseif Index == 3 then
		Message = "[SC_PE_ZONE8_03][$SETVAR1=[SC_PE_ZONE8_01BBD_M03]][$SETVAR2="..GuardKillNum.."][$SETVAR3="..GuardKill_LostNum.."]"	-- ���A���ܱ���: [$VAR1] $VAR1=�����������`( [$VAR2] / [$VAR3] )
	elseif Index == 4 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_01BBD_M04]]"	-- �ƥ󪬺A����: [$VAR1] $VAR1=�D�H��a�o�X�@�}���n�A�D�H�}�l�M�h�I�I
	elseif Index == 5 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_01BBD_M05]]"	-- �ƥ󪬺A����: [$VAR1] $VAR1=�D�H�ܦ^�F�����۾��������v�I�I
	elseif Index == 6 then
		Message = "[SC_PE_ZONE8_01BBD_M06]"	-- ���D�����L�}�l�������۾��i�}�F�����I
	elseif Index == 7 then
		Message = "[SC_PE_ZONE8_01BBD_M07]"	-- �@�姯�D�����L�}�l�e�������۾��W���I
	elseif Index == 8 then
		Message = "[SC_PE_ZONE8_01BBD_M08]"	-- �@�姯�D�����L�P�D�H�����L�}�l�e�������۾��W���I
	elseif Index == 9 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_01BBD_M09]]"	-- �ƥ󪬺A����: [$VAR1] $VAR1=���������X����^�����۾��i�樾�u�I�I
	elseif Index == 10 then
		Message = "[SC_PE_ZONE8_01BBD_M10]"	-- �D�H����v��۳D�H�����L�e�������۾��i�}�����I
	elseif Index == 11 then
		Message = "[SC_PE_ZONE8_05][$SETVAR1=[SC_PE_ZONE8_01BBD_M01]]"	-- �ƥ� [$VAR1] �ܦ������I�I $VAR1=�����۾��𨾾�
	end

	for i = 1 , table.getn(AreaPlayer) do
		ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message , Color )
		ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message , Color )
	end
end

--��t���
function LuaPE_ZONE8_01BBD_Say( Player , Index )
	local ObjSay = ""

	    if Index == 1 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S01]"	-- �ڭ̦��\�צ�o�i�����A������^��ơI
	elseif Index == 2 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S02]"	-- �i�c�A���M�h�A�Q��k�I
	elseif Index == 3 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S03]"	-- �ڤ���F�A�A�̱o�n����U�h�ڡK
	elseif Index == 4 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S04]"	-- �O�I
	elseif Index == 5 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S05]"	-- �פU�L�̡I
	elseif Index == 6 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S06]"	-- �O���D�H�a��o�̤@�B�I
	elseif Index == 7 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S07]"	-- ���q�U���I
	elseif Index == 8 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S08]"	-- �����D�H�I
	elseif Index == 9 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S09]"	-- �ݧڭ̬��������^�i�I
	elseif Index == 10 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S10]"	-- ���藍��d�t���������ݡI(�ƶ����M��)
	elseif Index == 11 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S11]"	-- �ɦ�I�ϴ��I
	elseif Index == 12 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S12]"	-- ���§A�̡A�ڭֶ̧X�۳o�Ӿ��|�I
	elseif Index == 13 then
		ObjSay = "[SC_PE_ZONE8_01BBD_S13]"	-- �_�I�̡A�A��ڶܡH�ֹL�ӡK
	end

	Say( Player , ObjSay )
end
--==================================================--



--==================================================--
--  �@�Ψ禡��                                      --
--==================================================--
--���󲣥�
function LuaPE_ZONE8_01BBD_FlagCreateBatch( ObjID , FlagID , ObjBronFlag , ObjNum , RoomID , ObjTalk , ect )
	local Obj = {}

	for i = 1 , ObjNum do
		Obj[i] = CreateObjByFlag( ObjID[i] , FlagID , ObjBronFlag[i] , 1 )
		table.insert( LuaPE_ZONE8_01BBD_Obj , Obj[i] )
		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 0 )	-- �ζ]������	-- �n��Partition�g�L�~�|���`
		AddToPartition( Obj[i] , RoomID )
		SetIdleMotion( Obj[i] , ruFUSION_ACTORSTATE_COMBAT_1H )
		MoveToFlagEnabled( Obj[i] , false )	-- �������޼@��
		if Rand( 10 ) > 5 and ObjTalk[i] ~= nil then
			LuaPE_ZONE8_01BBD_Say( Obj[i] , ObjTalk[i] )
		end
		SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE8_01BBD"..ect.."Dead" , 0 )
		BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD"..ect.."DO" , 0 )
		Sleep( 5 )
	end

	return obj
end

--���`�B�z
function LuaPE_ZONE8_01BBD_DeadBatch( ObjID , Obj2ID )
	local Count = 0

	local SearchObj = SearchRangeNPC( OwnerID() , 500 )
	if SearchObj[0] == -1 then	-- �䤣��H
	else
		for i = 0, table.getn(SearchObj)-1 do	-- �̫�@��-1���n�A�ҥH�n-1
			if SearchObj[i] == OwnerID() then	-- �ۤv����
			else
				if ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == ObjID or ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == Obj2ID then	-- ���P��
					if ReadRoleValue( SearchObj[i] , EM_RoleValue_IsDead ) == 1 then	-- ��������
					else
						Count = Count + 1	-- ���h�֤H
					end
				else
				end
			end
		end
	end

	return Count;
end

--���󲾰�
function LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	local Player = OwnerID()

	Sleep( 10 )
	local X = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
	local Y = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )

	X = X + Rand( Range ) * 2 - Range + 1
	Z = Z + Rand( Range ) * 2 - Range + 1

	local Obj = Role:new( Player )
	Obj:Move( X , Y , Z )
	while true do
		local NowX = Obj:X()
		local NowZ = Obj:Z()
		
		if Abs( NowX - X ) < Range and Abs( NowZ - Z ) < Range or Obj:IsAttack() == true then
			break;
		end
		Sleep( 2 )
	end

	return true
end

--���Y�X�l����]�w
function LuaPE_ZONE8_01BBD_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )
	local Leader = CreateObjByFlag( LeaderID , FlagID , LeaderBronFlag , 1 )
	SetModeEx( Leader , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Leader , EM_SetModeType_Obstruct , true )		-- ����
	SetModeEx( Leader , EM_SetModeType_Gravity , false )		-- ���O
	SetModeEx( Leader , EM_SetModeType_Mark , false )		-- �аO
	SetModeEx( Leader , EM_SetModeType_Move , false )		-- ����
	SetModeEx( Leader , EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Leader , EM_SetModeType_HideName , false )		-- �W��
	SetModeEx( Leader , EM_SetModeType_ShowRoleHead , false )	-- �Y����
	SetModeEx( Leader , EM_SetModeType_Fight , false )		-- �i�������
	SetModeEx( Leader , EM_SetModeType_Show , true )		-- ���
	AddToPartition( Leader , RoomID )

	LuaPE_ZONE8_01BBD_Obj[1] = Leader	-- �N�ާ@����[�J�Ĥ@��
	LuaPE_ZONE8_01BBD_Var[1] = Leader	-- ��ɪ���GID
	BeginPlot( Leader , "LuaPE_ZONE8_01BBD_FlagtoCallAttack" , 0 )	-- ����H���o�b

	return Leader;
end

--����԰�
function LuaPE_ZONE8_01BBD_StopAttack( Player , RoomID )
	SetModeEx( Player , EM_SetModeType_Strikback , false )		-- ����
	SetModeEx( Player , EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Player , EM_SetModeType_Fight , false )		-- �i�������
	Hide( Player )
	Show( Player , RoomID )
	SetStopAttack( Player )
	WriteRoleValue( Player , EM_RoleValue_IsAttackMode , 0 )
end

--����ϰ쪱�a
function LuaPE_ZONE8_01BBD_GetAreaPlayer()
	local RoomID = 0
	--local AreaID = 664	-- �D�H�ɵ��u����
	local AreaID = 667	-- �D�H�ɵ��u�F��
	local TestID = 1	-- ���հ�
	local AreaPlayer = {}
	local ZonePlayer = {}

	local PlayerCount = SetSearchAllPlayer( RoomID )	-- �^�ǧ��Ӽ�
	for i = 1 , PlayerCount do
		ZonePlayer[i] = GetSearchResult()	-- ���o�j�M�쪺���a
		local X = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_X )
		local Y = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Y )
		local Z = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Z )
		if CheckMapID( X , Y , Z , AreaID ) == true or CheckMapID( X , Y , Z , TestID ) then
			table.insert( AreaPlayer , ZonePlayer[i] )	-- �j�M��o�Ӥ��Ϫ����a�N�[�i�h
		end
	end

	return AreaPlayer;
end

--�P�_���a�O�_����������
function LuaPE_ZONE8_01BBD_CheckAreaPlayerQuest()
	local QuestID = 422431		-- �_���u�þ�
	local QuestPlayer = 0

	local AreaPlayer = LuaPE_ZONE8_01BBD_GetAreaPlayer()

	for i = 1 , table.getn(AreaPlayer) do
		if CheckAcceptQuest( AreaPlayer[i], QuestID ) == true then
			QuestPlayer = QuestPlayer + 1
		end
	end

	if QuestPlayer > 0 then
		return true;
	else
		return false;
	end

end
--==================================================--



--==================================================--
--  �@���H���B�m��                                  --
--==================================================--
function LuaPE_ZONE8_01BBD_QuestNPC_Hide()
	local GuardID = 113216	-- ��������(�@����)
	local Guard2ID = 113173	-- ��N�D��¿��q(�@����)
	local SearchRange = 300	-- �j�M�d��

	local SearchObj = SearchRangeNPC( OwnerID() , SearchRange )	-- �@���Ϊ�������
	if SearchObj[0] == -1 then	-- �䤣��H
	else
		for i = 0, table.getn(SearchObj)-1 do	-- �̫�@��-1���n�A�ҥH�n-1
			if SearchObj[i] == OwnerID() then	-- �ۤv����
			else
				if ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == Guard2ID then
					LuaPE_ZONE8_01BBD_Var[8] = SearchObj[i]
					DelFromPartition( SearchObj[i] )
				elseif ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == GuardID then
					DelObj( SearchObj[i] )
				end
			end
		end
	end
end
function LuaPE_ZONE8_01BBD_QuestNPC_Show()
	local RoomID = 0
	local Guard2ID = LuaPE_ZONE8_01BBD_Var[8]

	AddToPartition( Guard2ID , RoomID )
end
--==================================================--



--==================================================----==================================================--
--           ��������-��ͤ��a-�_���𨾾�           ----                                                  --
--==================================================----==================================================--



--==================================================--
--  �_���𨾾�  �ҰʳB�z��                          --
--==================================================--
function LuaPE_ZONE8_01BBD_Start( Mode )
	local LeaderID = 110224		-- �Z��R���X�m
	local FlagID = 780445
	local LeaderBronFlag = 11
	local RoomID = 0
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local FlagTmp = 0

	if Obj ~= nil then
		LuaPE_ZONE8_01BBD_DeleteAll( Mode )	-- �N���e���e�@�Өƥ󪺪�������R��
	end

	if Mode ~= nil and Mode == 1 then
		FlagTmp = LuaPE_ZONE8_01BBD_Var[1]
	end

	LuaPE_ZONE8_01BBD_GlobalSet()	-- �]�w�@���ܼ�

	local Leader = LuaPE_ZONE8_01BBD_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )	-- �]�w���Y�X�m(�Z��R��)

	LuaPE_ZONE8_01BBD_QuestNPC_Hide()	-- ���ü@���ϥΤH��

	LuaPE_ZONE8_01BBD_Message( 1 , C_SYSTEM )
	LuaPE_ZONE8_01BBD_Phase = 1		-- �i�J�Ĥ@���q

	Sleep( 10 )	-- ���ݤ@�U
	BeginPlot( Leader , "LuaPE_ZONE8_01BBD_GuardCreate" , 0 )	-- ���Ͷ���
	BeginPlot( Leader , "LuaPE_ZONE8_01BBD_SnakeCreate" , 0 )	-- ���ͳD�H

	if Mode ~= nil and Mode == 1 then
		DelObj( FlagTmp )	-- �R���e�@�ӺX�m
	end
end
--==================================================--



--==================================================--
--  �_���𨾾�  ���󲣥Ͱ�                          --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardCreate()
	local GuardID = { 102711 , 102711 , 102711 , 102711 , 102711 , 102711 , 102711 , 102711 , 102711 , 102711 }	-- ��������
	local GuardLeaderID = 102712	-- ��N�D��¿��q
	local FlagID = 780445
	local GuardBronFlag = { 1 , 2 , 3 , 4 , 5 , 1 , 2 , 3 , 4 , 5 }
	local Var = LuaPE_ZONE8_01BBD_Var
	local GuardNum = Var[2]
	local SpecialPersion = Var[9]
	local RoomID = 0
	local GuardTalk = { 5 , 6 , 7 , 8 , 9 , 5 , 6 , 7 , 8 , 9 , 10 }

	-- �p�x�S��H�����X�{
	if SpecialPersion == 0 then
		GuardID[1] = GuardLeaderID	-- ��N�D��¿��q
		GuardTalk[1] = GuardTalk[11]
		LuaPE_ZONE8_01BBD_Var[9] = 1
	end

	local Guard = LuaPE_ZONE8_01BBD_FlagCreateBatch( GuardID , FlagID , GuardBronFlag , GuardNum , RoomID , GuardTalk , "_Guard" )

end
function LuaPE_ZONE8_01BBD_SnakeCreate()
	local SnakeID = { 102709 , 102709 , 102709 , 102709 , 102709 , 102710 , 102710 , 102710 , 102710 , 102710 }	-- 102709���D�����L 102710�D�H�����L
	local SnakeLeaderID = 102346	-- �D�H���
	local FlagID = 780445
	local SnakeBronFlag = { 6 , 7 , 8 , 9 , 10 , 6 , 7 , 8 , 9 , 10 }
	local Var = LuaPE_ZONE8_01BBD_Var
	local Phase = LuaPE_ZONE8_01BBD_Phase
	local SnakeNum = Var[3]	-- �D�H���ͼƥ�
	local SnakeKillNum = Var[5]	-- �ثe�����D�H�ƥ�
	local RoomID = 0
	local SnakeTalk = {}
	local SnakeLeaderGo = 0

	if Phase == 2 then		-- �ĤG���q������m���@��
		SnakeBronFlag = { 1 , 2 , 3 , 4 , 5 , 1 , 2 , 3 , 4 , 5 }
	end

	-- �D�H�W���A���V�h�W�V�h
	if SnakeKillNum == 0 then
		LuaPE_ZONE8_01BBD_Message( 6 , C_DEFAULT )
	elseif SnakeKillNum < 10 then
		if Phase == 1 then
			LuaPE_ZONE8_01BBD_Message( 7 , C_DEFAULT )
		end
	elseif SnakeKillNum < 20 then
		SnakeNum = SnakeNum + 1
		if Phase == 1 then
			LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
		end
	elseif SnakeKillNum < 30 then
		SnakeNum = SnakeNum + 2
		if Phase == 1 then
			LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
		end
	elseif SnakeKillNum < 35 then	-- ����D�H����X�⦸
		SnakeNum = SnakeNum + 3
		if Phase == 1 then
			LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
		end
	elseif SnakeKillNum < 40 then
		SnakeNum = SnakeNum + 3
		if Phase == 1 and LuaPE_ZONE8_01BBD_CheckAreaPlayerQuest() == true then	-- ���p�����Ȫ����a�b����
			SnakeLeaderGo = 1
			SnakeID = { SnakeLeaderID , 102710 , 102710 , 102710 , 102710 , 102710 , 102710 , 102710 , 102710 , 102710 }
			-- SnakeLeaderID	-- �D�H���
			LuaPE_ZONE8_01BBD_Message( 10 , C_DEFAULT )
		else
			LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
		end
	elseif SnakeKillNum < 50 then
		SnakeNum = SnakeNum + 3
		LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
	else
		SnakeNum = SnakeNum + 4
		LuaPE_ZONE8_01BBD_Message( 8 , C_DEFAULT )
	end

	local Snake = LuaPE_ZONE8_01BBD_FlagCreateBatch( SnakeID , FlagID , SnakeBronFlag , SnakeNum , RoomID , SnakeTalk , "_Snake" )
	if SnakeLeaderGo == 1 then
		SetPlot( Snake[1] , "DEAD" , "LuaS_422431_Snake_Dead" , 0 )	-- �]�w�D�H��������`�@���A�����ȺX��
		SnakeLeaderGo = 0
	end
end
--==================================================--



--==================================================--
--  �_���𨾾�  ���`�B�z��                          --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardDead()
	local Phase = LuaPE_ZONE8_01BBD_Phase
	if Phase > 2 then	-- �����P�w�ɤ��A��
		return true
	end

	local GuardID = 102711	-- ��������
	local Guard2ID = 102712	-- ��N�D��¿��q
	local Var = LuaPE_ZONE8_01BBD_Var
	local GuardKill_LostNum = Var[6]	-- �ƥ󥢱ѻݭn�Q�������ƥ�
	local GuardMaxNum = Var[2]	-- 8-1+8 = 15 ���W�̦h15�Ӷ���
	local GuardKillNum = Var[4]	-- �ثe�Q�������ƥ�
	local Leader = Var[1]
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local Player = OwnerID()

	GuardKillNum = GuardKillNum + 1		-- ���`�p��
	LuaPE_ZONE8_01BBD_Var[4] = GuardKillNum

	-- ���`���H���X����޲z�}�C�A���O��N�D��¿��q���|���A�ҥH�n�ư�
	for i = 1, table.getn(Obj) do
		if ReadRoleValue( Obj[i] , EM_RoleValue_OrgID ) ~= Guard2ID and Obj[i] == Player then
			table.remove( Obj , i )
			break;
		end
	end
	LuaPE_ZONE8_01BBD_Message( 3 , C_SYSTEM )		-- �����`���`�H��

	local GuardCount = LuaPE_ZONE8_01BBD_DeadBatch( GuardID , Guard2ID )

	if GuardKillNum >= GuardKill_LostNum then
		BeginPlot( Leader , "LuaPE_ZONE8_01BBD_Lost" , 0 )		-- �i�J�ĤG���q
	else
		if GuardCount < GuardMaxNum then
			BeginPlot( Leader , "LuaPE_ZONE8_01BBD_GuardCreate" , 0 )	-- ���s����Ĥ@���q ���H
		end
	end

	if ReadRoleValue( Player , EM_RoleValue_OrgID ) == Guard2ID then	-- ��N�D��¿��q���`���S��B�z
		local RoomID = 0
		LuaPE_ZONE8_01BBD_StopAttack( Player , RoomID )
		Lua_CancelAllBuff( Player )	-- ����]��DOT�Ӧ�����

		LuaPE_ZONE8_01BBD_Say( Player , 3 )
		LuaPE_ZONE8_01BBD_Var[10] = 1
		Sleep( 10 )	-- ���F�Pı�A���@��
		BeginPlot( Player , "LuaPE_ZONE8_01BBD_GuardBack_SP1" , 0 )
		return false
	else
		return true
	end
end
function LuaPE_ZONE8_01BBD_SnakeDead()
	local Phase = LuaPE_ZONE8_01BBD_Phase
	if Phase > 3 then	-- �����P�w�ɤ��A��
		return true
	end

	local SnakeID = 102709	-- ���D�çL
	local Snake2ID = 102710	-- �D�H�äh
	local Var = LuaPE_ZONE8_01BBD_Var
	local SnakeKill_WinNum = Var[7]	-- �ƥ���ӻݭn�����D�H�ƥ�
	local SnakeMaxNum = Var[3]	-- 5-1+5 = 9 ���W�̦h9���D�H
	local SnakeKillNum = Var[5]	-- �ثe�����D�H�ƥ�
	local Leader = Var[1]

	SnakeKillNum = SnakeKillNum + 1		-- ���`�p��
	LuaPE_ZONE8_01BBD_Var[5] = SnakeKillNum

	LuaPE_ZONE8_01BBD_Message( 2 , C_SYSTEM )		-- �D�H�`���`�H��

	local SnakeCount = LuaPE_ZONE8_01BBD_DeadBatch( SnakeID , Snake2ID )

	if SnakeKillNum >= SnakeKill_WinNum then
		BeginPlot( Leader , "LuaPE_ZONE8_01BBD_Win" , 0 )
	else
		if SnakeCount < SnakeMaxNum then
			BeginPlot( Leader , "LuaPE_ZONE8_01BBD_SnakeCreate" , 0 )	-- ���s����Ĥ@���q ����
		end
	end

	return true
end
--==================================================--



--==================================================--
--  �_���𨾾�  ���ʪ�t��                          --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardDo()
	local FlagObjID = 780445 
	local FlagGoID = 0
	local Range = 15

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
end
function LuaPE_ZONE8_01BBD_SnakeDo()
	local FlagObjID = 780445 
	local FlagGoID = 0
	local Range = 15

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
end
--==================================================--



--==================================================--
--  �_���𨾾�  ��t���t��                          --
--==================================================--
function LuaPE_ZONE8_01BBD_Win()
	local SnakeID = 102709	-- ���D�çL
	local Snake2ID = 102710	-- �D�H�äh
	local SnakeLeaderID = 102346	-- �D�H���
	local GuardID = 102711	-- ��������
	local Guard2ID = 102712	-- ��N�D��¿��q
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local Phase = LuaPE_ZONE8_01BBD_Phase
	local GuardGoBackAgain = 0

	if Phase == 2 then
		GuardGoBackAgain = 1
	end

	LuaPE_ZONE8_01BBD_Phase = 3	-- �i�J�ĤT���q
	LuaPE_ZONE8_01BBD_Message( 4 , C_SYSTEM )

	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true then
			local RoomID = 0
			LuaPE_ZONE8_01BBD_StopAttack( Obj[i] , RoomID )

			local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
			if OrgID == Guard2ID or OrgID == GuardID then
				BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD_GuardWinBack" , 0 )	-- ������Ӿ��
			elseif OrgID == Snake2ID or OrgID == SnakeID or OrgID == SnakeLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD_SnakeLostBack" , 0 )	-- �D�H���ѺM�h
			end
		end
	end

	if GuardGoBackAgain == 1 then
		Sleep( 10 )
		local GuardID = { 102712 , 102711 , 102711 , 102711 , 102711 }	-- ��������
		local FlagID = 780445
		local GuardBronFlag = { 12 , 12 , 12 , 12 , 12 }
		local Var = LuaPE_ZONE8_01BBD_Var
		local GuardNum = 5
		local RoomID = 0
		local GuardTalk = { 12 , 4 , 4 , 4 , 4 }
		local Guard = {}

		LuaPE_ZONE8_01BBD_Message( 9 , C_SYSTEM )
		local GuardLeader = LuaPE_ZONE8_01BBD_Var[12]
		if GuardLeader ~= nil and CheckID(GuardLeader) == true then
			DelObj(GuardLeader)	-- �R����N�D��¿��q(���Ѽ@���M��)
		end

		for i = 1 , GuardNum do
			Guard[i] = CreateObjByFlag( GuardID[i] , FlagID , GuardBronFlag[i] , 1 )
			SetModeEx( Guard[i] , EM_SetModeType_Strikback , false )		-- ����
			SetModeEx( Guard[i] , EM_SetModeType_Searchenemy , false )	-- ����
			SetModeEx( Guard[i] , EM_SetModeType_Fight , false )		-- �i�������
			WriteRoleValue( Guard[i] , EM_RoleValue_IsWalk , 0 )	-- �ζ]������	-- �n��Partition�g�L�~�|���`
			AddToPartition( Guard[i] , RoomID )
			LuaPE_ZONE8_01BBD_Say( Guard[i] , GuardTalk[i] )
			MoveToFlagEnabled( Guard[i] , false )	-- �������޼@��
			BeginPlot( Guard[i] , "LuaPE_ZONE8_01BBD_GuardBack_SP3" , 0 )
			Sleep( 5 )
		end
		Sleep( 65 )
	else
		Sleep( 80 )
	end

	LuaPE_ZONE8_01BBD_QuestNPC_Show()
	local FlagTmp = LuaPE_ZONE8_01BBD_Obj[1]	-- �X�m�s�����Ȧs�_��

	local LeaderID = 110224		-- �Z��R���X�m
	local FlagID = 780445
	local LeaderBronFlag = 11
	local RoomID = 0

	local Leader = LuaPE_ZONE8_01BBD_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )	-- �]�w���Y�X�m(�Z��R��)
	BeginPlot( Leader , "LuaPE_ZONE8_01BBD_Reset" , 0 )	-- ���m��������

	DelObj( FlagTmp )	-- �R���D�H�x���X�m

end
function LuaPE_ZONE8_01BBD_Lost()
	local SnakeID = 102709	-- ���D�çL
	local Snake2ID = 102710	-- �D�H�äh
	local SnakeLeaderID = 102346	-- �D�H���
	local GuardID = 102711	-- ��������
	local Guard2ID = 102712	-- ��N�D��¿��q
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local Var = LuaPE_ZONE8_01BBD_Var
	local SnakeKill_WinNum = Var[7]	-- �ƥ���ӻݭn�����D�H�ƥ�

	LuaPE_ZONE8_01BBD_Phase = 2	-- �i�J�ĤG���q
	LuaPE_ZONE8_01BBD_Message( 5 , C_DEFAULT )

	SnakeKill_WinNum = SnakeKill_WinNum*2		-- �ĤG���q�������󬰭쥻���[��
	LuaPE_ZONE8_01BBD_Var[7] = SnakeKill_WinNum

	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true then
			local RoomID = 0
			LuaPE_ZONE8_01BBD_StopAttack( Obj[i] , RoomID )

			local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
			if OrgID == Guard2ID or OrgID == GuardID then
				BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD_GuardLostBack" , 0 )	-- �������ѺM�h
			elseif OrgID == Snake2ID or OrgID == SnakeID or OrgID == SnakeLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE8_01BBD_SnakeWinEnter" , 0 )	-- �D�H��Ӧ���
			end
		end
	end
	Sleep( 80 )

	local FlagTmp = LuaPE_ZONE8_01BBD_Obj[1]	-- �X�m�s�����Ȧs�_��

	local LeaderID = 113607		-- �D�H�x���X�m
	local FlagID = 780445
	local LeaderBronFlag = 11
	local RoomID = 0

	local Leader = LuaPE_ZONE8_01BBD_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )	-- �]�w���Y�X�m(�D�H)
	 DelObj( FlagTmp )	-- �R���Z��R���X�m

end
--==================================================--



--==================================================--
--  �_���𨾾�  ������t��                          --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardWinBack()	-- ������Ӿ��
	local FlagGoID = 11
	LuaPE_ZONE8_01BBD_GuardBack_SP2( FlagGoID )

end
function LuaPE_ZONE8_01BBD_GuardLostBack()	-- �������ѺM�h
	local FlagGoID = 12
	LuaPE_ZONE8_01BBD_GuardBack_SP2( FlagGoID )
end
--==================================================--



--==================================================--
--  �_���𨾾�  �D�H��t��                          --
--==================================================--
function LuaPE_ZONE8_01BBD_SnakeLostBack()	-- �D�H���ѺM�h
	local FlagObjID = 780445
	local FlagGoID = 6
	local Range = 30

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	DelObj( OwnerID() )
end
function LuaPE_ZONE8_01BBD_SnakeWinEnter()	-- �D�H��Ӧ���
	local FlagObjID = 780445
	local FlagGoID = 0
	local Range = 30
	local RoomID = 0
	local Player = OwnerID()

	Sleep( 30 )
	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )

	AdjustDir( Player , 180 )
	SetModeEx( Player , EM_SetModeType_Strikback , true )	-- ����
	SetModeEx( Player , EM_SetModeType_Searchenemy , true )	-- ����
	SetModeEx( Player , EM_SetModeType_Fight , true )	-- �i�������
	Hide( Player )
	Show( Player , RoomID )

end
--==================================================--



--==================================================--
--  �_���𨾾�  �S��H����t��                      --
--==================================================--
function LuaPE_ZONE8_01BBD_GuardBack_SP1()	-- ��N�D��¿��q���`�M�h�ۤU
	local FlagObjID = 780445
	local FlagGoID = 11
	local Range = 25

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_NORMAL )
	Sleep( 5 )
	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
end
function LuaPE_ZONE8_01BBD_GuardBack_SP2( FlagGoID )	-- �����M�h
	local FlagObjID = 780445
	local Range = 30
	local GuardID = 102711	-- ��������
	local Guard2ID = 102712	-- ��N�D��¿��q
	local Player = OwnerID()
	local OrgID = ReadRoleValue( Player , EM_RoleValue_OrgID )
	local Var = LuaPE_ZONE8_01BBD_Var
	local GuardLeaderDead = Var[10]
	local Phase = LuaPE_ZONE8_01BBD_Phase

	if OrgID == Guard2ID then
		if GuardLeaderDead == 1 then
			PlayMotion( Player , ruFUSION_ACTORSTATE_CROUCH_END )
			Sleep( 10 )
			AdjustDir( Player , 180 )
		end
		Sleep( 5 )
		PlayMotion( Player , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		if Phase == 2 then
			LuaPE_ZONE8_01BBD_Say( Player , 2 )
		elseif Phase == 3 then
			LuaPE_ZONE8_01BBD_Say( Player , 1 )
		end
		Sleep( 5 )
	elseif OrgID == GuardID then
		if GuardLeaderDead == 1 then
			Sleep( 10 )
		end
		Sleep( 15 )
		if Rand( 10 ) > 3 then
			LuaPE_ZONE8_01BBD_Say( Player , 4 )
		end
	end

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	Sleep( 5 )	-- �]�줧�ᵥ�@�U

	if OrgID == Guard2ID and FlagGoID == 12 then	-- 12��ܥ��ѺM�h
		local GuardLeaderID = 113664	-- ��N�D��¿��q(���Ѽ@���M��)
		local FlagID = 780445
		local ObjBronFlag = 13
		local RoomID = 0

		local GuardLeader = CreateObjByFlag( GuardLeaderID , FlagID , ObjBronFlag , 1 )
		AddToPartition( GuardLeader , RoomID )
		LuaPE_ZONE8_01BBD_Var[12] = GuardLeader	-- �����i�h�n�R��
		SetPlot( GuardLeader , "RANGE" , "LuaS_113664_Range" , 125 )
	end
	DelObj( Player )
end
function LuaPE_ZONE8_01BBD_GuardBack_SP3()	-- �����A���k��
	local FlagObjID = 780445 
	local FlagGoID = 11
	local Range = 15
	local Player = OwnerID()

	local GoDone = LuaPE_ZONE8_01BBD_ObjGO( FlagObjID , FlagGoID , Range )
	Sleep( 5 )	-- �]�줧�ᵥ�@�U

	DelObj( Player )
end
function LuaS_113664_Range()
-- 422428�䴩�۾��n�u��
-- 422429�j�ƨ��u�һ�
-- 422430����L�O����
-- 422431�_���u�þ�
	local Player = OwnerID()
	if CheckAcceptQuest( Player , 422428 ) == true or CheckAcceptQuest( Player , 422429 ) == true or CheckAcceptQuest( Player , 422430 ) == true  or CheckAcceptQuest( Player , 422431 ) == true then
		--Say(OwnerID(), "Rang")
		Tell( Player , TargetID() , "[SC_PE_ZONE8_01BBD_S13]" )
	end
end
--==================================================--



--==================================================--
--  �_���𨾾�  �X�m�������ܰ�                      --
--==================================================--
function LuaPE_ZONE8_01BBD_FlagtoCallAttack()	-- ����H���o�b
	local SnakeID = 102709	-- ���D�çL
	local Snake2ID = 102710	-- �D�H�äh
	local SnakeLeaderID = 102346	-- �D�H���
	local GuardID = 102711	-- ��������
	local Guard2ID = 102712	-- ��N�D��¿��q
	local Obj = LuaPE_ZONE8_01BBD_Obj
	local Var = LuaPE_ZONE8_01BBD_Var
	local Phase = LuaPE_ZONE8_01BBD_Phase
	--local GuardLeaderDead = Var[10]

	while true do
		Sleep( 50 )	-- �}�l������
		if Phase == 1 then
			for i = 1, table.getn(Obj) do
				if CheckID(Obj[i]) == true then
					if ReadRoleValue( Obj[i] , EM_RoleValue_IsAttackMode ) == 0 and ReadRoleValue( Obj[i] , EM_RoleValue_IsDead ) ~= 1 then
						local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
						if OrgID == Guard2ID and LuaPE_ZONE8_01BBD_Var[10] ~= 1 then
							for s = 1, table.getn(Obj) do
								local sOrgID = ReadRoleValue( Obj[s] , EM_RoleValue_OrgID )
								if (sOrgID == Snake2ID or sOrgID == SnakeID or sOrgID == SnakeLeaderID) and ReadRoleValue( Obj[s] , EM_RoleValue_IsDead ) ~= 1 then
									SetAttack( Obj[i] , Obj[s] )
									break;
								end
							end
						elseif OrgID == GuardID then
							for s = 1, table.getn(Obj) do
								local sOrgID = ReadRoleValue( Obj[s] , EM_RoleValue_OrgID )
								if (sOrgID == Snake2ID or sOrgID == SnakeID or sOrgID == SnakeLeaderID) and ReadRoleValue( Obj[s] , EM_RoleValue_IsDead ) ~= 1 then
									SetAttack( Obj[i] , Obj[s] )
									break;
								end
							end
						elseif OrgID == Snake2ID or OrgID == SnakeID or OrgID == SnakeLeaderID then
							for g = 1, table.getn(Obj) do
								local gOrgID = ReadRoleValue( Obj[g] , EM_RoleValue_OrgID )
								if gOrgID == Guard2ID and LuaPE_ZONE8_01BBD_Var[10] ~= 1 then
									SetAttack( Obj[i] , Obj[g] )
									break;
								elseif gOrgID == GuardID and ReadRoleValue( Obj[g] , EM_RoleValue_IsDead ) ~= 1 then
									SetAttack( Obj[i] , Obj[g] )
									break;
								end
							end
						end
					end
				end
			end
		end
	end
end
--==================================================--



--==================================================--
--  �_���𨾾�  �ҰʳB�z��                          --
--==================================================--
function LuaPE_ZONE8_01BBD_Reset()
	local ResetTime = LuaPE_ZONE8_01BBD_Var[11]		-- ��
	local Mode = 1

	LuaPE_ZONE8_01BBD_Message( 11 , C_SYSTEM )
	Sleep( ResetTime*10 )
	LuaPE_ZONE8_01BBD_Start( Mode )
end
--==================================================----==================================================--