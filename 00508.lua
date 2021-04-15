function LuaS_110757()	-- 分流引導員
	LoadQuestOption( OwnerID() )
	--SetSpeakDetail( OwnerID(), GetString ( "ST_CHANGEPARALLED_MSG" )   )
	--這個世界上受到符文力量的影響，讓時間的流動在某些地方產生了分歧，那些因此而分離的世界我們稱為分流，
	--這些分流與我們的世界就如同一個實體在不同光線下產生的不同影子，這也是我們迷途之光所探討的神祕之一。

	--現在我們迷途之光發現某些特定地點可以讓人前往不同的分流，過去有些人在這個世界找不到自己的方向，就是
	--因為他真正應該去的地方其實是在其他的分流上，你是否也迷惘自己的方向？如果是的話，你或許可以前往其他
	--的分流看看，而我們迷途之光將會幫助你進行這段旅程。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_CHANGEPARALLED") , "LuaS_ChangeParalledID_1", 0 ) --/*我要前往其他分流
end

function LuaS_110077()	-- 古汀，介紹藥水商人的NPC
	--if ( CheckCompleteQuest( OwnerID() , 420079 ) == true ) then
	--	SetSpeakDetail( OwnerID() , "擦了藥水之後，我的腰已經比較不痛了，謝謝你體恤我這個老人家，幫我跑那一趟。\n\n我跟你說啊，萊丁進貨的藥水品質一向很好，有需要的話，你可以多多光顧，年輕人在外旅行，總是會受個傷什麼的…總之有備就無患，對吧？" )
	--else
		LoadQuestOption( OwnerID() )	--載入任務模板
		SetSpeakDetail( OwnerID() , "唉～年紀一大，身體就不聽使喚了，今天腰又痛了…" )
	--end
end

function LuaS_110018()	-- 艾薇，一般任務的NPC
	LoadQuestOption( OwnerID() )	--載入任務模板
	--if ( CheckCompleteQuest( OwnerID() , 420077 ) == true ) then
	--	SetSpeakDetail( OwnerID() , "今天的水源還是含有這麼多的孢子啊，看來得等長一點的時間過濾處理了。" )
	--else
	--	SetSpeakDetail( OwnerID() , "今天的水源還是含有這麼多的孢子啊，看來得等長一點的時間過濾處理了。" )
	--end
end

function LuaS_110657()	-- 防具商人山普
	--if ( CheckCompleteQuest( OwnerID() , 420717 ) == true ) then	-- 任務：布衣修復
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_08") )	-- 我準備了一些上好的鎖甲、皮甲類防具，你要不要參觀看看？\n\n若是你想要布衣、法袍類防具的話，可以找我的妻子梅莉，她就在我的身旁，我們感情很好喔～
	--	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110657_OpenShop" , 0 )	-- 增加一個選項：開啟商店
	--elseif ( CheckAcceptQuest( OwnerID() , 420717 ) == true or CheckCompleteQuest( OwnerID() , 420717 ) == true ) then	-- 任務：冬衣縫製，物品：舊粗布衣
		LoadQuestOption( OwnerID() )	--載入任務模板
		--SetSpeakDetail( OwnerID() , "符文空間消失的粗布衣？\n\n給我看看，如果是那個問題，我一定可以修好。" )
		--AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110657_YES") , "LuaS_110657_Yes" , 0 )	-- 增加一個選項：好的，請你幫我修理看看
	--else
	--	SetSpeakDetail( OwnerID() , GetString("ST_NEW_08") )	-- 我準備了一些上好的鎖甲、皮甲類防具，你要不要參觀看看？\n\n若是你想要布衣、法袍類防具的話，可以找我的妻子梅莉，她就在我的身旁，我們感情很好喔～
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110657_OpenShop" , 0 )	-- 增加一個選項：開啟商店
	--end
