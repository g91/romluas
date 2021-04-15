function AI_DEADGUARDMAKER()
	local BossID = 101431	-- 亡靈守衛製造者
	local SkeletonID = 101463	-- 亡靈骨兵
	local DeadGuardID = 101452	-- 亡靈守衛

	local CheckTime = 10	-- 一秒檢查一次

	local HP80 = "NoBomb"	-- 戰鬥狀態
	local HP60 = "NoBomb"	-- 戰鬥狀態
	local HP40 = "NoBomb"	-- 戰鬥狀態
	local HP20 = "NoBomb"	-- 戰鬥狀態

	local SkeletonTime = 0
	local SkeletonNum = GetMoveFlagCount(780225) - 1

	local mX={ -20, 20, -20, 20, 0 }
	local mZ={ -20, -20, 20, 20, 0 }

	local SkeletonGroup = {}
	--local DeadGuardGroup = {}

	local RoomSize = 500

	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	SetPlot( OwnerID() ,"Dead" , "LuaI_202Boss_Dead" , 40 )

	while true do
		local AttackTargetID = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTargetID ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			--Say( OwnerID(), "Fighting! AttackTarget = "..AttackTargetID )

-- 守衛召喚－亡靈守衛製造者每隔 30 秒會召喚 5 隻骷髏兵來幫他攻擊。
			SkeletonTime = SkeletonTime + 1
			--Say( OwnerID() , SkeletonTime )
			if SkeletonTime >= 30 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_101431_01]" , 1 )		-- 出來吧！遠古的戰士們！！
				sleep(30)
				SkeletonTime = 0
				for i = 1 , SkeletonNum do
					local Skeleton = CreateObjByFlag( SkeletonID  , 780225 , i , 1 )
					local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local RandNum = Rand(HateListCount( OwnerID() ))
					local Enermy = HateListInfo(OwnerID() ,RandNum , EM_HateListInfoType_GItemID );
					AddToPartition( Skeleton , RoomID )
					SetAttack( Skeleton , Enermy )
					BeginPlot( Skeleton , "Lua_101431_SkeletonLifeTime" , 0 )
					table.insert( SkeletonGroup , Skeleton )
				end
			end


			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = (NowHP / MaxHP) * 100

-- 守衛爆彈－每 20% 的血被打掉，他就會嚐試將場上所召喚出來的守衛炸裂，造成範圍內巨大傷害；精英守衛造成的傷害會比一般骷髏來得強。
			-- 血 80% 爆彈
			if ( HPPercent <= 80 ) and ( HP80 == "NoBomb" ) then
				HP80 = "Bomb"
				Lua_101431_MonsterBomb( OwnerID() , RoomSize , DeadGuardID , SkeletonID )
			end

			-- 血 60% 爆彈
			if ( HPPercent <= 60 ) and ( HP60 == "NoBomb" ) then
				HP60 = "Bomb"
				Lua_101431_MonsterBomb( OwnerID() , RoomSize , DeadGuardID , SkeletonID )
			end

			-- 血 40% 爆彈
			if ( HPPercent <= 40 ) and ( HP40 == "NoBomb" ) then
				HP40 = "Bomb"
				Lua_101431_MonsterBomb( OwnerID() , RoomSize , DeadGuardID , SkeletonID )
			end

			-- 血 20% 爆彈
			if ( HPPercent <= 20 ) and ( HP20 == "NoBomb" ) then
				HP20 = "Bomb"
				Lua_101431_MonsterBomb( OwnerID() , RoomSize , DeadGuardID , SkeletonID )
			end

		else
			--Say( OwnerID(), "NoFight" )

			HP80 = "NoBomb"		-- 非戰鬥，歸零記號
			HP60 = "NoBomb"		-- 非戰鬥，歸零記號
			HP40 = "NoBomb"		-- 非戰鬥，歸零記號
			HP20 = "NoBomb"		-- 非戰鬥，歸零記號
			SkeletonTime = 0

			for i = 1, table.getn( SkeletonGroup ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的
				if ( ( SkeletonGroup[i] ~= nil ) and ( CheckID( SkeletonGroup[i] ) == true ) ) then			DelObj( SkeletonGroup[i] )	end
			end
			--for i = 1, table.getn( DeadGuardGroup ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的
			--	if ( ( DeadGuardGroup[i] ~= nil ) and ( CheckID( DeadGuardGroup[i] ) == true ) ) then		DelObj( DeadGuardGroup[i] )	end
			--end

			if ( SkeletonGroup ~= nil ) then	SkeletonGroup = {}		end
			--if ( DeadGuardGroup ~= nil ) then	DeadGuardGroup = {}	end

		end

	Sleep( CheckTime )
	end
end

function Lua_101431_KillSummon()	-- 守衛製造－每當殺死一名玩家，亡靈守衛製造者就會產生一名精英守衛來幫他攻擊。
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_101431_04]" , 1 )		-- 歡迎！你是個好原料！！
	CallPlot( OwnerID() , "Lua_101431_KillSummon_DO" , TargetID() )
	return true
end

function Lua_101431_KillSummon_DO( obj )
	local Dead = Role:new( obj )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Monster = CreateObj( 101452 , Dead:X() , Dead:Y() , Dead:Z() , Dead:Dir() , 1 )
	AddToPartition( Monster , RoomID )
	BeginPlot( Monster , "Lua_101431_KillSummon_AI" , 0 )
end

function Lua_101431_KillSummon_AI() --如果沒有目標就去打王的目標，如果王離開戰鬥就刪除自己
	CastSpell( OwnerID() ,  OwnerID() , 492175)
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			sleep(10)
		else
			if CheckID(TargetID()) == true and HateListCount( TargetID() ) > 0 then
				local Target = ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID )
				SetAttack( OwnerID() , Target )
			else
				DelObj(OwnerID() )
			end
			sleep(60)
		end
	end
