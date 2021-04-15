function gmDungeon1984_create()
  local me = this()
  local boss = Christine.Npc:new():create(108977, me.x, me.y, me.z, 0):addToPartition(0)
end
function gmDungeon1984_reducehp()
  local room_id = this().room_id
  dungeon_198_4[room_id].boss.hp = dungeon_198_4[room_id].boss.hp - dungeon_198_4[room_id].boss.max_hp * 0.1
end
------------------------------------------------------------------
------------------------------------------------------------------
function npcCreate_108977()
  local room_id = this().room_id
  dungeonInitialize_198_4(room_id)
  Cl_Resist_HackersBossNum();
  --Cl_Resist_HackersBossNum()
end
function npcDead_108977()
  Cl_Resist_HackersBossDead();
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return false
  end
  ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108977_04]", 0)
  if dungeon_198_4[room_id].status == "fight" then
    dungeon_198_4[room_id].status = "success"

    --Cl_Resist_HackersBossDead()
    sasa_ZoneDungeon_title_01(530985)
  end
end
function npcBeginFight_108977()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return false
  end
  if dungeon_198_4[room_id].keep_fight then
    dungeon_198_4[room_id].keep_fight = false
    return false
  end
  ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108977_01]", 0)
  if dungeon_198_4[room_id].status == "ready" then
    dungeonActive_198_4(room_id)
    Cl_Resist_HackersFightBegin();
  end
end
function npcEndFight_108977()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return false
  end
  if dungeon_198_4[room_id].keep_fight then
    return false
  end
  ScriptMessage(OwnerID(), 0, 3, "[$MUTE]".."[SC_108977_03]", 0)
  dungeon_198_4[room_id].boss.hp = dungeon_198_4[room_id].boss.max_hp;
  dungeon_198_4[room_id].phase = 1;
  if dungeon_198_4[room_id].status == "fight" then
    dungeon_198_4[room_id].status = "fail"
    dungeon_198_4[room_id].boss.search_enemy = false
    dungeon_198_4[room_id].boss.strike_back = false
    dungeon_198_4[room_id].boss.fight = false
  end
end
------------------------------------------------------------------
------------------------------------------------------------------
--°f¤õ
function npcCreate_109200()
  debugmsg(0, 0, "npcCreate_109200")
  local npc
  local my_guid = OwnerID()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == my_guid then
      npc = servant
      break
    end
  end

  if not npc then
    dungeon_198_4:debug("not found servant")
    return
  end

--  npc:addSkill("skill6", dungeon_198_4.skill.skill6)
--  npc:addSkill("skill7", dungeon_198_4.skill.skill7)
--  dungeon_198_4[room_id].battle_listener:add(npc)
end
function npcBeginFight_109200()
  debugmsg(0, 0, "npcBeginFight_109200")
  local npc
  local my_guid = OwnerID()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == my_guid then
      npc = servant
      break
    end
  end

  if not npc then
    dungeon_198_4:debug("not found servant")
    return
  end

  npc:callPlot("npcAI_109200", room_id)
end
function npcDead_109200()
  debugmsg(0, 0, "npcDead_109200")
  local npc
  local my_guid = OwnerID()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == my_guid then
      npc = servant
      break
    end
  end

  if not npc then
    dungeon_198_4:debug("not found servant")
    return
  end
  
  dungeon_198_4[room_id].battle_listener:remove(npc)
  dungeon_198_4[room_id].not_heal_count = dungeon_198_4[room_id].not_heal_count + 1
  dungeon_198_4:debug("kill count : "..dungeon_198_4[room_id].not_heal_count)
end

--«ã¤õ
function npcCreate_109201()
  debugmsg(0, 0, "npcCreate_109201")
  local npc
  local my_guid = OwnerID()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == my_guid then
      npc = servant
      break
    end
  end

  if not npc then
    dungeon_198_4:debug("not found servant")
    return
  end

