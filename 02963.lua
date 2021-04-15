----------------------------------------------------------------------------
--���O�_�n�Ұ�3�����������P�_
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_Start()
	local Owner = OwnerID()	--�����̥���
	local CtrlCentralID = 103075	--��������s��
	local CtrlCentral = 0 --�������
	local RangeNPCTable = SearchRangeNPC( Owner , 2000 ) --����Z��2000���Ҧ�NPC
	for I = 0 , #RangeNPCTable do
		if ReadRoleValue ( RangeNPCTable[ I ] , EM_RoleValue_OrgID  ) == CtrlCentralID then	--�ˬd�O�_��������
			CtrlCentral = RangeNPCTable[ I ]	--�⤤����GUID�O�U
			break
		end
	end
	
	local StickID = 209464	--���������������
	local RangePlayerTable = SearchRangePlayer( CtrlCentral , 2000 ) --����������Z��2000���Ҧ����a
	for J = 0 , #RangePlayerTable do
		if CountBodyItem( RangePlayerTable[ J ] , StickID ) >= 1 then
			BeginPlot( CtrlCentral , "YOYO_Zone27D_Boss3_Ctrl" , 0 )	--�Ұ�Boss������
			DelBodyItem( RangePlayerTable[ J ] , StickID , 1 )	--�R���������������
			return
		end
	end
	--Say( CtrlCentral , "No one holds a stick... (Test Message)" )
