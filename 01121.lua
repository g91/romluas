--�}�����ͽd��
function LuaYuyu_floor_matrix()

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
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 


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

		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
		WriteRoleValue( ObjMatrix[i]  , EM_RoleValue_PID , PlayerLV )   
	end

--�H�Utest


	
	local floor1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111811, 300 , 1)       --�a�j1

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

	for i=1, 6 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType( Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_003" , 10 )   --���u	
	end
	for i=7,  12 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_004" , 10 )   --�Ǫ�	
	end
	for i=13, 13 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_001_03" , 10 )   --�_�c[3] (���|�귽/�ײz��)

	end

	for i=14, 15 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_001_04" , 10 )   -- �������Ĥ�

	end

	for i=16, 17 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_001" , 10 )   --�����ťN��

	end

	for i=18, 18 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_001_03" , 10 )   --�_�c[3] (���|�귽/�ײz��)

	end

--�a�O2
	sleep(10)

	local floor2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111812, 300 , 1)       --�a�j2

	local floorY={}
	for g=0,table.getn(floor2)-1 do
		floorY[g+1]=floor2[g]
		--ScriptMessage( OwnerID(),  -1, 0 , "floorY[g+1] = "..floorY[g+1].."g="..g , 0 )	--��⥼�i�J�A���ɵ���
	end
	local H={}
	for g=1 , 18 do
		local W =rand(table.getn(floorY))+1
		--ScriptMessage( OwnerID(),  -1, 0 , " W = "..W , 0 )	--��⥼�i�J�A���ɵ���
		H[g] = floorY[W]
		--ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--��⥼�i�J�A���ɵ���
		table.remove(floorY,W)
	end

	for g=1, 6 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g] ,"touch",  "LuaYU_111813_003" , 10 )   --���u	
	end
	for g=7,  12 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g]  ,"touch",  "LuaYU_111813_005" , 10 )   --�S�F��	
	end
	for g=13, 13 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g] ,"touch",  "LuaYU_111813_001_03" , 10 )   --�_�c[3] (���|�귽/�ײz��)

	end

	for g=14, 16 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g]  ,"touch",  "LuaYU_111813_001_02" , 10 )   -- �_߹[2] �ª��Ť�

	end

	for g=17, 18 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--��⥼�i�J�A���ɵ���
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g]  ,"touch",  "LuaYU_111813_001_05" , 10 )   --�_�c[5] �S��Ͳ���

	end
end

--function LuaYuyu_floor_matrix_Reset()
--	sleep( 10 )
--	BeginPlot( OwnerID() , "LuaYuyu_floor_matrix" , 0 )
--end
--���ȭ��m


function LuaYuyu_floor_00()

	local floor = {}

		floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111811, 300 , 1)     --�a�j1
		floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111812, 300 , 1)     --�a�j2
		floor[3] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101471, 300 , 1)     --�a�O�}���޾ɪ�
		floor[4] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101489, 300 , 1)     --�����H
		floor[5] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101472, 300 , 1)     --�]��
		floor[6] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101273, 300 , 1)     --�o���]��
		floor[7] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101655, 300 , 1)    
		floor[8] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101269, 300 , 1)     --���F
		floor[9] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101270, 300 , 1)      --�äh
		floor[10] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101271, 300 , 1)     --�C�h
		floor[11] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101272, 300 , 1)     --�c�]
		floor[12] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101652, 300 , 1)     --�u�@
		floor[13] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111956, 300 , 1)     --�_�c
		floor[14] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101636, 300 , 1)     
		floor[15] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101637, 300 , 1)  
		floor[16] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101638, 300 , 1)     
		floor[17] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101639, 300 , 1)     
		floor[18] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101640, 300 , 1)  
		floor[19] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101641, 300 , 1)     
		floor[20] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101642, 300 , 1)  
		floor[21] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101643, 300 , 1)     
		floor[22] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101644, 300 , 1)     
		floor[23] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101645, 300 , 1)  
		floor[24] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101646, 300 , 1)     
		floor[25] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101647, 300 , 1)     
		floor[26] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101648, 300 , 1)     
		floor[27] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101649, 300 , 1)     
		floor[28] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101650, 300 , 1)     
		floor[29] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101651, 300 , 1)     
		floor[30] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101652, 300 , 1)     
		floor[31] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101653, 300 , 1)   
		floor[32] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101654, 300 , 1)   

		floor[33] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113105, 300 , 1)  --�p�ɾ�
		floor[34] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100044, 300 , 1)  --����


   

	for i=1 , table.getn(floor) do	
		if floor[i] ~= -1 then
			for j = 0 ,table.getn(floor[i])  do

				Delobj(floor[i][j])
			end
		end
	end



end