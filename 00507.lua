function LuaS_110489_OpenShop()	-- 藥水商人萊丁一般開商店
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	OpenShop()				-- 打開商店
end
function LuaS_110489_Complete()	-- 藥水商人萊丁
	-- CloseSpeak( OwnerID() )			-- 關閉對話視窗
	GiveBodyItem ( TargetID() , 221253 , 1 )	-- 水藍色耳環
	--Say( TargetID() , "那就麻煩你幫我把這瓶柔軟藥水送過去給莎嘉小姐囉，謝謝！" )
end

function LuaS_110073()	-- 莎嘉，介紹防具商人的NPC
	--if ( CheckCompleteQuest( OwnerID() , 420700 ) == true ) then	-- 任務：前往報到
		LoadQuestOption( OwnerID() )	--載入任務模板
	--else
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_07") )	-- 哎呀，忙死了，忙死了忙死了…你要找雷頓大叔？\n\n拜託你好不好，我哪裡看起來像大叔？！我現在很忙，請你別來打擾我好不好！\n\n要知道大叔在哪，你最好是去問聚落前門口的李奧！
	--end
end

function LuaS_110073_Complete()	-- 莎嘉
	GiveBodyItem ( TargetID() , 201287 , 1 )	-- 舊布衣
	--Say( TargetID() , "那就麻煩你幫我把這瓶柔軟藥水送過去給莎嘉小姐囉，謝謝！" )
	--Say( OwnerID() , "對了，物品上頭都有著物品說明。" )
	--Sleep( 20 )
	--Say( OwnerID() , "有時候你可以打開背包看看，應該對你以後的旅程會很有幫助。" )
end

function LuaS_110076()	-- 諾斯卡，介紹委託告示板的NPC
	if ( CheckFlag( OwnerID() , 540804) == true ) then
		if ( CheckAcceptQuest( OwnerID() , 420457 ) == true ) or ( CheckAcceptQuest( OwnerID() , 420466 ) == true ) or ( CheckAcceptQuest( OwnerID() , 420467 ) == true ) then
			SetSpeakDetail( OwnerID() , GetString("ST_NEW_09") )	-- 喔，你已經接了告示板上的委託任務了啊…真厲害！\n\n趕緊完成任務的話，就可以得到不錯的任務報酬。\n\n好好加油吧！
		else
			SetSpeakDetail( OwnerID() , GetString("ST_NEW_10") )	-- 你有看到我前面這個告示板吧？\n\n聽說有時候會有附近的住民將想要委託別人代為執行的任務貼在上面，如果幫那些人完成任務的話，將會得到不錯的報酬。\n\n我本來是想接些任務賺點外快的，不過目前貼在上面的任務內容對我來說都太困難了，真是糟糕…\n\n聽雷頓隊長說你的能力好像滿不錯的，你要不要接個任務試試看？
		end
	else
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_11") )	-- 你有看到我前面這個告示板吧？\n\n聽說有時候會有附近的住民將想要委託別人代為執行的任務貼在上面，如果幫那些人完成任務的話，將會得到不錯的報酬。\n\n我本來是想看看能不能接些任務賺點外快的，不過目前好像沒有人需要委託的樣子…
	end
end

function LuaS_110591_Intro()	-- 傳送師克利絲汀
	--local RND = Rand( 99 ) + 1	-- 產生 1~100 的亂數
	--    if ( RND > 0 and RND <= 95 ) then
	--elseif ( RND > 95 and RND <= 100 ) then
	--	Say( TargetID() , GetString("ST_NEW_12") )	-- 你好，需要做回程術的登記嗎？( 機率 1/20 )
	--end
end

function LuaS_110069()	-- 依桑，介紹傳送師的NPC
	--if ( CheckAcceptQuest( OwnerID() , 420619 ) == true ) then	-- 任務：傳達愛意
	--	if ( CountBodyItem( OwnerID() , 201288 ) < 1 ) then	-- 物品：水藍色耳環
	--		SetSpeakDetail( OwnerID() , "你認識服飾供應商的梅莉嗎？\n\n她的手藝非常精巧，所以我請她製作一副可以搭配克利絲汀小姐水藍色服裝的特製耳環，算算時間，她應該已經製作完成了。\n\n呃…我還想在克利絲汀小姐身旁多待一下，你可以幫我去取回訂製的禮物嗎？" )
	--	else
	--		SetSpeakDetail( OwnerID() , "不愧是梅莉，製作的可真精巧。\n\n我得找個機會送給克利絲汀小姐，好讓她對我留下深刻的印象，畢竟找她登記傳送點的冒險者實在太多了…" )
	--	end
	--else
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_13") )	-- 克利絲汀小姐真是太美麗了，讓我都忘了我是來找她做傳送術登記的…
	--end
