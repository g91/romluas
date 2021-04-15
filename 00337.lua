function LuaS_110469_0()

		if ( CheckFlag( OwnerID() , 540358) == true )  and CheckCompleteQuest(OwnerID() , 420674 ) == true then --檢查有大師資格的話
			SetSpeakDetail( OwnerID(), GetString ( "SD_110469_4" )   );--#沒想到像你這麼偉大的探礦師會來這裡！幸會幸會！

		elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) == 60 ) and CheckCompleteQuest(OwnerID() , 420674 ) == true then  --等級60提示要玩家去黑曜石要塞
			SetSpeakDetail( OwnerID(), GetString ( "SD_110469_3" )   );--#喂喂～你的成就已經那麼高了，怎麼還來找我啊？你應該去找傳說中的大師們學習，黑曜石要塞有很多傭兵，那裡比較容易得到他們的消息。

		elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) >= 20 ) and CheckCompleteQuest(OwnerID() , 420674 ) == true then --等級20以上提示要玩家去凡瑞娜絲
			SetSpeakDetail( OwnerID(), GetString ( "SD_110469_0" )   );--#你去過凡瑞娜絲城了嗎？礦工導師歐路特就在那裡，我記得是在城下東區吧？從他那裏你才能學到更多新東西。

		elseif ( CheckFlag( OwnerID(), 540269 ) == true ) then --如果會採礦(由於上面的限制，技能等級20後不會顯示)
			LoadQuestOption( OwnerID() );
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );--#我要如何才能快速地找到採集目標？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_MINE") , "LuaS_AFTER_GATHER_MINE", 0 );--#請告訴我關於精鍊的事情。
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110469_2", 0 );--#還有哪裡可以學到其他生活技能？
			
		elseif  ( CheckFlag( OwnerID(), 540269 ) ~= true ) then --如果不會採礦
			LoadQuestOption( OwnerID() );
			if CheckAcceptQuest( OwnerID() , 420674 ) == false then
				AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110469_1") , "LuaS_110469_1", 0 );--#我想學習挖礦。
			end
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110469_2", 0 );--#還有哪裡可以學到其他生活技能？
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110469_RecipeList_Touch", 0 );--#我想看看你賣的配方。　--放在最外層讓不會的人也能看看能做什麼東西
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110469_1()
		
   	SetSpeakDetail( OwnerID(), GetString ( "SD_110469_1" )   );--好！難得有人答應的這麼爽快！（今天不知道已經嚇跑幾個了）

								   --不要以為挖礦是鍛鍊身體用的！雖然這工作很粗重沒錯…不過，由挖礦所得的礦石，經過精鍊後，可以用來製造大多數的鐵製武器、防具以及其他器具，這是一項非常實用的技能。

								   --而方法很單純，只要點擊你所找到的礦堆就可以挖礦了。

								   --現在就去發揮礦工的熱血吧！祝你幸運！
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110469_3", 0 );--
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110469_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110469_2" )   ); --#開墾聚落這裡的話，我後面往湖的方向過去，有樵夫伍德教大家伐木，而開墾聚落內有愛麗絲會告訴你哪些草藥可以採集，嗯～還有，羅格鎮有一些教製造物品的，至於像凡瑞娜絲城這樣的大城，所有工作技能的導師都會有，我知道的就這些了。
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110469_0", 0 );--#返回上一頁
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110469_3()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_MINING_Dialog", 0 )

		
end

-------------------------------------------------------------------------------------------------------------------------