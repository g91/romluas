function star_102438_counter()
	local DemonLordFlag = 780523
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local SittingSirloth = CreateObjByFlag( 103082 , DemonLordFlag , 1 , 1 )
	--local SittingSirloth = CreateObjByFlag( 102387 , DemonLordFlag , 1 , 1 )
	SetModeEx( SittingSirloth , EM_SetModeType_Move , false )			------������
	SetModeEx( SittingSirloth , EM_SetModeType_Strikback , false )	------������
	SetModeEx( SittingSirloth , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( SittingSirloth , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( SittingSirloth , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( SittingSirloth , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEx( SittingSirloth , EM_SetModeType_Gravity , false )		------�S���O
	SetModeEx( SittingSirloth , EM_SetModeType_AlignToSurface , false )	------���K�a
	AddToPartition( SittingSirloth , Room )
	SetDefIdleMotion( SittingSirloth , ruFUSION_MIME_CHANNEL_LOOP )
	Setplot( OwnerID() , "range" , "star_102438_counter_1" , 150)
	WriteRoleValue(OwnerID() , EM_RoleValue_register1 , SittingSirloth)	
	WriteRoleValue(SittingSirloth , EM_RoleValue_register1 , OwnerID())
end

function star_102438_counter_1()
	if ReadRoleValue(OwnerID() , EM_RoleValue_VOC) ~= 0 then
		Setplot( TargetID() , "range" , "" , 0)
		local Sirloth = ReadRoleValue(TargetID() , EM_RoleValue_register1)
		BeginPlot( Sirloth , "star_102438_BossAI_1" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "You are GM,plz back!" , 1 )
	end	
end

function star_102438_BossAI_1()	
	sleep(10)
	
	local DemonLordFlag = 780523
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue(OwnerID() , EM_RoleValue_register1)	
	local HealCounter = 0
	local ReviveCounter = 0		-----��c�]���`�˼ƭp�ɥ�
	local SearchCounter = 0		-----�����a��ƭp�ɥ�
	local InBattle = 0
	
	SetRoomValue(Room , 1 , 1)		------����}������
	
	--local SummonSpell = 		-----���}���ɤ����l���c�]
	local DemonDoor = 103052		-----���ɤ���DBID
	local DemonDoorBuff = 505649	-----show�X���ɤ������S��
	local DemonID1 = 103053			-----�c�]DBID
	local DemonID2 = 103054			-----�c�]DBID
	local ResistPhysic = 505651		-----�K�̪��zBuff
	local ResistMagic =	505650		-----�K�̪k�NBuff
	local HealBuff = 505652			-----�c�]�L�O
	
	local Phase = 0 			-----�q���B����Ӷ��q	
	local GetPlayer = {}
	local PlayerGID = 0
	--GetPlayer = SearchRangePlayer ( OwnerID() , 700 )
	local PlayerCount = SetSearchAllPlayer(Room)
	for i=1 , PlayerCount do
		PlayerGID = GetSearchResult()
		--Yell(OwnerID() , "range="..GetDistance( PlayerGID , Counter ) , 5)
		if ReadRoleValue(PlayerGID , EM_RoleValue_VOC) ~= 0 and 
			GetDistance( PlayerGID , Counter ) < 800 and 
			ReadRoleValue(PlayerGID , EM_RoleValue_IsDead) == 0 then
			GetPlayer[i] = PlayerGID
		end	
	end
	local AttackTarget = 0	
	local PhysicDemon = 0
	local MagicDemon = 0
	local Door1 = 0
	local Door2 = 0
	local FearWallID = 103069
	
	local FearWall = CreateObjByFlag( FearWallID , DemonLordFlag , 5 , 1 )			-----���f���ת�
	SetModeEx( FearWall , EM_SetModeType_Move , false )			------������
	SetModeEx( FearWall , EM_SetModeType_Strikback , false )	------������
	SetModeEx( FearWall , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( FearWall , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( FearWall , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( FearWall , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEX( FearWall , EM_SetModeType_Obstruct , true )		------����
	AddToPartition( FearWall , Room )
	
	local FearWall2 = CreateObjByFlag( FearWallID , DemonLordFlag , 6 , 1 )			-------���W�����ת�
	SetModeEx( FearWall2 , EM_SetModeType_Move , false )			------������
	SetModeEx( FearWall2 , EM_SetModeType_Strikback , false )	------������
	SetModeEx( FearWall2 , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( FearWall2 , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( FearWall2 , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( FearWall2 , EM_SetModeType_NotShowHPMP , false )	------��show���
	SetModeEX( FearWall2 , EM_SetModeType_Obstruct , true )		------����
	AddToPartition( FearWall2 , Room )
	while 1 do
		sleep(10)
		SearchCounter = SearchCounter+1
		HealCounter = HealCounter+1
		
		if SearchCounter >= 20 then					------�C20���@�����a
			GetPlayer = {}
			PlayerCount = SetSearchAllPlayer(Room)
			for j=1 , PlayerCount do
				PlayerGID = GetSearchResult()
				--Yell(OwnerID() , "range="..GetDistance( PlayerGID , Counter ) , 5)
				if ReadRoleValue(PlayerGID , EM_RoleValue_VOC) ~= 0 and 
					GetDistance( PlayerGID , Counter ) < 800 and
					ReadRoleValue(PlayerGID , EM_RoleValue_IsDead) == 0 then
					GetPlayer[j] = PlayerGID
				end	
			end
			SearchCounter = 0
		end	
		for ii=1 , table.getn(GetPlayer) do	
			--Yell(OwnerID() , "GetPlayer="..GetPlayer[ii] , 5)
			if CheckID(GetPlayer[ii]) == true and 
				ReadRoleValue(GetPlayer[ii] , EM_RoleValue_IsDead) == 0 and
				ReadRoleValue(GetPlayer[ii] , EM_RoleValue_VOC) ~= 0 and 
				GetDistance( GetPlayer[ii] , Counter ) < 800 then				
					AttackTarget = AttackTarget+1
					--Yell(OwnerID() , AttackTarget , 10)	
			end	
		end
		if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			if InBattle == 0 then
				Yell(OwnerID() , "[SC_102438_BOSS_1]" , 10)						-----�u�O����Y��~�A�̯u����F�o��!
				sleep(30)
				Yell(OwnerID() , "[SC_102438_BOSS_2]" , 10)						-----�ӧa�A�A���ڦh�ݤ@�ǧA�̬��F���R�ӱä㪺�ҼˡA�Ӧ���F!
				--CastSpell(OwnerID() , OwnerID() , SummonSpell)
				sleep(30)
				Yell(OwnerID() , "[SC_102438_BOSS_3]" , 10)						-----�A�̪��ȵ{�N�b�o�̲פ�!!�X�ӧa~�ک��ꪺ���H!
				sleep(20)
				Door1 = CreateObjByFlag( DemonDoor , DemonLordFlag , 2 , 1 )					-----�c�]����
				SetModeEx( Door1 , EM_SetModeType_Move , false )			------������
				SetModeEx( Door1 , EM_SetModeType_Strikback , false )	------������
				SetModeEx( Door1 , EM_SetModeType_Fight , false )		------���i���
				SetModeEx( Door1 , EM_SetModeType_Searchenemy , false )	------������
				SetModeEx( Door1 , EM_SetModeType_Mark , false )			------���i�I��
				SetModeEx( Door1 , EM_SetModeType_NotShowHPMP , false )	------��show���
				AddToPartition( Door1 , Room )	
				AddBuff(Door1 , DemonDoorBuff , 0 , -1)	
				Door2 = CreateObjByFlag( DemonDoor , DemonLordFlag , 3 , 1 )					-----�c�]����
				SetModeEx( Door2 , EM_SetModeType_Move , false )			------������
				SetModeEx( Door2 , EM_SetModeType_Strikback , false )	------������
				SetModeEx( Door2 , EM_SetModeType_Fight , false )		------���i���
				SetModeEx( Door2 , EM_SetModeType_Searchenemy , false )	------������
				SetModeEx( Door2 , EM_SetModeType_Mark , false )			------���i�I��
				SetModeEx( Door2 , EM_SetModeType_NotShowHPMP , false )	------��show���
				AddToPartition( Door2 , Room )
				AddBuff(Door2 , DemonDoorBuff , 0 , -1)
				sleep(30)
				PhysicDemon = star_CreateObj_NoAdd( Door1 , DemonID1 , 0 , 0 , 0 , Room , 0)		-----���z�c�]
				SetModeEx( PhysicDemon , EM_SetModeType_Move , false )			------������
				AddToPartition( PhysicDemon , Room )
				AddBuff(PhysicDemon , ResistPhysic , 0 , -1)					-----�W�K��buff
				Setplot( PhysicDemon , "dead" , "star_102438_Demon1Dead" , 30)
				WriteRoleValue(PhysicDemon , EM_RoleValue_register1 , OwnerID())	------�NBossGID�g�J�c�]1��
				MagicDemon = star_CreateObj_NoAdd( Door2 , DemonID2 , 0 , 0 , 0 , Room , 0)		-----�k�t�c�]
				SetModeEx( MagicDemon , EM_SetModeType_Move , false )			------������
				AddToPartition( MagicDemon , Room )
				AddBuff(MagicDemon , ResistMagic , 0 , -1)						-----�W�K��buff
				Setplot( MagicDemon , "dead" , "star_102438_Demon2Dead" , 30)	
				WriteRoleValue(MagicDemon , EM_RoleValue_register1 , OwnerID()) 	------�NBossGID�g�J�c�]2��
				sleep(20)
				SetModeEx( PhysicDemon , EM_SetModeType_Move , true )
				SetModeEx( MagicDemon , EM_SetModeType_Move , true )
				InBattle = 1
			end
			if ReadRoleValue(OwnerID() , EM_RoleValue_register10) == 1 or 
				ReadRoleValue(OwnerID() , EM_RoleValue_register10) == 2 then
				ReviveCounter = ReviveCounter+1	
				--Yell(OwnerID() , ReviveCounter , 5)	
			end
			if ReviveCounter >= 5 and ReadRoleValue(OwnerID() , EM_RoleValue_register10) == 1 then
				ReviveCounter = 0
				PhysicDemon = ReadRoleValue(OwnerID() , EM_RoleValue_register4)
				local PhysicDemon2 = star_CreateObj( PhysicDemon , DemonID1 , 0 , 0 , 0 , Room , 0)
				DelObj(PhysicDemon)
				PhysicDemon = PhysicDemon2
				AddBuff(PhysicDemon , ResistPhysic , 0 , -1)					-----�W�K��buff
				Setplot( PhysicDemon , "dead" , "star_102438_Demon1Dead" , 30)
				
				WriteRoleValue(OwnerID() , EM_RoleValue_register10 , 0 )
				WriteRoleValue(PhysicDemon , EM_RoleValue_register1 , OwnerID())	------�NBossGID�g�J�c�]1��
			elseif ReviveCounter >= 5 and ReadRoleValue(OwnerID() , EM_RoleValue_register10) == 2 then
				ReviveCounter = 0
				MagicDemon = ReadRoleValue(OwnerID() , EM_RoleValue_register5)
				local MagicDemon2 = star_CreateObj( MagicDemon , DemonID2 , 0 , 0 , 0 , Room , 0)				
				DelObj(MagicDemon)
				MagicDemon = MagicDemon2
				AddBuff(MagicDemon , ResistMagic , 0 , -1)						-----�W�K��buff
				Setplot( MagicDemon , "dead" , "star_102438_Demon2Dead" , 30)
			
				WriteRoleValue(OwnerID() , EM_RoleValue_register10 , 0 )
				WriteRoleValue(MagicDemon , EM_RoleValue_register1 , OwnerID()) 	------�NBossGID�g�J�c�]2��
			elseif ReadRoleValue(OwnerID() , EM_RoleValue_register10) == 3 then		------�F���i�JP2����
				Yell(OwnerID() , "[SC_102438_BOSS_4]" , 10)						-----�ڨӤF���A��!!�O�ӱo�N�F!!
				PhysicDemon = ReadRoleValue(OwnerID() , EM_RoleValue_register4)
				MagicDemon = ReadRoleValue(OwnerID() , EM_RoleValue_register5)
				sleep(20)
				DelObj(PhysicDemon)
				DelObj(MagicDemon)				
				sleep(20)
				WriteRoleValue(OwnerID() , EM_RoleValue_register10 , 0 )	-----�k�s
				SetModeEx( OwnerID() , EM_SetModeType_Show , false )		-----���ç��۪��ƺ�
				local Sirloth = star_CreateObj_NoAdd( OwnerID() , 102438 , 0 , 0 , 0 , Room , 0)
				SetModeEx( Sirloth , EM_SetModeType_Move , false )			------������
				SetModeEx( Sirloth , EM_SetModeType_Strikback , false )	------������
				SetModeEx( Sirloth , EM_SetModeType_Fight , false )		------���i���
				SetModeEx( Sirloth , EM_SetModeType_Searchenemy , false )	------������
				SetModeEx( Sirloth , EM_SetModeType_Mark , false )			------���i�I��
				SetModeEx( Sirloth , EM_SetModeType_NotShowHPMP , false )	------��show���
				AddToPartition( Sirloth , Room )
				WriteRoleValue(Sirloth , EM_RoleValue_register1 , Counter)
				WriteRoleValue(Sirloth , EM_RoleValue_register2 , OwnerID())
				WriteRoleValue(Sirloth , EM_RoleValue_register3 , FearWall)
				WriteRoleValue(Sirloth , EM_RoleValue_register4 , FearWall2)
				sleep(20)
				SetPosByFlag(Sirloth , DemonLordFlag , 4)
				BeginPlot( Sirloth , "star_102438_BossAI_2" , 0 )
				DelObj(Door1)
				DelObj(Door2)
				break
			end	
			if HealCounter >= 19 then						-----�c�]�L�O
				if table.getn(GetPlayer) > 5 then			-----�j��5�H
					local Lucky = {}
					for k=1 , table.getn(GetPlayer) do
						Lucky[k] = GetPlayer[k]
					end	
					for kk=1 , 5 do
						local Number = Rand(table.getn(Lucky))+1
						AddBuff(Lucky[kk] , HealBuff , 0 , -1)
						BeginPlot( Lucky[kk] , "star_102438_DemonSymbol" , 0 )
						table.remove(Lucky , Number)
					end
				else										-----�p��5�H
					for	jj=1 , table.getn(GetPlayer) do
						AddBuff(GetPlayer[jj] , HealBuff , 0 , -1)
						BeginPlot( GetPlayer[jj] , "star_102438_DemonSymbol" , 0 )
					end
				end
				HealCounter = 0
			end
			--Yell(OwnerID() , "Yes" , 5)
			AttackTarget = 0						
		else
			--Yell(OwnerID() , "No" , 5)
			if CheckID(PhysicDemon) == true then
				DelObj(PhysicDemon)
			end
			if CheckID(MagicDemon) == true then
				DelObj(MagicDemon)
			end
			DelObj(Door1)
			DelObj(Door2)
			DelObj(FearWall)
			DelObj(FearWall2)
			Setplot( Counter , "range" , "star_102438_counter_1" , 200)
			WriteRoleValue(OwnerID() , EM_RoleValue_register10 , 0 )		-----�k�s
			break
		end
	end	
end

function star_102438_BossAI_2()			-----�ĤG���q
	Setplot( OwnerID() , "dead" , "star_102438_SirlothDead" , 30)
	sleep(20)
	SetModeEx( OwnerID() , EM_SetModeType_Move , true )			------����
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )	------����
	SetModeEx( OwnerID() , EM_SetModeType_Fight , true )		------�i���
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )	------����
	SetModeEx( OwnerID() , EM_SetModeType_Mark , true )			------�i�I��
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true )	------show���
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue(OwnerID() , EM_RoleValue_register1)
	local SittingSir = ReadRoleValue(OwnerID() , EM_RoleValue_register2)
	local FearWall = ReadRoleValue(OwnerID() , EM_RoleValue_register3)
	local FearWall2 = ReadRoleValue(OwnerID() , EM_RoleValue_register4)
	local CombatCounter = 0	
	local SwordCounter = 0
	local ClawCounter = 0
	local FearCounter = 0
	
	local SwordSpell = 494979			-----�ƺ��߼C
	local ClawSpell = 494980			-----�c�]����
	local ClawDOT = 505656				-----�c�]����dot
	local NoReHPBuff = 505653			----���^��
	
	local DemonSwordTable = {}
	local ClawTable = {}
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			
		if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
			local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
			local HPPercent =( NowHP / MaxHP)*100
			
			CombatCounter = CombatCounter+1
			SwordCounter = SwordCounter+1
			ClawCounter = ClawCounter+1  
			FearCounter = FearCounter+1
			
			if HPPercent <= 40 then										-------�ĤT���qĲ�o
				--Say(OwnerID() , table.getn(ClawTable))
				for i=1 , table.getn(DemonSwordTable) do			
					if CheckID(DemonSwordTable[i]) == true then
						DelObj(DemonSwordTable[i])
					end
				end	
				for j=1 , table.getn(ClawTable) do			
					if CheckID(ClawTable[j]) == true then
						--DelObj(ClawTable[j])
						KillID(ClawTable[j] , ClawTable[j])			-----�α����~�|�������a���W��buff
					end
				end	
				BeginPlot( OwnerID() , "star_102438_BossAI_3" , 0 )		-----�i�J��3���q
				break
			end
			if SwordCounter >= 22 then
				local PlayerInHate = star_HateListSort(OwnerID())		--------�s�񪱮aGID
				local RandTarget1 = PlayerInHate[Rand(table.getn(PlayerInHate))+1]
				CastSpellLV( OwnerID() , RandTarget1 , SwordSpell , 0 )
				sleep(30)
				local DemonSword = star_CreateObj_NoAdd( RandTarget1 , 114339 , 20 , 0 , 0 , Room , 0)
				SetModeEx( DemonSword , EM_SetModeType_Move , false )			------������
				SetModeEx( DemonSword , EM_SetModeType_Strikback , false )	------������
				SetModeEx( DemonSword , EM_SetModeType_Fight , false )		------���i���
				SetModeEx( DemonSword , EM_SetModeType_Searchenemy , false )	------������				
				SetModeEx( DemonSword , EM_SetModeType_NotShowHPMP , false )	------��show���
				AddToPartition( DemonSword , Room )
				Setplot( DemonSword , "touch" , "star_102438_DemonSword1" , 30)
				DemonSwordTable[table.getn(DemonSwordTable)+1] = DemonSword
				SwordCounter = 0
			elseif ClawCounter >=12 then
				local PlayerInHate = star_HateListSort(OwnerID())		--------�s�񪱮aGID
				local RandTarget2 = PlayerInHate[Rand(table.getn(PlayerInHate))+1]
				--Yell(OwnerID() , "Number="..table.getn(PlayerInHate) , 5)
				--Yell(OwnerID() , RandTarget2 , 5)
				CastSpellLV( OwnerID() , RandTarget2 , ClawSpell , 0 )
				sleep(30)
				local Claw = star_CreateObj_NoAdd( RandTarget2 , 103060 , 0 , 0 , 0 , Room , 0)
				SetModeEx( Claw , EM_SetModeType_Move , false )			------������
				SetModeEx( Claw , EM_SetModeType_Strikback , false )	------������				
				SetModeEx( Claw , EM_SetModeType_Searchenemy , false )	------������								
				AddToPartition( Claw , Room )
				WriteRoleValue(Claw , EM_RoleValue_register1 , RandTarget2)
				AddBuff(Claw , NoReHPBuff , 0 , -1)
				Setplot( Claw , "dead" , "star_102438_ClawDead" , 30)
				BeginPlot( Claw , "star_102438_Claw" , 0 )
				ClawTable[table.getn(ClawTable)+1] = Claw
				ClawCounter = 0
			elseif FearCounter >= 8 then
				local FearSpell = 494982
				
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102438_SKILL_2]" , "0xff6fb7ff" )		-----����A���߲`�B�����ߡAŸ�ݧa!!
				sleep(20)
				local PlayerInHate = star_HateListSort(OwnerID())		--------�s�񪱮aGID
				local RandTarget2 = PlayerInHate[Rand(table.getn(PlayerInHate))+1]
				
				CastSpellLV( OwnerID() , RandTarget2 , FearSpell , 0 )
				sleep(10)
				FearCounter = 0			
			elseif CombatCounter >= 6 then
				star_102438_SirlothSkill()
				--CastSpellLV( OwnerID() , OwnerID() , 494757 , 0 )
				sleep(40)
				CombatCounter = 0			 	
			end
		else
			SetModeEx( SittingSir , EM_SetModeType_Show , true )
			Setplot( Counter , "range" , "star_102438_counter_1" , 200)
			for i=1 , table.getn(DemonSwordTable) do			
				if CheckID(DemonSwordTable[i]) == true then
					DelObj(DemonSwordTable[i])
				end
			end	
			for j=1 , table.getn(ClawTable) do			
				if CheckID(ClawTable[j]) == true then
					--DelObj(ClawTable[j])
					KillID(ClawTable[j] , ClawTable[j])			-----�α����~�|�������a���W��buff
				end
			end	
			DelObj(OwnerID())
			DelObj(FearWall)
			DelObj(FearWall2)
			break
		end	
	end
end

function star_102438_BossAI_3()		-----�ĤT���q
	Setplot( OwnerID() , "dead" , "star_102438_SirlothDead" , 30)
	
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue(OwnerID() , EM_RoleValue_register1)
	local SittingSir = ReadRoleValue(OwnerID() , EM_RoleValue_register2)
	local FearWall = ReadRoleValue(OwnerID() , EM_RoleValue_register3)
	local FearWall2 = ReadRoleValue(OwnerID() , EM_RoleValue_register4)
	local CombatCounter = 0
	local RockCounter = 0
	local FearCounter = 0
	local BerserkCounter = 0
	
	local NoReHPBuff = 505653			----���^��
	local StageChangeBuff = 505657		----�ܴ�������
	
	local PlayerInHate = star_HateListSort(OwnerID())		--------�s�񪱮aGID
	AddBuff(OwnerID() , NoReHPBuff , 0 , 10)
	SetModeEx( OwnerID() , EM_SetModeType_Move , false )			------������
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )	------������
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )	------������
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )			------���i�I��
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false )	------��show���
	--SetFightMode ( OwnerID() , 0 , 0 , 0 , 0 )
	--Yell(OwnerID() , "[SC_102438_BOSS_5]" , 10)		
	local GetPlayer = {}
	local PlayerGID = 0	
	local PlayerCount = SetSearchAllPlayer(Room)
	for j=1 , PlayerCount do
		PlayerGID = GetSearchResult()
		--Yell(OwnerID() , "range="..GetDistance( PlayerGID , Counter ) , 5)
		PlaySoundToPlayer( PlayerGID, "sound\\ambience\\dungeon\\naga_zur\\CERLOAUS_SPEAK1.wav", false )	
	end
	
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102438_BOSS_5]" , "0xff6fb7ff" )   -----���F!!�S������H�i�H���ѧڡA�N��O�A�̤]�S��������|!!�����a~�����a!!���F�ƺ��������H�~���ͩR�A�����ȱo�s�b!!
	sleep(67)
	PlayerCount = SetSearchAllPlayer(Room)
	for i=1 , PlayerCount do
		PlayerGID = GetSearchResult()
		AddBuff(PlayerGID , StageChangeBuff , 0 , 2)
		--AddBuff(PlayerInHate[i] , StageChangeBuff , 0 , 2)
		PlaySoundToPlayer( PlayerGID, "sound\\ambience\\dungeon\\naga_zur\\CERLOAUS_BREAK_FLOR.wav", false )
		BeginPlot( PlayerGID , "star_102438_PlayerPosCheck" , 0 )
	end
	SetRoomValue(Room , 0 , 2)							------����������2
	SetRoomValue(Room , 1 , 2)		------���񭵼�
	sleep(50)
	--Yell(OwnerID() , "Final" ,5)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102438_BOSS_6]" , "0xff6fb7ff" )   -----�ӧa�A�ɨ����檺�Pı!!
	CancelBuff(OwnerID() , NoReHPBuff)
	SetModeEx( OwnerID() , EM_SetModeType_Move , true )			------����
	SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )	------����
	SetModeEx( OwnerID() , EM_SetModeType_Fight , true )		------�i���
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )	------����
	SetModeEx( OwnerID() , EM_SetModeType_Mark , true )			------�i�I��
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true )	------show���
	--SetFightMode ( OwnerID() , 1 , 1 , 1 , 1 )						
	AddBuff(OwnerID() , 505801 , 0 , 240)						------�g�ɭp�ɥ�	
	
	while 1 do
		sleep(10)		
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			
		if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			CombatCounter = CombatCounter+1
			RockCounter = RockCounter+1
			FearCounter = FearCounter+1
			
			if RockCounter >= 13 then
				local RockSpell = 494981
				
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102438_SKILL_1]" , "0xff6fb7ff" )		-----�ߦ������A�~����o����!!
				sleep(20)
				PlayerInHate = star_HateListSort(OwnerID())		--------�s�񪱮aGID
				local RandTarget1 = PlayerInHate[Rand(table.getn(PlayerInHate))+1]
				local SharedPlayer = SearchRangePlayer ( RandTarget1 , 60 )
				local TotalDamage = 48000
				local PLV = math.floor( TotalDamage/(table.getn(SharedPlayer)*100) )
								
				CastSpellLV( OwnerID() , RandTarget1 , RockSpell , PLV )				
				sleep(40)
				RockCounter = 0
			elseif FearCounter >= 11 then
				local FearSpell = 494982
				
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102438_SKILL_2]" , "0xff6fb7ff" )		-----����A���߲`�B�����ߡAŸ�ݧa!!
				sleep(20)
				PlayerInHate = star_HateListSort(OwnerID())		--------�s�񪱮aGID
				local RandTarget2 = PlayerInHate[Rand(table.getn(PlayerInHate))+1]
				
				CastSpellLV( OwnerID() , RandTarget2 , FearSpell , 0 )
				sleep(10)
				FearCounter = 0				
			elseif CombatCounter >= 6 then
				star_102438_SirlothSkill()
				--CastSpellLV( OwnerID() , OwnerID() , 494757 , 0 )
				sleep(40)
				CombatCounter = 0
			end
			if CheckBuff(OwnerID() , 505801) == false then
				AddBuff(OwnerID() , 505802 , 0 , -1)	
			end	
		else
			--local PlayerGID
			PlayerCount = SetSearchAllPlayer(Room)
			for ii=1 , PlayerCount do
				PlayerGID = GetSearchResult()
				--Yell(OwnerID() , "range="..GetDistance( PlayerGID , Counter ) , 5)
				if ReadRoleValue(PlayerGID , EM_RoleValue_VOC) ~= 0 then
					AddBuff(PlayerGID , StageChangeBuff , 0 , 2)
					--SetFlag(PlayerGID , 543618 , 0)
				end	
			end
			SetRoomValue(Room , 0 , 1)							------���^����1
			SetRoomValue(Room , 1 , 1)							------����}������
			sleep(30)
			SetModeEx( SittingSir , EM_SetModeType_Show , true )
			Setplot( Counter , "range" , "star_102438_counter_1" , 200)			
			DelObj(OwnerID())
			DelObj(FearWall)
			DelObj(FearWall2)
			break
		end
	end	
