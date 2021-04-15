--種植NPC 
function LuaN_mika_plant_0() -- 種植初始NPC
	local ok = CheckFlag( OwnerID(), 542886 )  -- 檢查是否已有種植學徒資格
	local quest_new = CheckFlag( OwnerID(), 543320 )  -- 檢查是否已過種植新手任務
	local alreadyaccept = CheckFlag( OwnerID(), 542890 )  -- 檢查是否已接過第一次種植任務

	if alreadyaccept == false then
		if quest_new == true then --已經過種植新手任務
			SetSpeakDetail(OwnerID(), "[SC_PLANT_02]" ) --最近對於種植有沒有更得心應手了呀？如果有任何問題歡迎隨時來找我喔。(略)
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_01]", "LuaN_mika_plant_start", 0) --我要如何開始種植？
		else
			if ok == true then --可接種植新手任務狀態
				LoadQuestOption( OwnerID() )
				AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_01]", "LuaN_mika_plant_start", 0) --我要如何開始種植？
			elseif ok == false then
				SetSpeakDetail( OwnerID(), "[SC_PLANT_07]" )  --想讓你的小屋充滿綠意嗎？(略)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_08]", "LuaN_mika_plant_get", 0 ) --學習種植技能 
			end
		end
	else
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_37]", "Lua_Hao_MagicSeed_change", 0) --我該如何重複取得魔幻種子?
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_01]", "LuaN_mika_plant_start", 0) --我要如何開始種植？
		LoadQuestOption( OwnerID() )
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_04]" , "LuaN_plantShop_1", 0 )  -- 購買種植物品 
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_newclear() --掛quest detail 完成任務後執行
	SetFlag( TargetID(), 543320, 1 )	 -- <給予重要物品-已過種植新手任務>	
--	SetFlag( OwnerID(), 543320, 1 )	 -- <給予重要物品-已過種植新手任務>	
	SetFlag( TargetID(), 542890 , 0 ) 
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_plantnpc2_0() -- 掛 npc2
	local quest_20 = CheckFlag( OwnerID(), 542887 )  -- 檢查是否已取得種植工匠資格
	local already = Checkflag( OwnerID() , 542896 )  -- 檢查是否已接工匠任務

	if  already == false then	
		if quest_20 == true then --已經過種植20任務
			SetSpeakDetail( OwnerID(), "[SC_PLANT_17]" )  --今天想嘗試種植怎麼樣的植物呢？
			LoadQuestOption( OwnerID() )
		else
			if ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) == 20 ) then  --可接20任務
				LoadQuestOption( OwnerID() )
			elseif ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) < 20 ) then  --還不能接任務狀態
				SetSpeakDetail( OwnerID(), "[SC_PLANT_11]" )  --哈囉，今天想種什麼樣的植物呢？我這裡準備了一個考驗給你，不過在那之前請先將你的種植等級提升到<CN>20等級</CN>喔！
			end
		end
	else 
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_42]", "Lua_Hao_plant_about", 0 ) -- 我該如何取得綠葉露珠?
		LoadQuestOption( OwnerID() )
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_18]", "LuaN_plantShop_2", 0 ) -- 購買種子
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_plantnpc3_0() -- 掛 黑曜石要塞
	local quest_40 = CheckFlag( OwnerID(), 542888 )  -- 檢查是否已取得種植專精資格
	local already = CheckFlag( OwnerID(), 543534 )  -- 檢查是否已接專精任務
--	2012.12.03 新增，讓 Zone 2 Npc 販賣 2 階物品、Zone 6 Npc 販賣 3 階物品
	local PlantShop = { 600156 , 600157 , 600165 , 600352 }	-- 種植一階種子、種植一階其他商品、種植二階種子&其他商品、種植三階種子&其他商品
	CloseShop( TargetID() )
