function lua_star_pastrolmatrix()
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local dis = 10 --陣列的間距
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 60 --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = -1 --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100999,Matrix,1,-1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100999,Matrix,1, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100999,Matrix,1, 0 )
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "LuaSuez_star_matrix_Reset" , 0 )
end

function LuaSuez_star_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "lua_star_pastrolmatrix" , 0 )
end