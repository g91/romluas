function Lua_Quest_ClickObj_DeleteItem(ItemID, ItemCount)
--local ItemID = 200033;
--local ItemCount = 1;
local iItemID	= tonumber( ItemID);
local iItemCount 	= tonumber( ItemCount );

local RoleID	= OwnerID();


local Count = CountBodyItem( RoleID, iItemID);

if( Count >= iItemCount ) then

	local Result = DelBodyItem( RoleID, iItemID, iItemCount );
	if( Result ) then
  		return 1;
	end
end

return -1;
end