function LuaS_110286_0()
	if ReadRoleValue( OwnerID() , EM_RoleValue_SEX) == 0 then
		SetSpeakDetail( OwnerID(), GetString("ST_110286_0")   );
		--/*喔～抱歉，外子剛過逝不久，所以我不能馬上接受你的邀請，不過如果只是到那邊稍微談談應該沒關係，讓我們......
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110286_1")   );
		--/*唉呀～真抱歉，我不記得你是哪位的情人或妻子，不過如果你是來找我理論的話，我可以大方的把你的男人還給你，反正我會忘記的都是些小腳色嘛！喔呵呵呵～
	end
	if CheckFlag(OwnerID() , 540767 ) ~= true and CheckFlag( OwnerID() , 540254 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_1") , "LuaS_110286_1", 0 )
		--/*卡夫卡莫伊的耳環
	end
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_0") , "LuaS_110286_EXIT", 0 );
	--/*結束對話

end

function LuaS_110286_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_2")   );
	--/*耳環？我是有很多耳環，這些耳環都十分美麗呢！你是想看我的哪一個耳環？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_2") , "LuaS_110286_2", 0 )
	--/*抱歉，夫人，我希望知道的是阿尼瑞西先生所遺留下的耳環，並非夫人自己的耳環。
end

function LuaS_110286_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_3")   );
	--/*啊……啊！無禮的傢伙！你的意思是說我侵佔了我先生的遺物？他是我先生，他遺留下來的一切自然就是由我來繼承啊！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_3") , "LuaS_110286_3", 0 )
	--/*夫人你誤會了，我並沒有這個意思，只是我之前得到的線索只有說這個耳環為阿尼瑞西先生所有。
end

function LuaS_110286_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_4")   );
	--/*……他的確是有過這麼一對耳環，而他也僅僅有過這麼一對，他生前是蠻重視這對耳環的，但那對耳環對我來說太大了，樣式我也不喜歡；你問這個是想做什麼？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_4") , "LuaS_110286_4", 0 )
	--/*其實某人生前曾向阿尼瑞西先生說好要買下這對耳環，但很可惜阿尼瑞西先生來不及完成交易就死了，於是他便請我來找夫人交涉，希望能完成這筆交易。
end

function LuaS_110286_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_5")   );
	--/*是嗎……不過那對耳環我已經送給別人了，我先生的事情我不想管，你們要交易去找別人吧！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_5") , "LuaS_110286_5", 0 )
	--/*可以告訴我那個人是誰嗎？夫人。
end

function LuaS_110286_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_6")   );
	--/*你……你問這個做什麼！你憑什麼要我告訴你！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_6") , "LuaS_110286_6", 0 )
	--/*夫人請息怒，我只是想完成這筆未完的交易而已，並不知道夫人有所顧慮而不便說出這人的名字，實在很對不起。
end

function LuaS_110286_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_7")   );
	--/*我……我才沒有什麼顧慮呢！嗯……我只是因為受他幫助所以把耳環送給他，我們之間沒有任何其他關係！咳……咳……總之，他是奇拉爾觀測哨所的一個小士兵，叫做哈德利，名字我已經告訴你了，你要交易就去找他！別再來煩我了！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_7") , "LuaS_110286_EXIT", 0 )
	--/*是的，謝謝夫人的幫助。
	SetFlag( OwnerID() , 540767 , 1 )
end

function LuaS_110286_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗

end