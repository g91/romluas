function Lua_valentine_ying_117234speak00() -- 掛在節慶活動NPC上   頭上的煙火標誌
	AddBuff(  TargetID(),  503217, 1, -1) 
	SetPlot( OwnerID() , "range" , "Lua_ying_npcrangetalk" , 50 ) --範圍劇情	-- 檢查玩家是否接近範圍50以內
end
-------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_npcrangetalk()
	local A = CheckAcceptQuest( OwnerID(), 423662 )
	local B = CheckAcceptQuest( OwnerID(), 423751 )
	local C = CheckAcceptQuest( OwnerID(), 423859 )
	if A == false and B== false and C == false and CheckFlag( OwnerID() , 544730) == false then
		tell( OwnerID() , TargetID() , "[SC_VALENTINE_2011EV1_02]" ) -- "該怎麼辦...？有人能幫助我嗎？"
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_117234speak() --NPC奧司蒙對話
--	Say(OwnerID(), "Owner") = 玩家
--	Say(TargetID(), "Target") = NPC

	local keyA = CheckFlag( OwnerID(), 544058) --任務keyA
	local keyB = CheckFlag( OwnerID(), 544850) --任務keyB
	local keyC = CheckFlag( OwnerID(), 544872) --任務keyC
	local over = CheckFlag( OwnerID(), 544730 ) -- 任務完成

	if over == true then 
		LoadQuestOption( OwnerID()) --讀取任務模板
	elseif keyA == true or keyB == true or keyC == true then
		LoadQuestOption( OwnerID()) --讀取任務模板
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_02]" , "Lua_valentine_ying_story", 0 ) --"花神節的由來"選項
	else
		SetSpeakDetail( OwnerID() , "[SC_VALENTINE_2011EV1_02]" ) -- "該怎麼辦...？有人能幫助我嗎？"
		AddSpeakOption(  OwnerID() , TargetID() , "[SC_VALENTINE_2011EV1_03]" ,  "Lua_valentine_ying_117234speak01",  0 ) -- "請問，有什麼事需要幫忙嗎？"選項	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_117234speak01() -- 選項 "請問，有什麼事需要幫忙嗎？"
	
	local Lv = ReadRoleValue ( OwnerID(), EM_RoleValue_LV ) --檢查玩家等級
	local X = Rand(15)+1 --Rand(0~14)+1

	if Lv >= 48 then
		if X <= 5 then
			SetFlag( OwnerID() , 544058 , 1 ) --keyA
		elseif X > 5 and X <= 10 then
			SetFlag( OwnerID() , 544850 , 1 ) --key
		else
			SetFlag( OwnerID() , 544872 , 1 ) --keyC
		end
		LoadQuestOption( OwnerID()) --讀取任務模板
		AddSpeakOption( OwnerID(), TargetID(), "[SC_112150_YU_02]" , "Lua_valentine_ying_story", 0 ) --"花神節的由來"選項
	else
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011EV1_01]"   ) -- "我很感謝你的好意，可惜你的能力似乎還沒有辦法幫上我的忙"
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_story() --選項 "花神節由來"

	SetSpeakDetail( OwnerID(), "[SC_112150_YU_05]"   ) --花神節由來內容
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_giveuitem01() --接受任務01後執行的Lua
--	Say(OwnerID(), "Owner") --= NPC
--	Say(TargetID(), "Target") --= 玩家
	local X = ReadRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 ) --讀取玩家身上的useitem，第一次起始值為0，第二次起始值為100
	local Y = Rand(5)+1 --Rand(0~4)+1 = 1~5	
	local Z =  X + Y --100+5=105

	if X % 100 == 0 then --(檢查起始值 / 100後是否有餘數，%為取餘數 ) 餘數等於0，表示當日未接取過
		WriteRoleValue( TargetID(), EM_LuaValueFlag_UseItem24 , Z ) --NPC給予(寫入)玩家的值
