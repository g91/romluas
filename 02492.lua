--	�X�� 781187
--		0�G�������k���_��m
--		1�G�}�����ת��G���l���S(����)
--		2�G�}�����ת��G��߫���(�Ŷ�)
--		3�G�}����I�G��߫���(�Ŷ�)
--		4�G�}����I�G���l���S(����)
--		5�G�ɵ��I�G�Ȥ�ﯸ
--		6�G�ɵ��I�G�P�f�ﯸ
--		21�B22�B23�B24�B25�B26�G���ǭ����I
--		27�G���F���a��BOSS�ǭ����I
--		31�B32�G��߫���(�Ŷ�)���I���u�@�ǭ����I
--		41�B42�G���l���S(����)���I���u�@�ǭ����I
--		51�B52�B53�G��߫���(�Ŷ�)���T�����׸���
--		54�B55�B56�B57�B58�B59�G��߫���(�Ŷ�)���T�����ýb��
--		61�B62�B63�G���l���S(����)���T�����׸���
--		64�B65�B66�B67�B68�B69�G���l���S(����)���T�����ýb��
--	HideUnit (������)
--	 	Register + 1�G�������l���S(����)���}�����ת�
--		Register + 2�G������߫���(�Ŷ�)���}�����ת�
--		Register + 3�G������߫���(�Ŷ�)�����I
--		Register + 4�G�������l���S(����)�����I
--		Register + 5�G�����Ȥ�ﯸ���ɵ��I
--		Register + 6�G�����P�f�ﯸ���ɵ��I
--		Register + 7�G�����{�b��NPC���͵���
--	 �Գ����I���
--		57�G���߹Ϯ�
--		58�G���l���S(����)�Ϯ�
--		59�G��߫���(�Ŷ�)�Ϯ�
-- 	Camp
-- 		2�G����
--		8�GT1 - ���l���S(����)
--		9�GT2 - ��߫���(�Ŷ�)
-- 	Team
--		1�GT1 - ���l���S(����)
--		2�GT2 - ��߫���(�Ŷ�)
--	DesignLog
--		121169		�C����������(�T���i������Ĺ�B�άO����)
--		121433		�C����O�h�֮ɶ�
--		121435		����Q�ܨ�������(�T���i�������ܨ�)
--		121434		�X�l�Q���٪�����(�T���i�������ٺX)
--		121440		�ϥΨ��b������(�T���i���ϥέ��Ө��b)
--		121439		��ѧޯস��(�T���i����ѭ��ӧޯ�)

function BG_AA_Set()		--���b���󲣥ͼ@���A����ӾԳ�����l��
	local HideUnit = OwnerID()
	local RoomID = ReadRoleValue( HideUnit, EM_RoleValue_RoomID )
	--�����ܼ�
	if Z448_v == nil then
		Z448_v = {}	--�Ы��ݩ󯦪k�ѾԪ������ܼ�
	end
	
	Z448_v[RoomID] = {}	--�Ы��ݩ�Ӽh�������ܼ�

	Z448_v[RoomID][1] = HideUnit	--������
	Z448_v[RoomID][2] = 5		--�ΨӧP�_�ɵ��I�ثe���Ӷ}��
	Z448_v[RoomID][3] = 0		--�����ܺX���X�l
	Z448_v[RoomID][30] = -1		--�Գ�Timer
	Z448_v[RoomID][31] = ""		--�Գ��{��
	--
	--������
	WriteRoleValue(HideUnit, EM_RoleValue_Register+7, 1)	-- �ΨӧP�_���a�ثe�Ӵ��ɨ�X�šA�M���ǭ��ͮɳ]�w�����šA�C60��|+1
	--�W�h�إ�
	SetZoneReviveScript( "BG_AA_Revive" )		-- ���a���ͼ@���A�g�b�᭱
	SetZonePVPScript( "BG_AA_PVPDead" )	-- ���a�����@���A�g�b�᭱

	--�Ыب���}�窺��
	for i = 1, 2 do
		local Gate = CreateObjByFlag( 121433 , 781187 , i , 1 ) 
		SetModeEx( Gate, EM_SetModeType_Strikback, false )			--����
		SetModeEx( Gate, EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
		SetModeEx( Gate, EM_SetModeType_Obstruct, true )			--����
		SetModeEx( Gate, EM_SetModeType_Mark, false )			--�аO
		SetModeEx( Gate, EM_SetModeType_Move, false )			--����
		SetModeEx( Gate, EM_SetModeType_Searchenemy, false )		--����
		SetModeEx( Gate, EM_SetModeType_HideName, false )			--�W��
		SetModeEx( Gate, EM_SetModeType_ShowRoleHead, false )		--�Y����
		SetModeEx( Gate, EM_SetModeType_Fight , false )			--�i�������
		SetModeEx( Gate, EM_SetModeType_Drag , true )			--���O
		AddToPartition(Gate , RoomID)
		WriteRoleValue(HideUnit, EM_RoleValue_Register+i, Gate )		-- ����O�줤������Register��
	end
	
	--�Ыؾ��I
	local FightingPoint
	for i = 3, 4 do
		if i == 3 then	FightingPoint = CreateObjByFlag( 107775 , 781187 , i , 1 )	--������I
		else				FightingPoint = CreateObjByFlag( 107774 , 781187 , i , 1 )	--���l���I
		end
		SetModeEx( FightingPoint, EM_SetModeType_Strikback , true )			--����
		SetModeEx( FightingPoint, EM_SetModeType_SearchenemyIgnore , false )	--�Q�j�M
		SetModeEx( FightingPoint, EM_SetModeType_Obstruct , true )			--����
		SetModeEx( FightingPoint, EM_SetModeType_Mark , true )			--�аO
		SetModeEx( FightingPoint, EM_SetModeType_Move , false )			--����
		SetModeEx( FightingPoint, EM_SetModeType_Searchenemy , true )		--����
		SetModeEx( FightingPoint, EM_SetModeType_HideName , true )			--�W��
		SetModeEx( FightingPoint, EM_SetModeType_ShowRoleHead , true )		--�Y����
		SetModeEx( FightingPoint, EM_SetModeType_Fight , true )			--�i�������
		SetModeEx( FightingPoint, EM_SetModeType_Drag , true )			--���O
		if i == 3 then
			SetRoleCampID( FightingPoint , 9 )	--�}��GT2 - ��߫���(�Ŷ�)
			WriteRoleValue( HideUnit , EM_RoleValue_Register + i , 9 )		-- ����I�}��O�줤������Register��
		else
			SetRoleCampID( FightingPoint , 8 )	--�}��GT1 - ���l���S(����)
			WriteRoleValue( HideUnit , EM_RoleValue_Register + i , 8 )		-- ����I�}��O�줤������Register��
		end
		AddToPartition( FightingPoint , RoomID )
		AddBuff( FightingPoint , 502707 , 0 , -1 )	-- ���^��
		
		--�Ыظ˹�����
		local AdornPoint
		if i == 3 then	AdornPoint = CreateObjByFlag( 121438 , 781187 , i , 1 )	--������I�˹�������
		else				AdornPoint = CreateObjByFlag( 121437 , 781187 , i , 1 )	--���l���I�˹��Ť���
		end
		SetModeEx( AdornPoint, EM_SetModeType_Strikback, false )			--����
		SetModeEx( AdornPoint, EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
		SetModeEx( AdornPoint, EM_SetModeType_Obstruct, false )			--����
		SetModeEx( AdornPoint, EM_SetModeType_Mark, false )			--�аO
		SetModeEx( AdornPoint, EM_SetModeType_Move, false )			--����
		SetModeEx( AdornPoint, EM_SetModeType_Searchenemy, false )		--����
		SetModeEx( AdornPoint, EM_SetModeType_HideName, false )			--�W��
		SetModeEx( AdornPoint, EM_SetModeType_ShowRoleHead, false )		--�Y����
		SetModeEx( AdornPoint, EM_SetModeType_Fight , false )			--�i�������
		SetModeEx( AdornPoint, EM_SetModeType_Drag , false )			--���O
		if i == 3 then	SetRoleCampID( AdornPoint , 9 )	--�}��GT2 - ��߫���(�Ŷ�)
		else				SetRoleCampID( AdornPoint , 8 )	--�}��GT1 - ���l���S(����)
		end
		AddToPartition( AdornPoint , RoomID )
		
		local pX = ReadRoleValue( FightingPoint , EM_RoleValue_X )
		local pY = ReadRoleValue( FightingPoint , EM_RoleValue_Y )
		local pZ = ReadRoleValue( FightingPoint , EM_RoleValue_Z )
		local pName = "[BG_AA_POINT_" ..i.. "]"
		if i == 3 then	SetLandMarkInfo( RoomID, i, 59, pX, pY, pZ, pName, 59 )	--�]�w�Գ����I��ơA59�G��߫���(�Ŷ�)�Ϯ�
		else				SetLandMarkInfo( RoomID, i, 58, pX, pY, pZ, pName, 58 )	--�]�w�Գ����I��ơA58�G���l���S(����)�Ϯ�
		end
		WriteRoleValue( FightingPoint , EM_RoleValue_PID , i )				-- ����I��MarkNum�O�b���I�ۤv��PID�W��
		WriteRoleValue( FightingPoint , EM_RoleValue_Register + 1 , AdornPoint )	--��˹��O����I��Register��
		
		SetPlot( FightingPoint , "dead" , "BG_AA_Flag_Dead" , 30 )			-- ���I���`�ƥ�
		
		--�Ыؾ��I�u��
		for j = 1, 2 do
			local Guard	--�u��
			if j == 1 then	Guard = CreateObjByFlag( 102899 , 781187 ,  i * 10 + j , 1 )	--��x�äh�Ai * 10 + j �O�P�_��m
			else				Guard = CreateObjByFlag( 102900 , 781187 ,  i * 10 + j , 1 )	--��x�N�h�Ai * 10 + j �O�P�_��m
			end
			if i == 3 then	SetRoleCampID( Guard , 9 )	--�}��GT2 - ��߫���(�Ŷ�)
			else				SetRoleCampID( Guard , 8 )	--�}��GT1 - ���l���S(����)
			end
			AddToPartition( Guard , RoomID )
			SetPlot( Guard , "dead" , "BG_AA_Guard_Kill" , 0 )
		end
	end
	
	--�ЫؾԳ����ٻP���ýb��
	for i = 5 , 6 do
		for j = 1 , 3 do	--�Գ�����
			local Barrier = CreateObjByFlag( 104858 , 781187 , i * 10 + j , 1 ) 
			SetModeEx( Barrier , EM_SetModeType_Strikback , false )			--����
			SetModeEx( Barrier , EM_SetModeType_SearchenemyIgnore , false )	--�Q�j�M
			SetModeEx( Barrier , EM_SetModeType_Obstruct , true )			--����
			SetModeEx( Barrier , EM_SetModeType_Mark , true )			--�аO
			SetModeEx( Barrier , EM_SetModeType_Move , false )			--����
			SetModeEx( Barrier , EM_SetModeType_Searchenemy , false )		--����
			SetModeEx( Barrier , EM_SetModeType_HideName , true )			--�W��
			SetModeEx( Barrier , EM_SetModeType_ShowRoleHead , true )		--�Y����
			SetModeEx( Barrier , EM_SetModeType_Fight , true )			--�i�������
			SetModeEx( Barrier , EM_SetModeType_Drag , true )			--���O
			if i == 5 then	SetRoleCampID( Barrier , 9 )	--9�GT2 - ��߫���(�Ŷ�)
			else	SetRoleCampID( Barrier , 8 )	--8�GT1 - ���l���S(����)
			end
			AddToPartition( Barrier , RoomID )
			SetPlot( Barrier , "touch" , "BG_AA_TouchBarrier" , 60 )			-- ����Ĳ�I�ƥ�
			SetPlot( Barrier , "dead" , "BG_AA_BarrierDeath" , 0 )	--�j�������`�@��
			AddBuff( Barrier , 502707 , 0 , -1 )	-- ���^��
			CallPlot( Barrier , "BG_AA_CreateSoldiers" , i , j , HideUnit )		--����Ыذ}��p�L��ܡA�a�J�ѼơGi = �}��Bj = ���u�B������objID
		end
		
		for j = 4 , 9 do	--���ýb��
			local Towers = CreateObjByFlag( 104860 , 781187 , i * 10 + j , 1 ) 
			SetModeEx( Towers , EM_SetModeType_Strikback , true )			--����
			SetModeEx( Towers , EM_SetModeType_SearchenemyIgnore , false )	--�Q�j�M
			SetModeEx( Towers , EM_SetModeType_Obstruct , true )			--����
			SetModeEx( Towers , EM_SetModeType_Mark , true )			--�аO
			SetModeEx( Towers , EM_SetModeType_Move , false )			--����
			SetModeEx( Towers , EM_SetModeType_Searchenemy , true )		--����
			SetModeEx( Towers , EM_SetModeType_HideName , true )			--�W��
			SetModeEx( Towers , EM_SetModeType_ShowRoleHead , true )		--�Y����
			SetModeEx( Towers , EM_SetModeType_Fight , true )			--�i�������
			SetModeEx( Towers , EM_SetModeType_Drag , true )			--���O
			if i == 5 then	SetRoleCampID( Towers , 9 )	--9�GT2 - ��߫���(�Ŷ�)
			else	SetRoleCampID( Towers , 8 )	--8�GT1 - ���l���S(����)
			end
			AddToPartition( Towers , RoomID )
			SetPlot( Barrier , "dead" , "BG_AA_TowersDeath" , 0 )	--���ýb�𪺦��`�@��
			AddBuff( Towers , 502707 , 0 , -1 )	-- ���^��
		end
	end
	
	--�Ыظɵ��I
	for i = 5, 6 do
		local Treasure = CreateObjByFlag( 113716 , 781187 , i , 1 ) 
		SetModeEx( Treasure, EM_SetModeType_Strikback, false )		--����
		SetModeEx( Treasure, EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
		SetModeEx( Treasure, EM_SetModeType_Obstruct, true )		--����
		SetModeEx( Treasure, EM_SetModeType_Mark, true )			--�аO
		SetModeEx( Treasure, EM_SetModeType_Move, false )			--����
		SetModeEx( Treasure, EM_SetModeType_Searchenemy, false )		--����
		SetModeEx( Treasure, EM_SetModeType_HideName, true )		--�W��
		SetModeEx( Treasure, EM_SetModeType_ShowRoleHead, false )		--�Y����
		SetModeEx( Treasure, EM_SetModeType_Fight , false )			--�i�������
		SetModeEx( Treasure, EM_SetModeType_Drag , true )			--���O
		SetRoleCampID( Treasure, 2 )						--�w�]�����ߤͦn�}��
		AddToPartition( Treasure , RoomID)
		
		local pX = ReadRoleValue(Treasure,EM_RoleValue_X)
		local pY = ReadRoleValue(Treasure,EM_RoleValue_Y)
		local pZ = ReadRoleValue(Treasure,EM_RoleValue_Z)
		local pName = "[BG_AA_POINT_" ..i.. "]"
		SetLandMarkInfo( RoomID, i, 57, pX, pY, pZ, pName, 57 );		-- �]�w�Գ����I��ơA57�G���߹ϮסB58�G���l���S(����)�ϮסB59�G��߫���(�Ŷ�)�Ϯ�
		WriteRoleValue( Treasure, EM_RoleValue_PID, i )			-- ����I��MarkNum�O�b���I�ۤv��PID�W��
		WriteRoleValue( HideUnit, EM_RoleValue_Register+i, Treasure )		-- ��ɵ��I�O�줤������Register��
		SetPlot( Treasure, "touch" , "BG_AA_TakeTreasure" , 60 )			-- ���IĲ�I�ƥ�
	end
end

function LuaZone_BG_AA_EnterZoneScript()	--���a�i�J�Գ�Ĳ�o
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID )
	local HideUnit = Z448_v[RoomID][1]

	if Z448_v[RoomID][30] == -1 then	--�Ĥ@�Ӫ��a�i��Գ�����~�}�l�p�ɾ�
		CallPlot( HideUnit, "BG_AA_Timer" )
	end
	--���a�_�l�]�w
	DebugMsg( 0, RoomID, "Player "..Player.." enter battle ground" )
	BG_AA_PlayerSet( RoomID, Player )
	InitBgIndependence( Player , 	Def_InitBgIndependence_MaxWeaponSkill +
	Def_InitBgIndependence_MaxMagicSkill + Def_InitBgIndependence_TitleClear +
	Def_InitBgIndependence_KeyItemClear + Def_InitBgIndependence_QuestClear +
	Def_InitBgIndependence_PetClear + Def_InitBgIndependence_BuffClear )	-- �o����@�곣�O��W�߾Գ����]�w����
end

--==================================
--			�Գ���Ӯɶ��i�{
--==================================
function BG_AA_Timer()	--�Գ���Ӯɶ��i�{
	local HideUnit = OwnerID()
	local RoomID = ReadRoleValue( HideUnit, EM_RoleValue_RoomID )

	local BG_time = 90									--�Գ������}�l�e���ǳƮɶ�
	local BG_State = "Prepare"						--�Գ��ثe���A�A�ΨӰ��P�w
	local Score1700Check = { false, false }	--�ΨӧP�_�ⶤ�U�ۨ�F1700���ɪ��T���A�u�n��e�@��
	Z448_v[RoomID][30] = BG_time
	Z448_v[RoomID][31] = BG_State
	
	local MaxLv = 10				--���ŤW��
	local PlayerAddExp = 100		--���a�C���W�[�g���
	local NpcLvUpTime = 60			--NPC���ͳ]�w���Ůɶ�
	local PlayerAddExpTime = 30	--���a�C���W�[�g��Ȯɶ�

	local Flag
	local FlagNowTimer = 300			-- �@�}�l�]300�O�Ψӷ�@�p��X�l�}���Ĥ@�������Ԯɶ�
	local FlagReplaceTimer = 180		-- �X�l���ͪ��ɶ� ��1��1��

	local MonsterType = { 
	[21] = 102901; 
	[22] = 102902; 
	[23] = 102903; 
	[24] = 102904; 
	[25] = 102905; 
	[26] = 102915; 
	[27] = 107369 }	--�U�ӳ����I���Ǫ�����
	local MonsterTable = {}	--�����U�����I���Ǫ�
	local MonsterTime = { [21] = 0; [22] = 0; [23] = 0; [24] = 0; [25] = 0; [26] = 0; [27] = 300 }	--�����U���Ǫ����ͮɶ�
	local MonsterSpawnCD = { [21] = 30; [22] = 30; [23] = 30; [24] = 30; [25] = 30; [26] = 30; [27] = 300 }	--�o��]�w�U���Ǫ����ͮɶ�CD

	local PointTable = {}
	for p = 3 , 4 do									--�����誺��Ӿ��I������PointTable
		PointTable[p] = ReadRoleValue( HideUnit , EM_RoleValue_Register + p )
	end

	local TreasureChangeTimer = -1							--��0��ܸ��ഫ�_�c�F�A�ഫ�|��120��ɶ��A-1����ഫ�����٨S�Q�e��
	local TreasureTakeTeam = 0								--���@�������������y�����
	local TreasureGiveGold = 100								--������y�C�������h�ֶ���
	local BeginHideTreasure = ReadRoleValue( HideUnit , EM_RoleValue_Register + 6 )	--�b�@�}�l����ܪ������_�c
	Hide(BeginHideTreasure)								--���è����_�c
	SetLandMark( RoomID , 6 , 0 )								--�]��0��ܧ������_�cLandMark�q�p�a�ϤW����

	while true do
		if BG_time % 10 == 0 then DebugMsg( 0, RoomID, "BG_time="..BG_time ) end
		--�Գ��}�l�e	======================================================================
		if BG_State == "Prepare" then		
			local BG_PrepareString = {[90]="[BG_AA_PREPARE01]";
						[60]="[BG_AA_PREPARE02]";
						[30]="[BG_AA_PREPARE03]";
						[0]="[BG_AA_PREPARE04]";}
			if  (BG_time == 90 or BG_time == 60 or BG_time == 30 or BG_time == 0) then
--			if  (BG_time == 9 or BG_time == 6 or BG_time == 3 or BG_time == 0) then
				ScriptMessage( HideUnit,  -1, 2, BG_PrepareString[BG_time] , C_SYSTEM )	--���ɱN�bXX���}�l
				ScriptMessage( HideUnit,  -1, 0, BG_PrepareString[BG_time] , C_SYSTEM )	--���ɱN�bXX���}�l
				if BG_time == 0 then
					for i=1,2 do
						local Gate = ReadRoleValue(HideUnit, EM_RoleValue_Register+i )
						DebugMsg( 0, RoomID, "Del Gate="..Gate )
						DelObj(Gate)
					end
					BG_State = "fighting"
					Z448_v[RoomID][31] = BG_State
				end
			end
		--�Գ��i�椤	======================================================================
		elseif BG_State == "fighting" then
			--===== �ˬd�Գ��O�_�ŦX��������
			local T1Score = GetScore( RoomID, 1 )
			local T2Score = GetScore( RoomID, 2 )
			if T1Score >= 2000 or T2Score >= 2000 then
				BG_State = "end"
				Z448_v[RoomID][31] = BG_State
			end
			if T1Score >= 1700 and Score1700Check[1] == false then
				Score1700Check[1] = true	--�ΨӧP�_1700���ɪ��T�� �u�n��e�@��
				ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_6]", C_SYSTEM )	--���ڦV�ӧQ
			elseif T2Score >= 1700 and Score1700Check[2] == false then
				Score1700Check[2] = true	--�ΨӧP�_1700���ɪ��T�� �u�n��e�@��
				ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_7]", C_SYSTEM )	--���ڦV�ӧQ
			end
			--
			local Team1Count = GetNumEnterTeamMember(RoomID,1)
			local Team2Count = GetNumEnterTeamMember(RoomID,2)
			if Team1Count == 0 or Team2Count == 0 then
				BG_State = "leave"
				Z448_v[RoomID][31] = BG_State
			end
			--===== �T�w�ɶ�Ĳ�o�����ˬd
			if BG_time % NpcLvUpTime == 0 then	--���ɤ@��NPC���ͳ]�w����
				local NPCLV = ReadRoleValue( HideUnit , EM_RoleValue_Register + 7 )
				if NPCLV < MaxLv then WriteRoleValue( HideUnit , EM_RoleValue_Register+7, ( NPCLV + 1 ) ) end
				DebugMsg( 0 , RoomID , "Up NPC rebirth level to ".. NPCLV )
			end
			
			if BG_time % PlayerAddExpTime == 0 then	--���ɤ@�����a�g���
				local AllPlayer = SetSearchAllPlayer( RoomID )
				for i = 0 , AllPlayer do
					local TempPlayerID = GetSearchResult()
					local PlayerLV = ReadRoleValue( TempPlayerID , EM_RoleValue_LV )
					if PlayerLV < MaxLv then
						local BeforeEXP = ReadRoleValue( TempPlayerID , EM_RoleValue_EXP )
						WriteRoleValue( TempPlayerID , EM_RoleValue_EXP , BeforeEXP + PlayerAddExp )
					end
				end
			end
			--===== �m�X�����ˬd
			local Flag = Z448_v[RoomID][3]
			if FlagNowTimer == 0 then					--�N�o�ɶ���0�A��ܸӲ��ͺX�l�󤤥�
				ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_3]", C_SYSTEM )	--�ԺX�w�g�X�{�b�Գ�����
				DebugMsg( 0, RoomID, "Creat Flag" )
				BG_AA_FlagCreat(HideUnit)
				FlagNowTimer = -1
			elseif FlagNowTimer > 0 then					--�X�l�٦b�˼�
				FlagNowTimer = FlagNowTimer - 1
			elseif FlagNowTimer == -1 and CheckID(Flag) == false then	--�ˬd�X�l�O���O�Q�ܨ��F
				FlagNowTimer = FlagReplaceTimer
			end

			--===== �ɵ��I(�_�c)
			local MapPosNum = Z448_v[RoomID][2]
			local Treasure = ReadRoleValue(HideUnit, EM_RoleValue_Register+MapPosNum)
			if TreasureChangeTimer == 0 then							--��ܸɵ��I�ഫCD�����A�ӥX�{�F
				SetLandMark( RoomID, MapPosNum, 57 ) 					--57�G���߹ϮסB58�G���l���S(����)�ϮסB59�G��߫���(�Ŷ�)�Ϯ�
				Show( Treasure, RoomID )							--�����a�i�HĲ�I���I
				TreasureChangeTimer = -1
				TreasureTakeTeam = 0
				if MapPosNum == 6 then
		 			ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_1]", C_SYSTEM )	--�䴩����w�Q�e�ܬP�f�ﯸ
				else
					ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_2]", C_SYSTEM )	--�䴩����w�Q�e�ܻȤ�ﯸ
				end
				--DebugMsg( 0, RoomID, "Show Treasure "..MapPosNum )
			elseif TreasureChangeTimer > 0 then							--��ܸɵ��I�٦b�ഫCD��
				TreasureChangeTimer = TreasureChangeTimer - 1
				--DebugMsg( 0, RoomID, "TreasureChangeTimer="..TreasureChangeTimer )
			elseif TreasureChangeTimer == -1 and ReadRoleValue( Treasure, EM_RoleValue_Register+2 ) == 1 then	--�w�g������ɵ��I�Q���ڡA�Ӷi�JCD�F
				--DebugMsg( 0, RoomID, "take Treasure "..MapPosNum )
				WriteRoleValue(Treasure, EM_RoleValue_Register+2, 0)				--��Treasure��Register+2�g���٨S�Q�ܨ��L
				TreasureChangeTimer = 60							--�]�wTreasure�N�o�ɶ�
				TreasureTakeTeam =  ReadRoleValue(Treasure, EM_RoleValue_Register+3)	--�����ܱoTreasure������
				local TreasureTeamMember = GetTeamMemberList(RoomID, TreasureTakeTeam )
				for j= 1, table.getn(TreasureTeamMember) do					--�������I���ݰ}�窺�Ҧ����a��
						AddRoleValue( TreasureTeamMember[j], EM_RoleValue_Money, TreasureGiveGold )
				end
				if MapPosNum == 5 then							--�M�w�U���n�����ӥX�{
					Z448_v[RoomID][2] = 6
				else
					Z448_v[RoomID][2] = 5
				end
			end
			--===== ���ǭ���
			for c = 21, 27 do
				 if  MonsterTime[c] > 0 then							--���ͮɶ�>0 ����٦b���ͭ˼�
					MonsterTime[c] = MonsterTime[c] - 1
				elseif MonsterTime[c] == 0 then						--���ͮɶ�=0 �N�Ǫ�����
					DebugMsg( 0, RoomID, "--- Point"..c.." monster revive")
					local LV = ReadRoleValue(HideUnit, EM_RoleValue_Register+7)
					local Monster = CreateObjByFlag( MonsterType[c] , 781187 ,  c, 1 )
					WriteRoleValue( Monster, EM_RoleValue_LV, LV )			-- �]�w�Ǫ�����
					AddToPartition( Monster , RoomID)
					if c == 27 then
						SetPlot( Monster , "dead" , "BG_AA_MapBoss_Kill" , 0 )
						ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_0]", C_SYSTEM )	--[107369]�w�X�{�b[ZONE_GORGE_OF_GHOST]
					else
						SetPlot( Monster , "dead" , "BG_AA_Monster_Kill" , 0 )
					end	
					MonsterTable[c] = Monster
					MonsterTime[c] = -1
				elseif MonsterTime[c] == -1 then						--���ͮɶ�=-1 ��ܩǪ��٦b�A�ˬd�Ǫ��O�_���`
					if ReadRoleValue( MonsterTable[c], EM_RoleValue_IsDead ) == 1 then 	-- 1�O���`
						DebugMsg( 0, RoomID, "--- Point"..c.." monster has die")
						MonsterTime[c] = MonsterSpawnCD[c]				-- �T�w���`���ܱҰʭ��ͭ˼�
					end	
				end
			end
	
		--�Գ�����	======================================================================
		elseif BG_State == "end" or BG_State == "leave" then
			local T1Score = GetScore( RoomID, 1 )
			local T2Score = GetScore( RoomID, 2 )

			if BG_State == "end" then						--�P�_�O���`����
				DebugMsg( 0, RoomID, "BG go End, Count Score, Who Win?" )
				local WinTeam 
				local LoseTeam 
				if T1Score >= 2000 and T2Score < 2000 then		--T1Ĺ
					DebugMsg( 0, RoomID, "T1 Win !!" )
					ScriptMessage( HideUnit,  -1, 3, "[SC_THEWINNER][$SETVAR1=".."[BG_450_TEAM1_NAME]".."]" , C_SYSTEM )
					WinTeam = GetTeamMemberList(RoomID, 1 )
					LoseTeam = GetTeamMemberList(RoomID, 2 )
					EndBattleGround( RoomID, 1 )
					DesignLog( HideUnit , 121169 , "T1 Win" )
				elseif T2Score >= 2000 and T1Score < 2000 then		--T2Ĺ
					DebugMsg( 0, RoomID, "T2 Win !!" )
					ScriptMessage( HideUnit,  -1, 3, "[SC_THEWINNER][$SETVAR1=".."[BG_450_TEAM2_NAME]".."]" , C_SYSTEM )
					WinTeam = GetTeamMemberList(RoomID, 2 )
					LoseTeam = GetTeamMemberList(RoomID, 1 )
					EndBattleGround( RoomID, 2 )
					DesignLog( HideUnit , 121169 , "T2 Win" )
				elseif T1Score >= 2000 and T2Score >= 2000 then		--����
					DebugMsg( 0, RoomID, "2 team draw !!" )
					ScriptMessage( HideUnit,  -1, 3, "[BG_AA_RESULT_DRAW]" , C_SYSTEM )
					WinTeam = GetTeamMemberList(RoomID, -1 )
					EndBattleGround( RoomID, -1 )
					DesignLog( HideUnit , 121169 , "T1T2 DRAW" )
				end
				DesignLog( HideUnit , 121433 , "Game Time="..BG_time )
				for i = 1, table.getn(WinTeam) do							--�������ӧQ������y�b�Գ��M�Φ��s�ȡA�b�X�Գ�����~�|����
					if LoseTeam ~= nil then									--����N�S��loseTeam
						WriteRoleValue(WinTeam[i], EM_RoleValue_BG_Return_Value+0, 50)

					elseif LoseTeam == nil then
						WriteRoleValue(WinTeam[i], EM_RoleValue_BG_Return_Value+0, 35)						
					end
				end
				if LoseTeam ~= nil then									--����N�S��loseTeam
					for i = 1, table.getn(LoseTeam) do							--�������ԱѶ�����y�b�Գ��M�Φ��s�ȡA�b�X�Գ�����~�|����
						WriteRoleValue(LoseTeam[i], EM_RoleValue_BG_Return_Value+0, 20)	
					end
				end
			else
				ScriptMessage( HideUnit,  -1, 3, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--��趤�����}�A���ɵ���
			end
			--
			Sleep(50)
			ScriptMessage( HideUnit,  -1, 3, "[BG_AA_END]" , C_SYSTEM )	--���ɤw�����A�N�b�����������
			Sleep(1200)
			CloseBattleGround(RoomID)
			return
		end
		--
		Sleep(10)
		if BG_State == "Prepare" then
			BG_time = BG_time - 1
		elseif BG_State == "fighting" or BG_State == "end" or BG_State == "leave" then
			BG_time = BG_time + 1
		end
		Z448_v[RoomID][30] = BG_time
	end
end

--==================================
--		�Գ����٬���
--==================================
function BG_AA_CreateSoldiers( Camp , Route , HideUnit )	--�Գ����٫���Ыؤp�L�A�a�J�G�}��B���u�B������objID
	--Camp�G5 = ��߫���(�Ŷ�)�B6 = ���l���S(����)
	--Route�G1 = �k���B2 = �����B3 = ����
	local Barrier = OwnerID()	--�Գ�����
	local RoomID = ReadRoleValue( Barrier , EM_RoleValue_RoomID )
	local SoldierFlag = {}
	SoldierFlag[ 1 ] = { 781467 , 781466 , 781465 }	--���l���S(����)�p�L���u�X��
	SoldierFlag[ 2 ] = { 781470 , 781469 , 781468 }	--��߫���(�Ŷ�)�p�L���u�X��
	local SoldierType = {}
	SoldierType[ 1 ] = { 104980 , 104981 , 104980 , 104981 , 104980 }	--���l���S(����)�C���X�LNPC�s��
	SoldierType[ 2 ] = { 105025 , 105026 , 105025 , 105026 , 105025 }	--��߫���(�Ŷ�)�C���X�LNPC�s��
	local SoldierTime = 0	--���������p�L��e�����ͮɶ�
	local SoldierSpawnCD = 30	--�]�w�ͧLCD
	local SoldierTable = {}	--�����p�L��objID
	
	--�ե��}��s��
	if Camp == 6 then	Camp = 1	--���l���S(����)
	else						Camp = 2	--��߫���(�Ŷ�)
	end

	while true do
		--�p�L�X�L�P�_
		if Z448_v[ RoomID ][ 31 ] == "fighting" then	--�ˬd�����ܼơA�O�_���}�Ԫ��A
			if  SoldierTime > 0 then							--�����p�L�����ͮɶ� > 0 ����٦b���ͭ˼�
				SoldierTime = SoldierTime - 1
				
			elseif SoldierTime == 0 then						--�����p�L���ͧLCD = 0 �N�p�L����
				--DebugMsg( 0 , RoomID , "--- Camp".. Camp .." Route " .. Route .. " soldier revive" )
				
				for i = 1 , 5 do	--�C���X5���p�L
					local Soldier = CreateObjByFlag( SoldierType[ Camp ][ i ] , SoldierFlag[ Camp ][ Route ] , 0 , 1 )
					SetModeEx( Soldier , EM_SetModeType_Strikback , true )			--����
					SetModeEx( Soldier , EM_SetModeType_Obstruct , false )			--����
					SetModeEx( Soldier , EM_SetModeType_Mark , true )			--�аO
					SetModeEx( Soldier , EM_SetModeType_Move , true )			--����
					SetModeEx( Soldier , EM_SetModeType_Searchenemy , true )		--����
					SetModeEx( Soldier , EM_SetModeType_HideName , true )			--�W��
					SetModeEx( Soldier , EM_SetModeType_ShowRoleHead , true )		--�Y����
					SetModeEx( Soldier , EM_SetModeType_Fight , true )			--�i�������
					local LV = ReadRoleValue( HideUnit , EM_RoleValue_Register + 7 )	--�q�������W�����e���Ǫ����͵���
					WriteRoleValue( Soldier , EM_RoleValue_LV, LV )			-- �]�w�p�L����
					if Camp == 1 then	SetRoleCampID( Soldier , 8 )	--�]�w�p�L�}��GT1 - ���l���S(����)
					else						SetRoleCampID( Soldier , 9 )	--�]�w�p�L�}��GT2 - ��߫���(�Ŷ�)
					end
					AddToPartition( Soldier , RoomID )
					AddBuff( Soldier , 503993 , 0 , 1 )	--�ͧL�S��
					WriteRoleValue( Soldier , EM_RoleValue_IsWalk , 0  ) -- �N�p�L���ʤ覡�]�w���]�B
					SetPlot( Soldier , "dead" , "BG_AA_Soldier_Kill" , 0 )	--�]�w�p�L���`�@��
					CallPlot( Soldier , "BG_AA_Soldier_Move" , SoldierFlag[ Camp ][ Route ] )	--�]�w�p�L���۸��u���X�в���
					SoldierTable[ i ] = Soldier	--�g�J�p�L��objID
					Sleep(10)
				end
				SoldierTime = SoldierSpawnCD	--�����p�L�i�J�ͧL�˼�
			end
		end
		Sleep(10)
	end