end
----------------------------------------------------------------------------
--��BOSS���ͻP���Ҫ������@��
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_Ctrl()
	--����s��
	local FlagID = 781317	--�X�нs��
	local EasyBossID = 108178	--²��ƥ�BOSS�s��
	local NormalBossID = 108176	--���q�ƥ�BOSS�s��
	local RaidBossID = 107834	--�x���ƥ�BOSS�s��
	local DoorID = 106249	--���ת�����s��

	--�X��
	local BossFlag = 0	--BOSS�����I�X�и�
	local BeforeDoorFlagID = 1	--�e���X�и�
	local AfterDoorFlagID = 2	--����X�и�
	local CombatBegin = 0	--�}�ԺX��
	
	--����
	local CtrlCentral = OwnerID() --�������
	local Boss	--Boss����
	local BeforeDoor	--�e��
	local AfterDoor	--���

	local AppearedTalk = { "[SC_107834_01]" , "[SC_107834_02]" }	--Boss�{���w�i�r��
	local BossTalk = { "[SC_107834_03]" , "[SC_107834_04]" , "[SC_107834_05]" }	--Boss�԰��e��۸ܦr��
	local ZoneID = ReadRoleValue( CtrlCentral , EM_RoleValue_ZoneID )	--�ƥ�����
	local RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )	--�ƥ��мh��
	local BossShowTime = 10	--�T���X�{��Boss�{�������
		
	local BossID	--��Ӱƥ��_�᪺��Boss�s��
	if ZoneID == 159 then	BossID = EasyBossID	--²�� 159
	elseif ZoneID == 158 then	BossID = NormalBossID	--���q 158
	else	BossID = RaidBossID	end	--�x�� 157

	--�ͦ����
	AfterDoor = CreateObjByFlag( DoorID , FlagID , AfterDoorFlagID , 1 )
	SetModeEx( AfterDoor , EM_SetModeType_Mark , false )	--���i�I��
	SetModeEx( AfterDoor , EM_SetModeType_HideName , false )	--����ܦW��
	SetModeEx( AfterDoor , EM_SetModeType_NotShowHPMP , false )	--����ܦ��
	SetModeEx( AfterDoor , EM_SetModeType_Strikback , false )	--���|����
	SetModeEx( AfterDoor , EM_SetModeType_Move , false )	--���|����
	SetModeEx( AfterDoor , EM_SetModeType_Fight , false )	--���i����
	SetModeEx( AfterDoor , EM_SetModeType_Searchenemy , false )	--���|����
	SetModeEx( AfterDoor , EM_SetModeType_Obstruct , true )	--�����׮ĪG
	AddToPartition( AfterDoor , RoomID)
	

	sleep( BossShowTime * 3 )	--���W�@����ۧ����ɶ�
	ScriptMessage( CtrlCentral, -1 , 2 , AppearedTalk[ 1 ] , 2 )	--Boss�Y�N�{���w�i
	sleep( BossShowTime * 10 )	--�����a�ǳƪ��ɶ�
	ScriptMessage( CtrlCentral, -1 , 2 , AppearedTalk[ 2 ] , 2 )	--Boss���{�I
	
	Boss = CreateObjByFlag(BossID , FlagID , BossFlag , 1 )	--�ͦ�Boss
	AddToPartition( Boss , RoomID )
	--Boss�P���������誺GUID�g�J�ۤv��PID
	--WriteRoleValue( CtrlCentral , EM_RoleValue_PID , Boss )
	--WriteRoleValue( Boss , EM_RoleValue_PID , CtrlCentral )
	--CallPlot( AfterDoor ,"KJ_28BOSS3_tokenRULE", BossID );--backdoor auto destroy--131202 K.J. Aris


	--���ȻݨD�G�P�_���ȵ����X��
	local RangePlayerTable = LUA_YOYO_RangePlayerNotGM( Boss , 2000 ) --���Boss�Z��2000���Ҧ����a�A�ư�GM
	for I = 1 , #RangePlayerTable do
		if CheckAcceptQuest( RangePlayerTable[ I ] , 426476 ) == true then
			SetFlag( RangePlayerTable[ I ] , 548385 , 1 )
		end
	end

	while true do
		sleep( 10 )
		if HateListCount( Boss ) ~= 0 then	--������H
			if CombatBegin == 0 then	--�}�ԺX�Х��}
				CombatBegin = 1	--�N�}�ԺX�г]�����}
				BeginPlot( Boss , "YOYO_Zone27D_Boss3_Fight" , 0 )
				CallPlot( Boss , "YOYO_Zone27D_Boss3_ViolentTimer" )
				ScriptMessage( Boss, -1 , 2 , BossTalk[ 1 ] , 2 )	--BOSS�}�Զ��n
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 )	--Register1��Boss��function�Ϊ��԰��X�СA1  = �}�l�԰�
				
				--�ͦ��e��
				BeforeDoor = CreateObjByFlag( DoorID , FlagID , BeforeDoorFlagID , 1 )
				SetModeEx( BeforeDoor , EM_SetModeType_Mark , false )	--���i�I��
				SetModeEx( BeforeDoor , EM_SetModeType_HideName , false )	--����ܦW��
				SetModeEx( BeforeDoor , EM_SetModeType_NotShowHPMP , false )	--����ܦ��
				SetModeEx( BeforeDoor , EM_SetModeType_Strikback , false )	--���|����
				SetModeEx( BeforeDoor , EM_SetModeType_Move , false )	--���|����
				SetModeEx( BeforeDoor , EM_SetModeType_Fight , false )	--���i����
				SetModeEx( BeforeDoor , EM_SetModeType_Searchenemy , false )	--���|����
				SetModeEx( BeforeDoor , EM_SetModeType_Obstruct , true )	--�����׮ĪG
				AddToPartition( BeforeDoor , RoomID )
			end
		end
	
		if HateListCount( Boss ) == 0 and CombatBegin == 1 then	--�����S�H�A�}�ԺX�Фw�}
			if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0 then	--BOSS�٦s��
				CombatBegin = 0	--�N�}�ԺX�г]������
				DelObj( Boss )	--�R��BOSS
				Delobj( BeforeDoor )	--�R���e��
				ScriptMessage( Boss, -1 , 2 , BossTalk[ 2 ] , 2 )	--�s��BOSS�ӧQ�Ũ�
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 )	--Register1��BOSS��function�Ϊ��԰��X�СA0  = �����԰�
				BeginPlot( CtrlCentral , "YOYO_Zone27D_Boss3_Clearance" , 0 )
				sleep( 50 )
				
				RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )	--�ƥ��мh��
				Boss = CreateObjByFlag( BossID , FlagID , BossFlag , 1 )	--���mBOSS
				AddToPartition( Boss , RoomID )
				--Boss�P���������誺GUID�g�J�ۤv��PID
				--WriteRoleValue( CtrlCentral , EM_RoleValue_PID , Boss )
				--WriteRoleValue( Boss , EM_RoleValue_PID , CtrlCentral )
			end
		end			
			
		if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 then	--BOSS�w���`
			CombatBegin = 0	--�N�}�ԺX�г]������
			Delobj( BeforeDoor )	--�R���e��
			Delobj( AfterDoor )	--�R�����
			ScriptMessage( Boss, -1 , 2 , BossTalk[ 3 ] , 2 )	--�s��BOSS���`���
			WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 )	--Register1��Boss��function�Ϊ��԰��X�СA0  = �����԰�
			BeginPlot( CtrlCentral , "YOYO_Zone27D_Boss3_Clearance" , 0 )
			sleep( 50 )
			break	--�����������P�_�j��
		end
	end
