-- 2013.03.13 6.0.0 貨幣整合，修改高級寶箱與完美寶箱相關設定
function Lua_Hao_GoblinboxACT3_01() -- 高級寶箱

	local Player = OwnerID()	-- 玩家
	local Chest = TargetID()	-- 寶箱
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) --取得所在room
	local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV )
	local Log = { {} , {} , {} , {} }
	local Flag = { 0 , 0 , 0 }
	local Item = { 0 , 0 , 0 }
	local BoxLV = ReadRoleValue( Chest , EM_RoleValue_Register+1 )	-- 讀取寶箱的等級
	local Open = ReadRoleValue( Chest , EM_RoleValue_Register+2 )	-- 讀取寶箱是否已經開啟
	local CheckPlayer = ReadRoleValue( Chest , EM_RoleValue_Register+3 )	-- 記錄開啟寶箱的玩家
	local MaxLv = ReadRoleValue( Chest , EM_RoleValue_Register+4 )	-- 讀取寶箱記錄的小隊參與挑戰玩家最高等級

	-- 2013.04.01 修正玩家可利用移形換影等位移技能，在不繳交入場費就進入哥布林礦坑的問題 -- 
	if CheckFlag( Player , 542743 ) == false then	-- 如果該玩家沒報名，又有開啟寶箱的紀錄，則警告並回報為作弊。
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --你沒有權限開啟這個寶箱。
		DesignLog( Player , 113164 , "Cheater" )	-- 哥布林寶箱
		return
	end
	--

	if BoxLV == 1 then
		Item[1] = 724510	-- LV20~29高級寶箱
		Item[2] = 0
		Item[3] = 0
	elseif BoxLV == 2 then
		Item[1] = 724512	-- LV30~39高級寶箱
		Item[2] = 0
		Item[3] = 0
	elseif BoxLV == 3 then
		Item[1] = 724514	-- LV40~49高級寶箱
		Item[2] = 725044	-- LV40 後送的大師萬能修理鎚
		Item[3] = 725045 	-- LV40 後送的魔幻寶盒能量
	elseif BoxLV == 4 then
		Item[1] = Hao_Zone352_Chest_Craft(MaxLv)	-- LV50高級寶箱
		Item[2] = 725044	-- LV40 後送的大師萬能修理鎚
		Item[3] = 725045 	-- LV40 後送的魔幻寶盒能量
	elseif BoxLV == 5 then
		Item[1] = Hao_Zone352_Chest_Craft(MaxLv)	-- 給予的特殊材料
		Item[2] = 725044	-- LV40 後送的大師萬能修理鎚
		Item[3] = 725045 	-- LV40 後送的魔幻寶盒能量
	end
	
	local PID = ReadRoleValue( Chest , EM_RoleValue_PID )	-- 讀取該寶箱為風、火、水、土的哪一區

	if PID == 1 then
		Flag[1] = 542742 -- 哥布林元素區寶箱01
		Flag[2] = 542875 -- 哥布林風區寶箱Key
		Flag[3] = 543557 -- 哥布林破關贈送01 黃金修理鎚
		Log[1][PID] = 11265121	-- 點擊寶箱後，當讀取條完成，開啟風屬性鎔爐出現寶箱成功時，記錄下的玩家清單
		Log[2][PID] = 11265131	-- 點擊寶箱後，讀取條出現後，開啟風屬性鎔爐出現寶箱失敗時，記錄下的玩家清單
		Log[3][PID] = 11265141	-- 該玩家在開啟風屬性寶箱後，再次嘗試開啟寶箱
		Log[4][PID] = 11265151	-- 該玩家不具備開啟風屬性寶箱資格時，嘗試開啟寶箱
	elseif PID == 2 then
		Flag[1] = 542869 -- 哥布林元素區寶箱02
		Flag[2] = 542876 -- 哥布林火區寶箱Key
		Flag[3] = 543558 -- 哥布林破關贈送02
		Log[1][PID] = 11265122	-- 點擊寶箱後，當讀取條完成，開啟火屬性鎔爐出現寶箱成功時，記錄下的玩家清單
		Log[2][PID] = 11265132	-- 點擊寶箱後，讀取條出現後，開啟火屬性鎔爐出現寶箱失敗時，記錄下的玩家清單	
		Log[3][PID] = 11265142	-- 該玩家在開啟火屬性寶箱後，再次嘗試開啟寶箱
		Log[4][PID] = 11265152	-- 該玩家不具備開啟火屬性寶箱資格時，嘗試開啟寶箱
	elseif PID == 3 then
		Flag[1] = 542870 -- 哥布林元素區寶箱03
		Flag[2] = 542877 -- 哥布林土區寶箱Key
		Flag[3] = 543559 -- 哥布林破關贈送03
		Log[1][PID] = 11265123	-- 點擊寶箱後，當讀取條完成，開啟水屬性鎔爐出現寶箱成功時，記錄下的玩家清單
		Log[2][PID] = 11265133	-- 點擊寶箱後，讀取條出現後，開啟水屬性鎔爐出現寶箱失敗時，記錄下的玩家清單
		Log[3][PID] = 11265143	-- 該玩家在開啟水屬性寶箱後，再次嘗試開啟寶箱
		Log[4][PID] = 11265153	-- 該玩家不具備開啟水屬性寶箱資格時，嘗試開啟寶箱
	elseif PID == 4 then
		Flag[1] = 542871 -- 哥布林元素區寶箱04
		Flag[2] = 542878 -- 哥布林水區寶箱Key
		Flag[3] = 543560 -- 哥布林破關贈送04
		Log[1][PID] = 11265124	-- 點擊寶箱後，當讀取條完成，開啟土屬性鎔爐出現寶箱成功時，記錄下的玩家清單
		Log[2][PID] = 11265134	-- 點擊寶箱後，讀取條出現後，開啟土屬性鎔爐出現寶箱失敗時，記錄下的玩家清單		
		Log[3][PID] = 11265144	-- 該玩家在開啟土屬性寶箱後，再次嘗試開啟寶箱
		Log[4][PID] = 11265154	-- 該玩家不具備開啟土屬性寶箱資格時，嘗試開啟寶箱
	end	
	
	if CheckFlag( Player , Flag[1] ) == true then
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_24]" , 0 ) --你已經開啟過這個寶箱。
		DesignLog( Player , Log[3][PID] , "The player have already opened this treasure chest." )
		return
	elseif CheckFlag( Player , Flag[2] ) == false then
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --你沒有權限開啟這個寶箱。
		DesignLog( Player , Log[4][PID] , "The player do not have permission to open this treasure chest." )
		return
	end
	SetPlot( Chest , "touch" , "" , 0 )
	
	if CheckPlayer == 0 then  
		WriteRoleValue( Chest , EM_RoleValue_Register+3 , Player )
		CallPlot( Chest , "Hao_Goblin_Check" , Chest , Player , "Lua_Hao_GoblinboxACT3_01" )  --將點擊中的玩家帶入寶箱，該玩家不在此區域時，則重置觸碰劇情
	end

	if BeginCastBar( Player , "[SO_110195_1]" , 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

		while true do
			sleep(1)
			local CastBarStatus = CheckCastBar( Player )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0 ) then -- 成功
					result = "OKOK"
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
				end
				EndCastBar( Player , CastBarStatus )
				break				
			end
		end

		if ( result == "OKOK" ) then
			if EmptyPacketCount( Player ) >= 1 and QueuePacketCount( Player ) == 0 then --檢查背包欄位
				if Open == 0 then
					PlayMotionEX( Chest , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )  --寶箱持續播放145    146
					WriteRoleValue( Chest , EM_RoleValue_Register+2 , 1 )
				end
				local Keyitem = { 543557 , 543558 , 543559 , 543560 }
				local Count = 0
				local EndBonus = { 10 , 20 }
				for i = 1 , table.getn(Keyitem) , 1 do
					if CheckFlag( Player , Keyitem[i] ) == true then
						Count = Count +1
					end
				end
				if PlayerLv >= 50 then
					if Count <= 3 then	-- 當領取風、火、水、土寶箱的數量 <= 3 個時
						Hao_Monetary_Union_240181( Player , EndBonus[1] )
					elseif Count == 4 then	-- 當玩家領取風、火、水、土寶箱的數量 = 4 個時
						Hao_Monetary_Union_240181( Player , EndBonus[2] )
					end
				end
				GiveBodyItem( Player , Item[1] , 1 )
				SetFlag( Player , Flag[1] , 1 )
				SetFlag( Player , Flag[2] , 0 )
				if Count == 4 then
					GiveBodyItem( Player , Item[2] , 1 )
					GiveBodyItem( Player , Item[3] , 1 )
					for i = 1 , #Keyitem , 1 do
						SetFlag( Player , Keyitem[i] , 0 )
					end
				end
				DesignLog( Player , Log[1][PID] , "Open the treasure box" )
				SetPlot( Chest ,"touch" , "Lua_Hao_GoblinboxACT3_01" , 50 )
			--	sleep(10)
			else
				DesignLog( Player , Log[2][PID] , "Open the treasure box failed" )
				ScriptMessage( Chest , Player , 1 , "[K_08MID_DIALOG8]" , 0 )	--您的背包空間不足，請清理一下再來吧。
				SetPlot( Chest ,"touch","Lua_Hao_GoblinboxACT3_01", 50 )
			end	
		elseif ( result == "DAME" ) then
			DesignLog( Player , Log[2][PID] , "Open the treasure box failed" )
			SetPlot( Chest , "touch" , "Lua_Hao_GoblinboxACT3_01" , 50 )
		end
	end
