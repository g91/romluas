-----------------------------------------------------------------
--	zone26副本 貝拉蒂亞王城
-----------------------------------------------------------------
-----------------------------------------------------------------
--	音樂
-----------------------------------------------------------------
function Lua_BellatiaDuplication_music_setting()
	-----------------------------------------------------------------
	--	音樂路徑
	-----------------------------------------------------------------
	Global_BellatiaDuplication.music = {}

	Global_BellatiaDuplication.music.beginning = AddyMusic:new("beginning", "music/zone/ch6_main_theme.mp3", 139)
	Global_BellatiaDuplication.music.boss1_success = AddyMusic:new("boss1_success", "music/zone/007/Naga_Outpost/dark_tales_04_SIV_chaos_club.mp3", 120)
	Global_BellatiaDuplication.music.boss2_hp_less_than_40_percent = AddyMusic:new("boss2_hp_less_than_40_percent", "music/GuildWar/epic_tales_01_APF_chaos.mp3", 64)
	Global_BellatiaDuplication.music.enter_secret_room = AddyMusic:new("enter_secret_room", "music/rom/ROM02_elves_theme.mp3", 191)
	Global_BellatiaDuplication.music.enter_dream = AddyMusic:new("enter_dream", "music/zone/014/zone/night/HL22_LOOP_taymuria_2.0.mp3", 122)
	Global_BellatiaDuplication.music.departure_from_secret_room = AddyMusic:new("departure_from_secret_room", "music/zone/015/Valley_of_Glory/ET09_01_APF_call_for_heroes_fullmix.mp3", 114)
	Global_BellatiaDuplication.music.advance4_say_goodbye_with_pangkorrams = AddyMusic:new("advance4_say_goodbye_with_pangkorrams", "music/rom/ROM05_prophecy.mp3", 156)
	Global_BellatiaDuplication.music.boss4_beginning = AddyMusic:new("boss4_beginning", "music/rom/ROM03_maintheme.mp3", 211)
	Global_BellatiaDuplication.music.boss4_say_goodbye_with_ironrose = AddyMusic:new("boss4_say_goodbye_with_ironrose", "music/rom/ROM04_tales_of_might.mp3", 119)
	Global_BellatiaDuplication.music.boss4_kangersy_sacrifice = AddyMusic:new("boss4_kangersy_sacrifice", "music/GuildWar/epic_tales_02_JFL_hellwars.mp3", 62)
	Global_BellatiaDuplication.music.boss5_beginning = AddyMusic:new("boss5_beginning", "music/zone/007/Hero's Tomb/fantasy_action_09_SF2_uram_gor.mp3", 160)
	Global_BellatiaDuplication.music.boss5_success = AddyMusic:new("boss5_success", "music/zone/019/Village/sacral_spheres_02_DG2_old_monastery.mp3", 92)
	Global_BellatiaDuplication.music.after_saisimengde_leave = AddyMusic:new("after_saisimengde_leave", "music/rom/ROM01_runes_of_magic.mp3", 229)

	Global_BellatiaDuplication.music.boss_random = {}
	Global_BellatiaDuplication.music.boss_random[1] = AddyMusic:new("boss1", "music/GuildWar/blazing_battle.mp3", 85)
	Global_BellatiaDuplication.music.boss_random[2] = AddyMusic:new("boss2", "music/GuildWar/BLMP2_03_JFL_cataclistic.mp3", 79)
	Global_BellatiaDuplication.music.boss_random[3] = AddyMusic:new("boss3", "music/GuildWar/emporium.mp3", 144)
	Global_BellatiaDuplication.music.boss_random[4] = AddyMusic:new("boss4", "music/moli/title.mp3", 77)
	Global_BellatiaDuplication.music.boss_random[5] = AddyMusic:new("boss5", "music/zone/022/Coalition_Pioneers_Camp/military_grounds_01_APF_together_we_stand.mp3", 150)

	Global_BellatiaDuplication.music.advance_random = {}
	Global_BellatiaDuplication.music.advance_random[1] = AddyMusic:new("advance1", "music/GuildWar/dramatic_orchestra_07_the_infiltrator.mp3", 194)
	Global_BellatiaDuplication.music.advance_random[2] = AddyMusic:new("advance2", "music/Guild_Drill_Ground/9/ET09_04_JFL_kings_valor.mp3", 106)
	Global_BellatiaDuplication.music.advance_random[3] = AddyMusic:new("advance3", "music/dungeon/Venadurken/SS51_parasites.mp3", 149)
	Global_BellatiaDuplication.music.advance_random[4] = AddyMusic:new("advance4", "music/zone/009/diabolus.mp3", 117)
