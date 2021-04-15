--z26�D�u=======================================
--=======================================
--425680 ������ίu��
--=======================================
function LuaPG_425680_Tell_the_Truth()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,425680)==true	and
	CheckFlag(Player, 548182)==false			then
		AddSpeakOption(Player,NPC, "[SC_Z26Q425680_01]", "LuaPG_425680_Tell_the_Truth_02", 0 )
	end
end

function LuaPG_425680_Tell_the_Truth_02()
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak(Player)
	SetFlag(Player, 548182, 1)
end

--������t��
--=======================================
--CliBuff:624532
--WalkFlag:781320 no.1~2
function LuaPG_425680_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 624532
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)										
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_425680_Complete_02" , NPC, Player, CliBuff)	----���t��function						
	end	
end

function LuaPG_425680_Complete_02(NPC, Player, CliBuff)
	local WalkFlag = 781320
	local New_NPC =  CreateObjByFlag( 122649, WalkFlag, 1, 1)			----�ͦ��t��
	ks_ActSetMode( New_NPC )
	WriteRoleValue( New_NPC , EM_RoleValue_IsWalk , 0 )
	Yell(New_NPC, "[SC_Z26Q425680_02]", 2)
	Sleep(25)
	Yell(New_NPC, "[SC_Z26Q425680_03]", 2)
	DW_MoveToFlag( New_NPC , WalkFlag, 2, 0, 1)
	DelObj(New_NPC)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=======================================
--426272 �ε��@��
--=======================================
function LuaPG_426272_Ask()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local SayWhat = {}
	SayWhat[122632] =  {"[SC_Z24Q426272_02]",548204}		--�u�ä��v�ū�ӡD���
	SayWhat[122633] =  {"[SC_Z24Q426272_01]",548203}		--�e���R
	SayWhat[122634] =  {"[SC_Z24Q426272_03]",548205}		--�Ǵ��D���J����
	SayWhat[122635] =  {"[SC_Z24Q426272_05]",548207}		--��Z�g�D�N���S
	SayWhat[122636] =  {"[SC_Z24Q426272_04]",548206}		--�º��D���_��

	if DW_CheckQuestAccept("or",Player,426272)==true	then
		SetSpeakDetail(Player, SayWhat[NPCOrgID][1])
		SetFlag(Player, SayWhat[NPCOrgID][2], 1)
	else
	 	LoadQuestOption(Player)
	end
end


--=======================================
--425681 ���A�k��
--=======================================
function LuaPG_425681_TalktoMorick()
	local Player = OwnerID()
	local NPC = TargetID()
	if DW_CheckQuestAccept("or",Player,425681)==true	and
	CountBodyItem(Player, 242780)==0			then
		SetSpeakDetail(Player, "[SC_Z26Q425681_01]")
		AddSpeakOption(Player,NPC, "[SC_Z24Q425545_02]", "LuaPG_425681_TalktoMorick_02", 0 )
	else
	 	LoadQuestOption(Player)
	end
end

function LuaPG_425681_TalktoMorick_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	AddBuff(Player, 624533, 1, -1)
	SetFlag(Player, 548183, 1)
end

function LuaPG_425681_Click_After()
	SetFlag(OwnerID(), 548184, 1)
	return 1
end

function LuaPG_242780_Delete()
	SetFlag(OwnerID(), 548184, 0)
end

function LuaPG_425681_Delete()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,425681)==false	then
		CancelBuff(Player, 624533)
	end
end

--���y������
--WalkFlag:781320 no.5
function LuaPG_425681_Lead()
	local Player = OwnerID()
	if	DW_CheckMap(Player,643)==true		or		--�«������
		DW_CheckMap(Player,640)==true		then		--�m��
		local tips = Lua_DW_CreateObj("obj" , 112399, Player,0)
		Lua_ObjDontTouch(tips)
		SetModeEx( tips , EM_SetModeType_Gravity , false ) 
		AddToPartition(tips,0)
		AddBuff(tips,502924,1,-1)
		if CheckAcceptQuest( Player,425681) == true	then
			BeginPlot(tips,"LuaPG_425681_Lead_2",0)
			BeginPlot(tips,"LuaPG_425681_Lead_3",0)
		else
			ScriptMessage( Player,Player,3,"[SC_Z25Q425826_7]",0)
		end
--		return true
	else
		ScriptMessage( Player,Player, 1, "[SC_DAN_111700_37]", 0 ) 	--�A�L�k�b���ϰ�ϥθӪ��~
--		return false
	end
