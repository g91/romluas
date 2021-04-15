-- CallPlot到底可傳什麼東西進去?
function be_called_plot(...)
	for index = 1, select("#", ...) do
		local _temp = select(index, ...)
		DebugMsg(OwnerID(), 1, "type : " .. type(_temp) .. " - value : " .. _temp)
	end
end

function test_call_plot(...)
	CallPlot(OwnerID(), "be_called_plot", ...)
	CallPlot(OwnerID(), "be_called_plot", "a", "b", "c", 1, 2, 3)
end

--
function test_inserttable()
	t1 = {1, 2, 3}
	t2 = {4, 5, 6}
	DebugMsg(OwnerID(), 0, "before insert table : t1 = {" .. table.print(t1) .. "}")
	DebugMsg(OwnerID(), 0, "before insert table : t2 = {" .. table.print(t2) .. "}")
	DebugMsg(OwnerID(), 0, "table.inserttable(t1, t2)")
	table.inserttable(t1, t2)
	DebugMsg(OwnerID(), 0, "after insert table : t1 = {" .. table.print(t1) .. "}")
	DebugMsg(OwnerID(), 0, "after insert table : t2 = {" .. table.print(t2) .. "}")
	t3 = {
		a = "abc",
		b = "bcd",
		c = "cde"
	}
	t4 = {
		a = "a12",
		c = "c45"
	}
	DebugMsg(OwnerID(), 0, "before insert table : t3 = {" .. table.print(t3) .. "}")
	DebugMsg(OwnerID(), 0, "before insert table : t4 = {" .. table.print(t4) .. "}")
	DebugMsg(OwnerID(), 0, "table.inserttable(t3, t4)")
	table.inserttable(t3, t4)
	DebugMsg(OwnerID(), 0, "after insert table : t3 = {" .. table.print(t3) .. "}")
	DebugMsg(OwnerID(), 0, "after insert table : t4 = {" .. table.print(t4) .. "}")
end

--
function test_randrange()
	local a = 10
	local t = {
		RandRange(1, a - 1),
		RandRange(1, a - 1),
		RandRange(1, a - 1),
		RandRange(1, a - 1)
	}
	DebugMsg(OwnerID(), 0, table.print(t))
end

function test_randrange2()
	for index = 1, 10 do
		DebugMsg(OwnerID(), 0, RandRange(0, 10))
	end
end

function test_get_random_table()
	a = {1, 2, 3, 4, 5, 6}
	b = get_random_table(a, 3)
	DebugMsg(OwnerID(), 1, "result = " .. table.print(b))
end

function test_play_motion()
	DebugMsg(OwnerID(), 1, "play motion")
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_DAZED_LOOP)
end

function test_play_motion2()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_NORMAL)
end

function test_readrolevalue()
	WriteRoleValue(OwnerID(), EM_RoleValue_Register1, 123456123456123456123456123456123456123456123456123456123456)
	DebugMsg(OwnerID(), 1, type(ReadRoleValue(OwnerID(), EM_RoleValue_Register1)))
	DebugMsg(OwnerID(), 1, ReadRoleValue(OwnerID(), EM_RoleValue_Register1))
end

function test_tableprint()
	_table = {
		a = 1,
		b = 2,
		c = 3
	}
	DebugMsg(OwnerID(), 1, "_table = {" .. table.print(_table) .. "}")
end

function test_addbuff(_id)
	AddBuff(OwnerID(), _id, 0, -1)
end