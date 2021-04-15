function LuaDan_InterfaceGuild()

	local sum = 0
	local Stage = 0
	SetSmallGameMenuType( OwnerID() , 1 , 1 ) --Open
	SetSmallGameMenuValue( OwnerID() , 1 , 1 , 5) --Change Stage((++))
	SetSmallGameMenuStr( OwnerID(), 1 , 2 , "59" ) --Change grade (++String"))


end

function LuaDan_Testing()
			local i = 1
			ScriptMessage( OwnerID(),  -1, 1, "[SC_TC_STAGE][$SETVAR1="..i.."]" , C_SYSTEM )
			ScriptMessage( OwnerID(),  -1, 0, "[SC_TC_STAGE][$SETVAR1="..i.."]" , C_SYSTEM )

end
