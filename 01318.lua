function LuaI_204449()
	local EQ = {221275 , 221273 , 221274 , 210163}
	if EmptyPacketCount( OwnerID() ) >= table.getn( EQ ) and QueuePacketCount(OwnerID() ) == 0 then
		for i = 1 , table.getn( EQ ) do
			GiveBodyItemEX( OwnerID() , EQ[i]  , 1 , 0 ,0 ,0 , 0 , 0 , 0)
		end
		UseItemDestroy()
	else
		ScriptMessage(  OwnerID() , OwnerID() , 1, "[MSG_SONGSONGBAGWARN]", 0 ); 	
		ScriptMessage(  OwnerID() , OwnerID() , 0, "[MSG_SONGSONGBAGWARN]", 0 ); 	
	end
end

function LuaI_204450()
	local EQ = {221278 , 221276 , 221277 , 210110 , 210249 , 210031}
	if EmptyPacketCount( OwnerID() ) >= table.getn( EQ ) and QueuePacketCount(OwnerID() ) == 0 then
		for i = 1 , table.getn( EQ ) do
			if i == table.getn( EQ ) then
				GiveBodyItemEX( OwnerID() , EQ[i]  , 999 , 0 ,0 ,0 , 0 , 0 , 0 )
			else
				GiveBodyItemEX( OwnerID() , EQ[i]  , 1 , 0 ,0 ,0 , 0 , 0 , 0)
			end
		end
		UseItemDestroy()
	else
		ScriptMessage(  OwnerID() , OwnerID() , 1, "[MSG_SONGSONGBAGWARN]", 0 ); 	
		ScriptMessage(  OwnerID() , OwnerID() , 0, "[MSG_SONGSONGBAGWARN]", 0 ); 	
	end
end

function LuaI_204451()
	local EQ = {220192 , 220097 , 220146 , 210110 , 210032}
	if EmptyPacketCount( OwnerID() ) >= table.getn( EQ ) and QueuePacketCount(OwnerID() ) == 0 then
		for i = 1 , table.getn( EQ ) do
			if i == table.getn( EQ ) then
				GiveBodyItemEX( OwnerID() , EQ[i]  , 999 , 0 ,0 ,0 , 0 , 0 , 0 )
			else
				GiveBodyItemEX( OwnerID() , EQ[i]  , 1 , 0 ,0 ,0 , 0 , 0 , 0)
			end
		end
		UseItemDestroy()
	else
		ScriptMessage(  OwnerID() , OwnerID() , 1, "[MSG_SONGSONGBAGWARN]", 0 ); 	
		ScriptMessage(  OwnerID() , OwnerID() , 0, "[MSG_SONGSONGBAGWARN]", 0 ); 	
	end
end

function LuaI_204452()
	local EQ = {221264 , 221262 , 221263 , 210224}
	if EmptyPacketCount( OwnerID() ) >= table.getn( EQ ) and QueuePacketCount(OwnerID() ) == 0 then
		for i = 1 , table.getn( EQ ) do
			GiveBodyItemEX( OwnerID() , EQ[i]  , 1 , 0 ,0 ,0 , 0 , 0 , 0)
		end
		UseItemDestroy()
	else
		ScriptMessage(  OwnerID() , OwnerID() , 1, "[MSG_SONGSONGBAGWARN]", 0 ); 	
		ScriptMessage(  OwnerID() , OwnerID() , 0, "[MSG_SONGSONGBAGWARN]", 0 ); 	
	end
end

function LuaI_204453()
	local EQ = {220467 , 220346 , 220408 , 210224, 220769}
	if EmptyPacketCount( OwnerID() ) >= table.getn( EQ ) and QueuePacketCount(OwnerID() ) == 0 then
		for i = 1 , table.getn( EQ ) do
			GiveBodyItemEX( OwnerID() , EQ[i]  , 1 , 0 ,0 ,0 , 0 , 0 , 0)
		end
		UseItemDestroy()
	else
		ScriptMessage(  OwnerID() , OwnerID() , 1, "[MSG_SONGSONGBAGWARN]", 0 ); 	
		ScriptMessage(  OwnerID() , OwnerID() , 0, "[MSG_SONGSONGBAGWARN]", 0 ); 	
	end
end

function LuaI_204454()
	local EQ = {221267, 221265 , 221266 , 210081, 220769 }
	if EmptyPacketCount( OwnerID() ) >= table.getn( EQ ) and QueuePacketCount(OwnerID() ) == 0 then
		for i = 1 , table.getn( EQ ) do
			GiveBodyItemEX( OwnerID() , EQ[i]  , 1 , 0 ,0 ,0 , 0 , 0 , 0)
		end
		UseItemDestroy()
	else
		ScriptMessage(  OwnerID() , OwnerID() , 1, "[MSG_SONGSONGBAGWARN]", 0 ); 	
		ScriptMessage(  OwnerID() , OwnerID() , 0, "[MSG_SONGSONGBAGWARN]", 0 ); 	
	end
end