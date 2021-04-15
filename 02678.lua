function LuaS_119904_0()
--�����ܤ��e--
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
--�����ܿﶵ--
	if (ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) > 0 ) then
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_GATHER_SAY]" , "LuaS_GATHER_SAY", 0 );--#�ڭn�p��~��ֳt�a���Ķ��ؼСH
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_AFTER_GATHER_MINE]" , "LuaS_AFTER_GATHER_MINE", 0 );--#�Чi�D��������媺�Ʊ��C			
	else  
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112963_0]" , "LuaS_119904_1", 0 )
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_119904_1()

	SetSpeakDetail( OwnerID(), "[SC_112963_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_119904_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_119904_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_MINING", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_119904_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_119904_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_MINING_Dialog", 0 )

end


function LuaS_119906_0()
--�����ܤ��e--
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422221)==true)and( CheckFlag( OwnerID(), 542692 ) == false) and (CountBodyItem( OwnerID(), 204836 )>0)then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_0]","LuaS_422221_4",0)	
	end


	LoadQuestOption( OwnerID() )


--�����ܿﶵ--
	if ( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) > 0 ) then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_GATHER_SAY]" , "LuaS_GATHER_SAY", 0 );--#�ڭn�p��~��ֳt�a���Ķ��ؼСH
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_AFTER_GATHER_WOOD]" , "LuaS_AFTER_GATHER_WOOD", 0 );--#�Чi�D��������媺�Ʊ��C			
	else  
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112964_0]" , "LuaS_119906_1", 0 )
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end


--------------------------------------------------------------------------------------------------------------------------
function LuaS_119906_1()

	SetSpeakDetail( OwnerID(), "[SC_112964_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_119906_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_119906_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_LUMBERING", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_119906_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_119906_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_LUMBERING_Dialog", 0 )

end

function LuaS_119905_0()
--�����ܤ��e--
	LoadQuestOption( OwnerID() )

--�����ܿﶵ--
	if ( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism  ) > 0) then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_GATHER_SAY]" , "LuaS_GATHER_SAY", 0 );--#�ڭn�p��~��ֳt�a���Ķ��ؼСH
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_AFTER_GATHER_HERB]" , "LuaS_AFTER_GATHER_HERB", 0 );--#�Чi�D��������媺�Ʊ��C			
	else  
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112965_0]" , "LuaS_119905_1", 0 )
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_FORMULA_STORE]" , "Lua_COM_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_LIVING_SAY]" , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_119905_1()

	SetSpeakDetail( OwnerID(), "[SC_112965_1]"   )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_IKNOW]" , "LuaS_119905_3", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_119905_2()

	SetSpeakDetail( OwnerID(),"[ST_DEGRADE_WARN]" );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_DEGRADE_HERBLISM", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]", "LuaS_119905_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_119905_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_HERBLISM_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------


