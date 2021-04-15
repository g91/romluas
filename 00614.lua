function LuaS_110815_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 2 , "collect" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest 是代入orgid 取得 questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--控制對話內容--
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Lumbering ) >= 80 )  then --檢查有大師以上資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110815_5" )   );--#看來你真的很努力呢！現在大家都在談論這個世界又多了一個能征服傳說木材的人。
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), "[SC_110815_MASTER_HINT]"  );--提示去達拉尼斯
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110815_3" )   );--#你來找我學更多技術嗎？不過接下來的課程在專業導師路伯爾先生那裡，你應該去找他才
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering  ) == 20 ) then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110815_2" )   );--#你的技巧已經到達了瓶頸，但看你學了那麼多其他的技能，我看暫時也沒有多餘的心思學習更高深的伐木技術了。
		end
		--################################--
	else --0~40級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110815_0" )  );--/*我是伐木領班洛桑，如果你想學一些關於伐木的技巧，我可以教你。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110815_2", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

	if ( CheckFlag( OwnerID(), 540270) == true ) then --如果會伐木
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );  --#我要如何才能快速地找到採集目標？
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_WOOD") , "LuaS_AFTER_GATHER_WOOD", 0 ); --#請告訴我削製的事情。		
	else  --如果不會伐木
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110815_1" ), "LuaS_110815_1", 0 );	--/*我想學習伐木。
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110815_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110815_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110815_1")   );--/*伐木不是只要耗費體力就夠了，還有許多技巧在裡面。瞧不起伐木的人，會因為木頭而哭泣！
								--/*想要伐木必須先要有一把趁手的工具，我這裡剛好有多一把「劣質的伐木斧」，你就拿去吧！
								--/*然後你要將伐木斧裝備起來，找到可以砍伐的樹木後，對著樹木按下滑鼠左鍵就即可以了。
								--/*在實作中你會更了解這些動作，到城外去試試看吧！
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110815_3", 0 );--
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110815_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_LUMBERING", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110815_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110815_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_LUMBERING_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------