--lua�i���D��1�G�b���a�e��C50�Z���إ�1�ӽc�l�@10�ӽc�l�A�b�c�l�W����10�Ӥ��@�˪�npc�A�C������W����npc�H�����t
function YoYo_LuaHomework2()
	local Player = OwnerID()
	local BoxID = 110987
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local PlayerX , PlayerY , PlayerZ , PlayerDir = DW_Location(Player) --���X�ۤv�ثe���y�лP���V
	local BoxNumber = 10
	local BoxRange = 50
	
	local BoxTable = {}
	for Count = 1 , BoxNumber do --�NBoxTable����1~10�Ӧ�m�ŧi��Table
		BoxTable[Count] = {}
	end
	--BoxTable [X] [1] = GUID
	--BoxTable [X] [2] = X�y��
	--BoxTable [X] [3] = Y�y��
	--BoxTable [X] [4] = Z�y��
	--BoxTable [X] [5] = ��V
	
	local NpcTable = {
	114719 , --����
	114770 , --�������U��
	114776 , --���R�D�ͦ]��
	114383 , --�Ӯa�ǰe�v
	114780 , --�ڧJ���D�ǿշ�
	114869 , --��X�D���ڧJ
	114928 , --�����D�N�Ұ�
	114952 , --�F�ԥ����޾ɭ�
	118472 , --�d���ڡD�̰i�}
	114722 , --��P
	}
	--�qNpcTable�üƩ�X�@�ӭȥ��̫᭱�A�@100��
	for Count = 1 , 100 do
		local RandNum = DW_Rand(10) --�H���Q��@
		local MoveNum = table.remove( NpcTable , RandNum )
		table.insert( NpcTable , MoveNum )
	end
	
	BoxTable[1][1] = Lua_CreateObjByDir( Player , BoxID , BoxRange , PlayerDir ) --�гy�Ĥ@�ӽc�l
	SetModeEx( BoxTable[1][1] , EM_SetModeType_Gravity , false) --�L���O
	SetModeEx( BoxTable[1][1] , EM_SetModeType_Move , false) --���i����
	SetModeEx( BoxTable[1][1] , EM_SetModeType_Obstruct , true) --�����׮ĪG
	AdjustFaceDir( BoxTable[1][1] , Player , 180 ) --�]�w�c�l�I��ۤv
	AddtoPartition( BoxTable[1][1] , RoomID )
	BoxTable[1][2] , BoxTable[1][3] , BoxTable[1][4] , BoxTable[1][5] = DW_Location(BoxTable[1][1]) --���o�c�l����m�P���V
	
	local NpcTemporary = {} --Npc GUID���Ȧs�Ŷ�
	NpcTemporary[1] = CreateObj( NpcTable[1] , BoxTable[1][2] , BoxTable[1][3] + 50 , BoxTable[1][4] , BoxTable[1][5] , 1 ) --�гyNPC�b�c�l���W��50���a��
	SetDefIdleMotion ( NpcTemporary[1] , ruFUSION_MIME_SIT_CHAIR_LOOP) --��H���U�ʧ@���Nidle
	AddtoPartition( NpcTemporary[1] , RoomID )
	
	for Count = 2 , BoxNumber do
		BoxTable[Count][1] = Lua_CreateObjByDir( BoxTable[Count - 1][1] , BoxID , BoxRange , BoxTable[Count - 1][5] )
		SetModeEx( BoxTable[Count][1] , EM_SetModeType_Gravity , false) --�L���O
		SetModeEx( BoxTable[Count][1],EM_SetModeType_Move , false) --���i����
		SetModeEx( BoxTable[Count][1] , EM_SetModeType_Obstruct , true) --�����׮ĪG
		AdjustFaceDir( BoxTable[Count][1] , Player , 180 ) --�]�w�c�l�I��ۤv
		AddtoPartition( BoxTable[Count][1] , RoomID )
		BoxTable[Count][2] , BoxTable[Count][3] , BoxTable[Count][4] , BoxTable[Count][5] = DW_Location(BoxTable[Count][1]) --���o�c�l����m�P���V
		
		NpcTemporary[Count] = CreateObj( NpcTable[Count] , BoxTable[Count][2] , BoxTable[Count][3] + 30 , BoxTable[Count][4] , BoxTable[Count][5] , 1 ) --�гyNPC�b�c�l�W��
		SetDefIdleMotion (NpcTemporary[Count] , ruFUSION_MIME_SIT_CHAIR_LOOP) --��H���U�ʧ@���Nidle
		AddtoPartition( NpcTemporary[Count] , RoomID )
	end
	
	--�b�c�l�����k�����D��2�n�Ϊ��X��
	local FlagObjID1 = 102331 --�ߤl�X�СA�h�{�樫���|��
	local FlagObjID2 = 100186 --�߫}�X�СA�^�{�樫���|��
	local FlagObjID3 = 100143 --�p���X�СA�^���~�I��
	local FlagRange = 20 --�X�l�P�c�l���Z��
	local FlagAngle --�c�l���઺����
	local Flag1Table = {}
	local Flag2Table = {}
	local FlagObj3 = Lua_CreateObjByDir( BoxTable[BoxNumber][1] , FlagObjID3 , 30 , BoxTable[BoxNumber][5] ) --�гy�p���X�Цb�̫�@�ӽc�l�����
	AddtoPartition( FlagObj3 , RoomID )
	for Count = 1 , BoxNumber do --�]�w�c�l���V����90�סA����ॿ�A������t
		if Count % 2 == 0 then	FlagAngle = -90
		else	FlagAngle = 90
		end
		AdjustFaceDir( BoxTable[Count][1] , Player , FlagAngle) --�c�l�A�V���V�k��I
		Flag1Table[Count] = Lua_CreateObjByDir( BoxTable[Count][1] , FlagObjID1 , FlagRange , BoxTable[Count][5] ) --���ͨߤl�X�Щ�c�l�����e��
		AddtoPartition( Flag1Table[Count] , RoomID )
		
		AdjustFaceDir( BoxTable[Count][1] , Player , FlagAngle * -1 ) --�c�l�A�V����I
		Flag2Table[Count] = Lua_CreateObjByDir( BoxTable[Count][1] , FlagObjID2 , FlagRange , BoxTable[Count][5] ) --���Ϳ߫}�X�Щ�c�l�����e��
		AddtoPartition( Flag2Table[Count] , RoomID )
	end	
