--==================================
--			������
--==================================

function FN_Xmas2012_Bear()	--�������󲣥ͼ@��
	local Bear = OwnerID()

	AddBuff(Bear, 507120, 0, -1)
end

function FN_Xmas2012_Bear_check()	--Bear��check�@��
	local Bear = OwnerID()
	local Bonfire = TargetID()

	if ReadRoleValue( Bonfire, EM_RoleValue_OrgID ) == 117698 and ReadRoleValue( Bonfire, EM_RoleValue_Register1 ) == 1 and ReadRoleValue( Bear, EM_RoleValue_Register1 ) == 0 then
		return true
	else
		return false
	end
end

function FN_Xmas2012_BearAction()	--���ʮ𱽨���磌��
	local Bear = OwnerID()
	local Bonfire = TargetID()
	local ActionCheck = ReadRoleValue(Bear, EM_RoleValue_Register1 )
	
	if ActionCheck == 0 then
		MoveToFlagEnabled( Bear, false )
		CallPlot( Bear, "FN_Xmas2012_BearPlot", Bonfire )
		WriteRoleValue( Bear, EM_RoleValue_Register1, 1 )
	end
end

function FN_Xmas2012_BearPlot( Bonfire )
	local Bear = OwnerID()
	local x,y,z,dir = DW_Location( Bonfire )

	Sleep( (Move( Bear, x, y, z ) + 5) )
	WriteRoleValue( Bonfire, EM_RoleValue_Register1, 2 )	--����ﺶ��
	PlayMotion( Bear, 37 )
	WriteRoleValue( Bear, EM_RoleValue_Register1, 0 )
	DesignLog( Bear , 114321 , "Bear hate Fire!" )
	Sleep( 10 )
	MoveToFlagEnabled( Bear, true )
end

--==================================
--			�ߤl����
--==================================

function FN_Xmas2012_Rabbit()	--�ߪ����󲣥ͼ@��
	local Rabbit = OwnerID()

	AddBuff( Rabbit, 507239, 0, -1)
	SetPlot( Rabbit, "touch", "FN_Xmas2012_RabbitTouch", 50 )
end

function FN_Xmas2012_Rabbit_check()	--Rabbit��check�@��
	local Rabbit = OwnerID()
	local Player = TargetID()

	if ReadRoleValue( Rabbit, EM_RoleValue_Register1 ) == 0 and ReadRoleValue( Player, EM_RoleValue_VOC ) ~= 0 then
		return true
	else
		return false
	end
end

function FN_Xmas2012_RabbitAction()
	local Rabbit = OwnerID()
	local Player = TargetID()
	local ActionCheck = ReadRoleValue(Rabbit, EM_RoleValue_Register1 )	--�ߤl�l�H���P�w

	if ActionCheck == 0 then
		MoveToFlagEnabled( Rabbit, false )
		CallPlot( Rabbit, "FN_Xmas2012_RabbitPlot", Player )
		WriteRoleValue( Rabbit, EM_RoleValue_Register1, 1 )
	end
end

function FN_Xmas2012_RabbitPlot(Player)
	local Rabbit = OwnerID()
	local RunTimeCount = 0
	while true do
		if ReadRoleValue(Rabbit, EM_RoleValue_Register2) == 1 then	--�����ߤl�Q���h
			WriteRoleValue( Rabbit, EM_RoleValue_Register2, 0 )
			break
		end
		if CheckDistance( Rabbit, Player, 35 ) == true then
			SysCastSpellLV( Rabbit, Player, 491672, 0 )
			PlayMotion( Rabbit, 37 )
			DesignLog( Player , 1143231 , "Watch out da Rabbit!" )
			break
		end
		if RunTimeCount >= 100 then
			break
		end
		--
		local x,y,z,dir = DW_Location( Player )
		local RunTime = Move( Rabbit, x, y, z )
		Sleep( RunTime )
		RunTimeCount = RunTimeCount + RunTime
	end
	MoveToFlagEnabled( Rabbit, true )
	Sleep( 100 )									--�ߤl���s�}�l���\�l�H��CD
	WriteRoleValue( Rabbit, EM_RoleValue_Register1, 0 )
end

