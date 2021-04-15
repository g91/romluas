function LuaS_110016_0()

	if CheckCompleteQuest( OwnerID(), 420416 ) == true then 
		SetSpeakDetail( OwnerID(), GetString("ST_110016_0")   ); --/*多虧各位的貢獻，凡瑞娜絲城才能如此美麗，並屹立不搖。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*結束對話		
	else
		LoadQuestOption( OwnerID() );	--載入任務
		if CheckAcceptQuest( OwnerID(), 420208 ) == true or CheckAcceptQuest( OwnerID(), 420413 ) == true or CheckAcceptQuest( OwnerID(), 420414 ) == true then 
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_1") , "LuaS_110016_1", 0 ) --/*如何取得銅錠？
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_2") , "LuaS_110016_2", 0 ) --/*如何取得硬木塊？
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_3") , "LuaS_110016_3", 0 ) --/*如何取得苦葉汁？

		elseif CheckAcceptQuest( OwnerID(), 420209 ) == true or CheckAcceptQuest( OwnerID(), 420415 ) == true or CheckAcceptQuest( OwnerID(), 420416 ) == true then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_4") , "LuaS_110016_4", 0 ) --/*如何取得鐵錠？
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_5") , "LuaS_110016_5", 0 ) --/*如何取得楓木材？
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_6") , "LuaS_110016_6", 0 ) --/*如何取得蛇藤粉末？
		end
	end

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_1")   );
	--/*你必須先到城內的「職業工會」去找礦工工頭歐路特學習挖礦，並且到工具房去買把十字鎬，然後就可以到野外去尋找黃銅礦
	--  了。挖得黃銅礦後再回到城內的精練屋去進行精練，就可以得到銅錠。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*我還有其他問題。
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_2")   );
	--/*你必須先到城內的「職業工會」去找伐木領班洛桑學習伐木，並且到工具房去買把伐木斧，然後到野外去尋找適合的樹木加以
	--  砍伐，取得刺槐後再回到城內的精練屋去進行精練，就可以得到硬木塊。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*我還有其他問題。
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_3()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_3")   );
	--/*你必須先到城內的「職業工會」去找採藥師娜塔學習採藥，並且到工具房去買把藥鋤，然後到野外去尋找草藥叢，由草藥叢取
	--  得苦葉草後再回到城內的精練屋去進行精練，就可以得到苦葉汁。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*我還有其他問題。
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_4()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_4")   );
	--/*向城內「職業工會」的礦工工頭歐路特學習到挖礦後，並將挖礦技能提升到工匠，就可以採集到赤鐵礦。挖得赤鐵礦後再回到城
	--  內的精練屋去進行精練，就可以得到鐵錠。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*我還有其他問題。
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_5()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_5")   );
	--/*向城內「職業工會」的伐木領班洛桑學習伐木後，並將伐木技能提升到工匠，就可在一些伐木點砍伐到楓木，再回到城內
	--  的精練屋去進行精練，就可以得到楓木材。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*我還有其他問題。
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_6()

	SetSpeakDetail( OwnerID(), GetString("ST_110016_6")   );
	--/*向城內「職業工會」的採藥師娜塔學習採藥，並且將採藥技能提升到工匠，就可以在部份草藥叢採取到蛇藤根，再回到城內的精
	--  練屋去進行精練就能得到蛇藤粉末。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_RETURN"), "LuaS_110016_0", 0 ); --/*我還有其他問題。
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110016_EXIT") , "LuaS_110016_EXIT", 0 ); --/*結束對話

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110016_EXIT()

	CloseSpeak( OwnerID() );	--關閉對話視窗
end