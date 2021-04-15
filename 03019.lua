------------------------------------------------------
--  Zone 30 Dungeon
------------------------------------------------------

------------------------------------------------------
--  Npc 108432 �Q���i�i BOSS mumu
------------------------------------------------------
function npc_108432_create()	--- Boss ���󲣥ͼ@��

	Cl_Resist_HackersBossNum();	--- �N�ۤv���U�i���b�ȲM�椤�A�b���U�W Boss �ɡA�|�ˬd���a�O�_���������W Boss�C
	local room_id = this().room_id

	zone30dungeon_mumu_initialize(room_id)	--- �إߤ������BBoss�B���d�B�����e�B����C

	local mumu = zone30dungeon_mumu[room_id].mumu	--- �ŧi local mumu = ��Room��إߦn��mumu�C

	mumu:property {
		--  �C10%HP�Q���i�i�|���i�Ԩ��A����show, mark���}hide_hp_mp, hide_name
		show = true,
		mark = true,
		hide_hp_mp = false,
		hide_name = false,
	
		--  �Q���i�i�C�������D�ʧ@���|����
		gravity = true,
	
		--  �i�Ԩ�������
		search_enemy = true,
		strike_back = true,
		fight = true,
		movable = true,
	
		--  �C�����m�ɺ���
		hp = zone30dungeon_mumu[room_id].mumu.max_hp,
		is_driving = false
			}

  	mumu:addBuff(502707)	--- �Ȱ��۰ʦ^��
  	mumu:defaultIdleMotion(ruFUSION_MIME_IDLE_STAND)	--- �N Boss ���w�]�ʧ@�]������

	--- �]�w�ޯ�P�_�l��m
  	mumu:addSkill(zone30dungeon_mumu.skill.webs_of_chain.name, zone30dungeon_mumu.skill.webs_of_chain)
  	mumu:addSkill(zone30dungeon_mumu.skill.arrogant_strike.name, zone30dungeon_mumu.skill.arrogant_strike)
  	mumu:addSkill(zone30dungeon_mumu.skill.armed_heavy_blow.name, zone30dungeon_mumu.skill.armed_heavy_blow)
  	mumu:addSkill(zone30dungeon_mumu.skill.jump_with_chain.name, zone30dungeon_mumu.skill.jump_with_chain)
  	mumu:position {x = 612.7, y = 3097.2 , z = -1514.6 , direction = 100 }
  	--direction 
	zone30dungeon_mumu:debug("Mumu created")

  	mumu:cancelBuff(625231);	--- �N Boss ���L�Ĳ���
  	mumu:cancelBuff(625217);	--- �N Boss ���g�ɲ���

  	local _playerCount = SetSearchAllPlayer( ReadRoleValue( this().guid, EM_RoleValue_RoomID ) );
  	local _current;
	--  for i , _current in ipairs( _playerList ) do
  	for i = 0 , _playerCount , 1 do
		_current = GetSearchResult();
		CancelBuff( _current , 625239 );	--- �ɼu������Debuff
		--    if CheckBuff( _current , 625230 ) then
		--      DebugMsg( 0 , 0 , "_current=".._current );
		CancelBuff( _current , 625230 );	--- �����i Dot
		CancelBuff( _current , 625232 );	--- ����T�D �w��
		--    end
  	end
end

function npc_108432_begin_attack()	--- Boss �԰��}�l�@��

	local room_id = this().room_id
	if zone30dungeon_mumu[room_id].status ~= "fight" then	-- �� Room ���� Munu �D�԰����A�U��
		zone30dungeon_mumu[room_id].handler:beginPlot("zone30dungeon_mumu_main")	-- ���������}�l�i�J�D�@��
		ScriptMessage(this().guid, -1, 3, "[$MUTE]".."[SC_30_DUPLICATION_1_1]", 0)
  	end
	--  ScriptMessage(this().guid, 0, 3, "[$MUTE]".."[SC_30_DUPLICATION_1_1]", 0)
	zone30dungeon_mumu:debug("Mumu begin attack")
end

function npc_108432_end_attack()	--- Boss �԰������@��

  	DebugMsg(0,0,"-----npc_108432_end_attack");

	local this = this();
	local room_id = this.room_id	
	local mumu = zone30dungeon_mumu[room_id].mumu	--- �ŧi local mumu = ��Room��إߦn��mumu�C

	if ReadRoleValue( this.guid, EM_RoleValue_Register + 1 ) == 1 then
	--	DebugMsg(0,0,"-----false");
		return false;
	end

	mumu:property {
			zone30dungeon_mumu[room_id].mumu.max_hp,	-- �ɺ��ͩR
			is_driving = false
						}

	local _playerCount = SetSearchAllPlayer( ReadRoleValue( this.guid, EM_RoleValue_RoomID ) ) - 1;
	local _current;
--	for i , _current in ipairs( _playerList ) do
	for i = 0 , _playerCount , 1 do
	 	_current = GetSearchResult();
		CancelBuff( _current , 625239 );	--- �ɼu������Debuff
		if CheckBuff( _current , 625230 ) then
			DebugMsg( 0 , 0 , "_current=".._current );
			CancelBuff( _current , 625230 );	--- �����i Dot
			CancelBuff( _current , 625232 );	--- ����T�D �w��
		end
	end
--	end
end

