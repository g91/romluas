--z32��u=======================================
--=====================================
--427104 �����������a
--=====================================
function LuaPG_427104_Click_Before()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,427104)==true	and
	CountBodyItem(Player, 243174)>0			then
		return true
	else
		ScriptMessage(Player,Player,1,"[SC_Z24Q425567_01]", 0 )
		ScriptMessage(Player,Player,0,"[SC_Z24Q425567_01]", 0 )
		return false
	end
end

function LuaPG_427104_Click_After()
	local Player = OwnerID()
	DW_QietKillOne(Player,108935)		--�R�R�������ǡA�e�̱�����̡A0�N�����a
	DelBodyItem(Player, 243174, 1)
	return 1
end

--=====================================
--427105 ���Ѫ��Q�ﶤ
--=====================================
----�֦N���W���d��@��
function LuaPG_427105_FUJI_range_01() 
	SetPlot( OwnerID(),"range","LuaPG_427105_FUJI_range_02",60 )  ----�d��@���}�l
end

function LuaPG_427105_FUJI_range_02()
	local Player = OwnerID()
	if CheckAcceptQuest(Player, 427105)==true	and
	CheckFlag(Player,549242)==false		then
		SetFlag(Player,549242,1)
	end
end


--=====================================
--427105 �@���O�ˡB427112 �k�Ӫ��ѫؿv�v
--=====================================
--===============���U���ȫ᪺��t
--buff�G625706
--WalkFlag:781404  no.70~75
function LuaPG_Subline_Leave_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625706
	local WalkFlag = 781404
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register5)
	if Num == 0	then								--�p�G�Ȧs�Ȭ�0
		local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
		FlagNum = {}
			FlagNum[123662] = {123698, 70, 71}	--427105 �@���O��
			FlagNum[123570] = {123699, 72, 73}	--427112 �k�Ӫ��ѫؿv�v
			FlagNum[123671] = {123709, 74, 75}	--427121 �G���Ϊ����餧�P
		WriteRoleValue(NPC, EM_RoleValue_Register5,999)			
		local WalkFlag = 781404
		AddBuff( Player,CliBuff,0, 10)
		local Man = CreateObjByFlag( FlagNum[NPCOrgID][1], WalkFlag, FlagNum[NPCOrgID][2], 1)	--�ͦ��t��Subcolonel
		ks_ActSetMode( Man)
		WriteRoleValue(Man, EM_RoleValue_IsWalk , 0 )
		DW_MoveToFlag( Man, WalkFlag, FlagNum[NPCOrgID][3], 0, 1)
		DelObj(Man)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register5,0)
	end
end


--=====================================
--427111 �ƭn��A���n�Q
--=====================================
function LuaPG_427111_TakeMono()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	LoadQuestOption(Player)

	if NPCOrgID==123662				and
	DW_CheckQuestAccept("or",Player,427104)==true	and
	CountBodyItem(Player, 243174)==0			then
		AddSpeakOption(Player,NPC, "[SC_Z32Q427104_01]", "LuaPG_427111_TakeMono_02(2)", 0 )
	end
	if DW_CheckQuestAccept("or",Player,427111,427161,427172)==true	and
	CountBodyItem(Player, 243220)<5					then
		AddSpeakOption(Player,NPC, "[SC_Z32Q427111_01]", "LuaPG_427111_TakeMono_02(1)", 0 )	
	end
end

function LuaPG_427111_TakeMono_02(Num)
	local Player = OwnerID()
	local NPC = TargetID()
	local Buff = 625727
	if Num==1		then
		if CheckBuff(NPC, Buff)==false	then	--�P�_���S�����L�F�誺buff
			AddBuff(NPC, Buff, 0,20)
			GiveBodyItem(Player, 243220, 1)
			CloseSpeak(Player)
		else
			SetSpeakDetail(Player, "[SC_Z32Q427111_02]")
		end
	elseif Num==2	then
		CloseSpeak(Player)
		GiveBodyItem(Player, 243174, 10)
	end
end


--=====================================
--427113 �U�I�Ʊ�
--=====================================
function LuaPG_427113_Click_After()
	local Player = OwnerID()
	DW_QietKillOne(Player,108936)		 --�R�R�������ǡA�e�̱�����̡A0�N�����a
	return 1
end


--=====================================
--427115 ���O�X�O
--=====================================
--�I�����ˬd�f�����ȡA�p�G�w�g���H�b�η|������
function LuaPG_427115_Car_Touch()	--Car��Ĳ�I�@��
	local Car = OwnerID()
	SetCursorType( Car , 23)					--�����I�����ϥ�
	SetPlot( Car, "touch", "LuaPG_427115_Car_Touch_02", 45 )
end

function LuaPG_427115_Car_Touch_02()	--Car��Ĳ�I�@��
	local Player = OwnerID()
	local Car = TargetID()
	local Num03 = ReadRoleValue(Car, EM_RoleValue_Register3)			--�ˬd���S���H���h�F��W��
	if DW_CheckQuestAccept("or",Player,427115,427174,427164)==true		and	--�ˬd����		
	Num03==0									then	--�ˬd�O�_���H��
		if  CountBodyItem(Player, 243222)>0					then
			WriteRoleValue(Car, EM_RoleValue_Register3, 1)
			BeginCastBarEvent( Player, Car ,"[SC_Z32Q427115_1]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_427115_Car_03" )		
		else
			ScriptMessage( Player, Player, 1,"[SC_Z32Q427115_2]", 0 )	--���󤣦X
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", 0 )	--���󤣦X
	end
end

