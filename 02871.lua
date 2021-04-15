--------------------------------------------------------------
--	���H�i	mandara
--------------------------------------------------------------
function GM_WorldBoss_Mandara_create()
	local me = Christine.Player:new(OwnerID())
	local madara = Christine.Npc:new()
	madara:create(107792, me.x, me.y, me.z, me.direction)
	madara:addToPartition()
end
function Npc_107792_create()
	if Global_WorldBoss_Mandara and Global_WorldBoss_Mandara.handler then Global_WorldBoss_Mandara.handler:delete() end
	Global_WorldBoss_Mandara = Christine.System:new("Mandara", true, true)

	worldboss_mandara_setting()

	worldboss_mandara_initialize()

end
function Npc_107792_fight()
	Global_WorldBoss_Mandara:debug("boss fight")
	if Global_WorldBoss_Mandara.status == "standby" then
		worldboss_mandara_fight()
	end
end
function Npc_107792_Dead()
	if Global_WorldBoss_Mandara.status == "fight" then
		Global_WorldBoss_Mandara.status = "success"
		Global_WorldBoss_Mandara:debug("boss dead")
	end

	---------------------------------------------------------------------
	--	�M�� �p�j�� �M �j���
	---------------------------------------------------------------------
	for index, npc in pairs(Global_WorldBoss_Mandara.battle_listener.list) do
		if npc.ORGID ~= Global_WorldBoss_Mandara.boss_orgid_easy and npc.ORGID ~= Global_WorldBoss_Mandara.boss_orgid_hard then
			npc:delete()
		end
	end
end
function Npc_107792_fightEnd()
--	Global_WorldBoss_Mandara:debug("boss leave fight")
--	Global_WorldBoss_Mandara.status = "fail"
--	Global_WorldBoss_Mandara.mandara:property {
--		fight = false,
--		search_enemy = false,
--		strike_back = false
--	}
end

--------------------------------------------------------------
--	�j��
--------------------------------------------------------------
function Npc_107802_create()
	this():setFlag(544801, 1)

	if not Global_WorldBoss_Mandara.status == "fight" or not Global_WorldBoss_Mandara.status == "standby" then
		this():delete()
	end

	Global_WorldBoss_Mandara.battle_listener:add(this())

	if Global_WorldBoss_Mandara.servants_amount then
		Global_WorldBoss_Mandara.servants_amount = Global_WorldBoss_Mandara.servants_amount + 1
	end
end
function Npc_107802_fight()
	Global_WorldBoss_Mandara:debug("servant fight")
	if Global_WorldBoss_Mandara.status == "standby" then
		worldboss_mandara_fight()
	end

	this():beginPlot("worldboss_mandara_servant_ai")
end
function Npc_107802_Dead()

	Global_WorldBoss_Mandara.battle_listener:remove(this())

	if Global_WorldBoss_Mandara.servants_amount then
		Global_WorldBoss_Mandara.servants_amount = Global_WorldBoss_Mandara.servants_amount - 1
	end

	this():delete()
end

--------------------------------------------------------------
--	�j���
--------------------------------------------------------------
function Npc_107790_create()
	this():addBuff(508082):property {
		live_time = 60,
		disable_rotate = true
	} :lockhp(1, "worldboss_mandara_dead"):setFlag(544801, 1)

	Global_WorldBoss_Mandara.battle_listener:add(this())

	if Global_WorldBoss_Mandara.webs_amount then
		Global_WorldBoss_Mandara.webs_amount = Global_WorldBoss_Mandara.webs_amount + 1
	end
end
function Npc_107790_fight()
	if Global_WorldBoss_Mandara.status == "standby" then
		worldboss_mandara_fight()
		Global_WorldBoss_Mandara.mandara:hate(Christine.Player:new(this().attack_target_GUID))
	end
end
function Npc_107790_Dead()
	if Global_WorldBoss_Mandara.webs_amount then
		Global_WorldBoss_Mandara.webs_amount = Global_WorldBoss_Mandara.webs_amount - 1
	end
