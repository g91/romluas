--2010年白色情人節任務

-----NPC 亞克塞爾初始劇情---------------------------------------
function lua_mika_whiteday_npc01() -- 當天未接任務過 可看到此選項
	local start = Checkflag(OwnerID(), 543606) -- 接任務條件
	local ing = Checkflag(OwnerID(), 543607) -- 進行任務中
	local today = Checkflag(OwnerID(), 543608) -- 今天已完成白色情人節任務
	if today == true then
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC1_1]" ) --願你有一個愉快的白色情人節～！
	else
		if start == true then
			LoadQuestOption(OwnerID())  --載入任務模板
		else
			if ing == false then
				SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC1]" ) --唉，我該去哪找這些東西才好？
				AddSpeakOption(  OwnerID(), TargetID( ), "[SC_WHITEDAY_01]" ,  "lua_mika_whiteday_npcgo",  0 ); -- 你看起來似乎有什麼煩惱？ 	
			else 
				SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC1]" ) --唉，我該去哪找這些東西才好？
			end
		end
	end
end

function lua_mika_whiteday_npcgo() --選項  你看起來似乎有什麼煩惱？
	CloseSpeak(OwnerID())
	sleep(10)
	tell(OwnerID(),TargetID(),"[SC_WHITEDAY_02]" )   --密語   受話人,發話人,string
	----你願意幫我的忙嗎？真是太好了。
	Setflag(OwnerID(), 543606, 1) -- 當天可接任務狀態
end
-----------任務模板事件-------------------------------------
function lua_mika_whiteday_npc03() --接下任務時 掛questflag 
	Setflag(TargetID(), 543607, 1) -- 進行任務中
end

function lua_mika_whiteday_npc04() --完成時 掛questflag 
	local item1 = CountBodyItem(TargetID(), 206922 ) --祝福卡片
	local item2 = CountBodyItem(TargetID(), 206923 ) --真心卡片
	if item2 >= 1 then
		sleep(20)
		tell(TargetID(),OwnerID(),"[SC_WHITEDAY_03]" )   --密語   受話人,發話人,string
		--或許心意比禮物本身更為重要，我會好好將我的想法放在這張卡片交給[西西莉亞]。
		sleep(20)
		tell(TargetID(),OwnerID(),"[SC_WHITEDAY_04]" )   --密語   受話人,發話人,string
		--感謝你提醒我什麼才是最重要的，如果你尚未找到你的真愛，希望你能盡快尋見，如果你已經有了對象，希望你們能彼此珍惜對方。
		sleep(10)
		DelBodyItem(TargetID(), 206923, 1) -- 真心卡片
		GiveBodyItem(TargetID(), 206927, 1) -- 情人服裝禮盒
		Setflag(TargetID(), 543606, 0) -- del 接任務條件
		Setflag(TargetID(), 543607, 0) -- del 進行中
		Setflag(TargetID(), 543608, 1) -- give 今天已完成白色情人節任務
	elseif item1 >= 1 then
		sleep(20)
		tell(TargetID(),OwnerID(),"[SC_WHITEDAY_03]" )   --密語   受話人,發話人,string
		--或許心意比禮物本身更為重要，我會好好將我的想法放在這張卡片交給[西西莉亞]。
		sleep(20)
		tell(TargetID(),OwnerID(),"[SC_WHITEDAY_04]" )   --密語   受話人,發話人,string
		--感謝你提醒我什麼才是最重要的，如果你尚未找到你的真愛，希望你能盡快尋見，如果你已經有了對象，希望你們能彼此珍惜對方。
		sleep(10)
		DelBodyItem(TargetID(), 206922, 1) -- 祝福卡片
		GiveBodyItem(TargetID(), 206928, 1) -- 情人配件禮盒
		Setflag(TargetID(), 543606, 0) -- del 接任務條件
		Setflag(TargetID(), 543607, 0) -- del 進行中
		Setflag(TargetID(), 543608, 1) -- give 今天已完成白色情人節任務
	else
		Setflag(TargetID(), 543606, 0) -- del 接任務條件
		Setflag(TargetID(), 543607, 0) -- del 進行中
		Setflag(TargetID(), 543608, 1) -- give 今天已完成白色情人節任務
	end