function LuaPG_427115_Car_03(Player, CheckStatus)
	local Car = TargetID()
	EndCastBar( Player, CheckStatus)
	WriteRoleValue(Car, EM_RoleValue_Register3, 0)

	if CheckStatus>0	then
		DW_QietKillOne(Player,108998)		 --�R�R�������ǡA�e�̱�����̡A0�N�����a
		DelBodyItem(Player, 243222, 1)
	end
end


--=====================================
--427119 �A�����Ĥl
--=====================================
function LuaPG_427119_Find_the_Kid()	--���b�p�Ĩ��W
	SetPlot( OwnerID(), "range" , "LuaPG_427119_Find_the_Kid_02" , 60 )
end

function LuaPG_427119_Find_the_Kid_02()
	local Player = OwnerID()
	local Kid = TargetID()
	local Num = ReadRoleValue(Kid, EM_RoleValue_Register2)
	if Num==0						and
	CheckFlag(Player, 549122)==false				and
	DW_CheckQuestAccept("or",Player,427119)==true	then		
		CallPlot(Kid,  "LuaPG_427119_Find_the_Kid_03", Player, Kid)
	end
end

function LuaPG_427119_Find_the_Kid_03(Player, Kid)
	local Monster = CreateObjByFlag( 109001, 781404, 76, 1)

	Say(Kid, "[SC_Z32Q427119_1]")
	Sleep(25)
	AddToPartition(Monster, 0)
	WriteRoleValue(Monster, EM_RoleValue_Register2, Kid)	--��p�ļg�b�ǤW
	WriteRoleValue(Kid, EM_RoleValue_Register2, Monster)	--��Ǽg�b�p�ĤW
	SetAttack( Monster,Player )
end

--���`Ĳ�o
function LuaPG_427119_Dead()
	local Monster = OwnerID()
	local PlayerTeam = HateListCount( Monster )
	local Kid = ReadRoleValue( Monster,EM_RoleValue_Register2 )
	local tmpID={}
		for i = 0 , PlayerTeam-1, 1 do
			local ID = HateListInfo( Monster ,i , EM_HateListInfoType_GItemID )
			table.insert(tmpID,ID)
		end
	for i=1,#tmpID do
		if DW_CheckQuestAccept("or",tmpID[i],427119)==true	then
			SetFlag(tmpID[i], 549122, 1)
		end
	end
	WriteRoleValue(Kid, EM_RoleValue_Register2, 0)
end


--=====================================
--427121 �G���Ϊ����餧�P
--=====================================
function LuaPG_427121_Give_Him_Letter()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,427121)==true	and
	CheckFlag(Player, 549114)==false			then
		if (NPCOrgID==123537 or NPCOrgID==123703)	and
		CountBodyItem(Player, 243253)>0			then
			AddSpeakOption(Player,NPC, "[SC_Z32Q427121_1]", "LuaPG_427121_Give_Him_Letter_02(1)", 0 )
		elseif NPCOrgID==123707				and
		CountBodyItem(Player, 243253)==0			then	
			AddSpeakOption(Player,NPC, "[SC_Z32Q427121_4]", "LuaPG_427121_Give_Him_Letter_02(3)", 0 )
		end
	end
end

function LuaPG_427121_Give_Him_Letter_02(Option)
	local Player = OwnerID()
	local NPC = TargetID()
	if Option==1		then	--�P�_���S�����L�F�誺buff
		SetSpeakDetail(Player, "[SC_Z32Q427121_3]")
		DelBodyItem(Player, 243253, 1)
		AddSpeakOption(Player,NPC, "[SC_Z32Q427121_2]", "LuaPG_427121_Give_Him_Letter_02(2)", 0 )
	elseif Option==2	then
		GiveBodyItem(Player, 243263, 1)
		SetFlag(Player, 549114, 1)
		CloseSpeak(Player)
	elseif Option==3	then
		SetSpeakDetail(Player, "[SC_Z32Q427121_5]")
		GiveBodyItem(Player, 243253, 1)
	end
end

function LuaPG_427121_Delete_Flag()
	local Player = OwnerID()
	SetFlag(Player, 549114, 0)
end


--=====================================
--427116 �W�īe�o���K�K
--=====================================
--�I�����ˬd�˱w���ȡA�p�G�w�g���H�b�η|������
function LuaPG_427116_Clean()	--NPC��Ĳ�I�@��
	local NPC = OwnerID()
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	SetCursorType( NPC , 23)						--�����I�����ϥ�
	SetPlot( NPC, "touch", "LuaPG_427116_Clean_02", 30 )
end

function LuaPG_427116_Clean_02()	--NPC��Ĳ�I�@��
	local Player = OwnerID()
	local NPC = TargetID()
	local Num03 = ReadRoleValue(NPC, EM_RoleValue_Register3)		--�ˬd���S���H������
	if DW_CheckQuestAccept("or",Player,427116,427165)==true		and	--�ˬd����
	Num03==0								then	--�ˬd�O�_���H��
		WriteRoleValue(NPC, EM_RoleValue_Register3, 1)
		BeginCastBarEvent( Player, NPC ,"[SC_Z32Q427116_1]", 60, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_427116_Clean_03" )		
	else
		ScriptMessage( Player, Player, 1,"[SC_Z32Q427116_3]", 0 )	--���󤣦X
	end
end

function LuaPG_427116_Clean_03(Player, CheckStatus)
	local NPC = TargetID()
	EndCastBar( Player, CheckStatus)

	if CheckStatus>0	then
		DW_QietKillOne(Player,109000)		 --�R�R�������ǡA�e�̱�����̡A0�N�����a
		NPCSAY(NPC, "[SC_Z32Q427116_2]")
		CallPlot(NPC, "LuaPG_427116_Clean_04", NPC )
	end
end

function LuaPG_427116_Clean_04(NPC)
	Sleep(150)
	WriteRoleValue(NPC, EM_RoleValue_Register3, 0)
end
