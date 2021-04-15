function LuaI_MSG_PUBLIC()
	local hour = 0
	local min = 0
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	
	while 1 do
		hour = GetSystime(1)
		min = GetSystime(2)

	--	if GetSystime(1) == 11 and  GetSystime(2) == 30 then
	--		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_1") ) --凡瑞娜絲建設活動將於30分鐘後開始。
	--		end 
	--	end 
	--	if GetSystime(1) == 11 and  GetSystime(2) == 50 then
	--		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_2") ) --凡瑞娜絲建設活動將於10分鐘後開始。
	--		end
	--	end 
	--	if GetSystime(1) == 11 and  GetSystime(2) == 55 then
	--		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_3") ) --凡瑞娜絲建設活動將於5分鐘後開始。
	--		end 
	--	end 
	--	if GetSystime(1) == 12 and  GetSystime(2) == 0 then
	--		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_4") ) --凡瑞娜絲建設活動已開始，請向凡瑞娜絲城的伊米葳勒報名。
	--		end 
	--	end 
	--	if GetSystime(1) == 12 and  GetSystime(2) == 50 then
	--		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_5") ) --凡瑞娜絲建設活動將於10分鐘後結束，請未完成者盡速回到凡瑞娜絲城。
	--		end 
	--	end
	--	if GetSystime(1) == 13 and  GetSystime(2) == 0 then
	--		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_6") ) --凡瑞娜絲建設活動已經結束。
	--		end 	
	--	end 

		if GetSystime(1) == 17 and  GetSystime(2) == 30 then

		end 
		if GetSystime(1) == 17 and  GetSystime(2) == 50 then

		end 
		if GetSystime(1) == 17 and  GetSystime(2) == 55 then

		end 
		if GetSystime(1) == 18 and  GetSystime(2) == 0 then

		end 
		if GetSystime(1) == 19 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("SC_AMES_BORN") ) 		--銀湧之野聚集了大量的風元素，引來了風之精靈「艾米娜」。
			end
		end 
	--	if GetSystime(1) == 19 and  GetSystime(2) == 30 then
	--		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_1") ) --凡瑞娜絲建設活動將於30分鐘後開始。
	--		end
	--	end 
	--	if GetSystime(1) == 19 and  GetSystime(2) == 50 then
	--		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_2") ) --凡瑞娜絲建設活動將於10分鐘後開始。
	--		end
	--	end 
	--	if GetSystime(1) == 19 and  GetSystime(2) == 55 then
	--		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--			RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_3") ) --凡瑞娜絲建設活動將於5分鐘後開始。
	--		end
	--	end 
		if GetSystime(1) == 20 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_4") ) --凡瑞娜絲建設活動已開始，請向凡瑞娜絲城的伊米葳勒報名。
				RunningMsg( OwnerID() , 2 ,  GetString("SC_AMES_CLEAR") ) 		--隨著時間的消逝，風元素漸漸減少，風之精靈「艾米娜」離開了銀湧之野。
			end
		end 
--		if GetSystime(1) == 20 and  GetSystime(2) == 50 then
--			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_5") ) --凡瑞娜絲建設活動將於10分鐘後結束，請未完成者盡速回到凡瑞娜絲城。
--			end
--		end
--		if GetSystime(1) == 21 and  GetSystime(2) == 0 then
--			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("QUESTPK_MSG_MINE_KILLER_6") ) --凡瑞娜絲建設活動已經結束。
--			end
--		end 		
		if  ( hour == 21 and min  == 40 ) then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_1") )	-- 血腥迴廊裡的蝙蝠群開始蠢蠢欲動。
			end
		end 
		if  ( hour == 21 and min  == 50 ) then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_2") )	-- 血腥迴廊裡的蝙蝠群開始蠢蠢欲動，傳送結界即將開啟。
			end
		end 
		if  ( hour == 22 and min  == 0 ) then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_3") )	-- 血腥迴廊的結界開啟，蝙蝠群一湧而出！！
			end
		end 
		if  ( hour == 0 and min  == 0 ) then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("BLOODYGALLERY_OPEN_4") )	-- 血腥迴廊的蝙蝠群吸取了飽滿的鮮血回巢，傳送結界已經關閉！！
			end
		end 
--		if  ( hour == 17 and min  == 50 ) then
--			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_LOVE_ACTION_1") )		-- 愛意之戒保護行動將於10分鐘後開始。
--			end
--		end
--		if  ( hour == 18 and min  == 0 ) then
--			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_LOVE_ACTION_2") )		-- 愛意之戒保護行動已開始，請向凡瑞娜絲城東區的羅密報名。
--			end
--		end
--		if  ( hour == 19 and min  == 50 ) then
--			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_LOVE_ACTION_3") )		-- 愛意之戒保護行動將於10分鐘後結束，請未完成者儘速完成。
--			end
--		end
--		if  ( hour == 20 and min  == 0 ) then
--			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_LOVE_ACTION_4") )		-- 愛意之戒保護行動已經結束。
--			end
--		end
--		if (hour > 10  or hour < 23) and (min == 55) then
--			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_111284_1") )	-- 聖火試鍊的秘境將在五分鐘後開放
--			end
--		end
--		if (hour > 11) and (min == 0) then
--			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_111284_2") )	-- 想接受聖火試鍊的玩家請找奧提尼各！
--			end
--		end
--		if (hour > 11) and (min == 40) then
--			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
--				RunningMsg( OwnerID() , 2 ,  GetString("SC_111284_10") )	-- 聖火試鍊的秘境已關閉
--			end
--		end
		sleep( 300 )

	end

end