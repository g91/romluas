function LuaS_201241_delete()
	if(CountBodyItem(OwnerID(),201241)>0) then
		DelBodyItem(OwnerID(),201241,CountBodyItem(OwnerID(),201241));
		return true;
	else
		return false;
	end
end