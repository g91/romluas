-- Z2 運酒快手 活動NPC
function lua_mika_beercontest_Z2_01()  
	PlayMotion( TargetID(), 118) --Cast表演
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_01]"   )  
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_02]" , "lua_mika_beercontest_02", 0 ) --我想知道啤酒節的由來。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW02]" , "lua_mika_beercontest_03", 0 ) --關於『運酒快手』
end

--z15活動npc初始對話  115819
function lua_mika_beercontest_01()  --z15活動npc初始對話  115819
	PlayMotion( TargetID(), 118) --Cast表演
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_01]"   )  
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_02]" , "lua_mika_beercontest_02", 0 ) --我想知道啤酒節的由來。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW01]" , "lua_mika_beercontest_04", 0 ) --關於『品嚐新酒』
end

---------------我想知道啤酒節的由來。---------------
function lua_mika_beercontest_02() -- 我想知道啤酒節的由來。
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07]"   )  --活動內容說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_111490_DIALOG7_2]" , "lua_mika_beercontest_022", 0 ) --然後呢
end

function lua_mika_beercontest_022() -- 我想知道啤酒節的由來-2
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_07_01]"   )  --活動內容說明-2
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_01", 0 ) --回到上一層
end

---------------關於品嚐新酒---------------
function lua_mika_beercontest_04() ---關於品嚐新酒
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW11]"   ) -- 這裡正在舉辦新酒的品嚐會...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "lua_mika_beercontest_041", 0 ) --規則說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_BEERDAY_NEW04]" , "lua_mika_beercontest_042", 0 ) --領取[507452] 空酒杯
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_01", 0 ) --回到上一層
end

function lua_mika_beercontest_041() --品嚐新酒 規則說明
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW03]"   )  --品嚐新酒規則內容
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_04", 0 ) --回到上一層
end 

function lua_mika_beercontest_042() ---品嚐新酒-領取空酒杯
	CloseSpeak(OwnerID())
	if Checkflag(OwnerID(), 544057 ) == True then -- 如果今天領過了
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW05]" , 0 )	--畫面中間訊息 
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW05]" , 0 )	--訊息欄
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW24]" , C_SYSTEM )	--畫面中間訊息 
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW24]" , C_SYSTEM )	--訊息欄
		Addbuff(OwnerID(), 507452 , 0 , 1800 ) --空酒杯BUFF  30分鐘
		Setflag(OwnerID(), 544057, 1 ) --給今天已領取過FLAG
	end
end


---------------關於運酒快手---------------
function lua_mika_beercontest_03() --關於運酒快手
 	local NPCPID = ReadRoleValue ( TargetID() , EM_RoleValue_PID )  --NPCPID
	if NPCPID == 0 then  --不在活動時間內
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW10]"   )   -- 有興趣參加運酒快手活動嗎？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "lua_mika_beercontest_rule", 0 ) --活動規則
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW06]" , "lua_mika_beercontest_reward", 0 ) --領取獎杯
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW07]" , "lua_mika_beercontest_mount", 0 ) --購買特殊坐騎
	elseif NPCPID == 1 then  --報名期間
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW10]"   )   -- 有興趣參加運酒快手活動嗎？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW08]" , "lua_mika_beercontest_join", 0 ) --參加活動
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "lua_mika_beercontest_rule", 0 ) --活動規則
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW06]" , "lua_mika_beercontest_reward", 0 ) --領取獎杯
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW07]" , "lua_mika_beercontest_mount", 0 ) --購買特殊坐騎
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_Z2_01", 0 ) --回到上一層
	elseif NPCPID == 2 then  --活動開始後 (不能報名)
		SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW10]"   )   -- 有興趣參加運酒快手活動嗎？
		if CheckBuff(OwnerID(), 506907 ) == True then --有參加活動buff
			AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW09]" , "lua_mika_beercontest_back", 0 ) --回報活動
		end
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_02]" , "lua_mika_beercontest_rule", 0 ) --活動規則
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW06]" , "lua_mika_beercontest_reward", 0 ) --領取獎杯
		AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_NEW07]" , "lua_mika_beercontest_mount", 0 ) --購買特殊坐騎
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_Z2_01", 0 ) --回到上一層
	end
