--※ 走路工專區 ※--

--帶隊用蘑菇人--106113--

--※ 夏多爾7人團 ※--

function sasa_141_walkP1()
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 2 , 0 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 2 , -1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , 0 )
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk01" , 0 )
end
function sasa_141_walk01()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP1" , 0 )
end

--※ 獅心7人團 ※--

function sasa_141_walkP2()
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106085 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106084 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106084 , Matrix , 2 , 0 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106084 , Matrix , 2 , -1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106083 , Matrix , 3 , 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix( 106083 , Matrix , 3 , 0 )
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix( 106083 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk02" , 0 )
end
function sasa_141_walk02()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP2" , 0 )
end

--※ 夏多爾8人團 ※--

function sasa_141_walkP3()
	local dis = 10
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , 2 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 3 , 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , -2 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 5 , 2 )
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 5 , 0 )
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 5 , -2 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk03" , 0 )
end
function sasa_141_walk03()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP3" , 0 )
end

--※ 夏多爾5人團 ※--

function sasa_141_walkP4()
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 2 , 0 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 3 , 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk04" , 0 )
end
function sasa_141_walk04()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP4" , 0 )
end

--※ MIX 5人團 ※--

function sasa_141_walkP5()
	local dis = 12
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106085 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106087 , Matrix , 3 , 2 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106083 , Matrix , 3 , 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , -2 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk05" , 0 )
end
function sasa_141_walk05()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP5" , 0 )
end

--※ 貓咪4人團 ※--

function sasa_141_walkP6()
	local dis = 18
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106089 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106090 , Matrix , 2 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106090 , Matrix , 2 , -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106089 , Matrix , 3 , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk06" , 0 )
end
function sasa_141_walk06()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP6" , 0 )
end

--※ 犀牛3人團 ※--

function sasa_141_walkP7()
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106082 , Matrix , 1 , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106081 , Matrix , 3 , 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106080 , Matrix , 3 , -1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk07" , 0 )
end
function sasa_141_walk07()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP7" , 0 )
end

--※ 影兵2人團 ※--

function sasa_141_walkP8()
	local dis = 18
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106092,Matrix,1,-1)
	BeginPlot( ObjMatrix[1] , "LuaS_Discowood_NowToHide" , 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106092,Matrix,1,1)
	BeginPlot( ObjMatrix[2] , "LuaS_Discowood_NowToHide" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "sasa_141_walk08" , 0 )
end
function sasa_141_walk08()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP8" , 0 )
end

--※ 22號2人團 ※--

function sasa_141_walkP9()
	local dis = 20
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106095 , Matrix , 1 , -1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106095 , Matrix , 1 , 1 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "sasa_141_walk09" , 0 )
end
function sasa_141_walk09()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP9" , 0 )
end

--※ MIX 5人團 ※--(人王篇)

function sasa_141_walkP10()
	local dis = 12
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( 106085 , Matrix , 1 , 1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix( 106089 , Matrix , 1 , -1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix( 106081 , Matrix , 3 , 2 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix( 106086 , Matrix , 3 , 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix( 106088 , Matrix , 3 , -2 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix )
	BeginPlot( OwnerID() , "sasa_141_walk010" , 0 )
end
function sasa_141_walk010()
	sleep( 10 )
	BeginPlot( OwnerID() , "sasa_141_walkP10" , 0 )
end

--※ 光陣撿骨 ※--

function sasa_106089_CatDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Light = {}
	Light = SearchRangeNPC ( OwnerID() , 50 )
	local LightBox = table.getn(Light)
	for a = 1 , LightBox do
		if ReadRoleValue( Light[a] , EM_RoleValue_OrgID ) == 105785 then
			DelObj( Light[a] )		
		end
	end
end

function sasa_106089_CatAI01()		--碰撞
	local AI = OwnerID()
	SetPlot( AI , "collision" , "sasa_106089_CatAI02" , 50 )
end

function sasa_106089_CatAI02()		--碰撞物件產生字串
	local AI = TargetID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		ScriptMessage( AI , -1 , 2 , "[SC_106089_01]" , 2 )
		--你發現[106089]身上有著消除光陣的開關。
		sleep ( 10 )
		DelObj ( AI )
	end
end

--※ 坐椅子起來順喔 ※--

function sasa_SittingChair_01()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
	local EnterFight
	--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN , ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP )
	SetDefIdleMotion( OwnerID() , ruFUSION_MIME_SIT_CHAIR_LOOP )
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID() ) ~= 0 then			--讀仇恨表內數量(有人)
			SetDefIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
			if EnterFight == 0 then
				EnterFight = 1
				--Sleep(10)
				SetDefIdleMotion( OwnerID() , ruFUSION_MIME_ATTACK_1H )
				--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_SIT_CHAIR_END )
			end
		elseif HateListCount( OwnerID() ) == 0 then		--讀仇恨表內數量(沒人)
			Sleep(30)
			SetDefIdleMotion( OwnerID() , ruFUSION_MIME_SIT_CHAIR_LOOP )
			if EnterFight == 1 then
				EnterFight = 0
				--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN , ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP )	
				--SetDefIdleMotion( OwnerID() , ruFUSION_MIME_SIT_CHAIR_LOOP )
			end
		end
	end