end

function BG_AA_Soldier_Move( SoldierFlag )	--�}��p�L���۸��u���X�в���
	local Soldier = OwnerID()
	local FlagCount = GetMoveFlagCount( SoldierFlag ) - 1
	while true do
		if ReadRoleValue( Soldier , EM_RoleValue_AttackTargetID ) == 0 then	--�D�԰��~�~�����
			for i = 0 , FlagCount do
				Lua_WaitMovetoFlag( Soldier , SoldierFlag , i , 0 )
			end
		end
		sleep( 5 ) 
	end
end

function BG_AA_TouchBarrier()	-- ���aĲ�I�Գ����ټ@��

	local Player = OwnerID()
	local Barrier = TargetID()
	local Dis = 120
	AdjustFaceDir( Player , Barrier , 0 ) --���V
	CallPlot( Player , "BG_AA_ThroughBarrier" , Player , Barrier , Dis )
end

function BG_AA_ThroughBarrier( Player , Barrier , Dis )	-- Ĳ�I�Գ����٫�ǰe�@���A���a�B���B�Z��
	local PlayerCamp = GetRoleCampID( Player )	-- Ū�����a�}��
	local BarrierCamp = GetRoleCampID( Barrier )	-- Ū���Գ����ٰ}��

	if ( PlayerCamp == BarrierCamp ) or ReadRoleValue( Player , EM_RoleValue_VOC ) == 0 then	-- ���a�}��P�j���}��ŦX�Ϊ��a¾�~�� gm ��
		local Pos = {}
		Pos[ "X" ] , Pos[ "Y" ] , Pos[ "Z" ] , Pos[ "Dir" ] = Lua_Hao_Return_Coordinate( Barrier ) -- ���o�����Ҧb�y��
		Pos[ "PlayerDir" ] = ReadRoleValue( Player , EM_RoleValue_Dir )	--���a
		local Cal = ( math.pi / 180 ) * ( Pos[ "Dir" ] )	-- ����
		local Ca = Pos[ "PlayerDir" ] - Pos[ "Dir" ]	-- ���a�P�j���ۮt����
		if Ca < 0 then	Ca = Ca + 360
		end
		if Ca < 90 or Ca > 270 then
			SetPos( Player , Pos[ "X" ] + Dis * math.cos( Cal ) , Pos[ "Y" ] + 5 , Pos[ "Z" ] - Dis * math.sin( Cal ) , Pos[ "Dir" ] )
		else
			SetPos( Player , Pos[ "X" ] - Dis * math.cos( Cal ) , Pos[ "Y" ] + 5 , Pos[ "Z" ] + Dis * math.sin( Cal ) , Pos[ "Dir" ] + 180 )
		end
		AddBuff( Player , 503993 , 0 , 1 )	--�ǰe�S��
	end
