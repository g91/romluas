-----------------------------------------------------------------
--	康葛斯獻祭
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama4()
	Global_BellatiaDuplication:debug("active> fourth boss drama4 -> function Lua_BellatiaDuplication_FourthBoss_drama4()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	Lua_BellatiaDuplication_change_music(room_id, Global_BellatiaDuplication.music.boss4_kangersy_sacrifice)

	local scripts = {
	--	審判者系統『維琪』：不滅者，主人早就知道你會用不死之身來攪亂，那你就親眼看著你的同伴被你燒死吧！
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_25]", time = 0, is_done = false},
	--	康葛斯：嗯？這麼多的火元素聚集在體內的感覺還滿怪的
		{speaker = Global_BellatiaDuplication[room_id].kangersy , content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_26]", time = 3, is_done = false},
	--	吉兒‧指揮官！快下命令啊！別顧著玩火！
		{speaker = Global_BellatiaDuplication[room_id].jill, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_27]", time = 6, is_done = false},
	--	康葛斯：維持我的生命！我的身體可以阻止火元素溢出！別讓我「死」！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_28]", time = 9, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while not scripts[#scripts].is_done and Lua_BellatiaDuplication_check_status(room_id, "boss") do
		current_time = GetSystime(0)

		-----------------------------------------------------------------
		--	劇情對話
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
					if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]"..script.content, 3) end
					else script.speaker:say(script.content, 5) end
					if index == 1 then
		--				康葛斯獻祭
						Global_BellatiaDuplication[room_id].kangersy.hp = Global_BellatiaDuplication[room_id].kangersy.max_hp
						Global_BellatiaDuplication[room_id].kangersy.is_imperishable = false
						Global_BellatiaDuplication[room_id].kangersy.search_enemy = false
						Global_BellatiaDuplication[room_id].kangersy.strike_back = false
						Global_BellatiaDuplication[room_id].kangersy.fight = false
						Global_BellatiaDuplication[room_id].kangersy:stopAttack()
--						Global_BellatiaDuplication[room_id].kangersy:setIdleMotion(ruFUSION_ACTORSTATE_DEAD_WATER)
						SetDefIdleMotion(Global_BellatiaDuplication[room_id].kangersy.GUID, ruFUSION_MIME_DEAD_WATER)
		--				施展生命獻祭，詠唱一小時
						Global_BellatiaDuplication[room_id].kangersy:castSpell(Global_BellatiaDuplication[room_id].kangersy, 850921)
		--				生命獻祭DEBUFF
						Global_BellatiaDuplication[room_id].kangersy:addBuff(624415)
		--				表演不回血
						Global_BellatiaDuplication[room_id].kangersy:addBuff(624471)
					end
				end
			end
		-----------------------------------------------------------------
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fourth boss drama4 end")
end