end

function Lua_101431_SkeletonLifeTime()
	Sleep( 290 )
	if CheckID( OwnerID() ) == true and ReadRoleValue(OwnerID() , EM_RoleValue_PID ) == 0 then 
		DelObj( OwnerID()) 
	end
end

function Lua_101431_MonsterBomb( Player , RoomSize ,  DeadGuardID , SkeletonID )

	local tmp = 0
	local MonsterGroup = SearchRangeNPC( Player , RoomSize )
	for i = 0, table.getn( MonsterGroup ) - 1 do
		if ReadRoleValue( MonsterGroup[i] , EM_RoleValue_OrgID ) == DeadGuardID then
			if CheckID(MonsterGroup[i]) then	BeginPlot( MonsterGroup[i] ,  "Lua_101431_MonsterBomb_DeadGuard"  , 0 )		end
			tmp = tmp +1
		elseif ReadRoleValue( MonsterGroup[i] , EM_RoleValue_OrgID ) == SkeletonID then
			if CheckID(MonsterGroup[i]) then	BeginPlot( MonsterGroup[i] ,  "Lua_101431_MonsterBomb_Skeleton"  , 0 )		end
			tmp = tmp +1
		end
	end
	if tmp >= 1 then
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_101431_05]" , 1 )		-- 炸裂吧！我的戰士們！！
	end

end

function Lua_101431_MonsterBomb_DeadGuard()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
	ScriptMessage( OwnerID() , 0 , 2 , "[SC_101431_06]" , 1 )	-- 自我毀滅開始！！
	Sleep( 10 )
--	Say( OwnerID() , "3" )
	CastSpell( OwnerID() , OwnerID() , 492308 )
	Sleep( 10 )
--	Say( OwnerID() , "2" )
	Sleep( 10 )
--	Say( OwnerID() , "1" )
	Sleep( 10 )
	if CheckID( OwnerID() ) then KillID( OwnerID() , OwnerID() ) end
end

function Lua_101431_MonsterBomb_Skeleton()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
	ScriptMessage( OwnerID() , 0 , 2 , "[SC_101431_06]" , 1 )	-- 自我毀滅開始！！
	Sleep( 10 )
--	Say( OwnerID() , "3" )
	CastSpell( OwnerID() , OwnerID() , 492307 )
	Sleep( 10 )
