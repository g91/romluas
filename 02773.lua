--==================================================
--			任務NPC對話劇情
--==================================================
function Lua_jiyi_thanks_121492() --NPC對話劇情
	local player = OwnerID() --玩家
	local npc = TargetID() --NPC

	if CheckFlag( player , 547135 ) == true then --有當日已領獎旗標時
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_01]" )  --謝謝你幫我照顧鶴鴕
	elseif CheckFlag( player , 547134 ) == true then --有活動進行中旗標時
		if CheckFlag( player , 547136 ) or CheckFlag( player , 547137 ) or  CheckFlag( player , 547138 ) == true then --檢查是否有完成過任一任務，只要有其中一個旗標時
			SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_02]" )  --是否要領獎?
			AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_03]" , "Lua_jiyi_thanks_121492_reward" , 0 )  --要領獎
		else 
			SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_05]" )  --請至少照顧一次鶴鴕
		end
	else			
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_06]" )  --你願意幫我照顧鶴鴕嗎?
		AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_07]" , "Lua_jiyi_thanks_121492_2" , 0 )  --願意
		AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_08]" , "Lua_jiyi_thanks_121492_3" , 0 )  --不願意
	end		
end

function Lua_jiyi_thanks_121492_2() --願意照顧鶴鴕
	local player = OwnerID() --玩家
	local npc = TargetID() --npc
		CloseSpeak( player )	--關閉對話視窗
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_09]" )  --活動說明
		AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_10]", "Lua_jiyi_thanks_121492_4" , 0 )  --參加
		AddSpeakOption( player , npc , "[SC_2012THANKS_NPC_121492_11]" , "Lua_jiyi_thanks_121492_3" , 0 )  --不參加
end

function Lua_jiyi_thanks_121492_3() --結束對話
	local player = OwnerID() --玩家
		CloseSpeak( player )	--關閉對話視窗
end

function Lua_jiyi_thanks_121492_4() --給予活動進行中旗標
	local player = OwnerID() --玩家
		CloseSpeak( player )	--關閉對話視窗
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_12]" )  --請到旁邊照顧鶴鴕
		DesignLog( player , 121492 , " Turkey Code event STAR" )	--記錄參加人次
		SetFlag( player , 547134 , 1 ) --開啟玩家活動進行中旗標
end

function Lua_jiyi_thanks_121492_reward() --領獎勵
	local player = OwnerID() --玩家
	CloseSpeak( player )
	local npc = TargetID() --npc
	local BuffID = 623670 --計分BUFF
	local reward = { 206266 , 724509 } --獎勵：活動獎券、必爾汀藥水
	local BuffLv =  FN_CountBuffLevel( player , BuffID ) --檢查玩家身上BUFF
	local chicken = ReadRoleValue( player , EM_RoleValue_Register+1 ) --讀取記在player身上的鶴鴕
	local PID = ReadRoleValue( chicken , EM_RoleValue_PID )
	WriteRoleValue( PID , EM_RoleValue_PID , 0 ) --將記載玩家身上的鶴鴕pid值寫成0
	if BuffLv <= 0 then --BuffLv顯示1
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[2] , 1 ) --給一個藥水
	elseif BuffLv >= 1 and BuffLv < 14 then --BuffLv>=1<15
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 1 ) --給一張活動獎券
	elseif BuffLv >= 14 and BuffLv <23 then --BuffLv>=15<23
 		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 2 ) --給二張活動獎券
	elseif BuffLv >= 23 and BuffLv < 29 then --BuffLv>=24<30
 		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 3 ) --給三張活動獎券
	elseif BuffLv >= 29 then --BuffLv顯示>=30
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 3 ) --給三張活動獎券
		GiveBodyItem( player , reward[2] , 1 ) --給一個藥水	
	end
	WriteRoleValue( player , EM_RoleValue_Register+1 , 0 ) --將玩家身上紀錄鶴鴕的值寫回0
	SetSpeakDetail( player , "[SC_2012THANKS_NPC_121492_01]" ) --謝謝你幫我照顧鶴鴕
	SetFlag( player , 547135 , 1 ) -- 已經領取過獎勵
	DesignLog( player , 1214921 , " Turkey Code event OVER" )	--記錄完成人次
	Lua_Festival_11_All(player)--全勤獎
