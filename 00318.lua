function LuaS_110409_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_BlackSmith  ) == 80 )  then --檢查有大師資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110409_5" )   );--#最熱騰騰的傳說，技術高超的鐵匠，你的故事都已經被那些傭兵說到爛了。總之，恭喜，你成為一個十分優秀的鐵匠了呢！
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110409_4" )   );--#嗯...要讓你的打鐵更進一步啊？那大概只有那個被稱為打鐵大師的......不過他的事我不想多提。抱歉，你自己去黑曜石要塞問吧！
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110409_3" )   );--#喂喂～我和你之間的教學關係已經結束啦！接下來再找我要另外收費囉！你應該去找那邊老是擺張臭臉的專精導師布拉格才對。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith  ) == 20 ) then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110409_2" )   );--#真是受不了你們，這麼快就放棄繼續深造打鐵啦？不過人各有志嘛！其他地方也加油囉！
		end
		--################################--
	else --0~40級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110409_0")   );
		--/*我是鐵匠坎西．史密斯，不要看我沒穿工作服就懷疑我的技術，很多傭兵都指名我替他們打造兵器呢！也有不少人找我學打鐵喔！
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110409_2", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_BlackSmith ) > 0) then --如果會打鐵
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？	
	else  --如果不會打鐵
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110409_1") , "LuaS_110409_1", 0 );	--/*我真的很想學打鐵。
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110409_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110409_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110409_1")   );--/*希望你不是抱著玩玩的心態，不然我們也不必浪費時間了。
								--打開系統列中的「生活技能」選擇「打鐵」，看看你想製造的東西需要需要哪些材料，如果你身邊有打鐵器具的話就可以進行製造了。
								--我只教製造一些簡單的東西，其他就要靠你自己了。

	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110409_3", 0 );--
	
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110409_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_BLACKSMITH", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110409_0", 0 ); --/*我再考慮看看。

end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110409_3()

	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_BLACKSMITH_Dialog", 0 )


end