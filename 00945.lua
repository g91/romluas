function LuaI_101025_YU_1() 


	EYE01 = CreateObjByFlag( 101025, 780097, 9 , 1 );            --產生賢者
	SetFightMode(  EYE01, 0, 0, 0, 0 )
	AddToPartition( EYE01 , 0) 


	EYE02 = CreateObjByFlag( 101026, 780097, 10 , 1 );            --產生賢者
	SetFightMode(  EYE02, 0, 0, 0, 0 )
	AddToPartition( EYE02 , 0) 

	EYE03 = CreateObjByFlag( 101224, 780097, 11 , 1 );            --產生賢者 山治
	SetFightMode(  EYE03, 0, 0, 0, 0 )
	AddToPartition( EYE03 , 0) 

	EYE04 = CreateObjByFlag( 101225, 780097, 12 , 1 );            --產生賢者 阿密特
	SetFightMode(  EYE04, 0, 0, 0, 0 )
	AddToPartition( EYE04, 0) 

	EYE05 = CreateObjByFlag( 101226, 780097, 13 , 1 );            --產生賢者 娜莉
	SetFightMode(  EYE05, 0, 0, 0, 0 )
	AddToPartition( EYE05 , 0) 

	local Golu = LuaFunc_SearchNPCbyOrgID( EYE01 , 101028 , 200 , 1)             --隱藏劇情怪
	local StoneMaker = LuaFunc_SearchNPCbyOrgID( EYE01 , 101054 , 200 , 1)             --隱藏劇情怪
	local Coolbo = LuaFunc_SearchNPCbyOrgID( EYE01 , 100044 , 200 , 1)             --隱藏劇情怪


	BeginPlot( StoneMaker[0] , "LuaI_101219_2_YU_1" , 0 )                                                --薩摩格分身準備支援


	CastSpell( EYE01, EYE01, 491922)
	CastSpell( EYE02, EYE02, 491922)
	CastSpell( EYE03, EYE03, 491922)
	CastSpell( EYE04, EYE04, 491922)
	CastSpell( EYE05, EYE05, 491922)

	sleep(40)

	local BossWolf = ReadRoleValue( Golu[0] , EM_RoleValue_PID )   --沃特
	local BossLeo = ReadRoleValue( Coolbo[0] , EM_RoleValue_PID )   --里昂
	local PurpleID  = ReadRoleValue( OwnerID(),  EM_RoleValue_PID  ) --藍色寶箱的id

	local AttackStatue1 = ReadRoleValue( BossWolf , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否
	local AttackStatue2 = ReadRoleValue( BossLeo , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否
	local AttackTarget1 = ReadRoleValue( BossWolf  , EM_RoleValue_AttackTargetID )
	local AttackTarget2 = ReadRoleValue( BossLeo , EM_RoleValue_AttackTargetID )

	WriteRoleValue( StoneMaker[0] ,EM_RoleValue_Register+1 , EYE01 )
	WriteRoleValue( StoneMaker[0] ,EM_RoleValue_Register+2 , EYE02  )
	WriteRoleValue( StoneMaker[0] ,EM_RoleValue_Register+3 , EYE03  )
	WriteRoleValue( StoneMaker[0] ,EM_RoleValue_Register+4 , EYE04 )
	WriteRoleValue( StoneMaker[0] ,EM_RoleValue_Register+5 , EYE05  )
	WriteRoleValue( StoneMaker[0] ,EM_RoleValue_Register+6 , BossWolf )
	WriteRoleValue( StoneMaker[0] ,EM_RoleValue_Register+7 , BossLeo  )
	WriteRoleValue( StoneMaker[0] ,EM_RoleValue_Register+8 , PurpleID  )

	BeginPlot(  StoneMaker[0] , "LuaI_101025_YU_cowreset" , 0 )   --重生機制啟動


	if AttackStatue1 == 1 and  (  AttackTarget1 ~= 0 ) and ( CheckID( BossWolf  ) == true )  then

		SAY(  EYE01 , GetString("SC_101222_YU_08") )
		sleep(20)	
		SAY(  EYE02 , GetString("SC_101222_YU_09") )
		sleep(30)	
		SAY(  EYE01 , GetString("SC_101222_YU_10") )
		PlayMotion ( EYE01 , 109)                                  --表演動作 109代表 指揮前進	
		sleep(20)
		SetFightMode(  EYE01, 1, 1, 1, 1 )
		SetFightMode(  EYE02, 1, 1, 1, 1 )
		SetFightMode(  EYE03, 1, 1, 1, 1 )
		SetFightMode(  EYE04, 1, 1, 1, 1 )
		SetFightMode(  EYE05, 1, 1, 1, 1 )



		SetAttack( EYE01, BossWolf )
		SetAttack( EYE02, BossWolf )
		SetAttack( EYE04, BossWolf )	


		if  CheckID( BossLeo ) == true then
			SetAttack( EYE03, BossLeo )
			SetAttack( EYE05, BossLeo )
		else
			SetAttack( EYE03, BossWolf )
			SetAttack( EYE05, BossWolf )
		end

		while true do
		sleep(10)
			if  CheckID( BossWolf ) == true then
				SetAttack( EYE01, BossWolf )
				SetAttack( EYE02, BossWolf )
				SetAttack( EYE04, BossWolf )
			else
				SetAttack( EYE01, BossLeo )
				SetAttack( EYE02, BossLeo )
				SetAttack( EYE04, BossLeo )
			end
			if  CheckID( BossLeo ) == true then
				SetAttack( EYE03, BossLeo )
				SetAttack( EYE05, BossLeo )
			else
				SetAttack( EYE03, BossWolf )
				SetAttack( EYE05, BossWolf )
			end

			if CheckBuff( EYE01 , 502218 ) == false then                                                                       
				CastSpell( EYE01 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE02 , 502218 ) == false then                                                                       
				CastSpell( EYE02 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE03 , 502218 ) == false then                                                                       
				CastSpell( EYE03 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE04 , 502218 ) == false then                                                                       
				CastSpell( EYE04 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE05 , 502218 ) == false then                                                                       
				CastSpell( EYE05 , EYE01 , 492017)                                                              
			end


			if ReadRoleValue( BossWolf , EM_RoleValue_IsDead ) == 1 or CheckID( BossWolf ) == false or ReadRoleValue( BossWolf , EM_RoleValue_IsPlayer ) == 1 then
				SetAttack( EYE01, BossLeo )
				SetAttack( EYE02, BossLeo )
				SetAttack( EYE04, BossLeo )
				SetAttack( EYE03, BossLeo )
				SetAttack( EYE05, BossLeo )
			end
		end


	elseif AttackStatue2 == 1 and  (  AttackTarget2 ~= 0 ) and ( CheckID( BossLeo) == true )  then

		SAY(  EYE01 , GetString("SC_101222_YU_08") )
		sleep(20)	
		SAY(  EYE02 , GetString("SC_101222_YU_09") )
		sleep(30)	
		SAY(  EYE01 , GetString("SC_101222_YU_10") )
		PlayMotion ( EYE01 , 109)                                  --表演動作 109代表 指揮前進	
		sleep(20)
		SetFightMode(  EYE01, 1, 1, 1, 1 )
		SetFightMode(  EYE02, 1, 1, 1, 1 )
		SetFightMode(  EYE03, 1, 1, 1, 1 )
		SetFightMode(  EYE04, 1, 1, 1, 1 )
		SetFightMode(  EYE05, 1, 1, 1, 1 )


		SetAttack( EYE01, BossLeo )
		SetAttack( EYE02, BossLeo )
		SetAttack( EYE04, BossLeo )	

		if  CheckID( BossWolf ) == true then
			SetAttack( EYE03, BossWolf )
			SetAttack( EYE05, BossWolf )
		else
			SetAttack( EYE03, BossLeo )
			SetAttack( EYE05, BossLeo )
		end

		while true do
		sleep(10)
			if  CheckID( BossLeo ) == true then
				SetAttack( EYE01, BossLeo )
				SetAttack( EYE02, BossLeo )
				SetAttack( EYE04, BossLeo )
			else
				SetAttack( EYE01, BossWolf )
				SetAttack( EYE02, BossWolf )
				SetAttack( EYE04, BossWolf )
			end
			if  CheckID( BossWolf ) == true then
				SetAttack( EYE03, BossWolf )
				SetAttack( EYE05, BossWolf )
			else
				SetAttack( EYE03, BossLeo )
				SetAttack( EYE05, BossLeo )
			end

			if CheckBuff( EYE01 , 502218 ) == false then                                                                       
				CastSpell( EYE01 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE02 , 502218 ) == false then                                                                       
				CastSpell( EYE02 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE03 , 502218 ) == false then                                                                       
				CastSpell( EYE03 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE04 , 502218 ) == false then                                                                       
				CastSpell( EYE04 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE05 , 502218 ) == false then                                                                       
				CastSpell( EYE05 , EYE01 , 492017)                                                              
			end
			if ReadRoleValue( BossLeo , EM_RoleValue_IsDead ) == 1 or CheckID( BossLeo ) == false or ReadRoleValue( BossLeo , EM_RoleValue_IsPlayer ) == 1 then

				SetAttack( EYE01, BossWolf )
				SetAttack( EYE02, BossWolf )
				SetAttack( EYE04, BossWolf )
				SetAttack( EYE03, BossWolf )
				SetAttack( EYE05, BossWolf )
			end
		end

	else

		SAY(  EYE01 , GetString("SC_101222_YU_08") )
		sleep(10)	
		SAY(  EYE02 , GetString("SC_101222_YU_09") )
		sleep(10)	
		SAY(  EYE01 , GetString("SC_101222_YU_10") )
		PlayMotion ( EYE01 , 109)                                  --表演動作 109代表 指揮前進	
		sleep(20)
		SetFightMode(  EYE01, 1, 1, 1, 1 )
		SetFightMode(  EYE02, 1, 1, 1, 1 )
		SetFightMode(  EYE03, 1, 1, 1, 1 )
		SetFightMode(  EYE04, 1, 1, 1, 1 )
		SetFightMode(  EYE05, 1, 1, 1, 1 )



		SetAttack( EYE01, BossWolf )
		SetAttack( EYE02, BossWolf )
		SetAttack( EYE04, BossWolf )	

		if  CheckID( BossLeo ) == true then
			SetAttack( EYE03, BossLeo )
			SetAttack( EYE05, BossLeo )
		else
			SetAttack( EYE03, BossWolf )
			SetAttack( EYE05, BossWolf )
		end

		while true do
		sleep(10)

			if  CheckID( BossWolf ) == true then
				SetAttack( EYE01, BossWolf )
				SetAttack( EYE02, BossWolf )
				SetAttack( EYE04, BossWolf )
			else
				SetAttack( EYE01, BossLeo )
				SetAttack( EYE02, BossLeo )
				SetAttack( EYE04, BossLeo )
			end
			if  CheckID( BossLeo ) == true then
				SetAttack( EYE03, BossLeo )
				SetAttack( EYE05, BossLeo )
			else
				SetAttack( EYE03, BossWolf )
				SetAttack( EYE05, BossWolf )
			end

			if CheckBuff( EYE01 , 502218 ) == false then                                                                       
				CastSpell( EYE01 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE02 , 502218 ) == false then                                                                       
				CastSpell( EYE02 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE03 , 502218 ) == false then                                                                       
				CastSpell( EYE03 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE04 , 502218 ) == false then                                                                       
				CastSpell( EYE04 , EYE01 , 492017)                                                              
			end
			if CheckBuff( EYE05 , 502218 ) == false then                                                                       
				CastSpell( EYE05 , EYE01 , 492017)                                                              
			end

			if ReadRoleValue( BossWolf , EM_RoleValue_IsDead ) == 1 or CheckID( BossWolf ) == false or ReadRoleValue( BossWolf , EM_RoleValue_IsPlayer ) == 1 then

				SetAttack( EYE01, BossLeo )
				SetAttack( EYE02, BossLeo )
				SetAttack( EYE04, BossLeo )
				SetAttack( EYE03, BossLeo )
				SetAttack( EYE05, BossLeo )
			end
		end

	end 
end

function LuaI_101025_YU_cowreset() 


	local BossLeo= ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )       
	local BossWolf= ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )   
	local PurpleID= ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 )       

	local Fight = ReadRoleValue( OwnerID() , EM_RoleValue_PID )   



	--ScriptMessage( OwnerID(), -1 , 0 , "BossWolf="..BossWolf , C_SYSTEM )  
	--ScriptMessage( OwnerID(), -1 , 0 , "BossLeo="..BossLeo , C_SYSTEM )  
	--ScriptMessage( OwnerID(), -1 , 0 , "PurpleID="..PurpleID , C_SYSTEM )  
	--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight , C_SYSTEM )  


	while true do
	sleep(100)

	local AttackStatue1 = ReadRoleValue( BossWolf , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否
	local AttackStatue2 = ReadRoleValue( BossLeo , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否

	local AttackTarget1 = ReadRoleValue( BossWolf  , EM_RoleValue_AttackTargetID )
	local AttackTarget2 = ReadRoleValue( BossLeo , EM_RoleValue_AttackTargetID )

	local Wolfattack = ReadRoleValue( AttackTarget1 , EM_RoleValue_IsPlayer )
	local Leoattack = ReadRoleValue( AttackTarget2 , EM_RoleValue_IsPlayer )

	--ScriptMessage( OwnerID(), -1 , 0 , "S2" , C_SYSTEM )  

	--ScriptMessage( OwnerID(), -1 , 0 , "AttackStatue1="..AttackStatue1 , C_SYSTEM )  
	--ScriptMessage( OwnerID(), -1 , 0 , "AttackStatue2="..AttackStatue2 , C_SYSTEM )  
	--ScriptMessage( OwnerID(), -1 , 0 , "AttackTarget1="..AttackTarget1 , C_SYSTEM )  
	--ScriptMessage( OwnerID(), -1 , 0 , "AttackTarget2="..AttackTarget2 , C_SYSTEM )  
	--ScriptMessage( OwnerID(), -1 , 0 , "Wolfattack="..Wolfattack , C_SYSTEM )  
	--ScriptMessage( OwnerID(), -1 , 0 , "Leoattack="..Leoattack , C_SYSTEM )  

		if (CheckID( BossWolf  ) == true) and (CheckID( BossLeo  ) == true) and (ReadRoleValue( BossWolf , EM_RoleValue_IsDead ) == 0) and (ReadRoleValue( BossLeo , EM_RoleValue_IsDead ) == 0) then

			if Fight >= 360 then

				ScriptMessage( OwnerID(), -1 , 1 ,"[SC_101222_YU_44]" , C_SYSTEM )  	--傀奇之力消失，雪角山城上恢復平靜。
				Delobj( BossWolf )	
				Delobj( BossLeo )	
				sleep(100)
				BeginPlot( PurpleID  , "LuaI_101022_0" , 0 )   
				Fight = 0
				WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
				--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight.."One Cow Is dead" , C_SYSTEM )  
				sleep(10)
				break

			else
				--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight.."S3" , C_SYSTEM )  			


				if Wolfattack == 1 and AttackTarget1 > 0 then
					Fight = 0
					WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
					--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight , C_SYSTEM )  
				elseif Leoattack == 1 and AttackTarget2 > 0 then
					Fight = 0
					WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
					--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight , C_SYSTEM )  
				elseif Wolfattack == 0 and Leoattack == 0 and AttackTarget1 == 0 and AttackTarget2 == 0  then
					Fight = Fight+1
					WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
					--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight , C_SYSTEM )  
				end


			end

		elseif (CheckID( BossWolf  ) == true) and (ReadRoleValue( BossWolf , EM_RoleValue_IsDead ) == 0) then

			if Fight >= 360 then

				ScriptMessage( OwnerID(), -1 , 1 ,"[SC_101222_YU_44]" , C_SYSTEM )  	--傀奇之力消失，雪角山城上恢復平靜。
				Delobj( BossWolf )	
				sleep(100)
				BeginPlot( PurpleID  , "LuaI_101022_0" , 0 )   
				Fight = 0
				WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
				--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight.."One Cow Is dead" , C_SYSTEM )  
				sleep(10)
				break

			else
				--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight.."S3" , C_SYSTEM )  			

				if Wolfattack == 1 and AttackTarget1 > 0 then
					Fight = 0
					WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
					--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight , C_SYSTEM )  

				elseif Wolfattack == 0 and AttackTarget1 == 0 then
					Fight = Fight+1
					WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
					--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight , C_SYSTEM )  
				end


			end

		elseif CheckID( BossLeo  ) == true and (ReadRoleValue( BossLeo , EM_RoleValue_IsDead ) == 0) then

			if Fight >= 360 then

				ScriptMessage( OwnerID(), -1 , 1 ,"[SC_101222_YU_44]" , C_SYSTEM )  	--傀奇之力消失，雪角山城上恢復平靜。
				Delobj( BossLeo )	
				sleep(100)
				BeginPlot( PurpleID  , "LuaI_101022_0" , 0 )   
				Fight = 0
				WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
				--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight.."One Cow Is dead" , C_SYSTEM )  
				sleep(10)
				break

			else
				--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight.."S3" , C_SYSTEM )  			

				if Leoattack == 1 and AttackTarget2 > 0 then
					Fight = 0
					WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
					--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight , C_SYSTEM )  

				elseif Leoattack == 0 and AttackTarget2 == 0 then
					Fight = Fight+1
					WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
					--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight , C_SYSTEM )  
				end


			end

		else -- 兩隻牛都死了

				--ScriptMessage( OwnerID(), -1 , 1 ,"[SC_101222_YU_44]" , C_SYSTEM )  	--傀奇之力消失，雪角山城上恢復平靜。

--				BeginPlot( PurpleID  , "LuaI_101022_0" , 0 )   
--				Fight = 0
--				WriteRoleValue( OwnerID() ,EM_RoleValue_PID , Fight )
				--ScriptMessage( OwnerID(), -1 , 0 , "Fight="..Fight.."One Cow Is dead" , C_SYSTEM )  
				sleep(10)
				break

		end
	end


end