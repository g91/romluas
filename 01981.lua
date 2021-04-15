function Lua_ying_skillcraft_8850_01() --NPC阿奇柏德 對話

	local Quest = CheckAcceptQuest( OwnerID() , 424417 ) --任務：來自打鐵師的委託
	local Count = CountBodyItem( OwnerID() , 209993 ) --檢查冰晶石數量

	LoadQuestOption( OwnerID() ) --讀取任務模板
	if Quest == true then --有接取任務
		if Count <= 2 then --玩家身上冰晶石數量為0, 1, 2
			AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_01]" , "Lua_ying_skillcraft_8850_02" , 0 ) --"（你向118850阿奇柏德說明你的來意…）"
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8850_02() --"（你向118850阿奇柏德說明你的來意…）"選項

	local Quest = CheckAcceptQuest ( OwnerID() , 424417 ) --任務：來自打鐵師的委託
	local Count = CountBodyItem( OwnerID() , 209993 ) --檢查冰晶石數量

	if Quest == true then --有接任務
		SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_02]" ) --原來如此啊～你的運氣真好！幾天前我剛採集到了一些冰晶石，就交給你吧～
								              --至於要如何把冰晶石熔鑄成冰晶鑄塊，這我就不懂啦～不過我知道有個人一定有辦法，那就是哈里特，他可是一流的熔鑄師唷，找他準沒錯～
		if Count == 0 then
			GiveBodyItem( OwnerID() , 209993 , 3 ) --給予冰晶石*3
		elseif Count == 1 then
			GiveBodyItem( OwnerID() , 209993 , 2 ) --給予冰晶石*2
		elseif Count == 2 then
			GiveBodyItem( OwnerID() , 209993 , 1 ) --給予冰晶石*1
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_03]" ) --（阿奇柏德正專注於自己的事情，似乎沒聽見你在說話…）
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8851_01() --NPC哈里特 對話

	local Quest = CheckAcceptQuest ( OwnerID() , 424417 ) --任務：來自打鐵師的委託
	local Count = CountBodyItem( OwnerID() , 209993 ) --檢查冰晶石數量

	LoadQuestOption( OwnerID() )
	if Quest == true then --有接取任務
		if Count >= 3 then --玩家身上冰晶石數量3個以上
			AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_04]" , "Lua_ying_skillcraft_8851_02" , 0 ) --"請問，你就是鑄熔師[118851]嗎？"
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8851_02() --"請問，你就是鑄熔師[118851]嗎？" 選項

	local Quest = CheckAcceptQuest ( OwnerID() , 424417 ) --任務：來自打鐵師的委託
	local Count = CountBodyItem( OwnerID() , 209993 ) --檢查冰晶石數量

	if Quest == true then --有接任務
		if Count >= 3 then
			SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_05]" ) --我就是[118851]，有什麼事情嗎？
						  				 --（你交出了身上的[209993]，並把一切的來龍去脈都告訴了[118851]…） 
						 				 --我知道了，這點小事還難不倒我，包在我身上！ （幾分鐘過後…） 哈哈，來吧！輕輕鬆鬆就熔鑄完成了，小心拿好，不要弄丟囉～
			DelBodyItem( OwnerID() , 209993 , 3 ) --刪除冰晶石3個
			GiveBodyItem( OwnerID() , 209994 , 1 ) --給予冰晶鑄塊1個
		else
			SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_06]" ) --我就是[118851]，有什麼事情嗎？
							    			--（你把一切的來龍去脈都告訴了[118851]…） 我知道了，雖然這件事情難不倒我，但是想熔成1個[209994]，必須有3個[209993]才行。
		end
	else --沒接任務
		SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_07]" ) --我就是[118851]沒錯！但我現在很忙，不管你有什麼事情都別來打擾我，趕快走開～
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fish() --釣魚，"魚群"物件產生劇情

		SetPlot( OwnerID() , "Touch" , "Lua_ying_skillcraft_fish01" , 30 )
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fish01() --釣魚中
--	Say(OwnerID(), "Owner") = 玩家
--	Say(TargetID(), "Target") = 魚群
	local Quest = CheckAcceptQuest( OwnerID() , 424418 ) --任務：來自烹飪師的委託
	local X = Lua_Mounts_Copilot( OwnerID() ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
	local Count = CountBodyItem( OwnerID() , 209997 ) --檢查玩家身上活跳跳的鮮魚數量

	if Quest ==true then --有接任務
		if Count < 10 then --活跳跳鮮魚數量小於10個
			if X == true then --不在後座
				DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬
				PlayMotion( OwnerID() , 106 ) --播放ok動作，使手中武器收回
				AttachCastMotionTool( OwnerID() , 212402 ) --置換武器為釣竿
				if BeginCastBarEvent( OwnerID() , TargetID() , "[SC_CRAFT_2011_11]" , 30 , ruFUSION_ACTORSTATE_FISHING_CAST , ruFUSION_ACTORSTATE_FISHING_REEL , 0 , "Lua_ying_skillcraft_fish02") ~= 1 then --釣魚 (3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
				end
			else --在後座
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
			end
		else --10個以上
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_10]" , 0 ) --"你身上無法再裝下更多[209997]。"
		end		
	else --沒接任務
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_09]" , C_SYSTEM ) --"魚兒魚兒水中游～"
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fish02( Player , CheckStatus ) --(執行者, 參數)

	local X = Rand(100)+1 --1~100

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --檢查背包欄位
				if X <= 70 then --機率70%
					GiveBodyItem( Player , 209997 , 1 ) --給予活跳跳的鮮魚
				else --機率30%
					ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_12]" , C_SYSTEM ) --魚兒從你的釣竿上掙脫了～
				end
				EndCastBar( Player , CheckStatus ) --清除施法條
				SetModeEx( TargetID() , EM_SetModeType_Mark , false ) --隱藏標記
				SetModeEx( TargetID() , EM_SetModeType_Show , false ) --隱藏魚群
				BeginPlot( TargetID() , "Lua_ying_skillcraft_show", 0 ) --顯示魚群
			else
				EndCastBar( Player , CheckStatus ) --清除施法條
				ScriptMessage( TargetID() , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
		AttachCastMotionTool( Player , 212402 ) --置換武器為釣竿
		BeginPlot( Player , "Lua_ying_skillcraft_motion", 0 ) --結束釣竿動作
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_motion() --結束釣竿動作

	Sleep(40) --4秒
	AttachCastMotionTool( OwnerID() , 212076 )  --置換武器為空手
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_show() --顯示魚群

	Sleep(70) --7秒
	SetModeEx( OwnerID() , EM_SetModeType_Mark , true ) --顯示標記
	SetModeEx( OwnerID() , EM_SetModeType_Show , true ) --顯示魚群
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fire() --烤魚，"燃燒的火堆"物件產生劇情

	SetPlot( OwnerID() , "Touch" , "Lua_ying_skillcraft_fire01" , 30 ) 
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fire01() --烤魚中

	local Quest = CheckAcceptQuest( OwnerID() , 424418 ) --任務：來自烹飪師的委託
	local X = Lua_Mounts_Copilot( OwnerID() ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
	local Count = CountBodyItem( OwnerID() , 209997 ) --檢查玩家身上活跳跳的鮮魚數量

	if Quest == true then --有接任務
		if Count >= 1 then --活跳跳鮮魚數量大於等於1
			if X == true then --不在後座
				DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬
				if BeginCastBarEvent( OwnerID() , TargetID() , "[SC_CRAFT_2011_14]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_skillcraft_fire02") ~= 1 then --烤魚 (3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
				end
			else --在後座
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
			end
		else 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_13]" , C_SYSTEM ) --熊熊火焰燃燒中…
		end
	else --沒接任務
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_13]" , C_SYSTEM ) --熊熊火焰燃燒中…
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_fire02( Player , CheckStatus ) --(執行者, 參數)

	local X = Rand(100)+1 --1~100

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --檢查背包欄位
				if X <= 50 then --機率50%
					GiveBodyItem( Player , 209995 , 1 ) --給予美味的鮮魚
				else --機率50%
					GiveBodyItem( Player , 209996 , 1 ) --給予烤焦的魚
				end
				DelBodyItem( OwnerID() , 209997 , 1 ) --刪除活跳跳的鮮魚1個
				EndCastBar( Player , CheckStatus ) --清除施法條
			else
				EndCastBar( Player , CheckStatus ) --清除施法條
				ScriptMessage( TargetID() , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_givekey() --接受任務後執行
--	Say(OwnerID(), "Owner") --= NPC
--	Say(TargetID(), "Target") --= 玩家

	local QKey = { 545436 , 545437 , 545438 , 545439 , 545440 , 545441 } --Keyitem，NPC出的題目：橘、紫、粉紅、綠、淡黃、水藍
	local Step = 0 
	local String = { "[SC_CRAFT_2011_21]" , "[SC_CRAFT_2011_22]" , "[SC_CRAFT_2011_23]" , "[SC_CRAFT_2011_24]" , "[SC_CRAFT_2011_25]" , "[SC_CRAFT_2011_26]" } --字串：橘、紫、粉紅、綠、淡黃、水藍
--	(接任務時，檢查玩家身上是否已有題目key，有的話即清除。)
	for i = 1 , table.getn(QKey) , 1 do --1 , 6 , 1 do
		if CheckFlag( TargetID() , QKey[i] ) == true then --當玩家身上有相關keyitem...
			SetFlag( TargetID() , QKey[i] , 0 ) --刪除相關keyitem
		end
	end
--	(若玩家身上沒有相關的keyitem，隨機給一個題目key，並給予對話。)
	for i = 1 , table.getn(QKey) , 1 do --1 , 6 , 1 do
		if CheckFlag( TargetID() , QKey[i] ) == false then
			Step = Step + 1 --若玩家身上無相關key，則Step+1
		end
		if Step == 6 then  --Step == 6，即玩家身上6個key沒有
			local R = Rand(6)+1 --(0~5)+1 =1~6

			SetFlag( TargetID() , QKey[R] , 1 ) --隨機給予一個key
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_CRAFT_2011_19]".." "..String[R].." ".."[SC_CRAFT_2011_20]" , C_SYSTEM ) --請幫煉金巧匠調配出X色藥劑！
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_CRAFT_2011_19]".." "..String[R].." ".."[SC_CRAFT_2011_20]" , C_SYSTEM ) --請幫煉金巧匠調配出X色藥劑！
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424419over() --完成任務後執行
--	Say(OwnerID(), "Owner") --= NPC
--	Say(TargetID(), "Target") --= 玩家
	SetFlag( TargetID() , 545436 , 0 ) --橘
	SetFlag( TargetID() , 545437 , 0 ) --紫
	SetFlag( TargetID() , 545438 , 0 ) --粉紅
	SetFlag( TargetID() , 545439 , 0 ) --綠
	SetFlag( TargetID() , 545440 , 0 ) --淡黃
	SetFlag( TargetID() , 545441 , 0 ) --水藍
	SetFlag( TargetID() , 545447 , 0 ) -- 刪除煉金任務key
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_color() --選顏色，"藥劑"物件產生劇情

	SetPlot( OwnerID() , "Touch" , "Lua_ying_skillcraft_color01" , 30 )
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_color01() --選顏色

	local Quest = CheckAcceptQuest( OwnerID() , 424419 ) --任務：來自煉金師的委託
	local Color = { 118854 , 118855 , 118856 , 118857 } --物件ID：紅色藥劑、黃色藥劑、藍色藥劑、白色藥劑
	local BUFF = { 620402 , 620403 , 620404 , 620405 } --BUFFID：紅BF、黃BF、藍BF、白BF
	local Key = { 545436 , 545437 , 545438 , 545439 , 545440 , 545441 } --Keyitem，NPC出的題目：橘、紫、粉紅、綠、淡黃、水藍
	local Step = { { 620402 , 620403 } , { 620402 , 620404 } , { 620402 , 620405 } , { 620403 , 620404 } , { 620403 , 620405 } , { 620404 , 620405 } }--BUFF組合：紅+黃、紅+藍 、紅+白、黃+藍、黃+白、藍+白
	local Type = 0 --種類
	local Count =BuffCount( OwnerID() ) --查詢玩家身上BUFF數量( 起始值為 0 )
	local X = CountBodyItem( OwnerID() , 209998 ) --檢查玩家身上是否有"混合完成的藥劑"

	if Quest == true then --有接任務
		if X <= 0 then --玩家身上沒有"混合完成的藥劑"