end

--※ 芝麻開門 ※--
--// 一個門+3個把手(門前)+1個把手(門後) 需要5個旗標

function sasa_119467_OpenDoor01()						--放在把手1號上
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID)   --種物件時填入的值
	if PID > 0 then
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local FlagArg = (PID-1)*5
		local Door = CreateObjByFlag( 106197 , 781017 , FlagArg+1 , 1 )
		local ScriptSet = { "sasa_119467_AI" , "sasa_119467_luck2" , "sasa_119467_luck3" }
		SetModeEx( Door , EM_SetModeType_Move , false )			------不移動
		SetModeEx( Door , EM_SetModeType_Strikback , false )	------不反擊
		SetModeEx( Door , EM_SetModeType_Fight , false )		------不可砍殺
		SetModeEx( Door , EM_SetModeType_Searchenemy , false )	------不索敵
		SetModeEx( Door , EM_SetModeType_Mark , false )			------不可點選
		SetModeEx( Door , EM_SetModeType_NotShowHPMP , false )	------不show血條
		SetModeEx( Door , EM_SetModeType_Obstruct , true )		------阻擋
		AddToPartition( Door , Room ) 	
		WriteRoleValue( OwnerID() , EM_RoleValue_register1 , Door )	--門
		
		local hand1 = CreateObjByFlag( 119467 , 781017 , FlagArg+2 , 1 )
		AddToPartition( hand1 , Room )
		WriteRoleValue( hand1 , EM_RoleValue_register1 , OwnerID() )	--將第一隻手把紀錄起來
		local hand2 = CreateObjByFlag( 119467 , 781017 , FlagArg+3 , 1 )
		AddToPartition( hand2 , Room )
		WriteRoleValue( hand2 , EM_RoleValue_register1 , OwnerID() )	--將第一隻手把紀錄起來
		local hand3 = CreateObjByFlag( 119467 , 781017 , FlagArg+4 , 1 )
		AddToPartition( hand3 , Room )
		WriteRoleValue( hand3 , EM_RoleValue_register1 , OwnerID() )	--將第一隻手把紀錄起來
		local HandSet = { hand1 , hand2 , hand3 }
		for i=1 , 3 do
			local num = rand( table.getn(ScriptSet) ) + 1
			Setplot( HandSet[i] , "touch" , ScriptSet[num] , 30 )
			--Say( OwnerID() , ScriptSet[num] )
			table.remove( ScriptSet , num )
			sleep(1)
		end	
	end	
end

function sasa_119467_AI()			--第一手把的觸碰
	BeginPlot( TargetID() , "sasa_119467_AI2" , 0)
	SetIdleMotion( TargetID() , ruFUSION_MIME_ACTIVATE_END )			--把手動作
end

function sasa_119467_AI2()
	Setplot( OwnerID() , "touch" , "" , 0 )
	sleep(1)
	
	local control = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )   --讀出中控id
	local PID = ReadRoleValue( control , EM_RoleValue_PID)   --種物件時填入的值
	local FlagArg = (PID-1)*5
	local DoorCounter = 0
	local Door = ReadRoleValue( control , EM_RoleValue_register1 )
	local Room = ReadRoleValue( control , EM_RoleValue_RoomID )
	local IsOpened = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	local IsTwoHand = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	
	if IsTwoHand == 0 then		--沒有開門後的手把
		local hand4 = CreateObjByFlag( 119467 , 781017 , FlagArg+5 , 1 )	--生出第二枝手把
		AddToPartition( hand4 , Room )
		WriteRoleValue ( hand4 , EM_RoleValue_Register10 , OwnerID() ) --紀錄第一手把
		WriteRoleValue( OwnerID() , EM_RoleValue_register3 , 1 )  --通知已經有兩隻手把
		Setplot( hand4 , "touch" , "sasa_119467_hand4" , 30 )
		--Say ( OwnerID() , "Two Here!" )
	end
	if IsOpened == 0 then		--門沒有打開才做
		WriteRoleValue(  OwnerID() , EM_RoleValue_register2 , 1 )		--通知門已經打開
		SetIdleMotion( Door , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )		--門打開
		SetModeEx( Door , EM_SetModeType_Obstruct , false )				--阻擋(開門狀態不勾)
		--Say ( OwnerID() , getname(Door) )
		for i=1 , 7 do
			Sleep(10)
			DoorCounter = DoorCounter + 1
			--Say ( OwnerID() , "start" )
			
			if DoorCounter == 6 then
				SetIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )	--關門
				SetModeEx( Door , EM_SetModeType_Obstruct , true )		------阻擋
				WriteRoleValue( OwnerID() , EM_RoleValue_register2 , 0 )		----通知門已經關
				--Say ( OwnerID() , "close" )
				DoorCounter = 0
				Setplot( OwnerID() , "touch" , "sasa_119467_AI" , 30 )
				SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND )	--把手回到初始動作
				--SetIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
				break
			end
		end
	elseif IsOpened == 1 then	--門已經打開才做
		Setplot( OwnerID() , "touch" , "sasa_119467_AI" , 30 )	
		SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND )	--把手回到初始動作
	end	
