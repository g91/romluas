function ic_106292_01()  																	---第10口袋固定死亡劇情用--第9口袋固定測試距離用	say(OwnerID(),"boss44="..boss44)														
	local isaac=OwnerID()																	---控制器
	local ZoneID=ic_ReadRoleValue(isaac,17)													---哪區域	
	local open=0						  													---開戰旗標				        
	local killidtime=0																		---狂暴計時
	local BOSSXX=0																			---BOSS死亡				
	local door1																				---阻擋門
	local BOSS9898=0																		---測試距離	
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local Boss
	local door=ic_mob_flag_add_Y_N( isaac,106241,781028,2,1)								---阻擋門(王死才會消失)
	local door4=ic_mob_flag_add_Y_N( isaac,106241,781028,9,1)								---阻擋門(王死才會消失)
	local door5=ic_mob_flag_add_Y_N( isaac,106242,781028,10,1)								---阻擋門(王死才會消失)
	local door6=ic_mob_flag_add_Y_N( isaac,106242,781028,11,1)								---阻擋門(王死才會消失)
	local door7=ic_mob_flag_add_Y_N( isaac,106241,781028,12,1)								---阻擋門(王死才會消失)
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
	local boss_id={106292,107314,107321}						---BOSS號碼 不同強度不同編號
	local mob1_id={106294,107316,107323}						---雄蟻1號碼
	local mob2_id={106293,107315,107322}						---雄蟻2號碼
	local mob3_id={106295,107317,107324}						---援軍號碼
	local mob4_id={106114,107312,107319}						---小蟲號碼
	local Zone={146,147,148}									---區域{Hard,Normal,Easy}
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
	local play_Mode=ic_ReadRoleValue(isaac,7)												---難度 1=困難12人 2=正常6人 3=簡單6人												
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
		WriteRoleValue(mob1,EM_RoleValue_register5,play_Mode) --階段
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
			if hatelistcount(boss)~=0 then    												---讀仇恨人數
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
										CastSpellLv( mob10 , mob10 , 498438 , 7 )			---蟲蛹自爆
									elseif 	play_Mode==2 then
										CastSpellLv( mob10 , mob10 , 498438 , 3 )			---蟲蛹自爆	
									elseif 	play_Mode==3 then
										CastSpellLv( mob10 , mob10 , 498438 , 1 )			---蟲蛹自爆
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
				if mob1xx==1 and time3==0  then												---守衛1死
					if 		play_Mode==1 then												
						AddBuff(mob2,621055,0 ,-1 )	
					elseif 	play_Mode==2 then
						AddBuff(mob2,621055,0 ,-1 )	
					elseif 	play_Mode==3 then
						AddBuff(mob2,621055,0 ,-1 )	
					end	
					time3=1
				end
				if mob2xx==1 and time3==0  then												---守衛2死
					if 		play_Mode==1 then												
						AddBuff(mob1,621055,0 ,-1 )
					elseif 	play_Mode==2 then
						AddBuff(mob1,621055,0 ,-1 )	
					elseif 	play_Mode==3 then
						AddBuff(mob1,621055,0 ,-1 )	
					end	
					time3=1
				end
				if mob1xx==1 and  mob2xx==1  then											---守衛都死
					ScriptMessage( Boss, -1 , 2 , "[SC_106292_01]" , 2 )					---蟻后下場
					LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*-1 , "" )
					ic_playBUFFXX(0,621026,621027,0,0,0,0,0,0,0,0)
					sleep(10)
					SetModeEx( Boss , EM_SetModeType_Move, true) 										
					WriteRoleValue(Boss,EM_RoleValue_register1,2)
					WriteRoleValue(isaac,EM_RoleValue_register1,2)	
					WriteRoleValue(isaac,EM_RoleValue_register2,2)	
				end
				if time1>=5 then															---地形傷害
					if 		play_Mode==1 then												
						SYSCastSpellLV( isaac, isaac, 498423, 4 )
					elseif 	play_Mode==2 then
						SYSCastSpellLV( isaac, isaac, 498423, 2 )	
					elseif 	play_Mode==3 then
						SYSCastSpellLV( isaac, isaac, 498423, 1 )	
					end
					time1=0
				end
				if time2>=15 and mob1xx==0 or time2>=15 and mob2xx==0 then					---生小怪第1階段
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
				if time2>=18 and mob1xx==2 and mob2xx==2 then								---生小怪第2階段
					mob3xx=ReadRoleValue(isaac,EM_RoleValue_register4)
					mob12xx=ReadRoleValue(isaac,EM_RoleValue_register3)
					--say(ownerID(),"mob3xx = "..mob3xx)
					if mob3xx<4 then
					--say(ownerID(),"be = ")
						ScriptMessage( Boss, -1 , 2 , "[SC_106292_03]" , 2 )				---援軍
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
					open=1																	----開打了
					ic_All_Boss100_1(781028,isaac,Boss,1000)									---測是距離用(旗標,中控器,BOSS,距離)回傳值到第9口袋
					door1=ic_mob_flag_add_Y_N( isaac,106241,781028,3,1)
					ic_All_door(door1)
					ScriptMessage( Boss, -1 , 2 , "[SC_106292_02]" , 2 )					---守衛開打
					WriteRoleValue(Boss,EM_RoleValue_register1,1)
					WriteRoleValue(Boss,EM_RoleValue_register4,play_Mode)  --判斷難度
					BeginPlot(boss , "ic_106292_02" , 0)									
				end
			end	
			
			if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then			---開戰後仇恨表沒人
				if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   					---王沒死 玩家滅團
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
					WriteRoleValue(mob1,EM_RoleValue_register5,play_Mode) --階段
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
					open=0																	---重置戰鬥
					killidtime=0
				end				
			end	
		if BOSSXX==1  then															  	---無敵殺了王
			ScriptMessage( Boss, -1 , 2 , "[SC_106292_06]" , 2 )			   		---我們怎會輸呢 這跟遊戲規則不符阿~~不~~---死亡
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
local mob=OwnerID()																			---蟲蛹用
local Search
local RoomID=ReadRoleValue(mob,EM_RoleValue_RoomID)
local isaac=ReadRoleValue(mob,EM_RoleValue_PID) 
local play_Mode=ic_ReadRoleValue(isaac,0)													---難度 1=困難12人 2=正常6人 3=簡單6人	
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
function ic_106292_mob1XX()																	---死亡用~守衛1
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
		WriteRoleValue(isaac,EM_RoleValue_register1,1)
		sleep(5)
		DelObj(OwnerID())	
