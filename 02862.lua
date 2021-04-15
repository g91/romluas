--z25_01 �D�u=======================================
--=======================================
--426082 �c����
---------------------------------------------------------------------------
function LuaPG_426082_Dream()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426082)==true	and
	CheckFlag(Player, 547572)==false			then
		AddSpeakOption(Player,NPC, "[SC_Z25Q426082_1]", "LuaPG_426082_Dream_02(1)", 0 )
	end
end

function LuaPG_426082_Dream_02(Option)
	local Player = OwnerID()
	local NPC = TargetID()	
	if Option==1		then
		SetSpeakDetail(Player, "[SC_Z25Q426082_2]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426082_3]", "LuaPG_426082_Dream_02(2)", 0 )
	elseif Option==2	then
		SetSpeakDetail(Player, "[SC_Z25Q426082_4]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426082_5]", "LuaPG_426082_Dream_02(3)", 0 )
	elseif Option==3	then
		SetSpeakDetail(Player, "[SC_Z25Q426082_6]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426082_7]", "LuaPG_426082_Dream_02(4)", 0 )
	elseif Option==4	then
		CloseSpeak(Player)
		SetFlag(Player, 547572, 1)		
	end
end


--=======================================
--426084 �·t���x��
---------------------------------------------------------------------------
function LuaPG_426084_Dragon()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426084)==true	and
	CheckFlag(Player, 547699)==false			then
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_1]", "LuaPG_426084_Dragon_02(1)", 0 )
	end
end

