function LuaInit_GuildBid_110748()

	SetCrystalID( OwnerID(), 450 ); 	
	SetPlot( OwnerID() , "Touch" , "LuaTouch_GetGuildBidInfo_110748" , 50 );
end

function LuaTouch_GetGuildBidInfo_110748()

	-- 要求開啟公會戰競標介面, 資訊傳給 DC, DC 在將資訊轉給 Client
	-- OpenGuildWarBid( OwnerID(), TargetID() );	

	SendBGInfoToClient( 450, OwnerID() );
	
end