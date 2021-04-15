-----------------------------------------------------------------
--	更新儲存npc資訊
-----------------------------------------------------------------
function Lua_BellatiaDuplication_initialize_npc(room_id)
	Global_BellatiaDuplication:debug("initialize npc -> Lua_BellatiaDuplication_initialize_npc(" .. room_id .. ")")
	Lua_BellatiaDuplication_initialize_npc_cassam(room_id)
	Global_BellatiaDuplication[room_id].cassam:addToPartition(room_id)
	Lua_BellatiaDuplication_initialize_npc_feitlautrec(room_id)
	Global_BellatiaDuplication[room_id].feitlautrec:addToPartition(room_id)
	Lua_BellatiaDuplication_initialize_npc_feitlautrec_sungchili(room_id)
	Global_BellatiaDuplication[room_id].feitlautrec_sungchili:addToPartition(room_id)
	Lua_BellatiaDuplication_initialize_npc_ironrose(room_id)
	Global_BellatiaDuplication[room_id].ironrose:addToPartition(room_id)
	Lua_BellatiaDuplication_initialize_npc_jill(room_id)
	Global_BellatiaDuplication[room_id].jill:addToPartition(room_id)
	Lua_BellatiaDuplication_initialize_npc_kangersy(room_id)
	Global_BellatiaDuplication[room_id].kangersy:addToPartition(room_id)
	Lua_BellatiaDuplication_initialize_npc_mansuoruien(room_id)
	Global_BellatiaDuplication[room_id].mansuoruien:addToPartition(room_id)
	Lua_BellatiaDuplication_initialize_npc_morrok(room_id)
	Global_BellatiaDuplication[room_id].morrok:addToPartition(room_id)
	Lua_BellatiaDuplication_initialize_npc_pangkorrams(room_id)
--	Global_BellatiaDuplication[room_id].pangkorrams:addToPartition(room_id)
	Lua_BellatiaDuplication_initialize_npc_pangkorrams_dragon(room_id)
	Global_BellatiaDuplication[room_id].pangkorrams_dragon:addToPartition(room_id)
	Global_BellatiaDuplication:debug("npc initialized")
end

function Lua_BellatiaDuplication_initialize_npc_pangkorrams(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	光龍
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].pangkorrams then
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].pangkorrams.buff) do Global_BellatiaDuplication[room_id].pangkorrams:cancelBuff(buff_id) end
		Global_BellatiaDuplication[room_id].pangkorrams:stopAttack()
		Global_BellatiaDuplication[room_id].pangkorrams:stopMove()
		Global_BellatiaDuplication[room_id].pangkorrams:removeAllEventListener()
		Global_BellatiaDuplication[room_id].pangkorrams.patrol = false
		Global_BellatiaDuplication[room_id].pangkorrams.movable = true
		Global_BellatiaDuplication[room_id].pangkorrams.fight = true
		Global_BellatiaDuplication[room_id].pangkorrams.strike_back = true
		Global_BellatiaDuplication[room_id].pangkorrams.search_enemy = true
		Global_BellatiaDuplication[room_id].pangkorrams.gravity = true
		Global_BellatiaDuplication[room_id].pangkorrams.align_to_surface = true
--		Global_BellatiaDuplication[room_id].pangkorrams.hide = false
		Global_BellatiaDuplication[room_id].pangkorrams.show = true
		Global_BellatiaDuplication[room_id].pangkorrams.mark = true
		Global_BellatiaDuplication[room_id].pangkorrams.is_walk = 0
		Global_BellatiaDuplication[room_id].pangkorrams.register10 = save_point
		LockHP(Global_BellatiaDuplication[room_id].pangkorrams.GUID, 1, "BellatiaDuplication_deadplot")
		if save_point > 8 then
