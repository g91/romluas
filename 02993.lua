function Hao_GuildWar_206660()	-- 魔燄塔
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102485 )
end

function Hao_GuildWar_206661()	-- 電能塔
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102486 )
end

function Hao_GuildWar_206662()	-- 聖光樹
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102484 )
end

function Hao_GuildWar_206663()	-- 榮譽之心
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102483 )
end

function Hao_GuildWar_206664()	-- 汲能塔
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102481 )
end

function Hao_GuildWar_206665()	-- 視覺幻境
	CallPlot( OwnerID() , "Hao_GuildWar_Battle_Tower" , 102482 )
end

function Hao_GuildWar_Battle_Tower(TowerID)	-- 2013.06.26 召喚塔重寫劇情

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取得玩家當前座標
	local PlayerCamp = GetRoleCampID(Player )	-- 取得玩家陣營
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- 取得Server上 Global.ini 允許的玩家最高等級
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	
	local Tower = CreateObj( TowerID , X , Y , Z , Dir , 1 )	-- 建立電能塔
	SetModeEx( Tower , EM_SetModeType_Mark , true )	-- 標記
	SetModeEx( Tower , EM_SetModeType_HideName , true )	-- 名稱
	SetModeEx( Tower , EM_SetModeType_ShowRoleHead , true )	-- 頭像框
	SetModeEx( Tower , EM_SetModeType_Fight , true )	-- 可砍殺攻擊
	SetModeEx( Tower , EM_SetModeType_Move , false )	-- 移動
	SetModeEx( Tower , EM_SetModeType_Obstruct , false )	-- 阻擋
	
	WriteRoleValue( Tower , EM_RoleValue_LV , ServerMaxLv )	-- 將最高等級寫入至塔中
	WriteRoleValue( Tower , EM_RoleValue_Register+1 , 38 )	-- 記錄為大型建築物，避免影行者的移形幻影可直接穿牆使用
	SetRoleCampID( Tower , PlayerCamp )--寫入陣營

	-- 2013.07.31 阿浩:修正公會城戰物品 - 召喚術：汲能塔(206664)，召喚出的汲能塔(102481)無法汲取能量的問題。(調整能量的函式無法由Npc執行，所以修改為玩家執行)
	if TowerID == 102481 then
		CallPlot( Tower , "Hao_GuildWar_Crystal_Extraction_Gem" , Player )	-- 將玩家代入由汲能塔執行的劇情中。
	end
	--
	SetPlot( Tower , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	-- 觸碰劇情
	SetPlot( Tower , "dead" , "Yuyu_GWB_Tower_dead" , 0 )	-- 死亡劇情

	-- 以下判斷玩家是否有學習防禦工程之科技
	local SetA = -1
	local Count = BuffCount(Player)
	for i = 0 , Count , 1 do
		local BuffID = BuffInfo( Player , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
		if BuffID == 505314 then	-- 玩家習得的防禦工程等級
			local BuffLv = BuffInfo( Player , i , EM_BuffInfoType_Power )	--該建築第 j 個BUFF的等級
			SetA = BuffLv
			break
		end
	end

	if SetA > -1 then
		AddBuff( Tower , 505511 , SetA , -1 )	-- 建築物的防禦工程等級
	end
	AddBuff( Tower , 505921 , 84 , -1 )	-- 減少被玩家傷害量85%
	AddBuff( Tower , 502707 , 0 , -1 )	-- 停止自動回HP、SP、MP
	AddToPartition( Tower , Room )
end

function Hao_GuildWar_Place_Tower_Check()	-- 施放前檢查

	-- 2013.06.24 阿浩:使用物品時，新增檢查，如果範圍內有指定物件，則無法建立。
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Zone = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Voc = ReadRoleValue( Player , EM_RoleValue_VOC )	-- 職業
	local Vehicles = CheckFlag( Player , 543769 )	-- 玩家是否在載具上

	if ( Zone == 402 or Zone >= 900 ) or Voc == 0 then	-- 當區域在公會城戰場、測試區或職業為 gm 時..
		if ReadRoleValue( Player , EM_RoleValue_PID ) == 1 then
			ScriptMessage( Player , Player , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )	-- 忙碌中，請稍候再試。
			return false
		elseif Vehicles == true then	-- 玩家在載具上
			ScriptMessage( Player , Player , 1 , "[SC_YU_GUILDWAR_BUILD_86]" , 0 )	-- 載具上無法使用
			ScriptMessage( Player , Player , 0 , "[SC_YU_GUILDWAR_BUILD_86]" , 0 ) 
			return false
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_DAN_111700_37]", C_SYSTEM )	-- 你無法在此區域使用該物品！
		ScriptMessage( Player , Player , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
		return false
	end
----[[
--	local Pos = {}
--	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Player)	-- 取玩家當前座標
--	Pos["NewY"] = GetHeight( Pos["X"] , Pos["Y"] , Pos["Z"] )	-- 取得地表高度
--
--	local SearchNpc = SearchRangeNPC( Player , 120 )
--	
--	local BuildList = {}
--	BuildList[1] = 112916	-- 學院(112916 ~ 112925)	-- 大型建物(半徑110)
--	BuildList[2] = 112467	-- 馬廄(112467 ~ 112476)	-- 大型建物
--	BuildList[3] = 112703	-- 冶鍊廠(112703 ~ 112712)	-- 小型建物(半徑55)
--	BuildList[4] = 112688	-- 圖書館(112688 ~ 112697)	-- 大型建物
--	BuildList[5] = 112810	-- 農田(112810 ~ 112819)	-- 小型建物
--	BuildList[6] = 113141	-- 伐木廠(113141 ~ 113150)	-- 小型建物
--	BuildList[7] = 112896	-- 校場(112896 ~ 112905)	-- 大型建物
--	BuildList[8] = 112477	-- 守衛塔(112477 ~ 112486)	-- 小型建物
--	BuildList[9] = 112934	-- 兵工廠(112934 ~ 112943)	-- 大型建物
--	BuildList[10] = 112906	-- 農產中心(112906 ~ 112915)	-- 大型建物
--	BuildList[11] = 113151	-- 加工廠(113151 ~ 113160)	-- 大型建物
--
--	local Throne = { 111780 , 120879 , 121242 , 121247 , 121252 , 122264 , 122269 , 122274 }	-- 公會城王座
--	
--	for Count = 0 , #SearchNpc , 1 do
--		local OrgID = ReadRoleValue( SearchNpc[Count] , EM_RoleValue_OrgID )
--		local Distance = GetDistance( Player , SearchNpc[Count] )
--		if OrgID ~= 0 then
--		--	ScriptMessage( Player , Player , 0 , "OrgID = ".."["..OrgID.."]".." , Distance = "..Distance.." , Height = "..Pos["Y"]-Pos["NewY"] , C_SYSTEM )
--		end
--	--	DebugMsg( Player , Room , "OrgID = "..OrgID.." ,  Distance = "..Distance.." Height = "..Pos["Y"]-Pos["NewY"] )
--		for ID = 1 , #BuildList , 1 do
--			if ( OrgID >= BuildList[ID] and OrgID <= BuildList[ID]+10 ) then
--				if Pos["Y"]-Pos["NewY"] >= 5 then
--					ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_UNAVAILABLE]" , C_SYSTEM )	-- 你無法在公會建築上使用此物品
--				--	DebugMsg( Player , Room , "Over height" )
--					return false
--				end
--			end
--		end
--		for ID = 1 , #Throne , 1 do
--			if OrgID == Throne[ID] then
--				if Pos["Y"]-Pos["NewY"] >= 5 then
--					ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_UNAVAILABLE]" , C_SYSTEM )	-- 你無法在公會建築上使用此物品
--				--	DebugMsg( Player , Room , "Over height" )
--					return false
--				end
--			end
--		end
--	end
----]]	
end

