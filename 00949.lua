function LuaI_101219_2_YU_1() 

	local Golu = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101028 , 200 , 1)             --隱藏劇情怪
	local StoneMaker = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101054 , 200 , 1)             --隱藏劇情怪
	local Coolbo = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100044 , 200 , 1)             --隱藏劇情怪

	local BossWolf = ReadRoleValue( Coolbo[0] , EM_RoleValue_PID )  
	local BossLeo = ReadRoleValue( Golu[0] , EM_RoleValue_PID )  


	local AttackStatue1 = ReadRoleValue( BossWolf , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否
	local AttackStatue2 = ReadRoleValue( BossLeo , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否

	local AttackTarget1 = ReadRoleValue( BossWolf  , EM_RoleValue_AttackTargetID )
	local AttackTarget2 = ReadRoleValue( BossLeo , EM_RoleValue_AttackTargetID )

	local A = 0
	local B = 0
	local C = 0
		while true do
		sleep(10)

			if ReadRoleValue( BossWolf , EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( BossLeo , EM_RoleValue_IsPlayer ) == 1 then
				A = 1
			end

			if CheckID( BossWolf ) == false and CheckID( BossLeo ) == false then
				B = 1
			end

			if ReadRoleValue( BossWolf , EM_RoleValue_IsDead ) == 1 and ReadRoleValue( BossLeo , EM_RoleValue_IsDead ) == 1 then
				C = 1
			end


			if A == 1 or B == 1 or C == 1 then

				--ScriptMessage(  OwnerID() , -1 , 0 , "Samog say CowB 死光了"  , C_Default  )	
				break			
				

			elseif ReadRoleValue( BossWolf , EM_RoleValue_IsDead ) == 1 or CheckID( BossWolf ) == false or ReadRoleValue( BossWolf , EM_RoleValue_IsPlayer ) == 1 then
				sleep(100)
				ScriptMessage( BossLeo , -1 , 1 , GetString("SC_101222_YU_12") , C_Default  )
				sleep(60)
				Samog = CreateObjByFlag( 101219, 780097, 14 , 1 );            --產生薩摩格
				AddToPartition( Samog , 0) 

				WriteRoleValue( Samog , EM_RoleValue_Register+7 , BossWolf )
				WriteRoleValue( Samog , EM_RoleValue_Register+8 , BossLeo  )
	
				SAY( Samog , GetString("SC_101222_YU_13") )  
				ScriptMessage( Samog , -1 , 1 , GetString("SC_101222_YU_13") , C_Default  )
				sleep(10)

				local Player = SearchRangePlayer( Samog  , 300 )
				
					If CheckID( Player[0] ) == true then
						SetAttack( Samog , Player[0] )
						BeginPlot( Samog , "LuaI_101219_2_YU_2" , 0 )        
						break
					else
						local AttackTarget = ReadRoleValue( BossLeo , EM_RoleValue_AttackTargetID )
						SetAttack( Samog , AttackTarget )
						BeginPlot( Samog , "LuaI_101219_2_YU_2" , 0 )       
						break
					end

				break

			elseif ReadRoleValue( BossLeo , EM_RoleValue_IsDead ) == 1 or CheckID( BossLeo ) == false or ReadRoleValue( BossLeo , EM_RoleValue_IsPlayer ) == 1 then
				sleep(100)
				ScriptMessage( BossWolf , -1 , 1 , GetString("SC_101222_YU_12") , C_Default  )
				sleep(60)
				Samog = CreateObjByFlag( 101219, 780097, 14 , 1 );            --產生薩摩格
				AddToPartition( Samog , 0) 

				WriteRoleValue( Samog , EM_RoleValue_Register+7 , BossWolf )
				WriteRoleValue( Samog , EM_RoleValue_Register+8 , BossLeo  )
	
				SAY( Samog , GetString("SC_101222_YU_13") )  
				ScriptMessage( Samog , -1 , 1 , GetString("SC_101222_YU_13") , C_Default  )
				sleep(10)

				local Player = SearchRangePlayer ( Samog  , 300 )
				
					If CheckID( Player[0] ) == true then
						SetAttack( Samog , Player[0] )
						BeginPlot( Samog , "LuaI_101219_2_YU_2" , 0 )    
						break
					else
						local AttackTarget = ReadRoleValue( BossWolf , EM_RoleValue_AttackTargetID )
						SetAttack( Samog , AttackTarget )
						BeginPlot( Samog , "LuaI_101219_2_YU_2" , 0 )    
						break
					end
    

			end
		end
end

function LuaI_101219_2_YU_2()   --薩摩格血量太少則死劇情
		
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
		local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
		local HPPercent = NowHP / MaxHP

		local BossWolf = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )  
		local BossLeo = ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 )  

		while true do
		sleep(10)
			if HPPercent < 0.3 then		
				SAY( OwnerID() , GetString("SC_101222_YU_14") )  
				ScriptMessage( OwnerID() , -1 , 1 , GetString("SC_101222_YU_14") , C_Default  )
				CastSpell( OwnerID() , OwnerID() , 491920) 
				sleep(40)
				Delobj( OwnerID() )
				break

			elseif ReadRoleValue( BossWolf , EM_RoleValue_IsDead ) == 1 or CheckID( BossWolf ) == false or ReadRoleValue( BossWolf , EM_RoleValue_IsPlayer ) == 1 then

 				if ReadRoleValue( BossLeo , EM_RoleValue_IsDead ) == 1 or CheckID( BossLeo ) == false or ReadRoleValue( BossLeo , EM_RoleValue_IsPlayer ) == 1 then

					BeginPlot( OwnerID()  , "LuaP_Dead" , 0 )   
					sleep(20)
					Delobj( OwnerID() )
					break

				end
			end
		end


end