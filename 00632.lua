function LuaI_420753_Check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 100660 

	if ( CheckAcceptQuest( OwnerID() , 420753 ) == false ) or ( CheckCompleteQuest( OwnerID() , 420753 ) == true ) then
		-- No Quest
		return false
	elseif ( CountBodyItem( OwnerID() , 201653 ) >= 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("ST_420753_1") , 0 )	--�A�w�g������@���w�w�P�H�x�F�I
		return false
	elseif ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("ST_420753_2") , 0 )	--�A�Ү�����H���O�w�w�P�H�x�I
		return false	
	else
		return true
	end

end

function LuaC_420753_Effect()

	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP
	local RND = (5)
	if ( HPPercent <= ( ( 1 + RND )/100 ) ) then
		BeginPlot( TargetID() , "LuaI_420753_Reset" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("ST_420753_3") , 0 )	--�A���\��������@���w�w�P�H�x�I
		DelBodyItem( OwnerID() , 201652 , 1 )
		GiveBodyItem( OwnerID() , 201653 , 1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("ST_420753_4") , 0 )	--�w�w�P�H�x����Q�����{�L�A���M���I
	end

end

function LuaI_420753_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end