--  npc:addSkill("skill8", dungeon_198_4.skill.skill8)
--  npc:addSkill("skill9", dungeon_198_4.skill.skill9)
--  dungeon_198_4[room_id].battle_listener:add(npc)
end
function npcBeginFight_109201()
  debugmsg(0, 0, "npcBeginFight_109201")
  local npc
  local my_guid = OwnerID()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == my_guid then
      npc = servant
      break
    end
  end

  if not npc then
    dungeon_198_4:debug("not found servant")
    return
  end

  npc:callPlot("npcAI_109201", room_id)
end
function npcDead_109201()
  debugmsg(0, 0, "npcDead_109201")
  local npc
  local my_guid = OwnerID()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == my_guid then
      npc = servant
      break
    end
  end

  if not npc then
    dungeon_198_4:debug("not found servant")
    return
  end
  
  dungeon_198_4[room_id].battle_listener:remove(npc)
  dungeon_198_4[room_id].not_heal_count = dungeon_198_4[room_id].not_heal_count + 1
  dungeon_198_4:debug("kill count : "..dungeon_198_4[room_id].not_heal_count)
end

--©À¤õ
function npcCreate_109202()
  debugmsg(0, 0, "npcCreate_109202")
  local npc
  local my_guid = OwnerID()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == my_guid then
      npc = servant
      break
    end
  end

  if not npc then
    dungeon_198_4:debug("not found servant")
    return
  end

--  npc:addSkill("skill10", dungeon_198_4.skill.skill10)
--  npc:addSkill("skill11", dungeon_198_4.skill.skill11)
--  dungeon_198_4[room_id].battle_listener:add(npc)
end
function npcBeginFight_109202()
  debugmsg(0, 0, "npcBeginFight_109202")
  local npc
  local my_guid = OwnerID()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == my_guid then
      npc = servant
      break
    end
  end

  if not npc then
    dungeon_198_4:debug("not found servant")
    return
  end

  npc:callPlot("npcAI_109202", room_id)
end
function npcDead_109202()
  debugmsg(0, 0, "npcDead_109202")
  local npc
  local my_guid = OwnerID()
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == my_guid then
      npc = servant
      break
    end
  end

  if not npc then
    dungeon_198_4:debug("not found servant")
    return
  end
  
  dungeon_198_4[room_id].battle_listener:remove(npc)
  dungeon_198_4[room_id].not_heal_count = dungeon_198_4[room_id].not_heal_count + 1
  dungeon_198_4:debug("kill count : "..dungeon_198_4[room_id].not_heal_count)
end
------------------------------------------------------------------
------------------------------------------------------------------
--¶i¤õµKµ²§ô«á
function magicObject_626201()
  debugmsg(0, 0, "magicObject_626201")
  this():beginPlot("magicObject_626201plot", 1)
  local room_id = this().room_id
  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    dungeon_198_4[room_id].battle_listener:remove(servant)
    servant:delete()
  end
end
function magicObject_626201plot()
  debugmsg(0, 0, "-------------------------")
  local room_id = this().room_id
  if not dungeon_198_4 or not dungeon_198_4[room_id] then
    debugmsg(0, 0, "not found dungeon_198_4")
    return
  end
  local boss = dungeon_198_4[room_id].boss
  local boss_20_percents_hp = boss.max_hp * 0.2
  --for index, servant in ipairs(dungeon_198_4[room_id].servants) do
  local heal_times = dungeon_198_4[room_id].heal_times
  local heal_count = heal_times - dungeon_198_4[room_id].not_heal_count
  dungeon_198_4:debug("kill count : "..dungeon_198_4[room_id].not_heal_count)
  dungeon_198_4:debug("heal count : "..heal_count)
  if heal_count > 0 then
    --if servant.is_legal and not servant.is_dead then
    boss.hp = boss.hp + boss_20_percents_hp * heal_count
    --dungeon_198_4[room_id].battle_listener:remove(servant)
    --servant:delete()
  end
  dungeon_198_4[room_id].servants = {}
  dungeon_198_4[room_id].pause_boss_ai = false
  dungeon_198_4[room_id].keep_fight = false
  boss.search_enemy = true
  boss.strike_back = true
  boss.fight = true
  dungeon_198_4[room_id].boss:addBuff(626198)
  -- local _playerCount = SetSearchAllPlayer( ReadRoleValue( boss.guid , EM_RoleValue_RoomID ) ) - 1;
  -- local _current;
  -- for i = 0 , _playerCount , 1 do
  --   _current = GetSearchResult();
  --   DebugMsg( 0 , 0 , "_current=".._current );
  --   SetAttack( boss.guid , _current );
  -- end
  dungeon_198_4:sleep( 3 )
  dungeon_198_4[room_id].battle_listener.kick_out_player_delay = 0
