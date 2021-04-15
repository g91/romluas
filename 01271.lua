function LuaInside_1v1PVP_1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo_1", 0 ) --我想報名1對1競技場的比賽
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_1V1PVPINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo_2", 0 ) --我想報名1對1競技場的比賽
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_SURVIVEINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo_3", 0 ) --我想報名3v3生存戰場的比賽
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_RACEGAMEINSIDE_1]" , "Lua_1v1PVP_GetGuildBidInfo_4", 0 ) --我想報名賽馬場的比賽
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CAPTUREFLAG_1]" , "Lua_1v1PVP_GetGuildBidInfo_5", 0 ) --我想報名奪旗戰場的比賽
end

function Lua_1v1PVP_GetGuildBidInfo_1()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 410 ); 	--設定管理的競技場
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(410) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--戰場還在準備中
	else		
		if Party[0] == 1 then
			-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
			SendBGInfoToClient( 410, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		end
	end
end
function Lua_1v1PVP_GetGuildBidInfo_2()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 411 ); 	--設定管理的競技場
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(411) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--戰場還在準備中
	else		
		if Party[0] == 1 then
			-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
			SendBGInfoToClient( 411, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		end
	end
end
function Lua_1v1PVP_GetGuildBidInfo_3()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 430 ); 	--設定管理的競技場
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(430) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--戰場還在準備中
	else		
		if Party[0] == 1 then
			-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
			SendBGInfoToClient( 430, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		end
	end
end
function Lua_1v1PVP_GetGuildBidInfo_4()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 350 ); 	--設定管理的競技場
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(350) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--戰場還在準備中
	else		
		if Party[0] == 1 then
			-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
			SendBGInfoToClient( 350, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		end
	end
end
function Lua_1v1PVP_GetGuildBidInfo_5()
	CloseSpeak( OwnerID() )
	SetCrystalID( TargetID(), 431 ); 	--設定管理的競技場
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(431) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--戰場還在準備中
	else		
		if Party[0] == 1 then
			-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
			SendBGInfoToClient( 431, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--請先脫離隊伍在報名
		end
	end
end