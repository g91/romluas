
-- 節慶共同buff給與

-- 給測試科用指令
Function lua_mika_festivalbuff(Bufflv)  --  pcall填 buff lv 
	local OID = OwnerID()

	-- 近戰系buff
	local showbuff1     = { 622406, 622407, 622408 }
	local hiddenbuff1 = { 622417, 622418 }
	-- 法系 buff
	local showbuff2     = { 622409, 622410, 622411 }
	local hiddenbuff2 = { 622419, 622420 }
	-- 特殊 buff
	local showbuff3    = 622412 
	local hiddenbuff3 = 622421 
	
	local R = Rand(100)+1

	local bufftime =  3600 -- 1hr 
	
	local jobgroup1 =  { 1, 2, 3 , 6 , 7 , 10}  -- 戰士 、遊俠 、影行、 騎士 、森林牧者、符文工匠
	local JOB = ReadRoleValue(OID, EM_RoleValue_VOC )   -- 主職職業

	local stime = 10

	ScriptMessage( OID, OID, 1, "[SC_EASTER_2012_BLESSING]" , C_SYSTEM )

	if R >= 74 then  -- 74 - 100
		for i = 1 , table.getn(jobgroup1)  do  -- 若主職等級是近戰職業
			if JOB == jobgroup1[i] then
				CastSpell(OID, OID, 850135 )   -- 物理系 施放特效
			--	Say(OID, "ATK BUFF 1")
				AddBuff(OID, showbuff1[1] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff1[1] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 1")
				CastSpell(OID, OID, 850136 )   -- 法系 施放特效
				AddBuff(OID, showbuff2[1] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff2[1] , Bufflv , bufftime )
			end
		end

	elseif  R  >= 47 and R <= 73  then -- 47 - 73
		for i = 1 , table.getn(jobgroup1)  do  -- 若主職等級是近戰職業
			if JOB == jobgroup1[i] then
			--	Say(OID, "ATK BUFF 2")
				CastSpell(OID, OID, 850135 )   -- 物理系 施放特效
				AddBuff(OID, showbuff1[2] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff1[2] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 2")
				CastSpell(OID, OID, 850136 )   -- 法系 施放特效
				AddBuff(OID, showbuff2[2] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff2[2] , Bufflv , bufftime )
			end
		end

	elseif  R  >= 20 and R <= 46  then   --  20 - 46
		for i = 1 , table.getn(jobgroup1)  do  -- 若主職等級是近戰職業
			if JOB == jobgroup1[i] then
			--	Say(OID, "ATK BUFF 3")
				CastSpell(OID, OID, 850135 )   -- 物理系 施放特效
				AddBuff(OID, showbuff1[3] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 3")
				CastSpell(OID, OID, 850136 )   -- 法系 施放特效
				AddBuff(OID, showbuff2[3] , Bufflv , bufftime )
			end
		end

	else  --  1 - 19
	--	Say(OID, "SP BUFF ")
		CastSpell(OID, OID, 850137 )   -- 特殊 施放特效
		AddBuff(OID, showbuff3 , Bufflv , bufftime )
		AddBuff(OID, hiddenbuff3 , Bufflv , bufftime )
	end

end


-- 各別活動給
Function lua_mika_festivalbuffgive(OID, Bufflv)  --  pcall填 buff lv 

	-- 近戰系buff
	local showbuff1     = { 622406, 622407, 622408 }
	local hiddenbuff1 = { 622417, 622418 }
	-- 法系 buff
	local showbuff2     = { 622409, 622410, 622411 }
	local hiddenbuff2 = { 622419, 622420 }
	-- 特殊 buff
	local showbuff3    = 622412 
	local hiddenbuff3 = 622421 
	
	local R = Rand(100)+1

	local bufftime =  3600 -- 1hr 
	
	local jobgroup1 =  { 1, 2, 3 , 6 , 7 , 10}  -- 戰士 、遊俠 、影行、 騎士 、森林牧者、符文工匠
	local JOB = ReadRoleValue(OID, EM_RoleValue_VOC )   -- 主職職業

	local stime = 10

	ScriptMessage( OID, OID, 1, "[SC_EASTER_2012_BLESSING]" , C_SYSTEM )

	if R >= 74 then  -- 74 - 100
		for i = 1 , table.getn(jobgroup1)  do  -- 若主職等級是近戰職業
			if JOB == jobgroup1[i] then
				CastSpell(OID, OID, 850135 )   -- 物理系 施放特效
			--	Say(OID, "ATK BUFF 1")
				AddBuff(OID, showbuff1[1] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff1[1] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 1")
				CastSpell(OID, OID, 850136 )   -- 法系 施放特效
				AddBuff(OID, showbuff2[1] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff2[1] , Bufflv , bufftime )
			end
		end

	elseif  R  >= 47 and R <= 73  then -- 47 - 73
		for i = 1 , table.getn(jobgroup1)  do  -- 若主職等級是近戰職業
			if JOB == jobgroup1[i] then
			--	Say(OID, "ATK BUFF 2")
				CastSpell(OID, OID, 850135 )   -- 物理系 施放特效
				AddBuff(OID, showbuff1[2] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff1[2] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 2")
				CastSpell(OID, OID, 850136 )   -- 法系 施放特效
				AddBuff(OID, showbuff2[2] , Bufflv , bufftime )
				AddBuff(OID, hiddenbuff2[2] , Bufflv , bufftime )
			end
		end

	elseif  R  >= 20 and R <= 46  then   --  20 - 46
		for i = 1 , table.getn(jobgroup1)  do  -- 若主職等級是近戰職業
			if JOB == jobgroup1[i] then
			--	Say(OID, "ATK BUFF 3")
				CastSpell(OID, OID, 850135 )   -- 物理系 施放特效
				AddBuff(OID, showbuff1[3] , Bufflv , bufftime )
				Break
			end
			if i ==  table.getn(jobgroup1) then
			--	Say(OID, "MAGIC BUFF 3")
				CastSpell(OID, OID, 850136 )   -- 法系 施放特效
				AddBuff(OID, showbuff2[3] , Bufflv , bufftime )
			end
		end

	else  --  1 - 19
	--	Say(OID, "SP BUFF ")
		CastSpell(OID, OID, 850137 )   -- 特殊 施放特效
		AddBuff(OID, showbuff3 , Bufflv , bufftime )
		AddBuff(OID, hiddenbuff3 , Bufflv , bufftime )
	end

end

-- test
function lua_mika_festivalbuff_check()
	local OID = OwnerID()  
--< OID後方請請填入該活動中是玩家的變數,  例如 Local OID = player

	local allcount = 4  -- 所有新活動數量
	local count = 0
	local keylist =  {
			546288,	--拉比兔防衛戰
			546257,	--拉比追緝令
			546264,	--夢幻彩雞
			546232		--彩蛋塗鴉
			}
	for i =  1 , table.getn(keylist) do
		if Checkflag(OID , keylist[i] )  == true then
			count = count +1
		end
		if i == table.getn(keylist) then
			if count == allcount then -- 如果完成全部
				lua_mika_festivalbuffgive(OID, 0 )  -- 2012. 4月春雨節活動 為等級0
			end
		end
	end
end