function npc_108432_on_dead()	--- Boss ���`�@��

	WriteRoleValue( OwnerID() ,  EM_RoleValue_Register + 1 , 1 );
	npc_108432_end_attack();
	local room_id = this().room_id
	local bunka = zone30dungeon_mumu[room_id].bunka
	KillID(bunka.guid, bunka.guid); 
	zone30dungeon_mumu[room_id].status = "success"
	zone30dungeon_mumu:debug("mumu dead")
	--  sasa_ZoneDungeon_title_01(530950)
	Cl_Resist_HackersBossDead();
end

function npc_108432_recover()	-- Boss ���Ҽ@��

	local room_id = this().room_id
	local mumu = zone30dungeon_mumu[room_id].mumu

	mumu:property {
			--  �C10%HP�Q���i�i�|���i�Ԩ��A����show, mark���}hide_hp_mp, hide_name
			show = true,
			mark = true,
    			hide_hp_mp = false,
    			hide_name = false,

			--  �Q���i�i�C�������D�ʧ@���|����
    			gravity = true,

  			--  �i�Ԩ�������
			search_enemy = true,
			strike_back = true,
			fight = true,
			movable = true,


			is_driving = false
			}
  	
	mumu:defaultIdleMotion(ruFUSION_MIME_IDLE_STAND):cancelBuff(625231):cancelBuff(625242)
	zone30dungeon_mumu:debug("Mumu recover")
end

------------------------------------------------------
--  Npc 108433 �Z�˨��d BOSS���Ԩ� bunka
------------------------------------------------------
function npc_108433_create()	-- ���d ���󲣥ͼ@��

	local room_id = this().room_id

	local bunka = zone30dungeon_mumu[room_id].bunka

	bunka:property {
				show = true,
				mark = false,
				search_enemy = true,
				strike_back = true,
				fight = false,
				gravity = true,
				movable = true,
				hp = zone30dungeon_mumu[room_id].bunka.max_hp,
				hit_count = 0
  						}
	--  ���^��
  	bunka:addBuff(502707)	--- ����^��
  	bunka:defaultIdleMotion(ruFUSION_MIME_IDLE_STAND)	--- �]�w�w�]�ʧ@
	bunka:addSkill(zone30dungeon_mumu.skill.throw_a_missile.name, zone30dungeon_mumu.skill.throw_a_missile)	--- �]�w�ޯ�
  	bunka:addSkill(zone30dungeon_mumu.skill.fog_of_war.name, zone30dungeon_mumu.skill.fog_of_war)

	--  Mumu�r�pBunka��
	bunka:addSkill(zone30dungeon_mumu.skill.missile_of_quicksand.name, zone30dungeon_mumu.skill.missile_of_quicksand):lock()	--- �]�w�ޯબ�A
	bunka:addSkill(zone30dungeon_mumu.skill.energy_webs.name, zone30dungeon_mumu.skill.energy_webs):lock()
	bunka:addSkill(zone30dungeon_mumu.skill.energy_cannon.name, zone30dungeon_mumu.skill.energy_cannon):lock()
	bunka:addSkill(zone30dungeon_mumu.skill.super_missile.name, zone30dungeon_mumu.skill.super_missile):lock()
	bunka:position {x = 616.7, y = 3097.2 , z = -1410.3 , direction = 100 }	--- �]�w��m�P���V
	MoveToFlagEnabled( bunka.guid , false );	--- ����޼@��
	zone30dungeon_mumu:debug("Bunka created")
end

function npc_108433_begin_attack()	--- ���d �԰��}�l�@��

	local room_id = this().room_id
	if zone30dungeon_mumu[room_id].status ~= "fight" then
		zone30dungeon_mumu[room_id].handler:beginPlot("zone30dungeon_mumu_main")
	end
	zone30dungeon_mumu:debug("Bunka begin attack")
end

function npc_108433_end_attack()	-- ���d �԰������@��

end

function npc_108433_on_dead()	-- ���d ���`�@��
	zone30dungeon_mumu:debug("bunka dead")
end

function npc_108433_recover()	-- ���d ���ͼ@��

	local room_id = this().room_id
	local bunka = zone30dungeon_mumu[room_id].bunka

	bunka:property {
				show = true,
    				mark = false,
    				search_enemy = true,
    				strike_back = true,
    				fight = false,
				gravity = true,
				movable = true,
				hit_count = 0
							} :defaultIdleMotion(ruFUSION_MIME_IDLE_STAND):cancelBuff(625231)
  
	bunka.skill[zone30dungeon_mumu.skill.throw_a_missile.name]:unlock()
	bunka.skill[zone30dungeon_mumu.skill.fog_of_war.name]:unlock()
	bunka.skill[zone30dungeon_mumu.skill.missile_of_quicksand.name]:lock()
	bunka.skill[zone30dungeon_mumu.skill.energy_webs.name]:lock()
	bunka.skill[zone30dungeon_mumu.skill.energy_cannon.name]:lock()
	bunka.skill[zone30dungeon_mumu.skill.super_missile.name]:lock()
	zone30dungeon_mumu:debug("Bunka recover")
end

------------------------------------------------------
--  Initialize
------------------------------------------------------
function zone30dungeon_mumu_initialize(room_id)	-- �_�l�@��

	local rear_door

	--  �R���W���� Boss
	if zone30dungeon_mumu and
     	zone30dungeon_mumu[room_id] and
	zone30dungeon_mumu[room_id].handler and
	zone30dungeon_mumu[room_id].handler.is_legal then
		zone30dungeon_mumu[room_id].handler:delete()
  	end

	if zone30dungeon_mumu and
	zone30dungeon_mumu[room_id] and
	zone30dungeon_mumu[room_id].rear_door and
	zone30dungeon_mumu[room_id].rear_door.is_legal then
		rear_door = zone30dungeon_mumu[room_id].rear_door
	end

	--  �]�w
	if not zone30dungeon_mumu or zone30dungeon_mumu.alpha then
		zone30dungeon_mumu_setting()
	end

	--  �ذƥ��h
	zone30dungeon_mumu[room_id] = {}
	zone30dungeon_mumu[room_id].battle_listener = Christine.BattleListener:new()
	zone30dungeon_mumu[room_id].status = "standby"
	zone30dungeon_mumu[room_id].hp_percent_for_drive = 91

	--  �إ�MUMU
	zone30dungeon_mumu[room_id].mumu = this()
	zone30dungeon_mumu[room_id].battle_listener:add(zone30dungeon_mumu[room_id].mumu)

	--  �إߨ��d
	zone30dungeon_mumu[room_id].bunka = Christine.Npc:new()
	zone30dungeon_mumu[room_id].bunka:create(
		zone30dungeon_mumu.bunka_orgid,
		zone30dungeon_mumu[room_id].mumu.x,
		zone30dungeon_mumu[room_id].mumu.y,
		zone30dungeon_mumu[room_id].mumu.z + 100):addToPartition(room_id):faceTo(zone30dungeon_mumu[room_id].mumu)	-- ���V mumu
	zone30dungeon_mumu[room_id].battle_listener:add(zone30dungeon_mumu[room_id].bunka)

	--  �إߤ���
	zone30dungeon_mumu[room_id].handler = Christine.Npc:new()
	zone30dungeon_mumu[room_id].handler:create(
	zone30dungeon_mumu[room_id].mumu.ORGID,
	zone30dungeon_mumu[room_id].mumu.x,
	zone30dungeon_mumu[room_id].mumu.y,
	zone30dungeon_mumu[room_id].mumu.z,
	zone30dungeon_mumu[room_id].mumu.direction)

	--  �ƥ��e��
	zone30dungeon_mumu[room_id].front_door = Christine.Npc:new()
	zone30dungeon_mumu[room_id].front_door:create(108510, 818, 3156, -1793, 270):property {
														gravity = false,
														search_enemy = false,
														strike_back = false,
														fight = false,
														movable = false,
														obstruct = true,
														show_name = false,
														mark = false
  																}

--  �ƥ����
	if rear_door then
		zone30dungeon_mumu[room_id].rear_door = rear_door
	else
		zone30dungeon_mumu[room_id].rear_door = Christine.Npc:new()
		zone30dungeon_mumu[room_id].rear_door:create(108510, 405, 3156, -1497, 90):addToPartition(room_id):property {
			gravity = false,
			search_enemy = false,
			strike_back = false,
			fight = false,
			movable = false,
			obstruct = true,
			show_name = false,
			mark = false
						}
  	end
	zone30dungeon_mumu:debug("initialize done!")
