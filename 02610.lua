--z23�D�u�B�ƥ�=======================================
--=======================================
--425233  �ƱڻP����
---------------------------------------------------------------------------
--FLAG:546244
function LuaPG_425233_Lyth_01()
	local Player = OwnerID()
	local NPC = TargetID()	

	if CheckAcceptQuest(Player, 425233)==true	and
	CheckFlag(Player, 546244)==false		then
		SetSpeakDetail(Player, "[SC_425233_01]")
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_01]", "LuaPG_425233_Lyth_02(2)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_02]", "LuaPG_425233_Lyth_02(4)", 0)
	else
		LoadQuestOption(Player)	
	end
	LuaPG_425234_Ask()
end

function LuaPG_425233_Lyth_02(Option)
	local Player = OwnerID()
	local NPC = TargetID()	

	if Option==2		then		--�ݮw�ǩ_��
		SetSpeakDetail(Player, "[SC_425233_02]")
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_02]", "LuaPG_425233_Lyth_02(4)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_03]", "LuaPG_425233_Lyth_02(3)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_04]", "LuaPG_425233_Lyth_02(1)", 0)

	elseif Option==3	then		--�ݥj�ѵ���
		SetSpeakDetail(Player, "[SC_425233_03]")
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_01]", "LuaPG_425233_Lyth_02(2)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_02]", "LuaPG_425233_Lyth_02(4)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_04]", "LuaPG_425233_Lyth_02(1)", 0)
				
	elseif Option==4	then		--���s��
		SetSpeakDetail(Player, "[SC_425233_04]")
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_01]", "LuaPG_425233_Lyth_02(2)", 0)
		AddSpeakOption(Player, NPC, "[SC_425233_OPTION_04]", "LuaPG_425233_Lyth_02(1)", 0)

	elseif Option==1	then
		CloseSpeak(Player)
		SetFlag(Player, 546244, 1)
	end
end




--=======================================
--425234  �ͦ����ɪ��Ԩ�
---------------------------------------------------------------------------
function LuaPG_425234_Give()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if CheckAcceptQuest(Player, 425234)==true	and
	CountBodyItem(Player, 241326)==1		and
	CheckFlag(Player, 546496)==false		then
		AddSpeakOption(Player, NPC, "[SC_425234_01]", "LuaPG_425234_Give_02", 0)
	end
end

function LuaPG_425234_Give_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	DelBodyItem(Player, 241326, 1)
	SetFlag(Player, 546496, 1)
end

function LuaPG_425234_Ask()
	local Player = OwnerID()
	local NPC = TargetID()

	if CheckAcceptQuest(Player, 425234)==true	and
	CountBodyItem(Player, 241326)==0		and
	CheckFlag(Player, 546496)==false		then
		AddSpeakOption(Player, NPC, "[SC_425234_02]", "LuaPG_425234_Ask_02", 0)
	else
		LoadQuestOption(Player)
	end	
end

function LuaPG_425234_Ask_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 241326, 1)
end


--=======================================
--424941  �������w�ǩ_�Ʊ�
---------------------------------------------------------------------------
function LuaPG_EnhanceSpeed_01()		--�����lĲ�I�@��
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","LuaPG_EnhanceSpeed_02",30 )
end

function LuaPG_EnhanceSpeed_02()		--�U�اP�_
	local Player = OwnerID()
	local Machine = TargetID()
	local Num01=ReadRoleValue(Machine, EM_RoleValue_Register1)

	DW_CancelTypeBuff(68,Player)

	if DW_CheckQuestAccept("or",Player,424941,425255,425487,425501)==true	and		----�P�_���ȱ���
	CheckFlag(Player, 546283)==false				and		----�P�_FLAG
	CountBodyItem(Player, 241269)>=10				then		----�P�_���W�����~
		if Num01 == 0						then		----�P�_���S���H�ϥ�
			if  BeginCastBarEvent( Player, Machine ,"[SC_FLOWER]", 50, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_EnhanceSpeed_03" ) ~= 1 then
										----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player, Player, 1,"[SC_424609_USE_01]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_424609_USE_01]", "0xffbf0b2b" )
			end
		end
	else
		ScriptMessage( Player, Player, 0,"[SYS_GAMEMSGEVENT_422]", "0xffbf0b2b" )
	end
