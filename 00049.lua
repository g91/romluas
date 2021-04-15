function Lua_Quest_ClickObj_200001()
local ItemID = 200008;
local ItemCount = 2;

local Count = CountBodyItem( OwnerID(), ItemID );

if( Count >= ItemCount ) then
	SendQuestClickObjResult( OwnerID(), 1, 0 );
	return 1;
else
	SendQuestClickObjResult( OwnerID(), -1, ItemID );
	return -1;
end
end