--		Say( TargetID() , Z )
	else --若 215/100=2...15 ，15 為餘數不等於 0...則不寫入useitem(表示已接取過，然後又放棄)
--		Say( TargetID(), X )
--		return
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_giveuitem02() --接受任務02後執行的Lua

	local X = ReadRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 ) --讀取玩家身上的useitem，第一次起始值為0，第二次起始值為100
	local Y = Rand(5)+6 --Rand(0~4)+6 = 6~10
	local Z =  X + Y --100+10=110

	if X % 100 == 0 then --(檢查起始值 / 100後是否有餘數，%為取餘數 ) 餘數等於0，表示當日未接取過
		WriteRoleValue( TargetID(), EM_LuaValueFlag_UseItem24 , Z ) --NPC給予(寫入)玩家的值
--		Say( TargetID() , Z )
	else --若 215/100=2...15 ，15 為餘數不等於 0...則不寫入useitem(表示已接取過，然後又放棄)
--		Say( TargetID(), X )
--		return
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_giveuitem03() --接受任務03後執行的Lua

	local X = ReadRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 ) --讀取玩家身上的useitem，第一次起始值為0，第二次起始值為100
	local Y =Rand(5)+11 --Rand(0~4)+11 = 11~15
	local Z =  X + Y --100+15=115

	if X % 100 == 0 then --(檢查起始值 / 100後是否有餘數，%為取餘數 ) 餘數等於0，表示當日未接取過
		WriteRoleValue( TargetID(), EM_LuaValueFlag_UseItem24 , Z ) --NPC給予(寫入)玩家的值
--		Say( TargetID() , Z )
	else --若 215/100=2...15 ，15 為餘數不等於 0...則不寫入useitem(表示已接取過，然後又放棄)
--		Say( TargetID(), X )
--		return
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_questover() --任務完成後執行的Lua，判斷玩家目前完成的任務次數

	SetFlag( TargetID() , 544058, 0 ) --刪除任務keyA
	SetFlag( TargetID() , 544850, 0 ) --刪除任務keyB
	SetFlag( TargetID() , 544872, 0 ) --刪除任務keyC
	SetFlag( TargetID() , 544730, 1 ) --任務完成後給予的每日重置重要物品
	local X = ReadRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 ) --讀取玩家身上的useitem( 第二次初為101~115 )
	local Y

	if CheckCompleteQuest( TargetID(),423750 ) == true then  -- 完成 任務3
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 , 0 )
	else
		X = X + 100 --201~215
		Y = Math.floor( X / 100 ) -- 201~215 / 100 = 2...1~2...15取整數為 2 (完成第二次)
		WriteRoleValue( TargetID() , EM_LuaValueFlag_UseItem24 , Y*100 ) -- 2*100 = 200(完成第二次後寫入)
		if Y == 3 then --完成任務第三次
			SetFlag ( TargetID() , 544848 , 1 ) --給予任務重要物品
		elseif Y == 7 then --完成任務第七次
			SetFlag ( TargetID() , 544849 , 1 ) --給予任務重要物品	
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_questover02() --任務423749完成後執行
	
	SetFlag ( TargetID() , 544848 , 0 )
end
---------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_questover03() --任務423750完成後執行

	SetFlag ( TargetID() , 544849 , 0 )
end
--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_searchbox() --搜尋小土堆
	local Count = SetSearchRangeInfo( OwnerID() , 600 ) --檢查600範圍內的所有物件(包含自己)的數量
	local NpcID = 117237
	local Uitem = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem24 ) --讀取玩家身上的UseItem，第二次為101~110
	Uitem = Uitem % 100 --第二次Uitem = 101~110 % 100  ( 101~110 / 100 後取餘數 = 1~10 )

	for  i = 1 , Count , 1 do
		local NpcGID = GetSearchResult() --回傳物件的GitemID。(依序回傳範圍內所搜尋到的物件)
		local NpcOID = ReadRoleValue( NpcGID , EM_RoleValue_OrgID ) --將物件的GitemID轉為OrgID。(依序將範圍內的GitemID轉為OrgID)
