function LuaS_110017_0()
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 2 , "collect" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest 是代入orgid 取得 questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			--如果玩家可用生活技能任務上限已滿，刪除它
			DeleteQuest(OwnerID(), questid);
		end
	end
--控制對話內容--
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Mining ) >= 80 )  then --檢查有大師以上資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110017_5" )   );--#了不起！你的成就已經超過我了！
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110017_4" )   );--#如果你想往更高境界邁進，就去尋找傳說中的礦物大師吧！聽說黑曜石要塞有他的消息。
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110017_3" )   );--#哈哈！我的程度沒辦法再教你什麼了，你該去找專業導師邁恩．迪格學習了吧！
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining  ) == 20 ) then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if CheckFlag( OwnerID(),540340 ) then
			SetSpeakDetail( OwnerID(), GetString ( "ST_110017_0" )   );--/*我就是礦工工頭歐路特，關於挖礦的事情儘管問我！我不一定答得出來就是了，哈哈！
		elseif not tolimit then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了限制
			SetSpeakDetail( OwnerID(), GetString ( "ST_110017_2" )   );--#你的技能已經鍛鍊的很不錯啦！可惜，你學了太多其他的技能，這樣我就沒辦法傳授你工匠的秘訣囉！
		end
		--################################--
	else --0~40級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110017_0")   );--/*我就是礦工工頭歐路特，關於挖礦的事情儘管問我！我不一定答得出來就是了，哈哈！
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110017_2", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

	if ( CheckFlag( OwnerID(), 540269 ) == true ) then --如果會採礦
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );--#我要如何才能快速地找到採集目標？
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_MINE") , "LuaS_AFTER_GATHER_MINE", 0 );--#請告訴我關於精鍊的事情。			
	else  --如果不會採礦
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110017_1") , "LuaS_110017_1", 0 );--#我想學習挖礦。
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110017_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110017_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110017_1")   );--/*你想學挖礦啊！我的確可以教你一點基礎的，但挖礦很辛苦喔！
								--/*首先，你必須有一個工具，我先送你一個吧！
								--/*你要將這個「粗糙的十字鎬」裝備起來，然後對礦堆點擊左鍵就可以挖礦了。
								--/*我就教你這些，接下來你就找一塊礦堆實際演練吧！
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110017_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110017_2()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MINING", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110017_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_110017_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_MINING_Dialog", 0 )

end

--------------------------------------------------------------------------------------------------------------------------