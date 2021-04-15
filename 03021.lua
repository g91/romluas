-------------------------------------------------------------------
--	Zone 26 World Boss	Qulanda
-------------------------------------------------------------------
-------------------------------------------------------------------
--	GM
-------------------------------------------------------------------
function gm_worldboss_qulanda_check_players()
	Global_WorldBoss_Qulanda:debug("#players : " .. #Global_WorldBoss_Qulanda.players)
	for index, player in pairs(Global_WorldBoss_Qulanda.players) do
		Global_WorldBoss_Qulanda:debug("players[" .. index .. "] : " .. player.GUID)
	end
end
function gm_worldboss_qulanda_change_status(_status)
	Global_WorldBoss_Qulanda.status = _status
end
function gm_worldboss_qulanda_check_status()
	DebugMsg(0, 0, "status : "..Global_WorldBoss_Qulanda.status)
end
function gm_worldboss_qulanda_get_mild_burn()
	this():addBuff(624700)
end
function gm_worldboss_qulanda_get_revere_burn()
	this():addBuff(624701)
end
function gm_worldboss_qulanda_interrupt_magic()
	Global_WorldBoss_Qulanda.qulanda:interruptMagic()
	Global_WorldBoss_Qulanda.sun:interruptMagic()
end
function gm_worldboss_qulanda_reduce_hp()
	Global_WorldBoss_Qulanda.qulanda.hp = Global_WorldBoss_Qulanda.qulanda.hp - Global_WorldBoss_Qulanda.qulanda.max_hp * 0.05
end
function gm_worldboss_qulanda_debuger()
	Global_WorldBoss_Qulanda:addRoomRecipient(this().room_id, this())
end
function gm_worldboss_qulanda_tester()
	if not Global_WorldBoss_Qulanda.testers then Global_WorldBoss_Qulanda.testers = {} end
	for index, tester in pairs(Global_WorldBoss_Qulanda.testers) do
		if tester.GUID == this().GUID then return false end
	end
	table.insert(Global_WorldBoss_Qulanda.testers, this())
end

function gm_worldboss_qulanda_cleanup()
	Global_WorldBoss_Qulanda = nil
	DebugMsg(0, 0, tostring(Global_WorldBoss_Qulanda))
end

function gm_worldboss_qulanda_active()
	Global_WorldBoss_Qulanda.qulanda:property({
		movable = true,
		search_enemy = true,
		strike_back = true,
		fight = true
	})
	Global_WorldBoss_Qulanda.qulanda:show_to_room(0)
end

function gm_worldboss_qulanda_inactive()
	Global_WorldBoss_Qulanda.qulanda:property({
		movable = false,
		search_enemy = false,
		strike_back = false,
		fight = false
	})
	Global_WorldBoss_Qulanda.qulanda:hide_from_room()
end