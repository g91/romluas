function LuaS_115962_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 4 , "collect" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest 是代入orgid 取得 questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--控制對話內容--
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) == 80  then --等級小於60則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), "[ST_115962_2]"   );--#
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism  ) == 60 ) then  --等級等於60時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), "[ST_115962_1]"   );--#
		end
		--################################--
	else --60~80級的對話
		SetSpeakDetail( OwnerID(), "[ST_115962_0]"   );
		--/*
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_115962_1", 0 ) --/*我想放棄目前的資格
	end 

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_115962_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_HERBLISM", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_115962_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------