end

function sasa_119467_hand4()			--第二手把的觸碰
	local hand1 = ReadRoleValue( TargetID() , EM_RoleValue_register10 )	--讀出第一把手的id
	local IsOpened = ReadRoleValue( hand1 , EM_RoleValue_register2 )
	BeginPlot( TargetID() , "sasa_119467_hand4_1" , 0)
	SetIdleMotion(TargetID() , ruFUSION_MIME_ACTIVATE_END )			--把手動作
end

function sasa_119467_hand4_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local open = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )	--讀出開門手把的id
	local control = ReadRoleValue( open , EM_RoleValue_register1 )		--讀出中控id
	local DoorCounter = 0
	local Door = ReadRoleValue( control , EM_RoleValue_register1 )
	local IsOpened = ReadRoleValue( open , EM_RoleValue_register2 )
	
	if IsOpened == 0 then		--門沒有打開才做
		WriteRoleValue( open , EM_RoleValue_register2 , 1 )				--通知門已經打開	
		SetIdleMotion( Door , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )		--門打開
		SetModeEx( Door , EM_SetModeType_Obstruct , false )				--阻擋(開門狀態不勾)
		for i=1 , 7 do
			Sleep(10)
			DoorCounter = DoorCounter + 1
			--Say ( OwnerID() , "start" )
			
			if DoorCounter == 6 then
				SetIdleMotion( Door , ruFUSION_MIME_IDLE_STAND )	--關門
				SetModeEx( Door , EM_SetModeType_Obstruct , true )		------阻擋
				--Say ( OwnerID() , "close" )
				WriteRoleValue( open , EM_RoleValue_register2 , 0 )		----通知門已經關
				DoorCounter = 0
				Setplot( OwnerID() , "touch" , "sasa_119467_hand4" , 30 )
				SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND )	--把手回到初始動作
				--SetIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
				break
			end
		end
	elseif IsOpened == 1 then	--門已經打開才做
		Setplot( OwnerID() , "touch" , "sasa_119467_hand4" , 30 )
		SetIdleMotion( OwnerID() , ruFUSION_MIME_IDLE_STAND )	--把手回到初始動作
	end	
end

function sasa_119467_luck2()
	BeginPlot( TargetID() , "sasa_119467_luck2_1" , 0)
	SetIdleMotion( TargetID() , ruFUSION_MIME_ACTIVATE_END )			--把手動作
	WriteRoleValue ( TargetID() , EM_RoleValue_Register10 , OwnerID() ) --玩家
end

function sasa_119467_luck2_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local toucher = ReadRoleValue ( OwnerID() , EM_RoleValue_Register10 )
	local FearSpell = 498378   --神秘詛咒
	--local String = "Fear!"
	local String = "[SC_119467_FEAR]"
	ScriptMessage( OwnerID() , -1 , 2 , String , 1 )
	sleep(10)
	CastSpellLv( toucher , toucher , FearSpell , 0 )
end

function sasa_119467_luck3()
	BeginPlot( TargetID() , "sasa_119467_luck3_1" , 0)
	SetIdleMotion( TargetID() , ruFUSION_MIME_ACTIVATE_END )			--把手動作
end

function sasa_119467_luck3_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--local String = "Worm!"
	local String = "[SC_119467_WORM]"
	local Player = SearchRangePlayer ( OwnerID() , 200 )
	local Worm = {}
	local WormID = 106196		--機關蟲
	--local WormID = 102351		--暫代
	ScriptMessage( OwnerID() , -1 , 2 , String , 1 )
	sleep(10)
	for i=1 , table.getn(Player) do
		Worm[i] = star_CreateObj( Player[i-1] , WormID , 0 , 100 , 0 , Room , 0 )
		BeginPlot( Worm[i] , "sasa_106196_killID" , 0 )
		Setplot( Worm[i] , "dead" , "sasa_106196_BombWorm" , 30 )
		--SetAttack( Worm[i] , Player[i-1] )
		--Say( OwnerID() , getname(Player[i-1]) )
	end
end

--※ 小蟲自爆 ※--

