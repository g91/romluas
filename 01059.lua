function LuaI_ThirdBoss_Agriza()
	local Flag = 780211
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Martther = CreateObjByFlag( 101349 , flag , 1 , 1)
	local Gaia = CreateObjByFlag( 101350 , flag , 2 , 1)
	local Aldigard = CreateObjByFlag( 101351 , flag , 3 , 1)
	local Boss = { [1] = Martther , [2] = Gaia , [3] = Aldigard  }
	local State = "Close"
	WriteRoleValue( Martther ,EM_RoleValue_Register + 1 , Gaia )
	WriteRoleValue( Martther ,EM_RoleValue_Register + 2 ,  Aldigard)
	WriteRoleValue( Gaia ,EM_RoleValue_Register + 1 , Martther  )
	WriteRoleValue( Gaia ,EM_RoleValue_Register + 2 , Aldigard)	
	WriteRoleValue( Aldigard,EM_RoleValue_Register + 1 ,  Martther  )
	WriteRoleValue(Aldigard ,EM_RoleValue_Register + 2 ,  Gaia)
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )

	for i = 1 ,3 ,1 do
		Show( Boss[i] , Room )
		WriteRoleValue( Boss[i] ,EM_RoleValue_Register ,  0 )
		SetPlot( Boss[i] ,"dead" ,  "LuaDead_ThirdBoss_Agriza" , 0 )
	end
	sleep(10)
	for i = 1 , 3 , 1 do
		AddBuff( Boss[i] , 502698 , 60 , -1 )
	end

	BeginPlot( Martther , "LuaI_Martther_AI" , 0 )
	BeginPlot( Gaia , "LuaI_Gaia_AI" , 0 )
	BeginPlot( Aldigard , "LuaI_Aldigard_AI" , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )

	while 1 do
		State = "Open"
		for i = 1 , 3 , 1 do
			if CheckID(Boss[i]) == true and HateListCount( Boss[i] ) > 0 then
				State = "Close"
			end
		end
		if State == "Open" and ReadRoleValue(OwnerID(), EM_RoleValue_PID ) == 1 then
			Hide( OwnerID() )
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
			local Reset = 0
			for i = 1 , 3 , 1 do
				if CheckID( Boss[i] ) == false or ReadRoleValue( Boss[i] , EM_RoleValue_IsDead ) == 1  or ReadRoleValue( Boss[i] , EM_RoleValue_RoomID ) ~= Room or ReadRoleValue( Boss[i] , EM_RoleValue_IsNPC ) ~= 1 then
					Reset = Reset + 1
				end
			end
			if Reset < 3 then
				for i = 1 , 3 , 1 do	
--					Yell( Boss[i] , Boss[1].." & "..Boss[2].." & "..Boss[3] , 5 ) 				
					if CheckID( Boss[i] ) == true then
						if ReadRoleValue( Boss[i] , EM_RoleValue_IsDead ) == 0  and ReadRoleValue( Boss[i] , EM_RoleValue_RoomID ) == Room and ReadRoleValue( Boss[i] , EM_RoleValue_IsNPC ) == 1 then
							Delobj( Boss[i] )
						end
					end
				end
				sleep( 30 )
				Martther = CreateObjByFlag( 101349 , flag , 1 , 1)
				Gaia = CreateObjByFlag( 101350 , flag , 2 , 1)
				Aldigard = CreateObjByFlag( 101351 , flag , 3 , 1)
				Boss = { [1] = Martther , [2] = Gaia , [3] = Aldigard  }

				WriteRoleValue( Martther ,EM_RoleValue_Register + 1 , Gaia )
				WriteRoleValue( Martther ,EM_RoleValue_Register + 2 ,  Aldigard)
				WriteRoleValue( Gaia ,EM_RoleValue_Register + 1 , Martther  )
				WriteRoleValue( Gaia ,EM_RoleValue_Register + 2 , Aldigard)
				WriteRoleValue( Aldigard,EM_RoleValue_Register + 1 ,  Martther  )
				WriteRoleValue(Aldigard ,EM_RoleValue_Register + 2 ,  Gaia)

				for i = 1 ,3 ,1 do
					Show( Boss[i] , Room )
					WriteRoleValue( Boss[i] ,EM_RoleValue_Register ,  0 )
					SetPlot( Boss[i] ,"dead" ,  "LuaDead_ThirdBoss_Agriza" , 0 )
				end
				for i = 1 , 3 , 1 do
					AddBuff( Boss[i] , 502698 , 60 , -1 )
					sleep(2)
				end
				BeginPlot( Martther , "LuaI_Martther_AI" , 0 )
				BeginPlot( Gaia , "LuaI_Gaia_AI" , 0 )
				BeginPlot( Aldigard , "LuaI_Aldigard_AI" , 0 )
			end
		elseif State == "Close" and ReadRoleValue(OwnerID(), EM_RoleValue_PID ) == 0 then
			Show( OwnerID() , Room )
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
		end
		sleep( 60 )
	end