end

-----------------------------------------------------------------
--	更新音樂
-----------------------------------------------------------------
function Lua_BellatiaDuplication_update_music(room_id)

	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		Lua_BellatiaDuplication_update_music_personal(player)
		player.music_player:play()
	end

	Global_BellatiaDuplication:debug("UPDATE > music")
end

function Lua_BellatiaDuplication_update_music_personal(player)
	local room_id = player.room_id

	if not player.music_player then
		player.music_player = AddyMusicPlayer:new(player)
		Global_BellatiaDuplication[room_id].music_listener:add(player.music_player)
		player.music_player:removeEventListener(AddyMusicPlayerEvent.MusicEnd)
		player.music_player:addEventListener(AddyMusicPlayerEvent.MusicEnd, Lua_BellatiaDuplication_music_random)
	end

	local music = nil
	if Global_BellatiaDuplication[room_id].save_point <= 1 then music = Global_BellatiaDuplication.music.beginning
	elseif Global_BellatiaDuplication[room_id].save_point == 7 then music = Global_BellatiaDuplication.music.departure_from_secret_room
	elseif Global_BellatiaDuplication[room_id].save_point == 8 then music = Global_BellatiaDuplication.music.boss4_beginning
	elseif Global_BellatiaDuplication[room_id].save_point == 10 then music = Global_BellatiaDuplication.music.boss5_beginning end

	if not music and not player.music_player.music then
		if Global_BellatiaDuplication[room_id].save_point == 1 or
		   Global_BellatiaDuplication[room_id].save_point == 3 or
		   Global_BellatiaDuplication[room_id].save_point == 5 or
		   Global_BellatiaDuplication[room_id].save_point == 7 then
			music = Global_BellatiaDuplication.music.advance_random[RandRange(1, 4)]
		end

		if Global_BellatiaDuplication[room_id].save_point == 2 or
		   Global_BellatiaDuplication[room_id].save_point == 4 or
		   Global_BellatiaDuplication[room_id].save_point == 6 or
		   Global_BellatiaDuplication[room_id].save_point == 8 or
		   Global_BellatiaDuplication[room_id].save_point == 10 then
			music = Global_BellatiaDuplication.music.boss_random[RandRange(1, 5)]
		end
	end

	if not music then return end

	player:stopBGM()

	if player.music_player.music ~= music then player.music_player:changeMusic(music) end
	Global_BellatiaDuplication:debug("player(" .. player.GUID .. ") set music")
end

function Lua_BellatiaDuplication_music_random(event)
	Global_BellatiaDuplication:debug("player(" .. event.target.owner.GUID .. ", " .. event.target.owner.room_id .. "), " .. event.type)
	if Global_BellatiaDuplication[event.target.owner.room_id].save_point == 1 or
	   Global_BellatiaDuplication[event.target.owner.room_id].save_point == 3 or
	   Global_BellatiaDuplication[event.target.owner.room_id].save_point == 5 or
	   Global_BellatiaDuplication[event.target.owner.room_id].save_point == 7 then
		event.target:changeMusic(Global_BellatiaDuplication.music.advance_random[RandRange(1, 4)])
	end

	if Global_BellatiaDuplication[event.target.owner.room_id].save_point == 2 or
	   Global_BellatiaDuplication[event.target.owner.room_id].save_point == 4 or
	   Global_BellatiaDuplication[event.target.owner.room_id].save_point == 6 or
	   Global_BellatiaDuplication[event.target.owner.room_id].save_point == 8 or
	   Global_BellatiaDuplication[event.target.owner.room_id].save_point == 10 then
		event.target:changeMusic(Global_BellatiaDuplication.music.boss_random[RandRange(1, 5)])
	end

	event.target:play()
	Global_BellatiaDuplication:debug("player(" .. event.target.owner.GUID .. ") play music : " .. event.target.music.name)
end

-----------------------------------------------------------------
--	特殊時機切換單曲
-----------------------------------------------------------------
function Lua_BellatiaDuplication_change_music(room_id, music)
	for index, player in pairs(Global_BellatiaDuplication[room_id].players) do
		if not player.music_player then
			player.music_player = AddyMusicPlayer:new(player)
			Global_BellatiaDuplication[room_id].music_listener:add(player.music_player)
		end
		player.music_player:changeMusic(music)
		player.music_player:play()
		Global_BellatiaDuplication:debug("player(" .. player.music_player.owner.GUID .. ") play music : " .. player.music_player.music.name)
	end
end

function Lua_BellatiaDuplication_change_music_boss1()
	Lua_BellatiaDuplication_change_music(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID), Global_BellatiaDuplication.music.boss1_success)
end