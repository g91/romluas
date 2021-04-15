--===========================================================
--			紀錄玩家參與人次
--===========================================================
function Lua_jiyi_Xmas_121384_recode() --掛在任務模板：玩家接受任務後執行LUA劇情，用來紀錄參加任務人次
	local npc = OwnerID()
	local player = TargetID()
	DesignLog( player , 121384 , " Xmas Code event STAR" )	--記錄參加人次
end
--===========================================================
--			先鋒凱吉的對話劇情
--===========================================================
function Lua_jiyi_Xmas_test_121382_givekey() --先鋒凱吉的對話劇情
	local player = OwnerID() 
	local npc = TargetID()
	local key = { 546795 , 547145 , 547229 } --旗標：已拿過鑰匙、已完成拿鑰匙、快去尋寶吧
	local item = { 241796 , 241813 } --物品：金鑰匙、銀鑰匙
	CloseSpeak( player )	--關閉對話視窗
	if CheckAcceptQuest( player , 425335 )== true then--判斷玩家有接425335此任務
		if CheckFlag( player , key[1] ) == false then --判斷玩家沒有領過鑰匙
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_01]" )  --要領鑰匙的嗎?
			AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121382_01]", "Lua_jiyi_Xmas_test_121382_givekey2(1)", 0 )  --給鑰匙
		elseif  CountBodyItem( player , item[1] ) < 1 or CountBodyItem( player , item[2] ) < 1 then
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_02]" )  --鑰匙不見了嗎?再給一次
			AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121382_02]", "Lua_jiyi_Xmas_test_121382_givekey2(2)", 0 )  --重給鑰匙
		else		
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_03]" )  --回去吧			
		end
	elseif CheckFlag( player , key[2] ) == true and CheckFlag( player , key[3] ) == false then 
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_02]" )  --鑰匙不見了嗎?再給一次
			AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121382_02]", "Lua_jiyi_Xmas_test_121382_givekey2(2)", 0 )  --重給鑰匙
	else
		SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_04]" )  --是來探索的冒險者嗎	
	end
end

function Lua_jiyi_Xmas_test_121382_givekey2(unt) --給鑰匙劇情
	local player = OwnerID() 
	local npc = TargetID()
	local key = { 546795 , 547145 , 547229 } --旗標：已拿過鑰匙、已完成拿鑰匙、快去尋寶吧
	local item = { 241796 , 241813 } --物品：金鑰匙、銀鑰匙
	CloseSpeak( player )
	if CheckAcceptQuest( player , 425335 )== true then--判斷玩家有接425335此任務
		if unt == 1 then
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_05]" )  --這是很重要的鑰匙，請你務必要轉交給[121384]。
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_06]" )  --還好我這邊還有備份的鑰匙，都給你吧。
		end
		SetFlag( player , key[1] , 1 ) --開啟已拿過鑰匙旗標
		DelBodyItem( player , item[1] , 1 ) --將玩家身上有的鑰匙清除
		DelBodyItem( player , item[2] , 1 ) --將玩家身上有的鑰匙清除
		GiveBodyItem( player , item[1] , 1 ) --給玩家任務物品
		GiveBodyItem( player , item[2] , 1 ) --給玩家任務物品
	elseif CheckFlag( player , key[2] ) == true and CheckFlag( player , key[3] ) == false then 
		if unt == 1 then
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_05]" )  --這是很重要的鑰匙，請你務必要轉交給[121384]。
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_06]" )  --還好我這邊還有備份的鑰匙，都給你吧。
		end
		SetFlag( player , key[1] , 1 ) --開啟已拿過鑰匙旗標
		DelBodyItem( player , item[1] , 1 ) --將玩家身上有的鑰匙清除
		DelBodyItem( player , item[2] , 1 ) --將玩家身上有的鑰匙清除
		GiveBodyItem( player , item[1] , 1 ) --給玩家任務物品
		GiveBodyItem( player , item[2] , 1 ) --給玩家任務物品		
	else
		SetSpeakDetail( player , "[SC_2012XMAS_NPC_121382_04]" )  --是來探索的冒險者嗎	
	end		
	CloseSpeak( player )	
