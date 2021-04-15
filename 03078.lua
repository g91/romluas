--z28�D�u=======================================
--=======================================
--426617 ���~�n�s
--=======================================
function LuaPG_426617_Click_After()		--�I�F�g��
	local Player = OwnerID()
	local Dirt = TargetID()
	local x,y,z,dir=DW_Location(Dirt)
	local Num03 = ReadRoleValue(Dirt, EM_RoleValue_Register3)

	if Num03 == 0	then
--		DebugMsg(0,0,"X="..x.."Y="..y.."Z="..z.."DIR="..dir)
		CallPlot(Dirt, "LuaPG_426617_CreateAMon", Player, Dirt)
	end
	return 1
end

function LuaPG_426617_CreateAMon(Player, Dirt)	--�ͤ@���Τl
	local Monster = 107906
	local x,y,z,dir=DW_Location(Dirt)

	ScriptMessage( Player, Player, 1,"[SC_Z28Q426617_1]", 0 )
	Sleep(20)
	local CreateMon = CreateObj(Monster, x, y, z , dir, 1 )				--�ͦ�
	AddToPartition(CreateMon, 0)	
--	WriteRoleValue(Dirt, EM_RoleValue_Register3, 1)				--�Ȭ����b����
	WriteRoleValue(CreateMon, EM_RoleValue_Register2, Dirt)			--�⤤���g�b�Ǫ��W
	WriteRoleValue(CreateMon , EM_RoleValue_IsWalk , 1 )
end

function LuaPG_107906_Died()
	local CreateMon = OwnerID()
	local Dirt = ReadRoleValue(CreateMon, EM_RoleValue_Register2)
	WriteRoleValue(Dirt, EM_RoleValue_Register3, 0)				--�N�g�諸�ȼg�^0
end

function LuaPG_107906_DeleteItself()		--�Ǫ������ͼ@��
	local CreateMon = OwnerID()
	local Dirt = ReadRoleValue(CreateMon, EM_RoleValue_Register2)
	while 1 do
		sleep(600)
		if HateListCount(CreateMon)==0	then				--�ˬd���ܦC��A�S���H����
--			WriteRoleValue(Dirt,EM_RoleValue_Register3,0)		--�N�g�諸�ȼg�^0
			DelObj(CreateMon)						--�R���ۤv			
			break
		end
	end
end



--=======================================
--426618 �u�ӤH
--=======================================
function LuaPG_426618_TalkToBoss()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426618)==true		and
	CountBodyItem(Player, 243039)==0				then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426618_01]", "LuaPG_426618_TalkToBoss_02", 0 )

	elseif DW_CheckQuestAccept("or",Player,426661426738,426743)==true	and
	CountBodyItem(Player, 243047)==0	 					and
	CheckFlag(Player, 548408)==false						then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426661_AN_2]", "LuaPG_426661_TalktoGoddess_02(2)", 0)

	elseif  DW_CheckQuestAccept("or",Player,426665)==true	and
	CountBodyItem(Player, 243052)>0	 			and
	CheckFlag(Player, 548412)==false				then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426665_2]", "LuaPG_426665_Give", 0)

	elseif DW_CheckQuestAccept("or",Player,426666)==true	and
	CountBodyItem(Player, 243053)==0	 			and
	CheckFlag(Player, 548413)==false				then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426666_AN_1]", "LuaPG_426666_Retake", 0)
	end
end

function LuaPG_426618_TalkToBoss_02()
	local Player = OwnerID()
	local NPC = TargetID()
	GiveBodyItem(Player, 243039, 1)
	CloseSpeak(Player)
end


--=======================================
--426619 �L������
--=======================================
function LuaPG_426619_Click_After()
	local Player = OwnerID()
	local NPC = TargetID()

	DW_QietKillOne(Player,108205)			 --�R�R�������ǡA�e�̱�����̡A0�N�����a
 	return 1
end