--			Global_BellatiaDuplication[room_id].pangkorrams.hide = true
			Global_BellatiaDuplication[room_id].pangkorrams.show = false
			Global_BellatiaDuplication[room_id].pangkorrams.mark = false
			Global_BellatiaDuplication[room_id].pangkorrams.hide_hp_mp = true
			Global_BellatiaDuplication[room_id].pangkorrams.show_role_head = true
		end
		if save_point == 4 then
			Global_BellatiaDuplication[room_id].pangkorrams.fight = false
			Global_BellatiaDuplication[room_id].pangkorrams.strike_back = false
			Global_BellatiaDuplication[room_id].pangkorrams.search_enemy = false
		end
		Global_BellatiaDuplication[room_id].pangkorrams:setPosition(
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 1)].x,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 1)].y,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 1)].z,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 1)].direction
		)
		Global_BellatiaDuplication:debug("pangkorrams initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_npc_morrok(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	摩瑞克
	-----------------------------------------------------------------
	Global_BellatiaDuplication.morrok_orgid = 122435
	Global_BellatiaDuplication.morrok_god_orgid = 122752
	if Global_BellatiaDuplication.type == "normal" then
		Global_BellatiaDuplication.morrok_orgid = 122777
		Global_BellatiaDuplication.morrok_god_orgid = 122781
	elseif Global_BellatiaDuplication.type == "easy" then
		Global_BellatiaDuplication.morrok_orgid = 122785
		Global_BellatiaDuplication.morrok_god_orgid = 122789
	end

	if Global_BellatiaDuplication[room_id].morrok then
		if save_point < 9 and Global_BellatiaDuplication[room_id].morrok.ORGID ~= Global_BellatiaDuplication.morrok_orgid then
			Global_BellatiaDuplication[room_id].morrok:delete()
			Global_BellatiaDuplication[room_id].morrok:create(Global_BellatiaDuplication.morrok_orgid)
		elseif save_point > 8 and Global_BellatiaDuplication[room_id].morrok.ORGID ~= Global_BellatiaDuplication.morrok_god_orgid then
			Global_BellatiaDuplication[room_id].morrok:delete()
			Global_BellatiaDuplication[room_id].morrok:create(Global_BellatiaDuplication.morrok_god_orgid)
		end
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].morrok.buff) do Global_BellatiaDuplication[room_id].morrok:cancelBuff(buff_id) end
		Global_BellatiaDuplication[room_id].morrok:stopAttack()
		Global_BellatiaDuplication[room_id].morrok:stopMove()
		Global_BellatiaDuplication[room_id].morrok:removeAllEventListener()
		Global_BellatiaDuplication[room_id].morrok.patrol = false
		Global_BellatiaDuplication[room_id].morrok.movable = true
		Global_BellatiaDuplication[room_id].morrok.fight = true
		Global_BellatiaDuplication[room_id].morrok.strike_back = true
		Global_BellatiaDuplication[room_id].morrok.search_enemy = true
		Global_BellatiaDuplication[room_id].morrok.gravity = true
		Global_BellatiaDuplication[room_id].morrok.align_to_surface = true
--		Global_BellatiaDuplication[room_id].morrok.hide = false
		Global_BellatiaDuplication[room_id].morrok.show = true
		Global_BellatiaDuplication[room_id].morrok.mark = true
		Global_BellatiaDuplication[room_id].morrok.is_walk = 0
		LockHP(Global_BellatiaDuplication[room_id].morrok.GUID, 1, "BellatiaDuplication_deadplot")
		if save_point == 4 then
			Global_BellatiaDuplication[room_id].morrok.fight = false
			Global_BellatiaDuplication[room_id].morrok.strike_back = false
			Global_BellatiaDuplication[room_id].morrok.search_enemy = false
		end
		Global_BellatiaDuplication[room_id].morrok:setPosition(
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 2)].x,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 2)].y,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 2)].z,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 2)].direction
		)
		Global_BellatiaDuplication:debug("morrok initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_npc_jill(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	吉兒
	-----------------------------------------------------------------
	Global_BellatiaDuplication.jill_orgid = 122464
	Global_BellatiaDuplication.jill_god_orgid = 122753
	if Global_BellatiaDuplication.type == "normal" then
		Global_BellatiaDuplication.jill_orgid = 122778
		Global_BellatiaDuplication.jill_god_orgid = 122782
	elseif Global_BellatiaDuplication.type == "easy" then
		Global_BellatiaDuplication.jill_orgid = 122786
		Global_BellatiaDuplication.jill_god_orgid = 122790
	end

	if Global_BellatiaDuplication[room_id].jill then
		if save_point < 9 and Global_BellatiaDuplication[room_id].jill.ORGID ~= Global_BellatiaDuplication.jill_orgid then
			Global_BellatiaDuplication[room_id].jill:delete()
			Global_BellatiaDuplication[room_id].jill:create(Global_BellatiaDuplication.jill_orgid)
		elseif save_point > 8 and Global_BellatiaDuplication[room_id].jill.ORGID ~= Global_BellatiaDuplication.jill_god_orgid then
			Global_BellatiaDuplication[room_id].jill:delete()
			Global_BellatiaDuplication[room_id].jill:create(Global_BellatiaDuplication.jill_god_orgid)
		end
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].jill.buff) do Global_BellatiaDuplication[room_id].jill:cancelBuff(buff_id) end
		Global_BellatiaDuplication[room_id].jill:stopAttack()
		Global_BellatiaDuplication[room_id].jill:stopMove()
		Global_BellatiaDuplication[room_id].jill:removeAllEventListener()
		Global_BellatiaDuplication[room_id].jill.patrol = false
		Global_BellatiaDuplication[room_id].jill.movable = true
		Global_BellatiaDuplication[room_id].jill.fight = true
		Global_BellatiaDuplication[room_id].jill.strike_back = true
		Global_BellatiaDuplication[room_id].jill.search_enemy = true
		Global_BellatiaDuplication[room_id].jill.gravity = true
		Global_BellatiaDuplication[room_id].jill.align_to_surface = true
