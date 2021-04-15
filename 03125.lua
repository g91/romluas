--108599
function zone32_dungeon_boss4_create()
  local room_id = this().room_id

  zone32_dungeon_boss4_initialize(room_id)

  local boss = zone32_dungeon_boss4[room_id].boss
  local battle_listener = zone32_dungeon_boss4[room_id].battle_listener
	
  Cl_Resist_HackersBossNum()
  boss:property {
    fight = true,
    strike_back = true,
    search_enemy = true,
    movable = true,
    hp = boss.max_hp
  }

  boss:addSkill(zone32_dungeon_boss4.skill.skill1.name, zone32_dungeon_boss4.skill.skill1)
  boss:addSkill(zone32_dungeon_boss4.skill.skill2.name, zone32_dungeon_boss4.skill.skill2)
  boss:addSkill(zone32_dungeon_boss4.skill.skill3.name, zone32_dungeon_boss4.skill.skill3)

  for buff_id, buff in pairs(boss.buff) do
    buff:remove()
  end

  battle_listener:add(boss)
end

function zone32_dungeon_boss4_dead()
  Cl_Resist_HackersBossDead()
  zone32_dungeon_boss4:debug("boss dead")
  zone32_dungeon_boss4[this().room_id].status = "success"
end

function zone32_dungeon_boss4_begin()
  zone32_dungeon_boss4:debug("boss begin fight")
  if zone32_dungeon_boss4[this().room_id].status ~= "fight" then
    zone32_dungeon_boss4[this().room_id].controller:beginPlot("zone32_dungeon_boss4_main")
	Cl_Resist_HackersFightBegin()
    ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[INSTANCE_Z32_B4_1]", 0)
  end
end

function zone32_dungeon_boss4_end()
  zone32_dungeon_boss4:debug("boss end fight")
  local boss = zone32_dungeon_boss4[this().room_id].boss
  if not boss.is_dead then
    zone32_dungeon_boss4[boss.room_id].status = "fail"
    ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[INSTANCE_Z32_B4_3]", 0)
  end
end

function zone32_dungeon_boss4_initialize(room_id)

  local rear_door

  if zone32_dungeon_boss4 and
     zone32_dungeon_boss4[room_id] and
     zone32_dungeon_boss4[room_id].controller and
     zone32_dungeon_boss4[room_id].controller.is_legal then
    zone32_dungeon_boss4[room_id].controller:delete()
  end

  if zone32_dungeon_boss4 and
     zone32_dungeon_boss4[room_id] and
     zone32_dungeon_boss4[room_id].rear_door and
     zone32_dungeon_boss4[room_id].rear_door.is_legal then
    rear_door = zone32_dungeon_boss4[room_id].rear_door
  end

  if not zone32_dungeon_boss4 or zone32_dungeon_boss4.alpha then
    zone32_dungeon_boss4_setting()
  end

  zone32_dungeon_boss4[room_id] = {}

  zone32_dungeon_boss4[room_id].status = "ready"

  zone32_dungeon_boss4[room_id].battle_listener = Christine.BattleListener:new()

  zone32_dungeon_boss4[room_id].boss = this()
  zone32_dungeon_boss4[room_id].battle_listener:add(zone32_dungeon_boss4[room_id].boss)

  zone32_dungeon_boss4[room_id].controller = Christine.Npc:new()
  zone32_dungeon_boss4[room_id].controller:create(
    zone32_dungeon_boss4[room_id].boss.ORGID,
    zone32_dungeon_boss4[room_id].boss.x,
    zone32_dungeon_boss4[room_id].boss.y,
    zone32_dungeon_boss4[room_id].boss.z
  )

