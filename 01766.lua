	function apon_attackfish_2_Easy()
		while 1 do
			local undead = {}
			local counter1 = 0
			local counter2 = 0
			local counter3 = 0
			local amount = 0
			
			local Mob_all = {} ----�x�s�����ɥ�
			local Mob_Num ----�ثetable ���Ǫ����ƶq
			
			--local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
			sleep(10)
			for i = 0 , 12000  do
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				local member = 0
				local Boss = OwnerID()
				if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
					local partymember = LuaFunc_PartyData( AttackTarget )				
					--Say( OwnerID() , "local partymember " )
					local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )							
					--Say( OwnerID() , "local roomid1 " )
					sleep(10)
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					counter3 = counter3 + 1
					
					--say(OwnerID(),table.getn(Mob_all))
					
					if counter3 >= 15 then ---�Ͱ����ɶ��q
						local random_fish = DW_Rand(10)
						
						-------------------�ˬd�����ɼƶq��----------------------	
						for i = 1 , table.getn(Mob_all), 1 do
							if Mob_all[i] ~= nil and ReadRoleValue( Mob_all[i] , EM_RoleValue_IsDead) == 1 then
								table.remove ( Mob_all , i)
							end	
						end
						
						Mob_Num = table.getn(Mob_all)
						
						if Mob_Num <= 18 then ---�p�G�ͤF�W�L18�������ɫh���|�A��
		
							local fish1 = Lua_DW_CreateObj( "flag" , 103472 , 780362 , random_fish )
							WriteRoleValue( fish1 , EM_RoleValue_PID , Boss )
							--say (fish1 , Boss)
							table.insert( Mob_all , fish1 )
							SetPlot( fish1 ,"dead","AP_fishdie_2_Easy",50 )	
							local fish2 = Lua_DW_CreateObj( "flag" , 103471 , 780363 , random_fish )
							WriteRoleValue( fish2 , EM_RoleValue_PID , Boss )
							table.insert( Mob_all , fish2 )
							
							SetPlot( fish2 ,"dead","AP_fishdie_2_Easy",50 )	
							local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���{�b�ӰϤ����Ҧ����a
							local ThesePlayer = {}
							for i=1,TempPlayer do    --�N�������a�[�J���������
								ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
								SetAttack( fish1 , ThesePlayer[i] ) -- �����e�i����
								SetAttack( fish2 , ThesePlayer[i] ) -- �����e�i����
							end
							BeginPlot(fish1,"LuaS_Discowood_CheckPeace",0)  --�I�s�尪���A�Y�O8.5�����i�J�԰����A�N�|����
							BeginPlot(fish2,"LuaS_Discowood_CheckPeace",0)  --�I�s�𰪳��A�Y�O8.5�����i�J�԰����A�N�|����
						end
						counter3 = 0
					end
					
					
					if counter1 == 15 then
						local check_1 = 0
						local priest = 0
						for i = 1 , partymember[0] , 1 do						
							member = member + 1	
							if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then	
								--sleep(10)
								check_1 = 1
								priest = partymember[i]																									
								amount = amount + 1
								undead[amount] = lua_star_CreateNPC( partymember[i] , 0 , 103470 , 10 , roomid1)  --�lmp�A�w��ɮv
								--WriteRoleValue( undead[amount] , EM_RoleValue_PID , Boss )       --�l�]�������Φ��`�@��
								SetFightMode ( undead[amount] ,1, 1, 1,0 )
								--SetModeEx( undead[amount]   , EM_SetModeType_Fight , false )--�i�������
								--SetModeEx( undead[amount]  ,  EM_SetModeType_Strikback, false )--����
								--SetModeEx( undead[amount]   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
								--SetModeEx( undead[amount]   , EM_SetModeType_Searchenemy, true) --�j�M�ĤH
								--SetModeEx( undead[amount]   , EM_SetModeType_Mark, false )--�аO
								--SetModeEx( undead[amount]   , EM_SetModeType_ShowRoleHead, false )--�Y����
								--Hide( undead[amount] )
								--AddToPartition( undead[amount] ,    RoomID )	--�[�i�R�x
								SetAttack( undead[amount] , partymember[i] )
								--nopriest = 0
								--break					
							end
						end
						
						if check_1 == 0 then    --�p�G����S���ɮv����
							
							local lucky = rand(member-1)+1
							--Say( OwnerID() , lucky ) 
							amount = amount + 1
							undead[amount] = lua_star_CreateNPC( partymember[lucky] , 0 , 103470 , 10 , roomid1)
							SetFightMode ( undead[amount] ,1, 1, 1,0 )
						end		
						sleep(10)
						counter1 = 0				
					end
					
					if counter2 == 20 then
						local check_2 = 0
						local magic = 0
						for i = 1 , partymember[0] , 1 do
							member = member + 1
							if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 4 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then	
								--Say( OwnerID() , "if 456 " )
								sleep(10)
								check_2 = 1
								magic = partymember[i]
								amount = amount + 1
								undead[amount] = lua_star_CreateNPC( partymember[i] , 0 , 103469 , 10 , roomid1)  --�����A�w��k�v
								WriteRoleValue( undead[amount] , EM_RoleValue_PID , Boss )   --�NBoss��PID �g�J
								--say (undead[amount] , Boss)
								SetAttack( undead[amount] , partymember[i] )
								SetPlot( undead[amount] ,"dead","AP_fishdie_2_Easy",50 )  --���`�@��
								--say ( undead[amount] , "999")					
							end
						end
						if check_2 == 0 then  --�p�G����S���k�v����
							
							local lucky_1 = rand(member-1)+1
							--Say( OwnerID() , lucky_1 ) 
							amount = amount + 1
							undead[amount] = lua_star_CreateNPC( partymember[lucky_1] , 0 , 103469 , 10 , roomid1)
							SetPlot( OwnerID(),"dead","AP_fishdie_2_Easy",10 )  --���`�@��
							
						end
						sleep(10)
						counter2 = 0				
					end
				
				else
					--Say( OwnerID() , "ok" )
					for i = 1 , table.getn(undead) , 1 do
						--sleep(10)					
						if undead[i] ~= nil and CheckID(undead[i] ) == true  then
							DelObj( undead[i] )	
						end		
					end
					
					Mob_all = 0 ---�N�x�s�����ɪ�table�x�s��0
					
					--undead = {}
					break		
				end
			end	
		end
	end


	--------------------------------  ���M���������`�@��  -----------------------------------------------
	function AP_fishdie_2_Easy()

	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)
	local Check_HP = (BossNowHP/BossMaxHP)*100
	
	if Check_HP >= 4 then
		WriteRoleValue(Boss , EM_RoleValue_HP , BossNowHP-BossMaxHP*0.03)
	else
		KillID(TargetID(),Boss)
	end
end