end

function LuaS_110068()	-- 莉娜，介紹分流引導員的NPC
	if ( CheckCompleteQuest( OwnerID() , 420700 ) == true ) then
		--if ( CheckCompleteQuest( OwnerID() , 420077 ) == true ) then
		--	SetSpeakDetail( OwnerID() , "謝謝你幫我找到珍珠，只要其他人也幫我找到的話，就可以請服飾供應商的梅莉姊姊幫我修補回原樣了。\n\n謝謝你喔！" )
		--elseif ( CheckAcceptQuest( OwnerID() , 420077 ) == true ) then
		--	LoadQuestOption( OwnerID() )	--載入任務模板
		--	AddSpeakOption( OwnerID() , TargetID() ,  GetString("SO_110068_0") , "LuaS_110068_Detail" , 0 )		--增加一個選項，蕈人的習性
		--else
		--	LoadQuestOption( OwnerID() )	--載入任務模板
		--end
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_14") )	-- 分流真是個神奇的概念…
	else
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_15") )	-- 你要找我父親雷頓嗎？他應該就在聚落裡的中央廣場。
	end
end

function LuaS_110490()	-- 符文商人波特
	LoadQuestOption( OwnerID() )	--載入任務模板
	--if ( CheckFlag( OwnerID() , 540819 ) == true ) then	-- 重要物品：已獲得獎賞獨角獸符文
	--else
	--	if ( CheckCompleteQuest( OwnerID() , 420719 ) == true ) then
	--		AddSpeakOption( OwnerID() , TargetID() , GetString("ST_NEW_16") , "LuaS_110490_GiveUnicon" , 0 )	-- 我要領取鑲嵌符文獨角獸
	--	end
	--end
  	--AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110490_1") , "LuaS_110490_OpenShop" , 0 )	-- 你擁有哪些符文？
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110490_2") , "LuaS_110490_2" , 0 )		-- 什麼是符文？
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110490_3") , "LuaS_110490_3" , 0 )		-- 我拿到奇怪的符文，那是要幹嘛的？
end
function LuaS_110490_OpenShop()	-- 符文商人波特一般開商店
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	OpenShop()				-- 打開商店
end
function LuaS_110490_2()	-- 符文商人波特教學
	SetSpeakDetail( OwnerID() , GetString("ST_110490_2") )					-- 符文可以說是構成這世界的元素，而一般我們所見到石塊狀的符文，則是一種符文的集結體。/n不同的符文石塊運用的地方不同，也會帶來不同的力量。
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LOOKOTHER") , "LuaS_110490" , 0 )	-- 看看其他說明
end
function LuaS_110490_3()	-- 符文商人波特
	SetSpeakDetail( OwnerID() , GetString("ST_110490_3") )					-- 你可以看看符文的說明，你拿到的應該是生產符文，這些符文在日後的生產活動中有很重要的地位，可以先保留起來；/n如果你是拿到武器符文，那恭喜你！日後你若拿到具有符文空間的武器，就可以把這武器符文鑲嵌進去，增加你武器的能力；/n如果你是拿到頭部、上身或下身符文，同樣地可以鑲嵌入具有符文空間的裝備。
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LOOKOTHER") , "LuaS_110490" , 0 )	-- 看看其他說明
end

function LuaS_110490_GiveUnicon()	-- 符文商人波特送獨角獸
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	Say( TargetID() , GetString("ST_NEW_17") )	-- 謝謝你幫我送過去，這是答應給你鑲嵌符文獨角獸。
	SetFlag( OwnerID() , 540819 , 1 )
	GiveBodyItem ( OwnerID() , 520911 , 1 )	-- 獨角獸
end