end
----------------------------------------------------------------------------
--��Boss���԰�AI
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_Fight()
	--�@�ǳ]�w
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID)	--�ƥ��мh��
	local SkillTalk = { "[SC_107834_06]" , "[SC_107834_07]" , "[SC_107834_08]" }	--�ޯ���������
	local ZoneID = ReadRoleValue( Boss , EM_RoleValue_ZoneID )	--�ƥ�����
	local PowerLv	--�ƥ����׹������ޯ൥��
	if ZoneID == 159 then	PowerLv = 0	--²�� 159
	elseif ZoneID == 158 then	PowerLv = 1	--���q 158
	else	PowerLv = 2	end	--�x�� 157
	
	--�ޯ�P���A
	local SkillA_DeBuff = 501945	-- �H�Y���� (���A)
	local SkillB_DeBuffTable = { 500300 , 500301 , 500302 , 500303 , 500304 }	-- �������� (���A)
	local SkillC = 491548	--��������
	local SkillD = 491547	--�a������
	local SkillE = 490046	--�P�R����
	
	--�ޯ�N�o
	local SkillCtime = 7		--�I�k���j�G�������� (7��)
	local SkillDtime = 10		--�I�k���j�G�a������ (10��)
	local SkillETime = 30	--�I�k���j�G�P�R���� (30��)
	
	--�䥦�ܼ�
	local IntoP2HP = 40	--�i�J�ĤG���q����q
	local BossTime = 0	--Boss�԰��p�ƾ�
	local P2SkillBFlag = 0	--�i�J�ĤG���q�ɡA�ˬd���������O�_�I�i�L���X��
	
	--�ޯ�E �u�źx���������
	local WhirlpoolID = 103372	--�u�ű۴�����
	local WhirlpoolFlag = 781322	--�u�źx���X��
	local BuffID = 500054	--�u�ű۴��S�ĥ���
	local WhirlpoolCount = 2	--�u�ű۴����ƶq
	local WhirlpoolTable = {}
	
	--�}���Y�I�ĪGA �H�Y����
	--Say( Boss , "---- SkillA ----" )
	local RangePlayerTable = LUA_YOYO_RangePlayerNotGM_EX( Boss , 2000 , true ) --����ۤv�Z��2000���Ҧ����a�A�ư�GM
	if #RangePlayerTable > 0 then
		for I = 1 , #RangePlayerTable do
			AddBuff( RangePlayerTable[ I ] , SkillA_DeBuff , 0 , -1 )	--�}�ԮɥߧY���ƥ��������a�����H�Y�������A
		end
	else
	--	Say( Boss , "SkillA Nobody Nearby... (Test Message)" )
	end
	
	--�}���Y�I�ĪGB ��������
	--Say( Boss , "---- SkillB ----" )
	if #RangePlayerTable >= 3 then	--�ϰ줺���a�ƶq >= 3�H
		for I = 1 ,  3 do
			AddBuff( RangePlayerTable[ I ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )
		end
		
	elseif #RangePlayerTable == 2 then	--�ϰ줺�u��2�W���a
		for I = 1 ,  2 do
			AddBuff( RangePlayerTable[ I ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )
		end
		AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ 3 ] , PowerLv , -1 )	--�M���1��A+1�T��������
		
	elseif #RangePlayerTable == 1 then	--�ϰ줺�u��1�W���a
		for I = 1 ,  3 do
			AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )	--�M���1��@�n�Ө�3�o��������
		end

		else	--Say( Boss , "SkillB No Player... (Test Message)" )
	end

	while true do
		Sleep(10)
		BossTime = BossTime + 1
		--Say( Boss , "-Time " .. BossTime .. " -" )	--�p�ƾ�

		--C ��������
		if BossTime % SkillCtime == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do	--���S�����b�I��ޯ�
				sleep(2)	end
			--Say( Boss , "---- SkillC ----" )
			local NowTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
			CastSpellLV( Boss , NowTarget , SkillC , PowerLv )
		end
		
		--D �a������
		if BossTime % SkillDtime == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do	--���S�����b�I��ޯ�
				sleep(2)	end
			--Say( Boss , "---- SkillD ----" )
			CastSpellLV( Boss , Boss , SkillD , PowerLv )
			ScriptMessage( Boss, -1 , 2 , SkillTalk[ 1 ] , 2 )	--BOSS�s���I��a������
		end
		
		--E �u�ű۴� + �P�R����
		if BossTime % SkillEtime == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do	--���S�����b�I��ޯ�
				sleep(2)	end
			--Say( Boss , "---- SkillE ----" )
			local SkillECastTime = 5	--�P�R�������۩G��t���
			local SkillECastFX = 500059	--�P�R�������۩G��t�S��
			if Lua_PercentHP( Boss ) <= IntoP2HP then	--�p�G�i�JP2�A���ܯu�źx���ƶq�A�H�έP�R�������۩G�ɶ�
				WhirlpoolCount = 1
				SkillECastTime = 8
			else
				WhirlpoolCount = 2
				SkillECastTime = 10
			end
				
			for I = 0 , WhirlpoolCount - 1 do
				local RandNumber = RandRange( 1 , 3 )
				local RandFlagID = I + 3 * ( RandNumber - 1 )	--�H���X�Ц�m
				WhirlpoolTable[ I ] = CreateObjByFlag( WhirlpoolID , WhirlpoolFlag , RandFlagID , 1 ) --���ͤ@�T���Ϊ���b�H���X�Ц�m
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_Fight, false ) --���i����
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_Searchenemy, false ) --���|����
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_Strikback , false ) --���|����
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_Mark , false ) --���i�I��
				SetModeEx( WhirlpoolTable[ I ], EM_SetModeType_NotShowHPMP, false ) --����ܦ��
				SetModeEx( WhirlpoolTable[ I ] , EM_SetModeType_HideName , false ) --����ܦW��
				AddToPartition( WhirlpoolTable[ I ] , RoomID )
				AddBuff( WhirlpoolTable[ I ] , BuffID , 0 , -1 ) --�N�u�ű۴��S�ĥ����I��b���Ϊ���W
			end
			ScriptMessage( Boss , -1 , 2 , SkillTalk[ 2 ] , 2 )	--BOSS�s���I��a������
			
			--�ѩ�P�R�����I�i�k�N���X�|�����v�I�񥢱ѡA�ҥH���Script��t���覡�Ӱ���t
			SetModeEx( Boss , EM_SetModeType_Fight , false )	--���i����
			SetModeEx( Boss , EM_SetModeType_Move , false )	--���|����
			PlayMotionEX( Boss , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )	--�I�i�۩G�`��
			AddBuff( Boss , SkillECastFX , 0 , -1 )	--����۩G�S��
			sleep( SkillECastTime * 10 )	--�۩G��t�ɶ�
			PlayMotion( Boss , ruFUSION_ACTORSTATE_CAST_END )	--�����I�i�`��
			CancelBuff( Boss , SkillECastFX )	--�����۩G�S��
			SysCastSpellLV( Boss , Boss , SkillE , 0 )
			PlayMotion( Boss , ruFUSION_ACTORSTATE_CAST_SP02 )	--����I�i�ޯ�ʧ@
			SetModeEx( Boss , EM_SetModeType_Fight , true )	--���i����
			SetModeEx( Boss , EM_SetModeType_Move , true )	--���|����
		end

		--�i�JP2���q�A�W�[2�T��������
		if Lua_PercentHP( Boss ) <= IntoP2HP and P2SkillBFlag == 0 then
			P2SkillBFlag = 1
			--Say( Boss , "---- P2 SkillB ----" )
			RangePlayerTable = LUA_YOYO_RangePlayerNotGM_EX( Boss , 2000 , true ) --����ۤv�Z��2000���Ҧ����a�A�ư�GM
			
			if #RangePlayerTable >= 2 then	--�ϰ줺���a�ƶq >= 2�H
				for I = 1 ,  2 do
					AddBuff( RangePlayerTable[ I ] , SkillB_DeBuffTable[ I + 3 ] , PowerLv , -1 )
				end
		
			elseif #RangePlayerTable == 1 then	--�ϰ줺�u��1�W���a
				for I = 1 ,  2 do
					AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ I + 3 ] , PowerLv , -1 )	--�M���1��@�n�Ө�3�o��������
				end

				else	--Say( Boss , "SkillB No Player... (Test Message)" )
			end
			ScriptMessage( Boss, -1 , 2 , SkillTalk[ 3 ] , 2 )	--BOSS�s���i�JP2���q
		end
		
		--�ˬd���W���������ƶq�O�_����
		RangePlayerTable = LUA_YOYO_RangePlayerNotGM_EX( Boss , 2000 , true ) --����ۤv�Z��2000���Ҧ����a�A�ư�GM
		local PressureBuffFlag = { 0 , 0 , 0 , 0 , 0 }	--�ΨӰO�����W���������X�Ъ��}�C

		for I = 1 , #RangePlayerTable do	--�N���W�����������X�еn�O�ܰ}�C��
			for J = 1 , #SkillB_DeBuffTable do
				if CheckBuff( RangePlayerTable[ I ] , SkillB_DeBuffTable[ J ] ) == true then
					PressureBuffFlag[ J ] = 1
				end
			end
		end
		
		for I = 1 , #PressureBuffFlag do
			if PressureBuffFlag[ I ] == 0 then	--�Y���������ƶq�����A�h�A�ɤW���d�򤺳̪񪺪��a
				if I > 3 then	--�i�JP2�ɤ~�ˬd4�B5���X��
					if Lua_PercentHP( Boss ) <= IntoP2HP then
						AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )
					end
				else
					AddBuff( RangePlayerTable[ 1 ] , SkillB_DeBuffTable[ I ] , PowerLv , -1 )
				end
			end
		end
		
	end