--	
	if already == false then	
		if quest_40 == true then --已經過種植40任務
			LoadQuestOption( OwnerID() )
		else
			if ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) == 40 ) then  --可接40任務
				LoadQuestOption( OwnerID() )
			elseif ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) < 40 ) then  --還不能接任務狀態
				SetSpeakDetail( OwnerID(), "[SC_PLANT_29]" )  --當你的種植等級達到<CN>40</CN>的時候，別忘了回來找我，有個特別的考驗正等著你。
			end
		end
	else
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_31]", "Lua_Hao_plantchange", 0 ) --我該如何重複取得[203830]？
		LoadQuestOption( OwnerID() )
	end
--	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_18]", "LuaN_plantShop_3", 0 ) --購買種子
--	2012.12.03 新增，讓 Zone 2 Npc 販賣 2 階物品、Zone 6 Npc 販賣 3 階物品
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]", "Planting_Shops_Settings("..PlantShop[3]..")", 0 ) --購買種子
	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop[4]..")", 0 ) --購買種子
-- 
end

--------------------------------------------------------------------------------------------------------------------------
-- 種植三階npc (4.0.1)  [開放 新的盆栽, 種子, 灌溉物品 , 等級開放61-80 ]
function luaN_plantnpc4_0() -- 三階NPC初始對話

	local Lv = ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Plant )   --玩家目前種植等級
	local Key = CheckFlag( OwnerID() , 542889 )  -- 檢查是否已有大師資格(等級上限80)
	local Detail = { "[SC_PLANT_17]" , "[SC_PLANT_48]" , "[SC_PLANT_49]" , "[SC_PLANT_50]" , "[SC_PLANT_51]" }
 	-- 哈囉，今天想種什麼樣的植物呢？
  	-- 很高興又遇見你，有什麼需要我幫忙的嗎？
  	-- 還有什麼事？你確定你不是來搗蛋的？
  	-- 為你的無聊行為鼓掌。
  	-- 很抱歉，我已經失去了耐心，沒空理你...
	local Motion = { 112 , 106 , 254 , 102 , 108 }	-- 比畫、點頭、伸懶腰、鼓掌、大笑
	local Buff = 506172
--	2012.12.03 新增，讓 Zone 2 Npc 販賣 2 階物品、Zone 6 Npc 販賣 3 階物品
	local PlantShop = { 600156 , 600157 , 600165 , 600352 }	-- 種植一階種子、種植一階其他商品、種植二階種子&其他商品、種植三階種子&其他商品
	CloseShop( TargetID() )
--
	

	AdjustFaceDir( TargetID() , OwnerID() , 0 )

	if Key == true then	-- 已取得種植大師
		AddBuff( OwnerID() , Buff , 0 , 5 )
		local Check = Lua_Hao_Return_Buff_Lv( OwnerID() , Buff ) 
		Check = Check + 1
	--	DebugMsg( OwnerID() , 0 , "Check = "..Check )
		if Check >= 5 then
			Check = 5
		end
		for i = 1 , table.getn(Detail) , 1 do
			if Check == i then
				SetSpeakDetail( OwnerID() , Detail[i] )
				PlayMotion( TargetID() , Motion[i] )
			--	DebugMsg( OwnerID() , 0 , "Detail = "..Detail[i].." Motion = "..Motion[i] )
			end
		end
		if Check ~= 5 then
		--	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]" , "LuaN_plantShop_3", 0 ) --購買種子
		--	2012.12.03 新增，讓 Zone 2 Npc 販賣 2 階物品、Zone 6 Npc 販賣 3 階物品
			AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]", "Planting_Shops_Settings("..PlantShop[3]..")", 0 ) --購買種子
			AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop[4]..")", 0 ) --購買種子
		--
		end
	else			-- 未取得種植大師
		if Lv == 60 then
			SetSpeakDetail( OwnerID() , "[SC_PLANT_44]" )  -- 初始對話
			--學習，是為了讓生命更美好。這句話，出自於教導我種植技術的老師，現在，我把這句話送給你，你願意學習更高深的種植技巧嗎？
		--	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]" , "LuaN_plantShop_3", 0 ) --購買種子
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MARRY_15]", "luaN_plantnpc4_1", 0 ) -- 是的，我願意。
		else
			SetSpeakDetail( OwnerID() , "[SC_PLANT_45]" )  -- 你好，陌生人，雖然我不認識你，但我可以感覺得到你也有著一顆喜愛植物的心。當你的種植等級達到<CN>60</CN>的時候，別忘了回來找我，我將引導你走入更高深的種植世界。
		--	AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]" , "LuaN_plantShop_3", 0 ) --購買種子
		end
		--	2012.12.03 新增，讓 Zone 2 Npc 販賣 2 階物品、Zone 6 Npc 販賣 3 階物品
		AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]", "Planting_Shops_Settings("..PlantShop[3]..")", 0 ) --購買種子
		AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_04]", "Planting_Shops_Settings("..PlantShop[4]..")", 0 ) --購買種子
		--	
	end
