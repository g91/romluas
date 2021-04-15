function LuaS_110389_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith  ) > 80) then --檢查上限大於80的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110389_5" )   );--#是嗎？你已經到達了這個境界了啊。我在這個領域中逃走了，但你卻能夠留了下來，或許是你還沒體會到我所體會的，不......或許是......你已經體會到我還未能體會的......
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_BlackSmith  ) == 80 )then --檢查有大師資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110389_4" )   );--#現在你已經走在自己的鐵匠之路上了，你要逃走也好，要承擔也好，但你不能冷漠，這等於捨棄鍛造師的尊嚴以及否定你所製造的武器，而否定自己作品的人就會像我一樣，我不希望再看到我身上的悲劇發生了。
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110389_3" )   );--#你的打鐵技術已經很不錯了，可以往更高的境界邁進，但我在鐵匠之路上已經是個垂死的人，無法在幫助你什麼了；你如果仍有心在這條路上前進，去黑曜石要塞吧！那裡有最棒的鐵匠，他們或許有人會知道誰能夠幫助你。
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) < 40  then --等級小於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110389_2" )   );--#你來是想跟我學打鐵嗎？我看你連鐵鎚都拿不好，你想學還是去找坎西吧！只要她不要又去跟哪個冒險者私會的話，應該就在這附近。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith  ) == 40 ) then  --等級等於40時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit then
			LoadQuestOption( OwnerID() );
		end
		--################################--
	else --40~60級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110389_0")   );--/*是，我是專業鐵匠導師；雖然我的工作是指導其他人技術，但我很懶，盡量不要來煩我。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith ) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110389_1", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110389_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110389_1()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_BLACKSMITH", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110389_0", 0 ); --/*我再考慮看看。

end
-------------------------------------------------------------------------------------------------------------------------