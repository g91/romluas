function LuaS_110070_0()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_0")   );
	--/*嘿嘿嘿......我聞到你身上錢幣的味道了，我就是人稱狼獾沙杜的賞金獵人，你是要僱用我嗎？
	--  還是要跟我買消息？	
	if CheckFlag(OwnerID() , 540766 ) ~= true and CheckFlag( OwnerID() , 540254 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_1") , "LuaS_110070_1", 0 )
		--/*聽說你這裡有卡夫卡莫伊的皇冠
	end
	if CheckFlag(OwnerID() , 540766 ) == true and CheckAcceptQuest(OwnerID(),420305) == false then
		LoadQuestOption( OwnerID() )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_0") , "LuaS_110070_EXIT", 0 );
	--/*結束對話
end

function LuaS_110070_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_1")   );
	--/*皇冠？嗯……我想想……沒有，最近我沒有見過像皇冠這樣的東西。

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_2") , "LuaS_110070_2", 0 );
	--/*是嗎？抱歉，看來我得到的情報似乎是錯誤的。
end

function LuaS_110070_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_2")   );
	--/*等等！我好像又有一點印象，我好像的確有過一個皇冠。

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_3") , "LuaS_110070_3", 0 );
	--/*喔……那你到底有沒有得到過一個皇冠？
end

function LuaS_110070_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_3")   );
	--/*這個嗎……因為我以前在戰鬥中頭受過傷，所以有些事情會突然忘記又突然想起來，不過有一樣東西可以暫時幫助減輕這個症狀，或許你能給我一些這種東西，我就可以告訴你確切的消息。

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_4") , "LuaS_110070_4", 0 );
	--/*那種東西叫做錢吧？你需要多少才能讓這種[症狀]消除？
end

function LuaS_110070_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_4")   );
	--/*嘿嘿……跟聰明人打交道真是種享受，只要有3銀，我就會記起來這個消息了。
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 300 then 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_5") , "LuaS_110070_5", 0 );
		--/*好。
	end
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_6") , "LuaS_110070_EXIT", 0 );
	--/*我會考慮你的建議。
end

function LuaS_110070_5()
	if CheckFlag( OwnerID() , 540766 ) ~= true then
		AddRoleValue ( OwnerID() , EM_RoleValue_Money,-300 )
		Setflag( OwnerID() , 540766 , 1 )
	end
	LoadQuestOption( OwnerID() )
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_0") , "LuaS_110070_EXIT", 0 );
	--/*結束對話
end

function LuaS_110070_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗

end