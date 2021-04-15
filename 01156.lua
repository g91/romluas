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
				GiveBodyItem ( Attack[i] , 530018 , 1 )	-- �Y�ΡG�u10�ť��˺����v
				--��ܵe��
				CallPlot( Attack[i] , "Lua_BearKing_530018" , 0 )
			end
		elseif PlayerLV < 10 then
			if CountBodyItem( Attack[i] , 530019 ) >= 1 then
			else
				GiveBodyItem ( Attack[i] , 530019 , 1 )	-- �Y�ΡG�u�O���p�^���v
				--��ܵe��
				CallPlot( Attack[i] , "Lua_BearKing_530019" , 0 )
			end
		elseif PlayerLV >= 20 then
			if CountBodyItem( Attack[i] , 530020 ) >= 1 then
			else
				GiveBodyItem ( Attack[i] , 530020 , 1 )	-- �Y�ΡG�u�u�|�ۭt���v
				--��ܵe��
				CallPlot( Attack[i] , "Lua_BearKing_530020" , 0 )
			end
		end
		if HateC == 1 and PlayerLV <= 10 then
			if CountBodyItem( Attack[i] , 530021 ) >= 1 then
			else
				GiveBodyItem ( Attack[i] , 530021 , 1 )	-- �Y�ΡG�u�t��L�v
				--��ܵe��
				CallPlot( Attack[i] , "Lua_BearKing_530021" , 0 )
			end
		end
		if PlayerLV == 1 then
			if CountBodyItem( Attack[i] , 530022 ) >= 1 then
			else
				GiveBodyItem ( Attack[i] , 530022 , 1 )	-- �Y�ΡG�u1�ť��˺����v
				--��ܵe��
				CallPlot( Attack[i] , "Lua_BearKing_530022" , 0 )
			end
		end
	end
	return true
end


function Lua_BearKing_530018()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530018]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530018]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530018]]", "0xffffff00" );
	end
end

function Lua_BearKing_530019()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530019]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530019]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530019]]", "0xffffff00" );
	end		
end

function Lua_BearKing_530020()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530020]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530020]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530020]]", "0xffffff00" );
	end
end

function Lua_BearKing_530021()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530021]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530021]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530021]]", "0xffffff00" );
	end		
end

function Lua_BearKing_530022()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_GETTITLE_2][$SETVAR1 = [530022]]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		local CheckYes = LuaS_DialogRePort_OneChoose(OwnerID())
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_GETTITLE_2][$SETVAR1 = [530022]]", "0xffffff00" );
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_GETTITLE_2][$SETVAR1 = [530022]]", "0xffffff00" );
	end		
end