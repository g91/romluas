--ZONE_TAPATAPA_GORGE	塔帕塔帕峽
--------------------------------426628七彩石--------------------------------------
function Lua_Z28_123100_speak()
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426628 ) == true and CheckFlag( player , 548366 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426628_01]","Lua_Z28_123100_speak2(1)" , 0 )	--"詢問七彩時要怎麼獲得"		
	else
		LoadQuestOption( player )
	end
end

function Lua_Z28_123100_speak2(num)
--	CloseSpeak( OwnerID() )
	if num == 1 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426628_02]" )	--七彩石必須到塔帕塔帕峽找，傳說只有勇者可以獲得，因為傳說七彩石會吸引野獸前來，如果不把野獸打倒是無法獲得七彩石的
		SetFlag( OwnerID() , 548366 , 1 )
--	elseif num == 2 then
--		SetSpeakDetail( OwnerID() , "[SC_Z28Q426639_06]" )	--最近忙著準備祭典，沒空理舞可兒，請你幫我跟舞可兒說謝謝。
--		Delbodyitem( OwnerID() , 243067 , 1 )
--		SetFlag( OwnerID() , 548423 , 1 )
	end					
end
----------------------------------426629夏蹦族的族長----------------------------------------
function Lua_Z28_426629_ChickobjBegin()	--七彩石觸碰劇情
	local player = OwnerID()
	local stone = TargetID()
	if DW_CheckQuestAccept("or",player,426629) == true and Countbodyitem( player , 242980 ) == 0 then	
		return true
	else		
		ScriptMessage( Player , Player , 1 , "[SC_Z28Q426629_01]" , 0 ) 	--這是一顆照光透出七彩顏色的美麗石頭
		return false
	end
end

function Lua_Z28_426629_ChickobjEnd()
	local player = OwnerID()	--玩家
	local stone = TargetID()
	GiveBodyItem( player , 242980 , 1 )
	CallPlot( player , "Lua_jiyi_Round_0415" , stone , 106877 , 3 , 80 , 0 )
	-- 參考物件、建立物件的ID、建立物件的數量、圓的半徑、建立物件是否延遲
	ScriptMessage( Player , Player , 1 , "[SC_Z28Q426629_02]" , 0 ) 	--你將七彩石拿起來，周圍竟出現覬覦七彩石的野獸...
end
----------------------------------426630勇者凱旋-------------------------------
-------接受任務後退場
function Lua_jiyi_Z28_426630_Accept()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623835
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----如果暫存值為0
 		 WriteRoleValue(NPC, EM_RoleValue_Register1,999)          
 	 	AddBuff( Player, CliBuff , 0 , 10 )
 	 	CallPlot(NPC, "Lua_jiyi_Z28_426630_Accept2" , NPC, Player, CliBuff)    ----接演戲function      
 	end 
end

function Lua_jiyi_Z28_426630_Accept2(NPC, Player, CliBuff)
	local New_NPC =  DW_CreateObjEX("obj", 123157 , NPC) ----生成演戲
 	local WalkFlag = 781360
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
	NPCSAY(New_NPC, "[SC_Z28Q426630_01]")	--事不宜遲，我們快去祭壇吧！
 	Sleep(10)
 	DW_MoveToFlag( New_NPC , WalkFlag , 0 , 0 , 1)
 	Sleep(10)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end
--DW_MoveToFlag( ObjID , FlagObjID , FlagID, Range , Enable  )
--ObjID 執行移動的對象
--FlagObjID 旗子的資料庫編號
--FlagID 旗子編號
--Range 亂數決定移動到定點的範圍
--Enable  0，不關閉movotoflag   1，關閉movetoflag
function Lua_jiyi_Z28_623835_Delete()
 	local Player = OwnerID()

 	if DW_CheckQuestAccept("or",Player, 426630) == false then
 		 CancelBuff(Player, 623835)
 	end
end

