function LuaS_110411_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 3 , "make" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest 是代入orgid 取得 questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--控制對話內容--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook ) > 80) then --檢查上限大於80的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110411_5" )   );--#站在頂點的感覺如何？那裡的景色還不是我所能見識的，你能告訴我，還有能讓我們的廚師靈魂繼續追求的，更偉大的境界嗎？
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Cook ) == 80 )then --檢查有大師資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110411_4" )   );--#你也能體會到美食的偉大境界了吧！但這還不是頂點，烹飪就是冒險！千萬別失去追求冒險的心啊！
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110411_3" )   );--#真正的廚師啊～應該要去雲遊四方！我因為一些責任而停留於此，但我的朋友正在某處追尋我所不知道的美食，如果你需要看到超越現在的風景，就去找他吧！去找那個被稱為烹飪大師的人！我最後得到的消息，我他曾經在黑曜石要塞待過一陣子，那裡應該有他的線索。
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) < 40  then --等級小於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110411_2" )   );--#嗯～美味！是這個美味的餐點帶領你來到我面前的嗎？想自己製作這樣的美味嗎？去學習吧！去跟馬林學習吧！只有進入美食之門的人，我才能夠將美食的奧秘展開在他的面前！
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook  ) == 40 ) then  --等級等於40時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110411_1" )   );--#你烹飪的熱情還在嗎？想繼續追求更美味神奇的食物嗎？你想成為專精的一份子嗎？為了尋求烹飪的專精，需要割捨對其他工作技能的喜好，你只能選擇保留其他兩個專精的工作技能；如果這不是你所需要的，那就離開吧！但你隨時都可以回來，重新回到烹飪之道上。
		end
		--################################--
	else --40~60級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110411_0")   );
		--/*你聞到這道菜的香味了嗎？沒看到菜？當然，因為我還沒煮，但真正的廚師在菜做出來之前，就已經可以聞到這道菜的香、嘗到這道菜的味。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110411_1", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110411_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110411_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_COOK", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110411_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------