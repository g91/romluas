
-----------------------------------------------------------------------

function lua_beerfes_kors_00()--NPC對話劇情
--	DW_CancelTypeBuff( 68,  OwnerID() )-- 消除騎乘狀態

	local OID = OwnerID()
	local key = CheckFlag(OID,545614)  -- 已參加
	local key2 = CheckFlag(OID,545615)   -- 已喝完
	local key3 = CheckFlag(OID,545616)    -- 已領獎
	local point = ReadRoleValue( OID, EM_RoleValue_Register )

	if key3 == TRUE then   --已回報
		SetSpeakDetail(OID,"[SC_BEERFE_KORS_10]")  --  當天已完成過活動訊息
	else
		if key == true then  -- 報名過了
			if  key2 == true then
				SetSpeakDetail(OID,"[SC_BEERFE_KORS_08]")  -- 請盡情享用由我們必爾汀釀酒公會提供的各式啤酒。
				AddSpeakOption(OID,TargetID(),"[SC_BEERFE_KORS_09]","lua_beerfes_kors_aw",0)   -- 我已經喝過了。  (回報)
			else  -- 活動還沒結束
				SetSpeakDetail(OID,"[SC_BEERFE_KORS_08]")  -- 請盡情享用由我們必爾汀釀酒公會提供的各式啤酒。
			end
		else
			SetSpeakDetail(OID,"[SC_BEERFE_KORS_02]")  -- 現在正在舉行啤酒英雄競賽，不知道你有沒有興趣參加呢？
			AddSpeakOption(OID,TargetID(),"[SC_BEERFE_KORS_03]","lua_beerfes_kors_01",0)  -- 啤酒英雄競賽是...？  (介紹+ 報名)
			AddSpeakOption(OID,TargetID(),"[SC_BEERFE_KORS_05]","lua_beerfes_kors_gstar",0)  --   我想參加啤酒英雄競賽。   (  直接報名)
		end
	end
end

function lua_beerfes_kors_01()--活動開始前承接。
	SetSpeakDetail(OwnerID(),"[SC_BEERFE_KORS_04]")   -- 活動規則
	AddSpeakOption(OwnerID(),TargetID(),"[SC_BEERFE_KORS_05]","lua_beerfes_kors_gstar",0)  -- 我想參加[SC_BEERFE_KORS_00]。
end


function lua_beerfes_kors_gstar()--活動開始。
	local OID = OwnerID()
	CloseSpeak(OID)
	local Lv = ReadRoleValue( OID , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( OID , EM_RoleValue_LV_SUB )

	local bufftime = 90
	ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_18]", C_SYSTEM)      --    現在就點選酒桶，盡情大口暢快地喝吧！
	AddBuff(OID,620973,1, bufftime )  -- buff  無限暢飲啤酒憑證
	WriteRoleValue(OID,EM_RoleValue_Register,0)
	SetFlag(OID,545614,1)   --  給KEY  當天已參加
	DesignLog( OID , 119548 , "Lv = "..Lv.." SubLv = "..SubLv )  --回傳活動參與值
end

-----------------------------------------------------------------------

-- 點酒桶劇情	
function lua_beerfes_kors_drinks()
	setplot(OwnerID(), "touch", "lua_beerfes_kors_drinks2", 30  )
end

function lua_beerfes_kors_drinks2()--取酒
	local OID = OwnerID()
	local act = CheckBuff( OID,620973)

	if act == TRUE then 
		CastSpell(OID, OID, 498384)  --  酒 施法
	else
		local point = ReadRoleValue( OID,EM_RoleValue_Register)
		if point > 0 then  -- 有分數
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_17]",C_SYSTEM )  -- 請向[119548]回報你的成績吧。
		else
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_06]",0 )  -- 請先跟[119548]領取[620973]才能盛酒
		end
	end
end

-- 基本法術執行
function lua_beerfes_kors_drinks3()
	local OID = OwnerID()
	local bufftime = 600

	local R = Rand(100)+1

