--=========================================================
--				花的觸碰劇情
--=========================================================
function Lua_jiyi_Flower_touch() --掛在花的物件產生劇情上
	local Flower = OwnerID()
	local Player = TargetID()

	SetPlot( Flower , "touch" , "Lua_jiyi_Flower_touch2" , 30 )
	for i = 0 , 30 do
		Sleep(10)
		if i == 30 then
			WriteRoleValue( Flower , EM_RoleValue_PID , 1 ) --不可觸碰
			DelObj( Flower ) --刪除Flower		
		end
	end
end

function Lua_jiyi_Flower_touch2()
	local Player = OwnerID()
	local Flower = TargetID()
	local GameFlag = { 547321 , 547354 } --TEST_已報名旗標、TEST_已領過獎勵
	local Buff = { 623704 , 623703 , 623900 , 623921 } --變身BUFF、得分BUFF、已採過花BUFF、給額外技能
	local touch = ReadRoleValue( Flower , EM_RoleValue_PID  )
	local RandNum = DW_Rand(10)
	if touch == 0 then
		if CheckBuff ( Player , Buff[1] ) == true then --玩家有在活動中的變身BUFF
			if CheckFlag( player , GameFlag[2] ) == false then --玩家還沒領獎
				if CheckBuff ( Player , Buff[3] ) == false then --當玩家沒有已採過花BUFF
					if RandNum == 1 or RandNum == 5 or RandNum == 7 then
						AddBuff ( Player , Buff[4] , 0 , -1 ) --給額外技能
						AddBuff ( Player , Buff[2] , 0 , -1 ) --得分
						AddBuff ( Player , Buff[3] , 0 , 10 ) --已採過花BUFF				
						ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_04]" , C_SYSTEM )--你撿到一朵擁有特別多能量的[121715]，領悟到[850541]技能			
						WriteRoleValue( Flower , EM_RoleValue_PID , 1 ) --不可觸碰
						DelObj( Flower ) --刪除祝福之花	
					else
						AddBuff ( Player , Buff[2] , 0 , -1 ) --得分
						AddBuff ( Player , Buff[3] , 0 , 10 ) --已採過花BUFF				
						ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_02]" , C_SYSTEM )--你獲得了花之祝福			
						WriteRoleValue( Flower , EM_RoleValue_PID , 1 ) --不可觸碰
						DelObj( Flower ) --刪除祝福之花
					end
				else
					ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_03]" , C_SYSTEM )--你採過祝福之花了，留一些給別人吧
				end				
			else
				ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_01]" , C_SYSTEM )	
			end
		else
			ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_01]" , C_SYSTEM )
		end
	else
		ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_01]" , C_SYSTEM )			
	end		
end
--=========================================================
--				報名NPC對話劇情
--=========================================================
function Lua_jiyi_test_FlowerNpc()
	local Player = OwnerID() --玩家
	local Npc = TargetID() --NPC
	local GameFlag = { 547321 , 547322 , 547354 } --TEST_已報名旗標、TEST_活動進行中、TEST_已領過獎勵
	local Buff = 623922 --報名BUFF
	local SignUp = ReadRoleValue( Npc , EM_RoleValue_PID ) --NPC可否報名

	if CheckFlag( Player , GameFlag[3] ) == true then --玩家有TEST_已領過獎勵旗標
		SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_05]" ) --你今天已經有保護過[121654]，花神可能已經記住你了，明天在再來幫我吧。
	elseif SignUp == 1 then --0~10分可以報名的時候		
		if CheckFlag( Player , GameFlag[2] ) == true then --玩家有活動進行中旗標
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_06]" )--你把花之祝福帶來了嗎？
			AddSpeakOption( player , npc , "[SC_2013FLOWERS_NPC_121383_07]" , "Lua_jiyi_test_FlowerNpc4" , 0 )  --是的，我幫你帶回來了。
		elseif CheckFlag( Player , GameFlag[1] ) == false then --玩家沒有已報名旗標
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_01]" )  --你願意幫助我嗎？
			AddSpeakOption( player , npc , "[SC_2013FLOWERS_NPC_121383_02]" , "Lua_jiyi_test_FlowerNpc2" , 0 )  --如果我能幫得上你的忙，你就說看看吧。
		elseif CheckFlag( Player , GameFlag[1] ) == true and CheckBuff( Player , Buff ) == false then --玩家有已報名旗標但沒有報名BUFF
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_20]" )--你已經今天錯過收集祝福的機會，請你明天再來幫幫我吧。
		else 
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_04]" )  --稍等一下，[121654]就會出現在前方不遠處。		
		end							
	else --非報名時間
		if CheckFlag( Player , GameFlag[2] ) == true then --玩家有活動進行中旗標
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_06]" )--你把花之祝福帶來了嗎？
			AddSpeakOption( player , npc , "[SC_2013FLOWERS_NPC_121383_07]" , "Lua_jiyi_test_FlowerNpc4" , 0 )  --是的，我幫你帶回來了。
		elseif CheckFlag( Player , GameFlag[1] ) == true and CheckFlag( Player , GameFlag[2] ) == false then --玩家有已報名旗標但沒有活動進行中旗標
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_20]" )--你已經今天錯過收集祝福的機會，請你明天再來幫幫我吧。	
		else
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_21]" )--好想獲得花神的祝福啊…		
		end
	end					
