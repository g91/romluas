--­J´Ô±í
function LuaI_110162()
	SetPlot( OwnerID(), "touch", "LuaQ_110162_1", 40 );
End
--------------------------------------------------------------------------------------------
function LuaQ_110162_1()

	if CountBodyItem( OwnerID(), 200588) == 1 then
		GiveBodyItem( OwnerID(), 200589,1);
		DelBodyItem( OwnerID(), 200588,1);
	end
End
-------------------------------------------------------------------------------------------