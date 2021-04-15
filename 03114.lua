--z30�D�u=======================================
--=====================================
--426795 �k�X�ͤ�
--=====================================
--===============�������ȫ᪺��t
--CliBuff:625142
--WalkFlag:781381 no.1~2
function LuaPG_426795_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426795_Complete_02" , NPC, Player, CliBuff)	----���t��function
	end
end

function LuaPG_426795_Complete_02(NPC, Player, CliBuff)
	local WalkFlag = 781381
	local Actor = CreateObjByFlag( 123323, WalkFlag, 1, 1)				----�ͦ��t��
	ks_ActSetMode(Actor)
	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 )
	DW_MoveToFlag( Actor, WalkFlag, 2, 0, 1)
	DelObj(Actor)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=====================================
--426797 ~426801 Retake����
--=====================================
function LuaPG_NouRyouShi_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	local NpcOrgID = ReadRoleValue( Npc, EM_RoleValue_OrgID )
	local MonoList = {}
	MonoList[123309] = {426797,243111}
	MonoList[123310] = {426798,243114}
	MonoList[123311] = {426799,243112}
	MonoList[123312] = {426800,243113}
	MonoList[123313] = {426801,243110}
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426796)==true		and
	CheckCompleteQuest(Player, MonoList[NPCOrgID][1])==true	and
	CheckCompleteQuest(Player, 426802)==false			and
	CountBodyItem(Player, MonoList[NPCOrgID][2])==0		then
		AddSpeakOption(Player,NPC, "[SC_Z30NOURYOUSHI_1]", "LuaPG_NouRyouShi_Retake_02("..MonoList[NPCOrgID][2]..")", 0 )
	end
	if ( CheckAcceptQuest( Player, 422655 ) == true and CountBodyItem( Player, 243103 ) >=1 and CheckFlag( Player, 543903 )==false ) then
		AddSpeakOption( Player, NPC, "[SC_Q422655_00]", "Z30_Q422655SPEAK_00( "..NpcOrgID.." )", 0 )
	end
end

function LuaPG_NouRyouShi_Retake_02(NouRyouShi)
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, NouRyouShi,1)
end


--�Ĥ@�Ϫ�retake����G426891��426896
function LuaPG_NouRyouShi_Retake_Z1()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local MonoList = {}
	MonoList[123340] = {426891,243125}	--����ڡA��q��1
	MonoList[123341] = {426892,243126}	--���p�}�A��q��2
	MonoList[123342] = {426893,243127}	--�Դ����A��q��3
	MonoList[123343] = {426894,243128}	--�ּw���A��q��4
	MonoList[123344] = {426895,243129}	--�����ȮR�A��q��5
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426896)==true		and
	CheckCompleteQuest(Player, 426896)==false			and
	CheckCompleteQuest(Player, MonoList[NPCOrgID][1])==true	and
	CountBodyItem(Player, MonoList[NPCOrgID][2])==0		then
		AddSpeakOption(Player,NPC, "[SC_Z30NOURYOUSHI_1]", "LuaPG_NouRyouShi_Retake_02("..MonoList[NPCOrgID][2]..")", 0 )
	end	
end

function LuaPG_NouRyouShi_Retake_Z1_02(NouRyouShi)
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, NouRyouShi,1)
end


