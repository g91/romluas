--物品 208289 鶴鴕飼料 
function LuaI_208289_Check()  --檢查使用此物品時所在區域(掛在物品使用檢查)
	local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- 自己的zone id
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
--	Say(OwnerID(), MyZoneID)
--	Say(OwnerID(), MyZone)

	if MyZoneID ~= 15 or MyZone ~= 15 then --如果不在15
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_THANKSGIVING_2010_01]" , 0 )	--畫面中間訊息  此物品僅能在雷蹄之丘區域使用。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_THANKSGIVING_2010_01]" , 0 )	--訊息欄
		return false
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_THANKSGIVING_2010_02]" , 0 )	--畫面中間訊息  你擺放了[208289]，引誘[116038]前來覓食吧。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_THANKSGIVING_2010_02]" , 0 )	--訊息欄
		return true
	end
end

function Lua_mika_thankday_putfood() -- 擺放鶴鴕食物  (掛在物品的基本法術)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 116039, BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件 116039 鶴鴕吃的食物
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
	Beginplot( NPC, "Lua_mika_thankday_fooddie" , 0 )
	sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END )
end

function Lua_mika_thankday_fooddie()
--	say(OwnerID(), "YA")
	sleep(3000)  -- 食物產生後消失時間 5分鐘
	Delobj(OwnerID())
end


-------------------------------------------------
--物品-208288 羽毛收集盒
function LuaI_208288_Check()  --檢查物品使用對象(掛在物品使用檢查)
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 116038 --金色鶴鴕

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_03") , 0 )	--此物品僅只能對金色鶴鴕使用。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_03") , 0 )	--此物品僅只能對金色鶴鴕使用。
		return false	
	else
		if Checkbuff(TargetID(), 507707 ) == false then -- 如果對象沒有"進食中buff"
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_11") , 0 )	--[116038]靈敏地逃脫了你的捕捉。
			ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_11") , 0 )	--[116038]靈敏地逃脫了你的捕捉。
			return false
		end
	end
end

function LuaI_208288_Effect()   --機率判定 
--OwnerID為玩家
--TargetID為鶴鴕
	local random = rand(100)
	if random >65 then  -- 抓到 機率為35%
		BeginPlot( OwnerID() , "LuaI_208288_Delitem" , 10 )  
	else --抓不到  65%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_04") , 0 )	--摘取羽毛失敗，再試試看吧！
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_04") , 0 )	--摘取羽毛失敗，再試試看吧！
	end
end

function LuaI_208288_Delitem()   --成功抓回        
--Owner 與 Target皆為玩家
	local bird = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116038, 50 , 0) 
--	Say(bird, "bird.")  
	local random = rand(100)
	if random >10 then  --  機率為90%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_06") , C_SYSTEM )	--你獲得了[208291]！
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_06") , C_SYSTEM )	--你獲得了[208291]！
		GiveBodyItem( OwnerID() , 208291 , 1)	--給予 鶴鴕羽毛
	else --機率為10%
		local random2 = rand(100)
		if random2 >5 then  --  機率為95%
			ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_THANKSGIVING_2010_05][$SETVAR1=[208290]]" , C_SYSTEM )  --你獲得了稀有的[$VAR1]！
			ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_THANKSGIVING_2010_05][$SETVAR1=[208290]]" , C_SYSTEM )  --你獲得了稀有的[$VAR1]！
			GiveBodyItem( OwnerID() , 208290 , 1)	--給予 金色之羽
		else  --機率為5%
			ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_THANKSGIVING_2010_05][$SETVAR1=[208293]]" , C_SYSTEM )  --你獲得了稀有的[$VAR1]！
			ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_THANKSGIVING_2010_05][$SETVAR1=[208293]]" , C_SYSTEM )  --你獲得了稀有的[$VAR1]！
			GiveBodyItem( OwnerID() , 208293 , 1)	--給予 太陽之羽
		end
	end
	local time = ReadRoleValue(bird , EM_RoleValue_Register ) --鶴鴕的register
