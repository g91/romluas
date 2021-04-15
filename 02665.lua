
-- 702665

-- 特殊寵定時跑劇情
function lua_mika_musicpet_test()
	local OID = OwnerID()

	Beginplot(OID, "Hao_Pet_SetModeEx", 0 )
	while true do 
		Addbuff(OID, 503012, 0 , 5)
		sleep(150)
	end
end

function lua_mika_musicpet_01()	-- 音符岩鼠紅
	local OID = OwnerID()
	local key = 546504  -- 紅色岩鼠每日重置key
	local buff  =  508368  -- buff 靈性之伴 

	if CheckFlag( OID, key ) == true then
		return false
	else
		Setflag( OID, key, 1 )   --   給予每日keyitem 
		AddBuff( OID, buff, 0,7200)  -- 給效果buff  
	end
end


function lua_mika_musicpet_02()	-- 音符岩鼠藍
	local OID = OwnerID()
	local key = 546505 -- 藍色岩鼠每日重置key
	local buff  =  508368  -- buff 靈性之伴 

	if CheckFlag( OID, key ) == true then
		return false
	else
		Setflag( OID, key, 1 )   --   給予每日keyitem 
		AddBuff( OID, buff, 0,7200)  -- 給效果buff  
	end
end