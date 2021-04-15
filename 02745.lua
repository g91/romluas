---------------------------------------------------------
--		2013 01 詠火節 全勤獎	(5.0.8 ) 	--
---------------------------------------------------------
function Lua_Festival_01_All(PlayerID) 

	local Allcheck = true
	local KeyItemTable = {
				547380 ,	--符文棋盤
				547369 	--奔跑吧火焰
						 }

	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 0 )  -- 2012. 9月啤酒節活動 為等級0  ( 注意: 6.0.0 的節慶 記得要改BUFF等級)
		DesignLog( PlayerID , 1221801 , "festival - 1  , join all event" ) -- 獲得全勤獎計次 (6.0.1後)
	end
end

---------------------------------------------------------
--		2013  花神節全勤獎( 5.0.7 )	 --
---------------------------------------------------------
function Lua_Festival_02_All(PlayerID) --原本是2月的花神節

	local Allcheck = true
	local KeyItemTable = {
				547360 ,	--玫瑰階梯
				547354 	--收集祝福
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 0 )  -- 2012. 9月啤酒節活動 為等級0
		DesignLog( PlayerID , 1221802 , "festival - 2  , join all event" ) -- 獲得全勤獎計次 (6.0.1後)
	end
end



---------------------------------------------------------
--		2013 05 愛樂節全勤獎(6.0.0)	--
---------------------------------------------------------
function Lua_Festival_05_All(PlayerID) 

	local Allcheck = true
	local KeyItemTable = {
				547704 ,	--轉吧!留聲機
				547578 	--愛樂守球員
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 1 ) -- ( 注意: 6.0.0 的節慶 記得要改BUFF等級，0 →１)
		DesignLog( PlayerID , 1221805 , "festival - 6 , join all event" ) -- 獲得全勤獎計次 (6.0.1後)
	end
end


---------------------------------------------------------
--		2013 06 巧藝節 全勤獎(6.0.1)	--
---------------------------------------------------------

-- 6.0.1 加入全勤獎 desgin log , 之後請統一加入

function Lua_Festival_06_All(PlayerID) 
	local Allcheck = true
	local KeyItemTable = {
				546708 ,	--發明家的機器
				546707 ,	-- 製造大躍進
				543897 ,	-- 巧匠的好幫手 活動1更新
				548009  	-- 2013新活動- 扭轉動力    
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 1 ) -- 6.0.0 以後的節慶, buff等級為1 
		DesignLog( PlayerID , 1221806 , "festival - 6 , join all event" ) -- 獲得全勤獎計次 (6.0.1後)
	end
end

---------------------------------------------------------
--		2013 06 綵織節 全勤獎(6.0.2)	--
---------------------------------------------------------
-- 6.0.1 加入全勤獎 desgin log , 之後請統一加入

function Lua_Festival_07_All(PlayerID) 
	local Allcheck = true
	local KeyItemTable = {
		546728, -- 魔幻織布機
		546864, -- 魔法裁縫師
		546876,  -- 慈善拍賣會
		548131  -- 決戰時裝搭配大師 (2013 新活動)
		}

	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 1 ) -- 6.0.0 以後的節慶, buff等級為1 
		DesignLog( PlayerID , 1221807 , "festival - 7 , join all event" ) -- 獲得全勤獎計次 (6.0.1後)
	end
end
---------------------------------------------------------
--		2013童話節全勤獎 (6.0.3 )	--
---------------------------------------------------------

--function FN_FairyTale2012_All(PlayerID)
function Lua_Festival_08_All(PlayerID) --2013
	local Allcheck = true
	local KeyItemTable = {
				546901, --牧牛少年
				541322, --話劇大賞
				546907 --討伐巨龍
				}

	for i=1,table.getn(KeyItemTable) do
		if CheckFlag(PlayerID, KeyItemTable[i]) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive(PlayerID, 1 )  -- 2013. 8月童話節活動 改為等級1
		DesignLog( PlayerID , 1221808 , "festival - 8 , join all event" ) -- 獲得全勤獎計次 (6.0.1後)
	end
end


---------------------------------------------------------
--  (6.0.4 ) 2012 09 果汁節全勤獎		--
---------------------------------------------------------
function Lua_Festival_09_All(PlayerID) --2012
	local Allcheck = true
	local KeyItemTable = {
				545616, --90秒無限暢飲
				541866, --完成瘋狂酒保任務		
				546925, --捕捉波奇
				545751  --啤酒節四個任務的每日
				}
	local KeyItemTablePlus = {545746, 545747, 545748, 545749}	--啤酒節四個任務的每日判斷用的Key

	for i=1,table.getn(KeyItemTable) do
		if CheckFlag(PlayerID, KeyItemTable[i]) == false then
			Allcheck = false
		end
	end

	for i=1,table.getn(KeyItemTablePlus) do
		if CheckFlag(PlayerID, KeyItemTablePlus[i]) == true then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive(PlayerID, 1 )  -- 2013. 9月果汁節活動 改為等級1
		DesignLog( PlayerID , 1221809 , "festival - 9  , join all event" ) -- 獲得全勤獎計次 (6.0.1後)
	end
end

---------------------------------------------------------
--		2012 10 南瓜節全勤獎		--
---------------------------------------------------------
function Lua_Festival_10_All(PlayerID)	-- 2012.10 南瓜節全勤獎

	local Allcheck = true
	local KeyItemTable = {
				547019 ,	--幽靈農場
				547021 , 	--抓鬼大師
				547026 ,	--今天需要點尖叫
				547086		-- 瑪拉鬼屋
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 1 )  -- 2012. 9月啤酒節活動 為等級0
		DesignLog( PlayerID , 1221810 , "festival - 10  , join all event" ) -- 獲得全勤獎計次 (6.0.1後)
	end
end

---------------------------------------------------------
--		2012 11 祈願節全勤獎		--
---------------------------------------------------------
function Lua_Festival_11_All(PlayerID)

	local Allcheck = true
	local KeyItemTable = {
				547130 ,	--偷蛋小賊
				547135 , 	--鶴鴕密碼
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 0 )  -- 2012. 9月啤酒節活動 為等級0
		DesignLog( PlayerID , 1221811 , "festival - 10  , join all event" ) -- 獲得全勤獎計次 (6.0.1後)
	end
end

---------------------------------------------------------
--		2013 12 暖冬節全勤獎		--
---------------------------------------------------------
function Lua_Festival_12_All(PlayerID)

	local Allcheck = true
	local KeyItemTable = {
				547323 ,	
				547324 , 	
				547325 ,
				547326 ,
				547327 ,
				547328 ,
				547330 ,
				547331 ,
				547332 ,
				547333 ,
				547334 ,
				547335 ,
				547336 ,
				547337 ,
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		for x=1 , #(KeyItemTable) , 1 do
			SetFlag( PlayerID, KeyItemTable[x], 0 )
		end
		lua_mika_festivalbuffgive( PlayerID , 1 )  -- 2013. 12月暖冬節活動 為等級1
		DesignLog( PlayerID , 1221812 , "festival - 10  , join all event" ) -- 獲得全勤獎計次 (6.0.5後)
	end
end