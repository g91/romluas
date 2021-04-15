--寡婦喬妮：獨力扶養下一代是一件困難的事，但是我仍然不會放棄的。

function LuaS_420847_0_0()
	if CheckAcceptQuest( OwnerID() , 420847) == true and CountBodyItem( OwnerID(), 202172)>=1 and CheckFlag( OwnerID(), 540949 ) == false then
		LoadQuestOption(OwnerID())	
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_0") , "LuaS_420847_0_1", 0 ) --玩家選項：這些食物希望能幫上你的忙
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420847_0_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_1" )   )--我們並不熟識，為什麼你要對我這麼好？
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_2") , "LuaS_420847_0_2", 0 ) --玩家選項：幫助一個偉大的母親是天經地義
end

function LuaS_420847_0_2()
	DelBodyItem( OwnerID(), 202172, 1 )
	SetFlag( OwnerID()  , 540949 , 1 )
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_3" )   )--喔……那好吧。謝謝你的好意，這幫了我們母子一個大忙。
end

--寡婦拉米耶：柏斯佩斯！請引領我的丈夫到安樂的領土去吧……

function LuaS_420847_1_0()
	if CheckAcceptQuest( OwnerID() , 420847) == true and CountBodyItem( OwnerID(), 202172)>=1 and CheckFlag( OwnerID(), 540950 ) == false then
		LoadQuestOption(OwnerID())	
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_4") , "LuaS_420847_1_1", 0 ) --玩家選項：你得吃點東西
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420847_1_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_5" )   )--算了吧。我現在沒有胃口吃東西。
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_6") , "LuaS_420847_1_2", 0 ) --玩家選項：你的丈夫不會希望你餓著肚子思念他
end

function LuaS_420847_1_2()
	DelBodyItem( OwnerID(), 202172, 1 )
	SetFlag( OwnerID()  , 540950 , 1 )
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_7" )   )--喔……那好吧，謝謝你的好意。願柏斯佩斯關注你，善良的人類朋友。
end

--寡婦吉恩娜：雖然大家都說我的丈夫已經死在獨眼巨人手下，但是我仍不會放棄希望，或許他下一秒就會出現在我的眼前！

function LuaS_420847_2_0()
	if CheckAcceptQuest( OwnerID() , 420847) == true and CountBodyItem( OwnerID(), 202172)>=1 and CheckFlag( OwnerID(), 540951 ) == false then
		LoadQuestOption(OwnerID())	
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_4") , "LuaS_420847_2_1", 0 ) --玩家選項：你得吃點東西
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420847_2_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_5" )   )--算了吧。我現在沒有胃口吃東西。
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_8") , "LuaS_420847_2_2", 0 ) --玩家選項：我怕在你丈夫出現前你會先餓昏
end

function LuaS_420847_2_2()
	DelBodyItem( OwnerID(), 202172, 1 )
	SetFlag( OwnerID()  , 540951 , 1 )
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_9" )   )--喔……那好吧，為了保持體力我得吃點東西……
end