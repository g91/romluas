function LuaS_110591_0()

	LoadQuestOption( OwnerID() )

	--AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110591_5", 0 ) 
	--AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110591_1", 0 ) 

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110591_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110591_0", 0 ); 	--我想回到剛剛的對話
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaS_110591_EXIT",  0 );	--離開

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110591_5()

	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then

		if CheckAcceptQuest( OwnerID() , 420664 ) == true then	-- for 新手導引任務
			SetFlag( OwnerID() , 540866 , 1 )	-- 做完回程地點登記
		end

		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_1")  , C_SYSTEM )	--畫面中間訊息：您將回程地點登記在開墾聚落！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_1") , 0 )	--您將回程地點登記在開墾聚落！
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--畫面中間訊息：回程地點登記失敗！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--回程地點登記失敗！
	end

	CloseSpeak( OwnerID() );	--關閉對話視窗

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110591_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end
--------------------------------------------------------------------------------------------------------------------------