end
--===========================================================================
--					121370 寶箱對話劇情
--===========================================================================
function Lua_jiyi_Xmas_test_121370_box() --寶箱對話劇情
	local player = OwnerID() 
	local npc = TargetID()
	local item = { 241796 , 241813 , 241365 } --物品：金鑰匙 , 銀鑰匙 , 祕寶鑰匙
	local reg = ReadRoleValue( npc , EM_RoleValue_Register1 ) --紀錄寶箱是否可以開啟對話 =0 可對話
	local key = { 547229 , 547204 } --旗標：快去尋寶吧、開過寶箱
	CloseSpeak( player )	--關閉對話視窗
	if reg == 0 then 
		if CheckFlag( player , key[1] ) == true then --檢查玩家已完成拿鑰匙任務
			if CheckFlag( player , key[2] ) == false then --檢查玩家還沒開過寶箱
				if CountBodyItem( player , item[1] ) < 1 and CountBodyItem( player , item[2] ) < 1 and CountBodyItem( player , item[3] ) < 1 then --檢查玩家沒有鑰匙
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_01]" )  --這是一個普通的寶箱
				elseif CountBodyItem( player , item[1] ) >= 1 or CountBodyItem( player , item[2] ) >= 1 then --檢查玩家有金或銀鑰匙
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_02]" )  --發現一個寶箱，似乎可以用背包裡的鑰匙開啟
					AddSpeakOption( player , npc , "[SC_2012XMAS_NPC_121370_03]" , "Lua_jiyi_Xmas_test_121370_box2(1)", 0 )  --用背包裡的鑰匙打開寶箱
				elseif CountBodyItem( player , item[3] ) >= 1 then --檢查玩家有古老的鑰匙
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_04]" )  --發現雪人王的祕寶
					AddSpeakOption( player , npc , "[SC_2012XMAS_NPC_121370_05]" , "Lua_jiyi_Xmas_test_121370_box2(2)", 0 )  --打開寶箱						
				end
			elseif CheckFlag( player , key[2] ) == true then --已經有領過寶箱
				SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_06]" )  --這是一個空寶箱
			end
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_01]" )  --這是一個普通的箱子			
		end
	else
		SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_07]" )  --有人搶先發現寶箱			
	end
	CloseSpeak( player )	--關閉對話視窗
end

