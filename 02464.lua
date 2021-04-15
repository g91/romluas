function LuaS_Z21_DragonMeeting_SetSpeak()--���s�|ĳ
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a
	local QuestID = 424203				--���Ƚs��
	local FinishFlagID = 545466			--����������o���X��	

	if CheckAcceptQuest( O_ID, QuestID ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then --�ˬd���a�O�_������ �åB�{�b�O�_���b�t��
		SetSpeakDetail( O_ID, "[SC_422693_7]" ) --�еy���ڤ@�U�C   (���b�t�����p�U �����i��)
	elseif CheckAcceptQuest( O_ID, QuestID ) == true and CheckFlag( O_ID, FinishFlagID ) == false  then
		SetSpeakDetail( O_ID, "[SC_422161_22]" ) --�A�ǳƦn�F�ܡH (�i�H�t�����p�U �����i��)
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "LuaS_Z21_DragonMeeting",0) --�ڷǳƦn�F�C (���a�T�w�n�}�l�t��)
	else
		LoadQuestOption( O_ID )
	end
end

function LuaS_Z21_DragonMeeting()--�}�l�t
	local T_ID = TargetID() --����J
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )--������ܵ���
	
	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )--�W�� ��ܥ��b�t��
	BeginPlot( T_ID, "LuaS_Z21_DragonMeeting_Start", 0 )--����t��
end

