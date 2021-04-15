----------------------------------------------------藏寶秘窟 炮擊用-----------------------------------------------
function LuaSpell_FireOil()
	EnableNpcAI( OwnerID() , false );
	local MagicStr = "SpellMagic"
	local MagicLVStr = "SpellMagicLv"
	local Canon = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101879 , 50 , 0)   --宣告Canon為炮擊NPC，並且施法時會去搜尋這npc，再命令這npc來施這個法術
	local LV
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 1 , 8 , 1 do
		local Magic = MagicStr..i
		local MagicLV = MagicLVStr..i
		if GameObjInfo_Int(OrgID,Magic ) == 492874 then
			LV = GameObjInfo_Int(OrgID,MagicLV )
			break
		end
	end

	local RoomID = ReadroleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ghost = CreateObjByObj( 112047 , TargetID() )
	AddToPartition( Ghost , RoomID )
	SetModeEx( Ghost , EM_SetModeType_Mark, false) 
	SetModeEx( Ghost , EM_SetModeType_HideName, false) 
	SetModeEx( Ghost, EM_SetModeType_ShowRoleHead, false) 
	SetModeEx( Ghost , EM_SetModeType_Strikback , false )
	WriteRoleValue( Ghost , EM_RoleValue_LiveTime , 15 )
	CastSpellLV( Canon , Ghost , 492875 ,LV )
	--AddBuff(Canon ,503210 ,0 ,5 )
	EnableNpcAI( OwnerID() , true );
end

----------------------------------------------------  《巡邏兵 -1》  1破 + 2舵 + 3普水   ，整隊時間需要 6秒-----------------------------------------------

function Luaapon_add_1_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	--原值
	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,0)
	--ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101256,Matrix,3,-1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101256,Matrix,3,1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101256,Matrix,3,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101256,Matrix,3,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-1)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_1_matrix_Reset" , 0 )
end

function Luaapon_add_1_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_1_matrix" , 0 )
end

----------------------------------------------------  《巡邏兵 -2》  1噬 + 2猛 + 3普水，整隊時間需要 6秒-----------------------------------------------

function Luaapon_add_2_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣 列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照  OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101257,Matrix,2,0)
	--ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101261,Matrix,3,-1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101261,Matrix,3,1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101261,Matrix,3,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,-2)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_2_matrix_Reset" , 0 )
end

function Luaapon_add_2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_2_matrix" , 0 )
end
----------------------------------------------------  《巡邏兵 -3》  1噬 + 2破 + 2水 ，整隊時間需要 6秒-----------------------------------------------

function Luaapon_add_3_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣 列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照  OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,-1)
	--ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,0)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101259,Matrix,2,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)


	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_3_matrix_Reset" , 0 )
end

function Luaapon_add_3_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_3_matrix" , 0 )
end

----------------------------------------------------  《巡邏兵 -女 1》 1雪 + 2秘 + 2狙 ，整隊時間需要 6秒-----------------------------------------------

function Luaapon_add_4_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣 列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照  OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	--ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,-1)
	--ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101258,Matrix,3,0)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,-1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101258,Matrix,3,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,1)


	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_4_matrix_Reset" , 0 )
end

function Luaapon_add_4_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_4_matrix" , 0 )
end

----------------------------------------------------  《巡邏兵 -5》 2舵 + 2水 ，整隊時間需要 6秒-----------------------------------------------

function Luaapon_add_5_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣 列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照  OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101256,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101256,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101262,Matrix,4,1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_5_matrix_Reset" , 0 )
end

function Luaapon_add_5_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_5_matrix" , 0 )
end


----------------------------------------------------  《奇襲》 1噬 + 2水 + 2祕 -----------------------------------------------

function Luaapon_add_6_matrix()

	local dis = 12
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣  列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照   OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,0)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101855,Matrix,3,2)

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101260,Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101257,Matrix,3,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101255,Matrix,4,1)


	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Luaapon_add_6_matrix_Reset" , 0 )
end

function Luaapon_add_6_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Luaapon_add_6_matrix" , 0 )
end




----------------------------------------------------------範圍劇情 ---------------------------------------------------
function Luaapon_108_call()
--	local Boss = CreateObjByFlag( 101685 , 780357 , 0 , 1 )
	SetPlot(OwnerID() , "range" ,"LuaS_101880" , 200)
end


function LuaS_101880()
	SetPlot(TargetID(), "range" ,"" , 0)          --清除這一段的範圍劇情，也就是範圍劇情不會跑第二次以上
	ScriptMessage( TargetID(), -1 , 2 , "[SC_101880]" , 1 )     --這是中間黃色字的訊息，字串的用法要改成這樣

end

----------------------------------------------------詛咒船員 死後變章魚 -1  ------------------------------------------------


