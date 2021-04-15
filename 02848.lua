-- Dungeon 169
-- Boss 6

function npcCreate_108601()
  local room_id = this().room_id
  dungeon169_boss6_init( room_id )
  --Cl_Resist_HackersBossNum()
   Cl_Resist_HackersBossNum()
end

function npcBeginFight_108601()
  local room_id = this().room_id
	Cl_Resist_HackersFightBegin()
  if dungeon169_boss6_check_env( room_id ) then
    dungeon169_boss6:debug( "Run> npcBeginFight_108601" )

    if dungeon169_boss6[room_id].status == "ready" then
      dungeon169_boss6_deploy( room_id )
    end
    
     

    return true

  else

    return false

  end
end

function npcEndFight_108601()
  local room_id = this().room_id

  if dungeon169_boss6_check_env( room_id ) then
    dungeon169_boss6:debug( "Run> npcEndFight_108601" )

    if dungeon169_boss6[room_id].status == "fight" then
      dungeon169_boss6_fail( room_id )
    end

    return true

  else

    return false

  end
end

function npcDead_108601()
  local room_id = this().room_id

  if dungeon169_boss6_check_env( room_id ) then
    dungeon169_boss6:debug( "Run> npcDead_108601" )

    if dungeon169_boss6[room_id].status =="fight" then
      dungeon169_boss6_success( room_id )
    end

     Cl_Resist_HackersBossDead()

    return true

  else

    return false

  end
end

-- 
-- 

function npcDead_103421() dungeon169_boss6_minion_dead() end
function npcDead_103422() dungeon169_boss6_minion_dead() end
function npcDead_103423() dungeon169_boss6_minion_dead() end
function npcDead_103424() dungeon169_boss6_minion_dead() end

function dungeon169_boss6_minion_dead()
  local room_id = this().room_id
  local this_minion = this()
  local killer = that()

  if dungeon169_boss6_check_env( room_id ) then
    dungeon169_boss6:debug( "Run> dungeon169_boss6_minion_dead" )

    if dungeon169_boss6[room_id].status =="fight" then
      for index, minion in ipairs( dungeon169_boss6[room_id].minions ) do
        if this_minion.guid == minion.guid then
          this_minion = table.remove( dungeon169_boss6[room_id].minions, index )
          break
        end
      end

      dungeon169_boss6[room_id].battle_listener:remove( this_minion )

      if killer.is_player then
        dungeon169_boss6[room_id].minions_killed_count = dungeon169_boss6[room_id].minions_killed_count + 1
        dungeon169_boss6:debug( "minions_killed_count + 1, ("..dungeon169_boss6[room_id].minions_killed_count..")" )
      end
    end

    return true

  else

    return false

  end
end

-- 礁岩石柱檢查血量
function npcLoop_103419()
  local this_pillar = this()
  local hp_gap = this_pillar.max_hp * 0.16
  local room_id = this_pillar.room_id

  if dungeon169_boss6_check_env( room_id ) then
    dungeon169_boss6:debug( "Run> npcLoop_103419" )

    for index, pillar in ipairs( dungeon169_boss6[room_id].pillars ) do
      if pillar.guid == this_pillar.guid then
        this_pillar = pillar
        break
      end
    end

    while dungeon169_boss6[room_id].status == "fight" do
      if this_pillar.target then
        this_pillar:changePosition(
          this_pillar.target.x,
          this_pillar.target.y,
          this_pillar.target.z,
          this_pillar.target.direction
        )
      end
      if this_pillar.hp < hp_gap then
        local stone = Christine.Npc:new()
        local direction = RandRange(1, 360)
        local distance = RandRange(5, 15)
        local x = this_pillar.x + math.sin( direction / 180 * math.pi ) * distance
        local z = this_pillar.z + math.cos( direction / 180 * math.pi ) * distance
        local y = GetHeight(x, this_pillar.y, z)
        stone:create( dungeon169_boss6.stone_orgid, x, y, z )
        stone:property({
          search_enemy = false,
          strike_back = false,
          fight = false,
          movable = false,
          hide_from_mini_map = true,
          hide_hp_mp = true,
          hide_name = true,
          mark = true,
          show_role_head = false,
          live_time = 12
        }):addTouchPlot(
          "npcTouch_103730",
          20
        ):cursorType(
          eCursor_Pickup
        ):addBuff(
          -- 無敵
          103730
        ):addToPartition(
          room_id
        )
      end
      dungeon169_boss6:sleep()
    end

  end
end

-- 礁岩石柱死亡
function npcDead_103419()
  local this_pillar = this()
  local room_id = this_pillar.room_id

  if dungeon169_boss6_check_env( room_id ) then
    dungeon169_boss6:debug( "Run> npcDead_103419" )

    for index, pillar in ipairs( dungeon169_boss6[room_id].pillars ) do
      if pillar.guid == this_pillar.guid then
        this_pillar = table.remove( dungeon169_boss6[room_id].pillars, index )
        break
      end
    end

    -- 打破石柱殺死被束縛的對象
    this_pillar.target:cancelBuff( 500547 )
    --this_pillar.target:systemCastSpell( 851629 )
  end

  return true

end

