function test_christineclass()
	local addy = Christine.System:new("ADDY")
	addy.beta = true
	local i = 1
	while addy.beta do
		addy:debug(i)
		i = i + 1
		if i > 5 then addy.beta = false end
		addy:sleep()
	end
end

function test_christineclass2()
	local me = Christine.Role:new(OwnerID())
	me:addEventListener(Christine.RoleEvent.CHANGE_CAMP, function(event) event.target:say("change camp") end)
	DebugMsg(0, 0, me.GUID)
	me:say(tostring(me.hp))
	me:say(tostring(me.lv))
	me:say(tostring(me.camp_id))
	me.camp_id = 5
	me:say(tostring(me.camp_id))
	Sleep(20)
	me:position {x = me.x + 120}
end

function test_christineclass3()
	local me = Christine.Player:new(OwnerID())
	me:say(me.class)
	me:stopBGM()
end

function test_christineclass4()
	local me = Christine.Player:new(OwnerID())
	me:say(tostring(me:isInheritorOf("Object")))
end

function test_christineclass5()
	local me = Christine.Player:new(OwnerID())
end

function test_christineclass6()
	local music = Christine.Music:new("beginning", "music/zone/ch6_main_theme.mp3", 139)
	local me = Christine.Player:new(OwnerID())
	local music_listener = Christine.MusicListener:new()
	music_listener:add(me)
	me:addEventListener(Christine.MusicPlayerEvent.MUSIC_END, function() DebugMsg(0, 0, "music end") return end)
	me:stopBGM()
	me:playMusic(music)
	while true do
		music_listener:start()
		DebugMsg(0, 0, me.music_player.current_time)
		Sleep(10)
	end
end


function test_christineclass7()
	local flag_group = Christine.FlagGroup:new(781328)
	Christine.Player:new(OwnerID()):position {
		x = flag_group[1].x,
		y = flag_group[1].y,
		z = flag_group[1].z
	}:say("hello!")
end

function test_christineclass8()
	local me = Christine.Player:new(OwnerID())
	me:property {
		x = 0,
		y = 0,
		z = 0,
		hp = 1
	}
end

function test_christineclass9()
	assert(false, "error message123456789")
end

function test_christineclass10()
	local me = Christine.Player:new(OwnerID())
	me:say()
	me:say("123")
end

function test_christineclass11()
	local s = Christine.System:new("table")
	s.beta = true
	local t1 = Christine.Table:new({"a1", "b1", "c1", "d1", "e1"})
	s:debug("t1 = {" .. t1:print() .. "}")
	local t2 = Christine.Table:new({"a2", "b2", "c2"})
	s:debug("t2 = {" .. t2:print() .. "}")
--	local t3 = t1 + t2
--	s:debug("t1 + t2 = " .. t3:print())
--	local t4 = t1 - t2
--	s:debug("t1 - t2 = " .. t4:print())
	local t5 = t1 .. t2
	s:debug("t1 .. t2 = " .. t5:print())
end

function test_christineclass12()
	local t1 = Christine.Table:new({"a1", "b1", "c1"})
	local t2 = Christine.Table:new({"a2", "b2", "c2", "d2", "e2"})
	local t3 = {"a", "s", "d"}
	local t4 = copy(t3)
	DebugMsg(0, 0, #t3 .. " / " .. #t4)
end

function test_christine13()
	local me = Christine.Player:new(OwnerID())
	local monster = Christine.Npc:new():create(100055, me.x, me.y, me.z):addToPartition()
	local battle_listener = Christine.BattleListener:new()
	local system = Christine.System:new("test battle listener", true, true)
	battle_listener:add(monster)
	system:debug(battle_listener:toString())
	monster:attack(me)
	while not monster.is_dead do
		battle_listener:start()
		system:debug(#battle_listener.list)
		system:debug(#monster.hate_list)
		system:debug(#battle_listener.players)
		system:sleep()
	end
end