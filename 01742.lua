--�Ұʾ�
--EM_RoleValue_PID BOSS
--EM_RoleValue_Register1
--EM_RoleValue_Register2 
--EM_RoleValue_Register3 dead
--EM_RoleValue_Register4 
--EM_RoleValue_Register5
--EM_RoleValue_Register6 weapon
--EM_RoleValue_Register7 door
--EM_RoleValue_Register8 anyone
--EM_RoleValue_Register9 reset

--Boss
--EM_RoleValue_PID �Ұʾ�

--------------------------------------------------------------------------------�Ұʾ�
function Cang_127_edward_start()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Boss01 = CreateObjByFlag( 103155, 780586, 0, 1)	--�۴�	
	AddToPartition( Boss01 , RoomID )	--�[�i�R�x	
	WriteRoleValue( OwnerID() ,EM_RoleValue_PID, Boss01 )--BOSS�s�J�p�ɾ� R1
	WriteRoleValue( Boss01 ,EM_RoleValue_PID, OwnerID() )--�p�ɾ��s�JBOSS PID
	BeginPlot( OwnerID(), "Cang_127_edward_time" , 0)
	BeginPlot( OwnerID(), "Cang_127_edward" , 20)
	SetPlot( Boss01,"dead", "Cang_127_edward_dead" ,0 )	
	local Door
	Door = CreateObjByFlag( 103281, 780586, 5, 1)			
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Door  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Door  , EM_SetModeType_Move, false )--����
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Door  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Door  , EM_SetModeType_Strikback, false )--����
	SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door  , EM_SetModeType_Obstruct, false )--����
	AddToPartition( Door , RoomID )
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register7, 	Door)
	
	local Dead = 0 
	local reset = 0	--���m���q Ū��boss�O�_���}�԰�
	local CountDead = 0
	while true do
		sleep(10)
		reset = ReadRoleValue( OwnerID() ,EM_RoleValue_Register9 )--���m�^�ǭ�
		Dead = ReadRoleValue( OwnerID() ,EM_RoleValue_Register3 )--���`�^��
		if Dead == 1 then
			reset = 2
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, 	2)
			if CountDead == 0 then
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_103155_05]", 1 )					
				sleep(50)
				SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door  , EM_SetModeType_Obstruct, false )--����				
				DelObj(Door)				
				sleep(50)
				DelObj(OwnerID())
			end	
		end		
		if reset == 1 then
			sleep(30)
			DelObj( Boss01 )
			local start = CreateObjByFlag( 103492, 780586, 0, 1)
			SetModeEX( start  , EM_SetModeType_Gravity , false )--���O
			SetModeEx( start  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
			SetModeEx( start  , EM_SetModeType_Show, false )--���
			SetModeEx( start  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( start  , EM_SetModeType_Move, false )--����
			SetModeEx( start  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( start  , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( start  , EM_SetModeType_Strikback, false )--����
			AddToPartition( start , RoomID )
			SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
			SetModeEx( Door  , EM_SetModeType_Obstruct, false )--����
			DelObj( Door )
			BeginPlot( start, "Cang_127_edward_start" , 0)
			sleep( 30 )
			DelObj( OwnerID())
		end	
	end
end


--------------------------------------------------------------------------------���`�@��
function Cang_127_edward_dead() --�������^��	
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	SetModeEX( OwnerID()  , EM_SetModeType_Gravity , true )--���O
	local start = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)
	WriteRoleValue( start , EM_RoleValue_Register3 , 1)	--�g�JPID
	local air = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)
	if air == 1 then
		SetPosByFlag( OwnerID() , 780586 , 0 )
		air = 2
	end
	local out1 = CreateObj( 103277 , 4303, 401.5, 830, 314.1 , 1)
	SetModeEX( out1  , EM_SetModeType_Gravity , false )--���O
	--SetModeEx( out1  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( out1  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( out1  , EM_SetModeType_Hidename, false )--���q�Y����
	SetModeEx( out1  , EM_SetModeType_Move, false )--����
	SetModeEx( out1  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( out1  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( out1  , EM_SetModeType_Strikback, false )--����
	AddToPartition( out1 , RoomID )
	local out = CreateObj( 103889 , 4303, 381.1, 830, 314.1 , 1)
	SetModeEX( out  , EM_SetModeType_Gravity , false )--���O
	--SetModeEx( out  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( out  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( out  , EM_SetModeType_Hidename, false )--���q�Y����
	SetModeEx( out  , EM_SetModeType_Move, false )--����
	SetModeEx( out  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( out  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( out  , EM_SetModeType_Strikback, false )--����
	AddToPartition( out , RoomID )	
	BeginPlot( out, "zone_15_127_128_End", 0 )
end

--------------------------------------------------------------------------------�ĤG�����᪺script
function Cang_127_edward_restart()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Boss01 = CreateObjByFlag( 103155, 780586, 0, 1)--�۴�	
	AddToPartition( Boss01 , RoomID )	--�[�i�R�x	
	WriteRoleValue( OwnerID() ,EM_RoleValue_PID, Boss01 )--BOSS�s�J�p�ɾ� R1
	WriteRoleValue( Boss01 ,EM_RoleValue_PID, OwnerID() )--�p�ɾ��s�JBOSS PID
	BeginPlot( OwnerID(), "Cang_127_edward_time" , 0)
	BeginPlot( OwnerID(), "Cang_127_edward" , 20)
	SetPlot( Boss01,"dead", "Cang_127_edward_dead" ,0 )	
	--WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, 2)
	local Door	
	Door = CreateObjByFlag( 103281, 780586, 5, 1)			
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( Door  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( Door  , EM_SetModeType_Move, false )--����
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Door  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Door  , EM_SetModeType_Strikback, false )--����
	SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
	SetModeEx( Door  , EM_SetModeType_Obstruct, false )--����	
	AddToPartition( Door , RoomID )
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register7, 	Door)
	
	local Dead = 0 
	local reset = 0	--���m���q Ū��boss�O�_���}�԰�
	local CountDead = 0
	while true do
		sleep(10)
		reset = ReadRoleValue( OwnerID() ,EM_RoleValue_Register9 )--���m�^�ǭ�
		Dead = ReadRoleValue( OwnerID() ,EM_RoleValue_Register3 )--���`�^��
		if reset == 1 then
			sleep(30)		
			DelObj( Boss01 )
			local start = CreateObjByFlag( 103492, 780586, 0, 1)
			SetModeEX( start  , EM_SetModeType_Gravity , false )--���O
			SetModeEx( start  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
			SetModeEx( start  , EM_SetModeType_Show, false )--���
			SetModeEx( start  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( start  , EM_SetModeType_Move, false )--����
			SetModeEx( start  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( start  , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( start  , EM_SetModeType_Strikback, false )--����
			AddToPartition( start , RoomID )
			SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
			SetModeEx( Door  , EM_SetModeType_Obstruct, false )--����			
			DelObj( Door )			
			BeginPlot( start, "Cang_127_edward_restart" , 0)
			sleep( 30 )
			DelObj( OwnerID())
		end	
		if Dead == 1 then
			if CountDead == 0 then
				ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_103155_05]", 1 )			
				sleep(50)
				SetDefIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )
				SetModeEx( Door  , EM_SetModeType_Obstruct, false )--����				
				DelObj(Door)				
				sleep(50)
				DelObj(OwnerID())
			end	
		end
	end
end
--------------------------------------------------------------------------------�}������

--function Cang_127_Marsh_say()
	--Say( TargetID(), "1")
	--SetPlot( TargetID(), "range" , "" , 0 )
	--BeginPlot( TargetID(), "Cang_127_Marsh_say_01", 0 )
--end

--function Cang_127_Marsh_say_01()
	--Say( OwnerID(), "[SC_103155_01]")
	--local Boss = ReadRoleValue( OwnerID() ,EM_RoleValue_PID )
	--ScriptMessage( Boss , -1 , 2 ,  "[SC_103155_01]", 1 )
	--ScriptMessage( OwnerID() , -1 , 2 ,  "[SC_103155_01]", 1 )
	--sleep(50)
	--DelObj( OwnerID() )
--end

--------------------------------------------------------------------------------�g�ɾ���
function Cang_127_edward_time()--�g�ɾ���
	local Boss
	local Time = 0
	while true do
		sleep(10)
		Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	--��ؼЭ�
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- �ˬd�O�_���}�԰�
			Time = Time + 1
			if Time >= 600 then
				AddBuff( Boss , 506335 , 0 , -1 )
			end
		end
	end	
end

--------------------------------------------------------------------------------�D��SCRIPT
function Cang_127_edward()

	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local fight = 0		--1�N��i�J�԰�
	local skillsp = 0
	local count = 0
	local count1 = 0
	local count2 = 0
	local count3 = 0 
	local anyone 
	local CheckTime = 10
	local BossTarget
	local SkillShow
	local countskill = 0
	local skyskill = 0
	local bskill = 0
	local Doorstart = 0
	local air = 0
	local SkillDelay = { 2 , 2 , 3 }	-- �ޯੵ��ɶ�
		--
	local SkillID = { 495358, 495363, 495364 }	-- �ۦ�ID	
		--�a���B�ۦ�1�B�ۦ�2
	local SkillLV = { 4 , 4 , 4 }	--�ޯ൥��
		--
	local SkillSay = {"[SC_103155_02]"}
--�o�N�O�O�q�I�W�V�H�P�s�u�����O�q�I	
	local CountSay = { "[SC_103155_01]",  "[SC_103155_03]", "[SC_103155_04]", "[SC_103155_05]"   }
--�����A�O�֤��\�A�����J�ڪ��c��...���ǸӦ����u�z�����s���b���̡H�~�M���A�̨Ө�ڪ����e�A���Y���٬O�n�a�ۤv��...�����A�^���ڡA�O�����o�������A�̨Ӫ��ܡH�]�n�A���A�̷P���@�U�H�P�s�O�q�����X�a�I

--[$VAR1]�A���A����Ŧ�A�h���ܧִN�L�F�A�u�z����|���A���A�ߩȦ��`�C
--�@�A�q���B�V�U��A�A�̤��L�O�ڸ}���U�����ơA�@��Y�H�ڡI
--���I�I�ھ֦��s�ܰ����O�q���I�I�A�̳o�ǥ����O�L�k�����ڪ��I�I�ڬO�ȯZ�դ��Ӫ�...
	
	
	local Door = ReadRoleValue( OwnerID() ,EM_RoleValue_Register7 )
	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( Boss ) == true ) then  -- �ˬd�O�_���}�԰�
			if Doorstart == 0 then
				Say( Boss ,  CountSay[1] )			
				SetDefIdleMotion( Door,ruFUSION_MIME_ACTIVATE_LOOP)
				SetModeEx( Door , EM_SetModeType_Obstruct, true )--����
				Doorstart = 1
			end	
			fight = 1
			skillsp = skillsp + 1
			countskill = countskill + 1 
			skyskill = skyskill + 1
			--Say(Boss, "skillsp="..skillsp )
			--Say(Boss, "count="..count)
--------------�Ĥ@���q ���q���� ���ͬ�
			if skillsp >= 15 and count == 0 then
				if count1 == 0 then
					BeginPlot( OwnerID(), "Cang_127_edward_weapon" , 0)	--���ͪZ���[
					count = 1
					count1 = 1
				end
			end	
--------------�ĤG���q �S���				
			if skillsp >= 25 and count == 1 then	 
				if count2 == 0 then	--��@�ӰI�p���a
					local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
					local ThesePlayer = {}	
					local sway = {}
					for i=1,TempPlayer do
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							--if  ThesePlayer[i] ~= AttackTarget then
							sway[table.getn(sway)+1] = ThesePlayer[i]	
							--end--��Jsway�̭� 
						end					
					end	
					if table.getn(sway) ~= 0 then	
						anyone = DW_Rand(table.getn(sway))	--rand	
						WriteRoleValue( OwnerID() ,EM_RoleValue_Register8, sway[anyone]) 	--�Q�쪺�H
						CastSpellLV( Boss, sway[anyone], 495359 , 1 ) --�j�H	
						
						local MessageString
						local PlayerName = GetName( sway[anyone] )
						MessageString = "[SC_103155_03][$SETVAR1="..PlayerName.."]" ----�bstring���i�H�q�X���a���W�r
						ScriptMessage( Boss , -1 , 2 ,  MessageString, 1 )
						Yell( Boss , MessageString , 5)						
					end
					SetModeEx( Boss , EM_SetModeType_Move, false )
					--CastSpellLV( Boss, Boss, 495360 , 1 ) --����
					--Sleep(50)
					while 	ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0   do
						sleep(3)
					end					
					SetAttack( Boss , sway[anyone] )
					CastSpellLV( Boss, sway[anyone] , 495357 , 5 )
					sleep(20)
					SetModeEx( Boss , EM_SetModeType_Move, true )
					count2 = 1
				end	
			end	
--------------�ɪŶ��q
			if skillsp >= 33 and count == 1 then
				count = 2
			end
			if skillsp >= 35 and count == 2 then	
				if count3 == 0 then
					air = 1
					WriteRoleValue( Boss ,EM_RoleValue_Register1, 	1)
					Addbuff(Boss , 506336 , 1, -1)
					SetModeEx( Boss   , EM_SetModeType_Move, false )--����
					SetModeEX( Boss   , EM_SetModeType_Gravity , false )--���O
					SetModeEx( Boss  , EM_SetModeType_Fight , false )--�i�������					
					--SetPosByFlag( Boss , 780586 , 0 )	--�ǰe����o�ӧ����I
					SetPos( Boss , 4277 , 450 , 956 , 0 )
					ScriptMessage( Boss , -1 , 2 ,  CountSay[3], 1 )
					count3 = 1
					bskill = 1
				end
			end
--------------�^�k�a��
			if skillsp >= 58 and count == 2 then
				count = 3				
			end
			if skillsp >= 60 and count == 3 then
				air = 0
				WriteRoleValue( Boss ,EM_RoleValue_Register1, 0)
				bskill = 0
				CancelBuff(Boss , 506336 )
				SetModeEx( Boss   , EM_SetModeType_Move, true )--����
				SetModeEX( Boss   , EM_SetModeType_Gravity , true )--���O
				SetModeEx( Boss  , EM_SetModeType_Fight , true )--�i�������
				SetPosByFlag( Boss , 780586 , 0 )	--�ǰe����o�ӧ����I			
			
				skillsp = 0
				count = 0
				count1 = 0
				count2 = 0
				count3 = 0
			end
		end
--------------���q�ޯ�I��		
		if countskill >= 5 then
			if count == 0 or count == 1 or count == 3 then
				local SkillRND = DW_Rand ( 100 ) 
				if SkillRND <= 100 and SkillRND > 75 then 
					SkillShow = 1	--
					BossTarget = Boss					
				elseif SkillRND <= 75 and SkillRND > 50 then 
					SkillShow = 2	--
					BossTarget = AttackTarget						
				elseif SkillRND <= 50 and SkillRND > 25 then 
					SkillShow = 3	--
					BossTarget = Boss										
				elseif SkillRND <= 25 and SkillRND > 0 then 
					SkillShow = 3	--
					BossTarget = Boss					
				end	
				SkillB = 0
				--Say( Boss , "SkillShow="..SkillShow)
				if SkillShow == 1 then
					ScriptMessage( Boss , -1 , 2 ,  SkillSay[1], 1 )
				end	
				while 	ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0   do
					sleep(3)
				end
				CastSpellLV( Boss , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
				Sleep( SkillDelay[SkillShow] * CheckTime )	
				SkillShow = 0
				countskill = 0
			end	
			if count == 2 and bskill == 1 then
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
				local ThesePlayer = {}	
				local sway = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
					if CheckID( ThesePlayer[i] ) == true and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
					--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
						--if  ThesePlayer[i] ~= AttackTarget then
						sway[table.getn(sway)+1] = ThesePlayer[i]	
						--end--��Jsway�̭� 
					end					
				end	
				if table.getn(sway) ~= 0 then	
					anyone = DW_Rand(table.getn(sway))		
					CastSpellLV( Boss, sway[anyone], 495366 , 1 ) 
				end	
				countskill = 0
			end	
		end
		if (  AttackTarget == 0 ) and ( CheckID( Boss ) == true ) and fight == 1 then
			count = 0
			count1 = 0
			count2 = 0
			count3 = 0
			fight = 0
			skillsp = 0
			WriteRoleValue( OwnerID() ,EM_RoleValue_Register9, 1) 
		end
	end	
end

--------------------------------------------------------------------------------���ͪZ���[
function Cang_127_edward_weapon()
	local weapon01, weapon02, weapon03, weapon04	--�|�ӪZ���[
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local SkillRND = DW_Rand ( 4 ) 	--���ͪZ���[
	if SkillRND == 1 then
		weapon01 = CreateObjByFlag( 114951, 780586, 1, 1)			
		SetModeEx( weapon01  , EM_SetModeType_HideName, false )--�W��	
		SetModeEX( weapon01  , EM_SetModeType_Gravity , false )--���O
		SetModeEx( weapon01  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
		SetModeEx( weapon01  , EM_SetModeType_Move, false )--����
		SetModeEx( weapon01  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( weapon01  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( weapon01  , EM_SetModeType_Strikback, false )--����	
		AddToPartition( weapon01 , RoomID )	
		CastSpellLV( weapon01, weapon01, 494319 , 1 )
		SetPlot( weapon01, "touch" , "Cang_127_edward_shield" ,10 )
		AddBuff( weapon01, 506430, 0, -1)
		WriteRoleValue( weapon01 , EM_RoleValue_Livetime, 20 )	
		WriteRoleValue(	weapon01 , EM_RoleValue_PID, OwnerID() )
		BeginPlot( weapon01, "Cang_127_edward_wpend" ,10 )
	elseif SkillRND == 2 then
		weapon02 = CreateObjByFlag( 114951, 780586, 2, 1)			
		SetModeEx( weapon02  , EM_SetModeType_HideName, false )--�W��	
		SetModeEX( weapon02  , EM_SetModeType_Gravity , false )--���O
		SetModeEx( weapon02  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
		SetModeEx( weapon02  , EM_SetModeType_Move, false )--����
		SetModeEx( weapon02  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( weapon02  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( weapon02  , EM_SetModeType_Strikback, false )--����
		AddToPartition( weapon02 , RoomID )	
		CastSpellLV( weapon02, weapon02, 494319 , 1 )
		SetPlot( weapon02, "touch" , "Cang_127_edward_shield" ,10 )
		AddBuff( weapon02, 506430, 0, -1)
		WriteRoleValue( weapon02 , EM_RoleValue_Livetime, 20 )
		WriteRoleValue(	weapon02 , EM_RoleValue_PID, OwnerID() )
		BeginPlot( weapon02, "Cang_127_edward_wpend" ,10 )		
	elseif SkillRND == 3 then
		weapon03 = CreateObjByFlag( 114951, 780586, 3, 1)
		SetModeEx( weapon03  , EM_SetModeType_HideName, false )--�W��	
		SetModeEX( weapon03  , EM_SetModeType_Gravity , false )--���O
		SetModeEx( weapon03  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
		SetModeEx( weapon03  , EM_SetModeType_Move, false )--����
		SetModeEx( weapon03  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( weapon03  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( weapon03  , EM_SetModeType_Strikback, false )--����
		AddToPartition( weapon03 , RoomID )		
		CastSpellLV( weapon03, weapon03, 494319 , 1 )
		SetPlot( weapon03, "touch" , "Cang_127_edward_shield" ,10 )
		AddBuff( weapon03, 506430, 0, -1)	
		WriteRoleValue( weapon03 , EM_RoleValue_Livetime, 20 )
		WriteRoleValue(	weapon03 , EM_RoleValue_PID, OwnerID() )
		BeginPlot( weapon03, "Cang_127_edward_wpend" ,10 )		
	elseif SkillRND == 4 then
		weapon04 = CreateObjByFlag( 114951, 780586, 4, 1)				
		SetModeEx( weapon04  , EM_SetModeType_HideName, false )--�W��	
		SetModeEX( weapon04  , EM_SetModeType_Gravity , false )--���O
		SetModeEx( weapon04  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
		SetModeEx( weapon04  , EM_SetModeType_Move, false )--����
		SetModeEx( weapon04  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( weapon04  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( weapon04  , EM_SetModeType_Strikback, false )--����
		AddToPartition( weapon04 , RoomID )	
		CastSpellLV( weapon04, weapon04, 494319 , 1 )
		SetPlot( weapon04, "touch" , "Cang_127_edward_shield" ,10 )
		AddBuff( weapon04, 506430, 0, -1)	
		WriteRoleValue( weapon04 , EM_RoleValue_Livetime, 20 )	
		WriteRoleValue(	weapon04 , EM_RoleValue_PID, OwnerID() )
		BeginPlot( weapon04, "Cang_127_edward_wpend" ,10 )	
	end
end

--------------------------------------------------------------------------------�Z���[�����abuff
function Cang_127_edward_shield()		
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )	
	SetPlot( TargetID()  ,"touch", "" ,0 )
	CancelBuff( TargetID() , 506430 )
	AddBuff( OwnerID(), 506327, 0 , 20)
	SetModeEx( TargetID() , EM_SetModeType_Mark, false )--�аO
	Hide( TargetID() )
	sleep(10)
	DelObj( TargetID() )
end

--------------------------------------------------------------------------------�ޯ��ˬd��
function Cang_127_edward_shieldcancel()
	CancelBuff( TargetID() , 506327 )
end

--------------------------------------------------------------------------------�խߤ�������
function Cang_127_edward_summom()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 103280, TargetID() )
	SetModeEx( SpellCaster  , EM_SetModeType_HideName, false )--�W��
	SetModeEX( SpellCaster  , EM_SetModeType_Gravity , false )--���O
	SetModeEx( SpellCaster  , EM_SetModeType_ShowRoleHead, false )--���q�Y����
	SetModeEx( SpellCaster  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( SpellCaster  , EM_SetModeType_Move, false )--����
	SetModeEx( SpellCaster  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( SpellCaster  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( SpellCaster  , EM_SetModeType_Strikback, false )--����	
	AddToPartition( SpellCaster , RoomID )	--�[�i�R�x	

	WriteRoleValue( SpellCaster , EM_RoleValue_Livetime, 25 )--�s�b�ɶ�	
	BeginPlot( SpellCaster , "Cang_127_edward_summomskill" , 0)
end

function Cang_127_edward_summomskill()
	AddBuff( OwnerID() , 506428 , 1 , -1 )
	sleep(50)
	CancelBuff( OwnerID() , 506428 )
	AddBuff( OwnerID() , 506429 , 1 , -1 )
end

--------------------------------------------------------------------------------�Z���[�B�~�R���]�w
function Cang_127_edward_wpend()

	local start = ReadRoleValue( OwnerID() ,EM_RoleValue_PID )--�^�ǭ�
	while true do
		sleep(10)
		reset = ReadRoleValue( start ,EM_RoleValue_Register9 )--���m�^�ǭ�
		Dead = ReadRoleValue( start ,EM_RoleValue_Register3 )--���`�^��	
		if reset == 1 or dead == 1 then
			DelObj( OwnerID() )
		end
	end
end