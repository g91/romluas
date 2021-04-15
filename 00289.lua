function LuaS_110276_0()
	if CheckAcceptQuest(OwnerID(),420300) == true or CheckCompleteQuest(OwnerID(),420300) == true then
		LoadQuestOption( OwnerID() )
	elseif CountBodyItem( OwnerID(),200873 ) < 1 and CheckCompleteQuest( OwnerID() , 420299 ) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_110276_1")   );
		--/*喂！喂！我有個好東西，你有沒有興趣啊？因為我一看到你就覺得很親切，所以只告訴你喔！
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110276_1") , "LuaS_110276_2", 0 ); 
		--/*拿來看看。
--		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110276_0") , "LuaS_110276_EXIT", 0 );
		--/*結束對話
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110276_2")   );
		--/*我還有另外一個好東西......咦？奇怪，我是放到哪裡去了？
--		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110276_0") , "LuaS_110276_EXIT", 0 );
		--/*結束對話
	end
end

function LuaS_110276_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110276_0")   );
	--/*我這裡有一把鑰匙，是之前我們與牛頭人的巡狩隊交戰時，
	--我從一個牛頭人身上找到的。

	--了解這是什麼意思嗎？
	--代表這把鑰匙是牛頭人的鑰匙，
	--而鑰匙是用來做什麼的呢？是用來開鎖的。
	--而鎖是用來做什麼的呢？是為了不讓重要的東西被其他人拿走。

	--牛頭人有什麼東西需要鎖起來的？
	--你聽過雪角山城的寶藏嗎？
	--這鑰匙一定是牛頭人在雪角山城放的寶箱的鑰匙！

	--唉～可惜我要任務要執行，所以不能去冒險。
	--不過我看你似乎挺有能耐的，說不定你能拿到那個寶藏喔！

	--本來我打算賣10銀，不過我挺欣賞你的，友情價3銀就好！
	--如果你不要的話我就拿去賣別人囉！機會難得，快決定吧！
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110276_2") , "LuaS_110276_2", 0 ); 
		--/*讓我看看
end

function LuaS_110276_2()
	CloseSpeak( OwnerID() ); 
	OpenShop()
end

function LuaSI_110276()
	SetShop( OwnerID() , 600077 , "Test_Shop_Close" );
end

function LuaS_110276_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end