--	PlayMotion( OID, ruFUSION_ACTORSTATE_EMOTE_DRINK ) --播放喝的動作
	AttachCastMotionTool( OID , 212075 ) --置換武器為啤酒杯

	if R <= 48 then
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, (nowlv+5), bufftime )    --  增加酒醉值
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	

		if (beerlv+1) > 99 then  -- 超過99
			Beginplot(OID, "lua_beerfes_kors_over99",  0 )  -- 超過99
		else
			if  (beerlv+1) >= 70 then
				ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_16]", 0 )     --	啤酒確實不錯，但是你感覺到一股醉意襲來。
			end
			AddRoleValue(OID, EM_RoleValue_Register, 1  )
			local point = ReadRoleValue( OID,EM_RoleValue_Register )
			ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    目前獲得的分數是：
		end
	elseif R >= 49 and R <= 83  then
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, (nowlv+10), bufftime )    --  增加酒醉值
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	

		if (beerlv+1) > 99 then  -- 超過99
			Beginplot(OID, "lua_beerfes_kors_over99",  0 )  -- 超過99
		else
			if  (beerlv+1) >= 70 then
				ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_16]", 0 )     --	啤酒確實不錯，但是你感覺到一股醉意襲來。
			end			
			AddRoleValue(OID, EM_RoleValue_Register, 1  )
			local point = ReadRoleValue( OID,EM_RoleValue_Register )
			ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    目前獲得的分數是：
		end
	elseif R >= 84 and R <= 93  then
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, (nowlv+20), bufftime )    --  增加酒醉值
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	

		if (beerlv+1) > 99 then  -- 超過99
			Beginplot(OID, "lua_beerfes_kors_over99",  0 )  -- 超過99
		else
			if  (beerlv+1) >= 70 then
				ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_16]", 0 )     --	啤酒確實不錯，但是你感覺到一股醉意襲來。
			end
			AddRoleValue(OID, EM_RoleValue_Register, 1  )
			local point = ReadRoleValue( OID,EM_RoleValue_Register )
			ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    目前獲得的分數是：
		end

	elseif R >= 94  and R<= 98 then
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, (nowlv+30), bufftime)    --  增加酒醉值
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	

		if (beerlv+1) > 99 then  -- 超過99
			Beginplot(OID, "lua_beerfes_kors_over99",  0 )  -- 超過99
		else
			if  (beerlv+1) >= 70 then
				ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_16]", 0 )     --	啤酒確實不錯，但是你感覺到一股醉意襲來。
			end
			AddRoleValue(OID, EM_RoleValue_Register, 1  )
			local point = ReadRoleValue( OID,EM_RoleValue_Register )
			ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    目前獲得的分數是：
		end
	elseif  R>= 99  then   --直接寫入99 
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
		CancelBuff(OID, 620979 )
		AddBuff (OID,620979, 98 , bufftime )    --  增加酒醉值99
		local beerlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
	--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	
		ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_07]", 0 )     -- 你已完全沉浸在迷濛的醉意當中，去清醒一下吧
		AddRoleValue(OID, EM_RoleValue_Register, 1  )
		local point = ReadRoleValue( OID,EM_RoleValue_Register )
		ScriptMessage(OID, OID,1,"[SC_BEERFE_KORS_19]"..point, C_SYSTEM)      --    目前獲得的分數是：
	end
end

function lua_beerfes_kors_over99()
	local OID = OwnerID()
	local beerlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
	local point = ReadRoleValue(OID,EM_RoleValue_Register)

	ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_13]",0 )  -- 喝了這杯你感覺到一陣天旋地轉。似乎是不能再喝了。
	CancelBuff(OID,620973)  --活動用酒杯
end


-- 點水桶劇情	
function lua_beerfes_kors_water()
	setplot(OwnerID(), "touch", "lua_beerfes_kors_water2", 30  )
end