end

function Lua_Hao_GoblinboxACT3_02() -- 完美寶箱

	local Player = OwnerID()	-- 玩家
	local Chest = TargetID()	-- 寶箱
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) --取得所在room
	local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV )
	local Log = { {} , {} , {} , {} }
	local Flag = { 0 , 0 , 0 }
	local Item = { 0 , 0 , 0 , 0 }
	local BoxLV = ReadRoleValue( Chest , EM_RoleValue_Register+1 )	-- 讀取寶箱的等級
	local Open = ReadRoleValue( Chest , EM_RoleValue_Register+2 )	-- 讀取寶箱是否已經開啟	
	local CheckPlayer = ReadRoleValue( Chest , EM_RoleValue_Register+3 )	-- 記錄開啟寶箱的玩家
	local MaxLv = ReadRoleValue( Chest , EM_RoleValue_Register+4 )	-- 讀取寶箱記錄的小隊參與挑戰玩家最高等級

	-- 2013.04.01 修正玩家可利用移形換影等位移技能，在不繳交入場費就進入哥布林礦坑的問題 -- 
	if CheckFlag( Player , 542743 ) == false then	-- 如果該玩家沒報名，又有開啟寶箱的紀錄，則警告並回報為作弊。
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --你沒有權限開啟這個寶箱。
		DesignLog( Player , 113164 , "Cheater" )	-- 哥布林寶箱
		return
	end
	--
	if BoxLV == 1 then
		Item[1] = 724511	-- LV20~29完美寶箱
		Item[2] = 724571	-- LV20~29徽章
		Item[3] = 0
		Item[4] = 0
	elseif BoxLV == 2 then
		Item[1] = 724513	-- LV30~39完美寶箱
		Item[2] = 724572	-- LV30~39徽章
		Item[3] = 0
		Item[4] = 0
	elseif BoxLV == 3 then
		Item[1] = 724515	-- LV40~49完美寶箱
		Item[2] = 724573	-- LV40~49徽章
		Item[3] = 725044	-- LV40 後送的大師萬能修理鎚
		Item[4] = 725045	-- LV40 後送的魔幻寶盒能量
	elseif BoxLV == 4 then
		Item[1] = Hao_Zone352_Chest_Craft(MaxLv)	-- LV50~59完美寶箱
		Item[2] = 724574	-- LV50~59徽章
		Item[3] = 725044	-- LV40 後送的大師萬能修理鎚
		Item[4] = 725045	-- LV40 後送的魔幻寶盒能量
	elseif BoxLV == 5 then
		Item[1] = Hao_Zone352_Chest_Craft(MaxLv)	-- 給予的特殊材料
		Item[2] = 724574	-- 哥布林勇士徽章*2
		Item[3] = 725044	-- LV40 後送的大師萬能修理鎚
		Item[4] = 725045	-- LV40 後送的魔幻寶盒能量
	end

	local PID = ReadRoleValue( Chest , EM_RoleValue_PID )	-- 讀取該寶箱為風、火、水、土的哪一區
	
	if PID == 1 then
		Flag[1] = 542742 -- 哥布林元素區寶箱01
		Flag[2] = 542875 -- 哥布林風區寶箱Key
		Flag[3] = 543557 -- 哥布林破關贈送01 黃金修理鎚
		Log[1][PID] = 11265121	-- 點擊寶箱後，當讀取條完成，開啟風屬性鎔爐出現寶箱成功時，記錄下的玩家清單
		Log[2][PID] = 11265131	-- 點擊寶箱後，讀取條出現後，開啟風屬性鎔爐出現寶箱失敗時，記錄下的玩家清單
		Log[3][PID] = 11265141	-- 該玩家在開啟風屬性寶箱後，再次嘗試開啟寶箱
		Log[4][PID] = 11265151	-- 該玩家不具備開啟風屬性寶箱資格時，嘗試開啟寶箱	
	elseif PID == 2 then
		Flag[1] = 542869 -- 哥布林元素區寶箱02
		Flag[2] = 542876 -- 哥布林火區寶箱Key
		Flag[3] = 543558 -- 哥布林破關贈送02
		Log[1][PID] = 11265122	-- 點擊寶箱後，當讀取條完成，開啟火屬性鎔爐出現寶箱成功時，記錄下的玩家清單
		Log[2][PID] = 11265132	-- 點擊寶箱後，讀取條出現後，開啟火屬性鎔爐出現寶箱失敗時，記錄下的玩家清單	
		Log[3][PID] = 11265142	-- 該玩家在開啟火屬性寶箱後，再次嘗試開啟寶箱
		Log[4][PID] = 11265152	-- 該玩家不具備開啟火屬性寶箱資格時，嘗試開啟寶箱	
	elseif PID == 3 then
		Flag[1] = 542870 -- 哥布林元素區寶箱03
		Flag[2] = 542877 -- 哥布林土區寶箱Key
		Flag[3] = 543559 -- 哥布林破關贈送03
		Log[1][PID] = 11265123	-- 點擊寶箱後，當讀取條完成，開啟水屬性鎔爐出現寶箱成功時，記錄下的玩家清單
		Log[2][PID] = 11265133	-- 點擊寶箱後，讀取條出現後，開啟水屬性鎔爐出現寶箱失敗時，記錄下的玩家清單
		Log[3][PID] = 11265143	-- 該玩家在開啟水屬性寶箱後，再次嘗試開啟寶箱
		Log[4][PID] = 11265153	-- 該玩家不具備開啟水屬性寶箱資格時，嘗試開啟寶箱	
	elseif PID == 4 then
		Flag[1] = 542871 -- 哥布林元素區寶箱04
		Flag[2] = 542878 -- 哥布林水區寶箱Key
		Flag[3] = 543560 -- 哥布林破關贈送04
		Log[1][PID] = 11265124	-- 點擊寶箱後，當讀取條完成，開啟土屬性鎔爐出現寶箱成功時，記錄下的玩家清單
		Log[2][PID] = 11265134	-- 點擊寶箱後，讀取條出現後，開啟土屬性鎔爐出現寶箱失敗時，記錄下的玩家清單		
		Log[3][PID] = 11265144	-- 該玩家在開啟土屬性寶箱後，再次嘗試開啟寶箱
		Log[4][PID] = 11265154	-- 該玩家不具備開啟土屬性寶箱資格時，嘗試開啟寶箱	
	end

	if CheckFlag( Player , Flag[1] ) == true then
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_24]" , 0 ) --你已經開啟過這個寶箱。
		DesignLog( Player , Log[3][PID] , "The player have already opened this treasure chest." )
		return
	elseif CheckFlag( Player, Flag[2] ) == false then
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --你沒有權限開啟這個寶箱。
		DesignLog( Player , Log[4][PID] , "The player do not have permission to open this treasure chest." )
		return
	end
	SetPlot( Chest , "touch" , "" , 0 )
	
	if CheckPlayer == 0 then
		WriteRoleValue( Chest , EM_RoleValue_Register+3 , Player )
		CallPlot( Chest , "Hao_Goblin_Check" , Chest , Player , "Lua_Hao_GoblinboxACT3_02" )  --將點擊中的玩家帶入寶箱，該玩家不在此區域時，則重置觸碰劇情
	end

	if BeginCastBar( Player , "[SO_110195_1]" , 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*開始施法，使用者,時間條上的文字,進行時間,起始動作,結束動作,中斷條件(0為移動中斷)

		while true do
			sleep(1)
			local CastBarStatus = CheckCastBar( Player )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0 ) then -- 成功
					result = "OKOK"
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
				end
				EndCastBar( Player , CastBarStatus )
				break				
			end
		end

		if ( result == "OKOK" ) then
			if EmptyPacketCount( Player ) >= 1 and QueuePacketCount( Player ) == 0 then --檢查背包欄位
				if Open == 0 then
					PlayMotionEX( Chest , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )  --寶箱持續播放145    146
					WriteRoleValue( Chest , EM_RoleValue_Register+2 , 1 )					
				end
				local Keyitem = { 543557 , 543558 , 543559 , 543560 }
				local Count = 0
				local EndBonus = { 10 , 20 }
				for i = 1 , table.getn(Keyitem) , 1 do
					if CheckFlag( Player , Keyitem[i] ) == true then
						Count = Count +1 
					end
				end
				if PlayerLv >= 50 then
					if Count <= 3 then	-- 當領取風、火、水、土寶箱的數量 <= 3 個時
						Hao_Monetary_Union_240181( Player , EndBonus[1] )
					elseif Count == 4 then	-- 當玩家領取風、火、水、土寶箱的數量 = 4 個時
						Hao_Monetary_Union_240181( Player , EndBonus[2] )
					end
				end
				GiveBodyItem( Player , Item[1] , 1 )
				GiveBodyItem( Player , Item[2] , 1 )
				SetFlag( Player , Flag[1] , 1 )
				SetFlag( Player , Flag[2] , 0 )
				if Count == 4 then
					GiveBodyItem( Player , Item[3] , 1 )
					GiveBodyItem( Player , Item[4] , 1 )
					for i = 1 , #Keyitem , 1 do
						SetFlag( Player , Keyitem[i] , 0 )
					end
				end
				DesignLog( Player , Log[1][PID] , "Open the treasure box" )
				SetPlot( Chest , "touch" , "Lua_Hao_GoblinboxACT3_02" , 50 )
			--	sleep(10)
			else
				DesignLog( Player , Log[2][PID] , "Open the treasure box failed" )
				ScriptMessage( Chest , Player , 1 , "[K_08MID_DIALOG8]" , 0 )	--您的背包空間不足，請清理一下再來吧。
				SetPlot( Chest , "touch" , "Lua_Hao_GoblinboxACT3_02" , 50 )
			end
		elseif ( result == "DAME" ) then
			DesignLog( Player , Log[2][PID] , "Open the treasure box failed" )
			SetPlot( Chest , "touch" , "Lua_Hao_GoblinboxACT3_02" , 50 )
		end
	end
