function LuaS_110805_0()

	LoadQuestOption( OwnerID() )

--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110805_5", 0 ) 
--	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110805_1", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110944_2"), "LuaS_110944_2", 0 ) 
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
function LuaS_110805_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110561_1"));
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACKTALK") , "LuaS_110805_0", 0 ); 	--我想回到剛剛的對話
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_EXIT") , "LuaS_110805_EXIT",  0 );	--離開

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110805_5()

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
function LuaS_110805_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110805_Secret()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 10 , 0,-22350, -226, 1993, 61) --Zone10
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110805_2()

	CloseSpeak( OwnerID() );	--關閉對話視窗

	CastSpell( OwnerID() , OwnerID() , 491008 )
--	sleep( 5 )
	ChangeZone( OwnerID() , 6 , 0, 5525, 53, -3074, 52)	--凡瑞娜絲城行政區

end
--------------------------------------------------------------------------------------------------------------------------
Function Z6_TransporterIcon_00()--12.06.2012新增byWilliam
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint )
End
--------------------------------------------------------------------------------------------------------------------------