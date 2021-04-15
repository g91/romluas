function  CheckBuff_501387()
	if CheckBuff( OwnerID() , 501387) == true or CheckBuff( OwnerID() , 508443) == true or CheckBuff( OwnerID() , 508444) == true or CheckBuff( OwnerID() , 508445) == true then	--免除死亡懲罰 
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	else
		return true

	end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_501388()
	if CheckBuff( OwnerID() , 501388) == true  then	--增加50％經驗值 
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	else
		return true
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_501389()
	if CheckBuff( OwnerID() , 501389) == true  then	--抵死術 
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	else
		return true
	end

end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_EXP_Bouns() 
	if CheckBuff( OwnerID() , 501388) == true or CheckBuff( OwnerID() , 501590) == true or  CheckBuff( OwnerID() , 501591) == true or  CheckBuff( OwnerID() , 501643) == true or  CheckBuff( OwnerID() , 501644) == true or CheckBuff( OwnerID() , 502563 ) == true  or CheckBuff( OwnerID() , 504759) == true or CheckBuff( OwnerID() , 504774 ) == true or CheckBuff( OwnerID() , 504775 ) == true or CheckBuff( OwnerID() , 508438 ) == true or CheckBuff( OwnerID() , 508439 ) == true or CheckBuff( OwnerID() , 508441 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	else
		return true
	end

end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_TP_Bouns()

	if CheckBuff( OwnerID() , 501592) == true or  CheckBuff( OwnerID() , 501593) == true or  CheckBuff( OwnerID() , 501594) == true or  CheckBuff( OwnerID() , 501645) == true or  CheckBuff( OwnerID() , 501646) == true or  CheckBuff( OwnerID() , 502674) == true  or  CheckBuff( OwnerID() , 504760) == true or CheckBuff( OwnerID() , 504776 ) == true or CheckBuff( OwnerID() , 504777 ) == true or CheckBuff( OwnerID() , 508442 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_LUCKY_Bouns()
	if CheckBuff( OwnerID() , 501589) == true or  CheckBuff( OwnerID() , 501647) == true or CheckBuff( OwnerID() , 504778) == true or CheckBuff( OwnerID() , 508435) == true or CheckBuff( OwnerID() , 508436) == true or CheckBuff( OwnerID() , 508437) == true or CheckBuff( OwnerID() , 508440) == true then	
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	else
		return true

	end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_EXP_TeamBouns() 

	if CheckBuff( OwnerID() , 501601) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function CheckBuff_Recipe_Rare()	-- 增加生產稀有度

	local Buff = { 508458 , 508459 }	-- 508456 , 508457(非商城，所以不擋)

	for i = 1 , table.getn(Buff) , 1 do
		if CheckBuff( OwnerID() , Buff[i] ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_EFFECT_HAVE") , C_DEFAULT )  -- 物品使用失敗，此效果已存在
			return false
		end
	end
	return true
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function CheckBuff_Recipe_Speed()	-- 增加生產加速

	local Buff = { 508466 , 508467 }	--508465 (非商城，所以不擋)

	for i = 1 , table.getn(Buff) , 1 do
		if CheckBuff( OwnerID() , Buff[i] ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_EFFECT_HAVE") , C_DEFAULT )  -- 物品使用失敗，此效果已存在
			return false
		end
	end
	return true
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_Pumpkin_STRBouns()

	if CheckBuff( OwnerID() , 502192) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_Pumpkin_STABouns()

	if CheckBuff( OwnerID() , 502193) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_Pumpkin_INTBouns()

	if CheckBuff( OwnerID() , 502194) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_Pumpkin_MNDBouns()

	if CheckBuff( OwnerID() , 502195) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_Pumpkin_AGIBouns()

	if CheckBuff( OwnerID() , 502196) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_Pumpkin_ATKBouns()

	if CheckBuff( OwnerID() , 502197) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_Pumpkin_DMGBouns()

	if CheckBuff( OwnerID() , 502198) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_Pumpkin_MATKBouns()

	if CheckBuff( OwnerID() , 502199) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function  CheckBuff_Pumpkin_MDMGBouns()

	if CheckBuff( OwnerID() , 502200) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	
	else

		return true

	end

end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 檢查單個buff是否存在
function CheckBuff_Exist(BuffID)
	if CheckBuff( OwnerID() , BuffID) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	                return false
	else
		return true

	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function CheckBuff_DailyQuest_EXP()
	local Player = OwnerID()
	local BuffList = {624274, 624308}

	if CheckBuff(Player, BuffList[1]) == true or CheckBuff(Player, BuffList[2]) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	      	return false
	else
		return true
	end

end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function CheckBuff_DailyQuest_TP()
	local Player = OwnerID()
	local BuffList = {624275, 624309}

	if CheckBuff(Player, BuffList[1]) == true or CheckBuff(Player, BuffList[2]) == true then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_EFFECT_HAVE"), C_DEFAULT);  -- 物品使用失敗，此效果已存在
	      	return false
	else
		return true
	end
end