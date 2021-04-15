function LuaS_110599_0()
                                
 		if CheckFlag( OwnerID() , 540366 )==true then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110599_4" )   );--唔喔喔喔喔！你不是那個.......那個......煉金術大師嗎？你會把石頭煉成黃金嗎？

		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_Alchemy ) == 60 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110599_3" )   );--連艾莉小姐也沒辦法教你東西了啊？真是糟糕，我也不知道誰可以教你更深入的煉金術耶～或許賢者之眼......算了，還是去黑曜石要塞吧！黑曜石要塞那裡似乎有煉金大師的線索。

		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) >= 20 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110599_0" )   );--你的能力已經超出我所能教你的了，凡瑞娜絲城下東區的艾莉小姐會的東西比我多更多，你應該去找她學習。

		elseif ( CheckFlag( OwnerID(), 540338 ) == true ) then --如果會煉金
			LoadQuestOption( OwnerID() );
                                               	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110599_2", 0 );--#還有哪裡可以學到其他生活技能？

		elseif ( CheckFlag( OwnerID(), 540338 ) ~= true ) then	--如果不會煉金
			LoadQuestOption( OwnerID() );
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110599_1") , "LuaS_110599_1", 0 );--#我想學習煉金。
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110599_2", 0 );--#還有哪裡可以學到其他生活技能？
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110599_RecipeList_Touch", 0 );--#我想看看你賣的配方。--讓不會的人也能看看能做什麼東西				


end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110599_1()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110599_1" )   );--好的藥水可以帶來許多方便的特殊能力，無論在什麼時候，藥水總是被需要而且受歡迎的。
								   --當你學習到煉金配方後，只要在煉金器具附近，打開系統列中的「生活技能」選擇「煉金」。就可以製造這些藥水了。
								   --想要配方的我可以送...不不不，是「賣」你一些。呼～當窮人當上癮了，真是的...
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110599_3", 0 );--
		
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function LuaS_110599_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110599_2" )     ); --其他的工作技能？你不想跟我學煉金嗎？唉～不過這裡有教的不多，就是鐵匠舖的羅娜會教打鐵，還有南邊出口附近的妮可會教木工，其他有幾個教採集的都在開墾聚落，你應該知道吧？嗯，對了！亞特‧瑞爾凱修在旅館旁邊教分解術，建議你一定要去看看。

	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110599_0", 0 );--#返回上一頁
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110599_3()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_ALCHEMY_Dialog", 0 )

		
end

-------------------------------------------------------------------------------------------------------------------------