--		Say( OwnerID() , "NpcOID ="..NpcOID )
--		Say( OwnerID() , "NpcGID ="..NpcGID )
		if NpcID == NpcOID then
			local NpcPID = ReadRoleValue( NpcGID , EM_RoleValue_PID ) --讀取物件的PID值
			
			if NpcPID == Uitem then
				local X = GetDistance( OwnerID() , NpcGID ) --取得玩家與物件的距離

				if X <=150 then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_04]" , 0 ) --範圍150內有，則告訴玩家，"尋找到埋藏的土堆了！"
					SetModeEx( NpcGID , EM_SetModeType_Show , true ) --顯示土堆
					SetModeEx( NpcGID , EM_SetModeType_Mark , true ) --顯示標記
					BeginPlot(NpcGID , "Lua_ying_HideNpcGID", 0 ) --隱藏土堆
					return
				elseif X >150 and X <= 400 then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_05]" , 0 ) --範圍400內有，則告訴玩家，"你已漸漸靠近埋藏位置！"
					return
				elseif X >400 then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_06]" , 0 ) --大於範圍400(400~600間)，則告訴玩家，"你離埋藏位置還很遠呢！"
					return
				end
			end
		end
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_07]" , 0 ) --搜尋範圍內(600)無土堆，"附近似乎沒有任何可疑之處..."
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_HideNpcGID() --隱藏土堆