end

function star_102438_SirlothSkill()
	local Skill = { 494685 , 494759 , 494757 }	
		-------------------------1.���k�F��	2.�a���z��	3.�y�Pŧ��			
	local SkillLv = {0 , 0 , 0 }
	local SkillString = { "[SC_102708_5]" , "[SC_102708_6]" , "[SC_102708_7]" }
	local Luck = Rand(100)
	local PlayerInHate = star_HateListSort(OwnerID())		--------�s�񪱮aGID
		
	if (Luck >= 0 and Luck < 15) or (Luck >= 45 and Luck < 60) then
		SkillIndex = 1
		local RandTarget1 = Rand(table.getn(PlayerInHate))+1	
		BossTarget = PlayerInHate[RandTarget1]
	elseif (Luck >= 15 and Luck < 30) or (Luck >= 60 and Luck < 75) then	
		SkillIndex = 2
		local RandTarget2 = Rand(table.getn(PlayerInHate))+1
		BossTarget = PlayerInHate[RandTarget2]	
	elseif (Luck >= 30 and Luck < 45) or (Luck >= 75 and Luck < 100) then	
		SkillIndex = 3
		BossTarget = OwnerID()
	end	
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , "0xff6fb7ff" )
	--Yell( OwnerID() , SkillString[SkillIndex] , 5)
	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
	--sleep(10)
