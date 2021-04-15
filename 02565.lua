------------元素結晶240747_使用後執行----------------------------------------------------------------------------------------
function Lua_ying_thanksgiving_usegift()

	local Player = OwnerID()

	Lua_Hao_Set_GuildResources( Player ,  0 , 200 , 1500 , 1500 , 1500 , 400 ,  10 )	-- 增加公會資源
	-- 資金、紅鑽、礦物、木材、藥草、魔物精華、王者核心
end
-------元素結晶240747_使用前檢查--------------------------------------------------------------------------------------------
function Lua_ying_thanksgiving_240747chk()

	local Player = OwnerID()
	local ZoneID =  ReadRoleValue( Player , EM_RoleValue_ZoneID )  --若分流3 則為3401
	local MyZone = ZoneID -1000*math.floor( ZoneID / 1000 ) --3401-1000*無條件捨去(3401/1000) = 401

	if MyZone == 401 then --公會城堡
		return true
	else
		ScriptMessage( Player , Player , 1 , "[SC_THANKS_2011_24]" , 0 ) --此物品只可在公會城堡內使用！
		return false
	end
end