--			(此迴圈用來判斷玩家身上是否有任一個顏色的BUFF)
			for i = 0 , Count , 1 do --讀取玩家身上所有BUFF總量
				local BUFFID = BuffInfo( OwnerID() , i , EM_BuffInfoType_BuffID ) --取得玩家身上某位置的BUFFID

				for j = 1 , table.getn(BUFF) , 1 do --1 , 4 , 1 do
					if BUFFID == BUFF[j] then --如果玩家身上取得的BUFFID，符合BUFF[j]...
						Type = Type + 1 --種類+1 ( Type只會有 0 或 1 )
					end
				end
			end
--
			for i = 1 , table.getn(Color) , 1 do --讀取任務物件ID --1 , 4 , 1 do
				if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == Color[i] then -- 如果點擊的任務物件ID，符合陣列中的任務物件ID 時...
					if Type == 0 then -- 當玩家身上相關的Buff種類為 0 種時...
						AddBuff( OwnerID() , BUFF[i] , 0 , 300 )
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_16][$SETVAR1=".."["..Color[i] .."]".."]" , C_SYSTEM ) --你選取了X色藥劑…
						break
					elseif Type == 1 then --當玩家身上相關的Buff種類為 1 種時...
						AddBuff( OwnerID() , BUFF[i] , 0 , 300 )
						for j = 1 , table.getn(Key) , 1 do --NPC出的題目 --1 , 6 , 1 do
							if CheckFlag( OwnerID() , Key[j] ) == true then --檢查玩家身上有哪一個題目key
								if CheckBuff( OwnerID() , Step[j][1] ) == true and CheckBuff( OwnerID() , Step[j][2] ) == true then 
								--如果玩家身上BUFF組合為 BUFF[Step[j][1]] 和 BUFF[Step[j][2]]
									GiveBodyItem( OwnerID() , 209998 , 1 ) --給予玩家1個"混合完成的藥劑"
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_17]" , C_SYSTEM ) --你成功調配出了一瓶藥劑！
									break
								else --非題目組合
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_18]" , C_SYSTEM ) --看起來似乎調配錯了，請重新嘗試～
									break
								end
							end
						end
						for j = 1 , table.getn(BUFF) , 1 do -- 1 , 4 , 1 do
							CancelBuff( OwnerID() , BUFF[j] ) --清除玩家身上BUFF
						end
					end
				end
			end
		else --有"混合完成的藥劑"
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_09]" , 0 ) --"你已擁有該任務物品"
		end
	else --沒接任務
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_15]" , 0 ) --請勿隨意碰觸！
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8816_01() --NPC艾維斯 對話

	local Quest = CheckAcceptQuest( OwnerID() , 424420 ) --任務：來自製甲師的委託
	local Count = CountBodyItem( OwnerID() , 209999 ) --檢查精工強化鐵數量
	local BUFF = CheckBuff( OwnerID() , 620431 ) --檢查玩家身上是否有遊戲題目BUFF
	
	if Quest == true then --有接任務
		if  BUFF == true then --有題目BUFF
			if Count <= 0 then --身上沒有精工強化鐵
				SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_33]" ) --趕緊來猜猜看，我身上有的礦是什麼種類的吧～
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_34]" , "Lua_ying_skillcraft_select0" , 0 ) --祕銀礦200244
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_35]" , "Lua_ying_skillcraft_select1" , 0 ) --黃銅礦200230
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_36]" , "Lua_ying_skillcraft_select2" , 0 ) --赤鐵礦200234
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_37]" , "Lua_ying_skillcraft_select3" , 0 ) --闇晶礦200238
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_38]" , "Lua_ying_skillcraft_select4" , 0 ) --紫銅礦200236
			else
				SetSpeakDetail ( OwnerID() , "[SC_VALENTINE_2011EV1_09]" ) --"你已擁有該任務物品"
			end
		else --沒題目BUFF
			SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_27]" ) --嘻嘻嘻～我有一個很特別的東西唷～是我爸爸給我的，你想知道是什麼嗎？呵呵…才不告訴你呢！
			if Count <= 0 then --身上沒有精工強化鐵
				AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_28]" , "Lua_ying_skillcraft_8816_02" , 0 ) --拜託，告訴我嘛～
			end
		end
	else --沒任務
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_27]" ) --嘻嘻嘻～我有一個很特別的東西唷～是我爸爸給我的，你想知道是什麼嗎？呵呵…才不告訴你呢！
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8816_02() --"拜託，告訴我嘛～"

	local Quest = CheckAcceptQuest( OwnerID() , 424420 ) --任務：來自製甲師的委託

	if Quest == true then
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_29]" ) --嗯…好吧，但是你不可以告訴別人喔～爸爸說這個叫做[209999]，很漂亮吧？亮晶晶的呢…
									 --爸爸說這個東西很多人都想要…咦？！你該不會也是想要這個東西吧？我不輕易給人的喔～
									 --要不…你陪我玩個遊戲好了，嘻嘻嘻～在我身上還有另一種礦，只要你能在30秒內猜中是什麼礦、數量多少，我就把[209999]給你。
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_30]" , "Lua_ying_skillcraft_8816_03" , 0 ) --那有什麼問題！我準備好要猜囉～
	else
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_31]" ) --我又不認識你，爸爸說不可以跟陌生人講話！
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8816_03() --"那有什麼問題！我準備好要猜囉～"

	local Quest = CheckAcceptQuest( OwnerID() , 424420 ) --任務：來自製甲師的委託
	local Ran = Rand(50) --0~49
	local NoNum = { 9 , 19 , 29 , 39 , 49 } --在遊戲中為 10 , 20 , 30 , 40 , 50 (不要的選項) --1~9

	if Quest == true then
		for i = 1 , table.getn(NoNum) , 1 do --1 , 5 , 1 do --不要的數字
			if Ran == NoNum[i] then --若rand到不要的數字就-1
				Ran= Ran - 1  --rand到不要的數字就-1		
			end
		end
		AddBuff( OwnerID() , 620431 , Ran , 30 ) --題目BUFF