end
--========================================================================
--			鶴鴕劇情
--========================================================================
function Lua_jiyi_thanks_turkey() --與鶴鴕的對話劇情
	local player = OwnerID() --玩家
	local turkey = TargetID() --鶴鴕
	CloseSpeak( player )
	local PID = ReadRoleValue( turkey , EM_RoleValue_PID ) --記錄在鶴鴕身上的PID值，=0開啟可對話
	local Mode = { 547136, 547137, 547138 , 547134 , 547135 } --任務1,2,3旗標、活動進行中、領過獎勵
	local Care = 623698 --判斷玩家已經在照顧鶴鴕

	if PID == 0 and CheckBuff( player , Care ) == false then --當PID值為0時且玩家身上沒有已經在照顧鶴鴕的BUFF，開啟可對話狀態
 		if CheckFlag( player , Mode[4] ) == true then --檢查活動中旗標是否開啟，==1為開啟
			if CheckFlag( player , Mode[5] ) == false then --如果沒領過獎勵
				if CheckFlag( player , Mode[1] ) == false then --檢查是否有玩過任務1(Mode[1])，如果沒玩過
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --一般對話 鶴鴕對你好奇
					AddSpeakOption( player , turkey , "[SC_2012THANKS_PLAYER_121493_01]" , "Lua_jiyi_thanks_turkey2" , 0 )  --參加				
					--進行活動(任務1)
				elseif CheckFlag( player , Mode[1] ) == true or CheckFlag( player , Mode[2] ) == true then --檢查是否有任務1、任務2旗標			
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --一般對話 鶴鴕對你好奇
				elseif CheckFlag( player , Mode[3] ) == true then --檢查是否有玩過任務3(Mode[3])		
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_02]" ) --一般對話「咕咕」鶴鴕不想理你
				end
			else
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --一般對話 鶴鴕對你好奇						
			end
		else
			SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" )  --一般對話鶴鴕對你好奇
		end
	elseif PID == 1 and CheckBuff( player , Care ) == false then --當PID值為1時且玩家身上沒有已經在照顧鶴鴕的BUFF，開啟可對話狀態
 		if CheckFlag( player , Mode[4] ) == true then --檢查活動中旗標是否開啟，==1為開啟
			if CheckFlag( player , Mode[5] ) == false then --如果沒領過獎勵
				if CheckFlag( player , Mode[1] ) == false then --檢查是否有玩過任務1(Mode[1])，如果沒玩過
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_03]" )  --一般對話鶴鴕沒有注意到你
					ScriptMessage( turkey , player , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_01]" , C_SYSTEM )--警告訊息：已有人在照顧鶴鴕
				end
			else
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --一般對話 鶴鴕對你好奇			
			end
		end
	elseif PID == 1 and CheckBuff( player , Care ) == true then --當PID值為1時且玩家身上有已經在照顧鶴鴕的BUFF，開啟可對話狀態
		if CheckFlag( player , Mode[4] ) == true then --檢查活動中旗標是否開啟，==1為開啟
			if CheckFlag( player , Mode[5] ) == false then --如果沒領過獎勵
				if CheckFlag( player , Mode[1] ) == false then
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --一般對話 鶴鴕對你好奇					 
				elseif CheckFlag( player , Mode[1] ) == true or CheckFlag( player , Mode[2] ) == true then --檢查是否有任務1、任務2旗標			
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --一般對話 鶴鴕對你好奇
				elseif CheckFlag( player , Mode[3] ) == true then --檢查是否有玩過任務3(Mode[3])	
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_02]" ) --一般對話「咕咕」鶴鴕不想理你
				end
			else
					SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_01]" ) --一般對話 鶴鴕對你好奇
			end
		end								
	else	
		SetSpeakDetail( player , "[SC_2012THANKS_NPC_121493_03]" )  --一般對話鶴鴕沒有注意到你
	end