--		Global_BellatiaDuplication[room_id].jill.hide = false
		Global_BellatiaDuplication[room_id].jill.show = true
		Global_BellatiaDuplication[room_id].jill.mark = true
		Global_BellatiaDuplication[room_id].jill.hide_name = false
		Global_BellatiaDuplication[room_id].jill.is_walk = 0
		LockHP(Global_BellatiaDuplication[room_id].jill.GUID, 1, "BellatiaDuplication_deadplot")
		if save_point == 4 then
			Global_BellatiaDuplication[room_id].jill.fight = false
			Global_BellatiaDuplication[room_id].jill.strike_back = false
			Global_BellatiaDuplication[room_id].jill.search_enemy = false
		end
		Global_BellatiaDuplication[room_id].jill:setPosition(
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 3)].x,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 3)].y,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 3)].z,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 3)].direction
		)
		Global_BellatiaDuplication:debug("jill initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_npc_kangersy(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	康葛斯
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].kangersy then
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].kangersy.buff) do Global_BellatiaDuplication[room_id].kangersy:cancelBuff(buff_id) end
	--	不滅者開關
		Global_BellatiaDuplication[room_id].kangersy.is_imperishable = true
		Global_BellatiaDuplication[room_id].kangersy:stopAttack()
		Global_BellatiaDuplication[room_id].kangersy:stopMove()
		Global_BellatiaDuplication[room_id].kangersy:removeAllEventListener()
		Global_BellatiaDuplication[room_id].kangersy.patrol = false
		Global_BellatiaDuplication[room_id].kangersy.movable = true
		Global_BellatiaDuplication[room_id].kangersy.fight = true
		Global_BellatiaDuplication[room_id].kangersy.strike_back = true
		Global_BellatiaDuplication[room_id].kangersy.search_enemy = true
		Global_BellatiaDuplication[room_id].kangersy.gravity = true
		Global_BellatiaDuplication[room_id].kangersy.align_to_surface = true
--		Global_BellatiaDuplication[room_id].kangersy.hide = false
		Global_BellatiaDuplication[room_id].kangersy.show = true
		Global_BellatiaDuplication[room_id].kangersy.mark = true
		Global_BellatiaDuplication[room_id].kangersy.is_walk = 0
		LockHP(Global_BellatiaDuplication[room_id].kangersy.GUID, 1, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].kangersy:setPosition(
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 4)].x,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 4)].y,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 4)].z,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 4)].direction
		)
		Global_BellatiaDuplication:debug("kangersy initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_npc_cassam(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	人王卡薩姆
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].cassam then
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].cassam.buff) do Global_BellatiaDuplication[room_id].cassam:cancelBuff(buff_id) end
		Global_BellatiaDuplication[room_id].cassam:stopAttack()
		Global_BellatiaDuplication[room_id].cassam:stopMove()
		Global_BellatiaDuplication[room_id].cassam:removeAllEventListener()
		Global_BellatiaDuplication[room_id].cassam.patrol = false
		Global_BellatiaDuplication[room_id].cassam.movable = true
		Global_BellatiaDuplication[room_id].cassam.fight = true
		Global_BellatiaDuplication[room_id].cassam.strike_back = true
		Global_BellatiaDuplication[room_id].cassam.search_enemy = true
		Global_BellatiaDuplication[room_id].cassam.gravity = true
		Global_BellatiaDuplication[room_id].cassam.align_to_surface = true
