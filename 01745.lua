--產生女性參加者
function lua_mika_dancefes_dancerborn5() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC1位置1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn101a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC1位置2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn101b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC1位置3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn101c", 10) 
	end
end

function lua_mika_dancefes_dancerborn6() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC2位置1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn102a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC2位置2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn102b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC2位置3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn102c", 10) 
	end
end

function lua_mika_dancefes_dancerborn7() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC3位置1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn103a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC3位置2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn103b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC3位置3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn103c", 10) 
	end
end

function lua_mika_dancefes_dancerborn8()
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC4位置1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn104a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC4位置2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn104b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC4位置3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_girlborn104c", 10) 
	end 
end

--女01---
function Lua_mika_dancefes_girlborn101a() --女生第一組 01 位置a
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114709, 780320,31 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn101b() --女生第一組 01 位置b
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114709, 780320,32 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn101c() --女生第一組 01 位置c
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114709, 780320,33 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

--女02---
function Lua_mika_dancefes_girlborn102a() --女生第一組 02 位置a
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114710, 780320,34 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn102b() --女生第一組 02 位置b
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114710, 780320,35 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn102c() --女生第一組 02 位置c
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114710, 780320,36 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

--女03---
function Lua_mika_dancefes_girlborn103a() --女生第一組 03 位置a
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114711, 780320,37 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn103b() --女生第一組 03 位置b
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114711, 780320,38 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn103c() --女生第一組 03 位置c
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114711, 780320,39 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

--女04---
function Lua_mika_dancefes_girlborn104a() --女生第一組 04 位置a
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114712, 780320,40 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn104b() --女生第一組 04 位置b
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114712, 780320,41 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end

function Lua_mika_dancefes_girlborn104c() --女生第一組 04 位置c
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114712, 780320,42 ,1) --使用旗子產生 npc 旗子編號 數量 
	SetModeEx( cust    , EM_SetModeType_Strikback, false)--反擊
	SetModeEx( cust    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( cust    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( cust    , EM_SetModeType_Mark, true )--標記
	SetModeEx( cust    , EM_SetModeType_Move, true )--移動
	SetModeEx( cust    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( cust    , EM_SetModeType_HideName, false )--名稱
	SetModeEx( cust , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( cust , EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( cust,RoomID )	--讓物件產生
	BeginPlot (cust, "lua_mika_dancefes_trans", 10) 
end