function Lua_Quest_ClickObj_200184()
 local ItemID = 200184;
local ItemCount = 1;

local Count = CountBodyItem( OwnerID(), ItemID );

if( Count >= ItemCount ) then
	SendQuestClickObjResult( OwnerID(), 1, 0 );
	return 1;
else
	SendQuestClickObjResult( OwnerID(), -1, ItemID );
	return -1;
end

end