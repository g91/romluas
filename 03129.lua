--108599
function zone32_dungeon_boss5_create()
  local room_id = this().room_id

  zone32_dungeon_boss5_initialize(room_id)

  local boss = zone32_dungeon_boss5[room_id].boss
  local battle_listener = zone32_dungeon_boss5[room_id].battle_listener
  
  Cl_Resist_HackersBossNum()
  
  boss:property {
    fight = true,
    strike_back = true,
    search_enemy = true,
    movable = false,
    hp = boss.max_hp
  }

  boss:addSkill(zone32_dungeon_boss5.skill.skill1.name, zone32_dungeon_boss5.skill.skill1)
  boss:addSkill(zone32_dungeon_boss5.skill.skill2.name, zone32_dungeon_boss5.skill.skill2)
  boss:addSkill(zone32_dungeon_boss5.skill.skill3.name, zone32_dungeon_boss5.skill.skill3):lock()
  boss:addSkill(zone32_dungeon_boss5.skill.skill4.name, zone32_dungeon_boss5.skill.skill4):lock()

  for buff_id, buff in pairs(boss.buff) do
    buff:remove()
  end

  battle_listener:add(boss)
end

function zone32_dungeon_boss5_dead()
  Cl_Resist_HackersBossDead()
  zone32_dungeon_boss5:debug("boss dead")
  zone32_dungeon_boss5[this().room_id].status = "success"
end

function zone32_dungeon_boss5_begin()
  zone32_dungeon_boss5:debug("boss begin fight")
  Cl_Resist_HackersFightBegin()
  if zone32_dungeon_boss5[this().room_id].status ~= "fight" then
    zone32_dungeon_boss5[this().room_id].controller:beginPlot("zone32_dungeon_boss5_main")
    ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[INSTANCE_Z32_B5_1]", 0)
	
  end
end

function zone32_dungeon_boss5_end()
  zone32_dungeon_boss5:debug("boss end fight")
  local boss = zone32_dungeon_boss5[this().room_id].boss
  if not boss.is_dead then
    zone32_dungeon_boss5[boss.room_id].status = "fail"
    ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[INSTANCE_Z32_B5_3]", 0)
  end
end

function zone32_dungeon_boss5_initialize(room_id)

  local rear_door

  if zone32_dungeon_boss5 and
     zone32_dungeon_boss5[room_id] and
     zone32_dungeon_boss5[room_id].controller and
     zone32_dungeon_boss5[room_id].controller.is_legal then
    zone32_dungeon_boss5[room_id].controller:delete()
  end

  if zone32_dungeon_boss5 and
     zone32_dungeon_boss5[room_id] and
     zone32_dungeon_boss5[room_id].rear_door and
     zone32_dungeon_boss5[room_id].rear_door.is_legal then
    rear_door = zone32_dungeon_boss5[room_id].rear_door
  end

  if not zone32_dungeon_boss5 or zone32_dungeon_boss5.alpha then
    zone32_dungeon_boss5_setting()
  end

  zone32_dungeon_boss5[room_id] = {}

  zone32_dungeon_boss5[room_id].status = "ready"
  zone32_dungeon_boss5[room_id].step = 1

  zone32_dungeon_boss5[room_id].battle_listener = Christine.BattleListener:new()

  zone32_dungeon_boss5[room_id].boss = this()
  zone32_dungeon_boss5[room_id].battle_listener:add(zone32_dungeon_boss5[room_id].boss)

  zone32_dungeon_boss5[room_id].controller = Christine.Npc:new()
  zone32_dungeon_boss5[room_id].controller:create(
    zone32_dungeon_boss5[room_id].boss.ORGID,
    zone32_dungeon_boss5[room_id].boss.x,
    zone32_dungeon_boss5[room_id].boss.y,
    zone32_dungeon_boss5[room_id].boss.z
  )

--  副本前門
  zone32_dungeon_boss5[room_id].front_door = Christine.Npc:new()
  zone32_dungeon_boss5[room_id].front_door:create(107856, -1727.7, 1146.8, 2099, 270):property {
    gravity = false,
    search_enemy = false,
    strike_back = false,
    fight = false,
    movable = false,
    obstruct = true,
    hide_from_mini_map = true,
    hide_hp_mp = true,
    hide_name = true,
    mark = false,
    show_role_head = false
  }

