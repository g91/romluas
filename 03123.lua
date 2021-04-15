--z29��u=======================================
--=======================================
--426787 ���H�Ӫ����I�Ϊ�
--=======================================
function LuaPG_426787_Click_Before()
	local Player = OwnerID()
	local NPC = TargetID()
	if CountBodyItem(Player, 243135)==0	then
		ScriptMessage( Player, Player, 1, "[SC_Z29Q426787_1]", C_Red )
		ScriptMessage( Player, Player, 0, "[SC_Z29Q426787_1]", C_Red )		
		return false
	end
		return true
end

function LuaPG_426787_Click_After()
	local Player = OwnerID()
	DelBodyItem(Player, 243135, 1)
	DW_QietKillOne(Player,108570)			 --�R�R�������ǡA�e�̱�����̡A0�N�����a
	return 1	
end

function LuaPG_123388_Talk()
	local Player = OwnerID()
	local NPC = TargetID()

	if DW_CheckQuestAccept("or",Player,426787,426929,426941)==true		and
	CountBodyItem(Player, 243135)==0						then
		LoadQuestOption(Player)
		AddSpeakOption(Player,NPC, "[SC_Z29Q426787_2]", "LuaPG_123388_Retake", 0 )
	elseif DW_CheckQuestAccept("or",Player,426788)==true			and
	CheckFlag(Player, 548831)==false						then
		SetSpeakDetail(Player, "[SC_Z29Q426788_1]")
		AddSpeakOption(Player,NPC, "[SC_Z29Q426788_2]", "LuaPG_426788_Talk(1)", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_123388_Retake()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 243135, 10)
end


--=======================================
--426790 ��F�hù���H��
--=======================================
function LuaPG_426789_Complete()
	local Player = TargetID()
	SetFlag(Player, 548839, 1)
	SetFlag(Player, 548841, 1)
end


--=======================================
--426788 ��Ʀ���
--=======================================
function LuaPG_426788_Talk(Option)
	local Player = OwnerID()
	local NPC = TargetID()
	if Option==1	then
		SetSpeakDetail(Player, "[SC_Z29Q426788_3]")
		AddSpeakOption(Player,NPC, "[SC_Z29Q426788_4]", "LuaPG_426788_Talk(2)", 0 )		
	elseif Option==2	then
		SetSpeakDetail(Player, "[SC_Z29Q426788_5]")
		SetFlag(Player, 548831, 1)			
	end
end


--=======================================
--426790 ��F�hù���H��
--=======================================
--�c�J�|�X�{�b3�Ӧa��A�Q�Τ���Ū�����P���ɶ��MPID�ȥh�ͥX
function LuaPG_426790_CreateALuke()
	local Center = OwnerID()
	local Time = GetSystime(2)						--����{�b�ɶ��]�ɡ^
	local RoomID = ReadRoleValue( Center, EM_RoleValue_RoomID )
	local CenterPID = ReadRoleValue( Center , EM_RoleValue_PID )
	local Num = ReadRoleValue(Center, EM_RoleValue_Register2)		--�{�b���S���c�J���ȡAno2
	local Luke
	local x,y,z,dir=DW_Location(Center)
	local TimeList = {}
--	TimeList[1] = {0,8}
--	TimeList[2] = {8,16}
--	TimeList[3] = {16,23}

	TimeList[1] = {10,20}
	TimeList[2] = {20,30}
	TimeList[3] = {0,10}

	if Time>=TimeList[CenterPID][1] and Time<TimeList[CenterPID][2]	then
		if Num==0				then
			Luke = CreateObj(123393, x, y, z , dir, 1 )
			AddToPartition( Luke,  RoomID)
			WriteRoleValue(Center, EM_RoleValue_Register1, Luke)	--��c�J�O�b�����W�Ano1
			WriteRoleValue(Luke, EM_RoleValue_Register1, Center)	--�⤤���O�b�c�J�W�Ano1
			WriteRoleValue(Center, EM_RoleValue_Register2, 1)
			--Sleep(36000)							--1�p���ˬd�@��
			Sleep(600)
			BeginPlot( Center, "LuaPG_426790_CreateALuke_02" , 0 )
		end
	end

	if  CenterPID<3	then
		if (Time>=TimeList[CenterPID][2] or Time<TimeList[CenterPID][1])
		 and Num>0							then
			Luke = ReadRoleValue(Center, EM_RoleValue_Register1)
			DelObj(Luke)
			--Sleep(36000)							--1�p���ˬd�@��
			Sleep(600)
			WriteRoleValue(Center, EM_RoleValue_Register2, 0)		--�k�s
			BeginPlot( Center, "LuaPG_426790_CreateALuke_02" , 0 )
		end
	end

	if CenterPID==3	then
		if Time<10 and Time>=0 and Num>0				then
		--if Time<16 and Time>=0 and Num>0				then
			Luke = ReadRoleValue(Center, EM_RoleValue_Register1)
			DelObj(Luke)
			--Sleep(36000)							--1�p���ˬd�@��
			Sleep(600)
			WriteRoleValue(Center, EM_RoleValue_Register2, 0)		--�k�s
			BeginPlot( Center, "LuaPG_426790_CreateALuke_02" , 0 )
		end
	end
end

function LuaPG_426790_CreateALuke_02()
	BeginPlot( OwnerID(), "LuaPG_426790_CreateALuke" , 0 )
end

function LuaPG_426790_Talk()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426790,426931,426943)==true		and
	CheckFlag(Player, 548832)==false						then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426790_1]", "LuaPG_426790_Talk_02", 0 )
	end