-- 礁岩碎塊觸碰
function npcTouch_103730()
  local player = this()
  local stone = that()

  stone:delete()
  player:addBuff( 501542 )
end


-- 
-- 

-- 投擲礁岩碎片
function magicobj_500992_run()
  local player = this()
  local room_id = player.room_id

  if dungeon169_boss6_check_env( room_id ) then
    dungeon169_boss6:debug( "Run> magicobj_500992_run" )

    local boss = dungeon169_boss6[room_id].boss

    if dungeon169_boss6[room_id].step == 1 then

      boss.skill.skill1.cd_counter = boss.skill.skill1.cd_counter + 5

    elseif dungeon169_boss6[room_id].step == 2 then

      local buffs = boss.buff

      if buffs[501541] then
        local power = buffs[501541].power - 1
        boss:cancelBuff( 501541 )
        boss:addBuff( 501541, power )
      end

    end
  end

  player:cancelBuff( 501542 )

end

-- 水波術 詠唱結束後執行
function magicobj_500335_run()
  local caster = this()
  local room_id = caster.room_id

  if dungeon169_boss6_check_env( room_id ) then
    dungeon169_boss6:debug( "Run> magicobj_500335_run" )

    -- 水波術命中次數根據難度改變
    for i = 1, dungeon169_boss6.skill11_target_count do

      local target = table.random( dungeon169_boss6[room_id].battle_listener.players, 1 )[1]

      if target then
        caster:systemCastSpell( target, 851639 )
      end

    end

  end
end

-- 清除血淋淋
function magicobj_500336_run()
  this():cancelBuff( 500318 )
  that():cancelBuff( 500318 )
end

-- 
-- 

function dungeon169_boss6_init( room_id )

  if not dungeon169_boss6 or
     dungeon169_boss6.alpha then
    dungeon169_boss6_setting()
  end
  dungeon169_boss6:debug( "Run> dungeon169_boss6_init" )

  local rear_door

  if dungeon169_boss6[room_id] and
     dungeon169_boss6[room_id].rear_door and
     dungeon169_boss6[room_id].rear_door.is_legal then

    rear_door = dungeon169_boss6[room_id].rear_door

  end

  -- Env Setting
  dungeon169_boss6[room_id] = {}
  dungeon169_boss6[room_id].status = "ready"
  dungeon169_boss6[room_id].step = 1
  dungeon169_boss6[room_id].minions = {}
  dungeon169_boss6[room_id].minions_killed_count = 0
  dungeon169_boss6[room_id].pillars = {}
  dungeon169_boss6[room_id].traps = {}
  dungeon169_boss6[room_id].avatars = {}

  -- Boss
  dungeon169_boss6[room_id].boss = this()
  dungeon169_boss6[room_id].boss.search_enemy = true
  dungeon169_boss6[room_id].boss.strike_back = true
  dungeon169_boss6[room_id].boss.fight = true

  dungeon169_boss6[room_id].boss:addSkill( "skill1", dungeon169_boss6.skill.skill1 )
  dungeon169_boss6[room_id].boss:addSkill( "skill2", dungeon169_boss6.skill.skill2 )
  dungeon169_boss6[room_id].boss:addSkill( "skill3", dungeon169_boss6.skill.skill3 )
  dungeon169_boss6[room_id].boss:addSkill( "skill4", dungeon169_boss6.skill.skill4 ):lock()
  dungeon169_boss6[room_id].boss:addSkill( "skill5", dungeon169_boss6.skill.skill5 ):lock()
  dungeon169_boss6[room_id].boss:addSkill( "skill6", dungeon169_boss6.skill.skill6 ):lock()
  dungeon169_boss6[room_id].boss:addSkill( "skill7", dungeon169_boss6.skill.skill7 ):lock()
  dungeon169_boss6[room_id].boss:addSkill( "skill8", dungeon169_boss6.skill.skill8 ):lock()

  -- Battle Listener
  dungeon169_boss6[room_id].battle_listener = Christine.BattleListener:new()
  dungeon169_boss6[room_id].battle_listener:add( dungeon169_boss6[room_id].boss )


  -- front door
  dungeon169_boss6[room_id].front_door = Christine.Npc:new()
  dungeon169_boss6[room_id].front_door:create(
    108489,
    dungeon169_boss6.flags[5].x,
    dungeon169_boss6.flags[5].y,
    dungeon169_boss6.flags[5].z,
    dungeon169_boss6.flags[5].direction
  ):property({
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
  })

  -- rear door
  if rear_door then
    dungeon169_boss6[room_id].rear_door = rear_door
  else
    dungeon169_boss6[room_id].rear_door = Christine.Npc:new()
    dungeon169_boss6[room_id].rear_door:create(
      108489,
      dungeon169_boss6.flags[6].x,
      dungeon169_boss6.flags[6].y,
      dungeon169_boss6.flags[6].z,
      dungeon169_boss6.flags[6].direction
    ):addToPartition(
      room_id
    ):property({
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
      show_role_head = false,
    })
  end

  if not dungeon169_boss6[room_id].fix_position then
    dungeon169_boss6[room_id].fix_position = {
      x = dungeon169_boss6[room_id].boss.x,
      y = dungeon169_boss6[room_id].boss.y,
      z = dungeon169_boss6[room_id].boss.z,
      direction = dungeon169_boss6[room_id].boss.direction
    }
  end

  dungeon169_boss6[room_id].boss:callPlot( 'dungeon169_boss6_fixpos', room_id )

