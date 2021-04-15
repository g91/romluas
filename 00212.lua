function LuaS_110386_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 2 , "make" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest 是代入orgid 取得 questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--控制對話內容--
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Alchemy ) >= 80 )  then --檢查有大師以上資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110386_5" )   );--#噫！你不要來找我啦！如果姐姐知道我以前的學生現在比我厲害，那我就慘了～快裝做不認識我！拜託啦！
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110386_4" )   );--#哇～你的程度已經那麼高了......應該可以叫你去找煉金術大師了.......不過姐姐跟我說不能告訴別人煉金術大師的消息，只能說那個人的消息在黑曜石要塞......抱歉了，我不知道為什麼姐姐要這樣子說，但如果想提升煉金術的能力，你就去黑曜石要塞看看吧！
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110386_3" )   );--#不行啦！你怎麼來找我，如果瑪莉姐姐知道了，一定又以為我偷教專精級的煉金術，這樣我就慘了；你要學的話，去找瑪莉姐姐，不要找我啦！
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 20 ) then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit then
			LoadQuestOption( OwnerID() );
		end
		--################################--
	else --0~40級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110386_0")   );
		--/*你好，我是歐克密斯特家族的艾莉，我希望大家都能樂於學習煉金，如果你有興趣的話我可以教你一些基礎。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110386_2", 0 ) --/*我想放棄目前的資格。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

	if ( CheckFlag( OwnerID(), 540338 ) == true ) then --如果會鍊金
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？			
	else  --如果不會鍊金
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110386_1") , "LuaS_110386_1", 0 );	--/*我想學習鍊金。
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110386_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110386_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110386_1")   );--/*太好了！又有生力軍加入我們煉金的行列了！
								--/*我先教你一些簡單的煉金配方，但是你想要進行煉金的話，必須要有煉金器具在身邊。
								--/*然後打開系統列中「生活技能」找到煉金列表，最後選擇你想要製作的藥水以及數量，就可以開始製作了。
								--/*啊！對了，還有你得準備材料，有些要在商店中買，有些採集時可以獲得，材料不夠是不行的。
								--/*嗯嗯...等等你就開始練習吧！
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110386_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110386_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_ALCHEMY", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110386_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110386_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_ALCHEMY_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------