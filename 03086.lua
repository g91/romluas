--z29�D�u=======================================
--=======================================
--426779 �\Ū�L�h
--=======================================
function LuaPG_426779_Note()	--��O���e
	local Player = OwnerID()
	local Pages = {"[SC_Z29Q426779_1]", "[SC_Z29Q426779_2]","[SC_Z29Q426779_3]"}
	FA_Border( Player, Pages, "[SC_Z29Q426779_4]", 548790)
end


--=======================================
--426782 �˪L�����o�{
--=======================================
function LuaPG_426782_Tell()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426782)==true	and
	CheckFlag(Player, 548791)==false			then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426782_1]", "LuaPG_426782_Tell_02", 0 )
	end
end

function LuaPG_426782_Tell_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	SetFlag(Player,548791, 1)
end


--=======================================
--426784 �����P�O��
--=======================================
function LuaPG_426784_Click_Before()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426784)==true	and
	CountBodyItem(Player, 242937)>0			then
		return true
	else
		return false
	end
end

function LuaPG_426784_Click_After()
	local Player = OwnerID()
	local BuffCheck=Lua_BuffPosSearch( Player ,625147)			--�䪱�a���W�P�_BUFF����l
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )	--�T�{BUFF�h��
	DelBodyItem(Player, 242937, 1)
	DW_QietKillOne(Player,108137)		 --�R�R�������ǡA�e�̱�����̡A0�N�����a
	if BuffLv>=8	then
		ScriptMessage(Player,Player,1,"[SC_Z29Q426784_2]", 0 )
		ScriptMessage(Player,Player,0,"[SC_Z29Q426784_2]", 0 )
		SetFlag(Player, 548799, 1)
	else
		AddBuff(Player, 625147, 0, -1)
		--Say(Player, BuffLv)		
	end
 	return 1
end

function LuaPG_426784_DeleteorNot()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426784)==false	then
		CancelBuff(Player, 625147)
	end
end


function LuaPG_426784_Complete()
	CancelBuff(TargetID(), 625147)
end

function LuaPG_426784_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426784)==true	and
	CountBodyItem(Player, 242937)==0			then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426784_3]", "LuaPG_426784_Retake_02", 0 )
	end
end

function LuaPG_426784_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242937, 10)
end

--===============���U���ȫ᪺��t
--CliBuff:625142
--WalkFlag:781337 no.32~33
function LuaPG_426784_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426784_Accept_02" , NPC, Player, CliBuff)	----���t��function
	end	
end

function LuaPG_426784_Accept_02(NPC, Player, CliBuff)
	local WalkFlag = 781337
	local Actor = CreateObjByFlag( 123226, WalkFlag, 32, 1)			----�ͦ��t��
	ks_ActSetMode( Actor)
	PlayMotion(Actor, ruFUSION_ACTORSTATE_EMOTE_WAVE)
	NPCSAY(Actor,"[SC_Z29Q426784_1]")
	DW_MoveToFlag( Actor, WalkFlag, 33, 0, 1)
	DelObj(Actor)
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=======================================
--426785 �d�~�ʦ~�����
--=======================================
--CliBuff:625142
--WalkFlag:781337 no.30~31
function LuaPG_426785_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		CallPlot(NPC, "LuaPG_426785_Accept_02" , NPC, Player, CliBuff)	----���t��function
	end	
end

function LuaPG_426785_Accept_02(NPC, Player, CliBuff)
	local WalkFlag = 781337
	local Actor = CreateObjByFlag( 123231, WalkFlag, 33, 1)			----�ͦ��t��
	ks_ActSetMode( Actor)
	DW_MoveToFlag( Actor, WalkFlag, 31, 0, 1)
	DelObj(Actor)
	ScriptMessage(Player,Player,1,"[SC_Z29Q426785_1]", 0 )
	ScriptMessage(Player,Player,0,"[SC_Z29Q426785_1]", 0 )
	CancelBuff(Player, CliBuff)
	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end