--=====================================
--426799 �d�F���S�����
--=====================================
function LuaPG_426799_Dead()		--���`�@���A���d�a����A���X�̭����r�p��
	local Baga = OwnerID()
	local x,y,z,dir=DW_Location(Baga)
	local Monster = 108509
	local CreateMon = CreateObj(Monster, x+20*math.cos(dir*(math.pi/180)), y,z-50*math.sin(dir*(math.pi/180)) , dir, 1 )		--�ͦ��r�p��
	AdjustFaceDir(CreateMon, Baga, 180) 
	AddToPartition(CreateMon, 0)
end

function LuaPG_426799_DeleteItself()
	local CreateMon = OwnerID()
	BeginPlot( CreateMon, "LuaPG_426799_HangingAround", 2)	
	while 1 do
		sleep(300)
		if HateListCount(CreateMon)==0	then		--�ˬd���ܦC��A�S���H����
			DelObj(CreateMon)				--�R���ۤv			
			break
		end
	end
end

function LuaPG_426799_HangingAround()
	local CreateMon = OwnerID()
	local x,y,z,dir = DW_Location(CreateMon)
	while 1 do
		sleep(50)
		if HateListCount(CreateMon)==0	then		----�ˬd���S���b����
			Move(CreateMon ,x+Rand(50) ,y,z+Rand(50))
		end
	end
end


--=====================================
--426800 �T�H�����ƳU
--=====================================
function LuaPG_426800_Tell()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local TalkingList = {}
	TalkingList[123317] = 548808
	TalkingList[123318] = 548809
	TalkingList[123321] = 548810
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426800,427018,427028) == true	and
	(CheckFlag(Player, TalkingList[NPCOrgID]) == false				or
	CountBodyItem(Player, 243115)==0)						then
		AddSpeakOption(Player,NPC, "[SC_Z30Q426800_1]", "LuaPG_426800_Tell_02", 0 )
	end
end

function LuaPG_426800_Tell_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local TalkingList = {}
	TalkingList[123317] = {"[SC_Z30Q426800_2]",548808}
	TalkingList[123318] = {"[SC_Z30Q426800_3]",548809}
	TalkingList[123321] = {"[SC_Z30Q426800_4]",548810}
	SetSpeakDetail(Player, TalkingList[NPCOrgID][1])
	GiveBodyItem(Player, 243115, 1)
	SetFlag(Player,TalkingList[NPCOrgID][2], 1)
end


--=====================================
--426802 �A�c�۹��k�}
--=====================================
--Ĳ�I�۪O�A�۪O�O�U���a�A��ܼ@���}�Ҿ���
function LuaPG_426802_EnergyBoard()
	local Player = OwnerID()
	local EnergyBoard = TargetID()
	local Num = ReadRoleValue(EnergyBoard, EM_RoleValue_Register1)	--�۪O�ƭȡ]1�^
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426802)==true		and
	CountBodyItem(Player, 243105)~=0				and
	CheckFlag(Player, 548806) == false				then
		--�Y�S���H�ϥΥ۪O�A�N�i�H�}�l�F��L�H�b�ϥΪ��ܡA�|������
		if Num==0						then
			AddSpeakOption(Player,EnergyBoard, "[SC_Z30Q426802_1]", "LuaPG_426802_Board_02", 0 )
		else
			CloseSpeak(Player)
			--LoadQuestOption(Player)
			ScriptMessage( Player, Player, 1,"[SC_Z30Q426802_2]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_Z30Q426802_2]", 0 )
		end
	end
end

--�����a�ϥί�q�۪�buff�G625277�A�`�p20��
function LuaPG_426802_Board_02()
	local Player = OwnerID()
	local EnergyBoard = TargetID()
	CloseSpeak(Player)
	DelBodyItem(Player, 243105, 1)
	WriteRoleValue(EnergyBoard, EM_RoleValue_Register2, Player)			--�N���a�O�b�۪O�W�]2�^
	WriteRoleValue(EnergyBoard, EM_RoleValue_Register1, 1)			--�۪O�ƭ��k�s
	WriteRoleValue(Player, EM_RoleValue_Register1, 1)				--��ܪ��a�}�l����
	AddBuff(Player, 625277, 0, 30)
	AddBuff(EnergyBoard, 622750, 0, 30)						--���۪O�@���k�s��buff
	CallPlot(EnergyBoard, "LuaPG_426802_BuffChange", Player, EnergyBoard)	--�۪O��buff��
end

--���۪O�@���k�s��buff�A�ɶ���|�o�T�������a�A�ç�������a���ƭ��k�s�A�M���ۤv
function LuaPG_426802_BFCK_01()	--�򥻪k�N�A������Ĳ�o�k�N����@���A�ˬd���a���S���q�L�í��m��
	local EnergyBoard = OwnerID()
--	Say(EnergyBoard, "LuaPG_426802_BFCK_01")
	local Player = ReadRoleValue(EnergyBoard, EM_RoleValue_Register2)
	local PlayerRight= ReadRoleValue(Player, EM_RoleValue_Register1)
	--SAY(Player, "point_"..PlayerRight)
	if PlayerRight==11			then
		SetFlag(Player, 548806, 1)
	end
	if CheckFlag(Player, 548806)==false	then				--�p�G�S���짹�����ȺX��
		ScriptMessage( Player, Player, 1,"[SC_Z30Q426802_3]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z30Q426802_3]", 0 )
	end
	CancelBuff(Player, 625277)
	WriteRoleValue(EnergyBoard, EM_RoleValue_Register1, 0)		--�۪O�ƭ��k�s
	WriteRoleValue(EnergyBoard, EM_RoleValue_Register2, 0)
	WriteRoleValue(Player, EM_RoleValue_Register1, 0)			--���a�ƭ��k�s
