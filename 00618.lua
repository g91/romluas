function LuaS_110812_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Cook  ) >= 80 )  then --檢查有大師以上資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110812_5" )   );--#站住！讓我好好的欣賞你～真是傑作啊！喔～我不是在欣賞你的衣服，而是你身為頂級廚師的魂魄啊！看不到嗎？那如火焰般燃燒的靈魂！
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), "[SC_110812_MASTER_HINT]"  );--提示去達拉尼斯
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook  ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110812_3" )   );--#酷斃了！現在你掌握食物的能力已經火侯十足了！你應該去向卡爾迪西先生請教，去學習他的藝術吧！
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook  ) == 20 ) then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110812_2" )   );--#喔～不行！你這樣子不夠優雅！太雜了！太多其他的工作技能了！這樣你沒辦法達到更高深的烹飪境界。
		end
		--################################--
	else --0~40級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110812_0")   );--/*太美味了！我的人生就是為了追求極至的美味，你也想與我一起來向這美好的目標邁進嗎？
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110812_2", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Cook ) > 0) then --如果會烹飪
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？		
	else  --如果不會烹飪
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110812_1") , "LuaS_110812_1", 0 );	--/*我想學習烹飪。
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110812_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？


end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110812_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110812_1")   );
	--/*烹飪是帶給人們活力的技術，現在就讓我們一起進入烹飪的世界吧！
	--/*打開系統列中的「生活技能」選擇烹飪，你就可以看到你所有可以做的食物或甜食。當身邊有烹飪器具，並且材料都準備好的時候，就可以開始烹飪了。
	--/*你就先用剛剛學會的基本烹飪試試看吧！
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110812_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110812_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_COOK", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110812_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110812_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_COOK_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------