--[[�i�J�԰��G
(�������r)
[105384]���T�D�k�N�Q���_�A����[105382]���O�q��z�F�I
���}�԰��G
(�����骺�ݦu�̥��W����)
�Ҧ��չϥ��_�T�D�����̡A���N�ᮬ���ΡI
�d��@���G
�A�ݨ�e�����Ӹ޲����ͪ��Q�T�D�b�k�N�����A�P�򦳥|�Ө��v���b�I�i�k�N�A�ݨӬI�i�T�D�k�N���N�O�L��......]]--
function cl_374ai_script() ----�����SCRIPT
	local AI = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ----����Ū���쪺�h��
	local research_number = 0
	local research_table = {}
	local door_open = 0
	local ThesePlayer = {}
	local attackflag = 0
	local No_374_ON = 0
	local open_door1 = 0
	local open_door2 = 0
	local cl0se_door1 = 0
	local hide_door_2 = 0
	local ScriptMessage_1 = 0
	local ScriptMessage_2 = 0
	local carzy_time = 0
	local No_374 = CreateObjByFlag( 105382 , 780889 , 0 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( No_374 , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( No_374 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( No_374 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( No_374 , EM_SetModeType_Fight, false) ---�i���(�O)
	AddToPartition ( No_374 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( No_374 , EM_RoleValue_PID , AI ) ---
	BeginPlot( No_374,"cl_136_No_374fight", 0 ) ---��JBOSS���԰����L
	addbuff ( No_374 , 509063 , 0 , -1 ) ----��BOSS�@�Ӱ�����tBUFF(���n)
	for i = 1 , 4 , 1 do  ----�|�Ӫ�t�ά�s��
		local research = CreateObjByFlag( 105384 , 780889 , i+4 , 1 ) ------------for�j�鲣�ͥ|�Ӭ�s��
		SetModeEx ( research , EM_SetModeType_Obstruct, false) 		---����(�O)
		SetModeEx( research, EM_SetModeType_Strikback, true) ---����(�_)
		SetModeEx( research , EM_SetModeType_Move, true) ---����	(�_)
		SetModeEx( research , EM_SetModeType_Searchenemy, true)--����(�_)
		SetModeEx( research , EM_SetModeType_Mark, true)			---�i�I��(�O)
		SetModeEx( research , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
		SetModeEx( research , EM_SetModeType_Fight, true ) ---�i���(�O)
		AddToPartition ( research , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( research , EM_RoleValue_PID , AI )
		WriteRoleValue ( research , EM_RoleValue_Register1 , No_374 )
		BeginPlot( research,"cl_136_research", 0 ) -----��t�T�w�ʧ@�μ@��
		table.insert ( research_table , research ) ----���table�̭��ݷ|�n�R������
		sleep ( 1 )
	end
	local door = CreateObjByFlag( 105664 , 780889 , 9 , 1 ) ------------���ͫ��
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---����(�O)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( door,RoomID ) ----����[�J����,�Ҧ椽��
	SetIdleMotion( door ,ruFUSION_MIME_IDLE_STAND)----------------------�����ʧ@
	local door1 = CreateObjByFlag( 105386 , 780889 , 10 , 1 ) ------------���ͫ��
	SetModeEx ( door1 , EM_SetModeType_Obstruct, false) 		---����(�O)
	SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door1 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door1 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door1 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door1 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( door1,RoomID ) ----����[�J����,�Ҧ椽��
	SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)
	local door2 = CreateObjByFlag( 105664 , 780889 , 11 , 1 ) ------------���ͫ��
	SetModeEx ( door2 , EM_SetModeType_Obstruct, false) 		---����(�O)
	SetModeEx( door2 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door2 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door2 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door2 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door2 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( door2,RoomID ) ----����[�J����,�Ҧ椽��
	SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)
	local CrystalAI = CreateObjByFlag( 105383 , 780889 , 0 , 1 ) ------------�������D�n���
	SetModeEx ( CrystalAI , EM_SetModeType_Obstruct, false) 		---����(�O)
	SetModeEx( CrystalAI, EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( CrystalAI, EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( CrystalAI , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( CrystalAI , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( CrystalAI , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( CrystalAI , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( CrystalAI , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( CrystalAI , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( CrystalAI , EM_RoleValue_PID , AI )
	WriteRoleValue ( CrystalAI , EM_RoleValue_Register2 , No_374 )
	BeginPlot( CrystalAI,"cl_No_374_Crystalfight", 0 )
	local hide_door = CreateObjByFlag( 103126 , 780889 , 13 , 1 ) ------------���ͫ��
	SetModeEx ( hide_door , EM_SetModeType_Obstruct, true) 		---����(�O)
	SetModeEx( hide_door , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( hide_door , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( hide_door , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( hide_door , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( hide_door , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( hide_door , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( hide_door , EM_SetModeType_NotShowHPMP , false) ----����ܼg��  
	SetModeEx( hide_door , EM_SetModeType_Show , false) ----�q�X
	AddToPartition ( hide_door,RoomID ) ----����[�J����,�Ҧ椽��
	while 1 do
		sleep ( 10 )
		if No_374_ON == 0 then
			local attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )  ----Ū����s���O�_�i�J�԰�,�Ѭ�s���Ǧ^�Ȩ�
			if attack_open >= 1 then
				if open_door1 == 0 then
					ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_12]" , 2 )----������374�����T�D�����}�l���͵���...
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_END	)----------------------�����ʧ@
					SetModeEx (door1 , EM_SetModeType_Obstruct, true) 		---����(�O)
					sleep ( 10 )
					SetIdleMotion( door1 ,ruFUSION_MIME_IDLE_STAND	)----------------------�����ʧ@
					cl0se_door1 = 1
					open_door1 = 1
				end
			elseif attack_open == 0 then
				if open_door1 == 1 then
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------�����ʧ@
					SetModeEx (door1 , EM_SetModeType_Obstruct, false) 		---����(�O)
					sleep ( 10 )
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)----------------------�����ʧ@
					cl0se_door1 = 0
					open_door1 = 0
				end
			end
			if attack_open >= 4 then ----���s���W�L�|�ӳ��b�i�J�԰�
				attackflag = attackflag + 1 ----�N�}�lŪ��
				if ScriptMessage_2 == 0 then
					ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_08]" , 2 )----�T�D�Ť��������q�}�l���...
					ScriptMessage_2 = 1
				end
				if ScriptMessage_1 == 0 then
					if attackflag >= 5 then
						ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_09]" , 2 )----������374�����T�D�����}�l���͵���...
						ScriptMessage_1 = 1
					end
				end
				if attackflag >= 10 then
					ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_10]" , 2 )----�V�F...������[374��]�ò�F�T�D����!
					SetModeEx( No_374 , EM_SetModeType_Searchenemy, true)--���}BOSS����(�_)
					No_374_ON = 1
				end
			elseif attack_open < 4 then  ----�p�G���䤤�@�Ӭ�s�����}�԰�,�Ϊ̦��`,��s���|�Ǧ^-1����
				if attackflag >= 1 then  ----�N����k0
					attackflag = 0
					if ScriptMessage_1 == 1 then
						ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_11]" , 2 )----�T�D�Ť��������q�Ȯ���o�ɥR
						ScriptMessage_1 = 0
						ScriptMessage_2 = 1
					end
				end
			end
		end
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 �԰��}�l stage=2 BOSS���` stage=3 BOSS���}�԰����m
		if stage == 1 then
			carzy_time = carzy_time + 1
			if carzy_time >= 480 then
				Addbuff ( No_374 , 620042 , 0 ,-1 ) ---
				carzy_time = 0
			end
			if cl0se_door1 == 1 then
				if open_door1 == 1 then
					SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_END	)----------------------�����ʧ@
					SetModeEx (door1 , EM_SetModeType_Obstruct, true) 		---����(�O)
					hide_door_2 = CreateObjByFlag( 103126 , 780889 , 12 , 1 ) ------------���ͫ��
					SetModeEx ( hide_door_2 , EM_SetModeType_Obstruct, true) 		---����(�O)
					SetModeEx( hide_door_2 , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( hide_door_2 , EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( hide_door_2 , EM_SetModeType_Searchenemy, false)--����(�_)
					SetModeEx( hide_door_2 , EM_SetModeType_Mark, false)			---�i�I��(�O)
					SetModeEx( hide_door_2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
					SetModeEx( hide_door_2 , EM_SetModeType_Fight, false) ---�i���(�O)
					SetModeEx( hide_door_2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��  
					SetModeEx( hide_door_2 , EM_SetModeType_Show , false) ----�q�X
					AddToPartition ( hide_door_2,RoomID ) ----����[�J����,�Ҧ椽��
					sleep ( 10 )
					SetIdleMotion( door1 ,ruFUSION_MIME_IDLE_STAND	)----------------------�����ʧ@
					open_door1 = 0
				end
				cl0se_door1 = 0
			end
			if open_door2 == 0 then
				SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_END	)----------------------�����ʧ@
				SetModeEx ( door2 , EM_SetModeType_Obstruct, true) 		---����(�O)
				sleep ( 10 )
				SetIdleMotion( door2 , ruFUSION_MIME_IDLE_STAND)
				open_door2 = 1
			end
			if HateListCount( No_374 ) == 0 then
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 3 )
			end
		elseif stage == 2 then
			--if door_open == 0 then
				SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------�����ʧ@
				SetModeEx (door , EM_SetModeType_Obstruct, false) 		---����(�O)
				sleep ( 15 )
				SetIdleMotion( door ,  ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				door_open = 2
			--end
			--if open_door1 == 0 then
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------�����ʧ@
				SetModeEx (door1 , EM_SetModeType_Obstruct, false) 		---����(�O)
				delobj ( hide_door )
				sleep ( 10 )
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)----------------------�����ʧ@
				open_door1 = 1
			--end
			--if open_door2 == 1 then
				SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------�����ʧ@
				delobj ( hide_door_2 )
				SetModeEx ( door2 , EM_SetModeType_Obstruct, false) 		---����(�O)
				sleep ( 10 )
				SetIdleMotion( door2 , ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				open_door2 = 0
			--end
			local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
			for i=1,TempPlayer do ---TempPlayer����ƶq�N��for�j��n���X��
				ThesePlayer[i] = GetSearchResult() --�N��쪺���aGID�Ȯɦs��o�ӭȤ�
				if CheckID( ThesePlayer[i] )  == true and  ---�ˬdGID
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
					if CheckBuff( ThesePlayer[i] , 509148 ) == true then
						CancelBuff(ThesePlayer[i], 509148 )
					end
				end
			end
			carzy_time = 0
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 )
		elseif stage == 3 then
			delobj ( No_374 )
			carzy_time = 0
			if open_door1 == 0 then
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------�����ʧ@
				SetModeEx (door1 , EM_SetModeType_Obstruct, false) 		---����(�O)
				sleep ( 10 )
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)----------------------�����ʧ@
				open_door1 = 1
			end
			if open_door2 == 1 then
				SetIdleMotion( door2 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------�����ʧ@
				delobj ( hide_door_2 )
				SetModeEx ( door2 , EM_SetModeType_Obstruct, false) 		---����(�O)
				sleep ( 10 )
				SetIdleMotion( door2 , ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				cl0se_door1 = 1
				open_door2 = 0
			end
			local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
			for i=1,TempPlayer do ---TempPlayer����ƶq�N��for�j��n���X��
				ThesePlayer[i] = GetSearchResult() --�N��쪺���aGID�Ȯɦs��o�ӭȤ�
				if CheckID( ThesePlayer[i] )  == true and  ---�ˬdGID
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
					if CheckBuff( ThesePlayer[i] , 509148 ) == true then
						CancelBuff(ThesePlayer[i], 509148 )
					end
				end
			end
			delobj ( CrystalAI )
			research_number = table.getn(research_table)
			for i = 1 , research_number , 1 do
				if CheckID(research_table[research_number]) == true then
					delobj ( research_table[research_number] )
				end
			end
			sleep ( 50 )
			CrystalAI = CreateObjByFlag( 105383 , 780889 , 0 , 1 ) ------------for�j�鲣�ͥ|������
			SetModeEx ( CrystalAI , EM_SetModeType_Obstruct, false) 		---����(�O)
			SetModeEx( CrystalAI, EM_SetModeType_Strikback, false) ---����(�_)
			SetModeEx( CrystalAI, EM_SetModeType_Move, false) ---����	(�_)
			SetModeEx( CrystalAI , EM_SetModeType_Searchenemy, false)--����(�_)
			SetModeEx( CrystalAI , EM_SetModeType_Mark, false)			---�i�I��(�O)
			SetModeEx( CrystalAI , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
			SetModeEx( CrystalAI , EM_SetModeType_Fight, false) ---�i���(�O)
			SetModeEx( CrystalAI , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
			AddToPartition ( CrystalAI , RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( CrystalAI , EM_RoleValue_PID , AI )
			BeginPlot( CrystalAI,"cl_No_374_Crystalfight", 0 )
			No_374 = CreateObjByFlag( 105382 , 780889 , 0 , 1 ) ------------�֬Oboss�n�b���̲���
			AddToPartition ( No_374 , RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( No_374 , EM_RoleValue_PID , AI )
			BeginPlot( No_374,"cl_136_No_374fight", 0 )
			WriteRoleValue ( CrystalAI , EM_RoleValue_Register2 , No_374 )
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 )
		end
	end
end
function cl_136_research()
	local research = OwnerID()
	local RoomID = ReadRoleValue( research , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( research , EM_RoleValue_PID )
	local No_374 = ReadRoleValue ( research , EM_RoleValue_Register1 )
	local CombatBegin = 0
	local attackflag = 0
	local attack_num = 0
	local attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
	local attack_fight = ReadRoleValue ( research , EM_RoleValue_Register3 )
	SetPlot( research, "dead","cl_136_research_dead", 0 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	--addbuff ( research , 620147 , 0 , -1 )
	addbuff ( research , 509064 , 0 , -1 )
	callPlot( research,"LuaP_Casting", 0 )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( research , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( research ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���			
				CancelBuff( research, 509064 )
				say ( research , "[SC_NO374_15]")
				CombatBegin = 1
			end
			if CombatBegin == 1 then
				if attack_num == 0 then
					WriteRoleValue ( research , EM_RoleValue_Register3 , 1 )
					attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
					WriteRoleValue ( AI , EM_RoleValue_Register2 , attack_open+1 )
					attack_num = 1
				end
			end
		elseif HateListCount ( research ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				say ( research , "[SC_NO374_13]")
				--addbuff ( research , 620147 , 0 , -1 )
				addbuff ( research , 509064 , 0 , -1 )
				callPlot( research,"LuaP_Casting", 0 )
				attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
				WriteRoleValue ( AI , EM_RoleValue_Register2 , attack_open-1 )
				WriteRoleValue ( research , EM_RoleValue_Register3 , 0 )
				attack_num = 0
				CombatBegin = 0
			end
		end
	end
end
function cl_136_research_dead()
	local research = OwnerID()
	local RoomID = ReadRoleValue( research , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( research , EM_RoleValue_PID )
	local No_374 = ReadRoleValue ( research , EM_RoleValue_Register1 )
	local attack_fight = ReadRoleValue ( research , EM_RoleValue_Register3 )
	local attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
	if attack_fight ~= 1 then
		attack_open = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		WriteRoleValue ( AI , EM_RoleValue_Register2 , attack_open+1 )
	end
end
function cl_kill_105384() ----�}���eAE�P�_�O���O�������ݦu��~���O���ܴN���|���Ͷˮ`
	if ReadRoleValue ( TargetID() , EM_RoleValue_OrgID ) == 105384 or
		ReadRoleValue ( TargetID() , EM_RoleValue_OrgID ) == 105865 then
		return true
	elseif ReadRoleValue ( TargetID() , EM_RoleValue_OrgID ) ~= 105384 or
		ReadRoleValue ( TargetID() , EM_RoleValue_OrgID ) ~= 105865 then
		return false
	end
end
function cl_136_No_374fight() ---BOSS��ۦ���function
	local No_374 = OwnerID()
	local RoomID = ReadRoleValue( No_374 , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( No_374 , EM_RoleValue_PID )
	local skill = 8  ---497261
	local Crystal_time = 0 ---�ͤ�������
	local hptime = 0
	local CombatBegin = 0
	local rand_buff = 0
	local rand_skill = 0
	local buff_time = 29
	local buff_table = { 497263 , 497264 , 497265 }
	local skill_table = {}
	local numder_table = { 1 , 2 , 3 }
	local numder = 0
	local fire_Table = {}
	local fire_number = 0
	local skill_7 =  0  ----�s��&��������H���@�ۥX
	local skill_13 = 0  ---�B���R��&�B�᪱�a
	local skill_23 = 0 ---���W�ѦR�X�j�����l���a
	local fire_rand = 0
	local test_Table = {}
	local test = 0
	local runTarget = 0
	PlayMotion ( No_374,ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
	SetIdleMotion( No_374 ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)----------------------�����ʧ@
	SetPlot( No_374, "dead","cl_No_374_dead", 0 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( No_374 , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( No_374 ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 )
				PlayMotion ( No_374, ruFUSION_ACTORSTATE_SLEEP_END )---------------------�����ʧ@
				sleep ( 20 )
				SetIdleMotion( No_374 ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
				sleep ( 10 )
				CancelBuff_NoEvent( No_374 , 509063 ) ---�M��BUFF
				CastSpelllv ( No_374 , No_374 , 497258 , 0 )
				ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_01]" , 2 )----SeashnaPoiraeithnaKirneraroazgteiBaqDanfe(ť�����o�s�y)
				sleep ( 20 )
				SetModeEx( No_374 , EM_SetModeType_Fight, true) ---�i���(�O)
				SetModeEx( No_374 , EM_SetModeType_Move, true) ---����	(�_)
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				skill = skill + 1
				skill_7 = skill_7 + 1
				skill_13 = skill_13 + 1
				skill_23 = skill_23 + 1
				if skill_7 >= 4 then
					rand_skill = DW_Rand(100)  ----->��100�Ӷüƥh�H���@�ӭȥX��
					if ( rand_skill >= 1 and rand_skill <= 10) or( rand_skill >=21 and rand_skill <= 30 ) or
					   ( rand_skill >= 41 and rand_skill <= 50 ) or ( rand_skill >= 61 and rand_skill <= 70 ) or
					   ( rand_skill >= 81 and rand_skill <= 90 ) then      ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��Ĥ@��
					   CastSpelllv ( No_374 , AttackTarget , 497327 , 80 )----���e�ؼ�����@�ӥ��j�ˮ`
					   sleep ( 20 )   --------->�񪱪k�N���Ӱj�鰱���
					elseif ( rand_skill >= 11 and rand_skill <= 20 ) or( rand_skill >= 31 and rand_skill <= 40 ) or
					   ( rand_skill >= 51 and rand_skill <= 60 ) or( rand_skill >= 70 and rand_skill <= 80 ) or
					   ( rand_skill >= 91 and rand_skill <= 100 ) then   ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��ĤG��
					   CastSpelllv ( No_374 , No_374 , 497326 , 10 )----�e�记��
					   sleep ( 20 )
					end
					skill_7 = 0
				end
				if skill_13 >= 7 then
					rand_skill = DW_Rand(100)  ----->��100�Ӷüƥh�H���@�ӭȥX��
					if ( rand_skill >= 1 and rand_skill <= 10) or( rand_skill >=21 and rand_skill <= 30 ) or
					   ( rand_skill >= 41 and rand_skill <= 50 ) or ( rand_skill >= 61 and rand_skill <= 70 ) or
					   ( rand_skill >= 81 and rand_skill <= 90 ) then      ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��Ĥ@��
					   CastSpelllv ( No_374 , No_374 , 497325 , 8 ) --�B���R��
					   sleep ( 20 )   --------->�񪱪k�N���Ӱj�鰱���
					elseif ( rand_skill >= 11 and rand_skill <= 20 ) or( rand_skill >= 31 and rand_skill <= 40 ) or
					   ( rand_skill >= 51 and rand_skill <= 60 ) or( rand_skill >= 70 and rand_skill <= 80 ) or
					   ( rand_skill >= 91 and rand_skill <= 100 ) then   ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��ĤG��
					   fire_Table = DW_HateRemain(0)
					   fire_rand = table.getn(fire_Table)
					   fire_number = DW_Rand(fire_rand)
					   CastSpelllv ( No_374 , fire_Table[fire_number] , 497328 , 20 )----�Q��
					   sleep ( 20 )
					end
					sleep ( 20 )
					skill_13 = 0
				end
				local skill_stop = ReadRoleValue ( No_374 , EM_RoleValue_Register5 )
				if skill_23 >= 13 then  ---�I��l�즺����
					if skill_stop == 0 then
						WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 1 )
						ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_04]" , 2 )----vaistain'vaistain'vaistain(ť�����o�s�y)
						local number = 0
						local rand_num = 0
						local play_table = {}
						local play = 0
						play_table = DW_HateRemain(0)
						number = table.getn(play_table)
						if number == 1 then
							runTarget = AttackTarget
						elseif number >= 2 then
							play_table = DW_HateRemain(1)
							number = table.getn(play_table)
							rand_num = DW_Rand (number)
							runTarget = play_table[rand_num]
						end
						Addbuff (  No_374 , 509067 , 0 ,-1 ) ---
						SetModeEx( No_374 , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( No_374 , EM_SetModeType_Move, false) ---����
						--SetModeEx( No_374 , EM_SetModeType_Strikback, false) ---����(�_)
						sleep ( 10 )
						PlayMotionex ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )---------------��1�|�ʧ@
						sleep ( 10 )
						SetIdleMotion( No_374 ,ruFUSION_ACTORSTATE_CRAFTING_LOOP )----------------------�����ʧ@
						local xx1 = ReadRoleValue ( runTarget, EM_RoleValue_X)
						local yy2 = ReadRoleValue ( runTarget, EM_RoleValue_Y)
						local zz3 = ReadRoleValue ( runTarget, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
						local ball = CreateObj( 105422 , xx1, yy2 , zz3 , 0 , 1 )  ------------�ͥX�]�N�U
						SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
						SetModeEx( ball , EM_SetModeType_Mark, false)---�i�I��(�O)
						SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
						SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
						SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
						SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
						AddToPartition( ball,RoomID )
						BeginPlot( ball,"cl_run_ball", 0 )
						WriteRoleValue( ball , EM_RoleValue_Livetime, 6 )  --�s���ɶ�
						WriteRoleValue ( ball , EM_RoleValue_PID , No_374 )
						CastSpelllv ( No_374 , ball , 497266 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
						sleep ( 50 )
						PlayMotion ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_END )
						sleep ( 10 )
						SetIdleMotion( No_374 ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
						SetModeEx( No_374 , EM_SetModeType_Fight, true) ---�i���
						SetModeEx( No_374 , EM_SetModeType_Move, true) ---����	
						--SetModeEx( No_374 , EM_SetModeType_Strikback, true) ---����(�_)
						CancelBuff_NoEvent( No_374 , 509067 ) ---�M��BUFF
						skill_23 = 0
						WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 0 )
					end
				end
				if skill >= 16 then
					if skill_stop == 0 then
						WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 1 )
						ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_03]" , 2 )----Gauteikriistain'naCashtei(�s�q�n�j���b��өж���)
						Addbuff ( No_374 , 509067 , 0 ,-1 ) ---
						SetModeEx( No_374 , EM_SetModeType_Fight, false) ---�i���
						SetModeEx( No_374 , EM_SetModeType_Move, false) ---����
						--SetModeEx( No_374 , EM_SetModeType_Strikback, false) ---����(�_)
						--sleep ( 10 )
						PlayMotionex ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )---------------��1�|�ʧ@
						sleep ( 20 )
						SetIdleMotion( No_374 ,ruFUSION_ACTORSTATE_CRAFTING_LOOP )----------------------�����ʧ@
						local xx1 = ReadRoleValue ( AttackTarget, EM_RoleValue_X)
						local yy2 = ReadRoleValue ( AttackTarget, EM_RoleValue_Y)
						local zz3 = ReadRoleValue ( AttackTarget, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
						local ball = CreateObj( 105422 , xx1, yy2 , zz3 , 0 , 1 )  ------------�ͥX�]�N�U
						SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
						SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
						SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
						SetModeEx( ball , EM_SetModeType_Mark, false)			---�i�I��(�O)
						SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
						SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
						SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
						AddToPartition( ball,RoomID )
						WriteRoleValue( ball , EM_RoleValue_Livetime, 10 )  --�s���ɶ�
						CastSpelllv ( No_374 , ball , 497261 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
						sleep ( 50 )
						sysCastSpelllv ( ball , ball , 497262 , 12 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
						PlayMotion ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_END )
						sleep ( 10 )
						SetIdleMotion( No_374 ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
						SetModeEx( No_374 , EM_SetModeType_Fight, true) ---�i���
						SetModeEx( No_374 , EM_SetModeType_Move, true) ---����	
						--SetModeEx( No_374 , EM_SetModeType_Strikback, true) ---����(�_)
						CancelBuff_NoEvent( No_374 , 509067 ) ---�M��BUFF
						skill = 0
						WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 0 )
					end
				end
			end
		elseif HateListCount ( No_374 ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 3 )
				ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_05]" , 2 )----SeauteiBaqKarfe(ť�����o�s�y)	
				skill = 0
				skill_23 = 0
				skill_13 = 0
				skill_7 = 0
				CombatBegin = 0
			end
		end
	end
end
function cl_No_374_Crystalfight() ---�������
	local CrystalAI = OwnerID()  ----
	local RoomID = ReadRoleValue( CrystalAI , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( CrystalAI , EM_RoleValue_PID )
	local No_374 = ReadRoleValue ( CrystalAI , EM_RoleValue_Register2 )
	local Crystal_time = 0 ---�ͤ�������
	local buff_time = 20 ---�C20�����BUFF���ɶ�
	local hptime = 0
	local Crystal_table = {} ----�������TABLE
	local fix_Crystal_open = 0
	cl_136_No_374_105387()  -----���沣�ͤp�������
	while 1 do
		sleep ( 10 )
		local Crystal = ReadRoleValue ( CrystalAI , EM_RoleValue_Register1 )  ----�C�@��Ū���ڪ�R1��,
		if Crystal == 1 then --��Crystal�ܦ�1���ɭԥN��u�����H�g�I��.�������������ͨåB�}�l�p��30��
			Crystal_time = Crystal_time + 1
			if fix_Crystal_open == 0 then
				for i = 1 , 4 , 1 do
					local fix_Crystal = CreateObjByFlag( 117739 , 780889 , i , 1 ) ------------for�j�鲣�ͥ|������
					SetModeEx ( fix_Crystal , EM_SetModeType_Obstruct, false) 		---����(�O)
					SetModeEx( fix_Crystal, EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( fix_Crystal, EM_SetModeType_Move, false) ---����	(�_)
					SetModeEx( fix_Crystal , EM_SetModeType_Searchenemy, false)--����(�_)
					SetModeEx( fix_Crystal , EM_SetModeType_Mark, true)			---�i�I��(�O)
					SetModeEx( fix_Crystal , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
					SetModeEx( fix_Crystal , EM_SetModeType_Fight, false) ---�i���(�O)
					SetModeEx( fix_Crystal , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
					AddToPartition ( fix_Crystal , RoomID ) ----����[�J����,�Ҧ椽��	
					WriteRoleValue ( fix_Crystal , EM_RoleValue_Register2 , AI )
					table.insert( Crystal_Table , fix_Crystal )
					BeginPlot( fix_Crystal,"cl_fix_CrystalAI", 0 )
				end
				fix_Crystal_open = 1
			end
			if Crystal_time == 30 then
				cl_136_No_374_105387()
				if fix_Crystal_open == 1 then
					for i = 1 , 4 , 1 do
						delobj ( Crystal_table[i] )
						fix_Crystal_open = 0
					end		
					Crystal_table = {}
				end
				WriteRoleValue ( CrystalAI , EM_RoleValue_Register1 , 0 )
				Crystal_time = 0
			end
		end
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )
		local skill_stop = ReadRoleValue ( No_374 , EM_RoleValue_Register5 )
		if stage == 1 then
			buff_time = buff_time + 1
			if buff_time >= 30 then  ---BUFF�H���T��G
				if skill_stop == 0 then
					WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 1 )
					while 	ReadRoleValue( No_374 , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(2)
					end
					cl_randbuff()
					sleep ( 20 )
					buff_time = 0
					WriteRoleValue ( No_374 , EM_RoleValue_Register5 , 0 )
				end
			end
		else
			buff_time = 20
		end
	end
end
function cl_fix_CrystalAI()
	local fix_Crystal = OwnerID()
	local RoomID = ReadRoleValue( fix_Crystal , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( fix_Crystal , EM_RoleValue_Register2 )
	CastSpelllv ( fix_Crystal , fix_Crystal , 497330 , 0 )
	while 1 do
		sleep ( 10 )
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )
		if stage == 3 then
			sleep ( 50 )
			delobj ( fix_Crystal )
		end
	end
end
function cl_136_No_374_105387() ---boss������������
	local CrystalAI = OwnerID()
	local RoomID = ReadRoleValue( CrystalAI , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AI = ReadRoleValue ( CrystalAI , EM_RoleValue_PID )
	local No_374 = ReadRoleValue ( CrystalAI , EM_RoleValue_Register2 )
	local CrystalAII = CreateObjByFlag( 105387 , 780889 , 0 , 1 ) ------------for�j�鲣�ͥ|������
	SetModeEx ( CrystalAII , EM_SetModeType_Obstruct, false) 		---����(�O)
	SetModeEx( CrystalAII, EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( CrystalAII, EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( CrystalAII , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( CrystalAII , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( CrystalAII , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( CrystalAII , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( CrystalAII , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( CrystalAII , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( CrystalAII , EM_RoleValue_PID , CrystalAI )
	WriteRoleValue ( CrystalAII , EM_RoleValue_Register1 , AI )
	WriteRoleValue ( CrystalAII , EM_RoleValue_Register2 , No_374 )
	BeginPlot( CrystalAII,"cl_136_No_374_CrystalAI", 0 )
end
function cl_136_No_374_CrystalAI() ---�o�@�q�O���ͤ���AI��������
	local CrystalAI = OwnerID()
	local RoomID = ReadRoleValue( CrystalAI , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local CrystalAIII = ReadRoleValue( CrystalAI , EM_RoleValue_PID )
	local AI = ReadRoleValue ( CrystalAI , EM_RoleValue_Register1 )
	local No_374 = ReadRoleValue ( CrystalAI , EM_RoleValue_Register2 )
	local skill = 0
	local No_Crystal_Table = {117736,117737,117738,117739}
	local flag_table = {1,2,3,4}
	local Crystal_Table = {}
	local Crystal_number = 0
	local flag_number = 0
	local Rand_flag = 0
	for i = 1 , 4 , 1 do
		flag_number = table.getn(flag_table)
		Rand_flag = DW_Rand(flag_number)
		local Crystal = CreateObjByFlag( No_Crystal_Table[i] , 780889 , flag_table[Rand_flag] , 1 ) ------------for�j�鲣�ͥ|������
		SetModeEx ( Crystal , EM_SetModeType_Obstruct, false) 		---����(�O)
		SetModeEx( Crystal, EM_SetModeType_Strikback, false) ---����(�_)
		SetModeEx( Crystal, EM_SetModeType_Move, false) ---����	(�_)
		SetModeEx( Crystal , EM_SetModeType_Searchenemy, false)--����(�_)
		SetModeEx( Crystal , EM_SetModeType_Mark, true)			---�i�I��(�O)
		SetModeEx( Crystal , EM_SetModeType_ShowRoleHead, true) 		---�Y����(�O)
		SetModeEx( Crystal , EM_SetModeType_Fight, false) ---�i���(�O)
		SetModeEx( Crystal , EM_SetModeType_NotShowHPMP , true) ----����ܼg��
		AddToPartition ( Crystal , RoomID ) ----����[�J����,�Ҧ椽��
		WriteRoleValue ( Crystal , EM_RoleValue_PID , CrystalAI )
		WriteRoleValue ( Crystal , EM_RoleValue_Register1 , i )
		WriteRoleValue ( Crystal , EM_RoleValue_Register3 , CrystalAIII )
		WriteRoleValue ( Crystal , EM_RoleValue_Register4 , No_374 )
		WriteRoleValue ( Crystal , EM_RoleValue_Register5 , AI )
		table.insert( Crystal_Table , Crystal )
		BeginPlot( Crystal,"cl_Crystal_touch", 0 )
		table.remove ( flag_table , Rand_flag )
		flag_number = table.getn(flag_table)
		sleep ( 1 )
	end
	while 1 do
		sleep ( 10 )
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )
		if stage == 2 then
		elseif stage == 3 then			
			Crystal_number = table.getn(Crystal_Table)
			for i = 1 , Crystal_number , 1 do
				delobj ( Crystal_Table[i] )
			end
			delobj ( CrystalAI )
			break
		end
		local delCrystal = ReadRoleValue ( CrystalAI , EM_RoleValue_Register2 )
		Crystal_number = table.getn(Crystal_Table)
		for i = 1 , Crystal_number , 1 do
			local Crystaloff = ReadRoleValue ( Crystal_Table[i] , EM_RoleValue_Register2 )
			if Crystaloff == 1 then
				WriteRoleValue ( CrystalAI , EM_RoleValue_Register2 , 1 )
			end
		end
		if delCrystal == 1 then
			skill = skill + 1
			if skill >= 2 then
				for i = 1 , Crystal_number , 1 do
					delobj ( Crystal_Table[i] )
				end
				WriteRoleValue ( CrystalAIII , EM_RoleValue_Register1 , 1 )
				delobj ( CrystalAI )
			end
		end
	end
end
function cl_Crystal_touch()
	local Crystal = OwnerID()
	local AI = ReadRoleValue ( Crystal , EM_RoleValue_Register5 )
	addbuff ( Crystal , 509700 , 0 , -1 )
	SetPlot( Crystal, "touch","cl_Crystal_Cast", 50 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_Crystal_Cast()
	local play = OwnerID()
	local Crystal = TargetID()
	if CheckBuff( play , 509148 ) == false then
		if	BeginCastBarEvent( play ,Crystal , "[SC_NO374_07]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 , "cl_Crystal_touch_OK") ~=1	then
			ScriptMessage( play, play, 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
	end
end
function cl_Crystal_touch_OK(Executer,Result) ---�ˬd�ؼЦ��S�����~�����e��������
	local Crystal = TargetID()
	local number = ReadRoleValue(Crystal , EM_RoleValue_Register1 )
	local function_table = {"cl_Crystal_red" , "cl_Crystal_green" , "cl_Crystal_bule" , "cl_Crystal_whiter"}
	if	Result > 0 then --���\���A
		EndCastBar(Executer,Result)--�M���I�k��
		BeginPlot( Crystal , function_table[number] , 0)
	else
		EndCastBar(Executer,Result)--�M���I�k��
	end
end
function cl_Crystal_green()
	--say ( OwnerID() , "green")
	local Crystal = OwnerID()
	local tagplay = TargetID()
	local delCrystal = ReadRoleValue ( Crystal , EM_RoleValue_Register2 )
	local CrystalAI = ReadRoleValue ( Crystal , EM_RoleValue_Register3 )
	local No_374 = ReadRoleValue ( Crystal , EM_RoleValue_Register4 )
	if CheckBuff( No_374 , 509068 ) == true then
		CancelBuff_NoEvent( No_374 , 509068 ) ---�M��BUFF
	end
	addbuff ( tagplay , 509227 , 0 , 30 )
	if delCrystal ~= 1 then
		WriteRoleValue ( Crystal , EM_RoleValue_Register2 , 1 )
	end
end
function cl_Crystal_red()
	--say ( OwnerID() , "red")
	local Crystal = OwnerID()
	local tagplay = TargetID()
	local delCrystal = ReadRoleValue ( Crystal , EM_RoleValue_Register2 )
	local CrystalAI = ReadRoleValue ( Crystal , EM_RoleValue_Register3 )
	local No_374 = ReadRoleValue ( Crystal , EM_RoleValue_Register4 )
	if CheckBuff( No_374 , 509070 ) == true then
		CancelBuff_NoEvent( No_374 , 509070 ) ---�M��BUFF
	end
	if CheckBuff ( No_374 , 509067) == true then
		--say ( No_374 , "fly")
		SetModeEx( No_374 , EM_SetModeType_Fight, true) ---�i���
		sysCastSpelllv ( tagplay , No_374 , 497329 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
		sleep ( 10 )
		SetModeEx( No_374 , EM_SetModeType_Fight, false) ---�i���
		addbuff ( tagplay , 509231 , 0 , 10 )
	elseif CheckBuff ( No_374 , 509067) == false then
		--say ( No_374 , "Not's fly")
		sysCastSpelllv ( tagplay , No_374 , 497329 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
		addbuff ( tagplay , 509231 , 0 , 10 )
	end
	if delCrystal ~= 1 then
		WriteRoleValue ( Crystal , EM_RoleValue_Register2 , 1 )
	end
end
function cl_Crystal_bule()
	--say ( OwnerID() , "bule")
	local Crystal = OwnerID()
	local tagplay = TargetID()
	local delCrystal = ReadRoleValue ( Crystal , EM_RoleValue_Register2 )
	local CrystalAI = ReadRoleValue ( Crystal , EM_RoleValue_Register3 )
	local No_374 = ReadRoleValue ( Crystal , EM_RoleValue_Register4 )
	if CheckBuff( No_374 , 509069 ) == true then
		CancelBuff_NoEvent( No_374 , 509069 ) ---�M��BUFF	
	end
	addbuff ( tagplay , 509228 , 0 , 30 )
	if delCrystal ~= 1 then
		WriteRoleValue ( Crystal , EM_RoleValue_Register2 , 1 )
	end
end
function cl_Crystal_whiter()
	--say ( OwnerID() , "whiter")
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local Crystal = OwnerID()
	local tagplay = TargetID()
	local ThesePlayer = {}
	local delCrystal = ReadRoleValue ( Crystal , EM_RoleValue_Register2 )
	local CrystalAI = ReadRoleValue ( Crystal , EM_RoleValue_Register3 )
	local No_374 = ReadRoleValue ( Crystal , EM_RoleValue_Register4 )
	--sysCastSpelllv ( Crystal , Crystal , 497260 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
	Addbuff (  No_374 , 509152 , 0 ,-1 ) ---
	addbuff ( tagplay , 509229 , 0 , 10 )
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	for i=1,TempPlayer do ---TempPlayer����ƶq�N��for�j��n���X��
		ThesePlayer[i] = GetSearchResult() --�N��쪺���aGID�Ȯɦs��o�ӭȤ�
		if CheckID( ThesePlayer[i] )  == true and  ---�ˬdGID
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
			if CheckBuff( ThesePlayer[i] , 509071 ) == false then
				Addbuff( ThesePlayer[i], 509071 , 0 ,-1 )
			end
		end
	end
	if delCrystal ~= 1 then
		WriteRoleValue ( Crystal , EM_RoleValue_Register2 , 1 )
	end
end
function cl_checkbuff_509071()
	if CheckBuff( TargetID() , 509071 ) == false then
		--addbuff ( TargetID() , 509262 , 0 , 3 )
		--say ( TargetID() , "NOBUFF")
		return true
	elseif CheckBuff( TargetID() , 509071 ) == true then
		return false
	end
end
function cl_checkNobuff_509071()
	if CheckBuff( TargetID() , 509071 ) == true then
		--addbuff ( TargetID() , 509263 , 0 , 3 )
		--say ( TargetID() , "YESBUFF")
		return true
	elseif CheckBuff( TargetID() , 509071 ) == false then
		return false
	end
end
function cl_fry_No374()
	local No_374 = OwnerID()
	local RoomID = ReadRoleValue( No_374 , EM_RoleValue_RoomID ) ----�o�OAIŪ���쪺�a��
	local AttackTarget = ReadRoleValue( No_374 , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
	Addbuff (  No_374 , 509067 , 0 ,-1 ) ---
	SetModeEx( No_374 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( No_374 , EM_SetModeType_Move, false) ---����
	--SetModeEx( No_374 , EM_SetModeType_Strikback, false) ---����(�_)
	sleep ( 10 )
	PlayMotionex ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP )---------------��1�|�ʧ@
	sleep ( 10 )
	SetIdleMotion( No_374 ,ruFUSION_ACTORSTATE_CRAFTING_LOOP )----------------------�����ʧ@
	local xx1 = ReadRoleValue ( AttackTarget, EM_RoleValue_X)
	local yy2 = ReadRoleValue ( AttackTarget, EM_RoleValue_Y)
	local zz3 = ReadRoleValue ( AttackTarget, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
	local ball = CreateObj( 105422 , xx1, yy2 , zz3 , 0 , 1 )  ------------�ͥX�]�N�U
	SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( ball , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��
	AddToPartition( ball,RoomID )
	WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --�s���ɶ�
	CastSpelllv ( No_374 , ball , 497261 , 0 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
	sleep ( 50 )
	sysCastSpelllv ( ball , ball , 497262 , 12 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
	PlayMotion ( No_374 , ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep ( 10 )
	SetIdleMotion( No_374 ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
	SetModeEx( No_374 , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( No_374 , EM_SetModeType_Move, true) ---����	
	--SetModeEx( No_374 , EM_SetModeType_Strikback, true) ---����(�_)
	CancelBuff_NoEvent( No_374 , 509067 ) ---�M��BUFF
end
function cl_No_374_dead() ---BOSS���`�@��
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue ( AI , EM_RoleValue_Register1 , 2 )
	ScriptMessage( OwnerID() , -1 , 2 ,"[SC_NO374_06]" , 2 )----wor si lr(�s���Y�F�s�q�n)
end
function cl_randbuff()
	local AI = OwnerID()
	local No_374 = ReadRoleValue ( AI , EM_RoleValue_Register2 )
	ScriptMessage( No_374 , -1 , 2 ,"[SC_NO374_02]" , 2 )----SoiaqnaeLarfeBanfe(�s�کG�y)
	local rand_buff = 0
	local buff_time = 27
	local buff_table = { 497263 , 497264 , 497265 }
	local addbuff_table = { 509068 , 509069 , 509070 }
	local numder_table = { 1 , 2 , 3 }
	local numder = 0
	rand_buff = DW_Rand (3)
	CastSpelllv ( No_374 , No_374 , buff_table[rand_buff] , 5 ) --
end
function cl_run_ball()
	local No_374 = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local number = 0
	local rand_num = 0
	--Addbuff (  OwnerID() , 509151 , 0 , 7 ) ---
	local play_table = {}
	local play = 0
	play_table = star_HateListSort(No_374)
	number = table.getn(play_table)
	if number >= 1 then
		rand_num = DW_Rand (number)
		play = play_table[rand_num]
		SetFollow( OwnerID(), play )
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
	end
	while 1 do
		sleep ( 10 )
		sysCastSpelllv ( OwnerID() , OwnerID() , 497267 , 6 ) --��AI2���U�l�̭����Ҧ����a�I��-80%�ˮ`��AE
		if ReadRoleValue ( play , EM_RoleValue_IsDead ) ==  1 then
			play_table = star_HateListSort(No_374)
			number = table.getn(play_table)
			if number > 0 then
				rand_num = DW_Rand (number)
				play = play_table[rand_num]
				SetFollow( OwnerID(), play )
			elseif number == 0 then
				delobj ( OwnerID() )
			end
		end
	end
end
function cl_139_NO374() --------------���W�ߤl��t��-----------
	SetPlot( OwnerID(), "range","cl_139_NO374_range", 50 )
end
function cl_139_NO374_range()
	if ReadRoleValue ( OwnerID() , EM_RoleValue_VOC ) ~=  0 then
		ScriptMessage( TargetID() , -1 , 2 ,"[SC_NO374_14]" , 2 )
		delobj ( TargetID() )
	end
end