--		Say( OwnerID() , "Ran = "..Ran )
		Lua_ying_skillcraft_8816_01()
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CRAFT_2011_32]" , 0 ) --你已將任務放棄，無法開始遊戲！
		CloseSpeak( OwnerID() ) --關閉對話視窗
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select0() --祕銀礦200244

	Lua_ying_skillcraft_menu(0)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select1() --黃銅礦200230

	Lua_ying_skillcraft_menu(1)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select2() --赤鐵礦200234

	Lua_ying_skillcraft_menu(2)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select3() --闇晶礦200238

	Lua_ying_skillcraft_menu(3)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_select4() --紫銅礦200236

	Lua_ying_skillcraft_menu(4)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_menu(Value) --選擇其中一種礦
--	Say(OwnerID(), "Owner") --= 玩家
--	Say(TargetID(), "Target") --= NPC
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620431 ) --判斷玩家身上的題目BUFF等級多少
	local Num1 = Math.floor( BuffLV / 10 ) --取整數(若BuffLV=15，除10取整數後為1)

	if Num1 == Value then --若BuffLV取整數後的數字等於選項數字，答對
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_39]" ) --答對了～算你厲害，再來就是猜數量囉～
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_41]" , "Lua_ying_skillcraft_opt0" , 0 ) --1個
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_42]" , "Lua_ying_skillcraft_opt1" , 0 ) --2個
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_43]" , "Lua_ying_skillcraft_opt2" , 0 ) --3個
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_44]" , "Lua_ying_skillcraft_opt3" , 0 ) --4個
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_45]" , "Lua_ying_skillcraft_opt4" , 0 ) --5個
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_46]" , "Lua_ying_skillcraft_opt5" , 0 ) --6個
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_47]" , "Lua_ying_skillcraft_opt6" , 0 ) --7個
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_48]" , "Lua_ying_skillcraft_opt7" , 0 ) --8個
		AddSpeakOption( OwnerID() , TargetID(), "[SC_CRAFT_2011_49]" , "Lua_ying_skillcraft_opt8" , 0 ) --9個
	else --答錯
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_40]" ) --嘻嘻嘻～這個答案不對唷～
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt0() --1個

	Lua_ying_skillcraft_menu02(0)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt1() --2個

	Lua_ying_skillcraft_menu02(1)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt2() --3個

	Lua_ying_skillcraft_menu02(2)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt3() --4個

	Lua_ying_skillcraft_menu02(3)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt4() --5個

	Lua_ying_skillcraft_menu02(4)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt5() --6個

	Lua_ying_skillcraft_menu02(5)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt6() --7個

	Lua_ying_skillcraft_menu02(6)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt7() --8個

	Lua_ying_skillcraft_menu02(7)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_opt8() --9個

	Lua_ying_skillcraft_menu02(8)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_menu02(Value) --選擇數量

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620431 ) --判斷玩家身上的題目BUFF等級多少
	local Num2 = BuffLV % 10 --取餘數(若BuffLV=27，除10取餘數後為7)

	if Num2 == Value then --若BuffLV取餘數後的數字等於選項數字，答對
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_50]" ) --哇賽，這樣都能被你猜對，那我就把[209999]送給你了，有空再來陪我玩哦～
		GiveBodyItem( OwnerID() , 209999 , 1 ) --給予精工強化鐵1個
		CancelBuff( OwnerID() , 620431 ) --刪除題目BUFF
	else --答錯
		SetSpeakDetail ( OwnerID() , "[SC_CRAFT_2011_40]" ) --嘻嘻嘻～這個答案不對唷～
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8848_01() --NPC 伯頓 對話

	local Key1 = CheckFlag( OwnerID(), 545443 ) -- 裁縫任務
	local Key2 = CheckFlag( OwnerID(), 545444 ) -- 木工任務
	local Key3 = CheckFlag( OwnerID(), 545445 ) -- 打鐵任務
	local Key4 = CheckFlag( OwnerID(), 545446 ) -- 烹飪任務
	local Key5 = CheckFlag( OwnerID(), 545447 ) -- 煉金任務
	local Key6 = CheckFlag( OwnerID(), 545448 ) -- 製甲任務
	local KeyA = CheckFlag( OwnerID(), 545449 ) -- 已對話(每日重置)

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家
	if KeyA == false then
		SetSpeakDetail( OwnerID() , "[SC_CRAFT_2011_51]" ) --每回一到了這個時節，巧匠們為了實踐早期所傳承下來的「巧匠精神」.....
		AddSpeakOption( OwnerID() , TargetID(), "[SC_111490_DIALOG7_2]" , "Lua_ying_skillcraft_8848_02" , 0 ) --然後呢?
	elseif KeyA == true and Key1 == false and Key2 == false and Key3 == false and Key4 == false and Key5 == false and Key6 == false then
		SetSpeakDetail ( OwnerID() , "[SC_THANKSGIVING_16]" ) --你今天已經完成了這個任務，請你明天再來吧。
	elseif KeyA == true then
		LoadQuestOption( OwnerID())
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_8848_02() --"然後呢?"選項

	SetFlag( OwnerID() , 545443 , 1 ) -- 裁縫任務
	SetFlag( OwnerID() , 545444 , 1 ) -- 木工任務
	SetFlag( OwnerID() , 545445 , 1 ) -- 打鐵任務
	SetFlag( OwnerID() , 545446 , 1 ) -- 烹飪任務
	SetFlag( OwnerID() , 545447 , 1 ) -- 煉金任務
	SetFlag( OwnerID() , 545448 , 1 ) -- 製甲任務
	SetFlag( OwnerID() , 545449 , 1 ) -- 已對話(每日重置)
	LoadQuestOption( OwnerID())
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424415over()

	SetFlag( TargetID() , 545443 , 0 ) -- 刪除裁縫任務key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424416over()

	SetFlag( TargetID() , 545444 , 0 ) -- 刪除木工任務key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424417over()

	SetFlag( TargetID() , 545445 , 0 ) -- 刪除打鐵任務key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424418over()

	SetFlag( TargetID() , 545446 , 0 ) -- 刪除烹飪任務key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_skillcraft_424420over()

	SetFlag( TargetID() , 545448 , 0 ) -- 刪除製甲任務key
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------