function Lua_jiyi_Z28_123158speak()	--123158瓦帕瓦帕對話劇情
	local player = ownerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426630 ) == true and CheckFlag( player , 548436 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426630_02]","Lua_jiyi_Z28_123158speak2" , 0 )	--我準備好參加儀式了
	else
		LoadQuestOption( player )
	end
end

function Lua_jiyi_Z28_123158speak2()
	CloseSpeak( OwnerID() )	
	NPCSay( TargetID() , "[SC_Z28Q426630_03]" )	--祖靈阿，夏蹦們，讓我們一起快樂地唱歌、跳舞，歡迎我們的新英雄
	PlayMotion(OwnerID() , 261 )
	PlayMotion( TargetID() , ruFUSION_ACTORSTATE_CAST_SP01 )
	SetFlag( OwnerID() , 548436 , 1 )
end
------------------------------426631生命之可貴-------------------------------
-------還任務後表演
function Lua_jiyi_Z28_426631_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623836
 	local Num = ReadRoleValue( NPC , EM_RoleValue_Register1 )

 	if Num == 0 then          ----如果暫存值為0
 		WriteRoleValue( NPC , EM_RoleValue_Register1 , 999 )          
 	 	AddBuff( Player , CliBuff , 0 , 10 )
 	 	CallPlot( NPC , "Lua_jiyi_Z28_426631_Complete2" , NPC , Player , CliBuff )    ----接演戲function      
 	end 
end

function Lua_jiyi_Z28_426631_Complete2(NPC, Player, CliBuff)
	local New_NPC =  DW_CreateObjEX("obj", 122875 , NPC) ----生成演戲
 	local WalkFlag = 781360
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local OrgID = SearchRangeNPC( New_NPC , 100 )
	local fegar = 123144	--菲格
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
	NPCSAY(New_NPC, "[SC_Z28Q426631_01]")	--祖靈保佑，讓勇者的朋友回歸生命吧。
 	Sleep(10)
 	DW_MoveToFlag( New_NPC , WalkFlag , 1 , 0 , 1)
	for i = 0 , table.getn(OrgID) do
		if ReadRoleValue( OrgID[i] , EM_RoleValue_OrgID ) == fegar then
			SetDefIdleMotion(New_NPC,	ruFUSION_MIME_ATTACK_1H )  
			CastSpell( New_NPC , OrgID[i] , 498298 ) 
	--		Addbuff(New_NPC , 623899 , 0 , 5 )
		end
	end
	NPCSay( New_NPC , "[SC_Z28Q426631_02]")	--太好了，他身上的生命之毒已經解除了
	sleep(20)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 )
end
--DW_MoveToFlag( ObjID , FlagObjID , FlagID, Range , Enable  )
--ObjID 執行移動的對象
--FlagObjID 旗子的資料庫編號
--FlagID 旗子編號
--Range 亂數決定移動到定點的範圍
--Enable  0，不關閉movotoflag   1，關閉movetoflag
--function Lua_jiyi_Z28_623836_Delete()
-- 	local Player = OwnerID()
-- 	if DW_CheckQuestAccept("or",Player, 426631) == false then
-- 		 CancelBuff(Player, 623836)
-- 	end
--end
---------------------------------426632詛咒、聖獸、守護者-----------------------------------
function Lua_jiyi_Z28_123155speak()	--刺麻斯對話劇情
	local player = OwnerID()
	LoadQuestOption( player )

	if CheckAcceptQuest( player , 426632 ) == true and CheckFlag( player , 548437 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426632_03]","Lua_jiyi_Z28_123155speak2(1)" , 0 )	--我聽說帕帕瓦加可以解除黑晶石的詛咒...
	elseif CheckAcceptQuest( player , 426633 ) == true and Countbodyitem( player , 209986 ) == 0 and Checkflag( player , 547381 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426633_08]","Lua_jiyi_Z28_123155speak2(2)" , 0 )	--我好像忘了拿黑晶石...(426633對話劇情)		
	else
		LoadQuestOption( player )
	end