end

function LuaPG_EnhanceSpeed_03(Player, CheckStatus)
	local Player = OwnerID()
	local Machine = TargetID()
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			EndCastBar( Player , CheckStatus ) 				--�M���I�k��
			CallPlot(Machine, "LuaPG_EnhanceSpeed_04", Machine,Player)	--Ĳ�o�@��
		else --����
			EndCastBar( Player , CheckStatus ) 				--�M���I�k��
		end
	end
end

function LuaPG_EnhanceSpeed_04(Machine,Player)
	WriteRoleValue(Machine , EM_RoleValue_Register1, 999)	
	Sleep(10)
	DelBodyItem(Player, 241269, 10)
	AddBuff(Machine, 622307, 1, 3)
	SetFlag(Player, 546283, 1)
	WriteRoleValue(Machine , EM_RoleValue_Register1, 0)	
end




--=======================================
--424940  �u�����H��
---------------------------------------------------------------------------
--�t���G�Où120706�B�p�o�oA 120707�B�p�o�oB 120708
--�����a������BUFF�G622310
--����G781117	no.3��10
function LuaPG_424940_Show()
	local Player = OwnerID()
	local Fillo = TargetID()

	local Num = ReadRoleValue(Fillo, EM_RoleValue_Register1)

	if CheckAcceptQuest( Player, 424940) == true		 and
	 CheckFlag(Player,546300)==false			and
	CountBodyItem(Player, 241274)==0			then
		if Num > 0					then		----�ˬd���a�O�_������ �åB�{�b�O�_���b�t��		
			SetSpeakDetail(Player, "[SC_424940_03]")			----(���b�t�����p�U �����i��)
		elseif Num == 0				then		----�p�G�Ȧs�Ȭ�0
			SetSpeakDetail(Player, "[SC_424940_01]")
			AddSpeakOption(Player, Fillo,"[SC_424940_02]","LuaPG_424940_Show_02",0)
		end
	elseif CheckAcceptQuest( Player, 424940) == true		and		----����
	 CheckFlag(Player,546300)==true			and
	CountBodyItem(Player, 241274)==0			then
		if Num > 0					then		
			SetSpeakDetail(Player, "[SC_424940_03]")
		elseif Num == 0				then
			AddSpeakOption(Player, Fillo,"[SC_424940_15]","LuaPG_424940_Show_04",0)
		end											
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424940_Show_04()
	local Player = OwnerID()
	local Fillo = TargetID()

	GiveBodyItem(Player, 241274, 1)
	SetSpeakDetail(Player, "[SC_424940_16]")
end

function LuaPG_424940_Show_02()
	local Player = OwnerID()
	local Fillo = TargetID()
	CloseSpeak( Player )						----������ܵ���
	
	WriteRoleValue( Fillo, EM_RoleValue_Register1, 999 )		----�W�� ��ܥ��b�t��	
	BeginPlot( Fillo, "LuaPG_424940_Show_03", 0 )			----���t��function
end

function LuaPG_424940_Show_03()
	local Fillo = OwnerID()						--���bNPC���W���t���@��
	local QuestID = 424940						--���Ƚs��
	local FinishFlagID = 546300					--����������o���X��
	local CheckBuffID = 622310					--�ˬd�O�_���b�t����BUFF
	local CheckRange = 120						--�t�����ˬd�d��
	local ActorArray = {}						--(�s���ק�)�t���}�C��
	
	local FlagID = 781117						--�X��ID
	-- �ƥ���Ҧ��|�Ψ쪺�t�����ͥX�� �i�H��AddToPartition(�u�ݭnGUID)
	ActorArray[1] = CreateObjByFlag( 120706, FlagID, 3, 1 ) 	--�Où
	ActorArray[2] = CreateObjByFlag( 120707, FlagID, 4, 1 ) 	--�p�o�oA
	ActorArray[3] = CreateObjByFlag( 120707, FlagID, 5, 1 ) 	--�p�o�oB

	CallPlot( Fillo, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--�d������Ϊ��ˬd�禡

	AddToPartition( ActorArray[1], 0 )				--�Oùin
	ks_ActSetMode( ActorArray[1] )
	sleep(5)

	local PlayerList = SearchRangePlayer( Fillo, CheckRange )
	local Num01 = table.getn(PlayerList)

	--�t����
	Yell(ActorArray[1],"[SC_424940_14]",1)
	Sleep(25)
	for i = 0,Num01 do
		if CheckAcceptQuest( PlayerList[i], 424940) == true		 and
		 CheckFlag(PlayerList[i],546300)==false				then
			SetPosByFlag( PlayerList[i], FlagID, 10) 			--�N����ǰe�ܺX�Ц�m
	--		Say(PlayerList[i],"MIAU")
		end
	end
	Sleep(5)
	CastSpell(ActorArray[1], PlayerList[0], 850160)--���Ĥ�BUFF�A�ª�t��

	for i = 1,Num01 do
		if CheckAcceptQuest( PlayerList[i], 424940) == true		 and
		 CheckFlag(PlayerList[i],546300)==false				then
			AddBuff(PlayerList[i], 622645, 0, 5)
		end
	end

	ScriptMessage( TargetID(), TargetID(), 1,"[SC_424940_04]", "0xffbf0b2b" )
	ScriptMessage( TargetID(), TargetID(), 0,"[SC_424940_04]", "0xffbf0b2b" )		
	Sleep(25)
	
	for i=2,3 do							--�p�o�oin
		AddToPartition( ActorArray[i], 0 )
		ks_ActSetMode( ActorArray[i] )		
		WriteRoleValue(ActorArray[i]  ,EM_RoleValue_IsWalk , 0 )
	end
	Sleep(10)
	FA_FaceFlagEX(ActorArray[1], FlagID , 7)
	DW_MoveDirectToFlag( ActorArray[2] , FlagID, 6, 0, 1) 
	DW_MoveToFlag( ActorArray[3] , FlagID, 7, 0, 1)
	FA_FaceFlagEX(ActorArray[2], FlagID , 7)
	FA_FaceFlagEX(ActorArray[3], FlagID , 6)
	Yell(ActorArray[2], "[SC_424940_05]",2)
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(20)	
	Yell(ActorArray[3], "[SC_424940_06]",2)
	PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_emote_head_shake)
	Sleep(30)
	Yell(ActorArray[3], "[SC_424940_07]",2)
	PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(30)
	Yell(ActorArray[2], "[SC_424940_08]",2)
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(20)
	Yell(ActorArray[2], "[SC_424940_09]",2)
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_emote_head_shake)
	Sleep(30)
	Yell(ActorArray[2], "[SC_424940_10]",2)
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(20)
	WriteRoleValue(ActorArray[2]  ,EM_RoleValue_IsWalk , 0 )
	DW_MoveDirectToFlag( ActorArray[2] , FlagID, 8, 0, 1) 
	WriteRoleValue(ActorArray[3]  ,EM_RoleValue_IsWalk , 0 ) 
	DW_MoveToFlag( ActorArray[3] , FlagID, 9, 0, 1) 
	DelObj(ActorArray[2])	
	DelObj(ActorArray[3])
	
	Sleep(10)
	Yell(ActorArray[1], "[SC_424940_12]",1)
	Sleep(10)
	for i = 0,Num01 do						--����q���
		if CheckAcceptQuest( PlayerList[i], QuestID ) == true	and
		CountBodyItem(PlayerList[i], 241274)==0		then
			GiveBodyItem(PlayerList[i], 241274, 1)
		end
	end
	DelObj(ActorArray[1])

	--���t���F
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- �����X��\���~
end






