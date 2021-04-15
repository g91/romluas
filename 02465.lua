function LuaS_Z21_SaceMonderDead_SetSpeak()--�ɦ�X�w����
	local T_ID = TargetID() --�ɦ�X�w(A1)
	local O_ID = OwnerID() --���a
	local QuestID = 424065				--���Ƚs��
	
	if CheckAcceptQuest( O_ID, QuestID ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then --�ˬd���a�O�_������ �åB�{�b�O�_���b�t��
		SetSpeakDetail( O_ID, "[SC_424065_A]" ) --�еy���ڤ@�U�C   (���b�t�����p�U �����i��)
	elseif CheckAcceptQuest( O_ID, QuestID ) == true and CheckFlag(O_ID,545512)==false then
		SetSpeakDetail( O_ID, "[SC_424065_B]" ) --�A�ǳƦn�F�ܡH (�i�H�t�����p�U �����i��)
		AddSpeakOption( O_ID, T_ID, "[SC_424065_C]", "LuaS_Z21_SaceMonderDead",0) --�ڷǳƦn�F�C (���a�T�w�n�}�l�t��)
	else
		LoadQuestOption( O_ID )
	end
end

function LuaS_Z21_SaceMonderDead()--�}�l�t
	local T_ID = TargetID() --�ɦ�X�w(A1)
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )--������ܵ���
	ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_424065_D]", "0xffffff80" )
	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )--�W�� ��ܥ��b�t��
	BeginPlot( T_ID, "LuaS_Z21_SaceMonderDead_Start", 0 )--����t��
end

function LuaS_Z21_SaceMonderDead_Start()--�}�l�t
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local O_ID = OwnerID()				--���bNPC���W���t���@��
	local QuestID = 424065				--���Ƚs��
	local FinishFlagID = 545512			--����������o���X��
	local CheckBuffID = 620674			--�ˬd�O�_���b�t����BUFF
	local CheckRange = 250			--�t�����ˬd�d��
	local ActorArray = {}				--(�s���ק�)�t���}�C��
	local player = {};				--�ŦX���󪱮a
	local FlagID = 781004				--�X��ID
	-- �ƥ���Ҧ��|�Ψ쪺�t�첣�ͥX�� �i�H��AddToPartition(�u�ݭnGUID)
	ActorArray[1] = CreateObjByFlag( 119167, FlagID, 1, 1 ) --�ɦ�X�w(A2)
	ActorArray[2] = CreateObjByFlag( 119165, FlagID, 2, 1 ) --���{����(B2)
	local allplayer = SearchRangePlayer ( O_ID , CheckRange )	
	for i=0, table.getn(allplayer)-1 do--�ŦX���� �����t����Buff
		
		--	Say(allplayer[i],"123456789")
		if	CheckID(allplayer[i]) == true and  
			CheckAcceptQuest( allplayer[i], QuestID ) == true and 
			CheckBuff( allplayer[i], CheckBuffID ) ~= true and 
			CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			table.insert( player, allplayer[i] )
		--	SetPosByFlag( allplayer[i] , FlagID , 0 );
		--	Say(allplayer[i],"987654321")
		end
	end

	CallPlot( OwnerID(), "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--�d������Ϊ��ˬd�禡
	sleep(10)
	
	--�t����
	AddToPartition( ActorArray[1], 0 );
	NPCSay( ActorArray[1], "[SC_Z21_424595_1]")--�ɦ�X�w(A2)���G�չ稦.......���e�Ө�o�̮ɡA�����S�`�N��o�O�ݩ�u�s���O�q�C
	Sleep(25)
	AddToPartition( ActorArray[2], 0 )
	NPCSay( ActorArray[1], "[SC_Z21_424595_2]")--�ɦ�X�w(A2)�G��ӳo�ѤO�q�Ӧ۩�u�s�A���ǡK
	PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(25)
	NPCSay( ActorArray[2], "[SC_Z21_424595_3]")--���{����(B2)�G�ڤw�gĵ�i�L�A�F�I
	PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(25)
	NPCSay( ActorArray[1], "[SC_Z21_424595_4]")--�ɦ�X�w(A2)�G���O��I�b�����ڤ��e�A�ڲq�A�|�露����D���T��������C
	PlayMotion(ActorArray[1] ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(25)
	NPCSay( ActorArray[2], "[SC_Z21_424595_5]")--���{����(B2)�G�A���ت��O����H
	Sleep(25)
	NPCSay( ActorArray[1], "[SC_Z21_424595_6]")--�ɦ�X�w(A2)�G�ڳo���h�Ū��k�v�A��঺�b�o�ǤZ�H��W�H�ڥu�D���a�����b���j���s�����U�C
	PlayMotion(ActorArray[1] ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Sleep(25)
	ChangeObjID(ActorArray[2],119166);
	ScriptMessage( ActorArray[1], 0, 1 , "[SC_Z21_424595_7]", "0xffffff80" )--�����T���G�]���{�����ܦ��s�Ρ^
	ScriptMessage( ActorArray[1], 0, 0 , "[SC_Z21_424595_7]", "0xffffff80" )--�����T���G�]���{�����ܦ��s�Ρ^
	Sleep(25)
	NPCSay( ActorArray[2], "[SC_Z21_424595_8]")--���{����(B1)�G��I���X�A���D���@���I
	Sleep(25)
	NPCSay( ActorArray[1], "[SC_Z21_424595_9]")--�ɦ�X�w(A2)�G�ڷQ�A�������٨S�ѰO�ү��箦�a�I�L�{�b���b���������y�����W�A�Ʊ�A�̨ӱo�Ϊ���L���񤸯���D�C
	PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(25)
	NPCSay( ActorArray[1], "[SC_Z21_424595_10]")--�ɦ�X�w(A2)�G�{�b�K...���ڨ��Ѥ@�U���j���s���a�I
	PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	Sleep(25)
	--���a�W�O�@��5��
	for i,v in ipairs(player) do
		if	CheckID(v) == true and  
			CheckAcceptQuest( v, QuestID ) == true and 
			CheckBuff( v, CheckBuffID ) == true and 
			GetDistance( v, ActorArray[1] ) < 200 and 
			CheckFlag( v, FinishFlagID ) ~= true then 
			ScriptMessage( v, v, 1 , "[SC_Z21_424595_12]", "0xffffff80" )--�����T���G���{�����b�A���W�I��F�O�@��
			ScriptMessage( v, v, 0 , "[SC_Z21_424595_12]", "0xffffff80" )--�����T���G���{�����b�A���W�I��F�O�@��
			AddBuff(v,620721,0,5);
		end		
	end
	--B2 �� A2�R�X�s��
	CastSpelllv(ActorArray[2],ActorArray[1],498215,0);
	PlayMotion(ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Sleep(15)
	DelObj(ActorArray[1]);
	--(�e�����ƾ_�ʦ��s���S�Į���)
	ScriptMessage( ActorArray[2], 0, 1 , "[SC_Z21_424595_11]", "0xffffff80" )--�����T���G���{�������s�����j�a������Ÿ�ʡA�O�b���Ҧ��H�����H�ӷX�A���O�ɦ�X�w�����n���Ů������@�Ѹ޲�����...
	ScriptMessage( ActorArray[2], 0, 0 , "[SC_Z21_424595_11]", "0xffffff80" )--�����T���G���{�������s�����j�a������Ÿ�ʡA�O�b���Ҧ��H�����H�ӷX�A���O�ɦ�X�w�����n���Ů������@�Ѹ޲�����...
	Sleep(25)
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) --���t���F �����X��\���~
end