-----------------------------------------------------------------
--	死亡劇情
-----------------------------------------------------------------
function BellatiaDuplication_deadplot()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local orgid = ReadRoleValue(OwnerID(), EM_RoleValue_OrgID)
	if orgid == Global_BellatiaDuplication[room_id].pangkorrams.ORGID then Lua_BellatiaDuplication_PangkorRams_dead() return end
	if orgid == Global_BellatiaDuplication[room_id].kangersy.ORGID then Lua_BellatiaDuplication_Kangersy_dead() return end
	if orgid == Global_BellatiaDuplication[room_id].morrok.ORGID then Lua_BellatiaDuplication_Morrok_dead() return end
	if orgid == Global_BellatiaDuplication[room_id].jill.ORGID then Lua_BellatiaDuplication_Jill_dead() return end
	if orgid == Global_BellatiaDuplication[room_id].feitlautrec.ORGID then Lua_BellatiaDuplication_FeitLautrec_dead_plot() return end
	if orgid == Global_BellatiaDuplication[room_id].cassam.ORGID then Lua_BellatiaDuplication_Cassam_dead() return end
	if Global_BellatiaDuplication_FifthBoss and orgid == Global_BellatiaDuplication_FifthBoss.mansuoruien_sungchili_orgid then Lua_BellatiaDuplication_mansuoruien_sungchili_dead() return end
	if orgid == Global_BellatiaDuplication[room_id].mansuoruien.ORGID then Lua_BellatiaDuplication_Mansuoruien_dead() end
	if Global_BellatiaDuplication_FourthBoss and orgid == Global_BellatiaDuplication_FourthBoss.small_fire_element then Lua_BellatiaDuplication_FeitLautrec_servant1() return end
	if Global_BellatiaDuplication_FourthBoss and orgid == Global_BellatiaDuplication_FourthBoss.big_fire_element then Lua_BellatiaDuplication_FeitLautrec_servant2() return end
--	Global_BellatiaDuplication:debug("smoebody dead, orgid : " .. orgid)
end