function sasa_106196_killID()
	local counter = 0
	while 1 do
		sleep(10)
		counter = counter + 1
		if counter == 4 then
			--Say( OwnerID() , "kill" )
			killID( OwnerID() , OwnerID() )
		end	
	end	
end

--※ 小蟲爆炸 ※--

function sasa_106196_BombWorm()
	local BallF = star_CreateObj_NoAdd( OwnerID() , 106312 , 0 , 0 , 0 , Room , 0 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetModeEx( BallF , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( BallF , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( BallF , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
	SetModeEx( BallF , EM_SetModeType_Searchenemy , false )   	--索敵
	SetModeEx( BallF , EM_SetModeType_Mark , false )			--標記
	SetModeEx( BallF , EM_SetModeType_Fight , false ) 			--砍殺
	SetModeEx( BallF , EM_SetModeType_Move , false )			--移動
	SetModeEx( BallF , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallF , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( BallF , EM_SetModeType_Show , true )				--秀出
	AddToPartition( BallF , Room )
	WriteRoleValue( BallF , EM_RoleValue_Livetime, 10 )			--存在秒數
	CastSpellLv( BallF , BallF , 498453 , 0 )					--炸裂
	--Say( BallF , "Bomb 1" )
end

--※ 報馬仔 ※--

function sasa_106091_patrol()
	local MoveFlag = 781025
	local SummonSpell = 498380		--30秒一次
	local DemonDoor = 103052		-----異界之門DBID
	local DemonDoorBuff = 505649	-----show出異界之門的特效
	local NoReHPBuff = 505653			----不回血
	local SpeedBuff = 620500			----不回血
	
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Door
	local Target 
	local EnterFight = 0
	local counter = 0
	local mobcount = 0
	local mob = {}
	local FlagArg = (PID-1)*2
	local DemonID1 = 106211			-----實驗體22號
	local String = "[SC_119467_INTRUDERS]" 
	while true do
		sleep(10)
		Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		--Say(OwnerID() , counter)
		if  ( Target ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			--Say(OwnerID() , "test!")	
			if EnterFight == 0 then
				ScriptMessage( OwnerID() , -1 , 2 , String , 1 )
				AddBuff( OwnerID() , NoReHPBuff , 0 , -1 )
				AddBuff( OwnerID() , SpeedBuff , 0 , 5 )
				SetStopAttack( OwnerID() )
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )	------不索敵
				SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )	------不反擊
				if PID > 0 then
					MoveToFlagEnabled ( OwnerID() ,  false )
					DW_MoveToFlag( OwnerID() , MoveFlag , FlagArg+1 , 0 )	--( who , flag , No. , Range )
					--Say( OwnerID() , "move" )	
				end
				sleep(20)
				CastSpellLv( OwnerID() , OwnerID() , SummonSpell , 0 )	--表演召喚法術
				sleep(20)
				--Door = star_CreateObj_NoAdd( OwnerID() , DemonDoor , 30 , 0 , 0 , Room , 720) 				
				Door = CreateObjByFlag( 103052 , MoveFlag , FlagArg+2 , 1 )
				SetModeEx( Door , EM_SetModeType_Move , false )			------不移動
				SetModeEx( Door , EM_SetModeType_Strikback , false )	------不反擊
				SetModeEx( Door , EM_SetModeType_Fight , false )		------不可砍殺
				SetModeEx( Door , EM_SetModeType_Searchenemy , false )	------不索敵
				SetModeEx( Door , EM_SetModeType_Mark , false )			------不可點選
				SetModeEx( Door , EM_SetModeType_NotShowHPMP , false )	------不show血條
				AddToPartition( Door , Room )	
				AddBuff(Door , DemonDoorBuff , 0 , -1)
				EnterFight = 1
			end	
		elseif ( Target == 0 ) and ( CheckID( OwnerID() ) ) == true and EnterFight == 1 then
			counter = counter + 1
			if mobcount == 5 then
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , true )		--索敵
				SetModeEx( OwnerID() , EM_SetModeType_Strikback , true )	------反擊
				MoveToFlagEnabled ( OwnerID() ,  true )
				if Door ~= nil and ( CheckID( Door ) ) == true then
					Delobj(Door)
				end
			elseif counter == 6 then
				if mobcount < 6 then
					mob[table.getn(mob)+1] = star_CreateObj( Door , DemonID1 , 0 , 0 , 0 , Room , 0)		-----召喚惡魔
					counter = 0
					mobcount = mobcount + 1					
				end	
			end	
			if counter > 30 then
				for i=1 , table.getn(mob) do
					if CheckID( mob[i] ) == true and mob[i] ~=nil then
						Delobj(mob[i])
					end
				end
				EnterFight = 0
				mobcount = 0
				counter = 0
				mob = {}
			end
		end
	end
end