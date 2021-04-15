function LuaI_RedLighting_Door()
	local flag  = 780212
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 101352 , flag , 0 , 1 )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Me = Role:new( OwnerID() )
	Ver_Zone252_Cyclops[Room] = {}
	Ver_Zone252_Cyclops[Room]["BossDead"] = 0
	SetRoleCamp( Boss , "Visitor" )
	AddToPartition( Boss  ,Room )
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	WriteRoleValue( Boss , EM_RoleValue_PID , 0 )
	local General = {}
	local State = "Close"
	local Game = "Open"
	for i = 1 , 6 , 1 do
		General[i] = CreateObjByFlag( 101356 , flag , i , 1 )
		AddToPartition( General[i]  ,Room )
		WriteRoleValue( General[i] , EM_RoleValue_PID , Boss )
		SetPlot( General[i] ,"dead" , "luaI_Agriza_General_Dead" , 0 )
	end
	local Door = CreateObj ( Me:OrgID() , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1)
	SetModeEx( Door, EM_SetModeType_Mark, false) 
	SetModeEx( Door , EM_SetModeType_HideName, true) 
	SetModeEx( Door , EM_SetModeType_ShowRoleHead, false) 
	SetModeEx( Door , EM_SetModeType_Obstruct, true) 
	SetModeEx( Door , EM_SetModeType_Gravity, false) 
	SetFightMode( Door , 0 , 0 , 0 , 0 )

	AddToPartition( Door , Room )
	AdjustDir( Door , 180 )
	Hide(OwnerID())

	while 1 do
		Game = "Open"
		if Game == "Open" then
			for i = 1 , 6 , 1 do
				if CheckID(General[i]) == true and ReadRoleValue( General[i] , EM_RoleValue_IsDead) < 1 then
					Game = "Close"
					break
				end
			end
			if Ver_Zone252_Cyclops[Room]["BossDead"] > 2 then
				Hide( Door)
			end
		end
		
		if Game =="Open" and ReadRoleValue( Boss ,EM_RoleValue_PID )<1 then
			if Ver_Zone252_Cyclops[Room]["BossDead"] > 2 then
				WriteRoleValue( Boss , EM_RoleValue_PID , 1 )
				BeginPlot( Boss , "LuaI_RedLighting_AI_StepA" , 0 )
			end
		end

		if CheckID(Boss) == true and ReadRoleValue( Boss ,EM_RoleValue_PID ) > 0 then

			if HateListCount( Boss) > 0 or ReadRoleValue(Boss,EM_RoleValue_PID ) == 7 then
				if State == "Open" then
					Show(OwnerID(), Room )
					State = "Close"
				end
			else
				if State == "Close" then 
					Hide( OwnerID() )
					State = "Open"
				end
			end
		else
			if State == "Close" then 
				Hide( OwnerID())
				State = "Open"
			end
		end

		sleep( 60 )
	end
end

function luaI_Agriza_General_Dead()
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if Ver_Zone252_Cyclops[Room]["BossDead"] > 2 then
		ScriptMessage( Boss  , -1  , 1 ,"[SC_101352_0]", 0  ) 
	else
		ScriptMessage( Boss  , -1  , 1 ,"[SC_101352_14]", 0  ) 
	end
	return true
end

function LuaI_RedLighting_AI_StepA()
	local flag  = 780212
	local Room = ReadRoleValue( OwnerID() , EM_roleValue_RoomID )
	local Target
	Yell( OwnerID() , "[SC_101352_1]" , 5  ) 
	ScriptMessage( OwnerID()   , -1  , 2 ,"[SC_101352_1]" ,0  ) 
	MoveToFlagEnabled( OwnerID() , false )
	LuaFunc_MoveToFlag( OwnerID(), 780212 , 7  ,0 )
	Hide( OwnerID())
	SetRoleCamp(OwnerID(), "Monster" )
	Show(OwnerID() , Room )

	SetPlot( OwnerID() , "dead" , "LuaI_RedLighting_AI_StepB" , 0 )
	local Count = 0
	while 1 do
		if CheckBuff( OwnerID() , 502698 ) == false then
			AddBuff( OwnerID() , 502698 , 75 , -1 )
		end
		local HateCount = HateListCount( OwnerID() ) 
		if  ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 7 then
			break
		end

		if HateCount > 0 then
			Target = ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID )
			MoveToFlagEnabled( OwnerID() , true )
			sleep(10)
			Count = Count + 1