function FN_Xmas2012_RabbitTouch()
	local Player = OwnerID()
	local Rabbit = TargetID()
	local DelayTime = ReadRoleValue( Rabbit, EM_RoleValue_MoveDelay)
	DebugMsg(0,0,"DelayTime="..DelayTime)
	if ReadRoleValue( Rabbit, EM_RoleValue_Register3 ) == 0 then
		WriteRoleValue( Rabbit, EM_RoleValue_Register3, 1 )	--����ߤl���n�Q����touch���}��
		WriteRoleValue( Rabbit, EM_RoleValue_Register2, 1 )	--�����ߤl�Q���h
		AdjustFaceDir( Rabbit, Player, 0 )
		PlayMotion( Player, 37 )
		SysCastSpellLV( Player, Rabbit, 498627, 0 )
		if Rand(4) == 0 then
			ScriptMessage( Player, Player, 2, "[FN_XMAS2012_RABBITDROP]", 0 )
			GiveBodyItem( Player, 205807, 1 )
		end
		DesignLog( Player , 1143232 , "Kick da Rabbit!" )
		--
		CancelBuff( Rabbit, 507239 )
		WriteRoleValue( Rabbit, EM_RoleValue_Register3, 0 )
		Sleep(100)							--�ߤl�Q�������h��CD
		AddBuff( Rabbit, 507239, 0, -1 )
		WriteRoleValue( Rabbit, EM_RoleValue_Register3, 0 )
	end
end