end
--�۪O�ݭn�|���y���a�O�_�b����A�S�����ܵo�T�������a�A�ƭ��k�s�A�M���ۤv
function LuaPG_426802_BFCK_02()	--�k�N���X�A�CX���@���P��
	local EnergyBoard = OwnerID()
--	Say(EnergyBoard, "LuaPG_426802_BFCK_02")
	local Player = ReadRoleValue(EnergyBoard, EM_RoleValue_Register2)
	local DisLong = CheckDistance(EnergyBoard, Player, 100)
	if DW_CheckQuestAccept("or",Player,426802)==false	then
		CancelBuff(EnergyBoard, 622750)
	end
	if DisLong==false					then
		ScriptMessage( Player, Player, 1,"[SC_Z30Q426802_4]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z30Q426802_4]", 0 )
		CancelBuff(EnergyBoard, 622750)
	end
end

--�۪O�}�l��A���ۤv�Wbuff�A�C2���@���A�C���n�Wbuff�e�������ˬd���W�ƭȬO�_��0�A��0�h�M���Ҧ�buff����X
function LuaPG_426802_BuffChange(Player, EnergyBoard)
--	Say(EnergyBoard, "LuaPG_426802_BuffChange")
	local Player = ReadRoleValue(EnergyBoard, EM_RoleValue_Register2)
	local RightNum
	local BUFFList = {[1]=625284,[2]=625285,[3]=625286,[4]=625287,[5]=625288}	
	local Num02 = DW_Ran(5)
	for i=1,10 do
		RightNum = ReadRoleValue(Player, EM_RoleValue_Register1)
		if RightNum==0	then
			break
		else
			AddBuff(EnergyBoard, BUFFList[Num02()], 0, 3)
			Sleep(30)
		end
	end
end

--���a���۪O�Wbuff�A�PŪ��۪O�W��buff�p�G�O�������T���A�X�{�S�ġA�õ������a����
--�p�G�O�����A�N�۪O�k�s�A�M���۪O�Ҧ�buff
function LuaPG_426802_BFUse_01()		--��
	local Player = OwnerID()
	local EnergyBoard = TargetID()
	local NPCOrgID = ReadRoleValue( EnergyBoard, EM_RoleValue_OrgID )
--	Say(OwnerID(), "Fire")
--	Say(TargetID(), "Fire")
	if NPCOrgID==123322			then
		if CheckBuff(EnergyBoard, 625284)==true	then	--��۪O�W������BUFF�A�����
			CallPlot(EnergyBoard, "LuaPG_426802_BuffRight", Player, EnergyBoard)
		else							--�S���
			CallPlot(EnergyBoard, "LuaPG_426802_BuffWrong", Player, EnergyBoard)
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_102706_13]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_102706_13]", 0 )
		CancelBuff(EnergyBoard, 622750)
	end
end

function LuaPG_426802_BFUse_02()		--�a
	local Player = OwnerID()
	local EnergyBoard = TargetID()
	local NPCOrgID = ReadRoleValue( EnergyBoard, EM_RoleValue_OrgID )
--	Say(EnergyBoard, "Earth")
	if NPCOrgID==123322			then
		if CheckBuff(EnergyBoard, 625285)==true	then	--��۪O�W������BUFF�A�����
			CallPlot(EnergyBoard, "LuaPG_426802_BuffRight", Player, EnergyBoard)
		else							--�S���
			CallPlot(EnergyBoard, "LuaPG_426802_BuffWrong", Player, EnergyBoard)
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_102706_13]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_102706_13]", 0 )
		CancelBuff(EnergyBoard, 622750)
	end
end

function LuaPG_426802_BFUse_03()		--��
	local Player = OwnerID()
	local EnergyBoard = TargetID()
	local NPCOrgID = ReadRoleValue( EnergyBoard, EM_RoleValue_OrgID )
