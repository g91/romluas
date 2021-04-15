function halloween_121414_NPC()	--掛在任務NPC的物件產生劇情
	local Owner = OwnerID()	--任務NPC 
	local NPC = SearchRangeNPC( Owner , 400 )
	local OrgID = 100132	--乳甲蟲
	LuaN_miyon_action02() --給NPC節慶標誌
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID then
			DelFromPartition( NPC[i] )
		end
	end
	Beginplot( Owner , "Lua_jiyi_halloween_check" , 0 )
end

function Lua_jiyi_halloween_check()	--2013.11.12新增NPC掃全場物件
	local Npc = OwnerID()
	while true do
		Lua_jiyi_halloween_search() --檢查當下的玩家數量
		sleep(10)		
		local PlayerCount = ReadRoleValue( Npc , EM_RoleValue_Register5 )
	--	say( Npc , "Npc="..Npc )		
		if PlayerCount == 0 then		
			WriteRoleValue( Npc , EM_RoleValue_PID , 0 )
			local PID = ReadRoleValue( Npc , EM_RoleValue_PID )	-- 判斷Npc是否為初次生成南瓜
--			say( Npc , "PID="..PID )
		end			
	end
end

function Lua_jiyi_halloween_search()	--2013.11.12新增NPC掃全場物件
	local Npc = OwnerID()
	local count = 0
	local Player = SearchRangePlayer( Npc , 400 )
	for i = 0 , table.getn(Player) do
		if Checkflag(Player[i] , 547020 ) == true then
			count = count + 1		
		end
	end
	WriteRoleValue( Npc , EM_RoleValue_Register5 , count )
	local PlayerCount = ReadRoleValue( Npc , EM_RoleValue_Register5 )
--	Say( Npc , "PlayerCount="..PlayerCount )
end

function jiyi_halloween_Hideitem( _bol )--NPC初始劇情產生場內物件
	local own=OwnerID() --Npc
	local popkin={}
	local ghost ={}
	local Room = ReadRoleValue( own , EM_RoleValue_RoomID )
	local PID = ReadRoleValue( own , EM_RoleValue_PID )	-- 判斷Npc是否為初次生成南瓜