end

function Lua_jiyi_Z28_123155speak2(Options)
	CloseSpeak( OwnerID() )
	if Options == 1 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426632_04]" )
		SetFlag( OwnerID() , 548437 , 1 )
	elseif Options == 2 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426633_09]" )	--你把黑晶石遺忘在這了	
		Givebodyitem( OwnerID() , 209986 , 1 )
	end		
end
-------------------------------------426633地的聖獸------------------------------------------
--function Lua_Z28_426633accept()
--	local Player = TargetID()
-- 	local NPC = OwnerID()
--	Addbuff( Player , 623292 , 0 , 60 )
--end

function Lua_Z28_426633complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	CancelBuff_NoEvent( Player , 623292 )  
--	Cancelbuff( Player , 623292 )
end

function Lua_Z28_108118StartLua()	--發狂的帕帕瓦加初始劇情(用於鎖血)
	local Papa = OwnerID()
	local MaxHP = ReadRoleValue( Papa , EM_RoleValue_MaxHP )		--總血量
	LockHP( Papa , ReadRoleValue( Papa , EM_RoleValue_MaxHP )*0.1 , "" )
end

function Lua_jiyi_Z28_119405speak()	--帕帕瓦加對話劇情
	local player = OwnerID()
	local PaPa = TargetID()
	local star = ReadRoleValue( PaPa , EM_RoleValue_Register1 )	--紀錄是否可以進行活動的REG值 0表示可以 1表示玩家挑戰中 
	LoadQuestOption( player )	
	if CheckAcceptQuest( player , 426633 ) == true and CheckFlag( player , 547381 ) == false then
		if Countbodyitem( player ,  209986 ) == 1 then
--			if star == 1 then	--REG1值==1表示有玩家正在挑戰中
--				SetSpeakDetail( player , "Please wait" ) --等一等
--			else
				SetSpeakDetail( player , "[SC_Z28Q426633_01]" )	--(描述帕帕瓦加似乎感應到你身上有黑晶石)		
				AddSpeakOption( player , player ,"[SC_Z28Q426633_02]","Lua_jiyi_Z28_119405speak2" , 0 )	--(你把黑晶石放到帕帕瓦加面前)
--			end
		else
			SetSpeakDetail( player , "[SC_Z28Q426633_03]" )	--(帕帕瓦加好奇地看著你...)
		end			
	else
		LoadQuestOption( player )
	end	
end		

function Lua_jiyi_Z28_119405speak2()	--帕帕瓦加進入戰鬥
	local player = OwnerID()
	local papa = TargetID()
	local star = ReadRoleValue( papa , EM_RoleValue_Register1 ) --記在NPC身上的REG1值，用來判斷NPC是否可以讓其他玩家接任務
	local hideitem = Lua_jiyi_Z28_boxborn(papa)	--產生隱藏物件同時將玩家記在REG10中
	local npc=ReadRoleValue( hideitem , EM_RoleValue_Register5 )
	CloseSpeak( player )	
	WriteRoleValue( hideitem , EM_RoleValue_Register5 , papa )	--讓隱藏物件在REG5中記住任務NPC 
--	if star==0 then	--NPC開啟可進入遊戲
		Delbodyitem( player , 209986 , 1 )
		Addbuff( Player , 623292 , 0 , 30 )	--給玩家"守護者的祝福"技能BUFF
		local new_papa = DW_CreateObjEX("obj", 108118 , papa )	--生成狂暴的帕帕瓦加
		hide(papa)
--		WriteRoleValue( papa , EM_RoleValue_Register1 , 1 )	--將NPC身上的REG1值寫成1，不讓其他玩家接任務
		BeginPlot( hideitem , "Lua_Z28_hideitem" , 0 )	--讓隱藏物件開啟中控器
		WriteRoleValue( papa , EM_RoleValue_Register4 , player ) --讓NPC記住正在玩遊戲的玩家
