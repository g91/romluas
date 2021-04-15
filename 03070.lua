----------------------------------------------------------------
--	zone 28 副本 oro_duplication_gorgen
----------------------------------------------------------------
--	1王 果利根 gorgen
----------------------------------------------------------------
--	Christine Class
----------------------------------------------------------------
function gm_oroduplication_create()
	local me = this()
	local boss = Christine.Npc:new():create(107964, me.x, me.y, me.z, 0):addToPartition(0)
end

function Npc_107964_CreatePlot()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if oro_duplication_gorgen and oro_duplication_gorgen[room_id] and oro_duplication_gorgen[room_id].handler then
		oro_duplication_gorgen[room_id].handler:delete()
	end
	oro_duplication_gorgen_initialize(room_id)

	Cl_Resist_HackersBossNum()
end

function Npc_107964_DeadPlot()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	oro_duplication_gorgen[room_id].status = "success"
	oro_duplication_gorgen[room_id].gorgen.is_ai_stop = true
	oro_duplication_gorgen[room_id].rear_door:delete()
	Cl_Resist_HackersBossDead()
end

function gm_oroduplication_cancelbuff()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	oro_duplication_gorgen[room_id].gorgen:cancelBuff(624882)
	oro_duplication_gorgen[room_id].gorgen:cancelBuff(624885)
end

