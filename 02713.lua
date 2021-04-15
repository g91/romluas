---------------------------------------------------------
--		NPC���			--
---------------------------------------------------------
--StageManager	EM_RoleValue_Register1 = �O�����W�H��
--			EM_RoleValue_Register2 = �O�����W��
--			EM_RoleValue_Register9 = �O���i���i�H�Ұ�	0��ܥi�H 1��ܪ��a�D�Ԥ� 2���NPC��t��
--			EM_RoleValue_Register10 = �O����t���A	0��ܨS��  -1��ܬD�ԥ��� -2��ܪ��a���~���W
--
--Player		EM_RoleValue_Register7 = �ΨӬ������a����
--			EM_RoleValue_Register8 = �P�_���a�O�_���� 0 ����٨S 1��ܵ���
--			EM_RoleValue_Register9 = �b���a���W�O���{�b�O�_����L�t�X, �g��1��ܸӥL�F
--			EM_RoleValue_Register10 = �O�����a�{�b���ӻ����y�x��


function FN_FairyTale2012_StageManager()	--�_�l���
	--OwnerID = ���a
	--TargetID = NPC
	local StageManager = TargetID()
	local Player = OwnerID()
	local Enable = ReadRoleValue(StageManager, EM_RoleValue_Register9)
	
	if Enable == 1 then
		SetSpeakDetail(Player,"[FN_FAIRYTALE2012_SPEAKUNABLE]")
	elseif CheckFlag(Player, 541322) == true then
		SetSpeakDetail(Player,"[FN_FAIRYTALE2012_ALREADYPLAY]")
	else
		SetSpeakDetail(Player,"[FN_FAIRYTALE2012_SPEAK01]")
		AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER02]","FN_FairyTale2012_Register",0)
	end
	if Enable == 0 then	--NPC���b��t���B���a�]�S���D�Ԥ� �~��ܦ��ﶵ
		AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER05]","FN_FairyTale2012_NPCActor",0)	--�ڷQ�ݱm��
	end
	AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER01]","FN_FairyTale2012_Rule",0)
end

function FN_FairyTale2012_Rule()	--�����W�h
	local StageManager = TargetID()
	local Player = OwnerID()

	SetSpeakDetail(Player,"[FN_FAIRYTALE2012_RULE]")
end

function FN_FairyTale2012_Register()	--�߰ݳ��W
	local StageManager = TargetID()
	local Player = OwnerID()

	SetSpeakDetail(Player,"[FN_FAIRYTALE2012_SPEAK02]")
	AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER03]","FN_FairyTale2012_SingleActor",0)
	AddSpeakOption(Player,StageManager,"[FN_FAIRYTALE2012_STAGEMANAGER04]","FN_FairyTale2012_PartyActor",0)
end

function FN_FairyTale2012_SingleActor()	--�M�w���
	local StageManager = TargetID()
	local Player = OwnerID()

	WriteRoleValue(StageManager, EM_RoleValue_Register1, 1)
	WriteRoleValue(StageManager, EM_RoleValue_Register2, Player)
	CallPlot(StageManager, "FN_FairyTale2012_Show")
	--
	WriteRoleValue(StageManager, EM_RoleValue_Register10, -2)	--��ܪ��a���~���W ���_NPC��t
	CloseSpeak(Player)
end

function FN_FairyTale2012_PartyActor()		--�M�w�α�
	local StageManager = TargetID()
	local Player = OwnerID()
	local PartyNum = GetPartyID(Player , -1)
	if PartyNum > 4 then PartyNum = 4 end	--���a����W�L4�H�h�]�w���̤j4�H�A�H�K�X��

	if PartyNum == 0 then
		ScriptMessage( StageManager , Player , 1, "[FN_FAIRYTALE2012_NOTTEAM]", 0 )
	else
		WriteRoleValue(StageManager, EM_RoleValue_Register1, PartyNum)
		WriteRoleValue(StageManager, EM_RoleValue_Register2, Player)
		CallPlot(StageManager, "FN_FairyTale2012_Show")
	end
	WriteRoleValue(StageManager, EM_RoleValue_Register10, -2)	--��ܪ��a���~���W ���_NPC��t
	CloseSpeak(Player)
end

function FN_FairyTale2012_NPCActor()		--�M�wNPC����
	local StageManager = TargetID()
	local Player = OwnerID()
	local PartyNum = GetPartyID(Player , -1)

	WriteRoleValue(StageManager, EM_RoleValue_Register1, 0)
	--WriteRoleValue(StageManager, EM_RoleValue_Register2, Player)
	CallPlot(StageManager, "FN_FairyTale2012_Show")
	CloseSpeak(Player)