end 
function ic_106292_mob2XX()																	---死亡用~守衛2
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
		WriteRoleValue(isaac,EM_RoleValue_register2,1)
		sleep(5)
		DelObj(OwnerID())
end 
function ic_106292_mob3XX()																	---死亡用~門神
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	local play_Mode=ic_ReadRoleValue(OwnerID(),1)												---難度 1=困難12人 2=正常6人 3=簡單6人	
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local mob3xx
	local AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )
		ScriptMessage( Boss, -1 , 2 , "[SC_106292_05]" , 2 )								---門神死
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
function ic_106292_mob12XX()																---死亡用~蟲蛹
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local mob12xx
		mob12xx=ReadRoleValue(isaac,EM_RoleValue_register3)	
		WriteRoleValue(isaac,EM_RoleValue_register3,mob12xx-1)
	sleep(5)
	DelObj(OwnerID())	
end 
function ic_106292_mob10XX()																---死亡用~蛹破小蟲
	DelObj(OwnerID())	
end 
function ic_106292_mob12()																	---守衛12用
local mob=OwnerID()
local isaac=ReadRoleValue(mob,EM_RoleValue_PID)
local play_Mode=ReadRoleValue(mob,EM_RoleValue_register5)												---難度 1=困難12人 2=正常6人 3=簡單6人	
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
					if time4>=20 then														---自補
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
					if time3>=13 then														---全場
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
					if time2>=9 then														---範圍
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
					if time1>=5 then														---單體
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
function ic_106292_mob3()																	---門神技能
local mob=OwnerID()
local isaac=ReadRoleValue(mob,EM_RoleValue_register2)
local play_Mode=ic_ReadRoleValue(mob,1)													---難度 1=困難12人 2=正常6人 3=簡單6人	
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
		if HPPercent>0.5 then																---單體打3下藥斷
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
		elseif HPPercent<0.5 then															---全場傷害副加DOT(有緩DOT傷害增加)
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
		if time2>=0 then																	---隨機傷害  
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
function ic_106292_02()   																	---王AI(第10固定狂暴用)
	local Boss=OwnerID()
	local isaac=ReadRoleValue(Boss,EM_RoleValue_PID)
	local play_Mode=ic_ReadRoleValue(isaac,7)												---難度 1=困難12人 2=正常6人 3=簡單6人	
	local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local play44=0																			---狂爆用
	local killidtime=0								 										---狂暴用
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
			AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )    		 	---找尋目前的攻擊目標
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
			if killidtime==1 and play44==0 then												---狂爆了
				AddBuff(Boss,621058,0 ,-1 )
				killidtime=0
				WriteRoleValue(Boss,EM_RoleValue_register10,0)							 	---把口袋10歸0
				play44=1
			end
			if p1p2==2 then
				if time5==0 then
					time1=0
					time5=1
				end	
				time2=time2+1
				time3=time3+1
				if time3>= 17 then															---全場排坦
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
				if time2>=7 then															---單體或隨機
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
			if time1>=10 then																---隨機打6人
				ic_magic_ing(Boss,5)
				ScriptMessage( Boss, -1 , 2 , "[SC_106292_04]" , 2 )						---援軍
				CastSpellLV( Boss, Boss, 498434, 0 )										---表演
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