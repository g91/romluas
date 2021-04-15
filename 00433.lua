function LuaS_110592_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110592_0", 0 ); 	--我想回到剛剛的對話
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110592_5()

	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then
		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_2")  , C_SYSTEM )	--畫面中間訊息：您將回程地點登記在羅格鎮！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_2") , 0 )	--您將回程地點登記在羅格鎮！
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--畫面中間訊息：回程地點登記失敗！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--回程地點登記失敗！
	end

	CloseSpeak( OwnerID() );	--關閉對話視窗

end
--------------------------------------------------------------------------------------------------------------------------