--  副本後門
  if rear_door then
    zone32_dungeon_boss5[room_id].rear_door = rear_door
  else
    zone32_dungeon_boss5[room_id].rear_door = Christine.Npc:new()
    zone32_dungeon_boss5[room_id].rear_door:create(107856, -1461.2, 1146.3, 1582.4, 180):addToPartition(room_id):property {
      gravity = false,
      search_enemy = false,
      strike_back = false,
      fight = false,
      movable = false,
      obstruct = true,
      hide_from_mini_map = true,
      hide_hp_mp = true,
      hide_name = true,
      mark = false,
      show_role_head = false
    }
  end

  zone32_dungeon_boss5:debug("initliaize done")
end

function zone32_dungeon_boss5_setting()
  local zone_id = this().zone_id

  zone32_dungeon_boss5 = Christine.System:new("zone32_dungeon_boss5")
  zone32_dungeon_boss5.alpha = false
  zone32_dungeon_boss5.beta = true
  zone32_dungeon_boss5.delay = 0.5

  zone32_dungeon_boss5.servant_orgid1 = 123485
  zone32_dungeon_boss5.servant_orgid2 = 123486
  zone32_dungeon_boss5.servant_orgid3 = 123487
  zone32_dungeon_boss5.skill3_orgid = 108677
  if zone_id == 169 then
    zone32_dungeon_boss5.servant_orgid1 = 123485
    zone32_dungeon_boss5.servant_orgid2 = 123486
    zone32_dungeon_boss5.servant_orgid3 = 123487
    zone32_dungeon_boss5.skill3_orgid = 108677
  elseif zone_id == 170 then
    zone32_dungeon_boss5.servant_orgid1 = 123512
    zone32_dungeon_boss5.servant_orgid2 = 123513
    zone32_dungeon_boss5.servant_orgid3 = 123514
    zone32_dungeon_boss5.skill3_orgid = 108691
  elseif zone_id == 171 then
    zone32_dungeon_boss5.servant_orgid1 = 123517
    zone32_dungeon_boss5.servant_orgid2 = 123518
    zone32_dungeon_boss5.servant_orgid3 = 123519
    zone32_dungeon_boss5.skill3_orgid = 108696
  end

  zone32_dungeon_boss5.skill = {}

  ------------------------------------------------------------------------------
  --  靈魂牽引
  --  自身施展，500碼，有效人數4人
  ------------------------------------------------------------------------------
 zone32_dungeon_boss5.skill.skill1 = Christine.Skill:new()
 zone32_dungeon_boss5.skill.skill1.name = "skill1"
 zone32_dungeon_boss5.skill.skill1.cd = 8
 function zone32_dungeon_boss5.skill.skill1:active(caster)
   --caster:say(self.name)
   caster:castSpell(851604)
   caster:sleep(2)
   return true
 end

  ------------------------------------------------------------------------------
  --  亡靈跪拜
  --  自身施展，100碼
  --  亡靈跪拜3秒後得到靈界之眼，根據場上靈界之眼玩家數量出小怪
  --  靈界之眼30秒後得到靈界召喚，被亡靈跪拜擊中秒殺
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.skill.skill2 = Christine.Skill:new()
  zone32_dungeon_boss5.skill.skill2.name = "skill2"
  zone32_dungeon_boss5.skill.skill2.cd = 19
  function zone32_dungeon_boss5.skill.skill2:active(caster, step)
    --caster:say(self.name)
    caster:castSpell(851605)
    caster:sleep(3.5)
    local hit = false
    for index, player in pairs(zone32_dungeon_boss5[caster.room_id].battle_listener.players) do
      if player:checkBuff(625404) or player:checkBuff(625405) then
        hit = true
        local servant_data = zone32_dungeon_boss5.servant_data[RandRange(1, 3)]
        -- if step > 1 then
        --   servant_data = zone32_dungeon_boss5.servant_data[RandRange(1, 3)]
        -- end
        local _servant = Christine.Npc:new()
        _servant:create(servant_data.orgid, player.x, player.y, player.z)
        zone32_dungeon_boss5:debug("servant orgid : "..servant_data.orgid)
        if servant_data.skills then
          for index, skill in pairs(servant_data.skills) do
            _servant:addSkill(skill.name, skill)
            zone32_dungeon_boss5:debug("servant skill name : "..skill.name)
          end
        end
        if servant_data.buff then
          _servant:addBuff(servant_data.buff)
		  _servant:addBuff(servant_data.invbuff)
          zone32_dungeon_boss5:debug("servant buff : "..servant_data.buff)
        end
        zone32_dungeon_boss5[caster.room_id].battle_listener:add(_servant)
        _servant:addToPartition(caster.room_id)
        _servant:beginPlot("zone32_dungeon_boss5_servant_ai")
        -- _servant.live_time = self.cd
        _servant.search_enemy = true
        _servant.strike_back = true
        _servant.fight = true
        disableQuest( _servant.guid, true )
        _servant:attack(player)
      end
    end
    if not hit then
      zone32_dungeon_boss5:debug("skill2 not hit")
      local servant_data = zone32_dungeon_boss5.servant_data[RandRange(1, 3)]
      -- if step > 1 then
      --   servant_data = zone32_dungeon_boss5.servant_data[RandRange(1, 3)]
      -- end
      local _servant = Christine.Npc:new()
      _servant:create(servant_data.orgid, caster.x, caster.y, caster.z)
      zone32_dungeon_boss5:debug("servant orgid : "..servant_data.orgid)
      if servant_data.skills then
        for index, skill in pairs(servant_data.skills) do
          _servant:addSkill(skill.name, skill)
          zone32_dungeon_boss5:debug("servant skill name : "..skill.name)
        end
      end
      if servant_data.buff then
        _servant:addBuff(servant_data.buff)
		_servant:addBuff(servant_data.invbuff)
        zone32_dungeon_boss5:debug("servant buff : "..servant_data.buff)
      end
      zone32_dungeon_boss5[caster.room_id].battle_listener:add(_servant)
      _servant:addToPartition(caster.room_id)
      _servant:beginPlot("zone32_dungeon_boss5_servant_ai")
      -- _servant.live_time = self.cd
      _servant.search_enemy = true
      _servant.strike_back = true
      _servant.fight = true
      disableQuest( _servant.guid, true )
      _servant:attack(that(caster.attack_target_GUID))
    end
    return true
  end
  
  
  function zone32_dungeon_boss5_625405_check() --20150826 多洛 不能持續延長靈界之眼
	if CheckBuff( TargetID(), 625405) then
		return false
	end
  end

  ------------------------------------------------------------------------------
  --  怨氣沖天
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.skill.skill3 = Christine.Skill:new()
  zone32_dungeon_boss5.skill.skill3.name = "skill3"
  zone32_dungeon_boss5.skill.skill3.cd = 10
  function zone32_dungeon_boss5.skill.skill3:active(caster, targets)
    --caster:say(self.name)
    local targets = table.random(targets, 3)
    for index, target in pairs(targets) do
      local _npc = Christine.Npc:new()
      _npc:create(zone32_dungeon_boss5.skill3_orgid, target.x, target.y, target.z)
      _npc:addToPartition( caster.room_id )
      _npc:addBuff(625385)
      _npc.live_time = 6
    end
    caster:sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  失心恐懼
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.skill.skill4 = Christine.Skill:new()
  zone32_dungeon_boss5.skill.skill4.name = "skill4"
  zone32_dungeon_boss5.skill.skill4.cd = 15
  function zone32_dungeon_boss5.skill.skill4:active(caster)
    --caster:say(self.name)
    caster:castSpell(851607)
    caster:sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  痛苦零箭
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.skill.skill5 = Christine.Skill:new()
  zone32_dungeon_boss5.skill.skill5.name = "skill5"
  zone32_dungeon_boss5.skill.skill5.cd = 3
  function zone32_dungeon_boss5.skill.skill5:active(caster, target)
    --caster:say(self.name)
    zone32_dungeon_boss5:debug(self.name)
    caster:castSpell(target, 851608)
    caster:sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  痛苦茫然
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.skill.skill6 = Christine.Skill:new()
  zone32_dungeon_boss5.skill.skill6.name = "skill6"
  zone32_dungeon_boss5.skill.skill6.cd = 10
  function zone32_dungeon_boss5.skill.skill6:active(caster, target)
    --caster:say(self.name)
    zone32_dungeon_boss5:debug(self.name)
    caster:castSpell(target, 851609)
    caster:sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  痛苦意志
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.skill.skill7 = Christine.Skill:new()
  zone32_dungeon_boss5.skill.skill7.name = "skill7"
  zone32_dungeon_boss5.skill.skill7.cd = 5
  function zone32_dungeon_boss5.skill.skill7:active(caster, target)
    --caster:say(self.name)
    zone32_dungeon_boss5:debug(self.name)
    caster:castSpell(target, 851610)
    caster:sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  憤怒狂暴
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.skill.skill8 = Christine.Skill:new()
  zone32_dungeon_boss5.skill.skill8.name = "skill8"
  zone32_dungeon_boss5.skill.skill8.cd = 30
  function zone32_dungeon_boss5.skill.skill8:active(caster)
    --caster:say(self.name)
    caster:systemCastSpell(851611)
    caster:sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  憤怒斬擊
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.skill.skill9 = Christine.Skill:new()
  zone32_dungeon_boss5.skill.skill9.name = "skill9"
  zone32_dungeon_boss5.skill.skill9.cd = 5
  function zone32_dungeon_boss5.skill.skill9:active(caster)
    --caster:say(self.name)
    caster:castSpell(that(caster.attack_target_GUID), 851612)
    caster:sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  憤怒迴旋
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.skill.skill10 = Christine.Skill:new()
  zone32_dungeon_boss5.skill.skill10.name = "skill10"
  zone32_dungeon_boss5.skill.skill10.cd = 15
  function zone32_dungeon_boss5.skill.skill10:active(caster)
    --caster:say(self.name)
    caster:castSpell(851613)
    caster:sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  小怪設定
  ------------------------------------------------------------------------------
  zone32_dungeon_boss5.servant_data = {
    {
      orgid = zone32_dungeon_boss5.servant_orgid1,
      buff = 625410,
	  invbuff = 500153
    },
    {
      orgid = zone32_dungeon_boss5.servant_orgid2,
      buff = 625412,
	  invbuff = 500153,
      skills = {
        zone32_dungeon_boss5.skill.skill5,
        zone32_dungeon_boss5.skill.skill6,
        zone32_dungeon_boss5.skill.skill7
      }
    },
    {
      orgid = zone32_dungeon_boss5.servant_orgid3,
      buff = 625416,
	  invbuff = 500153,
      skills = {
        zone32_dungeon_boss5.skill.skill8,
        zone32_dungeon_boss5.skill.skill9,
        zone32_dungeon_boss5.skill.skill10
      }
    }
  }

  zone32_dungeon_boss5:debug("setting done")
  