end

function luaN_plantnpc4_1() -- 三階NPC初始對話

	local Key = CheckFlag( OwnerID() , 542889 )  -- 檢查是否已有大師資格(等級上限80)
	CloseSpeak( OwnerID())
	AdjustFaceDir( TargetID() , OwnerID() , 0 )

	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
		if Key == false then
			GiveBodyItem( OwnerID() , 208650 , 1 )
		end
		Setflag(OwnerID() , 542889 , 1 )  --給予大師資格
		CastSpell( OwnerID() , OwnerID() , 491010 )
		PlayMotion( TargetID() , 102 )
		sleep(5)
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_PLANT_46]", C_SYSTEM ) --你已取得種植大師資格
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PLANT_47]", C_SYSTEM ) --訊息視窗訊息：你已取得種植大師資格，種植等級上限為80級。
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_111491_DIALOG3]", C_SYSTEM ) --您的背包空間不足，請清理一下再來吧。 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_111491_DIALOG3]", C_SYSTEM ) --您的背包空間不足，請清理一下再來吧。 
	end
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_plant_about() -- 取得綠葉露珠
	SetSpeakDetail(OwnerID(), "[SC_PLANT_43]" ) --當你的種植等級高於栽培中的種子等級5級以上時，就有機會於收成時取得<CB>[205084]</CB>。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_plantnpc2_0", 0 ) --回到上一層	
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_plantchange() -- 兌換魔焰種子
	SetSpeakDetail(OwnerID(), "[SC_PLANT_32]" ) --[203830]可是相當珍貴的植物種子，想要重複取得必須付出點代價。如果你能給我[200239]、[200298]、[200342]各10個，我就給你一顆[203830]。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_33]", "Lua_Hao_plantchange2", 0 ) --我要兌換[203830]
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_plantchange2() -- 兌換魔焰種子

	local Item1 =  CountBodyItem( OwnerID() , 200239 ) -- 白銀礦
	local Item2 =  CountBodyItem( OwnerID() , 200298 ) -- 冬青木
	local Item3 =  CountBodyItem( OwnerID() , 200342 ) -- 巴沙石葉草

		if Item1 < 10 or Item2 < 10 or Item3 < 10 then
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" ) --你所持的物品不足。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_plantnpc3_0", 0 ) --回到上一層	
			return false
                	else 
			GiveBodyItem( OwnerID() , 203830 , 1 )	-- 雪焰種子
			DelBodyItem( OwnerID() , 200239 , 10 )
			DelBodyItem( OwnerID() , 200298 , 10 )
			DelBodyItem( OwnerID() , 200342 , 10 )
			SetSpeakDetail(OwnerID(), "[SC_PLANT_34]" ) --願你能成功種植出綻放的[203839]。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_plantnpc3_0", 0 ) --回到上一層	
		end
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_MagicSeed_change() -- 兌換魔幻種子
		SetSpeakDetail(OwnerID(), "[SC_PLANT_38]" ) --[205530]可不是普通的種子，想要重複取得必須用付出你的努力。如果你能給我[200230]、[200293]、[200335]各10個，我就給你一顆[205530]。
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_39]", "Lua_Hao_MagicSeed_change2", 0 ) --我要兌換[205530]
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_MagicSeed_change2() -- 兌換魔幻種子

	local Item1 =  CountBodyItem( OwnerID() , 200230 ) -- 黃銅礦
	local Item2 =  CountBodyItem( OwnerID() , 200293 ) -- 輕木
	local Item3 =  CountBodyItem( OwnerID() , 200335 ) -- 山魔楊草

		if Item1 < 10 or Item2 < 10 or Item3 < 10 then
			SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" ) --你所持的物品不足。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_0", 0 ) --回到上一層	
			return false
                	else 
			GiveBodyItem( OwnerID() , 205530  , 1 )	-- 魔幻種子
			DelBodyItem( OwnerID() , 200230 , 10 )
			DelBodyItem( OwnerID() , 200293 , 10 )
			DelBodyItem( OwnerID() , 200335 , 10 )
			SetSpeakDetail(OwnerID(), "[SC_PLANT_40]" ) --只要好好照顧[205530]，就能在收成時取得[205531]。
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_0", 0 ) --回到上一層	
		end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_get() --取得種植技能
	CloseSpeak( OwnerID())
	CastSpell( OwnerID() , OwnerID() , 491010 )
	sleep(5)
	SetFlag( OwnerID(), 542886, 1 );	-- <給予重要物品-種植學徒>	
 	WriteRoleValue(OwnerID() , EM_RoleValue_MaxPlantCount , 5 ) --盆數提升為5盆				   
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_PLANT_09]", C_SYSTEM );--你已取得種植學徒資格
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_PLANT_10]", C_SYSTEM );--訊息視窗訊息：你已取得種植學徒資格，種植等級上限為20級。
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_LV20give() --種植任務lv20回報
	CloseSpeak( OwnerID())
	SetFlag( TargetID(), 542896, 0 ) -- 刪除重要物品
	CastSpell( TargetID() , TargetID() , 491010 )
	sleep(5)