end

--==================================
--		���a�����]�w�]�_�l�B�������B���͡^
--==================================
function BG_AA_PlayerSet(RoomID, Player)	--���a�_�l�]�w
	local BG_time = Z448_v[RoomID][30]
	local BG_State = Z448_v[RoomID][31]
	
	AddRoleValue( Player, EM_RoleValue_Money, 300 )				--�����_�l����
	if BG_time >= 60 and BG_State == "fighting" then
		AddRoleValue( Player, EM_RoleValue_Money, (BG_time/60)*160 )	--�߶i�Գ������a���v�������A�C���ɶ��C����*160
		WriteRoleValue( Player, EM_RoleValue_LV, BG_time/60)		--�]�w����
	end

	Z448_v[RoomID][Player] = 0					--�إ߱M�ݸӪ��a���ޯ�W���P�_�Ϊ������ܼ�
	WriteRoleValue( Player, EM_RoleValue_VOC, 11 )		--�D¾�g�����Ѥh(11)
	WriteRoleValue( Player, EM_RoleValue_VOC_SUB, -1 )	--��¾�S��(-1)

	--�����Ҧ�Buff	
	local CountBuff = BuffCount( Player )
	for i = 0, CountBuff do
		TempBuff = BuffInfo( Player , i , EM_BuffInfoType_BuffID )
		CancelBuff_NoEvent( Player, TempBuff )
	end

	--�]�w�˳�
	local EqTable
	local RuneTable = { 521742, 521738, 521744, 521742, 521742, 521739, 521736, 521736, 521737, 0, 0, 521745, 521745, 521741, 521741, 521737}
	if GetTeamID( Player ) == 1 then
		EqTable = { 230828, 230823, 230826, 230822, 230827, 230834, 230825, 230824, 230833, 0, 0, 230829, 230830, 230831, 230832, 213836 }
	elseif GetTeamID( Player ) == 2 then
		EqTable = { 230815, 230810, 230813, 230809, 230814, 230821, 230812, 230811, 230820, 0, 0, 230816, 230817, 230818, 230819, 213837 }
	end
	for i = 1, 16 do
		if i ~= 10 or i ~= 11 then
			SetRoleEq_Player( Player , (i-1) , EqTable[i] )
			SetItemInfo( Player, EM_ItemPacketType_EQ, (i-1), EM_ItemValueType_RuneVolume, 1 )
		end
	end
