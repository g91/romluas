function LuaS_110597_0()

		if CheckFlag( OwnerID(), 540361 )==true  then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110597_4" )   );--咳～那個......你好，這麼偉大的鐵匠願意來我這哩，我實在感到......呃......興高采烈？

		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_BlackSmith ) == 60 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110597_3" )   );--嗚咕～別嚇人啦！像你這樣厲害的鐵匠怎麼會來找我呢？如果你是要找傳說中打鐵大師的消息，也應該去黑曜石要塞找啊！

		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) >= 20 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110597_0" )   );--哈哈！你的程度很不錯了呦！有去跟凡瑞娜絲城的布拉格先生學習了吧？他應該還在城下西區那裡，他會的東西比我多太多了！

		elseif ( CheckFlag( OwnerID(), 540268 ) == true ) then	--如果會打鐵		
			LoadQuestOption( OwnerID() );
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110597_2", 0 );--#還有哪裡可以學到其他生活技能？

		elseif ( CheckFlag( OwnerID(), 540268 ) ~= true ) then	--如果不會打鐵
			LoadQuestOption( OwnerID() );				
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110597_1") , "LuaS_110597_1", 0 );--#我想學習打鐵。
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110597_2", 0 );--#還有哪裡可以學到其他生活技能？
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end

		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110597_RecipeList_Touch", 0 );--#我想看看你賣的配方。　--放在最外層讓不會的人也能看看能做什麼東西
end


-------------------------------------------------------------------------------------------------------------------------

function LuaS_110597_1()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110597_1" )   );--打鐵看起來很辛苦，但是如果技巧得宜，任何人都可以輕鬆勝任的。
								   --學習到配方後，只要在打鐵器具附近，打開系統列中的「生活技能」，選擇「打鐵」。就可以製造不同的鐵製器具了，你先買些簡單的配方試試看吧？
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110597_3", 0 );--
		
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110597_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110597_2" )   ); --嗯哼？其他的工作技能啊？鎮上往裡谷的出口附近那裡有木匠妮可教木工，鎮上往瑟薇達森林的出口那裡則是煉金師辛修斯，他也會教人煉金......啊！對了！旅館旁邊有一個亞特‧瑞爾凱修，付錢可以學到一個叫做分解術的技術，好像能把作好的東西還原成原料還是怎樣，你親自去問他可能會比較清楚。
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110597_0", 0 );--#返回上一頁
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110597_3()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_BLACKSMITH_Dialog", 0 )

		
end
-------------------------------------------------------------------------------------------------------------------------