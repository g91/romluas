function jiyi_Beer_NPC()--掛在任務NPC的物件產生劇情
	local Owner = OwnerID() 
	local NPC = SearchRangeNPC( Owner , 400 )
	local OrgID = 100938	--凡瑞娜絲守衛

	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID then
			DelFromPartition( NPC[i] )
		end
	end
	LuaN_miyon_action02() --給NPC節慶標誌
	jiyi_Hideitem() --隱藏物件初始劇情：產生酒桶的劇情
end

function jiyi_Hideitem() --隱藏物件初始劇情：產生酒桶的劇情
	local Owner = OwnerID() ----隱藏物件
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID ) --讀取分流ID
	local poki = {} --有庫柏的酒桶3個
	local Barrico = {} --全部25個酒桶

	for i = 1 , 25, 1 do --產生25個酒桶
		Barrico[i] = CreateObjByFlag( 121335 , 781184 , i , 1 )-- 依照旗標編號產生酒桶，產生後放入Barrico table中
		WriteRoleValue( Barrico[i] , EM_RoleValue_Register2 , 0 ) --全部酒桶的值都寫成0
		SetModeEx( Barrico[i] , EM_SetModeType_Show , true ) --顯示
		SetModeEx( Barrico[i] , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( Barrico[i] , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( Barrico[i] , EM_SetModeType_Obstruct , false )--阻擋
		SetModeEx( Barrico[i] , EM_SetModeType_Mark , true )--標記
		SetModeEx( Barrico[i] , EM_SetModeType_Move , false )--移動
		SetModeEx( Barrico[i] , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( Barrico[i] , EM_SetModeType_HideName , false )--名稱
		SetModeEx( Barrico[i] , EM_SetModeType_ShowRoleHead , true )--頭像框
		SetModeEx( Barrico[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Barrico[i] , EM_SetModeType_Gravity , true )--重力
		SetModeEx( Barrico[i] , EM_SetModeType_Obstruct , true )--阻擋
		SetModeEx( Barrico[i] , EM_SetModeType_NotShowHPMP , true )--頭像框
		AddToPartition( Barrico[i] , RoomID )  --在讀取的分流(RoomID)中顯現
	end	

	for j = 1 , 3 do --選出3個有庫柏的酒桶
		local R = Rand( table.getn(Barrico) )+1 --從#Barrico中隨機選3個有庫柏的酒桶
		poki[j] = Barrico[R] --#poki放入#Barrico中隨機選出有庫柏的酒桶
		table.remove( Barrico , R ) --從#Barrico中移除有庫柏的酒桶
		WriteRoleValue( poki[j] , EM_RoleValue_Register2 , 1 ) --將有庫柏的酒桶記錄在REG2中
	end
end

function jiyi_Hideitem2() --計時、偵測距離中控器
	local Owner = OwnerID() --隱藏物件
	--local Target = TargetID()
	local Time = 0 
	local Player = ReadRoleValue( Owner , EM_RoleValue_Register10 ) --將玩家記錄在REG10中
	local Dis = GetDistance( Player , Owner ) --玩家和隱藏物件之間的距離

	while true do  --每秒偵測
		if CheckBuff( Player , 623346 ) == false then --檢查玩家是否有"給判斷技能"(623346)的BUFF>>玩家在活動中一定會有此BUFF
			break
		end	

		if CheckID( Player ) == false then --檢查玩家是否離線
			break
		else --當玩家在線上
			Dis = GetDistance( Player , Owner ) --檢查當下玩家和隱藏物件之間的距離
	   		if Dis < 100 then
	   			--進行中
	   		elseif Dis >= 90 and Dis < 150 then 
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_04]" , C_SYSTEM ) --系統顯示警告訊息：請回到啤酒區完成任務
	   		elseif Dis >=150 then
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_05]" , C_SYSTEM )--系統顯示警告訊息：距離啤酒區太遠，任務結束 	
	   			Sleep(30) --停3秒鐘
	   			CancelBuff( Player , 623346 ) --取消"給判斷技能"(623346)的BUFF，刪除活動用技能
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_10]" , C_SYSTEM ) --系統顯示訊息：請向NPC回覆任務	
	   			break --跳出迴圈
	   		end
           	
	   		if CheckFlag( Player , 546925 ) == true then --檢查玩家如果已經得到"本日已領過獎勵"的旗標
				break --有領過獎勵則跳出迴圈
			end

			if CountBodyItem( Player , 241785 ) == 3 then --檢查玩家身上如果已經有3隻庫伯
	   			 CancelBuff(  Player , 623346 ) --活動結束，取消"給判斷技能"(623346)的BUFF，刪除活動用技能
	   			 ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_10]" , C_SYSTEM ) --系統顯示訊息：請向NPC回覆任務
	   			 Sleep(10) --停一秒鐘
	   			 break --跳出迴圈
	   		end

	   		Time = Time + 1 --時間進行中，每秒+1	   			
 	   		if  Time == 60 then --時間到60秒時
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_06]" , C_SYSTEM )--顯示系統訊息：剩下一分鐘
	   		elseif Time == 90 then	
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_07]" , C_SYSTEM )--顯示系統訊息：剩下30秒
	   		elseif Time == 120 then
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_08]" , C_SYSTEM )--顯示系統訊息：時間到，活動結束
	   			Sleep(30) --停3秒鐘
	   			ScriptMessage( Owner , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_10]" , C_SYSTEM )----系統顯示訊息：請向NPC回覆任務
	   			CancelBuff( Player , 623346 ) --活動結束，取消"給判斷技能"(623346)的BUFF，刪除活動用技能
	   			break	--時間到，跳出迴圈
	   		end
		end
	Sleep(10) --執行while迴圈必須停1秒在繼續
	end
	sleep(10)
	jiyi_Reset() --只要跳出迴圈，就重置活動
	local npc = ReadRoleValue( Owner , EM_RoleValue_Register5 ) --記錄在隱藏物件上的任務NPC
	WriteRoleValue( npc , EM_RoleValue_Register1 , 0 ) --將REG1寫入0值在任務NPC上
	DelObj( Owner ) --刪除隱藏物件