--  副本前門
  zone32_dungeon_boss4[room_id].front_door = Christine.Npc:new()
  zone32_dungeon_boss4[room_id].front_door:create(107856, -1009.7, 1147.3, 1788.9, 270):property {
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
    zone32_dungeon_boss4[room_id].rear_door = rear_door
  else
    zone32_dungeon_boss4[room_id].rear_door = Christine.Npc:new()
    zone32_dungeon_boss4[room_id].rear_door:create(107856, -1378.4, 1146.3, 1789.6, 270):addToPartition(room_id):property {
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

  zone32_dungeon_boss4:debug("initliaize done")
end

function zone32_dungeon_boss4_setting()
  local zone_id = this().zone_id

  zone32_dungeon_boss4 = Christine.System:new("zone32_dungeon_boss4")
  zone32_dungeon_boss4.alpha = false
  zone32_dungeon_boss4.beta = true
  zone32_dungeon_boss4.delay = 0.5

  if zone_id == 169 then
    -- hard
  elseif zone_id == 170 then
    -- normal
  elseif zone_id == 171 then
    -- easy
  end

  zone32_dungeon_boss4.skill = {}

  ------------------------------------------------------------------------------
  --  斷魂
  ------------------------------------------------------------------------------
  zone32_dungeon_boss4.skill.skill1 = Christine.Skill:new()
  zone32_dungeon_boss4.skill.skill1.name = "skill1"
  zone32_dungeon_boss4.skill.skill1.cd = 7
  function zone32_dungeon_boss4.skill.skill1:active(caster, targets)
    zone32_dungeon_boss4:debug("skill1 #targets : "..#targets)
    --caster:say(self.name)
    local valid_targets = {}
    for i, t in ipairs( targets ) do
      if not t:checkBuff( 625338 ) then
        table.insert( valid_targets, t )
      end
    end
    if #valid_targets <= 0 then
      return false
    end
    local target = table.random(valid_targets, 1)[1]
    if target then
      caster:castSpell(target, 851580)
    else
      return false
    end
    caster:sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  汙穢打擊
  ------------------------------------------------------------------------------
  zone32_dungeon_boss4.skill.skill2 = Christine.Skill:new()
  zone32_dungeon_boss4.skill.skill2.name = "skill2"
  zone32_dungeon_boss4.skill.skill2.cd = 9
  function zone32_dungeon_boss4.skill.skill2:active(caster)
    --caster:say(self.name)
    caster:castSpell(851581):sleep(1.5)
    return true
  end

  ------------------------------------------------------------------------------
  --  闇舞之魂
  ------------------------------------------------------------------------------
  zone32_dungeon_boss4.skill.skill3 = Christine.Skill:new()
  zone32_dungeon_boss4.skill.skill3.name = "skill3"
  zone32_dungeon_boss4.skill.skill3.cd = 0
  function zone32_dungeon_boss4.skill.skill3:active(caster)
    --caster:say(self.name)
    caster:cancelBuff(625383)
    caster:castSpell(851594):sleep(1.5)
    return true
  end

  zone32_dungeon_boss4:debug("setting done")
  
end

function zone32_dungeon_boss4_main()
  zone32_dungeon_boss4:debug("main start")
  local room_id = this().room_id
  local boss = zone32_dungeon_boss4[room_id].boss
  local battle_listener = zone32_dungeon_boss4[room_id].battle_listener

  zone32_dungeon_boss4[room_id].status = "fight"
  boss:beginPlot("zone32_dungeon_boss4_ai")

  zone32_dungeon_boss4[room_id].front_door:addToPartition(room_id)

  local has_buff1, has_buff2, no_buff_players

  while zone32_dungeon_boss4[room_id].status == "fight" do
    battle_listener:start()

    if battle_listener.duration_time == 300 then
      ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[INSTANCE_Z32_B4_2]", 0)
    end

  --  625338 裂魂
    has_buff1 = false
  --  625340 噬魂
    has_buff2 = false 
  --  625275 斷魂
    has_buff3 = false
    no_buff_players = {}

    for index, player in pairs(battle_listener.players) do
      if player:checkBuff(625338) or player:checkBuff(625340) or player:checkBuff(625275) then
        if player:checkBuff(625338) then
          has_buff1 = true
        end
        if player:checkBuff(625340) then
          has_buff2 = true
        end
        if player:checkBuff(625275) then
          has_buff3 = true
        end
      else
        table.insert(no_buff_players, player)
      end
    end

    if not has_buff1 and #no_buff_players > 0 then
      local no_buff_player = table.remove(no_buff_players, RandRange(1, #no_buff_players))
      if no_buff_player then
        no_buff_player:addBuff(625338)
      end
    end

    if not has_buff2 and #no_buff_players > 0 then
      local no_buff_player = table.remove(no_buff_players, RandRange(1, #no_buff_players))
      if no_buff_player then
        no_buff_player:addBuff(625340)
      end
    end

    -- if battle_listener.duration_time % 6 == 0 then
    --  boss:addBuff(625383)
    -- end

    zone32_dungeon_boss4:sleep()
    zone32_dungeon_boss4:debug( "#battle_listener.players="..#battle_listener.players)

    --zone32_dungeon_boss4:debug(zone32_dungeon_boss4.skill.skill1.name..", cd : "..boss.skill[zone32_dungeon_boss4.skill.skill1.name].cd_counter)

  end

  battle_listener:stop()

  if zone32_dungeon_boss4[room_id].status == "success" then
    zone32_dungeon_boss4:debug("success")
    ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[INSTANCE_Z32_B4_4]", 0)
    zone32_dungeon_boss4[room_id].rear_door:delete()
  elseif zone32_dungeon_boss4[room_id].status == "fail" then
    zone32_dungeon_boss4:debug("fail")
    boss:delFromPartition():sleep(3):addToPartition(room_id)
    zone32_dungeon_boss4[room_id].front_door:delete()
  end

  zone32_dungeon_boss4:debug("main end")
end

function zone32_dungeon_boss4_ai()
  zone32_dungeon_boss4:debug("ai start")
  local room_id = this().room_id
  local boss = zone32_dungeon_boss4[room_id].boss
  local battle_listener = zone32_dungeon_boss4[room_id].battle_listener

  while zone32_dungeon_boss4[room_id].status == "fight" do
    if #boss.hate_list > 0 then
      boss:useSkill(zone32_dungeon_boss4.skill.skill1.name, battle_listener.players)
      boss:useSkill(zone32_dungeon_boss4.skill.skill2.name)
      if boss:checkBuff(625383) and boss.buff[625383].power > 8 then
        boss:useSkill(zone32_dungeon_boss4.skill.skill3.name)
      end
    end
    zone32_dungeon_boss4:sleep()
  end

  zone32_dungeon_boss4:debug("ai end")
end

------------------------------------------------------------------------------
--  裂魂時間到
------------------------------------------------------------------------------
function magicobject_625379()
  zone32_dungeon_boss4:debug("magicobject_625379")
  local room_id = this().room_id
  local me
  for index, player in pairs(zone32_dungeon_boss4[room_id].battle_listener.players) do
    if player.GUID == this().GUID then
      me = player
    end
  end
  if not me then return false end
  -- me:say("magicobject_625379 target")
  me.buff1_time = nil
  zone32_dungeon_boss4[room_id].boss:systemCastSpell(me, 851598)
end

------------------------------------------------------------------------------
--  發動噬魂
--  給boss buff 625383
------------------------------------------------------------------------------
function magicobject_625357()
  zone32_dungeon_boss4:debug("magicobject_625357")
  local room_id = this().room_id
--  噬魂發動者
  local me = this()
--  被噬魂者
  local target

  for index, player in pairs(zone32_dungeon_boss4[room_id].battle_listener.players) do
    if player.GUID == that().GUID then
      target = player
    end
  end

  if not target:checkBuff(625338) and not target:checkBuff(625275) then
    --me:alert("target has no correct buff.")
    return false
  end

  -- me:say("caster")
  -- target:say("target")

--  除去噬魂
  me:cancelBuff(625340)
--  除去裂魂或斷魂
  target:cancelBuff(625275)

  if target:checkBuff(625338) then
    target:systemCastSpell(851579, target.buff[625338].time)
  end

  target:cancelBuff(625338)

  zone32_dungeon_boss4[room_id].boss:addBuff(625383)
end

------------------------------------------------------------------------------
--  噬魂結束
------------------------------------------------------------------------------
function magicobject_625381()
  zone32_dungeon_boss4:debug("magicobject_625381")
  this():systemCastSpell(851578)
end

------------------------------------------------------------------------------
--  GM給噬魂
------------------------------------------------------------------------------
function GM_zone32_dungeon_boss4(command)
  if command == 1 then
    this():addBuff(625340)
  elseif command == 2 then
    this():cancelBuff(625340)
  end
end