end
------------------------------------------------------------------
------------------------------------------------------------------
function dungeonSetting_198_4()
  debugmsg(0, 0, "dungeonSetting_198_4")
  
  dungeon_198_4 = Christine.System:new("dungeon_198_4")
  dungeon_198_4.alpha = false
  dungeon_198_4.beta = true
  dungeon_198_4.delay = 1

  local position_fix_reference = this()
  dungeon_198_4.position_fixed = {
    x = position_fix_reference.x,
    y = position_fix_reference.y,
    z = position_fix_reference.z,
    direction = position_fix_reference.direction
  }

--  local _playerCount = SetSearchAllPlayer( ReadRoleValue( dungeon_198_4.guid , EM_RoleValue_RoomID ) ) - 1;
--  local _current;
--  for i = 0 , _playerCount , 1 do
--    _current = GetSearchResult();
--    DebugMsg( 0 , 0 , "_current=".._current );
--    SetAttack( dungeon_198_4.guid , _current );
--  end

  dungeon_198_4.skill = {}

--  ²r´Æ
  dungeon_198_4.skill.skill1 = Christine.Skill:new()
  dungeon_198_4.skill.skill1.name = "skill1"
  dungeon_198_4.skill.skill1.cd = 7
  function dungeon_198_4.skill.skill1:active(caster, target)
    --caster:say(self.name)
    return caster:castSpell(target, 852183)
  end

--  °j©G
  dungeon_198_4.skill.skill2 = Christine.Skill:new()
  dungeon_198_4.skill.skill2.name = "skill2"
  dungeon_198_4.skill.skill2.cd = 7
  function dungeon_198_4.skill.skill2:active(caster)
    --caster:say(self.name)
    return caster:castSpell(caster, 852184)
  end

--  ´x±±
  dungeon_198_4.skill.skill3 = Christine.Skill:new()
  dungeon_198_4.skill.skill3.name = "skill3"
  dungeon_198_4.skill.skill3.cd = 17
  function dungeon_198_4.skill.skill3:active(caster)
    --caster:say(self.name)
    return  caster:castSpell(caster, 852185)
  end

--  ­¸´²¤§µK
  dungeon_198_4.skill.skill4 = Christine.Skill:new()
  dungeon_198_4.skill.skill4.name = "skill4"
  dungeon_198_4.skill.skill4.cd = 3
  function dungeon_198_4.skill.skill4:active(caster, targets)
    --caster:say(self.name)
    local target = table.random(targets, 1)[1]
--    return  caster:castSpell(target.x, target.y, target.z, 852186)
    return  caster:systemCastSpell(target.x, target.y, target.z, 852186)
  end

--  ±Y¸¨¤§¿V
  dungeon_198_4.skill.skill5 = Christine.Skill:new()
  dungeon_198_4.skill.skill5.name = "skill5"
  dungeon_198_4.skill.skill5.cd = 3
  function dungeon_198_4.skill.skill5:active(caster, targets)
    --caster:say(self.name)
    local target = table.random(targets, 1)[1]
--    return  caster:castSpell(target.x, target.y, target.z, 852187)
    return  caster:systemCastSpell(target.x, target.y, target.z, 852187)
  end

--  °f®É
  dungeon_198_4.skill.skill6 = Christine.Skill:new()
  dungeon_198_4.skill.skill6.name = "skill6"
  dungeon_198_4.skill.skill6.cd = 11
  function dungeon_198_4.skill.skill6:active(caster)
    --caster:say(self.name)
    return  caster:castSpell(caster, 852188)
  end