end

function LuaDead_ThirdBoss_Agriza()
	WriteRoleValue( OwnerID() ,  EM_RoleValue_Register  , 777 )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local StringID = "[SC_"..OrgID.."_0]"
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Say( OwnerID() , StringID )
	local Dead = "Yes"
	for i = 1 , 2 , 1 do
		local Role = ReadRoleValue( OwnerID() ,EM_RoleValue_Register + i )
		if CheckID( Role ) == true and ReadRoleValue( Role ,   EM_RoleValue_Register  ) < 1 then
			Dead ="No"
		end
	end
	if Dead == "No" then
		SetStopAttack(OwnerID() )
		Lua_CancelAllBuff( OwnerID() ) 
		AddBuff( OwnerID() ,502707 ,1 ,-1 )
		SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
		SetRoleCamp( OwnerID() , "Visitor" )
		PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
		BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )		
		return false
	end

	local Count = Ver_Zone252_Cyclops[Room]["BossDead"]
	Count = Count + 1
	Ver_Zone252_Cyclops[Room]["BossDead"] = Count
	if Count == 1 then
		ScriptMessage( OwnerID() , -1 , 2 ,"[SC_AGRIZA_BOSS1_04]" , 1 ) 
	elseif Count == 2 then
		ScriptMessage( OwnerID() , -1 , 2 ,"[SC_AGRIZA_BOSS1_05]", 1 )
	else
		ScriptMessage( OwnerID() , -1 , 2 ,"[SC_AGRIZA_BOSS1_06]", 1 )  
	end

	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),OrgID,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function LuaI_Martther_AI()
	local Count = 0
	local MaxMP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP )
	local DeltaMP = MaxMP / 20
	local Reset ="No"
	local Brother = {}
	Brother[1] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register + 1 )
	Brother[2]  = ReadRoleValue( OwnerID() ,EM_RoleValue_Register + 2 )
	Addbuff( OwnerID() , 501081 , 1 , -1 )
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			local Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if CheckID( Brother[2] ) == true then
				ClearHateList( OwnerID() ,-1)
			else
				EnableNpcAI( OwnerID() , true );
				if CheckBuff( OwnerID() , 501081 ) == true then
					CancelBuff( OwnerID() , 501081 )
				end
			end
			if ReadRoleValue( OwnerID() , EM_RoleValue_MP ) < DeltaMP then
				Reset = "Yes"
				Say( OwnerID() , "[SC_101349_1]" )
				AddBuff( OwnerID() , 502174, 1 , 20 )
			end
			if Count == 10 and Reset == "No" then
				Yell( OwnerID() , "[SC_101349_2]",5)
				CastSpellLV( OwnerID() , OwnerID() ,492173, 100 )  
				AddRoleValue( OwnerID() , EM_RoleValue_MP , -DeltaMP )
			end
			if Count == 20 and Reset == "No" then
				Yell( OwnerID() , "[SC_101349_2]" , 5 )
				local Support
				if CheckID( Brother[2] ) == true and ReadRoleValue( Brother[2]  , EM_RoleValue_IsNPC ) == 1 then
					Support = ReadRoleValue( Brother[2] , EM_RoleValue_AttackTargetID )
				else
					Support = ReadRoleValue(OwnerID(), EM_RoleValue_AttackTargetID )
				end
				CastSpellLV( OwnerID() , Support , 492172 , 150 )
				AddRoleValue( OwnerID() , EM_RoleValue_MP , -DeltaMP )
			end
			if Reset == "Yes" then
				AddRoleValue( OwnerID() , EM_RoleValue_MP , DeltaMP )
			end
			if ReadRoleValue( OwnerID() , EM_RoleValue_MP ) >= DeltaMP and Reset == "Yes" then
				Yell( OwnerID() , "[SC_101349_3]"  , 5 )
				Reset = "No" 
			end
			sleep(10)
			Count = Count + 1
			if Count > 20 then
				Count = 0
			end
		else
			local A = HateListInfo(Brother[1],0, EM_HateListInfoType_GItemID );
			local B = HateListInfo(Brother[2],0, EM_HateListInfoType_GItemID );
			if CheckID(B) == true and ReadRoleValue(B , EM_RoleValue_IsDead ) == 0 then
				SetAttack( OwnerID() , B )
			elseif CheckID(A) == true and ReadRoleValue(A , EM_RoleValue_IsDead ) == 0 then
				SetAttack( OwnerID() ,  A )
			end
			sleep( 50)
		end
	end
