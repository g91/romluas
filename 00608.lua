-- 巧藝節-特殊材料販售商人

--                      物品名稱   物品ID   當天產量
-- shop01 烹飪 特選香菇	240066  1000
-- shop02 煉金 大萬靈藥	240067  1000
-- shop03 裁縫 高級緞帶	240068  300
-- shop04 製甲 白銀鐵礦	240069  300
-- shop05 木工 氣息之木	240070  100
-- shop06 打鐵 熔巖晶鐵	240071  100


--- 共用 -----------------------
function lua_mika_skillcraft_shop_intro()  -- 特殊材料介紹
	SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP05]"   )   -- 你好，冒險者，有看過像我手上這種特殊的製作材料嗎？ (略)
end
 ----------------------

--- 更新每天數量 -----------------------

-- 每天 1000的  ( 烹飪, 煉金)
function lua_mika_skillcraft_shop_count1()
	local count_day = 1000   -- 此項物品當天npc提供量
	WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- 重新執行時 補充提供量
	local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --現在R值量
--	Say(OwnerID(), count_now )

	while true do
		local hour = GetSystime(1)
		local min = GetSystime(2)
		local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --現在R值量
--		Say(OwnerID(), count_now )
--		Say(OwnerID(), hour..":"..min )
		
		if hour == 06 and min == 00 then 
			WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- 重新執行時 補充提供量
			local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --現在R值量
	--		Say(OwnerID(), "reset" )
	--		Say(OwnerID(), count_now )
		end

		if count_now < 0 then
			WriteRoleValue(OwnerID(), EM_RoleValue_Register , 0 )
		end

		sleep(50)  --5SEC
	end
end

-- 每天 300的  ( 裁縫, 製甲)
function lua_mika_skillcraft_shop_count2()
	local count_day = 300   -- 此項物品當天npc提供量
	WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- 重新執行時 補充提供量
	local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --現在R值量
--	Say(OwnerID(), count_now )

	while true do
		local hour = GetSystime(1)
		local min = GetSystime(2)
		local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --現在R值量
--		Say(OwnerID(), count_now )
--		Say(OwnerID(), hour..":"..min )
		
		if hour == 06 and min == 00 then 
			WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- 重新執行時 補充提供量
			local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --現在R值量
		--	Say(OwnerID(), "reset" )
		--	Say(OwnerID(), count_now )
		end

		if count_now < 0 then
			WriteRoleValue(OwnerID(), EM_RoleValue_Register , 0 )
		end

		sleep(50)  --5SEC

	end
end

-- 每天 100的  ( 打鐵, 木工)
function lua_mika_skillcraft_shop_count3()
	local count_day = 100   -- 此項物品當天npc提供量
	WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- 重新執行時 補充提供量
	local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --現在R值量
--	Say(OwnerID(), count_now )

	while true do
		local hour = GetSystime(1)
		local min = GetSystime(2)
		local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --現在R值量
--		Say(OwnerID(), count_now )
--		Say(OwnerID(), hour..":"..min )
		
		if hour == 06 and min == 00 then 
			WriteRoleValue(OwnerID() , EM_RoleValue_Register, count_day )    -- 重新執行時 補充提供量
			local count_now =  ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   --現在R值量
		--	Say(OwnerID(), "reset" )
		--	Say(OwnerID(), count_now )
		end

		if count_now < 0 then
			WriteRoleValue(OwnerID(), EM_RoleValue_Register , 0 )
		end

		sleep(50)  --5SEC

	end
end

----------------------------------------------


-- NPC初始劇情 -----------------------

-- shop01 烹飪 特選香菇	240066  1000
function lua_mika_skillcraft_shop01()   --烹飪  
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240066]][$SETVAR2="..count_now .."]"   )  -- 冒險者，你來得正好！今天的材料還有貨呢！(略)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop1_buy", 0 ) -- 購買材料
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240066]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --關於特殊材料商品


end

function lua_mika_skillcraft_shop1_buy()  -- 商店1 烹飪 購買商品
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240066  --特選香菇
	local item_need = 240061   --兌換所需物品id
	local count = CountBodyItem(OwnerID(), item_need  )  --玩家身上兌換物品數量
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now < 1 then   -- 阻擋機制, 當npc r值 <1 , 點擊時告訴玩家不能買
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240066]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	else
		if count < 1 then -- 如果玩家沒兌換物品
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- 扣除 r值
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL 巧匠的感謝狀X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE 材料X1
		end
	end

end
--------------------------------------------------------------------
-- shop02 煉金 大萬靈藥	240067  1000
function lua_mika_skillcraft_shop02()   --煉金
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240067]][$SETVAR2="..count_now .."]"   )  -- 冒險者，你來得正好！今天的材料還有貨呢！(略)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop2_buy", 0 ) -- 購買材料
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240067]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --關於特殊材料商品


end

function lua_mika_skillcraft_shop2_buy()  -- 商店2 煉金 購買商品
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240067  --大萬靈藥
	local item_need = 240061   --兌換所需物品id
	local count = CountBodyItem(OwnerID(), item_need  )  --玩家身上兌換物品數量
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now < 1 then   -- 阻擋機制, 當npc r值 <1 , 點擊時告訴玩家不能買
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240067]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	else
		if count < 1 then -- 如果玩家沒兌換物品
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- 扣除 r值
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL 巧匠的感謝狀X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE 材料X1
		end
	end