function lua_beerfes_kors_water2() --取水
	local OID = OwnerID()
	local act = CheckBuff( OID,620973)

	if act == TRUE then 
		local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  

		if nowlv <= 0 or CheckBuff(OID, 620979) == false then
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_15]", 0 )  -- 你還很清醒，先別喝水吧
		else  --  酒醉值大於71
				CastSpell(OID, OID, 498385)  --  酒 施法
		end
	else
		local point = ReadRoleValue( OID,EM_RoleValue_Register)
		if point > 0 then  -- 有分數
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_17]",C_SYSTEM )  -- 請向[119548]回報你的成績吧。
		else
			ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_06]",0 )  -- 請先跟[119548]領取[620973]才能盛酒
		end
	end
end

-- 基本法術執行
function lua_beerfes_kors_water3()
	local OID = OwnerID()
	local beerlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  

		ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_14]", C_SYSTEM )  -- 喝下了清水，感覺到精神好了一點。

		local R = Rand(100)+1
		AttachCastMotionTool( OID , 212075 ) --置換武器為啤酒杯

		if R <= 48 then
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
			local value = 5

			CancelBuff(OID, 620979 )
			if nowlv <= value then -- 目前bufflv <= 5 ,
				AddBuff (OID,620979, 0 , 300)    --   降低酒醉值
			else	
				AddBuff (OID,620979, (nowlv-value), 300)    --   降低酒醉值
			end
		elseif R >= 49 and R <= 83  then
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  

			local value = 10
			CancelBuff(OID, 620979 )
			if nowlv <= value then -- 目前bufflv <= 5 ,
				AddBuff (OID,620979, 0 , 300)    --   降低酒醉值
			else	
				AddBuff (OID,620979, (nowlv-value), 300)    --   降低酒醉值
			end
		elseif R >= 84 and R <= 93  then
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  

			local value = 20
			CancelBuff(OID, 620979 )
			if nowlv <= value then -- 目前bufflv <= 5 ,
				AddBuff (OID,620979, 0 , 300)    --   降低酒醉值
			else	
				AddBuff (OID,620979, (nowlv-value), 300)    --   降低酒醉值
			end
		elseif R >= 94  and R<= 98 then
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  

			local value = 30
			CancelBuff(OID, 620979 )
			if nowlv <= value then -- 目前bufflv <= 5 ,
				AddBuff (OID,620979, 0 , 300)    --   降低酒醉值
			else	
				AddBuff (OID,620979, (nowlv-value), 300)    --   降低酒醉值
			end

		elseif  R>= 99 then   --直接寫入0
			local nowlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
			CancelBuff(OID, 620979 )
			AddBuff (OID,620979, 0, 300)    --  設為1
			local beerlv = FN_CountBuffLevel(OID, 620979 )  -- 酒醉值等級  
		--	Say(OID, "now beer lv is "..(nowlv+1).."to "..(beerlv+1) )	
		end

end
---------------------------------------------------------------------------------------------
 
-- 基本法術-  活動buff結束  執行劇情
function lua_beerfes_kors_timeup()
	local OID = OwnerID()
	ScriptMessage(OID,OID,1,"[SC_BEERFE_KORS_11]", C_SYSTEM )  --  活動結束，請向[119548]回報你的成績吧。
	SetFlag(OID,545615,1)   -- 當天已結束
	AttachCastMotionTool( OID , 212076 ) -- 將武器置換成空手
end

