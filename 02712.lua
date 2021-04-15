
-- 2013 綵織節獎勵兌換

-- what to do
function lua_mika_weave_reward01()
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local sex = ReadRoleValue(OID, EM_RoleValue_SEX )
	local Status = ReadRoleValue(TID, EM_RoleValue_PID ) -- NPC狀態 , PID為1  = 制作中

	if Status == 1 then
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD_05]" )   -- wait
	else
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD2013_02]" )   -- intro  2013 版本  , SC_WEAVE_REWARD_01  -- 2012 版本
-- 		[$PLAYERNAME]，你好，我是今年才剛成為紡織公會裁縫師的[121054]。身上這套符裝是最近還算滿意的作品，雖然是這樣說，在剪裁技巧上我還需要再待多加把勁啊。如果你對這套服裝有興趣，只要你持有足夠的[241645]或[241646]，我將能為你免費製作一次。
--		聽說中央廣場附近的<CN>[121044]</CN>與城門口附近的<CN>[120888]</CN>及<CN>[121088]</CN>都持有這些材料，如果有興趣就去打聽看看，等你拿到再來找我吧！
--		另外，今年紡織公會準備了內容豐富的禮盒作為給冒險者的回饋，如果你持有[241645]10個別忘了和我兌換喔！

		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD2013_01]" , "lua_mika_weave_reward07" , 0)    --  我想兌換禮盒  SC_WEAVE_REWARD2013_01
		if sex == 0 then   -- 男生

			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231996]]" , "mika_weave_reward_new1(".."1"..")" , 0)    -- 我想製作[$VAR1]  男鞋子
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231997]]" , "mika_weave_reward_new1(".."2"..")" , 0)    -- 我想製作[$VAR1]  男褲子
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231999]]" , "mika_weave_reward_new1(".."3"..")" , 0)    -- 我想製作[$VAR1]  男帽子
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231998]]" , "mika_weave_reward_new1(".."4"..")" , 0)    -- 我想製作[$VAR1]  男服裝
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231996]]" , "lua_mika_weave_reward02" , 0)    -- 我想製作[$VAR1]  男鞋子
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231997]]" , "lua_mika_weave_reward03" , 0)    --  男褲子
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231999]]" , "lua_mika_weave_reward05" , 0)    --  男帽子
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[231998]]" , "lua_mika_weave_reward04" , 0)    --  男服裝
		else  -- 女生
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232000]]" , "mika_weave_reward_new1(".."1"..")" , 0)    -- 我想製作[$VAR1]  男鞋子
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232001]]" , "mika_weave_reward_new1(".."2"..")" , 0)    -- 我想製作[$VAR1]  男褲子
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232003]]" , "mika_weave_reward_new1(".."3"..")" , 0)    -- 我想製作[$VAR1]  男帽子
			AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232002]]" , "mika_weave_reward_new1(".."4"..")" , 0)    -- 我想製作[$VAR1]  男服裝
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232000]]" , "lua_mika_weave_reward02" , 0)    -- 女鞋子
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232001]]" , "lua_mika_weave_reward03" , 0)    -- 女褲子
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232003]]" , "lua_mika_weave_reward05" , 0)    --  女帽子
		--	AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[232002]]" , "lua_mika_weave_reward04" , 0)    -- 女服裝
		end

		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[230763]]" , "mika_weave_reward_new11(".."1"..")" , 0)    --  翅膀1
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[230764]]" , "mika_weave_reward_new11(".."2"..")" , 0)    --  翅膀2
	end
end