--	Say(EnergyBoard, "Wind")
	if NPCOrgID==123322			then
		if CheckBuff(EnergyBoard, 625286)==true	then	--��۪O�W������BUFF�A�����
			CallPlot(EnergyBoard, "LuaPG_426802_BuffRight", Player, EnergyBoard)
		else							--�S���
			CallPlot(EnergyBoard, "LuaPG_426802_BuffWrong", Player, EnergyBoard)
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_102706_13]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_102706_13]", 0 )
		CancelBuff(EnergyBoard, 622750)
	end
end

function LuaPG_426802_BFUse_04()		--��
	local Player = OwnerID()
	local EnergyBoard = TargetID()
	local NPCOrgID = ReadRoleValue( EnergyBoard, EM_RoleValue_OrgID )
--	Say(EnergyBoard, "Water")
	if NPCOrgID==123322			then
		if CheckBuff(EnergyBoard, 625287)==true	then	--��۪O�W������BUFF�A�����
			CallPlot(EnergyBoard, "LuaPG_426802_BuffRight", Player, EnergyBoard)
		else							--�S���
			CallPlot(EnergyBoard, "LuaPG_426802_BuffWrong", Player, EnergyBoard)
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_102706_13]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_102706_13]", 0 )
		CancelBuff(EnergyBoard, 622750)
	end
end

function LuaPG_426802_BFUse_05()		--���
	local Player = OwnerID()
	local EnergyBoard = TargetID()
	local NPCOrgID = ReadRoleValue( EnergyBoard, EM_RoleValue_OrgID )
--	Say(EnergyBoard, "Minecraft")
	if NPCOrgID==123322			then
		if CheckBuff(EnergyBoard, 625288)==true	then	--��۪O�W������BUFF�A�����
			CallPlot(EnergyBoard, "LuaPG_426802_BuffRight", Player, EnergyBoard)
		else							--�S���
			CallPlot(EnergyBoard, "LuaPG_426802_BuffWrong", Player, EnergyBoard)
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_102706_13]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_102706_13]", 0 )
		CancelBuff(EnergyBoard, 622750)
	end
end

function LuaPG_426802_BuffWrong(Player, EnergyBoard)
	ScriptMessage( Player, Player, 1,"[SC_Z30Q426802_5]", 0 )
	ScriptMessage( Player, Player, 0,"[SC_Z30Q426802_5]", 0 )
	WriteRoleValue(Player, EM_RoleValue_Register1, 0)		--��ܪ��a���~����
	CancelBuff(EnergyBoard, 622750)
end

function LuaPG_426802_BuffRight(Player, EnergyBoard)
	local Num02 = ReadRoleValue(Player, EM_RoleValue_Register1)
	ScriptMessage( Player, Player, 1,"[SC_Z30Q426802_6]", 0 )
	ScriptMessage( Player, Player, 0,"[SC_Z30Q426802_6]", 0 )
	WriteRoleValue(Player, EM_RoleValue_Register1, Num02+1)	--��ܪ��a���T����
end

--===============������q�۳U
function LuaPG_426802_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426802)==true		and
	CountBodyItem(Player, 243105)==0				and
	CheckFlag(Player, 548806) == false				then
		AddSpeakOption(Player,NPC, "[SC_Z30Q426802_7]", "LuaPG_426802_Retake_02", 0 )
	end
end

function LuaPG_426802_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 243105, 1)
end

--===============���U���ȫ᪺��t
--CliBuff:625142
--WalkFlag:781381 no.3~4
function LuaPG_426802_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426802_Accept_02" , NPC, Player, CliBuff)	----���t��function
	end
end

function LuaPG_426802_Accept_02(NPC, Player, CliBuff)
	local WalkFlag = 781381
	local Actor = CreateObjByFlag( 123324, WalkFlag, 3, 1)				----�ͦ��t��
	ks_ActSetMode(Actor)
	DW_MoveToFlag( Actor, WalkFlag, 4, 0, 1)
	DelObj(Actor)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=====================================
--426803 �i���n����
--=====================================
function LuaPG_426803_Tell(NPCID)
	local Player = OwnerID()
	local NPC = TargetID()
	local TalkingList = {}
	TalkingList[123338] = {"[SC_Z30Q426803_1]",548805}
	TalkingList[117246] = {"[SC_Z30Q426803_2]",548804}
	SetSpeakDetail(Player, TalkingList[NPCID][1])
	SetFlag(Player, TalkingList[NPCID][2], 1)
end


