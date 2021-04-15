Function LuaS_110122_0()

	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420232 ) == true and CheckFlag(OwnerID() ,540788 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_1") , "LuaS_110122_1", 0 ) --/*說故事時間開始。
	end
	if CheckAcceptQuest( OwnerID() , 420544 ) == true and CountBodyItem( OwnerID() , 200680) == 0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_0") , "LuaS_110122_6", 0 ) --/*再要一個護身符。
	end

end
--------------------------------------------------------------------
Function LuaS_110122_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_1")   );
	--/*這樣的冒險我們村裡的獵人就常常跟我講了，我想聽一些這個地方聽不到的故事......
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_2") , "LuaS_110122_2", 0 ) --/*跟他說凡瑞娜絲城的事情

end
--------------------------------------------------------------------
Function LuaS_110122_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_2")   );
	--/*這個我聽過了，凡瑞娜絲常常有人到旅店裡，他們都跟我講這些故事......你沒有其他的故事嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_3") , "LuaS_110122_3", 0 ) --/*跟他說索雷爾頓的事情

end
----------------------------------------------------------------------
Function LuaS_110122_3()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_3")   );
	--/*索雷爾頓？他們不是一般的人類嗎？為什麼你會說他們很危險？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_4") , "LuaS_110122_4", 0 ) --/*跟他說巫妖安卡莉亞的事情

end
----------------------------------------------------------------------
Function LuaS_110122_4()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_4")   );
	--/*巫妖......嗯，他們跟死亡的人合作？他們還有跟其他的怪物合作嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_5") , "LuaS_110122_5", 0 ) --/*跟他說瑪卡斯魔獸的事情

end
----------------------------------------------------------------------
Function LuaS_110122_5()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_5")   );
	--/*魔獸！是那種巨大的魔獸嗎？唔唔唔～索雷爾頓和魔獸......你真的在對付這些東西？
	SetFlag( OwnerID() , 540788 , 1 )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_6") , "LuaS_110122_0", 0 ) --/*將故事收尾

end
----------------------------------------------------------------------
Function LuaS_110122_6()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_6")   );
	--/*請珍惜，每一次機會都是寶貴的。
	GiveBodyItem( OwnerID() , 200680 , 1 )

end