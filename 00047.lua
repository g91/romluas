function Lua_Quest_ClickObj_CheckItem(ItemID, ItemCount)
--local ItemID = 200033;
--local ItemCount = 1;
local iItemID	= tonumber( ItemID);
local iItemCount 	= tonumber( ItemCount );
local Count = CountBodyItem( OwnerID(), ItemID );

if( Count >= iItemCount ) then
	--SendQuestClickObjResult( OwnerID(), 1, 0 , 0 );
	return 1;
else
	--SendQuestClickObjResult( OwnerID(), -1, iItemID, 0 );
	return -1;
end
end