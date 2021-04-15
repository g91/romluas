function LuaI_ControlBox_101502()
	local ControlBOX = CreateObjByFlag( 112047, 780230 , 0 , 1 ); --建立控制物件
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetFightMode( ControlBOX , 0 , 0 , 0 , 0 )
 	SetModeEx( ControlBOX , EM_SetModeType_Mark, false) 
	SetModeEx( ControlBOX , EM_SetModeType_HideName, false) 
	SetModeEx( ControlBOX, EM_SetModeType_ShowRoleHead, false) 
	SetModeEx( ControlBOX , EM_SetModeType_Strikback , false )
	WriteRoleValue( ControlBOX , EM_RoleValue_PID , OwnerID() ) --紀錄鐵門的ID
	AddToPartition( ControlBOX , RoomID )
	SetPlot( ControlBOX , "Range" , "LuaI_BattleControl_101502" , 50 ) --設定範圍劇情
end

function LuaI_BattleControl_101502()
	SetPlot( TargetID() , "Range" , "" , 0 ) --解除範圍劇情
	BeginPlot( TargetID() , "LuaI_BattleCheck_101502" , 0 ) --執行洛卡魚人的劇情
end

function LuaI_BattleCheck_101502()

	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local Effect = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101502 , 700 , 0)
	local Pos = {}
	local IronCloser = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	SetFightMode( Effect , 0 , 0 , 0 , 0 )
	CastSpell( Effect , Effect , 492393 ) --播放水花特效
	Sleep( 5 )
	Pos["X"] = GetMoveFlagValue( 780230 , 11 , EM_RoleValue_X )
	Pos["Y"] = GetMoveFlagValue( 780230 , 11 , EM_RoleValue_Y )
	Pos["Z"] = GetMoveFlagValue( 780230 , 11 , EM_RoleValue_Z )
	Pos["D"] = GetMoveFlagValue( 780230 , 11 , EM_RoleValue_Dir )
	local Loca = CreateObj ( 101502 , Pos["X"], Pos["Y"] , Pos["Z"] , Pos["D"]  , 1)
	SetFightMode( Loca , 0 , 1 , 0 , 0 )
	AddToPartition( Loca , RoomID )

	CastSpell( Loca , Loca , 492369 )
	Delobj( Effect )
	sleep(10)
	PlayMotion( Loca , ruFUSION_ACTORSTATE_CAST_INSTANT )
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_101502_0]"  , 0 )
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_101502_0]"  , 0 )
	Yell( Loca, "[SC_101502_1]" , 5 )
	BeginPlot( Loca , "LuaI_101502_AI" , 0 )
	SetFightMode( Loca , 1 , 1 , 0 , 1 )

	Hide( Loca )
	Show( Loca , RoomID )
	while 1 do
		if CheckID( Loca ) == false or ReadRoleValue( Loca , EM_RoleValue_IsDead ) == 1 then --檢查王已經死掉或消失則開門
			PlayMotionEX( IronCloser ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
			break
		end
		sleep(10)
	end
end

function LuaI_101502_AI()
	local Count = 0 
	local Flag = 780230
	local FlagCount = GetMoveFlagCount(Flag) -1 --去掉第0號旗子
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			
			sleep(10)
			Count = Count + 1
			if Count >= 60 then
				CastSpell( OwnerID() , OwnerID() , 492393 )
--				for i = 0 , HateListCount( OwnerID() ) - 1 , 1 do
--					local Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
--					SetPosByFlag( Player , Flag , (Rand(FlagCount)+1) ) -- +1 為了避免取得第 0 號旗子，也讓最後一號旗子會被取到
--					AddBuff( Player, 502614 , 9 , -1 )
--				end
				Count = Count - 60
			end
		else
			if CheckBuff( OwnerID() , 502821 ) == true then
				CancelBuff( OwnerID() , 502821 )
			end
			sleep(60)
		end
	end
end

function LuaSpell_101502_EggBorn()
	local RandNumA = Rand(100)
	local RandNumB = Rand(100)
	local Choice = 1

	if RandNumA >= RandNumB then
		Choice = 2
	end

	local MobID = {[1] = 101697 , [2] = 101698 }
	local Mob = {}
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = 0
	local Me = Role:new( OwnerID() )
	For i = 0 , HateListCount( OwnerID() ) - 1 , 1 do
		local Obj = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if ReadroleValue( Obj , EM_RoleValue_OrgID ) == 101502 and ReadRoleValue( Obj , EM_RoleValue_RoomID ) == RoomID then
			Boss = Obj
			break
		end
	end

	for i = 1 , 3 , 1 do
		local X = Me:X() + (10+Rand(10))*( math.pow( -1 , i ) )
		local Z = Me:Z() + (10+Rand(10))*( math.pow( -1 , i+1 ) )
		local Y = GetHeight( X , Me:Y() , Z );
		Mob[i] = CreateObj ( MobID[Choice]  , X , Y , Z , Me:Dir() , 1)
		WriteRoleValue( Mob[i] , EM_RoleValue_PID , Boss )
		SetModeEx( Mob[i] , EM_SetModeType_Strikback , false )
		SetModeEx( Mob[i] , EM_SetModeType_Searchenemy , false ) 
		AddToPartition( Mob[i] , ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) )
		SetPlot( Mob[i] , "Dead" ,"LuaFunc_DeadPlay" , 50 )