--==================================
--			5�j�F�~
--		Register1	�P�_����������1 ������0
--		Register2	�P�_�F�~�Q��������
--		Register3	�P�_�F�~�Q�����W��
--		Register4	Boss�P�_���S���Q����
--		Register5	�bBoss���W�������Ҥ��f
--		Register6	�����F�~�O�_�w�g�ˤU 1=�ˤU 0=�٨S
--		Register9	���`�ɲ��ͪ��S�Ī���ID
--		Register10	�������۪��ϥμ@�����Ѫ��S���
--==================================
function FN_Xmas2012_Soul_SkillCheck()
	local Player = TargetID()
	if ReadRoleValue( Player, EM_RoleValue_VOC ) == 0 then
		return false
	end
end

function FN_Xmas2012_Soul_Hit(Soul)
	--WriteRoleValue( Soul, EM_RoleValue_Register1, 1 )
	
	local HitNow = ReadRoleValue( Soul, EM_RoleValue_Register2 )
	local HitMax = ReadRoleValue( Soul, EM_RoleValue_Register3 )
	if (HitNow+1) >= HitMax then					--���˰ʪ����F
		MoveToFlagEnabled( Soul, false )
		StopMove( Soul, true )
		SetModeEx( Soul  , EM_SetModeType_Move, false )	--����
		PlayMotion( Soul, ruFUSION_ACTORSTATE_DYING )	--���񦺤`�ʧ@
		SetDefIdleMotion( Soul, ruFUSION_MIME_IDLE_DEAD )	--�O�����`�ʧ@
		WriteRoleValue( Soul, EM_RoleValue_Register6, 1 )		--���� �F�~�w�g�Q����
		BeginPlot( Soul, "FN_Xmas2012_Soul_down", 0 )
	else
		local SoulOrgID = ReadRoleValue( Soul, EM_RoleValue_OrgID )
		if SoulOrgID ~= 102986 and SoulOrgID ~= 102806 then	--������ư�
			local SoulSkillTable = { [101999]=490821; [102645]=490822; [102916]=490823}
			StopMove( Soul, true )
			CastSpell( Soul, Soul, SoulSkillTable[SoulOrgID] )
		end
		--
		if SoulOrgID == 102986 then WriteRoleValue( Soul, EM_RoleValue_Register4, 1 ) end	--Boss�S�O�P�_��
		WriteRoleValue( Soul, EM_RoleValue_Register2, (HitNow+1) )
	--	Say( Soul, "HitNow="..(HitNow+1) )
	end
	-- ���媺��t
	local MaxHp = ReadRoleValue( Soul, EM_RoleValue_MaxHP )
	local X = MaxHp/HitMax
	local Y = HitMax - (HitNow+1)
	WriteRoleValue( Soul, EM_RoleValue_HP, X*Y )
end

function FN_Xmas2012_Soul_touch()
	local Player = OwnerID()
	local Soul = TargetID()
	local SoulOrgID = ReadRoleValue( Soul, EM_RoleValue_OrgID )
	local Flag = ReadRoleValue( Soul, EM_RoleValue_Register10 )
	local Title = { [547192]=530945, [547193]=530944, [547194]=530943, [547195]=530946, [547196]=530947 }

	if CheckFlag( Player, Flag ) == true then
		ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL01]", 0 )
	elseif SoulOrgID == 102986 then
		local SoulFlag = { 547192, 547193, 547194, 547195 }
		for i = 1, 4 do					-- �������a�O�_�֦�4�F�~�� KeyItem
			if CheckFlag( Player, SoulFlag[i] ) == false then
				ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL08]", 0 )
				return
			end
		end
		SetFlag( Player, Flag, 1 )
		GiveBodyItem( Player, Title[Flag], 1 )
	else
		ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL02][$SETVAR1=".."["..SoulOrgID.."]".."]", 0 )
		SetFlag( Player, Flag, 1 )
		GiveBodyItem( Player, Title[Flag], 1 )
	end
end

function FN_Xmas2012_Soul_Creat()	--�F�~�гy
	local Soul = OwnerID()
	local SoulOrgID = ReadRoleValue( Soul, EM_RoleValue_OrgID ) --101999 �T 102645�� 102806�� 102916�H 102986���F
	local SoulFlag = { [101999]=547192; [102645]=547193;  [102806]=547194; [102916]=547195; [102986]=547196 }
	local SoulHit = { [101999]=10; [102645]=10;  [102806]=10; [102916]=7; [102986]=25 }
--	Say(Soul, SoulFlag[SoulOrgID])
	WriteRoleValue( Soul, EM_RoleValue_Register10, SoulFlag[SoulOrgID] )	--�g�J�o�ӯS��Ȩ��������۪��ϥμ@�����ѳo�O�F�~ ���Ȱѷӭ��n���~ID
	WriteRoleValue( Soul, EM_RoleValue_Register3, SoulHit[SoulOrgID] )	--�g�J�F�~�Q�����W��

	SetModeEx( Soul, EM_SetModeType_Fight , false )				--�i�������

	AddBuff( Soul, 504340, 0, -1 )							--�F�~�S��
	AddBuff( Soul, 505637, 0, -1 )							--�D�԰����^��
end

function FN_Xmas2012_Soul_down()	--�F�~�ˤU
	local Soul = OwnerID()
	local RoomID = ReadRoleValue( Soul, EM_RoleValue_RoomID )
	local SE = CreateObjByObj( 120996, Soul )
	local MaxHp = ReadRoleValue( Soul, EM_RoleValue_MaxHP )
	local OrgID = ReadRoleValue( Soul, EM_RoleValue_OrgID )
	
	SetPlot( Soul, "touch", "FN_Xmas2012_Soul_touch", 30 )
	DesignLog( Soul , 120143 , "Kill Soul="..OrgID )

	Sleep(1200)
	if OrgID == 102986 then		-- �p�G�OBossSoul�����R��
		local SP = ReadRoleValue( BossSoul, EM_RoleValue_Register5 )	-- Ū�����Ҥ��f
		SetPlot( SP, "touch", "FN_Xmas2012_SnowPortal_touch", 65 )	-- ���]���Ҥ��f��Ĳ�I�@��
		DelObj( SE )
		DelObj( Soul )
	else
		SetDefIdleMotion( Soul, ruFUSION_MIME_IDLE_STAND )			--���s���_�Ӫ��ʧ@
		MoveToFlagEnabled( Soul, true )						--���s�}�l����
		SetModeEx( Soul  , EM_SetModeType_Move, true )	--����
		Hide( Soul )									--����
		DelObj( SE )									--�R���S�ĥΪ�����
		WriteRoleValue( Soul, EM_RoleValue_Register2, 0 )				--�P�_�Q���������k0
		SetPlot( Soul, "touch", "", 0 )
		Sleep(9000)
		Show( Soul, RoomID )								--�q�X��
		WriteRoleValue( Soul, EM_RoleValue_HP, MaxHp )				--���q�ɺ�
		WriteRoleValue( Soul, EM_RoleValue_Register6, 0 )				--���� �F�~���s���_��
	end
end

function FN_Xmas2012_SnowPortal_Creat()	--���Ҥ��f ���󲣥ͼ@��
	local SP = OwnerID()
	SetPlot( SP, "touch", "FN_Xmas2012_SnowPortal_touch", 65 )
end

function FN_Xmas2012_SnowPortal_touch()	--���Ҥ��f Ĳ�I�ƥ�
	local Player = OwnerID()
	local SP = TargetID()
	local RoomID = ReadRoleValue( SP, EM_RoleValue_RoomID )
	local SoulFlag = { 547192, 547193, 547194, 547195 }

	if CheckFlag( Player, 547196 ) == true then 	-- �������a�O���O�w�gĲ�I�LBoss
		ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL07]", 0 )
		return
	end

	for i = 1, 4 do					-- �������a�O�_�֦�4�F�~�� KeyItem
		if CheckFlag( Player, SoulFlag[i] ) == false then
			ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL03]", 0 )
			return
		end
	end
	--
	SetPlot( SP, "touch", "", 0 )					--�b�w�g�l��FBoss���ɭԤ����I
	ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SOUL04]", 0 )
	--
	local BossSoul = CreateObjByObj( 102986, SP )
	SetPos( BossSoul, -11210, 715, -3511, 291 )
	SetRandMove( BossSoul, 100, 3, 60 )				--�üƲ���
	WriteRoleValue( BossSoul, EM_RoleValue_Register5, SP )
	CallPlot( BossSoul, "FN_Xmas2012_BossSoul", 0 )
	AddToPartition(BossSoul , RoomID)
end

function FN_Xmas2012_BossSoul()		--Boss
	local BossSoul = OwnerID()
	local LiveTime = 180
	local FightTime = 0
	local CDTimeSkillAB = 5
	local PlayerSkillC
	local CDTimeSkillC = 0
	local CDTimeSkillD = 0
	local BossSkillTable = { [1]=490821; [2]=490822; [3]=490823}	--�j�� ���z �_��
	
	while true do
		local HitCheck = ReadRoleValue( BossSoul, EM_RoleValue_Register4 )
		if HitCheck == 1 then								--�p�G���Q����
				FightTime = 8								--��i�J�԰��ɶ����m
--				LiveTime = 180							--��ͦs�ɶ����m
		end
		--
		if FightTime > 0 then
			FightTime = FightTime - 1
			--�H��ޯ� �j��/���z
			if CDTimeSkillAB == 0 and HitCheck == 1 then
				local RandNum = DW_Rand( 2 )
				CastSpell( BossSoul, BossSoul, BossSkillTable[RandNum] )
				CDTimeSkillAB = 5
			elseif CDTimeSkillAB > 0 then
				CDTimeSkillAB = CDTimeSkillAB - 1
			end
			--�j�a�_��
			if CDTimeSkillC == 0 and HitCheck == 1 then
				local PlayerList = SearchRangePlayer( BossSoul, 125 )
				local RandNum = Rand( table.getn( PlayerList ) )
				PlayerSkillC = PlayerList[RandNum]
				CDTimeSkillC = 8
			elseif CDTimeSkillC > 0 then
				CDTimeSkillC = CDTimeSkillC - 1
				CastSpell( BossSoul, PlayerSkillC, BossSkillTable[3] )
			end
			--�����P�����
			if CDTimeSkillD == 0 then
				CDTimeSkillD = 10
				local NPCList = SearchRangeNPC( BossSoul, 125 )
				for i = table.getn(NPCList), 0, -1 do
					if ReadRoleValue( NPCList[i], EM_RoleValue_OrgID ) == 117698 and ReadRoleValue( NPCList[i], EM_RoleValue_Register1 ) == 1 then
						WriteRoleValue( NPCList[i], EM_RoleValue_Register1, 2 )	--����ﺶ��
					end
				end
				ScriptMessage( BossSoul, 0, 2, "[FN_XMAS2012_SOUL06]", 0 )
			 else
				CDTimeSkillD = CDTimeSkillD - 1
			end
		end
		--
		if LiveTime == 0 then								-- �ͦs�ɶ���0
			local SP = ReadRoleValue( BossSoul, EM_RoleValue_Register5 )	-- Ū�����Ҥ��f
			SetPlot( SP, "touch", "FN_Xmas2012_SnowPortal_touch", 65 )	-- ���]���Ҥ��f��Ĳ�I�@��
			ScriptMessage( BossSoul, 0, 2, "[FN_XMAS2012_SOUL05]", 0 )
			DelObj( BossSoul )
		else
			LiveTime = LiveTime - 1
		end
		--
		WriteRoleValue( BossSoul, EM_RoleValue_Register4, 0 )		--�������P�w�^�_��0
		--
		Sleep(10)
	end
end

--==================================
--			���ү�q�`�I
--==================================
function FN_Xmas2012_SnowPoint()
	local Point = OwnerID()

	SetPlot( Point, "touch", "FN_Xmas2012_SnowPoint_touch", 20 )