--	Say(bird, time )
	AddRoleValue(bird , EM_RoleValue_Register, 1 )   --次數+1
	local time = ReadRoleValue( bird, EM_RoleValue_Register ) --鶴鴕的register
--	Say(bird, time )
	-- 目標鶴鴕持有進食buff時 成功摘取5次羽毛後 會刪除進食buff
	if time >= 5 then
		Cancelbuff(bird, 507707)
	--	Say(bird, "buff clear" )
		WriteRoleValue(bird , EM_RoleValue_Register, 0 )   --次數歸零
		local time = ReadRoleValue( bird, EM_RoleValue_Register ) --鶴鴕的register
	--	Say(bird, time )
		Beginplot(bird, "Lua_mika_thankday_runaway", 10 )  --鶴鴕
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_THANKSGIVING_2010_13]" , C_SYSTEM )  --[116038]受到了驚嚇，轉身逃走了！
		ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_THANKSGIVING_2010_13]" , C_SYSTEM )  --[116038]受到了驚嚇，轉身逃走了！
	end
end

function Lua_mika_thankday_runaway()  --鶴鴕逃走+消失一陣子
--OwnerID為鶴鴕
--	Say(OwnerID(), "owner")
	local Player = SearchRangePlayer( OwnerID() , 60) --判斷附近是否有玩家
	if CheckID( Player[0] ) == true then	--如果附近XX內有玩家
		Npcsay(OwnerID(), "[SC_THANKSGIVING_2010_10]" )  --鶴鴕說話	
		AdjustFaceDir(OwnerID(), Player[0] , 180 ) --面向 背對
		WriteRoleValue( OwnerID()  ,EM_RoleValue_IsWalk , 0  )--用跑的
		sleep(5)
		Lua_MoveLine( OwnerID() , 30 ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
		sleep(10)
		Hide( OwnerID() )
		sleep(3000) -- x秒後出現 300sec
		Show( OwnerID(), 0 ) 
	end
end
---------------------------------------------------------
--金色羽毛 208290 

-- 使用金色羽毛 208290 召喚鶴鴕
function luaI_208290_effect() 
	local random = rand(100)
	if random > 30 then  --  成功機率為70%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_07") , C_SYSTEM )	--恭喜你成功召喚了鶴鴕坐騎！
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_07") , C_SYSTEM )	--恭喜你成功召喚了鶴鴕坐騎！
		BeginPlot( OwnerID() , "luaI_208290_Summon" , 10 )  
	else  -- 失敗機率 30%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_08") , C_SYSTEM )	--看來鶴鴕沒有聽到你的呼喚...。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_08") , C_SYSTEM )	--看來鶴鴕沒有聽到你的呼喚...。
	end
end

--召喚鶴鴕坐騎
function luaI_208290_Summon()
	local random = rand(100)
	if random <= 5 then  --  5%  猛禽鶴鴕
		BeginPlot( OwnerID() , "LuaI_208290_Summon01" , 0 )  
	elseif random >= 6 and random <= 10 then ------5% 紫冠鶴鴕
		BeginPlot( OwnerID() , "LuaI_208290_Summon02" , 0 )  
	elseif random >= 11 and random <= 45 then ------35% 金色鶴鴕
		BeginPlot( OwnerID() , "LuaI_208290_Summon03" , 0 )  
	elseif random >= 46 then ----55% 血鶴鴕
		BeginPlot( OwnerID() , "LuaI_208290_Summon04" , 0 )  
	end
end

