function Sys_Bank_Auto()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Bank );
	SetPlot( OwnerID() , "Touch" , "Sys_Bank_Open" , 50 );
end