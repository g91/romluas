function LuaI_coNa_00()                                                                                                 --庫柏馴獸師劇情

                SetPlot( OwnerID(),"range","LuaI_coNa_01",100 )                                         --範圍內觸發

end

function LuaI_coNa_01()

	SetPlot( TargetID(),"range","",0 )                                                                     --給一個空個function，取消再次觸發範圍劇情的可能。  
	BeginPlot( TargetID() , "LuaI_coNa_02" , 0 )                                                   --命令指定角色呼叫 Script
end


function LuaI_coNa_02()

	local MaxPrist = 0
	local Prist


	local PlayerTeam = LuaFunc_PartyData( TargetID() )                                                --判斷TargetID() 的所有組隊成員的資料(排除不在同地區者但未排除死亡者)， PlayerTeam[0] 第一筆資料為成員人數、第二筆以後為成員資料。	

	local A = 0
	for i = 1 , PlayerTeam[0] , 1 do

	sleep(15)

		if ReadRoleValue( PlayerTeam[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV ) > MaxPrist  and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_IsDead ) ~= 1  then       --判斷成員主職是祭司且等級最高且該玩家活著

		MaxPrist = ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV ) 
		Prist = PlayerTeam[i] 
		A = 1

		sleep(5)
--		Say( CoNaID1 ,  GetString("SC_YUYU_TEST_4") )    
		sleep(5)

		elseif ReadRoleValue( PlayerTeam[i] , EM_RoleValue_VOC_SUB ) == 5 and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_VOC_SUB ) > MaxPrist   and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_IsDead ) ~= 1   then    --與上一樣但判斷副職

		MaxPrist = ReadRoleValue( PlayerTeam[i] , EM_RoleValue_VOC_SUB ) 
		Prist = PlayerTeam[i] 
		A = 1

		sleep(5)
--		Say( CoNaID1 ,  GetString("SC_YUYU_TEST_4") )    
		sleep(5)

		end	

	end 

	if A == 0 then
		for i = 1 , PlayerTeam[0] , 1 do
			if ReadRoleValue( PlayerTeam[i] , EM_RoleValue_VOC ) == 4 and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV ) > MaxPrist  and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_IsDead ) ~= 1  then       --判斷成員主職是法師且等級最高且該玩家活著
			MaxPrist = ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV ) 
			Prist = PlayerTeam[i]    
			sleep(5)
--			Say( CoNaID1 ,  GetString("SC_YUYU_TEST_5") )                           
			sleep(5)
			end
		end
	end

		local Momo = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101028, 200 , 1) 
		local RoomID = ReadRoleValue( Momo[0] , EM_RoleValue_RoomID )  --判斷所在的地層
--		Say(OwnerID(), 5 )
		local CoNaID1 = ReadRoleValue( Momo[0] , EM_RoleValue_Register ) 
		local CoNaID2 = ReadRoleValue( Momo[0] , EM_RoleValue_Register+1 ) 

	if CheckID( Prist ) == true and ReadRoleValue( Prist , EM_RoleValue_IsPlayer ) == 1 and  ReadRoleValue( Prist , EM_RoleValue_RoomID ) == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then          --確定該玩家和owner同一層且存在

		Show( CoNaID1 ,  RoomID )
		Show( CoNaID2 ,  RoomID )

		SetFightMode ( CoNaID1 , 1, 1, 0,1 )
		SetFightMode ( CoNaID2 , 1, 1, 0,1 )

		SetAttack( CoNaID1 , Prist  )
		SetAttack( CoNaID2 , Prist  )

		sleep(10)

		CastSpell( Prist  , CoNaID1 , 491301)                                                              
		CastSpell( Prist  , CoNaID2 , 491301)     
                                                         
		if CheckDistance( CoNaID1 , Prist , 80 ) or CheckDistance( CoNaID2 , Prist , 80 )  then		

				sleep(20)
				CastSpelllv( CoNaID1 , Prist , 491299, 1)                                                              --施放法術&LV(施法者,對象id,法術id,LV)  
				CastSpelllv( CoNaID2 , Prist , 490483, 1)         
				sleep(30)
				CastSpelllv( CoNaID1 , Prist , 490618, 1)        
				CastSpelllv( CoNaID2 , Prist , 490618, 1)                                                         
				sleep(30)
				CastSpelllv( CoNaID1 , Prist , 490582, 20)    
				CastSpelllv( CoNaID2 , Prist , 491299, 20)                                                           
		end      

		while true do
	                
				local X1 = ReadRoleValue(CoNaID1 , EM_RoleValue_AttackTargetID ) 
				local X2 = ReadRoleValue(CoNaID2 , EM_RoleValue_AttackTargetID )                            
                                            
				if ReadRoleValue( Prist  , EM_RoleValue_IsDead ) == 1 or  X1 == 0 or  X2 == 0 then                               --如果目標消失(死亡或離開戰鬥)
		
					SetPos( CoNaID1 , 124.7, 22.3, -5227.5 , 225 )                                                                                                    --命令物件傳送至某位置
					SetPos( CoNaID2 , 183.4, 24.8, -5182.4 , 231 )                                                                                                    --命令物件傳送至某位置

--					Say( CoNaID2 ,  GetString("SC_YUYU_TEST_1") )  

					sleep(20)
					SetFightMode ( CoNaID1 , 1, 1, 0,1 )
					SetFightMode ( CoNaID2 , 1, 1, 0,1 )			
	
					break
				end
				sleep(10)
		end	
	else
--		Say( CoNaID2 ,  GetString("SC_YUYU_TEST_2") )  

		Show( CoNaID1 ,  RoomID )
		Show( CoNaID2 ,  RoomID )

		SetFightMode ( CoNaID1 , 1, 1, 0,1 )
		SetFightMode ( CoNaID2 , 1, 1, 0,1 )

	end
end