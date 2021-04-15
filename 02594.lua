
--Serverscript  702594

-- 測試用劇情 
-- 2011暖冬節獎勵兌換npc
function lua_mika_xmas2011_reward()
	local OID = OwnerID()
	local keyid = 545688  --今天有領取過晶砂
	local checkkey = Checkflag(OID, keyid )
	local winkeyid  = 546141   -- 打贏boss
	local checkwinkey = Checkflag(OID, winkeyid )

	SetSpeakDetail( OID , "hello" )  

	if checkwinkey == true then  -- 有打贏boss 
		AddSpeakOption( OID , OID , "[SC_FIREDAY_EV1_21]" , "lua_mika_xmas2011_reward02" , 0)   --  領取獎勵
	end
end

-- 2011暖冬節獎勵兌換 打贏王領獎
function lua_mika_xmas2011_reward02()
	local OID = OwnerID()
	local keyid = 545688  --今天有領取過晶砂
	local checkkey = Checkflag(OID, keyid )
	local winkeyid  = 546141   -- 打贏boss

	-- 晶砂獎勵
	local itemid = 209389 -- 熔解晶砂
	local count = 15
	local rewardid = 725527  -- 額外追加獎	
	-- 一般獎勵
	local ticketid = 206437  --  我是乖寶寶證書

	-- 活動分數兌換獎
	local score = ReadRoleValue(OID, EM_RoleValue_Register2 ) 

	CloseSpeak(OID)

	-- 活動分數兌換獎


	local ticketcount 
		if score >= 1 and score <=  50 then  -- 0 ~ 50
			ticketcount = 1
			GiveBodyItem(OID, ticketid , ticketcount  )
		elseif score >= 51 and score <= 100 then -- 6 ~ 10
			ticketcount = 2
			GiveBodyItem(OID, ticketid , ticketcount  )
		elseif score >=101 and score <= 200 then -- 11 ~ 20
			ticketcount = 3
			GiveBodyItem(OID, ticketid , ticketcount  )
		elseif score >= 201  then --  
			ticketcount = 5
			GiveBodyItem(OID, ticketid , ticketcount  )
		end

	WriteRoleValue(OID, EM_RoleValue_Register2, 0 )
	local R = ReadRoleValue(OID, EM_RoleValue_Register2 )
	--Say(OID, "R = "..R )

	-- 每日晶砂獎
	if checkkey == false then
		GiveBodyItem(OID, itemid, count )  -- 給晶砂
		Setflag(OID, keyid , 1 )   -- 給予今天領取過晶砂的KEY
	end

	-- 打贏boss晶砂追加獎
	GiveBodyItem(OID, rewardid , 1  )
	Setflag(OID, winkeyid , 0 )   --  刪除打贏boss的key 

--	Say(OID, "end")  

end


-- 以下為測試指令

function lua_mika_xmas2011_test(value)
	local OID = OwnerID()
--	local value
	if value == 0 then
		WriteRoleValue(OID, EM_RoleValue_Register2, 0 )
		local R = ReadRoleValue(OID, EM_RoleValue_Register2 )
		Say(OID, "R = "..R )
	else
		AddRoleValue(OID, EM_RoleValue_Register2 , value )
		local R = ReadRoleValue(OID, EM_RoleValue_Register2 )
		Say(OID, "R = "..R )
	end

end

-- 直接讓NPC-塔蘭西亞 (120085)變成活動結束的狀態
function lua_mika_xmas2011_R()
	local OID = OwnerID()
	local Fairy = LuaFunc_SearchNPCbyOrgID( OID , 120085, 500 , 0)       --Fairy
--	Say(Fairy, "I am Fairy" )
	WriteRoleValue(Fairy, EM_RoleValue_Register1 , 2 )  
	local R = ReadRoleValue( Fairy , EM_RoleValue_Register1 )  
	Say(Fairy, "R= "..R )
end