-----------------------------------------------------------------------------------------------------------
--李奧
-----------------------------------------------------------------------------------------------------------

function LuaI_110483()

	SetPlot( OwnerID(),"range","LuaI_110483_Detail",75 );

end
-----------------------------------------------------------------------------------------------------------

function LuaI_110483_Detail()

	if CheckAcceptQuest( OwnerID(), 420700) == true then
		Tell ( OwnerID() ,  TargetID(),  GetString("ST_110483_4") );	--嘿，又有新手冒險者來支援，記得要去雷頓隊長那邊登記啊！
		--SAY( TargetID(),  GetString("ST_110483_4") );
	else
	
	end

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483()

	SetSpeakDetail( OwnerID(), GetString("ST_110483_0") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_YES"), "LuaS_110483_Detail_Yes",0 );		--增加一個選項，是
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_NO"),  "LuaS_110483_Detail_No", 0 );		--增加一個選項，否

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483_Detail_Yes()

	SetSpeakDetail( OwnerID(), GetString("ST_110483_1") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110483_LATON"), "LuaS_110483_Detail_Laton",0 );	--增加一個選項，雷頓隊長
end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483_Detail_No()

	SetSpeakDetail( OwnerID(), GetString("ST_110483_2") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110483_LATON"), "LuaS_110483_Detail_Laton",0 );	--增加一個選項，雷頓隊長

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483_Detail_Laton()

	SetSpeakDetail( OwnerID(), GetString("ST_110483_3") );

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483_Exit()

	CloseSpeak( OwnerID() );	--關閉對話視窗

end

-----------------------------------------------------------------------------------------------------------
