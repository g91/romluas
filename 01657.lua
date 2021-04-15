-- �o�@�q�O ���ե�
function mika_test_LostTreasure_all()  
	local NPC = OwnerID()
	local Player = SearchRangePlayer(NPC, 1000)
	say(Player[0], "player")
	Callplot(NPC, "mika_LostTreasure_dog", Player[0] )
	Callplot(NPC, "mika_LostTreasure_Soldier", Player[0] )
	Callplot(NPC, "mika_LostTreasure_Arrow", Player[0] )
	Callplot(NPC, "mika_LostTreasure_Boss1", Player[0] )
end

-----------------  �U���O��˳��� ------------------

--�`�FDog 
function mika_LostTreasure_dog(Player) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local BeginFlagID = 780316
	local WalkFlagID = 780316
	local objid = 101701
	local BeginPos =  {0, 1, 2, 3}
	local WalkPos = {4, 5, 6, 7 }
	local objcount = 4
	local dog = {}

	local PlayerLV = ReadRoleValue(Player, EM_RoleValue_LV )  -- ���a�D¾����
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "1 PlayerLV = "..PlayerLV )
--	Say(Player, "1 MonsterLV = "..MonsterLV )

	for i = 1, objcount do
		dog[i] = CreateObjByFlag(objid, BeginFlagID, BeginPos[i] ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
		WriteRoleValue( dog[i] , EM_RoleValue_LV , MonsterLV )	-- �]�w��ƪ����� Level
		SetModeEx( dog[i]    , EM_SetModeType_Strikback, true )--����
		SetModeEx( dog[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( dog[i]    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( dog[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( dog[i]    , EM_SetModeType_Move, true )--����
		SetModeEx( dog[i]    , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( dog[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( dog[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( dog[i] , EM_SetModeType_Fight , true )--�i�������
		WriteRoleValue( dog[i] , EM_RoleValue_IsWalk , 1) --�R�O�Ө��ⳣ�Ψ���(0�];1��)             
		MoveToFlagEnabled( dog[i] , false )   	       --�}�������޼@��
	--	AddBuff( dog[i] , 505290 ,1 , -1 )  --���ѯ}buff  icon  ���Ȯɤ��n+
		WriteRoleValue( dog[i] , EM_RoleValue_PID, 555)  
		AddToPartition( dog[i], RoomID )	--�����󲣥�  
		AddBuff(dog[i], 624276, 0 , -1 )  -- ��ת��a�ˮ`buff  �T�w����
		WriteRoleValue( dog[i], EM_RoleValue_Register+1, Player )  --- �N���a�g�J��R+1
		Callplot(dog[i], "mika_LostTreasure_WalkPath",BeginFlagID, WalkFlagID,  BeginPos[i] , WalkPos[i] )    -- ���ʨ禡
		Callplot(dog[i], "mika_test_dog_skill", 0 )  -- �`�F�����ޯ�
	end
end

-- �j�N���_ �@�β��ʨ禡
function mika_LostTreasure_WalkPath(BeginFlagID, WalkFlagID, BeginPos, WalkPos )
	local OID = OwnerID()  -- ��

--	say(OID, "BeginPos = "..BeginPos.."WalkPos = "..WalkPos )
	While true do
		local WT = 50+(10*Rand(2))   -- 50 + 0 ~ 20
		local WT2 = 40+(10*Rand(2))   -- 40 + 0 ~ 20
		LuaFunc_MoveToFlag( OID, WalkFlagID, WalkPos, 0)        --���ʨ���w���Ѥl 
		Sleep(WT)
		LuaFunc_MoveToFlag( OID, BeginFlagID, BeginPos, 0)       
		Sleep(WT2)
	end
end

function mika_test_dog_skill()
	local OID = OwnerID()  -- ��
	local player = ReadRoleValue(OID, EM_RoleValue_Register+1)
	while true do 
		local dis = GetDistance(OID, player )
		local dead = ReadRoleValue( OID , EM_RoleValue_IsDead )  -- 0 = ��, 1 = ��
	--	say(OID, "Dis, ="..dis..", dead = "..dead) 
		if dead == 0 then  -- ����
			if dis <= 50 then
				if CheckBuff(OID, 505291 ) == false then    -- npc���W�S����ĸ�buff
					if  CheckBuff(player, 505296 ) == true  then  -- ����buff
						CancelBuff( player , 505296 )  -- �Ѱ����� 
						AddBuff( OID , 505291 , 1 , 5 )  -- NPC�Y�W�Х� 2��
						Say(OID, "[SC_422804_5]")  --�L
					elseif CheckBuff(player, 505297 ) == true then   -- �˦�buff
						CancelBuff( player , 505297 ) --�Ѱ��˦�
						AddBuff( OID , 505291 , 1 , 5 )  -- NPC�Y�W�Х� 2��
						Say(OID, "[SC_422804_5]")  --�L
						Sleep(10)
						PlayMotion( player, ruFUSION_MIME_IDLE_STAND )
					end
				end
			end
		end
		sleep(10)
	end
end

------------- �ͤh�L -----------

--�`�F�h�L
function mika_LostTreasure_Soldier(Player)  --+
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local objid = 101699  --�`�F�h�L
	local BeginFlagID = 780313
	local WalkFlagID = 780511
	local BeginPos =  {1, 2, 3, 4, 6 , 7, 8 , 9}
	local WalkPos = {1, 2, 3, 4, 6 , 7, 8 , 9}
	local objcount = 8
	local obj = {}

	local PlayerLV = ReadRoleValue(Player, EM_RoleValue_LV )  -- ���a�D¾����
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "2 PlayerLV = "..PlayerLV )
--	Say(Player, "2 MonsterLV = "..MonsterLV )

	for i = 1, objcount do
		obj[i] = CreateObjByFlag(objid, BeginFlagID, BeginPos[i] ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
		WriteRoleValue( obj[i] , EM_RoleValue_LV , MonsterLV )	-- �]�w��ƪ����� Level
		SetModeEx( obj[i]    , EM_SetModeType_Strikback, true )--����
		SetModeEx( obj[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( obj[i]    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( obj[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( obj[i]    , EM_SetModeType_Move, true )--����
		SetModeEx( obj[i]    , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( obj[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( obj[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( obj[i] , EM_SetModeType_Fight , true )--�i�������
		WriteRoleValue( obj[i] , EM_RoleValue_IsWalk , 1) --�R�O�Ө��ⳣ�Ψ���(0�];1��)             
		WriteRoleValue( obj[i] , EM_RoleValue_PID, 555)  
		MoveToFlagEnabled( obj[i] , false )   	       --�}�������޼@��
		AddToPartition( obj[i], RoomID )	--�����󲣥�  
		AddBuff(obj[i], 624276, 0 , -1 )  -- ��ת��a�ˮ`buff  �T�w����
		WriteRoleValue( obj[i], EM_RoleValue_Register+1, Player )  --- �N���a�g�Jnpc R+1
		Callplot(obj[i], "mika_LostTreasure_WalkPath",BeginFlagID, WalkFlagID,  BeginPos[i] , WalkPos[i] )    -- ���ʨ禡
	end