--	DebugMsg( 0 , Room , "--Room--  "..Room);
--	DebugMsg( 0 , Room , "--jiyi_halloween_Hideitem == ".._bol);
	local _ghostNum = 0;

	if not _bol then
		local NPC = SearchRangeNPC( own , 400 );
		for i = 0 , table.getn(NPC) do
			if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == 107326 then
				_ghostNum = _ghostNum + 1;
			end
		end
		if _ghostNum == 0 then
			_bol = true;
		end
	end	
	
	if _bol then
		for j=0,5 do
			ghost[j]= CreateObjByFlag( 107326 , 781190 , j , 1) --產生幽靈
			WriteRoleValue( ghost[j] , EM_RoleValue_Register6 , 0 ) --幽靈產生狀態
			SetModeEx( ghost[j]   , EM_SetModeType_Strikback, false )--反擊
			SetModeEx(ghost[j]  , EM_SetModeType_Searchenemy, false )--索敵
		--	SetModeEx( ghost[j] , EM_SetModeType_ShowRoleHead, true )--頭像框
		--	SetModeEx( ghost[j]    , EM_SetModeType_HideName, false )--名稱
		--	SetModeEx( ghost[j]    , EM_SetModeType_Mark, true )--標記
		--	SetModeEx( ghost[j] , EM_SetModeType_Fight , false )--可砍殺攻擊
		--	SetModeEx( ghost[j] , EM_SetModeType_Revive , true )--可重生	
			AddBuff (ghost[j] , 623499, 0, -1 )
			WriteRoleValue( ghost[j] , EM_RoleValue_PID , own )	-- 讓幽靈記住Npc
			AddToPartition(ghost[j] , Room )
			_ghostNum = _ghostNum + 1;
			BeginPlot( ghost[j] , "jiyi_halloween_move" , 0 )	
		end
	end
	DebugMsg( 0 , Room , "--_ghostNum--  ".._ghostNum);

	if PID == 0 then	
		Lua_jiyi_Pumpkin_search() --檢查當下的南瓜數量
		sleep(10)		
		local PumpkinCount = ReadRoleValue( own , EM_RoleValue_Register7 )
	--	say( Npc , "PumpkinCount="..PumpkinCount )		
		if PumpkinCount == 0 then			
			for i=0, 4 do
				popkin[i]=CreateObjByFlag( 121171 , 781189 , i , 1) --產生霸王南瓜
				SetModeEx(popkin[i]    ,EM_SetModeType_Show , true ) --顯示
				SetModeEx( popkin[i]    , EM_SetModeType_Strikback, false )--反擊
				SetModeEx( popkin[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( popkin[i]    , EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( popkin[i]    , EM_SetModeType_Mark, true )--標記
				SetModeEx( popkin[i]   , EM_SetModeType_Move, false )--移動
				SetModeEx( popkin[i]   , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( popkin[i]    , EM_SetModeType_HideName, false )--名稱
				SetModeEx( popkin[i] , EM_SetModeType_ShowRoleHead, true )--頭像框
				SetModeEx( popkin[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( popkin[i]   , EM_SetModeType_Gravity, true )--重力
				AddToPartition(popkin[i] ,Room )
			end
		end
		WriteRoleValue( own , EM_RoleValue_PID , 1 )
	end
end

function Lua_jiyi_Pumpkin_search()	--2013.11.26新增檢查場上是否有南瓜
	local Npc = OwnerID()
	local count = 0
	local Pumpkin = SearchRangeNPC( Npc , 400 )
	local OrgID = 121171
	for i = 0 , table.getn(Pumpkin) do
		if ReadRoleValue( Pumpkin[i] , EM_RoleValue_OrgID ) == OrgID then
			count = count + 1		
		end
	end
	WriteRoleValue( Npc , EM_RoleValue_Register7 , count )	--將南瓜地數量記在NPC的Register7
	local PumpkinCount = ReadRoleValue( Npc , EM_RoleValue_Register7 )
end	

function jiyi_halloween_ghost() --幽靈攻擊技能
	local own=OwnerID() --幽靈
	local ghost=ReadRoleValue(own , EM_RoleValue_Register6)
	local X = ReadRoleValue( own , EM_RoleValue_X )
	local Y = ReadRoleValue( own , EM_RoleValue_Y )
	local Z = ReadRoleValue( own , EM_RoleValue_Z )
	while true do
	Sleep(10)			
		local player =SearchRangePlayer(own,30) --搜尋npc範圍內的玩家
		for i=0,table.getn(player) do
			if CheckBuff( player[i] , 502307) == true then	-- 當玩家有參與時給予的禁止施放技能Buff時才攻擊
				local R=Rand(10)
				if R <=2  then --有20%的機率
					CastSpell( own, player[i],  499737 )	--幽靈會讓玩家變南瓜
				else											
					CastSpell( own, player[i],  499673 )	--幽靈攻擊玩家緩速
				end
			else
				SetStopAttack(own)  
			end					
		end
	end
end

function jiyi_halloween_ghost_Recheck() --當玩家被變身為小南瓜時，N秒內幽靈無法再對玩家施放變身小南瓜。
	local Player = TargetID()
	local Buff = 623542
	
	if CheckBuff( Player , Buff ) == true then
		return false
	else
		return true
	end
end

function jiyi_halloween_move() --讓幽靈隨機移動
	local Owner = OwnerID() --幽靈
	WriteRoleValue( Owner , EM_RoleValue_IsWalk , 0 )	--用跑的
	local X = ReadRoleValue( Owner , EM_RoleValue_X )
	local Y = ReadRoleValue( Owner , EM_RoleValue_Y )
	local Z = ReadRoleValue( Owner , EM_RoleValue_Z )
	local Range = 10 + rand(10)
	local NewX , NewY , NewZ

	while true do
		Range = 20 + rand(20)
		NewX = X+Math.random( -Range , Range )
		NewZ = Z+Math.random( -Range , Range )
	 	NewY = GetHeight( NewX , Y , NewZ )	-- 
		if CheckLine( Owner , NewX , NewY , NewZ ) == true then
			MoveDirect( Owner , NewX , NewY , NewZ )
		end
		sleep(10)
	end
end
--=====================================
--			偵測玩家距離及時間
--=====================================
function jiyi_halloween_Hideitem2( player , own , Npc , time ) --偵測玩家距離及時間(玩家、隱型物件、Npc、遊戲時間)
--	DebugMsg( 0 , 0 , "2 player = "..player.." own = "..own.." time = "..time  )
--	local own=OwnerID() --隱藏物件
--	local time=0
	local ghost=107326
	local Key = 0
	local Reg

	while true do
		Reg = ReadRoleValue( Npc , EM_RoleValue_Register3 )
		if CheckID( player ) == false then --如果玩家離線，解除迴圈
			WriteRoleValue( Npc , EM_RoleValue_Register3 , Reg-1 )
			break
		else
			local dis=GetDistance( player ,own  )
			if dis < 250 then
				--進行中
			elseif dis >= 250 and dis < 300 then 
	   			ScriptMessage( own ,player,2,"[SC_2012HALLOWEEN_DIS_SYSTEM_01]",C_SYSTEM )--警告訊息 
			elseif dis >=300 then
			--	DebugMsg( Player , 0 , "Running" )
	   			ScriptMessage( own ,player,2,"[SC_2012HALLOWEEN_DIS_SYSTEM_02]",C_SYSTEM )--警告訊息 	
				CancelBuff(  player, 502307)--刪除防紅人、禁止騎乘BUFF	
				CancelBuff(  player, 623481)--刪除攻擊技能
				CancelBuff(  player, 623483)--刪除緩速BUFF
				CancelBuff( player, 623449 )--刪除定身詛咒
--				SetFlag(player , 547020 , 0 )--關閉本日已參加活動旗標
--				SetFlag(player , 547129 ,1 ) --開啟可領獎旗標						
	   			ScriptMessage( own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_01]",C_SYSTEM)--回報
	   			WriteRoleValue( Npc , EM_RoleValue_Register3 , Reg-1 )
	   			break		
	   		end
		end			
		if CheckFlag( player, 547019 ) == true then --檢查是否有領過獎勵
			WriteRoleValue( Npc , EM_RoleValue_Register3 , Reg-1 )
			break
		end
		if  Time == 60 then
   			ScriptMessage(own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_02]",C_SYSTEM )--剩下一分鐘	
		elseif Time ==30 then	
			ScriptMessage(own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_03]",C_SYSTEM )--剩下30秒
		elseif Time == -1 then
		--	if CheckBuff( Npc , 623546 ) == false then --沒有活動進行中BUFF
		--		Key = 1
		--	end
   			ScriptMessage(own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_04]",C_SYSTEM )--時間到
   			Sleep(10)
   			ScriptMessage( own ,player,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_01]",C_SYSTEM)--回報
			CancelBuff(  player, 502307)	--時間到刪除技能鎖定	
			CancelBuff(  player, 623481)	--時間到刪除技能
			CancelBuff(  player, 623483)	--時間到刪除緩速BUFF
			CancelBuff( player, 623449 )	--刪除定身詛咒
--			SetFlag(player , 547020 , 0 )  --關閉本日已參加活動旗標
--			SetFlag(player , 547129 ,1 ) --開啟可領獎旗標
			WriteRoleValue( Npc , EM_RoleValue_Register3 , Reg-1 )
			break
--			WriteRoleValue(npc,EM_RoleValue_Register1,0)		
   		end
		sleep(10)
		time= time - 1
	end
	SetFlag(player , 547129 ,1 ) --開啟可領獎旗標
	if Reg-1 == 0 then
	--	DebugMsg( Player , 0 , "Del" )	   
		BeginPlot( Npc , "jiyi_halloween_reset" , 0 )	-- 2012.10.17 由 Npc 執行刪除場上所有的物件(幽靈與霸王南瓜)
  	end
  	DelObj(own) --刪除隱藏物件
--	SetFlag(player , 547020 , 0 )  --關閉本日已參加活動旗標
--	jiyi_halloween_reset()
end

function jiyi_halloween_reset() --重置活動
	local own=OwnerID() -- Npc
--	Lua_jiyi_Del_na() --刪除南瓜、幽靈
	Lua_jiyi_Del_na(1)	-- 刪除南瓜
--	jiyi_halloween_popkin() --重生南瓜
end

function jiyi_halloween_popkin()
	local own=OwnerID() --隱藏物件
	local popkin={}
	say( own ,"popkin born")
	for i=0, 4 do
		popkin[i]=CreateObjByFlag( 121171 , 781189 , i , 1) --產生霸王南瓜
		WriteRoleValue( popkin[i] , EM_RoleValue_Register2 , 0 )
		AddToPartition(popkin[i] , 0 )
	end
end
--=====================================
--			NPC對話劇情
--=====================================
function jiyi_halloween_NPC() --對話劇情
	local own=OwnerID() --玩家
	local tar=TargetID() --NPC
	local Key = {547020 , 547019 , 547129 }	-- 報名活動、當日已領取獎勵、完成活動

	if CheckFlag( own , Key[2] ) == true then --如果玩家已經領過獎勵
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_04]" )  --謝謝你幫我除靈
	elseif  CheckFlag( own , Key[1] ) ==true then --玩家有參加活動旗標
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_05]" )  --除靈了嗎?
		AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_06]", "jiyi_halloween_over2", 0 )  --給獎
	else 
		if CheckFlag( own , Key[1] ) == false and CheckFlag( own , Key[2] ) == false then	-- 報名
--			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_05]" )  --除靈了嗎?
--		else
			SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_01]" )  --你願意幫我除靈嗎?
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_01]", "jiyi_halloween_game", 0 )  --願意
			AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_02]", "jiyi_halloween_NPC2", 0 )  --不願意
		end
	end	
