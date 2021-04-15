--枯萎之力

function Lua_cang_Ti01_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102174, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	AddBuff( SpellCaster ,503699,1 ,-1 )
	BeginPlot(SpellCaster,"Lua_cang_Ti02_matrix",0)
	return true
end


function Lua_cang_Ti02_matrix()
	sleep(150)
	Delobj(OwnerID())
end

--


--腐敗之力

function Lua_cang_Ti03_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102165, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
--	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
--	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--移動
--	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
--------------------
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		SetAttack( SpellCaster , ThesePlayer[i] ) -- 全部送進仇恨
	end
--------------------
	AddBuff( SpellCaster ,503704,1 ,-1 )
	BeginPlot(SpellCaster,"Lua_cang_Ti04_matrix",0)
	return true
end


function Lua_cang_Ti04_matrix()
	sleep(120)
	Delobj(OwnerID())
end

--


--冰錐亂舞

function Lua_cang_Ti05_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102166, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	AddBuff( SpellCaster ,503726,1 ,-1 )
	BeginPlot(SpellCaster,"Lua_cang_Ti06_matrix",0)
	return true
end


function Lua_cang_Ti06_matrix()
	sleep(120)
	Delobj(OwnerID())
end

--
----------------------------------------------------  《巡邏兵 -1》風精靈 整隊   -----------------------------------------------

function Lua_cang_Taichu_1_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102186,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102186,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102186,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_Taichu_1_matrix_Reset" , 0 )
end

function Lua_cang_Taichu_1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_Taichu_1_matrix" , 0 )
end

----------------------------------------------------  《巡邏兵 -1》石精靈 不整隊   -----------------------------------------------

function Lua_cang_Taichu_2_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102278,Matrix,2,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102278,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102278,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_Taichu_2_matrix_Reset" , 0 )
end

function Lua_cang_Taichu_2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_Taichu_2_matrix" , 0 )
end





--招換蟲群
function Lua_cang_Ti07_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local m = OwnerID()
	SetPlot( m , "range" , "Lua_cang_Ti08_matrix" , 50 )
end

function Lua_cang_Ti08_matrix()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102301, TargetID() )	--在蟲洞身上產生的蟲	
	SetPlot( TargetID(), "touch" ,"" ,0)
	
	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(TargetID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		SetAttack( SpellCaster , ThesePlayer[i] ) --送出攻擊目標
	end	
	sleep(10)
	
	if ReadRoleValue(TargetID(),EM_RoleValue_IsDead)~=0 then--檢查Temp1是否死亡
		for i = 1 ,	100 , 1 do
			DelFromPartition( SpellCaster )
			AddToPartition( SpellCaster ,    RoomID )	--加進舞台
			BeginPlot(SpellCaster,"Lua_cang_Ti09_matrix",0)
			sleep(50)
		end	
	end	
end
	
function Lua_cang_Ti09_matrix()

	if (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥		
		Delobj(OwnerID())
	end	
end