end

function zone32_dungeon_boss5_main()
  zone32_dungeon_boss5:debug("main start")
  local room_id = this().room_id
  local boss = zone32_dungeon_boss5[room_id].boss
  local battle_listener = zone32_dungeon_boss5[room_id].battle_listener

  zone32_dungeon_boss5[room_id].status = "fight"
  boss:beginPlot("zone32_dungeon_boss5_ai")

  zone32_dungeon_boss5[room_id].front_door:addToPartition(room_id)

  local has_buff1, has_buff2, no_buff_players

  while zone32_dungeon_boss5[room_id].status == "fight" do
    battle_listener:start()

    if battle_listener.duration_time == 300 then
      ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[INSTANCE_Z32_B5_2]", 0)
    end

    if zone32_dungeon_boss5[room_id].step ~= 2 and boss.hp < (boss.max_hp / 2) then
      zone32_dungeon_boss5:debug("change step -> 2")
      zone32_dungeon_boss5[room_id].step = 2
      boss.skill[zone32_dungeon_boss5.skill.skill3.name]:unlock()
      boss.skill[zone32_dungeon_boss5.skill.skill4.name]:unlock()
    end

    -- zone32_dungeon_boss5:debug("#players : ".. #zone32_dungeon_boss5[room_id].battle_listener.players..", skill3 : "..boss.skill[zone32_dungeon_boss5.skill.skill3.name].cd_counter..", skill4 : "..boss.skill[zone32_dungeon_boss5.skill.skill4.name].cd_counter)

    zone32_dungeon_boss5:sleep()

  end

  battle_listener:stop()

  for index, npc in pairs(battle_listener.list) do
    if npc.ORGID ~= boss.ORGID then
      npc:delete()
    end
  end

  if zone32_dungeon_boss5[room_id].status == "success" then
    zone32_dungeon_boss5:debug("success")
    ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[INSTANCE_Z32_B5_4]", 0)
    if this().zone_id == 169 then
      zone32_dungeon_boss5[room_id].rear_door:delFromPartition()
    end
  elseif zone32_dungeon_boss5[room_id].status == "fail" then
    zone32_dungeon_boss5:debug("fail")
    boss:delFromPartition():sleep(3):addToPartition(room_id)
  end
  zone32_dungeon_boss5[room_id].front_door:delete()

  zone32_dungeon_boss5:debug("main end")
end

function zone32_dungeon_boss5_ai()
  zone32_dungeon_boss5:debug("ai start")
  local room_id = this().room_id
  local boss = zone32_dungeon_boss5[room_id].boss
  local battle_listener = zone32_dungeon_boss5[room_id].battle_listener

  while zone32_dungeon_boss5[room_id].status == "fight" do
    if #boss.hate_list > 0 then
      boss:useSkill(zone32_dungeon_boss5.skill.skill2.name, zone32_dungeon_boss5[room_id].step)
	  boss:useSkill(zone32_dungeon_boss5.skill.skill1.name)
      if zone32_dungeon_boss5[room_id].step == 2 then
        boss:useSkill(zone32_dungeon_boss5.skill.skill3.name, that(boss.attack_target_guid))
        boss:useSkill(zone32_dungeon_boss5.skill.skill4.name)
      end
    end
    zone32_dungeon_boss5:sleep()
  end

  zone32_dungeon_boss5:debug("ai end")
end

function zone32_dungeon_boss5_servant_ai()
  zone32_dungeon_boss5:debug("servant ai start")
  --AddBuff ( OwnerID(), 500153, 0, -1 )
  
  local room_id = this().room_id
  local servant
  local battle_listener = zone32_dungeon_boss5[room_id].battle_listener

  for index, npc in pairs(battle_listener.list) do
    if npc.GUID == this().GUID then
      servant = npc
    end
  end

  if not servant then
    zone32_dungeon_boss5:debug("servant ai start fail")
    this():delete()
    return false
  end

  while zone32_dungeon_boss5[room_id].status == "fight" do
    if #servant.hate_list > 0 then
      if servant.skill and servant.skill[zone32_dungeon_boss5.skill.skill6.name] then servant:useSkill(zone32_dungeon_boss5.skill.skill6.name, that(servant.attack_target_guid)) end
      
      if zone32_dungeon_boss5[room_id].step == 2 then
        if servant.skill and servant.skill[zone32_dungeon_boss5.skill.skill7.name] then servant:useSkill(zone32_dungeon_boss5.skill.skill7.name, that(servant.attack_target_guid)) end
      end

      if servant.skill and servant.skill[zone32_dungeon_boss5.skill.skill8.name] then servant:useSkill(zone32_dungeon_boss5.skill.skill8.name) end
      if servant.skill and servant.skill[zone32_dungeon_boss5.skill.skill9.name] then servant:useSkill(zone32_dungeon_boss5.skill.skill9.name) end
      if servant.skill and servant.skill[zone32_dungeon_boss5.skill.skill10.name] then servant:useSkill(zone32_dungeon_boss5.skill.skill10.name) end
      if servant.skill and servant.skill[zone32_dungeon_boss5.skill.skill5.name] then servant:useSkill(zone32_dungeon_boss5.skill.skill5.name, that(servant.attack_target_guid)) end
    end
    zone32_dungeon_boss5:sleep()
  end

  zone32_dungeon_boss5:debug("servant ai end")
end

------------------------------------------------------------------------------
--  GM
------------------------------------------------------------------------------
function GM_zone32_dungeon_boss5(command)
  local room_id = this().room_id
  if command == 1 then
    zone32_dungeon_boss5[room_id].boss:castSpell(851605)
  elseif command == 2 then
    zone32_dungeon_boss5[room_id].step = 2
    zone32_dungeon_boss5[room_id].boss.skill[zone32_dungeon_boss5.skill.skill3.name]:unlock()
    zone32_dungeon_boss5[room_id].boss.skill[zone32_dungeon_boss5.skill.skill4.name]:unlock()
    zone32_dungeon_boss5:debug("step : "..zone32_dungeon_boss5[room_id].step)
  elseif command == 3 then
    local this = this()
    local npc = Christine.Npc:new()
    npc:create( 123485, this.x, this.y, this.z, 0 )
    npc:addToPartition()
    npc:addBuff( 625410 )
    npc.search_enemy = true
    npc.strike_back = true
    npc.fight = true
    disableQuest( npc.guid, true )
    this:addBuff( 625405 )
  else
    debugmsg(0, 0, "no command")
  end
end