end

---規則說明-------------------------------
function lua_mika_beercontest_rule() --運酒快手 規則
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW12]"   )  --規則內容
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_03", 0 ) --回到上一層
end 


---獎杯兌換-------------------------------
function lua_mika_beercontest_reward() --獎杯兌換
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW13]"   )  --若你持有[507446]效果，當此效果等級為1, 3或7時，你將可獲得特製的獎杯外觀裝飾武器。現在要領取嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_BEERDAY_NEW14]" , "lua_mika_beercontest_reward2", 0 ) --領取特製獎杯武器
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_03", 0 ) --回到上一層
end

function lua_mika_beercontest_reward2() --獎杯兌換
	Closespeak(OwnerID())
	local Count = BuffCount ( OwnerID())
	if Checkbuff(OwnerID(), 507466 ) == true then --如果有這個buff
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 507466 then -- 可點擊次數
				BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				BuffNumber = BuffLv
			end
		end
		if BuffNumber == 6 then  --lv7 
			if Checkflag( OwnerID(), 542193 ) == true and Checkflag( OwnerID(), 542192 ) == true and Checkflag( OwnerID(), 542191 ) == true then
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW15]" , 0 )	--畫面中間訊息 你目前沒有可領取的獎杯
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW15]" , 0 )	--訊息欄
			else
				if Checkflag( OwnerID(), 542193 ) == false then
					GivebodyItem(OwnerID(), 212711 , 1 ) --獎杯武器
					Setflag( OwnerID(), 542193 , 1 ) --給領取KEYITEM
				end
				if Checkflag( OwnerID(), 542192 ) == false then
					GivebodyItem(OwnerID(), 212712 , 1 ) --獎杯武器
					Setflag( OwnerID(), 542192 , 1 ) --給領取KEYITEM
				end
				if Checkflag( OwnerID(), 542191 ) == false then
					GivebodyItem(OwnerID(), 212713 , 1 ) --獎杯武器
					Setflag( OwnerID(), 542191 , 1 ) --給領取KEYITEM
				end
			end
		elseif BuffNumber >= 2 then --lv3
			if  Checkflag( OwnerID(), 542192 ) == true and Checkflag( OwnerID(), 542191 ) == true then
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW15]" , 0 )	--畫面中間訊息 你目前沒有可領取的獎杯
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW15]" , 0 )	--訊息欄
			else
				if Checkflag( OwnerID(), 542192 ) == false then
					GivebodyItem(OwnerID(), 212712 , 1 ) --獎杯武器
					Setflag( OwnerID(), 542192 , 1 ) --給領取KEYITEM
				end
				if Checkflag( OwnerID(), 542191 ) == false then
					GivebodyItem(OwnerID(), 212713 , 1 ) --獎杯武器
					Setflag( OwnerID(), 542191 , 1 ) --給領取KEYITEM
				end
			end
		elseif BuffNumber >= 0 then --lv1
			if Checkflag( OwnerID(), 542191 ) == true then
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW15]" , 0 )	--畫面中間訊息  你目前沒有可領取的獎杯
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW15]" , 0 )	--訊息欄
			else
				GivebodyItem(OwnerID(), 212713 , 1 ) --獎杯武器
				Setflag( OwnerID(), 542191 , 1 ) --給領取KEYITEM
			end
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW17]" , 0 )	--畫面中間訊息  你身上沒有[507466]效果，無法領取獎杯。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW17]" , 0 )	--訊息欄
	end

end

----坐騎購買-------------------------------
function lua_mika_beercontest_mount() --坐騎購買
	SetSpeakDetail( OwnerID(), "[SC_BEERDAY_NEW18]"   )  --租借[207958]需要支付5枚[203038]，持續1小時，確定租借嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_0908SEANSON_65]" , "lua_mika_beercontest_mountbuy", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_beercontest_03", 0 ) --回到上一層
