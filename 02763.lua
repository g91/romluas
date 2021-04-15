----------------------------------------------------------------------------
--��BOSS���ͻP���Ҫ������@��
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_Ctrl()
	--����s��
	local FlagID = 781201 --�X�нs��
	local BossID = 106640 --BOSS�s��
	local DoorID = 106249 --���ת�����s��
	local DrugID = 120735 --�ľ�����s��
	
	--�X��
	local BossFlag = 1 --BOSS�����I�X�и�
	local BeforeDoorFlagID = 0 --�e���X�и�
	local AfterDoorFlagID = 2 --����X�и�
	local DrugFlagTable = { 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 } --�ľ��X�и�
	local CombatBegin = 0 --�}�ԺX��
	
	local CtrlCentral = OwnerID() --�������
	local Sktalk = { "[SC_106640_01]" , "[SC_106640_02]" , "[SC_106640_04]" } --�۸ܦr��
	
	local RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag(BossID , FlagID , BossFlag , 1 ) --�ͦ�Boss
	AddToPartition( Boss , RoomID )
	WriteRoleValue( CtrlCentral , EM_RoleValue_PID , Boss )
	WriteRoleValue( Boss , EM_RoleValue_PID , CtrlCentral )
	local BeforeDoor --�e���ABOSS�}�Է|��
	local AfterDoor --����ABOSS���`�~�|�}
	local DrugList = {} --�ľ�����M��
	local DrugRebirthTime = 30 --�ľ����ͮɶ�

	--�ͦ����
	AfterDoor = CreateObjByFlag( DoorID , FlagID , AfterDoorFlagID , 1 )
	SetModeEx( AfterDoor , EM_SetModeType_Mark , false ) --���i�I��
	SetModeEx( AfterDoor , EM_SetModeType_HideName , false ) --����ܦW��
	SetModeEx( AfterDoor , EM_SetModeType_NotShowHPMP , false ) --����ܦ��
	SetModeEx( AfterDoor , EM_SetModeType_Strikback , false ) --���|����
	SetModeEx( AfterDoor , EM_SetModeType_Move , false ) --���|����
	SetModeEx( AfterDoor , EM_SetModeType_Fight , false ) --���i����
	SetModeEx( AfterDoor , EM_SetModeType_Searchenemy , false ) --���|����
	SetModeEx( AfterDoor , EM_SetModeType_Obstruct , true ) --�����׮ĪG
	AddToPartition( AfterDoor , RoomID)
	
	--�ͦ��ľ�����
	for Count = 1 , #DrugFlagTable do
		DrugList[Count] = CreateObjByFlag( DrugID , FlagID , DrugFlagTable[Count] , 1 )
		SetModeEx( DrugList[Count] , EM_SetModeType_Mark , true ) --���i�I��
		SetModeEx( DrugList[Count] , EM_SetModeType_HideName , false ) --����ܦW��
		SetModeEx( DrugList[Count] , EM_SetModeType_NotShowHPMP , false ) --����ܦ��
		SetModeEx( DrugList[Count] , EM_SetModeType_Strikback , false ) --���|����
		SetModeEx( DrugList[Count] , EM_SetModeType_Move , false ) --���|����
		SetModeEx( DrugList[Count] , EM_SetModeType_Fight , false ) --���i����
		SetModeEx( DrugList[Count] , EM_SetModeType_Searchenemy , false ) --���|����
		SetModeEx( DrugList[Count] , EM_SetModeType_Obstruct , false ) --�L���׮ĪG
		SetModeEx( DrugList[Count] , EM_SetModeType_Gravity , false ) --�L���O
		AddToPartition( DrugList[Count] , RoomID)
	end
	
	while true do
		sleep( 10 )
		if HateListCount( Boss ) ~= 0 then --������H
			if CombatBegin == 0 then --�}�ԺX�Х��}
				CombatBegin = 1 --�N�}�ԺX�г]�����}
				BeginPlot( Boss , "LUA_YOYO_Zone25D_Boss6_Fight" , 0 )
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 ) --BOSS�}�Զ��n
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 ) --Register1��Boss��function�Ϊ��԰��X�СA1  = �}�l�԰�
				
				--�ͦ��e��
				BeforeDoor = CreateObjByFlag( DoorID , FlagID , BeforeDoorFlagID , 1 )
				SetModeEx( BeforeDoor , EM_SetModeType_Mark , false ) --���i�I��
				SetModeEx( BeforeDoor , EM_SetModeType_HideName , false ) --����ܦW��
				SetModeEx( BeforeDoor , EM_SetModeType_NotShowHPMP , false ) --����ܦ��
				SetModeEx( BeforeDoor , EM_SetModeType_Strikback , false ) --���|����
				SetModeEx( BeforeDoor , EM_SetModeType_Move , false ) --���|����
				SetModeEx( BeforeDoor , EM_SetModeType_Fight , false ) --���i����
				SetModeEx( BeforeDoor , EM_SetModeType_Searchenemy , false ) --���|����
				SetModeEx( BeforeDoor , EM_SetModeType_Obstruct , true ) --�����׮ĪG
				AddToPartition( BeforeDoor , RoomID )
			end
		end
	
		if HateListCount( Boss ) == 0 and CombatBegin == 1 then	--�����S�H�A�}�ԺX�Фw�}
			if ReadRoleValue( boss , EM_RoleValue_IsDead ) == 0 then --BOSS�٦s��
				CombatBegin = 0 --�N�}�ԺX�г]������
				DelObj( Boss ) --�R��BOSS
				Delobj( BeforeDoor ) --�R���e��
				ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 ) --�s��BOSS�ӧQ�Ũ�
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 ) --Register1��BOSS��function�Ϊ��԰��X�СA0  = �����԰�
				BeginPlot( CtrlCentral , "LUA_YOYO_Zone25D_Boss6_Clearance" , 0 )
				sleep( 50 )
				
				RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )
				Boss = CreateObjByFlag( BossID , FlagID , BossFlag , 1 ) --���mBOSS
				AddToPartition( Boss , RoomID )
				WriteRoleValue( CtrlCentral , EM_RoleValue_PID , Boss )
				WriteRoleValue( Boss , EM_RoleValue_PID , CtrlCentral )
			end
		end			
		
		if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 then --BOSS�w���`
			CombatBegin = 0 --�N�}�ԺX�г]������
			Delobj( BeforeDoor ) --�R���e��
			Delobj( AfterDoor ) --�R�����
			ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 ) --�s��BOSS���`���
			WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 ) --Register1��Boss��function�Ϊ��԰��X�СA0  = �����԰�
			local DrugObjList = LUA_YOYO_GetSpecificNPC( RoomID , DrugID ) --���X���W�Ҧ����ѭ��ľ�����	
			for Count = 1 , #DrugObjList do
				DelObj( DrugObjList[Count] ) --�M���ѭ��ľ�
			end
			BeginPlot( CtrlCentral , "LUA_YOYO_Zone25D_Boss6_Clearance" , 0 )
			sleep( 50 )
			break --�����������P�_�j��
		end

	end
end
----------------------------------------------------------------------------
--��Boss�����԰���M��
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_Clearance()
	local CtrlCentral = OwnerID() --�������
	local RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )
		
	local ColdBuff = 622449 --���
	local DeepColdBuff = 622458 --�`�H
	local FreezeBuff = 622450 --�B�ʨ���
	local DrugBuff = 622445 --�ľ��g�V
	local IceObj = 106639 --�H�y�B�몫��
	
	local PlayerList = LUA_YOYO_GetAllPlayer( RoomID ) --�C�X���W���Ҧ����a�s��
	for Count = 1 , #PlayerList do
		CancelBuff( PlayerList[Count] , ColdBuff ) --�M�����
		CancelBuff( PlayerList[Count] , DeepColdBuff ) --�M���`�H
		CancelBuff( PlayerList[Count] , FreezeBuff ) --�M���B�ʨ���
		CancelBuff( PlayerList[Count] , DrugBuff ) --�M���ľ��g�V
	end
	
	local IceObjList = LUA_YOYO_GetSpecificNPC( RoomID , IceObj ) --���X���W�Ҧ����H�y�B�몫��
	for Count = 1 , #IceObjList do
		DelObj( IceObjList[Count] ) --�M���H�y�B��
	end

end
----------------------------------------------------------------------------
--��Boss���԰�AI
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_Fight()
	--�@�ǳ]�w
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID)
	local PetTable = {}
	local Sktalk = { "[SC_106640_03]" , "[SC_106640_05]" , "[SC_106640_06]" } --�԰�AI���������
	WriteRoleValue(Boss , EM_RoleValue_Register2 , 0 )	--����Boss�g�ɪ��}��
	
	--�ۦ�
	local SkillA1 = 499325	-- ���ˤ���
	local SkillA2 = 499327	--���Z����
	local SkillB = 499328	-- �`�H�B�j
	local SkillC = 499329	-- �B�e�_��
	local ViolentSkill = 850126 --�H�B�g��
	
	--Buff
	local EnvironmentBuff = 622448	--�s�׻��
	local P2Buff = 622457	--����
	
	--�ۦ��ɶ�
	local SkillAtime = 7		--�I�k���j�G���ˤ��������Z����(7��)
	local SkillBtime = 22		--�I�k���j�G�`�H�B�j(22��)
	local SkillCtime = 20		--�I�k���j�G�B�e�_��(20��)
	local SkillDtime = 5		--�I�k���j�G�H�y�B��(5��)
	local SkillP2Time = 10	--�I�k���j�G����(10��)
	
	--�䥦�ܼ�
	local IntoP2HP = 40	--�i�J�ĤG���q����q
	local BossTime = 0	--Boss�԰��p�ƾ�
	local ViolentTime = 480	--Boss�g�ɪ��ɶ�(8����)
	
	AddBuff( Boss , EnvironmentBuff , 0 , -1 ) --�}�ԫ�ߧY���ۤv�I�[�s�׻�쪬�A

	while true do
		Sleep(10)
		BossTime = BossTime + 1
		--Say( Boss , "-Time " .. BossTime .. " -" ) --�p�ƾ�

		--A ���ˤ��������Z����
		if BossTime % SkillAtime == 0 then
			if RandRange( 1 , 2 ) == 1 then	--�H��2��1
				--Say( Boss , "----------SkillA 1----------" )
				local NowTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
				CastSpell( Boss , NowTarget , SkillA1 )
			else
				--Say( Boss , "----------SkillA 2----------" )
				CastSpell( Boss , Boss , SkillA2 )
			end
		end 

		--B �`�H�B�j
		if BossTime % SkillBtime == 0 then
			--Say( Boss , "----------SkillB----------" )
			local PlayerTable =  LUA_YOYO_RandPlayerNotGM( Boss , 3 , false )
			if table.getn( PlayerTable ) ~= 0 then
				for Count = 1 , table.getn( PlayerTable ) do
					SysCastSpellLv( Boss , PlayerTable[Count] , SkillB , 0 )
					--Say(PlayerTable[Count] , "spell skillB at me!")
				end
			else
				Say( Boss , "Skill B No Target" )
			end
		end

		--C �B�e�_��
		if BossTime % SkillCtime == 0 then
			--Say( Boss , "----------SkillC----------" )
			CastSpell( Boss , Boss , SkillC ) --�o�ӥu���ª�t
		end

		-- D �H�y�B��
		if BossTime % SkillDtime == 0 then
			-- Say( Boss , "----------SkillD----------" )
			local PlayerTable =  LUA_YOYO_RandPlayerNotGM( Boss , 1 , true )
			if table.getn( PlayerTable ) ~= 0 then
				local IcePet = LUA_YOYO_Zone25D_Boss6_IcePet( RoomID , PlayerTable[1] , Boss )
				table.insert( PetTable , IcePet )
			else
				--Say( Boss , "Skill D No Target" )
			end
		end

		-- ����
		if BossTime % SkillP2Time == 0 and Lua_PercentHP( Boss ) <= IntoP2HP then
			AddBuff( Boss , P2Buff , 0 , -1 )
			ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 ) --�ޯ�o��
		end

		--�H�B�g��
		if BossTime > ViolentTime and ReadRoleValue( Boss , EM_RoleValue_Register2 ) == 0 then
			SysCastSpellLv( Boss , Boss , ViolentSkill , 0 )
			ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 ) --�ޯ�o��
			WriteRoleValue(Boss , EM_RoleValue_Register2 , 1 )	--����Boss�g�ɪ��}��
		end

	end