function LuaPG_426084_Dragon_02(Option)
	local Player = OwnerID()
	local NPC = TargetID()	
	if Option==1		then
		SetSpeakDetail(Player, "[SC_Z25Q426084_2]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_3]", "LuaPG_426084_Dragon_02(2)", 0 )	--�Чi�D������u�c�ڡv������
	elseif Option==2	then
		SetSpeakDetail(Player, "[SC_Z25Q426084_4]")						--�ڥ�ť���U�A�o�{�̪񪺽T......
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_5]", "LuaPG_426084_Dragon_02(3)", 0 )	--�A��軡���u�_�Ǫ��ơv�H
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_6]", "LuaPG_426084_Dragon_02(4)", 0 )	--���ݹL�u�c�ڡv�����e�ܡH
	elseif Option==3	then
		SetSpeakDetail(Player, "[SC_Z25Q426084_7]")						--���L�u�c�ڡv���ڤH�����ο�����񦳳Q�}�a������
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_6]", "LuaPG_426084_Dragon_02(4)", 0 )	
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_8]", "LuaPG_426084_Dragon_02(5)", 0 )	--�����M���F
	elseif Option==4	then
		SetSpeakDetail(Player, "[SC_Z25Q426084_9]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_5]", "LuaPG_426084_Dragon_02(3)", 0 )
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_8]", "LuaPG_426084_Dragon_02(5)", 0 )		
	elseif Option==5	then
		SetSpeakDetail(Player, "[SC_Z25Q426084_10]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_12]", "LuaPG_426084_Dragon_02(6)", 0 )	--�����S�����D
		AddSpeakOption(Player,NPC, "[SC_Z25Q426084_11]", "LuaPG_426084_Dragon_02(2)", 0 )	--�A�T�{�@��
	elseif Option==6	then
		CloseSpeak(Player)
		SetFlag(Player, 547699, 1)
	end
end


--=======================================
--426094 �����k�l
---------------------------------------------------------------------------
function LuaPG_426094_Girl()
	local Player = OwnerID()
	local NPC = TargetID()
	if DW_CheckQuestAccept("or",Player,426094)==true	and
	CheckFlag(Player, 547700)==false			then
		SetSpeakDetail(Player, "[SC_Z25Q426094_1]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426094_2]", "LuaPG_426094_Girl_02", 0 )

	elseif DW_CheckQuestAccept("or",Player,426095)==true	and		--426095 �e�R�v�H
	CheckFlag(Player, 547701)==false			then
		SetSpeakDetail(Player, "[SC_Z25Q426095_0]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_1]", "LuaPG_426095_Who_are_You(1)", 0 )

	elseif DW_CheckQuestAccept("or",Player,426097)==true	and		--426097 �`���̪�����
	CountBodyItem(Player, 242354)==0			then
		SetSpeakDetail(Player, "[SC_Z25Q426097_0]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426097_1]", "LuaPG_426097_Divine(1)", 0 )
		AddSpeakOption(Player,NPC, "[SC_Z25Q426097_2]", "LuaPG_426097_Divine(2)", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_426094_Girl_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local Buff = 624043
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	CloseSpeak(Player)
	SetFlag(Player, 547700, 1)
	if Num == 0	then							----�p�G�Ȧs�Ȭ�0
		DebugMsg(0,0,"BEGIN")
		WriteRoleValue(NPC, EM_RoleValue_Register1, 1)
		AddBuff( Player,Buff,0, 20)					--CLIENT��buff
		CallPlot(NPC, "LuaPG_426094_Morick_Come" , NPC, Player,Buff)	----���t��function	
	end								
end

---------------------------------------------------------------------------
--�i���t��
---------------------------------------------------------------------------
--Flag:781272  NO.1~2
--Actor:122034 ����J�D��L�S
--BUFF:624043
function LuaPG_426094_Morick_Come(NPC, Player,Buff)
	DebugMsg(0,0,"OKOK")
	local WalkFlag = 781272
	local Come_Morick = CreateObjByFlag( 122034, WalkFlag, 1, 1)
	ks_ActSetMode( Come_Morick )
	AddToPartition(Come_Morick,0)
	DW_MoveToFlag( Come_Morick , WalkFlag, 2, 0, 1)
	CancelBuff(Player,Buff)
	DelObj(Come_Morick)
	WriteRoleValue(NPC, EM_RoleValue_Register1, 0)
end


--=======================================
--426095 �e�R�v�H
---------------------------------------------------------------------------
function LuaPG_426095_Who_are_You(Option)
	local Player = OwnerID()
	local NPC = TargetID()
	if Option==1	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_1]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_2]", "LuaPG_426095_Who_are_You(3)", 0 )	--�ڥs[$playername]
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_3]", "LuaPG_426095_Who_are_You(2)", 0 )	--�ڥs......
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_4]", "LuaPG_426095_Who_are_You(2)", 0 )	--���ݭn�i�D�p�ڪ��W�r
	elseif Option==2	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_2]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_5]", "LuaPG_426095_Who_are_You(5)", 0 )	--�A�ӳo�̦�����ت��H
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_6]", "LuaPG_426095_Who_are_You(4)", 0 )	--�A�O����H�H		
	elseif Option==3	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_3]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_5]", "LuaPG_426095_Who_are_You(8)", 0 )
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_6]", "LuaPG_426095_Who_are_You(9)", 0 )
	elseif Option==4	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_4]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_5]", "LuaPG_426095_Who_are_You(5)", 0 )
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_7]", "LuaPG_426095_Who_are_You(6)", 0 )	--�ݱo�t���h�F�C
	elseif Option==5	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_5]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_8]", "LuaPG_426095_Who_are_You(7)", 0 )	--�n���ܥi�áC
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_7]", "LuaPG_426095_Who_are_You(6)", 0 )
	elseif Option==6	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_6]")
	elseif Option==7	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_7]")
	elseif Option==8	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_8]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_8]", "LuaPG_426095_Who_are_You(7)", 0 )
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_7]", "LuaPG_426095_Who_are_You(6)", 0 )
	elseif Option==9	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_4]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_5]", "LuaPG_426095_Who_are_You(11)", 0 )
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_9]", "LuaPG_426095_Who_are_You(10)", 0 )	--�A�O�ү��箦���Ӫ��a�H
	elseif Option==10	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_9]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_8]", "LuaPG_426095_Who_are_You(7)", 0 )
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_7]", "LuaPG_426095_Who_are_You(6)", 0 )
	elseif Option==11	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_10]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_10]", "LuaPG_426095_Who_are_You(12)", 0 )
	elseif Option==12	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_11]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426095_11]", "LuaPG_426095_Who_are_You(13)", 0 )
	elseif Option==13	then
		SetSpeakDetail(Player, "[SC_Z25Q426095_AN_12]")
		SetFlag(Player, 547701, 1)	
	end		
end


--=======================================
--426097 �`���̪�����
---------------------------------------------------------------------------
function LuaPG_426097_Divine (Option)
	local Player = OwnerID()
	local NPC = TargetID()
	if Option==1	then
		SetSpeakDetail(Player, "[SC_Z25Q426097_AN_1]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426097_2]", "LuaPG_426097_Divine(2)", 0 )		--����J���e�R���G�C
	elseif Option==2	then
		SetSpeakDetail(Player, "[SC_Z25Q426097_AN_2]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426097_3]", "LuaPG_426097_Divine(3)", 0 )		--�~�򻡤U�h�I
	elseif Option==3	then
		SetSpeakDetail(Player, "[SC_Z25Q426097_AN_3]")
		AddSpeakOption(Player,NPC, "[SC_Z25Q426097_1]", "LuaPG_426097_Divine(1)", 0 )		--�ڪ��e�R���G
		AddSpeakOption(Player,NPC, "[SC_Z25Q426097_4]", "LuaPG_426097_Divine(4)", 0 )		--�o�˴N���F
	elseif Option==4	then
		CloseSpeak(Player)
		GiveBodyItem(Player, 242354, 1)
		local Num = ReadRoleValue(NPC, EM_RoleValue_Register1)
		if Num==0	then
			CallPlot(NPC, "LuaPG_426097_Leave" , NPC, Player)
		end
	end	
end

--�h���t��
-----------------------------------------
--Actor:122032 �����k�l
--BUFF:623998
--����ΡG781272 no.40
function LuaPG_426097_Leave(NPC, Player)
	WriteRoleValue(NPC, EM_RoleValue_Register1, 1)
	local Buff = 623998
	AddBuff( Player,Buff,0, 10)
	local WalkFlag = 781272
	local Leave_Girl = DW_CreateObjEX("obj", 122032, NPC)
	ks_ActSetMode( Leave_Girl )
	AddToPartition(Leave_Girl,0)
	DW_MoveToFlag( Leave_Girl , WalkFlag, 40, 0, 1)
	DelObj(Leave_Girl)
	CancelBuff(Player,Buff)
	WriteRoleValue(NPC, EM_RoleValue_Register1, 0)
end


--=======================================
--426128 �s�ڤ���
---------------------------------------------------------------------------
--�����᪺�t��
-----------------------------------------
--Actor:122071 �d�Ժ��D�d�ĩi
--BUFF:624047
function LuaPG_426128_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	Tell(Player ,NPC , "[SC_Z25Q426128_3]")
	Sleep(10)
	Tell(Player ,NPC , "[SC_Z25Q426128_4]")
	ScriptMessage( Player, Player, 1,"[SC_Z25Q426128_1]", 0 )
	Sleep(25)
	ScriptMessage( Player, Player, 1,"[SC_Z25Q426128_2]", 0 )
end


--=======================================
--426126 �s�P����
---------------------------------------------------------------------------
function LuaPG_426126_Range()		--�d��@�����X��
	SetPlot( OwnerID(),"range","LuaPG_426126_Range_02",60 )
end

function LuaPG_426126_Range_02()
	local Player = OwnerID()
	if CheckAcceptQuest(Player,426126)==true	and   
	CheckFlag(Player, 547724)==false	  	 then
		SetFlag(Player,547724,1)
	end
end

--���U�᪺�t��
-----------------------------------------
--Flag:781272  NO.3
--Actor:122072 �N��D��J��
--BUFF:624157
function LuaPG_426126_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 624157
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	Tell(Player ,NPC ,"[SC_Z25Q426126_1]")	
	if Num == 0	then										----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)										
		AddBuff( Player,CliBuff,0, 15)
		CallPlot(NPC, "LuaPG_426126_Accept_02" , NPC, Player, CliBuff)				----���t��function						
	end	
