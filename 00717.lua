function Lua_GoHouse_Item_Check()
	local Obj = Role:new( OwnerID() );
	local homenumber = Read_Role_HomeNumber( OwnerID() )
	local Etc = {400,401,402,410,430,431,350,440,441,442,443,444,445,446,447,351,352,353, 361,304,121,354,210,208,190,191,192 }
	if ( homenumber == -1 ) then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NONEHOME") , 0 )	--你不能在此使用。
		return false
	end
	for i=1,table.getn(Etc) do
		if Obj:ZoneID() == Etc[i] then
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_CANTHOME") , 0 )	--你不能在此使用。
			return false
		end
	end
	return true
end

function Lua_GoHouse_Item()

	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	if ZoneID> 0 and  ZoneID< 100 and Obj:RoomID() == 0 then

		local X = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_X )
		local Y = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Y )
		local Z = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Z )

		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() ,X, Y , Z , Obj:Dir() );
		if( Ret == false ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NONEHOME") , 0 )	--你不能在此使用。
			return;
		end
	elseif ZoneID> 100 or Obj:RoomID() ~= 0 then
		local Ret = SaveReturnPos_ZoneDef( OwnerID() )
		if( Ret == false ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NONEHOME") , 0 )	--你不能在此使用。
			return;
		end
	else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NONEHOME") , 0 )	--你不能在此使用。
			return;
	end
	
	if OpenVisitHouse( true ) == true then	 --回自己房屋
		UseItemDestroy()
	end
end

function Lua_GoHouse_Item_no_Consumables()

	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	if ZoneID> 0 and  ZoneID< 100 and Obj:RoomID() == 0 then

		local X = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_X )
		local Y = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Y )
		local Z = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Z )

		local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() ,X, Y , Z , Obj:Dir() );
		if( Ret == false ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NONEHOME") , 0 )	--你不能在此使用。
			return;
		end
	elseif ZoneID> 100 or Obj:RoomID() ~= 0 then
		local Ret = SaveReturnPos_ZoneDef( OwnerID() )
		if( Ret == false ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NONEHOME") , 0 )	--你不能在此使用。
			return;
		end
	else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NONEHOME") , 0 )	--你不能在此使用。
			return;
	end

	if OpenVisitHouse( true ) == true then	 --回自己房屋
--		UseItemDestroy()
	end
end