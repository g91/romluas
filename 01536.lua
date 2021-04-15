--啤酒節舉辦人 
--月光柚
function Lua_mika_Bearfestval_moon()
	SetFlag( TargetID() , 543324 , 1 ) --完成任務後給flag
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Bearfestval_serve()
	PlayMotion( TargetID(), 118) --Cast表演
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_01]"   )  --要來喝杯美味的啤酒嗎？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_02]" , "Lua_mika_Beerfestval_about", 0 ) --我想知道啤酒節的由來。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_03]" , "Lua_mika_Beerfestval_01", 0 ) --關於 月光柚啤酒DIY
--	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_04]" , "Lua_mika_Beerfestval_02", 0 ) --關於 一同享用美酒吧
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_05]" , "Lua_mika_Beerfestval_03", 0 ) --關於 啤酒大師
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_06]" , "Lua_mika_Beerfestval_04", 0 ) --關於 服務生的一天
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_29]" , "Lua_mika_Beerfestval_05", 0 ) --我想兌換獎勵

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
	if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_53]" , "Lua_mika_Beerfestval_07", 0 ) --我想兌換[205943]
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_about() -- 我想知道啤酒節的由來。
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07]"   )  --活動內容說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_111490_DIALOG7_2]" , "Lua_mika_Beerfestval_06", 0 ) --然後呢
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_06() -- 我想知道啤酒節的由來。
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07_01]"   )  --活動內容說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_07() -- 我想兌換[205943]
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_54]"   )  --活動內容說明
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_55]" , "Lua_mika_Beerfestval_ticket01", 0 ) --我要用<CB>100個[205891]</CB>與<CB>100個[205892]</CB>兌換
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_56]" , "Lua_mika_Beerfestval_ticket02", 0 ) --我要用<CB>1個[202904]</CB>兌換
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_ticket01()  --我要用100個柚子與100個啤酒酵母粉兌換
	local item1 = CountBodyItem(OwnerID(), 205891 ) 
	local item2 = CountBodyItem(OwnerID(), 205892 ) 
	if item1 >= 100 and item2 >= 100 then
		DelBodyItem( OwnerID(), 205891, 100)
		DelBodyItem( OwnerID(), 205892, 100)
		GiveBodyItem( OwnerID(), 205943, 2)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_57]"   )  --成功兌換後
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_07", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  --不足
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_07", 0 ) --回到上一層
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_ticket02()  --我要用<CB>1個[202904]</CB>兌換
	local item1 = CountBodyItem(OwnerID(), 202904 ) 
	if item1 >= 1 then
		DelBodyItem( OwnerID(), 202904, 1)
		GiveBodyItem( OwnerID(), 205943, 2)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_57]"   )  --成功兌換後
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_07", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )  --不足
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_07", 0 ) --回到上一層
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_01() --關於 月光柚啤酒DIY
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT01]"   )  --活動內容說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_02() --關於 一同享用美酒吧
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT02]"   )  --活動內容說明
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_10]" , "Lua_mika_Beerfestval_beer", 0 ) --請給我5瓶特調啤酒。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_03() --關於 啤酒大師
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT03]"   )  --活動內容說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_04() --關於 服務生的一天
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_ACT04]"   )  --活動內容說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_05() --我想兌換獎勵
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_31]"   )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_BEERDAY_32]" , "Lua_mika_Bearfestval_reward", 0 ) --我想兌換獎勵
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Bearfestval_serve", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_mika_Bearfestval_reward()
--	local ticket = CountBodyItem(OwnerID(), 205941) --啤酒節活動參加券
--	local rewardid =  242091  -- 2013 兌換獎勵物品id	
--	local starpetid = 242520   --  2013 新增 土之元素材料包
--	local starpetid2 = 241459  -- 2013 新增 處女幻獸結晶
----	if ticket >= 20 then
--	if ticket >= 15 then	--2013 修改為15張
--	--	GiveBodyItem(OwnerID(), 205942 , 1) --啤酒節桶裝禮盒
--		----------- 取得物品 1  ----------- 
--		GiveBodyItem(OwnerID(), rewardid , 1)  ----2013修改為把酒狂歡禮盒
--		----------- 取得物品 2  ----------- 
--		GiveBodyItem(OwnerID(), starpetid , 1) 
--		----------- 取得物品 3  ----------- 
--		local R = Rand(100)+1
--		if R >= 98 then  -- 3%機率
--			GiveBodyItem(OwnerID(), starpetid2 , 1)   -- 幻獸結晶
--		end
--		DelBodyItem(OwnerID(), 205941 , 15) --啤酒節活動參加券
--		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_33]"   )  
--		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_05", 0 ) --回到上一層
--	else
--		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_34]"   )   --數量不足
--		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_05", 0 ) --回到上一層
--	end
--end
----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_Beerfestval_beer() -- 請給我5瓶特調啤酒
	local Beer = CheckFlag(OwnerID()  , 543321) -- 今天領過
	if Beer == true then --已經領過
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_08]"   )  --今天已經拿過了
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_02", 0 ) --回到上一層
	else
		GiveBodyItem(OwnerID(), 205894 , 5 ) --特調啤酒x5
		SetFlag( OwnerID() , 543321 , 1 )
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_09]"   )  --快和朋友們一同共飲狂歡吧。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_Beerfestval_02", 0 ) --回到上一層
	end
end