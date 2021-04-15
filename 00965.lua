function LuaS_111490_0()
LoadQuestOption( OwnerID() )
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG1") , "LuaS_111490_1", 0 ) --我想了解南瓜節的由來
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG2") , "LuaS_111490_2", 0 ) --我想用20個「拐杖糖」兌換「搗蛋鬼」稱號
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG3") , "LuaS_111490_3", 0 ) --我想用300個「拐杖糖」兌換「超級搗蛋鬼」稱號
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG4") , "LuaS_111490_4", 0 ) --我想用5種顏色的「彩帶」各1條兌換「南瓜大胃王」稱號
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG5") , "LuaS_111490_5", 0 ) --我已經有「搗蛋鬼」稱號，我想用20個「拐杖糖」兌換「變身藥水」
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG6") , "LuaS_111490_6", 0 ) --我想用彩帶兌換商城物品
end
-----------------
function LuaS_111490_1()
SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG7")   )--南瓜節的由來1...
AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_111490_DIALOG7_2") , "LuaS_111490_1_1", 0 ) --然後呢？
end
-----------------
function LuaS_111490_1_1()
SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG7_1")   )--南瓜節的由來2...
end
-----------------
function LuaS_111490_2()
--我想用20個「拐杖糖」兌換「搗蛋鬼」稱號
	if CountBodyItem( OwnerID() , 530365 ) < 1 then
		if CountBodyItem( OwnerID() , 203078 ) >= 20 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			local DAVISRAND = rand(100)		
			DelBodyItem( OwnerID() , 203078 , 20 )
			GiveBodyItem( OwnerID() , 530365 , 1 )
				if DAVISRAND > 60 then		--40%機率
					GiveBodyItem( OwnerID() , 725451  , 1 )  --拿到 哥布林、蘑菇人其中之一
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG11")   )--你的表現真不錯！我特別獎勵你一罐變身藥水，祝你南瓜節快樂！
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--祝您南瓜節快樂！
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
				end
			else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
			end
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG12")   )--您已經有這個稱號了，不能重複兌換。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
	end
end
-----------------
function LuaS_111490_3()
--我想用300個「拐杖糖」兌換「超級搗蛋鬼」稱號
	if CountBodyItem( OwnerID() , 530366 ) < 1 then
		if CountBodyItem( OwnerID() , 203078 ) >= 300 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			local DAVISRAND = rand(100)			
			DelBodyItem( OwnerID() , 203078 , 300 )
			GiveBodyItem( OwnerID() , 530366 , 1 )
				if DAVISRAND > 30 then		--70%機率拿到
					GiveBodyItem( OwnerID() , 725452  , 1 )
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG11")   )--你的表現真不錯！我特別獎勵你一罐變身藥水，祝你南瓜節快樂！
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
				else
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--祝您南瓜節快樂！
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
				end
			else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
			end
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG12")   )--您已經有這個稱號了，不能重複兌換。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
	end
end
-----------------
function LuaS_111490_4()
--我想用5種顏色的「彩帶」各1條兌換「南瓜大胃王」稱號
	if CountBodyItem( OwnerID() , 530364 ) < 1 then
		if 	CountBodyItem( OwnerID() , 203080 ) >= 1 and 
			CountBodyItem( OwnerID() , 203081 ) >= 1 and 
			CountBodyItem( OwnerID() , 203082 ) >= 1 and 
			CountBodyItem( OwnerID() , 203083 ) >= 1 and 
			CountBodyItem( OwnerID() , 203084 ) >= 1 then
			if EmptyPacketCount( OwnerID() ) >= 0  and QueuePacketCount( OwnerID() ) == 0 then			
			DelBodyItem( OwnerID() , 203080 , 1 )
			DelBodyItem( OwnerID() , 203081 , 1 )
			DelBodyItem( OwnerID() , 203082 , 1 )
			DelBodyItem( OwnerID() , 203083 , 1 )
			DelBodyItem( OwnerID() , 203084 , 1 )
			GiveBodyItem( OwnerID() , 530364 , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--祝您南瓜節快樂！
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
			else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
			end
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG12")   )--您已經有這個稱號了，不能重複兌換。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
	end
end
-----------------
function LuaS_111490_5()
--我已經有「搗蛋鬼」稱號，我想用20個「拐杖糖」兌換「變身藥水」
	if CountBodyItem( OwnerID() , 530365 ) >= 1 then
		if CountBodyItem( OwnerID() , 203078 ) >= 20 then
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			local DAVISRAND = rand(100)		
			DelBodyItem( OwnerID() , 203078 , 20 )
				if DAVISRAND > 10 then		--90%機率拿到
					GiveBodyItem( OwnerID() , 725454  , 1 )  --拿到 哥布林、蘑菇人其中之一
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG8")   )--祝您南瓜節快樂！
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
				else			--5％機率拿到小死神、小南瓜
					GiveBodyItem( OwnerID() , 725453  , 1 ) 
					SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG14")   )--恭喜你！你抽到特殊變身藥水，祝您南瓜節快樂！
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
				end
			else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--您的背包空間不足，請清理一下再來吧。
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁
			end
		else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG9")   )--您所持有的數量不足，還不能兌換喔。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG13")   )--您沒有「搗蛋鬼」這個稱號，不能兌換變身藥水。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaS_111490_0", 0 ) --回到上一頁	
	end
end