end

function dungeon169_boss6_fixpos( room_id )
  dungeon169_boss6:sleep()
  dungeon169_boss6[room_id].boss:changeDirection(
    dungeon169_boss6[room_id].fix_position.direction
  )
end

function dungeon169_boss6_setting()
  local zone_id = this().zone_id

  dungeon169_boss6 = Christine.System:new( "dungeon169 boss6" )

  dungeon169_boss6.alpha = true
  dungeon169_boss6.beta = true
  dungeon169_boss6:debug( "Run> dungeon169_boss6_setting" )
  dungeon169_boss6.delay = 1

  -- 小怪出生點 at flags#1~4
  -- front_door at flags#5
  -- rear_door at flags#6
  -- 左浪 at flags#7, 9, 11
  -- 右浪 at flags#8, 10, 12
  dungeon169_boss6.flags = Christine.FlagGroup:new( 781386 )
  -- BOSS
  dungeon169_boss6.boss_orgid = 108601
  -- 礁岩石柱
  dungeon169_boss6.pillar_orgid = 103419
  -- 礁岩碎塊
  dungeon169_boss6.stone_orgid = 103730
  -- 礁岩陷阱
  dungeon169_boss6.trap_orgid = 104542
  -- Boss替身
  dungeon169_boss6.avatar_orgid = 104530
  -- 水波術命中人數
  dungeon169_boss6.skill11_target_count = 6

  if zone_id == 169 then
    -- Default

  elseif zone_id == 170 then
    dungeon169_boss6.skill11_target_count = 3

  elseif zone_id == 171 then
    dungeon169_boss6.skill11_target_count = 3

  end

  -- 
  -- 

  dungeon169_boss6.skill = {}

  -- 階段一

  -- 深留潛伏
  -- 隱身10秒，隱身結束後過3秒再次隱身，所以CD時間為13秒
  -- 
  dungeon169_boss6.skill.skill1 = Christine.Skill:new()
  dungeon169_boss6.skill.skill1.name = "skill1"
  dungeon169_boss6.skill.skill1.cd = 13
  function dungeon169_boss6.skill.skill1:active( caster )
    dungeon169_boss6:debug( self.name .. ":active" )
    if caster:castSpell( 851630 ) then
      return true
    else
      return false
    end
  end

  -- 礁岩束縛
  -- 階段二CD時間改為19秒
  dungeon169_boss6.skill.skill2 = Christine.Skill:new()
  dungeon169_boss6.skill.skill2.name = "skill2"
  dungeon169_boss6.skill.skill2.cd = 17
  -- dungeon169_boss6.skill.skill2.cd = 3
  function dungeon169_boss6.skill.skill2:active( caster, targets )
    dungeon169_boss6:debug( self.name .. ":active" )
    local valid_targets = {}

    -- 排除已經被束縛的玩家
    for index, target in ipairs( targets ) do
      if not target:checkBuff( 500547 ) then
        table.insert( valid_targets, target )
      end
    end

    local target = table.random( valid_targets, 1 )[1]
    if target then
      target:addBuff( 500547 )
      local pillar = Christine.Npc:new()
      pillar:create(
        dungeon169_boss6.pillar_orgid,
        target.x,
        target.y,
        target.z,
        target.direction
      ):property({
        search_enemy = false,
        strike_back = false,
        fight = true,
        movable = false,
        live_time = 15
      }):addToPartition(
        caster.room_id
      ):addBuff(
        505653
      )

      pillar.target = target

      table.insert( dungeon169_boss6[caster.room_id].pillars, pillar )

      pillar:callPlot( "npcLoop_103419" )

    end
    return true
  end

  -- 海老吞食
  dungeon169_boss6.skill.skill3 = Christine.Skill:new()
  dungeon169_boss6.skill.skill3.name = "skill3"
  dungeon169_boss6.skill.skill3.cd = 45
  function dungeon169_boss6.skill.skill3:active( caster, minions, is_change_step )
    dungeon169_boss6:debug( self.name .. ":active" )

    local target_minions
    if is_change_step then
      target_minions = minions
    else
      target_minions = table.random( minions, 1 )
    end

    if #target_minions > 0 then
      for index, target_minion in ipairs( target_minions ) do
        local minion_orgid = target_minion.orgid
        caster:kill( target_minion )
        dungeon169_boss6:debug( "kill minion, orgid = "..minion_orgid )

        local new_skill = dungeon169_boss6.minion_skill[minion_orgid][2]
        if new_skill then
          dungeon169_boss6:debug( "kill minion, new_skill.name = "..new_skill.name )
          caster:addSkill( new_skill.name, new_skill )
        end
        local new_buff = dungeon169_boss6.minion_buff[minion_orgid]
        if new_buff then
          caster:addBuff( new_buff )
        end
      end

      caster:scriptMessage( "[$MUTE]".."[SC_108601_05]" )
    end

    return true
  end

  -- 階段二

  -- 千瘡百孔
  dungeon169_boss6.skill.skill4 = Christine.Skill:new()
  dungeon169_boss6.skill.skill4.name = "skill4"
  dungeon169_boss6.skill.skill4.cd = 9
  function dungeon169_boss6.skill.skill4:active( caster, targets )
    dungeon169_boss6:debug( self.name .. ":active" )
    local target = table.random( targets, 1 )[1]
    if target then
      if caster:castSpell( target, 851631 ) then
        return true
      end
    end
    return false
  end

  -- 噴射水流
  dungeon169_boss6.skill.skill5 = Christine.Skill:new()
  dungeon169_boss6.skill.skill5.name = "skill5"
  dungeon169_boss6.skill.skill5.cd = 13
  function dungeon169_boss6.skill.skill5:active(caster, targets)
    dungeon169_boss6:debug( self.name .. ":active" )
    local target = table.random( targets, 1 )[1]
    if target then
      local room_id = caster.room_id
      local avatar = Christine.Npc:new()
      avatar:create(
        dungeon169_boss6.avatar_orgid,
        target.x,
        target.y,
        target.z,
        target.direction
      ):property({
        search_enemy = false,
        strike_back = false,
        fight = false,
        movable = false,
        hide_from_mini_map = true,
        hide_hp_mp = true,
        hide_name = true,
        mark = false,
        show_role_head = false,
        live_time = 6
      }):addBuff(
        -- 噴射水流詠唱特效
        500325
      ):addToPartition(
        room_id
      )
      table.insert( dungeon169_boss6[room_id].avatars, avatar )
      if avatar:castSpell( 851627 ) then
        return true
      end
    end
    return false
  end

  -- 嗜血狂鯊
  dungeon169_boss6.skill.skill6 = Christine.Skill:new()
  dungeon169_boss6.skill.skill6.name = "skill6"
  dungeon169_boss6.skill.skill6.cd = 0
  function dungeon169_boss6.skill.skill6:active( caster, targets )
    dungeon169_boss6:debug( self.name .. ":active" )

    local valid_targets = {}

    for index, target in ipairs( targets ) do
      if target:checkBuff( 500318 ) then
        table.insert( valid_targets, target )
      end
    end

    if #valid_targets > 0 then
      for index, target in ipairs( valid_targets ) do
        local avatar = Christine.Npc:new()
        avatar:create(
          dungeon169_boss6.avatar_orgid,
          target.x,
          target.y,
          target.z,
          target.direction
        ):property({
          search_enemy = false,
          strike_back = false,
          fight = false,
          movable = false,
          hide_from_mini_map = true,
          hide_hp_mp = true,
          hide_name = true,
          mark = false,
          show_role_head = false,
          live_time = 2
        }):addToPartition(
          caster.room_id
        )
        avatar:castSpell( target, 851638 )
      end
    end

    return true
  end

  -- 激浪濤滾
  dungeon169_boss6.skill.skill7 = Christine.Skill:new()
  dungeon169_boss6.skill.skill7.name = "skill7"
  dungeon169_boss6.skill.skill7.cd = 21
  function dungeon169_boss6.skill.skill7:active( caster )
    dungeon169_boss6:debug( self.name .. ":active" )
    
    local flag_indexs = { 7, 8, 9, 10, 11, 12 }

    for i = 1, 3 do
      local spawn_flag_index = table.random( flag_indexs, 1)[1]
      
      local target_flag_index = spawn_flag_index + 1
      if spawn_flag_index % 2 == 0 then
        target_flag_index = spawn_flag_index - 1
      end

      local spawn_flag = dungeon169_boss6.flags[spawn_flag_index]
      local target_flag = dungeon169_boss6.flags[target_flag_index]

      if spawn_flag and target_flag then
        local room_id = caster.room_id
        local avatar = Christine.Npc:new()
        avatar:create(
          dungeon169_boss6.avatar_orgid,
          spawn_flag.x,
          spawn_flag.y,
          spawn_flag.z,
          spawn_flag.direction
        ):property({
          search_enemy = false,
          strike_back = false,
          fight = false,
          hide_from_mini_map = true,
          hide_hp_mp = true,
          hide_name = true,
          mark = false,
          show_role_head = false,
          live_time = 10
        }):addToPartition(
          room_id
        ):addBuff(
          501544
        ):move(
          target_flag.x,
          target_flag.y,
          target_flag.z
        )

        table.insert( dungeon169_boss6[room_id].avatars, avatar )

      end
    end

    return true
  end

  -- 潮汐狂怒
  dungeon169_boss6.skill.skill8 = Christine.Skill:new()
  dungeon169_boss6.skill.skill8.name = "skill8"
  dungeon169_boss6.skill.skill8.cd = 30
  function dungeon169_boss6.skill.skill8:active( caster )
    dungeon169_boss6:debug( self.name .. ":active" )
    if caster:castSpell(490861) then
      return true
    else
      return false
    end
  end

  -- 治癒
  dungeon169_boss6.skill.skill9 = Christine.Skill:new()
  dungeon169_boss6.skill.skill9.name = "skill9"
  dungeon169_boss6.skill.skill9.cd = 23
  function dungeon169_boss6.skill.skill9:active( caster )
    dungeon169_boss6:debug( self.name .. ":active" )
    if caster:castSpell(490852) then
      return true
    else
      return false
    end
  end

  -- 恐懼
  dungeon169_boss6.skill.skill10 = Christine.Skill:new()
  dungeon169_boss6.skill.skill10.name = "skill10"
  dungeon169_boss6.skill.skill10.cd = 11
  function dungeon169_boss6.skill.skill10:active( caster )
    dungeon169_boss6:debug( self.name .. ":active" )
    if caster:castSpell(490853) then
      return true
    else
      return false
    end
  end

  -- 水波術
  -- 490859是永唱法術，唱完呼叫magicobj_500335_run函式用851639攻擊目標
  dungeon169_boss6.skill.skill11 = Christine.Skill:new()
  dungeon169_boss6.skill.skill11.name = "skill11"
  dungeon169_boss6.skill.skill11.cd = 12
  function dungeon169_boss6.skill.skill11:active( caster )
    dungeon169_boss6:debug( self.name .. ":active" )
    if caster:castSpell( 490859 ) then
      return true
    else
      return false
    end
  end

  -- 水雷彈
  dungeon169_boss6.skill.skill12 = Christine.Skill:new()
  dungeon169_boss6.skill.skill12.name = "skill12"
  dungeon169_boss6.skill.skill12.cd = 15
  function dungeon169_boss6.skill.skill12:active( caster, targets )
    dungeon169_boss6:debug( self.name .. ":active" )
    local target = table.random( targets, 1 )[1]
    caster:changePosition( target.x, target.y, target.z, caster.direction )
    if caster:castSpell( 490855 ) then
      return true
    else
      return false
    end
  end

  -- 礁岩刺擊
  dungeon169_boss6.skill.skill13 = Christine.Skill:new()
  dungeon169_boss6.skill.skill13.name = "skill13"
  dungeon169_boss6.skill.skill13.cd = 7
  function dungeon169_boss6.skill.skill13:active( caster, target )
    dungeon169_boss6:debug( self.name .. ":active" )
    if caster:castSpell( target, 851641 ) then
      return true
    else
      return false
    end
  end

  -- 礁岩護甲
  dungeon169_boss6.skill.skill14 = Christine.Skill:new()
  dungeon169_boss6.skill.skill14.name = "skill14"
  dungeon169_boss6.skill.skill14.cd = 20
  function dungeon169_boss6.skill.skill14:active( caster )
    dungeon169_boss6:debug( self.name .. ":active" )
    if caster:castSpell( 490857 ) then
      return true
    else
      return false
    end
  end

  -- 暗浪吸取
  dungeon169_boss6.skill.skill15 = Christine.Skill:new()
  dungeon169_boss6.skill.skill15.name = "skill15"
  dungeon169_boss6.skill.skill15.cd = 5
  function dungeon169_boss6.skill.skill15:active( caster, targets )
    dungeon169_boss6:debug( self.name .. ":active" )
    local farest_target

    for index, target in ipairs(targets) do
      if not target:checkBuff( 500547 ) then
        if farest_target then
          if caster:distanceTo( target ) > caster:distanceTo( farest_target ) then
            farest_target = target
          end
        else
          farest_target = target
        end
      end
    end

    if farest_target then
      farest_target:changePosition( caster.x, caster.y, caster.z, farest_target.direction )
      if caster:castSpell( farest_target, 490858 ) then
        return true
      end
    end
    return false
  end

  -- 礁岩陷阱
  dungeon169_boss6.skill.skill16 = Christine.Skill:new()
  dungeon169_boss6.skill.skill16.name = "skill16"
  dungeon169_boss6.skill.skill16.cd = 7
  function dungeon169_boss6.skill.skill16:active( caster )
    dungeon169_boss6:debug( self.name .. ":active" )

    local room_id = caster.room_id
    local trap = Christine.Npc:new()
    trap:create(
      dungeon169_boss6.trap_orgid,
      caster.x,
      caster.y,
      caster.z,
      caster.direction
    ):property({
      search_enemy = false,
      strike_back = false,
      fight = false,
      movable = false,
      hide_from_mini_map = true,
      hide_hp_mp = true,
      hide_name = true,
      mark = false,
      show_role_head = false
    }):addToPartition(
      room_id
    )

    table.insert( dungeon169_boss6[room_id].traps, trap )

    if caster.orgid == dungeon169_boss6.boss_orgid then
      -- 5秒爆炸
      trap:addBuff( 500539 )
    else
      -- 20秒爆炸，持續施放緩速
      trap:addBuff( 500337 )
    end

    return true
  end

  dungeon169_boss6.minions_orgid = {
    -- 泥鰭伏擊獵手
    103421,
    -- 泥鰭獵王
    103422,
    -- 泥鰭智者
    103423,
    -- 泥鰭巫師
    103424
  }

  dungeon169_boss6.minion_buff = {}
  dungeon169_boss6.minion_buff[103421] = 500277
  dungeon169_boss6.minion_buff[103422] = 500276
  dungeon169_boss6.minion_buff[103423] = 500278
  dungeon169_boss6.minion_buff[103424] = 500275

  dungeon169_boss6.minion_skill = {}
  dungeon169_boss6.minion_skill[103421] = {
    dungeon169_boss6.skill.skill15,
    dungeon169_boss6.skill.skill16
  }
  dungeon169_boss6.minion_skill[103422] = {
    dungeon169_boss6.skill.skill13,
    dungeon169_boss6.skill.skill14
  }
  dungeon169_boss6.minion_skill[103423] = {
    dungeon169_boss6.skill.skill11,
    dungeon169_boss6.skill.skill12
  }
  dungeon169_boss6.minion_skill[103424] = {
    dungeon169_boss6.skill.skill9,
    dungeon169_boss6.skill.skill10
  }

