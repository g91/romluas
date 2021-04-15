function Hao_Zone352_Chest_1()   -- ACT1 ~ ACT2 的寶箱 Script&掉落表

	local Player = OwnerID()	-- 玩家
	local Chest = TargetID()	-- 寶箱
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) --取得所在room

	SetPlot( Chest , "touch" , "" , 0 )
	
	if CheckFlag( Player , 542743 ) == false then	-- 如果該玩家沒報名，又有開啟寶箱的紀錄，則警告並回報為作弊。
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --你沒有權限開啟這個寶箱。
		DesignLog( Player , 113137 , "Cheater" )	-- 哥布林寶箱
		return
	end
	
	if ReadRoleValue( Chest , EM_RoleValue_PID) == 1 then 				-- 防止複數玩家於同時開啟寶箱，都能得到的問題。
		ScriptMessage( Player , Player , 1 ,"[SYS_AUCTION_WAIT_NEXT]" , 0 )		-- 忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( Chest , EM_RoleValue_PID, 1 )
	
	if BeginCastBarEvent( Player , Chest , "[SO_110195_1]" , 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 , "Hao_Zone352_Chest_2" ) ~= 1 then
		ScriptMessage( Player , Player , 0 , "[SAY_NPC_BUSY]" , 0 )	--目標正在忙碌中
		return
	end	
end

function Hao_Zone352_Chest_2( Player , CheckStatus )	-- 活動副本 - 哥布林礦坑一般寶箱劇情  Player = 執行者、CheckStatus = 執行結果(大於0是成功，小於0是失敗)

	local Chest = TargetID()	-- 寶箱
	local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV )	-- 讀取玩家等級
	local Level = ReadRoleValue( Chest , EM_RoleValue_Register+1 )	-- 讀取關卡層級，以決定寶箱等級
--	local OrgID = ReadRoleValue( Chest , EM_RoleValue_OrgID )	-- 讀取資料庫設定的物件ID
	
	local Treasure = {}	-- 寶箱內容物
	Treasure[1] = 724526	-- Lv20~29 寶箱內容
	Treasure[2] = 724527	-- Lv30~39 寶箱內容
	Treasure[3] = 724528	-- Lv40~49 寶箱內容
	Treasure[4] = 724529	-- Lv50~59 寶箱內容
	Treasure[5] = 724529	-- Lv60+ 寶箱內容
	
	if CheckStatus ~= 0 then	-- 如果有施法條時
		if CheckStatus > 0 then	-- 施法成功
			if EmptyPacketCount(Player) >= 1 and QueuePacketCount(Player) == 0 then --檢查背包欄位
				PlayMotionEX( Chest , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )  --寶箱持續播放145、146
				GiveBodyItem( Player , Treasure[Level] , 1 )
			else
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
				WriteRoleValue( Chest , EM_RoleValue_PID , 0 )
				SetPlot( Chest , "touch" , "Hao_Zone352_Chest_1" , 50 )
			end
			EndCastBar( Player , CheckStatus )
		else	-- 施法失敗
			WriteRoleValue( Chest , EM_RoleValue_PID , 0 )
			SetPlot( Chest , "touch" , "Hao_Zone352_Chest_1" , 50 )
			EndCastBar( Player , CheckStatus )
		end
	end
end