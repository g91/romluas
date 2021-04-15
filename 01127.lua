function LuaI_101432_BossAI()
	local Battle = "No"
	local State = "Normal"
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	local Count = 0
	local Ball = {}
	local Obj = {[0] = 101399 , [1] = 101398 , [2] = 101397 }
	local Spell = {[0] = 502528 , [1] = 502527 , [2] = 502526 }
	local SpellLV = {[0] = 150 , [1] = 170 , [2] = 75 }
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = Role:new( OwnerID())
	local Pos = {}
	local Dis = 60
	local DeltaR = 60
	SetFightMode( OwnerID() , 1 , 0 , 0 , 1 )
	SetPlot( OwnerID() , "Dead" ,"LuaI_203Boss_Dead" , 40 )
	while 1 do
		if HateListCount( OwnerID() ) > 0 then

			if Battle == "No" then
				for i = 0 , 2 , 1 do
					Pos["X"] = Boss:X()+(Dis+i*DeltaR)*math.cos(i*2*math.pi/3) 
					Pos["Z"] = Boss:Z()+(Dis+i*DeltaR)*math.sin(i*2*math.pi/3) 
					Pos["Y"] = GetHeight( Pos["X"] , Boss:Y() , Pos["Z"]  );
					Ball[i] = CreateObj ( Obj[i] , Pos["X"] , Pos["Y"]  ,Pos["Z"] , 0 , 1)
					SetModeEx( Ball[i] , EM_SetModeType_Mark, false) 
					SetModeEx( Ball[i] , EM_SetModeType_HideName, false) 
					SetModeEx( Ball[i], EM_SetModeType_ShowRoleHead, false) 
					SetModeEx( Ball[i], EM_SetModeType_Strikback, false) 
					MoveToFlagEnabled( Ball[i] , false )
					SetFightMode( Ball[i] , 0 , 1 , 0 , 0 )
					AdjustFaceDir( Ball[i] , OwnerID(),  0 ) 
					sleep( 5 )
					AddToPartition( Ball[i] , RoomID )
					BeginPlot( Ball[i] , "LuaI_101432_Ball" , 0 )
				end
				Battle = "Yes"
			end

			if ReadRoleValue( OwnerID() , EM_RoleValue_HP ) <= MaxHP/10  then
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 3 )
				CastSpellLV( OwnerID() , OwnerID() , 492312 , 70 )
				if State == "Normal" then
					ScriptMessage( OwnerID() , -1 , 1 , "[SC_101432_0]" , 0 )
					for i = 0 , 2 , 1 do
						AddBuff(Ball[i] ,Spell[i] , 2*SpellLV[i] , -1 )
					end
					State = "Last"
				end
			end

			if Count < 20 then
				if Count == 1 then
					WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
				end
				local Num = Rand(100)
				local SPSkill = Num - (math.floor(Num/10)*10) 
				local Near = "No"
				local NearCheck
				for i = 0 , HateListCount( OwnerID() ) - 1 , 1 do
					if GetDistance( OwnerID() , HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) ) < 75 then
						Near = "Yes"
						break
					end
				end
				if Num == 3 or Num == 5 or Num == 7 then
					local RandNum = Rand(3)
					EnableNpcAI( OwnerID() , false );
					CastSpellLV(Ball[RandNum] , OwnerID() , 492311 , 45 )
					for i = 1 , 100 , 1 do
						CastSpellLV( OwnerID() , Ball[RandNum], 492334 , 45 )
						sleep(1)
					end
					Count = Count + 10
					EnableNpcAI( OwnerID() , true );
				elseif Num == 2 or Num == 4 or Num == 6 then
					EnableNpcAI( OwnerID() , false );
					Say( OwnerID() , "[SC_101432_3]" )
					sleep( 40 )
					CastSpellLV(OwnerID() , OwnerID() , 490539 , 3 )
					sleep( 10 )
					Count = Count + 5
				elseif Near == "No" then
					EnableNpcAI( OwnerID() , false );
					for  i = 1 , 3 , 1 do
						local Num = Rand(HateListCount( OwnerID() ))
						local Target = HateListInfo(OwnerID() ,Num , EM_HateListInfoType_GItemID );
						CastSpellLV(OwnerID() , Target , 492310 , 150 )
					end
				end
				EnableNpcAI( OwnerID() , true );
			end

			if Count == 20 and ReadroleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_101432_1]" , 0 )
				EnableNpcAI( OwnerID() , false );
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
				CastSpellLV( OwnerID() , OwnerID() , 492313 , 7)
				--for i = 0 , 2 , 1 do
				--	CastSpellLV( Ball[i] , Ball[i] , 492313 , 7 )
				--end
			end

			if Count == 30 and ReadroleValue( OwnerID() , EM_RoleValue_PID ) == 1 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_101432_2]" , 0 )
				CastSpellLV( OwnerID() , OwnerID() , 492314 , 450)
				--for i = 0 , 2 , 1 do
				--	CastSpellLV( Ball[i] , Ball[i] , 492314 , 450)
				--end
				AddBuff( OwnerID() , 502530 , 1 , 10 )
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
				EnableNpcAI( OwnerID() , true );
			end

			if Count == 30 then
				Count = 0
			end

			sleep(10)
			Count = Count + 1

		else	
			Count = 0
			if Battle == "Yes" then
				for i = 0 , 2 , 1 do
					if CheckID( Ball[i] ) == true and ReadRoleValue( Ball[i] , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Ball[i] , EM_RoleValue_IsNPC ) == 1 then
						DelObj(Ball[i])
					end
				end
				Battle = "No"
			end
			sleep( 60 )
		end
	end