--=======================================
--426786 �c�P���_
--=======================================
--	NPC�G123230 �º��D���_���B123237 ���V	��t�ΡG123238 �º��D���_���B123232 ���V
--	625143 clibuff
--	EM_RoleValue_Register+1	������t�O�_�b�i�椤�A"0"=�_�A"1"=�O�A"2"=�Y�N�}�l
--=======================
function LuaPG_Z29_123230_Talk_Main()	--123230 �º��D���_���A��ܼ@��
	local Player = OwnerID()
	local NPC = TargetID()
	
	if CheckAcceptQuest( Player, 426786 ) == true and
	Checkflag(Player,548792)==false		then
	--�ˬd�O�_�������ȡA�����~��ܪ�t�Ϊ����
		SetSpeakDetail( Player, "[SC_Z29Q426786_1]" )
		AddSpeakOption( Player, NPC, "[SC_Z29Q426786_2]", "FN_Quest_Acting_plot(426786, 625143, \"LuaPG_Z29_Q426786_Act_Main\")", 0 )
		--��ܿﶵCALL���禡�A�N�J�ѼƭY���r��h�ϥ� \" �e�᧨�_��
		--�t�X�q�αƶ��禡�ϥΡA�o��@�w�n�N�J�D�n��t��function�r��
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_Z29_Q426786_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	local NPCTable = SearchRangeNPC( NPC, 200 )
	local BuffID = 625143
	local QuestID = 426786
	--�ѷӳ��WNPC����m�A�гy�t��NPC
	for i = 0, #NPCTable do
		local OrgID = ReadRoleValue( NPCTable[i], EM_RoleValue_OrgID )
		local x, y, z, dir = DW_Location( NPCTable[i] )
		if OrgID == 123230 then
			Actor[1] = CreateObj( 123238, x, y, z, dir, 1 )
		end
		if OrgID == 123237 then
			Actor[2] = CreateObj( 123232, x, y, z, dir, 1 )
		end
		if OrgID == 123237 then
			Actor[3] = NPCTable[i]
		end
	end

	--�ݭn��NPC�O123238�M123232
	for i = 1, 2 do
		MoveToFlagEnabled( Actor[i], false )
		--
		if i == 1 then	--�º� �ۤU�B�z
			SetDefIdleMotion(Actor[1], ruFUSION_MIME_CROUCH_LOOP)
		end
		if i == 2 then	--���V �I�k�B�z
			SetDefIdleMotion( Actor[2], ruFUSION_MIME_RUN_CHARGE2)
			CallPlot(Actor[2], "LuaPG_Z29_123237_03", 0)
			--CastSpell(Actor[2], Actor[3], 851383)
		end
		AddToPartition( Actor[i], RoomID )
	end
	--
	local MusicID = {}
	for i = 1, #ActPlayerTable do		--����Client�@���һݭn���P�_��buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--���񭵼֬����B�z
		Lua_StopBGM( PlayerID )		--����a�I�����֪�����
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, "music/zone/005/zone005_night_01.mp3", true )
	end
	Sleep(40)
	--�ܦ��Ҧ�NPC�t���w�g�ǳƦn�A�O���bActor�o�Ӱ}�C��
	Say( Actor[1], "[SC_Z29Q426786_3]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[1], "[SC_Z29Q426786_4]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[1], "[SC_Z29Q426786_5]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[1], "[SC_Z29Q426786_6]" )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	ScriptMessage( Actor[2], 0, 2, "[SC_Z29Q426786_7]", C_SYSTEM )
	for i = 1, #ActPlayerTable do		--��������������buff
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548798, 1)
	end
	WriteRoleValue(Actor[2], EM_RoleValue_Register7, 1)		--�����V���U�k�N����
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	SetDefIdleMotion( Actor[2], ruFUSION_MIME_IDLE_STAND )	
	AdjustFaceDir( Actor[2], Actor[1], 0 )
	PlayMotion(Actor[2], ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Say( Actor[2], "[SC_Z29Q426786_8]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[2], ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
	Say( Actor[2], "[SC_Z29Q426786_9]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[2], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[2], "[SC_Z29Q426786_10]" )
	Sleep( 25 )
	--
	PlayMotion( Actor[2], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[2], "[SC_Z29Q426786_11]" )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion(Actor[2], ruFUSION_ACTORSTATE_BUFF_SP01)
	Sleep(10)
	AddBuff(Actor[2], 625145, 0, 3)
	DelObj(Actor[2])
	ScriptMessage( Actor[1], 0, 2, "[SC_Z29Q426786_12]", C_SYSTEM )	
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	for i = 1, #ActPlayerTable do		--�缾�a���B�z
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548792, 1 )	--�����U�@�ӥ��Ȫ����n���~
		CancelBuff( PlayerID, BuffID )	--�R��Client�㹳��buff
		--�����@��bgm �^�_�쥻��bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	DelObj( Actor[1] )
end

--=======================�a����V�������ĪG
function LuaPG_Z29_123237_02()	--���V�P����K��h
	local NPC = OwnerID()
	local PlayerList = {}
	CastSpell(NPC, NPC, 851389)
	while 1 do
--		DebugMsg(0,0,"test")
		PlayerList = SearchRangePlayer ( NPC , 35 )
		if #PlayerList~=0	then
			for i=0,#PlayerList do
--				SAY(PlayerList[i],"00")
				CastSpell(NPC, PlayerList[i], 851406)
				ScriptMessage(PlayerList[i],PlayerList[i],1,"[SC_Z29NPC123237_1]", 0 )
				ScriptMessage(PlayerList[i],PlayerList[i],0,"[SC_Z29NPC123237_1]", 0 )
			end
		end
		Sleep(30)
	end
end

function LuaPG_Z29_123237_03()	--��ۯS�Ĳy�I��k�N
	local NPC = OwnerID()
	local Ball = LuaFunc_SearchNPCbyOrgID( NPC, 123255, 120, 0 )
	local Num
	SetDefIdleMotion( NPC, ruFUSION_MIME_RUN_CHARGE2)
	while 1 do
		Num = ReadRoleValue(NPC,EM_RoleValue_Register7)
		if Num ~=0	then
			break
		else 
			CastSpell(NPC, Ball, 850074)	
		end
		Sleep(10)
	end
end

function LuaPG_Z29_123237_04()	--���b�z���H���W
	AddBuff(OwnerID(), 625144, 0, -1)
end


--=======================�ǰe
function LuaPG_426786_Up()		--�Ǩ�s�W
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_426786_Up_02" , 60 )
end

function LuaPG_426786_Up_02()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or",Player,426786)==true	or
	CheckCompleteQuest(Player, 426786)==true		then
		ChangeZone( Player , 29 , 0 , 12289.9 , 800.4 , 29480.7 , 321 )
	end
end

function LuaPG_426786_Down()		--�Ǩ�s�U
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_426786_Down_02" , 60 )
end

function LuaPG_426786_Down_02()
	ChangeZone( OwnerID() , 29 , 0 , 12323.6 , -176, 30130.2 , 166 )
end



--=====================================
--421635 ��w����
--=====================================
--===============���U���ȫ᪺��t
--CliBuff:624043
--WalkFlag:781337 no.80~81
function LuaPG_421635_Leave_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local WalkFlag = 781337
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register5)
	if Num == 0	then							--�p�G�Ȧs�Ȭ�0
		WriteRoleValue(NPC, EM_RoleValue_Register5,999)			
		AddBuff( Player,CliBuff,0, 10)
		local Man = CreateObjByFlag( 123226, WalkFlag, 80, 1)	--�ͦ��t��
		ks_ActSetMode( Man)
		WriteRoleValue(Man, EM_RoleValue_IsWalk , 0 )
		DW_MoveToFlag( Man, WalkFlag, 81, 0, 1)
		DelObj(Man)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register5,0)
	end
end