end
---------------------------------------------------------
--		���ʥD��			--
---------------------------------------------------------
function FN_FairyTale2012_Show()		
	local StageManager = OwnerID()

	local PartyNum = ReadRoleValue(StageManager, EM_RoleValue_Register1)	--�O�����a�ѥ[���H��, ���K��@�P�_�o����t�O���a�����٬ONPC��t
	local Register = ReadRoleValue(StageManager, EM_RoleValue_Register2)	--�O�����W�����a
	local StageActor = FN_FairyTale2012_SetActor(PartyNum, Register)		--�w�Ưu���W�x���t��

	local ActorStepNum = 0
	local ActorStep ={1, 4, 3, 4, 2, 3, 1, 2, 4, 2, 1, 3, 4, 2, 4, 1, 3, 2, 3, 1, 2, 1, 4, 3} 	--�t���n�O����

--	if ReadRoleValue(StageManager, EM_RoleValue_Register9) == 2 then		--EM_RoleValue_Register9 == 2 ���NPC��t���A���_���j1���sCallPlot����m�ƳQ���\���_
--		Sleep(10)
--		CallPlot(StageManager, "FN_FairyTale2012_Show")
--		return
--	else
		WriteRoleValue(StageManager, EM_RoleValue_Register10, 0)		--���]��t�����A�ˬd	0��ܨS�� -1��ܪ��a��t����
		if PartyNum == 0 then
			WriteRoleValue(StageManager, EM_RoleValue_Register9, 2)	--NPC�m�Ƥ�
		else
			WriteRoleValue(StageManager, EM_RoleValue_Register9, 1)	--��NPC�g����t�����n���쥴�Z
		end

--	end


	--�x��
	local LinesTable = {}		--�x��
	for i=1,4 do			--�C�y�x����l�]�w
		LinesTable[i] = {}
		for y=1,6 do
			LinesTable[i][y] = "[".."FN_FAIRYTALE2012_STRING0"..i.."_0"..y.."]"
		end
	end
	local LinesNum = {0, 0, 0, 0}	--�O���C�Ӻt���n���ĴX�y�x��
	--
	while true do
		ActorStepNum = ActorStepNum + 1		--�t���B�J
		local ActorWho = ActorStep[ActorStepNum]	--�ĴX���W���t��, �o��local�º�O��K�\Ū
		--�ǥ��B�~�B�z
		if ActorStepNum == 1 or ActorStepNum == 14 then
			FN_FairyTale2012_Aside(StageManager, ActorStepNum)
		end
		--�i���t
		LinesNum[ActorWho] = LinesNum[ActorWho] + 1
		FN_FairyTale2012_ActorCheck(StageActor[ActorWho] , LinesTable[ActorWho][LinesNum[ActorWho]], LinesNum[ActorWho]+1, StageManager)
		--
		Sleep(45)
		--�ˬd��t�O���O�t���B���ѩάO���_
		if ActorStepNum == 24 or ReadRoleValue(StageManager, EM_RoleValue_Register10) == -1 or ReadRoleValue(StageManager, EM_RoleValue_Register10) == -2 then
			FN_FairyTale2012_Finish(StageManager, PartyNum, StageActor, ActorStepNum)
			return
		end
	end
