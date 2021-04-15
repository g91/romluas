--�D�u=======================================
--424920  �b�s�֦~���O��
---------------------------------------------------------------------------
function LuaPG_424920_AskFlag()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424920_YUKIN_01]")
	SetFlag(Player, 545814, 1)
end

function LuaPG_424920_AskForHelp()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424920 )==true	and
		CheckFlag(Player, 545814)==true		and
		CheckFlag(Player, 545813)==false		then
			AddSpeakOption(Player, NPC , "[SC_424920_ASK]","LuaPG_424920_Answer", 0)
	end
end

function LuaPG_424920_Answer()
	local Player = OwnerID()
	local NPC = TargetID()

	local OrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )--���󪺸�Ʈw�s��
	local NPCList = {}
	NPCList[119728] = {"[SC_424920_AL]"; 545813}		--�R�ฯ����
	NPCList[119721] = {"[SC_424920_IGS]"}			--��洵
	
	SetSpeakDetail(Player, NPCList[OrgID][1])
	if	OrgID==119728	then
			SetFlag(Player, 545813, 1)
	end
end


--424920  ���ȵ�����t
---------------------------------------------------------------------------
--�t���G�N��119744�B�R��119745
--����X�l�G781044	no.1��2
--�����a������BUFF�G621123
function LuaPG_424920_Complete()
	local Player = TargetID()
	local Gill = OwnerID()
	local Flag = 781044
	
	local New_Gill = DW_CreateObjEX("obj", 119744, Gill)	----�ͦ��t���N��
	ks_ActSetMode( New_Gill )

	local Num = ReadRoleValue(Gill,EM_RoleValue_Register1)
	AddBuff( Player,621123,1, 20)
	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		CallPlot(Gill , "LuaPG_424920_Complete_01" , New_Gill , Gill, Player, Flag)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424920_Complete_01(New_Gill , Gill, Player, Flag)
	WriteRoleValue(Gill,EM_RoleValue_Register1,999) 		----�}�l�t�X���аO

	local Al = Lua_DW_CreateObj("flag",119745, Flag, 1)		----���ͷR��
	ks_ActSetMode( Al )
	DW_MoveToFlag( Al , Flag, 2, 0, 1)				----�R�ਫ�ӡ]��781044��1����2�^
	PlayMotion(Al, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	NPCSAY(Al, "[SC_424920_AL_SHOW]")				----�R�໡��
	Sleep(25)
	NPCSAY(Gill, "[SC_424920_GILL_SHOW]")				----�N�໡��
	Sleep(25)

	DelObj( Al )							----�R���t��
	DelObj( New_Gill )

	CancelBuff(Player, 621123)
	WriteRoleValue(Gill, EM_RoleValue_Register1, 0) 			----�g�^�N��Ȧs��
end




--===========================================
--424921  �����Ǫ���w
---------------------------------------------------------------------------
function LuaPG_424921_Understand_00()
	SetSpeakDetail(OwnerID(), "[SC_424921_01]")
	AddSpeakOption(OwnerID(), TargetID() , "[SC_424921_03]","LuaPG_424921_Understand", 0)
end

function LuaPG_424921_Understand()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424921_02]")
	AddSpeakOption(Player, NPC , "[SC_424480_00]","LuaPG_424921_Understand_01", 0)
end

function LuaPG_424921_Understand_01()
	local Player = OwnerID()
	local NPC = TargetID()
	
	CloseSpeak(Player)
	SetFlag(Player, 545815, 1)

	CallPlot(NPC , "LuaPG_424921_Get_Flag", Player, NPC)
end


--���U���ȫ᪺��t
---------------------------------------------------------------------------
--�t���G�N��119748
--����X�l�G781044	no.3
--�����a������BUFF�G621124
function LuaPG_424921_Accept()
	local Player = TargetID()
	local Gill = OwnerID()
	local Flag = 781044

	local New_Gill = DW_CreateObjEX("obj", 119748, Gill)		----�ͦ��t���N��
	ks_ActSetMode( New_Gill )

	local Num = ReadRoleValue(Gill,EM_RoleValue_Register1)
	AddBuff( Player,621124,1,20)
	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		CallPlot(Gill , "LuaPG_424921_Accept_01" , New_Gill , Gill, Player, Flag)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424921_Accept_01(New_Gill , Gill, Player, Flag)
	WriteRoleValue(Gill,EM_RoleValue_Register1,999) 		----�}�l�t�X���аO

	Sleep(10)
	AdjustFaceDir( New_Gill,Player, 0 )
	NPCSAY(New_Gill, "[SC_424921_GILL_LEAVE]")	
	Sleep(20)	
	DW_MoveToFlag( New_Gill , Flag, 3, 0, 1)			----�N�ਫ��781044��3
	DelObj(New_Gill)
	CancelBuff(Player, 621124)
	WriteRoleValue(Gill, EM_RoleValue_Register1, 0) 		----�g�^�N��Ȧs��
