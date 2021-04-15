function 	Sys_GuildFlag_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_GuildFlag_Open" , 150 )
	Say( OwnerID(), "Guild Flag Open")
end

function 	Sys_GuildFlag_Open()
	OpenClientMenu( OwnerID() , EM_ClientMenuType_SetGuildFlag )
end