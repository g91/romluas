
--必爾汀圓貝禮包
function lua_mika_phshellbag(GiveCount)
	local Player = OwnerID()
	local Item = 240181  -- 必爾汀圓貝 Phirius Shell

	local Get

	Get = Lua_Hao_Check_Item_Stack( Player , Item , GiveCount )
	if Get ~= GiveCount then
		ScriptMessage( Player , Player , 2 , "[SC_240181_01]" , 0 )	-- 你最多只能保留1000個必爾汀圓貝，該物品取得數量已達上限。
		return false
	else
		GiveBodyItem(Player, Item, GiveCount )
	end
end