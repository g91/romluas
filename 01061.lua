function LuaFunc_Zurhidon_GuardDead()
	local Owner = ReadRoleValue( OwnerID() , EM_RoleValue_Register  ) 
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID  ) 
	local Guard = {}
	local Count = 0
	local You = Role:new( TargetID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )

	for i = 1 , 4 , 1 do
		Guard[i] = ReadRoleValue( Owner , EM_RoleValue_Register + i  )
	end

	for i = 1 , 4 , 1 do
		if ReadRoleValue( Guard[i] , EM_RoleValue_PID  ) == 1 then
			Count = Count + 1
		end
	end

	SetStopAttack(OwnerID() )
	SetFightMode ( OwnerID(),0, 0, 0,0 )
	ClearHateList( OwnerID() , -1 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)

	if ReadRoleValue( Owner, EM_RoleValue_PID ) == 0 then
		if Count < 4 then
			Yell( Owner , "[SC_101347_0]" ,5)
		else
			Yell( Owner , "[SC_101347_1]" ,5)
			SetPos( Owner, You:X() + 20 , You:Y(), You:Z()+ 20 , You:Dir()+180 )
			AdjustFaceDir( Owner , TargetID(), 0 ) 
			BeginPlot( Owner , "LuaFunc_Zurhidon_GuestAI" , 0 )
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_HP , 0 )
	for i = 1 , BuffCount(OwnerID() ) , 1 do
		local BuffID = BuffInfo( OwnerID() , i-1 , EM_BuffInfoType_BuffID)
		CancelBuff( OwnerID() , BuffID )
	end
	AddBuff( OwnerID() ,502707 ,1 ,-1 );
	AddBuff( OwnerID() , 502550 , 1 , 86400 )
	return false
end

function LuaFunc_Zurhidon_Guard()
	local BuffTable = { [1] = 4 , [2] = 6 , [3]= 7 ,[4] = 17 , [5] = 37 , [6] = 43  ,[7] = 44 , [8] = 45 , [9] = 59 , [10] = 101}
	local Count = 0
	local Guard = OwnerID()
	local Boss = ReadRoleValue( Guard , EM_RoleValue_Register  ) 
	local BackupTarget 
	sleep(20)
	CancelBuff( Guard , 502550 )
	SetFightMode( Guard , 1 , 1 , 1 , 1 )
	while 1 do
		if ReadRoleValue( Guard , EM_RoleValue_PID ) < 1 or 
		ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 or
		ReadRoleValue( Boss , EM_RoleValue_PID ) == 0  then
			break
		end
		
		if HateListCount( Guard ) < 1 and HateListCount( Boss ) > 0 then
			if GetDistance( Guard , Boss ) <= 500 then
				BackupTarget  = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
				SetAttack( Guard , BackupTarget )
			else
				local MoveNPC = Role:new( Boss )
				Move( Guard , MoveNPC:X() , MoveNPC:Y() , MoveNPC:Z() )
			end
		end
		if CheckBuff( Guard , 502289 ) == false then
			local Buff = BuffCount ( Guard)	
			for i = 1 , Buff , 1 do
				local BuffID = BuffInfo( Guard  , Buff-i , EM_BuffInfoType_BuffID)
				if BuffID > 0 then
					for j = 1 , table.getn(BuffTable) , 1 do
						if GameObjInfo_int ( BuffID , "AssistType" ) == BuffTable[j] then
							CancelBuff( Guard , BuffID )
							AddBuff( Guard ,502289 , 25  , 30 );
						end
					end
				end			
			end	
		end
		if Count == 15 then
			if CheckBuff( Guard , 502289 ) == false then
				CastSpell( Guard , Guard , 490512)
			end
			Count = 0
		end
		sleep(10)
		Count = Count +1
	end
	AddRoleValue( Boss , EM_RoleValue_Register+7 , 1 )
	SetStopAttack( Guard )
	SetFightMode ( Guard,0, 0, 0,0 )
	PlayMotionEX( Guard, ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(15)
	Delobj( Guard )
end
function LuaI_Zurhidon_Door()
	local flag = 780204
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 101347 , flag , 0 , 1)
	local Guard = {}
	AddToPartition( Boss , Room )
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	Beginplot( Boss , "LuaI_Zurhidon_GuestAI" , 0 )
	sleep(30)
	Hide( OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )

	while 1 do
		local BossState = ReadRoleValue( Boss , EM_RoleValue_PID )
		local GuardState = 0
		local DoorState = "Open"
		for i = 1, 4 , 1 do
			Guard[i] = ReadRoleValue( Boss, EM_RoleValue_Register + i )
		end 
		for i = 1 , 4 ,1 do
			if HateListCount( Guard[i]) > 0  then
				GuardState = 1
			end
		end
		if CheckID( Boss ) == true then
			BossState = ReadRoleValue( Boss , EM_RoleValue_PID )
		else
			BossState = 0
		end
		if GuardState == 0 and BossState == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 0 then
			Hide( OwnerID() )
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
		elseif GuardState > 0 or BossState > 0 then
			Show( OwnerID() ,Room )
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
		end
		sleep( 60 )
	end
