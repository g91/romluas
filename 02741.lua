--奈：2012新增 zone 15/21 兩處獎勵兌換NPC/重置券兌換NPC
function Lua_mika_Bearfestval_serve02()  
	PlayMotion( TargetID(), 118) --Cast表演
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_01]"   )  --要來喝杯美味的啤酒嗎？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_02]" , "Lua_mika_Beerfestval_about1", 0 ) --我想知道啤酒節的由來。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_29]" , "Lua_mika_Beerfestval_051", 0 ) --我想兌換獎勵
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_53]" , "Lua_mika_Beerfestval_071", 0 ) --我想兌換[205943]
end

--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_about1() -- 我想知道啤酒節的由來。
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07]"   )  --活動內容說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_111490_DIALOG7_2]" , "Lua_mika_Beerfestval_061", 0 ) --然後呢
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_061() -- 我想知道啤酒節的由來。
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07_01]"   )  --活動內容說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve02", 0 ) --回到上一層
end

--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_051() --我想兌換獎勵
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_31]"   )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_BEERDAY_32]" , "Lua_mika_Bearfestval_reward", 0 ) --我想兌換獎勵
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve02", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_071() -- 我想兌換[205943]
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_54]"   )  --活動內容說明
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_55]" , "Lua_mika_Beerfestval_ticket011", 0 ) --我要用<CB>100個[205891]</CB>與<CB>100個[205892]</CB>兌換
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_56]" , "Lua_mika_Beerfestval_ticket021", 0 ) --我要用<CB>1個[202904]</CB>兌換
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve02", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------

function Lua_mika_Beerfestval_ticket011()  --我要用100個柚子與100個啤酒酵母粉兌換
	local item1 = CountBodyItem(OwnerID(), 205891 ) 
	local item2 = CountBodyItem(OwnerID(), 205892 ) 
	if item1 >= 100 and item2 >= 100 then
		DelBodyItem( OwnerID(), 205891, 100)
		DelBodyItem( OwnerID(), 205892, 100)
		GiveBodyItem( OwnerID(), 205943, 2)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_57]"   )  --成功兌換後
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_071", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  --不足
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_071", 0 ) --回到上一層
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_ticket021()  --我要用<CB>1個[202904]</CB>兌換
	local item1 = CountBodyItem(OwnerID(), 202904 ) 
	if item1 >= 1 then
		DelBodyItem( OwnerID(), 202904, 1)
		GiveBodyItem( OwnerID(), 205943, 2)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_57]"   )  --成功兌換後
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_071", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  --不足
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_071", 0 ) --回到上一層
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------

-- 2013 6.0.4 獎勵兌換調整
function Lua_mika_Bearfestval_reward()
	local ticket = CountBodyItem(OwnerID(), 205941) --啤酒節活動參加券
	local need = 15  -- 2013年調降兌換需求, 原本是20個
	local rewardid =  242091  -- 2013 兌換獎勵物品id	
	local starpetid = 242520   --  2013 新增 土之元素材料包
	local starpetid2 = 241459  -- 2013 新增 處女幻獸結晶

	if ticket >= need then
		DelBodyItem(OwnerID(), 205941 , need ) --啤酒節活動參加券
		----------- 取得物品 1  ----------- 
		GiveBodyItem(OwnerID(), rewardid , 1) 
		----------- 取得物品 2  ----------- 
		GiveBodyItem(OwnerID(), starpetid , 1) 
		----------- 取得物品 3  ----------- 
		local R = Rand(100)+1
		if R >= 98 then  -- 3%機率
			GiveBodyItem(OwnerID(), starpetid2 , 1)   -- 幻獸結晶
		end

		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_33]"   )  
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_051", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )   --數量不足
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_051", 0 ) --回到上一層
	end
end