end
function LuaPG_425681_Lead_2()
	local Player = OwnerID()	
	local flag = 781320
	local FlagX = GetMoveFlagValue( flag , 5 , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( flag , 5 , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( flag , 5 , EM_RoleValue_Z )
	MoveDirect( Player, FlagX , FlagY , FlagZ )
	sleep(15)
	if	ReadRoleValue(Player,EM_RoleValue_X)/10 == FlagX/10		and
		ReadRoleValue(Player,EM_RoleValue_Z)/10 == FlagZ/10		then
		ScriptMessage( Player, Player, 1, "[SC_420931_2]", 0 ) 		--�l�ܾ����V�o�̡K�K
		ScriptMessage(  Player, Player, 0, "[SC_420931_2]", 0 )		 --�l�ܾ����V�o�̡K�K
	end
end

function LuaPG_425681_Lead_3()
	sleep(20)
	DelObj(OwnerID())	
end

--���U��t��
--=======================================
--CliBuff:623966
--WalkFlag:781320 no.3~4
function LuaPG_425681_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 623966
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)										
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_425681_Accept_02" , NPC, Player, CliBuff)	----���t��function						
	end	
end

function LuaPG_425681_Accept_02(NPC, Player, CliBuff)
	local WalkFlag = 781320
	local New_NPC =  CreateObjByFlag( 122719, WalkFlag, 3, 1)			----�ͦ��t��
	ks_ActSetMode( New_NPC )
	WriteRoleValue( New_NPC , EM_RoleValue_IsWalk , 0 )
	Sleep(10)
	DW_MoveToFlag( New_NPC , WalkFlag, 4, 0, 1)  
	DelObj(New_NPC)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end

--=======================================
--426270 �����F�A�Ԥh��
--=======================================
function LuaPG_426270_Trans()
	local Player = OwnerID()
	local NPC = TargetID()
	if DW_CheckQuestAccept("or",Player,426270)==true	then
		SetSpeakDetail(Player, "[SC_Z24Q426270_01]")
		AddSpeakOption(Player,NPC, "[SC_Z24Q426270_02]", "LuaPG_426270_Trans_02", 0 )
	else
	 	LoadQuestOption(Player)
	end
end

function LuaPG_426270_Trans_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	SetFlag(Player, 548209, 1)
	ChangeZone( Player , 22 , 0 , -15751.1 , 873.0 , -24305.2 , 215 )
end


--=======================================
--426267 �ֿn�P���h����k
--=======================================
function LuaPG_426267_Click_After()
	local Player = OwnerID()
	local NPCOrgID = ReadRoleValue(TargetID(), EM_RoleValue_OrgID)
	local PointFlag = {}
	PointFlag[122659] = 548210
	PointFlag[122660] = 548211
	PointFlag[122661] = 548212
	PointFlag[122662] = 548213
	DelBodyItem(Player, 242781, 1)
	SetFlag(Player, PointFlag[NPCOrgID], 1)
--	Say(Player,PointFlag[NPCOrgID])
	DW_QietKillOne(0,107847)			--�R�R�������ǡA�e�̱�����̡A0�N�����a
	return 1
end

function LuaPG_426267_Click_Before()
	local Player = OwnerID()
	if CountBodyItem(Player, 242781)>0	then
		return true
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", 0 )	
		return false
	end
end

function LuaPG_242781_Delete()
	local Player = OwnerID()
	for i=0,3 do
		SetFlag(Player, 548210+i, 0)
	end
end

function LuaPG_426267_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426267)==true	and
	CountBodyItem(Player, 242781)==0			and
	(CheckFlag(Player, 548210)==false	or
	CheckFlag(Player, 548211)==false	or
	CheckFlag(Player, 548212)==false	or
	CheckFlag(Player, 548213)==false	)		then
		AddSpeakOption(Player,NPC, "[SC_Z26Q426267_01]", "LuaPG_426267_Retake_02", 0 )
	end
end

function LuaPG_426267_Retake_02()
	CloseSpeak(OwnerID())
	GiveBodyItem(OwnerID(), 242781, 4)
end

--������t��
--=======================================
--CliBuff:624532
--WalkFlag:781320 no.6~7
function LuaPG_426267_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 624532
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)										
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426267_Complete_02" , NPC, Player, CliBuff)	----���t��function						
	end	
end

function LuaPG_426267_Complete_02(NPC, Player, CliBuff)
	local WalkFlag = 781320
	local New_NPC =  CreateObjByFlag( 122663, WalkFlag, 6, 1)			----�ͦ��t��
	ks_ActSetMode( New_NPC )
	Sleep(10)
	DW_MoveToFlag( New_NPC , WalkFlag, 7, 0, 1) 
	DelObj(New_NPC)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=======================================
--426271 �ڦV���Ӫ��}�B
--=======================================
function LuaPG_426271_Ending()	--�����r��
	local Player = TargetID()
	ScriptMessage( Player, Player, 1,"[SC_Z26Q426271_1]", "0xffffff80" )
	Sleep(25)
	ScriptMessage( Player, Player, 1,"[SC_Z26Q426271_2]", "0xffffff80" )
end


--=======================================
--426269 �Q��}�l
--=======================================
--���U��t��
--=======================================
--CliBuff:623966
--WalkFlag:781320 no.8~9
function LuaPG_426269_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 623966
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)										
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426269_Accept_02" , NPC, Player, CliBuff)	----���t��function						
	end	
end

function LuaPG_426269_Accept_02(NPC, Player, CliBuff)
	local WalkFlag = 781320
	local New_NPC =  CreateObjByFlag( 122724, WalkFlag, 8, 1)			----�ͦ��t��
	ks_ActSetMode( New_NPC )
	Sleep(10)
	DW_MoveToFlag( New_NPC , WalkFlag, 9, 0, 1)  
	DelObj(New_NPC)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end