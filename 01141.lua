function Sys_TouchTomb()
	local result = false;
	if( ReadRoleValue( OwnerID() ,EM_RoleValue_IsDead) == 1 ) then
		return;
	end

	if BeginCastBar( OwnerID() , "[SC_GETBACKTOMB]", 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
		ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]"  , 0 );
		return
	end
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( OwnerID() );
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- жие\
				result = true
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- ев▒╤
				result = false
				EndCastBar(OwnerID() , CastBarStatus )
				return;
			end
		end
	end

	if ( result == true ) then
		TouchTomb()
	end

end