function Lua_cang_120_PAT1()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102685,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102945,Matrix,2,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102945,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_cang_120_PAT2" , 0 )
end

function Lua_cang_120_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_cang_120_PAT1" , 0 )
end

----------------------------------------------------------------------------------------------------

function Lua_cang_120_poison()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102951, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	Hide(SpellCaster)
	Show(SpellCaster,RoomID)
	AddBuff( SpellCaster ,505349,1 ,-1 )
	WriteRoleValue(SpellCaster, EM_RoleValue_Livetime,10)
end

function Lua_cang_120_deadloop()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_DEAD)
end



function Lua_cang_120_SkillA()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102702, OwnerID() )
	AddToPartition( SpellCaster ,   RoomID )	--加進舞台
	BeginPlot(SpellCaster , "Lua_cang_120_SkillA_01" , 0 )
end

function Lua_cang_120_SkillA_01()
	local count = 0
	while true do
		sleep(10)	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			if count == 0 then	
				local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
				local ThesePlayer = {}
				local sway = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- 接暫存值
					if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_VOC ) ~= 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then--檢查玩家是不是還在；檢查是否死亡
						sway[table.getn(sway)+1] = ThesePlayer[i]	--放入Useful裡面 
					end					
				end	
				if table.getn(sway) ~= 0 then
					anyone = Rand(table.getn(sway))+1
					SetAttack(OwnerID(), sway[anyone] )
				elseif table.getn(sway) == 0 then
					DelObj(OwnerID())
				end
				count = 1
			end
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then		
			sleep(30)
			DelObj(OwnerID())
		end	
	end	
end


function Lua_cang_120_fireshot()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 102951, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	CastSpellLV(OwnerID(), OwnerID(), 494715, 1)
	WriteRoleValue(SpellCaster, EM_RoleValue_Livetime,10)
end