end

function LuaI_101432_Ball()
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local RaOrg = {[101397] = 4*math.pi/3 , [101398] = 2*math.pi/3 , [101399] = 0 }
	local Ra = RaOrg[OrgID] 
	local Spell = {[101397] = 502526 , [101398] = 502527 , [101399] = 502528 }
	local SpellLV = {[101397] = 75 , [101398] = 170 , [101399] = 170 }
	local Rate = {[101397] = 1 , [101398] = -1 , [101399] = 1 }
	local Boss = Role:new(TargetID())
	local dis = GetDistance( OwnerID() , TargetID() )
	local A = dis*math.cos(Ra)
	local B = dis*math.sin(Ra)
	local State
	local Pos ={}

	AddBuff( OwnerID() , Spell[OrgID] , SpellLV[OrgID] , -1 )
	if OrgID ~= 101397 then
		WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	else
		WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	end
	while 1 do
		Ra = Ra + (Rate[OrgID]/360)* (2*math.pi)
		ClearHateList( OwnerID() , -1 )
		State = ReadRoleValue( TargetID() , EM_RoleValue_PID )
		if Ra >= 2*math.Pi then 
			Ra = Ra - 2*math.Pi
		elseif Ra < 0 then
			Ra = 2*math.pi + Ra
		end
		if State == 3 then
			AddBuff( OwnerID() , Spell[OrgID] , 2*SpellLV[OrgID] , -1 )
		elseif State == 1  then
			if CheckBuff( OwnerID() , Spell[OrgID] ) == true then
				CancelBuff( OwnerID() , Spell[OrgID] )
			end			
		else
			if CheckBuff( OwnerID() , Spell[OrgID] ) == false then
				AddBuff( OwnerID() ,  Spell[OrgID], SpellLV[OrgID]  , -1 )
			end
		end
		if CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			CancelBuff( OwnerID() , Spell[OrgID] )
			CancelBuff( OwnerID() , Spell[OrgID] )
			CastSpellLV( OwnerID() , OwnerID() , 492314 , 240 )
			break
		end
		Pos["X"] = Boss:X()+dis*math.cos(Ra)
		Pos["Z"] = Boss:Z()+dis*math.sin(Ra)
		Pos["Y"] = GetHeight( Pos["X"] , Boss:Y() , Pos["Z"] );
		local SleepTime = MoveDirect( OwnerID(), Pos["X"]  , Pos["Y"] , Pos["Z"] ) 
		sleep(SleepTime)
	end
	Delobj( OwnerID() )
end

function LuaSpell_MagicShake()
	if ReadRoleValue( TargetID() , EM_RoleValue_MaxMP ) < 10 then
		AddBuff( TargetID() , 502437 , 1 , 5 )
	end
end

function LuaI_203Boss_Dead()
	local Door = CreateObjByFlag( 111432 , 780226 , 0 , 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		SetFlag( Party[i] , 542296 , 1 )
	end
	SetModeEx( Door , EM_SetModeType_Mark, false) 
	SetModeEx( Door , EM_SetModeType_HideName, false) 
	SetModeEx( Door, EM_SetModeType_ShowRoleHead, false) 
	AddToPartition( Door , RoomID )
	BeginPlot( Door , "LuaI_203Boss_OutDoor" , 0 )
	return true
end

function LuaI_203Boss_OutDoor()
	SetPlot( OwnerID() , "range" , "LuaI_203_BossTwo_EXIT" , 10 )
end