end

function LuaI_Gaia_AI()
	local Brother = {}
	Brother[1] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register + 1 )
	Brother[2]  = ReadRoleValue( OwnerID() ,EM_RoleValue_Register + 2 )
	Addbuff( OwnerID() , 501081 , 1 , -1 )
	local Count = 0
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			local Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if CheckID( Brother[1] ) == true or  CheckID( Brother[2] ) == true then
				ClearHateList( OwnerID() , -1)
			else
				EnableNpcAI( OwnerID() , true );
				if CheckBuff( OwnerID() , 501081 ) == true then
					CancelBuff( OwnerID() , 501081 )
				end
			end
			if Count >= 10 then
				if CheckID( Brother[2] ) == true and ReadRoleValue( Brother[2]  , EM_RoleValue_IsNPC ) == 1 then
					CastSpellLV( OwnerID() , Brother[2] , 492170 , 1 )
				elseif CheckID( Brother[1] ) == true and ReadRoleValue( Brother[1]  , EM_RoleValue_IsNPC ) == 1 then
					CastSpellLV( OwnerID() , Brother[1] , 492170 , 1 )		
				else
					CastSpellLV( OwnerID() , OwnerID() , 492170 , 1 )
				end
			end
			sleep(10)
			Count = Count + 1
			if Count > 10 then
				Count = 0
			end
		else
			local A = HateListInfo(Brother[1],0, EM_HateListInfoType_GItemID );
			local B = HateListInfo(Brother[2],0, EM_HateListInfoType_GItemID );
			if CheckID(B) == true and ReadRoleValue(B , EM_RoleValue_IsDead ) == 0 then
				SetAttack( OwnerID() , B )
			elseif CheckID(A) == true and ReadRoleValue(A , EM_RoleValue_IsDead ) == 0 then
				SetAttack( OwnerID() ,  A )
			end
			sleep( 50)
		end
	end
end

function LuaI_Aldigard_AI()
	local Brother = {}
	Brother[1] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register + 1 )
	Brother[2]  = ReadRoleValue( OwnerID() ,EM_RoleValue_Register + 2 )
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			if CheckBuff( OwnerID() , 502370 ) == false then
				AddBuff( OwnerID() , 502370 , 1 , -1 )
			end
			sleep(10)
		else
			local A = HateListInfo(Brother[1],0, EM_HateListInfoType_GItemID );
			local B = HateListInfo(Brother[2],0, EM_HateListInfoType_GItemID );
			if CheckID(A) == true and ReadRoleValue(B , EM_RoleValue_IsDead ) == 0 then
				SetAttack( OwnerID() , B )
			elseif CheckID(B) == true and ReadRoleValue(A , EM_RoleValue_IsDead ) == 0 then
				SetAttack( OwnerID() ,  A )
			end
			if CheckBuff( OwnerID() , 502370 ) == true then
				CancelBuff( OwnerID() , 502370)
			end
			sleep( 50)
		end
	end
end

function LuaSpellCheck_502374()
	if ReadRoleValue( targetID() , EM_RoleValue_IsPlayer ) ~= 1 then
		return false
	end
	return true
end

function LuaS_101361_0()
	Say( OwnerID() , "[SC_101361_0]" )
end


function LuaS_101361_1()
	MoveToFlagEnabled ( OwnerID(), false )
	Say( OwnerID() , "[SC_101361_1]" )
	sleep(20)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_BUFF_INSTANT)
	AddBuff(OwnerID() , 502665 , 19 , 35 )
	sleep(20)
	Say( OwnerID() , "[SC_101361_2]" )
	MoveToFlagEnabled ( OwnerID(), true )
end


