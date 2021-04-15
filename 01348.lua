-------------------------------------------------------------------------------------火爆士兵follow玩家
function Lua_apon_101920()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 101920, TargetID() )	
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, true )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, true )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, true) --搜尋敵人
 	SetModeEx( SpellCaster   , EM_SetModeType_Mark, true )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Move, true )--移動
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	SetFollow( SpellCaster , TargetID() )
	BeginPlot(SpellCaster,"Lua_apon_101920_1",0)
end
function Lua_apon_101920_1()
	sleep(40)
	CastSpell(OwnerID(),OwnerID(),492973)
	sleep(10)
	--DelObj(OwnerID())

end

--------------------------------------------------------------------------------冰矮陣列-1-四隻親衛隊

function Lua_apon_ice_50_1_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102009,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102009,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102010,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102010,Matrix,3,1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_ice_50_1_matrix_Reset" , 0 )
end

function Lua_apon_ice_50_1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_apon_ice_50_1_matrix" , 0 )
end

--------------------------------------------------------------------------------冰矮陣列-2-四隻親衛隊+一隻石士兵

function Lua_apon_ice_50_2_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102009,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102009,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102010,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102010,Matrix,3,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101895,Matrix,5,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_ice_50_2_matrix_Reset" , 0 )
end

function Lua_apon_ice_50_2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_apon_ice_50_2_matrix" , 0 )
end