end
----------------------------------------------------------------------------
--��Boss�g�ɭp�ƾ��P�g�ɪ��A
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_ViolentTimer()
	local Boss = OwnerID()
	local ZoneID = ReadRoleValue( Boss , EM_RoleValue_ZoneID )	--�ƥ�����
	local ViolentBuff = 502107	--�g�ɪk�N�s��
	local BossTimer = 0	--BOSS�p�ƾ�
	local ViolentTime = 480	--BOSS�g�ɪ��ɶ�(8����)
	local ViolentFlag = 0	--�ˬd�g�ɬO�_�w�I�i�L���X��
	local SkillTalk = "[SC_107834_09]" 	--BOSS�g�ɪ����

	if( ZoneID == 158 ) then ViolentTime = 360; end
	if( ZoneID == 159 ) then return end

	while true do
		Sleep(10)
		BossTimer = BossTimer + 1
		--�g��
		if BossTimer > ViolentTime and ViolentFlag == 0 then
			ViolentFlag = 1
			AddBuff( Boss , ViolentBuff , 0 , -1 )
			ScriptMessage( Boss, -1 , 2 , SkillTalk , 2 )	--BOSS�s���i�J�g��
		end
	end
end
----------------------------------------------------------------------------
--��Boss�����԰���M��
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_Clearance()
	local CtrlCentral = OwnerID()	--�������
	local RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )	--�ƥ��мh��
	local SkillA_DeBuff = 501945	-- �H�Y���� (���A)
	local SkillB_DeBuffTable = { 500300 , 500301 , 500302 , 500303 , 500304 }	-- �������� (���A)
	local SkillD_DeBuff = 500672 --�a������ (�w�����A)
	local WhirlpoolID = 103372	--�u�ű۴�����
	
	local PlayerList = LUA_YOYO_GetAllPlayer( RoomID ) --�C�X���W���Ҧ����a�s��
	for I = 1 , #PlayerList do
		CancelBuff( PlayerList[ I ] , SkillA_DeBuff ) --�M���H�Y����
		CancelBuff( PlayerList[ I ] , SkillD_DeBuff ) --�M���a������
		for J = 1 , #SkillB_DeBuffTable do
			CancelBuff( PlayerList[ I ] , SkillB_DeBuffTable[ J ] ) --�M����������
		end
	end
	
	local WhirlpoolList = LUA_YOYO_GetSpecificNPC( RoomID , WhirlpoolID )	--���X���W�Ҧ����u�ű۴�����
	for I = 1 , #WhirlpoolList do
		DelObj( WhirlpoolList[ I ] )	--�M���u�ű۴�
	end