end
------------------------------------------------------
--  Setting
------------------------------------------------------

local g_missileHitBunka = false;	-- �a�Ծɼu�O�_�w�R�����d�A�קK�ƼƦa�Ծɼu�P�ɩR�����d�ɡA�]�禡����Ĳ�o�ӾɭP�@�����_�����D�C

function zone30dungeon_mumu_setting()

	zone30dungeon_mumu = Christine.System:new("30D MUMU")
	zone30dungeon_mumu.alpha = false
	zone30dungeon_mumu.beta = true
	zone30dungeon_mumu.delay = 0.5

	zone30dungeon_mumu.turbo_time = 360	-- �g�ɮɶ�

	zone30dungeon_mumu.easy_zone_id = 168
	zone30dungeon_mumu.normal_zone_id = 167
	zone30dungeon_mumu.hard_zone_id = 166
	zone30dungeon_mumu.mode = "hard"
	zone30dungeon_mumu.zone_id = ReadRoleValue(OwnerID(), EM_RoleValue_ZoneID)

	if zone30dungeon_mumu.zone_id == zone30dungeon_mumu.easy_zone_id then
		zone30dungeon_mumu.mode = "easy"
	elseif zone30dungeon_mumu.zone_id == zone30dungeon_mumu.normal_zone_id then
		zone30dungeon_mumu.mode = "normal"
	elseif zone30dungeon_mumu.zone_id == zone30dungeon_mumu.hard_zone_id then
		zone30dungeon_mumu.mode = "hard"
  	end

	--  �q��setting
	zone30dungeon_mumu.mumu_orgid = 108432
	zone30dungeon_mumu.bunka_orgid = 108433
	zone30dungeon_mumu.quick_sand_orgid = 108511
	zone30dungeon_mumu.energy_web_orgid = 108512
	zone30dungeon_mumu.missile_orgid = 108513

	if zone30dungeon_mumu.mode == "easy" then
    		-- ²�檩setting
    		zone30dungeon_mumu.mumu_orgid = 108644
    		zone30dungeon_mumu.bunka_orgid = 108645
	elseif zone30dungeon_mumu.mode == "normal" then
		-- ���q��setting
		zone30dungeon_mumu.mumu_orgid = 108634
		zone30dungeon_mumu.bunka_orgid = 108635
	elseif zone30dungeon_mumu.mode == "hard" then
		-- �x����setting
		zone30dungeon_mumu.mumu_orgid = 108432
		zone30dungeon_mumu.bunka_orgid = 108433
		zone30dungeon_mumu.turbo_time = 480	-- �g�ɮɶ�
	end

	zone30dungeon_mumu.skill = {}

	------------------------------------------------------
	--  �Q���i�i�ޯ�
	------------------------------------------------------
	--  ���줧��
	zone30dungeon_mumu.skill.webs_of_chain = Christine.Skill:new()
	zone30dungeon_mumu.skill.webs_of_chain.name = "webs_of_chain"
	zone30dungeon_mumu.skill.webs_of_chain.cd = 7

	function zone30dungeon_mumu.skill.webs_of_chain:active(caster)
		--    caster:say("use skill : " .. self.name)
		DebugMsg(0,0,"-----���줧��");
		caster.movable = false

		local targets = table.random(caster.hate_list, 2)
		zone30dungeon_mumu:debug("webs_of_chain #targets : " .. #targets)

		for index, target in pairs(targets) do
			caster:castSpell(target, 851253)
		end

		caster.movable = true
		zone30dungeon_mumu:sleep(1.5)
    		return true
	end

	function magicobject_625232_result()
		--    if that().is_player then that():message("you are catched") end
		that():beginPlot("magicobject_625232_catch")
	end

	function magicobject_625232_catch()
		--    DebugMsg(0,0,"-----���줧�� �ǰe");
		local mumu = zone30dungeon_mumu[this().room_id].mumu
		--    this():sleep(1.2)
		--  �ɶ���MUMU�h�}�����N�����ǰe
		--    if zone30dungeon_mumu[this().room_id].status == "fight" and mumu.is_driving then
		DebugMsg(0,0,"-----���줧�� �ǰe");
		this():position {x = mumu.x, y = mumu.y, z = mumu.z}
		--    end
  	end

	--  �g�k���h
	zone30dungeon_mumu.skill.arrogant_strike = Christine.Skill:new()
	zone30dungeon_mumu.skill.arrogant_strike.name = "arrogant_strike"
	zone30dungeon_mumu.skill.arrogant_strike.cd = 7
	function zone30dungeon_mumu.skill.arrogant_strike:active(caster)
		--    caster:say("use skill : " .. self.name)
		local target

		for index, player in pairs(caster.hate_list) do
			if target then
				if player.hate_point > target.hate_point then
					target = player
        				end
      			else
        				target = player
      			end
    		end

    		if not target then
      			return false
    		end

    		local count = 0

		while zone30dungeon_mumu[caster.room_id].status == "fight" and not zone30dungeon_mumu[caster.room_id].mumu.is_driving and count < 3 do
			count = count + 1
			caster:castSpell(target, 851450)
			zone30dungeon_mumu:debug("arrogant_strike " .. count .. " times"):sleep(2.5)
		end
		zone30dungeon_mumu:sleep(1.5)
    		return true
	  end

	--  �Z�˨I��
	zone30dungeon_mumu.skill.armed_heavy_blow = Christine.Skill:new()
	zone30dungeon_mumu.skill.armed_heavy_blow.name = "armed_heavy_blow"
	zone30dungeon_mumu.skill.armed_heavy_blow.cd = 17
	function zone30dungeon_mumu.skill.armed_heavy_blow:active(caster)
		--    caster:say("use skill : " .. self.name)
		if not zone30dungeon_mumu[caster.room_id].mumu.is_driving then
			DebugMsg( 0, 0, "�Z�˨I�� = "..GetSystime(0) );
			caster.movable = false
			caster:castSpell(851451)
			caster.movable = true
			zone30dungeon_mumu:sleep(1.5)
			return true
		end
	end

  	function magicobject_625224_result()

		if that().buff[625234] then
			this():systemCastSpell(that(), 851481, that().buff[625234].power)
			return
    		end
  	end

  	--  ������D
	zone30dungeon_mumu.skill.jump_with_chain = Christine.Skill:new()
	zone30dungeon_mumu.skill.jump_with_chain.name = "jump_with_chain"
	zone30dungeon_mumu.skill.jump_with_chain.cd = 19

	function zone30dungeon_mumu.skill.jump_with_chain:active(caster)
	--    caster:say("use skill : " .. self.name)

		if not zone30dungeon_mumu[caster.room_id].mumu.is_driving then
			DebugMsg(0,0,"-----������D");

			local target
			local targets = {}
      
			for index, player in pairs(caster.hate_list) do
				if #targets > 0 then
					for target_index, target in pairs(targets) do
						if player.hate_point > target.hate_point then
							table.insert(targets, target_index, player)
						elseif target_index == #targets then
							table.insert(target, player)
						end
						break
					end
				else
					table.insert(targets, player)
				end
			end

			if #targets > 1 then
				DebugMsg(0,0,"-----22222");
				target = targets[2]
			else
				DebugMsg(0,0,"-----11111");
				target = targets[1]
			end

			if not target then return false end

			--  �ޯ�᧹�ᵥ�ݰʧ@��������

			-- �C�Ӯɶ����𪺦a�賣�����n���s�ˬd�O�_�b�r�p���d���A�A�_�h�|���r�p�����i�I��첾�A�ɭP Bug �����D�o��
			if not zone30dungeon_mumu[caster.room_id].mumu.is_driving then
				caster:castSpell(target, 851473):sleep(1.2)
				--  �������O�A�]�������n��
			end

			if not zone30dungeon_mumu[caster.room_id].mumu.is_driving then
				caster.gravity = false
				--  �ĦV�ؼСA0.4��ᰱ�U��
				caster:move(target.x, target.y, target.z):sleep(0.4):stopMove()
				--  ���U�ӫ�ߨ詹�W��
			end

			if not zone30dungeon_mumu[caster.room_id].mumu.is_driving then
				caster:defaultIdleMotion(ruFUSION_MIME_JUMP_UP):move(target.x, target.y + 30, target.z):sleep(0.4)
			end

			if not zone30dungeon_mumu[caster.room_id].mumu.is_driving then
				--  ���W����0.4�����
				caster:property { show = false, mark = false, fight = false}:sleep(0.6)
			end

			if not zone30dungeon_mumu[caster.room_id].mumu.is_driving then
				--  ����ؼЫ�X�{
				caster:position {
						x = target.x,
						y = target.y,
						z = target.z
								} :property {
									show = true,
									mark = true,
									fight = true,
									gravity = true
											} :attack(target):addBuff(625244) -- ��w�ؼ�5��
												:defaultIdleMotion(ruFUSION_MIME_JUMP_DOWN):sleep(1):defaultIdleMotion(ruFUSION_MIME_IDLE_STAND)
    			end
		end
		zone30dungeon_mumu:sleep(1.5)
		return true
	end
  	------------------------------------------------------
  	--  �Z�˨��d
  	------------------------------------------------------
  	--  ��g�u
	zone30dungeon_mumu.skill.throw_a_missile = Christine.Skill:new()
	zone30dungeon_mumu.skill.throw_a_missile.name = "throw_a_missile"
	zone30dungeon_mumu.skill.throw_a_missile.cd = 9

	function zone30dungeon_mumu.skill.throw_a_missile:active(caster)
	--    caster:say("use skill : " .. self.name)
		DebugMsg( 0, 0, "��g�u = "..GetSystime(0) );

		local target = table.random(zone30dungeon_mumu[caster.room_id].battle_listener.players, 1)[1]

		if not target then return false end

    		caster.movable = false
		caster:castSpell(target, 851474)
		caster.movable = true
		zone30dungeon_mumu:sleep(1.5)

    		return true
	end

	--  �Ԥ��g��
	zone30dungeon_mumu.skill.fog_of_war = Christine.Skill:new()
	zone30dungeon_mumu.skill.fog_of_war.name = "fog_of_war"
	zone30dungeon_mumu.skill.fog_of_war.cd = 11

	function zone30dungeon_mumu.skill.fog_of_war:active(caster)
	--    caster:say("use skill : " .. self.name)
		DebugMsg( 0, 0, "�Ԥ��g�� = "..GetSystime(0) );

		caster.movable = false

		local targets
		local count = 0
		local players = zone30dungeon_mumu[caster.room_id].battle_listener.players

		while zone30dungeon_mumu[caster.room_id].status == "fight" and not zone30dungeon_mumu[caster.room_id].mumu.is_driving and count < 3 do

      			targets = table.random(players, 3)
			for index, target in pairs(targets) do
				if index == 1 then
					caster:castSpell(target, 851475)
				else
					caster:systemCastSpell(target, 851475)
				end
			end
      			zone30dungeon_mumu:sleep(2)
      			count = count + 1
		end

		caster.movable = true
		zone30dungeon_mumu:sleep(1.5)

		return true
  	end

	------------------------------------------------------
  		--  �Q���i�i �r�p �Z�˨��d
  	------------------------------------------------------
  	--  �y�F�u
	zone30dungeon_mumu.skill.missile_of_quicksand = Christine.Skill:new()
	zone30dungeon_mumu.skill.missile_of_quicksand.name = "missile_of_quicksand"
	zone30dungeon_mumu.skill.missile_of_quicksand.cd = 11

	function zone30dungeon_mumu.skill.missile_of_quicksand:active(caster)
	--    caster:say("use skill : " .. self.name)
		DebugMsg( 0, 0, "�y�F�u = "..GetSystime(0) );
		local target
		local _npc
		local count = 0

		caster.movable = false

		while zone30dungeon_mumu[caster.room_id].status == "fight" and zone30dungeon_mumu[caster.room_id].mumu.is_driving and count < 6 do
      		--	DebugMsg(0,0,"-----�y�F�u======"..#zone30dungeon_mumu[caster.room_id].battle_listener.players);
			if #zone30dungeon_mumu[caster.room_id].battle_listener.players > 0 then
				target = table.random(zone30dungeon_mumu[caster.room_id].battle_listener.players, 1)[1]
				_npc = Christine.Npc:new():create(
				zone30dungeon_mumu.quick_sand_orgid,
				target.x,
				target.y,
				target.z
					):property{
						search_enemy = false,
						strike_back = false,
						fight = false,
						mark = false,
						hide_from_mini_map = true,
						hide_hp_mp = true,
						hide_name = true,
						movable = false,
						disable_rotate = true,
						live_time = 15
								 }:addToPartition(caster.room_id)
							--	 }:sleep(0.5):addToPartition(caster.room_id):addBuff(625237)
				count = count + 1;
				_npc:addBuff(507881,0,-1);	-- �wĵ�ĪG
				SysCastSpellLv( caster.guid, _npc.guid, 851476, 0 );	-- �y�F�u
      			end
      			zone30dungeon_mumu:sleep(1)
    		end

    		caster.movable = true

		zone30dungeon_mumu:sleep(1.5)
		return true
	end

	--  ��q��
	zone30dungeon_mumu.skill.energy_webs = Christine.Skill:new()
	zone30dungeon_mumu.skill.energy_webs.name = "energy_webs"
	zone30dungeon_mumu.skill.energy_webs.cd = 16

	function zone30dungeon_mumu.skill.energy_webs:active(caster)
	--    caster:say("use skill : " .. self.name)
		DebugMsg( 0, 0, "��q�� = "..GetSystime(0) );
		caster.movable = false
		caster:castSpell(851482):sleep(3.5)
		local _npc

		for index = 1, 10 do
			_npc = Christine.Npc:new()
			_npc:create(
			zone30dungeon_mumu.energy_web_orgid, 
			caster.x - 120 + RandRange(1, 240),
			caster.y,
			caster.z - 120 + RandRange(1, 240)
					):property{
							search_enemy = false,
							strike_back = false,
							fight = false,
							mark = false,
							hide_from_mini_map = true,
							hide_hp_mp = true,
							hide_name = true,
							movable = false,
							disable_rotate = true,
							live_time = 6
								} :addToPartition(caster.room_id):addBuff(625243)
		end

    		caster.movable = true
		zone30dungeon_mumu:sleep(1.5)
		return true
  	end

  	--  ��q��
  	zone30dungeon_mumu.skill.energy_cannon = Christine.Skill:new()
  	zone30dungeon_mumu.skill.energy_cannon.name = "energy_cannon"
  	zone30dungeon_mumu.skill.energy_cannon.cd = 2

  	function zone30dungeon_mumu.skill.energy_cannon:active(caster, target)
	--    caster:say("use skill : " .. self.name)
		DebugMsg( 0, 0, "��q�� = "..GetSystime(0) );
    		caster:castSpell(target, 851478):sleep(1)
    		zone30dungeon_mumu:sleep(1.5)
    		return true
  	end

  	--  �a�Ծɼu
  	zone30dungeon_mumu.skill.super_missile = Christine.Skill:new()
  	zone30dungeon_mumu.skill.super_missile.name = "super_missile"
  	zone30dungeon_mumu.skill.super_missile.cd = 5

	function zone30dungeon_mumu.skill.super_missile:active(caster)
	--    caster:say("use skill : " .. self.name)
		DebugMsg( 0, 0, "�a�Ծɼu = "..GetSystime(0) );
		local targets = table.random(zone30dungeon_mumu[caster.room_id].battle_listener.players, 3)
		local _missile
		g_missileHitBunka = false;	-- �C���I��a�Ծɼu�ɡA���m�w�R�����A
	--	SysCastSpellLv( caster.guid, caster.guid, 851504, 0 );	-- �o�g�ɼu�S��
	--	caster:castSpell(851504):sleep(2)	-- �ɼu�S��

		for index, target in pairs(targets) do
			_missile = Christine.Npc:new()
			_missile:create(
				zone30dungeon_mumu.missile_orgid,
				caster.x,
				caster.y + 10,
				caster.z
					):property {
						fight = false,
						search_enemy = false,
						strike_back = false,
						hide_hp_mp = true,
						hide_name = true,
						gravity = false,
						attack_target = target
							} :addToPartition(caster.room_id)
							:addBuff(625247)
							:beginPlot("zone30dungeon_mumu_missile_ai")
    		end

    		zone30dungeon_mumu:sleep(1.5)
    		return true
	end

	function magicobject_625229_check()

		local missile = this()
		zone30dungeon_mumu:debug("missile hit check")
		zone30dungeon_mumu:debug("missile explode")
		--    zone30dungeon_mumu:debug("--TargetID--"..TargetID())
		this():castSpell(851483)
  	end

	function magicobject_625246()
		DebugMsg( 0 , 0 , "--boom--  "..OwnerID());
		local room_id = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
		local _npcCount = SetSearchAllNPC( room_id ) - 1;
		DebugMsg( 0 , 0 , "--_npcCount--  ".._npcCount);
		local _current
		local _orgid;
		for i = 0 , _npcCount , 1 do
			_current = GetSearchResult();
			--      DebugMsg( 0 , 0 , "--GetDistance--  "..GetDistance( OwnerID() , _current ));
			if GetDistance( OwnerID() , _current ) <= 50 then
				_orgid = ReadRoleValue( _current , EM_RoleValue_OrgID );
				if _orgid == 108433 or _orgid == 108635 or _orgid == 108645 then
          					DebugMsg( 0 , 0 , "--true--  ");
					local mumu = zone30dungeon_mumu[room_id].mumu
					local bunka = zone30dungeon_mumu[room_id].bunka
					mumu.is_driving = false;
					zone30dungeon_mumu_get_off();
				--          mumu:position {x = bunka.x, y = bunka.y, z = bunka.z, direction = bunka.direction};
				--          zone30dungeon_mumu:sleep(5)
				--          mumu:beginPlot("zone30dungeon_mumu_ai");
				--          bunka:beginPlot("zone30dungeon_mumu_bunka_ai")
				end
			end
			--      DebugMsg( 0 , 0 , "--_current--  ".._npcCount);
    		end
    		this():delete()
      	end

	zone30dungeon_mumu:debug("setting done!")
end

function magicBase_626308_Plot()	-- �y�F�u �����S�Ī����

	local Owner = OwnerID();	-- Boss
	local Target = TargetID();	-- �S�Ī���
	local FlySpeed = 200;	-- ROM ������S�Ī�����t�ײΤ@����t 200�A���H�{��
	local Distance = GetDistance( Owner, Target );
	local DelayTime = Math.Ceil((Distance/FlySpeed)*10);	-- ��F�ت��a�e������ɶ�
--	DebugMsg( Owner, 0, "DelayTime = "..DelayTime );
	CallPlot( Target, "magicBase_626308_Plot2", Owner, Target, DelayTime );
end

local g_hitUnits = {};	-- �y�F�����M��A�קK�ƼƬy�F�P�ɹ��@�ؼгy���ˮ`�ɭP�ؼгQ��������p�o��

function magicBase_626308_Plot2( Boss, Owner, DelayTime )	-- �ѦU�S�Ī������A�קK Already running �����D

	Sleep(DelayTime);
	CancelBuff_NoEvent( Owner, 507881 );	-- �R���wĵ�S��
--	AddBuff( Owner, 625237, 0, -1 );	-- �I��w�ɶˮ`

	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	if not g_hitUnits[Room] then
		g_hitUnits[Room] = {};
	--	DebugMsg( 0, Room, "Create Room" );
	end

	while true do
		SysCastSpellLv( Owner, Owner, 852290, 0 );	-- �y�F�S��

		local Time = GetSystime(0);
		if not g_hitUnits[Room][Time] then	-- �ƼƬy�F�P�ɶ��u��缾�a�y�� 1 ���ˮ`
			g_hitUnits[Room][Time] = {};
		--	DebugMsg( 0, Room, "Create Time"..Time );
		end

		local Players = SearchRangePlayer( Owner, 30 );	-- �d�򤺪����a
		if #Players ~= 0 then
			for i = 0, #Players do
				if not g_hitUnits[Room][Time][Players[i]] and ReadRoleValue( Players[i], EM_RoleValue_Voc ) ~= 0 then
					g_hitUnits[Room][Time][Players[i]] = 1;
					SysCastSpellLv( Boss, Players[i], 851480, 0 );	-- �y�F������ˮ`&�w�t
				--	DebugMsg( 0, Room, "Attack"..Time );
				end
			end
		end
		Sleep(10);
	end
end
------------------------------------------------------
--  Main Loop
------------------------------------------------------
function zone30dungeon_mumu_main()

	local room_id = this().room_id

	zone30dungeon_mumu:debug("Main Loop start")
	zone30dungeon_mumu[room_id].front_door:addToPartition(room_id)	--- ���ͦ� Room ���e��
	zone30dungeon_mumu[room_id].status = "fight"

	npc_108432_recover(room_id)	--- Boss ����
	npc_108433_recover(room_id)	--- ���d ����

  	local battle_listener = zone30dungeon_mumu[room_id].battle_listener
	local mumu = zone30dungeon_mumu[room_id].mumu
	local bunka = zone30dungeon_mumu[room_id].bunka

	mumu:beginPlot("zone30dungeon_mumu_ai")	-- 
	bunka:beginPlot("zone30dungeon_mumu_bunka_ai")	-- 

	local _timer = 0;

	while zone30dungeon_mumu[room_id].status == "fight" do

	--	local string = "";
		--    DebugMsg(0,0,"----")
		battle_listener:start()

		zone30dungeon_mumu:sleep()
		--    Sleep(20);

		---zone30dungeon_mumu:debug("#players : " .. #battle_listener.players)

	--	string = string.."Players = "..#battle_listener.players..", time = "..battle_listener.duration_time..", deadtime = "..zone30dungeon_mumu.turbo_time;	--- Hao

		if battle_listener.duration_time > zone30dungeon_mumu.turbo_time and not mumu.buff[625217] then	-- �g�ɮɶ��PBuff
			mumu:addBuff(625217)
			ScriptMessage(mumu.guid, -1, 3, "[$MUTE]".."[SC_30_DUPLICATION_1_6]", 0)
		end

		if battle_listener.duration_time > 4 and #battle_listener.players <= 0 and ReadRoleValue( mumu.guid ,  EM_RoleValue_Register + 1 ) == 0 and ReadRoleValue( bunka.guid , EM_RoleValue_AttackTargetID ) == 0 then

		--	string = string..", Step 1"	--- Hao
		--	DebugMsg(0,0,"--fail-fail--fail--")
			_timer = _timer + 1;
		elseif mumu.is_driving and ReadRoleValue( bunka.guid , EM_RoleValue_AttackTargetID ) ~= 0 then

		--	string = string..", Step 2"	--- Hao

		--	DebugMsg(0,0,"+++++")
      			if #battle_listener.players > 0 then
        				mumu:hate(table.random(battle_listener.players, 1)[1]);
      			else
        				--        mumu:hate( that( ReadRoleValue( bunka.guid , EM_RoleValue_AttackTargetID ) ) );
			--	DebugMsg(0,0,"+++++-----")
			--	string = string..", Step 2-1"	--- Hao

				local _playerCount = SetSearchAllPlayer( ReadRoleValue( mumu.guid , EM_RoleValue_RoomID ) );
			--	DebugMsg(0,0,"_playerCount=".._playerCount)
				local _current;
				for i = 0 , _playerCount , 1 do
					_current = GetSearchResult();       
					if ReadRoleValue( _current, EM_RoleValue_IsDead) ~= 1 then
					--	DebugMsg(0,0,"_current.guid=".._current)
            						mumu:hate( that( _current ) );
            						bunka:hate( that( _current ) );
            						SetAttack( bunka.guid , _current );
          					end
        				end
      			end
    		end

		if _timer >= 5 then	-- �� Boss �L�����ؼЫ��� _timer �ɶ���j�M�d�򤺪��Ҧ����a

		--	string = string..", Step 3"	--- Hao

			local _playerCount = SetSearchAllPlayer( ReadRoleValue( mumu.guid , EM_RoleValue_RoomID ) );
			local _current;
			local _bool = false;
			for i = 0 , _playerCount , 1 do
				_current = GetSearchResult();
				if ReadRoleValue( _current, EM_RoleValue_IsDead) ~= 1 and ReadRoleValue( _current, EM_RoleValue_IsAttackMode )  == 1 then	-- ��ӦW�ؼШS�����`�ɡA�N�ؼмg�i Boss �P ���d ������C��
			--	if ReadRoleValue( _current, EM_RoleValue_IsDead) ~= 1 then	-- ��ӦW�ؼШS�����`�ɡA�N�ؼмg�i Boss �P ���d ������C��
					mumu:hate( that( _current ) );
					bunka:hate( that( _current ) );
					SetAttack( bunka.guid , _current );	-- �I�s���d�����ӥؼ�
					_bool = true;
				end
			end
	
			if not _bool then
				zone30dungeon_mumu[room_id].status = "fail";
			end
		end

	--	DebugMsg(0,0,string)	-- Hao

		if not mumu.is_driving and
		zone30dungeon_mumu[room_id].hp_percent_for_drive > 9 and mumu.hp ~= 0 and
		mumu.hp <= mumu.max_hp * zone30dungeon_mumu[room_id].hp_percent_for_drive / 100 then
	
			zone30dungeon_mumu:debug("mumu dirve")
			zone30dungeon_mumu[room_id].hp_percent_for_drive = zone30dungeon_mumu[room_id].hp_percent_for_drive - 10
			zone30dungeon_mumu_get_on()
			mumu.is_driving = true
		end
	
		if mumu.is_driving and bunka.hit_count > 2 then
			zone30dungeon_mumu:debug("Bunka broken")
			zone30dungeon_mumu_get_off()
			mumu.is_driving = false
		end
  	end

  	battle_listener:stop()

  	if bunka.is_legal then
    		bunka:delete()
	end

  	zone30dungeon_mumu[room_id].front_door:delFromPartition()

	if zone30dungeon_mumu[room_id].status == "success" then
		zone30dungeon_mumu:debug("success")
		ScriptMessage(mumu.guid, -1, 3, "[$MUTE]".."[SC_30_DUPLICATION_1_3]", 0)
		zone30dungeon_mumu[room_id].rear_door:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
		SetDefIdleMotion( zone30dungeon_mumu[room_id].rear_door.guid, ruFUSION_MIME_ACTIVATE_BEGIN )
		SetIdleMotion( zone30dungeon_mumu[room_id].rear_door.guid, ruFUSION_MIME_ACTIVATE_LOOP )
	elseif zone30dungeon_mumu[room_id].status == "fail" then
		zone30dungeon_mumu:debug("fail")
		ScriptMessage(mumu.guid, -1, 3, "[$MUTE]".."[SC_30_DUPLICATION_1_2]", 0)
		mumu:delFromPartition()
		zone30dungeon_mumu:sleep(3)
		mumu:addToPartition(room_id)
		zone30dungeon_mumu[room_id].front_door:delete()
  	end
  	zone30dungeon_mumu:debug("Main Loop end")

end

------------------------------------------------------
--  Mumu AI
------------------------------------------------------
function zone30dungeon_mumu_ai()
	zone30dungeon_mumu:debug("Mumu AI start")
	local room_id = this().room_id
	local mumu = zone30dungeon_mumu[room_id].mumu
	local bunka = zone30dungeon_mumu[room_id].bunka
	local battle_listener = zone30dungeon_mumu[room_id].battle_listener

	while zone30dungeon_mumu[room_id].status == "fight" and not mumu.is_driving do
		if mumu.attack_target_GUID ~= 0 then
			mumu:useSkill(zone30dungeon_mumu.skill.webs_of_chain.name)
			mumu:useSkill(zone30dungeon_mumu.skill.arrogant_strike.name)
			mumu:useSkill(zone30dungeon_mumu.skill.armed_heavy_blow.name)
			mumu:useSkill(zone30dungeon_mumu.skill.jump_with_chain.name)
		elseif #battle_listener.players > 0 then
			mumu:hate(table.random(battle_listener.players, 1)[1])	--- �q��ť�����a���A��@�ӥX��
		end
		zone30dungeon_mumu:sleep()
	end
	zone30dungeon_mumu:debug("Mumu AI end")
	DebugMsg( 0, 0, "Mumu end time = "..GetSystime(0)..", driving = "..tostring(mumu.is_driving) );
end

------------------------------------------------------
--  Bunka AI
------------------------------------------------------
function zone30dungeon_mumu_bunka_ai()

	zone30dungeon_mumu:debug("Bunka AI start")
	local room_id = this().room_id
	local mumu = zone30dungeon_mumu[room_id].mumu
	local bunka = zone30dungeon_mumu[room_id].bunka
	local battle_listener = zone30dungeon_mumu[room_id].battle_listener

	while zone30dungeon_mumu[room_id].status == "fight" and not mumu.is_driving do
	--	local string = "bunka begin"		
		if bunka.attack_target_GUID ~= 0 then
			bunka:useSkill(zone30dungeon_mumu.skill.throw_a_missile.name)
			bunka:useSkill(zone30dungeon_mumu.skill.fog_of_war.name)
		--	string = string.." skill"
    		elseif #battle_listener.players > 0 then
			bunka:hate(table.random(battle_listener.players, 1)[1])
		--	string = string.." hatest"
		end
    		zone30dungeon_mumu:sleep()
	--	DebugMsg(0,0,string)
  	end
	zone30dungeon_mumu:debug("Bunka AI end")
	DebugMsg( 0, 0, "Bunka end time = "..GetSystime(0) );
end

------------------------------------------------------
--  Mumu drive Bunka AI
------------------------------------------------------
function zone30dungeon_mumu_driving_ai()
	zone30dungeon_mumu:debug("Mumu drive Bunka AI start")
	DebugMsg( 0, 0, "drive bunka time = "..GetSystime(0) );
	local room_id = this().room_id
	local mumu = zone30dungeon_mumu[room_id].mumu
	local bunka = zone30dungeon_mumu[room_id].bunka
	local battle_listener = zone30dungeon_mumu[room_id].battle_listener

	WriteRoleValue( bunka.guid, EM_RoleValue_PID, 1 );	-- �קK�]����Ĳ�o�Ϩ禡 already running �ɭP�@�����_�����D

  	bunka:property {
  	  	fight = true,
  	  	movable = false
  				}

  	local _playerCount = SetSearchAllPlayer( ReadRoleValue( bunka.guid , EM_RoleValue_RoomID ) );
	local _current;
	for i = 0 , _playerCount , 1 do
		_current = GetSearchResult();
		--    DebugMsg( 0 , 0 , "_current=".._current );
		DebugMsg( 0, 0, "driving time = "..GetSystime(0) );
		SetAttack( bunka.guid , _current );
	end

	zone30dungeon_mumu[room_id].bunka.skill[zone30dungeon_mumu.skill.throw_a_missile.name]:lock()
	zone30dungeon_mumu[room_id].bunka.skill[zone30dungeon_mumu.skill.fog_of_war.name]:lock()
	zone30dungeon_mumu[room_id].bunka.skill[zone30dungeon_mumu.skill.missile_of_quicksand.name]:unlock()
	zone30dungeon_mumu[room_id].bunka.skill[zone30dungeon_mumu.skill.energy_webs.name]:unlock()
	zone30dungeon_mumu[room_id].bunka.skill[zone30dungeon_mumu.skill.energy_cannon.name]:unlock()
	zone30dungeon_mumu[room_id].bunka.skill[zone30dungeon_mumu.skill.super_missile.name]:unlock()
	--  zone30dungeon_mumu[room_id].battle_listener.kick_out_player_delay = 1;

	while zone30dungeon_mumu[room_id].status == "fight" and mumu.is_driving do
		--    DebugMsg(0,0,"-----")
		WriteRoleValue( mumu.guid ,  EM_RoleValue_Register + 1 , 0 );
		if bunka.attack_target_GUID ~= 0 then
			bunka:useSkill(zone30dungeon_mumu.skill.missile_of_quicksand.name)
			bunka:useSkill(zone30dungeon_mumu.skill.energy_webs.name)
			for index, player in pairs(battle_listener.players) do
				if player.buff[625238] then
					bunka:useSkill(zone30dungeon_mumu.skill.energy_cannon.name, player);
          					break
				end
      			end
			bunka:useSkill(zone30dungeon_mumu.skill.super_missile.name);
    		else
      			break;
    		end
    		zone30dungeon_mumu:sleep()
	end
	WriteRoleValue( bunka.guid, EM_RoleValue_PID, 0 );
	zone30dungeon_mumu:debug("Mumu drive Bunka AI end")
end

------------------------------------------------------
--  Missile AI
------------------------------------------------------
function zone30dungeon_mumu_missile_ai()
	zone30dungeon_mumu:debug("Missile AI start")
	DebugMsg( 0, 0, "Missile start time = "..GetSystime(0) );
	local room_id = this().room_id
	local mumu = zone30dungeon_mumu[room_id].mumu
	local bunka = zone30dungeon_mumu[room_id].bunka
	local missile = this()
	local start_time = zone30dungeon_mumu[room_id].battle_listener.current_time
--	local hit_bunka = false

	while zone30dungeon_mumu[room_id].status == "fight" and mumu.is_driving do
		if not missile.attack_target and #zone30dungeon_mumu[room_id].battle_listener.players > 0 then
			missile.attack_target = table.random(zone30dungeon_mumu[room_id].battle_listener.players, 1)[1]
		end

		if missile.attack_target then
			mumu:hate( missile.attack_target );
			missile:move(missile.attack_target.x, missile.attack_target.y + 15, missile.attack_target.z)
		--	zone30dungeon_mumu:debug("tracing target")
		end
		--    DebugMsg(0,0,"-----="..missile:distanceTo(bunka))
    	--	if not hit_bunka and 
		if not g_missileHitBunka and
		zone30dungeon_mumu[missile.room_id].battle_listener.current_time - start_time > 3 and missile:distanceTo(bunka) < 50
       		and bunka.buff[625242] then
      			DebugMsg(0,0,"+++++")
      		--	hit_bunka = true
			g_missileHitBunka = true;	-- �w�R�����d�A���樹�d������@��
      			zone30dungeon_mumu[missile.room_id].bunka.hit_count = zone30dungeon_mumu[missile.room_id].bunka.hit_count + 1
			zone30dungeon_mumu:debug("missile hit boss, zone30dungeon_mumu[" .. missile.room_id .. "].bunka.hit_count : " .. zone30dungeon_mumu[missile.room_id].bunka.hit_count)
			missile:castSpell(851483)
		end
    		zone30dungeon_mumu:sleep()
  	end
	missile:castSpell(851483)
	missile.live_time = 2
	zone30dungeon_mumu:debug("missile ai stop")
end

------------------------------------------------------
--  drama
------------------------------------------------------
function zone30dungeon_mumu_get_on()

	zone30dungeon_mumu:debug("Mumu get on")
  	local room_id = this().room_id
	local mumu = zone30dungeon_mumu[room_id].mumu

	if ReadRoleValue( mumu.guid, EM_RoleValue_Register + 1 ) == 1 then	-- �קK�]����Ĳ�o�Ϩ禡 already running �ɭP�@�����_�����D
		return;
	end

	WriteRoleValue( mumu.guid ,  EM_RoleValue_Register + 1 , 1 );
	mumu.is_driving = true;

	local bunka = zone30dungeon_mumu[room_id].bunka

	ScriptMessage(mumu.guid, -1, 3, "[$MUTE]".."[SC_30_DUPLICATION_1_4]", 0)	-- �u�ݧڶi��ڥi�R�����d�����z�A�̡K�K�����K�K�v

	npc_108432_recover()

	zone30dungeon_mumu[room_id].battle_listener.kick_out_player_delay = 20;

	mumu:addBuff(625231)	-- �L��
	bunka:addBuff(625231)	-- �L��
	bunka.movable = false

	mumu:property {
		search_enemy = false,	-- ��������
		strike_back = false,	-- ��������
		gravity = false,	-- �������O
		movable = true
				} :stopAttack():stopMove():defaultIdleMotion(ruFUSION_MIME_RUN_FORWARD)	-- ��������B����ʡB�w�]�ʧ@���V�e����

