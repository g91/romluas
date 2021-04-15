function lua_mika_dancefes_testlist01() --刪除所有舞會NPC
	local TempObj = {114709,114710,114711,114712,114713,114714,114715,114716}
	for i = 1 ,table.getn(TempObj) do
		Lua_DavisDelObj(TempObj[i])
	end
end