end
----------------------------------------------------------------------------
--�������������ǬV����
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_SkillB( Pieces )
	local Oneself = OwnerID()	--�ۤv
	local ZoneID = ReadRoleValue( Oneself , EM_RoleValue_ZoneID )	--�ƥ�����
	local PowerLv	--�ƥ����׹������ޯ൥��
	if ZoneID == 159 then	PowerLv = 0	--²�� 159
	elseif ZoneID == 158 then	PowerLv = 1	--���q 158
	else	PowerLv = 2	end	--�x�� 157
	
	local PressureBuff = { 500300 , 500301 , 500302 , 500303 , 500304 }	--��������
	local SuffocationBuff = 500120	--����

	local _EffectiveRange = 30;--����ۤv�Z��30���Ҧ����a	131202 K.J. Aris
	if ( ReadRoleValue( Oneself , EM_RoleValue_IsDead ) == 1 ) then--�Y���a���`  �h��ܧ�j���d��ǻ� 131202 K.J. Aris
		_EffectiveRange = 300;--131202 K.J. Aris
	end--131202 K.J. Aris

	local RangePlayerTable = LUA_YOYO_RangePlayerNotGM_EX( Oneself , _EffectiveRange , true ) --����ۤv�Z��30���s�����a�A�ư�GM--702774
	local RangePlayerDisTable = {}
	
	if #RangePlayerTable ~= 0 then
		for I = 1 , #RangePlayerTable do
			RangePlayerDisTable[ I ] = GetDistance( Oneself , RangePlayerTable[ I ] ) --���o���񪱮a�M�椤�Ҧ����a���Z��
		end
		RangePlayerTable , RangePlayerDisTable = LUA_YOYO_Sequence( RangePlayerTable , RangePlayerDisTable , 0 )	--�̶Z�����W�Ƨ�
		
		local _selectedTarget = RangePlayerTable[ 1 ];--131202 K.J. Aris
		if ( ReadRoleValue( Oneself , EM_RoleValue_IsDead ) == 1 ) then--�Y�ؼЪ��a���`  �h���s�P�_ 131202 K.J. Aris
			YOYO_Zone27D_Boss3_SkillB( Pieces );
			DebugMsg( 0 , 0 , "Target is dead !!" );
			return
		end

		AddBuff ( RangePlayerTable[ 1 ] , PressureBuff[ Pieces ] , PowerLv , -1)	--�����Z���ۤv�̪񪺥ؼв����������A
		CancelBuff( Oneself , PressureBuff[ Pieces ] )	--�����ۤv���W�������������A
		AddBuff ( Oneself , SuffocationBuff , 0 , 30)	--�����Z���ۤv�������A
	else
		--Say( Oneself , "Nobody Nearby... (Test Message)" )
		--CancelBuff( Oneself , PressureBuff[ Pieces ] )	--�����ۤv���W�������������A--131202 K.J. Aris
		return
	end
