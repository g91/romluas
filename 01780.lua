function Lua_Hao_DandD_Menu_02() -- 點擊2次

	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_01]" , C_SYSTEM  )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_01]" , C_SYSTEM  )

	-- [SC_DANDD_BUFF_01]	你驚喜的發現一股神秘的能量在你身上流竄，這股能量或許對你有所幫助。
	-- [SC_DANDD_BUFF_02]	你嘗試去運用這股能量，忽然覺得全身充滿了力量。
	-- [SC_DANDD_BUFF_03]	你覺得在這股力量的護佑下，有了挑戰困境的勇氣。
	-- [SC_DANDD_BUFF_04]	用盡全力去運用這股力量之後，你覺得再也沒有什麼困難可以難倒你。

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local BuffNumber = 1

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
--		Say(OwnerID() , Zone )
--		Say(OwnerID() , ZoneRange[i] )
		--	BuffNumber = 1 -- 可點擊2次	
			AddBuff( OwnerID() , 506478 , 0 , -1 ) -- HP上限
			AddBuff( OwnerID() , 506479 , 0 , -1 ) -- MP上限
			AddBuff( OwnerID() , 506480 , 0 , -1 ) -- 攻擊上限
			AddBuff( OwnerID() , 506481 , 0 , -1 ) -- 防禦上限
			AddBuff( OwnerID() , 506484 , BuffNumber , -1 ) -- 可點擊次數
			return	-- 2012.10.25 新增
		end
	end
	-- 2012.10.25 新增，應廠商需求擴充
	DebugMsg( OwnerID() , 0 , "Setup" )
	AddBuff( OwnerID() , 506478 , 0 , -1 ) -- HP上限
	AddBuff( OwnerID() , 506480 , 0 , -1 ) -- 攻擊上限
	AddBuff( OwnerID() , 506481 , 0 , -1 ) -- 防禦上限
	AddBuff( OwnerID() , 506484 , BuffNumber , -1 ) -- 可點擊次數
	--
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Menu_03() -- 點擊3次

	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_01]" , C_SYSTEM  )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_01]" , C_SYSTEM  )

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local BuffNumber = 2

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
--		Say(OwnerID() , Zone )
--		Say(OwnerID() , ZoneRange[i] )
		--	BuffNumber = 2 -- 可點擊3次
			AddBuff( OwnerID() , 506478 , 0 , -1 ) -- HP上限
			AddBuff( OwnerID() , 506479 , 0 , -1 ) -- MP上限
			AddBuff( OwnerID() , 506480 , 0 , -1 ) -- 攻擊上限
			AddBuff( OwnerID() , 506481 , 0 , -1 ) -- 防禦上限
			AddBuff( OwnerID() , 506484 , BuffNumber , -1 ) -- 可點擊次數
			return	-- 2012.10.25 新增
		end
	end
	-- 2012.10.25 新增，應廠商需求擴充
	DebugMsg( OwnerID() , 0 , "Setup" )
	AddBuff( OwnerID() , 506478 , 0 , -1 ) -- HP上限
	AddBuff( OwnerID() , 506480 , 0 , -1 ) -- 攻擊上限
	AddBuff( OwnerID() , 506481 , 0 , -1 ) -- 防禦上限
	AddBuff( OwnerID() , 506484 , BuffNumber , -1 ) -- 可點擊次數
	--	
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Cancel_Menu() -- 清除選單

	CancelBuff( OwnerID() , 506478 ) -- HP上限
	CancelBuff( OwnerID() , 506479 ) -- MP上限
	CancelBuff( OwnerID() , 506480 ) -- 攻擊上限
	CancelBuff( OwnerID() , 506481 ) -- 防禦上限
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_HP() -- 清除單一選單

	CancelBuff( OwnerID() , 506478 ) -- HP上限
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_MP() -- 清除單一選單

	CancelBuff( OwnerID() , 506479 ) -- MP上限
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_ATK_MATK() -- 清除單一選單

	CancelBuff( OwnerID() , 506480 ) -- 攻擊上限
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_DEF_MDEF() -- 清除單一選單

	CancelBuff( OwnerID() , 506481 ) -- 防禦上限
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Cancel_Buff() -- 清除副本Buff