--=======================================
--424960  ���Ỳ�U��
---------------------------------------------------------------------------
function LuaPG_424960_Accept()
	local Player = TargetID()
	AddBuff(Player, 622181, 0, -1)
	Sleep(10)
	ScriptMessage( Player, Player, 1,"[SC_424960_HELP_01]", "0xffbf0b2b" )
	ScriptMessage( Player, Player, 0,"[SC_424960_HELP_01]", "0xffbf0b2b" )	
end

function LuaPG_AskForMedicine()
	local Player = OwnerID()
	local NPC = TargetID()
	AddBuff(Player, 622181, 0, -1)
	Sleep(10)
	ScriptMessage( Player, Player, 1,"[SC_424960_HELP_01]", "0xffbf0b2b" )
	ScriptMessage( Player, Player, 0,"[SC_424960_HELP_01]", "0xffbf0b2b" )
	CloseSpeak(Player)	
end



--=======================================
--425283  kors���U��
---------------------------------------------------------------------------
function LuaPG_425283_delmonster()
	local Element = OwnerID()
	local TotalNPC=EM_RoleValue_Register1;
	local CtrlID=EM_RoleValue_PID;
	local ctrl = ReadRoleValue(Element,CtrlID);
	sleep(500);
 	while 1 do
		local NPC_Num = ReadRoleValue(ctrl,TotalNPC);
		if 	HateListCount(Element)==0	then	----�ˬd���ܦC��A�S���H����
			WriteRoleValue(ctrl,TotalNPC,NPC_Num-1)
			DelObj(Element);			----�R���ۤv
			return;
		end
		sleep(20);
	end
