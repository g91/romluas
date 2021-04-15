function A_B_CallHelpMonster( Player , HelpMonsterID , HelpRange )
	local X = ReadRoleValue(  Player , EM_RoleValue_X )
	local Y = ReadRoleValue(  Player , EM_RoleValue_Y )
	local Z = ReadRoleValue(  Player , EM_RoleValue_Z )
	local HelpAttack = "false"
	local Obj
	local Count = SetSearchRangeInfo( Player, HelpRange )
	local HelpMonster = 0
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() == True and Obj:OrgID() == HelpMonsterID and Obj:RoomID() == ReadRoleValue( Player , EM_RoleValue_RoomID ) then
			HelpMonster = ID
		end
	end	
	if CheckID( HelpMonster ) == true then
		HelpAttack = "true"
	else
		HelpMonster = -1
	end

	return HelpAttack , HelpMonster , X , Y , Z
end

function Lua_ArFexCheckIsDead(MonsterGroup,amount)
	local NewDead = 0
	for i = 1 , amount, 1 do
		if ReadRoleValue ( MonsterGroup[i] , EM_RoleValue_IsDead ) == 1 then
			NewDead = NewDead + 1
		end
	end
	if NewDead == amount then
		return true
	else
		return false
	end
end

function LuaN_Ai_ArFaLon()	--阿法隆(ArFaLon)
	SetPlot( OwnerID() , "dead" , "Lua_101018_deadlog_1" , 0 )
	
	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local HelpMonsterID = 101019	-- 巴爾德(Bard)
	local HelpRange = 300
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)

--	Say(OwnerID(),MaxHP)
	local CheckTime = 10	-- 一秒檢查一次
	local SecondMagicID1 = 492232	--破陣擊
	local SecondMagicID2 = 491989	--狂暴
	local SecondMagicLV = 0
	local M = 0
	local N = 0
	local SayString = {	"[SC_ARFALON_1]",
			"[SC_ARFALON_2]",
			"[SC_ARFALON_3]",
			"[SC_ARFALON_4]",
			"[SC_ARFALON_5]"}
	local Door = {}
	if ArFaLonandBard == nil then
		ArFaLonandBard = {}
	end
	if ArFaLonandBard[RoomID] ~= 1 then
		ArFaLonandBard[RoomID] = 1
	end
	if ArFaLonandBardDoor == nil then
		ArFaLonandBardDoor = {}
	end
	if ArFaLonandBardDoor[RoomID] ~= 1 then
		ArFaLonandBardDoor[RoomID] = 0
	end
	if DoorStatus == nil then
		DoorStatus = {}
	end
	if DoorStatus[RoomID]  ~= "Open" then
		DoorStatus[RoomID] = "Open"
	end
	local Start = 0
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			if Start == 0 then
				ArFaLonandBard[RoomID]  = ArFaLonandBard[RoomID]  + 1
				DebugMsg( 0, RoomID ,"ArFaLonandBard4 = "..ArFaLonandBard[RoomID])
				Start = 1
			end
			if CheckBuff( OwnerID() , 502698 ) == false then
				AddBuff( OwnerID() , 502698 , 50 , -1 )
			end
			if ArFaLonandBard[RoomID] >= 2 then
				if DoorStatus[RoomID]  == "Open" then
						DebugMsg( 0, RoomID ,"Door Create1")
						DoorStatus[RoomID]  = "Close"
