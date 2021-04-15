
----------------------------------------------------  《巡邏兵 -1》 -----------------------------------------------

function Lua_cang_EMI_PAT1()

	local dis = 25
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102575,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102576,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102577,Matrix,2,1)
	
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102479,Matrix,3,-2)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102571,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102570,Matrix,3,1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102572,Matrix,3,2)
	
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(102578,Matrix,4,-1)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(102579,Matrix,4,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT2" , 0 )
end

function Lua_cang_EMI_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT1" , 0 )
end


	
----------------------------------------------------  《巡邏兵 -2》 -----------------------------------------------

function Lua_cang_EMI_PAT3()

	local dis = 25
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102576,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102577,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102479,Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102575,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102570,Matrix,3,1)
	
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102578,Matrix,4,0)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT4" , 0 )
end

function Lua_cang_EMI_PAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT3" , 0 )
end
	

----------------------------------------------------  《巡邏兵 -3》 -----------------------------------------------

function Lua_cang_EMI_PAT5()

	local dis = 25
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102576,Matrix,2,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102577,Matrix,2,1)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102571,Matrix,3,-2)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102575,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102572,Matrix,3,2)	
	
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102578,Matrix,4,-1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102579,Matrix,4,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT6" , 0 )
end

function Lua_cang_EMI_PAT6()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT5" , 0 )
end
	
	

----------------------------------------------------  《巡邏兵 -4》 -----------------------------------------------

function Lua_cang_EMI_PAT7()

	local dis = 25
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102573,Matrix,2,0)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102574,Matrix,4,-2)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102574,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix_2(ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT8" , 0 )
end

function Lua_cang_EMI_PAT8()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT7" , 0 )
end	
	

----------------------------------------------------  《巡邏兵 -5》 -----------------------------------------------

function Lua_cang_EMI_PAT9()

	local dis = 25
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102573,Matrix,2,2)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102573,Matrix,2,-2)
	
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102574,Matrix,4,-2)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102574,Matrix,4,2)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)

	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT10" , 0 )
end

function Lua_cang_EMI_PAT10()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT9" , 0 )
end		
		


----------------------------------------------------  《巡邏兵 -6》 -----------------------------------------------

function Lua_cang_EMI_PAT11()

	local dis = 25
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

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

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102469,Matrix,2,2)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102469,Matrix,2,-2)
	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT12" , 0 )
end

function Lua_cang_EMI_PAT12()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_EMI_PAT11" , 0 )
end


------------------

function Lua_bk_ice_102471()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local alltime=0-----全部
	local time1=0
	local time2=0
	local boss=OwnerID()
	local Play_Chose={}
	local kp=0	
	while 1 do
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
	local BossTarget=AttackTarget
		sleep(10)
		time1=time1+1
		alltime=alltime+1
		if HateListCount( boss ) ~= 0 then
			
			Play_Chose=DW_HateRemain(0)
			if time1 >= 8 then --------------------------------打坦克大招式
				------say(boss,"BossTarget"..BossTarget)
			---	Luck=DW_Rand(100)
			---	if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , OwnerID() , 493935 , 0 )
			----	end
				time1=0
			end
			if alltime >= 15 then 	
				for j=1 , 2 , 1 do-------------------------------隨機打兩個
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]
					SysCastSpellLV( OwnerID() , BossTarget , 494286 , 0 )
					end	
					table.remove (Play_Chose, kp)
					table.getn (Play_Chose)	
				end
				alltime=0
			end
		elseif HateListCount( boss ) == 0 then 
			alltime=0
			time1=0
		end
	end
end
function Lua_bk_iron_102472()
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local alltime=0-----全部
	local time1=0
	local time2=0
	local boss=OwnerID()
	local Play_Chose={}
	local kp=0
	while 1 do
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
	local BossTarget=AttackTarget
		sleep(10)
		time1=time1+1
		alltime=alltime+1
		if HateListCount( boss ) ~= 0 then
			Play_Chose=DW_HateRemain(0)
			if time1 >= 8 then --------------------------------打坦克大招式
				------say(boss,"BossTarget"..BossTarget)
				Luck=DW_Rand(100)
				if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , BossTarget , 493736 , 0 )	
				elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then
					CastSpellLV( OwnerID() , OwnerID() , 493936 , 0 )
					sleep(30)
					if CheckBuff(boss,504793) == false then 
						AddBuff(boss,504210,1,10)
						SetIdleMotion( boss ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
						sleep(100)
						SetIdleMotion( boss ,  ruFUSION_ACTORSTATE_NORMAL)
					end
				end
				time1=0
			end
			if alltime >= 15 then 	
				for j=1 , 2 , 1 do-------------------------------隨機打兩個
					kp=DW_Rand(table.getn(Play_Chose))
					if kp==0 then 
					end
					if kp~=0 then 
					BossTarget = Play_Chose[kp]
					SysCastSpellLV( OwnerID() , BossTarget , 494288 , 0 )
					end	
					table.remove (Play_Chose, kp)
					table.getn (Play_Chose)						
				end
				alltime=0
			end
		elseif HateListCount( boss ) == 0 then 
			alltime=0
			time1=0
		end
	end
end
		
			
			
	