function LuaS_110414_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism ) > 80) then --檢查上限大於80的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110414_5" )   );--#你是我最驕傲的學生！青出於藍更勝於藍啊！我是在太高興了！你知道嗎？每次聽到別人提起你的事情，我都感動莫名......真的......太令人感動了......
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Herblism ) == 80 )then --檢查有大師資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110414_4" )   );--#就是這樣子！就是這樣子！到達這個境界之後，就是要繼續學習！來吧！讓我們來談談那些藥草吧！
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110414_3" )   );--#你是個優秀的學生！優秀到我想把我所有的知識交給你，不知道你願不願意？唉！只有你願意也不行，還是得讓大師教導你那關鍵的部分才行，採藥大師你知道嗎？嗯，不知道也是應該的，畢竟連我也很久沒他的消息了，不過黑曜石要塞好像有人知道，說不定到那裡去你就能找到他了。
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) < 40  then --等級小於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110414_2" )   );--#你很有上進心！但是我不能就這樣教你，你也不能就這樣來學，千里之行始於足下，你必須先學會前面的課程，我才能夠教你後面的部份；至於前面的課程，我的學生娜塔是個很有耐心的人，她會仔細地教導你那些課程的。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism  ) == 40 ) then  --等級等於40時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110414_1" )   );--#不行！不行！你的草藥學程度已經遇到瓶頸了你知道嗎？我雖然可以教導你，但如果你想專精再另外三種工作上面的話，我在怎麼會教也是沒用的。
		end
		--################################--
	else --40~60級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110414_0")   );
		--/*專業的採集訓練師，赫伯．迪格，你好，我可以將你訓練成最棒的採藥師。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110414_1", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110414_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110414_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_HERBLISM", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110414_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------