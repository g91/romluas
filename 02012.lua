----------------------------------------------------------------------------------------------------------------
                                                --1王前PAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_130_PAT1() --4人小隊

	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104399,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104400,Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104402,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104401,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT2" , 0 )
end

function Lua_zone17_130_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT1" , 0 )
end

function Lua_zone17_130_PAT3() --3人小隊

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104400,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104401,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104404,Matrix,2,1)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT4" , 0 )
end

function Lua_zone17_130_PAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT3" , 0 )
end
----------------------------------------------------------------------------------------------------------------
                                              --2王前PAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_130_PAT1_2() --4人小隊

	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104406,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104407,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104409,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104408,Matrix,3,0)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT2_2" , 0 )
end

function Lua_zone17_130_PAT2_2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT1_2" , 0 )
end

function Lua_zone17_130_PAT3_2() --5人小隊

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104406,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104407,Matrix,3,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104408,Matrix,5,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104411,Matrix,3,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(104411,Matrix,3,-1)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT4_2" , 0 )
end

function Lua_zone17_130_PAT4_2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT3_2" , 0 )
end

----------------------------------------------------------------------------------------------------------------
                                              --3王前PAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_130_PAT1_3() --3人小隊

	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104416,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104418,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104413,Matrix,2,-1)
	BeginPlot( ObjMatrix[3], "Lua_Az130_Monkey_2", 10 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT2_3" , 0 )
end

function Lua_zone17_130_PAT2_3()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT1_3" , 0 )
end
----------------------------------------------------------------------------------------------------------------
                                              --4王前PAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone17_130_PAT1_4() --5人小隊

	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(104420,Matrix,2,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(104419,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(104423,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(104422,Matrix,4,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(104421,Matrix,4,-1)
	BeginPlot(ObjMatrix[3],"Lua_Az130_FrenzyMonkey",0)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT2_4" , 0 )
end

function Lua_zone17_130_PAT2_4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone17_130_PAT1_4" , 0 )
end

-------------------------------------------------------------------------------------------------------------
function Lua_zone17_130_monster()                   --潛行怪
	CastSpellLv(OwnerID(),OwnerID(),490590,0)
end
function Lua_zone17_130_monstertotan()              --招換圖騰
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local totan
	local ttime = 0 
	while true do
	sleep(10)
		if HateListCount(OwnerID()) ~=0 then
			ttime = ttime +1 
			if ttime == 1 then
				totan=LuaFunc_CreateObjByObj ( 104319, OwnerID() )
				SetModeEx(totan, EM_SetModeType_Move, false)
				AddToPartition(totan, RoomID)
				addbuff(totan,507528,0,-1)
			end
		elseif  HateListCount(OwnerID()) == 0 and GameStart == 1 then  --玩家滅團把該歸零的歸0
			if ReadRoleValue( OwnerID(), EM_RoleValue_IsDead)==0 then

			end
		end		
	end
end     
function Lua_zone17_130_polic()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	--local obj1 = LuaFunc_CreateObjByObj ( 104321 , OwnerID() )
	local obj1 = star_CreateObj( OwnerID() , 104433 , 0 , 0 , 0 , RoomID , 90) --依據OwnerID位置創造XXX偏離XYZ座標,zoomID,面向
		SetModeEx(obj1,EM_SetModeType_Move,false)
		SetModeEx(obj1,EM_SetModeType_Fight,false)
		SetModeEx(obj1,EM_SetModeType_Searchenemy,false)
		SetModeEx(obj1,EM_SetModeType_Strikback,false)
		SetModeEx(obj1,EM_SetModeType_Mark ,false)
		WriteRoleValue(obj1,EM_RoleValue_Livetime,1)
		SetModeEx(obj1,EM_SetModeType_ShowRoleHead,false)
		AddToPartition(obj1,RoomID)
		CastSpellLv(obj1,obj1,496065,0)
end


--/gm ? savenpcmove %T_ID 780716 0 1 1 0 1  --給NPC旗標路徑
--/gm ? createflag xxxxxx                   --創造旗標
--/gm ? delflaglist xxxxxx                  --刪除旗標