end

--�o��flag�᪺��t
---------------------------------------------------------------------------
--�t���G�N��119748
--����X�l�G781044	no.4
--�����a������BUFF�G621123
function LuaPG_424921_Get_Flag(Player, NPC)
	local Gill = LuaFunc_SearchNPCbyOrgID( NPC, 119743, 200, 0 )
	local Flag = 781044

	local New_Gill = DW_CreateObjEX("obj", 119748, Gill)		----�ͦ��t���N��
	ks_ActSetMode( New_Gill )

	local Num = ReadRoleValue(Gill,EM_RoleValue_Register1)
	AddBuff( Player,621123,1,20)
	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		CallPlot(Gill , "LuaPG_424921_Get_Flag_01" , New_Gill , Gill, Player, Flag)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424921_Get_Flag_01(New_Gill , Gill, Player, Flag)
	WriteRoleValue(Gill,EM_RoleValue_Register1,999) 		----�}�l�t�X���аO
	
	DW_MoveToFlag( New_Gill , Flag, 4, 0, 1)				----�N�ਫ��781044��4
	DelObj(New_Gill)
	CancelBuff(Player, 621123)

	WriteRoleValue(Gill, EM_RoleValue_Register1, 0) 			----�g�^�N��Ȧs��
end


----�p�G�������ȡABUFF�N����
function LuaPG_424921_Cancel_Buff()
--	Say(OwnerID(),"00")
	if	CheckAcceptQuest(OwnerID(),424921)==false	then
		CancelBuff(OwnerID(),621124)
	end
end

--===========================================
--424922  �ϥͤ��a�������n��
---------------------------------------------------------------------------
function LuaPG_424922_Range()
	SetPlot( OwnerID(),"range","LuaPG_424922_Range_01",150 )  	----���b�����n�������βy���W	
end

function LuaPG_424922_Range_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local QuestID = 424922
	local FlagID = 545819

	CallPlot(NPC , "LuaPG_424922_Range_02" , Player , NPC, QuestID, FlagID)
end

function LuaPG_424922_Range_02(Player , NPC, QuestID, FlagID)
--	Say(Player,"Player")
--	Say(NPC,"NPC")
	local PlayerList = SearchRangePlayer( NPC, 150 )
	local Num = table.getn(PlayerList)
	for i=0, Num do
--		Say(PlayerList[i], "PlayerList[i]")		
		if CheckAcceptQuest( PlayerList[i], QuestID ) == true and
		CheckCompleteQuest( PlayerList[i], QuestID )==false and
		Checkflag( PlayerList[i], FlagID ) == false then

--			Say(PlayerList[i], "PlayerList[i]")
			ScriptMessage( PlayerList[i], PlayerList[i], 1,"[SC_424922_02]", "0xffbf0b2b" )
			ScriptMessage( PlayerList[i], PlayerList[i], 0,"[SC_424922_02]", "0xffbf0b2b" )
			Sleep(30)
			ScriptMessage( PlayerList[i], PlayerList[i], 1,"[SC_424922_03]", "0xffbf0b2b" )
			ScriptMessage( PlayerList[i], PlayerList[i], 0,"[SC_424922_03]", "0xffbf0b2b" )
			Sleep(40)
			ScriptMessage( PlayerList[i], PlayerList[i], 1,"[SC_424922_04]", "0xffbf0b2b" )
			ScriptMessage( PlayerList[i], PlayerList[i], 0,"[SC_424922_04]", "0xffbf0b2b" )
			Sleep(20)
			ScriptMessage( PlayerList[i], PlayerList[i], 1,"[SC_424922_05]", "0xffbf0b2b" )
			ScriptMessage( PlayerList[i], PlayerList[i], 0,"[SC_424922_05]", "0xffbf0b2b" )
			SetFlag(PlayerList[i], FlagID, 1)		
		end
	end
end

function LuaPG_424922_Tell()
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545818, 1)
end