--			if Count < 13 then
			if Count == 4 or Count == 26 then
--				if Rand( 100 ) < 5 or Rand( 100 ) > 94 then
					local RandNum = Rand(HateCount)
					local SecTar
					SecTar = HateListInfo(OwnerID() , RandNum , EM_HateListInfoType_GItemID )
					Yell( OwnerID() ,  "[SC_101352_13]" ,  5 )
					CastSpellLV( OwnerID() , SecTar , 490550 , 1 )
					sleep(20)
					SetAttack( OwnerID() , Target )
					Count = Count + 2
--				end
			end
			if Count == 15 then
				Yell( OwnerID() ,  "[SC_101352_9]" ,  5 )
				ScriptMessage( OwnerID()   , -1  , 2 ,"[SC_101352_9]" ,0  ) 
				CastSpellLV( OwnerID() , OwnerID() , 492179 , 10 )
			end
			if Count == 30 then
				Count = 0
			end
		else
			sleep( 50 )
		end
	end
end

function LuaI_RedLighting_AI_StepB()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	SetStopAttack(OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_HP , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , Target )
	Yell( OwnerID() , "[SC_101352_2]" , 5 ) 
	Ver_Zone252_Cyclops[Room]["BossDead"] = Ver_Zone252_Cyclops[Room]["BossDead"] +1
	SetFightMode ( OwnerID(),0, 0, 0,0 )
	Hide( OwnerID() )
	Show( OwnerID() , Room)
	local BuffCount = BuffCount(OwnerID() )
	for i = 1 ,BuffCount do
		local BuffID = BuffInfo( OwnerID() , BuffCount-i , EM_BuffInfoType_BuffID)
		CancelBuff( OwnerID() , BuffID )
	end
	AddBuff( OwnerID() ,502707 ,1 ,-1 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	BeginPlot( OwnerID() , "LuaI_RedLighting_AI_StepC" , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 7 )
	return false
end

function LuaI_RedLighting_AI_StepC()
	EnableNpcAI( OwnerID() , false );
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Target = ReadRoleValue( OwnerID() , EM_RoleValue_Register)
	local Party = {}
	local State = "A"
	local Count = 0
	local BallThree = {[1] = 0 , [2] = 0 , [3] = 0}
	local PPLThree = {}
	local ChargeMe 
	local HateCount 
	local Garria = 0

	SetStopAttack(OwnerID() )
	Addbuff( OwnerID() , 501081 , 1 , -1 )
	sleep( 100 )
	local Ball = LuaFunc_CreateObjByObj (101353, OwnerID() )
	SetModeEx( Ball , EM_SetModeType_Mark, false) 
	SetModeEx( Ball , EM_SetModeType_HideName, true) 
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) 
	DelFromPartition( Ball )
	AddToPartition( Ball , Room)
	CastSpell( Ball , OwnerID() , 492175 )
	sleep(10)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_REVIVING )
	sleep(20)
	DelObj( Ball )
	CancelBuff(  OwnerID() , 502707 )
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP )
	Hide( OwnerID() )
		SetFightMode ( OwnerID(),1, 1, 0,0 )
	Show( OwnerID() , Room )
	Yell( OwnerID() , "[SC_101352_3]" ,5) 
	sleep(15)
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	Yell( OwnerID() , "[SC_101352_4]" , 5 ) 
	sleep(15)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_UNARMED )
	CancelBuff( OwnerID() , 501081 )
	Say( OwnerID() , "[SC_101352_5]" ) 
	SetPlot( OwnerID() , "dead" , "Lua_RedLighting_MegaDeath" , 0 )
	sleep(30)
	if CheckID( Target ) == true and ReadRoleValue( Target , EM_RoleValue_RoomID ) == Room then
		CastSpellLV( OwnerID() , Target , 492488 , 1 )
	end

	Yell( OwnerID() ,  "[SC_101352_6]" , 5 )
	ScriptMessage( OwnerID()   , -1  , 2 ,"[SC_101352_6]" ,0  ) 
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 11)
	CancelBuff( OwnerID() , 502698 )
	Hide( OwnerID() )
	SetFightMode ( OwnerID(),1, 1, 0,1 )
	Show( OwnerID() , Room )
	EnableNpcAI( OwnerID() , true );

	while 1 do
		if CheckBuff( OwnerID() , 502698 ) == false then
			AddBuff( OwnerID() , 502698 , 25 , -1 )
		end

		HateCount = HateListCount( OwnerID() ) 
		if HateCount > 0 then
			if Garria == 0 and Count == 2 then
				Lua_Call_101530(Room)
				Garria = 100
			end
			MoveToFlagEnabled( OwnerID() , true )
			Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )

			local LeavePPL = {}
			local num = 0
			for i = 0 , HateCount - 1 , 1 do	
				num = num + 1			
				LeavePPL[num] = HateListInfo(OwnerID() , i  , EM_HateListInfoType_GItemID )
			end

			if Count == 7 or Count == 17 or Count == 27 then
