function Lua_Hao_Pumpkin_GhostParade( Select )	-- 測試南瓜節百鬼遊行，報名後，直接讓遊戲開始。
	-- 101289 男 、 101290 女
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )

	if  Count ~= 0 then
		for i= 1 , Count , 1 do
			local ID = GetSearchResult()
		--	Obj=Role:New(ID)
		--	if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
			--	for j = 1 , table.getn( NPC ) , 1 do
					if Select == 0 and Name == 101289 then  --若為陣列中的值
						BeginPlot( ID , "yuyu_111612_0" , 0 )
						break
					elseif Select == 1 and Name == 101290 then  --若為陣列中的值
						BeginPlot( ID , "yuyu_111611_0" , 0 )
						break
					end
			--	end
		--	end
		end
	end
end

function Lua_na_2008_tourist_check(num)	--百鬼大遊行NPC戰鬥檢查劇情
	local Leader = OwnerID()
	local _timer = 0;
	While true do
		sleep(10)
		_timer = _timer +1;
--		DebugMsg( 0, 0, "_timer =".._timer )
--		if CheckID( Monster01[1] ) == false and CheckID( Monster01[2] ) == false and CheckID( Monster01[3] ) == false and CheckID( Monster01[4] ) == false then
		local GOGO = ReadRoleValue( Leader , EM_RoleValue_Register  )  
--		SAY( Leader , "GO = "..GOGO)
--		DebugMsg( 0, 0, "GOGO="..GOGO)
		if GOGO >= num or _timer >= 600 then
			SetStopAttack( Leader) 
			ScriptMessage( Leader , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --好囉！我們走吧！
			Say( Leader , "[SC_YU_HW_111611_2]" )  
			WriteRoleValue(Leader ,EM_RoleValue_IsWalk , 0 ) --奔跑
		--	SetFightMode(  Leadergirl , 0, 1, 0, 0 )

			SetModeEx( Leader  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Leader , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( Leader  , EM_SetModeType_Strikback, false )--反擊
			WriteRoleValue(  Leader  , EM_RoleValue_Register , 0 ) --清空導遊
			break
		end
	end
end



function Lua_na_2008_monster_check()
	local Owner = OwnerID()
	local NPC = ReadRoleValue( Owner, EM_RoleValue_PID)
	local Time = 0
--	Say( Owner , "CHECK!" )
	if CheckID( NPC) == true  then
		SetAttack( Owner , NPC)
		DebugMsg( 0,0, "ghost attack!")
	end	
--	DebugMsg( 0, 0, "ATTACK"..NPC)
end


function Lua_na_2008_monster_check2()
	local Owner = OwnerID()
	local Time = 0
	while true do
		local NPC_ATTACK = ReadRoleValue( Owner , EM_RoleValue_IsAttackMode)
	--	Say( Owner , "TIME = "..Time )
		if NPC_ATTACK == 0 then
			Time = Time + 1
			if Time == 30 then
				DebugMsg( 0,0, "ghost delete!")
				DelObj( Owner)
				break
			end
		else
			Time = 0 
		end
		sleep(10)
	end	
end


function Lua_na_2008_test_reg()
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 30)
	for i = 0 , #NPC do
		local Name = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
		local REG = ReadRoleValue( NPC[i] , EM_RoleValue_Register)
		ScriptMessage( NPC[i] , Owner, 0, "I'm "..Name.." , MY REG = ".. REG,  0)
	end
end

function Lua_na_2008_tourist_check2(num) --防呆，戰鬥階段跑的劇情
	local Owner = OwnerID()
	local Time = 0
	sleep(100)
	DebugMsg( 0,0," check in" )
	while true do  
		local attack = ReadRoleValue( Owner , EM_RoleValue_IsAttackMode )
		local Reg = ReadRoleValue( Owner , EM_RoleValue_Register) 
		if attack == 0  and Reg ~= 0 then   --判斷是否進入戰鬥 1= 是 0= 否
			DebugMsg( 0,0,"OCT_event tourist stop count = "..Time )
			Time = Time+1	
			if Time == 15 then
				WriteRoleValue( Owner, EM_RoleValue_Register , num )
				break
			end
		elseif attack == 0 and Reg == 0 then
			DebugMsg( 0,0," check off" )
			break			 
		end
		sleep(10)
	end
end