--	Say( OwnerID() , "2" )
	Sleep( 10 )
--	Say( OwnerID() , "1" )
	Sleep( 10 )
	if CheckID( OwnerID() ) then KillID( OwnerID() , OwnerID() ) end
end

--陷阱－會隨機在一名玩家腳下啟動陷阱，啟動後該陷阱會持續對其上的玩家造成傷害，陷阱持續 30 秒之後便消失。

--迷失魔法－隨機將玩家間的位置互換，並改變面對的方向。


function Lua_101431_Skill_Trap()	-- 陷阱
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_101431_02]" , 1 )	-- 注意！陷阱往往就在你的腳下！！
	local Obj = Role:new( TargetID() )

	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	--local BaseDir = Obj:Dir();
	local BaseRoom = Obj:RoomID()

	local Trap = CreateObj( 112046 , BaseX, BaseY, BaseZ , 0 , 1 )		-- 突刺陷阱
	SetModeEx( Trap , EM_SetModeType_Mark, false) 
	SetModeEx( Trap , EM_SetModeType_HideName, false) 
	SetModeEx( Trap, EM_SetModeType_ShowRoleHead, false) 
	SetModeEx( Trap, EM_SetModeType_Strikback, false) 
	SetModeEx( Trap, EM_SetModeType_Move, false) 
	AddToPartition( Trap , BaseRoom)

	BeginPlot( Trap , "Lua_101431_TrapLifeTime" , 0 )
end

function Lua_101431_TrapLifeTime()
	for i = 1, 30 do
		Sleep( 10 )
		CastSpell( OwnerID() , OwnerID() , 492316 )
	end
	if CheckID( OwnerID() ) then	DelObj( OwnerID() )	end
end

function Lua_101431_Skill_Lost_Check()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_101431_03]" , 1 )	-- 親愛的小羊們，找到的家嗎？
	return true
end

function Lua_101431_Skill_Lost()	-- 迷失魔法
	local PlayerNum = GetPartyID( TargetID() , -1 )
	if PlayerNum >= 2 then

		local X = {}
		local Y = {}
		local Z = {}
		local D = {}
		local oPartyPos = {}
		local nPartyPos = {}

		for i = 1, PlayerNum do
			local PartyMember = GetPartyID( TargetID() , i )
			table.insert( oPartyPos , PartyMember )
			X[i] = ReadRoleValue( PartyMember , EM_RoleValue_X )
			Y[i] = ReadRoleValue( PartyMember , EM_RoleValue_Y )
			Z[i] = ReadRoleValue( PartyMember , EM_RoleValue_Z )
			D[i] = ReadRoleValue( PartyMember , EM_RoleValue_Dir )

		end

		nPartyPos = Lua_MixTable( oPartyPos )

		for i = 1, PlayerNum do
			CastSpell( nPartyPos[i] ,  nPartyPos[i] , 492175)
			SetPos( nPartyPos[i] , X[i], Y[i] , Z[i] , D[i]+math.random( 180 , 360 ) )
		end
	end
end

function Lua_MixTable( oTable )

	local nTable = {}

	local num = table.getn(oTable)
	for i = 1, 	num do
		local R = math.random( 1, table.getn(oTable) )
		table.insert( nTable , oTable[R] )
		table.remove( oTable , R )
	end

	--for i = 1, table.getn(nTable) do
	--	Say( OwnerID() , nTable[i] )
	--end

	return nTable

end

function LuaI_202Boss_Dead()
	local Door = CreateObjByFlag( 111432 , 780225 , 0 , 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		SetFlag( Party[i] , 542295 , 1 )
	end
	SetModeEx( Door , EM_SetModeType_Mark, false) 
	SetModeEx( Door , EM_SetModeType_HideName, false) 
	SetModeEx( Door, EM_SetModeType_ShowRoleHead, false) 
	AddToPartition( Door , RoomID )
	BeginPlot( Door , "LuaI_202Boss_OutDoor" , 0 )
	return true
end

function LuaI_202Boss_OutDoor()
	SetPlot( OwnerID() , "range" , "LuaI_202_BossOne_EXIT" , 10 )
end