end		

function Lua_jiyi_thanks_turkey2() --出題目
	local player = OwnerID() --玩家
	local turkey = TargetID() --鶴鴕
	local Care = 623698 --判斷玩家已經在照顧鶴鴕
	local Reg9 = ReadRoleValue( turkey , EM_RoleValue_Register+9 )
	WriteRoleValue( player , EM_RoleValue_Register+1 , turkey ) --讓玩家記得鶴鴕
	WriteRoleValue(turkey,EM_RoleValue_PID, 1) --將鶴鴕身上的PID值寫成1
	WriteRoleValue( turkey , EM_RoleValue_Register+9 , player )
	AddBuff( player , Care , 0 , 60 ) --給予判斷玩家已經在照顧鶴鴕BUFF
	DW_CancelMount( 68, player ) --進入遊戲不可騎乘
	CloseSpeak( player )
	BeginPlot( turkey , "Lua_jiyi_thanks_turkey3" , 0 ) --執行出題目
	BeginPlot( turkey , "Lua_jiyi_thanks_turkey5" , 0 ) --執行檢查偵測時間、距離、離線、換區消失、領獎勵
end
		
function Lua_jiyi_thanks_turkey5() --由鶴鴕執行偵測玩家與鶴鴕之間的距離並判斷是否將鶴鴕的PID值寫回0
	local turkey = OwnerID() --鶴鴕
	local Reg9 = ReadRoleValue( turkey , EM_RoleValue_Register+9 ) --記在鶴鴕身上的玩家 
	local PID = ReadRoleValue( turkey , EM_RoleValue_PID ) --記錄在鶴鴕身上的PID值
	local reward = 547135 --已領過獎旗標
	local Dis = GetDistance( turkey , Reg9 ) --檢查鶴鴕和玩家之間的距離
	local Time = 0
	local Mode = 547136
	local buff = { 623686 , 623696 , 623698 } --任務技能、判斷技能順序BUFF、玩家已經在照顧鶴鴕BUFF

	while true do	
		Dis = GetDistance( turkey , Reg9 ) --檢查鶴鴕和玩家之間的距離
		if CheckID( Reg9 ) == false then--如果玩家離線，跳出迴圈
			break
		end
		if Dis >= 100 and Dis < 150 then --如果距離太遠，跳出警告訊息
			ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_02]" , C_SYSTEM )--警告訊息 ：距離過遠	
		elseif Dis >= 150 then
			ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_03] " , C_SYSTEM )--警告訊息 ：距離太遠了		
			break
		end
	   	Time = Time + 1
		if Time == 60 then
	   		ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_05]" , C_SYSTEM )--時間到跳出迴圈
			WriteRoleValue( turkey , EM_RoleValue_PID , 0 ) --把鶴鴕身上PID值寫成0	
			break
		end						
		if CheckFlag( Reg9 , reward ) == true then --如果玩家身上有領過獎勵旗標，跳出迴圈
			break
		end
		Sleep( 10 )
	end
	for i = 1 , 3 do --跳出迴圈就將玩家身上全部的BUFF刪除
		CancelBuff( Reg9 , buff[i] ) --刪除玩家身上全部BUFF
	end
	if CheckFlag( Reg9 , Mode ) == false then
		SetFlag( Reg9 , Mode , 1 ) --開啟完成任務1旗標
	end	
end

