function LuaS_TEST_Hui_Quest()

	while 1 do
		
		for i=1, 40, 1 do
			DebugMsg( 0, 0, "TEST1234567890123456789012345678901234567890" );
		end
		sleep(1);

	end
end

function LuaS_TEST_Hui_InitObj()
--	SetCursorType( OwnerID(), eCursor_Mine );
	SetCursorType( OwnerID(), eCursor_Herb );
	SetPlot( OwnerID() , "Touch" , "Lua_Hui_TouchTest_Touch" , 60 );
end

function LuaZoneInit_Zone35()

	local 	i = 0;
	while(1) do
		i = i +1;
	end
end