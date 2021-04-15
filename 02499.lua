function LuaQ_DR_Z21PESTART()		--PE開始
	local player = TargetID()
	local OID = OwnerID()
	--say(player ,"i am target")
--	SetFlag(player,545555,1)
	SetFlag(player,545559,1)
	SetFlag(player,545561,1)
	SetFlag(player,545563,1)
	Lua_ZonePE_3th_GetScore(100)

end

function LuaQ_DR_Z21PE01()		--驅逐怒鬃
	local player = TargetID()
	local OID = OwnerID()
--	SetFlag(player,545556,1)
--	DelBodyItem(player,545555,1)
	Lua_ZonePE_3th_GetScore(210)
end

function LuaQ_DR_Z21PE02()		--解救村民
	local player = TargetID()
	local OID = OwnerID()
--	SetFlag(player,545557,1)
--	DelBodyItem(player,545556,1)
	Lua_ZonePE_3th_GetScore(210)
end

function LuaQ_DR_Z21PE03()		--擊敗首腦
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545558,1)
--	DelBodyItem(player,545557,1)
	Lua_ZonePE_3th_GetScore(210)
end

function LuaQ_DR_Z21PE04()		--極效咳嗽藥
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545560,1)
	DelBodyItem(player,545559,1)
	Lua_ZonePE_3th_GetScore(400)
end

function LuaQ_DR_Z21PE05()		--晚間的盛宴
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545562,1)
	DelBodyItem(player,545561,1)
	Lua_ZonePE_3th_GetScore(350)
end

function LuaQ_DR_Z21PE06()		--唐娜的苦惱
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545563,1)
	Lua_ZonePE_3th_GetScore(200)
end

function LuaQ_DR_Z21PE07()		--武器前送
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545559,1)
	DelBodyItem(player,545560,1)
	Lua_ZonePE_3th_GetScore(100)
end



function LuaQ_DR_Z21PE09()		--配發補給
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545561,1)
	DelBodyItem(player,545562,1)
	Lua_ZonePE_3th_GetScore(150)
end