--		Yell( OwnerID() , " Flog "..i.." = "..Mob[i].." Room = "..ReadRoleValue( Mob[i] , EM_RoleValue_RoomID ).." Type = "..RandNumA.." & "..RandNumB  , 5)
--		Yell( Mob[i] , "OH!YES!", 5 )
		MoveToFlagEnabled(  Mob[i], false );
		AddBuff( Mob[i] , 502707 , 1 , -1 )
		WriteRoleValue( Mob[i] , EM_RoleValue_IsWalk , 0 )
		WriteRoleValue( Mob[i] , EM_RoleValue_LiveTime , 30 )
		WriteRoleValue( Mob[i] , EM_RoleValue_HP , 3500 )
		CallPlot( Mob[i] , "Lua_101502_IamComing" , Choice )
	end
end

function Lua_101502_IamComing(Type)
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
	local Obj = Role:new( Boss )
	while 1 do
		if CheckID( Boss ) == true and ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 101502 then
			if GetDistance( OwnerID(), Boss ) > 10 then
				Move( OwnerID() , Obj:X() ,  Obj:Y() ,  Obj:Z() ) 
			else
				break
			end
		end
		sleep(10)
	end
	if Type == 1 then
		CastSpell( OwnerID() , Boss , 492680 )
--		AddBuff( Boss , 502821 , 1 , -1 )
		--Yell( OwnerID() , " I Be Ate ! " , 5 )
	else
		local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )
		if ReadRoleValue( Boss , EM_RoleValue_HP ) < ( MaxHP * 95 / 100 ) then
			CastSpell( OwnerID() , Boss , 492365 )
			AddRoleValue( Boss , EM_RoleValue_HP , ( 5*MaxHP/100 ) )
			--Yell( OwnerID() , " I Be Ate ! " , 5 )
		else
			CastSpell( OwnerID() , Boss , 492365 )
			WriteRoleValue( Boss , EM_RoleValue_HP , MaxHP )
			--Yell( OwnerID() , " I Be Ate ! " , 5 )
		end
	end
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_DYING , ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( OwnerID() )
end

function LuaI_CancelBuffBox_101502()
	SetPlot( OwnerID() , "collision" , "LuaI_CancelBuff_101502" , 50 )
end

function LuaI_CancelBuff_101502()
	local Buff = 502614
	if CheckBuff( OwnerID() , Buff ) then
		CancelBuff( OwnerID() , Buff)
	end
end

function LuaI_CheckBuff_101502()
	local Buff = 502615
	if CheckBuff( OwnerID() , Buff ) then
		return false
	end
end

function LuaI_CheckStep_101502(Step)
	Local HP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	Local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	if HP/MaxHP > 0.5 then
		if Step == "A" then
			return true
		else
			return false
		end
	else
		if Step == "A" then
			return false
		else
			return true
		end
	end
end