function LuaI_coNa_00()                                                                                                 --�w�f���~�v�@��

                SetPlot( OwnerID(),"range","LuaI_coNa_01",100 )                                         --�d��Ĳ�o

end

function LuaI_coNa_01()

	SetPlot( TargetID(),"range","",0 )                                                                     --���@�Ӫŭ�function�A�����A��Ĳ�o�d��@�����i��C  
	BeginPlot( TargetID() , "LuaI_coNa_02" , 0 )                                                   --�R�O���w����I�s Script
end


function LuaI_coNa_02()

	local MaxPrist = 0
	local Prist


	local PlayerTeam = LuaFunc_PartyData( TargetID() )                                                --�P�_TargetID() ���Ҧ��ն����������(�ư����b�P�a�Ϫ̦����ư����`��)�A PlayerTeam[0] �Ĥ@����Ƭ������H�ơB�ĤG���H�ᬰ������ơC	

	local A = 0
	for i = 1 , PlayerTeam[0] , 1 do

	sleep(15)

		if ReadRoleValue( PlayerTeam[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV ) > MaxPrist  and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_IsDead ) ~= 1  then       --�P�_�����D¾�O���q�B���ų̰��B�Ӫ��a����

		MaxPrist = ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV ) 
		Prist = PlayerTeam[i] 
		A = 1

		sleep(5)
--		Say( CoNaID1 ,  GetString("SC_YUYU_TEST_4") )    
		sleep(5)

		elseif ReadRoleValue( PlayerTeam[i] , EM_RoleValue_VOC_SUB ) == 5 and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_VOC_SUB ) > MaxPrist   and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_IsDead ) ~= 1   then    --�P�W�@�˦��P�_��¾

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
			if ReadRoleValue( PlayerTeam[i] , EM_RoleValue_VOC ) == 4 and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV ) > MaxPrist  and ReadRoleValue( PlayerTeam[i] , EM_RoleValue_IsDead ) ~= 1  then       --�P�_�����D¾�O�k�v�B���ų̰��B�Ӫ��a����
			MaxPrist = ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV ) 
			Prist = PlayerTeam[i]    
			sleep(5)
--			Say( CoNaID1 ,  GetString("SC_YUYU_TEST_5") )                           
			sleep(5)
			end
		end
	end

		local Momo = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101028, 200 , 1) 
		local RoomID = ReadRoleValue( Momo[0] , EM_RoleValue_RoomID )  --�P�_�Ҧb���a�h
--		Say(OwnerID(), 5 )
		local CoNaID1 = ReadRoleValue( Momo[0] , EM_RoleValue_Register ) 
		local CoNaID2 = ReadRoleValue( Momo[0] , EM_RoleValue_Register+1 ) 

	if CheckID( Prist ) == true and ReadRoleValue( Prist , EM_RoleValue_IsPlayer ) == 1 and  ReadRoleValue( Prist , EM_RoleValue_RoomID ) == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then          --�T�w�Ӫ��a�Mowner�P�@�h�B�s�b

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
				CastSpelllv( CoNaID1 , Prist , 491299, 1)                                                              --�I��k�N&LV(�I�k��,��Hid,�k�Nid,LV)  
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
                                            
				if ReadRoleValue( Prist  , EM_RoleValue_IsDead ) == 1 or  X1 == 0 or  X2 == 0 then                               --�p�G�ؼЮ���(���`�����}�԰�)
		
					SetPos( CoNaID1 , 124.7, 22.3, -5227.5 , 225 )                                                                                                    --�R�O����ǰe�ܬY��m
					SetPos( CoNaID2 , 183.4, 24.8, -5182.4 , 231 )                                                                                                    --�R�O����ǰe�ܬY��m

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