--		-- Pos ���~��m
--	0	--�Y��		230828	230815	521742
--	1	--��M		230823	230810	521738
--	2	--�c�l		230826	230813	521744
--	3	--�W��		230822	230809	521742
--	4	--�U��		230827	230814	521742
--	5	--�ܭ�		230834	230821	521739
--	6	--�y�a		230825	230812	521736
--	7	--�ӥ�		230824	230811	521736
--	8	--����		230833	230820	521737
--	9	--�u��
--	10	--���{�Z��
--	11	--�٫� 1	230829	230816	521745
--	12	--�٫� 2	230830	230817	521745
--	13	--���� 1	230831	230818	521741
--	14	--���� 2	230832	230819	521741
end

function BG_AA_Revive()	--���a���ͼ@��

	local Player = OwnerID()
	local TeamID = GetTeamID(Player)
	local X = 0
	local Y = 0
	local Z = 0
	local Dir = 0

	if TeamID == 1 then	--�]�wTeam1�_����m
		X = -1688.5
		Y = 86
		Z = -1682.2
		Dir = 315
	else			--�]�wTeam2�_����m
		X = 1686.5
		Y = 76.7
		Z = 1687.8
		Dir = 135
	end

	WriteRoleValue( Player , EM_RoleValue_X , X )
	WriteRoleValue( Player , EM_RoleValue_Y , Y )
	WriteRoleValue( Player , EM_RoleValue_Z , Z )
	WriteRoleValue( Player , EM_RoleValue_Dir , Dir )
	Lua_PVPAllFull( OwnerID() )	--�ɺ����A