-- 新增兌換服裝函式寫法
function mika_weave_reward_new1(number)
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local sex = ReadRoleValue(OID, EM_RoleValue_SEX )
	local item1id = 241645  -- 實用紡織材料包
	local item2id = 241646  -- 女神紡織材料包
	local item1need = { 6, 12, 9, 18 }  -- 酷裝需求 實用紡織材料包 數量  (靴, 褲子, 帽 ,衣服)
	local item2need = { 2, 3, 3, 6 }      -- 酷裝需求 女神紡織材料包 數量  (靴, 褲子, 帽 ,衣服)
	local product_male    =  { 231996, 231997, 231999, 231998 } -- 靴, 褲子, 帽 ,衣服 (男)
	local product_female =  { 232000, 232001, 232003, 232002 } -- 靴, 褲子, 帽 ,衣服 (女)

	-- VAR1 = 製作成品  
	-- VAR2 =  材料1需求數量
	-- VAR3 = 材料2需求數量

	-- 使用<CN>[241645]</CN>製作<CS>[$VAR1]</CS>，需要[241645]<CN>[$VAR2]</CN>個，不過...製作上有一定失敗的風險。
 	-- 如果是用<CG>[241646]</CG>製作的話我保證一定能成功，但需要[241646]<CG>[$VAR3]</CG>個。
 	--那麼，你希望我使用哪一種材料製作啊？ 

	if sex == 0 then   -- 男生
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD_03][$SETVAR1 =".."["..product_male[number].."]".."][$SETVAR2="..item1need[number].."][$SETVAR3="..item2need[number].."]" )
	else  -- 女生
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD_03][$SETVAR1=".."["..product_female[number].."]".."][$SETVAR2="..item1need[number].."][$SETVAR3="..item2need[number].."]" )
	end

	if number == 1 then
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item1id.."]".."]" , "mika_weave_reward_new2(".."11"..")" , 0)    -- 使用[$VAR1]製作  實用
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item2id.."]".."]" , "mika_weave_reward_new2(".."12"..")" , 0)     -- 女神
	elseif number == 2 then
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item1id.."]".."]" , "mika_weave_reward_new2(".."21"..")" , 0)    -- 使用[$VAR1]製作  實用
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item2id.."]".."]" , "mika_weave_reward_new2(".."22"..")" , 0)     -- 女神
	elseif number == 3 then
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item1id.."]".."]" , "mika_weave_reward_new2(".."31"..")" , 0)    -- 使用[$VAR1]製作  實用
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item2id.."]".."]" , "mika_weave_reward_new2(".."32"..")" , 0)     -- 女神
	elseif number == 4 then
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item1id.."]".."]" , "mika_weave_reward_new2(".."41"..")" , 0)    -- 使用[$VAR1]製作  實用
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_04][$SETVAR1=".."["..item2id.."]".."]" , "mika_weave_reward_new2(".."42"..")" , 0)     -- 女神
	end
	AddSpeakOption( OID , OID , "[SO_BACK] " , "lua_mika_weave_reward01" , 0)    -- 返回上一頁
end

function mika_weave_reward_new11(number)
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local item2id = 241646  -- 女神紡織材料包
	local product_wing = { 230763, 230764 }  -- 藍, 紅
	local needcount = 5  -- 需要材料數量

	if number == 1 then
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD2013_03][$SETVAR1=".."["..product_wing[1].."]".."][$SETVAR2="..needcount.."]" )
-- 		你要請我製作<CR>[$VAR1]</CR>嗎？
--		[230763]與[230764]這兩項裝飾品都是我還正在調整的作品，因為製作的過程比較複雜，其實以我現在的技術即使用[241646]製作也還無法保證成功，如果你還是願意讓我試看看，就拿<CS>[241646]</CS>[$VAR2]個交給我吧。
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[230763]]" , "mika_weave_reward_new12(".."1"..")" , 0)    
	elseif number == 2 then
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD2013_03][$SETVAR1=".."["..product_wing[2].."]".."][$SETVAR2="..needcount.."]" )
-- 		你要請我製作<CR>[$VAR1]</CR>嗎？
--		[230763]與[230764]這兩項裝飾品都是我還正在調整的作品，因為製作的過程比較複雜，其實以我現在的技術即使用[241646]製作也還無法保證成功，如果你還是願意讓我試看看，就拿<CS>[241646]</CS>[$VAR2]個交給我吧。
		AddSpeakOption( OID , OID , "[SC_WEAVE_REWARD_02][$SETVAR1=[230764]]" , "mika_weave_reward_new12(".."2"..")" , 0)    
	end