--				if Rand(100) < 5 or Rand(100) > 90 then
					Yell( OwnerID() ,  "[SC_101352_7]" , 5 )
					ScriptMessage( OwnerID()   , -1  , 2 ,"[SC_101352_7]" ,0  ) 
					if Rand(100) > 20 and Rand(100) < 70 then
						CastSpellLV( OwnerID() , Target , 492181 , 10 )
					else
						CastSpellLV( OwnerID() , Target , 492182 , 1 )
					end
--				end
			end
			if Count == 10 and State == "A" then --深紅彗星劇情挑選對象
--				local RandNum = Rand(num-1) + 2
--				ChargeMe= LeavePPL[RandNum]
--				if ChargeMe ~= ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) and CheckID(ChargeMe) == true and ReadRoleValue( ChargeMe , EM_RoleValue_IsDead ) == 0 then
--					ScriptMessage( OwnerID() ,ChargeMe , 1 , "[SC_101352_8]" , 0 )
--					AddBuff( ChargeMe ,  502377 , 1 ,15)
--					State = "B"
--				end
			end

			if Count == 20 and State == "B" then --深紅彗星劇情攻擊對象
				local CheckLive = "NO"
				for i = 0 , HateCount , 1 do
					if HateListInfo(OwnerID() , i  , EM_HateListInfoType_GItemID ) == ChargeMe then
						CheckLive = "YES"
						break
					end
				end
				if CheckLive == "YES" then
					Yell( OwnerID() ,  "[SC_101352_9]" ,  5 )
					CastSpell(OwnerID() , ChargeMe , 492180 )
				end
				State = "A"
			end

--			if Count ~= 5 and Count ~= 15 and Count < 25 and Count > 1 then
			if Count == 10 or Count == 22 then
--				if Rand(100) < 5 or Rand(100) > 94 then
					local RandNum = Rand(HateCount)
					local SecTar
					SecTar = HateListInfo(OwnerID() , RandNum , EM_HateListInfoType_GItemID )
					Yell( OwnerID() ,  "[SC_101352_13]" ,  5 )
					CastSpellLV( OwnerID() , SecTar , 490550 , 1 )
					sleep(20)
					SetAttack( OwnerID() , Target )
					Count = Count + 2