end

function BG_AA_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )	--�����Ĺ缾�a
	local RoomID = ReadRoleValue(KillerID, EM_RoleValue_RoomID)
	local KillerTeamID = GetTeamID(KillerID)
	local DeadLV = ReadRoleValue(DeadID, EM_RoleValue_LV)	--���o�Q�������a������
	
	if KillerID ~= DeadID then
		AddRoleValue( KillerID, EM_RoleValue_Money, DeadLV )	--�����������a���Ū����

		local Score = GetScore( RoomID , KillerTeamID )
		SetScore( RoomID , KillerTeamID , Score + 3 )
	end
end

--==================================
--			�ɵ��I����
--==================================
--Treasure	Register+1 	�Ψӷ�@���צh�H�P�ɶ}�c���}��
--		Register+2	�ΨӰO���_�c�O���O�w�g�Q�ܨ��F
--		Register+3	�ΨӰO���ܨ��_�c���O���@��
function BG_AA_TakeTreasure()				--�ɵ��I���ͼ@��
	local Player = OwnerID()
	local Treasure = TargetID()
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )

	--Ĳ�I�ƥ�
	if ReadRoleValue( Treasure, EM_RoleValue_Register+1 ) == 0 then
		WriteRoleValue(Treasure, EM_RoleValue_Register+1, 1)
		BeginCastBarEvent( Player, Treasure, "[BG_AA_TAKETREASURE]", 80, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "BG_AA_TreasureCheck" )
	elseif ReadRoleValue( Treasure, EM_RoleValue_Register+1 ) == 1 then
		ScriptMessage( Player, Player, 3, "[BG_AA_TAKETREASURE_ERROR]", 0 )
		return
	end
