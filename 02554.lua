------合成液的取得-鍋爐特效-----------------------------------------------------------------------------------------------
function Lua_ying_Q425243_addbuff()
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, true )--顯示頭像框
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )--不顯示血條
	AddBuff( OwnerID(), 622314 , 0 , -1 )
end
------消滅改造獸、強化改造戰士、精銳改造戰士PE-接取------------------------------------------------------------------
function Lua_ying_Q425259_acceptQ()

	local Player = OwnerID()
	local Key = { 546248 , 546249 , 546250 } --消滅改造獸、強化改造戰士、精銳改造戰士
	local Step = 0

	if CheckCompleteQuest( Player , 425244 ) == true then--完成
		for i = 1 , #key , 1 do
			if CheckFlag( Player , Key[i] ) == false then
				Step = Step + 1
			else
				break
			end
			if Step == 3 then
				local Random = DW_Rand(100)
				if Random >= 1 and Random <= 60 then
					SetFlag( Player , 546248 , 1 )
				elseif Random > 60 and Random <= 90 then
					SetFlag( Player , 546249 , 1 )
				else
					SetFlag( Player , 546250 , 1 )
				end
			end
		end
	end
	LoadQuestOption( Player )
end
------完成任務執行-刪除消滅改造獸、強化改造戰士、精銳改造戰士PE-KEY---------------------------------------------------
function Lua_ying_Q425259_delkey()
	local x=0
	local Player = TargetID()
	local Key = { 546248 , 546249 , 546250 } --消滅改造獸、強化改造戰士、精銳改造戰士
	local Score = { 80 , 200 , 280 } --PE積分
	for i = 1 , #Key , 1 do
		if CheckFlag( Player , Key[i] ) == true then
			x=Score[i]
			Lua_ZonePE_3th_GetScore( x )
			SetFlag( Player , Key[i] , 0 ) --刪除Key
		end
	end
end
------隱藏於瀑布下-擦拭螢光球_法術集合_使用檢查LUA-------------------------------------------------------------------------------------------
function Lua_ying_Q425245_motion()

	local Player = OwnerID()
	local Type = GameObjInfo_Int( 850030 , "ColdownType" ) -- 抓這個法術的冷卻類別(法術集合-施法冷卻次分類)

	if CountBodyItem( Player , 241205 ) < 10 then --水靈草<10
		if ReadRoleValue( Player , EM_RoleValue_Coldown_Item+Type ) == 0 then
			CallPlot( Player , "PlayMotion" , Player , ruFUSION_ACTORSTATE_CRAFTING_BEGIN ) --採集動作
			return true
		end
		return false
	else
		ScriptMessage( Player , Player , 1 , "[SC_425245_1]" , 0 ) --"你已持有足夠的水靈草！"
		return false
	end
end
------隱藏於瀑布下-執行劇情_找水靈草_基本法術--------------------------------------------------------------------------------------------------------
function Lua_ying_Q425245_find()

	local Player = OwnerID()

	if KS_GetFlagDistance( Player , 781127,  0 ) <= 120 then --與旗標距離(物件, 旗標ID, 旗標位置)
		local X = GetMoveFlagValue( 781127 , 0 , EM_RoleValue_X )+math.random( -70 , 70 )
		local Y = GetMoveFlagValue( 781127 , 0 , EM_RoleValue_Y )
		local Z = GetMoveFlagValue( 781127 , 0 , EM_RoleValue_Z )+math.random( -70 , 70 )
		local Flower

		Flower = CreateObj( 120288 , X , Y , Z , 0 , 1 ) --水靈草
		SetModeEx( Flower , EM_SetModeType_SearchenemyIgnore , false ) --不被搜尋
		SetModeEx( Flower , EM_SetModeType_Obstruct , false ) --不阻擋
		SetModeEx( Flower , EM_SetModeType_Move , false ) --不移動
		SetModeEx( Flower , EM_SetModeType_HideName , false ) --不顯示名稱
		SetModeEx( Flower , EM_SetModeType_ShowRoleHead , false ) --不顯示頭像框
		AddToPartition( Flower , 0 ) --使建立出來的水靈草出現
		ScriptMessage( Player , Player , 1 , "[SC_425245_2]" , 0 ) --"螢光珠的光芒，照耀出了水靈草…"
		WriteRoleValue( Flower , EM_RoleValue_LiveTime , 7 ) --生存時間7秒
	else
		ScriptMessage( Player , Player , 1 , "[SC_425245_3]" , 0 ) --"你在此處沒有尋找到水靈草…"
	end
end
-------隱藏於瀑布下-水靈草觸碰劇情------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425245_flower()

	local Flower = OwnerID()
	SetPlot( Flower , "Touch" , "Lua_ying_Q425245_castbar" , 30 )
end
-------隱藏於瀑布下-讀取水靈草施法條------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425245_castbar()

	local Player = OwnerID()
	local Flower = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬	
	if CheckAcceptQuest( Player , 425245 ) == true or CheckAcceptQuest( Player , 425202 ) == true or CheckAcceptQuest( Player , 425262 ) == true then
		if CountBodyItem( Player , 241205 ) < 10 then --水靈草<10
			if Mount == true then --不在後座
				if BeginCastBarEvent( Player , Flower , "[SC_425245_4]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_Q425245_castbar01") ~= 1 then --摘取水靈草。(3秒/起始動作/結束動作/0=移動中斷/結束時執行的函式)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --目標忙碌中
				end
			else --在後座
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_425245_1]" , 0 ) --"你已持有足夠的水靈草！"
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_425245_5]" , 0 ) --美麗的水靈草吸引了你的目光…
	end
