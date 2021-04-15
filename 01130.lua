function LuaI_101433_AI()
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = 0
	local State = "Normal"
	local Effect = "Stone"
	local Idio = "No"
	local Me = Role:new( OwnerID() )
	SetPlot( OwnerID() , "dead" , "LuaI_204Boss_Dead" , 40 )
	while 1 do
		if HateListCount( OwnerID() ) > 0 then
			local Target = HateListInfo(OwnerID() ,0, EM_HateListInfoType_GItemID );
			if ReadRoleValue( OwnerID() , EM_RoleValue_HP ) <= MaxHP / 10 then --血低於 10% 後的行動
				if CheckBuff( OwnerID() , 502550 ) == true then
					CancelBuff( OwnerID() , 502550 )
				end
				local Distance
				local Sub_Target
				if CheckBuff( OwnerID() , 502541 ) == true then
					CancelBuff( OwnerID() , 502541 )
				end
				if CheckBuff( OwnerID() , 502540 ) == false then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_101433_3]" , 1 ) --[101433]陷入瘋狂！
					AddBuff( OwnerID() , 502540 , 1 , -1 )
				end
				for i = 0 , HateListCount( OwnerID() ) - 1 , 1 do
					Sub_Target = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID );
					if GetDistance( OwnerID(), Sub_Target ) > GetDistance( OwnerID(), Target ) then
						Target = Sub_Target
					end
				end
				SetAttack( OwnerID() , Target )
				local Obj = Role:new( Target )
				local Pos = {[1] = Obj:X() , [2] = Obj:Y() ,[3] = Obj:Z() }
				local PosMe = {[1] = Me:X() , [2] = Me:Y() ,[3] = Me:Z() }
				local Mist
				Count = 0
				for i = 0 , 60 , 1 do
					MoveDirect( OwnerID(), Pos[1] , Pos[2] , Pos[3] )
					if ( (PosMe[1]-Pos[1])^2 + (PosMe[3]-Pos[3])^2  ) < 2500 then
						break
					end
					sleep( 5 )
					Count = Count + 1
					if Count == 2 then
						Mist = LuaFunc_CreateObjByObj( 112145 , OwnerID())
						SetModeEx( Mist , EM_SetModeType_Mark, false) 
						SetModeEx( Mist , EM_SetModeType_HideName, false) 
						SetModeEx( Mist, EM_SetModeType_ShowRoleHead, false) 
						SetModeEx( Mist, EM_SetModeType_Strikback, false) 
						WriteRoleValue( Mist , EM_RoleValue_LiveTime , 20 )
						DelFromPartition( Mist )
						AddToPartition( Mist , RoomID )
						BeginPlot( Mist , "LuaI_Zone5_Dun_StoneMist" , 0 )
					end
					if Count == 4 then
						Mist = LuaFunc_CreateObjByObj( 112145 , OwnerID())
						SetModeEx( Mist , EM_SetModeType_Mark, false) 
						SetModeEx( Mist , EM_SetModeType_HideName, false) 
						SetModeEx( Mist, EM_SetModeType_ShowRoleHead, false) 
						SetModeEx( Mist, EM_SetModeType_Strikback, false) 
						WriteRoleValue( Mist , EM_RoleValue_LiveTime , 20 )
						DelFromPartition( Mist  )
						AddToPartition( Mist , RoomID )
						BeginPlot( Mist , "LuaI_Zone5_Dun_PoisonMist" , 0 )
						Count = 0
					end
				end
				if GetDistance( OwnerID(), Target ) < 50 then
					CastSpellLV( OwnerID() , Target , 490524 , 20 )
					Sleep( 15 )
				end
				AddBuff( OwnerID() ,502174 , 1 , 5 )
				sleep( 100 )
			else --一般時的行動
				
				if State == "Normal" then
					if CheckBuff( OwnerID() , 502541 ) == True then
						CancelBuff( OwnerID() , 502541 ) 
					end				
					if Count == 4 or Count == 14 or Count == 24 then --惡魔之吼或威嚇
						if Rand(100) > 80 or Rand(100) < 30 then
							CastSpellLV( OwnerID() , OwnerID() , 492324 , 10 )
						else
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_101433_0]" , 1 ) 
							AddBuff( OwnerID() , 502550 , 1 , 5 )
						end
					elseif Count == 9 and Count == 19 and Count == 29 then --解除威嚇狀態
						SetFightMode( OwnerID() , 1 , 1 , 0 , 1 )
						if CheckBuff( OwnerID() , 502550 ) == true then
							CancelBuff( OwnerID() , 502550 )
						end
					else
						if Rand(100) > 80 then
							CastSpellLV( OwnerID() , Target , 492327 , 2 )
						elseif Rand(100) < 20 then
							CastSpellLV( OwnerID() , OwnerID() , 492323 , 2 )
						end
					end
				else
					if CheckBuff( OwnerID() , 502550 ) == true then
						CancelBuff( OwnerID() , 502550 )
					end
					if CheckBuff( OwnerID() , 502541 ) == false then
						AddBuff( OwnerID() , 502541 , 1 , -1 ) 
					end
					if Count == 9 or Count == 19 or Count == 29 then
						local PosObj
						local Spell
						local PPL
						local String = ""
						if Effect == "Stone" then
							if HateListCount( OwnerID() ) > 1 then
								PPL = Rand(HateListCount( OwnerID() ) - 1) + 1
								PPL = HateListInfo(OwnerID() , PPL , EM_HateListInfoType_GItemID )
								String = "[SC_101433_1][$SETVAR1="..GetName(PPL).."]"
								PPL = Role:new( PPL )
							else
								String = "[SC_101433_1][$SETVAR1="..GetName(Target).."]"
								PPL = Role:new( Target )
							end
							ScriptMessage( OwnerID() , -1 , 2 , String , 1 ) --[101433]向[$VAR1]吐出石化煙霧
							PosObj = CreateObj( 112145, PPL:X() , PPL:Y() , PPL:Z() , Me:Dir() , 1)
							Spell = 492321
							Effect = "Poison"
						else
							String = "[SC_101433_2][$SETVAR1="..GetName(Target).."]"
							ScriptMessage( OwnerID() , -1 , 2 , String , 1 ) --[101433]向[$VAR1]吐出咒毒煙霧
							PosObj = LuaFunc_CreateObjByObj(112145 , Target)
							Spell = 492326
							Effect = "Stone"
						end

						SetModeEx( PosObj , EM_SetModeType_Mark, false) 
						SetModeEx( PosObj , EM_SetModeType_HideName, false) 
						SetModeEx( PosObj , EM_SetModeType_ShowRoleHead, false) 
						WriteRoleValue( PosObj , EM_RoleValue_LiveTime , 60 )
						DelFromPartition( PosObj)
						AddToPartition( PosObj , RoomID )
						CastSpell( OwnerID() , PosObj , Spell )
					else
						if Rand(100) < 20 and Rand(100) > 90 then
							CastSpellLV( OwnerID() , OwnerID() , 492323 , 2 )
						end
					end
				end
				
				Sleep(10)
				Count = Count + 1
				if Count >= 30 then
					if State == "Normal" then
						State = "Stone"
					else
						State = "Normal"
					end
					Count = 0
				end
			end
		else
			if CheckBuff( OwnerID() , 502540 ) == true then
				CancelBuff( OwnerID() , 502540 )
			end
			if CheckBuff( OwnerID() , 502541 ) == true then
				CancelBuff( OwnerID() , 502541 )
			end
			Count = 0 
			Sleep(60)
		end
	end
end

function LuaI_Zone5_Dun_StoneMist()

	SetFightMode( OwnerID(),0 , 1, 0 ,0 )
--	for i = 1 , 60 , 1 do
		CastSpell( OwnerID() , OwnerID() , 492256) 
		sleep(600)
--	end
	Delobj( OwnerID() )
end

function LuaI_Zone5_Dun_PoisonMist()

--	for i = 1 , 60 , 1 do
		CastSpellLV( OwnerID() , OwnerID() , 492322 , 200 ) 
		sleep(600)
--	end
	Delobj( OwnerID() )
end

function LuaI_204Boss_Dead()
	local Door = CreateObjByFlag( 111432 , 780227 , 0 , 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetModeEx( Door , EM_SetModeType_Mark, false) 
	SetModeEx( Door , EM_SetModeType_HideName, false) 
	SetModeEx( Door, EM_SetModeType_ShowRoleHead, false) 
	AddToPartition( Door , RoomID )
	BeginPlot( Door , "LuaI_204Boss_OutDoor" , 0 )
	return true
end

function LuaI_204Boss_OutDoor()
	SetPlot( OwnerID() , "range" , "LuaI_204_BossThree_EXIT" , 10 )
end