end

function LuaPG_425285_Retake()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if CheckAcceptQuest( Player, 425285) == true	and
	CountBodyItem(Player,241484)==0		and
	CountBodyItem(Player,241485)==0		then
		AddSpeakOption(Player, NPC,"[SC_425285_RETAKE]","LuaPG_425285_Retake_01(1)",0)
	elseif CheckAcceptQuest( Player, 425286) == true	and
	CountBodyItem(Player,241486)==0		and
	CheckFlag(Player, 546709)==false		then
		AddSpeakOption(Player, NPC,"[SC_425286_RETAKE]","LuaPG_425285_Retake_01(2)",0)
	elseif CheckAcceptQuest( Player, 425287) == true	and
	CountBodyItem(Player,241487)==0		and
	CountBodyItem(Player,240796)==0		and
	CheckFlag(player, 546723)==false		then
		AddSpeakOption(Player, NPC,"[SC_425286_RETAKE]","LuaPG_425285_Retake_01(3)",0)
	end
end

function LuaPG_425285_Retake_01(Option)
	local Player = OwnerID()
	CloseSpeak(Player)
	if Option==1		then
		GiveBodyItem(Player,241484,1)
	elseif Option==2	then
		GiveBodyItem(Player,241486,1)
	elseif Option==3	then
		GiveBodyItem(Player,241487,1)
	end
end

function LuaPG_425286_ClickCheck()
	local Player = OwnerID()
	if CountBodyItem(Player, 241486)~=0	then
		return true
	else
		ScriptMessage(player,player,0,"[SYS_GAMEMSGEVENT_422]",C_SYSTEM)
		return false
	end
end

function LuaPG_425285_Complete()
	Lua_ZonePE_3th_GetScore(100)
	local Player = TargetID()
	local Leader = OwnerID()
	local Grig = LuaFunc_SearchNPCbyOrgID( Leader, 120649, 180, 0 )
	Tell(Player, Grig, "[SC_425285_01]")
end

function LuaPG_424941_Complete()
	Lua_ZonePE_3th_GetScore(150)
	local Player = TargetID()
	local Grig = OwnerID()
	local Leader = LuaFunc_SearchNPCbyOrgID( Grig, 120578, 180, 0 )
	Tell(Player, Leader, "[SC_424941_01]")
end




--=======================================
--�ƥ�=======================================
--424450  �L�h����O
---------------------------------------------------------------------------
function LuaPG_424450_Note()	--��O���e
	local Player = OwnerID()
	local Pages = {"[SC_424450_NOTEPAGE_01]", "[SC_424450_NOTEPAGE_02]"}
	FA_Border( Player, Pages)
end

function LuaPG_424450_Ask()		--���ȧ�����i�H����S�D�Ȩ��h�ݸ�
	local Player = OwnerID()
	local NPC = TargetID()
	
	LoadQuestOption(Player)
	if CheckCompleteQuest(Player, 424450)==true	and
	CheckCompleteQuest(Player, 424450)==false	then
		AddSpeakOption(Player, NPC, "[SC_424450_ASK_01]", "LuaPG_424450_Ask_02", 0)
	end
end

function LuaPG_424450_Ask_02()
	local Player = OwnerID()
	SetSpeakDetail(Player, "[SC_424450_ASK_02]")
end