end

function BG_AA_TreasureCheck(Obj,CheckResult)	--CastBar
	local Player = OwnerID()
	local Treasure = TargetID()

	if CheckResult > 0 then					--�j��0�O���\
		local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )
		local TeamID = GetTeamID(Player)
		local PID = ReadRoleValue(Treasure, EM_RoleValue_PID)

		SetLandMark( RoomID, PID, 0 )			--57�G���߹ϮסB58�G���l���S(����)�ϮסB59�G��߫���(�Ŷ�)�ϮסB0�G����
		WriteRoleValue(Treasure, EM_RoleValue_Register+2, 1)
		WriteRoleValue(Treasure, EM_RoleValue_Register+3, TeamID)
		Hide( Treasure )
		if TeamID == 1 then
 			ScriptMessage( Treasure, -1, 3, "[BG_AA_T1_GOTBOX]", C_SYSTEM ) --[ZONE_SILVERWING_CITADEL]�ܨ��F[121435]�I������o100�����I
			DesignLog( Player , 121435 , "T1 Take Treasure" )
		else
			ScriptMessage( Treasure, -1, 3, "[BG_AA_T2_GOTBOX]", C_SYSTEM ) --[ZONE_LIONHEART_RAMPART]�ܨ��F[121435]�I������o100�����I
			DesignLog( Player , 121435 , "T2 Take Treasure" )
		end
	end
	WriteRoleValue(Treasure, EM_RoleValue_Register+1, 0)
	EndCastBar( Player, CheckResult )