end

function jiyi_Reset() --重置活動
	local own =OwnerID()--隱藏物件
	Lua_Barrico_Del_na() --刪除全部酒桶劇情
	sleep(10) --停一秒後 
	jiyi_Hideitem() --重新產生酒桶
	WriteRoleValue( own , EM_RoleValue_Register3 , 0 ) --將記在玩家身上用來紀錄玩家打破幾個酒桶的REG值清除寫回0
end
--=====================================
--			NPC對話劇情
--=====================================
function jiyi_2012beer_1() --掛在羅伯．凱恩身上的對話劇情
	local own = OwnerID()  --(玩家)
	local Tar = TargetID()  --凱恩(NPC)
	local star = ReadRoleValue( Tar , EM_RoleValue_Register1 )  --紀錄是否可以進行活動的REG值 0表示可以 1表示玩家挑戰中 	
	if CheckFlag( own , 546925 ) == true then --檢查玩家如果已經有領過獎勵旗標
		SetSpeakDetail( own , "[SC_2012BEER_121334_01]" )  --謝謝你幫我找偷喝酒的庫柏
	elseif CheckFlag( own , 547001 ) == true then --檢查玩家已經有完成活動旗標
		SetSpeakDetail( own , "[SC_2012BEER_121334_10]" )  --找到庫柏了嗎？
		AddSpeakOption( own , tar , "[SC_2012BEER_121334_06]" , "jiyi_2012beer_6" , 0 )  --我到啤酒區找過了
	else 
		if star == 1 then --REG1值==1表示有玩家正在挑戰中
			SetSpeakDetail( own , "[SC_2012BEER_121334_03]" ) --噓，等一等，有人正在幫我抓庫柏。
		else --REG1值==0表示可以跟任務NPC接任務
			SetSpeakDetail( own , "[SC_2012BEER_121334_02]" )  --你可不可以盡快幫我找到庫柏？
			AddSpeakOption( own , tar , "[SC_2012BEER_POKI_PLAYER_01]" , "jiyi_2012beer_3" , 0 )  --我該怎麼幫你呢？
			AddSpeakOption( own , tar , "[SC_2012BEER_POKI_PLAYER_02]" , "jiyi_2012beer_2" , 0 )  --抱歉，我還有其他事要做。
		end
	end