end

------------- �ͤ}�L -----------

--�`�F�}�L
function mika_LostTreasure_Arrow(Player)  --
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local objid = 101700  --�`�F�}�L
	local BeginFlagID = 780314
	local WalkFlagID = 780314
	local BeginPos =  {0, 1, 2, 3}
	local WalkPos = {4, 5, 6 , 7}
	local objcount = 4
	local obj = {}

	local PlayerLV = ReadRoleValue(Player, EM_RoleValue_LV )  -- ���a�D¾����
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "3 PlayerLV = "..PlayerLV )
--	Say(Player, "3 MonsterLV = "..MonsterLV )

	for i = 1, objcount do
		obj[i] = CreateObjByFlag(objid, BeginFlagID, BeginPos[i] ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
		WriteRoleValue( obj[i] , EM_RoleValue_LV , MonsterLV )	-- �]�w��ƪ����� Level
		SetModeEx( obj[i]    , EM_SetModeType_Strikback, true )--����
		SetModeEx( obj[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( obj[i]    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( obj[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( obj[i]    , EM_SetModeType_Move, true )--����
		SetModeEx( obj[i]    , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( obj[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( obj[i] , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( obj[i] , EM_SetModeType_Fight , true )--�i�������
		WriteRoleValue( obj[i] , EM_RoleValue_IsWalk , 1) --�R�O�Ө��ⳣ�Ψ���(0�];1��)             
		MoveToFlagEnabled( obj[i] , false )   	       --�}�������޼@��
		WriteRoleValue( obj[i] , EM_RoleValue_PID, 555)  
		AddToPartition( obj[i], RoomID )	--�����󲣥�  
		AddBuff(obj[i], 624276, 0 , -1 )  -- ��ת��a�ˮ`buff  �T�w����
		WriteRoleValue( obj[i], EM_RoleValue_Register+1, Player )  --- �N���a�g�Jnpc R+1
		Callplot(obj[i], "mika_LostTreasure_WalkPath",BeginFlagID, WalkFlagID,  BeginPos[i] , WalkPos[i] )    -- ���ʨ禡
	end
end

------------- �ͤ� -----------
function mika_LostTreasure_Boss1(Player)
	local OID = OwnerID()  -- NPC
	local RANDOWN = rand(100)+1
	if RANDOWN >= 51 then  
		Callplot(OID, "mika_LostTreasure_Boss2", Player, 1 ) 
	else
		Callplot(OID, "mika_LostTreasure_Boss2", Player, 2) 
	end
end

function mika_LostTreasure_Boss2(Player, Pos)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local objid = 101702  --�`�F�}�L
	local BeginFlagID = 780317
	local WalkFlagID = 780317
	local BeginPos =  {0, 2}
	local WalkPos = {1, 3}

	local PlayerLV = ReadRoleValue(Player, EM_RoleValue_LV )  -- ���a�D¾����
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "4 PlayerLV = "..PlayerLV )
--	Say(Player, "4 MonsterLV = "..MonsterLV )
--	Say(Player, "4 BeginPos = "..BeginPos[pos]..", WalkPos = "..WalkPos[Pos] )

	local obj = CreateObjByFlag(objid, BeginFlagID, BeginPos[pos] ,1) --�ϥκX�l���� npc �X�l�s�� �ƶq 
	WriteRoleValue( obj , EM_RoleValue_LV , MonsterLV )	-- �]�w��ƪ����� Level
	SetModeEx( obj    , EM_SetModeType_Strikback, true )--����
	SetModeEx( obj    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( obj    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( obj    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( obj    , EM_SetModeType_Move, true )--����
	SetModeEx( obj    , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( obj    , EM_SetModeType_HideName, false )--�W��
	SetModeEx( obj , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( obj , EM_SetModeType_Fight , true )--�i�������
	WriteRoleValue( obj , EM_RoleValue_IsWalk , 1) --�R�O�Ө��ⳣ�Ψ���(0�];1��)             
	MoveToFlagEnabled( obj , false )   	       --�}�������޼@��
	WriteRoleValue( obj , EM_RoleValue_PID, 555)  
	AddToPartition( obj, RoomID )	--�����󲣥�  
	AddBuff(obj, 624276, 0 , -1 )  -- ��ת��a�ˮ`buff  �T�w����
	WriteRoleValue( obj, EM_RoleValue_Register+1, Player )  --- �N���a�g�Jnpc R+1
	Callplot(obj, "mika_LostTreasure_WalkPath",BeginFlagID, WalkFlagID,  BeginPos[pos] , WalkPos[pos] )    -- ���ʨ禡

end