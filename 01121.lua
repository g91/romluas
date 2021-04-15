--陣型產生範例
function LuaYuyu_floor_matrix()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 32
	local count = 7 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 60000 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 8000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 


--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
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
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Move, false )--移動
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ObjMatrix[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ObjMatrix[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( ObjMatrix[i],  EM_SetModeType_Gravity, false )--重力
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Obstruct, true )--阻擋

		Hide(ObjMatrix[i])
		Show(  ObjMatrix[i],RoomID)

		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )  
		WriteRoleValue( ObjMatrix[i]  , EM_RoleValue_PID , PlayerLV )   
	end

--以下test


	
	local floor1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111811, 300 , 1)       --地磚1

--地板1
	local floorX={}
	for i=0,table.getn(floor1)-1 do
		floorX[i+1]=floor1[i]
	end
	local Y={}


	for i=1 , 18 do
		local W = rand(table.getn(floorX))+1
		--ScriptMessage( OwnerID(),  -1, 0 , " W = "..W , 0 )	--對手未進入，比賽結束
		Y[i] = floorX[W]
		--ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--對手未進入，比賽結束
		table.remove(floorX,W)
	end

	for i=1, 6 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--對手未進入，比賽結束
		SetCursorType( Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_003" , 10 )   --炸彈	
	end
	for i=7,  12 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--對手未進入，比賽結束
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_004" , 10 )   --怪物	
	end
	for i=13, 13 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--對手未進入，比賽結束
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_001_03" , 10 )   --寶箱[3] (公會資源/修理鎚)

	end

	for i=14, 15 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--對手未進入，比賽結束
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_001_04" , 10 )   -- 必爾汀藥水

	end

	for i=16, 17 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--對手未進入，比賽結束
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_001" , 10 )   --必爾汀代幣

	end

	for i=18, 18 do
--		ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--對手未進入，比賽結束
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "LuaYU_111813_001_03" , 10 )   --寶箱[3] (公會資源/修理鎚)

	end

--地板2
	sleep(10)

	local floor2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111812, 300 , 1)       --地磚2

	local floorY={}
	for g=0,table.getn(floor2)-1 do
		floorY[g+1]=floor2[g]
		--ScriptMessage( OwnerID(),  -1, 0 , "floorY[g+1] = "..floorY[g+1].."g="..g , 0 )	--對手未進入，比賽結束
	end
	local H={}
	for g=1 , 18 do
		local W =rand(table.getn(floorY))+1
		--ScriptMessage( OwnerID(),  -1, 0 , " W = "..W , 0 )	--對手未進入，比賽結束
		H[g] = floorY[W]
		--ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--對手未進入，比賽結束
		table.remove(floorY,W)
	end

	for g=1, 6 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--對手未進入，比賽結束
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g] ,"touch",  "LuaYU_111813_003" , 10 )   --炸彈	
	end
	for g=7,  12 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--對手未進入，比賽結束
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g]  ,"touch",  "LuaYU_111813_005" , 10 )   --沒東西	
	end
	for g=13, 13 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--對手未進入，比賽結束
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g] ,"touch",  "LuaYU_111813_001_03" , 10 )   --寶箱[3] (公會資源/修理鎚)

	end

	for g=14, 16 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--對手未進入，比賽結束
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g]  ,"touch",  "LuaYU_111813_001_02" , 10 )   -- 寶葙[2] 舊版符文

	end

	for g=17, 18 do
--		ScriptMessage( OwnerID(),  -1, 0 , "H["..g.."] = "..H[g] , 0 )	--對手未進入，比賽結束
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g]  ,"touch",  "LuaYU_111813_001_05" , 10 )   --寶箱[5] 特殊生產類

	end
end

--function LuaYuyu_floor_matrix_Reset()
--	sleep( 10 )
--	BeginPlot( OwnerID() , "LuaYuyu_floor_matrix" , 0 )
--end
--任務重置


function LuaYuyu_floor_00()

	local floor = {}

		floor[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111811, 300 , 1)     --地磚1
		floor[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111812, 300 , 1)     --地磚2
		floor[3] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101471, 300 , 1)     --地板陣型引導者
		floor[4] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101489, 300 , 1)     --機關人
		floor[5] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101472, 300 , 1)     --魔杖
		floor[6] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101273, 300 , 1)     --發光魔杖
		floor[7] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101655, 300 , 1)    
		floor[8] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101269, 300 , 1)     --岩靈
		floor[9] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101270, 300 , 1)      --衛士
		floor[10] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101271, 300 , 1)     --劍士
		floor[11] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101272, 300 , 1)     --惡魔
		floor[12] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101652, 300 , 1)     --守護
		floor[13] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111956, 300 , 1)     --寶箱
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

		floor[33] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113105, 300 , 1)  --計時器
		floor[34] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100044, 300 , 1)  --全殺


   

	for i=1 , table.getn(floor) do	
		if floor[i] ~= -1 then
			for j = 0 ,table.getn(floor[i])  do

				Delobj(floor[i][j])
			end
		end
	end



end