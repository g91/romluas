function gmDungeon1981_create()
  local me = this()
  local boss = Christine.Npc:new():create(108974, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeon1981_damage()
  local room_id = this().room_id
  local boss = dungeon_198_1[room_id].boss
  boss.hp = boss.hp - boss.max_hp*0.2
end
function gmDungeon1981_removeBuff()
  local room_id = this().room_id
  dungeon_198_1[room_id].boss:cancelBuff(626131)
end
function gmDungeon_1981_addfirebuff()
  this():addBuff(626180)
end
function gmDungeon_1981_removefirebuff()
  this():cancelBuff(626180)
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108974()
--  Cl_Resist_HackersBossNum();
  local room_id = this().room_id
  dungeonInitialize_198_1(room_id)
  Cl_Resist_HackersBossNum()
end
function npcDead_108974()
--  Cl_Resist_HackersBossDead()
  local room_id = this().room_id
  if not dungeon_198_1 or not dungeon_198_1[room_id] then
    debugmsg(0, 0, "not found dungeon_198_1")
    return false
  end
  if dungeon_198_1[room_id].status == "fight" then
    ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108974_04]", 0)
    dungeon_198_1[room_id].status = "success"

    Cl_Resist_HackersBossDead()
  end
end
function npcBeginFight_108974()
--  Cl_Resist_HackersFightBegin()
  local room_id = this().room_id
  if not dungeon_198_1 or not dungeon_198_1[room_id] then
    debugmsg(0, 0, "not found dungeon_198_1")
    return false
  end
  if dungeon_198_1[room_id].status == "ready" then
    ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108974_01]", 0)
    dungeonActive_198_1(room_id)
  end
end
function npcEndFight_108974()
  local room_id = this().room_id
  if not dungeon_198_1 or not dungeon_198_1[room_id] then
    debugmsg(0, 0, "not found dungeon_198_1")
    return false
  end
  if dungeon_198_1[room_id].status == "fight" then
    ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108974_03]", 0)
    dungeon_198_1[room_id].status = "fail"
    dungeon_198_1[room_id].boss.search_enemy = false
    dungeon_198_1[room_id].boss.strike_back = false
    dungeon_198_1[room_id].boss.fight = false
  end
end
------------------------------------------------------------------
------------------------------------------------------------------
-- ¤õ¬Þµ²§ô
function magicObject_626184()
  local room_id = this().room_id
  if not dungeon_198_1 or not dungeon_198_1[room_id] then
    DebugMsg(0, 0, "not found dungeon_198_1["..room_id.."]")
    return false
  end
  this():callPlot("magicObject_626184plot", room_id)
end
function magicObject_626184plot(room_id)

  local boss = this()
  boss.mark = true
  boss.hide_hp_mp = false
  boss.hide_name = false
  boss.show_role_head = true

  for i = 1, 60 do
    dungeon_198_1:sleep(1)
    if dungeon_198_1[room_id].no_event_timer then
      dungeon_198_1[room_id].no_event_timer = false
      dungeon_198_1:debug("no_event_timer")
      return
    end
    if dungeon_198_1[room_id].status ~= "fight" then
      return
    end
  end
  dungeon_198_1:debug("break fire shield 60s event")
  dungeonEvent_198_1(room_id)
end
-- ¤õ¬Þ®É¶¡¨ì
function magicObject_626185()

  local boss = this()
  boss.mark = true
  boss.hide_hp_mp = false
  boss.hide_name = false
  boss.show_role_head = true

  local room_id = this().room_id
  if not dungeon_198_1 or not dungeon_198_1[room_id] then
    DebugMsg(0, 0, "not found dungeon_198_1["..room_id.."]")
    return false
  end
  dungeon_198_1:debug("after fire shield")
  dungeonEvent_198_1(room_id)
  dungeon_198_1[room_id].no_event_timer = true
end

