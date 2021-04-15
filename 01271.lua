function LuaInside_1v1PVP_1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo_1", 0 ) --�ڷQ���W1��1�v�޳�������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo_2", 0 ) --�ڷQ���W1��1�v�޳�������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_SURVIVEINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo_3", 0 ) --�ڷQ���W3v3�ͦs�Գ�������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_RACEGAMEINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo_4", 0 ) --�ڷQ���W�ɰ���������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CAPTUREFLAG_1]" , "Lua_1v1PVP_GetGuildBidInfo_5", 0 ) --�ڷQ���W�ܺX�Գ�������
end

function Lua_1v1PVP_GetGuildBidInfo_1()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 410 ); 	--�]�w�޲z���v�޳�
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(410) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--�Գ��٦b�ǳƤ�
	else		
		if Party[0] == 1 then
			-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
			SendBGInfoToClient( 410, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		end
	end
end
function Lua_1v1PVP_GetGuildBidInfo_2()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 411 ); 	--�]�w�޲z���v�޳�
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(411) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--�Գ��٦b�ǳƤ�
	else		
		if Party[0] == 1 then
			-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
			SendBGInfoToClient( 411, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		end
	end
end
function Lua_1v1PVP_GetGuildBidInfo_3()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 430 ); 	--�]�w�޲z���v�޳�
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(430) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--�Գ��٦b�ǳƤ�
	else		
		if Party[0] == 1 then
			-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
			SendBGInfoToClient( 430, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		end
	end
end
function Lua_1v1PVP_GetGuildBidInfo_4()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 350 ); 	--�]�w�޲z���v�޳�
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(350) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--�Գ��٦b�ǳƤ�
	else		
		if Party[0] == 1 then
			-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
			SendBGInfoToClient( 350, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		end
	end
end
function Lua_1v1PVP_GetGuildBidInfo_5()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 431 ); 	--�]�w�޲z���v�޳�
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(431) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--�Գ��٦b�ǳƤ�
	else		
		if Party[0] == 1 then
			-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
			SendBGInfoToClient( 431, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		end
	end
end