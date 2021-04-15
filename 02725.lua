function lua_skwerl_mobius_tp_stone(amount, mode, player) --計時模式的TP石抽獎(amount=給的次數) mode=模式 
--在生存模式中，每給一次零件，得到零件A的機率是30%，零件B的機率是70%。--mode= 0
--在計時模式中，每給一次零件，得到零件A的機率是70%，零件B的機率是30%。--mode=1
	for i= 1, amount, 1 do
		local random=rand(10) --抽獎
   		if random>2 then  --70%的獎
			if mode==0 then
				givebodyitem(player,  241648, 1)	--在生存模式中零件B的機率是(70%)					
			elseif mode==1 then 
   				givebodyitem(player,  241647, 1)  --在計時模式中給零件A機率 (70%)
			end
   		else --30%獎
			if mode==0 then
				givebodyitem(player,  241647, 1)  --在生存模式中給零件A機率 (30%)
			elseif mode==1 then 
   				givebodyitem(player,  241648, 1) --在計時模式中給零件B機率 (30%)
			end
   		end
	end
end

function lua_skwerl_mobius_prizeroll(player, mode, rank, playerscore) --依照分數而定的抽獎系統 mode==遊戲模式(0=生存模式 1=計時模式) rank==分數表現層級、玩家分數
--這是依照獎勵文件寫出來的判斷系統，應該由玩家執行--(把這個function套到遊戲結束給獎勵的function裡)
	local Random= Rand(100)
	
	if rank=="A" then
		-- 2013.05.13 新增，6.0.1 活動副本獎勵調整	單場分數 3300 以上
		Hao_Monetary_Union_240181( player , 30 )	-- 給予必爾汀圓貝
		--
		if Random > 0 and  Random <=29 then
			lua_skwerl_mobius_time_prize_A(player, mode)
		else
			 lua_skwerl_mobius_time_prize_B(player, mode)
		end
	elseif rank=="B" then
		-- 2013.05.13 新增，6.0.1 活動副本獎勵調整	單場分數 2700  ~ 3299
		Hao_Monetary_Union_240181( player , 30 )	-- 給予必爾汀圓貝
		--	
		if Random > 0 and  Random <=10 then
			lua_skwerl_mobius_time_prize_A(player, mode)
		elseif Random > 10 and Random <=70 then
			 lua_skwerl_mobius_time_prize_B(player, mode)		
		else
			lua_skwerl_mobius_time_prize_C(player, mode)
		end
	elseif rank=="C" then
		-- 2013.05.13 新增，6.0.1 活動副本獎勵調整	單場分數 2100 ~ 2699
		Hao_Monetary_Union_240181( player , 20 )	-- 給予必爾汀圓貝
		--
		if Random > 0 and  Random <=6 then
			lua_skwerl_mobius_time_prize_A(player, mode)
		elseif Random > 6 and Random <=36 then
			 lua_skwerl_mobius_time_prize_B(player, mode)		
		elseif Random > 36 and Random <=76 then
			lua_skwerl_mobius_time_prize_C(player, mode)		
		else
			givebodyitem(player,  725449, 1) --給公會資源
		end
	elseif rank=="D" then
		-- 2013.05.13 新增，6.0.1 活動副本獎勵調整	單場分數 2099 以下
		if playerscore ~= 0 then
			Hao_Monetary_Union_240181( player , 10 )	-- 給予必爾汀圓貝
		end
		--		
		if Random > 0 and  Random <=3 then
			lua_skwerl_mobius_time_prize_A(player, mode)
		elseif Random > 3 and Random <=13 then
			 lua_skwerl_mobius_time_prize_B(player, mode)		
		elseif Random > 13 and Random <=46 then
			lua_skwerl_mobius_time_prize_C(player, mode)
		else
			givebodyitem(player,  725449, 1) --給公會資源
		end
	end
	-- 2013.05.13 新增，6.0.1 活動副本獎勵調整	
	DesignLog( player , 360 , "Playerscore : "..playerscore )
	--
end
-------------------------------獎勵script--------------------------------------
function lua_skwerl_mobius_time_prize_A(player, mode) --A級獎 (零件x3 公會資源x3) mode=遊戲模式 生存模式=mode 0 計時模式=mode 1
	lua_skwerl_mobius_tp_stone(3, mode, player) --給3次零件 
	givebodyitem(player,  725449, 1) --給公會資源
	givebodyitem(player,  725449, 1) --給公會資源
	givebodyitem(player,  725449, 1) --給公會資源
end

function lua_skwerl_mobius_time_prize_B(player, mode) --B級獎(零件x2 公會資源x2)  mode=遊戲模式 生存模式=mode 0 計時模式=mode 1
	lua_skwerl_mobius_tp_stone(2, mode, player) --給2次零件 
	givebodyitem(player,  725449, 1) --給公會資源
	givebodyitem(player,  725449, 1) --給公會資源
end

function lua_skwerl_mobius_time_prize_C(player, mode) --C級獎(零件x1 公會資源x1)mode=遊戲模式 生存模式=mode 0 計時模式=mode 1
	lua_skwerl_mobius_tp_stone(1, mode, player) --給1次零件 
	givebodyitem(player,  725449, 1) --給公會資源
end
-------------------------------兌換憑證獎勵script--------------------------------------
function lua_FN_mobius_NPCtrade_reward()
	local player = OwnerID()
	local CountA = CountBodyItem( player, 241647 )
	local CountB = CountBodyItem( player, 241648 )

	if CountA >= 1 and CountB >= 1 then
		DelBodyItem( player, 241647, 1 )
		DelBodyItem( player, 241648, 1 )
		if Rand(5) == 0 then
			GiveBodyItem( player, 725659, 1)
		else
			GiveBodyItem( player, 720612, 1)
		end
		-- 2013.05.13 新增，6.0.1 活動副本獎勵調整
		GiveBodyItem( player , 726135, 1 )	-- 公會工具箱配方
		GiveBodyItem( player , 205817, 1 )	-- 征服者的戰利品
		--
	else
		SetSpeakDetail(player, "[SKWERL_MOBIUS_48]" )
	end
	CloseSpeak(player)
end

function Hao_mobius_set_score(Score)	-- 2013.05.13 測試用指令，調整分數使用

	local Player = OwnerID()
	local BuffID = 622402	-- 分數id

	if CheckBuff( Player , BuffID ) == true or Score == 0 then
		CancelBuff_NoEvent( Player , BuffID )
	end
	AddBuff( Player , BuffID , Score-1 , -1)	-- 給予分數
end