--	CancelBuff( OwnerID() , 506474 ) -- HP上限點數
--	CancelBuff( OwnerID() , 506475 ) -- MP上限點數
--	CancelBuff( OwnerID() , 506476 ) -- 攻擊上限點數
--	CancelBuff( OwnerID() , 506477 ) -- 防禦上限點數
--	CancelBuff( OwnerID() , 506597 ) -- HP上限%比
--	CancelBuff( OwnerID() , 506598 ) -- MP上限%比
--	CancelBuff( OwnerID() , 506599 ) -- 攻擊上限%比
--	CancelBuff( OwnerID() , 506600 ) -- 防禦上限%比
	-- 2012.10.25 新增，應廠商需求擴充
	local Player = OwnerID()
	local BuffID = {	506474 , 506475 , 506476 , 506477 ,
			506597 , 506598 , 506599 , 506600 ,
			623689 , 623690 , 623691		}
			
	for i = 1 , #BuffID , 1 do
		CancelBuff( Player , BuffID[i] )
	end
	--
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_CheckBuff() -- 安排5個 技能Level 

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local BuffLv , BuffNumber , CheckOK -- 技能等級、可點擊次數、判定刪除
	local Count = BuffCount ( OwnerID())

	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 506484 then -- 可點擊次數
			BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			BuffNumber = BuffLv
		end
	end

	if BuffNumber >= 1 then
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 506484 then -- 隨技能，判斷Buff次數
				BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				CheckOK = 1
--				Say( OwnerID() , "Remain :"..BuffLv )
			end
		end
	elseif BuffNumber == 0 then
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 506484 then -- 隨技能，判斷Buff次數
				local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				CheckOK = 2
--				Say( OwnerID() , "Remain :"..BuffLv )
			end
		end
	end

--	Say( OwnerID() , "CheckOK :"..CheckOK )

	if CheckOK == 1 then -- Buff等級為1以上時
			CancelBuff( OwnerID() , 506484 )
			AddBuff( OwnerID() , 506484 , BuffNumber-1 , -1 ) -- 可點擊次數

			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
				if BuffID == 506484 then -- 可點擊次數
					BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					BuffNumber = BuffLv
				end
			end
			if BuffLv == 1 then
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_02]" , C_SYSTEM )
			--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_02]" , C_SYSTEM )
				PlayMotion( OwnerID() , 103 )
			elseif BuffLv == 0 then
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_03]" , C_SYSTEM )
			--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_03]" , C_SYSTEM )
				PlayMotion( OwnerID() , 115 )
			end

	elseif CheckOK == 2 then -- Buff等級為0時

		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_04]" , C_SYSTEM )
	--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_04]" , C_SYSTEM )

		PlayMotion( OwnerID() , 101 )
		CancelBuff( OwnerID() , 506484 )
		Beginplot( OwnerID() , "Lua_Hao_DandD_Cancel_Menu" , 0 )
	end
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Skill_Lv_HP()

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Buff

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	if Zone == 110 then -- 卑劣岩窟 8 - 15
		Buff = 0 -- PowerLv = 1
	elseif Zone == 251 then -- 薩斯柯特地下密室 14 - 16
		Buff = 2
	elseif Zone == 250 or Zone == 201 then -- 風車密室 17 - 22、血腥迴廊18-23
		Buff = 4
	elseif Zone == 102 then -- 廢棄修道院 20 - 25
		Buff = 9
