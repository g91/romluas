function Hao_SI_Buff_Tools(Choise) -- Hao_Shop_Items_Buff_Tools
	--輸入 0 顯示現在身上所有Buff、輸入 1 ~ 5 為獲得指定Table中的系列Buff、輸入 9527 為獲得所有指定Table中的系列Buff
	--輸入 500000 ~ 509999、620001 ~ 629999 時為獲得指定Buff、-500000 ~ -509999、-620001 ~ -629999 時為刪除指定Buff
	local Player = OwnerID()
	local Room = ReadRoleValue(Player, EM_RoleValue_RoomID)
	if Type(Choise) ~= "number" then
		DebugMsg(Player, Room, "Not a number")
		return
	end

	local Buff = {}
	--Exp 經驗系列
	Buff[1] = {
		501388, --經驗藥劑50%
		501590, --持久經驗藥劑50%
		501591, --高效經驗藥劑70%
		501601, --組隊經驗值藥劑30%
		502563, --高級經驗藥劑100%
		501643, --一天經驗藥劑50%
		508441, --一天經驗藥劑50%
		501644, --七天經驗藥劑50%
		508439, --七天經驗藥劑50%
		508438, --十四天經驗藥劑50%
		504774, --三十天基礎經驗藥劑10%
		504775, --三十天進階經驗藥劑20%
		504759, --三十天經驗藥劑50%
		623904 --任務獲得經驗值與技能點數增加50%
	}
	-- Tp 技能系列
	Buff[2] = {
		502674, --初級技能藥劑30%
		501592, --技能藥劑50%
		501593, --專家技能藥劑70%
		501594, --大師技能藥劑100%
		501645, --一天技能藥劑50%
		501646, --七天技能藥劑50%
		508442, --十四天技能藥劑50%
		504776, --三十天基礎技能藥劑10%
		504777, --三十天進階技能藥劑20%
		504760, --三十天技能藥劑50%
		623905 --任務獲得技能點數增加50%
	}
	-- Luck 幸運系列
	Buff[3] = {
		501589, --幸運藥劑30%
		501647, --高效幸運藥劑100%
		508440, --一天幸運藥劑50%
		508437, --七天幸運藥劑50%
		508436, --十四天幸運藥劑50%
		508435, --三十天幸運藥劑20%
		504778 --三十天幸運藥劑50%
	}
	-- Craft 生產系列
	Buff[4] = {
		623901, --採集速度增加100%
		623902, --採集經驗值增加100%
		623903 --採集收穫量增加100%
	}
	-- Others 其他
	Buff[5] = {
		508443, --三十天 大天使的嘆息
		508444, --十四天 大天使的嘆息
		508445, --七天 大天使的嘆息
		501387, --大天使的嘆息
		501389, --菲尼克斯的救贖
		502484, --聖‧菲尼克斯
		501617, --菲尼克斯的禁制
		501670, --PK禁制令
		502399, --暖暖的守護
		503326, --全能藥劑
		503479, --帕奇香水效果
		506912 --空間之翼
	}

	-- Ini Buffs
	Buff[6] = {
		507038, -- Gebratener Fisch
		505055, -- Lebensschutzer
		505057, -- Magieschutzer
		505058, -- Angriffsschutzer
		505069, -- Hochgeschwindigkeitssegen des Proviantkuriers
		505136, -- Giftschlangen-Rache (PSchaden)
		505137, -- Giftschlangen-Rache (P/M DEF)
		505138, -- Giftschlangen-Rache (Heilung)
		505150, -- Moralschub
		505153, -- Reaktion der Seele
		505154, -- Kristallschutz
		505155, -- Verbindung
		505163, -- Seelenstrom
		505175, -- Schlachtsegen
		505179, -- Segen der Erde
		505183, -- Felspanzer
		505185 	-- Kritisches Gespur
	}

	local CountBuff = BuffCount(Player)

	if Choise == 0 then -- 讀取當前持有Buff&Debuff加總數量
		DebugMsg(Player, Room, "Total Buffs&Debuffs  : " .. CountBuff)
		for Pos = 0, CountBuff - 1, 1 do
			local BodyBuff = BuffInfo(Player, Pos, EM_BuffInfoType_BuffID) -- 讀取該Buff的ID
			local Flag = GameObjInfo_int(BodyBuff, "settingflagex") -- 取得資料庫中 settingflagex 的設定
			if Flag == 2 then
				ScriptMessage(
					Player,
					Player,
					0,
					String.format("%02d", Pos + 1) .. ". " .. BodyBuff .. " " .. "[" .. BodyBuff .. "]",
					0
				)
			else
				ScriptMessage(
					Player,
					Player,
					0,
					String.format("%02d", Pos + 1) .. ". " .. BodyBuff .. " " .. "[" .. BodyBuff .. "]",
					"0xcFFFF6060"
				)
			end
		end
		return
	elseif Choise == -1 then -- 刪除所有Buff&Debuff
		for Pos = CountBuff - 1, 0, -1 do
			local BodyBuff = BuffInfo(Player, Pos, EM_BuffInfoType_BuffID) -- 讀取該Buff的ID
			CancelBuff_NoEvent(Player, BodyBuff)
		end
		return
	elseif Choise >= 1 and Choise <= 5 then -- 獲得指定Table中的系列Buff
		for BuffID = 1, #Buff[Choise], 1 do
			ScriptMessage(
				Player,
				Player,
				0,
				String.format("%02d", BuffID) .. ". " .. Buff[Choise][BuffID] .. "  " .. "[" .. Buff[Choise][BuffID] .. "]",
				0
			)
			AddBuff(Player, Buff[Choise][BuffID], 0, -1)
		end
		return
	elseif Choise == 9527 then -- 獲得所有指定Table中的系列Buff
		local Count = 0
		for Number = 1, #Buff, 1 do
			for BuffID = 1, #Buff[Number], 1 do
				Count = Count + 1
				ScriptMessage(
					Player,
					Player,
					0,
					String.format("%02d", Count) .. ". " .. Buff[Number][BuffID] .. "  " .. "[" .. Buff[Number][BuffID] .. "]",
					0
				)
				AddBuff(Player, Buff[Number][BuffID], 0, -1)
			end
		end
		return
	elseif (Choise >= 500000 and Choise <= 509999) or (Choise >= 620001 and Choise <= 629999) then -- 獲得指定Buff
		AddBuff(Player, Choise, 0, -1)
		local CountBuff = BuffCount(Player)
		ScriptMessage(Player, Player, 0, "Get Buff : " .. Choise .. " " .. "[" .. Choise .. "]", 0)
		for Pos = 0, CountBuff - 1, 1 do
			local BodyBuff = BuffInfo(Player, Pos, EM_BuffInfoType_BuffID) -- 讀取該Buff的ID
			local Flag = GameObjInfo_int(BodyBuff, "settingflagex") -- 取得資料庫中 settingflagex 的設定
			if Flag == 2 then
				ScriptMessage(
					Player,
					Player,
					0,
					String.format("%02d", Pos + 1) .. ". " .. BodyBuff .. " " .. "[" .. BodyBuff .. "]",
					0
				)
			else
				ScriptMessage(
					Player,
					Player,
					0,
					String.format("%02d", Pos + 1) .. ". " .. BodyBuff .. " " .. "[" .. BodyBuff .. "]",
					"0xcFFFF6060"
				)
			end
		end
		return
	elseif (Choise >= -509999 and Choise <= -500000) or (Choise >= -629999 and Choise <= -620001) then -- 刪除指定Buff
		for i = 0, CountBuff - 1, 1 do
			local BodyBuff = BuffInfo(Player, i, EM_BuffInfoType_BuffID) -- 讀取該Buff的ID
			if -Choise == BodyBuff then
				CancelBuff_NoEvent(Player, -Choise)
				ScriptMessage(Player, Player, 0, "Remove Buff : " .. -Choise .. " " .. "[" .. -Choise .. "]", 0)
			end
		end
		return
	end
	DebugMsg(Player, Room, "Error numbers")
end

function Lua_Hao_Test_Debuff()
	local Player = OwnerID()
	local Buff = {
		502269,
		504783,
		504784,
		504785,
		505605,
		505724,
		506559,
		506624,
		506625,
		620040,
		504814,
		509337,
		509338,
		504077,
		505518,
		503119,
		503120,
		503121,
		503123,
		503249,
		504922,
		501617,
		502822,
		502823,
		503109,
		503920,
		504173,
		504175,
		504177,
		500081,
		500227,
		500365,
		501687
	}

	for ID = 1, #Buff, 1 do
		AddBuff(Player, Buff[ID], 0, -1)
	end
end
