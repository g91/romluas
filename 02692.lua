
-- 星座寵物 
-- 下列劇情掛在 基本法術 - 寵物被召喚出來 初始lua  

-------------------------------------  lv2 ------------------------------------------------

function Lua_mika_starpet_bufflv2_1()
	local Pet = OwnerID()
	local master = ReadRoleValue(pet, EM_RoleValue_OwnerGUID )
	local petid  = ReadRoleValue(pet, EM_RoleValue_OrgID )  -- PET ORGID
	local todaykeyid = 546482  -- Lv2星座寵每日key
	local petlist = {
		106925, 106926, 106927,  106928,  106929,  106930,  
		106931,  106932, 106933, 106934, 106935, 106936,
		106951
			}

--	say(pet, "petorgid ="..petid )
--	say(master, "master")
	Beginplot(Pet, "Hao_Pet_SetModeEx", 0 )
	if CheckFlag( master, todaykeyid ) == true then
		CastSpell(pet, pet, 499362 )  -- 寵物登場效果
		return false
	else

		for i = 1 , table.getn(petlist) do
			if petid == petlist[i] then
				local month = i
			--	say(pet, "month = "..month )
				CallPlot( Pet , "Lua_mika_starpet_bufflv2_2" , month )	
			end
		end
	end
end

function Lua_mika_starpet_bufflv2_2(month)
	local Pet = OwnerID()
	local master = ReadRoleValue(pet, EM_RoleValue_OwnerGUID )
	local petid  = ReadRoleValue(pet, EM_RoleValue_OrgID )  -- PET ORGID
	local keycount = 6
	local todaykeyid = 546482  -- Lv2星座寵每日key

	-- lv2 --13個月 X 6種技能 對應Key
	local lv2key = { 
		 { 546301 ,546302 ,546303, 546304, 546305, 546306  },
		 { 546307, 546308 ,546309, 546310, 546311, 546312  },
		 { 546313 ,546314 ,546315, 546316, 546317, 546318  },
	 	 { 546319, 546320, 546321, 546322, 546323, 546324  },
		 { 546325, 546326, 546327, 546328, 546329, 546330  },
		 { 546331, 546332, 546333, 546334, 546335, 546336  },
		 { 546337, 546338, 546339, 546340, 546341, 546342  },
		 { 546343, 546344, 546345, 546346, 546347, 546348 },
		 { 546349, 546350, 546351, 546352, 546353, 546354 },
		 { 546355, 546356, 546357, 546358, 546359, 546360 },
		 { 546361, 546362, 546363, 546364, 546365, 546366 },
		 { 546367, 546368, 546369, 546370, 546371, 546372 },
		 { 547543, 547544, 547545, 547546, 547547, 547548 }
			}  


	local lv2buff 
		if month ~= 13 then  -- 1~ 12個月能力
			lv2buff = {622524, 622525, 622526, 622527 , 622528, 622529 }   -- 6種
		else  -- 第13隻能力
			lv2buff = { 622530, 622531, 622532, 622533, 622534, 622535 }   -- 6種
		end

--	say(pet, month )
	sleep(10)
	for i = 1 , keycount do
		if CheckFlag( master, Lv2key[month][i] ) == true then
			CastSpell(Pet, master, 850124 )  -- 外觀特效
			AddBuff( master, lv2buff[i], 0,10800)  -- 給效果buff   3hr 
		--	Say(master, "lv2key = "..i..","..Lv2key[month][i]..", lv2buff ="..lv2buff[i] )
			break
		end

	end
	Setflag( master, todaykeyid, 1 )   --   給予  Lv2星座寵每日key

end

-------------------------------------  lv3 ------------------------------------------------

function Lua_mika_starpet_bufflv3_1()
	local Pet = OwnerID()
	local master = ReadRoleValue(pet, EM_RoleValue_OwnerGUID )
	local petid  = ReadRoleValue(pet, EM_RoleValue_OrgID )  -- PET ORGID
	local todaykeyid = 546483  -- Lv3星座寵每日key
	local petlist = {
		106937, 106938, 106939,  106940,  106941,  106942,  
		106943,  106944, 106945, 106946, 106947, 106948
			}

--	say(pet, "petorgid ="..petid )
--	say(master, "master")
	Callplot(OwnerID(), "Hao_Pet_SetModeEx", 0 )
	if CheckFlag( master, todaykeyid ) == true then
		CastSpell(pet, pet, 499363 )  -- 寵物登場效果
		return false
	else

		for i = 1 , table.getn(petlist) do
			if petid == petlist[i] then
				local month = i
			--	say(pet, "month = "..month )
				CallPlot( Pet , "Lua_mika_starpet_bufflv3_2" , month )	
			end
		end
	end
end

function Lua_mika_starpet_bufflv3_2(month)
	local Pet = OwnerID()
	local master = ReadRoleValue(pet, EM_RoleValue_OwnerGUID )
	local petid  = ReadRoleValue(pet, EM_RoleValue_OrgID )  -- PET ORGID
	local keycount = 9
	local todaykeyid = 546483  -- Lv3星座寵每日key

	-- lv3 --12個月 X 9種技能 對應Key
	local lv3key = { 
		{ 546373, 546374, 546375, 546376, 546377, 546378, 546379, 546380, 546381 },
		{ 546382, 546383, 546384, 546385, 546386, 546387, 546388, 546389, 546390 },
		{ 546391, 546392, 546393, 546394, 546395, 546396, 546397, 546398, 546399 },
		{ 546400, 546401, 546402, 546403, 546404, 546405, 546406, 546407, 546408 },
		{ 546409, 546410, 546411, 546412, 546413, 546414, 546415, 546416, 546417 },
		{ 546418, 546419, 546420, 546421, 546422, 546423, 546424, 546425, 546426 },
		{ 546427, 546428, 546429, 546430, 546431, 546432, 546433, 546434, 546435 },
		{ 546436, 546437, 546438, 546439, 546440, 546441, 546442, 546443, 546444 },
		{ 546445, 546446, 546447, 546448, 546449, 546450, 546451, 546452, 546453 },
		{ 546454, 546455, 546456, 546457, 546458, 546459, 546460, 546461, 546462 },
		{ 546463, 546464, 546465, 546466, 546467, 546468, 546469, 546470, 546471 },
		{ 546472, 546473, 546474, 546475, 546476, 546477, 546478, 546479, 546480 }
			}  

	local lv3buff = { 622530, 622531, 622532, 622533, 622534, 622535, 622536, 622537, 622538 }

--	say(pet, month )

	sleep(10)
	for i = 1 , keycount do
		if CheckFlag( master, Lv3key[month][i] ) == true then
			CastSpell(Pet, master, 850124 )  -- 外觀特效
			AddBuff( master, lv3buff[i], 0,10800)  -- 給效果buff   3hr 
		--	Say(master, "lv3key = "..i..","..Lv3key[month][i]..", lv3buff ="..lv3buff[i] )
			break
		end

	end
	Setflag( master, todaykeyid, 1 )   --   給予  Lv3星座寵每日key

end