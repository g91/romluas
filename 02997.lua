-----------------------------------------------------------------
--	卡喪母和康葛斯在前往舞王的路途中的閒聊
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama15()
	Global_BellatiaDuplication:debug("active > fifth boss drama 15 -> function Lua_BellatiaDuplication_FifthBoss_drama15()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	卡拉維‧卡薩姆：剛才我們在密室說到哪了？
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_01]", time = 1, is_done = false},
	--	康葛斯：哈！你這小子，果然是繼承了卡薩姆之名的男人，血戰中還能聊天？真是跟你的先祖一個模樣。
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_02]", time = 4, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 15 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	if Lua_BellatiaDuplication_check_status(room_id, "drama") then Global_BellatiaDuplication[room_id].drama_step = 16 end

	Global_BellatiaDuplication:debug("fifth boss drama 15 end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	卡喪母和康葛斯在前往舞王的路途中的閒聊	隨機一
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16a()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16a -> function Lua_BellatiaDuplication_FifthBoss_drama16a()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	康葛斯：艾柏．希歐杜這個人極其神秘
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_11]", time = 1, is_done = false},
	--	卡拉維‧卡薩姆：曼索瑞恩的偽裝身份之一
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_12]", time = 4, is_done = false},
	--	康葛斯：對，他不請自來，但是很快得到坦帝歐斯的重用
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_13]", time = 7, is_done = false},
	--	康葛斯：出謀劃策，神機妙算。因為他的智計，人王軍隊勢如破竹。
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_14]", time = 10, is_done = false},
	--	康葛斯：不過，這也沒什麼特別的，只是令人不解為什麼他要這麼做？
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_15]", time = 13, is_done = false},
	--	康葛斯：我從來就沒搞懂過，他竟然幫人王對付自己的手下
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_16]", time = 16, is_done = false},
	--	卡拉維：卡貝斯特說過曼索瑞恩始終在追尋強大的力量，也許是潛伏在他身邊想知道能否有新發現？
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_17]", time = 19, is_done = false},
	--	卡拉維：如果他有發現了什麼，說不定初代人王也會像另一位先祖卡貝斯特一樣遇害
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_18]", time = 22, is_done = false},
	--	康葛斯：沒錯，我想曼索瑞恩應該就是會做出這種卑鄙行徑的人
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_19]", time = 25, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16a end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	卡喪母和康葛斯在前往舞王的路途中的閒聊	隨機二
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16b()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16b -> function Lua_BellatiaDuplication_FifthBoss_drama16b()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	康葛斯：我被艾柏．希歐杜說服，和他一起研發開啟通往不同空間的魔法
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_21]", time = 1, is_done = false},
	--	卡拉維‧卡薩姆：虛界之門？
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_22]", time = 4, is_done = false},
	--	康葛斯：對，就是那玩意。
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_23]", time = 7, is_done = false},
	--	康葛斯：話說回來，我也不知道虛界究竟是什麼？裡面有什麼？
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_24]", time = 10, is_done = false},
	--	康葛斯：總之，那時只想著把魔帝的勢力封進裡頭，結束這場戰爭就是了
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_25]", time = 13, is_done = false},
	--	卡拉維‧卡薩姆：你很厭惡戰爭是吧？
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_26]", time = 16, is_done = false},
	--	康葛斯：再討厭不過了。我永遠是看著其他人倒下的那一個
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_27]", time = 19, is_done = false},
	--	卡拉維‧卡薩姆：你為什麼老是要表現得瘋瘋顛顛？我直覺你不是那樣的人
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_28]", time = 22, is_done = false},
	--	康葛斯：我無法真正地死去，也就無法真正地活著。但這又是另外一個故事了...
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_29]", time = 25, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16b end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	卡喪母和康葛斯在前往舞王的路途中的閒聊	隨機三
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16c()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16c -> function Lua_BellatiaDuplication_FifthBoss_drama16c()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	康葛斯：監護者的發源地是伊格儂大陸的塔格納
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_31]", time = 1, is_done = false},
	--	卡拉維‧卡薩姆：我有印象，賢者之眼和黑曜石騎士的兄弟們就是來自伊格儂
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_32]", time = 4, is_done = false},
	--	康葛斯：正是，塔格納是艾柏．希歐杜的封地，那個時候艾柏．希歐杜是他的化名
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_33]", time = 7, is_done = false},
	--	卡拉維‧卡薩姆：所以監護者很早就被曼索瑞恩造出來了？
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_34]", time = 10, is_done = false},
	--	康葛斯：沒錯。現在回想起來，名義上是掃蕩殘餘魔族，其實是要掠奪禁忌符文吧？
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_35]", time = 13, is_done = false},
	--	卡拉維‧卡薩姆：真是冷血之極！
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_36]", time = 16, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16c end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	卡喪母和康葛斯在前往舞王的路途中的閒聊	隨機四
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16d()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16d -> function Lua_BellatiaDuplication_FifthBoss_drama16d()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	康葛斯：曼索瑞恩的符文能力很神秘
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_41]", time = 1, is_done = false},
	--	卡拉維‧卡薩姆：所以沒人知道他的符文能力？
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_42]", time = 4, is_done = false},
	--	康葛斯：沒有人。但是我大概猜得到
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_43]", time = 7, is_done = false},
	--	康葛斯：從來沒有人比曼索瑞恩知道更多符文的秘密
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_44]", time = 10, is_done = false},
	--	康葛斯：探索禁忌符文的能力不是件容易的事，需要運氣或是時間
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_45]", time = 13, is_done = false},
	--	康葛斯：但是這對曼索瑞恩來說從來就不是問題，所以我猜他可以知道任何符文的資料
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_46]", time = 16, is_done = false},
	--	卡拉維‧卡薩姆：拿到任何符文都能立刻精通？確實可以想見這有多厲害！
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_47]", time = 19, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16d end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end