end

function star_102438_DemonSymbol()		------�b���a���W���c�]�L�O�@��
	local Counter = 0
	while 1 do
		sleep(10)
		Counter = Counter+1
		if CheckBuff(OwnerID() , 505652) == false or Counter >=15 then
			CancelBuff_NoEvent( OwnerID(), 505815 )
			break
		end
	end
end

function star_102438_SirlothDead()				------�ƺ����`
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--local PlayerInHate = star_HateListSort(OwnerID())
	local StageChangeBuff = 505657		----�ܴ�������
	local PlayerGID
	local PlayerCount = SetSearchAllPlayer(Room)
	
	local FearWall = ReadRoleValue(OwnerID() , EM_RoleValue_register3)
	local FearWall2 = ReadRoleValue(OwnerID() , EM_RoleValue_register4)
	
	for ii=1 , PlayerCount do
		PlayerGID = GetSearchResult()
		--Yell(OwnerID() , "range="..GetDistance( PlayerGID , Counter ) , 5)
		if ReadRoleValue(PlayerGID , EM_RoleValue_VOC) ~= 0 then
			AddBuff(PlayerGID , StageChangeBuff , 0 , 2)
			if CheckFlag(PlayerGID , 543623) == false then		-------���ٸ���
				SetFlag(PlayerGID , 543623 , 1)
			end	
		end	
	end
	SetRoomValue(Room , 0 , 1)	
	SetRoomValue(Room , 1 , 1)		------����}������
	DelObj(FearWall)
	DelObj(FearWall2)
	Lua_bk_122_boss_530426()		------�ˬd���o�ٸ���
	--WriteInstanceArg(0 , 1000)	------�g�J�i��
end

function star_102438_Demon1Dead()
	local NoReHPBuff = 505653
	local DemonID1 = 103053			-----�c�]DBID
	local Boss = ReadRoleValue(OwnerID() , EM_RoleValue_register1)
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	AddRoleValue(Boss , EM_RoleValue_register10 , 1)
	local Demon1 = star_CreateObj_NoAdd( OwnerID() , DemonID1 , 0 , 0 , 0 , Room , 0)
	SetModeEx( Demon1 , EM_SetModeType_Move , false )		------������
	SetModeEx( Demon1 , EM_SetModeType_Strikback , false )	------������
	SetModeEx( Demon1 , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( Demon1 , EM_SetModeType_Searchenemy , false )------������
	SetModeEx( Demon1 , EM_SetModeType_Mark , false )		------���i�I��
	SetModeEx( Demon1 , EM_SetModeType_NotShowHPMP , false )	------��show���
	AddToPartition( Demon1 , Room )
	PlayMotion(Demon1 , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
	SetDefIdleMotion( Demon1 , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	WriteRoleValue(Boss , EM_RoleValue_register4 , Demon1)
	--Yell(OwnerID() , ReadRoleValue(Boss , EM_RoleValue_register10) , 5)	
	DelObj(OwnerID())
	--AddBuff(OwnerID() , NoReHPBuff , 0 , -1)
	--return false			
end

function star_102438_Demon2Dead()
	local NoReHPBuff = 505653
	local DemonID2 = 103054			-----�c�]DBID
	local Boss = ReadRoleValue(OwnerID() , EM_RoleValue_register1)
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	AddRoleValue(Boss , EM_RoleValue_register10 , 2)
	local Demon2 = star_CreateObj_NoAdd( OwnerID() , DemonID2 , 0 , 0 , 0 , Room , 0)
	SetModeEx( Demon2 , EM_SetModeType_Move , false )		------������
	SetModeEx( Demon2 , EM_SetModeType_Strikback , false )	------������
	SetModeEx( Demon2 , EM_SetModeType_Fight , false )		------���i���
	SetModeEx( Demon2 , EM_SetModeType_Searchenemy , false )------������
	SetModeEx( Demon2 , EM_SetModeType_Mark , false )		------���i�I��
	SetModeEx( Demon2 , EM_SetModeType_NotShowHPMP , false )	------��show���
	AddToPartition( Demon2 , Room )
	PlayMotion(Demon2 , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
	SetDefIdleMotion( Demon2 , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	WriteRoleValue(Boss , EM_RoleValue_register5 , Demon2)	
	--Yell(OwnerID() , ReadRoleValue(Boss , EM_RoleValue_register10) , 5)
	DelObj(OwnerID())
	--AddBuff(OwnerID() , NoReHPBuff , 0 , -1)	
	--return false		
end

function star_102438_Claw()
	local ClawBuff = 505655				-----�c�]����
	local ClawDOT = 505656				-----�c�]����dot
	local CapturedPlayer = ReadRoleValue(OwnerID() , EM_RoleValue_register1)		-----�Q�쪺���a
	--Say(OwnerID() , GetName(CapturedPlayer))
	while 1 do
		sleep(10)
		if CheckBuff(CapturedPlayer , ClawBuff) == false or
			ReadRoleValue(CapturedPlayer , EM_RoleValue_IsDead) == 1 then
			DelObj(OwnerID())
		end	
	end	
end

function star_102438_ClawDead()			------�c�]���⦺�`
	local ClawBuff = 505655				-----�c�]����
	local ClawDOT = 505656				-----�c�]����dot
	local CapturedPlayer = ReadRoleValue(OwnerID() , EM_RoleValue_register1)		-----�Q�쪺���a
	CancelBuff(CapturedPlayer , ClawBuff)
	CancelBuff(CapturedPlayer , ClawDOT)
	DelObj(OwnerID())
