function LuaI_Zurhidon_GuestAI()
	local Flag = 780204
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X = GetMoveFlagValue( Flag , 0 , EM_RoleValue_X )
	local Y = GetMoveFlagValue( Flag , 0 , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( Flag , 0 , EM_RoleValue_Z )
	local Dir = GetMoveFlagValue( Flag , 0 , EM_RoleValue_Dir )
	SetPos( OwnerID(), x, y, z, Dir )
	
	SetRoleCamp( OwnerID() , "Visitor" )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID  , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 7 , 0 )
	SetPlot(OwnerID() , "dead" , "LuaFunc_Zurhidon_GuestDead" , 0 )
	Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	for i = 1 , 4 , 1 do
		local Guard = CreateObjByFlag( 101348 , 780204 , i , 1 )
		WriteRoleValue( Guard , EM_RoleValue_PID , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + i , Guard )
		WriteRoleValue( Guard , EM_RoleValue_Register , OwnerID() )
		AddToPartition( Guard , Room )
		SetPlot( Guard , "dead" , "LuaFunc_Zurhidon_GuardDead" , 0 )
	end 
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register +9  ) ~= 7 then
		local SlaveA = CreateObjByFlag( 111611 , Flag , 5 , 1 )
		local SlaveB = CreateObjByFlag( 111612 , Flag , 6 , 1 )
		local Present = CreateObjByFlag( 101354 , Flag , 7 , 1 )
		WriteRoleValue( SlaveA , EM_RoleValue_Register , OwnerID() )
		WriteRoleValue( SlaveA , EM_RoleValue_Register+1 ,  Present )
		WriteRoleValue( SlaveB , EM_RoleValue_Register , OwnerID() )
		WriteRoleValue( SlaveB , EM_RoleValue_Register+1 , Present )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + 5 , SlaveA )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + 6 , SlaveB )
		AddToPartition( SlaveA , Room )
		AddToPartition( SlaveB  , Room )	
		AddToPartition( Present   , Room )
		PlayMotionEX( SlaveA ,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
		PlayMotionEX( SlaveB ,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
		SetFightMode( Present  , 0 , 0 , 0 , 0 )
		BeginPlot( Present  , "LuaI_101354" , 0 )	
		WriteRoleValue( OwnerID() , EM_RoleValue_Register +9  , 7 )		
	end
end

function LuaFunc_Zurhidon_GuestAI()
	local Flag = 780204
	--以下為表演劇情--
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--sleep(10)
	SetRoleCamp( OwnerID() , "Monster" )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID  , 1 )	
	Hide( OwnerID() )
	Show(OwnerID() , Room )
	--sleep( 15 )
	local Guard = {}
	--以下為戰鬥AI--
	local Count = 0
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	local HP
	local State = ""
	local DeadGuard = 0
	local Target 
	local Party = {}
	MoveToFlagEnabled( OwnerID() , false )
	Yell( OwnerID() , "[SC_101347_2]",5 )
	for i = 1 , 4 , 1 do
		Guard[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + i  )
		local MaxHP = ReadRoleValue( Guard[i] , EM_RoleValue_MaxHP)
		PlayMotion( Guard[i], ruFUSION_ACTORSTATE_REVIVING)
		CancelBuff(  Guard[i], 502707 )
		AddBuff( Guard[i] ,502279 , 1  , -1 );
		WriteRoleValue(  Guard[i] , EM_RoleValue_HP , MaxHP )
		SetModeEx( Guard[i] , EM_SetModeType_ShowRoleHead, true) 
		Hide( Guard[i]  )
		Show(Guard[i] ,Room )
		BeginPlot( Guard[i] , "LuaFunc_Zurhidon_Guard" , 0 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	while 1 do
		sleep(10)
		Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		Party = LuaFunc_PartyData(Target)
		local LeavePPL = {}
		LeavePPL[0] = 1
		local num = 1
		for i = 1 , Party[0] , 1 do
			local Pll = HateListInfo(OwnerID() , (i-1)  , EM_HateListInfoType_GItemID )
			if CheckID(Pll) == true and ReadRoleValue( Pll , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Pll , EM_RoleValue_RoomID ) == Room then 
				LeavePPL[0] = 0
				LeavePPL[num] = Pll
				num = num + 1		
			end
		end
		
		HP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
		DeadGuard = 0
		for i = 1 ,4 , 1 do
			if CheckID(Guard[i]) ~= true or ReadRoleValue(Guard[i] , EM_RoleValue_HP ) <= 0 then
				WriteRoleValue( Guard[i] , EM_RoleValue_PID , 0 )
				DeadGuard = DeadGuard + 1
			end
		end
		
		if HP < MaxHP and Count%5 == 0 and DeadGuard < 4 then --把傷害轉移給護衛
			local addHP = math.floor( (MaxHP - HP )/ (4-DeadGuard) )
			for i = 1 ,4 , 1 do
				DeadGuard = 0
				if CheckID(Guard[i]) == true and ReadRoleValue( Guard[i] , EM_RoleValue_PID ) > 0 then
--					say( OwnerID() , "Change Damege" )
					AddRoleValue( Guard[i] , EM_RoleValue_HP , -addHP )
					AddRoleValue( OwnerID() , EM_RoleValue_HP ,  addHP )
					if ReadRoleValue(Guard[i] , EM_RoleValue_HP ) <= 0 then
						WriteRoleValue( Guard[i] , EM_RoleValue_PID , 0 )
						DeadGuard = DeadGuard + 1
					end
				end
			end 
		end
		
		if DeadGuard >= 4 or 
		ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 or		
		ReadRoleValue( OwnerID() , EM_RoleValue_Register + 7 ) == 4 then --判定護衛是否全滅
			Yell( OwnerID() , "[SC_101347_4]" , 5 )
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 10 )
			break
		end
		
		if LeavePPL[0] == 1 then --判定玩家是否全滅
			SetRoleCamp( OwnerID() , "Visitor" )
			Yell( OwnerID() , "[SC_101347_3]" , 5 )
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 7 )
			sleep( 20 )
			break
		end		

		if Count == 10 then
			local Trans
			local TransPos = {}
			local Me = Role:new( OwnerID() )
			local MePos = {["X"] = Me:X() , ["Y"] = Me:Y() , ["Z"] = Me:Z() , ["Dir"] = Me:Dir()}
			local GuardNum = Rand(4) + 1
			local RandNum = Rand(table.getn( LeavePPL)) + 1
			for i = 1 , 4 , 1 do
				if CheckID(Guard[GuardNum]) == true and ReadRoleValue( Guard[GuardNum] , EM_RoleValue_PID ) > 0 then
					Trans = Role:new(Guard[GuardNum])
					TransPos = {["X"] = Trans:X() , ["Y"] = Trans:Y() , ["Z"] = Trans:Z() , ["Dir"] = Trans:Dir()}
					break
				end
				GuardNum = GuardNum + 1
				if GuardNum > 4 then
					GuardNum = 1
				end		
			end
			SetPos( OwnerID(), TransPos["X"], TransPos["Y"], TransPos["Z"] , TransPos["Dir"] )
			SetPos( Guard[GuardNum] , MePos["X"], MePos["Y"], MePos["Z"] , MePos["Dir"] )
			AddToPartition( OwnerID() , Room )
			AddToPartition( Guard[GuardNum], Room )