function LuaS_Z21_DragonMeeting_Start()--�}�l�t
	local Ctrl = OwnerID()				
	local QuestID = 424203				--���Ƚs��
	local FinishFlagID = 545466			--����������o���X��
	local CheckBuffID = 620664			--�ˬd�O�_���b�t����BUFF
	local CheckRange = 400				--�t�����ˬd�d��
	local ActorArray = {}				--(�s���ק�)�t���}�C��
	
	local FlagID = 781003				--�X��ID
	-- �ƥ���Ҧ��|�Ψ쪺�t�첣�ͥX�� �i�H��AddToPartition(�u�ݭnGUID)
	ActorArray[1] = CreateObjByFlag( 119006, FlagID, 1, 1 ) --����J(B1)
	ActorArray[2] = CreateObjByFlag( 119007, FlagID, 2, 1 ) --���{����(A1)
	ActorArray[3] = CreateObjByFlag( 119008, FlagID, 3, 1 ) --���s����(C1)
	ActorArray[4] = CreateObjByFlag( 119009, FlagID, 4, 1 ) --�B�s�d�w����(D1)
	ActorArray[5] = CreateObjByFlag( 119398, FlagID, 5, 1 ) --�a�s���Z(E1) �s��
	
	ActorArray[6] = CreateObjByFlag( 119010, FlagID, 6, 1 ) --�a�s���Z(E1) �H��
	ActorArray[7] = CreateObjByFlag( 119399, FlagID, 7, 1 ) --���s����(C1) �s��
	ActorArray[8] = CreateObjByFlag( 119483, FlagID, 8, 1 ) --�B�s�d�w����(D1) �s��

	for i=1, 8 do
		ks_ActSetMode( ActorArray[i], true )
		if i < 6 then
			AddToPartition( ActorArray[i], 0 )
		end
	end
	--AddBuff( ActorArray[5], 620722, 0, -1 )--�s�Z�H��
	SetPos( ActorArray[5], ReadRoleValue( ActorArray[5], EM_RoleValue_X ), ReadRoleValue( ActorArray[5], EM_RoleValue_Y )+900, ReadRoleValue( ActorArray[5], EM_RoleValue_Z ), ReadRoleValue( ActorArray[5], EM_RoleValue_Dir ) )
	WriteRoleValue( ActorArray[5], EM_RoleValue_IsWalk, 0 )
	
	ks_AddBuffEx( QuestID, FinishFlagID, CheckBuffID, 150 )--�������ȥ�BUFF
	KS_QuestSetPos( QuestID, CheckBuffID, 170, ActorArray[1], 50 )--�t���Ϊ�����ǰe
	
	Sleep(30)
	CallPlot( ActorArray[1], "ks_QuestCheckEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, Ctrl  )--�d������Ϊ��ˬd�禡
	
	--�t����
	LuaS_Z21_DragonMeeting_Message( ActorArray[1], CheckRange, CheckBuffID, "[SC_Z21_424290_1]" )--�����T���G�@�}�j�P������ŧ�ӡA���j���¼v�X�{�b�Ť�......
	SetModeEx( ActorArray[5], EM_SetModeType_Gravity, false )
	SetDefIdleMotion( ActorArray[5], ruFUSION_MIME_SPIRAL_LOOP)
	PlayMotionEX( ActorArray[5], ruFUSION_ACTORSTATE_SPIRAL_LOOP , ruFUSION_ACTORSTATE_SPIRAL_LOOP)
	AddBuff( ActorArray[5], 506984, 9, -1 )--�[�t
	Sleep(10)
	KS_Move( ActorArray[5], 0, FlagID, 6 )--����
	
	local X2 = GetMoveFlagValue( FlagID , 6 , EM_RoleValue_X )
	local Y2 = GetMoveFlagValue( FlagID , 6 , EM_RoleValue_Y )
	local Z2 = GetMoveFlagValue( FlagID , 6 , EM_RoleValue_Z )
	while true do
		Sleep(15)
		local X1 = ReadRoleValue( ActorArray[5] , EM_RoleValue_X )
	 	local Z1 = ReadRoleValue( ActorArray[5] , EM_RoleValue_Z )
		local DisX = ( X2 - X1 )^2
		local DisZ = ( Z2 - Z1 )^2
		local Dis = math.floor( (DisX+DisZ)^0.5)
		if Dis < 150 then	-- ����w�I�]�w�U�@�I��m
			break
		end
	end
	
	PlayMotion( ActorArray[5], ruFUSION_ACTORSTATE_FLY_END)
	SetDefIdleMotion( ActorArray[5], ruFUSION_MIME_IDLE_STAND )
	--SetModeEx( ActorArray[5], EM_SetModeType_Gravity, true )
	sleep(20)
	StopMove( ActorArray[5], true )
	SetPos( ActorArray[5], X2, Y2+900, Z2, 0 )
	DelObj( ActorArray[5] )
	Sleep(5)
	AddToPartition( ActorArray[6], 0 )
	AdjustFaceDir( ActorArray[6], ActorArray[3], 0 )
	
	Yell( ActorArray[6], "[SC_Z21_424290_2]", 3 )--�a�s���Z(E2)�G������d�w�����|�b�o�̡H
	Sleep(20)
	Yell( ActorArray[3], "[SC_Z21_424290_3]", 3 )--���s����(C1)�G�O�ڴ�ĳ���C�J�M�l�}�|ĳ�A�N�s��쨺�Ū����@�_�Q�קa�C
	Sleep(25)	
	Yell( ActorArray[6], "[SC_Z21_424290_4]", 3 )--�a�s���Z(E2)�G��ݰ�ĳ�I�d�w�����H�ϸT�O�����P�ڡA�����I�X�N���I
	PlayMotion( ActorArray[6], ruFUSION_ACTORSTATE_EMOTE_ANGRY )--����
	Sleep(25)
	Yell( ActorArray[4], "[SC_Z21_424290_5]", 3 )--�d�w����(D1)�G�o�����L�h�I�ڭ쥻�n�����O���ӲV�媺���ءA�~����쨺�ťu�O�~�|�K
	PlayMotion( ActorArray[4], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--�n�Y
	Sleep(35)
	Yell( ActorArray[6], "[SC_Z21_424290_6]", 3 )--�a�s���Z(E2)�G���աI�Y�ϳo�ˤ]�O�P�o�A���j���s�|ĳ���w�ӻ{����J�P���u�s���@���l�I
	PlayMotion( ActorArray[6], ruFUSION_ACTORSTATE_EMOTE_ANGRY )--����
	Sleep(30)
	Yell( ActorArray[3], "[SC_Z21_424290_7]", 3 )--���s����(C1)�G���O�b�L��u�s�@�ڵ��奄�۪��e�����U�A���O���������L�M��L���V�婹�ӬƱK�K
	PlayMotion( ActorArray[3], ruFUSION_ACTORSTATE_EMOTE_SPEAK )--����
	Sleep(35)
	--(�������r�T��)���{�����G�U����N�R�@�U�A�ڭ̲{�b�����Y�����ƭn����A���H���p�e�n���񤸯���D�K
	LuaS_Z21_DragonMeeting_Message( ActorArray[1], CheckRange, CheckBuffID, "[SC_Z21_424290_8]" )
	Sleep(25)
	Yell( ActorArray[3], "[SC_Z21_424290_9]", 3 )--���s����(C1)�G���O�p���I������D�������O�����O�K���A�n���T�w���O����J������i�D�~�H�H
	PlayMotion( ActorArray[3], ruFUSION_ACTORSTATE_EMOTE_POINT )--���V
	Sleep(30)
	Yell( ActorArray[6], "[SC_Z21_424290_10]", 3 )--�a�s���Z(E2)�G����I�A���M�K
	Sleep(20)
	LuaS_Z21_DragonMeeting_Message( ActorArray[1], CheckRange, CheckBuffID, "[SC_Z21_424290_11]" )--(�������r�T��)���{�����G���F�I�o�˪������n����줰��ɭԡI
	Sleep(25)
	Yell( ActorArray[3], "[SC_Z21_424290_12]", 3 )--���s����(C1)�G���s�@�ڤ��i��M�����ê���H�@�_�X�@�I�J�O�o�ˡA�ڭ̷|�ۤv��쨺�Ǩg�k���{�A�N�L�̤Ƭ����u�I
	PlayMotion( ActorArray[3], ruFUSION_ACTORSTATE_EMOTE_ANGRY )--����
	Sleep(20)
	
	KS_Move( ActorArray[3], 0, FlagID, 7 )--���s����(c1)���}
	KS_Move( ActorArray[4], 0, FlagID, 8 )--�d�w����(d1)���}
	
	local site = { 7, 8 }
	while true do
		Sleep(10)
		local isOK = 0
		for i=1, 2 do
			if CheckID( ActorArray[i+2] ) then
				local X1 = ReadRoleValue( ActorArray[i+2] , EM_RoleValue_X )
		 		local Z1 = ReadRoleValue( ActorArray[i+2] , EM_RoleValue_Z )
		 		local X2 = GetMoveFlagValue( FlagID , site[i] , EM_RoleValue_X )
		 		local Z2 = GetMoveFlagValue( FlagID , site[i] , EM_RoleValue_Z )
				local DisX = ( X2 - X1 )^2
				local DisZ = ( Z2 - Z1 )^2
				if math.floor( (DisX+DisZ)^0.5) < 40 then
					StopMove( ActorArray[i+2], true )
					SetPos( ActorArray[i+2], X2, ReadRoleValue( ActorArray[i+2] , EM_RoleValue_Y )+500, Z2, 0 )
					-- ����w�I�]�w�U�@�I��m
					DelObj( ActorArray[i+2])
					AddToPartition( ActorArray[i+6], 0 )
					--AddBuff( ActorArray[i+2], 620722+i, 0, -1 )--���s�s��/�d�w�����s��
					CallPlot( ActorArray[i+6], "LuaS_Z21_DragonMeeting_Fly", FlagID , site[i]+2 )
				end
			else
				isOK = isOK+1
			end
		end
		if isOK >= 2 then
			break
		end
	end
	sleep(70)
	
	--���t���F
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, ActorArray[1] ) -- �����X��\���~
end

function LuaS_Z21_DragonMeeting_Message( Sayer, CheckRange, CheckBuffID, Msg )
	local player = SearchRangePlayer( Sayer, CheckRange )
	for i= 0, #player do
		if CheckBuff(player[i] , CheckBuffID ) then
			ScriptMessage( Sayer, player[i], 1 , Msg, "0xffffff80" )--�����T���G�@�}�j�P������ŧ�ӡA���j���¼v�X�{�b�Ť�......
			ScriptMessage( Sayer, player[i], 0 , Msg, "0xffffff80" )--�����T���G�@�}�j�P������ŧ�ӡA���j���¼v�X�{�b�Ť�......
		end
	end
end

function LuaS_Z21_DragonMeeting_Fly( FlagID, site )
	local Obj =OwnerID()
	--SetModeEx( Obj, EM_SetModeType_Drag, false )
	SetModeEx( Obj, EM_SetModeType_Gravity, false )
	WriteRoleValue( Obj, EM_RoleValue_IsWalk, 0 )
	PlayMotionEX( Obj, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	PlayMotion( Obj, ruFUSION_ACTORSTATE_FLY_BEGIN)
	SetDefIdleMotion( Obj, ruFUSION_MIME_SPIRAL_LOOP)
	AddBuff( Obj, 506984, 9, -1 )--�[�t
	Sleep(20)
	local X = GetMoveFlagValue( FlagID , site , EM_RoleValue_X )
	local Y = GetMoveFlagValue( FlagID , site , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( FlagID , site , EM_RoleValue_Z )
	PlayMotionEX( Obj, ruFUSION_ACTORSTATE_SPIRAL_LOOP , ruFUSION_ACTORSTATE_SPIRAL_LOOP)				
	--SetDefIdleMotion( ActorArray[i+2], ruFUSION_MIME_SPIRAL_LOOP )
	MoveDirect( Obj, X, Y+900, Z )
end