end
----------------------------------------------------------------------------
--���a���������d���H���I�H����
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_SkillD()
	local Boss = OwnerID()	--���ۤv
	local ZoneID = ReadRoleValue( Boss , EM_RoleValue_ZoneID )	--�ƥ�����
	local PowerLv	--�ƥ����׹������ޯ൥��
	if ZoneID == 159 then	PowerLv = 0	--²�� 159
	elseif ZoneID == 158 then	PowerLv = 1	--���q 158
	else	PowerLv = 2	end	--�x�� 157
	
	local EarthboundSkill = 491550	--�a������
	local TargetCount = 2	--�R���H��
	local IntoP2HP = 40	--�Ҧ��G��HP%��
	if Lua_PercentHP( Boss ) <= IntoP2HP then	TargetCount = 3	end	--�YBossHP�C��40%�h�R���H���ܬ�3�H
	local TargetPlayerTable = LUA_YOYO_RandPlayerNotGM( Boss , TargetCount , false ) --�������M�椤�ƦW�H�����a�A�ñư�GM
	
	if #TargetPlayerTable >= TargetCount then	--�Y�M��H��>=�ޯ�R���H��
		for I = 1 ,  TargetCount do
			SysCastSpellLv( Boss , TargetPlayerTable[ I ] , EarthboundSkill , PowerLv )
		end
		
	elseif #TargetPlayerTable == TargetCount - 1 then	--�M��H�Ƥ�ޯ�R���H�Ƥ�1�H
		for I = 1 ,  #TargetPlayerTable do
			SysCastSpellLv( Boss , TargetPlayerTable[ I ] , EarthboundSkill , PowerLv )
		end
		SysCastSpellLv( Boss , TargetPlayerTable[ 1 ] , EarthboundSkill , PowerLv )	--�M���1��@�n�Ө�2�o�ޯ�
		
	elseif #TargetPlayerTable == TargetCount - 2 and #TargetPlayerTable ~= 0 then	--�M��H�Ƥ�ޯ�R���H�Ƥ�2�H
		for I = 1 ,  3 do
			SysCastSpellLv( Boss , TargetPlayerTable[ 1 ] , EarthboundSkill , PowerLv )	--�M���1��@�n�Ө�3�o�ޯ�
		end

		else	--Say( Boss , "No Player... (Test Message)" )
	end