function luaI_208290_Summon01()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	--猛禽鶴鴕
	local NPC = CreateObj( 101821, BaseX-20, BaseY-12, BaseZ, BaseDir+180, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件  
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
	PlayMotion( NPC, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --動作
	Npcsay(NPC, "[SC_THANKSGIVING_2010_09]" )  --鶴鴕說話
	sleep(20)  -- 產生後消失時間 6sec
	Delobj(NPC)
	sleep(10)
	--猛禽鶴鴕
	CastSpell( OwnerID(), OwnerID(), 496080 )
end 

function luaI_208290_Summon02()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	--紫冠鶴鴕
	local NPC = CreateObj( 102871, BaseX-20, BaseY-12, BaseZ, BaseDir+180, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件  
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
	PlayMotion( NPC, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --動作
	Npcsay(NPC, "[SC_THANKSGIVING_2010_09]" )  --鶴鴕說話
	sleep(20)  -- 產生後消失時間 6sec
	Delobj(NPC)
	sleep(10)
	--紫冠鶴鴕
	CastSpell( OwnerID(), OwnerID(), 496079 )
end 

function luaI_208290_Summon03()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	--金色鶴鴕
	local NPC = CreateObj( 100719, BaseX-20, BaseY-12, BaseZ, BaseDir+180, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件  
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
	PlayMotion( NPC, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --動作
	Npcsay(NPC, "[SC_THANKSGIVING_2010_09]" )  --鶴鴕說話
	sleep(20)  -- 產生後消失時間 6sec
	Delobj(NPC)
	sleep(10)
	--騎乘金色鶴鴕
	CastSpell( OwnerID(), OwnerID(), 496078 )
end 

function luaI_208290_Summon04()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	--血鶴鴕
	local NPC = CreateObj( 100718, BaseX-20, BaseY-12, BaseZ, BaseDir+180, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件  
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
	PlayMotion( NPC, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --動作
	Npcsay(NPC, "[SC_THANKSGIVING_2010_09]" )  --鶴鴕說話
	sleep(20)  -- 產生後消失時間 6sec
	Delobj(NPC)
	sleep(10)
	--騎乘血鶴鴕
	CastSpell( OwnerID(), OwnerID(), 496077 )
end 
----------------------------------------------------

function Lua_thankday_reset()  --祈願節活動重置券 使用

	local Player = OwnerID()
	SetFlag( Player , 543288, 0)  --肉桂葉
	SetFlag( Player , 543463, 0)  --徵收
	SetFlag( Player , 544418, 0)  --當天領過飼料
	SetFlag( Player , 544560, 0)  --羽毛任務
	SetFlag( Player , 545689 , 0)  --盡情閃躲吧
	SetFlag( Player , 546069 , 0)  --遺失的鶴鴕蛋
	SetFlag( Player , 546091 , 0 ) --每日判定用
	-- 偷蛋小賊
	SetFlag(Player,547130,0)--活動結束
	SetFlag(Player,547131,0)--領取獎勵
	SetFlag(Player,547132,0)--淘汰記號
	SetFlag(Player,547133,0)--離線旗標
	SetFlag(Player,547139,0)--資格證
	BeginPlot ( Player ,"Lua_jiyi_thanks_test",0)
	BeginPlot ( Player ,"lua_kors_thank_RE" , 0)
--	BeginPlot( Player, "Lua_nehelia_thanks_re" , 0 ) --跑腿任務
	ScriptMessage( Player ,  Player, 1, "[SC_THANKSGIVING_2010_12]" , C_SYSTEM )  --你現在可以重新進行所有啤酒節活動囉！
	ScriptMessage( Player ,  Player, 0, "[SC_THANKSGIVING_2010_12]" , C_SYSTEM )  --你現在可以重新進行所有啤酒節活動囉！
end
--------------------------------------------------------------------------
function Lua_nehelia_thanks_re()

	local Player = OwnerID()
	local Quest = { 425092 , 425093 , 425098 , 425099 , 425100 , 425161 }
	SetFlag( Player , 546060 , 0 ) --幫忙瘋癲的廚師
	SetFlag( Player , 546061 , 0 ) --放棄獎勵，幫忙安諾拉夫
	SetFlag( Player , 546062 , 0 ) --放棄獎勵，幫忙傑爾特
	SetFlag( Player , 546063 , 0 ) --放棄獎勵，幫忙瑪瑞安
	SetFlag( Player , 546084 , 0 ) --放棄獎勵，幫忙伊恩
	SetFlag( Player , 546091 , 0 ) --每日判定用
	SetFlag( Player , 546101 , 0 ) --每日任務

	for i = 1 , #Quest , 1 do
		if CheckAcceptQuest( Player , Quest[i] ) == true then
			DeleteQuest( Player , Quest[i] )
		end
	end
end