end
----------------------------------------------------------------------------
--��Boss��AI�G������A�Y�|��5�h�A�hĲ�o�B�ʨ��Ϊ��A�A�Y�B�ʨ��Ϋ�h���A�|�[
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_ColdBuff()
	local Target = TargetID()
	local ColdBuff = 622449 --���
	local FreezeBuff = 622450 --�B�ʨ���
	local Count = FN_CountBuffLevel( Target , ColdBuff ) --���oBuff���h��
	
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 0 then --�ư��d��
		return false
	end
	
	if CheckBuff( Target , FreezeBuff ) == true then
		CancelBuff( Target , ColdBuff )
		return false
	else
		if Count == 4 then
			CancelBuff( Target , ColdBuff )
			AddBuff( Target , FreezeBuff , 0 , -1 )
		end
	end
end
----------------------------------------------------------------------------
--��Boss��AI�G���ˤ������B�~�ؼгB�z
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_SkillA1()
	local Boss = OwnerID()
	local Target = TargetID()
	local SkillA1plus = 499326 --�B�~�����u�@�ҸH���v�ĪG�� ���ˤ���
	local RangePlayerTable = SearchRangePlayer( Target , 50 ) --����ؼЩP��Z��50���Ҧ����a
	local LuckyPlayer = 0 --�ǳƱ����u�@�ҸH���v�����a
	
	local PlayerTable = {} --�ѩ�SearchRangePlayer��X�Ӫ��|�q��m0�}�l�A�ҥH�Хt�@��Table�q1�}�l��
	for Count = 0 , table.getn( RangePlayerTable ) - 1 do
		PlayerTable[Count + 1] = RangePlayerTable[Count]
	end
	
	--Say( Target , "Before PlayerTable = " .. table.getn( PlayerTable ) )	
	for PlayerN = table.getn( PlayerTable ) , 1 , -1 do --��X���������
		--Say( Boss , "Search No." .. PlayerN .. " , is " .. PlayerTable[PlayerN] )
		if PlayerTable[PlayerN] == Target then --���p����쪺���a�O��e���ؼСA�h�N���q��椤�����A���s���
			--Say( PlayerTable[PlayerN] , "I'm Target , Remove" )
			table.remove( PlayerTable , PlayerN )
		end
	end
	--Say( Target , "After PlayerTable = " .. table.getn( PlayerTable ) )

	for PlayerN = table.getn( PlayerTable ) , 1 , -1 do
		if ReadRoleValue( PlayerTable[PlayerN] , EM_RoleValue_Voc ) == 0 then --���p����쪺���a�OGM�A�h�N���q��椤�����A���s���
			--Say( PlayerTable[PlayerN] , "I'm GM , got remove" )
			table.remove( PlayerTable , PlayerN )
		end
	end

	if table.getn( PlayerTable ) > 0 then
		LuckyPlayer = PlayerTable[ RandRange( 1 , table.getn(PlayerTable) ) ] --�q���a���H����X�@��
		--Say( LuckyPlayer , "I'm LuckyPlayer!" )
	else
		LuckyPlayer = Target --�p�G����S��L���a�A�N�ѭ�ؼЦۤv�Y�U
		--Say( LuckyPlayer , "PlayerTable = 0 , So I'm LuckyPlayer!!" )
	end
	SysCastSpellLv( Boss, LuckyPlayer, SkillA1plus, 0 )
