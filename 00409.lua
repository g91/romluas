function LuaS_110561_0()
	----花神節活動 誓約玫瑰奪還 阻擋傳送
	if CheckBuff(OwnerID(), 621880) == TRUE then
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011_FN13]")
		return
	end
	----

	LoadQuestOption( OwnerID() )

--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110561_5", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110561_1", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_5"), "LuaS_110944_2", 0 ) --我想傳送到黑曜石要塞
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_7"), "LuaS_110561_7", 0 ) --我想傳送到凡瑞娜絲城中央廣場區
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_8"), "LuaS_110561_8", 0 ) --我想傳送到凡瑞娜絲城城下東區
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_9"), "LuaS_110561_9", 0 ) --我想傳送到凡瑞娜絲城城下西區
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_10"), "LuaS_110561_10", 0 ) --我想傳送到凡瑞娜絲城正門出口
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_11"), "LuaS_110755_11", 0 ) --我想傳送到凡瑞娜絲城職業大廳
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SC_111339_12"), "LuaS_111339_12", 0 ) --我想傳送到賢者之眼大廳

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110561_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110561_0", 0 ); 	--我想回到剛剛的對話
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaS_110561_EXIT",  0 );	--離開

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110561_5()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then
		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_3")  , C_SYSTEM )	--畫面中間訊息：您將回程地點登記在凡瑞娜絲城！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_3") , 0 )	--您將回程地點登記在凡瑞娜絲城！
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--畫面中間訊息：回程地點登記失敗！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--回程地點登記失敗！
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110561_6()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 2 , 0, 6372, 61, -3106, 50)	--凡瑞娜絲城行政區

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110561_7()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 2 , 0,4745, 115, -1968, 51)	--凡瑞娜絲城中央廣場區

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110561_8()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 2 , 0, 4472, 52, -35, 54)	--凡瑞娜絲城城下東區

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110561_9()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 2 , 0, 2908, 56, -798, 51)	--凡瑞娜絲城城下西區

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110561_10()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 2 , 0,2758,55,956,50)	--凡瑞娜絲城正門出口

end
--------------------------------------------------------------------------------------------------------------------------

function LuaS_110561_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end
--------------------------------------------------------------------------------------------------------------------------
--function LuaS_110561_0()

--	LoadQuestOption( OwnerID() )

--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110561_5", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110561_1", 0 ) 

	--AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_2"), "LuaS_110561_2", 0 ) 

--end
--------------------------------------------------------------------------------------------------------------------------
--function LuaS_110561_1()

--	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110561_0", 0 ); --/我想回到剛剛的對話
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaS_dindin_leave", 4 ); --/離開

--end
--------------------------------------------------------------------------------------------------------------------------
--function LuaS_110561_2()

--	SetSpeakDetail( OwnerID(), GetString("ST_110561_2"));
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_3"), "LuaS_110561_3", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110561_0", 0 ); --/我想回到剛剛的對話
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaS_110561_EXIT", 0 ); --/*離開

--end
-----------------------------------------------------------------------------------------------------------------------------
--function LuaS_110561_3()
--	CloseSpeak( OwnerID() );	--關閉對話視窗
--	ChangeZone( OwnerID(), 1, 0, -3807, 208, -8456, 67 )
--end
-----------------------------------------------------------------------------------------------------------------------------
--function LuaS_110561_EXIT()
--	CloseSpeak( OwnerID() );	--關閉對話視窗
--end

-----------------------------------------------------------------------------------------------------------------------------
--function LuaS_110561_5()
--	CloseSpeak( OwnerID() ); 
--	OpenShop()
--end