end

function mika_weave_reward_new12(number)
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local sex = ReadRoleValue(OID, EM_RoleValue_SEX )
	local item2id = 241646  -- 女神紡織材料包
	local item2 = CountBodyItem(OID, item2id )  -- 女神紡織材料包
	local needcount = 5  -- 需要材料數量
	local product_wing = { 230763, 230764 }  -- 藍, 紅
	local R = 3
	if number == 1 then  --  藍色
		if item2 < needcount then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			Callplot(OID, "mika_weave_reward_new3", item2id, needcount, R, product_wing[1] )
		end
	elseif number == 2 then  -- 紅色
		if item2 < needcount then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			Callplot(OID, "mika_weave_reward_new3", item2id, needcount, R, product_wing[2] )
		end
	end
end

function mika_weave_reward_new2(number)
	local OID = OwnerID()  --player
	local TID = TargetID()  -- Target
	local sex = ReadRoleValue(OID, EM_RoleValue_SEX )
	local item1id = 241645  -- 實用紡織材料包
	local item2id = 241646  -- 女神紡織材料包
	local item1 = CountBodyItem(OID, item1id )  -- 實用紡織材料包
	local item2 = CountBodyItem(OID, item2id )  -- 女神紡織材料包
	local item1need = { 6, 12, 9, 18 }  -- 酷裝需求 實用紡織材料包 數量  (靴, 褲子, 帽 ,衣服)
	local item2need = { 2, 3, 3, 6 }      -- 酷裝需求 女神紡織材料包 數量  (靴, 褲子, 帽 ,衣服)
	local product_male    =  { 231996, 231997, 231999, 231998 } -- 靴, 褲子, 帽 ,衣服 (男)
	local product_female =  { 232000, 232001, 232003, 232002 } -- 靴, 褲子, 帽 ,衣服 (女)
	local R1 = {35 ,30, 25, 25 }  -- 實用機率 (靴, 褲子, 帽 ,衣服)
	local R2 = {70, 50, 50, 45 }  -- 女神機率  (靴, 褲子, 帽 ,衣服)

	if number == 11 then  -- 實用 - 靴
		if item1 < item1need[1] then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- 男生
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[1], R1[1], product_male[1] )
			else  -- 女生
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[1], R1[1], product_female[1] )
			end
		end
	elseif number == 12 then  -- 女神 - 靴
		if item2 < item2need[1] then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- 男生
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[1], R2[1], product_male[1] )
			else  -- 女生
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[1], R2[1], product_female[1] )
			end
		end
	elseif number == 21 then  -- 實用 - 褲
		if item1 < item1need[2] then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- 男生
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[2], R1[2], product_male[2] )
			else  -- 女生
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[2], R1[2], product_female[2] )
			end
		end
	elseif number == 22 then  -- 女神 - 褲
		if item2 < item2need[2] then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- 男生
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[2], R2[2], product_male[2] )
			else  -- 女生
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[2], R2[2], product_female[2] )
			end
		end
	elseif number == 31 then   -- 實用 - 帽
		if item1 < item1need[3] then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- 男生
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[3], R1[3], product_male[3] )
			else  -- 女生
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[3], R1[3], product_female[3] )
			end
		end
	elseif number == 32 then  -- 女神 - 帽
		if item2 < item2need[3] then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- 男生
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[3], R2[3], product_male[3] )
			else  -- 女生
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[3], R2[3], product_female[3] )
			end
		end
	elseif number == 41 then  -- 實用 - 上衣
		if item1 < item1need[4] then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- 男生
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[4], R1[4], product_male[4] )
			else  -- 女生
				Callplot(OID, "mika_weave_reward_new3", item1id, item1need[4], R1[4], product_female[4] )
			end
		end
	elseif number == 42 then  -- 女神 - 上衣
		if item2 < item2need[4] then -- 數量不夠 
			SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		else	
			CloseSpeak(OID)
			WriteRoleValue(OID , EM_RoleValue_Register , TID )
			if sex == 0 then  -- 男生
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[4], R2[4], product_male[4] )
			else  -- 女生
				Callplot(OID, "mika_weave_reward_new3", item2id, item2need[4], R2[4], product_female[4] )
			end
		end
	end