--	SetModeEx( Point, EM_SetModeType_Strikback, false )		--����
--	SetModeEx( Point, EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
--	SetModeEx( Point, EM_SetModeType_Obstruct, false )		--����
--	SetModeEx( Point, EM_SetModeType_Mark, true )			--�аO
	SetModeEx( Point, EM_SetModeType_Move, false )			--����
	SetModeEx( Point, EM_SetModeType_Gravity, false )		--���O
	SetModeEx( Point, EM_SetModeType_AlignToSurface, false )	--�K�a
--	SetModeEx( Point, EM_SetModeType_Searchenemy, false )		--����
--	SetModeEx( Point, EM_SetModeType_HideName, true )		--�W��
	SetModeEx( Point, EM_SetModeType_ShowRoleHead, false )	--�Y����
--	SetModeEx( Point, EM_SetModeType_Fight , false )			--�i�������
--	SetModeEx( Point, EM_SetModeType_Drag , true )			--���O
end

function FN_Xmas2012_SnowPoint_touch()
	local Player = OwnerID()
	local SnowPoint = TargetID()
	local Quest = ReadRoleValue( SnowPoint, EM_RoleValue_Register1 )
	if CheckAcceptQuest( Player, Quest ) == true then
		BeginCastBarEvent( Player, TargetID(), "[FN_XMAS2012_SNOWPOINT]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "FN_Xmas2012_SnowPoint_Plot" )
	else
		ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SNOWPOINT_01]", 0 )
	end
end

function FN_Xmas2012_SnowPoint_Plot(Obj,CheckResult)
	local Player = OwnerID()
	local SnowPoint = TargetID()
	local Pid = ReadRoleValue( SnowPoint, EM_RoleValue_PID )

	if CheckResult > 0 then					--�j��0�O���\
		SetFlag( Player, Pid, 1 )
--	elseif CheckResult < 0 then 				--�p��0�O����
--		return
	end
	EndCastBar( Player, CheckResult )
end

function FN_Xmas2012_SnowPoint_Q421649()
	local player = TargetID()
	SetFlag( player, 547183, 0 )	--���ȧ��� �����e�m����
	SetFlag( player, 547323, 1 )	--FN�K�[�����Լ��P�_�X��
	DesignLog( Player , 421649 , "SnowPoint Q1 complete" )
end

function FN_Xmas2012_SnowPoint_Q421650()
	local player = TargetID()
	GiveBodyItem( player, 530941, 1 )
	SetFlag( player, 547184, 0 )	--���ȧ��� �����e�m����
	SetFlag( player, 547324, 1 )	--FN�K�[�����Լ��P�_�X��
	DesignLog( Player , 421650 , "SnowPoint Q2 complete" )
end

function FN_Xmas2012_SnowPoint_Q421651()
	local player = TargetID()
	GiveBodyItem( player, 530942, 1 )
	SetFlag( player, 547185, 0 )	--���ȧ��� �����e�m����
	SetFlag( player, 547325, 1 )	--FN�K�[�����Լ��P�_�X��
	DesignLog( Player , 421651 , "SnowPoint Q3 complete" )
end

--==================================
--			�г����_�c
--==================================
function FN_Xmas2012_SnowTreasure_Creat()	--�г����_�c
	local SnowTreasure = OwnerID()
	SetModeEx( SnowTreasure, EM_SetModeType_Mark, true )			--�аO
	SetModeEx( SnowTreasure, EM_SetModeType_Obstruct, false )		--����
	SetModeEx( SnowTreasure, EM_SetModeType_ShowRoleHead, false )	--�Y����
	SetPlot( SnowTreasure, "touch", "FN_Xmas2012_SnowTreasure_touch", 50 )
end

function FN_Xmas2012_SnowTreasure_touch()	--touch�г����_�c
	local Player = OwnerID()
	local TrueID = ReadRoleValue( Player, EM_RoleValue_DBID )
	local SnowTreasure = TargetID()

	for y = 1, table.getn( Z358_Treasure[SnowTreasure] ) do	--�o�q�O�q�����ܼƪ��������A�T�{���a�b�ɶ������S���}�ҹL�o��Treasure
		if Z358_Treasure[SnowTreasure][y] == TrueID then
			ScriptMessage( Player, Player, 2, "[FN_XMAS2012_SNOWTREASURE01]", C_SYSTEM )
			return
		end
	end

	BeginCastBarEvent( Player, SnowTreasure, "[SC_GERMANY2_CONCERTO_05]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "FN_Xmas2012_SnowTreasure_Result" )
end

function FN_Xmas2012_SnowTreasure_Result(Obj,CheckResult)	--touch�г����_�c
	local Player = OwnerID()
	local SnowTreasure = TargetID()

	if CheckResult > 0 then					--�j��0�O���\
		GiveBodyItem( Player, 724331, 1 )			--���_��

		local TrueID = ReadRoleValue( Player, EM_RoleValue_DBID )
		table.insert( Z358_Treasure[SnowTreasure], TrueID )	--���a���\�}��Treasure�A�O������ܼƷ�
--	elseif CheckResult < 0 then 				--�p��0�O����
--		return
		DesignLog( Player , 117199 , "Snow Treasure Open" )
	end
	EndCastBar( Player, CheckResult )
end
--==================================
--			���Ҥj���_
--==================================
function FN_Xmas2012_SnowOnePiece_Creat()
	local SnowOnePiece = OwnerID()
	SetModeEx( SnowOnePiece, EM_SetModeType_Mark, true )			--�аO
	SetModeEx( SnowOnePiece, EM_SetModeType_ShowRoleHead, false )	--�Y����
	SetPlot( SnowOnePiece, "touch", "FN_Xmas2012_SnowOnePiece_touch", 50 )
	--
	AddBuff( SnowOnePiece, 507821, 0 ,-1 )
	--
	while true do
		local SnowPower = ReadRoleValue( SnowOnePiece, EM_RoleValue_Register1 )
		if SnowPower > 0 then WriteRoleValue( SnowOnePiece, EM_RoleValue_Register1, (SnowPower-1) ) end
		--
		Sleep( 70 )
	end
end	

function FN_Xmas2012_SnowOnePiece_touch()
	local Player = OwnerID()
	local SnowOnePiece = TargetID()
	local SnowPower = ReadRoleValue( SnowOnePiece, EM_RoleValue_Register1 )

	if CheckFlag( Player, 541882 ) == false then
		GiveBodyItem( Player, 724488, 1 )		--���_��
		GiveBodyItem( Player, 241481, 15 )
		SetFlag( Player, 541882, 1 )
		if (SnowPower+10) >= 100 then
			ScriptMessage( Player, -1, 1, "[FN_XMAS2012_SNOWONEPIECE3]", C_SYSTEM )
			WriteRoleValue( SnowOnePiece, EM_RoleValue_Register1, 0 )
			local AllFire = LuaFunc_SearchRoomNPCbyOrgID( SnowOnePiece , 117698 , 1)
			for i = 1, #AllFire do
				if ReadRoleValue( AllFire[i], EM_RoleValue_Register1 ) == 1 then
					WriteRoleValue( AllFire[i], EM_RoleValue_Register1, 2 )	--����ﺶ��
				end
			end
		else
			WriteRoleValue( SnowOnePiece, EM_RoleValue_Register1, (SnowPower+10) )
			ScriptMessage( Player, -1, 0, "[FN_XMAS2012_SNOWONEPIECE1][$SETVAR1="..(SnowPower+10).."]", C_SYSTEM )
		end
		DesignLog( Player , 114941 , "Snow OnePiece Open" )
	else
		ScriptMessage( Player, Player, 3, "[FN_XMAS2012_SNOWONEPIECE2]", C_SYSTEM )
		return
	end
end