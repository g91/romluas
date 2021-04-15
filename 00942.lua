--里昂‧賓普斯克

function LuaI_101222_YU_0()   
	sleep(10) 
	PlayMotion( OwnerID() , 121)                                            --表演動作 122代表 idle03     
	SAY( OwnerID(), GetString("SC_101222_YU_07") )  


	SetPlot( OwnerID() , "dead","LuaI_101023_YU_1",0 )

	sleep(20) 
--	MoveToFlagEnabled( OwnerID(), false )
	CastSpelllv( OwnerID() , OwnerID(), 491985, 1)          
	sleep(30)  
	MoveDirect( OwnerID(), -12765.4 , 2145.5 , -10683.1 )
	local Box = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100695 , 200 , 1)             
	local Coolbo = LuaFunc_SearchNPCbyOrgID( Box[0] ,  100044 , 200 , 1)             
	sleep(10)
	local Golu = LuaFunc_SearchNPCbyOrgID( Coolbo[0] , 101028 , 200 , 1)             
	local StoneMaker = LuaFunc_SearchNPCbyOrgID( Coolbo[0] , 101054 , 200 , 1)             

	WriteRoleValue( OwnerID() , EM_RoleValue_Register  , StoneMaker[0] )                       --記住石像的編號
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1  , Golu[0]  )              
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2  , Coolbo[0] )            
	WriteRoleValue( Golu[0] ,EM_RoleValue_PID  , OwnerID()  )
	AddBuff( OwnerID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)

	local CheckTime = 10	
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )

	local BossB = ReadRoleValue( Coolbo[0] , EM_RoleValue_PID )
	WriteRoleValue( OwnerID() ,EM_RoleValue_PID  , BossB  )
	while true do
	sleep(10)	
	local Player = SearchRangePlayer( OwnerID() , 150 )
	local Distance = GetDistance( OwnerID(), Player[0] )

		If CheckID( Player[0] ) == true and Distance > 180  then
			SetAttack( OwnerID() , Player[0]  ) --單純攻擊

			if  Distance < 150  then
				CastSpelllv( OwnerID() , Player[0] , 490533 , 100 )    
				SetAttack( OwnerID() , Player[0]  ) --單純攻擊
				sleep(30)
				break
			end

		elseif  CheckID( Player[0] ) == true and Distance < 150  then
			CastSpelllv( OwnerID() , Player[0] , 490533 , 100 )    
			SetAttack( OwnerID() , Player[0]  ) --單純攻擊
			sleep(30)
			break
		end
	end

	local stoneBoss  = ReadRoleValue( Coolbo[0], EM_RoleValue_PID  )                      
	WriteRoleValue( OwnerID() ,EM_RoleValue_PID  , stoneBoss )                       --寫入里昂的PID

	local DIS = 0
	local OB = 0
	local X = 0  

	while true do
		sleep( CheckTime )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )

		local HateC = HateListCount( OwnerID() )
		local HC0 = HateListInfo(OwnerID() , X , EM_HateListInfoType_GItemID )
			If X < HateC then
				if GetDistance( OwnerID(), HC0 ) > DIS then
					if X+1 < HateC then
						X = X+1
					end
					DIS = GetDistance( OwnerID(), HC0)
					OB = HC0
				end
			end


		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
--			Say( OwnerID(), "Fighting!")

			local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
			local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			local Player = SearchRangePlayer( OwnerID() , 250 )
	
			if HPPercent >= 0.50 and HPPercent < 1 then
				local P = 10
				local XX = Rand( P )      
--				SAY(OwnerID() , HPPercent )
--				SAY(OwnerID() , XX )
					if XX >= 8 and XX < 10 then   --20%	
						PlayMotion( OwnerID() , 121)  
						SAY( OwnerID(), GetString("SC_101222_YU_07") )  
						ScriptMessage( OwnerID(), -1 , 1 , GetString("SC_101222_YU_07") , C_SYSTEM )  
						sleep(20)	
						SetAttack( OwnerID() , AttackTarget ) --單純攻擊
						sleep(20)	
						SAY(OwnerID() , GetString("SC_101222_YU_15") )  		--全部趴下
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_15") , C_SYSTEM )
						sleep(30)		
						CastSpelllv( OwnerID() , OwnerID() , 491985, 1 )    --雷霆萬鈞
						sleep(40)

					elseif XX >= 5 and XX < 8 then --30%
						SAY(OwnerID() , GetString("SC_101222_YU_04") )  
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_04") , C_SYSTEM )
						sleep(20)	
						CastSpelllv( OwnerID() , AttackTarget , 492028, 2 )    --戰神之槍
						sleep(50)	

					elseif XX >= 3 and XX < 5 then --20%	
						SAY(OwnerID() , GetString("SC_101222_YU_03") )  		--你們惹惱我了！滾開！
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_03") , C_SYSTEM )
						sleep(10)		
						CastSpelllv( OwnerID() , OwnerID() , 491928, 1 )    --戰神之怒
						sleep(40)
							if  CheckID( OB ) == true then
								CastSpelllv( OwnerID() , OB , 490533 , 150 )    --衝鋒陷陣	
								sleep(40)
								local HateC = HateListCount( OwnerID() )
								local HC = Rand(HateC)
								local AttackHC = HateListInfo(OwnerID() , HC , EM_HateListInfoType_GItemID )
								local Tank = HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )
								SAY(OwnerID() , GetString("SC_101222_YU_05") )  --誰也攔不住我
								ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_05") , C_SYSTEM )
								sleep(10)	
								CastSpelllv( OwnerID() , AttackHC , 490533 , 150 )    
								sleep(40)	
								--SetStopAttack( OwnerID() ) 
								sleep(20)	
								CastSpelllv( OwnerID() , Tank , 490533 , 150 )    
								sleep(50)	
							else
								local HateC = HateListCount( OwnerID() )
								local HC = Rand(HateC)
								local AttackHC = HateListInfo(OwnerID() , HC , EM_HateListInfoType_GItemID )
								local Tank = HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )
								SAY(OwnerID() , GetString("SC_101222_YU_05") ) 
								ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_05") , C_SYSTEM )
								CastSpelllv( OwnerID() , AttackHC , 490533 , 150 )    
								sleep(40)	
								--SetStopAttack( OwnerID() ) 
								sleep(20)	
								CastSpelllv( OwnerID() , Tank , 490533 , 150 )    
								sleep(50)	
							end
		
					elseif XX >= 1 and XX < 3 then --20%
						SAY(OwnerID() , GetString("SC_101222_YU_02") )  		--滾開！戰神 ─ 里昂‧賓普斯克來了！
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_02") , C_SYSTEM )
						sleep(10)	
						CastSpelllv( OwnerID() , OwnerID() , 491929, 2 )    --群體技 破陣狂擊 目標自己
						sleep(50)	

					elseif XX >= 0 and XX < 1 then --10%	
						SAY(OwnerID() , GetString("SC_101222_YU_00") )  		--讓你一輩子記住我的名字！
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_00") , C_SYSTEM )
						sleep(30)			
						CastSpelllv( OwnerID() , AttackTarget , 491926, 1 )    --群體技 大地震動 大絕招
						sleep(50)	

					end				


			elseif HPPercent >0 and HPPercent < 0.50 then
				local P = 10
				local XX = Rand( P )      