function Lua_apon_108_taco_1()

	--SetPlot(OwnerID() , "dead" ,"Luaapon_108_taco_2" , 50)
	--SetPlot(OwnerID() , "touch" ,"Lua_apon_108_taco_2" , 50)
	SetPlot(OwnerID() , "range" ,"Lua_apon_108_taco_2" , 50)
end

function Lua_apon_108_taco_2()

	BeginPlot( TargetID() ,"Lua_apon_108_taco_3",0)
end

function Lua_apon_108_taco_3()
	SetPlot(OwnerID() , "range" ,"" , 0)
	AddBuff(OwnerID() ,503208 ,0 ,5 )
	--sleep(10)
	Hide(OwnerID())
	local taco = LuaFunc_CreateObjByObj ( 101263 , OwnerID() )
end

----------------------------------------------------詛咒船員 死後變章魚 -2  ------------------------------------------------


function Lua_apon_108_taco_1_1()

	--SetPlot(OwnerID() , "dead" ,"Luaapon_108_taco_2" , 1)
	--SetPlot(OwnerID() , "touch" ,"Lua_apon_108_taco_2_1" , 50)
	SetPlot(OwnerID() , "range" ,"Lua_apon_108_taco_2_1" , 50)
end

function Lua_apon_108_taco_2_1()

	BeginPlot( TargetID() ,"Lua_apon_108_taco_3_1",0)
end

function Lua_apon_108_taco_3_1()
	SetPlot(OwnerID() , "range" ,"" , 0)
	AddBuff(OwnerID() ,503208 ,0 ,5 )
	--sleep(10)
	Hide(OwnerID())
	local taco = LuaFunc_CreateObjByObj ( 101264 , OwnerID() )
end



-----------------------------枯骨大放送----------------------------------------------------------------------
function lua_apon_bone_1()
	SetPlot(OwnerID() , "touch" ,"lua_apon_bone_2" , 20)

end


function lua_apon_bone_2()
	
	SetPlot(TargetID(), "touch" ,"" , 0) 
	--SetPlot(OwnerID() , "touch" ," " , 20)
	Hide(TargetID())
	local random_reward = rand(99)
	
	if random_reward >= 80 and random_reward <= 99 then
		GiveBodyItem( OwnerID() , 204455, 1 )  --聖水
	end
	
	if random_reward >= 60 and random_reward <= 79 then
		GiveBodyItem( OwnerID() , 201061, 5 )  --回MP的藥水
	end
	
	if random_reward >= 40 and random_reward <= 59 then
		GiveBodyItem( OwnerID() , 204455, 1 )  --聖水
	end
	
	if random_reward >= 20 and random_reward <= 39 then
		GiveBodyItem( OwnerID() , 200820, 5 )  --回HP的藥水
	end
	
	if random_reward >= 1 and random_reward <= 19 then
		GiveBodyItem( OwnerID() , 204455, 1 )  --聖水
	end
end






function lua_apon_bone_cancel()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 101543 then
		
		if CheckBuff( TargetID() , 503122) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_204455_2]" , 1 )    --聖水對猛擊者枯骨發出了耀眼的光芒
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_204455_3]" , 1 )     --猛擊者枯骨的悲魂環繞已被解除，你不需要使用聖水
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_204455_1]" , 1 )  --聖水只能對猛擊者枯骨使用
		return false
	end
end


function lua_apon_bone_cancel_1()
	
	CancelBuff( TargetID(), 503122 )
	
end

------------------------------------------------------ 塔倫默 全艦炮擊修改 -----------------------------------------------

function Lua_apon_BossFire()
	EnableNpcAI( OwnerID() , false );
	local MagicStr = "SpellMagic"
	local MagicLVStr = "SpellMagicLv"
	local LV
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 1 , 8 , 1 do
		local Magic = MagicStr..i
		local MagicLV = MagicLVStr..i
		if GameObjInfo_Int(OrgID,Magic ) == 492967 then
			LV = GameObjInfo_Int(OrgID,MagicLV )
			break
		end
	end

	local RoomID = ReadroleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ghost = CreateObjByObj( 112047 , TargetID() )
	AddToPartition( Ghost , RoomID )
	SetModeEx( Ghost , EM_SetModeType_Mark, false) 
	SetModeEx( Ghost , EM_SetModeType_HideName, false) 
	SetModeEx( Ghost, EM_SetModeType_ShowRoleHead, false) 
	SetModeEx( Ghost , EM_SetModeType_Strikback , false )
	WriteRoleValue( Ghost , EM_RoleValue_LiveTime , 30 )
	CastSpellLV( OwnerID() , Ghost , 492427 ,LV )
	EnableNpcAI( OwnerID() , true );
end



