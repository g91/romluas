--節慶活動 2010年3月歡舞節
------------------------------------------------------------------------------
--歡舞節的來源
------------------------------------------------------------------------------
function LuaN_112311_0() --此Script寫在NPC夏妮上
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112311_011]" , "LuaN_112311_1", 0 ) --我想了解歡舞節的來源 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_CHANGE01]" , "lua_mika_dancefes_change01", 0 ) --我想兌換[206841]
end
----------------------------------------------------------------------------------------------
function LuaN_112311_1() --我想了解歡舞節的來源
	SetSpeakDetail( OwnerID(), "[SC_112311_02]" )--歡舞節的故事內容(略)  
end
-----------------------------------------------------------------------------
function lua_mika_dancefes_change01() --我想兌換[206841]
	SetSpeakDetail( OwnerID(), "[SC_DANCEFES_CHANGE11]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_OKAY]" , "lua_mika_dancefes_change11", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_112311_0", 0 ) --回到上一層
end

function lua_mika_dancefes_change11()  --傳送門符文換面具禮盒
	local item = CountBodyItem(OwnerID(), 202904 ); -- 檢查是否有 傳送門符文
	if item >=2 then  --數量未定
		CloseSpeak(OwnerID())
		GiveBodyItem(OwnerID(), 206841 , 1 )  --給歡舞面具禮盒1個(206841)
		DelBodyItem(OwnerID(), 202904 , 2 ) --扣傳送門符文2個 (202904)
	else 
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--你所持的物品數量不足。
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_dancefes_change01", 0 ) --回到上一層
	end		
end
-------------------------------------------------------------------------