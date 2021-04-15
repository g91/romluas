function Lua_cang_119_Deadfire()

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = LuaFunc_CreateObjByObj ( 102166, OwnerID() )	--招換
	SetModeEx( Temp   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( Temp )
	AddToPartition( Temp ,    RoomID )	--加進舞台
	AddBuff( Temp ,504960,1 ,-1 )
	BeginPlot(Temp,"Lua_cang_119_Deadfire_1",0)
end

function Lua_cang_119_Deadfire_1()
	sleep(120)
	Delobj(OwnerID())
end


--

function Lua_cang_119_PAT1()

	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102722,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102721,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102721,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_119_PAT2" , 0 )
end

function Lua_cang_119_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_119_PAT1" , 0 )
end



function Lua_cang_119_PAT3()

	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102724,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102723,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102723,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_119_PAT4" , 0 )
end

function Lua_cang_119_PAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_119_PAT3" , 0 )
end






function Lua_cang_119_PAT5()

	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102724,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102721,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102721,Matrix,2,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102723,Matrix,3,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102723,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_119_PAT6" , 0 )
end

function Lua_cang_119_PAT6()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_119_PAT5" , 0 )
end