--				end
			end

			if Count == 29  then
				local Owner = Role:new( OwnerID() )
				EnableNpcAI( OwnerID() , false )
				sleep(10)
				Yell( OwnerID() ,  "[SC_101352_10]" , 5 )
				ScriptMessage( OwnerID()   , -1  , 2 ,"[SC_101352_10]" ,0  ) 
				PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT )
				if num > 3 then

					local RandNum = Rand(num-1) + 2
					PPLThree[1] = LeavePPL[RandNum]

					if ( RandNum + 1 ) > num then
						RandNum = 0
					end

					PPLThree[2] = LeavePPL[RandNum +1]
					PPLThree[3 ]= LeavePPL[RandNum +2]	
				else
					PPLThree[1] = LeavePPL[Rand(num)+1]
				end
				for i = 1 , table.getn(BallThree)  , 1 do
					if CheckID(BallThree[i] ) == true and ReadRoleValue(BallThree[i] ,EM_RoleValue_RoomID) == Room then
						DelObj(BallThree[i])
					end
				end
				for i = 1 , table.getn( PPLThree )  , 1 do
					local Delta = 10*(-1)^i
					BallThree[i] = CreateObj( 101353 , Owner:X() + Delta  , Owner:Y() , Owner:Z()+Delta , Owner:Dir() , 1)
					SetModeEx( BallThree[i] , EM_SetModeType_Mark, false) 
					SetModeEx( BallThree[i] , EM_SetModeType_HideName, true) 
					SetModeEx( BallThree[i] , EM_SetModeType_ShowRoleHead, false) 
					SetFightMode (BallThree[i] ,0 , 1, 0 ,0 )
					AddToPartition( BallThree[i] , Room )

					local CheckLive = "NO"
					for j = 0 , HateCount , 1 do
						if HateListInfo(OwnerID() , j  , EM_HateListInfoType_GItemID ) == PPLThree[i]  then
							CheckLive = "YES"
							break
						end
					end
					if CheckLive == "YES" then
						WriteRoleValue( BallThree[i] , EM_RoleValue_PID , PPLThree[i] )
					else
						WriteRoleValue( BallThree[i] , EM_RoleValue_PID ,Target)
					end
					BeginPlot(BallThree[i] ,"Lua_ElecticBall_RedLighting" , 0)
					Sleep(3)
				end
				EnableNpcAI( OwnerID() , true )
			end

			sleep(10)
			Count = Count + 1
			if count == 30 then
				Count = 0
			end
		else
			for i = 1 , table.getn( BallThree)  , 1 do
				if CheckID(BallThree[i] ) == true and ReadRoleValue(BallThree[i] ,EM_RoleValue_RoomID ) == Room then
					DelObj(BallThree[i])
				end
			end

			sleep( 50 )
		end
	end
	
end

function LuaI_Red_CometA()
	if CheckBuff( TargetID() , 502377 ) == true then
		CancelBuff( TargetID() , 502377 )
		return true
	else
		return false
	end
end

function LuaI_Red_CometB()
	if CheckBuff( TargetID() , 502377 ) == true then
		return false
	else
		return true
	end
end

function Lua_ElecticBall_RedLighting()
	local Player = Role:new(ReadRoleValue( OwnerID() , EM_RoleValue_PID ))
	local Owner = Role:new(OwnerID() )
	local Room = Owner:RoomID()
	Setfightmode( OwnerID() , 0 , 0 , 0 , 0 )
	SetPos( OwnerID(), Player:X() , Owner:Y() ,  Player:Z()  , Player:Dir() )
	Hide( OwnerID() )
	Show( OwnerID() , Room )
	sleep(50)
	AddBuff( OwnerID() , 502380 , 1 , -1 )
	AddBuff( OwnerID() ,501081  ,1 ,-1 )
--	LuaFunc_WaitMoveTo( OwnerID(), Player:X() , Owner:Y() ,  Player:Z()  )
	while 1 do
		if CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 101352 or ReadRoleValue(TargetID(),EM_RoleValue_RoomID) ~= Owner:RoomID() or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			Delobj( OwnerID() )
			break
		end
		sleep( 30 )
	end
end

function Lua_RedLighting_MegaDeath()
	Yell( OwnerID() ,  "[SC_101352_11]" , 5 )
	ScriptMessage( OwnerID()   , -1  , 2 ,"[SC_101352_11]" ,0  ) 
	local Dummy = LuaFunc_CreateObjByObj (101267, OwnerID() )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetFightMode ( Dummy,0, 0, 0,0 )
	SetModeEx( Dummy, EM_SetModeType_Mark, false) 
	SetModeEx( Dummy , EM_SetModeType_HideName, true) 
	SetModeEx( Dummy , EM_SetModeType_ShowRoleHead, false) 
	WriteRoleValue( Dummy , EM_RoleValue_LiveTime , 5 )
	DelFromPartition( Dummy )
	AddToPartition( Dummy , Room)
	BeginPlot( Dummy , "Lua_RedLighting_Skill_Effect" , 0)
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),101352,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	
	return true
end

function Lua_RedLighting_Skill_Effect()
	sleep(15)
	CastSpellLV( OwnerID() , OwnerID() ,490534, 2 )	
end

function Lua_RedLighting_Charge_Effect()
	AddBuff( OwnerID() , 501072 , 1 , 1 )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) ~= 1 then
		AddBuff( TargetID() , 502174 , 1 ,1 )
	end
end