end
----------------------------------------------------------------------------
--���P�R�����I�i��ؼСA�I�i����R���u�źx��
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_SkillE()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )	--�ƥ��мh��
	local FatalSkillID = 490045	--�P�R�����@������
	local WhirlpoolID = 103372	--�u�źx������
	local TargetPlayerTable = KS_GetHateList( Boss , 4 )	--�������M�椤�Ҧ����a�A�ñư�GM
	
	if #TargetPlayerTable ~= 0 then
		for I = 1 ,  #TargetPlayerTable do
			SysCastSpellLv( Boss , TargetPlayerTable[ I ] , FatalSkillID , 0 )
		end
	else	--Say( Boss , "SkillE No Player... (Test Message)" )
	end
	
	sleep( 10 )
	local WhirlpoolList = LUA_YOYO_GetSpecificNPC( RoomID , WhirlpoolID ) --���X���W�Ҧ����u�źx������
	for Count = 1 , #WhirlpoolList do
		DelObj( WhirlpoolList[Count] ) --�M���u�źx��
	end
	
end
----------------------------------------------------------------------------
--���P�R�����R���ˬd
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_SkillEJudge()
	local Player = TargetID()
	local WhirlpoolBuff = 500055	--�u�źx�����A
	if CheckBuff( Player , WhirlpoolBuff ) == true then
		return false
	else
		return true
	end
end
----------------------------------------------------------------------------
--���M�����A�G�a������ (���ե�)
----------------------------------------------------------------------------
function YOYO_Zone27D_Boss3_TestCancelBuff()
	local Player = OwnerID()
	local EarthboundBuff = 500672 --�a������
	CancelBuff( Player , EarthboundBuff )
end