function oro_duplication_gorgen_setting()
	oro_duplication_gorgen = Christine.System:new("ORO Duplication Gorgen")

	----------------------------------------------------------------
	--	每次初始化設定
	----------------------------------------------------------------
	oro_duplication_gorgen.alpha = false

	----------------------------------------------------------------
	--	顯示debug訊息
	----------------------------------------------------------------
	oro_duplication_gorgen.beta = true

	----------------------------------------------------------------
	--	系統延遲秒數
	----------------------------------------------------------------
	oro_duplication_gorgen.delay = 0.5

	----------------------------------------------------------------
	--	BOSS隱形替身
	----------------------------------------------------------------
	oro_duplication_gorgen.gorgen_avatar_orgid = 108182
	if this().zone_id == 161 then oro_duplication_gorgen.gorgen_avatar_orgid = 108306 end
	if this().zone_id == 162 then oro_duplication_gorgen.gorgen_avatar_orgid = 108313 end

	----------------------------------------------------------------
	--	小怪編號
	----------------------------------------------------------------
	oro_duplication_gorgen.servants_orgid = {108179, 108180, 108181}
	if this().zone_id == 161 then oro_duplication_gorgen.servants_orgid = {108303, 108304, 108305} end
	if this().zone_id == 162 then oro_duplication_gorgen.servants_orgid = {108310, 108311, 108312} end


	oro_duplication_gorgen.orgin_position = {
		x = this().x,
		y = this().y,
		z = this().z
	} 

	----------------------------------------------------------------
	--	技能
	----------------------------------------------------------------
	oro_duplication_gorgen.skill = {}

	----------------------------------------------------------------
	--	果利根音速砲
	----------------------------------------------------------------
	oro_duplication_gorgen.skill.sonic_cannon = Christine.Skill:new()
	oro_duplication_gorgen.skill.sonic_cannon.name = "sonic_cannon"
	oro_duplication_gorgen.skill.sonic_cannon.cd = 0
	function oro_duplication_gorgen.skill.sonic_cannon:active(caster)
		caster.movable = false
		caster:stopMove()

		caster:castSpell(caster, 851224)
	--	詠唱等待
		oro_duplication_gorgen:sleep(2.5)

		caster.movable = true

		local targets = {}
	--	如果共鳴失敗打4人，否則打6人
		if caster.buff[624880] or caster.buff[624881] then
			if #caster.hate_list > 4 then
				targets = table.random(caster.hate_list, 4)
			else
				targets = caster.hate_list
			end
		else
			if #caster.hate_list > 6 then
				targets = table.random(caster.hate_list, 6)
			else
				targets = caster.hate_list
			end
		end

		for index, target in pairs(targets) do
	--		製造透明球施法
			local _npc = Christine.Npc:new()
			_npc:create(oro_duplication_gorgen.gorgen_avatar_orgid, target.x, target.y, target.z):property({
				fight = false,
				strike_back = false,
				search_enemy = false,
				movable = false,
				 revive = false,
				show_role_head = false,
				hide_hp_mp = true,
				hide_name = true,
				live_time = 3
			}):addToPartition(caster.room_id):castSpell(_npc, 851222)
		end

	--	連擊4次
		local counter = 4
		local is_hit = true
	--	如果盛怒增加次數
		if caster.buff[624881] then counter = counter + caster.buff[624881].power + 1 end
		while oro_duplication_gorgen[caster.room_id].status == "boss" and counter > 0 and is_hit do
			oro_duplication_gorgen:sleep(4)
			is_hit = false
			for index, target in pairs(targets) do
				if target.buff[624899] then
	--				製造透明球施法
					local _npc = Christine.Npc:new()
					_npc:create(oro_duplication_gorgen.gorgen_avatar_orgid, target.x, target.y, target.z):property({
						fight = false,
						strike_back = false,
						search_enemy = false,
						movable = false,
						revive = false,
						show_role_head = false,
						hide_hp_mp = true,
						hide_name = true,
						live_time = 3
					}):addToPartition(caster.room_id):castSpell(_npc, 851222)
					is_hit = true
				end
			end
	--		boss做做樣子
			if is_hit then
				caster:castSpell(caster, 851238)
				oro_duplication_gorgen:debug("skill > sonic_cannon is hit")
			else
				oro_duplication_gorgen:debug("skill > sonic_cannon is not hit")
			end
			counter = counter - 1
		end
		oro_duplication_gorgen:sleep(2)
		oro_duplication_gorgen:debug("skill > sonic_cannon over")
		return true
	end
	function MagicObject_624874()
		return true
	end

	----------------------------------------------------------------
	--	果利根加農砲：盛怒3使用
	----------------------------------------------------------------
	oro_duplication_gorgen.skill.power_cannon = Christine.Skill:new()
	oro_duplication_gorgen.skill.power_cannon.name = "power_cannon"
	oro_duplication_gorgen.skill.power_cannon.cd = 0
	function oro_duplication_gorgen.skill.power_cannon:active(caster)
		caster.movable = false
		caster:stopMove()
		caster:castSpell(caster, 851225)
		caster.buff[624881]:remove()
		oro_duplication_gorgen:sleep(4)
		caster.movable = true
		return true
	end

	----------------------------------------------------------------
	--	巨砲怒擊
	----------------------------------------------------------------
	oro_duplication_gorgen.skill.cannon_strike = Christine.Skill:new()
	oro_duplication_gorgen.skill.cannon_strike.name = "cannon_strike"
	oro_duplication_gorgen.skill.cannon_strike.cd = 7
	function oro_duplication_gorgen.skill.cannon_strike:active(caster)
		if caster.buff[624881] and caster.buff[624881].power >= 2 then
			if caster:useSkill("power_cannon") then
				return false
			end
		end
		caster:castSpell(caster, 851226)
		oro_duplication_gorgen:sleep(2)
		return true
	end

	----------------------------------------------------------------
	--	能量釋放
	----------------------------------------------------------------
	oro_duplication_gorgen.skill.release_energy = Christine.Skill:new()
	oro_duplication_gorgen.skill.release_energy.name = "release_energy"
	oro_duplication_gorgen.skill.release_energy.cd = 17
	function oro_duplication_gorgen.skill.release_energy:active(caster)
		if caster.buff[624881] and caster.buff[624881].power >= 2 then
			if caster:useSkill("power_cannon") then
				return false
			end
		end
		caster.movable = false
		caster:castSpell(caster, 851227)
		oro_duplication_gorgen:sleep(2)
		caster.movable = true
		return true
	end
	function MagicObject_624877()
		local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		if oro_duplication_gorgen[room_id].gorgen.buff[624881] and oro_duplication_gorgen[room_id].gorgen.buff[624881].power >= 2 then
			if oro_duplication_gorgen[room_id].gorgen:useSkill("power_cannon") then
				return false
			end
		end
		local target = Christine.Player:new(TargetID())
		if target.is_player then
			target:message("[$MUTE]".."[SC_DUPLICATION_ORO_05]")
		end
		if target.buff[624879] then target:systemCastSpell(target, 851235) end
		return true
	end

	----------------------------------------------------------------
	--	果利根改造
	----------------------------------------------------------------
	oro_duplication_gorgen.skill.transformation = Christine.Skill:new()
	oro_duplication_gorgen.skill.transformation.name = "transformation"
	oro_duplication_gorgen.skill.transformation.cd = 9
	function oro_duplication_gorgen.skill.transformation:active(caster)
		local targets = {}
		if #caster.hate_list > 2 then table.random(caster.hate_list, 2)
		else targets = caster.hate_list end
		for index, target in pairs(targets) do
			target:addBuff(624888)
		end
		oro_duplication_gorgen:sleep(1)
		return true
	end

	----------------------------------------------------------------
	--	聖鐘BUFF
	--	聖鐘敲響後BOSS先得到BUFF[聖鐘共鳴]，2秒後變成BUFF[聖鐘轉換]，2秒後變成BUFF[聖鐘能量]
	----------------------------------------------------------------
	--	和諧聖鐘共鳴成功
	function MagicObject_624891()
		local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		oro_duplication_gorgen:debug("resonance success")
		for index, player in pairs(oro_duplication_gorgen[room_id].players) do
			if player.is_player then
				player:message("[$MUTE]".."[SC_DUPLICATION_ORO_03]")
			end
		end
		if oro_duplication_gorgen[room_id].gorgen.buff[624880] then oro_duplication_gorgen[room_id].gorgen.buff[624880]:remove() end
		oro_duplication_gorgen[room_id].gorgen:addBuff(624883)
	end
	--	不和諧聖鐘共鳴成功
	function MagicObject_624892()
		local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		oro_duplication_gorgen:debug("resonance success")
		for index, player in pairs(oro_duplication_gorgen[room_id].players) do
			if player.is_player then
				player:message("[$MUTE]".."[SC_DUPLICATION_ORO_03]")
			end
		end
		if oro_duplication_gorgen[room_id].gorgen.buff[624880] then oro_duplication_gorgen[room_id].gorgen.buff[624880]:remove() end
		oro_duplication_gorgen[room_id].gorgen:addBuff(624886)
	end
	--	和諧聖鐘轉化成功
	function MagicObject_624893()
		local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		oro_duplication_gorgen[room_id].gorgen:addBuff(624884)
	end
	--	不和諧聖鐘轉化成功
	function MagicObject_624894()
		local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		oro_duplication_gorgen[room_id].gorgen:addBuff(624887)
	end
	function MagicObject_624898()
		local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		if not oro_duplication_gorgen[room_id].gorgen.buff[624883] and
		   not oro_duplication_gorgen[room_id].gorgen.buff[624886] then
			oro_duplication_gorgen[room_id].gorgen:addBuff(624880)
		end
	end

	oro_duplication_gorgen:debug("setting done")