end

function Lua_jiyi_test_FlowerNpc2() --願意幫助他
	local player = OwnerID() --玩家
	local npc = TargetID() --npc
--	CloseSpeak( player )	--關閉對話視窗
	SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_03]" )  --活動說明
	AddSpeakOption( player , npc , "[SC_2013FLOWERS_NPC_121383_08]", "Lua_jiyi_test_FlowerNpc3" , 0 )  --好啊，我去幫你收集一些祝福。
--	CloseSpeak( player )	--關閉對話視窗
end

function Lua_jiyi_test_FlowerNpc3()
	local Player = OwnerID() --玩家
	local Npc = TargetID() --NPC
	local GameFlag = { 547321 , 547354 } --TEST_已報名旗標、TEST_已領過獎勵
	local buff = 623922 
	DesignLog( Player , 121383 , " 2013Flower Code event STAR" )	--記錄參加人次
--	CloseSpeak( Player )	--關閉對話視窗
	SetSpeakDetail( player , " [SC_2013FLOWERS_NPC_121383_09] " )  --我的幸福就交付於你了。
	AddBuff( Player , buff , 0 , 900 )--收集祝褔的自願者
	SetFlag( Player , GameFlag[1] , 1 )
--	CloseSpeak( Player )	--關閉對話視窗
end

function Lua_jiyi_test_FlowerNpc4()--領獎勵
	local Player = OwnerID() --玩家
	local Npc = TargetID() --NPC
	local BuffID = 623703
	local reward = { 209161 , 724509 } --獎勵：活動獎券、必爾汀藥水
	local BuffLv =  FN_CountBuffLevel( Player , BuffID ) --檢查玩家身上BUFF
	local GameFlag = { 547321 , 547322 , 547354 } --已報名旗標、活動進行中、已領過獎勵
	CloseSpeak( Player )	--關閉對話視窗
	if BuffLv <= 0 then --BuffLv顯示1
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[2] , 1 ) --給一個藥水
	elseif BuffLv >= 1 and BuffLv < 59 then --BuffLv>=1<60
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 1 ) --給一張活動獎券
	elseif BuffLv >= 59 and BuffLv < 98 then --BuffLv>=60<99
 		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 2 ) --給二張活動獎券
	elseif BuffLv >= 98  then --BuffLv>=99
 		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 2 ) --給2張活動獎券
		GiveBodyItem( player , reward[2] , 1 ) --給一個藥水	
	end
	SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_10]" ) --謝謝你幫我收集祝福
--	SetFlag( Player , GameFlag[1] , 0 ) --關掉已報名旗標旗標
	SetFlag( Player , GameFlag[2] , 0 ) --關掉活動進行中旗標
	SetFlag( Player , GameFlag[3] , 1 )-- 已經領取過獎勵
	DesignLog( Player , 1213831 , " 2013Flower Code event OVER" )	--記錄完成人次
	Lua_Festival_02_All(Player) --全勤獎