end


function lua_mika_beercontest_mountbuy() --購買
	local coin = CountBodyItem(OwnerID(), 203038 ) --必爾汀代幣
	CloseSpeak(OwnerID())
	if coin >= 5 then 
		Delbodyitem(OwnerID(), 203038 , 5 ) -- 扣除 畢爾汀代幣X5
		GiveBodyItem(OwnerID(), 207958 , 1 ) --給坐騎*1
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_111813_YU_36]" , 0 )	--畫面中間訊息  你沒有足夠的<CS>[203038]</CS>！
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_111813_YU_36]" , 0 )	--訊息欄
	end
end

----參加活動-------------------------------
function lua_mika_beercontest_join() --參加
	local join = Checkflag(OwnerID(), 542190 ) --有報名
	CloseSpeak(OwnerID())
	if join == true then --今天報名過了
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_13]" , 0 )	--畫面中間訊息  你今天已經參加過囉。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_13]" , 0 )	--訊息欄
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW19]" , C_SYSTEM )	--畫面中間訊息  你的報名已經申請完成，請密切注意廣播活動開始訊息。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW19]" , C_SYSTEM )	--訊息欄
		WriteRoleValue(OwnerID(), EM_LuaValueFlag_UseItem10, 0 )  -- 清除上場分數
		Addbuff(OwnerID(), 506907 , 0 , 1260 ) -- 參加活動Buff  20分
		Setflag( OwnerID(), 542190, 1) --給參加活動flag
	end
end


----回報活動-------------------------------
function lua_mika_beercontest_back() --回報活動
	local beercount = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- 啤酒的數量
	local needmount = 15 --需求數量

--	Say(OwnerID(), beercount )
--	Say(OwnerID(), needmount )
	if beercount < needmount  then --小於npc需求數量
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW20]" , 0 )	--畫面中間訊息  你還沒有取得足夠數量的啤酒，無法回報活動。
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW20]" , 0 )	--訊息欄
	elseif beercount >= needmount  then  --大於需求數量
		CloseSpeak(OwnerID())
		Beginplot (TargetID(), "lua_mika_beercontest_back2" , 0)
	end
end

function  lua_mika_beercontest_back2() --回報活動2
	local beercount = ReadRoleValue ( TargetID() , EM_LuaValueFlag_UseItem10 ) -- 啤酒的數量(Player)
	local numberone = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1 )     --是否已有第一名產生  0為沒有, 1為有 (npc)
--	Say(OwnerID(), "ownerid" ) --npc
--	Say(TargetID(), "targetid" )  --player

	if numberone == 1 then  --已有人拿第一名
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_BEERDAY_NEW21]" , C_SYSTEM )	--畫面中間訊息  恭喜你達成活動目標，期望你下次能獲得第一名！
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_BEERDAY_NEW21]" , C_SYSTEM )	--訊息欄
		--取消活動狀態
		Cancelbuff(TargetID(), 506907 )
		--給道具
		GiveBodyItem(TargetID(), 205941 , 1 ) --啤酒節活動參加憑證
	else  --還沒有
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_BEERDAY_NEW22]" , C_SYSTEM )	--畫面中間訊息  恭喜你，你是本場次第一個回報活動者，
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_BEERDAY_NEW22]" , C_SYSTEM )	--訊息欄
		Sleep(10)
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_BEERDAY_NEW23]" , C_SYSTEM )	--畫面中間訊息  你將可獲得象徵冠軍的特殊效果！
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_BEERDAY_NEW23]" , C_SYSTEM )	--訊息欄
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1) --將npc改為已有人第一名 (npc)
		local score = ReadRoleValue ( TargetID() , EM_LuaValueFlag_UseItem10 ) -- 啤酒的數量(Player)
		local numberone = ReadRoleValue(OwnerID() , EM_RoleValue_Register+1 ) 