end

function star_102438_DemonSword1()
	local SwordBuff = 505797
	local Sword = 206702
	BeginPlot( TargetID() , "star_102438_DemonSword2" , 0 )
	AddBuff(OwnerID() , SwordBuff , 0 , -1)
	GiveBodyItem( OwnerID(), Sword, 1 )
end

function star_102438_DemonSword2()
	Setplot( OwnerID() , "touch" , "" , 0)	
	DelObj(OwnerID())
end

function star_102438_SwordSkillCheck()
	--Say(OwnerID() , ReadRoleValue( TargetID() , EM_RoleValue_OrgID))
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID) ~= 102438 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----�ޯ�ؼп��~
		return false
	else
		return true
	end
end

function star_102438_SwordSkill()
	local STR = ReadRoleValue(OwnerID() , EM_RoleValue_FinStr )
	local AGI = ReadRoleValue(OwnerID() , EM_RoleValue_FinAgi )
	local PLV = (STR+AGI)/15
	CastSpellLV( OwnerID() , TargetID() , 494984 , PLV)
end

function star_102438_PlayerPosCheck()		-----�ഫ�������ˬd���a�y��
	sleep(30)
	local TempY1 = 0
	local TempY2 = 0
	local TempY3 = 0
	local Counter = 0
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()		
	--Say(OwnerID() , BaseX)
	--Say(OwnerID() , BaseZ)
	if BaseX < 4655 or BaseX > 5275 then 	-----���b��L��
	 --and (BaseZ > 3180 or BaseZ < 2565 ) then		
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102438_MSG_2]" , 1 )	-----�A����ƺ������������ɤO�q�v�T!
		sleep(10)	
		ChangeZone( OwnerID() , 9 , 0 , -21004 , 1988 , 41023 , 75 )	
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------������l�]�w

function star_zone9Tozone122_check_1()					-------���f�ˬd���a
	Setplot( OwnerID() , "range" , "star_zone9Tozone122_check_2" , 200)
end

function star_zone9Tozone122_check_2()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--Say(OwnerID() , GetRoomValue(Room , 0))	
	if GetRoomValue(Room , 0) == 2 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102438_MSG_1]" , 1 )	-----�A�Q�ƺ������������ɤO�q�Ҫ��סA�ȮɵL�k�i�J!
		sleep(10)	
		ChangeZone( OwnerID() , 9 , 0 , -21004 , 1988 , 41023 , 75 )
	end	
end








