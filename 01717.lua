--產生男性參加者
function lua_mika_dancefes_dancerborn1() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC1位置1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn101a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC1位置2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn101b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC1位置3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn101c", 10) 
	end
end

function lua_mika_dancefes_dancerborn2() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC2位置1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn102a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC2位置2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn102b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC2位置3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn102c", 10) 
	end
end

function lua_mika_dancefes_dancerborn3() 
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC3位置1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn103a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC3位置2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn103b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC3位置3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn103c", 10) 
	end
end

function lua_mika_dancefes_dancerborn4()
	local PP = 100
	local Y = Rand( PP )    
	if Y >= 0 and Y <= 30  then   -- NPC4位置1
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS1")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn104a", 10) 
	elseif Y >= 31 and Y <=70  then    -- NPC4位置2
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS2")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn104b", 10) 
	elseif Y >= 71 and Y <=100  then    -- NPC4位置3
		Say(OwnerID(), Y)
		Say(OwnerID(), "POS3")
		BeginPlot (OwnerID(), "Lua_mika_dancefes_manborn104c", 10) 
	end 
end

--男01---
function Lua_mika_dancefes_manborn101a() --男生第一組 01 位置a
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114713, 780320,1 ,1) --使用旗子產生 npc 旗子編號 數量 
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

function Lua_mika_dancefes_manborn101b() --男生第一組 01 位置b
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114713, 780320,2 ,1) --使用旗子產生 npc 旗子編號 數量 
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

function Lua_mika_dancefes_manborn101c() --男生第一組 01 位置c
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114713, 780320,3 ,1) --使用旗子產生 npc 旗子編號 數量 
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

--男02---
function Lua_mika_dancefes_manborn102a() --男生第一組 02 位置a
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114714, 780320,4 ,1) --使用旗子產生 npc 旗子編號 數量 
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

function Lua_mika_dancefes_manborn102b() --男生第一組 02 位置b
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114714, 780320,5 ,1) --使用旗子產生 npc 旗子編號 數量 
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

function Lua_mika_dancefes_manborn102c() --男生第一組 02 位置c
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114714, 780320,6 ,1) --使用旗子產生 npc 旗子編號 數量 
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

--男03---
function Lua_mika_dancefes_manborn103a() --男生第一組 03 位置a
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114715, 780320,7 ,1) --使用旗子產生 npc 旗子編號 數量 
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

function Lua_mika_dancefes_manborn103b() --男生第一組 03 位置b
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114715, 780320,8 ,1) --使用旗子產生 npc 旗子編號 數量 
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

function Lua_mika_dancefes_manborn103c() --男生第一組 03 位置c
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114715, 780320,9 ,1) --使用旗子產生 npc 旗子編號 數量 
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

--男04---
function Lua_mika_dancefes_manborn104a() --男生第一組 04 位置a
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114716, 780320,10 ,1) --使用旗子產生 npc 旗子編號 數量 
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

function Lua_mika_dancefes_manborn104b() --男生第一組 04 位置b
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114716, 780320,11 ,1) --使用旗子產生 npc 旗子編號 數量 
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

function Lua_mika_dancefes_manborn104c() --男生第一組 04 位置c
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	cust = CreateObjByFlag(114716, 780320,12 ,1) --使用旗子產生 npc 旗子編號 數量 
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