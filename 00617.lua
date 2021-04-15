function LuaS_110809_0()
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
		SetSpeakDetail( OwnerID(), GetString ( "ST_110809_5" )   );--#噫！你不要來找我啦！如果姐姐知道我以前的學生現在比我厲害，那我就慘了～快裝做不認識我！拜託啦！
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), "[SC_110809_MASTER_HINT]"  );--提示去達拉尼斯
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110809_3" )   );--#不行啦！你怎麼來找我，如果瑪莉姐姐知道了，一定又以為我偷教專精級的煉金術，這樣我就慘了；你要學的話，去找瑪莉姐姐，不要找我啦！
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 20 ) then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110809_2" )   );--#不行喔！本來還想說你的程度夠了，該教你一些新的東西，但你學了那麼多其他的工藝，這樣哪有可能專心學習煉金術嘛！
		end
		--################################--
	else --0~40級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110809_0")   );
		--/*你好，我是歐克密斯特家族的艾莉，我希望大家都能樂於學習煉金，如果你有興趣的話我可以教你一些基礎。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110809_2", 0 ) --/*我想放棄目前的資格。
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

	if ( CheckFlag( OwnerID(), 540338 ) == true ) then --如果會鍊金
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？			
	else  --如果不會鍊金
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110809_1") , "LuaS_110809_1", 0 );	--/*我想學習鍊金。
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110809_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110809_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110809_1")   );--/*太好了！又有生力軍加入我們煉金的行列了！
								--/*我先教你一些簡單的煉金配方，但是你想要進行煉金的話，必須要有煉金器具在身邊。
								--/*然後打開系統列中「生活技能」找到煉金列表，最後選擇你想要製作的藥水以及數量，就可以開始製作了。
								--/*啊！對了，還有你得準備材料，有些要在商店中買，有些採集時可以獲得，材料不夠是不行的。
								--/*嗯嗯...等等你就開始練習吧！
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110809_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110809_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_ALCHEMY", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110809_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110809_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_ALCHEMY_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------