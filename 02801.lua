
-- 包包打開每次掉1顆
function lua_mika_202881bag_01()
	local Player = OwnerID()
	local itemid = 202881	
	GiveBodyItem(Player, itemid, 1 )
end