end
--======================================================
--				掛在121383身上檢查時間的中控器
--======================================================
function Lua_jiyi_Flower_Test_Control()
	local Npc = OwnerID()
	local Box = LuaFunc_SearchNPCbyOrgID( Npc , 121383 , 100 , 0 ) --以隱藏物件為中心，向周圍N碼搜尋特定IDNPC
	local RoomID = ReadRoleValue( Npc , EM_RoleValue_RoomID ) --讀取分流ID
	AddBuff( Npc , 503217 , 1 , -1 ) --節慶符號
	while true do
		local Hour = GetSystime(1) --取得現在時間：時
		local Min = GetSystime(2) --取得現在時間：分
--		Say( Npc , GetSystime(1)..":"..GetSystime(2) )
		local Reg1 = ReadRoleValue( Box , EM_RoleValue_Register1 )  -- 測試用報名開關
		if  Reg1 == 100  then  
--			Say( Box , "100" )
			WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --把NPC的PID值寫為"0"，取消開放報名
			local FlowerNpc = CreateObjByFlag( 121654 , 781188 , 0 , 1 ) --產生活動NPC
			SetModeEx( FlowerNpc  , EM_SetModeType_ShowRoleHead , True )--頭像框
			addToPartition( FlowerNpc , RoomID )
			WriteRoleValue( Box , EM_RoleValue_Register1 , 0 ) -- 將NPC R1 改回 0
			NPCSAY( Box , "The game is star" )	
			WriteRoleValue( FlowerNpc , EM_RoleValue_Register8 , Npc )	--讓花精靈記住賈斯特	
		--	local reg8 = ReadRoleValue( FlowerNpc , EM_RoleValue_Register8 )
	--		DebugMsg( 0 , 0 , "reg8="..reg8 )						
		elseif Reg1 == 99 then  	---- 測試用報名時段
--			Say( Box , "99" )
			NPCSAY( Box , " The game will begin , please join me !" )
			if ReadRoleValue( Npc , EM_RoleValue_PID )  == 0 then 
				WriteRoleValue( Npc , EM_RoleValue_PID , 1 ) --把NPC的PID值寫為"1"，表示NPC開放報名
			end
			local HideBox = CreateObjByFlag( 121720 , 781188 , 0 , 1 ) --產生隱藏物件
			addToPartition( HideBox , RoomID )
			NPCSAY( Box , "[SC_2013FLOWERS_NPC_121383_19]" ) --再過幾分鐘[121654]就要出現了
			WriteRoleValue( Box , EM_RoleValue_Register1 , 0 ) -- 將NPC R1 改回 0
		else
			if ( Hour == 13 ) or ( Hour == 16 ) or ( Hour == 19 ) or ( Hour == 22 )  then 
				if min == 0 then
					local HideBox 
					HideBox = CreateObjByFlag( 121720 , 781188 , 0 , 1 ) --產生隱藏物件
					addToPartition( HideBox , RoomID )
					RunningMsgEx( Npc , 2 , 3 , "[SC_2013FLOWERS_NPC_121383_11]" ) --可以開始報名
					WriteRoleValue( Npc , EM_RoleValue_PID , 1 ) --NPC可報名狀態
				elseif Min == 10 then --10分活動開始的時候
					WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --NPC不可報名狀態 
					local FlowerNpc = CreateObjByFlag( 121654 , 781188 , 0 , 1 ) --產生活動NPC	
					SetModeEx( FlowerNpc  , EM_SetModeType_ShowRoleHead , True )--頭像框
					addToPartition( FlowerNpc , RoomID )
					WriteRoleValue( FlowerNpc , EM_RoleValue_Register8 , Npc )	--讓花精靈記住賈斯特	
				elseif Min == 1 or Min == 3 or Min == 5 or Min == 9 then
					NPCSAY( Npc , "[SC_2013FLOWERS_NPC_121383_19]" ) --再過幾分鐘[121654]就要出現了
				elseif Min == 7 then --7分活動快開始的時候	
					NPCSAY( Npc , "[SC_2013FLOWERS_NPC_121383_12]" ) --再過3分鐘[121654]就要出現了
