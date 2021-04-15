-- 這一段是 測試用
function mika_test_LostTreasure_all()  
	local NPC = OwnerID()
	local Player = SearchRangePlayer(NPC, 1000)
	say(Player[0], "player")
	Callplot(NPC, "mika_LostTreasure_dog", Player[0] )
	Callplot(NPC, "mika_LostTreasure_Soldier", Player[0] )
	Callplot(NPC, "mika_LostTreasure_Arrow", Player[0] )
	Callplot(NPC, "mika_LostTreasure_Boss1", Player[0] )
end

-----------------  下面是實裝部分 ------------------

--亡靈Dog 
function mika_LostTreasure_dog(Player) 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local BeginFlagID = 780316
	local WalkFlagID = 780316
	local objid = 101701
	local BeginPos =  {0, 1, 2, 3}
	local WalkPos = {4, 5, 6, 7 }
	local objcount = 4
	local dog = {}

	local PlayerLV = ReadRoleValue(Player, EM_RoleValue_LV )  -- 玩家主職等級
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "1 PlayerLV = "..PlayerLV )
--	Say(Player, "1 MonsterLV = "..MonsterLV )

	for i = 1, objcount do
		dog[i] = CreateObjByFlag(objid, BeginFlagID, BeginPos[i] ,1) --使用旗子產生 npc 旗子編號 數量 
		WriteRoleValue( dog[i] , EM_RoleValue_LV , MonsterLV )	-- 設定制式化的測試 Level
		SetModeEx( dog[i]    , EM_SetModeType_Strikback, true )--反擊
		SetModeEx( dog[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( dog[i]    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( dog[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( dog[i]    , EM_SetModeType_Move, true )--移動
		SetModeEx( dog[i]    , EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( dog[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( dog[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( dog[i] , EM_SetModeType_Fight , true )--可砍殺攻擊
		WriteRoleValue( dog[i] , EM_RoleValue_IsWalk , 1) --命令該角色都用走的(0跑;1走)             
		MoveToFlagEnabled( dog[i] , false )   	       --開／關巡邏劇情
	--	AddBuff( dog[i] , 505290 ,1 , -1 )  --給識破buff  icon  先暫時不要+
		WriteRoleValue( dog[i] , EM_RoleValue_PID, 555)  
		AddToPartition( dog[i], RoomID )	--讓物件產生  
		AddBuff(dog[i], 624276, 0 , -1 )  -- 抵擋玩家傷害buff  確定有用
		WriteRoleValue( dog[i], EM_RoleValue_Register+1, Player )  --- 將玩家寫入狗R+1
		Callplot(dog[i], "mika_LostTreasure_WalkPath",BeginFlagID, WalkFlagID,  BeginPos[i] , WalkPos[i] )    -- 移動函式
		Callplot(dog[i], "mika_test_dog_skill", 0 )  -- 亡靈狗的技能
	end
end

-- 古代祕寶 共用移動函式
function mika_LostTreasure_WalkPath(BeginFlagID, WalkFlagID, BeginPos, WalkPos )
	local OID = OwnerID()  -- 狗

--	say(OID, "BeginPos = "..BeginPos.."WalkPos = "..WalkPos )
	While true do
		local WT = 50+(10*Rand(2))   -- 50 + 0 ~ 20
		local WT2 = 40+(10*Rand(2))   -- 40 + 0 ~ 20
		LuaFunc_MoveToFlag( OID, WalkFlagID, WalkPos, 0)        --移動到指定的棋子 
		Sleep(WT)
		LuaFunc_MoveToFlag( OID, BeginFlagID, BeginPos, 0)       
		Sleep(WT2)
	end
end

function mika_test_dog_skill()
	local OID = OwnerID()  -- 狗
	local player = ReadRoleValue(OID, EM_RoleValue_Register+1)
	while true do 
		local dis = GetDistance(OID, player )
		local dead = ReadRoleValue( OID , EM_RoleValue_IsDead )  -- 0 = 活, 1 = 死
	--	say(OID, "Dis, ="..dis..", dead = "..dead) 
		if dead == 0 then  -- 活著
			if dis <= 50 then
				if CheckBuff(OID, 505291 ) == false then    -- npc身上沒有驚嘆號buff
					if  CheckBuff(player, 505296 ) == true  then  -- 隱身buff
						CancelBuff( player , 505296 )  -- 解除隱身 
						AddBuff( OID , 505291 , 1 , 5 )  -- NPC頭上標示 2秒
						Say(OID, "[SC_422804_5]")  --汪
					elseif CheckBuff(player, 505297 ) == true then   -- 裝死buff
						CancelBuff( player , 505297 ) --解除裝死
						AddBuff( OID , 505291 , 1 , 5 )  -- NPC頭上標示 2秒
						Say(OID, "[SC_422804_5]")  --汪
						Sleep(10)
						PlayMotion( player, ruFUSION_MIME_IDLE_STAND )
					end
				end
			end
		end
		sleep(10)
	end
end

------------- 生士兵 -----------

--亡靈士兵
function mika_LostTreasure_Soldier(Player)  --+
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local objid = 101699  --亡靈士兵
	local BeginFlagID = 780313
	local WalkFlagID = 780511
	local BeginPos =  {1, 2, 3, 4, 6 , 7, 8 , 9}
	local WalkPos = {1, 2, 3, 4, 6 , 7, 8 , 9}
	local objcount = 8
	local obj = {}

	local PlayerLV = ReadRoleValue(Player, EM_RoleValue_LV )  -- 玩家主職等級
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "2 PlayerLV = "..PlayerLV )
--	Say(Player, "2 MonsterLV = "..MonsterLV )

	for i = 1, objcount do
		obj[i] = CreateObjByFlag(objid, BeginFlagID, BeginPos[i] ,1) --使用旗子產生 npc 旗子編號 數量 
		WriteRoleValue( obj[i] , EM_RoleValue_LV , MonsterLV )	-- 設定制式化的測試 Level
		SetModeEx( obj[i]    , EM_SetModeType_Strikback, true )--反擊
		SetModeEx( obj[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( obj[i]    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( obj[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( obj[i]    , EM_SetModeType_Move, true )--移動
		SetModeEx( obj[i]    , EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( obj[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( obj[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( obj[i] , EM_SetModeType_Fight , true )--可砍殺攻擊
		WriteRoleValue( obj[i] , EM_RoleValue_IsWalk , 1) --命令該角色都用走的(0跑;1走)             
		WriteRoleValue( obj[i] , EM_RoleValue_PID, 555)  
		MoveToFlagEnabled( obj[i] , false )   	       --開／關巡邏劇情
		AddToPartition( obj[i], RoomID )	--讓物件產生  
		AddBuff(obj[i], 624276, 0 , -1 )  -- 抵擋玩家傷害buff  確定有用
		WriteRoleValue( obj[i], EM_RoleValue_Register+1, Player )  --- 將玩家寫入npc R+1
		Callplot(obj[i], "mika_LostTreasure_WalkPath",BeginFlagID, WalkFlagID,  BeginPos[i] , WalkPos[i] )    -- 移動函式
	end
end

------------- 生弓兵 -----------

--亡靈弓兵
function mika_LostTreasure_Arrow(Player)  --
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local objid = 101700  --亡靈弓兵
	local BeginFlagID = 780314
	local WalkFlagID = 780314
	local BeginPos =  {0, 1, 2, 3}
	local WalkPos = {4, 5, 6 , 7}
	local objcount = 4
	local obj = {}

	local PlayerLV = ReadRoleValue(Player, EM_RoleValue_LV )  -- 玩家主職等級
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "3 PlayerLV = "..PlayerLV )
--	Say(Player, "3 MonsterLV = "..MonsterLV )

	for i = 1, objcount do
		obj[i] = CreateObjByFlag(objid, BeginFlagID, BeginPos[i] ,1) --使用旗子產生 npc 旗子編號 數量 
		WriteRoleValue( obj[i] , EM_RoleValue_LV , MonsterLV )	-- 設定制式化的測試 Level
		SetModeEx( obj[i]    , EM_SetModeType_Strikback, true )--反擊
		SetModeEx( obj[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( obj[i]    , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( obj[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( obj[i]    , EM_SetModeType_Move, true )--移動
		SetModeEx( obj[i]    , EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( obj[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( obj[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( obj[i] , EM_SetModeType_Fight , true )--可砍殺攻擊
		WriteRoleValue( obj[i] , EM_RoleValue_IsWalk , 1) --命令該角色都用走的(0跑;1走)             
		MoveToFlagEnabled( obj[i] , false )   	       --開／關巡邏劇情
		WriteRoleValue( obj[i] , EM_RoleValue_PID, 555)  
		AddToPartition( obj[i], RoomID )	--讓物件產生  
		AddBuff(obj[i], 624276, 0 , -1 )  -- 抵擋玩家傷害buff  確定有用
		WriteRoleValue( obj[i], EM_RoleValue_Register+1, Player )  --- 將玩家寫入npc R+1
		Callplot(obj[i], "mika_LostTreasure_WalkPath",BeginFlagID, WalkFlagID,  BeginPos[i] , WalkPos[i] )    -- 移動函式
	end
end

------------- 生王 -----------
function mika_LostTreasure_Boss1(Player)
	local OID = OwnerID()  -- NPC
	local RANDOWN = rand(100)+1
	if RANDOWN >= 51 then  
		Callplot(OID, "mika_LostTreasure_Boss2", Player, 1 ) 
	else
		Callplot(OID, "mika_LostTreasure_Boss2", Player, 2) 
	end
end

function mika_LostTreasure_Boss2(Player, Pos)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local objid = 101702  --亡靈弓兵
	local BeginFlagID = 780317
	local WalkFlagID = 780317
	local BeginPos =  {0, 2}
	local WalkPos = {1, 3}

	local PlayerLV = ReadRoleValue(Player, EM_RoleValue_LV )  -- 玩家主職等級
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "4 PlayerLV = "..PlayerLV )
--	Say(Player, "4 MonsterLV = "..MonsterLV )
--	Say(Player, "4 BeginPos = "..BeginPos[pos]..", WalkPos = "..WalkPos[Pos] )

	local obj = CreateObjByFlag(objid, BeginFlagID, BeginPos[pos] ,1) --使用旗子產生 npc 旗子編號 數量 
	WriteRoleValue( obj , EM_RoleValue_LV , MonsterLV )	-- 設定制式化的測試 Level
	SetModeEx( obj    , EM_SetModeType_Strikback, true )--反擊
	SetModeEx( obj    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( obj    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( obj    , EM_SetModeType_Mark, true )--標記
	SetModeEx( obj    , EM_SetModeType_Move, true )--移動
	SetModeEx( obj    , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( obj    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( obj , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( obj , EM_SetModeType_Fight , true )--可砍殺攻擊
	WriteRoleValue( obj , EM_RoleValue_IsWalk , 1) --命令該角色都用走的(0跑;1走)             
	MoveToFlagEnabled( obj , false )   	       --開／關巡邏劇情
	WriteRoleValue( obj , EM_RoleValue_PID, 555)  
	AddToPartition( obj, RoomID )	--讓物件產生  
	AddBuff(obj, 624276, 0 , -1 )  -- 抵擋玩家傷害buff  確定有用
	WriteRoleValue( obj, EM_RoleValue_Register+1, Player )  --- 將玩家寫入npc R+1
	Callplot(obj, "mika_LostTreasure_WalkPath",BeginFlagID, WalkFlagID,  BeginPos[pos] , WalkPos[pos] )    -- 移動函式

end