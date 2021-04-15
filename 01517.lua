
------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_dreamking_1_1() ---放在檢查Buff的執行劇情中
	BeginPlot(OwnerID(),"Lua_apon_dreamking_1_2",0)
end

function Lua_apon_dreamking_2_1() ---放在檢查Buff的執行劇情中
	BeginPlot(OwnerID(),"Lua_apon_dreamking_2_2",0)
end

function Lua_apon_dreamking_1_2() ----每秒的檢查
	local DeBuffID = 504057 --恐懼的Buff
	local BuffID = 504355 ---防具所帶來的檢查用Buff
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	local Buff_Num = 0--計數
	local Buff_Max = 10 ---玩家需要收集多少的恐懼能量
	while 1 do 
		sleep(10)
	 	if	Buff_Num>=Buff_Max	then
			return
		end
		if CheckBuff(OwnerID(),BuffID) == true then
			if CheckBuff(OwnerID(),DeBuffID) == true then
				Buff_Num = Buff_Num + 1
				DW_QietKillOne(0,105288)
				sleep(100)
			end
		else
			return
		end
	end
end


function Lua_apon_dreamking_2_2() ----每秒的檢查
	local DeBuffID = 504057 --恐懼的Buff
	local BuffID = 504355 ---防具所帶來的檢查用Buff
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	local Buff_Num = 0--計數
	local Buff_Max = 40 ---玩家需要收集多少的恐懼能量
	while 1 do 
		sleep(10)
	 	if	Buff_Num>=Buff_Max	then
			return
		end
		if CheckBuff(OwnerID(),BuffID) == true then
			if CheckBuff(OwnerID(),DeBuffID) == true then
				Buff_Num = Buff_Num + 1
				DW_QietKillOne(0,105288)
				sleep(100)
			end
		else
			return
		end
	end
end






function Lua_apon_dreamking_1_3()---檢查是否已經有檢查用 Buff了
	WriteRoleValue(OwnerID(),EM_LuaValueFlag_SkillUse5,  0   )
	if CheckBuff( OwnerID() , 504355) == true then
		return false
	end
end


function Lua_apon_dreamking_checkques()----放置於任務檢查中
	
	if CheckCompleteQuest( TargetID(), 422748) == false and CheckCompleteQuest( TargetID(), 422751) == false then 
		SetFlag( TargetID(), 543282 , 1 ) ---給予重要物品，回任務條件
	
	else
		ScriptMessage(TargetID(),TargetID(),2,"[SC_422748_01]",C_Red)---秀出已有接相同的任務
	end

end


----------------------------------------------------------------------------------------------------------------------------------------------
-----以下為怪物陣型

function Lua_apon_dream1_matrix()---大小爬行者

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102584,Matrix,2,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102580,Matrix,4,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102580,Matrix,4,1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_dream1_matrix_Reset" , 0 )
end

function Lua_apon_dream1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

-------------------------------------------------------------------------------------------------------------------------

function Lua_apon_dream2_matrix()---大小腐壞者

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102586,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102580,Matrix,4,1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_dream1_matrix_Reset" , 0 )
end

function Lua_apon_dream2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

-------------------------------------------------------------------------------------------------------------------------

function Lua_apon_dream3_matrix()---大小腐壞者-四人版

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102586,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102586,Matrix,4,1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_dream1_matrix_Reset" , 0 )
end

function Lua_apon_dream3_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

-------------------------------------------------------------------------------------------------------------------------

function Lua_apon_dream4_matrix()---大小腐壞者-四人版

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102581,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102581,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102581,Matrix,4,1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_apon_dream1_matrix_Reset" , 0 )
end

function Lua_apon_dream4_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

-------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------