function magicObject_626131()
  local boss = this()
  boss.mark = false
  boss.hide_hp_mp = true
  boss.hide_name = true
  boss.show_role_head = false
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_198_1()
  debugmsg(0, 0, "dungeonSetting_198_1")
  dungeon_198_1 = Christine.System:new("dungeon_198_1")
  dungeon_198_1.alpha = false
  dungeon_198_1.beta = true
  dungeon_198_1.delay = 1

  dungeon_198_1.flags = Christine.FlagGroup:new(781441)

  local position_fix_reference = this()
  dungeon_198_1.position_fixed = {
    x = position_fix_reference.x,
    y = position_fix_reference.y,
    z = position_fix_reference.z,
    --direction = position_fix_reference.direction
    direction = position_fix_reference.direction
  }

  dungeon_198_1.skill = {}

--  ¯à¶q½ÄÀ»
  dungeon_198_1.skill.skill1 = Christine.Skill:new()
  dungeon_198_1.skill.skill1.name = "skill1"
  dungeon_198_1.skill.skill1.cd = 7
  function dungeon_198_1.skill.skill1:active(caster, target)
    --caster:say(self.name)
    return caster:castSpell(target, 852153)
  end

--  ¯à¶qÂX®i
  dungeon_198_1.skill.skill2 = Christine.Skill:new()
  dungeon_198_1.skill.skill2.name = "skill2"
  dungeon_198_1.skill.skill2.cd = 7
  function dungeon_198_1.skill.skill2:active(caster)
    --caster:say(self.name)
    return caster:castSpell(caster, 852154)
  end

--  ¤õ·½¨îµô
  dungeon_198_1.skill.skill3 = Christine.Skill:new()
  dungeon_198_1.skill.skill3.name = "skill3"
  dungeon_198_1.skill.skill3.cd = 13
  function dungeon_198_1.skill.skill3:active(caster)
    --caster:say(self.name)
    return  caster:castSpell(caster, 852155)
  end

--  ¤õ¬Þ
--  dungeon_198_1.skill.skill4 = Christine.Skill:new()
--  dungeon_198_1.skill.skill4.name = "skill4"
--  dungeon_198_1.skill.skill4.cd = 9
--  function dungeon_198_1.skill.skill3:active(caster)
--    return  caster:castSpell(caster, 852157)
--  end

--  ¤õ²ÅÅX³v´²®g
  dungeon_198_1.skill.skill4 = Christine.Skill:new()
  dungeon_198_1.skill.skill4.name = "skill4"
  dungeon_198_1.skill.skill4.cd = 17
  function dungeon_198_1.skill.skill4:active(caster, targets)
    --caster:say(self.name)
    caster.movable = false
    caster:stopMove()
    local counter = 0
    local room_id = caster.room_id
    while counter < 10 and dungeon_198_1[room_id].status == "fight" and not dungeon_198_1[room_id].phase3_special_trigger do
      local target = table.random(targets, 1)[1]
      if target and caster:castSpell(target.x, target.y, target.z, 852158) then
        counter  = counter + 1
      end
      dungeon_198_1:debug("skill 4 > times : "..counter)
      dungeon_198_1:sleep(1)
    end
    caster.movable = true
    return  true
  end

--  ¤õ¯àÄè·À½ÄÀ»
  dungeon_198_1.skill.skill5 = Christine.Skill:new()
  dungeon_198_1.skill.skill5.name = "skill5"
  dungeon_198_1.skill.skill5.cd = 13
  function dungeon_198_1.skill.skill5:active(caster, targets)
    --caster:say(self.name)
    dungeon_198_1[caster.room_id].phase3_special_trigger = false
    caster:addBuff(626275)
    caster.movable = false
    caster:stopMove()
    local counter = 0
    local room_id = caster.room_id
    local x, y, z = caster.x, caster.y, caster.z
    while counter < 3 and dungeon_198_1[room_id].status == "fight" do
      local select_targets = table.random(targets, 4)
      --if target and caster:castSpell(target, 852159) then
        counter  = counter + 1
      --  dungeon_198_1:sleep(1)
      --end
      for index, target in ipairs(select_targets) do
        local npc = Christine.Npc:new()
        npc:create(109236, x, y, z, 0)
        npc.search_enemy = false
        npc.strike_back = false
        npc.fight = false
        npc.mark = false
        npc.hide_hp_mp = true
        npc.hide_name = true
        npc.show_role_head = true
        npc:addBuff(626274)
        npc:addToPartition(room_id)
        caster:castSpell(caster, 852159)
        npc:callPlot("dungeonFireAI_198_1", target.guid)
      end
      dungeon_198_1:debug("skill 5 > times : "..counter)
      dungeon_198_1:sleep(1)
    end
    caster.movable = true
    caster:cancelBuff(626275)
    return  true
  end
