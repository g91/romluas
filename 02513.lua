function ic_106292_01()  																	---��10�f�U�T�w���`�@����--��9�f�U�T�w���նZ����	say(OwnerID(),"boss44="..boss44)														
	local isaac=OwnerID()																	---���
	local ZoneID=ic_ReadRoleValue(isaac,17)													---���ϰ�	
	local open=0						  													---�}�ԺX��				        
	local killidtime=0																		---�g�ɭp��
	local BOSSXX=0																			---BOSS���`				
	local door1																				---���ת�
	local BOSS9898=0																		---���նZ��	
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local Boss
	local door=ic_mob_flag_add_Y_N( isaac,106241,781028,2,1)								---���ת�(�����~�|����)
	local door4=ic_mob_flag_add_Y_N( isaac,106241,781028,9,1)								---���ת�(�����~�|����)
	local door5=ic_mob_flag_add_Y_N( isaac,106242,781028,10,1)								---���ת�(�����~�|����)
	local door6=ic_mob_flag_add_Y_N( isaac,106242,781028,11,1)								---���ת�(�����~�|����)
	local door7=ic_mob_flag_add_Y_N( isaac,106241,781028,12,1)								---���ת�(�����~�|����)
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local mob11
	local mob12
	local mob13
	local mob21
	local mob22
	local mob23
	local mob1xx
	local mob2xx
	local mob12xx
	local mob3xx
	local mobb={}
	local mobbxx
	local mobballxx
	local Luck=0
	local boss_id={106292,107314,107321}						---BOSS���X ���P�j�פ��P�s��
	local mob1_id={106294,107316,107323}						---����1���X
	local mob2_id={106293,107315,107322}						---����2���X
	local mob3_id={106295,107317,107324}						---���x���X
	local mob4_id={106114,107312,107319}						---�p�θ��X
	local Zone={146,147,148}									---�ϰ�{Hard,Normal,Easy}
		if 		ZoneID==Zone[1] then														
			ic_WriteRoleValue(isaac,0,1)
			ic_WriteRoleValue(isaac,7,1)
		elseif 	ZoneID==Zone[2] then													
			ic_WriteRoleValue(isaac,0,2)
			ic_WriteRoleValue(isaac,7,2)
		elseif 	ZoneID==Zone[3] then														
			ic_WriteRoleValue(isaac,0,3)
			ic_WriteRoleValue(isaac,7,3)
		end
	local play_Mode=ic_ReadRoleValue(isaac,7)												---���� 1=�x��12�H 2=���`6�H 3=²��6�H												
		Boss=ic_mob_flag_add_Y_N( isaac,boss_id[play_Mode],781028,1,1)	
		SetModeEx( Boss , EM_SetModeType_Move, false) 																				
		ic_All_door(door)	
		ic_All_door(door4)
		ic_All_door(door5)
		ic_All_door(door6)
		ic_All_door(door7)
		SetModeEx( door5  , EM_SetModeType_Show, false )
		SetModeEx( door6  , EM_SetModeType_Show, false )
		SetModeEx( door7  , EM_SetModeType_Show, false )	
		LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*1 , "" )
		SetPlot( Boss,"dead","ic_All_BOSSXX",0 )											
		WriteRoleValue(Boss,EM_RoleValue_PID,isaac)   										
		WriteRoleValue(isaac,EM_RoleValue_PID,Boss)
		sleep(5)
		--say(ownerID(),"mod = "..play_Mode)
		mob1=ic_mob_flag_add_Y_N( isaac,mob1_id[play_Mode],781028,4,1)
		mob2=ic_mob_flag_add_Y_N( isaac,mob2_id[play_Mode],781028,5,1)	
		WriteRoleValue(mob1,EM_RoleValue_PID,isaac)
		WriteRoleValue(mob2,EM_RoleValue_PID,isaac)
		WriteRoleValue(mob1,EM_RoleValue_register5,play_Mode) --���q
		WriteRoleValue(mob2,EM_RoleValue_register5,play_Mode)
		WriteRoleValue(mob1,EM_RoleValue_register1,1)
		WriteRoleValue(mob2,EM_RoleValue_register1,2)
		WriteRoleValue(Boss,EM_RoleValue_register2,mob1)
		WriteRoleValue(Boss,EM_RoleValue_register3,mob2)
		BeginPlot(mob1 , "ic_106292_mob12" , 0)
		BeginPlot(mob2 , "ic_106292_mob12" , 0)
		Luck=DW_Rand(2)
		if Luck==1 then
			for i = 1 ,40,2 do
				mobb[i]=ic_mob_flag_add_Y_N( isaac,106296,781034,i,2)
				SetModeEx( mobb[i] , EM_SetModeType_Move, false) 
				SetModeEx( mobb[i] , EM_SetModeType_Fight, false) 						
				SetModeEx( mobb[i] , EM_SetModeType_DisableRotate, true)	
				SetModeEx( mobb[i] , EM_SetModeType_Mark, false)
				AddToPartition(mobb[i],RoomID)	
				WriteRoleValue(mobb[i],EM_RoleValue_PID,isaac)
				BeginPlot(mobb[i] , "ic_106292_mobbXX" , 0)		
			end	
		elseif	Luck==2 then
			for i = 2 ,40,2 do
				mobb[i]=ic_mob_flag_add_Y_N( isaac,106296,781034,i,2)
				SetModeEx( mobb[i] , EM_SetModeType_Move, false) 
				SetModeEx( mobb[i] , EM_SetModeType_Fight, false) 						
				SetModeEx( mobb[i] , EM_SetModeType_DisableRotate, true)	
				SetModeEx( mobb[i] , EM_SetModeType_Mark, false)
				AddToPartition(mobb[i],RoomID)	
				WriteRoleValue(mobb[i],EM_RoleValue_PID,isaac)
				BeginPlot(mobb[i] , "ic_106292_mobbXX" , 0)		
			end	
		end	
		
	while true do
		sleep(10)
		mob1xx=ReadRoleValue(isaac , EM_RoleValue_register1)
		mob2xx=ReadRoleValue(isaac , EM_RoleValue_register2)
		mob12xx=ReadRoleValue(isaac , EM_RoleValue_register3)
		mob3xx=ReadRoleValue(isaac , EM_RoleValue_register4)
		mobbxx=ReadRoleValue(isaac , EM_RoleValue_register5)
		mobballxx=ReadRoleValue(isaac , EM_RoleValue_register6)
		BOSS9898=ReadRoleValue(isaac , EM_RoleValue_register9)								
		BOSSXX=ReadRoleValue(isaac , EM_RoleValue_register10)
		--say(OwnerID(),"mobbxx="..mobbxx)
			if hatelistcount(boss)~=0 then    												---Ū����H��
				killidtime=killidtime+1
				time1=time1+1
				time2=time2+1
				if mobballxx>=10 then
					local bosskk= ReadRoleValue(boss, EM_RoleValue_AttackTargetID )
					if 		play_Mode==1 then												
						sysCastSpellLV( Boss,Boss, 495651,299)
					elseif 	play_Mode==2 then
						sysCastSpellLV( Boss,Boss, 495651,149)
					elseif 	play_Mode==3 then
						sysCastSpellLV( Boss,Boss, 495651,69)
					end	
					local Search = SearchRangeNPC ( isaac , 400 )
					for i = 0 , table.getn(Search) do
						if Search[i] ~= isaac then
							if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106296  then
								local mob10 =ic_mob_Rand_add( Search[i] , mob4_id[play_Mode] ,0,0)
									SetPlot( mob10,"dead","ic_106292_mob10XX",0 )
									killid( Search[i],Search[i])
									if 		play_Mode==1 then												
										CastSpellLv( mob10 , mob10 , 498438 , 7 )			---�θ����z
									elseif 	play_Mode==2 then
										CastSpellLv( mob10 , mob10 , 498438 , 3 )			---�θ����z	
									elseif 	play_Mode==3 then
										CastSpellLv( mob10 , mob10 , 498438 , 1 )			---�θ����z
									end
									SetAttack(mob10 , bosskk)
							end		
						end
					end		
					sleep(20)
					Luck=DW_Rand(2)
					if Luck==1 then
						for i = 1 ,40,2 do
							mobb[i]=ic_mob_flag_add_Y_N( isaac,106296,781034,i,2)
							SetModeEx( mobb[i] , EM_SetModeType_Move, false) 
							SetModeEx( mobb[i] , EM_SetModeType_Fight, false) 						
							SetModeEx( mobb[i] , EM_SetModeType_DisableRotate, true)	
							SetModeEx( mobb[i] , EM_SetModeType_Mark, false)
							AddToPartition(mobb[i],RoomID)	
							WriteRoleValue(mobb[i],EM_RoleValue_PID,isaac)
							BeginPlot(mobb[i] , "ic_106292_mobbXX" , 0)	
						end	
					elseif	Luck==2 then
						for i = 2 ,40,2 do
							mobb[i]=ic_mob_flag_add_Y_N( isaac,106296,781034,i,2)
							SetModeEx( mobb[i] , EM_SetModeType_Move, false) 
							SetModeEx( mobb[i] , EM_SetModeType_Fight, false) 						
							SetModeEx( mobb[i] , EM_SetModeType_DisableRotate, true)	
							SetModeEx( mobb[i] , EM_SetModeType_Mark, false)
							AddToPartition(mobb[i],RoomID)	
							WriteRoleValue(mobb[i],EM_RoleValue_PID,isaac)
							BeginPlot(mobb[i] , "ic_106292_mobbXX" , 0)	
						end	
					end	
					WriteRoleValue(isaac,EM_RoleValue_register6,0)
				end
				if killidtime==480 and play_Mode==1 or 
				   killidtime==360 and play_Mode==2 then														
					WriteRoleValue(boss,EM_RoleValue_register10,1)							
					killidtime=0
				end
				if mob1xx==1 and time3==0  then												---�u��1��
					if 		play_Mode==1 then												
						AddBuff(mob2,621055,0 ,-1 )	
					elseif 	play_Mode==2 then
						AddBuff(mob2,621055,0 ,-1 )	
					elseif 	play_Mode==3 then
						AddBuff(mob2,621055,0 ,-1 )	
					end	
					time3=1
				end
				if mob2xx==1 and time3==0  then												---�u��2��
					if 		play_Mode==1 then												
						AddBuff(mob1,621055,0 ,-1 )
					elseif 	play_Mode==2 then
						AddBuff(mob1,621055,0 ,-1 )	
					elseif 	play_Mode==3 then
						AddBuff(mob1,621055,0 ,-1 )	
					end	
					time3=1
				end
				if mob1xx==1 and  mob2xx==1  then											---�u�ó���
					ScriptMessage( Boss, -1 , 2 , "[SC_106292_01]" , 2 )					---�ƦZ�U��
					LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*-1 , "" )
					ic_playBUFFXX(0,621026,621027,0,0,0,0,0,0,0,0)
					sleep(10)
					SetModeEx( Boss , EM_SetModeType_Move, true) 										
					WriteRoleValue(Boss,EM_RoleValue_register1,2)
					WriteRoleValue(isaac,EM_RoleValue_register1,2)	
					WriteRoleValue(isaac,EM_RoleValue_register2,2)	
				end
				if time1>=5 then															---�a�ζˮ`
					if 		play_Mode==1 then												
						SYSCastSpellLV( isaac, isaac, 498423, 4 )
					elseif 	play_Mode==2 then
						SYSCastSpellLV( isaac, isaac, 498423, 2 )	
					elseif 	play_Mode==3 then
						SYSCastSpellLV( isaac, isaac, 498423, 1 )	
					end
					time1=0
				end
				if time2>=15 and mob1xx==0 or time2>=15 and mob2xx==0 then					---�ͤp�ǲ�1���q
					mob12xx=ReadRoleValue(isaac,EM_RoleValue_register3)
					local mob1kk= ReadRoleValue(mob1, EM_RoleValue_AttackTargetID ) 
					local mob2kk= ReadRoleValue(mob2, EM_RoleValue_AttackTargetID ) 
					if	mob12xx<7 then
						mob12xx=ReadRoleValue(isaac,EM_RoleValue_register3)
						WriteRoleValue(isaac,EM_RoleValue_register3,mob12xx+6)
						mob11=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,7,1)
						mob12=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,7,1)
						mob13=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,7,1)
						mob21=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,8,1)	
						mob22=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,8,1)	
						mob23=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,8,1)
						WriteRoleValue(mob11,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob12,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob13,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob21,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob22,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob23,EM_RoleValue_PID,isaac)
						if mob1xx==0 and mob2xx==0 then
							SetAttack(mob11 , mob1kk)
							SetAttack(mob12 , mob1kk)
							SetAttack(mob13 , mob1kk)
							SetAttack(mob21 , mob2kk)
							SetAttack(mob22 , mob2kk)
							SetAttack(mob23 , mob2kk)
						elseif  mob1xx==1 and mob2xx==0 then
							SetAttack(mob11 , mob2kk)
							SetAttack(mob12 , mob2kk)
							SetAttack(mob13 , mob2kk)
							SetAttack(mob21 , mob2kk)
							SetAttack(mob22 , mob2kk)
							SetAttack(mob23 , mob2kk)
						elseif	mob2xx==1 and mob1xx==0 then
							SetAttack(mob11 , mob1kk)
							SetAttack(mob12 , mob1kk)
							SetAttack(mob13 , mob1kk)
							SetAttack(mob21 , mob1kk)
							SetAttack(mob22 , mob1kk)
							SetAttack(mob23 , mob1kk)
						end
						SetPlot( mob11,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob12,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob13,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob21,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob22,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob23,"dead","ic_106292_mob12XX",0 )	
					end	
					time2=0
				end
				if mob1xx==2 and mob2xx==2 and time4==0 then
					time2=0
					time4=1
				end
				if time2>=18 and mob1xx==2 and mob2xx==2 then								---�ͤp�ǲ�2���q
					mob3xx=ReadRoleValue(isaac,EM_RoleValue_register4)
					mob12xx=ReadRoleValue(isaac,EM_RoleValue_register3)
					--say(ownerID(),"mob3xx = "..mob3xx)
					if mob3xx<4 then
					--say(ownerID(),"be = ")
						ScriptMessage( Boss, -1 , 2 , "[SC_106292_03]" , 2 )				---���x
						local mob3kk= ReadRoleValue(Boss, EM_RoleValue_AttackTargetID ) 
						mob3xx=ReadRoleValue(isaac,EM_RoleValue_register4)
						WriteRoleValue(isaac,EM_RoleValue_register4,mob3xx+1)
						mob3=ic_mob_flag_add_Y_N( isaac,mob3_id[play_Mode],781028,6,1)
						WriteRoleValue(mob3,EM_RoleValue_PID,boss)
						WriteRoleValue(mob3,EM_RoleValue_register2,isaac)
						WriteRoleValue(mob3,EM_RoleValue_register1,play_Mode)
						SetModeEx( mob3 , EM_SetModeType_Move, true)
						--SetAttack(mob3 , mob3kk)
						BeginPlot(mob3 , "ic_106292_mob3" , 0)
					end
					if	mob12xx<7 then
						local bosskk= ReadRoleValue(boss, EM_RoleValue_AttackTargetID ) 
						mob12xx=ReadRoleValue(isaac,EM_RoleValue_register3)
						WriteRoleValue(isaac,EM_RoleValue_register3,mob12xx+6)
						mob11=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,7,1)
						mob12=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,7,1)
						mob13=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,7,1)
						mob21=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,8,1)	
						mob22=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,8,1)	
						mob23=ic_mob_flag_add_Y_N( isaac,mob4_id[play_Mode],781028,8,1)
						WriteRoleValue(mob11,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob12,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob13,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob21,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob22,EM_RoleValue_PID,isaac)
						WriteRoleValue(mob23,EM_RoleValue_PID,isaac)
						SetPlot( mob11,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob12,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob13,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob21,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob22,"dead","ic_106292_mob12XX",0 )
						SetPlot( mob23,"dead","ic_106292_mob12XX",0 )	
						SetAttack(mob11 , bosskk)
						SetAttack(mob12 , bosskk)
						SetAttack(mob13 , bosskk)
						SetAttack(mob21 , bosskk)
						SetAttack(mob22 , bosskk)
						SetAttack(mob23 , bosskk)
					end		
					time2=0
				end
				if open==0 then
					open=1																	----�}���F
					ic_All_Boss100_1(781028,isaac,Boss,1000)									---���O�Z����(�X��,������,BOSS,�Z��)�^�ǭȨ��9�f�U
					door1=ic_mob_flag_add_Y_N( isaac,106241,781028,3,1)
					ic_All_door(door1)
					ScriptMessage( Boss, -1 , 2 , "[SC_106292_02]" , 2 )					---�u�ö}��
					WriteRoleValue(Boss,EM_RoleValue_register1,1)
					WriteRoleValue(Boss,EM_RoleValue_register4,play_Mode)  --�P�_����
					BeginPlot(boss , "ic_106292_02" , 0)									
				end
			end	
			
			if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then			---�}�ԫᤳ���S�H
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   					---���S�� ���a����
					sleep(20)
					DelObj(boss)                                        					
					DelObj(door1)
					ic_npcXX(400,106296,mob4_id[play_Mode],mob1_id[play_Mode],mob2_id[play_Mode],mob3_id[play_Mode],0,0,0,0,0)	
					sleep(20)  	
					time1=0
					time2=0
					time3=0
					time4=0
					mobb={}
					WriteRoleValue(isaac,EM_RoleValue_register1,0)
					WriteRoleValue(isaac,EM_RoleValue_register2,0)
					WriteRoleValue(isaac,EM_RoleValue_register3,0)
					WriteRoleValue(isaac,EM_RoleValue_register4,0)
					WriteRoleValue(isaac,EM_RoleValue_register5,0)
					WriteRoleValue(isaac,EM_RoleValue_register6,0)
					WriteRoleValue(isaac,EM_RoleValue_register9,0)
					WriteRoleValue(isaac,EM_RoleValue_register10,0)
					sleep(30)                                          
					Boss=ic_mob_flag_add_Y_N( isaac,boss_id[play_Mode],781028,1,1)	           						    
					LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*1 , "" )	
					SetModeEx( Boss , EM_SetModeType_Move, false) 										
					SetPlot( Boss,"dead","ic_All_BOSSXX",0 )								
					WriteRoleValue(isaac,EM_RoleValue_PID,Boss)
					WriteRoleValue(Boss,EM_RoleValue_PID,isaac)
					if 		play_Mode==1 then												
						ic_playBUFFXX(0,621022,621026,621027,621028,621038,621039,621040,621041,0,0)	
					elseif 	play_Mode==2 then
						ic_playBUFFXX(0,621022,621026,621027,621028,621038,621039,621040,621041,0,0)	
					elseif 	play_Mode==3 then
						ic_playBUFFXX(0,621022,621026,621027,621028,621038,621039,621040,621041,0,0)	
					end									
					mob1=ic_mob_flag_add_Y_N( isaac,mob1_id[play_Mode],781028,4,1)
					mob2=ic_mob_flag_add_Y_N( isaac,mob2_id[play_Mode],781028,5,1)	
					WriteRoleValue(mob1,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob2,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob1,EM_RoleValue_register5,play_Mode) --���q
					WriteRoleValue(mob2,EM_RoleValue_register5,play_Mode)
					WriteRoleValue(mob1,EM_RoleValue_register1,1)
					WriteRoleValue(mob2,EM_RoleValue_register1,2)
					WriteRoleValue(Boss,EM_RoleValue_register2,mob1)
					WriteRoleValue(Boss,EM_RoleValue_register3,mob2)
					BeginPlot(mob1 , "ic_106292_mob12" , 0)
					BeginPlot(mob2 , "ic_106292_mob12" , 0)
					Luck=DW_Rand(2)
					if Luck==1 then
						for i = 1 ,40,2 do
							mobb[i]=ic_mob_flag_add_Y_N( isaac,106296,781034,i,2)
							SetModeEx( mobb[i] , EM_SetModeType_Move, false) 
							SetModeEx( mobb[i] , EM_SetModeType_Fight, false) 						
							SetModeEx( mobb[i] , EM_SetModeType_DisableRotate, true)	
							SetModeEx( mobb[i] , EM_SetModeType_Mark, false)
							AddToPartition(mobb[i],RoomID)	
							WriteRoleValue(mobb[i],EM_RoleValue_PID,isaac)
							BeginPlot(mobb[i] , "ic_106292_mobbXX" , 0)		
						end	
					elseif	Luck==2 then
						for i = 2 ,40,2 do
							mobb[i]=ic_mob_flag_add_Y_N( isaac,106296,781034,i,2)
							SetModeEx( mobb[i] , EM_SetModeType_Move, false) 
							SetModeEx( mobb[i] , EM_SetModeType_Fight, false) 						
							SetModeEx( mobb[i] , EM_SetModeType_DisableRotate, true)	
							SetModeEx( mobb[i] , EM_SetModeType_Mark, false)
							AddToPartition(mobb[i],RoomID)	
							WriteRoleValue(mobb[i],EM_RoleValue_PID,isaac)
							BeginPlot(mobb[i] , "ic_106292_mobbXX" , 0)		
						end	
					end	
					open=0																	---���m�԰�
					killidtime=0
				end				
			end	
		if BOSSXX==1  then															  	---�L�ı��F��
			ScriptMessage( Boss, -1 , 2 , "[SC_106292_06]" , 2 )			   		---�ڭ̫�|��O �o��C���W�h���Ū�~~��~~---���`
			if open==1 then
				DelObj(door1)
			end
			DelObj(door)
			DelObj(door4)
			DelObj(door5)
			DelObj(door6)
			DelObj(door7)
			WriteRoleValue(isaac,EM_RoleValue_register9,0)
			WriteRoleValue(isaac,EM_RoleValue_register10,0)
			ic_npcXX(400,106296,mob4_id[play_Mode],mob1_id[play_Mode],mob2_id[play_Mode],mob3_id[play_Mode],0,0,0,0,0)		
			sleep(20)
			if 		play_Mode==1 then												
				ic_playBUFFXX(0,621022,621026,621027,621028,621038,621039,621040,621041,0,0)	
			elseif 	play_Mode==2 then
				ic_playBUFFXX(0,621022,621026,621027,621028,621038,621039,621040,621041,0,0)	
			elseif 	play_Mode==3 then
				ic_playBUFFXX(0,621022,621026,621027,621028,621038,621039,621040,621041,0,0)	
			end						
			open=0																	
			killidtime=0
			BOSSXX=2
			sleep(100)
			break
		end	
	end		
end  
function ic_106292_mobbXX()		
local mob=OwnerID()																			---�θ���
local Search
local RoomID=ReadRoleValue(mob,EM_RoleValue_RoomID)
local isaac=ReadRoleValue(mob,EM_RoleValue_PID) 
local play_Mode=ic_ReadRoleValue(isaac,0)													---���� 1=�x��12�H 2=���`6�H 3=²��6�H	
local mobxx
local mob10
	while true do	
		if hatelistcount(mob)~=0 then
			CastSpellLv( mob , mob , 498438 ,99)	
			mobxx=ReadRoleValue(isaac , EM_RoleValue_register6 )
			WriteRoleValue(isaac,EM_RoleValue_register6,mobxx+1)
			WriteRoleValue(isaac,EM_RoleValue_register5,1)
			sleep(10)
			killid(mob,mob)	
		end	
		sleep(1)	
	end		