--	elseif Zone == 205 then -- 海波拉古遺跡31 - 39
--		Buff = 11
	elseif Zone == 103 then -- 鏡之墓城 35 - 38
		Buff = 14
	elseif Zone == 113 then -- 冰雪矮人王國 35 - 40
		Buff = 17
	elseif Zone == 104 then -- 密法祭壇 40 - 42
		Buff = 19
	elseif Zone == 105 then -- 蟻后巢穴 45 - 47
		Buff = 22
	elseif Zone == 106 or Zone == 107 then -- 柏斯佩斯 45 -48、喀里恩神殿 48 - 50
		Buff = 24
	elseif Zone == 108 then -- 藏寶秘窟 48 - 50
		Buff = 29
	elseif Zone == 252 or Zone == 114  then -- 獨眼巢城50、冰雪矮人王國50
		Buff = 31
	elseif Zone == 126 then -- 海音之心簡易版 52 - 55
		Buff = 34
	elseif Zone == 115 or Zone == 208 then -- 海音之心 52 - 55、尤里士的噩夢 52 - 55 
		Buff = 37
	elseif Zone == 116 or  Zone == 118 then -- 太初之所 53 - 55、水龍洞窟 53 - 55
		Buff = 39
	elseif Zone == 123 then  -- 遺民殿堂簡易版 55
		Buff = 54
	elseif Zone == 117 or Zone == 119 then -- 遺民殿堂55、魔龍之巢55
		Buff = 59
	elseif Zone == 124 or Zone == 125 then -- 索雷爾頓區簡易版55 、魔人區簡易版55
		Buff = 64
	elseif Zone == 120 or Zone == 122 then -- 蛇人魔都索雷爾頓55、蛇人魔都 - 魔人區55
		Buff = 69
	elseif Zone == 127 then -- 拉尼斯地下監獄遺跡 56 - 57
		Buff = 44
	end

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
			AddBuff( OwnerID() , 506474 , Buff , -1 ) -- HP上限點數
			AddBuff( OwnerID() , 506597 , 0 , -1 ) -- HP上限%比
			return	-- 2012.10.25 新增
		end
	end
	
	-- 2012.10.25 新增，應廠商需求擴充
	AddBuff( OwnerID() , 623689 , 0 , -1 )	-- HP上限點數加成固定10%
	--
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Skill_Lv_MP()

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Buff 

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	if Zone == 110 then -- 卑劣岩窟 8 - 15
		Buff = 0 -- PowerLv = 1
	elseif Zone == 251 or Zone == 250 then -- 薩斯柯特地下密室 14 - 16、風車密室 17 - 22
		Buff = 2
	elseif Zone == 201 or Zone == 102 then -- 血腥迴廊18-23、廢棄修道院 20 - 25
		Buff = 3
	elseif Zone == 103 or Zone == 113 then -- 鏡之墓城 35 - 38、冰雪矮人王國 35 - 40
		Buff = 5
	elseif Zone == 104 or Zone == 105 or Zone == 106 then -- 密法祭壇 40 - 42、蟻后巢穴 45 - 47、柏斯佩斯 45 -48
		Buff = 7
	elseif Zone == 107 or Zone == 108 then -- 喀里恩神殿 48 - 50、藏寶秘窟 48 - 50
		Buff = 9
	elseif Zone == 252 or Zone == 114  then -- 獨眼巢城50、冰雪矮人王國50
		Buff = 14
	elseif Zone == 126 or Zone == 115  then -- 海音之心簡易版 52 - 55、海音之心 52 - 55
		Buff = 19
	elseif Zone == 208 or Zone == 116 or Zone == 118 then -- 尤里士的噩夢 52 - 55 、太初之所 53 - 55、水龍洞窟 53 - 55
		Buff = 24
	elseif Zone == 123 or Zone == 117 or Zone == 119 then  -- 遺民殿堂簡易版 55、遺民殿堂55、魔龍之巢55
		Buff = 29
	elseif Zone == 124 or Zone == 125 then -- 索雷爾頓區簡易版55 、魔人區簡易版55
		Buff = 34
	elseif Zone == 120 or Zone == 122 then -- 蛇人魔都索雷爾頓55、蛇人魔都 - 魔人區55
		Buff = 39
	elseif Zone == 127 then -- 拉尼斯地下監獄遺跡 56 - 57
		Buff = 29
	end

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
			AddBuff( OwnerID() , 506475 , Buff , -1 ) -- MP上限點數
			AddBuff( OwnerID() , 506598 , 0 , -1 ) -- MP上限%比
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Skill_Lv_AT_MAT()

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Buff 

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	if Zone == 110 then -- 卑劣岩窟 8 - 15
		Buff = 0 -- PowerLv = 1
	elseif Zone == 251 then -- 薩斯柯特地下密室 14 - 16
		Buff = 2
	elseif Zone == 250 then -- 風車密室 17 - 22
		Buff = 3
	elseif Zone == 201 or Zone == 102 then -- 血腥迴廊18 - 23、廢棄修道院 20 - 25
		Buff = 5
	elseif Zone == 103 or Zone == 113 then -- 鏡之墓城 35 - 38、冰雪矮人王國 35 - 40
		Buff = 9
	elseif Zone == 104 or Zone == 105 or Zone == 106 then -- 密法祭壇 40 - 42、蟻后巢穴 45 - 47、柏斯佩斯 45 -48
		Buff = 14
	elseif Zone == 107 or Zone == 108 then -- 喀里恩神殿 48 - 50、藏寶秘窟 48 - 50
		Buff = 19
	elseif Zone == 252 or Zone == 114  then -- 獨眼巢城50、冰雪矮人王國50
		Buff = 24
	elseif Zone == 126 or Zone == 115  then -- 海音之心簡易版 52 - 55、海音之心 52 - 55
		Buff = 29
	elseif Zone == 208 or Zone == 116 or Zone == 118 then -- 尤里士的噩夢 52 - 55、太初之所 53 - 55、水龍洞窟 53 - 55
		Buff = 34
	elseif Zone == 123 or Zone == 117 or Zone == 119 then  -- 遺民殿堂簡易版 55、遺民殿堂55、魔龍之巢55
		Buff = 39
	elseif Zone == 124 or Zone == 125 then -- 索雷爾頓區簡易版55 、魔人區簡易版55
		Buff = 44
	elseif Zone == 120 or Zone == 122 then -- 蛇人魔都索雷爾頓55、蛇人魔都 - 魔人區55
		Buff = 49
	elseif Zone == 127 then -- 拉尼斯地下監獄遺跡 56 - 57
		Buff = 39
	end

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
			AddBuff( OwnerID() , 506476 , Buff , -1 ) -- 攻擊加成點數
			AddBuff( OwnerID() , 506599 , 0 , -1 ) -- 攻擊加成%比
			return	-- 2012.10.25 新增
		end
	end
	
	-- 2012.10.25 新增，應廠商需求擴充
	AddBuff( OwnerID() , 623690 , 0 , -1 )	-- 攻擊加成固定10%
	--
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Skill_Lv_DEF_MDEF() -- 安排5個 技能Level 

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Buff

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	if Zone == 110 then -- 卑劣岩窟 8 - 15
		Buff = 0 -- PowerLv = 1
	elseif Zone == 251 then -- 薩斯柯特地下密室 14 - 16
		Buff = 2
	elseif Zone == 250 or Zone == 201 then -- 風車密室 17 - 22、血腥迴廊18-23
		Buff = 4
	elseif Zone == 102 then -- 廢棄修道院 20 - 25
		Buff = 9