end

function jiyi_2012beer_2()
	local own = ownerID()
		SetSpeakDetail( own , "[SC_2012BEER_121334_04]" ) --「那我只好找其他人幫忙了」
end

function jiyi_2012beer_12()
	local own = ownerID()
		SetSpeakDetail( own , "[SC_2012BEER_121334_12]" ) --「準備好再來找我」
end

function jiyi_2012beer_3()
	local own = OwnerID() --玩家
	local tar = TargetID() --npc
	local star = ReadRoleValue( tar , EM_RoleValue_Register1 )
	if star == 0 then
		SetSpeakDetail( own , "[SC_2012BEER_121334_05]" )  --說明規則	
		AddSpeakOption( own , tar , "[SC_2012BEER_POKI_PLAYER_03]" , "jiyi_2012beer_5" , 0 )  --我準備好幫你抓庫柏了。
		AddSpeakOption( own , tar , "[SC_2012BEER_POKI_PLAYER_04]" , "jiyi_2012beer_2" , 0 )  --不，我還沒準備好幫你抓庫柏。
	end
end

--=====================================
--		將玩家傳送到活動區內進行遊戲
--=====================================
function jiyi_2012beer_5()  --進入遊戲
	local own = OwnerID() --玩家
	local tar = TargetID() --npc
--↓2014/09/17 新增下列檢查場上酒桶是否有短缺問題，如果活動開始前酒桶有缺少，會先重置酒桶
	local Barrel = 0
	local CheckNPC = SearchRangeNPC( tar , 300)
	for i = 0 , #CheckNPC do
		if ReadRoleValue(CheckNPC[i] , EM_RoleValue_OrgID) == 121335 then
			Barrel = Barrel+1
		end
	end
	if Barrel < 25 then
		jiyi_Reset()
	end
--↑
	local star = ReadRoleValue( tar , EM_RoleValue_Register1 ) --記在NPC身上的REG1值，用來判斷NPC是否可以讓其他玩家接任務
	local hideitem = jiyi_Hideitem_born(own) --產生隱藏物件同時將玩家記在REG10中	
--	local npc=ReadRoleValue( hideitem , EM_RoleValue_Register5 )
	local Lv = ReadRoleValue( own , EM_RoleValue_Lv ) --讀取玩家等級
	local SubLv = ReadRoleValue( own , EM_RoleValue_LV_SUB )
	WriteRoleValue( hideitem , EM_RoleValue_Register5 , tar ) --讓隱藏物件在REG5中記住任務NPC 
	local npc=ReadRoleValue( hideitem , EM_RoleValue_Register5 ) --2014/09/17 從168行移到172行
	if star==0 then --NPC開啟可進入遊戲
		DesignLog( own , 121334 , "Lv = "..Lv.." SubLv = "..SubLv )  --回傳活動參與值
		WriteRoleValue( tar , EM_RoleValue_Register1 , 1 ) --將NPC身上的REG1值寫成1，不讓其他玩家接任務
		SetFlag( own , 547001 , 1 ) --開啟玩家"本日已參加過活動"的旗標
		BeginPlot( hideitem , "jiyi_Hideitem2" , 0 ) --讓隱藏物件開啟中控器
		WriteRoleValue( tar , EM_RoleValue_Register4 , own ) --讓NPC記住正在玩遊戲的玩家
		SetPos( own , 3105.4 , 44.9 , 15.8 , 0 ) --將玩家傳送到活動場地
		AddBuff ( own , 623346 , 0 , 180 ) --給玩家活動技能
	end
	WriteRoleValue( tar , EM_RoleValue_Register1 , 1 ) --將NPC身上的REG1值寫成1，避免其他玩家也可以接任務	
	SetSpeakDetail( own , "[SC_2012BEER_121334_03]" )--噓，等一等，有人正在幫我抓庫柏。
