function YUYULua_100586_0()
	local Hun = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100175, 200 , 1) 
	local HunPID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101047, 200 , 1) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 


	WriteRoleValue(OwnerID() ,EM_RoleValue_Register+5 ,OwnerX  )
	WriteRoleValue(OwnerID() ,EM_RoleValue_Register+6 ,OwnerY )
	WriteRoleValue(OwnerID() ,EM_RoleValue_Register+7 ,OwnerZ )

--	say(OwnerID(),OwnerID())
--	say(OwnerID(),OwnerX  )
--	say(OwnerID(),OwnerY  )
--	say(OwnerID(),OwnerZ  )

	local Tina = Hun[0]

		if CheckID( Tina ) ~= false then


			local coolbo = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100044, 200 , 1) 
			local X = ReadRoleValue( coolbo[0], EM_RoleValue_PID )  
			WriteRoleValue(OwnerID() ,EM_RoleValue_Register ,X )

			local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
			WriteRoleValue(OwnerID() ,EM_RoleValue_Register+1 ,RoomID )

			WriteRoleValue( OwnerID() , EM_RoleValue_PID , Tina )
			SetPlot( OwnerID() , "dead","YUYULua_100586_1",0 )                              --死亡劇情

--		SAY(OwnerID(), 1)

			while true do
				sleep(10)
--				SAY(OwnerID(), 2)					
		if ReadRoleValue( Tina  , EM_RoleValue_IsDead ) == 1 or CheckID( Tina ) == false or ReadRoleValue( Tina , EM_RoleValue_IsPlayer ) == 1 then

					SetStopAttack( OwnerID()) 
					SetFightMode( OwnerID() , 0, 0, 0, 0 )
					Say( OwnerID() , GetString("SC_100175_YU_02") )   
					sleep(10)
					CastSpell( OwnerID(), OwnerID(), 491923)
					sleep(10)
					BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   
					sleep(10)
					Delobj( OwnerID() )
				end
			end



		else
			Delobj( OwnerID() )
		end


end




function YUYULua_100586_1()
	local X = ReadRoleValue(OwnerID() ,EM_RoleValue_Register )
	local RoomID = ReadRoleValue(OwnerID() ,EM_RoleValue_Register+1 )
	local Tina = ReadRoleValue( OwnerID() , EM_RoleValue_PID )           

	local OwnerX  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+5 ) 
	local OwnerY  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+6 ) 
	local OwnerZ  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+7 ) 


	if CheckID( Tina ) ~= false then
		local ID = CreateObjByFlag( 100586, 780184, X , 1 );       
		AddToPartition( ID , RoomID )  

		WriteRoleValue(ID ,EM_RoleValue_Register+5 ,OwnerX  )
		WriteRoleValue(ID ,EM_RoleValue_Register+6 ,OwnerY )
		WriteRoleValue(ID ,EM_RoleValue_Register+7 ,OwnerZ )

--		WriteRoleValue(ID ,EM_RoleValue_IsWalk ,0 ) --命令該角色都用跑的

--	say(ID,ID)
--	say(ID,OwnerX  )
--	say(ID,OwnerY  )
--	say(ID,OwnerZ  )

		BeginPlot( ID , "YUYULua_100586_2" , 0 )  
	end

	return true  
end

function YUYULua_100586_2()
	local HunPID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101047, 200 , 1) 
	local coolbo = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100044, 200 , 1) 
	local GAHO = LuaFunc_SearchNPCbyOrgID( coolbo[0] , 100586, 300 , 1) 

	local G1 = GAHO[0]
	local G2 = GAHO[1]
	local G3 = GAHO[2]
	local G4 = GAHO[3]
	local G5 = GAHO[4]

	local OwnerX  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+5 ) 
	local OwnerY  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+6 ) 
	local OwnerZ  = ReadRoleValue( OwnerID(), EM_RoleValue_Register+7 ) 

	local Tina = ReadRoleValue( HunPID[0], EM_RoleValue_PID )

--	say(OwnerID(),OwnerID())
--	say(OwnerID(),OwnerX  )
--	say(OwnerID(),OwnerY  )
--	say(OwnerID(),OwnerZ  )

		if ReadRoleValue( Tina  , EM_RoleValue_IsDead ) == 1 or CheckID( Tina ) == false or ReadRoleValue( Tina , EM_RoleValue_IsPlayer ) == 1 then
			Delobj( OwnerID() )
		else
			WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk , 0 ) --命令該角色都用跑的
			MoveToFlagEnabled( OwnerID(), false )
			sleep(10)
			LuaFunc_WaitMoveTo( OwnerID(), OwnerX , OwnerY , OwnerZ  )
--			MoveDirect( OwnerID(), OwnerX , OwnerY , OwnerZ  )

		end	

	sleep(10)



		if CheckID( Tina ) ~= false then
			local X = ReadRoleValue( coolbo[0], EM_RoleValue_PID )  
			WriteRoleValue(OwnerID() ,EM_RoleValue_Register ,X )

			local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
			WriteRoleValue(OwnerID() ,EM_RoleValue_Register+1 ,RoomID )

			WriteRoleValue( OwnerID() , EM_RoleValue_PID , Tina )
			SetPlot( OwnerID() , "dead","YUYULua_100586_1",0 )

			if checkID(Tina) ~= false and ReadRoleValue( Tina , EM_RoleValue_AttackTargetID ) ~= 0 then 	
			 	local PP = ReadRoleValue( Tina , EM_RoleValue_AttackTargetID)
				SetAttack( OwnerID() , PP )

			elseif  checkID(G1) ~= false and ReadRoleValue( G1, EM_RoleValue_AttackTargetID ) ~= 0  then 	
			 	local PP = ReadRoleValue( G1, EM_RoleValue_AttackTargetID)
				SetAttack( OwnerID() , PP )

			elseif  checkID(G2) ~= false and ReadRoleValue( G2 , EM_RoleValue_AttackTargetID ) ~= 0  then 
			 	local PP = ReadRoleValue( G2, EM_RoleValue_AttackTargetID)
				SetAttack( OwnerID() , PP )

			elseif  checkID(G3) ~= false and ReadRoleValue( G3 , EM_RoleValue_AttackTargetID ) ~= 0  then 
			 	local PP = ReadRoleValue( G3, EM_RoleValue_AttackTargetID)
				SetAttack( OwnerID() , PP )

			elseif  checkID(G4) ~= false and ReadRoleValue( G4 , EM_RoleValue_AttackTargetID ) ~= 0  then 
			 	local PP = ReadRoleValue( G4, EM_RoleValue_AttackTargetID)
				SetAttack( OwnerID() , PP )

			elseif  checkID(G5) ~= false and ReadRoleValue( G5 , EM_RoleValue_AttackTargetID ) ~= 0  then 
			 	local PP = ReadRoleValue( G5, EM_RoleValue_AttackTargetID)
				SetAttack( OwnerID() , PP )
			end


			while true do
				sleep(10)
--				SAY(OwnerID(), 4)					
		if ReadRoleValue( Tina  , EM_RoleValue_IsDead ) == 1 or CheckID( Tina ) == false or ReadRoleValue( Tina , EM_RoleValue_IsPlayer ) == 1 then

					SetStopAttack( OwnerID()) 
					SetFightMode( OwnerID() , 0, 0, 0, 0 )
					Say( OwnerID() , GetString("SC_100175_YU_02") )   
					sleep(10)
					CastSpell( OwnerID(), OwnerID(), 491923)
					sleep(10)
					BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   
					sleep(10)
					Delobj( OwnerID() )
				end
			end



		else
			Delobj( OwnerID() )
		end


end