function Lua_jiyi_Xmas_test_121370_box2(mat) --打開寶箱
	local player = OwnerID() 
	local npc = TargetID()
	local item = { 241796 , 241813 , 241365 , 205807 , 724509 , 203734 }  --物品：金鑰匙、銀鑰匙 、祕寶鑰匙、生火用柴薪、活動藥水、冰霜獎勵票卷
	local buff = 623674   --祕寶的詛咒BUFF
	local reg = ReadRoleValue( npc , EM_RoleValue_Register1 ) --紀錄寶箱是否可以開啟對話 =0 可對話
	local R = Rand(100)+1 --rand從0開始+1變從1開始
	local key = { 547204 , 547145 } --旗標：開過寶箱、完成拿鑰匙
	local String = "[SC_2012XMAS_NPC_121370_08]"
	WriteRoleValue( npc , EM_RoleValue_Register1 , 1 )
	CloseSpeak( player )
	if reg == 0 then
		DesignLog( player , 1213841 , " Xmas Code event OVER" )	--記錄完成人次
		if mat == 2 then
			if CountBodyItem( player , item[3] ) >= 1 then --檢查玩家有祕寶鑰匙			
				if R >= 60  then --有40%的機率
					String = String.."["..item[4].."]".."[SC_2012XMAS_NPC_121370_09]".."["..item[6].."]"
					GiveBodyItem( player , item[4] , 3 ) 
					GiveBodyItem( player , item[6] , 2 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--你獲得5個生火用柴薪和1張冰霜獎勵票卷
				elseif R >= 30 and R < 60 then --有30%的機率
					String = String.."["..item[5].."]".."[SC_2012XMAS_NPC_121370_09]".."["..item[6].."]"
					GiveBodyItem( player , item[5] , 1 ) 
					GiveBodyItem( player , item[6] , 1 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--你獲得1個活動藥水和1張冰霜獎勵票卷
				else  --有30%的機率
					String = String.."["..item[6].."]"			
					GiveBodyItem( player , item[6] , 1 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--你獲得1張冰霜獎勵票卷
				end
				DelBodyItem( player , item[1] , 1 ) --將玩家身上有的金鑰匙清除
				DelBodyItem( player , item[2] , 1 ) --將玩家身上有的銀鑰匙清除
				DelBodyItem( player , item[3] , 1 ) --將玩家身上有的祕寶鑰匙清除
				SetFlag( player , key[1] , 1 ) --開啟開過寶箱旗標
				SetFlag( player , key[2] , 0 ) --關閉拿到鑰匙旗標	
				BeginPlot( npc , "Lua_jiyi_Xmas_test_121370_boxhide", 0 ) --寶箱隱藏劇情
			else
				SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_01]" )  --這是一個普通的箱子
				WriteRoleValue( npc , EM_RoleValue_Register1 , 0 ) --開啟寶箱可點擊值
			end							
		else --mat == 1
			if CountBodyItem( player , item[1] ) >= 1 then --檢查玩家有金鑰匙
				if R >= 40 then --有60%機率
					String = String.."["..item[4].."]".."[SC_2012XMAS_NPC_121370_09]".."["..item[6].."]"
					GiveBodyItem( player , item[4] , 6 ) 
					GiveBodyItem( player , item[6] , 1 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--你獲得3個生火用柴薪和2張冰霜獎勵票卷
				else  --有40%的機率
					GiveBodyItem( player , item[6] , 1 ) 
					AddBuff( player , buff , 0 , 10 ) --祕寶的詛咒BUFF
					ScriptMessage( npc , player , 1 , "[SC_2012XMAS_NPC_121370_10]" , C_SYSTEM )--你獲得了冰霜獎勵票卷，同時也被祕寶詛咒…
				end
				DelBodyItem( player , item[1] , 1 ) --將玩家身上有的金鑰匙清除
				DelBodyItem( player , item[2] , 1 ) --將玩家身上有的銀鑰匙清除
				DelBodyItem( player , item[3] , 1 ) --將玩家身上有的祕寶鑰匙清除
				SetFlag( player , key[1] , 1 ) --開啟開過寶箱旗標
				SetFlag( player , key[2] , 0 ) --關閉拿到鑰匙旗標	
				BeginPlot( npc , "Lua_jiyi_Xmas_test_121370_boxhide", 0 ) --寶箱隱藏劇情
			elseif CountBodyItem( player , item[2] ) >= 1 then --檢查玩家有銀鑰匙
				if R >= 40 then --有60%機率
					String = String.."["..item[4].."]".."[SC_2012XMAS_NPC_121370_09]".."["..item[6].."]"
					GiveBodyItem( player , item[4] , 6 ) 
					GiveBodyItem( player , item[6] , 1 ) 
					ScriptMessage( npc , player , 1 , String , C_SYSTEM )--你獲得生火用柴薪
				else  --有40%的機率
					GiveBodyItem( player , item[6] , 1 ) 
					AddBuff( player , buff , 0 , 10 )
					ScriptMessage( npc , player , 1 , "[SC_2012XMAS_NPC_121370_10]" , C_SYSTEM )--你獲得了冰霜獎勵票卷，同時也被祕寶詛咒…
				end
				DelBodyItem( player , item[1] , 1 ) --將玩家身上有的金鑰匙清除
				DelBodyItem( player , item[2] , 1 ) --將玩家身上有的銀鑰匙清除
				DelBodyItem( player , item[3] , 1 ) --將玩家身上有的祕寶鑰匙清除
				SetFlag( player , key[1] , 1 ) --開啟開過寶箱旗標
				SetFlag( player , key[2] , 0 ) --關閉拿到鑰匙旗標
				BeginPlot( npc , "Lua_jiyi_Xmas_test_121370_boxhide", 0 ) --寶箱隱藏劇情
			else			
				SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_01]" )  --這是一個普通的箱子
				WriteRoleValue( npc , EM_RoleValue_Register1 , 0 ) --開啟寶箱可點擊值			
			end
		end
	else
		SetSpeakDetail( player , "[SC_2012XMAS_NPC_121370_07]" )  --有人搶先發現寶箱		
	end
	CloseSpeak( player )	
end	

function Lua_jiyi_Xmas_test_121370_boxhide() --寶箱消失劇情
	local box = OwnerID()  --寶箱
	local player = TargetID() --玩家
	local key = 546795 --旗標：TEST_寶箱鑰匙
	CloseSpeak( player )
	hide( box ) --隱藏寶箱
	sleep( 100 ) --消失10秒鐘
	show( box , 0 ) --顯現寶箱
	WriteRoleValue( box , EM_RoleValue_Register1 , 0 ) --開啟寶箱可點擊值
end
--============================================================
--			先鋒凱特對話劇情
--============================================================
function Lua_jiyi_Xmas_test_121384_Robber() --掛在凱特的對話劇情
	local player = OwnerID()
	local npc = TargetID()
	local item = { 241796 , 241813 , 241365 } --金鑰匙 , 銀鑰匙、祕寶鑰匙
	local key = { 546795 , 547145 , 547229 } --旗標：拿過鑰匙、完成拿鑰匙、快去尋寶吧
	local reg2 = ReadRoleValue( npc , EM_RoleValue_Register2 ) --紀錄npc是否可以開啟對話 =0 可對話
	CloseSpeak( player )	--關閉對話視窗
	if reg2 == 0 then
			if CheckFlag( player , key[2] ) == true then --檢查玩家有完成拿鑰匙旗標
				if CountBodyItem( player , item[1] ) >= 1 and CountBodyItem( player , item[2] ) >= 1 then --當玩家有金、銀鑰匙
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_01]" )  --你拿到鑰匙了嗎
					AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121384_01]" , "Lua_jiyi_Xmas_test_121384_Robber2(1)" , 0 )  --給金鑰匙	
					AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121384_02]" , "Lua_jiyi_Xmas_test_121384_Robber2(2)" , 0 )  --給銀鑰匙
					AddSpeakOption( player , npc , "[SC_2012XMAS_PLAYER_121384_03]" , "Lua_jiyi_Xmas_test_121384_Robber2(3)" , 0 )  --給金、銀鑰匙
				elseif CheckFlag( player , key[3] ) == true then 
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_09]" )  --去尋找祕寶吧。				
				else
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_03]" )  --快到哈洛夫交易站					
				end	
			elseif CheckFlag( player , key[3] ) == true then --檢查玩家有快去尋寶吧旗標
				if CountBodyItem( player , item[1] ) >= 1 or CountBodyItem( player , item[2] ) >= 1 or CountBodyItem( player , item[3] ) >= 1 then --當玩家有金或銀鑰匙
					SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_09]" )  --去尋找祕寶吧。
				else
					LoadQuestOption(Player) --截入任務模板對話劇情	
				end
			else	
				LoadQuestOption(Player)				
			end
	else
		LoadQuestOption(Player)
	end
	CloseSpeak( player )	--關閉對話視窗								 