end

function LuaPG_426126_Accept_02(NPC, Player, CliBuff)
	local New_NPC =  DW_CreateObjEX("obj", 122072, NPC)	----�ͦ��t��
	local WalkFlag = 781272
	ks_ActSetMode( New_NPC )
	Sleep(10)
	DW_MoveToFlag( New_NPC , WalkFlag, 3, 0, 1)
	DelObj(New_NPC)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end

function LuaPG_426126_Delete()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player, 426126) == false	then
		CancelBuff(Player, 624157)
	end
end


--=======================================
--426103 ��쯫���k�l
---------------------------------------------------------------------------
function LuaPG_426103_Puniro()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426103)==true	and
	CheckFlag(Player, 547189)==false			then
		AddSpeakOption(Player,NPC, "[SC_Z25Q426103_1]", "LuaPG_426103_Puniro_02", 0 )
	end
end

function LuaPG_426103_Puniro_02()
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak(Player)
	Tell(Player ,NPC,"[SC_Z25Q426103_2]")				----�缾�a��������
	SetFlag(Player, 547189, 1)
end


--=======================================
--426106 �d�g�P�H��
---------------------------------------------------------------------------
function LuaPG_426106_Up()		--�Ǩ�s�W
	SetPlot( OwnerID() , "range" , "LuaPG_426106_Up_02" , 80 )
end

function LuaPG_426106_Up_02()
	ChangeZone( OwnerID() , 25 , 0 , -6321 , 1600 , -2591 , 70 )
end


--=======================================
--426102 ����J�P�N��
---------------------------------------------------------------------------
function LuaPG_426102_Jill_Buff()
	AddBuff(OwnerID(),624175,0, -1)
end

function LuaPG_Jill_NoGravity()
	SetModeEx(OwnerID(), EM_SetModeType_Gravity, false);
end


--=======================================
--426123 �ү��箦���ܽШ�
---------------------------------------------------------------------------
function LuaPG_426123_Up()		--�Ǩ�ؿv�����W
	SetPlot( OwnerID() , "range" , "LuaPG_426123_Up_02" , 60 )
end

function LuaPG_426123_Up_02()
	if CheckAcceptQuest( OwnerID(),426286 ) or
	CheckCompleteQuest( OwnerID(),426286 ) then
		ChangeZone( OwnerID() , 25 , 0 , -12083.8 , 1937 , -5205 , 150 )	
	else
		ChangeZone( OwnerID() , 25 , 0 , -12128.6 , 2031.5 , -5253.9 , 254 )
	end
end

function LuaPG_426123_Down()		--�Ǩ쩳�U
	SetPlot( OwnerID() , "range" , "LuaPG_426123_Down_02" , 50 )
end

function LuaPG_426123_Down_02()
	ChangeZone( OwnerID() , 25 , 0 , -12165.5 , 1728.6 , -5802.3 , 235 )
end

--=======================================
--426125 ��������
---------------------------------------------------------------------------
function LuaPG_426125_Check_Quest()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426125)==false	then
		CancelBuff(Player,624170)
		if CheckFlag(Player,547723)==true		then
			SetFlag(Player, 547723, 0)
		end
	end
end