function Lua_BearKing_deadlog()
	Discowood_OnlyOne_Check()
	SetPlot( OwnerID() , "dead" , "Lua_BearKing_Dead" , 0 );
end
function Lua_BearKing_Dead()
	local HateC = HateListCount( OwnerID() )
	local Attack = {}
	local PlayerLV = {}
	local PlayerSUBLV = {}
	for i=1, HateC do
		Attack[i] = HateListInfo(OwnerID() , i-1 , EM_HateListInfoType_GItemID)
		local PlayerLV = ReadRoleValue( Attack[i] , EM_RoleValue_LV )
		local PlayerSUBLV = ReadRoleValue( Attack[i] , EM_RoleValue_LV_SUB )
		DesignLog(OwnerID(),101280,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
		if PlayerLV == 10 then
			if CountBodyItem( Attack[i] , 530018 ) >= 1 then
			else
				GiveBodyItem ( Attack[i] , 530018 , 1 )	-- 頭銜：「10級打倒熊王」
				--顯示畫面
				CallPlot( Attack[i] , "Lua_BearKing_530018" , 0 )
			end
		elseif PlayerLV < 10 then
			if CountBodyItem( Attack[i] , 530019 ) >= 1 then
			else
				GiveBodyItem ( Attack[i] , 530019 , 1 )	-- 頭銜：「屠熊小英雄」
				--顯示畫面
				CallPlot( Attack[i] , "Lua_BearKing_530019" , 0 )
			end
		elseif PlayerLV >= 20 then
			if CountBodyItem( Attack[i] , 530020 ) >= 1 then
			else
				GiveBodyItem ( Attack[i] , 530020 , 1 )	-- 頭銜：「只會欺負熊」
				--顯示畫面
				CallPlot( Attack[i] , "Lua_BearKing_530020" , 0 )
			end
		end
		if HateC == 1 and PlayerLV <= 10 then
			if CountBodyItem( Attack[i] , 530021 ) >= 1 then
			else
				GiveBodyItem ( Attack[i] , 530021 , 1 )	-- 頭銜：「孤行俠」
				--顯示畫面
				CallPlot( Attack[i] , "Lua_BearKing_530021" , 0 )
			end
		end
		if PlayerLV == 1 then
			if CountBodyItem( Attack[i] , 530022 ) >= 1 then
			else
				GiveBodyItem ( Attack[i] , 530022 , 1 )	-- 頭銜：「1級打倒熊王」
				--顯示畫面
				CallPlot( Attack[i] , "Lua_BearKing_530022" , 0 )
			end
		end
	end
	return true
end


function Lua_BearKing_530018()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530018]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530018]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530018]]", "0xffffff00" );
	end
end

function Lua_BearKing_530019()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530019]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530019]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530019]]", "0xffffff00" );
	end		
end

function Lua_BearKing_530020()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530020]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530020]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530020]]", "0xffffff00" );
	end
end

function Lua_BearKing_530021()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530021]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530021]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530021]]", "0xffffff00" );
	end		
end

function Lua_BearKing_530022()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530022]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530022]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530022]]", "0xffffff00" );
	end		
end