function LuaI_110730_01()
	SetPlot( OwnerID() , "touch" , "LuaI_110730_01_Go" , 50 );
end

function LuaI_110730_01_Go()
	if CountBodyItem( OwnerID() , 201234 ) >= 1 then
		Say( OwnerID() , GetString("ST_110730_1") )	-- 障障消！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110730_2") , 0 )	-- 您念出符文，木桶暫時從您的眼前消失！
		Hide( TargetID() )
		Sleep( 100 )
		Show( TargetID() , 0 )
	end
end

function LuaI_110730_02()
	SetPlot( OwnerID() , "touch" , "LuaI_110730_02_Go" , 50 );
end

function LuaI_110730_02_Go()
	if CountBodyItem( OwnerID() , 201234 ) >= 1 then
		Say( OwnerID() , GetString("ST_110730_1") )	-- 障障消！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110730_2") , 0 )	-- 您念出符文，木桶暫時從您的眼前消失！
		Hide( TargetID() )
		Sleep( 100 )
		Show( TargetID() , 0 )
	end
end

function LuaI_110730_03()
	SetPlot( OwnerID() , "touch" , "LuaI_110730_03_Go" , 50 );
end

function LuaI_110730_03_Go()
	if CountBodyItem( OwnerID() , 201234 ) >= 1 then
		Say( OwnerID() , GetString("ST_110730_1") )	-- 障障消！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110730_2") , 0 )	-- 您念出符文，木桶暫時從您的眼前消失！
		Hide( TargetID() )
		Sleep( 100 )
		Show( TargetID() , 0 )
	end
end

function LuaI_110730_04()
	SetPlot( OwnerID() , "touch" , "LuaI_110730_04_Go" , 50 );
end

function LuaI_110730_04_Go()
	if CountBodyItem( OwnerID() , 201234 ) >= 1 then
		Say( OwnerID() , GetString("ST_110730_1") )	-- 障障消！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110730_2") , 0 )	-- 您念出符文，木桶暫時從您的眼前消失！
		Hide( TargetID() )
		Sleep( 100 )
		Show( TargetID() , 0 )
	end
end

function LuaI_110730_05()
	SetPlot( OwnerID() , "touch" , "LuaI_110730_05_Go" , 50 );
end

function LuaI_110730_05_Go()
	if CountBodyItem( OwnerID() , 201234 ) >= 1 then
		Say( OwnerID() , GetString("ST_110730_1") )	-- 障障消！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110730_2") , 0 )	-- 您念出符文，木桶暫時從您的眼前消失！
		Hide( TargetID() )
		Sleep( 100 )
		Show( TargetID() , 0 )
	end
end

function LuaI_110730_06()
	SetPlot( OwnerID() , "touch" , "LuaI_110730_06_Go" , 50 );
end

function LuaI_110730_06_Go()
	if CountBodyItem( OwnerID() , 201234 ) >= 1 then
		Say( OwnerID() , GetString("ST_110730_1") )	-- 障障消！
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110730_2") , 0 )	-- 您念出符文，木桶暫時從您的眼前消失！
		Hide( TargetID() )
		Sleep( 100 )
		Show( TargetID() , 0 )
	end
end