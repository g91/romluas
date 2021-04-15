-- 701597
-- 2013 台版夏日活動領取buff

function mika_2013tw_summer_buff01()
	local Player = OwnerID()
	local NPC = TargetID()
	local Level = ReadRoleValue(Player, EM_RoleValue_LV )  --主職等級
	local Today = CheckFlag(Player, 542579 )  -- 當天已領過夏日祝福

	if Level >= 76 then -- 主職高於76
		SetSpeakDetail( player, "[SC_2013TW_SUMMER_BUFF01]"   );  -- 抱歉，[$PLAYERNAME]，你的主職等級已超過可領取的等級。
	else  -- 主職低於76
		if today == true then -- 今天已領過
			SetSpeakDetail( player, "[SC_2013TW_SUMMER_BUFF03]"   );  --  你今天已領取過，請明天再來喔！
		else  -- 今天還沒領過
			SetSpeakDetail( player, "[SC_2013TW_SUMMER_BUFF02]"   );  --  符合條件領取對話
			AddSpeakOption(player, player, "[SC_2013TW_SUMMER_BUFF04]", "mika_2013tw_summer_buff02", 0  )   --   我要領取夏日祝福
		end
	end
end

function mika_2013tw_summer_buff02()
	local Player = OwnerID()
	local NPC = TargetID()
	local todaykey = 542579
	local bufflist = {624713, 624714, 624715, 624716, 624717, 624718 }
	local buffid = bufflist[(Rand(6)+1)]
	local bufftime = 14400	-- 4hr 

	CloseSpeak(Player)
--	say(Player, "buffid = "..buffid )
	Setflag(Player, todaykey, 1)  -- 給予每日旗標
	AddBuff(Player, buffid, 0, bufftime )  
	ScriptMessage( Player,  Player, 1, "[SC_2013TW_SUMMER_BUFF05][$SETVAR1=".."["..buffid.."]".."]" , C_SYSTEM )  -- 恭喜你獲得了[$VAR1]的效果！
end

function mika_2013tw_summer_buff03()
	local Player = OwnerID()

	local todaykey = 542579
	Setflag(Player, todaykey, 0)  
	say(Player, "Delete today key" )

end