end
---------(執行者 , 參數)--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425245_castbar01( Player , CheckStatus )

	local Flower = TargetID()

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --檢查背包欄位
				GiveBodyItem( Player , 241205 , 1 ) --給予"水靈草"
				EndCastBar( Player , CheckStatus ) --清除施法條
				DelObj( Flower )
			else
				EndCastBar( Player , CheckStatus ) --清除施法條
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end	
		else --失敗
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end
--------NPC對話選項------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425246_npc()

	local Player = OwnerID()
	local NPC = TargetID()	
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local NPCID = { 120285 , 120286 , 120287 } --艾倫、艾布納、艾文
	local Key = { 546143 , 546144 , 546145 }
	local Step = 0
	
	if CheckAcceptQuest( Player , 425246 ) == true or CheckAcceptQuest( Player , 425263 ) == true or CheckAcceptQuest( Player , 425203 ) == true then
		for i = 1 , #NPCID , 1 do	
			if OrgID == NPCID[i] then
				if CheckFlag( Player , Key[i] ) == false then
					LoadQuestOption( Player )
					AddSpeakOption( Player , NPC , "[SC_425246_1]" , "Lua_ying_Q425246_npc1" , 0 ) --我帶了水靈草藥過來治療你的傷
				else
					SetSpeakDetail( Player , "[SC_425246_2]" ) --塗上草藥後傷口好像不再那麼痛了…XXX大人，真不好意思，還麻煩你跑這麼一趟過來，回頭請你也向120280轉達我的謝意，謝謝你...
				end
				return
			else
				Step = Step + 1
			end
			if Step == 3 then
				LoadQuestOption( Player )
			end
		end
	else
		LoadQuestOption( Player )
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425246_npc1()

	local Player = OwnerID()
	local NPC = TargetID()	
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local NPCID = { 120285 , 120286 , 120287 } --艾倫、艾布納、艾文
	local Key = { 546143 , 546144 , 546145 }

	if CheckAcceptQuest( Player , 425246 ) == true or CheckAcceptQuest( Player , 425263 ) == true or CheckAcceptQuest( Player , 425203 ) == true then
		for i = 1 , #NPCID , 1 do
			if OrgID == NPCID[i] then
				if CountBodyItem( Player , 241206 ) >= 1 then --水靈草藥
					SetSpeakDetail( Player , "[SC_425246_2]" ) --塗上草藥後傷口好像不再那麼痛了…XXX大人，真不好意思，還麻煩你跑這麼一趟過來，回頭請你也向120280轉達我的謝意，謝謝你...
					SetFlag( Player , Key[i] , 1 )
					DelBodyItem( Player , 241206 , 1 )
				else
					SetSpeakDetail( Player , "[SC_425246_3]" ) --241206呢？你該不會弄丟了吧？
				end
				return
			end
		end
	else
		SetSpeakDetail( Player , "[SC_425246_5]" ) --XXX大人，請問有什麼事嗎？
	end
end
----------NPC薇絲雅恩(120280)_對話劇情------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425246_120280npc()

	local Player = OwnerID()
	local NPC = TargetID()

	LoadQuestOption( Player )	
	if CheckAcceptQuest( Player , 425246 ) == true or CheckAcceptQuest( Player , 425263 ) == true or CheckAcceptQuest( Player , 425203 ) == true then
		if CountBodyItem( Player , 241206 ) == 0 then --水靈草藥
			AddSpeakOption( Player , NPC , "[SC_425246_4]" , "Lua_ying_Q425246_120280npc1" , 0 ) --我弄丟了身上的[241206]…
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425246_120280npc1()

	local Player = OwnerID()

	if CheckAcceptQuest( Player , 425246 ) == true or CheckAcceptQuest( Player , 425263 ) == true or CheckAcceptQuest( Player , 425203 ) == true then
		SetSpeakDetail( Player , "[SC_425246_6]" ) --小心別再弄丟囉…
		GiveBodyItem( Player , 241206 , 3 )
	else
		SetSpeakDetail( Player , "[SC_425246_7]" ) --你為什麼需要拿取241206呢？
	end
end
------241188物品使用檢查_偷偷加點料------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425243_check()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local NPCID = { 120289 , 120270 , 120269 }
	local Key = { 546230 , 546269 , 546270 } --合成 萃取 改造
	local Step = 0

	DW_CancelTypeBuff( 68 , Player ) --騎乘坐騎時，點擊下馬

	for  i = 1 , #NPCID , 1 do
		if OrgID == NPCID[i] then
			if CheckFlag( Player , Key[i] ) == false then
				if GetDistance( Player , NPC ) <= 50 then --距離50內
					return true
				else
					ScriptMessage( Player , Player , 1 , "[SC_424086_8]" , 0 ) --你的距離太遠，請再靠近一點！
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[SC_425243_1]" , 0 ) --避免意外發生，還是不要再倒了吧？
				return false	
			end
		else
			Step = Step + 1
		end
		if Step == 3 then
			ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
			return false
		end
	end
end
------使用後執行241188_偷偷加點料-----------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q425243_use()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local NPCID = { 120289 , 120270 , 120269 }
	local Key = { 546230 , 546269 , 546270 } --合成 萃取 改造
	
	for i = 1 , #NPCID , 1 do
		if OrgID == NPCID[i] then
			SetFlag( Player , Key[i] , 1 )
			break
		end
	end
end