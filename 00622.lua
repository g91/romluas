function LuaS_110813_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Tailor  ) >= 80 )  then --檢查有大師以上資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110813_5" )   );--#以閣下的程度，我已經無法以老師的身分來指導你了，但我們仍是朋友，希望有空的時候你能常回來談談裁縫。
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), "[SC_110813_MASTER_HINT]"  );--提示去達拉尼斯
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor  ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110813_3" )   );--#我很樂意繼續指導你這樣的學生，但這樣對你並不好，我的母親瑞秋夫人才能夠幫助你更進一步。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 20 ) then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110813_2" ) )  --#你的裁縫能力應該可以在更上層樓，不過你現在看起來並沒有多餘的心力可以學習更高深的裁縫技術；沒關係，等你需要更多裁縫的訓練的話，我隨時在這裡等候。
		end
		--################################--
	else --0~40級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110813_0")   );
		--/*裁縫師山姆．泰勒，很高興認識你，請問你是要訂做服裝呢？還是學習裁縫呢？
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG" ), "LuaS_110813_2", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Tailor  ) > 0) then --如果會裁縫
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
	else  --如果不會裁縫
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110813_1") , "LuaS_110813_1", 0 );	--/*我想學習裁縫。
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110813_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110813_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110813_1" )  );--/*好！現在就教你裁縫的基本。要做裁縫工作的話，身邊必須要有裁縫器具。然後你可以打開系統列中的「生活技能」選擇「裁縫」，只要材料準備齊全可以開始進行製造列表中的裁縫品了。

	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110813_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110813_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_TAILOR", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110813_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_110813_3()

	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_TAILOR_Dialog", 0 )

end