end
-----NPC 羅威初始劇情---------------------------------------
function lua_mika_whiteday_npc05() --
	local key1 = Checkflag(OwnerID(), 543609) -- 當天領取過
	local ing = Checkflag(OwnerID(), 543607) -- 進行任務中
	if ing == true and key1 == false then
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_2_01]" )
		--(你看到[羅威]正在整理店裡的東西，看起來正準備打烊。)
		--如果你是來問特製的禮盒材料的話，剛剛正好賣出最後一套囉。
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_WHITEDAY_2_02]" , "lua_mika_whiteday_npc51", 0 ) --能不能幫我想個辦法？
	else
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC2]" ) 
		--這次推出的白色情人節特製材料，銷量真是超乎我的預期啊～！
		--我想今年總算可以送給她一個像樣的禮物了吧！
	end
end

function lua_mika_whiteday_npc51() --
	local BorG = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )  
	if BorG == 0 then --男
		CloseSpeak(OwnerID())
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03B1]" )   --密語   受話人,發話人,string
		--看在你運氣好，我手邊還有一些未經裁切的[206918]，如果你要的話就先給你一些吧
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03B2]" )   --密語   受話人,發話人,string
		--只不過…，這件事可別告訴任何人哪。
		sleep(10)
		GiveBodyItem(OwnerID(), 206918, 2) -- 包裝紙
		Setflag(OwnerID(), 543609, 1) -- 今天已和羅威領取過
	elseif BorG == 1 then -- 女
		CloseSpeak(OwnerID())
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03G1]" )   --密語   受話人,發話人,string
		--這個節日不該是女性辛苦奔波的日子啊，你有什麼需要嗎？
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03G2]" )   --密語   受話人,發話人,string
		--你說你在幫人收集材料？好，讓我找找看剩餘的材料箱裡還有沒有能用的東西。
		sleep(10)
		tell(OwnerID(),TargetID(),"[SC_WHITEDAY_2_03G3]" )   --密語   受話人,發話人,string
		--裝飾禮物的話，這個應該足夠了。
		sleep(10)
		GiveBodyItem(OwnerID(), 206919, 2) -- 緞帶
		Setflag(OwnerID(), 543609, 1) -- 今天已和羅威領取過
	end
end

-----NPC 露西初始劇情---------------------------------------
function lua_mika_whiteday_npc06() --
	local ing = Checkflag(OwnerID(), 543607) -- 進行任務中
	local key2 = Checkflag(OwnerID(), 543633) -- 當天領取過
	if  ing == true and key2 == false then
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC3]" ) 
		--所謂情人節最好的禮物，就是將你最真誠的隻字片語寫在卡片上，需不需要來一張情人節特製卡片呢？
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_WHITEDAY_3_01]" , "lua_mika_whiteday_npc61", 0 ) --請給我一張特製卡片
	else
		SetSpeakDetail( OwnerID(), "[SC_WHITEDAY_NPC3]" ) 
		--所謂情人節最好的禮物，就是將你最真誠的隻字片語寫在卡片上，需不需要來一張情人節特製卡片呢？
	end
end

function lua_mika_whiteday_npc61() --
	CloseSpeak(OwnerID())
	sleep(10)
	tell(OwnerID(),TargetID(),"[SC_WHITEDAY_3_021]" )   --密語   受話人,發話人,string
	--不好意思，剛剛生意太忙，原本有分類好卡片的禮盒現在全都混在一起。
	sleep(10)
	tell(OwnerID(),TargetID(),"[SC_WHITEDAY_3_022]" )   --密語   受話人,發話人,string
	--如果你趕時間的話，就從裡面選一個吧。
	sleep(10)
	tell(OwnerID(),TargetID(),"[SC_WHITEDAY_3_023]" )   --密語   受話人,發話人,string
	--至於裡面的內容是什麼，就得請你打開確認了。
	sleep(10)
	GiveBodyItem(OwnerID(), 206920, 1) -- 情人卡片禮盒
	Setflag(OwnerID(), 543633, 1) -- 今天已和露西領取過
end