-----------------------------------------------------------------
--	光龍犧牲
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama5()
	Global_BellatiaDuplication:debug("active> fourth boss drama5 -> function Lua_BellatiaDuplication_FourthBoss_drama5()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	Global_BellatiaDuplication[room_id].morrok.fight = false
	Global_BellatiaDuplication[room_id].morrok.search_enemy = false
	Global_BellatiaDuplication[room_id].morrok.strike_back = false
	Global_BellatiaDuplication[room_id].morrok:stopAttack()
	Global_BellatiaDuplication[room_id].jill.fight = false
	Global_BellatiaDuplication[room_id].jill.search_enemy = false
	Global_BellatiaDuplication[room_id].jill.strike_back = false
	Global_BellatiaDuplication[room_id].jill:stopAttack()
	Global_BellatiaDuplication[room_id].feitlautrec.fight = false
	Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = false
	Global_BellatiaDuplication[room_id].feitlautrec.strike_back = false
	Global_BellatiaDuplication[room_id].feitlautrec:stopAttack()
	Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication_FourthBoss.beginning_position_flag[3].x, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[3].y, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[3].z, 0)
	Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication_FourthBoss.beginning_position_flag[5].x, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[5].y, Global_BellatiaDuplication_FourthBoss.beginning_position_flag[5].z, 0)
	Global_BellatiaDuplication[room_id].feitlautrec:move(Global_BellatiaDuplication.boss_initial_position_flag[4].x, Global_BellatiaDuplication.boss_initial_position_flag[4].y, Global_BellatiaDuplication.boss_initial_position_flag[4].z)

	Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
	Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].feitlautrec)
	Global_BellatiaDuplication[room_id].feitlautrec:faceTo(Global_BellatiaDuplication[room_id].pangkorrams_dragon)

	local scripts = {
	--	賽琳伊菲斯：等等！你這個狡滑的老頭！竟然想利用我的力量和它同歸於盡！！(邦克雷姆斯代理。什麼!? 邦克雷姆斯也是幽龍，難道這一切都是陰謀!?)
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_29]", time = 3, is_done = false},
	--	賽琳伊菲斯：不！！！我不想死！我不想死！！！
		{speaker = "scriptMessage" , content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_30]", time = 6, is_done = false},
	--	邦喀雷姆斯：我完成了自己的使命，接下來就輪到你們了！(邦克雷姆斯你別再鬧了!)
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_31]", time = 9, is_done = false},
	--	康葛斯：喚醒時刻！這兩個傢伙竟然要變成神使了！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_32]", time = 15, is_done = false},
	--	康葛斯：反正他們現在是無法被摧毀的！拿他們來當擋箭牌吧！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_33]", time = 18, is_done = false},
	--	遠方傳來鐵薔薇伊崔妮的吶喊聲，後方突擊隊的情勢似乎告急
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_34]", time = 21, is_done = false},
	--	卡薩姆：它的火元素之力已經大大減弱了！我先去支援伊崔妮他們！
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_35]", time = 23, is_done = false},
	--	審判者系統『維琪』：真龍有這種能力可以抵消元素之力，資料上沒有這項記載......
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_36]", time = 29, is_done = false},
	--	審判者系統『維琪』：就算901型的元素之力衰弱，你的盟友也都顧不上這裡，你有機會獲勝嗎？
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_37]", time = 32, is_done = false},
	--	康葛斯：嘿！我還在這裡！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_38]", time = 35, is_done = false},
	--	康葛斯：你少囂張！我現在體內的火元素之力說不定比你還多！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_39]", time = 40, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time
	local drama_trigger = true

	while Lua_BellatiaDuplication_check_status(room_id, "drama") do
		current_time = GetSystime(0)

		-----------------------------------------------------------------
		--	劇情對話
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
					if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]"..script.content, 3) end
					else script.speaker:say(script.content, 5) end
					if index == 3 then
		--				光龍死
						for index, node in pairs(Global_BellatiaDuplication[room_id].protective_cover.node) do node:delete() end
						Global_BellatiaDuplication[room_id].protective_cover:delete()
						Global_BellatiaDuplication[room_id].protective_cover = nil
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(624433)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(509923)
						Global_BellatiaDuplication[room_id].cassam:cancelBuff(624433)
						Global_BellatiaDuplication[room_id].cassam.sword:delete()
						Global_BellatiaDuplication[room_id].cassam.sword = nil
						SetRoleEquip(Global_BellatiaDuplication[room_id].cassam.GUID, EM_EQWearPos_MainHand, 213696, 1)
						Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_CAST_END)
						Global_BellatiaDuplication:Sleep(1)
						Global_BellatiaDuplication[room_id].cassam:setIdleMotion(ruFUSION_ACTORSTATE_NORMAL)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:playMotion(ruFUSION_ACTORSTATE_SLEEP_END)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(624413)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:systemCastSpell(Global_BellatiaDuplication[room_id].pangkorrams_dragon, 850810)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:addBuff(624661)
						Global_BellatiaDuplication:sleep(4)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:playMotion(ruFUSION_ACTORSTATE_FLY_BEGIN)
						Global_BellatiaDuplication:sleep(0.5)
						SetDefIdleMotion(Global_BellatiaDuplication[room_id].pangkorrams_dragon.GUID, ruFUSION_MIME_FLY_LOOP)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon.gravity = false
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:move(Global_BellatiaDuplication[room_id].pangkorrams_dragon.x, Global_BellatiaDuplication[room_id].pangkorrams_dragon.y + 120, Global_BellatiaDuplication[room_id].pangkorrams_dragon.z)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:castSpell(Global_BellatiaDuplication[room_id].feitlautrec, 851097)
						Global_BellatiaDuplication:sleep(3)
						Global_BellatiaDuplication[room_id].feitlautrec:systemCastSpell(Global_BellatiaDuplication[room_id].feitlautrec, 851099)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:playMotion(ruFUSION_ACTORSTATE_DYING)
						SetDefIdleMotion(Global_BellatiaDuplication[room_id].pangkorrams_dragon.GUID, ruFUSION_MIME_IDLE_DEAD)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:cancelBuff(624661)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon.gravity = true
						Global_BellatiaDuplication:sleep(1)
						Global_BellatiaDuplication[room_id].pangkorrams_dragon:systemCastSpell(Global_BellatiaDuplication[room_id].pangkorrams_dragon, 851098)
		--				法伊羅特變弱
						local feitlautrec_x = Global_BellatiaDuplication[room_id].feitlautrec.x
						local feitlautrec_y = Global_BellatiaDuplication[room_id].feitlautrec.y
						local feitlautrec_z = Global_BellatiaDuplication[room_id].feitlautrec.z
						local feitlautrec_direction = Global_BellatiaDuplication[room_id].feitlautrec.direction
						Global_BellatiaDuplication[room_id].feitlautrec:delete()
						Global_BellatiaDuplication[room_id].feitlautrec = AddyBoss:new()
						Global_BellatiaDuplication[room_id].feitlautrec:create(Global_BellatiaDuplication_FourthBoss.feitlautrec_weak_orgid, feitlautrec_x, feitlautrec_y, feitlautrec_z, feitlautrec_direction)
						Global_BellatiaDuplication[room_id].feitlautrec.fight = false
						Global_BellatiaDuplication[room_id].feitlautrec.strike_back = false
						Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = false
						Global_BellatiaDuplication[room_id].feitlautrec.movable = false
						Global_BellatiaDuplication[room_id].feitlautrec.max_hp = Global_BellatiaDuplication[room_id].feitlautrec.hp
						LockHP(Global_BellatiaDuplication[room_id].feitlautrec.GUID, Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.06, "BellatiaDuplication_deadplot")
						Global_BellatiaDuplication[room_id].feitlautrec:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].feitlautrec:addSkill("prairie_fire", Global_BellatiaDuplication_FourthBoss.skill_prairie_fire)
						Global_BellatiaDuplication[room_id].feitlautrec:addSkill("fuel_grenade", Global_BellatiaDuplication_FourthBoss.skill_fuel_grenade)
						Global_BellatiaDuplication[room_id].feitlautrec:addSkill("fire_marking", Global_BellatiaDuplication_FourthBoss.skill_fire_marking)
						Global_BellatiaDuplication[room_id].feitlautrec:addSkill("summon_servants", Global_BellatiaDuplication_FourthBoss.skill_summon_servants)
		--				表演中不回血
						Global_BellatiaDuplication[room_id].feitlautrec:addBuff(624471)
						Global_BellatiaDuplication[room_id].feitlautrec.hp = Global_BellatiaDuplication[room_id].feitlautrec.max_hp * 0.6
						Global_BellatiaDuplication[room_id].feitlautrec:faceTo(Global_BellatiaDuplication[room_id].pangkorrams)
					end
					if index == 4 then
		--				摩瑞克吉兒變神使
						Sleep(18)
						Global_BellatiaDuplication[room_id].morrok:castSpell(Global_BellatiaDuplication[room_id].morrok, 850965)
						Global_BellatiaDuplication[room_id].morrok:addBuff(624428)
						Global_BellatiaDuplication[room_id].jill:castSpell(Global_BellatiaDuplication[room_id].jill, 850965)
						Global_BellatiaDuplication[room_id].jill:addBuff(624428)
					end
					if index == 7 then
		--				卡薩姆救鐵薔薇
						Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_BUFF_END)
						Sleep(2)
						Global_BellatiaDuplication[room_id].cassam:playMotion(ruFUSION_ACTORSTATE_NORMAL)
						Global_BellatiaDuplication[room_id].cassam.movable = true
						Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].ironrose)
						Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].x, Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].y, Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].z)
						Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication[room_id].ironrose.x, Global_BellatiaDuplication[room_id].ironrose.y, Global_BellatiaDuplication[room_id].ironrose.z, 0)
					end
				end
			end
		-----------------------------------------------------------------

		-----------------------------------------------------------------
			if scripts[8].is_done then
				Global_BellatiaDuplication[room_id].fight_step = 2
				Global_BellatiaDuplication[room_id].fight_step_trigger = true
				Lua_BellatiaDuplication_change_status(room_id, "boss")

				Global_BellatiaDuplication[room_id].morrok.fight = true
				Global_BellatiaDuplication[room_id].jill.fight = true
				Global_BellatiaDuplication[room_id].feitlautrec.fight = true
				Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = true
				Global_BellatiaDuplication[room_id].feitlautrec.strike_back = true
			end
		-----------------------------------------------------------------
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication[room_id].cassam:delFromPartition()

	Global_BellatiaDuplication:debug("info> fourth boss drama5 end")