--						Say(OwnerID(),"Close")
						Door[1]=CreateObj( 112052, 4297, 96, 4621, 0, 1 )
						ArFaLonandBardDoor[RoomID] = Door[1]
						--WriteRoleValue( OwnerID() , EM_RoleValue_Register , Door[1] )
						DebugMsg( 0, RoomID ,"DOOR = "..ArFaLonandBardDoor[RoomID])
					for i=1, table.getn(Door) do
						SetModeEx( Door[i]   , EM_SetModeType_Fight , false )--可砍殺攻擊
						SetModeEx( Door[i]   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Door[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
						SetModeEx( Door[i]   , EM_SetModeType_Obstruct, true )--阻擋
						SetModeEx( Door[i]   , EM_SetModeType_Mark, false )--標記
						SetModeEx( Door[i]   , EM_SetModeType_Move, false )--移動
						SetModeEx( Door[i]   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEx( Door[i]   , EM_SetModeType_ShowRoleHead, false )--頭像框
						SetModeEx( Door[i]   , EM_SetModeType_HideName, false )--名稱
						SetModeEx( Door[i]   , EM_SetModeType_Gravity, false )--重力
						AddToPartition( Door[i] , RoomID )
					end
				end
			end
			MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
--			Say(OwnerID(),MaxHP)
--				Say( OwnerID() , "M = "..M)
			if N >= 30 then
				ScriptMessage(OwnerID() , -1 ,2, SayString[Rand(5)+1] , C_SYSTEM )
				N = 0
			end
			if M >= 2 then
				local HelpAttack , HelpMonster , X , Y , Z = A_B_CallHelpMonster( OwnerID() , HelpMonsterID , HelpRange )	
				--Say(OwnerID(),HelpMonster)
				if HelpAttack == "true" then
					if ReadRoleValue( HelpMonster , EM_RoleValue_AttackTargetID ) == 0 then
						SetAttack( HelpMonster , AttackTarget )
					end
					CastSpellLV( OwnerID(), OwnerID(), SecondMagicID1 , SecondMagicLV )
				end
				M = 0
			end
			-- 血 3/4 
			if ( HPPercent <= 0.75 ) and ( HP75 == "false" ) then
				--Say( OwnerID() , "NowHP = 75%")
				local HelpAttack , HelpMonster , X , Y , Z = A_B_CallHelpMonster( OwnerID() , HelpMonsterID , 600 )
				if HelpAttack == "true" then
					ScriptMessage(OwnerID() , -1 ,2, "[SC_TWOWALL]" , C_SYSTEM ) --我來了
					local HelpAttackID = ReadRoleValue( HelpMonster , EM_RoleValue_AttackTargetID )
					CastSpellLV( HelpMonster, HelpMonster, 491905 , 1 )
					Sleep(10)
					SetPos(HelpMonster, X, Y, Z, 0)
					Sleep(10)
					AddBuff( HelpAttackID , 502435 , 1 , -1 )
					CastSpellLV( OwnerID(), OwnerID(), SecondMagicID2 , 1 )
					HP75 = "true"
				end
			end
			-- 血 2/4 
			if ( HPPercent <= 0.50 ) and ( HP50 == "false" ) then
				--Say( OwnerID() , "NowHP = 50%")
				local HelpAttack , HelpMonster , X , Y , Z = A_B_CallHelpMonster( OwnerID() , HelpMonsterID , 600 )
				if HelpAttack == "true" then
					ScriptMessage(OwnerID() , -1 ,2, "[SC_TWOWALL]" , C_SYSTEM ) --我來了
					local HelpAttackID = ReadRoleValue( HelpMonster , EM_RoleValue_AttackTargetID )
					CastSpellLV( HelpMonster, HelpMonster, 491905 , 1 )
					Sleep(10)
					SetPos(HelpMonster, X, Y, Z, 0)
					Sleep(10)
					AddBuff( HelpAttackID , 502435 , 1 , -1 )
					CastSpellLV( OwnerID(), OwnerID(), SecondMagicID2 , 1 )
					HP50 = "true"
				end
			end
			-- 血 1/4 
			if ( HPPercent <= 0.25 ) and ( HP25 == "false" ) then
				--Say( OwnerID() , "NowHP = 25%")
				local HelpAttack , HelpMonster , X , Y , Z = A_B_CallHelpMonster( OwnerID() , HelpMonsterID , 600 )
				if HelpAttack == "true" then
					ScriptMessage(OwnerID() , -1 ,2, "[SC_TWOWALL]" , C_SYSTEM ) --我來了
					local HelpAttackID = ReadRoleValue( HelpMonster , EM_RoleValue_AttackTargetID )
					CastSpellLV( HelpMonster, HelpMonster, 491905 , 1 )
					Sleep(10)
					SetPos(HelpMonster, X, Y, Z, 0)
					Sleep(10)
					AddBuff( HelpAttackID , 502435 , 1 , -1 )
					CastSpellLV( OwnerID(), OwnerID(), SecondMagicID2 , 1 )
					HP25 = "true"
				end
			end
			M = M + 1
			N = N + 1
		else
			if Start == 1 then
				ArFaLonandBard[RoomID] = ArFaLonandBard[RoomID] - 1
				DebugMsg( 0, RoomID ,"ArFaLonandBard3 = "..ArFaLonandBard[RoomID])
				Start = 0
			end
			HP75 = "false"		-- 非戰鬥，歸零記號
			HP50 = "false"	
			HP25 = "false"
			if ArFaLonandBard[RoomID] == 1 and DoorStatus[RoomID]  == "Close"then
				DebugMsg( 0, RoomID ,"AttackMode Leave ")
				DelObj(ArFaLonandBardDoor[RoomID])
				DoorStatus[RoomID]  = "Open"
			end			
			M = 0
		end
	Sleep( CheckTime )
	end
end

function LuaN_Ai_Bard()	--巴爾德(Bard)
	SetPlot( OwnerID() , "dead" , "Lua_101019_deadlog_1" , 0 )

	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local HelpMonsterID = 101018	-- 阿法隆(ArFaLon)
	local HelpRange = 300
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)

	local CheckTime = 10	-- 一秒檢查一次
	local SecondMagicID1 = 492232	--爆裂旋風
	local SecondMagicID2 = 491989	--狂暴
	local SecondMagicLV = 0
	local M = 0
	local N = 0
	local SayString = {	"[SC_BARD_1]",
			"[SC_BARD_2]",
			"[SC_BARD_3]",
			"[SC_BARD_4]",
			"[SC_BARD_5]"}
	local Door = {}
	if ArFaLonandBard[RoomID] ~= 1 then
		ArFaLonandBard[RoomID] = 1
	end
	if ArFaLonandBardDoor[RoomID] ~= 1 then
		ArFaLonandBardDoor[RoomID] = 0
	end
	if DoorStatus[RoomID]  ~= "Open" then
		DoorStatus[RoomID]  = "Open"
	end
	local Start = 0
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			if Start == 0 then
				ArFaLonandBard[RoomID] = ArFaLonandBard[RoomID] + 1
				DebugMsg( 0, RoomID ,"ArFaLonandBard4 = "..ArFaLonandBard[RoomID])
				Start = 1
			end
			if CheckBuff( OwnerID() , 502698 ) == false then
				AddBuff( OwnerID() , 502698 , 50 , -1 )
			end
			if ArFaLonandBard[RoomID] >= 2 then
				if DoorStatus[RoomID]  == "Open" then
						DebugMsg( 0, RoomID ,"Door Create2")
						DoorStatus[RoomID]  = "Close"
						--Say(OwnerID(),"Close")
						Door[1]=CreateObj( 112052, 4297, 96, 4621, 0, 1 )
						ArFaLonandBardDoor[RoomID] = Door[1]
						--WriteRoleValue( OwnerID() , EM_RoleValue_Register , Door[1] )
						DebugMsg( 0, RoomID ,"DOOR = "..ArFaLonandBardDoor[RoomID])
					for i=1, table.getn(Door) do
						SetModeEx( Door[i]   , EM_SetModeType_Fight , false )--可砍殺攻擊
						SetModeEx( Door[i]   , EM_SetModeType_Strikback, false )--反擊
						SetModeEx( Door[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
						SetModeEx( Door[i]   , EM_SetModeType_Obstruct, true )--阻擋
						SetModeEx( Door[i]   , EM_SetModeType_Mark, false )--標記
						SetModeEx( Door[i]   , EM_SetModeType_Move, false )--移動
						SetModeEx( Door[i]   , EM_SetModeType_Searchenemy, false )--索敵
						SetModeEx( Door[i]   , EM_SetModeType_ShowRoleHead, false )--頭像框
						SetModeEx( Door[i]   , EM_SetModeType_HideName, false )--名稱
						SetModeEx( Door[i]   , EM_SetModeType_Gravity, false )--重力
						AddToPartition( Door[i] , RoomID )
					end
				end
			end
			MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			--Say(OwnerID(),MaxHP)
			--Say( OwnerID() , "M = "..M)
			if N >= 30 then
			ScriptMessage(OwnerID() , -1 ,2, SayString[Rand(5)+1] , C_SYSTEM )
			N = 0
			end
			if M >= 2 then
				local HelpAttack , HelpMonster , X , Y , Z = A_B_CallHelpMonster( OwnerID() , HelpMonsterID , HelpRange )	
				--Say(OwnerID(),HelpMonster)
				if HelpAttack == "true" then
					if ReadRoleValue( HelpMonster , EM_RoleValue_AttackTargetID ) == 0 then
						SetAttack( HelpMonster , AttackTarget )
					end
					CastSpellLV( OwnerID(), OwnerID(), SecondMagicID1 , SecondMagicLV )
				end
				M = 0
			end
			-- 血 3/4 
			if ( HPPercent <= 0.75 ) and ( HP75 == "false" ) then
				--Say( OwnerID() , "NowHP = 75%")
				local HelpAttack , HelpMonster , X , Y , Z = A_B_CallHelpMonster( OwnerID() , HelpMonsterID , 600 )
				if HelpAttack == "true" then
					ScriptMessage(OwnerID() , -1 ,2, "[SC_TWOWALL]" , C_SYSTEM ) --我來了
					local HelpAttackID = ReadRoleValue( HelpMonster , EM_RoleValue_AttackTargetID )
					CastSpellLV( HelpMonster, HelpMonster, 491905 , 1 )
					Sleep(10)
					SetPos(HelpMonster, X, Y, Z, 0)
					Sleep(10)
					AddBuff( HelpAttackID , 502435 , 1 , -1 )
					CastSpellLV( OwnerID(), OwnerID(), SecondMagicID2 , 1 )
					HP75 = "true"
				end
			end
			-- 血 2/4 
			if ( HPPercent <= 0.50 ) and ( HP50 == "false" ) then
				--Say( OwnerID() , "NowHP = 50%")
				local HelpAttack , HelpMonster , X , Y , Z = A_B_CallHelpMonster( OwnerID() , HelpMonsterID , 600 )
				if HelpAttack == "true" then
					ScriptMessage(OwnerID() , -1 ,2, "[SC_TWOWALL]" , C_SYSTEM ) --我來了
					local HelpAttackID = ReadRoleValue( HelpMonster , EM_RoleValue_AttackTargetID )
					CastSpellLV( HelpMonster, HelpMonster, 491905 , 1 )
					Sleep(10)
					SetPos(HelpMonster, X, Y, Z, 0)
					Sleep(10)
					AddBuff( HelpAttackID , 502435 , 1 , -1 )
					CastSpellLV( OwnerID(), OwnerID(), SecondMagicID2 , 1 )
					HP50 = "true"
				end
			end
			-- 血 1/4 
			if ( HPPercent <= 0.25 ) and ( HP25 == "false" ) then
				--Say( OwnerID() , "NowHP = 25%")
				local HelpAttack , HelpMonster , X , Y , Z = A_B_CallHelpMonster( OwnerID() , HelpMonsterID , 600 )
				if HelpAttack == "true" then
					ScriptMessage(OwnerID() , -1 ,2, "[SC_TWOWALL]" , C_SYSTEM ) --我來了
					local HelpAttackID = ReadRoleValue( HelpMonster , EM_RoleValue_AttackTargetID )
					CastSpellLV( HelpMonster, HelpMonster, 491905 , 1 )
					Sleep(10)
					SetPos(HelpMonster, X, Y, Z, 0)
					Sleep(10)
					AddBuff( HelpAttackID , 502435 , 1 , -1 )
					CastSpellLV( OwnerID(), OwnerID(), SecondMagicID2 , 1 )
					HP25 = "true"
				end
			end
			M = M + 1
			N = N + 1
		else	--離開戰鬥
			if Start == 1 then
				ArFaLonandBard[RoomID] = ArFaLonandBard[RoomID] - 1
				DebugMsg( 0, RoomID ,"ArFaLonandBard3 = "..ArFaLonandBard[RoomID])
				Start = 0
			end
			HP75 = "false"		-- 非戰鬥，歸零記號
			HP50 = "false"	
			HP25 = "false"
			if ArFaLonandBard[RoomID] == 1 and DoorStatus[RoomID]  == "Close"then
				DebugMsg( 0, RoomID ,"AttackMode Leave ")
				DelObj(ArFaLonandBardDoor[RoomID])
				DoorStatus[RoomID]  = "Open"
			end			
			M = 0
		end
	Sleep( CheckTime )
	end
end