function LuaS_110471_0()

		if CheckFlag( OwnerID(), 540360 )==true and CheckCompleteQuest(OwnerID() , 420672 ) == true then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110471_4" )   );--身為一個採藥人，能夠見到你是我的榮幸。

		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_Herblism ) == 60 and CheckCompleteQuest(OwnerID() , 420672 ) == true then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110471_3" )   );--啊！你已經學到這麼多知識了啊！看來只有傳說中的大師能教導你了，不過我也不知道大師是誰，廳娜榙老師說，似乎黑曜石要塞有這些大師們的情報，我覺得你務必去看看。

		elseif ReadRoleValue( OwnerID() ,  EM_RoleValue_Skill_Herblism ) >= 20 and CheckCompleteQuest(OwnerID() , 420672 ) == true then
			SetSpeakDetail( OwnerID(), GetString ( "SD_110471_0" )   );--你已經比我厲害了呢！現在我想只有凡瑞娜絲城的娜塔老師可以幫助你了，你應該知道她吧？她正在城下東區教導來自各地的採藥人呢！

		elseif ( CheckFlag( OwnerID(), 540333 ) == true ) then --如果會採藥
			LoadQuestOption( OwnerID() );		
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );--#我要如何才能快速地找到採集目標？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_HERB") , "LuaS_AFTER_GATHER_HERB", 0 );--#請告訴我關於提煉的事情。
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110471_2", 0 );--#還有哪裡可以學到其他生活技能？

		elseif ( CheckFlag( OwnerID(), 540333 ) ~= true ) then --如果不會採藥
			LoadQuestOption( OwnerID() );
			if CheckAcceptQuest( OwnerID() , 420672 ) == false then
				AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110471_1") , "LuaS_110471_1", 0 );--#我想學習採藥。
			end
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110471_2", 0 );--#還有哪裡可以學到其他生活技能？
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110471_RecipeList_Touch", 0 );--#我想看看你賣的配方。　--放在最外層讓不會的人也能看看能做什麼東西
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110471_1()

	SetSpeakDetail( OwnerID(), GetString ( "SD_110471_1" )   );

	--我想你做了明智的選擇，無論是食物、甜點或是煉金的藥水，草藥絕對是不可或缺的東西。

	--採集的方法很簡單，只要點擊你找到的草藥堆就行了。

	--草藥有時與地上的其他雜草有點像，常常會被忽略，你必須睜大眼睛細心地觀察。

	--這些有用的草藥，都是大自然賜予我們的恩物，在採集的時候要懷著感恩的心喔。
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110471_3", 0 );--
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110471_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110471_2" )   ); --其他生活技能？所有工作技能的協會都在凡瑞娜絲城內，那裡可以學到所有工作技能，啊！抱歉，你應該是要問這邊的老師吧？我可以教你採藥，白湖畔的伍德能教你伐木，更西邊的礦坑那邊的漢生老爹會教人挖礦，嗯......抱歉，我記得羅格鎮有會教製造的人，但我一時想不起來他們的名字。
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110471_0", 0 );--#返回上一頁
		
end
-------------------------------------------------------------------------------------------------------------------------

function LuaS_110471_3()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_HERBLISM_Dialog", 0 )
		
end
-------------------------------------------------------------------------------------------------------------------------