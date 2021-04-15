function LuaS_110390_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_MakeArmor   ) >= 80 )  then --檢查有大師以上資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110390_5" )   );--#製甲真的那麼有趣嗎？為什麼你能練到這種地步？為什麼我沒辦法......
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor  ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110390_4" )   );--#咦？不會吧！你已經有這種程度了？看樣子大師傅可能願意讓你學更多東西......誰是大師傅？就是製甲大師啊！只是我最近也沒他的消息，只聽說過前一陣子黑曜石要塞裡有人遇過他而已，你或許可以去那裡打聽看看。
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor  ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110390_3" )   );--#你還真是學不乖啊！竟然把製甲練到這種地步了～不過接下來的課程是專業導師卡提恩大哥的事情了，我繼續去忙自己的事囉！
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor  ) == 20 ) then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit then
			LoadQuestOption( OwnerID() );
		end
		--################################--
	else --0~40級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110390_0")   );--/*我是負責修繕警備隊鎧甲的凱特，不過我的工作也包括指導其他人製甲的技術。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor  ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110390_2", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_MakeArmor  ) > 0) then --如果會製甲
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？	
	else  --如果不會製甲
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110390_1") , "LuaS_110390_1", 0 );--/*我想學習製甲。
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110390_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110390_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110390_1" )  );--/*想不到這年頭還有人真的想學製甲，製甲很累的呢！
	--/*總之你必須先找到製甲器具，然後在器具旁邊打開你系統列中的「生活技能」選擇「製甲」，然後選擇你要製作的物品以及數量便可以開始製造了。
	--/*順便教你一些圖樣好了，這樣你就可以製作這些東西來練習。
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110390_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110390_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MAKEARMOR", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110390_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110390_3()

	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_MAKEARMOR_Dialog", 0 )


end
--------------------------------------------------------------------------------------------------------------------------