function lua_star_randomprize(partymember)
	local random_reward = rand(99)
	if CheckBuff( partymember , 502159) == true then              		-----擁有商城buff玩家
			
			random_reward = rand(4)                                        ----商城物品骰寶機率設定用
			--random_reward = 0                                               ----測試跑馬燈用
			CancelBuff( partymember , 502159 )
	end	
	if random_reward >= 70 and random_reward <= 99 then
		GiveBodyItem( partymember , 202984, 3 )  --破碎的火靈鑄塊
		GiveBodyItem( partymember , 202986, 6 )  --紫旋碎玉
		GiveBodyItem( partymember , 202989, 6 )  --利卡碎石	
	elseif random_reward >= 40 and random_reward < 70 then		
		GiveBodyItem( partymember , 202985, 3 )  --破碎的水靈鑄塊
		GiveBodyItem( partymember , 202986, 6 )  --紫旋碎玉
		GiveBodyItem( partymember , 202989, 6 )  --利卡碎石
	elseif random_reward >= 21 and random_reward < 40 then
		GiveBodyItem( partymember , 202984, 3 )  --破碎的火靈鑄塊
		GiveBodyItem( partymember , 202988, 3 )  --炙燄晶砂
		GiveBodyItem( partymember , 202987, 3 )  --潮幽晶砂
		GiveBodyItem( partymember , 202986, 3 )  --紫旋碎玉
		GiveBodyItem( partymember , 202989, 3 )  --利卡碎石
		GiveBodyItem( partymember , 203014, 3 )  --鎚牙面具上的寶石
	elseif random_reward >= 2 and random_reward < 21 then
		GiveBodyItem( partymember , 202985, 3 )  --破碎的水靈鑄塊
		GiveBodyItem( partymember , 202988, 3 )  --炙燄晶砂
		GiveBodyItem( partymember , 202987, 3 )  --潮幽晶砂
		GiveBodyItem( partymember , 202986, 3 )  --紫旋碎玉
		GiveBodyItem( partymember , 202989, 3 )  --利卡碎石
		GiveBodyItem( partymember , 203013, 3 )  --庫柏王冠的碎片
	elseif random_reward == 1 then	
		GiveBodyItem( partymember , 202984, 3 )  --破碎的火靈鑄塊
		GiveBodyItem( partymember , 203014, 3 )  --鎚牙面具上的寶石
		GiveBodyItem( partymember , 203013, 3 )  --庫柏王冠的碎片			
		GiveBodyItem( partymember , 203017, 3 )  --元素結晶
	elseif random_reward == 0 then	
		local winner = GetName( partymember )
		local string_prize = "[SC_ZONE250PRIZE_0][$SETVAR1="..winner.."]"            ----的身上散發出符文結晶的能量
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( partymember , 1 , string_prize )                           ----骰到大獎跑馬燈		
		end
		GiveBodyItem( partymember , 202985, 3 )  --破碎的水靈鑄塊
		GiveBodyItem( partymember , 203014, 3 )  --鎚牙面具上的寶石
		GiveBodyItem( partymember , 203013, 3 )  --庫柏王冠的碎片
		GiveBodyItem( partymember , 203017, 3 )  --元素結晶
		GiveBodyItem( partymember , 203018, 1 )  --符文結晶
	end			
end