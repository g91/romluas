----------------------------------------------------  《巡邏兵 -1》快速魟魚群 不整隊   -----------------------------------------------

function Lua_cang_seapat_1_matrix()

	local dis = 16
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102034,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102034,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102034,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_seapat_1_matrix_Reset" , 0 )
end

function Lua_cang_seapat_1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_seapat_1_matrix" , 0 )
end

----------------------------------------------------  《巡邏兵 -2》2獵 不整隊  -----------------------------------------------

function Lua_cang_seapat_2_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102025,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102025,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_seapat_2_matrix_Reset" , 0 )
end

function Lua_cang_seapat_2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_seapat_2_matrix" , 0 )
end

----------------------------------------------------  《巡邏兵 -3》2蛇人 不整隊  -----------------------------------------------

function Lua_cang_seapat_3_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102036,Matrix,2,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102037,Matrix,2,-1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_seapat_3_matrix_Reset" , 0 )
end

function Lua_cang_seapat_3_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_seapat_3_matrix" , 0 )
end