end

function LuaPG_426790_Talk_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	SetFlag(Player, 548832, 1)
end


--=======================================
--426905 �Y��P��w�ǻ�
--=======================================
function LuaPG_426905_Talk()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426905)==true		and
	CheckFlag(Player, 548835)==false				and
	NPCOrgID == 123398					then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426905_AN_1]", "LuaPG_426905_Talk_02(1)", 0 )

	elseif DW_CheckQuestAccept("or",Player,426906)==true	and
	CheckFlag(Player, 548836)==false				and
	NPCOrgID == 123402					then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426906_1]", "LuaPG_426905_Talk_02(4)", 0 )
	end
end

function LuaPG_426905_Talk_02(Option)
	local Player = OwnerID()
	local NPC = TargetID()

	if Option==1		then
		SetSpeakDetail(Player, "[SC_Z29Q426905_1]")
		AddSpeakOption(Player,NPC, "[SC_Z29Q426905_AN_2]", "LuaPG_426905_Talk_02(2)", 0 )		
	elseif Option==2	then
		SetSpeakDetail(Player, "[SC_Z29Q426905_2]")
		AddSpeakOption(Player,NPC, "[SC_Z29Q426905_AN_3]", "LuaPG_426905_Talk_02(3)", 0 )
	elseif Option==3	then
		SetSpeakDetail(Player, "[SC_Z29Q426905_3]")
		SetFlag(Player, 548835, 1)			
	elseif Option==4	then
		CloseSpeak(Player)
		SetFlag(Player, 548836, 1)
	end
end


--=======================================
--426908 �w������
--=======================================
--===============�������ȫ᪺��t
--CliBuff:624532
--WalkFlag:781337 no.50~53
function LuaPG_426908_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local WalkFlag = 781337
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		local Naive = CreateObjByFlag( 123408, WalkFlag, 50, 1)			----�ͦ��t��Naive
		local Barki = CreateObjByFlag( 123409, WalkFlag, 51, 1)			----�ͦ��t��Barki
		ks_ActSetMode( Naive)
		ks_ActSetMode( Barki)
		NPCSAY(Naive,"[SC_Z29Q426908_1]")
		WriteRoleValue(Naive, EM_RoleValue_IsWalk , 0 )
		WriteRoleValue(Barki, EM_RoleValue_IsWalk , 0 )
		DW_MoveDirectToFlag(Naive , WalkFlag, 53, 0, 1)
		DW_MoveToFlag( Barki, WalkFlag, 52, 0, 1)
		DelObj(Naive)
		DelObj(Barki)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register1,0)
	end	
end


--=======================================
--426667 ��Ӧn����
--=======================================
function LuaPG_426667_ClickBefore()
	local Player = OwnerID()
	local Plant = TargetID()
--	Say(Plant, "OHYA")
	if CountBodyItem(Player, 243146)<5	then
		return true
	else
		ScriptMessage( Player, Player, 1,"[SC_Z29Q426667_1]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z29Q426667_1]", 0 )
		return false
	end
end

function LuaPG_426667_ClickAfter()
	local Player = OwnerID()
	local Plant = TargetID()
	local Num = DW_Rand(20)
--	Say(Plant, Num)
	if Num<=8	then
		GiveBodyItem(Player, 243146,1)
	else
		ScriptMessage( Player, Player, 1,"[SC_Z29Q426667_2]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z29Q426667_2]", 0 )
	end
	return 1
end


--=======================================
--426792 �Z������
--=======================================
function LuaPG_426792_LetsFight()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local NPCList = {}
	NPCList[123386]=548833
	NPCList[123387]=548834
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426792,426933,426945)==true		and
	CheckFlag(Player, NPCList[NPCOrgID])==false 				then
		AddSpeakOption(Player, NPC, "[SC_Z29Q426792_1]", "LuaPG_426792_LetsFight_01", 0)
	end
end

function LuaPG_426792_LetsFight_01()
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak(Player)
	if ReadRoleValue( NPC,EM_RoleValue_Register1 ) ==0 then	--�P�_���S���b�԰������ȡAno.1
		WriteRoleValue( NPC,EM_RoleValue_Register1,1 )
		CallPlot(NPC,"LuaPG_426792_LetsFight_02",Player,NPC)		
	end
end

--��ܫ����
function LuaPG_426792_LetsFight_02( Player,NPC )
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local RoomID =ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local NPCList = {}
	NPCList[123386]=108650
	NPCList[123387]=108651
	local x,y,z,dir = DW_Location( NPC )
	local Monster = CreateObj( NPCList[NPCOrgID],x,y,z,dir,1 )