end

function dungeonFireAI_198_1(target_guid)
  local npc = this()
  local target = that(target_guid)
  local room_id = npc.room_id
  npc:move(target.x, target.y, target.z, true)
  npc:delete()
end

function dungeonInitialize_198_1(room_id)
  debugmsg(0, 0, "dungeonInitialize_198_1")

  if not dungeon_198_1 then
    dungeonSetting_198_1()
  end
  if dungeon_198_1.alpha then
    dungeonSetting_198_1()
  end

  dungeon_198_1[room_id] = {}
  dungeon_198_1[room_id].boss = this()
  dungeon_198_1[room_id].boss.search_enemy = true
  dungeon_198_1[room_id].boss.strike_back = true
  dungeon_198_1[room_id].boss.fight = true
  dungeon_198_1[room_id].boss.patrol = false

  for orgid, buff in pairs(dungeon_198_1[room_id].boss.buff) do
    buff:remove(false)
  end

  dungeon_198_1[room_id].boss:addSkill("skill1", dungeon_198_1.skill.skill1)
  dungeon_198_1[room_id].boss:addSkill("skill2", dungeon_198_1.skill.skill2)
  dungeon_198_1[room_id].boss:addSkill("skill3", dungeon_198_1.skill.skill3)
  dungeon_198_1[room_id].boss:addSkill("skill4", dungeon_198_1.skill.skill4):lock()
  dungeon_198_1[room_id].boss:addSkill("skill5", dungeon_198_1.skill.skill5):lock()

  dungeon_198_1[room_id].battle_listener = Christine.BattleListener:new()
  dungeon_198_1[room_id].battle_listener:add(dungeon_198_1[room_id].boss)

  dungeon_198_1[room_id].status = "ready"
  dungeon_198_1[room_id].servants = {}
  dungeon_198_1[room_id].no_event_timer = false
  dungeon_198_1[room_id].check_servants = false
  dungeon_198_1[room_id].phase3_special_trigger = false
  
  dungeon_198_1[room_id].boss:beginPlot("dungeonFixPosition_198_1", 2)
end

function dungeonFixPosition_198_1()
  local room_id = this().room_id
  if dungeon_198_1.position_fixed then
    dungeon_198_1[room_id].boss:changePosition(
      dungeon_198_1.position_fixed.x,
      dungeon_198_1.position_fixed.y,
      dungeon_198_1.position_fixed.z,
      dungeon_198_1.position_fixed.direction)
    dungeon_198_1:debug("fix position")
  end
end

function dungeonActive_198_1(room_id)
  debugmsg(0, 0, "dungeonActive_198_1")

  dungeon_198_1[room_id].status = "fight"
  dungeon_198_1[room_id].boss:callPlot("dungeonMain_198_1", room_id)
  dungeon_198_1[room_id].boss:callPlot("npcAI_108974", room_id)
end

