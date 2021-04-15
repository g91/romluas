function LuaS_111618_0()
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
	    if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_MakeArmor ) >= 80 then	--檢查有大師以上資格的話
		SetSpeakDetail( OwnerID() , GetString("SC_111618_01") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 60 then	--等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID() , GetString("SC_111618_02") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) >= 40 then	--等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID() , GetString("SC_111618_03") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 20 then	--等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() )
		else	--告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID() , GetString ("SC_111618_04") )
		end
		--################################--
	else --0~40級的對話
		LoadQuestOption( OwnerID() )
	end

--控制對話選項--
	if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_MakeArmor ) >= 40 then
		AddSpeakOption( OwnerID(), TargetID() , GetString("SO_DEGRADE_DIALOG") , "LuaS_111618_2" , 0 )	--我想放棄目前的資格
		AddSpeakOption( OwnerID(), TargetID() , GetString("SO_DEGRADE_SAY") , "LuaS_DEGRADE" , 0 )	--為何有時要降低資格？
	end 

	if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_MakeArmor ) > 0 then		--如果會製甲
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 )	--我要怎麼學習新的製造或精鍊？
	else  --如果不會製甲
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110390_1") , "LuaS_111618_1", 0 )			--我想學習製甲。
	end

--常態對話選項--
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_FORMULA_STORE") , "Lua_111618_RecipeList_Touch", 0 )	--我想看看你賣的配方。--讓不會的人也能看看能做什麼東西
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 )			--什麼是生活技能？
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111618_1()
	SetSpeakDetail( OwnerID(), GetString("SC_111618_05" )  )
	--想不到這年頭還有人真的想學製甲，製甲很累的呢！
	--總之你必須先找到製甲器具，然後在器具旁邊打開你系統列中的「生活技能」選擇「製甲」，然後選擇你要製作的物品以及數量便可以開始製造了。
	--順便教你一些圖樣好了，這樣你就可以製作這些東西來練習。
	AddSpeakOption( OwnerID(), TargetID(), GetString ("SO_IKNOW") , "LuaS_111618_3", 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111618_2()
	SetSpeakDetail( OwnerID() , GetString("ST_DEGRADE_WARN") )	--我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_YES") , "LuaS_DEGRADE_MAKEARMOR", 0 )	--確定。
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_NO") , "LuaS_111618_0", 0 )		--我再考慮看看。
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111618_3()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() ,"LuaFunc_MAKEARMOR_Dialog", 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_111618_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_111618_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550620 ); --薄板胸甲
AddRecipe( OwnerID(), 550579 ); --皮製護腿
AddRecipe( OwnerID(), 550581 ); --皮甲
AddRecipe( OwnerID(), 550623 ); --粗銅護腿
AddRecipe( OwnerID(), 550582 ); --紋飾皮甲
AddRecipe( OwnerID(), 550625 ); --粗銅鏈甲
AddRecipe( OwnerID(), 550584 ); --野蠻皮甲
AddRecipe( OwnerID(), 550628 ); --直鏈護腿
AddRecipe( OwnerID(), 550585 ); --野蠻護腿
AddRecipe( OwnerID(), 550629 ); --直鏈甲
AddRecipe( OwnerID(), 550587 ); --豪邁皮甲
AddRecipe( OwnerID(), 550590 ); --獸護腿
AddRecipe( OwnerID(), 550630 ); --忠誠護腿
AddRecipe( OwnerID(), 550591 ); --獸皮甲
AddRecipe( OwnerID(), 550633 ); --沉重鏈甲
end

function Lua_111618_RecipeList_Touch()
	CloseSpeak( OwnerID() )
	GetRecipeList( OwnerID() , TargetID() )		-- GetRecipeList( Player, NPC )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111619_0()
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
	    if ReadRoleValue(OwnerID() , EM_RoleValue_SkillMax_Cook ) >= 80 then	--檢查有大師以上資格的話
		SetSpeakDetail( OwnerID() , GetString("SC_111619_01") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 60 then	--等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID() , GetString("SC_111619_02") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) >= 40 then	--等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID() , GetString("SC_111619_03") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 20 then	--等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() )
		else --告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "SC_111619_04" ) )
		end
		--################################--
	else --0~40級的對話
		LoadQuestOption( OwnerID() )
	end

