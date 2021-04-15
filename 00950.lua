function LuaYU_111446_0()

	LoadQuestOption( OwnerID() )

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_16")  ) --客套話
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_17")  , "LuaYU_111446_1", 0 ) --關於『貢獻回饋機制』
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_34")  , "LuaYU_111446_15", 0 ) --特殊稀有符文介紹
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_18")  , "LuaYU_111446_2", 0 ) -- 貢獻符文碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_19")  , "LuaYU_111446_13", 0 ) --兌換高級符文鑑定捲軸





end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_1()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_20")  ) --關於『貢獻回饋機制』
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁



end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_2()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_21")  ) --客套話2
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_22")  , "LuaYU_111446_3", 0 ) --貢獻傀奇碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_23")  , "LuaYU_111446_4", 0 ) --貢獻烏月碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_24")  , "LuaYU_111446_5", 0 ) --貢獻星河碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_25")  , "LuaYU_111446_6", 0 ) --貢獻煙幕碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_101222_YU_26")  , "LuaYU_111446_7", 0 ) --貢獻巨角碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_3()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_27")  ) --確定貢獻傀奇碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_8", 0 ) --確定

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_4()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_28")  ) --確定貢獻烏月碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_9", 0 ) --確定

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_5()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_29")  ) --確定貢獻星河碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_10", 0 ) --確定

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_6()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_30")  ) --確定貢獻煙幕碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_11", 0 ) --確定

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_7()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_31")  ) --確定貢獻巨角碎片
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_OKAY")  , "LuaYU_111446_12", 0 ) --確定

end



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_8()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203268 ) --傀奇

		if  Rune >= 1 then	
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 and Rune >= 1 then	
			sleep(10)

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724140  , 1 )  --一階
					sleep(10)
					DelBodyItem( OwnerID() , 203268 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724141  , 1 )  ---二階	
					sleep(10)
					DelBodyItem( OwnerID() , 203268 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724142  , 1 )  ---三階	
					sleep(10)
					DelBodyItem( OwnerID() , 203268 , 1 )	
				end
				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --我僅代表賢者之眼感謝你的貢獻，這個禮物代表我們的一點心意，謝謝你！
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁

			end

		else
			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --沒貢獻品
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁

		end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_9()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203269 ) --烏月

		if  Rune >= 1 then	
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 and Rune >= 1 then	
		

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724143  , 1 )  --一階
					sleep(10)
					DelBodyItem( OwnerID() , 203269 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724144  , 1 )  ---二階	
					sleep(10)
					DelBodyItem( OwnerID() , 203269 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724145  , 1 )  ---三階	
					sleep(10)
					DelBodyItem( OwnerID() , 203269 , 1 )	
				end
				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --我僅代表賢者之眼感謝你的貢獻，這個禮物代表我們的一點心意，謝謝你！
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
			end

		else

			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --沒貢獻品
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
		end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_10()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203270 ) --星河

		if  Rune >= 1 then	
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 and Rune >= 1 then
			

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724146  , 1 )  --一階
					sleep(10)
					DelBodyItem( OwnerID() , 203270 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724147  , 1 )  ---二階	
					sleep(10)
					DelBodyItem( OwnerID() , 203270 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724148  , 1 )  ---三階	
					sleep(10)
					DelBodyItem( OwnerID() , 203270 , 1 )	
				end
				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --我僅代表賢者之眼感謝你的貢獻，這個禮物代表我們的一點心意，謝謝你！
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
			else

				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁

			end

		else
			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --沒貢獻品
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
		end


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_11()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203271 ) --煙幕

		if  Rune >= 1 then	

			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 and Rune >= 1 then			
	

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724149  , 1 )  --一階
					sleep(10)
					DelBodyItem( OwnerID() , 203271 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724150  , 1 )  ---二階	
					sleep(10)
					DelBodyItem( OwnerID() , 203271 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724151  , 1 )  ---三階	
					sleep(10)
					DelBodyItem( OwnerID() , 203271 , 1 )	
				end
				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --我僅代表賢者之眼感謝你的貢獻，這個禮物代表我們的一點心意，謝謝你！
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
			else

				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁

			end

		else
			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --沒貢獻品
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
		end


end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_12()

		local RAND = rand(100)	
		local Rune = CountBodyItem( OwnerID() , 203272 ) --巨角

		if  Rune >= 1 then
			if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then	
			

				if RAND > 19 then 