end

function jiyi_Hideitem_born( Player ) --產生隱藏物件，同時讓隱藏物件記住玩家
	local own = OwnerID() --玩家
	local hideitem = CreateObjByFlag( 121336 , 781184 , 0 , 1 ) --按照旗標產生隱藏物件
	WriteRoleValue( hideitem , EM_RoleValue_Register10 , own ) --將玩家記在隱藏物件中
	return hideitem --回傳隱藏物件值
end
--=====================================
--			活動技能
--=====================================
function jiyi_2012beer_10()--打擊酒桶技能
	local own = OwnerID() --玩家
	local beer = TargetID() --酒桶121335
	local wine = ReadRoleValue( beer , EM_RoleValue_Register2 )--記錄酒桶是否有庫柏0=no,1=yes
	local broke = ReadRoleValue( own , EM_RoleValue_Register3 ) --記在玩家身上檢查玩家打破幾個酒桶
	WriteRoleValue( own , EM_RoleValue_Register3 , broke + 1 ) --將玩家打破酒桶數量寫入REG3值中，broke從0算起，所以要再+1
	if wine == 1 then --如果酒桶裡有庫柏
		Lua_na_poki_( beer ) --在酒桶位置產生庫柏
 		GiveBodyItem( own , 241785 , 1 ) --給玩家一隻庫柏物品
	end
	DelObj( beer ) --刪除酒桶
end

function jiyi_2012beer_4()--敲敲看技能
	local own = OwnerID() --玩家
	local tar = TargetID() --酒桶121335
	local ser = SearchRangeNPC ( tar , 45 ) --搜尋目標酒桶的周圍是否有其他酒桶
	local poki = {}	
	if ReadRoleValue( tar , EM_RoleValue_Register2 ) == 1 then --如果目標酒桶有庫柏
		ScriptMessage( own , own , 2 , "[SC_2012BEER_POKI_SYSTEM_01]" , C_SYSTEM )--系統告知"酒桶裡好像有東西"
	else	
		for i = 0 , table.getn(ser) do
			if ReadRoleValue( ser[i] , EM_RoleValue_Register2 ) == 1 then --如果周圍的酒桶有庫柏
				table.insert( poki , ser[i] ) --將周圍有庫伯的酒桶放入#poki中
			end
		Sleep(20) 
		PlayMotion( ser[i] , 18 ) --讓周圍酒桶表演18的動作：扭動
		end

		if table.getn( poki ) >=1 then --如果#poki中有庫柏的酒桶>=1時
			ScriptMessage( own , own , 2 , "[SC_2012BEER_POKI_SYSTEM_02]" , C_SYSTEM )--系統告知"這附近好像有庫柏"
		else
			ScriptMessage( own , own , 2 , "[SC_2012BEER_POKI_SYSTEM_03]" , C_SYSTEM )--系統告知"庫柏似乎不在這附近"
		end
	end	
end

function jiyi_2012beer_11()--掛在法術集合的使用檢查LUA，用以檢查技能目標是否為酒桶
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --讀取目標物品ID
	local beer = 121335 --酒桶ID
	if TOrgID == beer then --當目標物品ID=酒桶ID時	 
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )--系統告知"非有效目標"
		return false
	end
