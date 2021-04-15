
function LuaS_110302_0()

	if CheckCompleteQuest( OwnerID() , 420324 ) == true and checkflag( OwnerID() , 540793 ) == false then
		SetSpeakDetail( OwnerID() , GetString("ST_110302_0") );
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_0")  , "LuaS_110302_1",0 );		--增加一個選項
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_1")  ,  "LuaS_110302_Exit", 0 );		--增加一個選項
	else
		LoadQuestOption( OwnerID() );  --載入任務模板
	end

end

function LuaS_110302_1()

	SetSpeakDetail( OwnerID() , GetString("ST_110302_1") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_2")  , "LuaS_110302_2",0 );		--增加一個選項
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_3")  ,  "LuaS_110302_Exit", 0 );		--增加一個選項

end

function LuaS_110302_2()

	SetSpeakDetail( OwnerID() , GetString("ST_110302_2") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_4")  , "LuaS_110302_3",0 );		--增加一個選項
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_3")  ,  "LuaS_110302_Exit", 0 );		--增加一個選項

end

function LuaS_110302_3()

	SetSpeakDetail( OwnerID() , GetString("ST_110302_3") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_5")  , "LuaS_110302_4",0 );		--增加一個選項
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_3")  ,  "LuaS_110302_Exit", 0 );		--增加一個選項

end

function LuaS_110302_4()

	SetSpeakDetail( OwnerID() , GetString("ST_110302_4") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_6")  , "LuaS_110302_5",0 );		--增加一個選項
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110302_3")  ,  "LuaS_110302_Exit", 0 );		--增加一個選項

end

function LuaS_110302_5()

	CloseSpeak( OwnerID() );	--關閉對話視窗
--	DelBodyItem ( OwnerID() , 200906 , 1 )		-- 刪除雪海貝殼項鍊
	SetFlag( OwnerID()  , 540793 , 1 )		-- 告知傑洛娜蓮要結婚

end

function LuaS_110302_Exit()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end