end

-----------------------------------------------------------------
--	四王攻略中，法伊羅特與維琪搶奪身體
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama6()
	Global_BellatiaDuplication:debug("active> fourth boss drama6 -> function Lua_BellatiaDuplication_FourthBoss_drama6()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	local scripts = {
	--	審判者系統『維琪』：法伊羅特，停止你的行動！別在我的身上摸來摸去，感覺很不舒服！
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_40]", time = 3, is_done = false},
	--	法伊羅特：這是『我的』身體，妳這個外來者！
		{speaker = "scriptMessage" , content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_41]", time = 6, is_done = false},
	--	審判者系統『維琪』：法伊羅特，主人的話是絕對的，為什麼你不懂？
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_42]", time = 20, is_done = false},
	--	法伊羅特：因為妳的主人是個卑鄙的傢伙！
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_43]", time = 23, is_done = false},
	--	審判者系統『維琪』：你怎麼破壞封印陣的！是剛才邦喀雷姆斯搞的鬼？
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_44]", time = 37, is_done = false},
	--	法伊羅特：因為我是法伊羅特！你這個蠢貨！
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_45]", time = 40, is_done = false},
	--	法伊羅特：小東西們加把勁！只要我奪回控制權，一定幫你們痛宰曼索瑞恩！
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_46]", time = 52, is_done = false},
	--	法伊羅特：你害我的力量消失大半，就拿你一半的手下來換吧！
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_47]", time = 55, is_done = false},
	--	維琪一反常態，突然沉默不語
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_48]", time = 58, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while not scripts[#scripts].is_done and Lua_BellatiaDuplication_check_status(room_id, "boss") and Global_BellatiaDuplication[room_id].step == 6 do
		current_time = GetSystime(0)

		-----------------------------------------------------------------
		--	劇情對話
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
					if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]"..script.content, 3) end
					else script.speaker:say(script.content, 5) end
				end
			end
		-----------------------------------------------------------------
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fourth boss drama6 end")
end

