function LuaS_110268_0()

	if CheckFlag(OwnerID(),540213) == true and CheckFlag(OwnerID() ,540215) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_110268_0") );		--/*你……我以為你是個好人，才把我的朋友託付給你……你竟然攻擊他！
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_1") , "LuaS_110268_1", 0 );		--/*我是為了你好。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_0") , "LuaS_110268_EXIT", 0 ); 		--/*天真的傢伙，我跟你沒什麼好說的。
	else
		LoadQuestOption( OwnerID() )
	end

end

function LuaS_110268_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_1") );	--/*為了我好？什麼為了我好！你怎麼判斷這對我是好是壞！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_2") , "LuaS_110268_2", 0 ); 	--/*他是個牛頭人，而你是個人類，你怎麼確定他復原後不會傷害你？
end

function LuaS_110268_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_2") );	--/*他當然不會傷害我！他是一個好牛頭人！我們是朋友！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_3") , "LuaS_110268_3", 0 ); 	--/*是啊！對他來說你也是一個好人類，所以他不會傷害你。
end

function LuaS_110268_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_3") );	--/*沒錯！我們之間的友誼就是如此……
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_4") , "LuaS_110268_4", 0 ); 	--/*但他會不會傷害其他的人類呢？
end

function LuaS_110268_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_4") );	--/*他不會的！因為我是他的朋友！他不會傷害……
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_5") , "LuaS_110268_5", 0 ); 	--/*就算你有他這個朋友，你遇到其他牛頭人不會拿起武器戰鬥嗎？
end

function LuaS_110268_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_5") );	--/*他和其他牛頭人不一樣！他是好的牛頭人……
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_6") , "LuaS_110268_6", 0 ); 	--/*你怎麼確定傷害他的一定是壞人？而你傷害的牛頭人一定不是好牛頭人？
end

function LuaS_110268_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_6") );	--/*我……因為他們會攻擊我，所以他們不是……
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_7") , "LuaS_110268_7", 0 ); 	--/*你也認識很多會攻擊牛頭人的人類，他們都是壞人嗎？
end

function LuaS_110268_7()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_7") );	--/*這……
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_8") , "LuaS_110268_8", 0 ); 	--/*別再天真了！醒醒吧！你和那個牛頭人如果在其他情況下相遇，你們一定會彼此殘殺。
end

function LuaS_110268_8()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_8") );	--/*……
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_9") , "LuaS_110268_9", 0 ); 	--/*牛頭人就是牛頭人，人類就是人類，兩個種族視彼此為敵人是理所當然的，與對方是好是壞無關。
end

function LuaS_110268_9()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_9") );	--/*你怎麼可以這麼說？這完全否定了神賜與我們的良知與智慧……
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_10") , "LuaS_110268_10", 0 ); 	--/*這就是智慧！現實就是這麼殘酷！如果你是躲在家中的貴族還可以假裝自己與現實無關，但現在你是前線的士兵！你遲早要面對這種殘酷的事實！
end

function LuaS_110268_10()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_10") );	--/*我……
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_11") , "LuaS_110268_11", 0 ); 	--/*就算他的傷好了，難道他不會回到牛頭人的城市？難道他不會跟著其他牛頭人一起攻擊人類？
	SetFlag( OwnerID() , 540215 , 1 )
end

function LuaS_110268_11()
	--SetSpeakDetail( OwnerID(), GetString("ST_110268_8") );	--/*……
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_12") , "LuaS_110268_0", 0 ); 	--/*如果你們到時候相遇了，就算他真的想保護你，他作得到嗎？就算你想保護他，你作得到嗎？
end

function LuaS_110268_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end

function LuaS_110268_CheckRune()
	if CountBodyItem( TargetID() , 201234 ) >= 1 then
		DelBodyItem ( TargetID() , 201234 , 1 )	
		return true
	else
		return false
	end
end