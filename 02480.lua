function cl_21_106082_Setattack() ----�����ج�������̴_���٦��
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----�C�@���M����������ؼ�
	local mostbon = {}
	local most = SearchRangeNPC ( me , 80 )
	local mostno = table.getn(most)
	for i= 1 , mostno , 1 do
		if most[i] ~= nil then
			if ReadRoleValue ( most[i] , EM_RoleValue_IsDead ) == 1 then
				local most_GID = ReadRoleValue ( most[i] , EM_RoleValue_OrgID )
				local X1 = ReadRoleValue ( most[i], EM_RoleValue_X)
				local Y1 = ReadRoleValue ( most[i], EM_RoleValue_Y)
				local Z1 = ReadRoleValue ( most[i], EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
				delobj ( most[i] )
				local Bon = CreateObj( most_GID , X1, Y1 , Z1 , 0 , 1 )  ------------�n�ͥX�z���D�I��d��100��AE
				AddToPartition( Bon , RoomID )
				SetAttack( Bon , AttackTarget)
			end
		end
	end
end
function cl_21_106082_die() ----�����ج��������
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local X1 = ReadRoleValue ( me, EM_RoleValue_X)
	local Y1 = ReadRoleValue ( me, EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( me, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
	local ball = CreateObj( 106105 , X1, Y1 , Z1 , 0 , 1 )  ------------�n�ͥX�z���D�I��d��100��AE
	SetModeEx( ball , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( ball , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( ball , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( ball , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( ball , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( ball , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --�s���ɶ�
	AddToPartition(ball , RoomID )
	CastSpelllv ( ball , ball , 497403 , 0 ) --
end
function cl_21_106086Archer() ---�����L�h���}�b��AI
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local skill_time1 = 0 ---->�����b
	local skill_time2 = 0 ---->�ؼ���w+����
	local skill_time3 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( me ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				skill_time1 = skill_time1 + 1
				skill_time2 = skill_time2 + 1
				skill_time3 = skill_time3 + 1
				if skill_time1 >= 1 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					CastSpelllv ( me , AttackTarget , 497591 , 400 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep(10)
					skill_time1 = 0
				end
				if skill_time2 >= 5 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					local hate_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate=table.getn(hate_Table) ----���X��������ƶq
					if hate >= 1 then
						local Rand_Num = DW_Rand(hate)  ----�H����@�ӭȥN��TABLE�̪���m
						if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_IsDead ) ~= 1 then
							CastSpelllv ( me , hate_Table[Rand_Num] , 497589 , 5 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
							sleep ( 10 )
							skill_time2 = 0
						end
					end
				end
				if skill_time3 >= 9 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					local hate_Table_2 = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate_2=table.getn(hate_Table_2) ----���X��������ƶq
					if hate_2 >= 1 then
						local Rand_Num_2 = DW_Rand(hate_2)  ----�H����@�ӭȥN��TABLE�̪���m
						if ReadRoleValue( hate_Table_2[Rand_Num_2] , EM_RoleValue_IsDead ) ~= 1 then
							WriteRoleValue (  me , EM_RoleValue_Register2 , hate_Table_2[Rand_Num_2] )
							addbuff ( hate_Table_2[Rand_Num_2] , 620810 , 0 , 60 )
							CastSpelllv ( me , me , 498480 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
							sleep ( 50 )
							skill_time3 = 0
						end
					end
				end
			end
		elseif HateListCount ( me ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				skill_time1 = 0
				skill_time2 = 0
				skill_time3 = 0
			end
		end
	end
end
function cl_21_chek_TargetID()
	local Npc = OwnerID()
	local player = ReadRoleValue ( Npc , EM_RoleValue_Register2 )
	if CheckID( player )  == true and
		ReadRoleValue ( Npc , EM_RoleValue_IsDead ) ~= 1 then
		return true
	else
		return false
	end
end
function cl_21_sysmagic_498255()
	local Npc = OwnerID()
	local player = ReadRoleValue ( Npc , EM_RoleValue_Register2 )
	sysCastSpelllv ( Npc , player , 498255 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
end
function cl_21_106089Fatal() ---�����w�溸�P�R��
	local me = OwnerID()
	local RoomID = ReadRoleValue ( me , EM_RoleValue_RoomID )
	local skill_time1 = 0 ---->�����b
	local skill_time2 = 0 ---->�ؼ���w+����
	local skill_time3 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( me , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( me ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				skill_time1 = skill_time1 + 1
				skill_time2 = skill_time2 + 1
				--skill_time3 = skill_time3 + 1
				if CheckBuff( me , 502717 ) == true then
					CastSpelllv ( me , me , 498260 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep (15)
					CastSpelllv ( me , me , 498259 , 0 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep ( 30 )
				end
				if skill_time2 >= 3 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					CastSpelllv ( me , AttackTarget , 497405 , 400 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep(30)
					skill_time2 = 0
				end
				if skill_time1 >= 13 then
					while 	ReadRoleValue( me , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					CastSpelllv ( me , me , 498259 , 100 ) ---�дU�l��ۤv�I��@��AE�R�����S�ĨS������ˮ`
					sleep(30)
					skill_time1 = 0
				end
			end
		elseif HateListCount ( me ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				skill_time1 = 0
				skill_time2 = 0
				skill_time3 = 0
			end
		end
	end
end
function cl_Z21_106097()  ----�����β��p��
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local X1 = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Y1 = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
	for i = 1 , 8 , 1 do
		local Bon = CreateObj( 106112 , X1, Y1 , Z1 , 0 , 1 )  ------------�n�ͥX�z���D�I��d��100��AE
		AddToPartition( Bon , RoomID )
	end
end
function cl_Z21_106112_Del_Owner()  ----�����p�ΨS���ؼЮɧR���ۤv
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local del_time = 0
	while 1 do
		sleep ( 10 )
		if HateListCount( OwnerID ) ~= 0 then ---�p�G������������H�N�~��԰�
			del_time = 0
		elseif HateListCount ( OwnerID ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			del_time = del_time + 1
			if del_time >= 10 then
				DelObj ( OwnerID )
			end
		end
	end
end
function cl_z21_106103_Welcome_AI() -----��v��Ĳ�I����
	local AI = OwnerID()
	SetPlot(  AI, "collision","cl_z21_106103_Welcome_range", 50 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_z21_106103_Welcome_range()  ----Ĳ�I���󲣥͵�v
	local AI = TargetID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_03]" , 2 ) ----�V�ڰ^�m�A�̪��A��a�A���O�h�򪺴��i��
		sleep ( 10 )
		local No_face = CreateObjByFlag( 106103 ,781012 ,0 , 0 ) --i = �X�нs��  
		SetModeEx( No_face,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
		SetModeEx( No_face,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
		SetModeEx( No_face,EM_SetModeType_NotShowHPMP, false)--����ܦ��
		SetModeEx( No_face,EM_SetModeType_Strikback, false)--����
		SetModeEx( No_face,EM_SetModeType_Move, true)--����
		SetModeEx( No_face,EM_SetModeType_Fight, false)--�i�������
		SetModeEx( No_face,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
		SetModeEx( No_face,EM_SetModeType_Obstruct, false)--�|����(���ר�L������)
		AddToPartition( No_face, RoomID)
		say ( No_face , "[SC_ZONE21_L_MTS_04]")
		BeginPlot( No_face ,"cl_z21_106103_No_face" , 0) --�����X��+����H���P�_
		DelObj ( AI )
	end
end
function cl_z21_106103_No_face() ----��v�ĹL�h�~���a�A�åB����
	local No_face = OwnerID()
	local RoomID = ReadRoleValue ( No_face , EM_RoleValue_RoomID )
	MoveToFlagEnabled(No_face, false) ---�t�Τ��ت����|����
	WriteRoleValue( No_face , EM_RoleValue_IsWalk, 0 )
	Hide(No_face)
	Show(No_face,RoomID)
	DW_MoveToFlag( No_face , 781012 , 1 , 0 ) ----�H��Rand�X�l����
	sysCastSpelllv ( No_face , No_face , 498288 , 0 ) 
	sleep ( 10 )
	ScriptMessage( No_face , -1 , 2 ,"[SC_ZONE21_L_MTS_05]" , 2 ) ----�V�ڰ^�m�A�̪��A��a�A���O�h�򪺴��i��
	DelObj( No_face )
end
function cl_z21_106103_AI_1() ----��vĲ�I����==P-2
	local AI = OwnerID()
	SetPlot(  AI, "collision","cl_z21_106103_Welcome_range_1", 50 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_z21_106103_Welcome_range_1()  ----��vĲ�I�@��
	local AI = TargetID()
	local play = OwnerID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	if ReadRoleValue( play , EM_RoleValue_VOC ) ~= 0 then
		ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_06]" , 2 ) ----�V�ڰ^�m�A�̪��A��a�A���O�h�򪺴��i��
		local No_face = CreateObjByFlag( 106103 ,781012 , 2 , 0 ) --i = �X�нs��  
		SetModeEx( No_face,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
		SetModeEx( No_face,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
		SetModeEx( No_face,EM_SetModeType_NotShowHPMP, false)--����ܦ��
		SetModeEx( No_face,EM_SetModeType_Strikback, false)--����
		SetModeEx( No_face,EM_SetModeType_Move, true)--����
		SetModeEx( No_face,EM_SetModeType_Fight, false)--�i�������
		SetModeEx( No_face,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
		SetModeEx( No_face,EM_SetModeType_Obstruct, false)--�|����(���ר�L������)
		WriteRoleValue ( No_face , EM_RoleValue_Register5 , play )
		AddToPartition( No_face, RoomID)
		BeginPlot( No_face ,"cl_z21_106103_No_face_1" , 0) --�����X��+����H���P�_
		DelObj ( AI )
	end
end
function cl_z21_106103_No_face_1() ----��v�ĹL�h�~���a�A�åB����
	local No_face = OwnerID()
	local RoomID = ReadRoleValue ( No_face , EM_RoleValue_RoomID )
	local play = ReadRoleValue ( No_face , EM_RoleValue_Register5 )
	say ( No_face , "[SC_ZONE21_L_MTS_01]")
	sleep ( 10 )
	CastSpelllv ( No_face , No_face , 498367 , 0 )
	sleep ( 10 )
	local BALL = CreateObjByFlag( 105387 ,781012 , 3 , 0 ) --i = �X�нs��  
	SetModeEx( BALL,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
	SetModeEx( BALL,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
	SetModeEx( BALL,EM_SetModeType_NotShowHPMP, false)--����ܦ��
	SetModeEx( BALL,EM_SetModeType_Strikback, false)--����
	SetModeEx( BALL,EM_SetModeType_Move, false)--����
	SetModeEx( BALL,EM_SetModeType_Fight, false)--�i�������
	SetModeEx( BALL,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
	SetModeEx( BALL,EM_SetModeType_Obstruct, false)--�|����(���ר�L������)
	AddToPartition( BALL, RoomID)
	CastSpelllv ( BALL , BALL , 496764 , 0 )
	sleep ( 30 )
	local No_face_CALLmt = CreateObjByFlag( 106095 ,781012 , 3 , 0 ) --i = �X�нs��  
	AddToPartition( No_face_CALLmt, RoomID)
	sleep ( 10 )
	SetAttack( No_face_CALLmt , play)
	say ( No_face , "[SC_ZONE21_L_MTS_02]")
	sleep ( 10 )
	DelObj ( BALL )
	DelObj ( No_face )
end
function cl_z21_106103_AI_2()  ----��v�~�HP-3
	local AI = OwnerID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	local open_door = 0
	SetPlot(  AI, "collision","cl_z21_106103_Welcome_range_2", 50 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	local door = CreateObjByFlag( 106197 , 781012 , 4 , 1 ) ------------���ͫ��
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---����(�O)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( door,RoomID ) ----����[�J����,�Ҧ椽��
	SetIdleMotion( door , ruFUSION_MIME_IDLE_STAND)
	WriteRoleValue ( door , EM_RoleValue_Register1 , AI )
	while 1 do
		sleep ( 10 )
		if ReadRoleValue ( AI , EM_RoleValue_Register2 ) == 1 then
			if open_door == 0 then
				SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN	)----------------------�����ʧ@
				SetModeEx ( door , EM_SetModeType_Obstruct, false ) 		---����(�O)
				sleep ( 10 )
				SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP	)----------------------�����ʧ@
				open_door = 1
			end
			sleep ( 50 )
			DelObj ( door )
			DelObj ( AI )
		end
		local fight = ReadRoleValue ( AI , EM_RoleValue_Register4 )
		if fight == 1 then
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 )
			WriteRoleValue ( AI , EM_RoleValue_Register4 , 0 )
		end
	end
end
function cl_z21_106103_Welcome_range_2()
	local AI = TargetID()
	local play = OwnerID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	local open = ReadRoleValue ( AI , EM_RoleValue_Register1 )
	local boss_rand = 0
	if open ~= 1 then
		if ReadRoleValue( play , EM_RoleValue_VOC ) ~= 0 then
			ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_08]" , 2 ) ----�V�ڰ^�m�A�̪��A��a�A���O�h�򪺴��i��
			sleep ( 20 )
			ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_07]" , 2 ) ----�V�ڰ^�m�A�̪��A��a�A���O�h�򪺴��i��
			sleep ( 10 )
			boss_rand = DW_Rand(3)
		--	say ( play , "boss_rand="..boss_rand)
			for i = 1 , 3 , 1 do
				local No_face = CreateObjByFlag( 106103 ,781012 , i+4 , 0 ) --i = �X�нs��
				AddToPartition( No_face, RoomID)
				if i == boss_rand then
					WriteRoleValue ( No_face , EM_RoleValue_Register1 , 1 )
				end
				SetAttack( No_face , play )
				WriteRoleValue ( No_face , EM_RoleValue_Register3 , AI )
				BeginPlot( No_face ,"cl_z21_106103_No_face_2_yes" , 0) --
				sleep ( 2 )
			end
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 )
		end
	end
end
function cl_z21_106103_No_face_2_yes()
	local No_face = OwnerID()
	local AI = ReadRoleValue ( No_face , EM_RoleValue_Register3 )
	local boss_NOB = ReadRoleValue ( No_face , EM_RoleValue_Register1 )
	local del_time = 0
	SetPlot(  No_face, "dead","cl_z21_106103_dead_2", 0 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
		sleep ( 10 )
		if boss_NOB ~= 1 then
			if ReadRoleValue ( AI , EM_RoleValue_Register2 ) == 1 then
				DelObj ( No_face )
			end
		end
		if HateListCount( No_face ) ~= 0 then ---�p�G������������H�N�~��԰�
		elseif HateListCount( No_face ) == 0 then ---�p�G������������H�N�~��԰�
			del_time = del_time + 1
			if del_time >= 10 then
				WriteRoleValue ( AI , EM_RoleValue_Register4 , 1 )
				DelObj ( No_face )
			end
		end
	end
end
function cl_z21_106103_dead_2()
	local No_face = OwnerID()
	local AI = ReadRoleValue ( No_face , EM_RoleValue_Register3 )
	local RoomID = ReadRoleValue ( No_face , EM_RoleValue_RoomID )
	local boss_NOB = ReadRoleValue ( No_face , EM_RoleValue_Register1 )
	if boss_NOB == 1 then
		WriteRoleValue ( AI , EM_RoleValue_Register2 , 1 )
		sleep ( 10 )
		ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_09]" , 2 ) ----�V�ڰ^�m�A�̪��A��a�A���O�h�򪺴��i��
		DelObj ( No_face )
	elseif boss_NOB ~= 1 then
		local X1 = ReadRoleValue ( No_face, EM_RoleValue_X)
		local Y1 = ReadRoleValue ( No_face, EM_RoleValue_Y)
		local Z1 = ReadRoleValue ( No_face, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
		local boss = CreateObj( 106103 , X1, Y1 , Z1 , 0 , 1 )  ------------�n�ͥX�z���D�I��d��100��AE
		WriteRoleValue ( boss , EM_RoleValue_Register3 , AI )
		WriteRoleValue( boss , EM_RoleValue_Register1 , boss_NOB )
		AddToPartition( boss, RoomID)
		ScriptMessage( AI , -1 , 2 ,"[SC_ZONE21_L_MTS_10]" , 2 ) ----�V�ڰ^�m�A�̪��A��a�A���O�h�򪺴��i��
		BeginPlot( boss ,"cl_z21_106103_No_face_2_yes" , 0) --�����X��+����H���P�_
		DelObj ( No_face )
	end
end
function cl_z21_EyeBall()  ----�]�����]���]©�ۦ�
	local Eyeball = OwnerID()
	local CombatBegin = 0
	local skill_time1 = 7
	local fighl_go = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( Eyeball , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( Eyeball ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				CombatBegin = 1       ------�N�����԰��}�l���A�ȧ令1~�N��N�O���i�J�԰��F
			end
			if CombatBegin == 1 then
				if fighl_go == 0 then
					CastSpelllv ( Eyeball , AttackTarget , 497585 , 100 )
					sleep ( 10 )
					fighl_go = 1
				end
				skill_time1 = skill_time1 + 1
				if skill_time1 >= 6 then
					CastSpelllv ( Eyeball , AttackTarget , 498261 , 100 )
				end
				if skill_time1 >= 13 then
					while 	ReadRoleValue( Eyeball , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(10)
					end
					Addbuff ( Eyeball , 620862 , 0 , -1 )
					local hate_Table = DW_HateRemain(0)  ----�N����������a�̷Ӥ��밪�C�ƦC�åB�ư��D�Z
					local hate=table.getn(hate_Table) ----���X��������ƶq
					local Rand_Num = DW_Rand(hate)  ----�H����@�ӭȥN��TABLE�̪���m
					local X1 = ReadRoleValue ( Eyeball, EM_RoleValue_X)
					local Y1 = ReadRoleValue ( Eyeball, EM_RoleValue_Y)
					local Z1 = ReadRoleValue ( Eyeball, EM_RoleValue_Z)   ---------�o�̬O���XAttackplayer�̭������ӤH���y��
					Addbuff ( hate_Table[Rand_Num] , 620866 , 0 , -1 )
					sysCastSpelllv ( Eyeball , hate_Table[Rand_Num] , 490344 , 0 )
					sleep ( 5 )
					CastSpelllv ( Eyeball , hate_Table[Rand_Num] , 498291 , 0 )
					sleep ( 110 )
					skill_time1 = 0
				end
			end
		elseif HateListCount ( Eyeball ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				skill_time1 = 0
				fighl_go = 0
			end
		end
	end
end
function cl_z21_eyeball_Slip() ------
	local player = OwnerID()
	local Slip_Number = 0
	Slip_Number = DW_Rand(100)
	if ( Slip_Number >= 1 and Slip_Number <= 10) or( Slip_Number >=21 and Slip_Number <= 30 ) or
	   ( Slip_Number >= 41 and Slip_Number <= 50 ) or ( Slip_Number >= 61 and Slip_Number <= 70 ) or
	   ( Slip_Number >= 81 and Slip_Number <= 90 ) then      ------------>���H���X�Ӫ��ȵ���H�W���üƴN�I��Ĥ@��
	   Addbuff ( player , 509284 , 0 , 1 )
	end
end
function cl_z21_106099_EyeBall()---���]�@���I������
	local eyesball = OwnerID()
	while 1 do
		sleep ( 10 )
		if CheckBuff( eyesball , 620868 ) ~= true then
			Addbuff ( eyesball , 620868 , 0 , 30 )
		end
	end
end
function cl_Z21_106099_SHOW_HIDE() ----�k�N�ˬd���W���S��BUFF
	if CheckBuff( TargetID() , 620868 ) == true then
		return true
	elseif CheckBuff( TargetID() , 620868 ) ~= true then
		return false
	end
end
-----------------------���ޥ�
function cl_Z21_05_06() --5~6.7����������
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106095,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106085,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106085,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106088,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(106086,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(106087,Matrix,3,1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(106080,Matrix,5,-1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(106080,Matrix,5,1)
	--ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark05_06" , 0 )
end
function cl_z21_wark05_06()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_05_06" , 0 )
end
function cl_Z21_05_06_NO2() --5~6.7����������
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106095,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106095,Matrix,1,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106085,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106088,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(106086,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(106087,Matrix,3,1)
	--ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,-1)
	--ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,1)
	--ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(106080,Matrix,4,0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark05_06_NO2" , 0 )
end
function cl_z21_wark05_06_NO2()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_05_06_NO2" , 0 )
end
function cl_Z21_04_05_NO2() --5~6.7����������
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- ���Ͷü�
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106092,Matrix,1,-1)
	BeginPlot( ObjMatrix[1] , "LuaS_Discowood_NowToHide" , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106092,Matrix,1,1)
	BeginPlot( ObjMatrix[2] , "LuaS_Discowood_NowToHide" , 0 )
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_z21_wark04_05_NO2" , 0 )
end
function cl_z21_wark04_05_NO2()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_Z21_04_05_NO2" , 0 )
end
function cl_z21_skillchack_HPfull()---�����b�T�{HP�O�_�w���˺A
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local MaxHP = ReadRoleValue( TargetID , EM_RoleValue_MaxHP )		--Ū��BOSS�`��q
	local NowHP = ReadRoleValue( TargetID , EM_RoleValue_HP )	
	local HPPercent = ( NowHP / MaxHP )*100	
	if HPPercent > 98 then
		return false
	elseif HPPercent < 97 then
		return true
	end
end