end

function jiyi_halloween_NPC2()
	local own=ownerID()
	SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_08]" ) --「那我只好找其他人幫忙了」
end

function jiyi_halloween_NPC3()
	local own=ownerID()
	SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_03]" ) --「準備好再來找我」
end

function jiyi_halloween_game() --說明規則
	local own=OwnerID()
	local tar=TargetID()
	SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_02]" )  --說明規則	
	AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_03]", "jiyi_halloween_game1", 0 )  --接受
	AddSpeakOption( own, tar, "[SC_2012HALLOWEEN_PLAYER_OPTION_04]", "jiyi_halloween_NPC3", 0 )  --不接受
end

function jiyi_halloween_over2() --給獎勵
	local own=OwnerID() --玩家
	local tar =TargetID() --NPC
	local BuffID = 623480
	local BuffLv =  FN_CountBuffLevel(own,623480) --檢查玩家身上BUFF

	if BuffLv <1 then
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_09]" )
		CancelBuff( own, 623480 )
		GiveBodyItem( own , 724509 , 1)
	elseif BuffLv >=1 and BuffLv <=14 then
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_09]" )
		CancelBuff( own, 623480 )
		GiveBodyItem( own , 209433 , 1)
	elseif BuffLv >14 and BuffLv <=19 then
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_10]" )
		CancelBuff( own, 623480 )
		GiveBodyItem( own , 209433 , 2)
	elseif BuffLv >19 then
		SetSpeakDetail( own, "[SC_2012HALLOWEEN_NPC_121414_11]" )
		CancelBuff( own, 623480 )
		GiveBodyItem( own , 209433 , 3)
	end
	CloseSpeak( own)
	SetFlag(own , 547019 , 1 ) -- 已經領取過獎勵
	SetFlag(own , 547020 , 0 )--關閉本日已參加活動旗標	
	Lua_Festival_10_All(own)--全勤獎
