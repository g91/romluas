--=======================
--	�}���G�M��
--	122652 �º��D���_��
--				EM_RoleValue_Register+1	������t�O�_�b�i�椤�A"0"=�_�A"1"=�O�A"2"=�Y�N�}�l
--=======================
function Z26_FN_122652_Talk_Main()	--122652 �º��D���_���A��ܼ@��
	local Player = OwnerID()
	local NPC = TargetID()
	
--	if CheckAcceptQuest( Player, 426312 ) == true then
	--�ˬd�O�_�������ȡA�����~��ܪ�t�Ϊ����
		AddSpeakOption( Player, NPC, "[SC_424532_1]", "FN_Quest_Acting_plot(426312, 623824, \"Z26_FN_Q426312_Act_Main\")", 0 )
		--��ܿﶵCALL���禡�A�N�J�ѼƭY���r��h�ϥ� \" �e�᧨�_��
		--�t�X�q�αƶ��禡�ϥΡA�o��@�w�n�N�J�D�n��t��function�r��
--	else
--		SetSpeakDetail( Player, "[SC_Z26_Q426312_0]" )
--	end
end

--
function Z26_FN_Q426312_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	--local NPCTable = SearchRangeNPC( NPC, 200 )
	local BuffID = 623824
	local QuestID = 426312
	local PlayMusic = "music/zone/019/zone/day/LHL_07_APF_magic_and_might.mp3"
	local x, y, z, dir = DW_Location( NPC )
	--�ѷӺX�г�781248�A0~5��m�A�гy�t��NPC
	local ActorOrgID = { 122682, 122683, 122684, 122685, 122686 }
	ActorOrgID[0] = 122680	--�]�w����0�ӳ·ФF�A�ҥH�o��A�B�~��i�h
	for i = 0, 5 do
		local ActorID = ActorOrgID[i]
		local x, y, z, dir = DW_Location( 781248, i )
		Actor[ActorID] = CreateObj( ActorID, x, y, z, dir, 1 )
		--
		MoveToFlagEnabled( Actor[ActorID], false )
		AddToPartition( Actor[ActorID], RoomID )
		--�Ыؤ���A�o��O��t�����@�ǳB�z
		if ActorID == 122683 then	--����J �S�O�B�z
			SetDefIdleMotion( Actor[ActorID], ruFUSION_MIME_DEATH_LOOP ) --������U�ʧ@
		end
		if ActorID == 122685 or ActorID == 122686 or ActorID == 122682 then	--�N�� / �d�Ժ� / ���عp�i�� �S�O�B�z
			Hide( Actor[ActorID] )
			SetModeEx( Actor[ActorID], EM_SetModeType_Gravity, false )	--�@�����|�B�šA�ҥH�������O
			WriteRoleValue( Actor[ActorID], EM_RoleValue_IsWalk, 0 )
			addbuff( Actor[ActorID], 506984, 1, -1 )
		end
	end
	--��ݪ�t���a���B�z
	local MusicID = {}
	for i = 1, #ActPlayerTable do		--����Client�@���һݭn���P�_��buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--���񭵼֬����B�z
		Lua_StopBGM( PlayerID )		--����a�I�����֪�����
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, PlayMusic, true )
	end
	Sleep(20)
	--
	x, y, z, dir = DW_Location( 781248, 1 )
	Move( Actor[122680], x, y, z )
	ScriptMessage( Actor[122680], 0, 2, "[SC_Z26_Q426312_1]", C_SYSTEM )
	Sleep(5)
	--
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say( Actor[122680], "[SC_Z26_Q426312_2]" )
	Sleep(30)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122680], "[SC_Z26_Q426312_3]" )
	Sleep( 30 )
	--
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_THINK )
	Say( Actor[122684], "[SC_Z26_Q426312_4]" )
	Sleep( 10 )
	AdjustFaceDir( Actor[122684], Actor[122680], 0 )
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(20)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_5]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Sleep( 30 )
	--
	Say( Actor[122684], "[SC_Z26_Q426312_6]" )
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_7]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 25 )
	--
	Say( Actor[122684], "[SC_Z26_Q426312_8]" )
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_9]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Sleep( 25 )
	--
	Say( Actor[122684], "[SC_Z26_Q426312_10]" )
	PlayMotion( Actor[122684], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_11]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	Sleep( 30 )
	--
	Say( Actor[122680], "[SC_Z26_Q426312_12]" )			--�ڤ��Q�A�~��o�O�ڤ��r�֪���ܤF�I
	CastSpell( Actor[122680], Actor[122680], 491999 )		--�I��k�N�A�����A���H�˦a�C
	Sleep( 40 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	Say( Actor[122680], "[SC_Z26_Q426312_13]" )
	CastSpell( Actor[122680], Actor[122680], 492295 )
	AddBuff( Actor[122680], 624290, 0, -1 )
	--�N��&�d�Ժ� �X������ �ɵY��ᴵ
--	SetPosByFlag( Actor[122686], 781248, 5 )
--	SetPosByFlag( Actor[122685], 781248, 4 )
	Show( Actor[122685], RoomID )
	Show( Actor[122686], RoomID )
	SetDefIdleMotion( Actor[122685], ruFUSION_MIME_JUMP_LOOP )		--���N��O������
	SetDefIdleMotion( Actor[122686], ruFUSION_MIME_JUMP_LOOP )		--���d�Ժ��O���q�Ѧӭ����۫�
	--
	x, y, z, dir = DW_Location( 781248, 6 )
	MoveDirect( Actor[122686], x, y, z )
	sleep(25)
	SetPos( Actor[122686], x, y, z, dir )
	AdjustFaceDir( Actor[122686], Actor[122680], 0 )
	PlayMotion( Actor[122686], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	SysCastSpellLv( Actor[122686], Actor[122686], 492296, 0 )			--�d�Ժ��I����n			
	Say( Actor[122686], "[SC_Z26_Q426312_14]" )
	Sleep( 5 )
	SetDefIdleMotion( Actor[122686], ruFUSION_MIME_IDLE_COMBAT_2H )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	SetDefIdleMotion( Actor[122685], ruFUSION_MIME_RUN_FORWARD )		--���N��}�l���U��
	x, y, z, dir = DW_Location( 781248, 7 )
	Move( Actor[122685], x, y, z )
	--
	AdjustFaceDir( Actor[122680], Actor[122686], 0 )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[122680], "[SC_Z26_Q426312_15]" )
	Sleep( 25 )
	--
	SetDefIdleMotion( Actor[122685], ruFUSION_MIME_IDLE_STAND )		--�N�����ӭ���w�I�F ��ʧ@�զ^��
	AdjustFaceDir( Actor[122685], Actor[122680], 0 )
	--
	Say( Actor[122680], "[SC_Z26_Q426312_16]" )	
	CastSpell( Actor[122680], Actor[122680], 492295 )
	Sleep( 15 )
	MagicInterrupt( Actor[122680] )
	Sleep( 15 )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_HURT_NORMAL )
	Sleep( 5 )
	Say( Actor[122680], "[SC_Z26_Q426312_17]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Sleep( 25 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	CancelBuff( Actor[122680], 624290 )
	AddBuff( Actor[122680], 624289, 0, -1 )
	Say( Actor[122680], "[SC_Z26_Q426312_18]" )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep( 35 )
	--
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_HURT_NORMAL )
	SetDefIdleMotion( Actor[122680], ruFUSION_MIME_SLUMBER )
	Sleep( 5 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	CancelBuff( Actor[122680], 624289 )
	AddBuff( Actor[122680], 624290, 0, -1 )
	Say( Actor[122680], "[SC_Z26_Q426312_19]" )
	Sleep( 15 )
	PlayMotion( Actor[122680], ruFUSION_ACTORSTATE_DYING )
	SetDefIdleMotion( Actor[122680], ruFUSION_MIME_DEATH_LOOP )
	Sleep( 13 )
	--
	x, y, z, dir= DW_Location( Actor[122680] )
	SetPos( Actor[122682], x, y, z, dir )
	SetDefIdleMotion( Actor[122682], ruFUSION_MIME_CROUCH_LOOP )
	Show( Actor[122682], RoomID )
	CancelBuff( Actor[122680], 624290 )
	AddBuff( Actor[122682], 624289, 0, -1 )
	Sleep( 20 )
	Say( Actor[122682], "[SC_Z26_Q426312_20]" )
	DelObj( Actor[122680] )
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	PlayMotion( Actor[122682], ruFUSION_ACTORSTATE_CROUCH_END )
	SetDefIdleMotion( Actor[122682], ruFUSION_MIME_IDLE_STAND )
	Say( Actor[122682], "[SC_Z26_Q426312_21]" )
	Sleep( 50 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--======================
	for i = 1, #ActPlayerTable do		--�缾�a���B�z
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548216, 1 )	--�����U�@�ӥ��Ȫ����n���~
		CancelBuff( PlayerID, BuffID )	--�R��Client�㹳��buff
		--�����@��bgm �^�_�쥻��bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	for i = 122682, 122686 do
		DelObj( Actor[i] )
	end
	DelObj( Actor[122680] )
end

function Z26_FN_Q426312_Spell502111_Hit()
	local Tar = TargetID()
	
	if CheckBuff( Tar, 623824 ) == true then
		return true
	elseif ReadRoleValue( Tar, EM_RoleValue_OrgID ) == 122684 then
		return true
	elseif ReadRoleValue( Tar, EM_RoleValue_OrgID ) == 122733 then
		return true
	end
	return false
end

--=======================
--	�}���G�ʦL����
--	122657 ���عp�i��
--				EM_RoleValue_Register+1	������t�O�_�b�i�椤�A"0"=�_�A"1"=�O�A"2"=�Y�N�}�l
--=======================
function Z26_FN_122657_Talk_Main()	--122657 ���عp�i���A��ܼ@��
	local Player = OwnerID()
	local NPC = TargetID()
	