end
---------------------------------------------------------
--		�C�B�J�t������			--
---------------------------------------------------------
function FN_FairyTale2012_ActorCheck(Actor, Line, LinesNum, StageManager)	--�C������t���ɰ���o��
--�Ѽ�1 = �n�O���t�� , �Ѽ�2 = �n�����x��, �Ѽ�3 = �x�����X, �Ѽ�4 = �R�O�g�z
	local time = 0

	if ReadRoleValue(Actor, EM_RoleValue_IsNPC) == 0 then	--�p�G�n�O���O���a
		WriteRoleValue(Actor, EM_RoleValue_Register8, 0)		--Register8 �P�_���a�O�_���� 0 ����٨S 1��ܵ���
		WriteRoleValue(Actor, EM_RoleValue_Register9, 1)		--�b���a���W�O���{�b�O�_����L�t�X, �g��1��ܸӥL�F
		WriteRoleValue(Actor, EM_RoleValue_Register10, LinesNum)	--�O�����a�{�b���ӻ����y�x��
	end

	while true do	--�j���ˬd���a��t���A
		if ReadRoleValue(Actor, EM_RoleValue_Register8) == 1 or ReadRoleValue(Actor, EM_RoleValue_IsNPC) == 1 then	--��ܪ��a����F / �άO�t���ONPC
			PlayMotion( Actor,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			Say(Actor, Line)	--����F�N���L���x��
			--
			FN_FairyTale2012_ScoreCount(Actor, time)
			WriteRoleValue(Actor, EM_RoleValue_Register9, 0)	--�b���a���W�O���{�b�O�_����L�t�X, �g��0��ܲ{�b���O�L�ӤW��
			return
		else
			if time == 100 then	--�W�L�ɶ� ����
				WriteRoleValue(StageManager, EM_RoleValue_Register10, -1)
				return
			elseif time == 65 then	--�Ӵ������a�F
				Tell( Actor, StageManager, "[FN_FAIRYTALE2012_TELL]" )
			end
		end
		--
		Sleep(5)
		time = time + 5
	end
end
---------------------------------------------------------
--		���a���x���ޯ�			--
---------------------------------------------------------
function FN_FairyTale2012_ActorSay()
	local Actor = OwnerID()
	local IsMe = ReadRoleValue(Actor, EM_RoleValue_Register9)	--�P�_�{�b�O�_���쪱�a�t�X, �g��1��ܸӥL�F
	local WhatLines = ReadRoleValue(Actor, EM_RoleValue_Register10)	--�P�_�n�����y�x��

	--EM_RoleValue_Register7 �ΨӬ������a����

	if IsMe == 1 then
		WriteRoleValue(Actor, EM_RoleValue_Register8, 1)	--Register8 �P�_���a�O�_���� 0 ����٨S 1��ܵ���
	else
		local Score = ReadRoleValue(Actor, EM_RoleValue_Register7)
		ScriptMessage( Actor, Actor, 1, "[FN_FAIRYTALE2012_WRONG]", 0 )
		if Score >= 60 then
			WriteRoleValue(Actor, EM_RoleValue_Register7, Score-60)
		else
			WriteRoleValue(Actor, EM_RoleValue_Register7, 0)
		end
	end
	
end
---------------------------------------------------------
--		���a�x������&���ƭp��	--
---------------------------------------------------------
function FN_FairyTale2012_ScoreCount(Actor, time)
	if ReadRoleValue(Actor, EM_RoleValue_IsNPC) == 1 then return end	--NPC�����
	--
	local ScoreString
	local BaseScore = 100
	local NowScore = ReadRoleValue(Actor, EM_RoleValue_Register7)
	local TimeTable = {10, 30, 60, 100}
	local StringTable = {"[FN_FAIRYTALE2012_SCORESTRING_10]", "[FN_FAIRYTALE2012_SCORESTRING_40]", "[FN_FAIRYTALE2012_SCORESTRING_60]", "[FN_FAIRYTALE2012_SCORESTRING_100]"}
	
	for i=1, table.getn(TimeTable) do	--�H���a��O���ɶ��ӧP�_�������a��غ��g
		if time <= TimeTable[i] then 
			ScoreString = StringTable[i] 
			ScriptMessage( Actor, Actor, 2, ScoreString, C_SYSTEM )
			break
		end
	end
	--
	if time <= 10 then BaseScore = 150 end	--���a��{�W�n���ܡA��¦���ƴ���
	NowScore = NowScore + (BaseScore - time)
	WriteRoleValue(Actor, EM_RoleValue_Register7, NowScore)	--Register7 �O�����a����

end
---------------------------------------------------------
--		�t�X���a�]�w			--
---------------------------------------------------------
function FN_FairyTale2012_SetActor(PartyNum, Register)	--�Ѽ�1 = �X�Ӫ��a�ѻP����, �Ѽ�2 = ���W��ID
	local StageManager = OwnerID()
	local RoomID = ReadRoleValue(StageManager, EM_RoleValue_RoomID)
	local NpcActor = {121156,121157,121158,121159}	--NPC�t����
	local StageActor = {0, 0, 0, 0}
	local ActorWhoString = {"[FN_FAIRYTALE2012_ACTORWHO1]","[FN_FAIRYTALE2012_ACTORWHO2]","[FN_FAIRYTALE2012_ACTORWHO3]","[FN_FAIRYTALE2012_ACTORWHO4]"}
	if PartyNum == 1 then	--��H
		local who =DW_Rand(4) 
		StageActor[who] = Register
	elseif PartyNum > 1 then	--�h�H
		local ActorPlace = DW_Rand(4)
		for i = 1, PartyNum do
			if ActorPlace > 4 then ActorPlace = 1 end
			local who = 5-ActorPlace
			StageActor[who] = GetPartyID(Register , i)
			--
			ActorPlace = ActorPlace +1
		end
	end
	for i = 1, table.getn(StageActor) do	
		if StageActor[i] == 0 then	--NPC�ɤW�S�H����m
			StageActor[i] = CreateObjByFlag( NpcActor[i], 781179, i, 1 )
			AddToPartition( StageActor[i], RoomID )
			DisableQuest(StageActor[i], true)
		else				-- �O���a���ܧ@�@�ǳ]�w
			WriteRoleValue(StageActor[i], EM_RoleValue_Register7, 0) 			--�⪱�a�����ƭ��]��0
			SetPosByFlag( StageActor[i], 781179, i )						--�⪱�a�ǰe��t�X��m
			AddBuff(StageActor[i], 501043, 0, 250)						--�����a���ʥ�Buff
			Tell( StageActor[i], StageManager, ActorWhoString[i] )				--�i�D���a�L�t��
			ScriptMessage( StageManager, StageActor[i], 2, ActorWhoString[i], C_SYSTEM )	--�i�D���a�L�t��
		end
	end

	return StageActor
end
---------------------------------------------------------
--		�t�X����			--
---------------------------------------------------------
function FN_FairyTale2012_Finish(StageManager, PartyNum, StageActor, ActorStepNum)
	if ReadRoleValue(StageManager, EM_RoleValue_Register10) == -1 then	--�t�X���ѩάO�Q���_
		PlayMotion( StageManager,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Say(StageManager, "[FN_FAIRYTALE2012_SHOWBREAK]")
	elseif ReadRoleValue(StageManager, EM_RoleValue_Register10) == -2 then
		PlayMotion( StageManager,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Say(StageManager, "[FN_FAIRYTALE2012_SHOWJOIN]")	
	elseif ActorStepNum == 24 then
		Say(StageManager, "[FN_FAIRYTALE2012_FINISH03]")
		PlayMotion( StageManager,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
		Sleep(25)
		if PartyNum ~= 0 then	--�ݳo���t�X�O�����a�ѻP�٬ONPC����
			Say(StageManager, "[FN_FAIRYTALE2012_FINISH01]")
		else
			Say(StageManager, "[FN_FAIRYTALE2012_FINISH02]")			
		end
	end
	----
	local ScorePartyBonus = {10, 12, 14, 16}	--�ն��ѥ[�����Ƽ��y���v
	local ScoreTable = {1999, 4000, 8000, 10000, 11000, 12000, 13000, 15000}
	local TitleCheck = true

	for i=1,table.getn(StageActor) do
		if ReadRoleValue(StageActor[i], EM_RoleValue_IsPlayer) == 1 then
			local PlayerScore = ReadRoleValue(StageActor[i], EM_RoleValue_Register7)
			PlayerScore = PlayerScore * ScorePartyBonus[PartyNum]
			if ActorStepNum == 24 and ReadRoleValue(StageManager, EM_RoleValue_Register10) ~= -1 then PlayerScore = PlayerScore + 125 end
			ScriptMessage( StageActor[i], StageActor[i], 2, "[FN_FAIRYTALE2012_GOTSCORE][$SETVAR1="..PlayerScore.."]", C_SYSTEM )
			ScriptMessage( StageActor[i], StageActor[i], 0, "[FN_FAIRYTALE2012_GOTSCORE][$SETVAR1="..PlayerScore.."]", C_SYSTEM )
			CancelBuff(StageActor[i], 501043)
			--
			if PlayerScore <13850 then TitleCheck = false end	--�ٸ����e�ˬd
			--
			if CheckFlag(StageActor[i], 541322) == false then
				for h=1,7 do
					if  PlayerScore > ScoreTable[h] and PlayerScore <= ScoreTable[h+1] then
						SetFlag(StageActor[i], 541322, 1)	--�C��X��
						GiveBodyItem(StageActor[i], 240059, h)
						Lua_Festival_08_All(StageActor[i])	--����
						break
					end
				end
			end
		else
			DelObj(StageActor[i])
		end
	end
	WriteRoleValue(StageManager, EM_RoleValue_Register9, 0)	--���R�x�g�z�ܬ��i�H�Ұ�
	--���úٸ�
	if TitleCheck == true and  PartyNum == 4 then
		for i=1,table.getn(StageActor) do
			GiveBodyItem( StageActor[i], 530793, 1 )
		end
	end
end

---------------------------------------------------------
--		�ǥ�				--
---------------------------------------------------------
function FN_FairyTale2012_Aside(StageManager, ActorStepNum)
	PlayMotion( StageManager,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	if ActorStepNum == 1 then
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE01_1]")
		Sleep(40)
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE01_2]")
	elseif ActorStepNum == 14 then
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE02]")
		Sleep(40)
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE03]")
		Sleep(40)
		Say(StageManager, "[FN_FAIRYTALE2012_ASIDE04]")
	end
	Sleep(50)
end

---------------------------------------------------------
--		���ի��O				--
---------------------------------------------------------
function FN_FairyTale2012_Cheat(cheat)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register7, cheat)
end

