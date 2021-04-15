function LuaS_112963_0()
--控制對話內容--
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) >= 20  and CheckCompleteQuest( OwnerID() , 422265 ) == true then 
		if 	CheckAcceptQuest( OwnerID() , 422219 ) == true or
			CheckAcceptQuest( OwnerID() , 422240 ) == true or
			CheckAcceptQuest( OwnerID() , 422266 ) == true then
			LoadQuestOption( OwnerID() )
		else
			SetSpeakDetail( OwnerID(), "[SC_112963_2]" )
		end
	else
		LoadQuestOption( OwnerID() )
	end
--控制對話選項--
	if (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) > 0 ) then
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_GATHER_SAY]" , "LuaS_GATHER_SAY", 0 );--#我要如何才能快速地找到採集目標？
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_AFTER_GATHER_MINE]" , "LuaS_AFTER_GATHER_MINE", 0 );--#請告訴我關於精鍊的事情。			
	else  
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112963_0]" , "LuaS_112963_1", 0 )
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112963_1()

	SetSpeakDetail( OwnerID(), "[SC_112963_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112963_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112963_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_MINING", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_112963_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112963_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_MINING_Dialog", 0 )

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112964_0()
--控制對話內容--
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422221)==true)and( CheckFlag( OwnerID(), 542692 ) == false) and (CountBodyItem( OwnerID(), 204836 )>0)then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_0]","LuaS_422221_4",0)	
	end


	LoadQuestOption( OwnerID() )


--控制對話選項--
	if ( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) > 0 ) then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_GATHER_SAY]" , "LuaS_GATHER_SAY", 0 );--#我要如何才能快速地找到採集目標？
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_AFTER_GATHER_WOOD]" , "LuaS_AFTER_GATHER_WOOD", 0 );--#請告訴我關於精鍊的事情。			
	else  
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112964_0]" , "LuaS_112964_1", 0 )
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end


function LuaS_422221_4()
	SetSpeakDetail(OwnerID(),"[SC_422221_3]")
	DelBodyItem( OwnerID(), 204836, 1 )
	Setflag(OwnerID(),542692, 1)
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112964_1()

	SetSpeakDetail( OwnerID(), "[SC_112964_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112964_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112964_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_LUMBERING", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_112964_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112964_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_LUMBERING_Dialog", 0 )

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112965_0()
--控制對話內容--
	LoadQuestOption( OwnerID() )

--控制對話選項--
	if ( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism  ) > 0) then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_GATHER_SAY]" , "LuaS_GATHER_SAY", 0 );--#我要如何才能快速地找到採集目標？
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_AFTER_GATHER_HERB]" , "LuaS_AFTER_GATHER_HERB", 0 );--#請告訴我關於精鍊的事情。			
	else  
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112965_0]" , "LuaS_112965_1", 0 )
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112965_1()

	SetSpeakDetail( OwnerID(), "[SC_112965_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112965_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112965_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_HERBLISM", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_112965_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112965_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_HERBLISM_Dialog", 0 )

end
-----------------------------------------------------------------------------------------------------------------------------
function LuaS_112973_0()

	LoadQuestOption( OwnerID() );  -- 任務

	if CheckFlag( OwnerID() , 540002 )==false then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112973_0]", "LuaS_112973_2", 0 );--#我想學習分解術
	end
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112973_1]" , "LuaS_112973_1", 0 );--#我要如何使用「分解術」？
end

-------------------------------------------------------------------------------------------------------------------------

function LuaS_112973_1()

   	SetSpeakDetail( OwnerID(), "[SC_112973_2]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "LuaS_112973_0", 0 );--#返回上一頁
		
end
-------------------------------------------------------------------------------------------------------------------------

function LuaS_112973_2()

   	SetSpeakDetail( OwnerID(), "[SC_112973_3]"  );--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112973_3", 0 );--
		
end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_112973_3()

   	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_DISSOLUTION_Dialog", 0 )
		
end
-------------------------------------------------------------------------------------
function Lua_COM_RecipeList_Touch()
	CloseSpeak( OwnerID() )
	GetRecipeList( OwnerID() , TargetID() )	
end