-----------------------------------------------------------------
--	四王最終劇情，法伊羅特協助玩家
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama7()
	Global_BellatiaDuplication:debug("active> fourth boss drama7 -> function Lua_BellatiaDuplication_FourthBoss_drama7()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	-----------------------------------------------------------------
	--	清除小怪
	-----------------------------------------------------------------
	for index, flame in pairs(Global_BellatiaDuplication[room_id].feitlautrec_flames) do flame:delete() end

	Global_BellatiaDuplication[room_id].morrok.movable = true
	Global_BellatiaDuplication[room_id].morrok.fight = false
	Global_BellatiaDuplication[room_id].morrok.search_enemy = false
	Global_BellatiaDuplication[room_id].morrok.strike_back = false
	Global_BellatiaDuplication[room_id].morrok:stopAttack()

	Global_BellatiaDuplication[room_id].jill.movable = true
	Global_BellatiaDuplication[room_id].jill.fight = false
	Global_BellatiaDuplication[room_id].jill.search_enemy = false
	Global_BellatiaDuplication[room_id].jill.strike_back = false
	Global_BellatiaDuplication[room_id].jill:stopAttack()

	Global_BellatiaDuplication[room_id].feitlautrec.movable = true
	Global_BellatiaDuplication[room_id].feitlautrec.fight = false
	Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = false
	Global_BellatiaDuplication[room_id].feitlautrec.strike_back = false
	Global_BellatiaDuplication[room_id].feitlautrec:stopAttack()
	Global_BellatiaDuplication[room_id].feitlautrec.camp_id = 5
	Global_BellatiaDuplication[room_id].feitlautrec.hp = Global_BellatiaDuplication[room_id].feitlautrec.max_hp

	Global_BellatiaDuplication[room_id].kangersy.movable = true
	Global_BellatiaDuplication[room_id].kangersy.fight = false
	Global_BellatiaDuplication[room_id].kangersy.search_enemy = false
	Global_BellatiaDuplication[room_id].kangersy.strike_back = false

	Global_BellatiaDuplication[room_id].cassam.movable = true
	Global_BellatiaDuplication[room_id].cassam.fight = false
	Global_BellatiaDuplication[room_id].cassam.search_enemy = false
	Global_BellatiaDuplication[room_id].cassam.strike_back = false
	Global_BellatiaDuplication[room_id].cassam:stopAttack()

	Global_BellatiaDuplication[room_id].ironrose.movable = true
	Global_BellatiaDuplication[room_id].ironrose.fight = false
	Global_BellatiaDuplication[room_id].ironrose.search_enemy = false
	Global_BellatiaDuplication[room_id].ironrose.strike_back = false
	Global_BellatiaDuplication[room_id].ironrose:stopAttack()

	local scripts = {
	--	維琪的聲音再次響起，但是參雜著許多不同的聲音，你覺得她在「痛苦」的尖叫！
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_49]", time = 1, is_done = false},
	--	法伊羅特：呼！總算自由了！
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_50]", time = 6, is_done = false},
	--	維琪的聲音再次響起，但是參雜著許多不同的聲音，你覺得她在「痛苦」的尖叫！
		{speaker = "scriptMessage", content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_51]", time = 10, is_done = false},
	--	摩瑞克：剛才我看到的......吉兒，難道我們變成神使了？
		{speaker = Global_BellatiaDuplication[room_id].morrok, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_52]", time = 14, is_done = false},
	--	吉兒：我也看到了同樣的景象，但......為什麼是我？
		{speaker = Global_BellatiaDuplication[room_id].jill, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_53]", time = 17, is_done = false},
	--	法伊羅特：你們現在安心未免也太早了吧！曼索瑞恩這混蛋還活著！
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_54]", time = 20, is_done = false},
	--	法伊羅特：帶著這小傢伙一起去，他可以充當我的耳目協助你們
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_55]", time = 26, is_done = false},
	--	卡拉維‧卡薩姆：那我們繼續前進吧！一定要讓曼索瑞恩受到應有的制裁！
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_56]", time = 29, is_done = false},
	--	法伊羅特：等等！你別去！曼索瑞恩是混蛋沒錯，但他的實力不是鬧著玩的，你去也只是增加負擔罷了！
		{speaker = Global_BellatiaDuplication[room_id].feitlautrec, content = "[SC_BELLATIADUPLICATION_FOURTH_BOSS_57]", time = 32, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") do
		current_time = GetSystime(0)

		-----------------------------------------------------------------
		--	劇情對話
			for index, script in pairs(scripts) do
				if current_time - start_time >= script.time and not script.is_done then
					script.is_done = true
					if script.speaker == "scriptMessage" then for index, player in pairs(Global_BellatiaDuplication[room_id].players) do Global_BellatiaDuplication[room_id].pangkorrams:scriptMessage(player, "[$MUTE]"..script.content, 3) end
					else script.speaker:say(script.content, 5) end
					if index == 1 then
						Global_BellatiaDuplication[room_id].feitlautrec:move(Global_BellatiaDuplication.boss_initial_position_flag[4].x, Global_BellatiaDuplication.boss_initial_position_flag[4].y, Global_BellatiaDuplication.boss_initial_position_flag[4].z, 0)
					end
					if index == 2 then
						Global_BellatiaDuplication[room_id].feitlautrec:faceTo(Global_BellatiaDuplication[room_id].kangersy)
						Global_BellatiaDuplication[room_id].feitlautrec:playMotion(ruFUSION_ACTORSTATE_BUFF_SP01)

		--				康葛斯解除獻祭
						Global_BellatiaDuplication[room_id].kangersy.is_imperishable = true
						Global_BellatiaDuplication[room_id].kangersy:stopAttack()
						Global_BellatiaDuplication[room_id].kangersy:setIdleMotion(ruFUSION_ACTORSTATE_NORMAL)
						SetDefIdleMotion(Global_BellatiaDuplication[room_id].kangersy.GUID, ruFUSION_MIME_IDLE_STAND)
						Global_BellatiaDuplication[room_id].kangersy:interruptMagic()
						Global_BellatiaDuplication[room_id].kangersy:cancelBuff(624415)
						Global_BellatiaDuplication[room_id].kangersy:cancelBuff(624471)
					end
					if index == 3 then
						Global_BellatiaDuplication[room_id].feitlautrec:playMotion(ruFUSION_ACTORSTATE_CAST_SP01)
						Sleep(10)
						local feitlautrec_x = Global_BellatiaDuplication[room_id].feitlautrec.x
						local feitlautrec_y = Global_BellatiaDuplication[room_id].feitlautrec.y
						local feitlautrec_z = Global_BellatiaDuplication[room_id].feitlautrec.z
						local feitlautrec_direction = Global_BellatiaDuplication[room_id].feitlautrec.direction
						Global_BellatiaDuplication[room_id].feitlautrec:delete()
						Global_BellatiaDuplication[room_id].feitlautrec:create(Global_BellatiaDuplication.feitlautrec_ally_orgid, feitlautrec_x, feitlautrec_y, feitlautrec_z, feitlautrec_direction)
						Global_BellatiaDuplication[room_id].feitlautrec:playMotion(ruFUSION_ACTORSTATE_CAST_SP01)
						Global_BellatiaDuplication[room_id].feitlautrec.patrol = false
						Global_BellatiaDuplication[room_id].feitlautrec.is_walk = 0
						LockHP(Global_BellatiaDuplication[room_id].feitlautrec.GUID, 1, "BellatiaDuplication_deadplot")
						Global_BellatiaDuplication[room_id].feitlautrec:addToPartition(room_id)
		--				拿稱號
						for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
							if CountBodyItem(player.GUID, 530969) == 0 then GiveBodyItem(player.GUID, 530969, 1) end
						end
					end
					if index == 4 then
		--				摩瑞克解除變身
						Global_BellatiaDuplication[room_id].morrok:interruptMagic()
						Global_BellatiaDuplication[room_id].morrok:cancelBuff(624428)
						local morrok_x = Global_BellatiaDuplication[room_id].morrok.x
						local morrok_y = Global_BellatiaDuplication[room_id].morrok.y
						local morrok_z = Global_BellatiaDuplication[room_id].morrok.z
						local morrok_direction = Global_BellatiaDuplication[room_id].morrok.direction
						Global_BellatiaDuplication[room_id].morrok:delete()
						Global_BellatiaDuplication[room_id].morrok:create(Global_BellatiaDuplication.morrok_god_orgid, morrok_x, morrok_y, morrok_z, morrok_direction)
						Global_BellatiaDuplication[room_id].morrok.patrol = false
						Global_BellatiaDuplication[room_id].morrok.is_walk = 0
						Global_BellatiaDuplication[room_id].morrok.fight = false
						Global_BellatiaDuplication[room_id].morrok.strike_back = false
						Global_BellatiaDuplication[room_id].morrok.search_enemy = false
						Global_BellatiaDuplication[room_id].morrok:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].jill)
					end
					if index == 5 then
		--				吉兒解除變身
						Global_BellatiaDuplication[room_id].jill:interruptMagic()
						Global_BellatiaDuplication[room_id].jill:cancelBuff(624428)
						local jill_x = Global_BellatiaDuplication[room_id].jill.x
						local jill_y = Global_BellatiaDuplication[room_id].jill.y
						local jill_z = Global_BellatiaDuplication[room_id].jill.z
						local jill_direction = Global_BellatiaDuplication[room_id].jill.direction
						Global_BellatiaDuplication[room_id].jill:delete()
						Global_BellatiaDuplication[room_id].jill:create(Global_BellatiaDuplication.jill_god_orgid, jill_x, jill_y, jill_z, jill_direction)
						Global_BellatiaDuplication[room_id].jill.patrol = false
						Global_BellatiaDuplication[room_id].jill.is_walk = 0
						Global_BellatiaDuplication[room_id].jill.fight = false
						Global_BellatiaDuplication[room_id].jill.strike_back = false
						Global_BellatiaDuplication[room_id].jill.search_enemy = false
						Global_BellatiaDuplication[room_id].jill:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].morrok)

						Global_BellatiaDuplication[room_id].cassam:setPosition(Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].x - 40 + RandRange(1, 80), Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].y, Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].z - 40 + RandRange(1, 80))
						Global_BellatiaDuplication[room_id].cassam:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].ironrose:setPosition(Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].x - 40 + RandRange(1, 80), Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].y, Global_BellatiaDuplication_FourthBoss.goto_route_flag[4].z - 40 + RandRange(1, 80))
						Global_BellatiaDuplication[room_id].ironrose:addToPartition(room_id)
					end
					if index == 6 then
						Global_BellatiaDuplication[room_id].feitlautrec:playMotion(ruFUSION_ACTORSTATE_ATTACK_UNARMED)
						Global_BellatiaDuplication[room_id].feitlautrec:move(Global_BellatiaDuplication.boss_initial_position_flag[4].x, Global_BellatiaDuplication.boss_initial_position_flag[4].y, Global_BellatiaDuplication.boss_initial_position_flag[4].z, 0)
						Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication[room_id].door_after_boss4.x - 60 + RandRange(1, 120), Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 160 + RandRange(1, 40), 0)
						Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication[room_id].door_after_boss4.x - 60 + RandRange(1, 120), Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 160 + RandRange(1, 40), 0)
						Global_BellatiaDuplication[room_id].kangersy:move(Global_BellatiaDuplication[room_id].door_after_boss4.x - 60 + RandRange(1, 120), Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 160 + RandRange(1, 40), 0)
						Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication[room_id].door_after_boss4.x - 60 + RandRange(1, 120), Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 160 + RandRange(1, 40), 0)
						Global_BellatiaDuplication[room_id].ironrose:move(Global_BellatiaDuplication.npc_initial_position_flag[96].x, Global_BellatiaDuplication.npc_initial_position_flag[96].y, Global_BellatiaDuplication.npc_initial_position_flag[96].z)

		--				伊崔妮......你留下吧
						Global_BellatiaDuplication[room_id].cassam:say("[SC_BELLATIADUPLICATION_FOURTH_BOSS_58]", 3)
						Sleep(20)
		--				人王......我知道了，請你務必要保重。
						Global_BellatiaDuplication[room_id].ironrose:say("[SC_BELLATIADUPLICATION_FOURTH_BOSS_59]", 3)
					end
					if index == 7 then
						Global_BellatiaDuplication[room_id].pangkorrams:beginPlot("Lua_BellatiaDuplication_FourthBoss_drama8")
		--				法伊羅特分身 
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi = AddyAlly:new()
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:create(Global_BellatiaDuplication_FourthBoss.feitlautrec_sungchili_orgid, Global_BellatiaDuplication[room_id].feitlautrec.x, Global_BellatiaDuplication[room_id].feitlautrec.y, Global_BellatiaDuplication[room_id].feitlautrec.z, Global_BellatiaDuplication[room_id].feitlautrec.direction)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.camp_id = 5
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.patrol = false
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.strike_back = false
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.search_enemy = false
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.fight = false
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.is_walk = 0
						LockHP(Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.GUID, 1, "BellatiaDuplication_deadplot")
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:addToPartition(room_id)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:move(Global_BellatiaDuplication[room_id].kangersy.x + 40, Global_BellatiaDuplication[room_id].kangersy.y, Global_BellatiaDuplication[room_id].kangersy.z + 60)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:faceTo(Global_BellatiaDuplication[room_id].morrok)
					end
					if index == 8 then
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:move(Global_BellatiaDuplication[room_id].door_after_boss4.x, Global_BellatiaDuplication[room_id].door_after_boss4.y, Global_BellatiaDuplication[room_id].door_after_boss4.z - 40)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:faceTo(Global_BellatiaDuplication[room_id].door_after_boss4)
						Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:playMotion(ruFUSION_ACTORSTATE_ATTACK_1H)
						Sleep(8)
						Global_BellatiaDuplication[room_id].door_after_boss4:playMotion(ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
						Global_BellatiaDuplication[room_id].door_after_boss4:setIdleMotion(ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
					end
				end
			end
		-----------------------------------------------------------------

		if scripts[#scripts].is_done then
			Global_BellatiaDuplication[room_id].morrok:move(Global_BellatiaDuplication.npc_initial_position_flag[92].x, Global_BellatiaDuplication.npc_initial_position_flag[92].y, Global_BellatiaDuplication.npc_initial_position_flag[92].z, 0)
			Global_BellatiaDuplication[room_id].jill:move(Global_BellatiaDuplication.npc_initial_position_flag[93].x, Global_BellatiaDuplication.npc_initial_position_flag[93].y, Global_BellatiaDuplication.npc_initial_position_flag[93].z, 0)
			Global_BellatiaDuplication[room_id].kangersy:move(Global_BellatiaDuplication.npc_initial_position_flag[94].x, Global_BellatiaDuplication.npc_initial_position_flag[94].y, Global_BellatiaDuplication.npc_initial_position_flag[94].z, 0)
			Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi:move(Global_BellatiaDuplication.npc_initial_position_flag[98].x, Global_BellatiaDuplication.npc_initial_position_flag[98].y, Global_BellatiaDuplication.npc_initial_position_flag[98].z, 0)
			Global_BellatiaDuplication[room_id].cassam:move(Global_BellatiaDuplication.npc_initial_position_flag[95].x, Global_BellatiaDuplication.npc_initial_position_flag[95].y, Global_BellatiaDuplication.npc_initial_position_flag[95].z)
			Sleep(20)
			Global_BellatiaDuplication[room_id].morrok:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].jill:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].kangersy:faceTo(Global_BellatiaDuplication[room_id].cassam)
			Global_BellatiaDuplication[room_id].cassam:faceTo(Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi)

			Global_BellatiaDuplication[room_id].morrok.fight = true
			Global_BellatiaDuplication[room_id].morrok.strike_back = true
			Global_BellatiaDuplication[room_id].morrok.search_enemy = true
			Global_BellatiaDuplication[room_id].jill.fight = true
			Global_BellatiaDuplication[room_id].jill.strike_back = true
			Global_BellatiaDuplication[room_id].jill.search_enemy = true
			Global_BellatiaDuplication[room_id].kangersy.fight = true
			Global_BellatiaDuplication[room_id].kangersy.strike_back = true
			Global_BellatiaDuplication[room_id].kangersy.search_enemy = true
			Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.fight = true
			Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.strike_back = true
			Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.search_enemy = true
			Global_BellatiaDuplication[room_id].cassam.fight = true
			Global_BellatiaDuplication[room_id].cassam.strike_back = true
			Global_BellatiaDuplication[room_id].cassam.search_enemy = true
			local _treasure = AddyNpc:new()
			_treasure:create(Global_BellatiaDuplication_FourthBoss.treasure_orgid, Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.x, Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.y, Global_BellatiaDuplication[room_id].feitlautrec_SungChiLi.z + 100)
			_treasure.movable = false
			_treasure.strike_back = false
			_treasure.search_enemy = false
			_treasure.fight = false
			_treasure:addToPartition(room_id)
			_treasure:addBuff(624589)
--			Global_BellatiaDuplication[room_id].pangkorrams.hide = true
			Global_BellatiaDuplication[room_id].pangkorrams.show = false
			Global_BellatiaDuplication[room_id].pangkorrams.mark = false
			Global_BellatiaDuplication[room_id].pangkorrams.hide_hp_mp = true
			Global_BellatiaDuplication[room_id].pangkorrams.show_role_head = true
			Global_BellatiaDuplication[room_id].pangkorrams:setPosition(Global_BellatiaDuplication.save_point_flag[9].x, Global_BellatiaDuplication.save_point_flag[9].y, Global_BellatiaDuplication.save_point_flag[9].z)
			Lua_BellatiaDuplication_update_save_point(room_id)
			Lua_BellatiaDuplication_change_status(room_id, "success")
		end
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	Global_BellatiaDuplication:debug("info> fourth boss drama7 end")
	Global_BellatiaDuplication[room_id].step_trigger = true
	Global_BellatiaDuplication[room_id].fight_step_trigger = true
end

-----------------------------------------------------------------
--	法伊羅特抵擋大批湧入的制裁者
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FourthBoss_drama8()
	Global_BellatiaDuplication:debug("active> fourth boss drama8 -> function Lua_BellatiaDuplication_FourthBoss_drama8()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FourthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FourthBoss_drama_setting() end

	if not Global_BellatiaDuplication[room_id].enemies then Global_BellatiaDuplication[room_id].enemies = {} end
	if not Global_BellatiaDuplication[room_id].allies then Global_BellatiaDuplication[room_id].allies = {} end

	Global_BellatiaDuplication[room_id].feitlautrec:addTopartition(room_id)
	Global_BellatiaDuplication[room_id].ironrose:addTopartition(room_id)

	Global_BellatiaDuplication[room_id].ironrose.movable = true
	Global_BellatiaDuplication[room_id].ironrose.fight = true
	Global_BellatiaDuplication[room_id].ironrose.search_enemy = true
	Global_BellatiaDuplication[room_id].ironrose.strike_back = true
	Global_BellatiaDuplication[room_id].feitlautrec.camp_id = 5
	Global_BellatiaDuplication[room_id].feitlautrec.movable = true
	Global_BellatiaDuplication[room_id].feitlautrec.fight = true
	Global_BellatiaDuplication[room_id].feitlautrec.search_enemy = true
	Global_BellatiaDuplication[room_id].feitlautrec.strike_back = true

	while not Lua_BellatiaDuplication_check_status(room_id, "boss") do
		if #Global_BellatiaDuplication[room_id].enemies < Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount then
			for index = 1, Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount - #Global_BellatiaDuplication[room_id].enemies do
				local _enemy = AddyMonster:new()
				local _birth_flag_index = RandRange(13, 19)
				_enemy:create(Global_BellatiaDuplication_FourthBossDrama.enemy_type[RandRange(1, #Global_BellatiaDuplication_FourthBossDrama.enemy_type)], Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].x, Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].y, Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].z)
				_enemy.patrol = false
				_enemy.is_walk = 0
				_enemy:addToPartition(room_id)
				table.insert(Global_BellatiaDuplication[room_id].enemies, _enemy)
			end
		end

		if #Global_BellatiaDuplication[room_id].allies < Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount then
			for index = 1, Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount - #Global_BellatiaDuplication[room_id].allies do
				local _ally = AddyAlly:new()
				local _birth_flag_index = RandRange(13, 19)
				_ally:create(Global_BellatiaDuplication.ally_type[RandRange(1, #Global_BellatiaDuplication.ally_type)], Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].x, Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].y, Global_BellatiaDuplication_FourthBossDrama.enemy_birth_flag[_birth_flag_index].z)
				_ally.patrol = false
				_ally.is_walk = 0
				_ally:addToPartition(room_id)
				table.insert(Global_BellatiaDuplication[room_id].allies, _ally)
			end
		end

		if #Global_BellatiaDuplication[room_id].allies > Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount then
			for index = 1, #Global_BellatiaDuplication[room_id].allies - Global_BellatiaDuplication_FourthBossDrama.drama8_balance_amount do
				Global_BellatiaDuplication[room_id].allies[index].hp = 0
			end
		end

		for index, ally in pairs(Global_BellatiaDuplication[room_id].allies) do
			if ally.hp <= 0 or not CheckID(ally.GUID) then table.remove(Global_BellatiaDuplication[room_id].allies, index) end
			if not ally.attack_target then
				ally.attack_target = Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]
			elseif ally.attack_target then
				ally:attack(ally.attack_target)
				if ally.attack_target.hp <= 0 then ally.attack_target = nil end
			end
		end

		for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies) do
			if enemy.hp <= 0 or not CheckID(enemy.GUID) then table.remove(Global_BellatiaDuplication[room_id].enemies, index) end
			if not enemy.attack_target then
				enemy.attack_target = Global_BellatiaDuplication[room_id].allies[RandRange(1, #Global_BellatiaDuplication[room_id].allies)]
			elseif enemy.attack_target then
				enemy:attack(enemy.attack_target)
				if enemy.attack_target.hp <= 0 then enemy.attack_target = nil end
			end
		end

		if not Global_BellatiaDuplication[room_id].feitlautrec.attack_target then
			Global_BellatiaDuplication[room_id].feitlautrec.attack_target = Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]
		elseif Global_BellatiaDuplication[room_id].feitlautrec.attack_target then
			Global_BellatiaDuplication[room_id].feitlautrec:attack(Global_BellatiaDuplication[room_id].feitlautrec.attack_target)
			if Global_BellatiaDuplication[room_id].feitlautrec.attack_target.hp <= 0 then Global_BellatiaDuplication[room_id].feitlautrec.attack_target = nil end
		end

		if not Global_BellatiaDuplication[room_id].ironrose.attack_target then
			Global_BellatiaDuplication[room_id].ironrose.attack_target = Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]
		elseif Global_BellatiaDuplication[room_id].ironrose.attack_target then
			Global_BellatiaDuplication[room_id].ironrose:attack(Global_BellatiaDuplication[room_id].ironrose.attack_target)
			if Global_BellatiaDuplication[room_id].ironrose.attack_target.hp <= 0 then Global_BellatiaDuplication[room_id].ironrose.attack_target = nil end
		end

		Global_BellatiaDuplication[room_id].enemies[RandRange(1, #Global_BellatiaDuplication[room_id].enemies)]:delete()
		Global_BellatiaDuplication[room_id].allies[RandRange(1, #Global_BellatiaDuplication[room_id].allies)]:delete()
		
		Sleep(Global_BellatiaDuplication_FourthBossDrama.delay * 10)
	end

	-----------------------------------------------------------------
	--	清除演員
	-----------------------------------------------------------------
	if Global_BellatiaDuplication[room_id].enemies then 
		for index, enemy in pairs(Global_BellatiaDuplication[room_id].enemies) do enemy:delete() end
		Global_BellatiaDuplication[room_id].enemies = nil
	end
	if Global_BellatiaDuplication[room_id].allies then
		for index, ally in pairs(Global_BellatiaDuplication[room_id].allies) do ally:delete() end
		Global_BellatiaDuplication[room_id].allies = nil
	end

	Global_BellatiaDuplication[room_id].feitlautrec:delFromPartition()
	Global_BellatiaDuplication[room_id].ironrose:delFromPartition()

	Global_BellatiaDuplication:debug("info> fourth boss drama8 end")
end