end
-- 2013.03.21 阿浩 修正玩家於開啟第三關卡的寶箱時斷線或換區會造成其他玩家無法開啟該寶箱的問題
function Hao_Goblin_Check(Chest , Player , String)

	while true do
		if GetDistance( Chest , Player ) > 50 then
			SetPlot( Chest , "touch" , String , 50 )
			WriteRoleValue( Chest , EM_RoleValue_Register+3 , 0 )
			break
		end
		Sleep(5)
	end
end

function Hao_Zone352_Chest_Craft(MaxLv)

	local Craft = {}
	Craft[1] = { 51 , 207409 , 207411 , 207413 , 207415 }	-- Lv 51 ~ 55 層級時領取(4選1): 穀神星石、鉑金釘、魁塔金屬石、梧桐纖維
	Craft[2] = { 56 , 207410 , 207412 , 207414 , 207416 }	-- Lv 56 ~ 60 層級時領取(4選1):智神星石、鎢剛釘、希格斯金屬石、蘇鐵纖維
	Craft[3] = { 61 , 208252 , 208253 , 208254 , 208255 }	-- Lv 61 ~ 65 層級時領取(4選1):妊神星石、斑銅釘、艾克斯金屬石、亞麻纖維
	Craft[4] = { 66 , 240410 , 240411 , 240412 , 240413 }	-- Lv 66 ~ 70 層級時領取(4選1):烏星石、白鐵釘、西格瑪金屬石、棕櫚纖維
	Craft[5] = { 71 , 241463 , 241464 , 241465 , 241466 }	-- Lv 71 ~ 75 層級時領取(4選1):鬩神星、銀鋰釘、瑞特金屬石、銀杏纖維
	Craft[6] = { 76 , 242063 , 242064 , 242065 , 242066 }	-- Lv 76 ~ 80 層級時領取(4選1):韶神星、銀鉛釘、因帕斯金屬石、桑樹纖維
	Craft[7] = { 81 , 242314 , 242315 , 242316 , 242317 }	-- Lv 81 ~ 85 層級時領取(4選1):海妖星、錫鐵釘、德斯尼金屬石、青壇纖維
	Craft[8] = { 86 , 242318 , 242319 , 242320 , 242321 }	-- Lv 86 ~ 90 層級時領取(4選1):司寧星、銀汞釘、羅傑金屬石、棉花纖維
	Craft[9] = { 91 , 242322 , 242323 , 242324 , 242325 }	-- Lv 91 ~ 95 層級時領取(4選1):芙女星、鎢金釘、弗利朵金屬石、櫸木纖維
	Craft[10] = { 200 , 242326 , 242327 , 242328 , 242329 }	-- Lv 96 ~ 200 層級時領取(4選1):虹神星、銀銅釘、賈堤思金屬石、石棉纖維

	for i = 1 , #Craft , 1 do
		if MaxLv < Craft[i][1]+5 then
			Craft[0] = Craft[i][math.random( 2 , #Craft[i])]
			break
		end
	end
	DebugMsg( 0 , 0 , "Item = "..Craft[0] )
	return Craft[0]
end

function Lua_Hao_Goblinbox_Test()

	local Player = OwnerID()
	SetFlag( Player , 542743 , 0 )--確定挑戰
	SetFlag( Player , 542904 , 0 )--哥布林首領秘寶已領取
	SetFlag( Player , 542905 , 0 )--給予賄賂FLAG
	SetFlag( Player , 543557 , 0 )--大師安心修理鎚&魔幻寶盒能量*3 旗標01
	SetFlag( Player , 543558 , 0 )--大師安心修理鎚&魔幻寶盒能量*3 旗標02
	SetFlag( Player , 543559 , 0 )--大師安心修理鎚&魔幻寶盒能量*3 旗標03
	SetFlag( Player , 543560 , 0 )--大師安心修理鎚&魔幻寶盒能量*3 旗標04
	SetFlag( Player , 542742 , 0 )--哥布林元素區寶箱01
	SetFlag( Player , 542869 , 0 )--哥布林元素區寶箱02
	SetFlag( Player , 542870 , 0 )--哥布林元素區寶箱03
	SetFlag( Player , 542871 , 0 )--哥布林元素區寶箱04
	SetFlag( Player , 542689 , 0 )--挑戰資格	
end