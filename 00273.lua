function LuaQ_420177_BeforeClick()
	local ItemID	= 200708;
	local Count = CountBodyItem( OwnerID(), ItemID );
	local Flag = {}
	Flag[110151] = 540235
	Flag[110435] = 540236
	Flag[110434] = 540237
	Flag[110436] = 540238
	Flag[110437] = 540760
	Local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID )
	if( Count >= 1 ) and CheckFlag(OwnerID(),Flag[OrgID]) == false then
--		SendQuestClickObjResult( OwnerID(), 1, 0 , 0 );
		return 1;
	else
--		SendQuestClickObjResult( OwnerID(), -1, ItemID, 0 );
		return -1;
	end
end