--控制對話選項--
	if ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook ) >= 40 then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_DEGRADE_DIALOG") , "LuaS_111619_2" , 0 )	--我想放棄目前的資格
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_DEGRADE_SAY") , "LuaS_DEGRADE" , 0 )	--為何有時要降低資格？
	end 

	if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Cook ) > 0 then	--如果會烹飪
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LEARNING_SAY") , "LuaS_LEARNING_SAY" , 0 )	--我要怎麼學習新的製造或精鍊？
	else	--如果不會烹飪
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110388_1") , "LuaS_111619_1" , 0 )		--我想學習烹飪。
	end

--常態對話選項--
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_FORMULA_STORE") , "Lua_111619_RecipeList_Touch" , 0 )	--我想看看你賣的配方。--讓不會的人也能看看能做什麼東西
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LIVING_SAY") , "LuaS_LIVING_SAY" , 0 )			--什麼是生活技能？
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111619_1()
	SetSpeakDetail( OwnerID() , GetString("SC_111619_05") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_IKNOW") , "LuaS_111619_3" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111619_2()
	SetSpeakDetail( OwnerID() , GetString("ST_DEGRADE_WARN") )	--我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_YES") , "LuaS_DEGRADE_COOK" , 0 )		--確定。
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_NO") , "LuaS_111619_0" , 0 )		--我再考慮看看。
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111619_3()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaFunc_COOK_Dialog" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_111619_RecipeList_Init()
--	SetPlot( OwnerID() , "Touch" , "Lua_111619_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550432 ); --烤魚
AddRecipe( OwnerID(), 550434 ); --酸酪果
AddRecipe( OwnerID(), 550436 ); --烤肉
AddRecipe( OwnerID(), 550438 ); --香草果子
AddRecipe( OwnerID(), 550440 ); --醃魚
AddRecipe( OwnerID(), 550442 ); --炸甜麵圈
AddRecipe( OwnerID(), 550444 ); --燻肉
AddRecipe( OwnerID(), 550446 ); --果醬麵包
AddRecipe( OwnerID(), 550448 ); --蜜汁燒鳥
AddRecipe( OwnerID(), 550450 ); --大蒜麵包
AddRecipe( OwnerID(), 550452 ); --魚卵三明治
AddRecipe( OwnerID(), 550454 ); --肉餡麵包
AddRecipe( OwnerID(), 550456 ); --奶油海鮮派
--AddRecipe( OwnerID(),  ); --磨菇派
AddRecipe( OwnerID(), 550460 ); --肉醬捲餅
AddRecipe( OwnerID(), 550462 ); --水晶糖
AddRecipe( OwnerID(), 550464 ); --沼澤雜燴
AddRecipe( OwnerID(), 550466 ); --奇異水果派
AddRecipe( OwnerID(), 550468 ); --蟲肉海鮮沙拉
AddRecipe( OwnerID(), 550470 ); --翠綠軟糕
AddRecipe( OwnerID(), 550472 ); --將軍三色香腸
end

function Lua_111619_RecipeList_Touch()
	CloseSpeak( OwnerID() )
	GetRecipeList( OwnerID() , TargetID() )		-- GetRecipeList( Player , NPC )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111620_0()
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
	    if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Tailor ) >= 80 then --檢查有大師以上資格的話
		SetSpeakDetail( OwnerID() , GetString("SC_111620_01") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 60 then  --等級60提示要玩家去黑曜石要塞
		SetSpeakDetail( OwnerID() , GetString("SC_111620_02") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) >= 40  then --等級大於40則叫玩家去找另一個NPC
		SetSpeakDetail( OwnerID() , GetString("SC_111620_03") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 20 then  --等級等於20時判斷是否可接任務
		--###技能達到進階標準時加入任務###--
		if not tolimit  then
			LoadQuestOption( OwnerID() )
		else	--告知玩家所學工作技能超過了
			SetSpeakDetail( OwnerID(), GetString ( "SC_111620_04" ) )
		end
		--################################--
	else	--0~40級的對話
		LoadQuestOption( OwnerID() )
	end

--控制對話選項--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor ) >= 40) then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_DEGRADE_DIALOG") , "LuaS_111620_2" , 0 )	--我想放棄目前的資格
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_DEGRADE_SAY") , "LuaS_DEGRADE" , 0 )	--為何有時要降低資格？
	end 

	if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Tailor ) > 0 then	--如果會裁縫
		AddSpeakOption( OwnerID() , TargetID() , GetString ("SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 )	--我要怎麼學習新的製造或精鍊？
	else	--如果不會裁縫
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110417_1") , "LuaS_111620_1", 0 )			--我想學習裁縫。
	end

--常態對話選項--
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_FORMULA_STORE") , "Lua_111620_RecipeList_Touch" , 0 )	--我想看看你賣的配方。--讓不會的人也能看看能做什麼東西
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LIVING_SAY") , "LuaS_LIVING_SAY" , 0 )			--什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111620_1()
	SetSpeakDetail( OwnerID(), GetString("SC_111620_05") )
	AddSpeakOption( OwnerID() , TargetID() , GetString ( "SO_IKNOW") , "LuaS_111620_3" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111620_2()
	SetSpeakDetail( OwnerID() , GetString("ST_DEGRADE_WARN") )	--我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_YES") , "LuaS_DEGRADE_TAILOR" , 0 )	--確定。
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_NO") , "LuaS_111620_0" , 0 )		--我再考慮看看。
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111620_3()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaFunc_TAILOR_Dialog" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_111620_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_111620_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550484 ); --粗布褲
AddRecipe( OwnerID(), 550486 ); --粗布衣
AddRecipe( OwnerID(), 550536 ); --法力之褲
AddRecipe( OwnerID(), 550538 ); --短法袍
AddRecipe( OwnerID(), 550488 ); --幻紫披風
AddRecipe( OwnerID(), 550489 ); --線織褲
AddRecipe( OwnerID(), 550540 ); --青蓮法袍
AddRecipe( OwnerID(), 550492 ); --線織衣
AddRecipe( OwnerID(), 550493 ); --青蓮褲
AddRecipe( OwnerID(), 550543 ); --潮汐之褲
AddRecipe( OwnerID(), 550495 ); --迷魂衣
AddRecipe( OwnerID(), 550544 ); --潮汐短袍
AddRecipe( OwnerID(), 550545 ); --誘惑短褲
AddRecipe( OwnerID(), 550496 ); --彩光披風
AddRecipe( OwnerID(), 550548 ); --誘惑之袍
AddRecipe( OwnerID(), 550498 ); --白棉褲
AddRecipe( OwnerID(), 550499 ); --寧靜披風
AddRecipe( OwnerID(), 550502 ); --白棉衣
AddRecipe( OwnerID(), 550505 ); --紅蓮褲
AddRecipe( OwnerID(), 550551 ); --恆星之褲
AddRecipe( OwnerID(), 550506 ); --紅蓮衣
AddRecipe( OwnerID(), 550553 ); --恆星短袍
AddRecipe( OwnerID(), 550555 ); --微塵之褲
AddRecipe( OwnerID(), 550508 ); --幻音披風
AddRecipe( OwnerID(), 550556 ); --微塵短袍
AddRecipe( OwnerID(), 550509 ); --綠葉之衣
AddRecipe( OwnerID(), 550558 ); --專注之褲
AddRecipe( OwnerID(), 550510 ); --綠葉褲
AddRecipe( OwnerID(), 550514 ); --光榮披風
AddRecipe( OwnerID(), 550513 ); --麻布帽
AddRecipe( OwnerID(), 550559 ); --晨光短袍
AddRecipe( OwnerID(), 550516 ); --貴族衣
AddRecipe( OwnerID(), 550560 ); --晨光之褲
AddRecipe( OwnerID(), 550517 ); --軟絨帽
AddRecipe( OwnerID(), 550563 ); --絨布頭巾
AddRecipe( OwnerID(), 550518 ); --藍焰披風
AddRecipe( OwnerID(), 550565 ); --信念之褲

end

function Lua_111620_RecipeList_Touch()
	CloseSpeak( OwnerID() )
	GetRecipeList( OwnerID() , TargetID() )		-- GetRecipeList( Player, NPC )
end