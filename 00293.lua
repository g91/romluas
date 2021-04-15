function LuaS_110288_0()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_0")   );
	--/*歡迎光臨，請問需要什麼？
	if CheckAcceptQuest(OwnerID(),420306) == true then
		if CheckFlag(OwnerID(),540257) then
			LoadQuestOption( OwnerID() )
		else
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_1") , "LuaS_110288_1", 0 ); 
			--/*哈德利送你的耳環
		end
	end
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_0") , "LuaS_110288_EXIT", 0 );
	--/*結束對話

end

function LuaS_110288_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_1")   );
	--/*那對耳環啊～嗯！的確在我這裡。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_2") , "LuaS_110288_2", 0 ); 
	--/*我希望能夠買下它，價格不會讓妳失望。
end

function LuaS_110288_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_2")   );
	--/*不，雖然你大老遠跑來很辛苦，但這對耳環對我是不能用金錢衡量價值的。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_3") , "LuaS_110288_3", 0 ); 
	--/*哈德利說我可以向妳買……
end

function LuaS_110288_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_3")   );
	--/*噢！貼心的哈德利，他認為這樣可以幫我帶來一小筆財富；不過對我來說，有他送我這對耳環的心意我就滿足了，這對耳環象徵他對我的愛，難道你認為愛是可以買賣的嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_4") , "LuaS_110288_4", 0 ); 
	--/*或許哈德利不會在意，是他告訴我可以向妳購買這個耳環……
end

function LuaS_110288_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_4")   );
	--/*這就是男人和女人不同的地方囉！你應該了解吧？男人總是不在乎某些東西，但只有女人才知道這些東西是多麼寶貴。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_5") , "LuaS_110288_5", 0 ); 
	--/*我受人之託來買這對耳環，而這個交易我從芭芭拉夫人那裡開始，已經輾轉跑了好幾個地方，希望妳能體諒……
end

function LuaS_110288_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_5")   );
	--/*等一下，芭芭拉夫人？你不是從哈德利那裡得知消息的嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_6") , "LuaS_110288_6", 0 ); 
	--/*是啊！不過我是先去找芭芭拉夫人，才知道她把耳環送給哈德利，然後我才去找哈德利的。
end

function LuaS_110288_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_6")   );
	--/*這對耳環是芭芭拉夫人送給哈德利的！？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_7") , "LuaS_110288_7", 0 ); 
	--/*嗯，有什麼問題嗎？
end

function LuaS_110288_7()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_7")   );
	--/*你說謊！他說這是他存了很久的錢買的，他沒說這是另一個女人送他的東西！！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_8") , "LuaS_110288_8", 0 ); 
	--/*女士，這是個侮辱！我說的話妳大可向芭芭拉夫人求證。
end

function LuaS_110288_8()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_8")   );
	--/*抱歉……我有些激動，當初看到他有這麼昂貴的耳環我就覺得奇怪，後來竟被它的花言巧語給騙了……原來是那個蕩婦送給他的！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_9") , "LuaS_110288_9", 0 ); 
	--/*妳嚇到我了；或許他們之間只是認識……
end

function LuaS_110288_9()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_9")   );
	--/*只是認識？喔！你當然不知道，能收到芭芭拉禮物的只有兩種人，一種是她的情人，另一種是將成為她情人的人！你認為哈德利是哪一種？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_10") , "LuaS_110288_10", 0 ); 
	--/*或許妳應該再信任哈德利一次，就像之前那麼信任他一般。
end

function LuaS_110288_10()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_10")   );
	--/*信任？他騙了我耶！他拿那個女人的東西來騙取我的信任！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_11") , "LuaS_110288_11", 0 ); 
	--/*或許他只是不想讓妳誤會……
end

function LuaS_110288_11()
	SetSpeakDetail( OwnerID(), GetString("ST_110288_11")   );
	--/*住口！你是要來買這個耳環還是要當哈德利的說客！要這個耳環就別再給我提到他的事！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_12") , "LuaS_110288_12", 0 ); 
	--/*是的，女士，我希望能得到這對耳環。
end

function LuaS_110288_12()
	Setflag( OwnerID() , 540257 , 1 )
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110288_0") , "LuaS_110288_EXIT", 0 );
	--/*結束對話
end

function LuaS_110288_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end