--					Say( OwnerID() , 1 )
					GiveBodyItem( OwnerID() , 724152  , 1 )  --一階
					sleep(10)
					DelBodyItem( OwnerID() , 203272 , 1 )
				elseif RAND < 20 and RAND > 4 then

--					Say( OwnerID() , 2 )
					GiveBodyItem( OwnerID() , 724153  , 1 )  ---二階	
					sleep(10)
					DelBodyItem( OwnerID() , 203272 , 1 )
				else

--					Say( OwnerID() , 3 )
					GiveBodyItem( OwnerID() , 724154  , 1 )  ---三階	
					sleep(10)
					DelBodyItem( OwnerID() , 203272 , 1 )	
				end

				SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_32")  ) --我僅代表賢者之眼感謝你的貢獻，這個禮物代表我們的一點心意，謝謝你！
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
			else
				SetSpeakDetail( OwnerID(), GetString("K_08MID_DIALOG8")   )--您的背包空間不足，請清理一下再來吧。
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁
			end

		else
			SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_36")  ) --沒貢獻品
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁

		end


end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_13()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_33")  ) --<CM>[203267]</CM>具有強大的魔法能力，可以更加精準的鑒別未知的符文種類，提高鑒別稀有符文的機率，因為所需要之材料非常珍貴，一般只供賢者之眼的符文鑑定師使用，但是如果你可以提供<CP>6個不同類型的生產符文各100份</CP>，我願意提供兌換<CM>一瓶[203267]</CM>給您！

		AddSpeakOption( OwnerID(), TargetID(), "[SC_101222_YU_38]" , "LuaYU_111446_14_1", 0 ) --什麼是生產符文
		AddSpeakOption( OwnerID(), TargetID(), "[SC_101222_YU_39]" , "LuaYU_111446_14_2", 0 ) --兌換[203267]
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_14_1()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_40")  ) --生產符文包含<CP>[200850]</CP>、<CP>[200851]</CP>、<CP>[200852]</CP>、<CP>[200853]</CP>、<CP>[200854]</CP>、<CP>[200855]</CP>共6種，可透過擊敗世界各地的魔物取得，是從事生產活動不可或缺的物品。

		AddSpeakOption( OwnerID(), TargetID(), "[SC_101222_YU_39]" , "LuaYU_111446_14_2", 0 ) --兌換[203267]

end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_14_2()

	local R1 =  CountBodyItem( OwnerID() , 200850 ) --連接
	local R2 =  CountBodyItem( OwnerID() , 200851 ) --冷卻
	local R3 =  CountBodyItem( OwnerID() , 200852 ) --活化
	local R4 =  CountBodyItem( OwnerID() , 200853 ) --分解
	local R5 =  CountBodyItem( OwnerID() , 200854 ) --純化
	local R6 =  CountBodyItem( OwnerID() , 200855 ) --混合

	if R1 >= 100 and R2 >= 100 and R3 >= 100 and R4 >= 100 and R5 >= 100 and R6 >= 100 then


		DelBodyItem( OwnerID() , 200850 , 100 )
		DelBodyItem( OwnerID() , 200851 , 100 )
		DelBodyItem( OwnerID() , 200852 , 100 )
		DelBodyItem( OwnerID() , 200853 , 100 )
		DelBodyItem( OwnerID() , 200854 , 100 )
		DelBodyItem( OwnerID() , 200855 , 100 )

		GiveBodyItem( OwnerID() , 203267  , 1 ) --高級符文鑑定
		
		SetSpeakDetail( OwnerID(), "[SC_101222_YU_42]"   )--這是您需要的<CM>[203267]</CM>，祝您好運！

	else

		SetSpeakDetail( OwnerID(), "[SC_101222_YU_41]"   )--抱歉，您沒有足夠的<CN>生產符文</CN>喔！<CP>[200850]</CP>、<CP>[200851]</CP>、<CP>[200852]</CP>、<CP>[200853]</CP>、<CP>[200854]</CP>、<CP>[200855]</CP>..等6種每種都需要<CS>100份</CS>喔！
	end

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function LuaYU_111446_15()

		SetSpeakDetail( OwnerID(), GetString("SC_101222_YU_35") .. GetString("SC_101222_YU_37")  ) --特殊稀有符文介紹
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_BACK") , "LuaYU_111446_0", 0 ) --回到上一頁

end