end

function dungeon169_boss6_deploy( _room_id )
  dungeon169_boss6:debug( "Run> dungeon169_boss6_deploy" )

  dungeon169_boss6[_room_id].front_door:addToPartition( _room_id )
  dungeon169_boss6[_room_id].boss:scriptMessage( "[$MUTE]".."[SC_108601_01]" )
  dungeon169_boss6[_room_id].status = "fight"
  dungeon169_boss6[_room_id].boss:callPlot( "dungeon169_boss6_main", _room_id )
  dungeon169_boss6[_room_id].boss:callPlot( "dungeon169_boss6_ai", _room_id )


  if dungeon169_boss6.beta then
    dungeon169_boss6[_room_id].boss:callPlot( "dungeon169_boss6_dloop", _room_id )
  end

  local attack_target_guid = dungeon169_boss6[_room_id].boss.attack_target_guid

  -- 隱身
  dungeon169_boss6[_room_id].boss.skill.skill1:resetCooldown()
  dungeon169_boss6[_room_id].boss:useSkill( "skill1" )

  -- 開場4隻小怪
  for index, orgid in ipairs( dungeon169_boss6.minions_orgid ) do
    local npc = Christine.Npc:new()
    local spawn_position = dungeon169_boss6.flags[index]
    npc:create(
      orgid,
      spawn_position.x,
      spawn_position.y,
      spawn_position.z,
      spawn_position.direction
    )
    -- 不產小怪設定
    if dungeon169_boss6.beta and dungeon169_boss6_console_data.no_minions then
    else
      npc:addToPartition( _room_id )
    end

    for index, skill in ipairs( dungeon169_boss6.minion_skill[orgid] ) do
      npc:addSkill( skill.name, skill )
    end

    dungeon169_boss6[_room_id].battle_listener:add( npc )

    table.insert( dungeon169_boss6[_room_id].minions, npc )

    if attack_target_guid ~= 0 then
      npc:attack( that( attack_target_guid ) )
    end

    npc:callPlot( "dungeon169_boss6_minion_ai", _room_id )
  end