--  ¼¹µõ
  dungeon_198_4.skill.skill7 = Christine.Skill:new()
  dungeon_198_4.skill.skill7.name = "skill7"
  dungeon_198_4.skill.skill7.cd = 7
  function dungeon_198_4.skill.skill7:active(caster)
    --caster:say(self.name)
    return  caster:castSpell(caster, 852189)
  end

--  ¼««ã¤§·½
  dungeon_198_4.skill.skill8 = Christine.Skill:new()
  dungeon_198_4.skill.skill8.name = "skill8"
  dungeon_198_4.skill.skill8.cd = 7
  function dungeon_198_4.skill.skill8:active(caster)
    --caster:say(self.name)
    return  caster:castSpell(caster, 852190)
  end

--  ¨RÀ»¤õ¬y
  dungeon_198_4.skill.skill9 = Christine.Skill:new()
  dungeon_198_4.skill.skill9.name = "skill9"
  dungeon_198_4.skill.skill9.cd = 11
  function dungeon_198_4.skill.skill9:active(caster)
    --caster:say(self.name)
    return  caster:castSpell(caster, 852191)
  end

--  °õ©À
  dungeon_198_4.skill.skill10 = Christine.Skill:new()
  dungeon_198_4.skill.skill10.name = "skill10"
  dungeon_198_4.skill.skill10.cd = 7
  function dungeon_198_4.skill.skill10:active(caster)
    --caster:say(self.name)
    return  caster:castSpell(caster, 852192)
  end

--  µõ¤õ±Ù
  dungeon_198_4.skill.skill11 = Christine.Skill:new()
  dungeon_198_4.skill.skill11.name = "skill11"
  dungeon_198_4.skill.skill11.cd = 11
  function dungeon_198_4.skill.skill11:active(caster)
    --caster:say(self.name)
    return  caster:castSpell(caster, 852193)
  end
end

function dungeonInitialize_198_4(room_id)
  debugmsg(0, 0, "dungeonInitialize_198_4")
  if not dungeon_198_4 or dungeon_198_4.alpha then
    dungeonSetting_198_4()
  end

  dungeon_198_4[room_id] = {}
  dungeon_198_4[room_id].boss = this()
  dungeon_198_4[room_id].boss.search_enemy = true
  dungeon_198_4[room_id].boss.strike_back = true
  dungeon_198_4[room_id].boss.fight = true
  dungeon_198_4[room_id].boss.patrol = false

  for orgid, buff in pairs(dungeon_198_4[room_id].boss.buff) do
    buff:remove(false)
  end

  dungeon_198_4[room_id].boss:addSkill("skill1", dungeon_198_4.skill.skill1)
  dungeon_198_4[room_id].boss:addSkill("skill2", dungeon_198_4.skill.skill2)
  dungeon_198_4[room_id].boss:addSkill("skill3", dungeon_198_4.skill.skill3)
  dungeon_198_4[room_id].boss:addSkill("skill4", dungeon_198_4.skill.skill4):lock()
  dungeon_198_4[room_id].boss:addSkill("skill5", dungeon_198_4.skill.skill5):lock()

  dungeon_198_4[room_id].battle_listener = Christine.BattleListener:new()
  dungeon_198_4[room_id].battle_listener:add(dungeon_198_4[room_id].boss)

  dungeon_198_4[room_id].status = "ready"
  dungeon_198_4[room_id].phase = 1
  dungeon_198_4[room_id].servants = {}
  dungeon_198_4[room_id].pause_boss_ai = false
  dungeon_198_4[room_id].keep_fight = false
  dungeon_198_4[room_id].not_heal_count = 0
  dungeon_198_4[room_id].heal_times = 0
  dungeon_198_4[room_id].boss:lockhp(dungeon_198_4[room_id].boss.max_hp * 0.75, "dungeonLockhp_198_4")
  dungeon_198_4[room_id].boss:addBuff(502707)
  
  dungeon_198_4[room_id].boss:beginPlot("dungeonFixPosition_198_4", 2)
end