end

function YoYo_LuaHomework2_DelBox() --�R���W��Box�PNPC�Ϊ�
	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local NpcTable = {
	110987 , --�c�l
	
	114719 , --����
	114770 , --�������U��
	114776 , --���R�D�ͦ]��
	114383 , --�Ӯa�ǰe�v
	114780 , --�ڧJ���D�ǿշ�
	114869 , --��X�D���ڧJ
	114928 , --�����D�N�Ұ�
	114952 , --�F�ԥ����޾ɭ�
	118472 , --�d���ڡD�̰i�}
	114722 , --��P
	
	102331 , --�ߤl�X��
	100186 , --�߫}�X��
	100143 --�p���X��
	}
	
	local SearchTable = SearchRangeNPC( Player , 2000 ) --�Z���H���ŦX���󪺳��M��
	for Count = 1 , #SearchTable do
		for Count2 = 1 , #NpcTable do
			if ReadRoleValue( SearchTable[Count] , EM_RoleValue_OrgID ) == NpcTable[Count2] then
				DelObj( SearchTable[Count] )
			end
		end
	end
end

--lua�i���D��2�G�b���a����l�إߤ@��npc�A�u�۽c�l�����j�B�A�D�Ω��e����̫�@�ӽc�l�A�b���^�ӡC
--�i���D��2���g�H�GFN�B�����B�p���B���E�B����
function YoYo_LuaHomework2_Plus()
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local PlayerX , PlayerY , PlayerZ , PlayerDir = DW_Location(Player) --���X�ۤv�ثe���y�лP���V
	local NpcID = 121597
	WalkNpc = CreateObj( NpcID , PlayerX , PlayerY , PlayerZ , PlayerDir , 1 ) --�гyNPC�b�ۨ�����m
	SetModeEx( WalkNpc, EM_SetModeType_Fight, false ) --���i����
	SetModeEx( WalkNpc, EM_SetModeType_Searchenemy, false ) --���|����
	SetModeEx( WalkNpc, EM_SetModeType_Strikback , false ) --���|����
	SetModeEx( WalkNpc, EM_SetModeType_Mark , true ) --�i�I��
	SetModeEx( WalkNpc, EM_SetModeType_NotShowHPMP, true ) --����ܦ��
	AddtoPartition( WalkNpc , RoomID )
	
	local FlagObjID1 = 102331 --�ߤl�X�СA�h�{�樫���|��
	local FlagObjID2 = 100186 --�߫}�X�СA�^�{�樫���|��
	local FlagObjID3 = 100143 --�p���X�СA�^���~�I��
	local FlagTable1 = {} --�h�{���|�X�вM��
	local FlagTable2 = {} --�^�{���|�X�вM��
	local FlagObj3 --���~�I
	local DisTable1 = {} --�Z���M��
	local DisTable2 = {} --�Z���M��
	
	local SearchTable = SearchRangeNPC( Player , 1600 )
	local FlagCount1 = 1
	local FlagCount2 = 1
	for Count = 0 , #SearchTable do --��X�Ҧ����X��NPC
		if ReadRoleValue( SearchTable[Count] , EM_RoleValue_OrgID ) == FlagObjID1 then
			FlagTable1[FlagCount1] = SearchTable[Count]
			--DebugMsg( 0 , 0 , "Flag1 - " .. FlagCount1 .. " = " .. FlagTable1[FlagCount1] )
			FlagCount1 = FlagCount1 + 1
		elseif ReadRoleValue( SearchTable[Count] , EM_RoleValue_OrgID ) == FlagObjID2 then
			FlagTable2[FlagCount2] = SearchTable[Count]
			--DebugMsg( 0 , 0 , "Flag2 - " .. FlagCount2 .. " = " .. FlagTable2[FlagCount2] )
			FlagCount2 = FlagCount2 + 1
		elseif ReadRoleValue( SearchTable[Count] , EM_RoleValue_OrgID ) == FlagObjID3 then
			FlagObj3 = SearchTable[Count]
			--DebugMsg( 0 , 0 , "Flag3 = " .. FlagObj3 )
		end
	end

	for Count = 1 , #FlagTable1 do
		DisTable1[Count] = GetDistance( Player , FlagTable1[Count] ) --���X�Ҧ��X�Ъ��y�лP���V
	end
	for Count = 1 , #FlagTable2 do
		DisTable2[Count] = GetDistance( Player , FlagTable2[Count] ) --���X�Ҧ��X�Ъ��y�лP���V
	end
	
	local SortFlagTable1 , SortDisTable1 = LUA_YOYO_Sequence( FlagTable1 , DisTable1 , 0 ) --�̶Z�����W�Ƨ�
	local SortFlagTable2 , SortDisTable2 = LUA_YOYO_Sequence( FlagTable2 , DisTable2 , 1 ) --�̶Z������Ƨ�

	for Count = 1 , #SortFlagTable1 do --�h�{
		local X , Y , Z , Dir = DW_Location(SortFlagTable1[Count]) --���X�Ҧ��X�Ъ��y�лP���V
		while CheckDistance( WalkNpc , SortFlagTable1[Count] , 1 ) == false do --�P�X�Ъ��Z��>1�N���X�Ш�
			Sleep(10)
			MoveDirect( WalkNpc , X , Y , Z )
		end
	end

	local MiddleX , MiddleY , MiddleZ , Dir = DW_Location(FlagObj3) --���X���~�X�Ъ��y�лP���V
	while CheckDistance( WalkNpc , FlagObj3 , 1 ) == false do --�P�X�Ъ��Z��>1�N�����~�X�Ш�
		Sleep(10)
		MoveDirect( WalkNpc , MiddleX , MiddleY , MiddleZ )
	end
	
	for Count = 1 , #SortFlagTable2 do --�^�{
		local X , Y , Z , Dir = DW_Location(SortFlagTable2[Count]) --���X�Ҧ��X�Ъ��y�лP���V
		while CheckDistance( WalkNpc , SortFlagTable2[Count] , 1 ) == false do --�P�X�Ъ��Z��>1�N���X�Ш�
			Sleep(10)
			MoveDirect( WalkNpc , X , Y , Z )
		end
	end
	
	DelObj(WalkNpc) --Npc�]���ۧR
end