--			local TargetII =  ReadRoleValue( Guard[GuardNum] , EM_RoleValue_AttackTargetID ) 
--			if CheckID( TargetII ) == true and ReadRoleValue( TargetII , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( TargetII, EM_RoleValue_RoomID ) == Room then
			if Rand(100) < 20 or Rand(100) > 70 then
				local RandNum = Rand(table.getn( LeavePPL)) + 1
				Yell( OwnerID() , "[SC_101347_6]" , 5 )
				CastSpell( OwnerID() ,LeavePPL[RandNum]  , 492163 )
			else
				Yell( OwnerID() , "[SC_101347_7]" , 5 )
				CastSpell( OwnerID() ,OwnerID() , 490648 )
			end					

		end

		if Count == 20 then
			Yell( OwnerID() , "[SC_101347_5]" , 5 )
			local RandNum = Rand(table.getn( LeavePPL)) + 1
			CastSpell( OwnerID() , LeavePPL[RandNum] , 492161 )
			sleep( 10 )
			if RandNum - 1 < 1 then
				RandNum = table.getn( LeavePPL)
			else
				RandNum = RandNum - 1
			end
			CastSpell( OwnerID() , LeavePPL[RandNum] , 492161 )
			Count = Count + 1
		end

		if Count == 30 then
			local DeadMan = 0
			local Distance = 0
			for i = 1 , table.getn( LeavePPL) , 1 do
				if GetDistance( OwnerID(), LeavePPL[i]) > Distance then
					Distance = GetDistance( OwnerID(), LeavePPL[i])
					DeadMan = LeavePPL[i]
				end
			end
			Yell( OwnerID() , "[SC_101347_8]" , 5 )
			CastSpell( OwnerID() , DeadMan , 492162 )
		end
		if Count == 3 or Count == 13 or Count == 23 then
			local RandNum = Rand(table.getn( LeavePPL)) + 1
			CastSpellLV( OwnerID() , LeavePPL[RandNum] ,490471,99)
		end

		if Count > 30 then
			Count = 0
		end
		Count = Count + 1
	end
	
	MoveToFlagEnabled( OwnerID() , true )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 10 then
		WriteRoleValue( OwnerID() , EM_RoleValue_PID  , 0 )
		SetRoleCamp( OwnerID() , "Visitor" )
		Hide( OwnerID() )
		SetPosByFlag( OwnerID(), Flag , 0 )
		sleep( 10 )
		Show(OwnerID() , Room )
		Yell( OwnerID() , "[SC_101347_9]" , 5  )
		sleep(10)
		local SA = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 )
		local SB = ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )
		BeginPlot( SA , "Lua_SlavePlay" , 0 )
		BeginPlot( SB , "Lua_SlavePlay" , 0 )
		local Dead = Ver_Zone252_Cyclops[Room]["BossDead"]
		Dead = Dead + 1
		Ver_Zone252_Cyclops[Room]["BossDead"] = Dead
		if Dead == 1 then
			ScriptMessage( OwnerID() , -1 , 2 ,"[SC_AGRIZA_BOSS1_04]" , 1 ) 
		elseif Dead == 2 then
			ScriptMessage( OwnerID() , -1 , 2 ,"[SC_AGRIZA_BOSS1_05]", 1 )
		else
			ScriptMessage( OwnerID() , -1 , 2 ,"[SC_AGRIZA_BOSS1_06]", 1 )  
		end
		local PlayerLV = ReadRoleValue( Target , EM_RoleValue_LV )
		local PlayerSUBLV = ReadRoleValue( Target , EM_RoleValue_LV_SUB )
		DesignLog(OwnerID(),101347,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
		DelObj( OwnerID() )

	else
		SetPosByFlag( OwnerID(), Flag , 0 )
		for i = 1 , 4 , 1 do
			Delobj( Guard[i] )
		end
		Sleep(10)
		Beginplot( OwnerID() , "LuaI_Zurhidon_GuestAI" , 0)
	end
end

function LuaFunc_Zurhidon_GuestDead()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID  , 0 )
	return false
end