end
--==================================
--			���k���_����
--==================================
function BG_AA_Flag_touch()	--Ĳ�I�@��
	local Player = OwnerID()
	local Flag = TargetID()
	local TeamID = GetTeamID(Player)
	local FlagCheck = ReadRoleValue( Flag, EM_RoleValue_Register1 )

	if FlagCheck == 1 then	--�ԺX�Q�����ҥH�S����
		return
	end

	BeginCastBarEvent( Player, Flag, "[BG_AA_TAKETREASURE]", 80, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "BG_AA_FlagCheck" )
end

function BG_AA_FlagCheck(Obj,CheckResult)
	local Player = OwnerID()
	local Flag = TargetID()
	local TeamID = GetTeamID(Player)

	if CheckResult > 0 then
		if TeamID == 1 then
	 		ScriptMessage( Flag, -1, 3, "[BG_AA_T1_TAKEFLAG]", C_SYSTEM )	--�ܨ��F�ԺX�I
			AddBuff( Player, 507919, 0, -1 )			--�������a�ܺX��Buff - ���l���S(����)
		else
			 ScriptMessage( Flag, -1, 3, "[BG_AA_T2_TAKEFLAG]", C_SYSTEM )	--�ܨ��F�ԺX�I
			 AddBuff( Player, 500138, 0, -1 )			--�������a�ܺX��Buff - ��߫���(�Ŷ�)
		end
		Hide( Flag )						--���þԺX����
		WriteRoleValue( Flag, EM_RoleValue_Register1, 1 )	--�����ԺX�����I
		WriteRoleValue( Flag, EM_RoleValue_Register2, Player )	--����X�̰O���b EM_RoleValue_Register2
		BeginPlot( Flag, "BG_AA_Flager_time_check", 0 )	--�}�ҩw���ˬd�A�ˬd���X�̬O�_���u�ή���
	end
	EndCastBar( Player, CheckResult )
end

