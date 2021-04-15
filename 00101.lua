function LuaQuestComplete_420088()

	Say( OwnerID(), "5 秒後開始施法動作" );
	sleep( 50 );

	CastSpell( OwnerID(), OwnerID(), 490098 );
	sleep( 50 );

	Say( OwnerID(), "完成了! 我成功的淨化這塊大便了!" );
	-- 打開角色旗標, 讓下一個任務可以被接受
	SetScriptFlag( TargetID(), 420088, 1 );
end


function LuaInit_HuiTest()
	--BeginPlot( OwnerID(), "Lua_HuiTestMain", 0 );
	
	local a = {};
	local b = 3;
	--BeginPlot( OwnerID(), "BeginPlotArg( 1, b, 2 )", 0 );

	--BeginPlotArg( a, b, 2 )

	Say( OwnerID(), "GG" );
	CallPlot( OwnerID() , "Lua_HuiTestMain", 1, 2, 3, 4 );
end

function Lua_HuiTestMain( v1, v2, v3, v4)
	local string = "TEST " .. v1 .. "," .. v2 .. "," .. v3 .. "," .. v4;

	Say( OwnerID(), string );
end