--	SetFlag( TargetID(), 542887, 1 );	-- <給予重要物品-種植工匠>  改用任務給
 	WriteRoleValue(TargetID() , EM_RoleValue_MaxPlantCount , 10 )  --盆數提升為10盆
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_PLANT_15]", C_SYSTEM );--你已取得種植花匠資格
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_PLANT_16]", C_SYSTEM );--訊息視窗訊息：你已取得種植花匠資格，種植等級上限為40級。
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_Hao_plant_LV40give() --種植任務lv40回報
	CloseSpeak( OwnerID())
	CastSpell( TargetID() , TargetID() , 491010 )
	sleep(5)
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_PLANT_27]", C_SYSTEM );--你已取得種植專精資格
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_PLANT_28]", C_SYSTEM );--訊息視窗訊息：你已取得種植專精資格，種植等級上限為60級。
	SetFlag(TargetID(), 543534  , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_newquest_recheck()  --判斷玩家是否已經接過此任務
	local get = CheckFlag( TargetID(), 542890 )  -- 檢查是否已有 已接過此任務旗標
	if get == false then
		GiveBodyItem( TargetID() , 205532 , 1 )    --種植學習包
		SetFlag(TargetID(), 542890 , 1 )  --給 已接過此任務旗標
	else
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_PLANT_41]", C_SYSTEM );-- [205530]只有在第一次接受任務時，才能免費領取。
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_PLANT_41]", C_SYSTEM );-- [205530]只有在第一次接受任務時，才能免費領取。
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_hao_Plant_Lv20_quest_recheck()  --判斷玩家是否已經接過種植工匠

	SetFlag(TargetID(), 542896  , 1 )  --給已經接過此任務旗標
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_hao_Plant_Lv40_quest_recheck()  --判斷玩家是否已經接過種植專精
	local get = CheckFlag( TargetID(), 543534 )  -- 檢查是否已有 已接過此任務旗標
	if get == false then
		GiveBodyItem(TargetID() , 203830 , 1 )
		SetFlag(TargetID(), 543534  , 1 )  --給已經接過此任務旗標
	elseif  get == true then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_PLANT_30]", C_SYSTEM );--你曾經接受過這個任務，免費的[203830]只有第一次才有，何不拿寫材料跟我交換？
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_PLANT_30]", C_SYSTEM );--你曾經接受過這個任務，免費的[203830]只有第一次才有，何不拿寫材料跟我交換？
	--	SetSpeakDetail( OwnerID(), "U r already accept this question" )  --你已經接過這個任務，珍貴的雪焰種子可不能白給。
	--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_plantnpc3_0", 0 ) --回到上一層	
	end
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start() --我要如何開始種植？ --教學
	SetSpeakDetail( OwnerID(), "[SC_PLANT_05]" )  --首先，你需要取得進行種植需要的物品，(略)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_19]", "LuaN_mika_plant_start2", 0) --我想更了解種植
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_0", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start2() --我想更了解種植
	SetSpeakDetail( OwnerID(), "[SC_PLANT_24]" )  --你想了解哪方面呢？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_20]", "LuaN_mika_plant_start20", 0) --灌溉度與肥沃度
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_21]", "LuaN_mika_plant_start21", 0) --健康度與飽食度
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_22]", "LuaN_mika_plant_start22", 0) --收成與標本化

	if ( ReadRoleValue(OwnerID() , EM_RoleValue_Skill_Plant  ) >= 6 ) then 
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PLANT_23]", "LuaN_mika_plant_start23", 0) --特殊收獲物
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start20() --灌溉度與肥沃度
	SetSpeakDetail( OwnerID(), "[SC_PLANT_20_1]" )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start2", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start21() --健康度與飽食度
	SetSpeakDetail( OwnerID(), "[SC_PLANT_21_1]" )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start2", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start22() --健康度與飽食度
	SetSpeakDetail( OwnerID(), "[SC_PLANT_22_1]" )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start2", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_mika_plant_start23() --健康度與飽食度
	SetSpeakDetail( OwnerID(), "[SC_PLANT_23_1]" )  
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_plant_start2", 0 ) --回到上一層
end
--------------------------------------------------------------------------------------------------------------------------
function LuaN_plantShop_1() --購買種植物品 
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
---------------------------------------------
function LuaN_plantShop_2() --購買種子
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
---------------------------------------------
function LuaN_plantShop_3() --購買二階種植物品
	CloseSpeak( OwnerID() );  --關閉對話視窗
	OpenShop()
