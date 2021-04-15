function LuaS_112627_0() --普羅．納爾森對話劇情

	LoadQuestOption( OwnerID() ) --載入任務NPC模板內容
	if CheckAcceptQuest( OwnerID() , 422206) == true and CountBodyItem(OwnerID() , 204328 ) < 1 then --檢查是否已經接了任務 422206 ，並且身上沒有 204328 乾淨的水
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112627_0]", "LuaS_112627_1",0 )	--/*要碗乾淨的水
	end

end

function LuaS_112627_1() --普羅．納爾森對話劇情
	SetSpeakDetail( OwnerID(), "[SC_112627_1]" ) --/*水嗎？我這裡剛好有一碗，不過......（[112627]往[112632]的方向看了一眼）好吧！這碗水你就拿去吧！
	GiveBodyItem( OwnerID() , 204328 , 1 ) --給OwnerID 204328 一個
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112627_0",0 ); --/*返回上一頁
end

function LuaS_112701_0() --潘．拉爾斯對話劇情

	LoadQuestOption( OwnerID() ) --載入任務NPC模板內容
	if CheckAcceptQuest( OwnerID() , 422206) == true and CountBodyItem(OwnerID() , 204328 ) < 1 then --檢查是否已經接了任務 422206 ，並且身上沒有 204328 乾淨的水
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112627_0]", "LuaS_112701_1",0 )	--/*要碗乾淨的水
	end

end

function LuaS_112701_1() --潘．拉爾斯對話劇情
	SetSpeakDetail( OwnerID(), "[SC_112701_0]" ) --/*乾淨的水？這附近有湖有河有沼澤，就是沒有可以給那個貴族喝的"乾淨的水" 。
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112701_0",0 ); --/*返回上一頁
end

function LuaS_112702_0() --卡茲克．里瑟對話劇情

	LoadQuestOption( OwnerID() ) --載入任務NPC模板內容
	if CheckAcceptQuest( OwnerID() , 422206) == true and CountBodyItem(OwnerID() , 204328 ) < 1 then --檢查是否已經接了任務 422206 ，並且身上沒有 204328 乾淨的水
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112627_0]", "LuaS_112702_1",0 )	--/*要碗乾淨的水
	end

end

function LuaS_112702_1() --卡茲克．里瑟對話劇情
	SetSpeakDetail( OwnerID(), "[SC_112702_0]" ) --/*呃....水？呃！等一等喔.....我馬上尿出來給你.....
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112702_0",0 ); --/*返回上一頁
end

function LuaQ_422207_AfterClick() --偷懶的士兵？點擊後觸發劇情
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422207_0]" , 0 ) --/*對話框顯示訊息：你發現了一具殘缺不全的士兵屍體......
	return true 	--回傳 true 以獲得物品
end

function LuaQ_422208_AfterClick() --找出兇手
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422208_0]" , 0 ) --/*對話框顯示訊息：你發現一些巨大的腳印，藉由觀察......
	return true	--回傳 true 以獲得物品
end

function LuaQ_422215_Complete() --422215 完成任務後執行的Script ,OwnerID() 是回任務的物件 ，TargetID() 是玩家
	DisableQuest( OwnerID() , true)--關閉 OwnerID() 的任務模式
	Hide( OwnerID() ) --讓 OwnerID() 消失
	local NPC = LuaFunc_CreateObjByObj( 112634 , OwnerID() ) --在 OwnerID() 的位置產生物件 112634 伍德．拜爾  
	MoveToFlagEnabled( NPC , false ) --關閉 NPC 受系統控制移動的功能，避免系統會在 NPC 離開出生點太遠的時候下令 NPC 跑回出生點
	WriteRoleValue( NPC , EM_RoleValue_IsWalk , 0 ) --設定 NPC 的移動是用跑的
	AdjustFaceDir( NPC , TargetID(), 0 ) --讓 NPC 面對 TargetID() ( 第三個參數為轉的角度，面向目標為 0 度 )
	sleep( 20 ) --等待 3.0 秒讓 NPC 完全出現
	PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_CRY ) --NPC 撥放哭的動作
	Say( NPC , "[SC_112634_0]" ) --/*NPC說話：嗚嗚嗚～我不是在作夢吧！太感謝你了，陌生人，我要馬上離開這個鬼地方，什麼補給還是子爵的事我都不管了，我只想回家去！
	sleep( 30 ) --等待 3.0 秒讓動作撥放完畢
	Move( NPC , 14300 , -83 , 25995 ) --命令 NPC 移動到固定點（會尋找路徑，未達到定點前仍可執行其他命令）
	sleep( 100 ) --等待 10.0 秒
	DelObj( NPC ) --刪除 NPC
	sleep(150) --等待 15.0 秒
	Show( OwnerID() , 0 ) --讓 OwnerID() 出現
	DisableQuest( OwnerID() , false) --開啟 OwnerID() 的任務模式
end