--	end
--	WriteRoleValue( papa , EM_RoleValue_Register1 , 1 ) --將NPC身上的REG1值寫成1，避免其他玩家也可以接任務	
--	SetSpeakDetail( player , "what a while" )
end

function Lua_jiyi_Z28_boxborn(papa)
	local player = OwnerID()
	local hidebox = Lua_DW_CreateObj( "obj" , 123169 , papa , 1 , 1 )
	WriteRoleValue( hidebox , EM_RoleValue_Register10 , player ) --將玩家記在隱藏物件中
	return hidebox --回傳隱藏物件值
end

function Lua_Z28_hideitem()
	local hideitem = OwnerID()
	local Time = 0 
	local Player = ReadRoleValue( hideitem , EM_RoleValue_Register10 )	--將玩家記錄在REG10中
	local Dis

	while true do 	--每秒偵測
		if CheckBuff( Player , 623292 ) == false then	--檢查玩家是否有"給判斷技能"(623346)的BUFF>>玩家在活動中一定會有此BUFF
			break
		end	

		if CheckID( Player ) == false then --檢查玩家是否離線
			break
		else	--當玩家在線上
			Dis = GetDistance( Player , hideitem )	--檢查當下玩家和隱藏物件之間的距離
	   		if Dis < 100 then
	   			--進行中
	   		elseif Dis >= 90 and Dis < 150 then 
	   			ScriptMessage( hideitem , Player , 2 , "[SC_Z28Q426633_04]" , C_SYSTEM ) 	--系統顯示警告訊息：即將超過帕帕瓦加的攻擊範圍
	   		elseif Dis >=150 then
	   			ScriptMessage( hideitem , Player , 2 , "[SC_Z28Q426633_05]" , C_SYSTEM )	--系統顯示警告訊息：距離太遠，無法成功安撫帕帕瓦加		
	   			break
	   		end
           	
	   		if CheckFlag( Player , 547381 ) == true then --檢查玩家如果已經得到"安撫帕帕瓦加"的旗標
	  			ScriptMessage( hideitem , Player , 2 , "[SC_Z28Q426633_10]" , C_SYSTEM ) 	--系統顯示訊息：回去告訴剌嘛斯，帕帕瓦加情緒已經平靜下來
		   		Sleep(10) --停一秒鐘
				break
			end
			Time = Time + 1 --時間進行中，每秒+1
	   		if Time == 20 then	
	   	--		ScriptMessage( hideitem , Player , 2 , "[SC_2012BEER_POKI_SYSTEM_07]" , C_SYSTEM )--顯示系統訊息：剩下10秒
	   		elseif Time == 30 then
	   			ScriptMessage( hideitem , Player , 2 , "[SC_Z28Q426633_06]" , C_SYSTEM )	--系統顯示訊息：祝福時間已經結束…
	  			break	--時間到，跳出迴圈
			end				
		end
	Sleep(10)	--執行while迴圈必須停1秒在繼續
	end
	CancelBuff( Player , 623292 )	--刪除活動用技能
	local npc = ReadRoleValue( hideitem , EM_RoleValue_Register5 ) --記錄在隱藏物件上的任務NPC
	local RoomID = ReadRoleValue( hideitem , EM_RoleValue_RoomID )
	Show( npc , RoomID )
	WriteRoleValue( npc , EM_RoleValue_Register1 , 0 ) --將REG1寫入0值在任務NPC上
	beginplot( npc , "Lua_Z28_hideitemReset" , 0 ) --只要跳出迴圈，就重置活動
	DelObj( hideitem ) --刪除隱藏物件
end	