function Lua_jiyi_thanks_turkey3() --任務開始
	local turkey = OwnerID() --鶴鴕
	local player = TargetID() --玩家
	local Mode = { 547136, 547137, 547138 , 547134 , 547135 } --任務1,2,3旗標、活動進行中、領過獎勵
	local Reg = ReadRoleValue( turkey , EM_RoleValue_Register+0 )
	local String = "[SC_2012THANKS_NPC_121493_SYSTEM_14]"
	local Word = { [1]="[SC_2012THANKS_NPC_121493_SYSTEM_06]" ,
			 [2]="[SC_2012THANKS_NPC_121493_SYSTEM_07]" ,
			 [3]="[SC_2012THANKS_NPC_121493_SYSTEM_08]" ,
			 [4]="[SC_2012THANKS_NPC_121493_SYSTEM_09]" ,
			 [5]="[SC_2012THANKS_NPC_121493_SYSTEM_10]" } --題目字串
	local RandNum
	local BuffID = 623686 --給予回答題目的技能
	local BuffLv = 623696 --判斷任務順序buff
	local buff = 623698	--正在照顧鶴鴕的BUFF
	WriteRoleValue( turkey , EM_RoleValue_PID , 1 ) --將鶴鴕身上的PID值寫成1
	local PID = ReadRoleValue( turkey , EM_RoleValue_PID ) --記錄在鶴鴕身上的PID值

	if CheckBuff( player , buff ) == true then --當玩家身上有正在照顧鶴鴕BUFF才出題
		for i = 1 , 3 do
			RandNum = DW_Rand( table.getn ( Word ) )
			String = String..Word[RandNum]
			if i == 3 then
				ScriptMessage( turkey , player , 1 , String , C_SYSTEM )--題目字串
			end
			WriteRoleValue( turkey , EM_RoleValue_Register + i , RandNum ) --將任務1的字串記在turkey身上
		end
		AddBuff( player , BuffID , 0 , 10 ) --給予任務技能，10秒消失
		AddBuff( player , BuffLv , 0 , 10 ) --給予判斷任務1是否正確的buff，10秒消失
		Sleep(100)
	end
		String = "[SC_2012THANKS_NPC_121493_SYSTEM_14]"
	if CheckBuff( player , buff ) == true then --當玩家身上有正在照顧鶴鴕BUFF才出題
		for i = 1 , 5 do --任務2
			RandNum = DW_Rand( table.getn( Word ) )
			String = String..Word[RandNum]
			WriteRoleValue( turkey , EM_RoleValue_Register + i , RandNum ) --將任務1的字串記在turkey身上
			if i == 5 then
				ScriptMessage( turkey , player , 1 , String , C_SYSTEM )--題目字串
			end
		end
		AddBuff( player , BuffID , 0 , 20 ) --給予任務技能，15秒消失
		AddBuff( player , BuffLv , 0 , 20 ) --給予判斷任務1是否正確的buff，15秒消失
		Sleep(200)
	end
		String = "[SC_2012THANKS_NPC_121493_SYSTEM_14]"
	if CheckBuff( player , buff ) == true then --當玩家身上有正在照顧鶴鴕BUFF才出題
		for i = 1 , 7 do --任務3
			RandNum = DW_Rand( table.getn( Word ) )
			String = String..Word[RandNum]
			WriteRoleValue( turkey , EM_RoleValue_Register + i , RandNum ) --將任務1的字串記在turkey身上
			if i == 7 then
				ScriptMessage( turkey , player , 1 , String , C_SYSTEM )--題目字串
			end
		end
		AddBuff( player , BuffID , 0 , 30 ) --給予任務技能，20秒消失
		AddBuff( player , BuffLv , 0 , 30 ) --給予判斷任務3是否正確的buff，20秒消失
		Sleep(300)
	end
		WriteRoleValue( turkey , EM_RoleValue_PID , 0 )	
end

function Lua_jiyi_thanks_turkey6() --掛在法術結束時檢查玩家是否有完成任務的旗標，如果無則開啟完成任務旗標
	local player = OwnerID() --玩家
	local turkey = TargetID() --鶴鴕
	local Mode = { 547136 , 547137 , 547138 }	--任務1,2,3旗標
	local buff = 623698	--正在照顧鶴鴕的BUFF

	if CheckBuff( player , buff ) == true then --當玩家有正在照顧鶴鴕BUFF時才判斷
		if CheckFlag( player , Mode[1] ) == false then
			SetFlag( player , Mode[1] , 1 ) --開啟完成任務1旗標
		elseif CheckFlag( player , Mode[2] ) == false then
			SetFlag( player , Mode[2] , 1 ) --開啟完成任務2旗標
		elseif CheckFlag( player , Mode[3] ) == false then	
			SetFlag( player , Mode[3] , 1 ) --開啟完成任務3旗標
		end
	end	
