--節慶活動 2009年4月春雨節
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--活動 帶兔子回家去
--NPC 朵莉．拉比
-----------------------------------------------------------------------------
function LuaN_112503_0() --NPC 朵莉．拉比  OK
	SetSpeakDetail(OwnerID(), "[SC_112503_01]" )--可以幫幫我找找迷了路的同伴嗎？ 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_112502_01]", "LuaN_112503_01", 0) --關於帶兔子回家去活動
	AddSpeakOption(OwnerID(), TargetID(), "[SC_112503_012]", "LuaN_112503_02", 0) --我要參加活動
	AddSpeakOption(OwnerID(), TargetID(), "[SC_112503_201]", "LuaN_112503_201", 0) --以5隻找回的拉比兔兌換獎勵
end
------------------------------------------------------------------------------
function LuaN_112503_01() --關於帶兔子回家活動  OK
	SetSpeakDetail(OwnerID(), "[SC_112503_111]" ) --每年到了這時候，我們拉比兔一族會帶著彩蛋藏在樹下玩耍。(略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112503_0", 0 ) --回到上一頁 
end
------------------------------------------------------------------------------
function LuaN_112503_02() --我要參加活動   OK  
	local today1= CheckFlag(OwnerID()  , 542433) -- 今日已取得寵物箱
	local rabbit =  CountBodyItem( OwnerID() , 204120 ) --找回的拉比兔
	local bag =  CountBodyItem( OwnerID() , 204119 )   --寵物箱

	if today1 == true then   --如果有取得旗標
		SetSpeakDetail(OwnerID(), "[SC_112503_END]" )--你今天已經取得過寵物箱囉～！
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112503_0", 0 ) --回到上一頁 
	else         --如果沒有旗標
		SetSpeakDetail(OwnerID(), "[SC_112503_GOGO]" )--你準備好了嗎？3、2、1，GOGO！！ 
		GiveBodyItem( OwnerID() , 204119  , 5 ) --給 寵物箱X5
		SetFlag( OwnerID()  , 542433 , 1 )   --給玩家今日已取得寵物箱Flag
	end
end
------------------------------------------------------------------------------
function LuaN_112503_201() --以5隻找回的拉比兔兌換獎勵 OK
	local today = CheckFlag( OwnerID() , 542491) --今天兌換過獎勵
	local rabbit = CountBodyItem( OwnerID() , 204120 ) --找回的拉比兔
	if today == true then
		SetSpeakDetail (OwnerID(), "[SC_DAN_111700_20]") --已經兌換過獎勵對話(身上有flag)
	else
		if rabbit >= 5 then --如果數量夠
			SetSpeakDetail(OwnerID(), "[SC_112503_GET]" )--感謝你～，期待你明天的參加喔～！ 
			GiveBodyItem( OwnerID() , 204218  , 3 )   -- 資源
			DelBodyItem( OwnerID() , 204120 , 5 ) --刪 找回的拉比兔X5
			SetFlag(OwnerID(), 542491 , 1) 
			AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112503_0", 0 ) --回到上一頁 
		else --如果數量不夠
			SetSpeakDetail(OwnerID(), "[SC_112503_NO]" )--你所持的物品數量不足喔！	
			AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaN_112503_0", 0 ) --回到上一頁 
		end
	end	
end
------------------------------------------------------------------------------