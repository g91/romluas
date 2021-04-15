function yu_100399_Check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 100399

	if ( CheckAcceptQuest( OwnerID() , 421629) == false ) then
		-- No Quest
		return false
	elseif ( CountBodyItem( OwnerID() , 203396 ) >= 15 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_YUGP100399_01") , C_SYSTEM )	--你已經逮捕了足夠的盜賊。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_YUGP100399_01") , C_SYSTEM )	--你已經逮捕了足夠的盜賊。
		return false
	elseif ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_YUGP100399_02") , C_SYSTEM )	--請使用於逮捕盜賊上。.
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_YUGP100399_02") , C_SYSTEM )	--請使用於逮捕盜賊上。
		return false	
	else
		return true
	end

end

function yu_100399_Effect()

	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP
	local RND = (5)
	if ( HPPercent <= ( ( 15 + RND )/100 ) ) then
		BeginPlot( TargetID() , "yu_100399_Reset" , 0 )
		BeginPlot( OwnerID() , "yu_100399_Delgoods" , 0 )  
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_YUGP100399_04") , C_SYSTEM )	--閃避了你的繩索。
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_YUGP100399_04") , C_SYSTEM )	--閃避了你的繩索。
	end

end

function yu_100399_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end

function yu_100399_Delgoods()
	sleep(20)	
	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_YUGP100399_03") , C_SYSTEM )	--你成功的逮捕盜賊！
	ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_YUGP100399_03") , C_SYSTEM )	--你成功的逮捕盜賊！
	GiveBodyItem( OwnerID() , 203396, 1 )
	DelBodyItem( OwnerID() , 203397, 1 )
end