function dungeonFixPosition_198_4()
  local room_id = this().room_id
  dungeon_198_4[room_id].boss.hp = dungeon_198_4[room_id].boss.max_hp;
  dungeon_198_4[room_id].phase = 1;
  if dungeon_198_4.position_fixed then
    dungeon_198_4[room_id].boss:changePosition(
      dungeon_198_4.position_fixed.x,
      dungeon_198_4.position_fixed.y,
      dungeon_198_4.position_fixed.z,
      dungeon_198_4.position_fixed.direction)
    dungeon_198_4:debug("fix position")
  end
end

function dungeonActive_198_4(room_id)
  debugmsg(0, 0, "dungeonActive_198_4")

  dungeon_198_4[room_id].status = "fight"
  dungeon_198_4[room_id].boss:callPlot("dungeonMain_198_4", room_id)
  dungeon_198_4[room_id].boss:callPlot("npcAI_108977", room_id)

  dungeon_198_4[room_id].boss:addBuff(626171)
  dungeon_198_4[room_id].boss:addBuff(626198)
  dungeon_198_4[room_id].boss:addBuff(626199)
end

function dungeonMain_198_4(room_id)
  debugmsg(0, 0, "dungeonMain_198_4")

  local boss = dungeon_198_4[room_id].boss
  local battle_listener = dungeon_198_4[room_id].battle_listener
  local bbb = true
  local phase2_hp_gap = boss.max_hp * 0.76
  local phase3_hp_gap = boss.max_hp * 0.51
  local phase4_hp_gap = boss.max_hp * 0.26
  while dungeon_198_4[room_id].status == "fight" do
    battle_listener:start()
    if bbb and battle_listener.duration_time > 480 then
      bbb = false
      ScriptMessage(boss.guid, 0, 3, "[$MUTE]".."[SC_108977_02]", 0)
      boss:addBuff(626179)
    end

    if dungeon_198_4[room_id].phase == 1 then   --100~75
      DebugMsg(0,0,"-----1-----")
    elseif dungeon_198_4[room_id].phase == 2 then --75~50
      DebugMsg(0,0,"-----2-----")
      if boss.hp > phase2_hp_gap then
        dungeon_198_4[room_id].phase = 1
        boss:unlockhp()
        boss.skill.skill4:lock()
        boss.skill.skill5:lock()
        boss:lockhp(boss.max_hp * 0.75, "dungeonLockhp_198_4")
        dungeon_198_4:debug("return phase 1")
      end
    elseif dungeon_198_4[room_id].phase == 3 then --50~25
      DebugMsg(0,0,"-----3-----")
      if boss.hp > phase3_hp_gap then
        dungeon_198_4[room_id].phase = 2
        boss:unlockhp()
        boss.skill.skill4:lock()
        boss.skill.skill5:lock()
        boss:lockhp(boss.max_hp * 0.50, "dungeonLockhp_198_4")
        dungeon_198_4:debug("return phase 2")
      end
    elseif dungeon_198_4[room_id].phase == 4 then --25~0
      DebugMsg(0,0,"-----4-----")
      if boss.hp > phase4_hp_gap then
        dungeon_198_4[room_id].phase = 3
        boss:unlockhp()
        boss.skill.skill4:unlock()
        boss.skill.skill5:lock()
        boss:lockhp(boss.max_hp * 0.25, "dungeonLockhp_198_4")
        dungeon_198_4:debug("return phase 3")
      end
    end

    --for skill_name, skill in pairs(boss.skill) do
    --  if not skill.is_lock then
    --    dungeon_198_4:debug(skill_name.." cd : "..skill.cd_counter)
    --  end
    --end

    dungeon_198_4:debug("keep_fight = "..tostring(dungeon_198_4[room_id].keep_fight)..", pause_boss_ai = "..tostring(dungeon_198_4[room_id].pause_boss_ai)..", #players = "..#battle_listener.players)

    if dungeon_198_4[room_id].keep_fight then

      local all_players_dead = true
      for index, player in ipairs(battle_listener.players) do
        if not player.is_dead then
          all_players_dead = false
          break
        end
      end
      if all_players_dead then
        dungeon_198_4[room_id].status = "fail"
        dungeon_198_4:debug("everybody dead")
      end

    else

      if battle_listener.duration_time > 5 and #battle_listener.players == 0 then
        dungeon_198_4[room_id].status = "fail"
      end

    end

    dungeon_198_4:sleep()
  end

  battle_listener:stop()

  boss:cancelBuff(626170)
  boss:cancelBuff(626197)
  boss:cancelBuff(626171)
  boss:cancelBuff(626198)
  boss:cancelBuff(626199)

  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    servant:delete()
  end

  if dungeon_198_4[room_id].status == "success" then
    dungeon_198_4:debug("success")
  elseif dungeon_198_4[room_id].status == "fail" then
    dungeon_198_4:debug("fail")
    boss:hide_from_room():sleep(3)
    boss:show_to_room(room_id)
    dungeonInitialize_198_4(room_id)
  end
end

function dungeonLockhp_198_4()
  local room_id = this().room_id
  local boss = dungeon_198_4[room_id].boss
  if dungeon_198_4[room_id].phase == 1 then
    dungeon_198_4:debug("enter phase 2")
    dungeon_198_4[room_id].battle_listener.kick_out_player_delay = 3
    boss:unlockhp()
    boss.skill.skill4:lock()
    boss.skill.skill5:lock()
    boss:lockhp(boss.max_hp * 0.50, "dungeonLockhp_198_4")
    dungeon_198_4[room_id].phase = 2
    dungeon_198_4[room_id].pause_boss_ai = true
    dungeon_198_4[room_id].keep_fight = true
    boss.search_enemy = false
    boss.strike_back = false
    boss.fight = false
    boss:stopAttack()
    dungeon_198_4[room_id].boss:cancelBuff(626198)
    dungeonSummon_198_4(room_id, 2)
  elseif dungeon_198_4[room_id].phase == 2 then
    dungeon_198_4:debug("enter phase 3")
    dungeon_198_4[room_id].battle_listener.kick_out_player_delay = 3
    boss:unlockhp()
    boss.skill.skill4:unlock()
    boss.skill.skill5:lock()
    boss:lockhp(boss.max_hp * 0.25, "dungeonLockhp_198_4")
    dungeon_198_4[room_id].phase = 3
    dungeon_198_4[room_id].pause_boss_ai = true
    dungeon_198_4[room_id].keep_fight = true
    boss.search_enemy = false
    boss.strike_back = false
    boss.fight = false
    boss:stopAttack()
    dungeon_198_4[room_id].boss:cancelBuff(626198)
    dungeonSummon_198_4(room_id, 3)
  elseif dungeon_198_4[room_id].phase == 3 then
    dungeon_198_4:debug("enter phase 4")
    dungeon_198_4[room_id].battle_listener.kick_out_player_delay = 3
    boss:unlockhp()
    boss.skill.skill4:unlock()
    boss.skill.skill5:unlock()
    dungeon_198_4[room_id].phase = 4
    dungeon_198_4[room_id].pause_boss_ai = true
    dungeon_198_4[room_id].keep_fight = true
    boss.search_enemy = false
    boss.strike_back = false
    boss.fight = false
    boss:stopAttack()
    dungeon_198_4[room_id].boss:cancelBuff(626198)
    dungeonSummon_198_4(room_id, 4)
  end
end

function dungeonSummon_198_4(room_id, phase)
  dungeon_198_4[room_id].not_heal_count = 0
  local boss = dungeon_198_4[room_id].boss
  local servant_orgids = {109200, 109201, 109202}
  local orgids = {}
  if phase > 3 then
    dungeon_198_4:debug("summon 3 servants")
    dungeon_198_4[room_id].heal_times = 3
    orgids = table.random(servant_orgids, 3)
  elseif phase > 2 then
    dungeon_198_4:debug("summon 2 servants")
    dungeon_198_4[room_id].heal_times = 2
    orgids = table.random(servant_orgids, 2)
  elseif phase > 1 then
    dungeon_198_4:debug("summon 1 servants")
    dungeon_198_4[room_id].heal_times = 1
    orgids = table.random(servant_orgids, 1)
  end
  local x, y, z = boss.x, boss.y, boss.z
  local attack_target = table.random(dungeon_198_4[room_id].battle_listener.players, 1)[1]
  for index, orgid in ipairs(orgids) do
    local npc = Christine.Npc:new()
    npc:create(orgid, x, y, z, 0)
    table.insert(dungeon_198_4[room_id].servants, npc)
    npc:addToPartition(room_id)
    if attack_target then
      npc:attack(attack_target)
    end
  end
  boss:addBuff(626200)
end

function npcAI_108977(room_id)
  debugmsg(0, 0, "npcAI_108977")

  local boss = dungeon_198_4[room_id].boss
  local battle_listener = dungeon_198_4[room_id].battle_listener

  while dungeon_198_4[room_id].status == "fight" do
    if dungeon_198_4[room_id].pause_boss_ai then
      local servants_all_dead = true
      for index, servant in ipairs(dungeon_198_4[room_id].servants) do
        if not servant.is_dead then
          servants_all_dead = false
          break
        end
      end
      if servants_all_dead then
        boss:cancelBuff(626200)
      end
    else
      if #boss.hate_list > 0 then
        if boss:useSkill("skill3") then Sleep(10)
        elseif boss:useSkill("skill1", that(boss.attack_target_GUID)) then Sleep(10)
        elseif boss:useSkill("skill2") then Sleep(10)
        end
        if boss:useSkill("skill4", battle_listener.players) then end
        if boss:useSkill("skill5", battle_listener.players) then end
      end
    end
    dungeon_198_4:sleep()
  end
end

function npcAI_109200(room_id)
  debugmsg(0, 0, "npcAI_109200")

  local boss = dungeon_198_4[room_id].boss
  local battle_listener = dungeon_198_4[room_id].battle_listener
  local this_servant
  local this_guid = OwnerID()
  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == this_guid then
      this_servant = servant
      break
    end
  end

  if not this_servant then
    dungeon_198_4:debug("not found servant")
    this_servant:delete()
    return
  end

  this_servant:addSkill("skill6", dungeon_198_4.skill.skill6)
  this_servant:addSkill("skill7", dungeon_198_4.skill.skill7)
  battle_listener:add(this_servant)

  while dungeon_198_4[room_id].status == "fight" do
    if #this_servant.hate_list > 0 then
      if this_servant:useSkill("skill6") then
      elseif this_servant:useSkill("skill7") then
      end
    end
    dungeon_198_4:sleep()
  end
end

function npcAI_109201(room_id)
  debugmsg(0, 0, "npcAI_109201")

  local boss = dungeon_198_4[room_id].boss
  local battle_listener = dungeon_198_4[room_id].battle_listener
  local this_servant
  local this_guid = OwnerID()
  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == this_guid then
      this_servant = servant
      break
    end
  end

  if not this_servant then
    dungeon_198_4:debug("not found servant")
    this_servant:delete()
    return
  end

  this_servant:addSkill("skill8", dungeon_198_4.skill.skill8)
  this_servant:addSkill("skill9", dungeon_198_4.skill.skill9)
  battle_listener:add(this_servant)

  while dungeon_198_4[room_id].status == "fight" do
    if #this_servant.hate_list > 0 then
      if this_servant:useSkill("skill8") then
      elseif this_servant:useSkill("skill9") then
      end
    end
    dungeon_198_4:sleep()
  end
end

function npcAI_109202(room_id)
  debugmsg(0, 0, "npcAI_109202")

  local boss = dungeon_198_4[room_id].boss
  local battle_listener = dungeon_198_4[room_id].battle_listener
  local this_servant
  local this_guid = OwnerID()
  for index, servant in ipairs(dungeon_198_4[room_id].servants) do
    if servant.guid == this_guid then
      this_servant = servant
      break
    end
  end

  if not this_servant then
    dungeon_198_4:debug("not found servant")
    this_servant:delete()
    return
  end

  this_servant:addSkill("skill10", dungeon_198_4.skill.skill10)
  this_servant:addSkill("skill11", dungeon_198_4.skill.skill11)
  battle_listener:add(this_servant)

  while dungeon_198_4[room_id].status == "fight" do
    if #this_servant.hate_list > 0 then
      if this_servant:useSkill("skill10") then
      elseif this_servant:useSkill("skill11") then
      end
    end
    dungeon_198_4:sleep()
  end
end