-----------------------------------------------------------------
--	光龍
-----------------------------------------------------------------
function Lua_BellatiaDuplication_PangkorRams_dead()
	Global_BellatiaDuplication:debug("PangkorRams dead")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if not Lua_BellatiaDuplication_check_status(room_id, "fail") then Lua_BellatiaDuplication_change_status(room_id, "fail") end
	if Lua_BellatiaDuplication_check_status(room_id, "fail") then
		if Global_BellatiaDuplication[room_id].save_point < 9 then Lua_BellatiaDuplication_change_status(room_id, "fail") end
		Global_BellatiaDuplication[room_id].pangkorrams.fight = false
		Global_BellatiaDuplication[room_id].pangkorrams.movable = false
		Global_BellatiaDuplication[room_id].pangkorrams.search_enemy = false
		Global_BellatiaDuplication[room_id].pangkorrams.strike_back = false
		Global_BellatiaDuplication[room_id].pangkorrams:stopAttack()
		Global_BellatiaDuplication[room_id].pangkorrams:stopMove()
		Global_BellatiaDuplication[room_id].pangkorrams:playMotion(ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	end
	Global_BellatiaDuplication[room_id].pangkorrams:systemCastSpell(Global_BellatiaDuplication[room_id].pangkorrams, 851101)
end

-----------------------------------------------------------------
--	魔瑞克&吉兒
-----------------------------------------------------------------
function Lua_BellatiaDuplication_Morrok_dead()
	Global_BellatiaDuplication:debug("Morrok dead")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if Lua_BellatiaDuplication_check_status(room_id, "fail") then
		Global_BellatiaDuplication[room_id].morrok.fight = false
		Global_BellatiaDuplication[room_id].morrok.movable = false
		Global_BellatiaDuplication[room_id].morrok.search_enemy = false
		Global_BellatiaDuplication[room_id].morrok.strike_back = false
		Global_BellatiaDuplication[room_id].morrok:stopAttack()
		Global_BellatiaDuplication[room_id].morrok:stopMove()
		Global_BellatiaDuplication[room_id].morrok:playMotion(ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	end
	Global_BellatiaDuplication[room_id].morrok:systemCastSpell(Global_BellatiaDuplication[room_id].morrok, 851101)
end
function Lua_BellatiaDuplication_Jill_dead()
	Global_BellatiaDuplication:debug("Jill dead")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if Lua_BellatiaDuplication_check_status(room_id, "fail") then
		Global_BellatiaDuplication[room_id].jill.fight = false
		Global_BellatiaDuplication[room_id].jill.movable = false
		Global_BellatiaDuplication[room_id].jill.search_enemy = false
		Global_BellatiaDuplication[room_id].jill.strike_back = false
		Global_BellatiaDuplication[room_id].jill:stopAttack()
		Global_BellatiaDuplication[room_id].jill:stopMove()
		Global_BellatiaDuplication[room_id].jill:playMotion(ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	end
	Global_BellatiaDuplication[room_id].jill:systemCastSpell(Global_BellatiaDuplication[room_id].jill, 851101)
end

-----------------------------------------------------------------
--	康葛斯
-----------------------------------------------------------------
function Lua_BellatiaDuplication_Kangersy_dead()
	Global_BellatiaDuplication:debug("Kangersy dead")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if Global_BellatiaDuplication[room_id].kangersy.is_imperishable then
		Global_BellatiaDuplication[room_id].kangersy:beginPlot("Lua_BellatiaDuplication_Kangersy_dead_plot")
	end
end
function Lua_BellatiaDuplication_Kangersy_dead_plot()
	Global_BellatiaDuplication:debug("Kangersy rebirth")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local Kangersy = Global_BellatiaDuplication[room_id].kangersy
	if Kangersy.is_imperishable then
	--	重生無敵
		Kangersy:stopAttack()
		Kangersy.fight = false
		Kangersy.search_enemy = false
		Kangersy.strike_back = false
		Kangersy:systemCastSpell(Kangersy, 851101)
		Kangersy:playMotion(ruFUSION_ACTORSTATE_DYING)
		Sleep(20)
	--	特效
		Kangersy:castSpell(Kangersy, 850947)
		Sleep(30)
		Kangersy.fight = true
		Kangersy.search_enemy = true
		Kangersy.strike_back = true
		Kangersy:playMotion(ruFUSION_ACTORSTATE_EMOTE_KAMEHAMEHA)
	else
		local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		Kangersy.fight = false
		Kangersy.movable = false
		Kangersy.search_enemy = false
		Kangersy.strike_back = false
		Kangersy:stopAttack()
		Kangersy:stopMove()
		Kangersy:playMotion(ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	end
end

-----------------------------------------------------------------
--	卡薩姆
-----------------------------------------------------------------
function Lua_BellatiaDuplication_Cassam_dead()
	Global_BellatiaDuplication:debug("Cassam dead")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if Lua_BellatiaDuplication_check_status(room_id, "fail") then
		Global_BellatiaDuplication[room_id].cassam.fight = false
		Global_BellatiaDuplication[room_id].cassam.movable = false
		Global_BellatiaDuplication[room_id].cassam.search_enemy = false
		Global_BellatiaDuplication[room_id].cassam.strike_back = false
		Global_BellatiaDuplication[room_id].cassam:stopAttack()
		Global_BellatiaDuplication[room_id].cassam:stopMove()
		Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	end
	Global_BellatiaDuplication[room_id].cassam:systemCastSpell(Global_BellatiaDuplication[room_id].cassam, 851101)
end

-----------------------------------------------------------------
--	法伊羅特
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FeitLautrec_dead_plot()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	if Global_BellatiaDuplication[room_id].save_point > 8 then 
		Global_BellatiaDuplication[room_id].feitlautrec:systemCastSpell(Global_BellatiaDuplication[room_id].feitlautrec, 851101)
	elseif Global_BellatiaDuplication[room_id].save_point == 8 then 
		if Global_BellatiaDuplication[room_id].step == 3 then
--			康葛斯獻技
			LockHP(Global_BellatiaDuplication[room_id].feitlautrec.GUID, Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.61, "BellatiaDuplication_deadplot")
			Global_BellatiaDuplication[room_id].drama_record[4] = true
			Global_BellatiaDuplication[room_id].step = 4
			Global_BellatiaDuplication[room_id].step_trigger = true
		elseif Global_BellatiaDuplication[room_id].step == 4 then
--			光龍犧牲
			LockHP(Global_BellatiaDuplication[room_id].feitlautrec.GUID, Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.51, "BellatiaDuplication_deadplot")
			Global_BellatiaDuplication[room_id].drama_record[5] = true
			Global_BellatiaDuplication[room_id].step = 5
			Lua_BellatiaDuplication_change_status(room_id, "drama")
		elseif Global_BellatiaDuplication[room_id].step == 5 then
			LockHP(Global_BellatiaDuplication[room_id].feitlautrec.GUID, Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.06, "BellatiaDuplication_deadplot")
			Global_BellatiaDuplication[room_id].drama_record[6] = true
			Global_BellatiaDuplication[room_id].step = 6
			Global_BellatiaDuplication[room_id].step_trigger = true
		elseif Global_BellatiaDuplication[room_id].step == 6 then
			LockHP(Global_BellatiaDuplication[room_id].feitlautrec.GUID, 1, "BellatiaDuplication_deadplot")
			Global_BellatiaDuplication[room_id].drama_record[7] = true
			Global_BellatiaDuplication[room_id].step = 7
			Lua_BellatiaDuplication_change_status(room_id, "drama")
		end
	end
end

function Lua_BellatiaDuplication_FeitLautrec_servant1()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local servant = nil
	for index, _servant in pairs(Global_BellatiaDuplication[room_id].feitlautrec_servants) do
		if _servant.GUID == OwnerID() then servant = _servant end
	end
	if not servant then
		return
	end


--	小怪死，法伊羅特扣血
	if Global_BellatiaDuplication[room_id].feitlautrec then Global_BellatiaDuplication[room_id].feitlautrec.hp = Global_BellatiaDuplication[room_id].feitlautrec.hp - Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.01 end
	servant.is_live = false
	servant:interruptMagic()
	servant:systemCastSpell(servant, 850919)
	LockHP(OwnerID(), 0, "")
	Sleep(20)
	KillID(OwnerID(), OwnerID())
end

function Lua_BellatiaDuplication_FeitLautrec_servant2()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	for index, servant in pairs(Global_BellatiaDuplication[room_id].feitlautrec_servants) do
		if servant.GUID == OwnerID() then servant.is_live = false end
	end

--	小怪死，法伊羅特扣血
	if Global_BellatiaDuplication[room_id].feitlautrec then Global_BellatiaDuplication[room_id].feitlautrec.hp = Global_BellatiaDuplication[room_id].feitlautrec.hp - Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.02 end
	LockHP(OwnerID(), 0, "")
	KillID(OwnerID(), OwnerID())
end

function Lua_BellatiaDuplication_Mansuoruien_dead()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	Global_BellatiaDuplication:debug("mansuoruien dead plot")
	if Global_BellatiaDuplication[room_id].step == 1 then
		LockHP(OwnerID(), Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.86, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].step = 2
		Global_BellatiaDuplication:debug("mansuoruien hp <= 95%, change to step 2")
	elseif Global_BellatiaDuplication[room_id].step == 3 then
		LockHP(OwnerID(), Global_BellatiaDuplication[room_id].mansuoruien.max_hp * 0.81, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].step = 4
		Global_BellatiaDuplication:debug("mansuoruien hp <= 85%, change to step 4")
	elseif Global_BellatiaDuplication[room_id].step == 5 then
		LockHP(OwnerID(), 1, "BellatiaDuplication_deadplot")
		Global_BellatiaDuplication[room_id].step = 6
		Global_BellatiaDuplication:debug("mansuoruien hp <= 80%, change to step 6")
	end
end

function Lua_BellatiaDuplication_mansuoruien_sungchili_dead()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local mansuoruien = nil
	-----------------------------------------------------------------
	--	從Global_BellatiaDuplication[room_id].mansuoruiens認領自己
	-----------------------------------------------------------------
	for index, _mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
		if _mansuoruien.GUID == OwnerID() then
			mansuoruien = _mansuoruien
			break
		end
	end
	if not mansuoruien then return end
	local scripts = {
		"[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_61]",
		"[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_62]",
		"[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_63]",
		"[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_64]",
		"[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_65]",
		"[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_66]",
		"[SC_BELLATIA_DUPLICATION_FIFTH_BOSS_67]"
	}
	Global_BellatiaDuplication:debug("mansuoruien sungchili dead : " .. mansuoruien.index)
	mansuoruien.is_live = false
	mansuoruien.show = false
	mansuoruien.fight = false
	mansuoruien.strike_back = false
	mansuoruien.search_enemy = false
	mansuoruien.mark = false
	mansuoruien.hide_hp_mp = true
	mansuoruien.hide_name = true
	mansuoruien.movable = false
	mansuoruien:say(scripts[RandRange(1, #scripts)], 5)
--	剔除該分身
	Global_BellatiaDuplication[room_id].battleListener:remove(mansuoruien)
--	其他分身技成能力
	for _index, _mansuoruien in pairs(Global_BellatiaDuplication[room_id].mansuoruiens) do
		if mansuoruien.index == 1 then
			_mansuoruien:addBuff(624597)
			_mansuoruien:addSkill("fatal_ruling", Global_BellatiaDuplication_FifthBoss.skill_fatal_ruling)
		elseif mansuoruien.index == 2 then
			_mansuoruien:addBuff(624598)
			_mansuoruien:addSkill("vacuum_extrusion", Global_BellatiaDuplication_FifthBoss.skill_vacuum_extrusion)
		elseif mansuoruien.index == 3 then
			_mansuoruien:addBuff(624599)
			_mansuoruien:addSkill("devastating_chain", Global_BellatiaDuplication_FifthBoss.skill_devastating_chain)
		elseif mansuoruien.index == 4 then
			_mansuoruien:addBuff(624600)
			_mansuoruien:addSkill("cracking_torrent", Global_BellatiaDuplication_FifthBoss.skill_cracking_torrent)
		end
	end
end

