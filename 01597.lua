-- 701597
-- 2013 �x���L�鬡�ʻ��buff

function mika_2013tw_summer_buff01()
	local Player = OwnerID()
	local NPC = TargetID()
	local Level = ReadRoleValue(Player, EM_RoleValue_LV )  --�D¾����
	local Today = CheckFlag(Player, 542579 )  -- ��Ѥw��L�L�鯬��

	if Level >= 76 then -- �D¾����76
		SetSpeakDetail( player, "[SC_2013TW_SUMMER_BUFF01]"   );  -- ��p�A[$PLAYERNAME]�A�A���D¾���Ťw�W�L�i��������šC
	else  -- �D¾�C��76
		if today == true then -- ���Ѥw��L
			SetSpeakDetail( player, "[SC_2013TW_SUMMER_BUFF03]"   );  --  �A���Ѥw����L�A�Щ��ѦA�ӳ�I
		else  -- �����٨S��L
			SetSpeakDetail( player, "[SC_2013TW_SUMMER_BUFF02]"   );  --  �ŦX���������
			AddSpeakOption(player, player, "[SC_2013TW_SUMMER_BUFF04]", "mika_2013tw_summer_buff02", 0  )   --   �ڭn����L�鯬��
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
	Setflag(Player, todaykey, 1)  -- �����C��X��
	AddBuff(Player, buffid, 0, bufftime )  
	ScriptMessage( Player,  Player, 1, "[SC_2013TW_SUMMER_BUFF05][$SETVAR1=".."["..buffid.."]".."]" , C_SYSTEM )  -- ���ߧA��o�F[$VAR1]���ĪG�I
end

function mika_2013tw_summer_buff03()
	local Player = OwnerID()

	local todaykey = 542579
	Setflag(Player, todaykey, 0)  
	say(Player, "Delete today key" )

end