--		Global_BellatiaDuplication[room_id].cassam.hide = false
		Global_BellatiaDuplication[room_id].cassam.show = true
		Global_BellatiaDuplication[room_id].cassam.mark = true
		Global_BellatiaDuplication[room_id].cassam.is_walk = 0
		LockHP(Global_BellatiaDuplication[room_id].cassam.GUID, 1, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].cassam:setPosition(
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 5)].x,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 5)].y,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 5)].z,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 5)].direction
		)
		Global_BellatiaDuplication:debug("cassam initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_npc_ironrose(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	鐵薔薇
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].ironrose then
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].ironrose.buff) do Global_BellatiaDuplication[room_id].ironrose:cancelBuff(buff_id) end
		Global_BellatiaDuplication[room_id].ironrose:stopAttack()
		Global_BellatiaDuplication[room_id].ironrose:stopMove()
		Global_BellatiaDuplication[room_id].ironrose:removeAllEventListener()
		Global_BellatiaDuplication[room_id].ironrose.patrol = false
		Global_BellatiaDuplication[room_id].ironrose.movable = true
		Global_BellatiaDuplication[room_id].ironrose.fight = true
		Global_BellatiaDuplication[room_id].ironrose.strike_back = true
		Global_BellatiaDuplication[room_id].ironrose.search_enemy = true
		Global_BellatiaDuplication[room_id].ironrose.gravity = true
		Global_BellatiaDuplication[room_id].ironrose.align_to_surface = true
