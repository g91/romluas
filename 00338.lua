function LuaS_110470_0()
		if CheckFlag( OwnerID(), 540359 )==true and CheckCompleteQuest(OwnerID() , 420673 ) == true then --檢查有大師資格的話
			SetSpeakDetail( OwnerID(), GetString ( "SD_110470_4" )   );--偉大的伐木者！請讓我為你獻上一首歌～

		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 60 and CheckCompleteQuest(OwnerID() , 420673 ) == true then --等級60提示要玩家去黑曜石要塞
			SetSpeakDetail( OwnerID(), GetString ( "SD_110470_3" )   );--喔喔！你的技能說不定已經可以去和傳說中的大師學習了！我知道黑曜石要塞可以得到他們的情報，你可以去那邊看看。

		elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) >= 20 and CheckCompleteQuest(OwnerID() , 420673 ) == true then --等級20以上提示要玩家去凡瑞娜絲
			SetSpeakDetail( OwnerID(), GetString ( "SD_110470_0" )   );--你是回來找我學唱歌的嗎？呦呵呵～啊？要追求伐木的知識？那你應該去凡瑞娜絲城找洛桑老師，不是來找我；我記得他在城下東區吧？採集類的工作技能導師都聚集在那裡呢！

		elseif ( CheckFlag( OwnerID(), 540270 ) == true ) then --如果會伐木
			LoadQuestOption( OwnerID() );
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );--#我要如何才能快速地找到採集目標？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_WOOD") , "LuaS_AFTER_GATHER_WOOD", 0 );--#請告訴我關於削製的事情
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110470_2", 0 );--#還有哪裡可以學到其他生活技能？

		elseif ( CheckFlag( OwnerID(), 540270 ) ~= true ) then --如果不會伐木
			LoadQuestOption( OwnerID() );
			if CheckAcceptQuest( OwnerID() , 420673 ) == false then
				AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110470_1") , "LuaS_110470_1", 0 );--#我想學習伐木。
			end
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
			AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_ASK_LIVINGSKILL") , "LuaS_110470_2", 0 );--#還有哪裡可以學到其他生活技能？
		else
			SetSpeakDetail( OwnerID(), GetString ( "SD_SCRIPT_DEBUG" )   )
		end
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_FORMULA_STORE") , "Lua_110470_RecipeList_Touch", 0 );--#我想看看你賣的配方。　--放在最外層讓不會的人也能看看能做什麼東西
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_110470_1()

	SetSpeakDetail( OwnerID(), GetString ( "SD_110470_1" )   );

		--你想學伐木？你不想連唱歌一起學嗎？唱歌才是我的專長噢～

		--什麼～？只想先學伐木啊？

		--好吧，伐木真的是很棒的技能喔！

		--伐木所得到的木頭，經過削製後，可以用來製造大多數的木製武器、防具以及其他器具。

		--只要點擊你所找到的樹叢就可以伐木了。

		--你現在就出發吧，我們伐木工就是說走就走噢～呵呵…
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110470_3", 0 );--#

end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110470_2()

   	SetSpeakDetail( OwnerID(), GetString ( "SD_110470_2" )   ); --#其他導師？西邊新礦坑那邊的漢生大叔有教挖礦，開墾聚落裡的愛麗絲妹妹是教採藥......等等，愛麗絲好像年紀比我大......對了，羅格鎮有幾個教製造的，至於凡瑞娜絲城，所有工作技能的導師那裡一定都有。
								
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_BACK") , "LuaS_110470_0", 0 );--#返回上一頁
		
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110470_3()

               CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_LUMBERING_Dialog", 0 )

		
end
-------------------------------------------------------------------------------------------------------------------------