function lua_beerfes_kors_aw() --給獎
	local OID = OwnerID()
	local point = ReadRoleValue( OID, EM_RoleValue_Register )
	local Lv = ReadRoleValue( OID , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( OID , EM_RoleValue_LV_SUB )

 	if CheckBuff(OID, 620979) == true then  -- 活動結束後, 且有酒醉值buff
		SetSpeakDetail( OID,"[SC_BEERFE_KORS_10]")  -- 當天已完成活動訊息
		if point <= 5  then  
			GiveBodyItem(OID, 724509, 1)  -- 必爾汀藥水X1
		elseif point >= 6  and point <= 15 then
			GiveBodyItem(OID, 205941, 1)
		elseif point >= 16 and point <= 25 then
			GiveBodyItem(OID, 205941, 1)
			GiveBodyItem(OID, 205895, 1)   -- 扭結餅X1 EXP+ 10%
		elseif point >= 26 then
			GiveBodyItem(OID, 205941, 2 )
			GiveBodyItem(OID, 205895, 1)   -- 扭結餅X1 EXP+ 10%
			GiveBodyItem(OID, 205897, 1)   -- 脆皮香腸X1 TP+ 10%
			if point >= 31 then
				if CountBodyItem(OID, 530857)  == 0 then
					GiveBodyItem(OID,530857,1)
				end
			end

		end
		CancelBuff(OID, 620979 )  -- 酒醉值
	else  -- 給安慰獎
		SetSpeakDetail( OID,"[SC_BEERFE_KORS_12]")  --  沒有酒醉BUFF ( 太久沒回報, 換區或離線) 
		-- 看起來你好像醉意減退了不少，還是感謝你參與本次活動！
		GiveBodyItem(OID, 724509, 1)  -- 必爾汀藥水X1
	end

	DesignLog( OID , 1195481 , "Lv = "..Lv.." SubLv = "..SubLv )  --回傳活動參與值
	SetFlag(OID,545616,1)
	WriteRoleValue(OID,EM_RoleValue_Register,0)
	Lua_Festival_09_All(OID)  
end


---------------    測試指令 ---------------------------------

-- 重置活動
function lua_beerfes_kors_re()
	local OID = OwnerID()
	SetFlag(OID,545614,0)	
	SetFlag(OID,545615,0)
	SetFlag(OID,545616,0)
	CancelBuff_NoEvent(OID, 620973)  -- 活動用酒杯
 	CancelBuff(OID, 620979 )  -- 酒醉值
	AttachCastMotionTool( OID , 212076 ) -- 將武器置換成空手
	WriteRoleValue(OID,EM_RoleValue_Register,0)
end

-- 讓酒醉值為99
function lua_beerfes_beerlv99test()
	local OID = OwnerID()
 	CancelBuff(OID, 620979 )  -- 酒醉值
	AddBuff(OID, 620979, 98, 300 )
end

-- 直接寫入分數為特定值
function lua_beerfes_scoretest(score)
	local OID = OwnerID()
	WriteRoleValue(OID,EM_RoleValue_Register, score )
	local number = ReadRoleValue(OID, EM_RoleValue_Register )
	Say(OID, "beer score ="..number )
end

--------------------------  南瓜節用的 不能動 ----------------------

function luaI_BEERFES_240742()
	local lv = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if lv <= 20 then
		BeginPlot(OwnerID(),"TPPill_203064",0)
	elseif lv > 20 and  lv<= 40 then
		BeginPlot(OwnerID(),"TPPill_203580",0)
	elseif lv >40 and lv <=50 then 	
		BeginPlot(OwnerID(),"TPPill_203065",0)
	elseif lv>50  and lv <=60 then
		BeginPlot(OwnerID(),"TPPill_203066",0)
	elseif lv>60 then
		BeginPlot(OwnerID(),"TPPill_203067",0)
	end
end


function luaI_BEERFES_240741()
	local lv = ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	if lv <= 40 then
		BeginPlot(OwnerID(),"luaI_BEERFES_240741_1",0)
	elseif lv > 40 then
		BeginPlot(OwnerID(),"luaI_BEERFES_240741_2",0)
	end
end

function luaI_BEERFES_240741_1()
	local itemset = { 60 ,""	, { 240743,1 }
		        , 95 , ""	, { 240744,1 }
		       , 100,""	, { 240745,1 } }

	return BaseTressureProc(   itemset , 1  )
end

function luaI_BEERFES_240741_2()
	local itemset = { 50 ,""	, { 240743,1 }
		        , 85 , ""	, { 240744,1 }
		        , 95 , ""	, { 240745,1 }
		       , 100,""	, { 240746,1 } }

	return BaseTressureProc(   itemset , 1  )
end