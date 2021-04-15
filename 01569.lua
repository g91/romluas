
----------------------------------------------------  《巡邏兵 -1》 -----------------------------------------------

function Lua_cang_Z9_PAT1()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102727,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102731,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102731,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_Z9_PAT2" , 0 )
end

function Lua_cang_Z9_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_Z9_PAT1" , 0 )
end

----------------------------------------------------  《巡邏兵 -2》 -----------------------------------------------

function Lua_cang_Z9_PAT3()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102733,Matrix,3,1)
	
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102732,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102732,Matrix,2,0)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102732,Matrix,3,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102732,Matrix,3,0)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102732,Matrix,4,-1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102732,Matrix,4,0)

	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_Z9_PAT4" , 0 )
end

function Lua_cang_Z9_PAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_Z9_PAT3" , 0 )
end

--旗幟招換

function Lua_cang_Z9_flag1()

	Yell( OwnerID() , "[SC_102730_1]" ,5)	--入侵者

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102753, TargetID() )
	--SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	--SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	--SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	--SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	--SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	BeginPlot(SpellCaster,"Lua_cang_Z9_flag2",0)
end


function Lua_cang_Z9_flag2()

	sleep(10)
	local NPC = SearchRangeNPC ( OwnerID() , 200 )
	local Player = SearchRangePlayer ( OwnerID() , 200 )

	for i=0,table.getn(NPC)-1 do
		if CheckID( Player[0] ) == true and ReadRoleValue( Player[0] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Player[0] , EM_RoleValue_IsPlayer ) == 1 then	--檢查玩家是不是還在；檢查是否死亡；檢查是不是玩家
			SetAttack( NPC[i] , Player[0] ) --要求怪物攻擊玩家
		end	
	end	
	sleep(100)
	Delobj(OwnerID())
end

function Lua_cang_Fight_1()
--小宏戰鬥更改距離
	local Tar
	local Search = SearchRangeNPC ( OwnerID() , 40 )
	for i = 0 , table.getn(Search)+1 do
		if Search[i] ~= OwnerID() then
			if Search[i] == -1 then
--				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
				return
			end
			Tar = Search[i]
			break
		end
	end
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	sleep(10)
	for i=1 , 4 do
		if LuaS_Discowood_TrueFight_2(Tar) == false then
			return
		else
			if i ~= 4 then
				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
				sleep(30)
				SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
			end
		end
	end
end