--				SAY(OwnerID() , HPPercent )
--				SAY(OwnerID() , XX )
					if XX >= 7 and XX < 10 then   --30%	
						PlayMotion( OwnerID() , 121)  
						SAY( OwnerID(), GetString("SC_101222_YU_07") )  
						ScriptMessage( OwnerID(), -1 , 1 , GetString("SC_101222_YU_07") , C_SYSTEM )  
						sleep(10)	
						SetAttack( OwnerID() , AttackTarget ) --單純攻擊
						sleep(20)	
						SAY(OwnerID() , GetString("SC_101222_YU_04") )  
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_04") , C_SYSTEM )
						sleep(20)	
						CastSpelllv( OwnerID() , AttackTarget , 492028, 2 )    --戰神之槍
						sleep(50)	
					elseif XX >= 4 and XX < 7 then --30%	
						SAY(OwnerID() , GetString("SC_101222_YU_15") )  		--全部趴下
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_15") , C_SYSTEM )
						sleep(30)		
						CastSpelllv( OwnerID() , OwnerID() , 491985, 1 )    --雷霆萬鈞
						sleep(40)
							if  CheckID( OB ) == true then
								CastSpelllv( OwnerID() , OB , 490533 , 150 )    --衝鋒陷陣	
								sleep(40)
								local HateC = HateListCount( OwnerID() )
								local HC = Rand(HateC)
								local AttackHC = HateListInfo(OwnerID() , HC , EM_HateListInfoType_GItemID )
								local Tank = HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )
								SAY(OwnerID() , GetString("SC_101222_YU_05") )  --誰也攔不住我
								ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_05") , C_SYSTEM )
								sleep(10)	
								CastSpelllv( OwnerID() , AttackHC , 490533 , 150 )    
								sleep(40)	
								--SetStopAttack( OwnerID() ) 
								sleep(20)	
								CastSpelllv( OwnerID() , Tank , 490533 , 150 )    
								sleep(50)	
							else
								local HateC = HateListCount( OwnerID() )
								local HC = Rand(HateC)
								local AttackHC = HateListInfo(OwnerID() , HC , EM_HateListInfoType_GItemID )
								local Tank = HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )
								SAY(OwnerID() , GetString("SC_101222_YU_05") ) 
								ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_05") , C_SYSTEM )
								sleep(10)	
								CastSpelllv( OwnerID() , AttackHC , 490533 , 150 )    
								sleep(40)	
								--SetStopAttack( OwnerID() ) 
								sleep(20)	
								CastSpelllv( OwnerID() , Tank , 490533 , 150 )    
								sleep(50)	
							end

					elseif XX >= 2 and XX < 4 then --20%	
						SAY(OwnerID() , GetString("SC_101222_YU_02") )  
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_02") , C_SYSTEM )
						sleep(10)	
						CastSpelllv( OwnerID() , OwnerID() , 491929, 3 )    
						sleep(50)
						SAY(OwnerID() , GetString("SC_101222_YU_03") )  
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_03") , C_SYSTEM )
						sleep(10)			
						CastSpelllv( OwnerID() , AttackTarget , 491928, 1 )    
						sleep(40)		
	
					elseif XX >= 0 and XX < 2 then --20%	
						SAY(OwnerID() , GetString("SC_101222_YU_00") )  
						ScriptMessage(OwnerID() , 0 , 1 , GetString("SC_101222_YU_00") , C_SYSTEM )
						sleep(30)			
						CastSpelllv( OwnerID() , AttackTarget , 491926, 1 )    
						sleep(50)	
					end


			end 
		end 
	end 
end