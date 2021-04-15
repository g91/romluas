function LuaS_110415_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 3 , "collect" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest 是代入orgid 取得 questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--控制對話內容--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) > 80) then --檢查上限大於80的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110415_5" )   );--#你已經締造了傳說，我期待著更多關於你的傳說出現。
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 80 )then --檢查有大師資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110415_4" )   );--#能夠和你談論關於木頭的知識真是令人感到高興。
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110415_3" )   );--#你很上進，但如果你要再進一步，就必須接受考驗，伐木大師的考驗；而考驗的第一步就是找到他，唯一的消息在黑曜石要塞之中，有興趣的話就去看看吧！
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) < 40  then --等級小於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110415_2" )   );--#十分遺憾，我如果從基礎開始教你伐木，就沒有時間教導其他來尋求專精知識的人，不過幸運的是，那邊的入門導師洛桑能幫我分擔這個責任。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering  ) == 40 ) then  --等級等於40時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110415_1" )   );--#一個人要專精三樣以上的工作技能是不可能的，如果你有心學習更高深的伐木知識，你必須要有覺悟，把伐木當成三個你所能選擇的專精之一才行。
		end
		--################################--
	else --40~60級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110415_0")   );
		--/*專業的採集訓練師，路伯爾．卡特，關於木頭的知識我可以傳授給你，這就是我的工作。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110415_1", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110415_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110415_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_LUMBERING", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110415_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------