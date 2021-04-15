--function LuaI_101022_2_0()

--              SetPlot( OwnerID(),"range", "LuaI_101022_2_1" , 100 )                                      --設定劇情
                
--end

--function LuaI_101022_2_1()

--	SetPlot( TargetID(),"range","",200 )                                                                     --給一個空個function，取消再次觸發範圍劇情的可能。     
--	BeginPlot( TargetID() , "LuaI_101022_2_2" , 0 )                                                   --命令指定角色呼叫 Script
--end

function LuaI_101022_2_2()     	  

--	local QQ = CheckAcceptQuest( TargetID(), 421458 );                                        --判斷該角色有沒有接任務


--	if  CheckFlag( TargetID()  , 541589 ) == true  and CheckFlag( TargetID()  , 541590 ) == false then    --判斷今天有沒有走過此路經有沒有接任務	
--		SetFlag( TargetID()  , 541590 , 1 )	--沒走過給旗標	

--	if QQ == true then 

		local Samog = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101022, 200 , 1)       --薩摩格
		local Golu= LuaFunc_SearchNPCbyOrgID( OwnerID(),101028, 200 , 1)             --隱藏施法目標
		local Solay = LuaFunc_SearchNPCbyOrgID( OwnerID(),101027, 200 , 1)       --薩摩格的手下
		local EYE01 = LuaFunc_SearchNPCbyOrgID( OwnerID(),101025, 200 , 1)             --賢者
		local EYE02 = LuaFunc_SearchNPCbyOrgID( OwnerID(),101026, 200 , 1)             --賢者
		local Minotaur = LuaFunc_SearchNPCbyOrgID(OwnerID() , 101024, 200 , 1)             --戰牛祭司
		local HideMonster2 = LuaFunc_SearchNPCbyOrgID(OwnerID() , 100694, 200 , 1)       --範圍劇情：隱藏紫色寶箱


		local StoneCow01  = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+5  )
		local StoneCow02  = ReadRoleValue( OwnerID(),  EM_RoleValue_Register+6  )

		local PurpleID  = ReadRoleValue( OwnerID(),  EM_RoleValue_PID  ) --藍色寶箱的id
--		WriteRoleValue( OwnerID() , EM_RoleValue_Register , OwnerID())
--		local RedID  = ReadRoleValue( OwnerID(), EM_RoleValue_Register )  --紅色寶箱的id

		SetFightMode(  EYE01[0] , 1, 1, 1, 1 )	
		SetFightMode(  EYE02[0] , 1, 1, 1, 1 )	
		SetFightMode(  Solay[0]  , 1, 1, 1, 1 )	
		SetFightMode(  Solay[1]  , 1, 1, 1, 1 )	

		Hide(Solay[0] )
		Hide(Solay[1] )
		Show(Solay[0],0 )
		Show(Solay[1],0 )

		SetAttack( EYE01[0], Solay[1] )	
		SetAttack( EYE02[0], Solay[0] )	
		SetAttack( Solay[0] , EYE02[0])	
		SetAttack( Solay[1] , EYE01[0])
		CastSpell( Samog[0] , Golu[0], 491919)                                                              --施放法術(施法者,對象id,法術id

	
		sleep(30)
		Say( Samog[0], GetString("SC_101022_YU_00") )  --開場白	
		sleep(30)
		Say( EYE01[0],  GetString("SC_101022_YU_01") )
		sleep(40)
		Say( EYE02[0], GetString("SC_101022_YU_02") )
		sleep(40)
		Say( Samog[0], GetString("SC_101022_YU_03") ) --封印解除
		sleep(40)
		PlayMotion ( Samog[0], 108)                                  --表演動作 108代表 大笑
		Say( Samog[0], GetString("SC_101022_YU_04") )
		sleep(30)
		PlayMotion ( Samog[0], 109)                                  --表演動作 109代表 指揮前進
		Say( Samog[0], GetString("SC_101022_YU_05") )
		sleep(30)
		CastSpell( Samog[0] , Samog[0], 491920)            --靈神操控
		sleep(40)
		BeginPlot( Samog[0] , "LuaP_Dead" , 0 )                                                   --命令指定角色呼叫 Script
		sleep(20)
		Delobj( Samog[0] )
		sleep(20)

		Samogmad1 = CreateObjByFlag( 101219, 780097, 7 , 1 );            --薩摩格靈神1出現
		AddToPartition( Samogmad1 , 0) 
		WriteRoleValue( Samogmad1 , EM_RoleValue_Register , PurpleID ) --藍寶箱
		WriteRoleValue( Samogmad1 , EM_RoleValue_Register+1 , OwnerID()  ) --紅寶箱
		WriteRoleValue( Samogmad1 , EM_RoleValue_Register+5 , StoneCow01) --沃特



		BeginPlot( Samogmad1 , "LuaI_101030_0_0" , 0 )                                                   

		Samogmad2 = CreateObjByFlag( 101219, 780097, 8 , 1 );            --薩摩格靈神2出現
		AddToPartition( Samogmad2 , 0) 
		WriteRoleValue( Samogmad2 , EM_RoleValue_Register , PurpleID )
		WriteRoleValue( Samogmad2 , EM_RoleValue_Register+1 , OwnerID()  )
		WriteRoleValue( Samogmad2 , EM_RoleValue_Register+6 , StoneCow02) --里昂

	

		BeginPlot( Samogmad2 , "LuaI_101030_1_0" , 0 )           

		ScriptMessage(OwnerID(), -1 , 1 , GetString("SC_101022_YU_11") , C_Default )	--系統訊息(發話人,受話人)受話人填0則以say的範圍的玩家均可聽到。

		sleep(40)

		ScriptMessage(OwnerID(), -1 , 1 , GetString("SC_101022_YU_12") , C_SYSTEM )	--系統訊息(發話人,受話人)受話人填0則以say的範圍的玩家均可聽到。

		sleep(20)
		Say( EYE02[0],  GetString("SC_101022_YU_06") )
		sleep(30)
		Say( EYE02[0],  GetString("SC_101022_YU_07") )
		sleep(30)
		Say( EYE01[0], GetString("SC_101022_YU_08") )
		sleep(30)
		Say( EYE01[0], GetString("SC_101022_YU_09") )

			while true do
			sleep(30)


				if CheckID( Solay[0] ) == false and CheckID( Solay[1] ) == false then
			
					Say( EYE01[0],  GetString("SC_101022_YU_10") )
					sleep(10)

					CastSpell( EYE01[0], EYE01[0], 491922)
					CastSpell( EYE02[0], EYE02[0], 491922)
					sleep(40)
					BeginPlot( OwnerID() , "LuaI_101025_YU_1" , 0 )                                                   --開啟賢者之眼支援劇情

					BeginPlot( Golu[0] , "LuaI_101024_1" , 0 )                                                   --指定紫色寶箱隱藏祭司
					Delobj( EYE01[0] )
					Delobj( EYE02[0] )
					break
				end
			end

		sleep(30)

--	end


end