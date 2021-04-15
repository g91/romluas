-- Z21 Quest  利用天敵
--物品 - 裝蝙蝠的籠子(240580) 劇情

--物品 - 裝蝙蝠的籠子(240580)  使用檢查
function lua_Q424626_item_check()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )	--讀取血量
	local NowHP = ReadRoleValue(  TargetID() , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP	--血量百分比
	local Obj = OwnerID()
	if 	CheckAcceptQuest(Obj,424626) == true or
		CheckAcceptQuest(Obj,424627) == true or
		CheckAcceptQuest(Obj,424642) == true then  -- 有接此任務
		if ( CheckID( TargetID() ) == false ) then  --沒有對象
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
			return false
		elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 ) --使用目標錯誤！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 ) 
			return false
		else  
			if OrgID == 106078  then   -- 對象正確
				if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead ) == 1 then   -- 如果目標已死的話
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_493625_2]" , 0 )	--目標已死亡
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_493625_2]"  , 0 )
					return false

				else
					if  HPPercent > 0.5  then  -- 目標血量 多於50 %
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424626_1]" , 0 ) --蝙蝠還很靈活，從你的掌握中逃開
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424626_1]"  , 0 )	
						return false
					else	
						  -- 成功
						return true
					end
				end

			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424142_1]" , 0 )  --使用目標錯誤！
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424142_1]" , 0 )
				return false
			end

		end
	else
		ScriptMessage( OwnerID(),  OwnerID(), 1, "[SC_424626_2]" , 0 )  -- 沒有此任務
		ScriptMessage( OwnerID(),  OwnerID(), 0, "[SC_424626_2]" , 0 )  
		return false
	end

end


--物品 - 裝蝙蝠的籠子(240580)  使用效果
function lua_Q424626_item_use()
	local Monster = TargetID()

	DW_QietKillOne(OwnerID(), 106118  )
	CallPlot( Monster,"LuaFunc_ResetObj", Monster)
end

----------------------------------------------------------------------------------
-- Z21 Quest  個人隱私 ( 424564 ) /  維護隱私 (424565  , 424638)

-- 請使用OBJEDIT 建立 119245,  並在初始劇情掛上  lua_Q424564_01

-- 隱藏物件119245 設定範圍劇情
function lua_Q424564_01()
	SetPlot( OwnerID() , "range" , "lua_Q424564_02" , 120 )
end

-- 隱藏物件119245 範圍觸發劇情內容
function lua_Q424564_02()
	local Obj = OwnerID()
	if CheckCompleteQuest(Obj,424412)	then
		local RandResult = DW_Rand(100)
		if 	RandResult>50	then
			SetPlot( TargetID() , "range" , "" , 0 )  -- 關閉範圍劇情
			local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
			local monster = DW_CreateObjEX("obj",106079,TargetID(),1,70)
			SetFightMode( monster , 1 , 1 , 1 , 1 )  -- 索敵, 移動, 逃跑, 砍殺
			AddToPartition( monster , RoomID )
			WriteRoleValue( monster , EM_RoleValue_Register,  TargetID() )
			local Box = TargetID();
			SetAttack(monster,Obj);
			CallPlot( monster, "lua_Q424564_03", Box )  -- 掃描自己是否在戰鬥中
			Setplot( monster, "dead", "lua_Q424564_05", 0 )  -- 死亡劇情
		end
	end
end

-- 賽西蒙德的監視者(106079 出生後掃描自己是否戰鬥中
function lua_Q424564_03(Box)
	sleep(300)
	while true do
		Sleep(30)	-- 每3秒檢查一次
		if HateListCount(OwnerID())==0  then  --檢查是否離開戰鬥
			lua_Q424564_04(Box);
		end
	end
end

-- 怪物離開戰鬥後 觸發劇情
function lua_Q424564_04(Box)
	SetPlot( box, "range" , "lua_Q424564_02" , 120 )
	Delobj(OwnerID())  --  刪除怪
end

-- 怪物死亡後 觸發劇情
function lua_Q424564_05()
	local Box = ReadRoleValue( OwnerID(), EM_RoleValue_Register )
	CallPlot(Box,"LuaFunc_ResetObj",Box); 
	return true;
end