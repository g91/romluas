--------------------------------------------------以下為對話相關的劇情----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------馬飛
function LuaS_421108_0()

	SetSpeakDetail( OwnerID(), GetString( "SC_421108_0" )  );--/*你是誰阿？

	if CheckFlag(OwnerID(),541286) == false and CheckAcceptQuest( OwnerID(), 421108 ) == true then  
		AddSpeakOption( OwnerID(), TargetID( ), GetString( "SC_421108_1" ) , "LuaS_421108_1", 0 ) 
		--/*馬雷爾指揮官要我來問你，有沒有什麼需要幫忙的？

	end
	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421108_1()

	SetSpeakDetail( OwnerID(), GetString( "SC_421108_2" )   );
	--/*原來是馬雷爾派你來的，在我逃難的時候，忘記帶走我的釣竿，它是我們村子唯一獲取漁貨的方法。
	AddSpeakOption( OwnerID(), TargetID( ), GetString( "SC_421108_3" ) , "LuaS_421108_2", 0 ) 
	--/*我會幫你轉告馬雷爾指揮官的。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421108_2()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	SetFlag( OwnerID(), 541286, 1 ); --給予完成任務的旗標

end
--------------------------------------------------------------------------------------------------------------------------蕾蕾
function LuaS_421108_3()

	SetSpeakDetail( OwnerID(), GetString( "SC_421108_0" )  );--/*你是誰阿？

	if CheckFlag(OwnerID(),541287) == false and CheckAcceptQuest( OwnerID(), 421108 ) == true then  
		AddSpeakOption( OwnerID(), TargetID( ), GetString( "SC_421108_1" ) , "LuaS_421108_4", 0 ) 
		--/*馬雷爾指揮官要我來問你，有沒有什麼需要幫忙的？

	end
	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421108_4()

	SetSpeakDetail( OwnerID(), GetString( "SC_421108_4" )   );
	--/*原來是馬雷爾派你來的，在我逃難的時候，忘記帶走我的鍋子，它是烹煮食物的時候必要的工具。
	AddSpeakOption( OwnerID(), TargetID( ), GetString( "SC_421108_3" ) , "LuaS_421108_5", 0 ) 
	--/*我會幫你轉告馬雷爾指揮官的。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421108_5()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	SetFlag( OwnerID(), 541287, 1 ); --給予完成任務的旗標

end
--------------------------------------------------------------------------------------------------------------------------瓊斯
function LuaS_421108_6()

	SetSpeakDetail( OwnerID(), GetString( "SC_421108_0" )  );--/*你是誰阿？

	if CheckFlag(OwnerID(),541288) == false and CheckAcceptQuest( OwnerID(), 421108 ) == true then  
		AddSpeakOption( OwnerID(), TargetID( ), GetString( "SC_421108_1" ) , "LuaS_421108_7", 0 ) 
		--/*馬雷爾指揮官要我來問你，有沒有什麼需要幫忙的？

	end
	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421108_7()

	SetSpeakDetail( OwnerID(), GetString( "SC_421108_5" )   );
	--/*原來是馬雷爾派你來的，在我逃難的時候，忘記帶走我的珠寶盒，珠寶盒是我的生命。
	AddSpeakOption( OwnerID(), TargetID( ), GetString( "SC_421108_3" ) , "LuaS_421108_8", 0 ) 
	--/*我會幫你轉告馬雷爾指揮官的。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_421108_8()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	SetFlag( OwnerID(), 541288, 1 ); --給予完成任務的旗標

end