--===========================================
--424924  �ĤG�����@���
---------------------------------------------------------------------------
--���U���ȫ᪺��t
---------------------------------------------------------------------------
--�t���G������119740
--����X�l�G781044	no.5~6
--�����a������BUFF�G621123
function LuaPG_424924_Accept()
	local Player = TargetID()
	local Yukin = OwnerID()
	local Flag = 781044

	local Num = ReadRoleValue(Yukin, EM_RoleValue_Register1)
	AddBuff( Player,621123,1,20)
	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		CallPlot(Yukin , "LuaPG_424924_Accept_01" , Yukin , Player, Flag)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424924_Accept_01(Yukin , Player, Flag)
	WriteRoleValue(Yukin,EM_RoleValue_Register1,999) 		----�}�l�t�X���аO

	local Behel = Lua_DW_CreateObj("flag",119740, Flag, 5)		----�ͦ��t��������
	ks_ActSetMode( Behel )
	
	DW_MoveToFlag( Behel , Flag, 6, 0, 1)				----����������781044��6
	DelObj(Behel)
	CancelBuff(Player, 621123)
	WriteRoleValue(Yukin, EM_RoleValue_Register1, 0) 		----�g�^�ת��Ȧs��
end




--===========================================
--424925  �ԳN�|ĳ
---------------------------------------------------------------------------
--function LuaPG_424925_Accept()
--	AddBuff(TargetID(), 621664, 1, 35)
--end