end
---------------------------------------------
function LuaN_plantshop_set1() -- 掛 物件產生劇情 --物品	-- 種植一階物品
	SetShop(OwnerID() , 600157 , "Test_Shop_Close" ); 
end
---------------------------------------------
function LuaN_plantshop_set2() -- 掛 物件產生劇情 --種子	-- 種植一階種子
	SetShop(OwnerID() , 600156 , "Test_Shop_Close" ); 
end
---------------------------------------------
function LuaN_plantshop_set3() -- 掛 物件產生劇情 --種子商品	-- 種植二階商品
	SetShop(OwnerID() , 600165 , "Test_Shop_Close" ); 
end
---------------------------------------------
--3階種植開放 種植商人 (4.0.1 )
function LuaN_plantshop_set4() -- 掛 物件產生劇情 --種子商品	-- 種植三階商品
	SetShop(OwnerID() , 600352 , "Test_Shop_Close" ); 
end

function Planting_Shops_Settings(ShopGuid)	-- 2012.12.03 新增，種植商店統整

	local Player = OwnerID()
	local Npc = TargetID()
	SetShop( Npc , ShopGuid , "" )
	CloseSpeak( Player )
	OpenShop()
end
-------------------------------------------------------------------------------
--種植學習包  205532      
------------------------------------------------------------------------------
function LuaI_205532box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205532 	--種植學習包
	local NeedSpace = 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then	
		GiveBodyItem( PlayerID , 203838 , 1 )    --馬雅種植大盆
		GiveBodyItem( PlayerID , 205530 , 1 )	 --魔幻種子
		GiveBodyItem( PlayerID , 203815 , 30 )    --灌溉水
		GiveBodyItem( PlayerID , 203823 , 30 )    --堆肥
	end
end

