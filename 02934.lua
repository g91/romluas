--EM_RoleValue_Skill_BlackSmith 	= Value; Value = Value + 1;	--15	打鐵
--EM_RoleValue_Skill_Carpenter 	= Value; Value = Value + 1;	--16	木工
--EM_RoleValue_Skill_MakeArmor 	= Value; Value = Value + 1;	--17	製甲
--EM_RoleValue_Skill_Tailor	= Value; Value = Value + 1;	--18	裁縫
--EM_RoleValue_Skill_Cook	= Value; Value = Value + 1;	--19	烹飪
--EM_RoleValue_Skill_Alchemy	= Value; Value = Value + 1;	--20	煉金
--EM_RoleValue_Skill_Mining	= Value; Value = Value + 1;	--21	挖礦
--EM_RoleValue_Skill_Lumbering	= Value; Value = Value + 1;	--22	伐木
--EM_RoleValue_Skill_Herblism	= Value; Value = Value + 1;	--23	採藥


--傳奇_煉金_0
function LuaS_122403_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--對話內容顯示
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--恭喜你了，你已經在這個領域之中到達了最高的境界。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy  ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--在同一件事情上專心，才能到遠登峰造極的境界，但是你所學太多了。
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122403]" );
	end

	--對話選項控制：我想放棄目前的資格
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Alchemy ) >= 60) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122403_1", 0 )
	end 

	--常態對話選項：我想看看你賣的配方：不賣傳奇配方
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )	

end
--傳奇_煉金_1
function LuaS_122403_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_ALCHEMY", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122403_0", 0 ); --/*我再考慮看看。

end
-------------------------------------------------------------------------------------------------------------------------
--傳奇_烹飪_0
function LuaS_122404_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--對話內容顯示
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--恭喜你了，你已經在這個領域之中到達了最高的境界。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--在同一件事情上專心，才能到遠登峰造極的境界，但是你所學太多了。
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122404]" );
	end

	--對話選項控制：我想放棄目前的資格
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Cook ) >= 60) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122404_1", 0 )
	end 

	--常態對話選項：我想看看你賣的配方：不賣傳奇配方
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )	

end
--傳奇_烹飪_1
function LuaS_122404_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_COOK", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122404_0", 0 ); --/*我再考慮看看。

end
-------------------------------------------------------------------------------------------------------------------------
--傳奇_木工_0
function LuaS_122405_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--對話內容顯示
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--恭喜你了，你已經在這個領域之中到達了最高的境界。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--在同一件事情上專心，才能到遠登峰造極的境界，但是你所學太多了。
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122405]" );
	end

	--對話選項控制：我想放棄目前的資格
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Carpenter ) >= 60) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122405_1", 0 )
	end 

	--常態對話選項：我想看看你賣的配方：不賣傳奇配方
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )	

end
--傳奇_木工_1
function LuaS_122405_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_CARPENTER", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122405_0", 0 ); --/*我再考慮看看。

end
-------------------------------------------------------------------------------------------------------------------------
--傳奇_打鐵_0
function LuaS_122406_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--對話內容顯示
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--恭喜你了，你已經在這個領域之中到達了最高的境界。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--在同一件事情上專心，才能到遠登峰造極的境界，但是你所學太多了。
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122406]" );
	end

	--對話選項控制：我想放棄目前的資格
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_BlackSmith ) >= 60) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122406_1", 0 )
	end 
	--常態對話選項：我想看看你賣的配方：不賣傳奇配方
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )	
end
--傳奇_打鐵_1
function LuaS_122406_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_BLACKSMITH", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122406_0", 0 ); --/*我再考慮看看。

end
-------------------------------------------------------------------------------------------------------------------------
--傳奇_裁縫_0
function LuaS_122407_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--對話內容顯示
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--恭喜你了，你已經在這個領域之中到達了最高的境界。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--在同一件事情上專心，才能到遠登峰造極的境界，但是你所學太多了。
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122407]" );
	end

	--對話選項控制：我想放棄目前的資格
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Tailor ) >= 60) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122407_1", 0 )
	end 
	--常態對話選項：我想看看你賣的配方：不賣傳奇配方
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--傳奇_裁縫_1
function LuaS_122407_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_TAILOR", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122407_0", 0 ); --/*我再考慮看看。
end
-------------------------------------------------------------------------------------------------------------------------
--傳奇_甲胄_0
function LuaS_122408_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--對話內容顯示
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--恭喜你了，你已經在這個領域之中到達了最高的境界。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--在同一件事情上專心，才能到遠登峰造極的境界，但是你所學太多了。
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122408]" );
	end

	--對話選項控制：我想放棄目前的資格
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_MakeArmor ) >= 60) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122408_1", 0 )
	end 
	--常態對話選項：我想看看你賣的配方：不賣傳奇配方
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--傳奇_甲胄_1
function LuaS_122408_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MAKEARMOR", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122408_0", 0 ); --/*我再考慮看看。
end
-------------------------------------------------------------------------------------------------------------------------
--傳奇_採草_0
function LuaS_122409_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "collect" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--對話內容顯示
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--恭喜你了，你已經在這個領域之中到達了最高的境界。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--在同一件事情上專心，才能到遠登峰造極的境界，但是你所學太多了。
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122409]" );
	end

	--對話選項控制：我想放棄目前的資格
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Herblism ) >= 60) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122409_1", 0 )
	end 
	--常態對話選項：我想看看你賣的配方：不賣傳奇配方
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--傳奇_採草_1
function LuaS_122409_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_HERBLISM", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122409_0", 0 ); --/*我再考慮看看。
end
-------------------------------------------------------------------------------------------------------------------------
--傳奇_伐木_0
function LuaS_122410_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "collect" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--對話內容顯示
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--恭喜你了，你已經在這個領域之中到達了最高的境界。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--在同一件事情上專心，才能到遠登峰造極的境界，但是你所學太多了。
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122410]" );
	end

	--對話選項控制：我想放棄目前的資格
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Lumbering ) >= 60) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122410_1", 0 )
	end 
	--常態對話選項：我想看看你賣的配方：不賣傳奇配方
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--傳奇_伐木_1
function LuaS_122410_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_LUMBERING", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122410_0", 0 ); --/*我再考慮看看。
end
-------------------------------------------------------------------------------------------------------------------------
--傳奇_挖礦_0
function LuaS_122411_0()
	--如果玩家可用生活技能任務上限已滿，刪除它
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "collect" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--對話內容顯示
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--恭喜你了，你已經在這個領域之中到達了最高的境界。
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--在同一件事情上專心，才能到遠登峰造極的境界，但是你所學太多了。
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122411]" );
	end

	--對話選項控制：我想放棄目前的資格
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Mining ) >= 60) then --擁有工匠以上資格則出現可以放棄資格的選項
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122411_1", 0 )
	end 
	--常態對話選項：我想看看你賣的配方：不賣傳奇配方
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--傳奇_挖礦_1
function LuaS_122411_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MINING", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122411_0", 0 ); --/*我再考慮看看。
end
-------------------------------------------------------------------------------------------------------------------------