end
function ic_106292_mob1XX()																	---���`��~�u��1
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
		WriteRoleValue(isaac,EM_RoleValue_register1,1)
		sleep(5)
		DelObj(OwnerID())	
end 
function ic_106292_mob2XX()																	---���`��~�u��2
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
		WriteRoleValue(isaac,EM_RoleValue_register2,1)
		sleep(5)
		DelObj(OwnerID())
end 
function ic_106292_mob3XX()																	---���`��~����
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	local play_Mode=ic_ReadRoleValue(OwnerID(),1)												---���� 1=�x��12�H 2=���`6�H 3=²��6�H	
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local mob3xx
	local AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )
		ScriptMessage( Boss, -1 , 2 , "[SC_106292_05]" , 2 )								---������
		mob3xx=ReadRoleValue(isaac,EM_RoleValue_register4)
		WriteRoleValue(isaac,EM_RoleValue_register4,mob3xx-1)
		AddBuff(boss,621056,0 ,-1 )
		AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )
		--say(isaac,"boss = "..boss)
		--say(boss,"AttackTarget ="..AttackTarget.."play_Mode ="..play_Mode)
		if 		play_Mode==1 then												
			SYSCastSpellLV( boss, AttackTarget, 498431,9)				
		elseif 	play_Mode==2 then
			SYSCastSpellLV( boss, AttackTarget, 498431,9)
		elseif 	play_Mode==3 then
			SYSCastSpellLV( boss, AttackTarget, 498431,3)
		end
		sleep(5)
		DelObj(OwnerID())
