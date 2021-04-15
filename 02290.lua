
-- 日本廠商活動 BLOOD-C Tie-up 活動

-- 活動獎勵禮包開啟
function lua_mika_jpbloodc_bag01()
	local OID = OwnerID()
	local ItemID = 720033
	GiveBodyItem(OID, ItemID, 1 )
end


function lua_mika_jpbloodc_bag02()
	local OID = OwnerID()
	local ItemID = 720034
	GiveBodyItem(OID, ItemID, 1 )
end

function lua_mika_jpbloodc_bag03()
	local OID = OwnerID()
	local ItemID = 720035
	GiveBodyItem(OID, ItemID, 1 )
end


-- 日本廠商活動  BLOOD-C Tie-up 活動

-- 掛在相關怪物死亡劇情上
--玩家擊殺怪物後, 對自己施法獲得buff lv +1 (用顯示法術)
function lua_mika_jpbloodc_score()
	local OID = OwnerID()  -- monster 
	local TID = TargetID()   -- Player

	BeginPlot(TID, "lua_mika_jpbloodc_score2" , 0)
end

function lua_mika_jpbloodc_score2()
	local OID = OwnerID()  -- player

	CastSpell(OID, OID, 499652 )  --  獲得擊殺BUFF  , 擊殺次數  507607
--	Say(OID, "Kill 1")
end

-- 測試用基本法術 執行劇情 取消無敵
function lua_mika_jpbloodc_test01()
	local TID = TargetID()
	CancelBuff(TID, 507610 )  -- 清除Buff
	say(TID, "del Buff")
end

-- 讓OID上無法被治療的buff
function lua_mika_jpbloodc_test02()
	local OID = OwnerID()
	AddBuff(OID, 507609, 0,  -1 )   
end

-- 放在活動buff每2秒檢查與中控器range  
function lua_mika_jpbloodc_rangecheck()
	local OID = OwnerID()
	local timer = 0
	local limittime = 1200  -- 20分
	local range = 350
	
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 119567 , range+200 , 0 ) --以物件-為中心，向周圍N碼搜尋特定IDNPC
	local dis = GetDistance(OID, NPC )
--	say(OID, "Test - dis ="..dis)

	if  dis >= range then  -- 超過0 
		ScriptMessage( OID , OID , 1 , "[SC_BLOODC_MSG02]" , 0 )   --你已放棄協助[103019]。
		ScriptMessage( OID , OID , 0 , "[SC_BLOODC_MSG02]" , 0 )   
		CancelBuff(OID , 507607 )  -- Del 活動技能buff
	elseif dis >= (range-80) then
		ScriptMessage( OID , OID , 1 , "[SC_BLOODC_MSG01]" , 0 )   -- 你即將離開此地，放棄協助[103019]！
		ScriptMessage( OID , OID , 0 , "[SC_BLOODC_MSG01]" , 0 )   
	end

end

--function lua_mika_testmsg_0830()
--	local OID = OwnerID()
--	ScriptMessage( OID, 0, 2 , "123abc" , C_SYSTEM )
--end