--	if CheckAcceptQuest( Player, 426312 ) == true then
	--�ˬd�O�_�������ȡA�����~��ܪ�t�Ϊ����
		AddSpeakOption( Player, NPC, "[SC_424532_4]", "FN_Quest_Acting_plot(426316, 623824, \"Z26_FN_Q426316_Act_Main\")", 0 )
		--��ܿﶵCALL���禡�A�N�J�ѼƭY���r��h�ϥ� \" �e�᧨�_��
		--�t�X�q�αƶ��禡�ϥΡA�o��@�w�n�N�J�D�n��t��function�r��
--	else
--		SetSpeakDetail( Player, "[SC_Z26_Q426312_0]" )
--	end
end

--
function Z26_FN_Q426316_Act_Main( ActPlayerTable, NPC )
	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local Actor = {}
	--local NPCTable = SearchRangeNPC( NPC, 200 )
	local BuffID = 623824
	local QuestID = 426316
	local PlayMusic = "music/dungeon/the_gates_of_hell.mp3"
	local x, y, z, dir = DW_Location( NPC )
	--�ѷӺX�г�781248�A10~15��m�A�гy�t��NPC
	for i = 10, 15 do
		local ActorID = 122721+i
		local x, y, z, dir = DW_Location( 781248, i )
		Actor[ActorID] = CreateObj( ActorID, x, y, z, dir, 1 )
		--
		MoveToFlagEnabled( Actor[ActorID], false )
		AddToPartition( Actor[ActorID], RoomID )
		--�Ыؤ���A�o��O��t�����@�ǳB�z
		if ActorID == 122736 or ActorID == 122735 or ActorID == 122731 then	--�N�� / �d�Ժ� / �ɵY��ᴵ �S�O�B�z
			Hide( Actor[ActorID] )
			SetModeEx( Actor[ActorID], EM_SetModeType_Gravity, false )	--�@�����|�B�šA�ҥH�������O
			WriteRoleValue( Actor[ActorID], EM_RoleValue_IsWalk, 0 )
			addbuff( Actor[ActorID], 506984, 1, -1 )
		end
	end
	--��ݪ�t���a���B�z
	local MusicID = {}
	for i = 1, #ActPlayerTable do		--����Client�@���һݭn���P�_��buff
		local PlayerID = ActPlayerTable[i]
		AddBuff( PlayerID, BuffID, 0, -1 )
		--���񭵼֬����B�z
		Lua_StopBGM( PlayerID )		--����a�I�����֪�����
		MusicID[PlayerID] = PlayMusicToPlayer( PlayerID, PlayMusic, true )
	end
	--==========================�D�n��t�}�l==========================
	Sleep( 20 )
	--//
	Say( Actor[122732], "[SC_Q426316_5]" )				--"���S�J�����A�ЧA���T�{�@�U..."
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(30)
	--//
	Say( Actor[122734], "[SC_Q426316_6]" )				--"���L�N�O�o�I�p��..."
	PlayMotion( Actor[122734], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	--
	x, y, z, dir = DW_Location( 781248, 16 )
	Move( Actor[122734], x, y, z )
	Sleep(30)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122734], ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Say( Actor[122734], "[SC_Q426316_7]" )				--"�n�O���ӯ䧬�S�X�ӧ@��..."
	Sleep(30)
	--// ���عp�i���ˤU �Ы��ɵY��ᴵ
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_DYING )
	SetDefIdleMotion( Actor[122732], ruFUSION_MIME_DEATH_LOOP )
	Sleep( 5 )
	SetDefIdleMotion( Actor[122731], ruFUSION_MIME_CROUCH_LOOP )
	Show( Actor[122731], RoomID )
	Say( Actor[122731], "[SC_Q426316_9]" )				--"��H�A�Q��ˤ��d���H"
	AddBuff( Actor[122731], 624290, 0, -1 )
	Sleep( 10 )
	Hide( Actor[122732] )
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_CROUCH_END )
	SetDefIdleMotion( Actor[122731], ruFUSION_MIME_IDLE_STAND )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--// �ɵY��ᴵ�缾�a�򼯷�J�I�k�i�j
	PlayMotion( Actor[122733], ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Actor[122733], "[SC_Q426316_8]" )				--"�p�ߡI"
	Sleep( 5 )
	AdjustFaceDir( Actor[122731], Actor[122733], 0 )
	Say( Actor[122731], "[SC_Q426316_10]" )				--"�N�I����J�A�A�`�O�p���h��..."
	CastSpell( Actor[122731], Actor[122731], 492297 )
	Sleep( 20 )
	--//
	AdjustFaceDir( Actor[122734], Actor[122731], 0 )
	SetDefIdleMotion( Actor[122734], ruFUSION_MIME_IDLE_COMBAT_2H )
	Say( Actor[122734], "[SC_Q426316_10_1]" )				--"�ɵY��ᴵ�I"
	Sleep( 5 )
	AdjustFaceDir( Actor[122731], Actor[122734], 0 )
	CastSpell( Actor[122731], Actor[122734], 492304 )			--�ɵY��ᴵ�������S�J����
	Say( Actor[122731], "[SC_Q426316_10_2]" )				--"�n���F�I�A�o���Ѥ��s�I"
	Sleep( 20 )
	Say( Actor[122734], "[SC_Q426316_8_1]" )				--"�c�ڰڰڡI"
	PlayMotion( Actor[122734], ruFUSION_ACTORSTATE_HURT_NORMAL )
	SetDefIdleMotion( Actor[122734], ruFUSION_MIME_CROUCH_LOOP )
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_CUTE3 )
	Say( Actor[122731], "[SC_Q426316_11]" )				--"�u�O�i�d��...���S�J����..."
	Sleep(30)
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say( Actor[122731], "[SC_Q426316_12]" )				--"�٬O���A�A���@�������H���L�H"
	Sleep(20)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say( Actor[122731], "[SC_Q426316_12_1]" )				--"�u�]���L�O���ů��ϡA�s�ڪ���ɪ̩ҥH�~���o��ť�q���H"
	Sleep(30)
	--//
	Say( Actor[122734], "[SC_Q426316_13]" )				--"�A......"
	ScriptMessage( Actor[122734], 0, 3, "[SC_Q426316_13_1]", 0 )		--(���S�J�����¦a�W�f�F�@�f�A��)
	Sleep(25)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	Say( Actor[122734], "[SC_Q426316_13_2]" )				--"���٦��@���b�n��A��..."
	Sleep(25)
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say( Actor[122731], "[SC_Q426316_14]" )				--"�A�]�Ӥj��p�ǤF�a�I"
	Sleep(32)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	Say( Actor[122734], "[SC_Q426316_14_1]" )				--"�p...�I"
	Sleep(15)
	--//
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122731], "[SC_Q426316_15]" )				--"��F...�ڰ��W�N�|���A��L�λE�F�I"
	Sleep(25)
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	CastSpell( Actor[122731], Actor[122731], 492305 )
	AddBuff( Actor[122731], 624290, 0, -1 )
	--// �N��&�d�Ժ� �X������ �ɵY��ᴵ
	Show( Actor[122736], RoomID )	--�N��D��J��
	Show( Actor[122735], RoomID )	--�d�Ժ��D�d�ĩi
	SetDefIdleMotion( Actor[122736], ruFUSION_MIME_JUMP_LOOP )		--���N��O������
	SetDefIdleMotion( Actor[122735], ruFUSION_MIME_JUMP_LOOP )		--���d�Ժ��O���q�Ѧӭ����۫�
	--
	x, y, z, dir = DW_Location( 781248, 17 )
	MoveDirect( Actor[122735], x, y, z )
	sleep(25)
	SetPos( Actor[122735], x, y, z, dir )
	AdjustFaceDir( Actor[122735], Actor[122731], 0 )
	SetDefIdleMotion( Actor[122735], ruFUSION_MIME_IDLE_COMBAT_2H )