end

function Lua_jiyi_Xmas_test_121384_Robber2(num) --給單一鑰匙劇情
	local player = OwnerID()
	local npc = TargetID()
	local item = { 241796 , 241813 , 241365 } --金鑰匙 , 銀鑰匙 , 普通鑰匙
	local key = { 546795 , 547145 , 547229 } --旗標：拿過鑰匙、已完成拿鑰匙、快去尋寶吧
	CloseSpeak( player )
	WriteRoleValue( npc , EM_RoleValue_Register2 , 1 )
	if num == 1 then --當玩家選擇給金鑰匙
		if CountBodyItem( player , item[1] ) >= 1 then --檢查玩家身上是否有金鑰匙	
			DelBodyItem( player , item[1] , 1 ) --將玩家身上有的金或銀鑰匙清除
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_05]" )  --拿你背包的鑰匙去找寶箱
			SetFlag( player , key[2] , 1 )	--給旗標：已完成拿鑰匙
			SetFlag( player , key[3] , 1 )	--給旗標：快去尋寶吧
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_06]" )  --你沒有鑰匙
		end			
	elseif num == 2 then --當玩家選擇給銀鑰匙
		if CountBodyItem( player , item[2] ) >= 1 then --檢查玩家身上是否有銀鑰匙
			DelBodyItem( player , item[2] , 1 ) --將玩家身上有的金或銀鑰匙清除
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_05]" )  --拿你背包的鑰匙去找寶箱
			SetFlag( player , key[2] , 1 )	--給旗標：TEST_完成拿鑰匙
			SetFlag( player , key[3] , 1 )	--給旗標：快去尋寶吧
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_06]" )  --你沒有鑰匙
		end
	else --當玩家選擇給兩把鑰匙
		if CountBodyItem( player , item[1] ) >= 1 and CountBodyItem( player , item[2] ) >= 1 then --檢查玩家身上是否有金和銀鑰匙	
			DelBodyItem( player , item[1] , 1 ) --將玩家身上有的金鑰匙清除
			DelBodyItem( player , item[2] , 1 ) --將玩家身上有的銀鑰匙清除
			GiveBodyItem( player , item[3] , 1 ) --給玩家祕寶鑰匙
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_07]" )  --到寒夜谷營地找祕寶吧
			SetFlag( player , key[2] , 1 )	--給旗標：完成拿鑰匙
			SetFlag( player , key[3] , 1 )	--給旗標：快去尋寶吧			
		else
			SetSpeakDetail( player , "[SC_2012XMAS_NPC_121384_06]" )  --你沒有鑰匙
		end							
	end
	WriteRoleValue( npc , EM_RoleValue_Register2 , 0 )	
	CloseSpeak( player )		