--�t���G������119816�B�ת�119815�B�d�S��119787
--�����a������BUFF�G621127
--����G781044	no.7��10
function LuaPG_424925_Show()
	local Player = OwnerID()
	local Behel = TargetID()

	local Num = ReadRoleValue(Behel, EM_RoleValue_Register1)

	if CheckAcceptQuest( Player, 424925 ) == true		 and
	 CheckFlag(Player,545816)==false			then
		if Num > 0					then			----�ˬd���a�O�_������ �åB�{�b�O�_���b�t��		
			SetSpeakDetail(Player, "[SC_424925_GREET_02]")			----(���b�t�����p�U �����i��)
		elseif Num == 0				then			----�p�G�Ȧs�Ȭ�0
			SetSpeakDetail(Player, "[SC_424925_GREET]")
			AddSpeakOption(Player, Behel,"[SC_424925_GREET_01]","LuaPG_424925_Show_02",0)
		end									----���t��function	
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424925_Show_02()
	local Player = OwnerID()
	local Behel = TargetID()
	CloseSpeak( Player )								----������ܵ���
	
	WriteRoleValue( Behel, EM_RoleValue_Register1, 999 )				----�W�� ��ܥ��b�t��	
	BeginPlot( Behel, "LuaPG_424925_Show_03", 0 )				
end

function LuaPG_424925_Show_03()
	local Behel = OwnerID()				--���bNPC���W���t���@��
	local QuestID = 424925				--���Ƚs��
	local FinishFlagID = 545816			--����������o���X��
	local CheckBuffID = 621127			--�ˬd�O�_���b�t����BUFF
	local CheckRange = 250				--�t�����ˬd�d��
	local ActorArray = {}				--(�s���ק�)�t���}�C��
	
	local FlagID = 781044				--�X��ID
	-- �ƥ���Ҧ��|�Ψ쪺�t�����ͥX�� �i�H��AddToPartition(�u�ݭnGUID)
	ActorArray[1] = CreateObjByFlag( 119816, FlagID, 6, 1 ) 	 --������
	ActorArray[2] = CreateObjByFlag( 119815, FlagID, 8, 1 ) 	--�ת�
	ActorArray[3] = CreateObjByFlag( 119787, FlagID, 9, 1 ) 	--�d�S��

	CallPlot( Behel, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--�d������Ϊ��ˬd�禡
	for i=1, 2 do
		AddToPartition( ActorArray[i], 0 )
		ks_ActSetMode( ActorArray[i] )
	end
	sleep(10)

	--�t����
	NPCSAY(ActorArray[2], "[SC_424925_MEETING]")		--�ת��G�n�աI�i�J���D�A��軡����H
	Sleep(20)
	NPCSAY(ActorArray[2], "[SC_424925_MEETING_01]")	--�ת��G��A�O�_�ӤF�C�ڬO�n�ݧA������Ϲ�ڪ������H
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(25)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_02]")	--�������G�M�D�u�s�b[ZONE_PROCESSING_PLANT_LAPRIG]�i��Ť��԰����i��ʡH
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(30)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_03]")	--�������G���i�_�{�A�u�s���O�q�j�j�B�O�H���ߡA���L�p���@�k�A�ե��N����a�����ձq�����ର�n���C
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(50)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_04]")	--�������G���|�]���w�Ϻ��@�̳Q�U�O�����ର��աA�Y�����H�Z�O�۷i�A��ڤ�۷��Q�C
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(40)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_05]")	--�������G�A�̡A�u�s�������ʤӱj�A�Y�O�L�ׯ}�a�A���ȥ��h���˪L�N�����H�_��C
	Sleep(50)
	NPCSAY(ActorArray[2], "[SC_424925_MEETING_06]")	--�ת��G�����I[119726]�A�ӻ{�a�I�A�_�{�u�O���F�˪L�A���o�i���O�ڭ̲{�b�������ߪ��I
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_AMAZED)
	Sleep(40)
	NPCSAY(ActorArray[1], "[SC_424925_MEETING_07]")	--�������G......�ת��D����A�����ߩҦ������ߤ��ơA�ӧA�~�O�ө�e���ɤ��H�C
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(30)
	NPCSAY(ActorArray[2], "[SC_424925_MEETING_08]")	--�ת��G�ڧi�D�A......
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(10)
	AddToPartition( ActorArray[3], 0 )			--�d�S�ťX�{
	Yell(ActorArray[3], "[SC_424925_MEETING_09]", 3)	--�d�S�šG���n�F�I�����x�I���ӥb�s�H�S�ƤF�I
	WriteRoleValue(ActorArray[3]  ,EM_RoleValue_IsWalk , 1 )	--�d�S�Ŷ]��
	DW_MoveToFlag( ActorArray[3] , FlagID, 10, 0 ,1) 

	local Player = {}
	local PlayerList = SearchRangePlayer( Behel, CheckRange )
	local Num = table.getn(PlayerList)
	for i=0, Num do
--		Say(PlayerList[i], "PlayerList[i]")		
		if CheckAcceptQuest( PlayerList[i], QuestID ) == true and
		CheckCompleteQuest( PlayerList[i], QuestID )==false and
		Checkflag( PlayerList[i], FlagID ) == false and
		CheckBuff(PlayerList[i], CheckBuffID) == true then
			SetFlag(PlayerList[i], 546092, 0)
			--Say(PlayerList[i], "GOT")
		end
	end

	--���t���F
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- �����X��\���~
end

--�ҫk�����
---------------------------------------------------------------------------
function LuaPG_424925_Complete()
	Lua_ZonePE_3th_GetScore(100)
	Setflag(TargetID(), 545875, 1)
end

function LuaPG_424925_Lobo()
	local Player = OwnerID()
	local NPC = TargetID()	

	if CheckAcceptQuest(Player, 424925 )==true	or
	CheckFlag(Player, 545875 )==true		then
		SetSpeakDetail(Player, "[SC_424925_LOBO]")
	else
		LoadQuestOption(Player)
	end		
end

--===========================================
--424926  �L�ߪ��ˮ`
---------------------------------------------------------------------------
function LuaPG_424926_Ask()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424926 )==true	and
		CheckFlag(Player, 545820)==false		then
			SetSpeakDetail(Player, "[SC_424926_EAST]")
			AddSpeakOption(Player, NPC , "[SC_424926_ASK]","LuaPG_424926_Ask_01()", 0)
	end
end

function LuaPG_424926_Ask_01()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424926_EAST_01]")
	AddSpeakOption(Player, NPC , "[SC_424926_ASK_02]","LuaPG_424926_Ask_02()", 0)
end

function LuaPG_424926_Ask_02()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424926_EAST_02]")
	SetFlag(Player, 545820, 1)
end

--���ȵ�����t
---------------------------------------------------------------------------
--�t���G�h�LA 119840�B�h�LB 119839�B����J119779
--����X�l�G781044	no.11~14
--�����a������BUFF�G621139
function LuaPG_424926_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local Flag = 781044

	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	AddBuff( Player,621139,1,20)
	
	local SoldierA = LuaFunc_SearchNPCbyOrgID( NPC, 119841, 200, 0 )
	local SoldierB = LuaFunc_SearchNPCbyOrgID( NPC, 119842, 200, 0 )
	local New_SoldierA = DW_CreateObjEX("obj", 119840, SoldierA)
	local New_SoldierB = DW_CreateObjEX("obj", 119839, SoldierB)	
	local SoldierList = {New_SoldierA, New_SoldierB}

	for Name, value in pairs(SoldierList) do
		ks_ActSetMode(value)
		PlayMotionEX( value,ruFUSION_ACTORSTATE_COMBAT_1H, ruFUSION_ACTORSTATE_COMBAT_1H)
	end

	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		CallPlot(NPC , "LuaPG_424926_Complete_01" , SoldierList, Player, NPC, Flag)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424926_Complete_01(SoldierList, Player, NPC, Flag)
	WriteRoleValue(NPC,EM_RoleValue_Register1,999) 		----�}�l�t�X���аO

	local Merick = Lua_DW_CreateObj("flag",119779, Flag, 11)		----�ͦ��t������J
	ks_ActSetMode( Merick )
	NPCSAY(Merick, "[SC_424926_SHOW]")
	DW_MoveToFlag( Merick , Flag, 12, 0, 1)				----����J����781044��12

	for Name, value in pairs(SoldierList) do
		NPCSAY(value, "[SC_424926_SHOW_01]")
	end
	Sleep(30)

	DW_MoveDirectToFlag( SoldierList[1] , Flag, 13, 0, 1) 
	WriteRoleValue(SoldierList[2]  ,EM_RoleValue_IsWalk , 0 ) 
	DW_MoveToFlag( SoldierList[2] , Flag, 14, 0, 1) 
	
	Sleep(10)
	DelObj(SoldierList[1])
	DelObj(SoldierList[2])
	DelObj(Merick)

	CancelBuff(Player, 621139)
	WriteRoleValue(NPC, EM_RoleValue_Register1, 0) 		----�g�^�Ȧs��
end



--===========================================
--424927  �`������
---------------------------------------------------------------------------
--���U���ȫ᪺��t
---------------------------------------------------------------------------
--�t���G�ҫk119846�B����J119845
--����X�l�G781044	no.15��16
--�����a������BUFF�G621141
function LuaPG_424927_Accept()
	local Player = TargetID()
	local Merick = OwnerID()
	local Flag = 781044
	local Buff = 621141

	local New_Merick = DW_CreateObjEX("obj", 119845, Merick)
	local Lober = DW_CreateObjEX("obj", 119846, LuaFunc_SearchNPCbyOrgID( Merick, 119780, 200, 0 ))
	ks_ActSetMode( New_Merick )

	local Num = ReadRoleValue(Merick,EM_RoleValue_Register1)
	AddBuff( Player,Buff,1,20)
	
	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		CallPlot(Merick , "LuaPG_424927_Accept_01" , New_Merick, Merick, Lober, Player, Flag, Buff)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424927_Accept_01(New_Merick, Merick, Lober, Player, Flag, Buff)
	WriteRoleValue(Merick,EM_RoleValue_Register1,999) 		----�}�l�t�X���аO

	Sleep(10)
	NPCSAY(New_Merick,"[SC_424927_01]")
	PlayMotion(New_Merick, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(20)
	NPCSAY(Lober, "[SC_424927_02]")
	Sleep(10)

	DW_MoveDirectToFlag( New_Merick , Flag, 13, 0, 1) 
	WriteRoleValue(Lober  ,EM_RoleValue_IsWalk , 1 ) 
	DW_MoveToFlag( Lober , Flag, 14, 0, 1)

	DelObj(New_Merick)
	DelObj(Lober)

	CancelBuff(Player, Buff)	
	WriteRoleValue(Merick,EM_RoleValue_Register1,0) 		----�g�^�Ȧs��
end


--���������ƪ��͸�
---------------------------------------------------------------------------
function LuaPG_424927_Collect()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_424927_05]" )
	AddSpeakOption(Player, NPC, "[SC_424927_06]", "LuaPG_424927_Collect_01", 0)
end

function LuaPG_424927_Collect_01()
	local Player = OwnerID()

	CloseSpeak(Player)
	SetFlag(Player, 545821, 1)
	DelBodyItem(Player, 240848, 10)
end



--===========================================
--424928  ����B�z
---------------------------------------------------------------------------
function LuaPG_424928_Check()		----���ĽT�{��H
	local Player = OwnerID()
	local NPC = TargetID()
	local PatientList = {}
	PatientList[119848]=545863
	PatientList[119847]=545862
	PatientList[119836]=545864	
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)

	for key,value in pairs(PatientList) do
		if CheckAcceptQuest(Player, 424928) == true and
		key==OrgID and
		CheckFlag(Player, value)==false then
			ScriptMessage( Player , Player , 1 , "[SC_424928_USE]" , 0 ) 		----�A�ϥΤF[240852]
			ScriptMessage( Player , Player , 0 , "[SC_424928_USE]" , 0 )
			return true						
		elseif key==OrgID and
		CheckFlag(Player, value)==true then
			ScriptMessage( Player , Player , 1 , "[SC_424928_USE_01]" , 0 ) 	----�A�w�g�v���L�F
			ScriptMessage( Player , Player , 0 , "[SC_424928_USE_01]" , 0 )
			return false	
		end
	end

	if OrgID~= 119848 or 119847 or 119836 then
		ScriptMessage( Player , Player , 1 , "[SC_424928_USE_02]" , 0 ) 	----�й�ۥ��T���˱w�ϥ�
		ScriptMessage( Player , Player , 0 , "[SC_424928_USE_02]" , 0 )
		return false			
	end

	if ReadRoleValue( Player , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_424928_USE_03]" , 0 ) 		----�԰����L�k�v��
		ScriptMessage( Player , Player , 0 , "[SC_424928_USE_03]" , 0 )
		return false
	end

	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_424928_USE_04]" , 0 ) 	----�A�L�k�b�M���ɪv��
			ScriptMessage( Player , Player , 0 , "[SC_424928_USE_04]" , 0 )
			return false
		end
	end