--	elseif Zone == 205 then -- 海波拉古遺跡31 - 39
--		Buff = 11
	elseif Zone == 103 then -- 鏡之墓城 35 - 38
		Buff = 14
	elseif Zone == 113 then -- 冰雪矮人王國 35 - 40
		Buff = 17
	elseif Zone == 104 then -- 密法祭壇 40 - 42
		Buff = 19
	elseif Zone == 105 then -- 蟻后巢穴 45 - 47
		Buff = 22
	elseif Zone == 106 or Zone == 107 then -- 柏斯佩斯 45 -48、喀里恩神殿 48 - 50
		Buff = 24
	elseif Zone == 108 then -- 藏寶秘窟 48 - 50
		Buff = 27
	elseif Zone == 252 or Zone == 114  then -- 獨眼巢城50、冰雪矮人王國50
		Buff = 29
	elseif Zone == 126 then -- 海音之心簡易版 52 - 55
		Buff = 31
	elseif Zone == 115 or Zone == 208 then -- 海音之心 52 - 55、尤里士的噩夢 52 - 55 
		Buff = 34
	elseif Zone == 116 or  Zone == 118 then -- 太初之所 53 - 55、水龍洞窟 53 - 55
		Buff = 37
	elseif Zone == 123 then  -- 遺民殿堂簡易版 55
		Buff = 44
	elseif Zone == 117 or Zone == 119 then -- 遺民殿堂55、魔龍之巢55
		Buff = 49
	elseif Zone == 124 or Zone == 125 then -- 索雷爾頓區簡易版55 、魔人區簡易版55
		Buff = 54
	elseif Zone == 120 or Zone == 122 then -- 蛇人魔都索雷爾頓55、蛇人魔都 - 魔人區55
		Buff = 59
	elseif Zone == 127 then -- 拉尼斯地下監獄遺跡 56 - 57
		Buff = 39
	end

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
			AddBuff( OwnerID() , 506477 , Buff , -1 ) -- 防禦加成點數
			AddBuff( OwnerID() , 506600 , 0 , -1 ) -- 防禦加成%比
			return	-- 2012.10.25 新增
		end
	end
	-- 2012.10.25 新增，應廠商需求擴充
	AddBuff( OwnerID() , 623691 , 0 , -1 )	-- 防禦加成固定10%
	--
end
-------------------------------------------------------------------------------------------------------------------------