end

function dungeon169_boss6_undeploy( _room_id )
  dungeon169_boss6:debug( "Run> dungeon169_boss6_undeploy" )

  for index, minion in ipairs( dungeon169_boss6[_room_id].minions ) do
    minion:delete()
  end

  for index, pillar in ipairs( dungeon169_boss6[_room_id].pillars ) do
    pillar:delete()
  end

  for index, trap in ipairs( dungeon169_boss6[_room_id].traps ) do
    trap:cancelBuff( 500539 )
    trap:cancelBuff( 500337 )
    trap:delete()
  end

  for index, avatar in ipairs( dungeon169_boss6[_room_id].avatars ) do
    avatar:delete()
  end

end

function dungeon169_boss6_main( _room_id )
  dungeon169_boss6:debug( "Run> dungeon169_boss6_main" )

  local boss = dungeon169_boss6[_room_id].boss
  local battle_listener = dungeon169_boss6[_room_id].battle_listener

  local violent_mode = false

  local skill6_wait_time = 8
  local skill6_timer_trigger = false
  local skill6_timer = skill6_wait_time

  while dungeon169_boss6[_room_id].status == "fight" do
    battle_listener:start()

    -- 狂暴
    if not violent_mode and
       battle_listener.duration_time > 480 then
      violent_mode = true
      boss:scriptMessage( "[$MUTE]".."[SC_108601_02]" )
      boss:addBuff( 625441 )
    end

    -- 階段檢查
    if dungeon169_boss6[_room_id].step == 1 then
      if dungeon169_boss6[_room_id].minions_killed_count >= 2 or
         #dungeon169_boss6[_room_id].minions <= 0 then
        dungeon169_boss6[_room_id].step = 2

        dungeon169_boss6[_room_id].boss.skill.skill3:resetCooldown()
        dungeon169_boss6[_room_id].boss:useSkill( "skill3" )

        boss.skill.skill1:lock()
        boss.skill.skill3:lock()
        boss.skill.skill4:unlock()
        boss.skill.skill5:unlock()
        boss.skill.skill6:unlock()
        boss.skill.skill7:unlock()
        boss.skill.skill8:unlock()

        boss:cancelBuff( 620416 )
      end
    end

    -- 階段執行
    if dungeon169_boss6[_room_id].step == 1 then
      -- 礁岩束縛
      boss:useSkill( "skill2", battle_listener.players )

      -- 海老吞食
      boss:useSkill( "skill3", dungeon169_boss6[_room_id].minions )

    elseif dungeon169_boss6[_room_id].step == 2 then
      -- 礁岩束縛
      boss:useSkill( "skill2", battle_listener.players )

      -- 噴射水流
      if boss:useSkill( "skill5", battle_listener.players ) then
        skill6_timer_trigger = true
      end


      if skill6_timer_trigger then
        skill6_timer = skill6_timer - 1
        if skill6_timer < 0 then
          boss.skill.skill6:unlock()
          skill6_timer = skill6_wait_time
          skill6_timer_trigger = false
        end
      end

      -- 嗜血狂鯊
      if boss:useSkill( "skill6", battle_listener.players ) then
        boss.skill.skill6:lock()
      end

      -- 激浪濤滾
      boss:useSkill( "skill7" )
    end

    for i = #dungeon169_boss6[_room_id].avatars, 1, -1 do
      if dungeon169_boss6[_room_id].avatars[i].is_dead then
        table.remove( dungeon169_boss6[_room_id].avatars, i)
      end
    end

    for i = #dungeon169_boss6[_room_id].traps, 1, -1 do
      if dungeon169_boss6[_room_id].traps[i].is_dead then
        table.remove( dungeon169_boss6[_room_id].traps, i)
      end
    end

    dungeon169_boss6:sleep()

  end

  if dungeon169_boss6[_room_id].status == "fail" then
    boss:hide_from_room():sleep( 3 )
    boss:show_to_room( _room_id )
    dungeon169_boss6_init( _room_id )
  end
