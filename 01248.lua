function Lua_GoGuildHouse_Item_Check() --�ˬd���|����
	local Obj = Role:new( OwnerID() );
	local guildnumber = GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse )
	local Etc = {400,401,402,410,430,431,350,440,441,442,443,444,445,446,447,351,352,353,361,304,121,210,208 }

	for i=1,table.getn(Etc) do
		if Obj:ZoneID() == Etc[i] then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_CANTHOME]" , 0 )	--�A����b���ϥΡC
			return false
		end
	end

	if ( guildnumber == -1 ) then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[GUILD_BUILD_5]" , 0 )--�A�S�����|����
		return false
	end

	return true
end

function Lua_GoGuildHouse_Item()	---------�ǰe�^���|�����D��
	if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse ) ==1 then
		BeginPlot( OwnerID() , "Lua_GoGuildHouse_Item_1" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[GUILD_BUILD_5]" , 0 )--�A�S�����|����
	end
end

function Lua_GoGuildHouse_Item_1()	---------�ǰe�^���|�����D��
	local Obj = Role:new( OwnerID() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	if( Ret == false ) then
		ScriptMessage( OwnerID() , OwnerID(), 1 , "[SC_DAN_111700_37]",0 );
		return;
	end
	if OpenVisitGuildHouse( true )==true then  --�^�ۤv�Ы�
		UseItemDestroy()
	end
end

function Lua_GoGuildHouse_Item_no_Consumables()	---------�ǰe�^���|�����D��
	if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse ) ==1 then
		BeginPlot( OwnerID() , "Lua_GoGuildHouse_Item_1_no_Consumables" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[GUILD_BUILD_5]" , 0 )--�A�S�����|����
	end
end

function Lua_GoGuildHouse_Item_1_no_Consumables()	---------�ǰe�^���|�����D��
	local Obj = Role:new( OwnerID() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	if( Ret == false ) then
		ScriptMessage( OwnerID() , OwnerID(), 1 , "[SC_DAN_111700_37]",0 );
		return;
	end
	if OpenVisitGuildHouse( true )==true then  --�^�ۤv�Ы�
--		UseItemDestroy()
	end
end