end

function mika_weave_reward_new3(itemid, needcount, rate, productid )  -- 材料ID, 需求材料數量, 機率,  成品ID
	local OID = OwnerID()  --player
	local NPC = ReadRoleValue(OID, EM_RoleValue_Register )  -- NPC
	local RR =Rand(100)+1 
--	say(OID, "OID")
--	say(NPC, "NPC")
--	say(OID, "itemid = "..itemid..", needcount = "..needcount..",  rate = "..rate..", productid = "..productid )

	DelBodyItem(OID, itemid, needcount )  -- 刪除材料

	if RR>= ( 100 - rate ) then -- 成功
		Tell(OID, NPC,  "[SC_WEAVE_REWARD_07]") -- 呼，終於順利完成了，希望你會喜歡。
		GiveBodyItem(OID, productid, 1)  
		DesignLog( OID , 1210541 , "2013 weave festival suit success, id ="..productid )  -- 製作服裝成功, 服裝id
	else -- 失敗
		Tell(OID, NPC, "[SC_WEAVE_REWARD_08]")  -- 噢不…這次的製作好像…不太順利…的樣子。抱歉，這樣東西就送給你作為補償吧。
		GiveBodyItem(OID, 726119, 1)  -- 失敗時掉寶  726119  -- 2013 失敗獎勵表
		DesignLog( OID , 1210542 , "2013 weave festival suit fail, id ="..productid )  -- 製作服裝失敗, 服裝id
	end

end

-- 2013新增 兌換獎勵 
function lua_mika_weave_reward07()
	local OID = OwnerID()  --player
	local item1id = 241645  -- 實用紡織材料包
	local needcount = 10
	local boxid = 242703

	if CountBodyItem(OID, item1id) < needcount then -- 數量不夠 
		SetSpeakDetail( OID , "[SC_WEAVE_REWARD_06] " )   --  你所持的材料數量不足喔！
		AddSpeakOption( OID , OID , "[SO_BACK] " , "lua_mika_weave_reward01" , 0)    -- 返回上一頁
	else	
		CloseSpeak(OID)
		DelBodyItem(OID, item1id, needcount )
		GiveBodyItem(OID, boxid, 1)
		DesignLog( OID , 121054 , "2013 weave festival reward get count. ")  -- 兌換獎勵次數

	end
end


---- 測試指令  (測試翅膀機率 1,  = 藍 , 2 = 紅 , 測試機率為20%)
function mika_weave_reward_newtest(number)   -- 材料ID, 需求材料數量, 機率,  成品ID
	local OID = OwnerID()  --player

	local item2id = 241646  -- 女神紡織材料包
	local product_wing = { 230763, 230764 }  -- 藍, 紅
	local needcount = 5  -- 需要材料數量
	local rate = 20 -- 測試用機率
	local RR =Rand(100)+1 

	DelBodyItem(OID, item2id, needcount )  -- 刪除材料

	if RR>= ( 100 - rate ) then -- 成功
		GiveBodyItem(OID, product_wing[number], 1)  
	else -- 失敗

		GiveBodyItem(OID, 726119, 1)  -- 失敗時掉寶  726119  -- 2013 失敗獎勵表
	end

end