end

--------------------------------------------------------------
--	���`�@��
--------------------------------------------------------------
function worldboss_mandara_dead()
	local orgid = this().ORGID
	if orgid == Global_WorldBoss_Mandara.boss_orgid_easy then
		worldboss_mandara_boss_dead()
	elseif orgid == Global_WorldBoss_Mandara.boss_orgid_hard then
		worldboss_mandara_boss_dead()
	elseif orgid == Global_WorldBoss_Mandara.web_orgid then
		worldboss_mandara_web_hit()
	end
end
function worldboss_mandara_boss_dead()
	Global_WorldBoss_Mandara:debug("boss dead")
end
function worldboss_mandara_web_hit()

	local web = this()

	---------------------------------------------------------------------
	--	�j����Q����������
	---------------------------------------------------------------------
	web.register1 = web.register1 + 1

	Global_WorldBoss_Mandara:debug("hit web : " .. web.register1)

	if web.register1 > 3 then
		web:unlockhp()
	end
end

--------------------------------------------------------------
--	��l��
--------------------------------------------------------------
function worldboss_mandara_initialize()

	Global_WorldBoss_Mandara.battle_listener = Christine.BattleListener:new()
	Global_WorldBoss_Mandara.battle_listener.kick_out_player_delay = 1

	Global_WorldBoss_Mandara.mandara = this()

	Global_WorldBoss_Mandara.handler = Christine.Npc:new()
	Global_WorldBoss_Mandara.handler:create(
		Global_WorldBoss_Mandara.boss_orgid_easy,
		Global_WorldBoss_Mandara.mandara.x,
		Global_WorldBoss_Mandara.mandara.y,
		Global_WorldBoss_Mandara.mandara.z,
		Global_WorldBoss_Mandara.mandara.direction)
	Global_WorldBoss_Mandara.handler:property {
		fight = false,
		search_enemy = false,
		strike_back = false,
		mark = false
	}

	local mandara = Global_WorldBoss_Mandara.mandara

	---------------------------------------------------------------------
	--	�԰�
	---------------------------------------------------------------------
	Global_WorldBoss_Mandara.status = "standby"
	Global_WorldBoss_Mandara.servants_amount = 0
	Global_WorldBoss_Mandara.webs_amount = 0

	---------------------------------------------------------------------
	--	boss
	---------------------------------------------------------------------
	mandara:property {
		fight = false,
		search_enemy = true,
		strike_back = true
	}
	--mandara:setFlag(544801, 1):lockhp(1, "worldboss_mandara_dead")
	Global_WorldBoss_Mandara.battle_listener:add(mandara)

	---------------------------------------------------------------------
	--	�ޯ�
	---------------------------------------------------------------------
	mandara:addSkill("web", Global_WorldBoss_Mandara.skill.web):lock()
	mandara:addSkill("burning_ball", Global_WorldBoss_Mandara.skill.burning_ball)
	mandara:addSkill("spread_webs", Global_WorldBoss_Mandara.skill.spread_webs):lock()
	mandara:addSkill("flame_jet", Global_WorldBoss_Mandara.skill.flame_jet):lock()
	mandara:addSkill("holy_totem", Global_WorldBoss_Mandara.skill.holy_totem):lock()
	mandara:addSkill("inabilizily_electricity", Global_WorldBoss_Mandara.skill.inabilizily_electricity)
	mandara:addSkill("fatal_gouge", Global_WorldBoss_Mandara.skill.fatal_gouge)

	---------------------------------------------------------------------
	--	�� �p�j��
	---------------------------------------------------------------------
	local _servant
	local _x, _y, _z = mandara.x, mandara.y, mandara.z
	local _orgid = Global_WorldBoss_Mandara.servant_orgid_hard
	if mandara.ORGID == Global_WorldBoss_Mandara.boss_orgid_easy then _orgid = Global_WorldBoss_Mandara.servant_orgid_easy end

	local _angle = math.pi / Global_WorldBoss_Mandara.servant_birth_amount * 2

	for index = 1, Global_WorldBoss_Mandara.servant_birth_amount do
		_x = mandara.x + Global_WorldBoss_Mandara.servant_birth_radius * math.sin(_angle * index)
		_z = mandara.z + Global_WorldBoss_Mandara.servant_birth_radius * math.cos(_angle * index)
		_servant = Christine.Npc:new()
		_servant:create(_orgid, _x, GetHeight(_x, _y, _z), _z):addToPartition():faceTo(mandara)
	end

	Global_WorldBoss_Mandara:debug("initialized")
end

--------------------------------------------------------------
--	�]�w
--------------------------------------------------------------
function worldboss_mandara_setting()

	--------------------------------------------------------------
	--	�t�γ]�w
	--------------------------------------------------------------
	Global_WorldBoss_Mandara.alpha = false
	Global_WorldBoss_Mandara.beta = true
	Global_WorldBoss_Mandara.delay = 0.5

	--------------------------------------------------------------
	--	���H�i �P ����
	--------------------------------------------------------------
	Global_WorldBoss_Mandara.boss_orgid_easy = 107787
	Global_WorldBoss_Mandara.boss_orgid_hard = 107792

	Global_WorldBoss_Mandara.mode = "hard"
	if this().ORGID == Global_WorldBoss_Mandara.boss_orgid_easy then
		Global_WorldBoss_Mandara.mode = "easy"
	end

	--------------------------------------------------------------
	--	�j��
	--------------------------------------------------------------
	Global_WorldBoss_Mandara.servant_orgid_easy = 107791
	Global_WorldBoss_Mandara.servant_orgid_hard = 107802
	--	�X�ͥb�|
	Global_WorldBoss_Mandara.servant_birth_radius = 80
	--	�X�ͼƶq
	Global_WorldBoss_Mandara.servant_birth_amount = 10
	--	�ƶq�U��
	Global_WorldBoss_Mandara.servant_minimum = 10
	--	�ƶq�W��
	Global_WorldBoss_Mandara.servant_maximum = 20

	--------------------------------------------------------------
	--	�j���
	--------------------------------------------------------------
	Global_WorldBoss_Mandara.web_orgid = 107790
	--	�ƶq�U��
	Global_WorldBoss_Mandara.web_minimum = 6
	--	�ƶq�W��
	Global_WorldBoss_Mandara.web_maximum = 10
	--	�ھڪ��a�H�Ʀ����W��
	Global_WorldBoss_Mandara.web_maximum_rate = 1.6

	--------------------------------------------------------------
	--	�ޯ�
	--------------------------------------------------------------
	Global_WorldBoss_Mandara.skill = {}

	--------------------------------------------------------------
	--	��H����
	--------------------------------------------------------------
	Global_WorldBoss_Mandara.skill.web = Christine.Skill:new()
	Global_WorldBoss_Mandara.skill.web.name = "web"
	Global_WorldBoss_Mandara.skill.web.cd = 10
	function Global_WorldBoss_Mandara.skill.web:active(caster)

		Global_WorldBoss_Mandara:debug("Skill -> web")

		caster.strike_back = false
		caster.movable = false

		for index, player in pairs(Global_WorldBoss_Mandara.battle_listener.players) do
		--	�k�׹�ڬO�S���Ϊ��I
			if player.message then
				player:message("[SC_104705_1]")
			end
		end

		local target

		for index, player in pairs(caster.hate_list) do
			if not target then target = player
			elseif player.hate_point > target.hate_point then target = player end
		end

		if not target then return false end

		caster:playMotion(ruFUSION_ACTORSTATE_CAST_BEGIN):castSpell(target, 850822):sleep(1.5)

		local _web = Christine.Npc:new()
		_web:create(Global_WorldBoss_Mandara.web_orgid, target.x, target.y, target.z, target.direction):addToPartition()

		caster.strike_back = true
		caster.movable = true

		Global_WorldBoss_Mandara:sleep()

		if caster.skill.burning_ball.ready then
			for index, player in pairs(Global_WorldBoss_Mandara.battle_listener.players) do
				if player.buff[624299] then caster:useSkill("burning_ball", player) break end
			end
		end

		Global_WorldBoss_Mandara:sleep()

		return true
	end

	---------------------------------------------------------------------
	--	�U�N���y
	---------------------------------------------------------------------
	Global_WorldBoss_Mandara.skill.burning_ball = Christine.Skill:new()
	Global_WorldBoss_Mandara.skill.burning_ball.name = "burning_ball"
	Global_WorldBoss_Mandara.skill.burning_ball.cd = 12
	function Global_WorldBoss_Mandara.skill.burning_ball:active(caster, target)

		Global_WorldBoss_Mandara:debug("Skill -> burning_ball")

		caster.strike_back = false
		caster.movable = false

		if not target then

			local target = Global_WorldBoss_Mandara.battle_listener.players[RandRange(1, #Global_WorldBoss_Mandara.battle_listener.players)]
			
		end

		if not target then return false end

		for index, player in pairs(Global_WorldBoss_Mandara.battle_listener.players) do
		--	���K�N�I�ƧA������A�b�`�����a�����V�j��k�������H�b���a�I
			if player.message then
				player:message("[SC_104705_2]")
			end
		end

		caster:hate(target):attack(target):castSpell(target, 850825):sleep(2)

		caster.strike_back = true
		caster.movable = true

		Global_WorldBoss_Mandara:sleep()

		return true
	end

	---------------------------------------------------------------------
	--	�f���x��
	---------------------------------------------------------------------
	Global_WorldBoss_Mandara.skill.spread_webs = Christine.Skill:new()
	Global_WorldBoss_Mandara.skill.spread_webs.name = "spread_webs"
	Global_WorldBoss_Mandara.skill.spread_webs.cd = 30
	function Global_WorldBoss_Mandara.skill.spread_webs:active(caster)

		Global_WorldBoss_Mandara:debug("Skill -> spread_webs")

		caster.strike_back = false
		caster.movable = false

		for index, player in pairs(Global_WorldBoss_Mandara.battle_listener.players) do
		--	�b�j�諸��줤�A�A�̳��u�O�y���I
			if player.message then
				player:message("[SC_104705_3]")
			end
		end

		caster:playMotion(ruFUSION_ACTORSTATE_CAST_BEGIN):sleep(1.5)

		caster:playMotion(ruFUSION_ACTORSTATE_CHANNEL_BEGIN):sleep(1.5)

		caster:castSpell(850823):sleep(2.5)

		local _amount = 15

		if (Global_WorldBoss_Mandara.webs_amount + _amount) > (Global_WorldBoss_Mandara.web_maximum + (#Global_WorldBoss_Mandara.battle_listener.players * Global_WorldBoss_Mandara.web_maximum_rate)) then
			_amount = Global_WorldBoss_Mandara.web_maximum + (#Global_WorldBoss_Mandara.battle_listener.players * Global_WorldBoss_Mandara.web_maximum_rate) - Global_WorldBoss_Mandara.webs_amount
		end

		local _web
		local _distance
		local _x, _y, _z = caster.x, caster.y, caster.z
		local _angle = math.pi / _amount * 2

		for index = 1, _amount do
			_web = Christine.Npc:new()
			_distance = RandRange(30, 300)
			_x = caster.x + _distance * math.sin(_angle * index)
			_z = caster.z + _distance * math.cos(_angle * index)
			_web:create(Global_WorldBoss_Mandara.web_orgid, _x, GetHeight(_x, _y, _z), _z, RandRange(1, 360)):addToPartition()

			Global_WorldBoss_Mandara:sleep(0.1)
		end

		caster.strike_back = true
		caster.movable = true

		Global_WorldBoss_Mandara:sleep()

		return true
	end

	---------------------------------------------------------------------
	--	���K�Q�g
	---------------------------------------------------------------------
	Global_WorldBoss_Mandara.skill.flame_jet = Christine.Skill:new()
	Global_WorldBoss_Mandara.skill.flame_jet.name = "flame_jet"
	Global_WorldBoss_Mandara.skill.flame_jet.cd = 25
	function Global_WorldBoss_Mandara.skill.flame_jet:active(caster)

		Global_WorldBoss_Mandara:debug("Skill -> flame_jet")

		caster.strike_back = false
		caster.movable = false
		caster:addBuff(624961)

		for index, player in pairs(Global_WorldBoss_Mandara.battle_listener.players) do
		--	�·Ъ��H���I�j��k�������H������|�N�A�̥����N�ɡI
			if player.message then
				player:message("[SC_104705_4]")
			end
		end

		local is_nobody_near = true

		Global_WorldBoss_Mandara:debug("Skill -> flame_jet : " .. 1)

		caster:castSpell(850828):sleep(3.5)

		for index = 1, 3 do

			for player_index, player in pairs(Global_WorldBoss_Mandara.battle_listener.players) do
				if player:distanceTo(caster) < 80 then is_nobody_near = false break end
			end

			if is_nobody_near then
				caster.skill.inabilizily_electricity.cd = 4
				break
			else
				caster.skill.inabilizily_electricity.cd = 10
			end

			if RandRange(1, 2) == 1 then
				caster:changeDirection(caster, 30)
			else
				caster:changeDirection(caster, -30)
			end

			Global_WorldBoss_Mandara:debug("Skill -> flame_jet : " .. index + 1)

			caster.disable_rotate = true

			caster:castSpell(850827):sleep(2.5)

			caster.disable_rotate = false
		end

		caster.strike_back = true
		caster.movable = true
		caster:cancelBuff(624961)
		
		Global_WorldBoss_Mandara:sleep()

		return true
	end

	---------------------------------------------------------------------
	--	�j��t�L
	---------------------------------------------------------------------
	Global_WorldBoss_Mandara.skill.holy_totem = Christine.Skill:new()
	Global_WorldBoss_Mandara.skill.holy_totem.name = "holy_totem"
	Global_WorldBoss_Mandara.skill.holy_totem.cd = 20
	function Global_WorldBoss_Mandara.skill.holy_totem:active(caster)

		Global_WorldBoss_Mandara:debug("Skill -> holy_totem")

		caster.strike_back = false
		caster.movable = false

		for index, player in pairs(Global_WorldBoss_Mandara.battle_listener.players) do
		--	�j��̡I�����a�I���F�u�ûj��k�������H�����q�ӾԡI
			if player.message then
				player:message("[SC_104705_5]")
			end
		end

		local _servant
		local _x, _y, _z = caster.x, caster.y, caster.z
		local _orgid = Global_WorldBoss_Mandara.servant_orgid_hard
		if caster.ORGID == Global_WorldBoss_Mandara.boss_orgid_easy then _orgid = Global_WorldBoss_Mandara.servant_orgid_easy end

		for index = 1, 5 do
			_x = caster.x - 80 + RandRange(1, 160)
			_z = caster.z - 80 + RandRange(1, 160)
			_servant = Christine.Npc:new()
			_servant:create(_orgid, _x, GetHeight(_x, _y, _z), _z, RandRange(1, 360)):addToPartition()
		end

		caster:castSpell(850820)

		caster.strike_back = true
		caster.movable = true
		
		Global_WorldBoss_Mandara:sleep()

		return true
	end

	---------------------------------------------------------------------
	--	�L�O�ƹq�y
	---------------------------------------------------------------------
	Global_WorldBoss_Mandara.skill.inabilizily_electricity = Christine.Skill:new()
	Global_WorldBoss_Mandara.skill.inabilizily_electricity.name = "inabilizily_electricity"
	Global_WorldBoss_Mandara.skill.inabilizily_electricity.cd = 10
	function Global_WorldBoss_Mandara.skill.inabilizily_electricity:active(caster)

		Global_WorldBoss_Mandara:debug("Skill -> inabilizily_electricity")

		caster.strike_back = false
		caster.movable = false

		local targets = {}

		for index, player in pairs(Global_WorldBoss_Mandara.battle_listener.players) do
			if #targets <= 0 then
				table.insert(targets, player)
			else
				for target_index, target in pairs(targets) do
					if caster:distanceTo(player) > caster:distanceTo(target) then
						table.insert(targets, target_index, player)
						break
					elseif target_index == #targets then
						table.insert(targets, player)
						break
					end
				end
			end
		end

		for index = 1, 3 do
			if targets[index] then caster:castSpell(targets[index], 850821) end
		end

		caster.strike_back = true
		caster.movable = true
		
		Global_WorldBoss_Mandara:sleep()

		return true
	end

	---------------------------------------------------------------------
	--	�P�R�w��
	---------------------------------------------------------------------
	Global_WorldBoss_Mandara.skill.fatal_gouge = Christine.Skill:new()
	Global_WorldBoss_Mandara.skill.fatal_gouge.name = "fatal_gouge"
	Global_WorldBoss_Mandara.skill.fatal_gouge.cd = 0
	function Global_WorldBoss_Mandara.skill.fatal_gouge:active(caster, target)

		Global_WorldBoss_Mandara:debug("Skill -> fatal_gouge")

		caster.strike_back = false

		while not target.is_dead and Global_WorldBoss_Mandara.status == "fight" do
			caster:move(target.x, target.y, target.z)

			caster:castSpell(target, 497143, 99)

			Global_WorldBoss_Mandara:sleep()
		end

		caster.strike_back = true

		Global_WorldBoss_Mandara:sleep()

		return true
	end

	Global_WorldBoss_Mandara:debug("setting done")
end

---------------------------------------------------------------------
--	Ĳ�o�԰�
---------------------------------------------------------------------
function worldboss_mandara_fight()

	Global_WorldBoss_Mandara:debug("fight start")

	Global_WorldBoss_Mandara.status = "fight"

	Global_WorldBoss_Mandara.handler:beginPlot("worldboss_mandara_main")

	Global_WorldBoss_Mandara.mandara:beginPlot("worldboss_mandara_ai")
	Global_WorldBoss_Mandara.mandara.fight = true

	for index, npc in pairs(Global_WorldBoss_Mandara.battle_listener.list) do
		if #npc.hate_list <= 0 then npc:hate(Christine.Role:new(this().attack_target_GUID)) end
	end
end

---------------------------------------------------------------------
--	����
---------------------------------------------------------------------
function worldboss_mandara_main()

	Global_WorldBoss_Mandara:debug("main loop start")

	local battle_listener = Global_WorldBoss_Mandara.battle_listener
	local mandara = Global_WorldBoss_Mandara.mandara

	while Global_WorldBoss_Mandara.status == "fight" do

		battle_listener:start()

		---------------------------------------------------------------------
		--	Global_WorldBoss_Mandara.status �P�_�j
		--	�bBOSS�����`�ƥ�M�԰������ƥ�
		---------------------------------------------------------------------

		---------------------------------------------------------------------
		--	�w�ɸ���ޯ�
		---------------------------------------------------------------------
		if battle_listener.duration_time > 9 then
			mandara.skill.flame_jet:unlock()
			Global_WorldBoss_Mandara:debug("unlock skill : flame_jet")
		end
		if battle_listener.duration_time > 13 then
			mandara.skill.web:unlock()
			Global_WorldBoss_Mandara:debug("unlock skill : web")
		end
		if battle_listener.duration_time > 16 then
			mandara.skill.spread_webs:unlock()
			Global_WorldBoss_Mandara:debug("unlock skill : spread_webs")
		end
		if battle_listener.duration_time > 19 then
			mandara.skill.holy_totem:unlock()
			Global_WorldBoss_Mandara:debug("unlock skill : holy_totem")
		end

		Global_WorldBoss_Mandara:sleep(1)

		Global_WorldBoss_Mandara:debug("players : " .. #battle_listener.players .. ", duration_time : " .. battle_listener.duration_time)

		if battle_listener.duration_time > 4 and #battle_listener.players <= 0 then
			Global_WorldBoss_Mandara.status = "fail"
		end

	end

	mandara:property {
		fight = false,
		search_enemy = false,
		strike_back = false,
		movable = true
	}

	Global_WorldBoss_Mandara:sleep(1)

	---------------------------------------------------------------------
	--	�M�� �p�j�� �M �j���
	---------------------------------------------------------------------
	for index, npc in pairs(battle_listener.list) do
		if npc.ORGID ~= Global_WorldBoss_Mandara.boss_orgid_easy and npc.ORGID ~= Global_WorldBoss_Mandara.boss_orgid_hard then
			npc:delete()
		end
	end

	Global_WorldBoss_Mandara:debug(Global_WorldBoss_Mandara.status .. " #players : " .. #battle_listener.players)
	if Global_WorldBoss_Mandara.status == "success" then
		for index, player in pairs(battle_listener.players) do
			Global_WorldBoss_Mandara:debug("kill mandara")
			local target = Christine.Npc:new()
			target:create(102312, player.x, player.y, player.z):property {
				revive = false
			}
			target:addToPartition()
			player:kill(target)
		end
	elseif Global_WorldBoss_Mandara.status == "fail" then
		mandara:delFromPartition():position {
			x = Global_WorldBoss_Mandara.handler.x,
			y = Global_WorldBoss_Mandara.handler.y,
			z = Global_WorldBoss_Mandara.handler.z,
			direction = Global_WorldBoss_Mandara.handler.direction,
		}
		Global_WorldBoss_Mandara:sleep(10)
		mandara:addToPartition()
	end
end

---------------------------------------------------------------------
--	AI
---------------------------------------------------------------------
function worldboss_mandara_ai()

	Lua_DW_WBGUIDRecord(1)

	Global_WorldBoss_Mandara:debug("boss ai start")

	local battle_listener = Global_WorldBoss_Mandara.battle_listener
	local mandara = Global_WorldBoss_Mandara.mandara
	local is_nobody_near = true
	local is_nobody_wrapped = true
	local players_guid = {}

	mandara.fight = true

	while Global_WorldBoss_Mandara.status == "fight" do

		for index, player in pairs(battle_listener.players) do
			table.insert(players_guid, player.GUID)
		end
		Global_WorldBoss_Mandara:debug("#players_guid : " .. #players_guid)
		Lua_DW_WBLvCheck_Table(players_guid)
		players_guid = {}

		if #mandara.hate_list <= 0 and #battle_listener.players > 0 then
			mandara:hate(battle_listener.players[RandRange(1, #battle_listener.players)])
		end

		for index, player in pairs(battle_listener.players) do

			---------------------------------------------------------------------
			--	�����󪱮a���L�O�ƹq�y4�h�I��P�R�w��
			---------------------------------------------------------------------
			if player.buff[624298] and player.buff[624298].power > 2 then
				mandara:useSkill("fatal_gouge", player)
			end

			---------------------------------------------------------------------
			--	�����󪱮a�Q�j������A�I��U�N���y
			---------------------------------------------------------------------
			if player.buff[624299] then
				is_nobody_wrapped = false
				mandara:useSkill("burning_ball", player)
			end

			---------------------------------------------------------------------
			--	�p�G80�X�������a�N�I����K�Q�g
			---------------------------------------------------------------------
			if player:distanceTo(mandara) < 80 then
				is_nobody_near = false
				mandara:useSkill("flame_jet")
			end

		end

		---------------------------------------------------------------------
		--	80�X���S���a�A�I�i�U�N���y
		---------------------------------------------------------------------
		if is_nobody_near then
			mandara:useSkill("burning_ball")
		end

		---------------------------------------------------------------------
		--	���S���H�Q�j������A�I�i��H����
		---------------------------------------------------------------------
		if is_nobody_wrapped then
			mandara:useSkill("web")
		end

		---------------------------------------------------------------------
		--	�p�j��ƶq�C��U���A�ϥλj��t�L
		---------------------------------------------------------------------
		if Global_WorldBoss_Mandara.servants_amount <= Global_WorldBoss_Mandara.servant_minimum then
			mandara:useSkill("holy_totem")
		end

		---------------------------------------------------------------------
		--	�j����C��U���N�I�񺩤��x��
		---------------------------------------------------------------------
		if Global_WorldBoss_Mandara.webs_amount < Global_WorldBoss_Mandara.web_minimum then
			mandara:useSkill("spread_webs")
		end

		---------------------------------------------------------------------
		--	10��cd���I��L�O�ƹq�y
		--	���K�Q�g���S���쪱�a�������_�Acd�ɶ���4��
		---------------------------------------------------------------------
		mandara:useSkill("inabilizily_electricity")

		Global_WorldBoss_Mandara:sleep()

	end
end
function worldboss_mandara_servant_ai()

	local servant = this()

	--------------------------------------------------------------
	--	�p�j�諸�p�p��
	--------------------------------------------------------------
	while Global_WorldBoss_Mandara.status == "fight" do

		if #servant.hate_list < 0 then
			servant:hate(Christine.Role:new(Global_WorldBoss_Mandara.mandara.attack_target_GUID))
		end

		Global_WorldBoss_Mandara:sleep()

	end

end
---------------------------------------------------------------------
--	�j��t�LĲ�o
---------------------------------------------------------------------
function Lua_magicObject_508127()

	local battle_listener = Global_WorldBoss_Mandara.battle_listener
	local mandara = Global_WorldBoss_Mandara.mandara
	local targets = {}

	for index, player in pairs(battle_listener.players) do
		if #targets <= 0 then table.insert(targets, player)
		else
			for target_index, target in pairs(targets) do
				if player:distanceTo(mandara) > target:distanceTo(mandara) then table.insert(targets, target_index, player) end
			end
		end
	end

	local attack_target
	for index, npc in pairs(battle_listener.list) do
		if npc.ORGID == Global_WorldBoss_Mandara.servant_orgid_easy or npc.ORGID == Global_WorldBoss_Mandara.servant_orgid_hard then
			if #targets < 4 then attack_target = targets[1]
			else attack_target = targets[RandRange(1, #targets)] end
			if attack_target then npc:addBuff(624296):stopAttack():hate(attack_target) end
		end
	end

	return true
end

---------------------------------------------------------------------
--	�I�U�j���
---------------------------------------------------------------------
function Lua_magicObject_624302()
	local target = that()

	if target.ORGID == Global_WorldBoss_Mandara.web_orgid then
		target:addBuff(624303)
		target.live_time = 10
		return true
	end

	for index, npc in pairs(Global_WorldBoss_Mandara.battle_listener.list) do
		if npc.ORGID == Global_WorldBoss_Mandara.web_orgid then
			npc:addBuff(624303)
			npc.live_time = 10
		end
	end

	if target.buff[508096] then
		target:addBuff(508099, target.buff[508096].power):cancelBuff(508096)
	end

	return true
end

---------------------------------------------------------------------
--	�Ǫ��K��
---------------------------------------------------------------------
function Lua_magicObject_noMonster()

	local target = that()

	if target.ORGID == Global_WorldBoss_Mandara.boss_orgid_easy or
	   target.ORGID == Global_WorldBoss_Mandara.boss_orgid_hard or
	   target.ORGID == Global_WorldBoss_Mandara.servant_orgid_easy or
	   target.ORGID == Global_WorldBoss_Mandara.servant_orgid_hard or
	   target.ORGID == Global_WorldBoss_Mandara.web_orgid then
		return false
	end

	return true
end