--780030 ���X�нs��
-- 81~92 �h�L�]�򪱮a����m
-- 101 ~ 112 �h�L�i�J�K�D�e�C������m
-- 0 ���j�F�X�{����m
-- 1 ���j�F���ʨ�y�e����m�B���X�h�L����m
-- 2 ���j�F���w��
-- 3 
-- 4 ���j�F�P�h�|���԰��ɡA���j�F����m\���e���j�F�X�{����m
-- 5 ���j�F�P�h�|���԰��ɡA�h�|������m
-- 6 �h�|����Ӫ���m
-- 7 ���s�X�{����m
-- 8 
-- 9
-- 61~71 �h�L���骺��m
-- 72~80 �]�����骺��m
-- 10 ~ 30 �q�L�K�D���X��
----------------------------------------------------------------------------------------------------------
--���j�F�@�}�l���@��
function LuaI_420278() --�]�w�d��@���I
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	sleep(5)
	Ver_Zone103_Trap[RoomID]["OGD"] = OwnerID()
	Ver_Zone103_Trap[RoomID]["DRAMA"] = 0
	SetPlot( OwnerID() ,"Range" , "LuaI_420278_Range" , 300 )
end
function LuaI_420278_Range()
	SetPlot( TargetID() ,"Range" , "" , 0 )
	BeginPlot( TargetID() , "LuaI_420278_Play", 0  )
end
function LuaI_420278_Play()
	local Soldier = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110450 , 500 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Ver_Zone103_Trap[RoomID]["Soldiers"] = {}
	Ver_Zone103_Trap[RoomID]["Soldiers"] = Soldier
--	 --�\��h�L����m�O��ӥL�̦^�쪺���
	local i = 0
	local OGD = OwnerID()
	DisableQuest( OGD , true )
	MoveToFlagEnabled( OGD, false );
	FaceObj( TargetID() , OGD )
	sleep( 10 )
	yell( OGD ,  GetString("SAY_110247_1"),5 ) --/*�A�̻D�_�өM���s�J�I�̤��P�K�K�O���廡�����s�H���a�I
	sleep( 20 )
	yell( OGD ,  GetString("SAY_110247_2") ,5) --/*����n�ڭ̧O�z�Z�A�̪��ϩR�A�ӧڤ]�Ʊ�A�̧O�z�Z�ڭ̪��@�ԡC
	LuaFunc_MoveToFlag( OGD,780030 , 0 ,0 )
	sleep( 30 )
	yell( OGD ,  GetString("SAY_110247_3"),5 ) --/*���L�Y�A�̹��@�Ԥ��e������A�ڳo�̭ˬO���@�Ǧ��N�䪺�u�@�C	
	while 1 do 
		if Soldier[i] == -1 then
			break
		end
		WriteRoleValue( Soldier[i] , EM_RoleValue_PID , i )
		BeginPlot( Soldier[i],"LuaI_420278_RUNNING",0)
		sleep(1)
		i = i + 1 
	end
	sleep( 30 )
	LuaFunc_MoveToFlag( OGD, 780030 , 2 ,0 )
	--�o�̱��}�Ҥj�����@��
	DisableQuest( OGD , false )
	
end
function LuaI_420278_RUNNING()
	local i = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	MoveToFlagEnabled(OwnerID(), false );
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0  )
	LuaFunc_MoveToFlag( OwnerID() , 780030 , i+81 ,0 ) --�\��h�L����m81~92
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk ,1)			
end