end	
--==========================================================================
--			玩家技能
--==========================================================================
function Lua_jiyi_thanks_buffid(Answer) --掛在技能的執行劇情上，檢查任務1是否回答正確 Answer = 技能1 , 2 , 3 , 4 , 5
	local player = OwnerID() --玩家
	local turkey = TargetID()
	local BuffLv = 623670	-- 分數
	local Mode={ [1] = 547136 , [2] = 547137 , [3] = 547138 }	--任務1,2,3旗標
	local Quest = { [1] = 3 , [2] = 5 , [3] = 7 }				-- 每階段有幾個題目
	local Key = 0	-- 用來判斷是否已經解完該任務
	local Topic = {}	

	Lua_FE_Reset(Player)	-- 每次施放技能的時候，清除最終就贖

	for i = 1 , #Mode , 1 do	-- 任務 1 ~ 3
		if CheckFlag( player , Mode[i] )== false then --檢查玩家是否有玩過任務1.2.3
			for j = 1 , Quest[i] , 1 do	-- i = 0
				Topic[j] = ReadRoleValue( turkey , EM_RoleValue_Register+j )
			end
			break
		end
	end	

	for i = 1 , #Topic , 1 do	-- 任務的題目字串數量
		if Topic[i] ~= 0 then	-- 1 ~ 5
			if Answer == Topic[i] then	-- 技能給的數字，與鶴鴕出題的數字符合，答對給2分。
				CallPlot( player , "Lua_jiyi_thanks_buffid_motion" , Answer )
				AddBuff( player , BuffLv , 1 , -1 )
				ScriptMessage( turkey , player , 0 , "[SC_2012THANKS_NPC_121493_SYSTEM_12]" , C_SYSTEM )--提示訊息：你答對了				
			else				-- 技能給的數字，與鶴鴕出題的數字不符合，答錯不給分。
				CallPlot( player , "Lua_jiyi_thanks_buffid_motion" , Answer )
				ScriptMessage( turkey , player , 0 , "[SC_2012THANKS_NPC_121493_SYSTEM_13]" , C_SYSTEM )--提示訊息：你答錯了
			end
			WriteRoleValue( turkey , EM_RoleValue_Register+i , 0 ) --將鶴鴕身上記字串的REG值寫回0
			break
		end
	end	
end

function Lua_jiyi_thanks_buffid_goal()--判斷目標是否為鶴鴕
	local own = OwnerID()
	local tar = TargetID()
	local chicken = ReadRoleValue( own , EM_RoleValue_Register+1 )
	if tar == chicken then
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_2012THANKS_NPC_121493_SYSTEM_11]" , 0 )--系統告知"非有效目標"	
		return false
	end
end

function Lua_jiyi_thanks_buffid_motion(id) --餵食技能動作
	local own = OwnerID()
	if id == 1 then
		PlayMotionex ( own , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END ) --餵食
	elseif id == 2 then
		PlayMotion( own , 112 ) --唱歌
	elseif id == 3 then
		PlayMotion( own , 261 ) --街舞
	end
end


--=====================================================================================
--			測試指令
--=====================================================================================
function Lua_jiyi_thanks_test() --刪除所有旗標
	local own = OwnerID()
	local Mode = { 547134 , 547135 , 547136 , 547137 , 547138 }	--任務1,2,3旗標
	local buff = { 623670 , 623686 , 623696 , 623698 } --鶴鴕心情指數(分數BUFF)、任務技能、判斷技能順序BUFF、判斷玩家已經在照顧鶴鴕

	for i = 1 , 5 do
		setflag( own , Mode[i] , 0 ) --關閉所有旗標
	end

	for i = 1 , 3 do
		CancelBuff( own , buff[i] ) --刪除全部BUFF
	end
end