function Hao_GuildWar_Build_Dead_Plot(Range)	-- 掛載在公會建築上，避免建築物被摧毀時，擺放在建築物上的塔類物品會浮空的問題。

	local Build = OwnerID()
	local SearchNpc = SearchRangeNPC( Build , Range )

	local Tower = {
			102366 ,	-- 詭譎之顏
			102367 ,	-- 海縷之石
			102370 , 	-- 真知之眼
			102481 , 	-- 汲能塔
			102482 , 	-- 視覺幻鏡
			102483 , 	-- 榮譽之心
			102484 , 	-- 聖光樹
			102485 , 	-- 魔燄塔
			102486	-- 電能塔
					}
	
	for Count = 0 , #SearchNpc , 1 do
		local OrgID = ReadRoleValue( SearchNpc[Count] , EM_RoleValue_OrgID )
		if OrgID ~= 0 then
			for ID = 1 , #Tower , 1 do
				if OrgID == Tower[ID] then
					local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(SearchNpc[Count])	-- 取塔的座標
					local NewY = GetHeight( X , Y , Z )	-- 取得地表高度
				--	ScriptMessage( Build , -1 , 0 , "["..OrgID.."]".." , X = "..X.." , Y = "..Y.." , Z = "..Z.." , NewY = "..NewY , C_SYSTEM )
					if Y-NewY >= 0 then
						CallPlot( SearchNpc[Count] , "Hao_GuildWar_Build_Dead_Plot_SetPos" , SearchNpc[Count] , X , NewY+3.5 , Z , Dir )
					end
				end
			end
		end
	end
end

function Hao_GuildWar_Build_Dead_Plot_SetPos( Tower , X , Y , Z , Dir )

	Sleep(30)
	SetPos( Tower , X , Y , Z , Dir )
	AddBuff( Tower , 621663 , 0 , 2 )	-- 傳送特效
end

function Hao_GuildWar_Cast_Check()

	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 1 then
		return true
	else
		return false
	end
end