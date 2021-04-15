function LuaS_110407_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor ) > 80) then --檢查上限大於80的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110407_5" )   );--#實在了不起！看來我有問題的時候又多了一個可以請教的人啦！
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_MakeArmor ) == 80 )then --檢查有大師資格的話
		SetSpeakDetail( OwnerID(), GetString ( "ST_110407_4" )   );--#哈哈！看來你最近過得不錯喔！
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 60 ) then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID(), GetString ( "ST_110407_3" )   );--#呵呵～你的程度已經十分不錯了呢！有沒有興趣更進一步啊？我知道黑曜石要塞有個製甲大師的傳說喔！我是不知道那個大師是不是我認識的那個人啦！但他能被稱為大師，一定有足夠的實力能指導你的。
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) < 40  then --等級小於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110407_2" )   );--#哎呀？你來找我是想學基礎的製甲嗎？這方面你可以去找凱特，她雖然口中常常抱怨，但其實是個很認真的女孩呢！她一定會盡力教你東西的。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor  ) == 40 ) then  --等級等於40時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "ST_110407_1" )   );--#你看起來已經打算專精其他工作技能了呢！以後我碰到跟那些領域有關的問題你會幫我吧？哈哈！還是哪天你想把其中一個專精改成製甲的話，我也很樂意幫忙的喔！
		end
		--################################--
	else --40~60級的對話
		SetSpeakDetail( OwnerID(), GetString("ST_110407_0")   );
		--/*哈哈！有學到你想學的東西嗎？還是你想學更棒的？耐心點，凡事都得一步一步來，總有一天你能將我這裡的東西全部學去的。
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor) >= 40) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110407_1", 0 ) --/*我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*為何有時要降低資格？
	end 

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110407_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110407_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MAKEARMOR", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110407_0", 0 ); --/*我再考慮看看。

end
--------------------------------------------------------------------------------------------------------------------------