end

function oro_duplication_gorgen_initialize(room_id)
	if not oro_duplication_gorgen or oro_duplication_gorgen.alpha then oro_duplication_gorgen_setting() end

	local rear_door

	if oro_duplication_gorgen and
	   oro_duplication_gorgen[room_id] and
	   oro_duplication_gorgen[room_id].rear_door and
	   oro_duplication_gorgen[room_id].rear_door.is_legal then
		rear_door = oro_duplication_gorgen[room_id].rear_door
	end

	oro_duplication_gorgen[room_id] = {}

	if rear_door then
		oro_duplication_gorgen[room_id].rear_door = rear_door
	else
		oro_duplication_gorgen[room_id].rear_door = Christine.Npc:new()
		oro_duplication_gorgen[room_id].rear_door:create(108515, 1930, 3540, -240, 135)
		oro_duplication_gorgen[room_id].rear_door:property {
			mark = false,
			fight = false,
			search_enemy = false,
			strike_back = false,
			hide_hp_mp = true,
			hide_name = true,
			obstruct = true,
			movable = false
		} :addToPartition(room_id)
	end

	oro_duplication_gorgen[room_id].front_door = Christine.Npc:new()
	oro_duplication_gorgen[room_id].front_door:create(108515, 1527, 3543, -642, 310)
	oro_duplication_gorgen[room_id].front_door:property {
			mark = false,
			fight = false,
			search_enemy = false,
			strike_back = false,
			hide_hp_mp = true,
			hide_name = true,
			obstruct = true,
			movable = false
		}

	oro_duplication_gorgen[room_id].handler = Christine.Npc:new()
	oro_duplication_gorgen[room_id].handler:create(107964)
	oro_duplication_gorgen[room_id].battle_listener = Christine.BattleListener:new()
	oro_duplication_gorgen[room_id].players = oro_duplication_gorgen[room_id].battle_listener.players
	oro_duplication_gorgen[room_id].servants = {}
	oro_duplication_gorgen[room_id].status = "standby"
	oro_duplication_gorgen[room_id].resonance_time_mark = 0

	oro_duplication_gorgen[room_id].gorgen = Christine.Npc:new(OwnerID())

	for buff_id, buff in pairs(oro_duplication_gorgen[room_id].gorgen.buff) do buff:remove(false) end

	oro_duplication_gorgen[room_id].gorgen.is_ai_stop = true

