function LuaS_110725_0()

	LoadQuestOption( OwnerID() )

	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110725_5", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110725_1", 0 ) 

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110725_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110725_0", 0 ); 	--我想回到剛剛的對話
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaS_110725_EXIT",  0 );	--離開

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110725_5()

	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then
		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_5")  , C_SYSTEM )	--畫面中間訊息：您將回程地點登記在哈洛夫交易站！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_5") , 0 )	--您將回程地點登記在哈洛夫交易站！
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--畫面中間訊息：回程地點登記失敗！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--回程地點登記失敗！
	end

	CloseSpeak( OwnerID() );	--關閉對話視窗

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110725_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end
--------------------------------------------------------------------------------------------------------------------------