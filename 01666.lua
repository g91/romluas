function LuaS_PlayMusic_01()
	local Player = OwnerID()
	PlaySoundToPlayer( Player , "sound\\character\\creature\\_general\\npc_abomination_male_aggro1.mp3", false )	-- false = 不重播

end

function LuaS_PlayMusic_02()
	local Player = OwnerID()
	PlaySoundToPlayer( Player , "sound\\fx\\Lvup\\PC_SkillLvup.mp3", false )	-- false = 不重播

end

function LuaS_PlayMusic_03()
	local Player = OwnerID()
	PlaySoundToPlayer( Player , "sound\\ambience\\zone\\000\\zone001_day_ambience_FX.mp3", false )	-- false = 不重播

end

function LuaS_PlayMusic_04()
	local Player = OwnerID()
	PlaySoundToPlayer( Player , "sound\\ambience\\zone\\000\\zone006_day_ambience_FX.mp3", false )	-- false = 不重播

end

function LuaS_PlayMusic_05()
	local Player = OwnerID()
	PlaySoundToPlayer( Player , "sound\\interface\\add_rune.mp3", false )	-- false = 不重播

end

function LuaS_PlayMusic_06()
	local Player = OwnerID()
	PlaySoundToPlayer( Player , "sound\\interface\\guildupgrade.mp3", false )	-- false = 不重播

end

function LuaS_PlayMusic_07()
	local Player = OwnerID()
	PlaySoundToPlayer( Player , "sound\\interface\\QuestItemFinish.mp3", false )	-- false = 不重播

end

function LuaS_PlayMusic_08()
	local Player = OwnerID()
	PlaySoundToPlayer( Player , "sound\\interface\\ui_player_repair.mp3", false )	-- false = 不重播

end

function LuaS_PlayMusic_09()
	local Player = OwnerID()
	PlaySoundToPlayer( Player , "sound\\interface\\ui_sysmenu_upskilllevel.mp3", false )	-- false = 不重播

end

function LuaS_PlayMusic_10()
	local Player = OwnerID()
	for i = 1, 10 do
		PlaySoundToPlayer( Player , "sound\\interface\\add_rune.mp3", false )	-- false = 不重播
		Sleep( 5 )
	end

end