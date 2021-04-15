function LuaS_110944_0()

	LoadQuestOption( OwnerID() )

--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110944_5", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110944_1", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_4"), "LuaS_110727_6", 0 ) --我想傳送到凡瑞娜絲城行政區
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_3"), "LuaS_110944_3", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_6"), "LuaS_110944_6", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_7"), "LuaS_110944_7", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_8"), "LuaS_110944_8", 0 ) 

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

	if ReadRoleValue( OwnerID()  , EM_RoleValue_VOC ) == 0 then
		AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_9"), "LuaS_110805_Secret", 0 ) 
		AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_10"), "LuaS_110944_Secret", 0 ) 
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110944_0", 0 ); 	--我想回到剛剛的對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_5()

	local SHP = SaveHomePoint( OwnerID() );
	if (SHP == true) then
		CastSpell( OwnerID() , OwnerID() , 491008 )
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_10")  , C_SYSTEM )	--畫面中間訊息：您將回程地點登記在黑曜石要塞！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_10") , 0 )	--您將回程地點登記在黑曜石要塞！
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("ST_TRANSFER_FAIL")  , C_SYSTEM )	--畫面中間訊息：回程地點登記失敗！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_TRANSFER_FAIL") , 0 )	--回程地點登記失敗！
	end

	CloseSpeak( OwnerID() );	--關閉對話視窗

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_2()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0, -22822, -179, 2683, 44)	--黑曜騎士團後門商業廣場

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_3()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0,-23198, -260, 4492, 150)	--黑曜騎士團中央榮耀廣場

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_6()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0,-20792, -226, 6210, 150)	--黑曜騎士團前門戰爭廣場

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_7()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0,-23578, -261, 5843 , 150)	--黑曜騎士團西區工業廣場

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_8()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0,-21987, -179, 3650 , 330)	--黑曜騎士團東區傭兵廣場

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110944_Secret()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 10 , 0,-29260, 23, -12227, 125) --Zone11
end