end
function LuaS_110657_OpenShop()	-- 防具商人山普一般開商店
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	OpenShop()				-- 打開商店
end
function LuaS_110657_Yes()	-- 防具商人山普
	SetFlag( TargetID() , 540807 , 1 )		-- 修復好粗布衣的符文空間
	--DelBodyItem ( OwnerID() , 201287 , 1 )	-- 舊粗布衣
	GiveBodyItemEx( TargetID() , 220098 ,  1 , 1 , 0 ,0 ,0 , 0 , 0 )	-- 給一洞的粗布衣
	--SetSpeakDetail( OwnerID() , "果然是因為符文混亂，才導致符文空間消失，我已經幫你修好了。\n\n不過，你最好還是趕快去找符文商人波特先生，買個符文鑲嵌進去，比較能讓符文空間穩定下來。" )
end

function LuaS_110656()	-- 防具商人梅莉
	--if ( CheckAcceptQuest( OwnerID() , 420619 ) == true and CountBodyItem( OwnerID() , 201288 ) < 1 ) then	-- 任務：傳達愛意，物品：水藍色耳環
	--	SetSpeakDetail( OwnerID() , "依桑訂製的耳環啊，早上我才剛做好呢！\n\n他這次是愛上傳送師克利絲汀是吧，不是我在說，他總是對穿著制服的女性有特別的偏愛…還有啊，他為什麼不能專情一點，就像我跟我的丈夫一樣…啊！對不起，關於客人的事情我不應該這麼抱怨的。\n\n來，我把依桑訂製的耳環交給你。" )
	--	AddSpeakOption( OwnerID() , TargetID() , "好的，我會負責將耳環送過去給依桑" , "LuaS_110656_Yes" , 0 )	-- 增加一個選項：好的，我會負責將耳環送過去給依桑
	--else
		SetSpeakDetail( OwnerID() , GetString("ST_NEW_18") )	-- 我準備了一些質地細緻的布衣、法袍類防具，要不要隨便參考看看？\n\n若是你想要鎖甲、皮甲類防具的話，可以找我的丈夫山普，他就在我的身旁，我們感情很好喔～
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_OPENSHOP") , "LuaS_110656_OpenShop" , 0 )	-- 增加一個選項：開啟商店
	--end
end
function LuaS_110656_OpenShop()	-- 防具商人梅莉一般開商店
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	OpenShop()				-- 打開商店
end
function LuaS_110656_Yes()	-- 防具商人梅莉
	CloseSpeak( OwnerID() )			-- 關閉對話視窗
	GiveBodyItem ( OwnerID() , 201288 , 1 )	-- 水藍色耳環
	-- Say( TargetID() , "麻煩你了！另外，如果要買甲冑、法袍，請來我們夫婦的商店喔！" )
end

function LuaQ_420674_Complete()	-- 完成物資補充挖礦
	CastSpell( TargetID() , TargetID() , 491010 )
	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_GET_MINE_1"), C_SYSTEM );--畫面中間訊息：你已取得挖礦學徒資格
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_MINE_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得挖礦學徒資格，挖礦等級上限為20級。
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_FORMULA_MINE_1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-黃銅砂」。
	return true
end
function LuaQ_420673_Complete()	-- 完成物資補充伐木
	CastSpell( TargetID() , TargetID() , 491010 )
	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_GET_WOOD_1"), C_SYSTEM );--畫面中間訊息：你已取得伐木的學徒資格
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_WOOD_1_D"),"0xFFFF8000");--訊息視窗訊息：你已取得伐木的學徒資格，挖礦等級上限為20級。
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_FORMULA_WOOD_1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-輕木材」。
	return true
end
function LuaQ_420672_Complete()	-- 完成物資補充採藥
	CastSpell( TargetID() , TargetID() , 491010 )
	ScriptMessage( TargetID(), TargetID(), 2, GetString("MSG_GET_HERB_1"), C_SYSTEM );--畫面中間訊息：你已取得採藥的學徒資格
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_HERB_1_D"), "0xFFFF8000");--訊息視窗訊息：你已取得採藥的學徒資格，採藥等級上限為20級。
	ScriptMessage( TargetID(), TargetID(), 0, GetString("MSG_GET_FORMULA_HERB_1"), C_YELLOW);--訊息視窗訊息：你已習得「配方-山魔楊草束」。
	return true
end

function AlreadySkillDePose()	-- 完成分解術
	if ( CheckFlag( TargetID() , 540002 ) == true ) then	-- 重要物品：分解術
	else
		SetFlag( TargetID() , 540002 , 1 )
	end
end
