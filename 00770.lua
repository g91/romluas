function LuaS_111339_0()
	----花神節活動 誓約玫瑰奪還 阻擋傳送
	if CheckBuff(OwnerID(), 621880) == TRUE then
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011_FN13]")
		return
	end
	----

	LoadQuestOption( OwnerID() )

--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110728_5", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110728_1", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_6"), "LuaS_110728_6", 0 ) --我想傳送到凡瑞娜絲城行政區
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_7"), "LuaS_110728_7", 0 ) --我想傳送到凡瑞娜絲城中央廣場區
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_8"), "LuaS_110728_8", 0 ) --我想傳送到凡瑞娜絲城城下東區
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_9"), "LuaS_110727_9", 0 ) --我想傳送到凡瑞娜絲城城下西區
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_10"), "LuaS_110728_10", 0 ) --我想傳送到凡瑞娜絲城正門出口
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_11"), "LuaS_110755_11", 0 ) --我想傳送到凡瑞娜絲城職業大廳

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111339_12()
	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 2 , 0,6922,59,-2496,50)	--賢者之眼
end
