-----------------------------------------------------------------------------------------------------------
function LuaS_110184()

	LoadQuestOption( OwnerID() );  --載入任務模板

	if CheckAcceptQuest( OwnerID(), 420551) == true then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110184_NOSAY"),   	   "LuaS_110484_NoSay",     0 );	--增加一個選項，不可說
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110184_ITISNOSAY"), "LuaS_110484_ItIsNoSay",0 );	--增加一個選項，定位為不可說
	elseif CheckAcceptQuest( OwnerID(), 420552) ==true then
		AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110184_BOOK"),           "LuaS_110484_Book",       0 );	--增加一個選項，安卡洛斯之書
	end

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110484_NoSay()

	SetSpeakDetail( OwnerID(), GetString("ST_110184_1") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110184",      0 );	--增加一個選項，看看其他說明
--	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_EXIT"), "LuaS_110484_Exit",0 );		--增加一個選項，離開

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110484_ItIsNoSay()

	SetSpeakDetail( OwnerID(), GetString("ST_110184_2") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110184",      0 );	--增加一個選項，看看其他說明
--	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_EXIT"), "LuaS_110484_Exit",0 );		--增加一個選項，離開

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110484_Book()

	SetSpeakDetail( OwnerID(), GetString("ST_110184_3") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_LOOKOTHER"),     "LuaS_110184",      0 );	--增加一個選項，看看其他說明
--	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_EXIT"), "LuaS_110484_Exit",0 );		--增加一個選項，離開

end
-----------------------------------------------------------------------------------------------------------

function LuaS_110184_Exit()

	CloseSpeak( OwnerID() );	--關閉對話視窗

end

-----------------------------------------------------------------------------------------------------------
