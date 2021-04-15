function LuaS_110391_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor  ) > 80) then --檢查上限大於80的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110391_5" )   );--#能夠見到你是我的榮幸，請問有任何事我可以幫上忙的嗎？
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Tailor   ) == 80 )then --檢查有大師資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110391_4" )   );--#你好！又來找尋新的裁縫知識了嗎？我很樂意跟像你這樣優秀的裁縫大師分享這些知識。
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110391_3" )   );--#恭喜！你的裁縫技術已經很耀眼了呢！我很慚愧自己無法再幫助你更上一層樓，不過據說有個傳說的裁縫大師能幫助你，遺憾的是我只知道黑曜石要塞曾經有他的消息，沒能幫上忙實在很抱歉。
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor  ) < 40  then --等級小於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110391_2" )   );--#你是來學裁縫的嗎？不用太著急，看你還挺有心的，我的兒子山姆是入門導師，你可以先到他那裡學一些實用的技術，等你將他的手藝學全了，我或許能夠再幫助你更進一步。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor  ) == 40 ) then  --等級等於40時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit then
			LoadQuestOption( OwnerID() );
		end
		--################################--
	else --40~60級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110391_0" )  );
		--/*你好，我是泰勒家的瑞秋，負責管理這個城市內裁縫工匠組織，如果你對這方面有興趣，我也可以教你一些簡單的技巧。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor ) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110391_1", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110391_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110391_1()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_TAILOR", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110391_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------