--530061--生態研究隊隊員
--530062--哈爾雷姆知心好友
--530063--哈爾雷姆紅粉知己

function LuaS_110342()

	LoadQuestOption( OwnerID() )
	if ( CheckFlag( OwnerID()  , 540865 ) == false ) and ( ReadRoleValue(  OwnerID() , EM_RoleValue_SEX ) == 1 ) then --檢查是否有頭銜：「生態研究隊隊員」
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110342_1") , "LuaS_110342_Ask" , 0 )	--增加一個選項，生態研究隊招收成員
	end

	if (CheckAcceptQuest(OwnerID(),420371)==true )and(CountBodyItem( OwnerID(), 202748 )<1)then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SC_420371_0"),"LuaS_421371_1",0)
	end

end

function LuaS_110342_Ask()

	SetSpeakDetail( OwnerID() , GetString("ST_110342_1") )
	--歡迎來到哈爾雷姆的生態研究隊，如果你對生態有興趣的話，可以加入我們一起共同研究。而且，研究隊並不強迫一定要留在此地工作，或是一定要提出研究報告，完全是採志願制度，怎麼樣？有興趣加入我們嗎？
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110342_2") , "LuaS_110342_Join" , 0 )	--增加一個選項，加入生態研究隊

end

function LuaS_110342_Join()

	ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SO_110342_3") , C_SYSTEM )	--畫面中間訊息：取得頭銜：「生態研究隊隊員」
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SO_110342_3") , 0 )		--系統訊息：取得頭銜：「生態研究隊隊員」
	GiveBodyItem ( OwnerID() , 530061 , 1 )	-- 頭銜：「生態研究隊隊員」
	Say( TargetID() , GetString("ST_110342_2") )	-- 感謝你加入哈爾雷姆的生態研究隊！
	SetFlag( OwnerID()  , 540865 , 1 )
	CloseSpeak( OwnerID() );	--關閉對話視窗

end

function LuaS_421371_1()

	GiveBodyItem( OwnerID(), 202748, 1 )
	CloseSpeak( OwnerID() )	
end