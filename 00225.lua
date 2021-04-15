function LuaS_110186_0()
	LoadQuestOption( OwnerID() )
--	SetSpeakDetail( OwnerID(), GetString("ST_110186_0")   );
	--/*卡姆拉多伊......巴爾恩......德......德拉薩伊.......嗯......接下來這個字是......？
	--
	--咦？你是誰啊？找我有事嗎？
	--啊！對了！沒錯，語助詞，這個字應該是語助詞！得趕緊寫下來......
	if ( CheckAcceptQuest( OwnerID(), 420038 ) == true ) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_1") , "LuaS_110186_1", 0 ); --/*解譯石碑拓本1  
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_2") , "LuaS_110186_2", 0 ); --/*解譯石碑拓本2
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_3") , "LuaS_110186_3", 0 ); --/*解譯石碑拓本3
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_4") , "LuaS_110186_4", 0 ); --/*解譯石碑拓本4
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_1()

	if ( CountBodyItem( OwnerID(), 200029) > 0 ) then
		SetSpeakDetail( OwnerID(), GetString("ST_110186_A")   );
		--/*東西不就在哪嗎？在哪呀！你也沒多老怎麼就這樣糊塗了？
	else
		if( CountBodyItem( OwnerID(), 200020) > 0 ) then
			SetSpeakDetail( OwnerID(), GetString("ST_110186_1")   );
			--/*喔～海諾黎得的碑文～
			--我看看喔……之前翻過一次，不知道還記得多少……
			--嗯……
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_C") , "LuaS_110186_5", 0 );
			--/*繼續
		else
			SetSpeakDetail( OwnerID(), GetString("ST_110186_B")   );
			--/*你要我翻譯的東西在哪啊？我怎麼沒看見？
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*結束對話
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_2()

	if ( CountBodyItem( OwnerID(), 200031)  > 0 ) then
		SetSpeakDetail( OwnerID(), GetString("ST_110186_A")   );
		--/*東西不就在哪嗎？在哪呀！你也沒多老怎麼就這樣糊塗了？
	else
		if( CountBodyItem( OwnerID(), 200026) > 0 ) then
			SetSpeakDetail( OwnerID(), GetString("ST_110186_2")   );
			--/*喔～塔多珥的碑文～
			--我看看喔……之前翻過一次，不知道還記得多少……
			--嗯……
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_C") , "LuaS_110186_6", 0 );
			--/*繼續
		else
			SetSpeakDetail( OwnerID(), GetString("ST_110186_B")   );
			--/*你要我翻譯的東西在哪啊？我怎麼沒看見？
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*結束對話
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_3()

	if ( CountBodyItem( OwnerID(), 200032) > 0 ) then
		SetSpeakDetail( OwnerID(), GetString("ST_110186_A")   );
		--/*東西不就在哪嗎？在哪呀！你也沒多老怎麼就這樣糊塗了？
	else
		if( CountBodyItem( OwnerID(), 200027) > 0 ) then
			SetSpeakDetail( OwnerID(), GetString("ST_110186_3")   );
			--/*喔～奧果拉的碑文～
			--我看看喔……之前翻過一次，不知道還記得多少……
			--嗯……
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_C") , "LuaS_110186_7", 0 );
			--/*繼續
		else
			SetSpeakDetail( OwnerID(), GetString("ST_110186_B")   );
			--/*你要我翻譯的東西在哪啊？我怎麼沒看見？
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*結束對話
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_4()

	if ( CountBodyItem( OwnerID(), 200033) > 0 ) then
		SetSpeakDetail( OwnerID(), GetString("ST_110186_A")   );
		--/*東西不就在哪嗎？在哪呀！你也沒多老怎麼就這樣糊塗了？
	else
		if( CountBodyItem( OwnerID(), 200028) > 0 ) then
			SetSpeakDetail( OwnerID(), GetString("ST_110186_4")   );
			--/*喔～奎奔思提的碑文～
			--我看看喔……之前翻過一次，不知道還記得多少……
			--嗯……
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_C") , "LuaS_110186_8", 0 );
			--/*繼續
		else
			SetSpeakDetail( OwnerID(), GetString("ST_110186_B")   );
			--/*你要我翻譯的東西在哪啊？我怎麼沒看見？
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*結束對話
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_5()

	SetSpeakDetail( OwnerID(), GetString("ST_110186_5")   );
	--/*之後再想

	DelBodyItem( OwnerID(), 200020, 1 ) 
	GiveBodyItem( OwnerID(), 200029, 1 );
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*結束對話
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_6()

	SetSpeakDetail( OwnerID(), GetString("ST_110186_6")   );
	--/*之後再想

	DelBodyItem( OwnerID(), 200026, 1 ) 
	GiveBodyItem( OwnerID(), 200031, 1 );
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*結束對話
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_7()

	SetSpeakDetail( OwnerID(), GetString("ST_110186_7")   );
	--/*之後再想

	DelBodyItem( OwnerID(), 200027, 1 ) 
	GiveBodyItem( OwnerID(), 200032, 1 );
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*結束對話
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_8()

	SetSpeakDetail( OwnerID(), GetString("ST_110186_8")   );
	--/*之後再想

	DelBodyItem( OwnerID(), 200028, 1 ) 
	GiveBodyItem( OwnerID(), 200033, 1 );
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110186_0") , "LuaS_110186_EXIT", 0 ); --/*結束對話
	
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110186_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end