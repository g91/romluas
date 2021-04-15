--�`�y���� 5��R�ָ`  �����j�ɨ�
--�إ߮ɶ�: 2009/04/16
--�ק���: 2009/04/27
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--���b ����NPC  �]�k�}
------------------------------------------------------------------------------
function LuaN_musicfes_magic() --�����]�k�}�ͩ� 
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Array = {}
	local HowMuch = 10
	local MonsterID1
	local MonsterID2
	local MonsterID3
	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )

	if ZoneID == 2 then
		MonsterID1 = 101914	--�����Ŧ⩥��
		MonsterID2 = 101915	--�����Ŧ⩥���h�L
		MonsterID3 = 101916	--�����Ŧ⩥���N�x
	elseif ZoneID == 6 then
		MonsterID1 = 101917	--���ͬ��⩥��
		MonsterID2 = 101918	--���ͬ��⩥���h�L
		MonsterID3 = 101919	--���ͬ��⩥���N�x
	end

	while 1 do
		--�ŧi�ͦs���ܼ�
		local Survivor1 = 0  --
		local Survivor2 = 0
		--�ˬd�ѴX����
		local T2Obj
		local T2Count = SetSearchRangeInfo( OwnerID() , 400 )
		for i = 1 , T2Count , 1 do
			local T2ID = GetSearchResult()
			T2Obj = Role:New( T2ID )
			if T2Obj:RoomID() == RoomID and T2Obj ~= OwnerID() then
				local FlagOrgID = T2Obj:OrgID()
				if (FlagOrgID == MonsterID1) then  --
					--DebugMsg( 0, RoomID ,"**Survivor1 Add")
					Survivor1 = Survivor1 + 1
				elseif (FlagOrgID == MonsterID2) then  --
					--DebugMsg( 0, RoomID ,"**Survivor2 Add")
					Survivor2 = Survivor2 + 1
				end
			end
		end
		--DebugMsg( 0, RoomID ,"!!Survivor1 = "..Survivor1.." !!Survivor2 = "..Survivor2)
		--�Ǫ��O���O�����F�H
		if Survivor1 == 0 then
			for i = 1 , HowMuch , 1 do
				local Monster = CreateObjByFlag( MonsterID1, 780304 , 0 , 1 ) --����
				AddToPartition( Monster ,  RoomID )
				MoveToFlagEnabled(Monster , false )
				CallPlot( Monster , "LuaN_musicfes_magic_bronmouse1" , i )
				Array[i] = Monster
			end
		end
		if Survivor2 == 0 then
			for i = 1 , HowMuch , 1 do
				local Monster = CreateObjByFlag( MonsterID2, 780304 , 0 , 1 ) --�����h�L
				AddToPartition( Monster ,  RoomID )
				MoveToFlagEnabled(Monster  , false )
    				CallPlot( Monster , "LuaN_musicfes_magic_bronmouse2" , i )
				Array[i] = Monster
			end
		end
		--�����M�����h�L�Q���U300���ɡA�X�{��x5
		if MusicFestival_Mouse_KillCount1 >= 300 or MusicFestival_Mouse_KillCount2 >= 300 then
		-- 2013. 07.02 �ק�boss�X�{�W�h ���Ω����h�L�Q��300����
			for i = 1 , 5 , 1 do
				local Monster = CreateObjByFlag( MonsterID3, 780304 , 0 , 1 ) --�����N�x
				AddToPartition(Monster ,  RoomID ) --�s�ѹ�����Y�X��
				MoveToFlagEnabled(Monster  , false )
				Yell( Monster , "[SC_MOUSEBRON6]", 3 ) --/*�A�̳o�ǤH�������o�˹�ݧڪ��l���A�A�̷|�ᮬ���I�I
    				CallPlot( Monster , "LuaN_musicfes_magic_bronmouse3" , i )
				Array[i] = Monster
			end
			break
		end
		Sleep(10)
	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_mouse1dead()
	MusicFestival_Mouse_KillCount1 = MusicFestival_Mouse_KillCount1 + 1 --�Ĥ@�ئѹ������ƶq
	return true
end
------------------------------------------------------------------------------
function LuaN_musicfes_mouse2dead()
	MusicFestival_Mouse_KillCount2 = MusicFestival_Mouse_KillCount2 + 1 --�ĤG�ئѹ������ƶq
	return true
end
------------------------------------------------------------------------------
function LuaN_musicfes_magic_bronmouse1(i)
	SetPlot( OwnerID(),"Dead","LuaN_musicfes_mouse1dead",0 )
	if LuaFunc_MoveToFlagandWait(OwnerID() , 780332, i-1, 0) == true then     --�s�ѹ�����Y�X��
		SetRandMove( OwnerID(), 30 ,  20 , 30 )
	end
end
-------------------------------------------------------------------------------
function LuaN_musicfes_magic_bronmouse2(i)
	SetPlot( OwnerID(),"Dead","LuaN_musicfes_mouse2dead",0 )
	if LuaFunc_MoveToFlagandWait(OwnerID() , 780306, i-1, 0) == true then     --�s�ѹ�����Y�X��
		SetRandMove( OwnerID(), 30 ,  20 , 30 )
	end
end
function LuaN_musicfes_magic_bronmouse3(i)
	SetPlot(OwnerID() , "dead","LuaN_musicfes_mouse3dead",0)
	if LuaFunc_MoveToFlagandWait(OwnerID() , 780332, i-1, 0) == true then     --�s�ѹ�����Y�X��
		SetRandMove( OwnerID(), 30 ,  20 , 30 )
	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_mouse3dead()
	MusicFestival_Mouse_DiffBoss = MusicFestival_Mouse_DiffBoss + 1
	return true
end