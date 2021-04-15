function LuaS_110172_0()

	if CheckAcceptQuest( OwnerID(), 420217 ) == true then  
		SetSpeakDetail( OwnerID(), GetString("ST_110172_0")   );
		--/*唉～讓亞米斯逃掉是我不對，可是也不想想，這麼有名的盜賊就讓我一個小兵運送，會出事也不令人意外吧！
		--
		--現在竟然把所有的過錯都推到我頭上～之前站了三年的大門，好不容易升到警備隊，結果現在又被罰回來了，真是倒楣！
		--
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110172_1") , "LuaS_110172_1", 0 ) --/*你有看到亞米斯往哪個方向逃嗎？
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110172_2")   );
		--/*冒險者？歡迎來到凡瑞娜絲...唉～進城去吧！別理我...唉～
	end
	
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110172_0") , "LuaS_110172_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110172_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110172_1")   );
	--/*我被打倒的一瞬間，好像看到他往塔格那的方向逃去...

--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110172_0") , "LuaS_110172_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110172_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end