--	oro_duplication_gorgen[room_id].gorgen:lockhp(1, "Npc_107964_DeadPlot")

	oro_duplication_gorgen[room_id].battle_listener:add(oro_duplication_gorgen[room_id].gorgen)

	oro_duplication_gorgen[room_id].gorgen:property {
		revive = false,
		is_walk = false,
		fight = true,
		strike_back = true,
		search_enemy = true,
		hp = oro_duplication_gorgen[room_id].gorgen.max_hp
	} :addBuff(502707)

	oro_duplication_gorgen[room_id].gorgen:addSkill("sonic_cannon", oro_duplication_gorgen.skill.sonic_cannon)
	oro_duplication_gorgen[room_id].gorgen:addSkill("power_cannon", oro_duplication_gorgen.skill.power_cannon)
	oro_duplication_gorgen[room_id].gorgen:addSkill("cannon_strike", oro_duplication_gorgen.skill.cannon_strike)
	oro_duplication_gorgen[room_id].gorgen:addSkill("release_energy", oro_duplication_gorgen.skill.release_energy)
	oro_duplication_gorgen[room_id].gorgen:addSkill("transformation", oro_duplication_gorgen.skill.transformation)

	oro_duplication_gorgen:debug("intialize done")
end

function oro_duplication_gorgen_active()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	--Cl_Resist_HackersFightBegin()
	oro_duplication_gorgen[room_id].status = "boss"

	oro_duplication_gorgen[room_id].handler:beginPlot("oro_duplication_gorgen_main")
	oro_duplication_gorgen[room_id].gorgen:beginPlot("oro_duplication_gorgen_ai")

end

