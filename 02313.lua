
--�� BOSS RAND 7S. SKILL ��--
function sasa_104582_AnaSkill()
	local Skill = { 496255 , 496256 , 496257 }					--���F����B���ˤ��y�B�©]
	local SkillLv = { 54 , 13 , 29 }
	local SkillString = { "[SC_104582_08]" , "[SC_104582_09]" , "[SC_104582_10]" }
	--�ĨĪ������ڪ������a�K
	--�A�̴N�u���o�I��@�H
	--�O���ڷP��ӵL��K�ڪ��߱��i���O�@�����o��n�K
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())					--���X����������a
	local BossTarget 											--�sBOSS�n�����ؼ�
	local SkillIndex 											--��TABLE������m
		
	if (Luck >= 0 and Luck < 15) or (Luck >= 45 and Luck < 60) then
		SkillIndex = 1
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif (Luck >= 15 and Luck < 30) or (Luck >= 60 and Luck < 75) then
		SkillIndex = 2
		CastSpellLV( OwnerID(), OwnerID() , 496190 , 0 )				--�Űʧ@
		for i=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[i]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM�ư�
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--��쪺���a��iTABLE
			end
		end
		--Say( OwnerID() , "4pp ="..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 4 then							--�j��4�H�Nrand 4��
			for j=1 , 4 do
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1			--RAND�쪺�Ʀr	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "yes ="..table.getn(LuckyPlayer) )
			end
		else													-------4�H�H�U�N����
			for k=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[k] ~= nil ) and ( ReadRoleValue( LuckyPlayer[k] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "pp ="..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[k] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	elseif (Luck >= 30 and Luck < 45) or (Luck >= 75 and Luck < 100) then
		SkillIndex = 3
		BossTarget = OwnerID()
		CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
	end	
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , "0xff6fb7ff" )
end

--�� BOSS RAND 7S. SKILL_2 ��--
function sasa_104582_AnaSkill_2()
	local Skill = { 496255 , 496256 }					--���F����B���ˤ��y
	local SkillLv = { 54 , 13 }
	local SkillString = { "[SC_104582_08]" , "[SC_104582_09]" }
	--�ĨĪ������ڪ������a�K
	--�A�̴N�u���o�I��@�H
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())					--���X����������a
	local BossTarget 											--�sBOSS�n�����ؼ�
	local SkillIndex 											--��TABLE������m
		
	if (Luck >= 0 and Luck < 50) then
		SkillIndex = 1
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		CastSpellLV( OwnerID(), OwnerID() , 496190 , 0 )				--�Űʧ@
		for i=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[i]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM�ư�
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--���H�ư�
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--��쪺���a��iTABLE
			end
		end
		--Say( OwnerID() , "4pp ="..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 4 then							--�j��4�H�Nrand 4��
			for j=1 , 4 do
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1			--RAND�쪺�Ʀr	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "yes ="..table.getn(LuckyPlayer) )
			end
		else													-------4�H�H�U�N����
			for k=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[k] ~= nil ) and ( ReadRoleValue( LuckyPlayer[k] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "pp ="..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[k] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end	
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , "0xff6fb7ff" )
end

--�� �p���z��A ��--
function sasa_104585_BombBear1()
	local BallF = star_CreateObj_NoAdd( OwnerID() , 105454 , 0 , 0 , 0 , Room , 0 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetModeEx( BallF , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( BallF , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( BallF , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
	SetModeEx( BallF , EM_SetModeType_Searchenemy , false )   	--����
	SetModeEx( BallF , EM_SetModeType_Mark , false )			--�аO
	SetModeEx( BallF , EM_SetModeType_Fight , false ) 			--���
	SetModeEx( BallF , EM_SetModeType_Move , false )			--����
	SetModeEx( BallF , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallF , EM_SetModeType_Strikback , false )		--����
	SetModeEx( BallF , EM_SetModeType_Show , true )				--�q�X
	AddToPartition( BallF , Room )
	WriteRoleValue( BallF , EM_RoleValue_Livetime, 10 )			--�s�b���
	CastSpellLv( BallF , BallF , 496260 , 7 )					--���z�˸m+�ݾl�i
	--Say( BallF , "Bomb 1" )
end

--�� �p���z��B ��--
function sasa_104586_BombBear2()
	local BallG = star_CreateObj_NoAdd( OwnerID() , 105455 , 0 , 0 , 0 , Room , 0 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetModeEx( BallG , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( BallG , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( BallG , EM_SetModeType_HideMinimap , true )		---����O�_�b�p�a�ϤW���
	SetModeEx( BallG , EM_SetModeType_Searchenemy , false )   	--����
	SetModeEx( BallG , EM_SetModeType_Mark , false )			--�аO
	SetModeEx( BallG , EM_SetModeType_Fight , false ) 			--���
	SetModeEx( BallG , EM_SetModeType_Move , false )			--����
	SetModeEx( BallG , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallG , EM_SetModeType_Strikback , false )		--����
	SetModeEx( BallG , EM_SetModeType_Show , true )				--�q�X
	AddToPartition( BallG , Room )
	WriteRoleValue( BallG , EM_RoleValue_Livetime, 10 )			--�s�b���
	CastSpellLv( BallG , BallG , 496261 , 7 )					--���z�˸m+�ݾl�i
	--Say( BallG , "Bomb 2 stop" )
end

--�� �p���z���� ��--
function sasa_104585_killID()
	local counter = 0
	while 1 do
		sleep(10)
		counter = counter + 1
		if counter == 8 then
			--Say( OwnerID() , "kill" )
			killID( OwnerID() , OwnerID() )
		end	
	end	
end

--�� ��R���Ȧ��` ��--
function sasa_104582_Dead()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104582_11]" , "0xff6fb7ff" )
	--�c�K�ڪ�����K�K�K�K���K�ˡK�K
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )		---Ū�X���GID
	WriteRoleValue( counter , EM_RoleValue_register7 , 1 )					---�i�D�p�ɾ�Boss���F
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local BigBear1 = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	local BigBear2 = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	local BigBear3 = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	DelObj( Entrance )
	DelObj( BigBear1 )
	DelObj( BigBear2 )
	DelObj( BigBear3 )
end

--�� �����Ҧ��` ��--
function sasa_104587_HerfDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ana = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )		--Ū�XBoss GID
	AddRoleValue( Ana , EM_RoleValue_register8 , 1 )					--���ܨ��=1
	local Black = star_CreateObj_NoAdd( OwnerID() , 104587 , 0 , 0 , 0 , Room , 0)
	SetModeEx( Black , EM_SetModeType_Move , false )					--������
	SetModeEx( Black , EM_SetModeType_Strikback , false )				--������
	SetModeEx( Black , EM_SetModeType_Fight , false )					--���i���
	SetModeEx( Black , EM_SetModeType_Searchenemy , false )				--������
	SetModeEx( Black , EM_SetModeType_Mark , false )					--���i�I��
	SetModeEx( Black , EM_SetModeType_NotShowHPMP , false )				--��show���
	AddToPartition( Black , Room )
	PlayMotion( Black , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetDefIdleMotion( Black , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	WriteRoleValue( Ana , EM_RoleValue_register4 , Black )				---�i�DAna Herf���F��Black
	DelObj(OwnerID())
end

--�� �Ԫk�w���` ��--
function sasa_104588_RafadDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ana = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )		---Ū�XBoss GID
	AddRoleValue( Ana , EM_RoleValue_register8 , 2 )					---���ܨ��=2
	local Yellow = star_CreateObj_NoAdd( OwnerID() , 104588 , 0 , 0 , 0 , Room , 0)
	SetModeEx( Yellow , EM_SetModeType_Move , false )					--������
	SetModeEx( Yellow , EM_SetModeType_Strikback , false )				--������
	SetModeEx( Yellow , EM_SetModeType_Fight , false )					--���i���
	SetModeEx( Yellow , EM_SetModeType_Searchenemy , false )			--������
	SetModeEx( Yellow , EM_SetModeType_Mark , false )					--���i�I��
	SetModeEx( Yellow , EM_SetModeType_NotShowHPMP , false )			--��show���
	AddToPartition( Yellow , Room )
	PlayMotion( Yellow , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetDefIdleMotion( Yellow , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	WriteRoleValue( Ana , EM_RoleValue_register5 , Yellow )					---�i�DAna Rafad���F��Yellow
	DelObj(OwnerID())
end

--�� ��D���` ��--
function sasa_104670_FatherDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ana = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )		---Ū�XBoss GID
	WriteRoleValue( Ana , EM_RoleValue_register6 , 4 )					---�i�DAna Father���F
end

--�� ���z�����` ��--
function sasa_104589_PhyDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	local EGG01
	local EGGLight = 509474										--�������
	CancelBuff( player , 509007 )
	EGG01 = star_CreateObj_NoAdd( OwnerID() , 118155 , 0 , 0 , 0 , Room , 0) 	--�����͵���
	SetModeEx( EGG01 , EM_SetModeType_SearchenemyIgnore, true )	---���󤣷|�Q�j�M
	SetModeEx( EGG01 , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
	SetModeEx( EGG01 , EM_SetModeType_Searchenemy, false )   	--����
	SetModeEx( EGG01 , EM_SetModeType_Fight, false ) 			--���
	SetModeEx( EGG01 , EM_SetModeType_Move, false )				--����
	SetModeEx( EGG01 , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( EGG01 , EM_SetModeType_NotShowHPMP , false )		--��show���
	SetModeEx( EGG01 , EM_SetModeType_Strikback, false )			--����
	SetModeEx( EGG01 , EM_SetModeType_Show, true )				--�q�X
	AddToPartition( EGG01 , Room )
	AddBuff( EGG01 , EGGLight , 0 , -1 )						--�������
	Setplot( EGG01 , "touch" , "sasa_118155_AI" , 30 )
	WriteRoleValue( EGG01 , EM_RoleValue_Livetime , 30 )		--�s�b���
end

--�� �]�k�����` ��--
function sasa_104584_MagDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	local EGG02
	local EGGLight = 509474										--�������
	CancelBuff( player , 509007 )
	EGG02 = star_CreateObj_NoAdd( OwnerID() , 118155 , 0 , 0 , 0 , Room , 0) 	--�����͵���
	SetModeEx( EGG02 , EM_SetModeType_SearchenemyIgnore, true )	---���󤣷|�Q�j�M
	SetModeEx( EGG02 , EM_SetModeType_HideMinimap, true )		---����O�_�b�p�a�ϤW���
	SetModeEx( EGG02 , EM_SetModeType_Searchenemy, false )   	--����
	SetModeEx( EGG02 , EM_SetModeType_Fight, false ) 			--���
	SetModeEx( EGG02 , EM_SetModeType_Move, false )				--����
	SetModeEx( EGG02 , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( EGG02 , EM_SetModeType_NotShowHPMP , false )		--��show���
	SetModeEx( EGG02 , EM_SetModeType_Strikback, false )			--����
	SetModeEx( EGG02 , EM_SetModeType_Show, true )				--�q�X
	AddToPartition( EGG02 , Room )
	AddBuff( EGG02 , EGGLight , 0 , -1 )						--�������
	Setplot( EGG02 , "touch" , "sasa_118155_AI" , 30 )
	WriteRoleValue( EGG02 , EM_RoleValue_Livetime , 30 )		--�s�b���
end

--�� �I���� ��--
function sasa_118155_AI()
	BeginPlot( TargetID() , "sasa_118155_AI2" , 0)
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1 , OwnerID() )
end

--�� �R���� ��--
function sasa_118155_AI2()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local GetPlayer = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local StoneBuff = 509475				--�����鸨
	if ReadRoleValue( GetPlayer , EM_RoleValue_IsDead ) == 0 then
		AddBuff( GetPlayer , StoneBuff , 0 , 22 )
	end
	Sleep(20)
	delobj ( OwnerID() )
end

--�� �MBUFF ��--
function sasa_104582_CancelBuff()											--�R��BUFF��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local YesPlayer = SetSearchAllPlayer(RoomID)								--��ϰ�Ҧ����a
	local BuffPlayer = {}
	for gg=1 , YesPlayer do
		BuffPlayer[gg] = GetSearchResult() 										--���Ȧs��
		if CheckID( BuffPlayer[gg] ) == true	 								--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
		 and ReadRoleValue( BuffPlayer[gg] , EM_RoleValue_IsDead ) == 0			--EM_RoleValue_IsDead   =1  =���`
		 and ReadRoleValue( BuffPlayer[gg] , EM_RoleValue_IsPlayer ) == 1 then	--EM_RoleValue_IsPlayer =1  =���a
			if CheckBuff( BuffPlayer[gg] , 509041 ) == true	then			--�G�����N
			 --or CheckBuff( BuffPlayer[gg] , 509075 ) == true then
				CancelBuff(BuffPlayer[gg], 509041)						--�n�R����BUFF
				--CancelBuff(BuffPlayer[gg], 509076)
			end
		end					
	end
end

--�� ���Z�� ��--
function sasa_104582_check()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	local howfar = GetDistance( OwnerID(), boss )
	while 1 do
		howfar = GetDistance( OwnerID(), boss )
		sleep (10)
		--Yell( OwnerID() , "howfar="..howfar , 7 )		
		WriteRoleValue ( Counter , EM_RoleValue_Register1 , howfar )		
	end
end