end
--------------------------------------------------------------------
-- shop03 裁縫 高級緞帶	240068  300
function lua_mika_skillcraft_shop03()   --裁縫
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240068]][$SETVAR2="..count_now .."]"   )  -- 冒險者，你來得正好！今天的材料還有貨呢！(略)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop3_buy", 0 ) -- 購買材料
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240068]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --關於特殊材料商品

end

function lua_mika_skillcraft_shop3_buy()  -- 商店3 裁縫 購買商品
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240068  --高級緞帶
	local item_need = 240061   --兌換所需物品id
	local count = CountBodyItem(OwnerID(), item_need  )  --玩家身上兌換物品數量
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now < 1 then   -- 阻擋機制, 當npc r值 <1 , 點擊時告訴玩家不能買
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240068]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	else
		if count < 1 then -- 如果玩家沒兌換物品
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- 扣除 r值
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL 巧匠的感謝狀X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE 材料X1
		end
	end
end

--------------------------------------------------------------------
-- shop04 製甲 白銀鐵礦	240069  300
function lua_mika_skillcraft_shop04()   --裁縫
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240069]][$SETVAR2="..count_now .."]"   )  -- 冒險者，你來得正好！今天的材料還有貨呢！(略)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop4_buy", 0 ) -- 購買材料
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240069]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --關於特殊材料商品


end

function lua_mika_skillcraft_shop4_buy()  -- 商店4 製甲 購買商品
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240069  --白銀鐵礦
	local item_need = 240061   --兌換所需物品id
	local count = CountBodyItem(OwnerID(), item_need  )  --玩家身上兌換物品數量
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now < 1 then   -- 阻擋機制, 當npc r值 <1 , 點擊時告訴玩家不能買
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240069]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	else
		if count < 1 then -- 如果玩家沒兌換物品
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- 扣除 r值
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL 巧匠的感謝狀X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE 材料X1
		end
	end
end

--------------------------------------------------------------------
-- shop05 木工 氣息之木	240070  100

function lua_mika_skillcraft_shop05()   --裁縫
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240070]][$SETVAR2="..count_now .."]"   )  -- 冒險者，你來得正好！今天的材料還有貨呢！(略)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop5_buy", 0 ) -- 購買材料
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240070]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --關於特殊材料商品

end

function lua_mika_skillcraft_shop5_buy()  -- 商店5 木工 購買商品
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240070  --氣息之木
	local item_need = 240061   --兌換所需物品id
	local count = CountBodyItem(OwnerID(), item_need  )  --玩家身上兌換物品數量
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now < 1 then   -- 阻擋機制, 當npc r值 <1 , 點擊時告訴玩家不能買
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240070]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	else
		if count < 1 then -- 如果玩家沒兌換物品
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- 扣除 r值
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL 巧匠的感謝狀X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE 材料X1
		end
	end
end

--------------------------------------------------------------------
-- shop06 打鐵 熔巖晶鐵	240071  100

function lua_mika_skillcraft_shop06()   --打鐵
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --NPC
 
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now > 0 then 
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP01][$SETVAR1=[240071]][$SETVAR2="..count_now .."]"   )  -- 冒險者，你來得正好！今天的材料還有貨呢！(略)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP04]" , "lua_mika_skillcraft_shop6_buy", 0 ) -- 購買材料
	else
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240071]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_SHOP03]" , "lua_mika_skillcraft_shop_intro", 0 ) --關於特殊材料商品


end

function lua_mika_skillcraft_shop6_buy()  -- 商店6 打鐵 購買商品
--	Say(OwnerID(), "OwnerID" )  --Player
--	say(TargetID(), "TargetID" )  --npc

	local material =  240071  --熔巖晶鐵
	local item_need = 240061   --兌換所需物品id
	local count = CountBodyItem(OwnerID(), item_need  )  --玩家身上兌換物品數量
	local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量  讀 npc 的 r值

	if count_now < 1 then   -- 阻擋機制, 當npc r值 <1 , 點擊時告訴玩家不能買
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_SHOP02][$SETVAR1=[240071]][$SETVAR2="..count_now .."]"   )   --很抱歉，冒險者，你遲了一步，今天販售的材料已經全部售完，請你明天早點來吧！
	else
		if count < 1 then -- 如果玩家沒兌換物品
			SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。
		else
			CloseSpeak(OwnerID())
			AddRoleValue(TargetID() , EM_RoleValue_Register, -1  )    -- 扣除 r值
			local count_now =  ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --現在R值量 商品販售剩餘數量
			if count_now < 0 then
				WriteRoleValue(TargetID(), EM_RoleValue_Register , 0 )
			end
	--		Say(TargetID(), count_now )

			DelBodyItem(OwnerID(), item_need , 1 )  -- DEL 巧匠的感謝狀X1
			GiveBodyItem(OwnerID(), material , 1)  -- GIVE 材料X1
		end
	end
end
--------------------------------------------------------------------