------------------------------------------------------------------------------
--種植培育包  205533     
----------------------------------------------------------------------------
function LuaI_205533box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205533 	--種植培育包
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then	
		GiveBodyItem( PlayerID , 204191 , 1 )    --紅結晶種子 
		GiveBodyItem( PlayerID , 203994 , 1 )	 --鼠尾籐種子  
		GiveBodyItem( PlayerID , 204181 , 1 )    --木藤種子
		GiveBodyItem( PlayerID , 203815 , 50 )    --灌溉水
		GiveBodyItem( PlayerID , 203823 , 50 )    --堆肥
	end
end
------------------------------------------------------------------------------
--種植菁英包  205534 
----------------------------------------------------------------------------
function LuaI_205534box( Option )
	local PlayerID = OwnerID()
	local PackageID = 205534 	--種植培育包
	local NeedSpace = 5
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then	
		GiveBodyItem( PlayerID , 206181 , 1 )  -- 荒原砂鶴雕飾盆
		GiveBodyItem( PlayerID , 203882 , 5 )  -- 中級成長催化劑
		GiveBodyItem( PlayerID , 203885 , 5 )  -- 中級健康藥劑
		GiveBodyItem( PlayerID , 203883 , 3 )  -- 高級成長催化劑
		GiveBodyItem( PlayerID , 203886 , 3 )  -- 高級健康藥劑
	end
end
----------------------------------------------------------------------------
--種植傳奇包  208650
----------------------------------------------------------------------------
function LuaI_208650() -- 種植傳奇包 2011/06/21	種植三階獎勵

	local Random , Drop = Rand(3)+1 , 0

	if Random == 1 then
		Drop = 208578	-- 湛藍雷爪盆
	elseif Random == 2 then
		Drop = 208579	-- 楓紅印花盆
	else
		Drop = 208577	-- 綠洲月牙盆
	end	

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 208649 , 1 , 208624 , 10 , 208625 , 10 , Drop , 1 } }
	-- 永久邪惡葉球寵物蛋*1、特級成長催化劑*10、高級健康藥劑*10、湛藍雷爪盆(楓紅印花盆、綠洲月牙盆)*1。
	return BaseTressureProc(   itemset , 4 )
end
------------------------------------------------------------------------------
function LuaN_mika_plant_test()  --測試用指令
	SetFlag(OwnerID(), 542885 , 0 )	-- 種植 新手任務
	SetFlag(OwnerID(), 542886 , 0 )	-- 種植 學徒
	SetFlag(OwnerID(), 542887 , 0 )	-- 種植 工匠
	SetFlag(OwnerID(), 542888 , 0 )	-- 種植 專精
	SetFlag(OwnerID(), 542889 , 0 )	-- 種植 大師
	SetFlag(OwnerID(), 543535 , 0 )	-- 種植-傳奇
	SetFlag(OwnerID(), 543610 , 0 )	-- 開放種植兌換商店
	SetFlag(OwnerID(), 542890 , 0 )	-- 已接受種植學徒任務
	SetFlag(OwnerID(), 542896 , 0 )	-- 已接受種植工匠任務
	SetFlag(OwnerID(), 543320 , 0 )	-- 已完成種植學徒任務
	SetFlag(OwnerID(), 543534 , 0 )	-- 已完成種植工匠任務
end
------------------------------------------------------------------------------
function LuaN_mika_plant_test_highlevel()
	SetFlag( OwnerID(), 542886, 1 )	   -- <給予重要物品-種植學徒>	
 --	WriteRoleValue(OwnerID() , EM_RoleValue_MaxPlantCount , 5 )
 	WriteRoleValue(OwnerID() , EM_RoleValue_Skill_Plant , 20 ) 
	SetFlag( OwnerID(), 542887, 1 )	  -- <給予重要物品-種植學徒>
 	WriteRoleValue(OwnerID() , EM_RoleValue_MaxPlantCount , 10 ) 
end
------------------------------------------------------------------------------
function Lua_Hao_plant_Lv40_60()
	SetFlag(OwnerID() , 542888 , 0 )