end

function Lua_jiyi_Xmas_test_121384_giveflag() --任務完成給予判斷旗標
	local npc = OwnerID()
	local player = TargetID()
	local key = { 546795 , 547145 , 547232 , 547332 } --旗標：拿過鑰匙、完成拿鑰匙、尋寶前置、前進哈洛夫(全勤判斷用)
	local item = { 241796 , 241813 , 241365 } --金鑰匙 , 銀鑰匙 , 普通鑰匙
	SetFlag( player , key[3] , 0 ) --關閉尋寶前置旗標
	SetFlag( player , key[1] , 1 ) --開啟拿到寶箱鑰匙旗標
	SetFlag( player , key[4] , 1 ) --開啟前進哈洛夫(全勤判斷用)旗標
	if CheckFlag( player , key[1] ) == true then --檢查玩家有拿過鑰匙旗標
		SetFlag( player , key[2] , 1 ) --開啟完成拿鑰匙旗標
	end	
	ScriptMessage( npc , player , 1 , "[SC_2012XMAS_NPC_121384_08]" , C_SYSTEM ) --此時凱特伸手向你討鑰匙
end
--===================================================================
--					測試指令
--===================================================================
function Lua_jiyi_Xmas_test_flag1() --重置任務
	local own = OwnerID()
	local flag = { 547232 , 546795 , 547145 , 547229 , 547204 , 547332 } --尋寶前置、找凱吉拿過鑰匙、完成拿鑰匙、快去尋寶吧、開過寶箱、前進哈洛夫(全勤判斷用)
	local item = { 241796 , 241813 , 241365 } --金鑰匙 , 銀鑰匙 , 普通鑰匙
	local buff = 623674 --祕寶的詛咒

	CancelBuff( own , buff ) --刪除全部BUFF
	for i = 1 , 6 do
		setflag( own , flag[i] , 0 ) --關閉所有旗標
	end
	if CountBodyItem( own , item[1] ) >= 1 or CountBodyItem( own , item[2] ) >= 1 or CountBodyItem( own , item[3] ) >= 1 then --當玩家有金或銀鑰匙
		DelBodyItem( own , item[1] , 1 ) --將玩家身上有的金鑰匙清除
		DelBodyItem( own , item[2] , 1 ) --將玩家身上有的銀鑰匙清除
		DelBodyItem( own , item[3] , 1 ) --將玩家身上有的祕寶鑰匙清除
	end			
end

function Lua_jiyi_Xmas_test_flag2() --重置任務二
	local own = OwnerID()
	local flag = { 547232 , 547145 , 547229 , 547204 } --尋寶前置、完成拿鑰匙、快去尋寶吧、開過寶箱
	local buff = 623674 --祕寶的詛咒

	CancelBuff( own , buff ) --刪除BUFF
	for i = 1 , 4 do
		setflag( own , flag[i] , 0 ) --關閉所有旗標
	end
	SetFlag( own , flag[1] , 1 ) --給前置旗標
end