function dungeonMain_198_1(room_id)
  debugmsg(0, 0, "dungeonMain_198_1")

  local boss = dungeon_198_1[room_id].boss
  local battle_listener = dungeon_198_1[room_id].battle_listener
  local bbb = true
  local check_phase2 = true
  local phase2_hp_gap = boss.max_hp * 0.61
  local check_phase3 = true
  local phase3_hp_gap = boss.max_hp * 0.41
  local first_event_trigger = true

  while dungeon_198_1[room_id].status == "fight" do

    battle_listener:start()


    
    if bbb and battle_listener.duration_time > 480 then
      bbb = false
      ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108974_02]", 0)
      boss:addBuff(626179)
    end

    if first_event_trigger and battle_listener.duration_time >= 5 then
      dungeonEvent_198_1(room_id)
      first_event_trigger = false
      dungeon_198_1:debug("first event")
    end

    if check_phase2 and boss.hp <= phase2_hp_gap then
      check_phase2 = false
      boss.skill.skill1:lock()
      boss.skill.skill2:lock()
      boss.skill.skill3:lock()
      boss.skill.skill4:unlock()
      dungeon_198_1:debug("enter phase 2")
    end

    if check_phase3 and boss.hp <= phase3_hp_gap then
      check_phase2 = false
      check_phase3 = false
      boss.skill.skill1:lock()
      boss.skill.skill2:lock()
      boss.skill.skill3:lock()
      boss.skill.skill4:unlock()
      boss.skill.skill5:unlock()
      dungeon_198_1[room_id].phase3_special_trigger = true
      boss:addBuff(626275)
      boss:useSkill("skill5", battle_listener.players)
      dungeon_198_1:debug("enter phase 3")
    end

    if dungeon_198_1[room_id].check_servants then
      --dungeon_198_1:debug("check_servants : "..tostring(dungeon_198_1[room_id].check_servants))
      local servants_all_dead = true
      --dungeon_198_1:debug("#dungeon_198_1[room_id].servants : "..#dungeon_198_1[room_id].servants)
      for index, servant in ipairs(dungeon_198_1[room_id].servants) do
        --dungeon_198_1:debug("CheckID(servant.guid) : "..tostring(CheckID(servant.guid)))
        if CheckID(servant.guid) then
          servants_all_dead = false
          break
        end
      end
      --dungeon_198_1:debug("servants_all_dead : "..tostring(servants_all_dead))
      if servants_all_dead then
        boss:cancelBuff(626181)
        boss:addBuff(626131)
        dungeon_198_1[room_id].check_servants = false
        dungeon_198_1[room_id].servants = {}
      end
    end

    dungeon_198_1:sleep()
  end

  battle_listener:stop()
  for index, servant in ipairs(dungeon_198_1[room_id].servants) do
    servant:delete()
  end

  if dungeon_198_1[room_id].status == "success" then
    dungeon_198_1:debug("success")
  elseif dungeon_198_1[room_id].status == "fail" then
    dungeon_198_1:debug("fail")
    boss:hide_from_room():sleep(3)
    boss:show_to_room(room_id)
    dungeonInitialize_198_1(room_id)
  end
end

function dungeonEvent_198_1(room_id)
  if not dungeon_198_1 or not dungeon_198_1[room_id] then
    DebugMsg(0, 0, "not found dungeon_198_1["..room_id.."]")
    return false
  end
  dungeon_198_1:debug("dungeonEvent_198_1")

  if dungeon_198_1[room_id].status ~= "fight" then
    return
  end

  local boss = dungeon_198_1[room_id].boss

  local flags = dungeon_198_1.flags
  local select_flags = table.random(flags, 6)

  for index, flag in ipairs(select_flags) do
    local npc = Christine.Npc:new()
    npc:create(109198, flag.x, flag.y, flag.z, 0)
    npc.fight = false
    npc.strike_back = false
    npc.search_enemy = false
    npc:addTouchPlot("dungeonTouch_198_1", 24)
    SetCursorType(npc.guid,eCursor_Hyperlink)
    npc:addToPartition(room_id)
    table.insert(dungeon_198_1[room_id].servants, npc)
  end
  boss:addBuff(626181)
  ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108974_05]", 0)
  dungeon_198_1[room_id].check_servants = true
end

function dungeonTouch_198_1()
  local target = that()
  if target.is_npc then
    target:delete()
  end
end

function npcAI_108974(room_id)
  debugmsg(0, 0, "npcAI_108974")

  local boss = dungeon_198_1[room_id].boss
  local battle_listener = dungeon_198_1[room_id].battle_listener

  while dungeon_198_1[room_id].status == "fight" do
    if #boss.hate_list > 0 then
      if boss:useSkill("skill1", that(boss.attack_target_GUID)) then
        dungeon_198_1:sleep(1.5)
      elseif boss:useSkill("skill2") then
        dungeon_198_1:sleep(1.5)
      elseif boss:useSkill("skill3") then
        dungeon_198_1:sleep(1.5)
      elseif boss:useSkill("skill5", battle_listener.players) then
        dungeon_198_1:sleep(1.5)
      elseif not dungeon_198_1[room_id].phase3_special_trigger and boss:useSkill("skill4", battle_listener.players) then
        dungeon_198_1:sleep(1.5)
      end
    end
    dungeon_198_1:sleep()
  end
end