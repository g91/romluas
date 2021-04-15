function LuaI_111326_0()
 	SetPlot( OwnerID() , "Range" , "LuaI_111326_1" , 50 )
end
function LuaI_111326_1()
	if(CheckAcceptQuest( OwnerID() , 421375 ) == true and CheckAcceptQuest( OwnerID() , 421376 ) == false)  then
	BeginPlot( OwnerID() , "LuaI_111326_2" , 0 )
	end
end
function LuaI_111326_2()
	if Countbodyitem( OwnerID() , 202761 ) >=1  and CountBodyItem( OwnerID() , 202802 ) ==0 then
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421375_0") , 0 )
	GiveBodyItem( OwnerID() , 202802 , 1 )
	END
END
------------------------------------------------------------------------^1
function LuaI_111327_0()
	SetPlot( OwnerID() , "Range" , "LuaI_111327_1" , 50 )
END

function LuaI_111327_1()
	if(CheckAcceptQuest( OwnerID() , 421375 ) == true and CheckAcceptQuest( OwnerID() , 421376 ) == false)  then
	BeginPlot( OwnerID() , "LuaI_111327_2" , 0 )
	end
end

FUNCTION LuaI_111327_2()
	if Countbodyitem( OwnerID() , 202761  ) >=1 and  CountBodyItem( OwnerID() , 202833 )==0 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421375_0") , 0 )
	GiveBodyItem( OwnerID() , 202833 , 1 )
END
END
---------------------------------------------------------------------------------^2
function LuaI_111328_0()
	SetPlot( OwnerID() , "Range" , "LuaI_111328_1" , 50 )
end


function LuaI_111328_1()
	if(CheckAcceptQuest( OwnerID() , 421375 ) == true and CheckAcceptQuest( OwnerID() , 421376 ) == false)  then
	BeginPlot( OwnerID() , "LuaI_111328_2" , 0 )
	end
end

FUNCTION LuaI_111328_2()
	 if Countbodyitem( OwnerID() , 202761  ) >=1 and  CountBodyItem( OwnerID() , 202834 ) ==0 then
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421375_0") , 0 )
	GiveBodyItem( OwnerID() , 202834 , 1 )
	END
END
-----------------------------------------------------------------------^3

function LuaI_111329_0()
	SetPlot( OwnerID() , "Range" , "LuaI_111329_1" , 50 )
END

function LuaI_111329_1()
	if(CheckAcceptQuest( OwnerID() , 421375 ) == true and CheckAcceptQuest( OwnerID() , 421376 ) == false)  then
	BeginPlot( OwnerID() , "LuaI_111329_2" , 0 )
	end  
end

FUNCTION LuaI_111329_2()
	if Countbodyitem( OwnerID() , 202761  ) >=1 and  CountBodyItem( OwnerID() , 202835 ) ==0 then
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421375_0") , 0 )
	GiveBodyItem( OwnerID() , 202835 , 1 )
	eND
END
------------------------------------------------------------------------------^4
function LuaI_111330_0()
	SetPlot( OwnerID() , "Range" , "LuaI_111330_1" , 50 )
end

function LuaI_111330_1()
	if(CheckAcceptQuest( OwnerID() , 421375 ) == true and CheckAcceptQuest( OwnerID() , 421376 ) == false)  then
	BeginPlot( OwnerID() , "LuaI_111330_2" , 0 )
	end
end
FUNCTION LuaI_111330_2()
	 if Countbodyitem( OwnerID() , 202761  ) >=1 and  CountBodyItem( OwnerID() , 202836 ) ==0 then
	 ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421375_0") , 0 )
	 GiveBodyItem( OwnerID() , 202836 , 1 )
	END
END
------------------------------------------------------------------------------^5