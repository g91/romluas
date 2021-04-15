function LuaS_110412_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Carpenter   ) >= 80 )  then --檢查有大師以上資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110412_5" )   );--#你的名字......我好像聽過........嗯......在哪裡聽過呢？
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110412_4" )   );--#要增進木工技術啊？木工大師的消息在黑曜石要塞，你該去找......我為什麼要這樣說道？嗯......原因……我不記得了。
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter  ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110412_3" )   );--#我認得你嗎......？啊！你的木工技術很好，那你應該是要找我的哥哥吉恩的吧！他是專精級的木工導師呢！工匠級的導師......露易絲．卡本特？這個名字好熟喔......
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter  ) == 20 ) then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110412_2" )   );--#工匠級鐵匠找坎西......工匠級煉金師找艾莉......工匠級製甲師找凱特......工匠級木工......工匠級木工......唔～我好像有印象，但是想不起來耶！不過我好像記得......工匠級技術不可以超過六種......這是什麼意思啊？
		end
		--################################--
	else --0~40級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110412_0")   );
		--/*露易絲．卡本特？好熟的名字......啊！是我的名字.......
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter  ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG" ), "LuaS_110412_2", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Carpenter  ) > 0) then --如果會木工
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
	else  --如果不會木工
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110412_1" ), "LuaS_110412_1", 0 );	--/*我想學習木工。
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110412_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110412_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110412_1" )  );
	--/*木工啊？等等......我看看......木工......是一種需要耐心......細心的工作，你可以藉由木工製造......遠程.......法系的武器。習到配方......在木工器具附近......打開系統列中的「生活技能」......選擇「木工」......就可以製造......木製武器或......其他成品了。書上這樣寫......應該沒錯吧？
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110412_3", 0 );--
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110412_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_CARPENTER", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110412_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110412_3()

	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_CARPENTER_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------