--	while mumu:distanceTo(bunka) > 40 do	-- �� Boss �P���d���Z�� > 40 �ɡA�� Boss �����d����
--		mumu:move(bunka.x, bunka.y, bunka.z)
--		zone30dungeon_mumu:debug("Mumu move to Bunka"):sleep()
--	end

--	mumu:move(bunka.x, bunka.y, bunka.z)
--	SetPos( mumu.guid, bunka.x, bunka.y+30, bunka.z, bunka.direction );	-- Boss ���������ܨ��d
--	local bunkaPos = CVector:new( bunka.x, bunka.y, bunka.z );
--	local vecDir = Vector_DirToVector( bunka.direction );	-- �V�q
--	local mumuPos = bunkaPos + vecDir * 25;	-- ������ bunka �e�� 25 ����m
--	SetPos( mumu.guid, mumuPos.x, mumuPos.y, mumuPos.z, bunka.direction );	-- Boss ���������ܨ��d
	SetDefIdleMotion( mumu.guid, ruFUSION_MIME_JUMP_UP );
	local time = math.ceil( move( mumu.guid, bunka.x, bunka.y+10, bunka.z ) );
--	zone30dungeon_mumu:debug("Mumu jump into Bunka")
	DebugMsg( 0, 0, "jump into bunka time = "..GetSystime(0)..", delaytime = "..time );
	mumu:sleep(time/10):property {
--	mumu:defaultIdleMotion(ruFUSION_MIME_JUMP_UP):move(bunka.x, bunka.y + 10, bunka.z):sleep(0.4):property {
    		show = false,
		mark = false,
		hide_hp_mp = true,
		hide_name = true,
		movable = false
			}

	if ReadRoleValue( bunka.guid, EM_RoleValue_PID ) == 0 then
		bunka:addBuff(625242):beginPlot("zone30dungeon_mumu_driving_ai");
	--	bunka:addBuff(625242):sleep(0.4):beginPlot("zone30dungeon_mumu_driving_ai")
		bunka.movable = true
		zone30dungeon_mumu[room_id].battle_listener.kick_out_player_delay = 3;
		--  WriteRoleValue( mumu.guid ,  EM_RoleValue_Register + 1 , 0 );
	end
end

function zone30dungeon_mumu_get_off()

	zone30dungeon_mumu:debug("Mumu get off")
	local room_id = this().room_id
	local mumu = zone30dungeon_mumu[room_id].mumu
	local bunka = zone30dungeon_mumu[room_id].bunka
	ScriptMessage(mumu.guid, -1, 3, "[$MUTE]".."[SC_30_DUPLICATION_1_5]", 0)	-- ���A�ڪ����d�I
	npc_108433_recover()
	bunka:property {
		search_enemy = true,
		strike_back = true,
		movable = true,
		mark = false,
		fight = false
				} :addBuff(625248):stopAttack():stopMove()
    				:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
				:idleMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_LOOP)

	mumu:position {x = bunka.x, y = bunka.y, z = bunka.z, direction = bunka.direction}
	npc_108432_recover()
	mumu:beginPlot("zone30dungeon_mumu_ai")
	zone30dungeon_mumu:sleep(5)

	bunka:property {
		search_enemy = true,
		strike_back = true,
		movable = true,
		mark = false,
		fight = false
				} :cancelBuff(625248)
				:playMotion(ruFUSION_ACTORSTATE_KNOCKDOWN_END)

	--  mumu:beginPlot("zone30dungeon_mumu_bunka_ai")
	bunka:beginPlot("zone30dungeon_mumu_bunka_ai")
end

function Lua_Z30_Boss_1_Check()

	local Target = TargetID();
	local IgnoreObjs = {
				108511, 108512, 108513, 108510, 108531,	-- �@�άI�k����y�F�B��q���B�a�Ծɼu�Bz30�ƥ��M�Ϊ��B�ƥ���
				108432, 108433,	-- �x�� �Q���i�i�B�Z�˨��d
				108634, 108635,	-- ���q
				108644, 108645	-- ²��
							}

	for i = 1, #IgnoreObjs do
		if ReadRoleValue( Target, EM_RoleValue_OrgID ) == IgnoreObjs[i] then
			return false;
		end
	end
end

------------------------------------------------------
--  GM
------------------------------------------------------
function gm_zone30dungeon_mumu(command)

	if command == "mumuhp-10%" then
		this():systemCastSpell(zone30dungeon_mumu[this().room_id].mumu, 851485)
		zone30dungeon_mumu:debug("[GM] mumu's hp -10%")
	elseif command == "getout" then
		zone30dungeon_mumu[this().room_id].bunka.hit_count = 3
	end
end