end
function LuaI_101354()
	SetCursorType( OwnerID() ,eCursor_Interact)
	SetPlot( OwnerID() , "touch" , "LuaI_101354_Touch" , 50 )
end

function LuaI_101354_Touch()
	BeginPlot( TargetID() , "LuaI_101354_Open" , 0 )
end

function LuaI_101354_Open()

	local ObjID =  TargetID() 
	local result = false;
	if( ReadRoleValue( OwnerID() ,EM_RoleValue_IsDead) == 1 ) then
		return;
	end
	if( ReadRoleValue( OwnerID() ,EM_RoleValue_PID) ~= 1 ) then
		ScriptMessage( ObjID,ObjID,0,"[SC_101354_0]", 0 );	
		return;
	end

	if BeginCastBar( ObjID , "[SC_101354_1]", 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
		ScriptMessage( ObjID , ObjID , 0, "[SAY_NPC_BUSY]", 0 )
		return
	end

	SetPlot( OwnerID() , "touch" , "" , 0 )
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( ObjID  );
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- жие\
				result = true
				EndCastBar( ObjID  , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- ев▒╤
				result = false
				EndCastBar( ObjID  , CastBarStatus )
				SetPlot( OwnerID() , "touch" , "LuaI_101354_Touch" , 50 )
				return;
			end
		end
	end

	if ( result == true ) then
		SetPlot( OwnerID() , "touch" , "" , 0 )
		 KillID( ObjID  , OwnerID() )
	end

end

function Lua_111611_0()
	local Boss = ReadRoleValue( targetID() ,EM_RoleValue_Register )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if CheckID(Boss) == true and ReadRoleValue( Boss , EM_RoleValue_RoomID) == RoomID and ReadRoleValue( Boss , EM_RoleValue_IsNPC) == 1 then
		SetSpeakDetail( OwnerID(), "[SC_111611_1]" )
	else
		LoadQuestOption( OwnerID() )
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_111611_2]", "Lua_111611_1",0 );
	end 
end

function Lua_111611_1()
	local Present = ReadRoleValue( targetID() ,EM_RoleValue_Register+1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if CheckID( Present) == true and ReadRoleValue( Present , EM_RoleValue_RoomID) == RoomID and ReadRoleValue( Present, EM_RoleValue_IsNPC) == 1 then
		if ReadRoleValue(Present ,EM_RoleValue_PID ) == 0 then
			SetSpeakDetail( OwnerID(), "[SC_111611_3]" )
			WriteRoleValue( Present ,EM_RoleValue_PID , 1 )
		else
			SetSpeakDetail( OwnerID(), "[SC_111611_4]" )
		end
	else
			SetSpeakDetail( OwnerID(), "[SC_111611_5]" )
	end
end

function Lua_111612_0()
	local Boss = ReadRoleValue( targetID() ,EM_RoleValue_Register )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if CheckID(Boss) == true and ReadRoleValue( Boss , EM_RoleValue_RoomID) == RoomID and ReadRoleValue( Boss , EM_RoleValue_IsNPC) == 1 then
		SetSpeakDetail( OwnerID(), "[SC_111612_1]" )
	else
		LoadQuestOption( OwnerID() )
	end 
end

function Lua_SlavePlay()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep( 30 )
	SetDir( OwnerID(), 175)
	sleep(5)
	Yell( OwnerID() , "[SC_111611_6]" , 5 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG )	
end