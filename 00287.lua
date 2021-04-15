function LuaS_110266_0()
	
	SetSpeakDetail( OwnerID(), GetString("ST_110266_0")   );	--/*歡迎光臨，我巴拿夫的手藝可向您保證，是哈洛夫交易站中最值得炫燿的。	--/*看您是要在盔甲上用金絲加上徽記，還是想做個精緻的首飾？
	if CountBodyItem( OwnerID() , 200992 ) > 1 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_1") , "LuaS_110266_1", 0 ); 		--/*卡提恩．阿蒙告訴我你可以幫我找到派特．阿蒙。
	end
	if CheckAcceptQuest( OwnerID() , 420288 ) == true and CountBodyItem( OwnerID() , 200739 ) > 0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_2") , "LuaS_110266_2", 0 ); 		--/*夏麥爾隊長請我來問你知不知道這個假牙會是哪一名巧匠所做的？
	end		
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_0") , "LuaS_110266_EXIT", 0 );	--/*結束對話
end

function LuaS_110266_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_1")   );
	--/*喔？你是來找派特那老小子的啊？知道啊！我知道他跑去哪裡了，就是雪海啊！
	--/*你知道雪海吧？交易站後面那一大片就是雪海了，哈哈！在裡面找人可不容易呢！
	--/*我就再告訴你詳細一點好了，派特說要去寒夜谷找尋新的材料，如果他夠幸運，或許已經到那裡了。
	--/*如果你找到的是他的屍體，別傷心，我雖然不會製作鎧甲，但金屬工藝我可是很在行的！我可以教你一些，哈哈哈～
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_0") , "LuaS_110266_EXIT", 0 );
	--/*結束對話
end	

function LuaS_110266_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_2") );	--/*咦？夏麥爾隊長要問這顆假牙是誰做的？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_3") , "LuaS_110266_3", 0 );	--/*是的。
end

function LuaS_110266_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_3") );	--/*做的人就在你面前啊！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_4") , "LuaS_110266_4", 0 );	--/*是你做的？
end	

function LuaS_110266_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_4") );	--/*是啊！是安索醫師四個月之前請我做的；他說他的一個患者要前往凡瑞納絲城，希望做一副假牙遮掩他蛀掉的牙齒，當時我還拿到一大筆錢，被要求做出最好最美的假牙。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_5") , "LuaS_110266_5", 0 );	--/*你確定？
end

function LuaS_110266_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_5") );	--/*我記得很清楚，這個假牙可是我自豪的少數傑作之一啊！
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_6") , "LuaS_110266_6", 0 );	--/*那你還記得那個裝假牙的人是誰嗎？
end

function LuaS_110266_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_6") );	--/*記得啊！我昨天還看到他，就是大富豪卡里耳先生；不過你們是怎麼從卡里耳先生的口中拿到這個假牙的？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_7") , "LuaS_110266_7", 0 );	--/*這個假牙是幫卡里耳先生做的？
end

function LuaS_110266_7()
	SetSpeakDetail( OwnerID(), GetString("ST_110266_7") );	--/*是啊！到底怎麼了？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110266_8") , "LuaS_110266_8", 0 );	--/*沒事，謝謝你的合作。
end

function LuaS_110266_8()
	CloseSpeak( OwnerID() );	--關閉對話視窗
	SetFlag( OwnerID() , 540208 , 1 )
end	

function LuaS_110266_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end