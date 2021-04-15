
function 	Sys_GuildList_Auto()

	SetPlot( OwnerID() , "Touch" , "Sys_GuildList_Open" , 150 )

end

function 	Sys_GuildList_Open()

	OpenClientMenu( OwnerID() , EM_ClientMenuType_GuildList )

end