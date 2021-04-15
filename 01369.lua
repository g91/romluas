
-------------------------------------------------------------------------------------------------------------------------
function LuaS_112966_0()
--控制對話內容--
	LoadQuestOption( OwnerID() )

--控制對話選項--

	if ( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith   ) > 0) then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_LEARNING_SAY]" , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112966_0]" , "LuaS_112966_1", 0 );
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112966_1()

	SetSpeakDetail( OwnerID(), "[SC_112966_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112966_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112966_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_BLACKSMITH", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_112966_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112966_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_BLACKSMITH_Dialog", 0 )

end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_112967_0()
--控制對話內容--
	LoadQuestOption( OwnerID() )


--控制對話選項--
	if ( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter ) > 0) then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_LEARNING_SAY]" , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112967_0]" , "LuaS_112967_1", 0 )
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112967_1()

	SetSpeakDetail( OwnerID(), "[SC_112967_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112967_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112967_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_CARPENTER", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_112967_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112967_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_CARPENTER_Dialog", 0 )	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112968_0()
--控制對話內容--
	LoadQuestOption( OwnerID() )

--控制對話選項--
	if ( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) > 0 ) then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_LEARNING_SAY]"  , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112968_0]" , "LuaS_112968_1", 0 )
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112968_1()

	SetSpeakDetail( OwnerID(), "[SC_112968_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112968_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112968_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_ALCHEMY", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_112968_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112968_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_ALCHEMY_Dialog", 0 )	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112969_0()
--控制對話內容--
	LoadQuestOption( OwnerID() )


--控制對話選項--
	if (ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_MakeArmor  ) > 0) then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_LEARNING_SAY]"  , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112969_0]" , "LuaS_112969_1", 0 )
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112969_1()

	SetSpeakDetail( OwnerID(), "[SC_112969_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112969_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112969_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_MAKEARMOR", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_112969_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112969_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_MAKEARMOR_Dialog", 0 )	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112970_0()
--控制對話內容--
	LoadQuestOption( OwnerID() )

--控制對話選項--
	if (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook ) > 0) then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_LEARNING_SAY]" , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112970_0]" , "LuaS_112970_1", 0 )
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112970_1()

	SetSpeakDetail( OwnerID(), "[SC_112970_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112970_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112970_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_COOK", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_112970_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112970_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_COOK_Dialog", 0 )	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112971_0()
--控制對話內容--
	LoadQuestOption( OwnerID() )


--控制對話選項--
	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Tailor  ) > 0) then
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_LEARNING_SAY]" , "LuaS_LEARNING_SAY", 0 );--#我要怎麼學習新的製造或精鍊？
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112971_0]" , "LuaS_112971_1", 0 )
	end

--常態對話選項--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*我想看看你賣的配方。--讓不會的人也能看看能做什麼東西	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#什麼是生活技能？

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112971_1()

	SetSpeakDetail( OwnerID(), "[SC_112971_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_112971_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_112971_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*我必須提醒你，一但放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_TAILOR", 0 ); --/*確定。
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_112971_0", 0 ); --/*我再考慮看看。

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_112971_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_TAILOR_Dialog", 0 )	

end