--	local X = 1
--	for i = 1 , 10 , 1 do
--		sleep(10)
--	--	Say(OwnerID() , "X ="..X )
--		X = X + 1
--	end
	sleep(200) --20秒
	local key = CheckFlag( OwnerID(), 544832) --檢查土堆上是否有key
	
	if key == true then
		SetFlag( OwnerID(), 544832, 0 ) --刪除土堆上的key
		Lua_ying_HideNpcGID()
	--	Say( OwnerID() ,"Answer =".."Ok" )
		return
	else
		SetModeEx( OwnerID() , EM_SetModeType_Show , false ) --未點擊土堆，土堆20秒後隱藏。
		SetModeEx( OwnerID() , EM_SetModeType_Mark , false ) --隱藏標記
	--	Say( OwnerID() ,"Answer =".."Bad" )
		return
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_bgcastbar() --點擊土堆

		SetPlot( OwnerID() , "Touch" , "Lua_ying_bgcastbar01" , 30 ) --觸碰土堆劇情
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_bgcastbar01() --讀取土堆施法條
--	Say(OwnerID(), "Owner") = 玩家
--	Say(TargetID(), "Target") = 土堆
	local Uitem = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem24 ) --讀取玩家身上的UseItem，第二次為101~115
	local NpcPID = ReadRoleValue( TargetID() , EM_RoleValue_PID ) --讀取物件的PID值
	local X = Uitem % 100 --115/100=1...15取餘數15
	local A = CountBodyItem( OwnerID() , 209064 )
	local B = CountBodyItem( OwnerID() , 209068 )
	local C = CountBodyItem( OwnerID() , 209069 )

	DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬

	if NpcPID == X then 
		if A > 0 or B > 0 or C > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_VALENTINE_2011EV1_09]" , 0 ) --"你已擁有該任務物品"
		--	Say(OwnerID() , "Answer =".."Already have" )
		else
			SetFlag( TargetID(), 544832, 1 ) --給予土堆key
			if BeginCastBarEvent( OwnerID() , TargetID() , "[SC_VALENTINE_2011EV1_08]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_bgcastbar02") ~= 1 then --挖掘土堆。(3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
			--	Say(OwnerID() , "Answer =".."Busy" )
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_bgcastbar02( Player , CheckStatus) --(執行者, 參數)
--	Say(OwnerID(), "Owner") =玩家 
--	Say(TargetID(), "Target") =土堆
	local NpcPID = ReadRoleValue( TargetID() , EM_RoleValue_PID ) --讀取物件的PID值
	
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
				if NpcPID <= 5 then
					GiveBodyItem( Player , 209064 , 1 ) --給予"鎖住的小木盒"
				elseif NpcPID > 5 and NpcPID <= 10 then
					GiveBodyItem( Player , 209068 , 1 ) --給予"銀白色項鍊"
				else
					GiveBodyItem( Player , 209069 , 1 ) --給予"陳舊的布偶"
				end
				EndCastBar( Player , CheckStatus ) --清除施法條
				SetModeEx( TargetID() , EM_SetModeType_Mark , false ) --隱藏標記
				SetModeEx( TargetID() , EM_SetModeType_Show , false ) --隱藏土堆
				SetFlag( TargetID(), 544832, 0 ) --刪除土堆上的key
			else
				EndCastBar( Player , CheckStatus ) --清除施法條
				SetFlag( TargetID(), 544832, 0 ) --刪除土堆上的key
				ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
			SetFlag( TargetID(), 544832, 0 ) --刪除土堆上的key
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_flower() --花叢的特效

	AddBuff( OwnerID() , 506324 , 0 , -1 )
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_valentine_ying_ItemUse() --掛在209070物品上的script，石碑介面
--	ClearBorder( OwnerID() ) --初始化石碑介面，開頭一定要執行
--	AddBorderPage( OwnerID(), "[SC_VALENTINE_2011EV1_10]" ) --信件內容
--	ShowBorder( OwnerID() , 0 , "[209070]", "ScriptBorder_Texture_Paper" ) --設定石碑介面
--end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_ItemUse() --掛在209070物品上的script，選單介面

	BeginPlot( OwnerID() , "Lua_valentine_ying_ItemUse01" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_valentine_ying_ItemUse01() -- 點擊物品開啟介面
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local Time = 0
	local DialogStatus = 0
	local Step = 0
	
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_VALENTINE_2011EV1_10]" )   --NPC類型選擇表單，"信件內容"

	if ( DialogSendOpen(OwnerID() ) == false )  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		CancelBuff( OwnerID(), 501570 );--
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 40 then  -- 20秒無動作，關閉對話視窗
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目
			if DialogStatus == -2  then -- 初始化
			
			elseif DialogStatus == -1  then--中斷
				DialogClose( OwnerID() )
				CancelBuff( OwnerID(), 501570 );--
				Step = 1
			end
		if Step == 1 then
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function LuaI_209067()  --祈求愛情禮盒，花神節獎勵

--	local itemset = {	20,""		,{203038 ,  5 },		--必爾汀代幣*5	203038 機率	20/100
--				50,""		,{200151 , 10},		--基礎療傷藥*10	200151 機率	30/100
--				100,""		,{200152 , 10}	}	--基礎靈感藥水*10	200152 機率	50/100

--	return BaseTressureProc(  itemset , 1 )   -- 1 = 需求背包空間，回傳itemset及需求背包空間
--end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_days(Day) --測試指令：寫入每日useitem
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem24  , Day*100 )
	local UseItem = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem24 )
	Say( OwnerID() , "UseItem = ".. UseItem )
end

function Lua_ying_delflag() --測試指令：用來重置當日已解過任務ㄧ的旗標

	SetFlag( OwnerID() , 544058 , 0 ) 
	SetFlag( OwnerID() , 544850 , 0 )
	SetFlag( OwnerID() , 544872 , 0 )
	SetFlag( OwnerID() , 544730 , 0 )
	SetFlag( OwnerID() , 544848 , 0 ) 
	SetFlag( OwnerID() , 544849 , 0 ) 
end

function lua_ying_flower_value()
	local UseItem = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem24 )
	Say( OwnerID() , "Now UseItem = ".. UseItem )
end