--=======================================
--426621 ��ƽ���
--=======================================
function LuaPG_426618_TalkToTreeMan()
	local Player = OwnerID()
	local NPC = TargetID()

	if DW_CheckQuestAccept("or",Player,426621)==true		and
	CheckFlag(Player, 548403)==false				then
		SetSpeakDetail(Player, "[SC_Z28Q426621_1]")
		AddSpeakOption(Player,NPC, "[SC_Z28Q426621_AN_1]", "LuaPG_426618_TalkToTreeMan_02(1)", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_426618_TalkToTreeMan_02(Num)
	local Player = OwnerID()
	local NPC = TargetID()

	if Num == 1		then
		SetSpeakDetail(Player, "[SC_Z28Q426621_2]")
		AddSpeakOption(Player,NPC, "[SC_Z28Q426621_AN_2]", "LuaPG_426618_TalkToTreeMan_02(2)", 0 )
	elseif Num == 2	then
		SetSpeakDetail(Player, "[SC_Z28Q426621_3]")
		SetFlag(Player, 548403, 1)
	end
end


--=======================================
--426624 �ͩR���ϼ�
--=======================================
function LuaPG_426624_TalktoGoddess_02(Num)
	local Player = OwnerID()
	local NPC = TargetID()

	if Num == 1		then
		SetSpeakDetail(Player, "[SC_Z28Q426624_1]")
		AddSpeakOption(Player,NPC, "[SC_Z28Q426624_AN_2]", "LuaPG_426624_TalktoGoddess_02(2)", 0 )
	elseif Num == 2	then
		SetSpeakDetail(Player, "[SC_Z28Q426624_2]")
		AddSpeakOption(Player,NPC, "[SC_Z28Q426624_AN_3]", "LuaPG_426624_TalktoGoddess_02(3)", 0 )
	elseif Num == 3	then
		SetSpeakDetail(Player, "[SC_Z28Q426624_3]")
		SetFlag(Player, 548404, 1)
	end
end


--=======================================
--426627 ����u���H
--=======================================
--���U���ȫ�t��
--=======================================
--CliBuff:624043
--WalkFlag:781337 no.24~27
function LuaPG_426627_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 624043
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426627_Accept_02" , NPC, Player, CliBuff)	----���t��function
	end	
end

function LuaPG_426627_Accept_02(NPC, Player, CliBuff)
	local WalkFlag = 781337
	local Actor = {}
	for i=0,1 do
		Actor[i] =  CreateObjByFlag( 123052+i, WalkFlag, 24+i, 1)		----�ͦ��t��
		ks_ActSetMode( Actor[i] )
	end
	DW_MoveDirectToFlag(Actor[1] , WalkFlag, 26, 0, 1)
	DW_MoveToFlag( Actor[0] , WalkFlag, 27, 0, 1)
	DelObj(Actor[0])
	DelObj(Actor[1])
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


function LuaPG_426627_Ask()
	local Player = OwnerID()
	SetFlag(Player, 548405, 1)
	CloseSpeak(Player)	
end


--z28��u=======================================
--=======================================
--426655 �T�]���`
--=======================================
--���U���ȫ�Wbuff�A��buff�]�������A�^�~��}�l�Y�ѥ]
function LuaPG_426655_Accept()
	local Player = TargetID()
	AddBuff(Player, 624957, 0, -1)
end

--�I�ѥ]�e�A�ˬd���S������buff
function LuaPG_426655_Click_Before()
	local Player = OwnerID()
	local BuffCheck=Lua_BuffPosSearch( Player ,624958)			--�䪱�a���W�P�_BUFF����l
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )	--�T�{BUFF�h��
	if BuffLv>=9	then
		ScriptMessage( Player, Player, 1, "[SC_Z28Q426655_2]", C_Red )
		ScriptMessage( Player, Player, 0, "[SC_Z28Q426655_2]", C_Red )
		return false
	end
	if CheckBuff(Player, 624957)==false	then
		ScriptMessage( Player, Player, 1, "[SC_Z28Q426655_1]", C_Red )
		ScriptMessage( Player, Player, 0, "[SC_Z28Q426655_1]", C_Red )
		return false
	end
	return true
end

--�I���ѥ]��A�[�@�h�Y�ѥ]buff�A�p��h�ơA��F�@�w�h�Ƶ�flag
function LuaPG_426655_Click_After()
	local Player = OwnerID()
	AddBuff(Player, 624958, 0, -1)
	local BuffCheck=Lua_BuffPosSearch( Player ,624958)			--�䪱�a���W�P�_BUFF����l
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )	--�T�{BUFF�h��
	if BuffLv>=9	then
		SetFlag(Player, 548406, 1)
		CancelBuff(Player, 624957)
	end
	return 1
end

--�򰭻��ܭ��s�W�������Abuff
function LuaPG_426655_Be_Possessed()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426655)==true		and
	CheckFlag(Player, 548406)==false				then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426655_AN_1]", "LuaPG_426655_Be_Possessed_02", 0 )
	end
end

function LuaPG_426655_Be_Possessed_02()
	local Player = OwnerID()
	 AddBuff(Player, 624957, 0, -1)
	CloseSpeak(Player)
end

--���ȧ�����R��buff
function LuaPG_426655_Complete()
	local Player = TargetID()
	CancelBuff(Player, 624957)
	CancelBuff(Player, 624958)	
end

--�����ȮɧR��buff
function LuaPG_624957_Cancel()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426655)==false		then
		CancelBuff(Player, 624957)	
	end
end

function LuaPG_624958_Cancel()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426655)==false		then
		CancelBuff(Player, 624958)	
	end
end



--=======================================
--426658 �R���]�L
--=======================================
function LuaPG_426658_TalkToGirl()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426658,426735,426740)==true			and
	(CountBodyItem(Player, 243045)>0 and CountBodyItem(Player, 243046)>0)		and
	CheckFlag(Player, 548407)==false							then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426658_AN_1]", "LuaPG_426658_TalkToGirl_02", 0 )
	end
end

function LuaPG_426658_TalkToGirl_02()
	local Player = OwnerID()
	SetSpeakDetail(Player, "[SC_Z28Q426658_1]")
	DelBodyItem(Player, 243045, 1)
	DelBodyItem(Player, 243046, 1)
	SetFlag(Player, 548407, 1)
end

function LuaPG_426658_Retake()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426658,426735,426740)==true			and
	(CountBodyItem(Player, 243045)==0 or CountBodyItem(Player, 243046)==0)	and
	CheckFlag(Player, 548407)==false							then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426658_AN_2]", "LuaPG_426658_Retake_02", 0 )
	end
end

function LuaPG_426658_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 243045, 1)
	GiveBodyItem(Player, 243046, 1)	
end


--=======================================
--426660 ���ꪺ�ǻ�
--=======================================
function LuaPG_426660_Click_After()
	local Player = OwnerID()
	local NPC = TargetID()

	DW_QietKillOne(Player,108206)			 --�R�R�������ǡA�e�̱�����̡A0�N�����a
 	return 1
end


--=======================================
--426661 �򤤤k�����q�n
--=======================================
function LuaPG_426661_TalktoGoddess()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426661,426738,426743)==true	and
	CountBodyItem(Player, 243047)>0	 				and
	CheckFlag(Player, 548408)==false					then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426661_AN_1]", "LuaPG_426661_TalktoGoddess_02(1)", 0)

	elseif DW_CheckQuestAccept("or",Player,426624)==true	and
	CheckFlag(Player, 548404)==false				then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426624_AN_1]", "LuaPG_426624_TalktoGoddess_02(1)", 0)
	end
end

function LuaPG_426661_TalktoGoddess_02(Num)
	local Player = OwnerID()
	if Num==1		then
		DelBodyItem(Player, 243047, 1)
		SetSpeakDetail(Player, "[SC_Z28Q426661_1]")
		SetFlag(Player, 548408, 1)
	elseif Num==2	then
		CloseSpeak(Player)
		GiveBodyItem(Player, 243047, 1)
	end
end


--=======================================
--426662 �s�a�ѤH
--=======================================
--������t��
--=======================================
--CliBuff:624532
--WalkFlag:781337 no.20~21
function LuaPG_426662_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 624532
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426662_Complete_02" , NPC, Player, CliBuff)	----���t��function
	end	
end

function LuaPG_426662_Complete_02(NPC, Player, CliBuff)
	local WalkFlag = 781337
	local New_NPC =  CreateObjByFlag( 123095, WalkFlag, 20, 1)			----�ͦ��t��
	ks_ActSetMode( New_NPC )
	WriteRoleValue( New_NPC , EM_RoleValue_IsWalk , 0 )
	NPCSay(New_NPC, "[SC_Z28Q426662_1]")
	DW_MoveToFlag( New_NPC , WalkFlag, 21, 0, 1)
	Sleep(25)
	DelObj(New_NPC)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=======================================
--426663 �洫�G��
--=======================================
function LuaPG_426663_Exchange()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)

	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426663)==true		then
		if NPCOrgID==123091			and
		CountBodyItem(Player, 243051)>=8		and
		CheckFlag(Player, 548409)==false		then
			AddSpeakOption(Player,NPC, "[SC_Z28Q426663_AN_1]", "LuaPG_426663_Exchange_02(1)", 0)
		elseif NPCOrgID==123092			and
		CountBodyItem(Player, 243048)>=8		and
		CheckFlag(Player, 548410)==false		then
			AddSpeakOption(Player,NPC, "[SC_Z28Q426663_AN_3]", "LuaPG_426663_Exchange_02(3)", 0)
		end
	end
end

function LuaPG_426663_Exchange_02(Num)
	local Player = OwnerID()
	local NPC = TargetID()

	if Num==1		then
		SetSpeakDetail(Player, "[SC_Z28Q426663_1]")
		AddSpeakOption(Player,NPC, "[SC_Z28Q426663_AN_2]", "LuaPG_426663_Exchange_02(2)", 0 )		
	elseif Num==2	then
		SetSpeakDetail(Player, "[SC_Z28Q426663_2]")
		SetFlag(Player, 548409, 1)
		DelBodyItem(Player, 243051, 8)
	elseif Num==3	then
		SetSpeakDetail(Player, "[SC_Z28Q426663_3]")
		SetFlag(Player, 548410, 1)		
		DelBodyItem(Player, 243048, 8)
	end
end

--������t��
--=======================================
--CliBuff:623966
--WalkFlag:781337 no.22~23
function LuaPG_426663_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 623966
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426663_Complete_02" , NPC, Player, CliBuff)	----���t��function
	end	
end

function LuaPG_426663_Complete_02(NPC, Player, CliBuff)
	local WalkFlag = 781337
	local New_NPC =  CreateObjByFlag( 123096, WalkFlag, 22, 1)			----�ͦ��t��
	ks_ActSetMode( New_NPC )
	WriteRoleValue( New_NPC , EM_RoleValue_IsWalk , 0 )
	DW_MoveToFlag( New_NPC , WalkFlag, 23, 0, 1)
	DelObj(New_NPC)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=======================================
--426665 �o��λP�M�_�H
--=======================================
function LuaPG_426665_Click_Before()
	local Player = OwnerID()
	local NPC = TargetID()
	if CountBodyItem(Player, 243052)==0	then
		ScriptMessage( Player, Player, 1, "[SC_Z28Q426665_1]", C_Red )
		ScriptMessage( Player, Player, 0, "[SC_Z28Q426665_1]", C_Red )
		return false
	end
	if CheckFlag(Player, 548411)==true	then
		ScriptMessage( Player, Player, 1, "[SC_Z28Q426665_1]", C_Red )
		ScriptMessage( Player, Player, 0, "[SC_Z28Q426665_1]", C_Red )
		return false
	end
	return true
end

function LuaPG_426665_Click_After()
	local Player = OwnerID()
	DelBodyItem(Player, 243052, 1)
	SetFlag(Player, 548411, 1)
	return 1
end

function LuaPG_426665_Give()
	local Player = OwnerID()
	CloseSpeak(Player)
	DelBodyItem(Player, 243052, 1)
	SetFlag(Player, 548412, 1)
end

function LuaPG_426665_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426665)==true				and
	CountBodyItem(Player, 243052)==0	 					and
	(CheckFlag(Player, 548411)==false or CheckFlag(Player, 548412)==false)	then
		AddSpeakOption(Player,NPC, "[SC_Z28Q426665_AN_1]", "LuaPG_426665_Retake_02", 0)
	end
end

function LuaPG_426665_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	for i=0,1 do
		if CheckFlag(Player, 548411+i)==false	then
			GiveBodyItem(Player, 243052, 1)
		end
	end
	CloseSpeak(Player)
end


--=======================================
--426666 �@�M�s�D�污
--=======================================
function LuaPG_426666_Click_Before()
	local Player = OwnerID()
	local NPC = TargetID()

	if CountBodyItem(Player, 243053)==0	then
		ScriptMessage( Player, Player, 1, "[SC_Z28Q426666_1]", C_Red )
		ScriptMessage( Player, Player, 0, "[SC_Z28Q426665_1]", C_Red )
		return false
	end
	return true
end

function LuaPG_426666_Click_After()
	local Player = OwnerID()
	local NPC = TargetID()
	DelBodyItem(Player, 243053, 1)
	SetFlag(Player, 548413, 1)
	return 1
end

function LuaPG_426666_Retake()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 243053, 1)
end