--=====================================
--426804 ���c�N�I��Ӥ�
--=====================================
--	NPC�G123363 �ɦ�X�w�B123358 �º��D���_���B123329 ��w�B123364 �u�\�L�A123372 �ɦ�X�w
--	��t�ΡG123359 �ɦ�X�w�B123362 �º��D���_���B123361 ��w�B123360 �u�\�L�A123371 �ɦ�X�w
--	625316 clibuff
--	EM_RoleValue_Register+1	������t�O�_�b�i�椤�A"0"=�_�A"1"=�O�A"2"=�Y�N�}�l
--	781381 NO.10~12
--=======================
function LuaPG_Z30_123358_Talk_Main()	--123358 �º��D���_���A��ܼ@��
	local Player = OwnerID()
	local NPC = TargetID()
	if CheckAcceptQuest( Player, 426804 ) == true and
	Checkflag(Player,548803)==false		then
	--�ˬd�O�_�������ȡA�����~��ܪ�t�Ϊ����
		SetSpeakDetail( Player, "[SC_Z30Q426804_AN_2]" )
		AddSpeakOption( Player, NPC, "[SC_Z30Q426804_AN_1]", "FN_Quest_Acting_plot(426804, 625316, \"LuaPG_Z30_Q426804_Act_Main\")", 0 )
		--��ܿﶵCALL���禡�A�N�J�ѼƭY���r��h�ϥ� \" �e�᧨�_��
		--�t�X�q�αƶ��禡�ϥΡA�o��@�w�n�N�J�D�n��t��function�r��
	elseif DW_CheckQuestAccept("or",Player,426900)==true	and
	CountBodyItem(Player, 243116)==0				then
		AddSpeakOption(Player,NPC, "[SC_Z30Q426900_1]", "LuaPG_426900_Retake_02", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_Z30_Q426804_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	local NPCTable = SearchRangeNPC( NPC, 300 )
	local BuffID = 625316
	local QuestID = 426804
	local FlagID = 781381
	--�ѷӳ��WNPC����m�A�гy�t��NPC
	for i = 0, #NPCTable do
		local OrgID = ReadRoleValue( NPCTable[i], EM_RoleValue_OrgID )
		local x, y, z, dir = DW_Location( NPCTable[i] )
		local NPCPID = ReadRoleValue( NPCTable[i], EM_RoleValue_PID )
		if OrgID == 123363	then			--�ɦ�X�w
			Actor[1] = CreateObj( 123359, x, y, z, dir, 1 )
		end
		if OrgID == 123358	then			--�º��D���_��
			Actor[2] = CreateObj( 123362, x, y, z, dir, 1 )
		end
		if OrgID == 123329	then			--��w
			Actor[3] = CreateObj( 123361, x, y, z, dir, 1 )
		end
		if OrgID == 123364 and NPCPID == 1	then	--�u�\�L�A���۪�����
			Actor[4] = CreateObj( 123360, x, y, z, dir, 1 )
		end
		if OrgID == 123372	then			--�ɦ�X�w�A�a�O�U
			Actor[5] = CreateObj( 123371, x, y, z, dir, 1 )
			SetModeEx( Actor[5], EM_SetModeType_Gravity,false)	--���O����
			--AddBuff(Actor[5], 621301,0,-1)
		end
		if OrgID == 123289	then			--�ͤ@����
			Actor[6] = CreateObj( 119875, x, y, z, dir, 1 )
		end
	end

	--�ݭn��NPC�O123359�M123362�M123361�M123360
	for i = 1, 4 do
		MoveToFlagEnabled( Actor[i], false )
		if i == 3 then	--��w �ƾԳB�z
			SetDefIdleMotion( Actor[i], ruFUSION_MIME_IDLE_COMBAT_UNARMED)
		end
		SetModeEx( Actor[i], EM_SetModeType_Searchenemy,false)	--���Ĩ���
		SetModeEx( Actor[i] , EM_SetModeType_Fight, false)		-- �i�����������
		AddToPartition( Actor[i], RoomID )
	end
	--
	local MusicID = {}
	for i = 1, #ActPlayerTable do		--����Client�@���һݭn���P�_��buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--���񭵼֬����B�z
		Lua_StopBGM( PlayerID )		--����a�I�����֪�����
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, "music/dungeon/Lair/LHL_09_APF_oceania.mp3", true )
	end
	Sleep(25)
	AddToPartition( Actor[6], RoomID )
		SetModeEx(Actor[6], EM_SetModeType_Mark,FALSE)
		SetModeEx(Actor[6], EM_SetModeType_Move,FALSE)
	--�ܦ��Ҧ�NPC�t���w�g�ǳƦn�A�O���bActor�o�Ӱ}�C��

	PlayMotion(Actor[1], ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	PlayMotion( Actor[2], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)	--�º��n�Y�ʧ@
	Yell( Actor[2], "[SC_Z30Q426804_1]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT)	--�º����H�ʧ@
	Yell( Actor[2], "[SC_Z30Q426804_2]" ,3)
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[3], ruFUSION_ACTORSTATE_ATTACK_UNARMED)	--��w�ͮ�ʧ@
	Yell( Actor[3], "[SC_Z30Q426804_3]" ,3)
	Sleep( 20 )
	SetDefIdleMotion( Actor[3], ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[1], ruFUSION_ACTORSTATE_EMOTE_POINT)	--SCMD���H�ʧ@
	Yell( Actor[1], "[SC_Z30Q426804_4]" ,3)
	Sleep( 35 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[1], ruFUSION_ACTORSTATE_EMOTE_LAUGH)	--SCMD�j���ʧ@
	Yell( Actor[1], "[SC_Z30Q426804_5]" ,3)
	Sleep( 45 )	
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Yell( Actor[3], "[SC_Z30Q426804_6]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)	--SCMD�n�Y�ʧ@
	Yell( Actor[1], "[SC_Z30Q426804_7]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[1], ruFUSION_ACTORSTATE_EMOTE_POINT)	--SCMD���H�ʧ@
	Yell( Actor[1], "[SC_Z30Q426804_8]" ,3)
	Sleep( 40 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[2], ruFUSION_ACTORSTATE_EMOTE_LAUGH)	--�º��j���ʧ@
	Yell( Actor[2], "[SC_Z30Q426804_9]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT)	--�º����H�ʧ@
	Yell( Actor[2], "[SC_Z30Q426804_10]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[2], ruFUSION_ACTORSTATE_EMOTE_WAVE)	--�º�����ʧ@
	Yell( Actor[2], "[SC_Z30Q426804_11]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[2], ruFUSION_ACTORSTATE_EMOTE_SPEAK)		--�º����ܰʧ@
	Yell( Actor[2], "[SC_Z30Q426804_12]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[1], ruFUSION_ACTORSTATE_EMOTE_LAUGH)	--SCMD�j���ʧ@
	Yell( Actor[1], "[SC_Z30Q426804_13]" ,3)
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	AddToPartition( Actor[6], RoomID )
	Yell( Actor[3], "[SC_Z30Q426804_14]" ,3)
	Sleep( 20 )
	CastSpell(Actor[3], Actor[6],850191)	--��w�I�k�A�a�W�X�{�k�}
	Sleep( 30 )
	ScriptMessage( Actor[3], 0, 2, "[SC_Z30Q426804_15]", C_SYSTEM )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--SCMD�X�{�b�a�O�U
	Yell( Actor[1], "[SC_Z30Q426804_16]" ,3)
	--DW_MoveDirectToFlag(Actor[1] , FlagID, 10, 0, 1) 
	Sleep( 25 )	
	DelObj(Actor[1])
	--�k�}����
	local MagicCircle01 = ReadRoleValue(Actor[6], EM_RoleValue_Register1)
	local MagicCircle02 = ReadRoleValue(Actor[6], EM_RoleValue_Register2)
	DelObj(MagicCircle01)
	DelObj(MagicCircle02)
	WriteRoleValue(Actor[6], EM_RoleValue_Register1,0)
	WriteRoleValue(Actor[6], EM_RoleValue_Register2,0)
	Sleep( 20 )
	ScriptMessage( Actor[3], 0, 2, "[SC_Z30Q426804_17]", C_SYSTEM )
	Sleep( 20 )
	DelObj(Actor[6])
	AddToPartition( Actor[5], RoomID )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--��w���˳ѤU���u�\�L
		for P=3,4 do
			--SetModeEx( Actor[P], EM_SetModeType_Searchenemy,true)	--���Ĩ���
			SetModeEx( Actor[P] , EM_SetModeType_Fight, true)		-- �i�����������
			SetModeEx( Actor[P] , EM_SetModeType_Strikback , true )	-- ����
		end
	SetAttack(Actor[3], Actor[4])
	MoveToFlagEnabled(Actor[3], false )
	--DW_MoveToFlag(Actor[3] , FlagID, 11, 0, 1) 
	Yell( Actor[3], "[SC_Z30Q426804_18]" ,3)
	Sleep( 35 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[5], ruFUSION_ACTORSTATE_EMOTE_ANGRY)	--SCMD�ͮ�ʧ@
	Yell( Actor[5], "[SC_Z30Q426804_19]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[3], ruFUSION_ACTORSTATE_BUFF_SP01)
	Yell( Actor[3], "[SC_Z30Q426804_20]" ,3)
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[5], ruFUSION_ACTORSTATE_EMOTE_LAUGH)	--SCMD�j���ʧ@
	Yell( Actor[5], "[SC_Z30Q426804_21]" ,3)
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	FA_FaceFlagEX( Actor[3], FlagID, 12, 0, 0 )				--��w��V�º�
	SetDefIdleMotion( Actor[3], ruFUSION_MIME_IDLE_STAND)
	Yell( Actor[3], "[SC_Z30Q426804_22]" ,3)
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	for i = 1, #ActPlayerTable do		--�缾�a���B�z
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548803, 1 )	--�����U�@�ӥ��Ȫ����n���~
		CancelBuff( PlayerID, BuffID )	--�R��Client�㹳��buff
		--�����@��bgm �^�_�쥻��bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	DelObj(Actor[2])
	DelObj(Actor[3])
	DelObj(Actor[5])
end

function LuaPG_426804_CreateCircle()
	local NPC = TargetID()
	local x, y, z, dir = DW_Location( NPC)
	local MagicCircle01 = CreateObj(120303, x, y, z , dir, 1 )	--�ͦ�
	local MagicCircle02 = CreateObj(123357, x, y, z , dir, 1 )	--�ͦ�
	AddToPartition(MagicCircle01, 0)
	AddToPartition(MagicCircle02, 0)
	WriteRoleValue(NPC, EM_RoleValue_Register1,MagicCircle01)
	WriteRoleValue(NPC, EM_RoleValue_Register2,MagicCircle02)
end

--=====================================
--426899 �̲ת��_��
--=====================================
function LuaPG_426899_TalktoKid()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426899)==true		and
	CheckBuff(Player, 625317)==false				and
	CountBodyItem(Player, 243117)==0				then
		AddSpeakOption(Player,NPC, "[SC_Z30Q426899_1]", "LuaPG_426899_TalktoKid_02(1)", 0 )
	end
end

function LuaPG_426899_TalktoKid_02(Num)
	local Player = OwnerID()
	local NPC = TargetID()
	if Num == 1	then
		SetSpeakDetail(Player, "[SC_Z30Q426899_2]")
		AddSpeakOption(Player,NPC, "[SC_Z30Q426899_3]", "LuaPG_426899_TalktoKid_02(2)", 0 )
	elseif  Num == 2	then
		CloseSpeak(Player)
		ScriptMessage( Player, Player, 1,"[SC_Z30Q426899_8]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z30Q426899_8]", 0 )	
		AddBuff(Player, 625317, 0, 15)
	end
end

--===============�������ȫ᪺��t
--CliBuff:509332
--WalkFlag:781381 no.5
function LuaPG_426899_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 509332
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 15)
		local WalkFlag = 781381
		local Actor = CreateObjByFlag( 123374, WalkFlag, 11, 1)		----�ͦ��t��
		ks_ActSetMode(Actor)
		PlayMotion(Actor, ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		NPCSAY(Actor, "[SC_Z30Q426899_5]")
		Sleep(25)
		PlayMotion(Actor, ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		NPCSAY(Actor, "[SC_Z30Q426899_6]")
		Sleep(25)
		--PlayMotion(Actor, ruFUSION_ACTORSTATE_EMOTE_IDLE3)
		NPCSAY(Actor, "[SC_Z30Q426899_7]")
		Sleep(25)
		PlayMotion(Actor, ruFUSION_ACTORSTATE_BUFF_SP01)
		AddBuff(Actor, 625145, 0, 3)						----��w�ǰe���k�N��t
		Sleep(15)
		DelObj(Actor)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register1,0)
	end
		ScriptMessage( Player, Player, 1,"[SC_Z30Q426899_4]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z30Q426899_4]", 0 )
end

--=====================================
--426900 �k�~
--=====================================
function LuaPG_426900_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 243116, 1)
end