--				else --其他非報名時間
--					WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --NPC不可報名狀態
				end				
			else --其他小時
				if Min == 0 then --0分活動報名的時候
					local HideBox = CreateObjByFlag( 121720 , 781188 , 0 , 1 ) --產生隱藏物件
					addToPartition( HideBox , RoomID )
					WriteRoleValue( Npc , EM_RoleValue_PID , 1 ) --NPC可報名狀態			
				elseif Min == 10 then --10分活動開始的時候
					WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --NPC不可報名狀態 
					local FlowerNpc = CreateObjByFlag( 121654 , 781188 , 0 , 1 ) --產生活動NPC	
					SetModeEx( FlowerNpc  , EM_SetModeType_ShowRoleHead , True )--頭像框
					addToPartition( FlowerNpc , RoomID )
					WriteRoleValue( FlowerNpc , EM_RoleValue_Register8 , Npc )	--讓花精靈記住賈斯特		
				elseif Min > 0 and Min< 10 then --0~10分報名的時候
					if Min == 1 or Min == 3 or Min == 5 or Min == 9 then
						NPCSAY( Npc , "[SC_2013FLOWERS_NPC_121383_19]" ) --再過幾分鐘[121654]就要出現了
					elseif Min == 7 then --7分活動快開始的時候	
						NPCSAY( Npc , "[SC_2013FLOWERS_NPC_121383_12]" ) --再過3分鐘[121654]就要出現了
					end
--				else --其他非報名時間
--					WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --NPC不可報名狀態
				end
			end
		end				
	Sleep(600) --每分鐘檢查
	end	
end
-------------------------------------------------------------------------------------------------------------------------
--					測試指令
-------------------------------------------------------------------------------------------------------------------------
function Lua_jiyi_2013Flower_Test_Control() --測試開啟報名時段
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 121383 , 300 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 99 )
	WriteRoleValue( Npc , EM_RoleValue_PID , 1 ) --把NPC的PID值寫為"1"，表示NPC開放報名
	local Reg1 = ReadRoleValue( NPC , EM_RoleValue_Register1 )  -- 測試用報名開關
	Say( NPC , "Flower NPC ="..Reg1 )
end

function Lua_jiyi_2013Flower_Test_Control2() --測試開啟活動時段
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 121383 , 300 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 100 ) 
	local Reg1 = ReadRoleValue( NPC , EM_RoleValue_Register1 )  -- 測試用報名開關
	Say( NPC , "Flower NPC ="..Reg1 )
end

function Lua_jiyi_2013Flower_Test_GameFlag()--測試用刪除全部旗標、全部BUFF
	local player = OwnerID()
	local Mode = { 547321 , 547322 , 547354 }	--活動用旗標：已報名收集祝福、收集祝福進行中、已領過祝福獎勵
	local buff = { 623703 , 623704 , 623894 , 623896 , 623921 , 623922 } --花之祝福(分數BUFF)、護花使者狀態、護花掌、給活動技能、給額外技能、收集祝褔的自願者
	for i = 1 , 3 do
		setflag( player , Mode[i] , 0 ) --關閉所有旗標
	end

	for i = 1 , 6 do
		CancelBuff( player , buff[i] ) --刪除全部BUFF
	end
end

function Lua_jiyi_2013Flower_Test_GameFlag2()--測試用刪除活動旗標、活動BUFF(只保留已報名旗標)
	local player = OwnerID()
	local Mode = { 547322 , 547354 }	--活動用旗標：收集祝福進行中、已領過祝福獎勵
	local buff = { 623703 , 623704 , 623894 , 623896 , 623921 } --花之祝福(分數BUFF)、護花使者狀態、護花掌、給活動技能、給額外技能
	for i = 1 , 2 do
		setflag( player , Mode[i] , 0 ) --關閉所有旗標
	end

	for i = 1 , 5 do
		CancelBuff( player , buff[i] ) --刪除全部BUFF
	end
end

function Lua_jiyi_2013Flower_Test_122801(lv) --測試分數
	local PlayerID = OwnerID()	
	AddBuff( PlayerID , 623703 , lv , -1 )
end