-----------------------------------------------------------------
--	卡喪母和康葛斯在前往舞王的路途中的閒聊	隨機五
-----------------------------------------------------------------
function Lua_BellatiaDuplication_FifthBoss_drama16e()
	Global_BellatiaDuplication:debug("active > fifth boss drama 16e -> function Lua_BellatiaDuplication_FifthBoss_drama16e()")
	local room_id = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)

	if not Global_BellatiaDuplication_FifthBossDrama or Global_BellatiaDuplication.alpha then Lua_BellatiaDuplication_FifthBoss_drama_setting() end

	local scripts = {
	--	康葛斯：在坦帝歐斯那個時代，曼索瑞恩就已經研發出秘術武裝
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_51]", time = 1, is_done = false},
	--	卡拉維‧卡薩姆：但在伊蘭薩爾的記憶裡還沒有
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_52]", time = 4, is_done = false},
	--	康葛斯：所以，我想那是在他偷襲卡貝斯特之後才設計出來的
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_53]", time = 7, is_done = false},
	--	卡拉維‧卡薩姆：我看應該是這樣沒錯
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_54]", time = 10, is_done = false},
	--	康葛斯：真是有夠狡滑的，因為秘術武裝配有一副面具
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_55]", time = 13, is_done = false},
	--	康葛斯：所以沒人知道曼索瑞恩長得什麼模樣！
		{speaker = Global_BellatiaDuplication[room_id].kangersy, content = "[SC_BELLATIA_FIFTHADVANCE_56]", time = 16, is_done = false},
	--	卡拉維‧卡薩姆：我看不止如此，因為伊蘭薩爾記憶中的曼索瑞恩，和賽弗．史奎普長得也不一樣
		{speaker = Global_BellatiaDuplication[room_id].cassam, content = "[SC_BELLATIA_FIFTHADVANCE_57]", time = 19, is_done = false}
	}
	local start_time = GetSystime(0)
	local current_time = start_time

	while Lua_BellatiaDuplication_check_status(room_id, "drama") and Global_BellatiaDuplication[room_id].drama_step == 16 and not scripts[#scripts].is_done do
		current_time = GetSystime(0)

		for index, script in pairs(scripts) do
			if current_time - start_time >= script.time and not script.is_done then
				script.is_done = true
				if script.speaker and script.content then script.speaker:say(script.content, 5) end
				if script.action then script.action() end
			end
		end

		Global_BellatiaDuplication:sleep(Global_BellatiaDuplication_FifthBossDrama.delay)
	end

	Global_BellatiaDuplication:debug("fifth boss drama 16e end")
	Global_BellatiaDuplication[room_id].drama_step_trigger = true
end