end
function ic_106292_mob12XX()																---���`��~�θ�
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local mob12xx
		mob12xx=ReadRoleValue(isaac,EM_RoleValue_register3)	
		WriteRoleValue(isaac,EM_RoleValue_register3,mob12xx-1)
	sleep(5)
	DelObj(OwnerID())	
end 
function ic_106292_mob10XX()																---���`��~���}�p��
	DelObj(OwnerID())	
end 
function ic_106292_mob12()																	---�u��12��
local mob=OwnerID()
local isaac=ReadRoleValue(mob,EM_RoleValue_PID)
local play_Mode=ReadRoleValue(mob,EM_RoleValue_register5)												---���� 1=�x��12�H 2=���`6�H 3=²��6�H	
local mob12
local mob00=0
local time1=0
local time2=0
local time3=0
local time4=0
local time5=0
local AttackTarget
		mob12=ReadRoleValue(mob, EM_RoleValue_register1) 
		if mob12==1 and mob00==0 then
			SetPlot( mob,"dead","ic_106292_mob1XX",0 )
			mob00=1
		elseif mob12==2 and mob00==0 then
			SetPlot( mob,"dead","ic_106292_mob2XX",0 )
			mob00=1
		end
	while true do
	
		if hatelistcount(mob)~=0 then
		
					AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID ) 
					SetAttack( AttackTarget , isaac)
					mob12=ReadRoleValue(mob, EM_RoleValue_register1)	
					time1=time1+1
					time2=time2+1
					time3=time3+1
					time4=time4+1
					time5=time5+1
					--say(OwnerID(),"time4 = "..time4.."play_Mode = "..play_Mode)
					if time5>3 then
						local Search = SearchRangeNPC ( mob , 150 )
							for i = 0 , table.getn(Search) do
								if Search[i] ~= mob then
									if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106292 and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 or 
										ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106293 and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0	or 
										ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106294 and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 then
										AddBuff(mob,620916,0 ,-1 )
									end		
								end
							end
					end	
					if time4>=20 then														---�۸�
						ic_magic_ing(mob,5)
							if 		play_Mode==1 then	
								--say(OwnerID(),"1")
								CastSpellLV( mob ,mob , 498306 , 0 )
							elseif 	play_Mode==2 then
								CastSpellLV( mob ,mob , 498306 , 0 )
							elseif 	play_Mode==3 then
								CastSpellLV( mob ,mob , 498306 , 0 )
							end
							sleep(10)
							time4=0
					end	
					if time3>=13 then														---����
						ic_magic_ing(mob,5)
						if mob12==1  then
							if 		play_Mode==1 then
							--say(OwnerID(),"2")							
								CastSpellLV( mob,mob,498425,199)
							elseif 	play_Mode==2 then
								CastSpellLV( mob,mob,498425,99)
							elseif 	play_Mode==3 then
								CastSpellLV( mob,mob,498425,49)
							end
						elseif mob12==2  then
							if 		play_Mode==1 then												
								CastSpellLV( mob,mob,498426,199)
							elseif 	play_Mode==2 then
								CastSpellLV( mob,mob,498426,99)
							elseif 	play_Mode==3 then
								CastSpellLV( mob,mob,498426,49)
							end
						end
						sleep(10)
						time3=0
					end
					if time2>=9 then														---�d��
						ic_magic_ing(mob,5)
						if 		play_Mode==1 then												
							CastSpellLV( mob ,mob, 498437 ,7)
						elseif 	play_Mode==2 then
							CastSpellLV( mob ,mob, 498437 ,4)
						elseif 	play_Mode==3 then
							CastSpellLV( mob ,mob, 498437 ,0)
						end
						sleep(20)
						time2=0
					end
					if time1>=5 then														---����
					SetAttack( AttackTarget , isaac)
						ic_magic_ing(mob,5)
						if 		play_Mode==1 then												
							CastSpellLV(mob ,AttackTarget , 498424 ,9)
						elseif 	play_Mode==2 then
							CastSpellLV(mob ,AttackTarget , 498424 ,5)
						elseif 	play_Mode==3 then
							CastSpellLV(mob ,AttackTarget , 498424 ,1)
						end
						sleep(10)
						time1=0
					end		
		elseif hatelistcount(mob)==0 then	
					time1=0
					time2=0
					time3=0
					time4=0
					--ic_NoAttackPlayer( mob)
		end
	sleep(10)	
	end	
end 
function ic_106292_mob3()																	---�����ޯ�
local mob=OwnerID()
local isaac=ReadRoleValue(mob,EM_RoleValue_register2)
local play_Mode=ic_ReadRoleValue(mob,1)													---���� 1=�x��12�H 2=���`6�H 3=²��6�H	
local boss=ReadRoleValue(mob,EM_RoleValue_PID)	
local RoomID=ReadRoleValue(mob,EM_RoleValue_RoomID)
local AttackTarget  
local MaxHP = ReadRoleValue( mob , EM_RoleValue_MaxHP )							
local NowHP = ReadRoleValue( mob , EM_RoleValue_HP )     						 	
local HPPercent = NowHP / MaxHP	
local xx
local yy
local time1=0
local time2=0
local play9898
SetPlot( mob,"dead","ic_106292_mob3XX",0 )	
	while 1 do
		MaxHP = ReadRoleValue( mob , EM_RoleValue_MaxHP )						 		
		NowHP = ReadRoleValue( mob , EM_RoleValue_HP )     					 		
		HPPercent = NowHP / MaxHP
		time1=time1+1
		time2=time2+1
		local Search = SearchRangeNPC ( mob , 200 )
			for i = 0 , table.getn(Search) do
				if Search[i] ~= mob then
					if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106292 and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 or 
						ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106293 and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0	or 
						ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106294 and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0  then
						AddBuff(mob,620916,0 ,-1 )
					end		
				end
			end
		if HPPercent>0.5 then																---���饴3�U���_
		--say(mob,"time = "..time1.." , play_Mode = "..play_Mode)
			if time1>=5 then
				SetModeEx( mob , EM_SetModeType_Move, false) 
				AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )
				sleep(10)
				if 		play_Mode==1 then
				--say(AttackTarget,"me =")
				--say(mob,"i =")
					CastSpellLV( mob, AttackTarget, 498428,29)		
				elseif 	play_Mode==2 then
					CastSpellLV( mob, AttackTarget, 498428,15)
				elseif 	play_Mode==3 then
					CastSpellLV( mob, AttackTarget, 498428,3)
				end
				sleep(40)
				SetModeEx( mob , EM_SetModeType_Move, true) 				
				time1=0
			end
		elseif HPPercent<0.5 then															---�����ˮ`�ƥ[DOT(���wDOT�ˮ`�W�[)
			if time1>=5 then
				if 		play_Mode==1 then												
					CastSpellLV( mob, mob, 498429,199)		
				elseif 	play_Mode==2 then
					CastSpellLV( mob, mob, 498429,99)
				elseif 	play_Mode==3 then
					CastSpellLV( mob, mob, 498429,49)
				end
					local TempPlayer = SetSearchAllPlayer(RoomID)
					local ThesePlayer = {}
						for i=1,TempPlayer do
							ThesePlayer[i] = GetSearchResult() 
								if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then 
									if CheckBuff( ThesePlayer[i] , 621039 ) == true	 then
												yy= Lua_BuffPosSearch( ThesePlayer[i] , 621039 )
												xx=BuffInfo( ThesePlayer[i], yy , EM_BuffInfoType_Power )
												AddBuff(ThesePlayer[i],621038,xx ,-1 )
									end
									if CheckBuff( ThesePlayer[i] , 621040 ) == true	 then
												yy= Lua_BuffPosSearch( ThesePlayer[i] , 621040 )
												xx=BuffInfo( ThesePlayer[i], yy , EM_BuffInfoType_Power )
												AddBuff(ThesePlayer[i],621038,xx ,-1 )
												CancelBuff(ThesePlayer[i], 621040)
									end
								end
						end
				sleep(10)	
				time1=0
			end
		end
		if time2>=0 then																	---�H���ˮ`  
			if 		play_Mode==1 then												
				ic_All_mob_KK123(boss,2,1,498430,249,20,0,0,0)			
			elseif 	play_Mode==2 then
				ic_All_mob_KK123(boss,2,1,498430,124,20,0,0,0)
			elseif 	play_Mode==3 then
				ic_All_mob_KK123(boss,2,1,498430,59,20,0,0,0)
			end
			time2=0
		end	
		sleep(10)
	end
end
function ic_106292_02()   																	---��AI(��10�T�w�g�ɥ�)
	local Boss=OwnerID()
	local isaac=ReadRoleValue(Boss,EM_RoleValue_PID)
	local play_Mode=ic_ReadRoleValue(isaac,7)												---���� 1=�x��12�H 2=���`6�H 3=²��6�H	
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local play44=0																			---�g�z��
	local killidtime=0								 										---�g�ɥ�
	local p1p2	
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local time5=0
	local mob1
	local mob2
	local mob1xx
	local mob2xx
	local AttackTarget
	sysCastSpellLv(Boss,Boss,499662,0)
		while 1 do
		--say(ownerID(),"mod = "..play_Mode)
			Sleep(10)
			AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )    		 	---��M�ثe�������ؼ�
			p1p2=ReadRoleValue(Boss,EM_RoleValue_register1)
			mob1=ReadRoleValue(Boss,EM_RoleValue_register2)
			mob2=ReadRoleValue(Boss,EM_RoleValue_register3)
			mob1xx=ReadRoleValue(isaac,EM_RoleValue_register1)
			mob2xx=ReadRoleValue(isaac,EM_RoleValue_register2)
			killidtime=ReadRoleValue(Boss,EM_RoleValue_register10)	
			time1=time1+1
			time4=time4+1
			if p1p2~=2 and time4>2 then
				local Search = SearchRangeNPC (Boss , 200 )
					for i = 0 , table.getn(Search) do
						if Search[i] ~= OwnerID() then
							if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106292 and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 or 
								ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106293 and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0	or 
								ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	106294 and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 then
								AddBuff(Boss,620916,0 ,-1 )
							end		
						end
					end
			end	
			if killidtime==1 and play44==0 then												---�g�z�F
				AddBuff(Boss,621058,0 ,-1 )
				killidtime=0
				WriteRoleValue(Boss,EM_RoleValue_register10,0)							 	---��f�U10�k0
				play44=1
			end
			if p1p2==2 then
				if time5==0 then
					time1=0
					time5=1
				end	
				time2=time2+1
				time3=time3+1
				if time3>= 17 then															---�����ƩZ
					ic_magic_ing(Boss,5)
					SetModeEx( Boss , EM_SetModeType_Move, false)
					if 		play_Mode==1 then												
						ic_All_mob_KK123(Boss,1,1,498436,299,50,0,0,0)	
					elseif 	play_Mode==2 then
						ic_All_mob_KK123(Boss,1,1,498436,149,50,0,0,0)
					elseif 	play_Mode==3 then
						ic_All_mob_KK123(Boss,1,1,498436,99,50,0,0,0)
					end
					SetModeEx( Boss , EM_SetModeType_Move, true)
					time3=0
				end
				if time2>=7 then															---������H��
					ic_magic_ing(Boss,5)
					if 		play_Mode==1 then												
						ic_All_mob_KK123(Boss,4,1,498432,10,5,498433,10,5)	
					elseif 	play_Mode==2 then
						ic_All_mob_KK123(Boss,4,1,498432,5,5,498433,5,5)
					elseif 	play_Mode==3 then
						ic_All_mob_KK123(Boss,4,1,498432,0,5,498433,0,5)
					end
					time2=0
				end
			end
			if time1>=10 then																---�H����6�H
				ic_magic_ing(Boss,5)
				ScriptMessage( Boss, -1 , 2 , "[SC_106292_04]" , 2 )						---���x
				CastSpellLV( Boss, Boss, 498434, 0 )										---��t
				sleep(30)
				if mob1xx==2 and mob2xx==2 and hatelistcount(Boss)>0 then
					if 		play_Mode==1 then												
						ic_playkk_Rand_1_6(boss,6,0,498435,700)	
					elseif 	play_Mode==2 then
						ic_playkk_Rand_1_6(boss,3,0,498435,200)
					elseif 	play_Mode==3 then
						ic_playkk_Rand_1_6(boss,2,0,498435,29)
					end  
				end
				if mob1xx==0 and mob2xx==1 or mob1xx==0 and mob2xx==0 and hatelistcount(Boss)>1 then
					if 		play_Mode==1 then												
						ic_playkk_Rand_1_6(mob1,6,0,498435,700) 	
					elseif 	play_Mode==2 then
						ic_playkk_Rand_1_6(mob1,3,0,498435,200) 
					elseif 	play_Mode==3 then
						ic_playkk_Rand_1_6(mob1,2,0,498435,29) 
					end
				end
				if mob1xx==1 and mob2xx==0 and hatelistcount(Boss)>1 then
					if 		play_Mode==1 then												
						ic_playkk_Rand_1_6(mob2,6,0,498435,700)	
					elseif 	play_Mode==2 then
						ic_playkk_Rand_1_6(mob2,3,0,498435,200)
					elseif 	play_Mode==3 then
						ic_playkk_Rand_1_6(mob2,2,0,498435,29)
					end 
				end							
				time1=0
			end
		end	
end
function ic_106292_003()  
	--say(OwnerID(),"fight= = = =")
	return true
end
function ic_106292_004()  
	--say(OwnerID(),"fight+++++++")
end
function ic_106292_005()  
while 1 do
CastSpellLV( OwnerID(), OwnerID(), 499645,1)
sleep(60)
end
end