--		Global_BellatiaDuplication[room_id].ironrose.hide = false
		Global_BellatiaDuplication[room_id].ironrose.show = true
		Global_BellatiaDuplication[room_id].ironrose.mark = true
		Global_BellatiaDuplication[room_id].ironrose.is_walk = 0
		LockHP(Global_BellatiaDuplication[room_id].ironrose.GUID, 1, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].ironrose:setPosition(
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 6)].x,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 6)].y,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 6)].z,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 6)].direction
		)
		Global_BellatiaDuplication:debug("ironrose initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_npc_pangkorrams_dragon(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	光龍龍型
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].pangkorrams_dragon then
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].pangkorrams_dragon.buff) do Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(buff_id) end
		Global_BellatiaDuplication[room_id].pangkorrams_dragon:stopAttack()
		Global_BellatiaDuplication[room_id].pangkorrams_dragon:stopMove()
		Global_BellatiaDuplication[room_id].pangkorrams_dragon:removeAllEventListener()
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.patrol = false
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.movable = false
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.fight = false
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.strike_back = false
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.search_enemy = false
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.gravity = true
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.align_to_surface = true
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.mark = false
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.show = true
--		Global_BellatiaDuplication[room_id].pangkorrams_dragon.hide = false
		Global_BellatiaDuplication[room_id].pangkorrams_dragon.is_walk = 0
		LockHP(Global_BellatiaDuplication[room_id].pangkorrams_dragon.GUID, 1, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].pangkorrams_dragon:setPosition(
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 7)].x,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 7)].y,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 7)].z,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 7)].direction
		)
		Global_BellatiaDuplication:debug("pangkorrams_dragon initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_npc_feitlautrec(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	法伊羅特
	-----------------------------------------------------------------
	Global_BellatiaDuplication.feitlautrec_orgid = 102993
	Global_BellatiaDuplication.feitlautrec_ally_orgid = 102994
	if Global_BellatiaDuplication.type == "normal" then
		Global_BellatiaDuplication.feitlautrec_orgid = 107992
		Global_BellatiaDuplication.feitlautrec_ally_orgid = 107993
	elseif Global_BellatiaDuplication.type == "easy" then
		Global_BellatiaDuplication.feitlautrec_orgid = 108055
		Global_BellatiaDuplication.feitlautrec_ally_orgid = 108056
	end

	if Global_BellatiaDuplication[room_id].feitlautrec then
		if save_point > 8 and Global_BellatiaDuplication[room_id].feitlautrec.ORGID ~= Global_BellatiaDuplication.feitlautrec_ally_orgid then
			Global_BellatiaDuplication[room_id].feitlautrec:delete()
			Global_BellatiaDuplication[room_id].feitlautrec:create(Global_BellatiaDuplication.feitlautrec_ally_orgid)
		elseif save_point < 9 and Global_BellatiaDuplication[room_id].feitlautrec.ORGID ~= Global_BellatiaDuplication.feitlautrec_orgid then
			Global_BellatiaDuplication[room_id].feitlautrec:delete()
			Global_BellatiaDuplication[room_id].feitlautrec:create(Global_BellatiaDuplication.feitlautrec_orgid)
		end
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].feitlautrec.buff) do Global_BellatiaDuplication[room_id].feitlautrec:cancelBuff(buff_id) end
		Global_BellatiaDuplication[room_id].feitlautrec:stopAttack()
		Global_BellatiaDuplication[room_id].feitlautrec:stopMove()
		Global_BellatiaDuplication[room_id].feitlautrec:removeAllEventListener()
		Global_BellatiaDuplication[room_id].feitlautrec.fight = false
		Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = false
		Global_BellatiaDuplication[room_id].feitlautrec.strike_back = false
		Global_BellatiaDuplication[room_id].feitlautrec.patrol = false
		LockHP(Global_BellatiaDuplication[room_id].feitlautrec.GUID, Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.71, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].feitlautrec:setPosition(
			Global_BellatiaDuplication.boss_initial_position_flag[4].x,
			Global_BellatiaDuplication.boss_initial_position_flag[4].y,
			Global_BellatiaDuplication.boss_initial_position_flag[4].z,
			Global_BellatiaDuplication.boss_initial_position_flag[4].direction
		)
		Global_BellatiaDuplication:debug("feitlautrec initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_npc_feitlautrec_sungchili(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	法伊羅特分身
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].feitlautrec_sungchili then
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].feitlautrec_sungchili.buff) do Global_BellatiaDuplication[room_id].feitlautrec_sungchili:cancelBuff(buff_id) end
		Global_BellatiaDuplication[room_id].feitlautrec_sungchili:stopAttack()
		Global_BellatiaDuplication[room_id].feitlautrec_sungchili:stopMove()
		Global_BellatiaDuplication[room_id].feitlautrec_sungchili:removeAllEventListener()
		Global_BellatiaDuplication[room_id].feitlautrec_sungchili.fight = true
		Global_BellatiaDuplication[room_id].feitlautrec_sungchili.search_enemy = true
		Global_BellatiaDuplication[room_id].feitlautrec_sungchili.strike_back = true
		Global_BellatiaDuplication[room_id].feitlautrec_sungchili.patrol = false
		LockHP(Global_BellatiaDuplication[room_id].feitlautrec_sungchili.GUID, 1, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].feitlautrec_sungchili:setPosition(
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 8)].x,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 8)].y,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 8)].z,
			Global_BellatiaDuplication.npc_initial_position_flag[tonumber(save_point .. 8)].direction
		)
		Global_BellatiaDuplication:debug("feitlautrec_sungchili initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_npc_mansuoruien(room_id)
	local save_point = Global_BellatiaDuplication[room_id].save_point
	-----------------------------------------------------------------
	--	曼索瑞恩
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].mansuoruien then
		for buff_id, buff in pairs(Global_BellatiaDuplication[room_id].mansuoruien.buff) do Global_BellatiaDuplication[room_id].mansuoruien:cancelBuff(buff_id) end
		Global_BellatiaDuplication[room_id].mansuoruien:stopAttack()
		Global_BellatiaDuplication[room_id].mansuoruien:stopMove()
		Global_BellatiaDuplication[room_id].mansuoruien:removeAllEventListener()
		Global_BellatiaDuplication[room_id].mansuoruien.fight = false
		Global_BellatiaDuplication[room_id].mansuoruien.search_enemy = false
		Global_BellatiaDuplication[room_id].mansuoruien.strike_back = false
		Global_BellatiaDuplication[room_id].mansuoruien.patrol = false
		Global_BellatiaDuplication[room_id].mansuoruien.mark = true
		Global_BellatiaDuplication[room_id].mansuoruien.show = true
--		Global_BellatiaDuplication[room_id].mansuoruien.hide = false
		LockHP(Global_BellatiaDuplication[room_id].mansuoruien.GUID, Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.96, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].mansuoruien:setPosition(
			Global_BellatiaDuplication.boss_initial_position_flag[5].x,
			Global_BellatiaDuplication.boss_initial_position_flag[5].y,
			Global_BellatiaDuplication.boss_initial_position_flag[5].z,
			Global_BellatiaDuplication.boss_initial_position_flag[5].direction
		)
		Global_BellatiaDuplication:debug("mansuoruien initialized : " .. save_point)
	end
end

function Lua_BellatiaDuplication_initialize_door_first_advance(room_id)
	if Global_BellatiaDuplication[room_id].door_first_advance then
		Global_BellatiaDuplication[room_id].door_first_advance.hit_counter = 0
		Global_BellatiaDuplication:debug("door first advance initialized")
	end
end