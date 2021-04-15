function LuaS_110165_0()

	SetSpeakDetail( OwnerID(),GetString("ST_110165_0")   );
	--/*不要跟我說話！我已經死了，就算我的身體沒死，但我的靈魂已經死去！唉～
	if CheckAcceptQuest( OwnerID(),420210 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110165_1" ), "LuaS_110165_1", 0 ) --/*誘導他說話，並想辦法套出他的話
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110165_0") , "LuaS_110165_EXIT", 0 ); --/*結束對話	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110165_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110165_1")   );
	--/*那天？是啊！那個夜晚，我靈魂破碎的那個夜晚！茵莎為了我而死去，而我卻進不去這該死的城市！連她的最後一面也見不到......
	--/*為什麼這個城牆那麼高聳？為什麼我和茵莎不能用愛來填補我們身分的差距？
	--/*你能回答我嗎？誰能回答我！
	if CountBodyItem( OwnerID() , 200034 ) == 0 then
		GiveBodyItem( OwnerID(),200034,1 )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110165_0") , "LuaS_110165_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110165_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end
------------------------------------------------------------------------------------------------------------------------------
function LuaS_110169_0()

	SetSpeakDetail( OwnerID(),GetString("ST_110169_0")   );
	--/*冒險者？你是為誰做事的？找我做什麼？
	if CheckAcceptQuest( OwnerID(),420210 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110169_1" ), "LuaS_110169_1", 0 ) --/*放鬆他的戒心，並想辦法套出他的話
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110169_0") , "LuaS_110169_EXIT", 0 ); --/*結束對話	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110169_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110169_1")   );
	--/*你說的沒錯！現在想想，賢者之眼遭襲的那天晚上哈金找我們這一派的人去協商，說不定就是個陰謀......
	--/*之前我的不表態反而好像那個事件與我有關......這樣可不妙了，我竟然沒想到這一步......
	--/*不過......說不定可以利用這個機會......哼哼......
	if CountBodyItem( OwnerID() , 200036 ) == 0 then
		GiveBodyItem( OwnerID(),200036,1 )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110169_0") , "LuaS_110169_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110169_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end
------------------------------------------------------------------------------------------------------------------------------
function LuaS_110072_0()

	SetSpeakDetail( OwnerID(),GetString("ST_110072_0")   );
	--/*你看起來似乎也是個旅行者，有什麼事嗎？
	if CheckAcceptQuest( OwnerID(),420210 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110072_1" ), "LuaS_110072_1", 0 ) --/*跟他套關係，並想辦法套出他的話
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110072_0") , "LuaS_110072_EXIT", 0 ); --/*結束對話	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110072_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110072_1")   );
	--/*哈哈哈！的確如此！這樣吧！我就讓你加入我的計畫。
	--/*賢者之眼遭襲擊這件事的確很令人詫異，但這是個機會，你沒看到警備隊大部分的人都去處理這件事了嗎？
	--/*我就是知道這個事情，才特地跑來凡瑞娜絲，想好好大撈一筆！
	--/*嘿嘿～反正這裏的人太有錢了，我們拿走一些他們應該也不會在意的！
	if CountBodyItem( OwnerID() , 200061 ) == 0 then
		GiveBodyItem( OwnerID(),200061,1 )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110072_0") , "LuaS_110072_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110072_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end