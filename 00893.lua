function Lua_Hui_TouchTest_Init()

	SetPlot( OwnerID() , "Touch" , "Lua_Hui_TouchTest_Touch" , 60 );
	--SetRoleCamp( OwnerID(), "Monster" );

end

function Lua_Hui_TouchTest_Touch()
	
	Say( TargetID(), "<$VAR1><$SETVAR1=<fasdf>>");
	--return;
	
	local ObjID  	= 0;
	local CastResult	= 0;

	if BeginCastBar( OwnerID(), GetName( TargetID() ) , 150 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SAY_NPC_BUSY]", 0 )
		return
	end
	
	while 1 do
		sleep( 2 );
		
		local CastBarStatus = CheckCastBar( OwnerID() );
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- жие\
				CastResult = 1;
				EndCastBar( OwnerID(), CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- ев▒╤
				CastResult = -1;
				EndCastBar( OwnerID(), CastBarStatus )
				break;
			end
		end
	end
end