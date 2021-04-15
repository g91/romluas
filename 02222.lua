--廠商活動 德國2周年 獎勵兌換NPC
------------------------------------------------------------------------------
function Lua_mika_de2y_reward01()  --兌換npc初始劇情
	SetSpeakDetail( OwnerID(), "[SC_GE2_2011_REWARD01]" )--初始對話
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GE2_2011_REWARD02]" , "Lua_mika_de2y_reward02", 0 ) --我想兌換[206841]
end

-- 5.0.9 四周年更新獎勵掉寶id
function Lua_mika_de2y_reward02()  --兌換獎勵
	local rewardid = 726943  -- 獎勵兌換掉寶id
	local ticketid = 209561  -- 兌換需求物品 - 歡慶青蛙憑證
	local needcount = 7  -- 需求物品數量
	local Language = GetServerDataLanguage() --6.0.1 台版周年慶，新增語系判斷星座寵物相關物品

	local item = CountBodyItem( OwnerID(), ticketid )  -- 檢查是否有 歡慶青蛙憑證
	if item >= needcount then  --
		CloseSpeak( OwnerID())
		DesignLog( OwnerID() , 114943 , " 4 years event - reward change" )
		GiveBodyItem( OwnerID(), rewardid , 1 )  --給兌換掉寶
		GiveBodyItem(OwnerID(), 241480, 20 )  -- 深海元素(241480) x20個
		local RR = Rand(100)+1
		if RR >= 98 then 
		--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
			if Language ~= "tw" then --不是台版的話
				GiveBodyItem( OwnerID(), 241453 , 1 )  --3%機率獲得雙魚幻獸結晶(241453)
			else
				GiveBodyItem( OwnerID(), 241461 , 1 ) 	 -- 台版給予 天蠍幻獸結晶(241461)
			end
		end
		DelBodyItem( OwnerID(), ticketid , 7 ) --扣 歡慶青蛙憑證
	--	Say( OwnerID() , "RR = "..RR)
	else 
		SetSpeakDetail( OwnerID(), "[SC_0908SEANSON_26]" )--你所持的物品數量不足。
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_de2y_reward01", 0 ) --回到上一層
	end		
end
-------------------------------------------------------------------------
function Lua_mika_de2y_givekey1()  -- 青蛙王子召喚 每日給予keyitem 
	Setflag(OwnerID(), 544725, 1 )
	AddBuff(OwnerID(), 509656, 0,7200)
--	Say(OwnerID(), "Give key ")
end

function Lua_mika_208739check() -- 青蛙王子寵物蛋check
	if CheckFlag( OwnerID()  , 544725 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_PETSP_TODAY]", C_SYSTEM )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PETSP_TODAY]", C_SYSTEM )
		return false
	else
		return true
	end
End