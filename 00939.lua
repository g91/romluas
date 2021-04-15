----------------------------------------------------------------------------------------�����Ȥ�������
function lua_star_202680_check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 421335 ) == false or CheckCompleteQuest( OwnerID() , 421335 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421335_0")  , 0 ) --/*���Ȥ��ŦX�C
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421335_0")  , 0 ) --/*���Ȥ��ŦX�C
		return false
	elseif CheckID( TargetID() ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421335_1") ,  0 ) --/*�A�S���ؼСC
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421335_1") ,  0 ) --/*�A�S���ؼСC
		return false 
	elseif Target ~= 100871  or TargetID() == OwnerID() then 	
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421335_2") , 0 )   --/*�������u�������B��r���ϥ�
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421335_2") , 0 )   --/*
		return false
	elseif CheckBuff( TargetID() , 501610 )	== true then 
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421335_8") , 0 )   --/*������Q�E�㪺�r���L��
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421335_8") , 0 )   --/*
		return false
	elseif CheckFlag( OwnerID() , 542126) == true then	
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421335_9") , 0 )   --/*�������ĤO�@���u��v�T�@�Y�r���I
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421335_9") , 0 )   --/*
		return false
	elseif CheckDistance( OwnerID(), TargetID() , 60 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_421335_10") , 0 )  ----�A�n�a��@�I�I
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421335_10") , 0 )
		return false
    	else
       		 return true
	end

end

function lua_star_202680_effect()
	local berserk_chance = rand(99)
	if berserk_chance < 50 then
		ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421335_5") , 0 )  ----�A���\���g�b�F�@�Y�r���I
		ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421335_5") , 0 )
		local elephant = lua_star_CreateNPC( TargetID() , 0 , 101051 , 0 , 0 )
		BeginPlot(TargetID() , "Lua_star_100871_Reset" , 0 )
		SetFollow(elephant , OwnerID())
		SetFlag( OwnerID() , 542126 , 1)
		BeginPlot(elephant , "lua_star_101051_follow" , 0)
	else
		ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421335_6") , 0 )  ----�A�E��F�o�Y�r���I
		ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421335_6") , 0 )
		CastSpell( TargetID() , TargetID() , 491924)
	end	
end

function Lua_star_100871_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

function lua_star_101051_follow()
	--Say(OwnerID() , TargetID() )
	for i=0 , 1200 , 1 do
		sleep(10)
		if CheckFlag( TargetID() , 542126) == false then
			Delobj( OwnerID() )
		else
			if CheckDistance( OwnerID(), TargetID() , 120 ) == false then
				ScriptMessage( TargetID(), TargetID(), 0 , GetString("SC_421335_7") , 0 )  ----�ѩ�r�����A�ӻ��A�e���A���A�������v�T�I
				ScriptMessage( TargetID(), TargetID(), 1 , GetString("SC_421335_7") , 0 )
				SetFlag( TargetID() , 542126 , 0)
				Delobj( OwnerID() )
			end
		end	
	end
end

function lua_star_111287_questinitial()
	SetPlot( OwnerID() ,"Range","lua_star_111287_questcheck" , 60 )
end

function lua_star_111287_questcheck()
	if CheckFlag( OwnerID() ,542126 ) == true then
		if CountBodyItem( OwnerID(), 202819 ) < 11 then
			SetFlag( OwnerID() , 542126 , 0)
			--ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421335_3") , 0 )  
			ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421335_3") , 0 )
			Say( TargetID() , GetString("SC_421335_3") )                              --------�����ܦn�A�[�o�I  
			GiveBodyItem( OwnerID(), 202819 , 1)
		else
			ScriptMessage( OwnerID(), OwnerID(), 0 , GetString("SC_421335_4") , 0 )  ----�A�w�g�����F8�Y�����B��r���A���ݭn��h�o�I
			ScriptMessage( OwnerID(), OwnerID(), 1 , GetString("SC_421335_4") , 0 )	
			SetFlag( OwnerID() , 542126 , 0)
		end	
	end	
end

