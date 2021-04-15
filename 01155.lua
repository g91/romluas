function LuaI_GoldenCupCurse(Type)

	if Type == "Near" then
		if GetDistance( TargetID() , OwnerID() )  <=  120 then
			return true
		end
	else
		if GetDistance( TargetID() , OwnerID() ) > 120 then
			return true
		end		
	end

	return false
end

function LuaI_GoldenCupCreate()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 780240
	local Cups = {}
	local SetPID = {[1] = 0 , [2] = 0 , [3] = 0 , [4] = 0 , [5] = 0}
	local Pos = {}
	for i = 1 , 5 , 1 do
		Pos["X"] = GetMoveFlagValue( Flag , i , EM_RoleValue_X )
		Pos["Y"] = GetMoveFlagValue( Flag , i , EM_RoleValue_Y )
		Pos["Z"] = GetMoveFlagValue( Flag , i , EM_RoleValue_Z )
		Pos["Dir"] = GetMoveFlagValue( Flag , i , EM_RoleValue_Dir )
		Cups[i] = CreateObj ( 112097 , Pos["X"]  , Pos["Y"]  , Pos["Z"]  , Pos["Dir"]  , 1)
		SetModeEX( Cups[i] ,  EM_SetModeType_Gravity , false)
	end
	for i = 1 , 5 , 1 do --讓陣列SetPID 等於亂數排列的 Caps 陣列

		local Num = Rand(5) + 1

		for j = 1 , table.getn( SetPID ) , 1 do
			if SetPID[Num] ~= 0 then
				Num = Num + 1
				if Num > table.getn(SetPID) then
					Num = 1
					for k = 1 , table.getn(SetPID) , 1 do
						if SetPID[Num] ~= 0 then
							Num = Num + 1
						end
					end
				end
			else
				break
			end
		end

		SetPID[Num] = Cups[i]

	end

	for i = 1 , 5 , 1 do
		WriteRoleValue( SetPID[i] , EM_RoleValue_PID , i )
		AddToPartition( SetPID[i] , Room )
	end
	for i = 1 , 5 , 1 do
		for j = 1 , 5 , 1 do
			WriteRoleValue( SetPID[i] , EM_RoleValue_Register+j , Cups[j] )
		end
	end
--	Hide( OwnerID() )
end

function LuaS_GoldenCup_0()
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID ) 
	if PID == 1 then
		SetSpeakDetail( OwnerID(), "[SC_GOLDENCUP_1]"  ) --
	end
	if PID == 2 then
		SetSpeakDetail( OwnerID(), "[SC_GOLDENCUP_2]"  ) --
	end
	if PID == 3 then
		SetSpeakDetail( OwnerID(), "[SC_GOLDENCUP_3]"  ) --
	end
	if PID == 4 then
		SetSpeakDetail( OwnerID(), "[SC_GOLDENCUP_4]"  ) --
	end
	if PID == 5 then
		SetSpeakDetail( OwnerID(), "[SC_GOLDENCUP_5]"  ) --
	end
	if PID == 99 then
		SetSpeakDetail( OwnerID(), "[SC_GOLDENCUP_99]"  ) --不用試了，這是假的金杯。
	else
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_GOLDENCUP_0]" , "LuaS_GoldenCup_Do", 0 ); --拿起這個金杯
	end

end

function LuaS_GoldenCup_Do()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID()  , True )
	BeginPlot( TargetID() , "LuaS_GoldenCupEffect" , 0 )
end

function LuaS_GoldenCupEffect()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Monster = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )
	local Cups = {}
	local Flag = 780240
	local Tako
	if Monster == nil then
		Monster = 0
	end
	for i = 1 , 5 , 1 do
		ScriptMessage( OwnerID() , -1 , 2 ,"[SC_GOLDENCUP_6]" , 0 )
		ScriptMessage( OwnerID() , 0 , 1 ,"[SC_GOLDENCUP_7]" , 0 )
		Cups[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+i )
		DisableQuest( Cups[i] , True )
		Hide( Cups[i])
	end
	if PID == 1 then
		if CheckID( Monster ) == true then
			Tako  = LuaFunc_CreateObjByObj ( 101531 , Monster )
			DelObj( Monster )
		else
			Tako  = CreateObjByFlag( 101531, Flag , 0 , 1 );
			AddToPartition( Tako , Room )
		end
	else
		if CheckID( Monster ) == true then
			Tako  = LuaFunc_CreateObjByObj ( 101254 , Monster )
			Delobj( Monster )
		else
			Tako  = CreateObjByFlag( 101254, Flag , 0 , 1 );
			AddToPartition( Tako , Room )
			SetPlot( Tako , "Dead" , "LuaS_GoldenCupDead" , 0 )
		end
		BeginPlot( Tako , "LuaS_TakoBattleControl" , 0 )
	end
	for i = 1 , 5 , 1 do
		WriteRoleValue( Cups[i] , EM_RoleValue_Register+9 , Tako)
	end
	SetAttack( Tako , TargetID() )
	while 1 do
		if ReadRoleValue( Tako , EM_RoleValue_PID ) > 0 or ReadRoleValue( Tako , EM_RoleValue_IsDead ) > 0 or CheckID( Tako) == false then
			break
		end 
		if ReadRoleValue( Tako , EM_RoleValue_IsNPC ) == 0 or ReadRoleValue( Tako , EM_RoleValue_RoomID ) ~= Room then
			break
		end 
		sleep( 10 )
	end
	for i = 1 , 5 , 1 do
		Show( Cups[i] , Room)
		DisableQuest( Cups[i] , false)
		ScriptMessage( OwnerID() , 0 , 1 ,"[SC_GOLDENCUP_8]" , 0 )
		if PID == 1 then
			WriteRoleValue( Cups[i] , EM_RoleValue_PID , 99 )
			Hide( OwnerID() )
		end
	end
end

function LuaS_GoldenCupDead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 777 )
	SetStopAttack(OwnerID() )
--	SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )
	Lua_ObjDontTouch( OwnerID()  )
	Lua_CancelAllBuff( OwnerID()  ) 
--	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	SetRoleCamp( OwnerID() , "Visitor" )
	Hide( OwnerID() )
	Show( OwnerID() , RoomID )
	PlayMotionEX(OwnerID() ,ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD )
	return false
end
function LuaS_TakoBattleControl()
	sleep( 300 )
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			sleep( 10 )
		else
			break
		end
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ~= 777 then
		DelObj( OwnerID() )
	end
end