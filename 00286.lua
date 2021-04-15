function LuaS_110262_0()
	--local n = 0
	--if CheckAcceptQuest( OwnerID() , 420285 ) then n = n + 1 end
	--if CheckAcceptQuest( OwnerID() , 420286 ) then n = n + 1 end
	--if CheckCompleteQuest( OwnerID() , 420285 ) then n = n + 1 end
	--if CheckCompleteQuest( OwnerID() , 420286 ) then n = 0 end

	if CheckAcceptQuest( OwnerID() , 420289 ) == true then
		if CountBodyItem( OwnerID() , 200691 ) > 0 then
			SetSpeakDetail( OwnerID(), GetString("ST_110262_0") );		--/*......我一生都夢想著發大財，但我最痛苦的時候竟然是我得到這些財富的時候，而我最輕鬆的時候卻是當我失去它們的時候......	--/*真是諷刺，不是嗎？	
		elseif CountBodyItem( OwnerID() , 200691 ) == 0 and CountBodyItem( OwnerID() , 200739 ) > 0 then
			SetSpeakDetail( OwnerID(), GetString("ST_110262_10") );		--/*怎麼樣？那個鬼魂走了嗎？
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_2") , "LuaS_110262_2", 0 ); 		--/*關於那個鬼魂我有一些事情想問你，卡里耳先生。
		end
	elseif CheckCompleteQuest( OwnerID() , 420289 ) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110262_0") );		--/*......我一生都夢想著發大財，但我最痛苦的時候竟然是我得到這些財富的時候，而我最輕鬆的時候卻是當我失去它們的時候......	--/*真是諷刺，不是嗎？	
	else
		LoadQuestOption( OwnerID() )
	end

	--if n > 0 and CountBodyItem( OwnerID() , 200909 ) == 0 then
	--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_1") , "LuaS_110262_1", 0 ); 		--/*鑰匙不見了
	--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_0") , "LuaS_110262_EXIT", 0 );		--/*結束對話
	--end

end

function LuaS_110262_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110262_1") );	--/*你真是不小心！幸好撿到鑰匙的人拿來還我了，快快快！拿了鑰匙後趕快幫我把事情處理完！
	GiveBodyItem( OwnerID() , 200909 , 1 )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_0") , "LuaS_110262_EXIT", 0 );	--/*結束對話

end	

function LuaS_110262_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_2")   );	--/*我是請你來趕走鬼魂的！我不是說過了嗎？無論用任何方法都可以，還有什麼好問的！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_3") , "LuaS_110262_3", 0 );	--/*是的，不過我和那個鬼魂接觸後，發現一些疑點，所以才來找卡里耳先生您。
end

function LuaS_110262_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_3") );	--/*是嗎？好吧！你問吧！不過我先說在前頭，我對那個鬼魂一無所知。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_4") , "LuaS_110262_4", 0 );	--/*我跟那個鬼魂接觸之後，根據那個鬼魂透露的訊息找到了一具屍體……
end	

function LuaS_110262_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_4") );	--/*真是恐怖啊！不過是不是把那個屍體安葬之後他就會安息？那我給你一筆錢，你趕快把這件事辦好。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_5") , "LuaS_110262_5", 0 );	--/*不過我在那具屍體身上發現屬於卡里耳先生您的東西。
end

function LuaS_110262_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_5")   );	--/*什麼？屍體身上有屬於我的東西？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_6") , "LuaS_110262_6", 0 );	--/*是的，就是這副假牙，經過巴拿夫的証明，這是他四個月前受安索醫生所託幫您作的。
end

function LuaS_110262_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_6") );	--/*（臉色蒼白）假……假牙……？卡里……我有裝這種假牙……？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_7") , "LuaS_110262_7", 0 );	--/*這就是我希望您能替我解決的疑點，為何像這種裝在身體上的東西，會出現在另外一人的屍體上。
end

function LuaS_110262_7()
	SetSpeakDetail( OwnerID(), GetString("ST_110262_7") );	--/*原來那個鬼魂……是卡里耳先生……？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_8") , "LuaS_110262_8", 0 );	--/*我希望你能解釋這句話的意思。
end

function LuaS_110262_8()

	SetSpeakDetail( OwnerID(), GetString("ST_110262_8") );	--/*……好吧！我想你會這樣追問，一定是夏麥爾隊長應該已經知道整件事情了，我就明明白白的把一切說出來吧！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_9") , "LuaS_110262_9", 0 );	--/*介不介意我把這些對話給記下來？

end	

function LuaS_110262_9()

	SetSpeakDetail( OwnerID(), GetString("ST_110262_9") );	--/*現在我只能束手就擒，應該沒辦法拒絕。
	--我想你應該也猜到了，我不是真正的卡里耳先生，不過我也沒害死卡里耳先生。

	--我本來是從克魯迪亞來的旅行者，途中剛好碰上卡里耳先生被強盜圍攻，我出手救了他；
	--當時碰面時我嚇了一大跳，因為我們兩個長的很像，他也很高興能遇到我，
	--他說自己平常不喜歡交朋友，看到我卻像看到熟悉的親人一般，於是便邀我同行。

	--但就在接近哈洛夫交易站的時候，他因為被強盜砍傷的傷口惡化而暴斃，
	--我當時突然心生惡念，想說卡里耳先生曾告訴我他在哈洛夫交易站沒有親人、朋友也少，
	--而現在卡里耳先生死亡的事又只有我知道，如果我能夠憑著和卡里耳先生相像的這張臉，
	--說不定能騙過所有人，得到卡里耳先生的財產；
	--所以我就草草將卡里耳先生埋葬，化裝成卡里耳先生的樣子回到哈洛夫。

	--沒想到剛搬進那棟房子就被鬼魂所侵擾，一直到現在我還未曾有一夜好眠……
	--不過全部說出來之後感覺輕鬆多了。

	--請你告訴夏麥爾隊長，我會在這裡等待我應得的處置的。
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110262_10") , "LuaS_110262_EXIT", 0 );	--/*謝謝你的合作。
	GiveBodyItem( OwnerID() , 200691 , 1 )

end

function LuaS_110262_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end
