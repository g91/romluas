function LuaFunc_NewbieTransfer()
	BeginPlot( OwnerID() , "LuaFunc_NewbieTransferLove", 0 )
end

function LuaFunc_NewbieTransferLove()
	local n = 0
	local DialogStatus = 0
	local Player = OwnerID()

	local TransferLocation = {}
	TransferLocation[0] = { GetString("SO_EXIT") }
	TransferLocation[1] = { GetString("ZONE_ROGSHIRE"), 491891}

	DialogCreate( Player , EM_LuaDialogType_Select , GetString("SC_NEWBIE_TRANSFER") )
	for i = 0, table.getn( TransferLocation ) do
		local j = table.getn( TransferLocation ) - i 
		DialogSelectStr( Player , TransferLocation[j][1] )
	end

	if( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )
		return 0
	end

	while 1 do
		sleep( 1 )
		n = n + 1
		DialogStatus =  DialogGetResult( Player )
		if n > 300 then -- 防無窮迴圈，300 = 三十秒
			DialogClose( Player )
			break
		end
		
		if ( DialogStatus ==  table.getn( TransferLocation )  ) or ( DialogStatus == -1 ) then
			DialogClose(Player)
			break
		elseif ( DialogStatus ~= -2 ) then
			DialogClose( Player )
			CastSpell( OwnerID() , OwnerID() , TransferLocation[table.getn( TransferLocation )  - DialogStatus][2]  )
			break
		end
	end
end

function Lua_NewbieTransferLove_Check()
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )

	if ZoneID> 0 and  ZoneID< 100 and Obj:RoomID() == 0 then
		Return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_CANTHOME") , 0 )	--你不能在此使用。
		return false;
	end

end