function oro_duplication_gorgen_main()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	local gorgen = oro_duplication_gorgen[room_id].gorgen
	local players = oro_duplication_gorgen[room_id].players
	local battle_listener = oro_duplication_gorgen[room_id].battle_listener
	local kick_out_list = {}
	local is_match = false
	local front_door_add_to_partition = false

	local turbo_time = 99999
	if this().zone_id == 160 then
		turbo_time = 480
	elseif this().zone_id == 161 then
		turbo_time = 360
	end

	while oro_duplication_gorgen[room_id].status == "boss" do
		battle_listener:start()

		if battle_listener.duration_time > turbo_time then
			gorgen:addBuff(624344)
		end

		----------------------------------------------------------------
		--	25秒	聖鐘響
		----------------------------------------------------------------
		if battle_listener.duration_time > 3 and battle_listener.current_time % 25 == 0 and
		   oro_duplication_gorgen[room_id].resonance_time_mark ~= battle_listener.current_time then
			oro_duplication_gorgen:debug("san bell resonance")
			oro_duplication_gorgen[room_id].resonance_time_mark = battle_listener.current_time
			--gorgen:systemCastSpell(gorgen, 851236)
		--	聖鐘BUFF
			if gorgen.hp / gorgen.max_hp > 0.5 then
				for index, player in pairs(players) do
					if player.is_player then player:message("[$MUTE]".."[SC_DUPLICATION_ORO_01]") end
				end
				gorgen:addBuff(624882)
			else
				for index, player in pairs(players) do
					if player.is_player then player:message("[$MUTE]".."[SC_DUPLICATION_ORO_02]") end
				end
				gorgen:addBuff(624885)
			end
		--	出小怪
			local amount = 1
			if gorgen.buff[624884] then amount = amount + gorgen.buff[624884].power + 1 end
			if gorgen.buff[624887] then amount = amount + gorgen.buff[624887].power + 1 end
			if amount > 6 then amount = 6 end
			for index = 1, amount do
				local servant = Christine.Npc:new():create(
					oro_duplication_gorgen.servants_orgid[RandRange(1, #oro_duplication_gorgen.servants_orgid)],
					gorgen.x - 60 + RandRange(1, 120),
					gorgen.y,
					gorgen.z - 60 + RandRange(1, 120)
				):property({
					patrol = false,
					is_walk = false,
					revive = false,
					fight = true,
					strike_back = true,
					search_enemy = true
				}):addToPartition(room_id)
		--		改造失敗
				if RandRange(1, 2) > 1 then
					servant:addBuff(624878)
				end
				table.insert(oro_duplication_gorgen[room_id].servants, servant)
			end
		end

		----------------------------------------------------------------
		--	小怪排除和AI
		----------------------------------------------------------------
		kick_out_list = {}
		for index, servant in pairs(oro_duplication_gorgen[room_id].servants) do
			if not servant.is_legal or servant.is_dead then
				table.insert(kick_out_list, servant)
			elseif #servant.hate_list <= 0 and #gorgen.hate_list > 0 then
				servant:hate(gorgen.hate_list[RandRange(1, #gorgen.hate_list)])
			elseif #servant.hate_list > 0 then
				for index, hater in pairs(servant.hate_list) do
					gorgen:hate(hater)
				end
			end
		end
		if #kick_out_list > 0 then
			oro_duplication_gorgen:debug("servant #kick_out_list : " .. #kick_out_list)
			oro_duplication_gorgen:debug("before kick out #servants : " .. #oro_duplication_gorgen[room_id].servants)
			for index = 1, #kick_out_list do
				for servant_index, servant in pairs(oro_duplication_gorgen[room_id].servants) do
					if kick_out_list[index] == servant then table.remove(oro_duplication_gorgen[room_id].servants, servant_index) break end
				end
			end
			oro_duplication_gorgen:debug("after kick out #servants : " .. #oro_duplication_gorgen[room_id].servants)
		end

		----------------------------------------------------------------
		--	睡覺
		----------------------------------------------------------------
		oro_duplication_gorgen:sleep()

		if not front_door_add_to_partition and battle_listener.duration_time > 0 then
			front_door_add_to_partition = true
			oro_duplication_gorgen[room_id].front_door:addToPartition(room_id)
		end

		----------------------------------------------------------------
		--	失敗
		----------------------------------------------------------------
		if battle_listener.duration_time > 3 and #players <= 0 then
			oro_duplication_gorgen[room_id].status = "fail"
			gorgen.fight = false
			gorgen.search_enemy =  false
			gorgen.strike_back = false
			gorgen:stopAttack()
		end

		----------------------------------------------------------------
		--	debug
		----------------------------------------------------------------
--		oro_duplication_gorgen:debug("#hate_list : " .. #gorgen.hate_list .. ", #players : " .. #players)

	end
	battle_listener:stop()
	oro_duplication_gorgen[room_id].front_door:delete()

	for index, player in pairs(battle_listener.players) do
		for buff_id, buff in pairs(player.buff) do
			if not buff.is_positive then buff:remove(false) end
		end
	end

	for index, servant in pairs(oro_duplication_gorgen[room_id].servants) do servant:delete() end

	oro_duplication_gorgen:sleep(1)

	while not oro_duplication_gorgen[room_id].gorgen.is_ai_stop do oro_duplication_gorgen:sleep() end

	if oro_duplication_gorgen[room_id].status == "success" then
		oro_duplication_gorgen:debug("success")
--		gorgen:unlockhp()
	elseif oro_duplication_gorgen[room_id].status == "fail" then
		oro_duplication_gorgen:debug("fail")
		for buff_id, buff in pairs(gorgen.buff) do buff:remove(false) end
		gorgen:hide_from_room()
		gorgen:position {
			x = oro_duplication_gorgen.orgin_position.x,
			y = oro_duplication_gorgen.orgin_position.y,
			z = oro_duplication_gorgen.orgin_position.z
		}
		oro_duplication_gorgen:sleep(3)
		gorgen:show_to_room(room_id)
		gorgen:callPlot("oro_duplication_gorgen_initialize", room_id)
	end

	oro_duplication_gorgen:debug("oro_duplication_gorgen_gorgen_main() end")
end

function oro_duplication_gorgen_ai()
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
	local gorgen = oro_duplication_gorgen[room_id].gorgen
	gorgen.is_ai_stop = false
	gorgen:property {
		fight = true,
		movable = true,
		strike_back = true,
		search_enemy = true
	}
	local battle_listener = oro_duplication_gorgen[room_id].battle_listener
	local sonic_cannon_time_mark = 0

	while oro_duplication_gorgen[room_id].status == "boss" do
		if #gorgen.hate_list > 0 then
			if oro_duplication_gorgen[room_id].resonance_time_mark ~= sonic_cannon_time_mark and
			   battle_listener.current_time - oro_duplication_gorgen[room_id].resonance_time_mark >= 2 then
				oro_duplication_gorgen:debug("2 seconds after resonance, current_time : " .. battle_listener.current_time .. ", resonance_time_mark : " .. oro_duplication_gorgen[room_id].resonance_time_mark)
				sonic_cannon_time_mark = oro_duplication_gorgen[room_id].resonance_time_mark
				gorgen:useSkill("sonic_cannon")
			end
			gorgen:useSkill("release_energy")
			gorgen:useSkill("transformation")
			gorgen:useSkill("cannon_strike")
		end
		oro_duplication_gorgen:sleep()
	end

	gorgen.is_ai_stop = true
end