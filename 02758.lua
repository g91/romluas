-- 702758 �U�t�`�����Ը��R  - �a�O�P�a�j


function lua_mika_2012hallow_floor_01()   --�ͥX�a�O Jok
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
 	local floor = CreateObjByFlag( 101471, 780201, 0 , 1 );  --�a�O�޾ɪ� ���ê���
	AddToPartition( floor, RoomID) 

	SetModeEx( floor    , EM_SetModeType_Strikback, false )--����
	SetModeEx( floor    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( floor    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( floor    , EM_SetModeType_Mark, false )--�аO
	SetModeEx( floor    , EM_SetModeType_Move, false )--����
	SetModeEx( floor    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( floor    , EM_SetModeType_HideName, true )--�W��
	SetModeEx( floor   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( floor   , EM_SetModeType_Show , false ) --���
	SetModeEx( floor   , EM_SetModeType_Fight , false )--�i�������
--	say(floor, "1234")
	BeginPlot( floor , "lua_mika_2012hallow_floor_02" , 0 )   -- 701121 �a�j�}��
end


--�}�����ͽd��
function lua_mika_2012hallow_floor_02()
	local floor = OwnerID()

--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 32
	local count = 7 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 60000 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 600000  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 8000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local RoomID = ReadRoleValue( floor ,EM_RoleValue_RoomID) 


--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(111812,Matrix,1,0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(111811,Matrix,1,1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(111811,Matrix,1,-1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(111812,Matrix,1,2)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(111812,Matrix,1,-2)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(111811,Matrix,1,3)

	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(111811,Matrix,2,0 )
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(111812,Matrix,2,1 )
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(111812,Matrix,2,-1 )
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(111811,Matrix,2,2)
	ObjMatrix[11] = LuaFunc_CreateNPCByMatrix(111811,Matrix,2,-2)
	ObjMatrix[12] = LuaFunc_CreateNPCByMatrix(111812,Matrix,2,3)

	ObjMatrix[13] = LuaFunc_CreateNPCByMatrix(111812,Matrix,3,0 )
	ObjMatrix[14] = LuaFunc_CreateNPCByMatrix(111811,Matrix,3,1 )
	ObjMatrix[15] = LuaFunc_CreateNPCByMatrix(111811,Matrix,3,-1 )
	ObjMatrix[16] = LuaFunc_CreateNPCByMatrix(111812,Matrix,3,2)
	ObjMatrix[17] = LuaFunc_CreateNPCByMatrix(111812,Matrix,3,-2)
	ObjMatrix[18] = LuaFunc_CreateNPCByMatrix(111811,Matrix,3,3)

	ObjMatrix[19] = LuaFunc_CreateNPCByMatrix(111811,Matrix,4,0 )
	ObjMatrix[20] = LuaFunc_CreateNPCByMatrix(111812,Matrix,4,1 )
	ObjMatrix[21] = LuaFunc_CreateNPCByMatrix(111812,Matrix,4,-1)
	ObjMatrix[22] = LuaFunc_CreateNPCByMatrix(111811,Matrix,4,2)
	ObjMatrix[23] = LuaFunc_CreateNPCByMatrix(111811,Matrix,4,-2)
	ObjMatrix[24] = LuaFunc_CreateNPCByMatrix(111812,Matrix,4,3)

	ObjMatrix[25] = LuaFunc_CreateNPCByMatrix(111812,Matrix,5,0 )
	ObjMatrix[26] = LuaFunc_CreateNPCByMatrix(111811,Matrix,5,1 )
	ObjMatrix[27] = LuaFunc_CreateNPCByMatrix(111811,Matrix,5,-1 )
	ObjMatrix[28] = LuaFunc_CreateNPCByMatrix(111812,Matrix,5,2)
	ObjMatrix[29] = LuaFunc_CreateNPCByMatrix(111812,Matrix,5,-2)
	ObjMatrix[30] = LuaFunc_CreateNPCByMatrix(111811,Matrix,5,3)

	ObjMatrix[31] = LuaFunc_CreateNPCByMatrix(111811,Matrix,6,0 )
	ObjMatrix[32] = LuaFunc_CreateNPCByMatrix(111812,Matrix,6,1 )
	ObjMatrix[33] = LuaFunc_CreateNPCByMatrix(111812,Matrix,6,-1 )
	ObjMatrix[34] = LuaFunc_CreateNPCByMatrix(111811,Matrix,6,2)
	ObjMatrix[35] = LuaFunc_CreateNPCByMatrix(111811,Matrix,6,-2)
	ObjMatrix[36] = LuaFunc_CreateNPCByMatrix(111812,Matrix,6,3)

	for i = 1 , table.getn(ObjMatrix) do
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Strikback, false )--����
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Move, false )--����
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( ObjMatrix[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( ObjMatrix[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( ObjMatrix[i],  EM_SetModeType_Gravity, false )--���O
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Obstruct, true )--����
		Hide(ObjMatrix[i])
		Show(  ObjMatrix[i],RoomID)

	end


	local floor1 = LuaFunc_SearchNPCbyOrgID( floor , 111811, 300 , 1)       --�a�j1

--�a�O1
	local floorX={}
	for i=0,table.getn(floor1)-1 do
		floorX[i+1]=floor1[i]
	end
	local Y={}

	for i=1 , 18 do
		local W = rand(table.getn(floorX))+1
		--ScriptMessage( OwnerID(),  -1, 0 , " W = "..W , 0 )	--��⥼�i�J�A���ɵ���
		Y[i] = floorX[W]
		--ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--��⥼�i�J�A���ɵ���
		table.remove(floorX,W)
	end

	for i=1, 10 do  
		SetCursorType( Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "lua_mika_2012hallow_obj1_01" , 10 )   -- �ǲ��]��
	end

	for i=11, 13 do 
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "lua_mika_2012hallow_obj3_01" , 10 )   -- ���u��
	end

	for i=14,18 do
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "lua_mika_2012hallow_obj4_01" , 10 )    --  ����
	end

--�a�O2
	sleep(5)

	local floor2 = LuaFunc_SearchNPCbyOrgID( floor , 111812, 300 , 1)       --�a�j2

	local floorY={}
	for g=0,table.getn(floor2)-1 do
		floorY[g+1]=floor2[g]
		--ScriptMessage( OwnerID(),  -1, 0 , "floorY[g+1] = "..floorY[g+1].."g="..g , 0 )	--��⥼�i�J�A���ɵ���
	end
	local H={}
	for g=1 , 18 do
		local W =rand(table.getn(floorY))+1

		H[g] = floorY[W]
		table.remove(floorY,W)
	end

	for g=1, 4 do
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g] ,"touch",  "lua_mika_2012hallow_obj4_01" , 10 )   -- ����	
	end

	for g=5, 14 do -- 10
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g] ,"touch",  "lua_mika_2012hallow_obj5_01" , 10 )   --�X��
	end

	for g=15, 18 do  -- x4
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g]  ,"touch",  "lua_mika_2012hallow_obj6_01" , 10 )   -- �ɦ�
	end
end


-- �R���Ҧ�����  --  ���Ԫ������]�n�R (�קK���a�������ԫ�A�Ӫ������ʮɪ���S�R�� )
function lua_mika_2012hallow_delall()
	local jok = OwnerID()  
	local TempObj = { 107346, 107347, 107348}

	Lua_DavisDelObj(TempObj)

end

function lua_mika_2012hallow_delall2()
	local jok = OwnerID()  
	local TempObj2 = { 
			107346, 107347, 107348, 
			121404, 121405, 121408, 121411, 121407, 121410, 121412, 121413, 111811, 111812,  
			101472, 101273, 101269, 101270, 101271, 101272, 101636, 101637, 101638, 101639, 
			101640, 101641, 101642, 101643, 101644, 101645, 101646, 101647, 101648, 101649, 
			101650, 101651, 101652, 101653, 101654, 101655, 102982, 102983, 102984, 102985, 
			101486, 101487, 101488, 101489, 111956, 101471, 113105, 100044
			}

	Lua_DavisDelObj(TempObj2)

end


--------------------------------------------- �X�{�Q����

function lua_mika_2012hallow_fire01()
	local jok = OwnerID() 
	local RoomID = ReadRoleValue( jok ,EM_RoleValue_RoomID)
	local objid = 121413
	local flag = 780235
	local number = {1, 6, 15, 20}
	local pumpkin

	for i = 1 , 4 , 1 do
		pumpkin = CreateObjByFlag( objid , flag , number[i] , 1 ) --�ϥκX�l���ͨߤl npc �X�l�s�� �ƶq 
		SetModeEx( pumpkin , EM_SetModeType_Strikback , false )--����
		SetModeEx( pumpkin , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( pumpkin , EM_SetModeType_Obstruct , false )--����
		SetModeEx( pumpkin , EM_SetModeType_Mark , true )--�аO
		SetModeEx( pumpkin , EM_SetModeType_Move , true )--����
		SetModeEx( pumpkin , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( pumpkin , EM_SetModeType_HideName , true )--�W��
		SetModeEx( pumpkin , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( pumpkin , EM_SetModeType_Show , True ) --���
		SetModeEx( pumpkin , EM_SetModeType_Fight , false )--�i�������
		WriteRoleValue( pumpkin , EM_RoleValue_IsWalk , 0 ) --�R�O�Ө���ζ]��
		MoveToFlagEnabled( pumpkin , false )	-- �������޼@��
		AddToPartition( pumpkin , RoomID )
		CallPlot( pumpkin , "lua_mika_2012hallow_fire02_1" , pumpkin , i )	-- ���޼@��
		CallPlot( pumpkin , "lua_mika_2012hallow_obj2_001" , pumpkin )	-- Ĳ�I�@��
	end

end

function lua_mika_2012hallow_fire02_1( pumpkin , Step )

	local flag1 = 780235
	local flagnumber = {1, 6, 15, 20}
	local number = 1
	local X , Y , Z = {}  , {} , {}

	for i = 1 , #flagnumber , 1 do
		X[i] = GetMoveFlagValue( Flag1 , flagnumber[i] , EM_RoleValue_X )
		Y[i] = GetMoveFlagValue( Flag1 , flagnumber[i] , EM_RoleValue_Y )
		Z[i] = GetMoveFlagValue( Flag1 , flagnumber[i] , EM_RoleValue_Z )
	end

	while true do
		if Step + 1 == 5 then
			Step = 1
		else
			Step = Step + 1
		end
	--	DebugMsg( 0 , 0 , "Base "..i.." : "..X[Step].." , "..Y[Step].." , "..Z[Step] )		
		MoveDirect( pumpkin , X[Step] , Y[Step] , Z[Step] )
		Sleep(50)
	end
end


function lua_mika_2012hallow_obj2_001(OID)
	setplot(OID, "touch", "lua_mika_2012hallow_obj2_002", 50 )
end

function lua_mika_2012hallow_obj2_002()
	local OID = OwnerID()  --���a
	local TID = TargetID()  -- ��

	if CheckBuff(TID, 623500)  == false then  --�ʨS�bcd
		local playerdir = ReadRoleValue(OID, EM_RoleValue_DIR )
		AdjustFaceDir(TID, OID, 0 )
		Beginplot(TID, "lua_mika_2012hallow_obj2_005", 0 )  -- �I�ʼ@��
	else
		NPCSAY(TID, "[SC_2012HALLOW_MALA_25]" )	-- ���ڥ𮧤@�U�a�A�H�H�I
	end
end

function lua_mika_2012hallow_obj2_005()
	local OID = OwnerID()  -- ��

	setplot(OID, "touch", "", 0 )
	CastSpell( OID , OID , 850413 )  -- �ѦҪk�N  498629
	NPCSAY(OID, "[SC_2012HALLOW_MALA_23]" )	-- �N�O�o�ˡI�H�H�I
	AddBuff(OID, 623500, 0, 30 )  -- ����Buff X���� CD��  �w�t
	sleep(15)
	setplot(OID, "touch", "lua_mika_2012hallow_obj2_002", 30 )
end


-- �򥻪k�N����
function lua_mika_2012hallow_obj2_003()
	local OID = OwnerID()  -- ��
	local TID = TargetID()  -- ��
	local OrgID = ReadRoleValue( TID , EM_RoleValue_OrgID ) -- �ؼЪ�orgid 
	local ghostlist = {107346, 107347, 107348}

	if orgid == ghostlist[1] or orgid == ghostlist[2] or  orgid == ghostlist[3] then
		if CheckBUff(TID, 623501) == false then
			Beginplot(TID, "lua_mika_2012hallow_obj2_004", 0 )
		end
	end
end

function lua_mika_2012hallow_obj2_004()
	local OID = OwnerID()  -- ��
	local grave = ReadRoleValue(OID, EM_RoleValue_Register+9 )  -- �X��

--	say(OID, "dead")
	AddBuff(OID, 623501, 0, -1 )

	PlayMotionEX( OID, ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	WriteRoleValue(grave, EM_RoleValue_Register+2 , 99 )  -- �i�D�X�ӥL���F
--	say(grave, "ghost dead" )
	sleep(15)
	Delobj(OID)
end