function LuaI_110280()
	SetPosture( OwnerID(), 8 , ruFUSION_ACTORSTATE_SLEEP_BEGIN ); --要改成睡覺
end

function LuaS_110280_0()
	SetSpeakDetail( OwnerID(), GetString("ST_110280_0")   );
	--/*咯～嗯嗯～好棒的酒～嘿嘿～
	--  漂亮的妹妹～別不理人家嘛～嗯～
	if CheckFlag( OwnerID() , 540254 ) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110280_1") , "LuaS_110280_1", 0 ); 
		--/*卡夫卡莫伊的項鍊
	end
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110280_0") , "LuaS_110280_EXIT", 0 );
	--/*結束對話

end

function LuaS_110280_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110280_1")   );
	--/*呃～項鍊？我沒有……項鍊，呃～有的話就可以……跟……塔……塔尼洛夫換五……五十杯酒……呃～上次那個項……項鍊就能換……那麼多……呃～嘿嘿～酒……

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110280_2") , "LuaS_110280_EXIT", 0 );
	--/*看來布雷卡把那個項鏈拿去跟塔尼洛夫換酒喝了。
	SetFlag( OwnerID() , 540256 , 1 )
end

function LuaS_110280_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	Say( TargetID() , GetString("SAY_110196_0") ) --/*Zzz......
end