function LuaQuestComplete_420088()

	Say( OwnerID(), "5 ���}�l�I�k�ʧ@" );
	sleep( 50 );

	CastSpell( OwnerID(), OwnerID(), 490098 );
	sleep( 50 );

	Say( OwnerID(), "�����F! �ڦ��\���b�Ƴo���j�K�F!" );
	-- ���}����X��, ���U�@�ӥ��ȥi�H�Q����
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