end
-----------------------------------------------------------------------------
function Lua_Hao_plant_give()
	GiveBodyItem( OwnerID() , 200239 , 100 )
	GiveBodyItem( OwnerID() , 200298 , 100 )
	GiveBodyItem( OwnerID() , 200342 , 100 )
end
-----------------------------------------------------------------------------
function Lua_Hao_plant_The_End()-- 可種植盆栽上限為100，種植等級提高為80

	CastSpell( OwnerID() , OwnerID() , 491010 )	
	sleep(5)
	SetFlag( OwnerID() , 542886 , 1 )	-- <給予重要物品-種植學徒>	
	SetFlag( OwnerID() , 542887 , 1 )	-- <給予重要物品-種植花匠>	
	SetFlag( OwnerID() , 542888 , 1 )	-- <給予重要物品-種植專精>
	SetFlag( OwnerID() , 542889 , 1 )	-- <給予重要物品-種植大師>	
	SetFlag( OwnerID() , 543535 , 1 )	-- <給予重要物品-種植傳奇>
	SetFlag(OwnerID(), 543610 , 1 )	-- <給予重要物品-開放種植兌換商店>
	WriteRoleValue( OwnerID() , EM_RoleValue_MaxPlantCount , 100 ) -- 可種盆數提高為100
	WriteRoleValue( OwnerID() , EM_RoleValue_Skill_Plant , 100 ) -- 種植等級提高為100
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_PLANT_LV4_5]", C_SYSTEM ) --你已取得種植傳奇資格。
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_PLANT_LV4_6]", C_SYSTEM ) --訊息視窗訊息：你已取得種植傳奇資格，種植等級上限提升為100級。
--	ScriptMessage( OwnerID() , OwnerID(), 1, " ^_^ ", C_SYSTEM )-- 表情符號
end
-----------------------------------------------------------------------------
function Lua_Hao_plant_Game_Over()-- 可種植盆栽上限歸0，種植等級減少為0

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY ) 
	sleep(5)
	LuaN_mika_plant_test()
	WriteRoleValue( OwnerID() , EM_RoleValue_MaxPlantCount , 0 ) -- 可種盆數變歸0
	WriteRoleValue( OwnerID() , EM_RoleValue_Skill_Plant , 0 ) -- 種植等級上限歸0
	ScriptMessage( OwnerID() , OwnerID() , 2 , "Your plant level is already being zero...", C_SYSTEM ) --你已經死了
	ScriptMessage( OwnerID() , OwnerID() , 0 , "Orz" , C_SYSTEM ) --你已經死了
	ScriptMessage( OwnerID() , OwnerID() , 1 , "ToT" , C_SYSTEM ) --你的種植等級已經歸零
end
-----------------------------------------------------------------------------
function Lua_Hao_Plant_Set_Lv( Value )	-- 遊戲中設定種植等級。

	local Key = { 542886 , 542887 , 542888 , 542889, 543535 }	-- 種植學徒、種植花匠、種植專精、種植大師, 種植傳奇
	local Lv = { 1 , 21 , 41 , 61 , 81 }			-- 種植等級
	local Planting = 0				-- 種植盆數

	if Value < 0 or Value > 100 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Entry error" , C_SYSTEM ) --  輸入錯誤
		return false
	end

	for i = 1 , table.getn(Key) , 1 do
		SetFlag( OwnerID() , Key[i] , 0 )
	end

	for i = 1 , table.getn(Lv) , 1 do
		if Value >= Lv[i] then
			SetFlag( OwnerID() , Key[i] , 1 )
		end
	end

	if Value >= 20 then
		Planting = 10
	else
		Planting = 5
	end

	WriteRoleValue( OwnerID() , EM_RoleValue_Skill_Plant , Value ) -- 改變種植等級
	WriteRoleValue( OwnerID() , EM_RoleValue_MaxPlantCount , Planting ) -- 改變種植盆數
	ScriptMessage( OwnerID() , OwnerID() , 1 , "Plant Lv = "..Value , C_SYSTEM )	-- 調整等級
end