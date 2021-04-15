--祈願節活動NPC

function Lua_mika_thankday_npc01()
	LoadQuestOption( OwnerID() ) --讀取npc任務
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_2010_NPC06]"   )  
	AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_04]" , "Lua_Hao_thanksday_about1", 0 ) --我想知道祈願節的由來。ok

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
	if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
		AddSpeakOption( OwnerID(), TargetID(), "[SC_THANKSGIVING_2010_NPC04]" , "Lua_mika_thankday_npc03", 0 ) --我想兌換[208292]  --祈願節重置券
	end
end

function Lua_mika_thankday_npc03() --我想兌換祈願節重置券
	SetSpeakDetail( OwnerID(), "[SC_THANKSGIVING_2010_NPC05]"   )  --...兌換[208292]只需要<CB>1個[202904]</CB>...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "Lua_mika_thankday_npc04", 0 ) --確定
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "Lua_mika_thankday_npc01", 0 ) --回到上一層
end

function Lua_mika_thankday_npc04() --確定兌換重置券
	CloseSpeak(OwnerID())
	local item = CountBodyItem(OwnerID(), 202904 )  --傳送門符文
	if item >= 1 then
		GiveBodyItem(OwnerID(), 208292, 2 ) --重置券x2
		DelBodyItem(OwnerID(), 202904, 1 ) -- 傳送門符文x1
	else
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_112503_NO]" , 0 )  --你所持的物品數量不足喔！
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_112503_NO]" , 0 )  --你所持的物品數量不足喔！
	end
end

function lua_mika_thankday_npcgive()  --當接下任務 執行劇情
	local getfood = CheckFlag(TargetID(), 544418 ) -- 今天領過飼料
	local box = CountBodyItem(TargetID(), 208288 ) --羽毛收集盒
	if getfood ==false then -- 如果沒有getfood flag
		GiveBodyItem(TargetID(), 208289, 10) --鶴鴕飼料X10
		Setflag(TargetID(), 544418 , 1) --給FLAG
	end
	if box == 0 then -- 如果沒有box
		GiveBodyItem(TargetID(), 208288, 1) --羽毛收集盒x1
	end
end

function lua_mika_thankday_reward() --完成任務 給必爾汀藥水
	GiveBodyItem(TargetID(), 724419, 1) --必爾汀藥水
	Setflag(TargetID(), 544560 , 1) --給完成任務KEYITEM
end