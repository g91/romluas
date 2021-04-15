function Lua_Quest_ClickObj_DeleteItem200184()
 local ItemID	= 200184;
local ItemCount = 1;
local RoleID	= OwnerID();


local Count = CountBodyItem( RoleID, ItemID );

if( Count >= ItemCount ) then

	local Result = DelBodyItem( RoleID, ItemID, ItemCount );
	if( Result ) then
  		return 1;
	end
end

return -1;

end