function LuaS_110406_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy  ) > 80) then --檢查上限大於80的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110406_5" )   );--#騙人！你是真貨嗎？你真的是那個新的傳奇煉金師嗎？
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Alchemy  ) == 80 )then --檢查有大師資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110406_4" )   );--#唉呀呀～沒想到和我同等級的煉金師也要來請教我，我真是對自己的才能感到驚奇啊！
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110406_3" )   );--#喔～你看起來對煉金術已經蠻有心得了嘛！雖然還是比不上我瑪莉啦！但我一向樂於提拔後進，我就告訴你黑曜石要塞那裡可以找到煉金術大師的消息吧！不過大師的名字呢.....是秘～密～答案你應該自己去找出來喔～
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) < 40  then --等級小於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110406_2" )   );--#基本的煉金術要找艾莉學喔！雖然她還不成熟，但請不用擔心，我瑪莉會好好盯著她教你
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 40 ) then  --等級等於40時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110406_1" )   );--#唉呀！又有人來找本小姐了！不過啊～如果你是有事要我幫忙，我的行程已經排到下個月了，如果你想找我學習專業的煉金術，你先看看自己的斤兩吧！你以為你能學超過三個專精技能嗎？
		end
		--################################--
	else --40~60級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110406_0")   );
		--/*嗯？你叫住本小姐是想做什麼？啊哈！你知道本小姐是煉金世家歐克密斯特家族中最有智慧的人，所以想要找我學習是吧！
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110406_1", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110406_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110406_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_ALCHEMY", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110406_0", 0 ); --/*我再考慮看看。
end
--------------------------------------------------------------------------------------------------------------------------