end
----------------------------------------------------------------------------
--��Boss��AI�G�B�e�_����ܪ��ˮ`��m
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_SkillC()
	local Boss = OwnerID()
	local Target = TargetID()
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	local SkillCobjID = 107557 --�B�e�_�����z���y����
	local SkillCplus = 499330 --�B�e�_���ˮ`�ĪG
	local Sktalk = { "[SC_106640_03]" } --���ޯ઺�۸ܦr��
	local TargetPlayerTable = KS_GetHateList( Boss , 4 ) --���o����C��Ҧ����a
	local TargetPlayerDisTable = {}
	local SkillCobj = {}
	local TargetCount = 3 --�̪񪺤T�W�ؼз|����ˮ`
	
	if table.getn( TargetPlayerTable ) ~= 0 then
		for Count = 1 , table.getn(TargetPlayerTable) do
			TargetPlayerDisTable[Count] = GetDistance( Boss , TargetPlayerTable[Count] ) --���o����C��Ҧ����a���Z��
			--Say( Boss , "TargetPlayer ".. Count .. " :" .. TargetPlayerTable[Count] .. " , Distance : " .. TargetPlayerDisTable[Count] )
		end

		local SortPlayerTable , SortDisTable = LUA_YOYO_Sequence( TargetPlayerTable , TargetPlayerDisTable , 0 ) --�̶Z�����W�Ƨ�
		for Count = 1 ,  TargetCount do
			if SortPlayerTable[Count] ~= nil then --�p�G�����H�N��
				local Target_X , Target_Y , Target_Z , Target_Dir = DW_Location(SortPlayerTable[Count]) --���X�ؼЪ��y�лP���V
				SkillCobj[Count] = CreateObj( SkillCobjID , Target_X , Target_Y , Target_Z , Target_Dir , 1 ) --�qBOSS�Ҧb��m���ͤ@�T���ê�����
				SetModeEx( SkillCobj[Count] , EM_SetModeType_Fight , false ) --���i����
				SetModeEx( SkillCobj[Count] , EM_SetModeType_Searchenemy, false ) --���|����
				SetModeEx( SkillCobj[Count] , EM_SetModeType_Strikback , false ) --���|����
				SetModeEx( SkillCobj[Count] , EM_SetModeType_Mark , false ) --���i�I��
				SetModeEx( SkillCobj[Count] , EM_SetModeType_NotShowHPMP , false ) --����ܦ��
				SetModeEx( SkillCobj[Count] , EM_SetModeType_HideName , false ) --����ܦW��
				AddToPartition( SkillCobj[Count] , RoomID )
				CastSpell( SkillCobj[Count] , SkillCobj[Count] , SkillCplus ) --�����ê���ۤv�I�i�@����t�Ϊ��B�e�_���S��
				CallPlot( SkillCobj[Count] , "YOYO_Zone25D_Boss6_SkillC_End" )
			end
		end
		ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 ) --�ޯ�o��
	else
		Say( Boss , "Skill C No Target" )
	end
end
----------------------------------------------------------------------------
--��Boss��AI�G�B�e�_���ˮ`�����z���y���P�_
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_SkillCJudge()
	local SkillObj = OwnerID()
	local Target = TargetID()
	if SkillObj == Target --�Y�ؼлP�ۤv�ۦP
	or ReadRoleValue( Target , EM_RoleValue_OrgID ) == 120735 --�Y�ؼЬ��ѭ��ľ�
	or ReadRoleValue( Target , EM_RoleValue_OrgID ) == 121699 then --�Y�ؼЬ��ľ���
		return false --��Ĳ�o�ˮ`
	end
end
----------------------------------------------------------------------------
--��Boss��AI�G�B�e�_���������
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_SkillC_End()
	Sleep(20)
	local ShowObj = OwnerID()
	DelObj( ShowObj ) --2��Ჾ�����ê���
end
----------------------------------------------------------------------------
--��Boss��AI�G�l��H�y�B��
----------------------------------------------------------------------------
function  LUA_YOYO_Zone25D_Boss6_IcePet( RoomID, Player, Boss )
	local IceObjID = 106639  --�H�y�B�몫��s��
	local PetBuff = 622459 --�H�y�B��Buff
	
	local Player_X , Player_Y , Player_Z , Player_Dir = DW_Location(Player) --���X�ؼЪ��y�лP���V
	local Boss_X , Boss_Y , Boss_Z , Boss_Dir = DW_Location(Boss) --���X�ۤv���y�лP���V

	local IcePet = CreateObj( IceObjID, Player_X , Player_Y , Player_Z , Player_Dir , 1 ) --�q�Q�ﭫ�����a�Ҧb��m���ͤ@�T���ê��B�몫��
	SetModeEx( IcePet, EM_SetModeType_Fight, false ) --���i����
	SetModeEx( IcePet, EM_SetModeType_Searchenemy, false ) --���|����
	SetModeEx( IcePet, EM_SetModeType_Strikback , false ) --���|����
	SetModeEx( IcePet, EM_SetModeType_Mark , false ) --���i�I��
	SetModeEx( IcePet, EM_SetModeType_NotShowHPMP, false ) --����ܦ��
	SetModeEx( IcePet , EM_SetModeType_HideName , false ) --����ܦW��
	AddToPartition( IcePet, RoomID )
	AddBuff( IcePet, PetBuff, 0, -1 ) --�N�H�y�B�몺���A�I��b�B�몫��W
	
	MoveDirect( IcePet, Boss_X, Boss_Y, Boss_Z ) --��BOSS����
	CallPlot( IcePet , "LUA_YOYO_Zone25D_Boss6_IcePetDie" , 0 )
	return IcePet
end
----------------------------------------------------------------------------
--���H�y�B��s�b���ɶ�
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_IcePetDie()
	Sleep(50) --�B��s�b���ɶ�
	local Pet = OwnerID()
	DelObj(Pet)
end
----------------------------------------------------------------------------
--�����b���Ȫ��~����l�@�����U�G�ѭ��ľ�
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_TouchSet()
	local Obj = OwnerID()
	SetPlot( Obj , "touch" , "YOYO_Zone25D_Boss6_TouchEvent" , 30 ) --Ĳ�I�@��
end
----------------------------------------------------------------------------
--���ѭ��ľ��GĲ�I�@��
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_TouchEvent()
	local Player = OwnerID()
	local Obj = TargetID()
	local PickDrugs = 850550 --�B���ľ�
	local Sktalk = { "[SC_106640_07]" }
	CastSpell( Player , Player , PickDrugs ) --�I�i�B���ľ�
	ScriptMessage( Obj , Player , 2 , Sktalk[1] , 2 ) --����ľ��B���������ܰT��
	CallPlot( Obj , "YoYo_Zone25D_Boss6_ResetObj", Obj ) --�]�w�ѭ��ľ����ͼ@��
end
----------------------------------------------------------------------------
--���ѭ��ľ��G���ͼ@��
----------------------------------------------------------------------------
function YoYo_Zone25D_Boss6_ResetObj( ObjID )
	local WaitTime = 20 --�ľ����ͮɶ�
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID ) --�ثe���ƥ��h��
	DelFromPartition( ObjID) --�]�w����
	Sleep( WaitTime * 10 )
	AddToPartition( ObjID, RoomID ) --���s�X�{�b���W
end
----------------------------------------------------------------------------
--�����Y��í�w�ľ��G�ľ��ϥΧޯ�
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_CancelFreezeBuff()
	local Player = TargetID()
	local FreezeBuff = 622450 --�B�ʨ���
	CancelBuff( Player , FreezeBuff )
end
----------------------------------------------------------------------------
--���ѭ�G���եΧޯ�
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_TestCancelBuff()
	local Player = OwnerID()
	local FreezeBuff = 622450 --�B�ʨ���
	CancelBuff( Player , FreezeBuff )
end
----------------------------------------------------------------------------
--���`�H�G�Y�B�ʨ��Ϋh��Ĳ�o���ĪG
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_DeepColdBuff()
	local Target = TargetID()
	local DeepColdBuff = 622458 --�`�H
	local FreezeBuff = 622450 --�B�ʨ���	
	if CheckBuff( Target , FreezeBuff ) == true then
		CancelBuff( Target , DeepColdBuff )
		return false
	end
end