end
--=====================================
--			活動結束-獎勵劇情
--=====================================
function jiyi_2012beer_6()  --遊戲結束-給獎
	local own = OwnerID() --玩家
	local broke = ReadRoleValue( own , EM_RoleValue_Register3 ) --記在玩家身上檢查玩家打破幾個酒桶
	CancelBuff( own , 623346 ) --刪除玩家活動技能
	if CountBodyItem( own , 241785 ) >= 3 then --檢查玩家身上是否有>=3隻庫伯物品
		if broke <= 5 then --再判斷玩家打破的酒桶數量是否<=5	
			SetSpeakDetail( own , "[SC_2012BEER_121334_08]" ) --謝謝你幫我抓到庫柏，這3張啤酒節活動參加憑證送你當作謝禮。
			DelBodyItem( own , 241785 , 3 ) --將玩家身上的3個庫柏物品刪除
			GiveBodyItem( own , 205941 , 3 ) --給玩家3張啤酒節活動參加憑證
		elseif broke <= 10 then --再判斷玩家打破的酒桶數量是否<= 10
			SetSpeakDetail( own , "[SC_2012BEER_121334_09]" ) --謝謝你幫我抓到庫柏，這2張啤酒節活動參加憑證送你當作謝禮。
			DelBodyItem( own , 241785 , 3 ) --將玩家身上的3個庫柏物品刪除
 			GiveBodyItem( own , 205941 , 2 ) --給玩家2張啤酒節活動參加憑證
		elseif broke > 10 then --再判斷玩家打破的酒桶數量是否> 10
			SetSpeakDetail( own , "[SC_2012BEER_121334_07]" ) --還是謝謝你幫我找庫柏，這1張啤酒節活動參加憑證送你當作謝禮。
			DelBodyItem( own , 241785 , 3 ) --將玩家身上的3個庫柏物品刪除				
			GiveBodyItem( own , 205941 , 1 ) --給玩家1張啤酒節活動參加憑證
		end  
	elseif  CountBodyItem( own , 241785 ) > 0 and CountBodyItem( own , 241785 ) < 3 then --檢查玩家身上庫伯物品少於3個
		SetSpeakDetail( own , "[SC_2012BEER_121334_07]" )  --還是謝謝你幫我找庫柏，這1張啤酒節活動參加憑證送你當作謝禮。
		DelBodyItem( own , 241785 , 2 ) --將玩家身上的2個庫柏物品刪除
		DelBodyItem( own , 241785 , 1 ) --將玩家身上的1個庫柏物品刪除
		GiveBodyItem( own , 205941 , 1 ) --給玩家一張啤酒節活動參加憑證
	elseif  CountBodyItem( own , 241785 ) ==0 then --檢查玩家身上沒有庫伯物品
		SetSpeakDetail( own , "[SC_2012BEER_121334_11]" )  --還是謝謝你幫我找庫柏，這個送你當作謝禮。
		GiveBodyItem( own , 724509 , 1 ) --給玩家一個隨機藥水
	end
	SetFlag( own , 546925 , 1 ) -- 開啟玩家已經領取過獎勵旗標
	Lua_Festival_09_All(own)--給全勤獎
	WriteRoleValue( own , EM_RoleValue_Register3 , 0 ) --將記在玩家身上用來紀錄玩家打破幾個酒桶的REG3值清除寫回0
end

function Lua_Barrico_Del_na()  --刪除酒桶劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 121335 }
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID )
					end
				end
			end
		end
	end
end

function Lua_na_poki_(beer) --抓酒桶座標產生庫柏
	local RoomID = ReadRoleValue( beer , EM_RoleValue_RoomID )
	local Obj = Role:new( beer )  -- 取得酒桶座標 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local Poki = CreateObj( 107243 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --在酒桶位置產生庫柏
	SetModeEx( Poki , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( Poki , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
	SetModeEx( Poki , EM_SetModeType_Obstruct , false )--阻擋
	SetModeEx( Poki , EM_SetModeType_Mark , false )--標記
	SetModeEx( Poki , EM_SetModeType_Move , false )--移動
	SetModeEx( Poki , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Poki , EM_SetModeType_HideName , false )--名稱
	SetModeEx( Poki , EM_SetModeType_ShowRoleHead , false )--頭像框
	SetModeEx( Poki , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Poki , EM_SetModeType_Drag , false )--阻力
	SetModeEx( Poki , EM_SetModeType_Show , true )--顯示
	AddtoPartition( Poki , RoomID ) --在當下的分流中顯現庫柏
end

function Lua_na_poki_born()
	local Owner = OwnerID()
	Sleep(30)	
	PlayMotionex ( OwnerID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_END )
	Delobj( Owner )
end