function Lua_Z28_hideitemReset()
	local PaPa = OwnerID()	--帕帕瓦加
	local OrgID = SearchRangeNPC( PaPa , 200 )
	local New_Papa = 108118	--發怒的帕帕瓦加
	local RoomID = ReadRoleValue( PaPa , EM_RoleValue_RoomID )
	for i = 0 , table.getn(OrgID) do
		if ReadRoleValue( OrgID[i] , EM_RoleValue_OrgID ) == New_Papa then
			DelObj( OrgID[i] ) --刪除發怒的帕帕瓦加			
		end
	end	
--	sleep(10) --停一秒後
--	show( PaPa , RoomID )	
end

function Lua_Z28_497457check()	--心靈輔導技能檢查目標
	local player = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID )	--讀取目標物品ID
	local papa = 108118	--發狂的帕帕瓦加
	if TOrgID == papa then	 
		return true
	else 
		ScriptMessage( tar , player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )--系統告知"非有效目標"
		return false
	end
end

function Lua_Z28_623293use()	--心靈輔導技能使用
	local Player = OwnerID()
	local Papa = TargetID()	--發狂的帕帕瓦加
	local MaxHP = ReadRoleValue( Papa , EM_RoleValue_MaxHP )		--總血量
	local NowHP = ReadRoleValue( Papa , EM_RoleValue_HP )			--當前血量
	local HPPercent = ( NowHP / MaxHP )*100					--血量百分比
	if HPPercent <= 50  then
		setflag( Player , 547381 , 1 )
		ScriptMessage( player , player , 1 , "[SC_Z28Q426633_07]" , 0 )--系統告知"你成功安撫帕帕瓦加的情緒，牠現在平靜多了..."
		Beginplot( Papa , "Lua_Z28_623293use2" , 0 )
	else
		ScriptMessage( player , player , 1 , "[SC_Z28Q426633_11]" , 0 )--系統告知"[119405]仍處於過度狂暴的狀態，尚無法安撫牠的情緒…"						
	end
end

function Lua_Z28_623293use2()
	Sleep(10)	
	DelObj( OwnerID() )	--刪除發狂的帕帕瓦加
end	

function Lua_Z28_625115time()	--625115祝福時間到劇情
	local Player = OwnerID()
	if Checkflag( Player , 547381 ) == false then
		ScriptMessage( player , player , 1 , "[SC_Z28Q426633_06]" , 0 )	--系統告知"祝福時間已經結束…"
	end
end		
----------------------------------426635意志消沉的菲格----------------------------------------
function Lua_jiyi_Z28_123198speak()	--威爾．坎奇斯對話劇情
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426635 ) == true and CheckFlag( player , 548438 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426635_01]","Lua_jiyi_Z28_123143speak2" , 0 )	--菲格先生清醒了，但是…
	else
		LoadQuestOption( player )
	end
end

function Lua_jiyi_Z28_123143speak2()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z28Q426635_02]" )	--菲格先生 清醒了嗎？太好了。他的生命之毒應該整個解除了吧？
	SetFlag( OwnerID() , 548438 , 1 )
end
---------------------------------426636民俗療法------------------------------
--426636任務結束威爾走進來表演
function Lua_Z28_426636complete()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 625072
	local Flag = 781360
 	local Num = ReadRoleValue( NPC , EM_RoleValue_Register1 )

 	if Num == 0 then          ----如果暫存值為0
 		WriteRoleValue( NPC , EM_RoleValue_Register1 , 999 )          
 	 	AddBuff( Player , CliBuff , 0 , 10 )
 	 	CallPlot( NPC , "Lua_Z28_426636complete2" , NPC , Player , CliBuff , Flag)    ----接演戲function      
 	end 
end

function Lua_Z28_426636complete2(NPC, Player, CliBuff, Flag)
	local New_NPC =  Lua_DW_CreateObj("flag" , 123199 , Flag , 4 , 1 , 1 )     --產生演員
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
 	Sleep(10)
 	DW_MoveToFlag( New_NPC , Flag , 5 , 0 , 1)
--	NPCSAY(New_NPC, "test")
	sleep(20)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 )
end