--	Say( Actor[122735], "[SC_BELLATIADUPLICATION_FOURTH_BOSS_21]" )	--"�Ӧۻ��j�����C��... �����ĺ�..."
	sleep( 5 )
	CastSpell( Actor[122735], Actor[122731], 492306 )
	sleep( 5 )
	Say( Actor[122731], "[SC_Q426316_16_1]" )					--"�S�O�A�I"
	Sleep( 20 )
	Say( Actor[122735], "[SC_Q426316_17]" )					--"�b�Ƨa�I"
	Sleep( 20 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	Say( Actor[122731], "[SC_Q426316_18]" )					--"�A......�I�ڡI"
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_HURT_NORMAL )
	Sleep( 15 )
	--// �ɵY��ᴵ�ˤU �Ыب��عp�i�� �N�୸�U��
	PlayMotion( Actor[122731], ruFUSION_ACTORSTATE_DYING )
	SetDefIdleMotion( Actor[122731], ruFUSION_MIME_DEATH_LOOP )
	Sleep( 10 )
	--���N��o�ɭ��U��
	SetDefIdleMotion( Actor[122736], ruFUSION_MIME_RUN_FORWARD )
	x, y, z, dir = DW_Location( 781248, 18 )
	MoveDirect( Actor[122736], x, y, z )
	--��
	SetDefIdleMotion( Actor[122732], ruFUSION_MIME_CROUCH_LOOP )
	Show( Actor[122732], RoomID )
	Sleep( 10 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--���N�௸����s����
	SetPos( Actor[122736], x, y, z, dir )
	AdjustFaceDir( Actor[122736], Actor[122734], 0 )
	--��
	DelObj( Actor[122731] )
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_CROUCH_END )
	SetDefIdleMotion( Actor[122732], ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion( Actor[122734], ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion( Actor[122735], ruFUSION_MIME_IDLE_STAND )
	SetDefIdleMotion( Actor[122736], ruFUSION_MIME_IDLE_STAND )
	Sleep( 10 )
	--//
	for i = 1, #ActPlayerTable do		--�缾�a���B�z
		local PlayerID = ActPlayerTable[i]
		CancelBuff( PlayerID, 622004 )	--�R���w��
	end
	--//
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122732], "[SC_Q426316_19]" )					--"�ڤӤj�N�F..."
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Actor[122732], "[SC_Q426316_19_1]" )					--"���§A�A�d�Ժ��D�d�ĩi..."
	Sleep( 32 )
	--//
	Say( Actor[122734], "[SC_Q426316_19_2]" )					--"�ڻ��A���عp�i���A�A�N���ઽ�����F���䧬�ܡH"
	Sleep( 30 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--//
	PlayMotion( Actor[122732], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( Actor[122732], "[SC_Q426316_20]" )					--"���A�{�b�٤���..."
	Sleep( 50 )
	--==
	ActPlayerTable = FN_Quest_Acting_PlayerWatchShow( ActPlayerTable, NPC, BuffID, MusicID, QuestID )
	--==
	--==========================�D�n��t����==========================
	for i = 1, #ActPlayerTable do		--�缾�a���B�z
		local PlayerID = ActPlayerTable[i]
		SetFlag( PlayerID, 548221, 1 )	--�����U�@�ӥ��Ȫ����n���~
		CancelBuff( PlayerID, BuffID )	--�R��Client�㹳��buff
		--�����@��bgm �^�_�쥻��bgm
		StopSound( PlayerID, MusicID[PlayerID] )
		Lua_PlayBGM( PlayerID )
	end
	for i = 122731, 122736 do
		DelObj( Actor[i] )
	end
end