--		Say(OwnerID(), numberone )
--		Say(TargetID(), score)
		--廣播
		local Name =  GetName( TargetID() ) 
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 2 , "[SC_BEERDAY_NEW_CAST05][$SETVAR1="..Name.."]" )
		end
		-- 啤酒節活動『運酒快手』冠軍出爐囉，恭喜[$VAR1]獲得本次冠軍 ！
		--取消活動狀態
		Cancelbuff(TargetID(), 506907 )
		--給道具
		GiveBodyItem(TargetID(), 205941 , 1 ) --啤酒節活動參加憑證
		--給buff
		Sleep(10)
		local Count = BuffCount (TargetID())
		if Checkbuff(TargetID(), 507466 ) == true then --如果有這個buff
			for i = 0 , Count do
				local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
				if BuffID == 507466 then -- 可點擊次數
					BuffLv = BuffInfo ( TargetID() , i , EM_BuffInfoType_Power )
					BuffNumber = BuffLv
				end
			end
			if BuffNumber >= 6 then 
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_BEERDAY_NEW26]" , 0 )	--畫面中間訊息  你的冠軍效果等級已達上限，無法再提升等級。
				ScriptMessage( TargetID(), TargetID(), 0, "[SC_BEERDAY_NEW26]" , 0 )	--訊息欄
				CancelBuff( TargetID(),507466)		
				Addbuff( TargetID() , 507466 , BuffNumber , 604800 )  --7天
			else 
			--	Say( TargetID(), "Buff lv  up !" )
				CancelBuff( TargetID(),507466)		
				Addbuff( TargetID() , 507466 , BuffNumber+1 , 604800 )  --7天   --冠軍buff
			end
		else
			Addbuff( TargetID() , 507466 , 0 , 604800 )  --7天  --冠軍buff
		end
	end
end


-- 測試指令 
function lua_mika_beercontest_score(number)  -- 寫入目前分數

	 WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem10 , number ) -- +1
	local score = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- 啤酒的數量
	Say(OwnerID(), "Score become "..score)
end

function lua_mika_beercontest_buffup() -- 加冠軍buff   LV+1
	local Count = BuffCount ( OwnerID())
	if Checkbuff(OwnerID(), 507466 ) == true then --如果有這個buff
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 507466 then -- 可點擊次數
				BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				BuffNumber = BuffLv
			end
		end
		if BuffNumber >= 6 then 
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW26]" , 0 )	--畫面中間訊息  你的冠軍效果等級已達上限，無法再提升等級。
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW26]" , 0 )	--訊息欄
			CancelBuff(OwnerID(),507466)		
			Addbuff( OwnerID() , 507466 , BuffNumber , 604800 )  --7天
		else 
			CancelBuff(OwnerID(),507466)		
			Addbuff( OwnerID() , 507466 , BuffNumber+1 , 604800 )  --7天
		end
	else
		Addbuff( OwnerID() , 507466 , 0 , 604800 )  --7天
	end
end

-- 活動重置指令
function lua_mika_beercontest_reset()
	CancelBuff(OwnerID(),507466)   -- 取消冠軍buff
	CancelBuff(OwnerID(), 506907) 
	Setflag( OwnerID(), 542190, 0 )  -- 刪除每日旗標-運酒快手
	SetFlag( OwnerID() , 542191, 0)  --領取過1天獎杯
	SetFlag( OwnerID() , 542192, 0)  --領取過3天獎杯
	SetFlag( OwnerID() , 542193, 0)  --領取過7天獎杯
	Say(OwnerID(), "reset event")
end

-- 活動開始測試指令 (輸入98為活動開放報名, 輸入99為活動開始)
function lua_mika_beer_testbegin(value) --  
	local npc = LuaFunc_SearchNPCbyOrgID(OwnerID() , 121168, 200 , 0)       --活動NPC
	WriteRoleValue(npc, EM_RoleValue_PID, value)
	local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
	Say(npc, "pid ="..pid)
end

-- 活動buff結束時刪除分數
function lua_mika_beercontest_scorezero()
	WriteRoleValue(OwnerID(), EM_LuaValueFlag_UseItem10, 0 )  -- 清除上場分數
end