end

function dungeon169_boss6_ai( _room_id )
  dungeon169_boss6:debug( "Run> dungeon169_boss6_ai" )

  local boss = dungeon169_boss6[_room_id].boss
  local battle_listener = dungeon169_boss6[_room_id].battle_listener

  while dungeon169_boss6[_room_id].status == "fight" do
    if #boss.hate_list > 0 then
      if dungeon169_boss6[_room_id].step == 1 then
        
        if boss:useSkill( "skill8" ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill10" ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill12", battle_listener.players ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill14" ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill16" ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill1" ) then dungeon169_boss6:sleep()
        end
      elseif dungeon169_boss6[_room_id].step == 2 then
        
        if boss:useSkill( "skill8" ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill10" ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill12", battle_listener.players ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill14" ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill16" ) then dungeon169_boss6:sleep()
        elseif boss:useSkill( "skill4", battle_listener.players ) then dungeon169_boss6:sleep()
        end
      end
    end

    dungeon169_boss6:sleep()
  end
end

function dungeon169_boss6_minion_ai( _room_id )
  dungeon169_boss6:debug( "Run> dungeon169_boss6_minion_ai" )

  local this_minion = this()
  for index, minion in ipairs( dungeon169_boss6[_room_id].minions ) do
    if minion.guid == this_minion.guid then
      this_minion = minion
      break
    end
  end

  local this_minion_orgid = this_minion.orgid
  local this_minion_skill = dungeon169_boss6.minion_skill[this_minion_orgid]

  local battle_listener = dungeon169_boss6[_room_id].battle_listener

  while dungeon169_boss6[_room_id].status == "fight" do
    if #this_minion.hate_list > 0 then
      if this_minion:useSkill( "skill9" ) then dungeon169_boss6:sleep()
      elseif this_minion:useSkill( "skill10" ) then dungeon169_boss6:sleep()
      elseif this_minion:useSkill( "skill11" ) then dungeon169_boss6:sleep()
      elseif this_minion:useSkill( "skill12", battle_listener.players ) then dungeon169_boss6:sleep()
      elseif this_minion:useSkill( "skill13", that( this_minion.attack_target_guid ) ) then dungeon169_boss6:sleep()
      elseif this_minion:useSkill( "skill14" ) then dungeon169_boss6:sleep()
      elseif this_minion:useSkill( "skill15", battle_listener.players ) then dungeon169_boss6:sleep()
      elseif this_minion:useSkill( "skill16" ) then dungeon169_boss6:sleep()
      end
    end

    dungeon169_boss6:sleep()
  end
end

-- 
-- 

function dungeon169_boss6_success( _room_id )
  dungeon169_boss6:debug( "Run> dungeon169_boss6_success" )
  dungeon169_boss6[_room_id].status = "success"
  dungeon169_boss6[_room_id].boss:scriptMessage( "[$MUTE]".."[SC_108601_04]" )
  dungeon169_boss6_undeploy( _room_id )

  dungeon169_boss6[_room_id].front_door:delete()
  dungeon169_boss6[_room_id].rear_door:delete()
end

function dungeon169_boss6_fail( _room_id )
  dungeon169_boss6:debug( "Run> dungeon169_boss6_fail" )
  dungeon169_boss6[_room_id].status = "fail"
  dungeon169_boss6[_room_id].boss:scriptMessage( "[$MUTE]".."[SC_108601_03]" )
  dungeon169_boss6[_room_id].boss.fight = false
  dungeon169_boss6[_room_id].boss.strike_back = false
  dungeon169_boss6[_room_id].boss.search_enemy = false
  dungeon169_boss6_undeploy( _room_id )

  dungeon169_boss6[_room_id].front_door:delete()
end

function dungeon169_boss6_check_env( _room_id )
  if not dungeon169_boss6 then
    debugmsg( 0, 0, "not found dungeon169_boss6" )
    return false
  end

  if not dungeon169_boss6[_room_id] then
    debugmsg( 0, 0, "not found dungeon169_boss6[" .. _room_id .."]" )
    return false
  end

  return true
end

-- 
-- 

dungeon169_boss6_console_data = {}
dungeon169_boss6_console_data.trace_minions_killed_count = false
dungeon169_boss6_console_data.trace_minions_length = false
dungeon169_boss6_console_data.trace_skill1_cd = false
dungeon169_boss6_console_data.no_minions = false
function dungeon169_boss6_console( _command )
  local room_id = this().room_id
  if _command == 1 then
    dungeon169_boss6:debug("command: 1 => trace minions killed count")
    if dungeon169_boss6_console_data.trace_minions_killed_count then
      dungeon169_boss6_console_data.trace_minions_killed_count = false
    else
      dungeon169_boss6_console_data.trace_minions_killed_count = true
    end
  elseif _command == 2 then
    dungeon169_boss6:debug("command: 2 => trace minions length")
    if dungeon169_boss6_console_data.trace_minions_length then
      dungeon169_boss6_console_data.trace_minions_length = false
    else
      dungeon169_boss6_console_data.trace_minions_length = true
    end
  elseif _command == 3 then
    dungeon169_boss6:debug("command: 3 => trace skill1 cd")
    if dungeon169_boss6_console_data.trace_skill1_cd then
      dungeon169_boss6_console_data.trace_skill1_cd = false
    else
      dungeon169_boss6_console_data.trace_skill1_cd = true
    end
  elseif _command == 4 then
    dungeon169_boss6:debug("command: 4 => print all boss skill")
    for skill_name, skill in pairs( dungeon169_boss6[room_id].boss.skill ) do
      dungeon169_boss6:debug( "boss.skill["..skill_name.."], cd: "..skill.cd_counter..", lock: "..tostring(skill.is_lock)..", ready: "..tostring(skill.ready) )
    end
  elseif _command == 5 then
    dungeon169_boss6:debug("command: 5 => create boss")
    local me = this()
    local boss = Christine.Npc:new()
    boss:create( 108601, me.x, me.y, me.z, me.direction )
    boss:addToPartition( me.room_id )
  elseif _command == 6 then
    dungeon169_boss6:debug("command: 6 => no minions")
    if dungeon169_boss6_console_data.no_minions then
      dungeon169_boss6_console_data.no_minions = false
    else
      dungeon169_boss6_console_data.no_minions = true
    end
  elseif _command == 7 then
    dungeon169_boss6:debug("command: 7 => go to step 2")
    dungeon169_boss6[room_id].step = 2
    dungeon169_boss6[room_id].boss.skill.skill1:lock()
    dungeon169_boss6[room_id].boss.skill.skill3:lock()
    dungeon169_boss6[room_id].boss.skill.skill4:unlock()
    dungeon169_boss6[room_id].boss.skill.skill5:unlock()
    dungeon169_boss6[room_id].boss.skill.skill6:unlock()
    dungeon169_boss6[room_id].boss.skill.skill7:unlock()
    dungeon169_boss6[room_id].boss.skill.skill8:unlock()
  elseif _command == 8 then
    for index, pillar in ipairs( dungeon169_boss6[room_id].pillars ) do
      pillar.hp = pillar.max_hp * 0.15
    end
  elseif _command == 9 then
    local this = this()
    local trap = Christine.Npc:new()
    trap:create(
      104542,
      this.x,
      this.y,
      this.z,
      this.direction
    ):property({
      search_enemy = false,
      strike_back = false,
      fight = false,
      movable = false,
      hide_from_mini_map = true,
      hide_hp_mp = true,
      hide_name = true,
      mark = false,
      show_role_head = false
    }):addToPartition()
    trap:addBuff( 500337 )
  else
    dungeon169_boss6:debug("command: 1 => toggle trace minions killed count")
    dungeon169_boss6:debug("command: 2 => toggle trace minions length")
    dungeon169_boss6:debug("command: 3 => toggle trace skill1 cd")
    dungeon169_boss6:debug("command: 4 => print all boss skill")
    dungeon169_boss6:debug("command: 5 => create boss")
    dungeon169_boss6:debug("command: 6 => toggle no minions")
    dungeon169_boss6:debug("command: 7 => go to step 2")
    dungeon169_boss6:debug("command: 8 => set hp of all pillars to 15%")
  end
end

function dungeon169_boss6_dloop( _room_id )
  while dungeon169_boss6[_room_id].status == 'fight' do
    if dungeon169_boss6_console_data.trace_minions_killed_count then
      dungeon169_boss6:debug("minions_killed_count = "..dungeon169_boss6[_room_id].minions_killed_count)
    end
    if dungeon169_boss6_console_data.trace_minions_length then
      dungeon169_boss6:debug("#minions = "..#dungeon169_boss6[_room_id].minions)
    end
    if dungeon169_boss6_console_data.trace_skill1_cd then
      dungeon169_boss6:debug("boss.skill.skill1.cd_counter = "..dungeon169_boss6[_room_id].boss.skill.skill1.cd_counter)
    end
    dungeon169_boss6:sleep()
  end
end