end

function jiyi_halloween_game1() --進入遊戲
	local own=OwnerID() --玩家
	local tar=TargetID() --NPC
	local Room = ReadRoleValue( tar , EM_RoleValue_RoomID )	-- 讀取Npc所在的分流
--	local star = ReadRoleValue(Tar, EM_RoleValue_Register1 )
	local Lv = ReadRoleValue( own , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( own , EM_RoleValue_LV_SUB )
	local timer = 120	-- 活動時間
	local Key = ReadRoleValue( tar, EM_RoleValue_Register1 )
	local Buff = 623546
	local Status = CheckBuff( tar , Buff )
	local Reg = ReadRoleValue( tar , EM_RoleValue_Register3 )
	local Zone = ReadRoleValue( own , EM_RoleValue_ZoneID )
--	local PID = ReadRoleValue( tar , EM_RoleValue_PID )
	CloseSpeak(own)
--	if star==0 then
--	if Status == false then	-- 2012.10.17 如果 NPC 身上沒有活動進行中的Buff，就執行生成幽靈與霸王南瓜
	DebugMsg( 0 , 0 , "--Reg="..Reg )
	if Reg <= 0 then
	--	DebugMsg( own , 0 , "Buff False" )
	--	BeginPlot( tar , "jiyi_halloween_Hideitem" , 0 )	--由Npc產生幽靈與南瓜
		CallPlot( tar , "jiyi_halloween_Hideitem" , true )
	else
		DebugMsg( 0 , 0 , "--check--" );
		CallPlot( tar , "jiyi_halloween_Hideitem" , false )
	end
		WriteRoleValue( tar , EM_RoleValue_Register3 , Reg+1 )
		DW_CancelTypeBuff(68, own)
		DesignLog( own , 121414 , "Lv = "..Lv.." SubLv = "..SubLv )  --回傳活動參與值
		AddBuff( tar , 623546 , 0 , timer ) --給予NPC活動進行中BUFF120秒
	--	WriteRoleValue( tar , EM_RoleValue_PID , Timer )	-- 有玩家報名時，則為 1 ，Timer秒內無其他玩家報名，則回寫為 0 ，歸 0 時，刪除南瓜與幽靈
		SetFlag(own , 547020 , 1 )  --打開本日已參加活動旗標
		local hideitem = CreateObjByFlag( 121429 ,781191 , 0 , 1) --隱藏物件
		SetModeEx( hideitem ,EM_SetModeType_Show ,false ) --關掉顯示
		SetModeEx( hideitem , EM_SetModeType_Mark, false )--標記
		AddToPartition( hideitem , Room )	-- 產生在對應的分流
	--	BeginPlot(hideitem, "jiyi_halloween_Hideitem2", 0)	--進入計時器
		CallPlot( hideitem , "jiyi_halloween_Hideitem2", own , hideitem , tar , timer )	-- 讓隱型物件在 function jiyi_halloween_Hideitem2 記得玩家及自己、還有活動NPC、遊戲時間
		WriteRoleValue(tar, EM_RoleValue_Register4, own)
		if Zone == 2 then
			SetPos( own, 216.8, 73.4, -244.0, 0 )--傳送玩家
		end
		AddBuff ( own, 502307, 0, timer )--給玩家暫時無敵的BUFF		
--	end
end

function jiyi_halloween_born4() --幽靈重生劇情

	local own=OwnerID() -- Npc
	local R= Rand(6)
	local Buff = 623499
	local soul= CreateObjByFlag( 107326 , 781190 , R , 1)--亂數產生幽靈
	WriteRoleValue(soul , EM_RoleValue_Register6 , 0 ) --幽靈產生狀態
	SetModeEx( soul  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( soul , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( soul , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( soul , EM_SetModeType_Mark, true )--標記
	SetModeEx( soul , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( soul , EM_SetModeType_Revive , true )--可重生	
	AddBuff (soul , Buff , 0, -1 )
	WriteRoleValue( soul , EM_RoleValue_PID , own )-- 讓幽靈記住Npc
	AddToPartition( soul , 0 )
	BeginPlot( soul , "jiyi_halloween_move" , 0 )						
end
--=====================================
--			玩家技能
--=====================================

function jiyi_halloween_king1() --點擊南瓜產生劇情 掛在任務NPC上
	local own=OwnerID() -- 霸王南瓜
	local tar=TargetID() --玩家
	SetPlot( own ,"touch","jiyi_halloween_king",30 )
end

function jiyi_halloween_king() --點擊霸王南瓜獲得淨化 
	local own=OwnerID()--玩家
	local tar=TargetID() --南瓜
	local Key = 547129 -- 任務完成(未領取獎勵)
--	local popkin = ReadRoleValue( tar , EM_RoleValue_Register9) --南瓜開關值 0為開啟1為關閉

	if CheckBuff( own , 502307) == true then	-- 當玩家參與時，給予的禁止施放技能Buff
	--	DebugMsg( own , 0 , "Buff ok" )
		if CheckBuff( own ,623449 ) == true then --當玩家被變身成小南瓜的時候
			ScriptMessage( own ,own,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_07]",C_SYSTEM )	-- 你被詛咒了...
			SetPlot( tar ,"touch","jiyi_halloween_king",30 )	-- 重置南瓜的觸碰劇情
		else
			if CheckFlag( own , Key ) == false then --檢查玩家身上是否有未領取獎勵的旗標，如果沒有...
				if CheckBuff(own,623481)==false then --檢查玩家身上是否已經有淨化BUFF，如果沒有才給淨化技能
		--			if popkin==0 then --南瓜值為開啟狀態
					AddBuff ( own, 623481, 0, 15 ) --淨化
			--		WriteRoleValue(tar,EM_RoleValue_Register9 ,1) --將南瓜值關閉
					SetPlot( tar , "touch" , "" , 30 )
					BeginPlot(tar, "jiyi_halloween_kinghide", 0)
				else
					ScriptMessage( own ,own,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_08]",C_SYSTEM )	-- 無法重複取得淨化能力	
				end
			else
				ScriptMessage( own ,own,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_06]",C_SYSTEM )	-- 這只是一個大南瓜
			end
		end
	--	SetPlot( tar , "touch" , "" , 30 )
	else
		ScriptMessage( own ,own,2,"[SC_2012HALLOWEEN_GAME_SYSTEM_06]",C_SYSTEM )
	end
end

function jiyi_halloween_kinghide() --霸王南瓜消失
	local Owner = OwnerID() --南瓜
	Hide( Owner)
	sleep(100) --消失10秒鐘
	Show( Owner , 0 )
	WriteRoleValue(Owner,EM_RoleValue_Register9 ,0) --開啟南瓜可點擊值
	SetPlot( Owner ,"touch","jiyi_halloween_king",30 )
end

function jiyi_halloween_popkin2() --用淨化攻擊幽靈劇情
	local own=OwnerID() --玩家
	local tar=TargetID() --幽靈
	local Npc = ReadRoleValue( tar , EM_RoleValue_PID )	-- 121414
	local scre=107326
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID)
	local player=ReadRoleValue(tar, EM_RoleValue_IsPlayer)

	if TOrgID == scre then
		DelObj( tar)
		BeginPlot( Npc , "jiyi_halloween_born4" , 0 )	-- 重新生成1隻幽靈
		AddBuff( own, 623480, 0, -1 ) --獲得1分
	elseif CheckBuff(tar,623449)==true and tar~=own then --當目標是其他被定身的玩家
		CancelBuff( tar , 623449) --解除定身狀態
		AddBuff( own, 623480, 2, -1 )	--獲得3分
	end
end

function jiyi_halloween_popkin1() --檢查幽靈
	local own=OwnerID() --玩家
	local tar=TargetID() --幽靈或其他玩家
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID)
	local player=ReadRoleValue(tar, EM_RoleValue_IsPlayer)
	local scre=107326
	local ghost=ReadRoleValue(tar , EM_RoleValue_Register6)

	if CheckBuff(own,623449)==true then --當玩家自己被定身的時候
		return false --淨化技能無效
	else				
		if TOrgID == scre then	--當目標是幽靈的時候
			WriteRoleValue(tar , EM_RoleValue_Register6, 1)
			return true
		elseif CheckBuff(tar,623449)==true then --當目標是其他被定身的玩家		
			return true
		else
			ScriptMessage( own ,own, 1 ,"[SC_2012HALLOWEEN_GAME_SYSTEM_05]", 0 )--系統告知"非有效目標"
			return false
		end	  
	end
end
		
function Lua_jiyi_Del_na(Choise)  --刪除南瓜與幽靈與隱藏物件
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local Npc

	if Choise == 1 then
		NPC = { 107326 , 121429 }	-- 不刪除南瓜 121171,
	else
		NPC = { 121171 , 107326 , 121429 }	-- 刪除南瓜121171,
	end
	local ID , Name

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID)
					end
				end
			end
		end
	end
end

function jiyi_halloween_623480() --當玩家計分BUFF"被淨化的幽靈"結束時觸發給予玩家可領獎的旗標
	local own=OwnerID() --玩家
--	DebugMsg( own , 0 , "Steal" )
	SetFlag(own , 547129 ,1 ) --開啟玩家可領獎旗標
end
--======================================================================================
--		測試指令
--======================================================================================
function jiyi_halloween_over3() --刪除所有重要物品
	local own=OwnerID()

	CancelBuff(  own, 502307)--刪除技能鎖定	
	CancelBuff(  own, 623481)--刪除攻擊技能
	CancelBuff(  own, 623483)--刪除緩速BUFF
	CancelBuff( own, 623480 )--刪除「被淨化的幽靈」
	CancelBuff( own, 623449 )--刪除定身詛咒
	setflag(own,547019,0) --關閉已領取過獎勵旗標
	setflag(own,547020,0) --關閉參加活動旗標
	setflag(own,547129,0) --關閉可領獎旗標
end

function jiyi_halloween_over4() --測試領獎
	local own=OwnerID()

	CancelBuff(  own, 502307)--刪除技能鎖定	
	CancelBuff(  own, 623481)--刪除攻擊技能
	CancelBuff(  own, 623483)--刪除緩速BUFF
	CancelBuff( own, 623449 )--刪除定身詛咒
	setflag(own,547129,1) --開啟可領獎旗標
end