end

function LuaPG_424928_Use()
	local Player = OwnerID()
	local NPC = TargetID()

	local PatientList = {}
	PatientList[119848]=545863
	PatientList[119847]=545862
	PatientList[119836]=545864	
	local OrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	
	DelBodyItem(Player, 240852, 1)
	SetFlag(Player, PatientList[OrgID], 1)	
end

function LuaPG_424928_ReTake()
	local Player = OwnerID()
	local NPC = TargetID()

	CloseSpeak(Player)
	repeat 
	GiveBodyitem( Player, 240852, 1 )
	until 
	CountBodyItem( Player, 240852 )==5		
end

--���ȵ�����t
---------------------------------------------------------------------------
--�t���G�N��119849
--����X�l�G781044	no.17��18
--�����a������BUFF�G621141
function LuaPG_424928_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local Flag = 781044
	local Buff = 621141

	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	AddBuff( Player,Buff,1,20)

	if	Num == 0	then					----�p�G�Ȧs�Ȭ�0
		CallPlot(NPC , "LuaPG_424928_Complete_01" , Player, NPC, Flag, Buff)	
									----���t��function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424928_Complete_01(Player, NPC, Flag, Buff)
	WriteRoleValue(NPC,EM_RoleValue_Register1,999) 		----�}�l�t�X���аO

	local Gill = Lua_DW_CreateObj("flag",119849, Flag, 17)
	ks_ActSetMode( Gill )
	Sleep(10)
	NPCSAY(Gill, "[SC_424928_GILL]")
	DW_MoveToFlag( Gill , Flag, 18, 0, 1)				----���ӡ]��781044��17����18�^
	Sleep(30)
	DelObj(Gill)				

	CancelBuff(Player, Buff)	
	WriteRoleValue(NPC,EM_RoleValue_Register1,0) 			----�g�^�Ȧs��
end



--===========================================
--424929  �ݻŪ�����
---------------------------------------------------------------------------
function LuaPG_424929_Tell()
	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 424929 )==true	and
		CheckFlag(Player, 545865)==false		then
			SetSpeakDetail(Player, "[SC_424929_TELL_00]")
			AddSpeakOption(Player, NPC , "[SC_424929_TELL]","LuaPG_424929_Tell_01", 0)
	end
end

function LuaPG_424929_Tell_01()
	local Player = OwnerID()
	local NPC = TargetID()
	SetSpeakDetail(Player, "[SC_424929_TELL_01]")
	AddSpeakOption(Player, NPC , "[SC_424929_TELL_02]","LuaPG_424929_Tell_02", 0)
end

function LuaPG_424929_Tell_02(Player,NPC)
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak(Player)
	SetFlag(Player, 545865, 1)
end



--===========================================
--424930  ������Ҫ���
---------------------------------------------------------------------------
function LuaPG_424930_Tell()
	local Player = OwnerID()
	local NPC = TargetID()

	CloseSpeak(Player)
	SetFlag(Player, 545866, 1)
end

function LuaPG_424930_Complete()
	Setflag(TargetID(), 545875, 0)
end