--		SetRoleCampID( Obj,3 )
		WriteRoleValue( Monster,EM_RoleValue_Register2,NPC)		--�⤤���g�b�ǤW�Ano.2
--		SetPlot( Obj,"dead","LuaPG_426792_Dead",0 )
		hide( NPC)
		AddToPartition( Monster,RoomID)
		SetAttack( Monster,Player )
end

--���`Ĳ�o
function LuaPG_426792_Dead()
	local Monster = OwnerID()
	local PlayerTeam = HateListCount( Monster )
	local NPC = ReadRoleValue( Monster,EM_RoleValue_Register2 )
	WriteRoleValue( Monster,EM_RoleValue_Register1,1)
	local tmpID={}
		for i = 0 , PlayerTeam-1, 1 do
			local ID = HateListInfo( Monster ,i , EM_HateListInfoType_GItemID )
			table.insert(tmpID,ID)
		end
	if ReadRoleValue( Monster,EM_RoleValue_Register1)==1 then
		SetFightMode( Monster,0,0,0,0 )
		CallPlot( NPC,"LuaPG_426792_FightOver",tmpID,Monster,NPC)
	end
	return false
end

function LuaPG_426792_FightOver(tmpID,Monster,NPC)
	Sleep(25)
	Say(Monster, "[SC_Z29Q426792_2]")
	Sleep(20)
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local NPCList = {}
	NPCList[123386]=548833
	NPCList[123387]=548834
	for i=1,#tmpID do
		SetFlag(tmpID[i],NPCList[NPCOrgID],1)
	end
	DelObj(Monster)
	WriteRoleValue(NPC, EM_RoleValue_Register1, 0)
	Show(NPC,0)
end

function LuaPG_426792_DeleteItself()		--�Ǫ������ͼ@��
	--Say(OwnerID(), "DeleteItself")
	local CreateMon = OwnerID()
	while 1 do
		sleep(300)
		if HateListCount(CreateMon)==0	then				--�ˬd���ܦC��A�S���H����
			local NPC = ReadRoleValue( CreateMon,EM_RoleValue_Register2)
			local x,y,z,dir = DW_Location( CreateMon )
			local time = Move( NPC,x,y,z )
			Sleep( time*10 )
			WriteRoleValue( NPC,EM_RoleValue_Register1,0 )		--�������s
			Show ( NPC,0)
			DelObj(CreateMon)						--�R���ۤv		
			break
		end
	end
end


--=======================================
--------�G�m
--=======================================
----�S�ѹL�D�u���ܡA�|�Q��w���l����
function LuaPG_108655_GetOut()
	LuaS_PG_NowToHide()
	AddBuff( OwnerID(), 623132, 0, -1 )
	SetPlot( OwnerID(),"range","LuaPG_108654_GetOut_02",150 ) 
end

function LuaPG_108654_GetOut()
	MoveToFlagEnabled( OwnerID(), false )
	SetPlot( OwnerID(),"range","LuaPG_108654_GetOut_02",300 ) 
end

function LuaPG_108654_GetOut_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local PlayerJob = ReadRoleValue( Player, EM_RoleValue_VOC)
	if PlayerJob==0		then			--�ư�GM
		return
	end
	if CheckCompleteQuest( Player,421653 ) ==true	then
		return
	end
	SetAttack(NPC,Player)
end

function LuaPG_bow_01()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN,ruFUSION_ACTORSTATE_ATTACK_BOW_LOOP)
end

function LuaPG_BUFF_SP01()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
end

function LuaPG_Stop_Moveing_Z29()
	AddBuff( OwnerID(), 623132, 0, -1 )
end

--==============�䨫�仡��
function LuaPG_z29_decorate_01()
--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 20
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 100  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��

--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108248,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108249,Matrix,2,1 )
	BeginPlot( ObjMatrix[1] , "LuaPG_z29_decorate_03" , 0 );	
	BeginPlot( ObjMatrix[2] , "LuaPG_z29_decorate_04" , 0 );
	WriteRoleValue(ObjMatrix[1], EM_RoleValue_Register2, ObjMatrix[2])
	WriteRoleValue(ObjMatrix[2], EM_RoleValue_Register2, ObjMatrix[1])

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaPG_z29_decorate_02" , 0 );
end

function LuaPG_z29_decorate_02()
	BeginPlot( OwnerID() , "LuaPG_z29_decorate_01" , 2 );
end

function LuaPG_z29_decorate_03()
	local NPC = OwnerID()
	local Speak={}
	local Other = ReadRoleValue(NPC,EM_RoleValue_Register2)
	local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD -- 1/5 ���v���X�I�Y�ʧ@
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_SPEAK

	while 1 do 
		local i = rand(5)
		Motion = Speak[i]
		AdjustFaceDir( NPC, Other, 0 )
		PlayMotion( NPC,Motion )
		sleep(30)
	end
end

function LuaPG_z29_decorate_04()
	local NPC = OwnerID()
	local Other = ReadRoleValue(NPC,EM_RoleValue_Register2)
	While 1  do 
		AdjustFaceDir( NPC, Other, 0 )
		PlayMotion( NPC,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30+Rand(20))
	end
end