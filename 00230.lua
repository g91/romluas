function Sys_ChangeJob()
	OpenChangeJob()
end

function Init_ChangeJob()
	SetPlot( OwnerID() , "Touch" , "Sys_ChangeJob" , 50 );
end