function BG_AA_Flager_Die()			--���X�̦��`�ABuff����
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID)
	local Flag = Z448_v[RoomID][3] 
	Show(Flag, RoomID)
	WriteRoleValue( Flag, EM_RoleValue_Register1, 0 )	--���}�ԺX���I
end

function  BG_AA_Flager_time_check()	--�ˬd���a�O�_���u�άO����
	local Flag = OwnerID()
	local Player = ReadRoleValue( Flag, EM_RoleValue_Register2 )
	
	while true do
		if CheckID( Player ) == false then
			local RoomID = ReadRoleValue(Flag, EM_RoleValue_RoomID)
			Show(Flag, RoomID)
			WriteRoleValue( Flag, EM_RoleValue_Register1, 0 )	--���}�ԺX���I
			return
		end
		Sleep( 10 )
	end
end

function BG_AA_FlagCreat(HideUnit)
	local RoomID = ReadRoleValue( HideUnit, EM_RoleValue_RoomID )
	DebugMsg( 0, RoomID, "Creat Flag function" )
	local Flag = CreateObjByFlag( 121434 , 781187 , 0 , 1 ) 
	SetModeEx( Flag, EM_SetModeType_Strikback, false )			--����
	SetModeEx( Flag, EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
	SetModeEx( Flag, EM_SetModeType_Obstruct, false )			--����
	SetModeEx( Flag, EM_SetModeType_Mark, true )			--�аO
	SetModeEx( Flag, EM_SetModeType_Move, false )			--����
	SetModeEx( Flag, EM_SetModeType_Searchenemy, false )		--����
	SetModeEx( Flag, EM_SetModeType_HideName, true )			--�W��
	SetModeEx( Flag, EM_SetModeType_ShowRoleHead, false )		--�Y����
	SetModeEx( Flag, EM_SetModeType_Fight , false )			--�i�������
	SetModeEx( Flag, EM_SetModeType_Drag , true )			--���O
	--
	SetPlot( Flag , "touch" , "BG_AA_Flag_touch" , 50 )	--�]�wĲ�I�@��
	SetRoleCampID( Flag, 2 )			--�w�]���Ǫ��}��
	AddToPartition(Flag , RoomID)
	Z448_v[RoomID][3] = Flag
end
--==================================
--			�ޯ����
--==================================
function BG_AA_UseCheck(KeyItem)	--�b�ϥΫe�T�{
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID)
	DebugMsg( 0, RoomID, "Learn Skill num="..Z448_v[RoomID][Player] )
	if Z448_v[RoomID][Player] >= 6 then	--�P�_���a�O�_�֦��W�L6�ӧޯ�
		ScriptMessage( Player, Player, 1, "[BG_AA_REMOVESKILL_WARNING]", 0 )
		return false
	elseif CheckFlag( Player, KeyItem ) == true then	--�P�_���a�O�_�֦��W�L6�ӧޯ�
		ScriptMessage( Player, Player, 1, "[BG_AA_REMOVESKILL_ALREADYHAVE]", 0 )
		return false
	else
		Z448_v[RoomID][Player] = Z448_v[RoomID][Player] + 1
		return true
	end
end

function BG_AA_SkillScroll(ItemNum)	--�ϥΧޯ���b�@��
	local Player = OwnerID()
	--�U���o��O�����νs�����s�����S�ʡA�����p�⪫�~�s���îM�Ψ쭫�n���~
	local CheckNum = ItemNum - 241849
	if CheckNum <= 30 then
		SetFlag(Player, (547049+CheckNum), 1)
	elseif CheckNum >= 31 then
		SetFlag(Player, (547066+CheckNum), 1)		
	end
	--�S��B�z
	if ItemNum == 241885 then
		AddBuff( Player, 623599, 0, -1 )
	elseif ItemNum == 241886 then
		AddBuff( Player, 623601, 0, -1 )
	end
	--
	CastSpell(Player, Player, 491010 )	--�S�ĥ�
	DesignLog( Player , 121440 , "ItemNum="..ItemNum )
end

function BG_AA_RemoveSkill_Dialog()			--��NPC��ܲ����ޯ�
	local Player = OwnerID()
	local NPC = TargetID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID)
	local SkillNum = 0

	SetSpeakDetail(Player,"[BG_AA_REMOVESKILL_NPC]")
	for i= 1, 60 do
		local KeyItem
		if i <= 30 then KeyItem = 547049+i else KeyItem = 547066+i end
		if CheckFlag( Player, KeyItem ) == true then
			local Spell = 499676+i
			AddSpeakOption(Player, NPC, "["..Spell.."]","BG_AA_RemoveSkill_Run("..KeyItem..")", 0)
			SkillNum = SkillNum + 1
			if SkillNum == Z448_v[RoomID][Player] then
				break
			end
		end
	end	
end

function BG_AA_RemoveSkill_Run(KeyItem)	--keyitem 547050~547079, 547097~547126
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID)
	local Spell = 0

	if  KeyItem <= 547079 then
		Spell = 499676 + (KeyItem - 547049)
	else
		Spell = 499706 + (KeyItem - 547096 )
	end
	SetFlag( Player, KeyItem, 0 )
	Z448_v[RoomID][Player] = Z448_v[RoomID][Player] - 1

	local SkillString = "["..Spell.."]"
	ScriptMessage( Player, Player, 3, "[BG_AA_REMOVESKILL_MESSAGE][$SETVAR1="..SkillString.."]", 0 )
	
	AddBuff( Player, 623735, 0, 2 )	--�S�ĥ�
	CloseSpeak( Player )
	DesignLog( Player , 121439 , "KeyItem="..KeyItem )
end

--==================================
--			����NPC�P�}�a�ؿv����
--==================================
function BG_AA_Monster_Kill()	--��������
	local Gold = ReadRoleValue( OwnerID() , EM_RoleValue_LV)	-- Ū���Ǫ�����
	AddRoleValue( TargetID() , EM_RoleValue_Money, Gold )	-- ���������Ǫ����Ū����
end

function BG_AA_MapBoss_Kill()	--�����T�D���F
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local PlayerTeamID = GetTeamID( TargetID() )
	local PlayerTeamMember = GetTeamMemberList( RoomID , PlayerTeamID )
	
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID , PlayerTeamID , ( Score + 150 ) )	-- ����150�I�n��
	
	for i = 1 , #PlayerTeamMember do
		AddRoleValue( PlayerTeamMember[ i ] , EM_RoleValue_Money , 150 )	--�������ݰ}�窺�Ҧ����a150�I���
	end

	if PlayerTeamID == 1 then	ScriptMessage( OwnerID() , -1 , 3 , "[BG_AA_T1_KILLBOSS]" , C_SYSTEM )	--���l���S�����F�T�D���F�I������o150�����I
	else									ScriptMessage( OwnerID() , -1 , 3 , "[BG_AA_T2_KILLBOSS]" , C_SYSTEM )	--��߫��������F�T�D���F�I������o150�����I
	end
	
end

function BG_AA_Soldier_Kill()	--�����}��p�L
	local Gold = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- Ū���}��p�L����
	AddRoleValue( TargetID() , EM_RoleValue_Money , Gold )	-- ���������p�L���Ū����
end

function BG_AA_BarrierDeath()	--�����Գ�����
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local PlayerTeamID = GetTeamID( TargetID() )
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID , PlayerTeamID, (Score + 200 ) )	-- ����200�I�n��

	local Bonfire = CreateObjByObj( 114740 , OwnerID() , 1 )	-- �b�����W�إ����ä��磌��A���񫰪��Q�R����A����U�N���ʧ@
	SetModeEx( Bonfire , EM_SetModeType_Fight , false )	-- ���i���
	SetModeEx( Bonfire , EM_SetModeType_HideName , true )	--���æW��
	SetModeEx( Bonfire , EM_SetModeType_Mark , false )	--�аO
	CallPlot( Bonfire , "BG_AA_DelObj" , Bonfire , 35 )	--  ������b�]�w��ƫ�R���ۤv�C
end

function BG_AA_TowersDeath()	--�������ýb��
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local PlayerTeamID = GetTeamID( TargetID() )
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID , PlayerTeamID, (Score + 100 ) )	-- ����100�I�n��
end

function BG_AA_Guard_Kill()	--�����u��
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID)
	local PlayerTeamID = GetTeamID( TargetID() )
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID , PlayerTeamID , ( Score + 150 ) )	-- ����150�I�n��
end

function BG_AA_Flag_Dead()	--�������I
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID)
	local PlayerTeamID = GetTeamID( TargetID() )
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID, PlayerTeamID , ( Score + 2000) )	-- ����2000�I�n��
	--
	local Bonfire = CreateObjByObj( 114740 , OwnerID() , 1 )	-- �b���I�إ����ä��磌��A����Q�R�������U�N���ʧ@
	SetModeEx( Bonfire , EM_SetModeType_Fight , false )	-- ���i���
	SetModeEx( Bonfire , EM_SetModeType_HideName , true )	--���æW��
	SetModeEx( Bonfire , EM_SetModeType_Mark , false )	--�аO
	CallPlot( Bonfire , "BG_AA_DelObj" , Bonfire , 35 )	--  ������b�]�w��ƫ�R���ۤv�C
	Sleep( 35 )
	DelObj( ReadRoleValue( FightingPoint , EM_RoleValue_Register + 1 ) )	--�����˹�����
end

function BG_AA_DelObj( Obj , Time )	--�R������U�N�@��
	Sleep( Time )
	DelObj( Obj )
end