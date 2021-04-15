function LuaS_110598_0()

 		if CheckFlag( OwnerID(), 540362 )==true  then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110598_4" )   );--你不是那個有名的大木匠嗎？可以請你在我的刨刀上面簽名嗎？
		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_Carpenter  ) == 60 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110598_3" )   );--哇！你已經是個很出色的木工了！你還想更進一步的話，看來只有傳說中的木工大師能夠幫助你了，不過要找到大師啊......我記得之前去黑曜石要塞有聽說過，或許你應該去那裡看看？
		elseif ReadRoleValue( OwnerID() ,EM_RoleValue_Skill_Carpenter  ) >= 20 then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110598_0" )   );--我這裡能教你的就這些囉！如果你想學更多，我建議你去找凡瑞娜絲城城下西區找吉恩先生會比較好。

		elseif ( CheckFlag( OwnerID(), 540334 ) == true ) then	--如果會木工	
			LoadQuestOption( OwnerID() );
                                               	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110598_2", 0 );--#還有哪裡可以學到其他生活技能？

		elseif ( CheckFlag( OwnerID(), 540334 ) ~= true ) then	--如果不會木工
			LoadQuestOption( OwnerID() );			
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110598_1") , "LuaS_110598_1", 0 );--#我想學習木工。
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110598_2", 0 );--#還有哪裡可以學到其他生活技能？

		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110598_RecipeList_Touch", 0 );--#我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	

end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110598_1()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110598_1" )   );--木工是一種需要耐心與細心的工作，你可以藉由木工製造許多遠程或法系的武器。
								   --學習到配方後，只要在木工器具附近，打開系統列中的「生活技能」選擇「木工」。就可以製造木製武器或其他成品了。
								   --如果需要基礎的木工配方的話，我這邊倒是有一些，價格很合理喔！
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110598_3", 0 );--
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110598_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110598_2" )     ); --你不知道哪裡學工作技能啊？我就可以教你木工了啊！不喜歡的話，鐵匠舖那邊的羅娜也可以教你打鐵，再不然就去找西邊出口那裡的辛修斯學煉金，還是你想學採集？那你應該回開墾聚落看看，採集老師都在那裡；等等，你不會是要跟那個亞特‧瑞爾凱修學分解術吧？最近很多人似乎很感興趣，他都會在旅館旁邊教人呢！

	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110598_0", 0 );--#返回上一頁
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110598_3()

                CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_CARPENTER_Dialog", 0 )

		
end

-------------------------------------------------------------------------------------------------------------------------