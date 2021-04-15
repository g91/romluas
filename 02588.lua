function ic_106198_01()  																	---第10口袋固定死亡劇情用--第9口袋固定測試距離用																			
	local isaac=OwnerID()																	--say(OwnerID(),"boss44="..boss44)
	local ZoneID=ic_ReadRoleValue(isaac,17)													---哪區域	
	local flag_id=781035																	---旗標
	local door_id=106247																	---阻擋門
	local boss_Reset=520																	---測距離
	local open=0						  													---開戰旗標				        
	local killidtime=0																		---狂暴計時
	local BOSSXX=0																			---BOSS死亡				
	local door1																				---阻擋門
	local BOSS9898=0																		---測試距離	
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local Boss																				---BOSS創在  旗標1
	local door=ic_mob_flag_add_Y_N(isaac,door_id,flag_id,2,1)								---阻擋門(王死才會消失)
	local mob																				---儀器
	local mobxx																				---儀器記數   						 		
	local HPPercent
	local time0=0
	local Luck=0
	local time1=0																			---生分身時間
	local time2=0																			---開關	
	local time3=0																			---大絕時間
	local boss00																			---分身	
	local boss00xx	
	local bossp1p2																			---BOSS階段	
	local time4=0																			---第2階段分身用
	local time5=0																			---開場出小怪用
	local bobo
	local AttackTarget
	local boss1_id	={0,106198,107455}														---BOSS號碼
	local boss2_id	={0,106812,107458}														---BOSS號碼(重生)
	local App_id	={0,106456,107457}														---儀器號碼
	local cop_id	={0,106199,107456}														---分身號碼
	local bobo_id	={0,105812,107454}														---掉寶號碼
	local Zone		={0,149,150}															---區域{Hard,Normal,Easy}
		if 	ZoneID==Zone[2] then													
			ic_WriteRoleValue(isaac,0,2)
		elseif 	ZoneID==Zone[3] then														
			ic_WriteRoleValue(isaac,0,3)
		end
		local play_Mode=ic_ReadRoleValue(isaac,0)											---難度 1=困難12人 2=正常6人 3=簡單6人												
		Boss=ic_mob_flag_add_Y_N( isaac,boss1_id[play_Mode],flag_id,1,1)
		ic_All_door(door)
		WriteRoleValue(Boss,EM_RoleValue_PID,isaac)	
		WriteRoleValue(Boss,EM_RoleValue_register8,1)
		LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*1 , "" )
		for i = 20 ,29,1 do																	---10個儀器
			mob=ic_mob_flag_add_Y_N(isaac,App_id[play_Mode],flag_id,i,1) 
			SetModeEx( mob , EM_SetModeType_Move, false) 								
			SetModeEx( mob , EM_SetModeType_Strikback, false) 							
			SetModeEx( mob , EM_SetModeType_Searchenemy, false)	
			SetModeEx(mob,EM_SetModeType_Mark, false)			
			WriteRoleValue(mob,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob,EM_RoleValue_register1,boss)
			WriteRoleValue(mob,EM_RoleValue_register2,i)
			AddBuff(mob,621538,0 ,-1 )
			AddBuff(mob,623706,0 ,-1 )
			BeginPlot(mob, "ic_106198_mobkk" , 0)
			LockHP( mob, ReadRoleValue( mob, EM_RoleValue_MaxHP )*1 , "" )	
		end	
	while true do
		sleep(10)
		---say(Boss,"play_Mode="..play_Mode)
		boss00xx=ReadRoleValue(isaac , EM_RoleValue_register4)
		bossp1p2=ReadRoleValue(isaac , EM_RoleValue_register5)
		mobxx=ReadRoleValue(isaac , EM_RoleValue_register8)	
		BOSS9898=ReadRoleValue(isaac , EM_RoleValue_register9)								
		BOSSXX=ReadRoleValue(isaac , EM_RoleValue_register10)
		HPPercent=ic_HP_Max_Now(Boss)	
		if mobxx<=9 and BOSSXX==1 and open==1 then											---儀器沒爆無線復活
			DelObj(Boss)
			sleep(10)
			Boss=ic_mob_flag_add_Y_N( isaac,boss2_id[play_Mode],flag_id,1,1)                            						
			SetPlot( Boss,"dead","ic_All_BOSSXX",0 )								
			WriteRoleValue(Boss,EM_RoleValue_PID,isaac)	
			WriteRoleValue(Boss,EM_RoleValue_register8,2)
			WriteRoleValue(isaac,EM_RoleValue_register5,2)
			WriteRoleValue(isaac,EM_RoleValue_register10,0)
			if killidtime>=480 and play_Mode==1 or 
			   killidtime>=360 and play_Mode==2 then										---狂暴時間
				--ic_say_all_play("[SC_106198_03]",2)	
				--WriteRoleValue(boss,EM_RoleValue_register10,1)								---狂爆了
				AddBuff(Boss,507663,0 ,-1 )
			end
			AddBuff(Boss,621537,0 ,-1 )
			sleep(30)
			BeginPlot(boss , "ic_106198_02" , 0)			
		end
		if hatelistcount(boss)~=0 then    																	 		
			killidtime=killidtime+1
			if bossp1p2==2 and time4==0 then
				local NPCXX = SetSearchAllNPC(RoomID )
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
					for i = 0 , NPCXX do
						ID=GetSearchResult() 
						ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						if  ID2==cop_id[play_Mode] then 					---分身  
							WriteRoleValue(ID,EM_RoleValue_register8,2)
						end
					end
				time4=1				
			end
			if bossp1p2==1 then
				time1=time1+1
				if time1>11 and time5==1  or time1>4 and time5==0 then
					if boss00xx==12 and time2==0  then
						time2=1
					end
					if time2==0 and boss00xx<12 then
						Luck=RandRange( 20, 29 )
						WriteRoleValue(isaac,EM_RoleValue_register6,Luck)
						time2=1
						sleep(10)
						boss00=ic_mob_flag_add_Y_N(isaac,cop_id[play_Mode],flag_id,Luck,1)  
						WriteRoleValue(boss00,EM_RoleValue_PID,isaac) 
						AttackTarget=ReadRoleValue(Boss,EM_RoleValue_AttackTargetID )  
						SetAttack(boss00,AttackTarget)
						BeginPlot(boss00,"ic_106198_BOSS00" , 0)
						WriteRoleValue(isaac,EM_RoleValue_register4,boss00xx+1)
						ic_say_all_play("[SC_106198_02]",2)
					elseif	time2==1 then 
						time3=time3+1
						if time3>10 then
							local NPCXX = SetSearchAllNPC(RoomID )
							local ID=GetSearchResult()
							local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
							for i = 0 , NPCXX do
								ID=GetSearchResult() 
								ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
								if ID2==boss1_id[play_Mode] or ID2==cop_id[play_Mode] then 	---boss..分身
									WriteRoleValue(ID,EM_RoleValue_register9,1)
								end
							end
							time1=0
							time2=0
							time3=0
							time5=1
						end
					end	
				end
			end	
			if HPPercent<0.31 and time0==0 then
				time0=1
				WriteRoleValue(isaac,EM_RoleValue_register7,1)
				WriteRoleValue(Boss,EM_RoleValue_register8,2)
				WriteRoleValue(isaac,EM_RoleValue_register5,2)
				LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*-1 , "" )
			end
			if killidtime==480 and play_Mode==1 or 
			   killidtime==360 and play_Mode==2 then										---狂暴時間
				ic_say_all_play("[SC_106198_03]",2)	
				WriteRoleValue(boss,EM_RoleValue_register10,1)								---狂爆了
			end
			if open==0 then
				open=1																		----開打了
				ic_All_Boss100_1(flag_id,isaac,Boss,boss_Reset)								---測是距離用(旗標,中控器,BOSS,距離)回傳值到第10口袋
				LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.3 , "" )
				WriteRoleValue(isaac,EM_RoleValue_register5,1)
				door1=ic_mob_flag_add_Y_N(isaac,door_id,flag_id,3,1)						---王身後阻擋門  
				ic_All_door(door1)
				AddToPartition(door1,RoomID)
				ic_say_all_play("[SC_106198_01]",2)											---開打對話---
				BeginPlot(boss , "ic_106198_02" , 0)
				SetPlot( Boss,"dead","ic_All_BOSSXX",0 )									---掛死亡劇情	
			end
		end	
		if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then				---開戰後仇恨表沒人
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   						---王沒死 玩家滅團
				ic_say_all_play("[SC_106198_04]",2)
				sleep(20)
				ic_npcXX(0,App_id[play_Mode],cop_id[play_Mode],0,0,0,0,0,0,0,0)
				DelObj(boss)                                        						---沒死自己殺死王
				DelObj(door1)																---刪除阻擋門
				WriteRoleValue(isaac,EM_RoleValue_register4,0)
				WriteRoleValue(isaac,EM_RoleValue_register5,0)
				WriteRoleValue(isaac,EM_RoleValue_register6,0)
				WriteRoleValue(isaac,EM_RoleValue_register7,0)
				WriteRoleValue(isaac,EM_RoleValue_register8,0)
				WriteRoleValue(isaac,EM_RoleValue_register9,0)
				WriteRoleValue(isaac,EM_RoleValue_register10,0)
				sleep(30)                                          
				Boss=ic_mob_flag_add_Y_N( isaac,boss1_id[play_Mode],flag_id,1,1)                              													
				WriteRoleValue(Boss,EM_RoleValue_PID,isaac)
				WriteRoleValue(Boss,EM_RoleValue_register8,1)
				WriteRoleValue(isaac,EM_RoleValue_register5,1)
				LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*1 , "" )
				ic_playBUFFXX(0,621535,621536,621542,0,0,0,0,0,0,0)							---刪除BUFF
				for i = 20 ,29,1 do															---10個儀器
					mob=ic_mob_flag_add_Y_N(isaac,App_id[play_Mode],flag_id,i,1)  
					SetModeEx( mob , EM_SetModeType_Move, false) 
					SetModeEx(mob,EM_SetModeType_Mark, false)
					SetModeEx( mob , EM_SetModeType_Strikback, false) 						
					SetModeEx( mob , EM_SetModeType_Searchenemy, false)
					WriteRoleValue(mob,EM_RoleValue_PID,isaac)
					WriteRoleValue(mob,EM_RoleValue_register1,boss)
					WriteRoleValue(mob,EM_RoleValue_register2,i)
					BeginPlot(mob, "ic_106198_mobkk" , 0)	
					AddBuff(mob,621538,0 ,-1 )
					AddBuff(mob,623706,0 ,-1 )
					LockHP( mob, ReadRoleValue( mob, EM_RoleValue_MaxHP )*1 , "" )	
				end	
				open=0																		---重置戰鬥
				time0=0
				time1=0
				time2=0
				time3=0
				time4=0
				time5=0
				killidtime=0
			end				
		end	
		if BOSSXX==1 and mobxx==10  then													---無敵殺了王or王死
			ic_say_all_play("[SC_106198_05]",2)									   			---我們怎會輸呢 這跟遊戲規則不符阿~~不~~---死亡
			bobo=ic_mob_Rand_add(Boss,bobo_id[play_Mode],0,0) 
			ic_All_bobo(bobo)
			ic_npcXX(0,App_id[play_Mode],cop_id[play_Mode],0,0,0,0,0,0,0,0)
			DelObj(door)
			if 	open==1 then
				DelObj(door1)
			end
			WriteRoleValue(isaac,EM_RoleValue_register4,0)
			WriteRoleValue(isaac,EM_RoleValue_register5,0)
			WriteRoleValue(isaac,EM_RoleValue_register6,0)
			WriteRoleValue(isaac,EM_RoleValue_register7,0)
			WriteRoleValue(isaac,EM_RoleValue_register8,0)
			WriteRoleValue(isaac,EM_RoleValue_register9,0)
			WriteRoleValue(isaac,EM_RoleValue_register10,0)
			ic_playBUFFXX(0,621535,621536,621542,0,0,0,0,0,0,0)								---刪除BUFF
			open=0																			---重置戰鬥
			time0=0
			time1=0
			time2=0
			time3=0
			time4=0
			time5=0
			killidtime=0
			BOSSXX=2
			sleep(100)		
			break	
		end	
	end		
end 
function ic_106198_mobXX()	
																---儀器死亡用
	local mob=OwnerID()	
	local ZoneID = ReadRoleValue ( mob , EM_RoleValue_ZoneID )	
	local isaac=ReadRoleValue(mob,EM_RoleValue_PID)
	local RoomID=ReadRoleValue(mob,EM_RoleValue_RoomID)
	local mobxx						
	local mob10 = ic_mob_Rand_noadd(mob,106813,0,0)
		mobxx=ReadRoleValue(isaac,EM_RoleValue_register8)
		WriteRoleValue(isaac,EM_RoleValue_register8,mobxx+1)	
		ic_All_nolook_00(mob10)
		AddToPartition(mob10,RoomID)
		--WriteRoleValue( mob10, EM_RoleValue_Livetime, 3)									---存在秒數
		if ZoneID == 149 then
			sysCastSpellLv(mob10,mob10,498793,7)	
		else
			sysCastSpellLv(mob10,mob10,498793,3)
		end	
		delobj(mob)
end 
function ic_106198_mobkk()																	---儀器可以被打用
	local mob=OwnerID()
	local isaac=ReadRoleValue(mob,EM_RoleValue_PID)
	local boss=ReadRoleValue(mob,EM_RoleValue_register1)
	local mobkk	
	local mobbuff=ReadRoleValue(mob,EM_RoleValue_register2)
	local mobbuff1
	local Luck=0
	local time1=0
	SetPlot( mob,"dead","ic_106198_mobXX",0 )
	while 1 do
		Sleep(10)
		mobkk=ReadRoleValue(isaac,EM_RoleValue_register7)
		mobbuff1=ReadRoleValue(isaac,EM_RoleValue_register6)
		if mobbuff==mobbuff1 then
			AddBuff(mob,621832,0 ,-1 )
			WriteRoleValue(isaac,EM_RoleValue_register6,0)
		end
		if mobkk==1 and time1==0 then														---王回收能量~第2階段
			SetModeEx(mob,EM_SetModeType_Mark, true)
			AddBuff(mob,621539,0 ,-1 )
			sysCastSpellLV( mob ,boss, 498875 , 0 )
			CancelBuff(mob, 621538)
			time1=1
			LockHP( mob, ReadRoleValue( mob, EM_RoleValue_MaxHP )*-1 , "" )
		end
	end	
end
function ic_106198_BOSS00xx()	
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local mob00xx
		  mob00xx=ReadRoleValue(isaac , EM_RoleValue_register4)	
		  WriteRoleValue(isaac,EM_RoleValue_register4,mob00xx-1)
		  DelObj(OwnerID())
end
function ic_106198_BOSS00()																	---分身AI
	local boss00=OwnerID()
	local isaac=ReadRoleValue(boss00,EM_RoleValue_PID)
	local play_Mode=ic_ReadRoleValue(isaac,0)												--難度 1=困難12人 2=正常6人 3=簡單6人
	local playkk																
	local time1=0
	local time2=0
	local time3=0
	local Luck
	local Luck1
	local p1p2
	local buff12
	SetPlot( boss00,"dead","ic_106198_BOSS00xx",0 )
	Luck=DW_Rand(2)
	if Luck==1 then																			---光明與黑暗隨機
		AddBuff(boss00,621533,0 ,-1 )
		WriteRoleValue(boss00,EM_RoleValue_register1,1)
	elseif Luck==2 then
		AddBuff(boss00,621534,0 ,-1 )
		WriteRoleValue(boss00,EM_RoleValue_register1,2)
	end
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue(boss00, EM_RoleValue_AttackTargetID )  
		buff12=ReadRoleValue(boss00,EM_RoleValue_register1)	
		p1p2=ReadRoleValue(boss00,EM_RoleValue_register8)
		playkk=ReadRoleValue(boss00,EM_RoleValue_register9)
		time1=time1+1
		time2=time2+1
		if playkk==1 then
			if buff12==1 then
				if play_Mode==2 then
					CastSpellLV( boss00 ,boss00, 498791 , 0 )
				elseif	play_Mode==3 then
					CastSpellLV( boss00 ,boss00, 498791 , 0 )
				end
				WriteRoleValue(boss00,EM_RoleValue_register9,0)
				sleep(30)
			elseif	buff12==2 then
				if play_Mode==2 then
					CastSpellLV( boss00 ,boss00, 498792 , 0 )
				elseif	play_Mode==3 then
					CastSpellLV( boss00 ,boss00, 498792 , 0 )
				end
				WriteRoleValue(boss00,EM_RoleValue_register9,0)
				sleep(30)
			end	
		end	
		if p1p2==2 then
			time3=time3+1
			if time3>13 then
				if buff12==1 then
					if play_Mode==2 then
						CastSpellLV( boss00 ,boss00, 498791 , 0 )
					elseif	play_Mode==3 then
						CastSpellLV( boss00 ,boss00, 498791 , 0 )
					end
					sleep(30)
					time3=0
				elseif	buff12==2 then
					if play_Mode==2 then
						CastSpellLV( boss00 ,boss00, 498792 , 0 )
					elseif	play_Mode==3 then
						CastSpellLV( boss00 ,boss00, 498792 , 0 )
					end
					sleep(30)
					time3=0
				end
			end
		end
		if time2>8 then
			if play_Mode==2 then
				CastSpellLV( boss00 ,boss00, 498789 , 199 )
			elseif	play_Mode==3 then
				CastSpellLV( boss00 ,boss00, 498789 , 49 )
			end
			sleep(10)
			time2=0
		end
		if hatelistcount(boss00)~=0 then
			if time1>7 then
				if play_Mode==2 then
					ic_All_mob_KK123(boss00,6,1,498788,3,20,498787,0,10)
				elseif	play_Mode==3 then
					ic_All_mob_KK123(boss00,6,1,498788,0,0,498787,0,5)
				end
				time1=0
			end
		end
	end
end
function ic_106198_02()   																	---王AI(第10固定狂暴用)
	local Boss=OwnerID()
	local isaac=ReadRoleValue(Boss,EM_RoleValue_PID)
	local play_Mode=ic_ReadRoleValue(isaac,0)												--難度 1=困難12人 2=正常6人 3=簡單6人
	local play44=0																			---狂爆用
	local killidtime=0								 										---狂暴用	
	local p1p2																				---階段
	local playkk																			---大絕	
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local AttackTarget
	local HPPercent
	local time5=0
	while 1 do
		Sleep(10)
		AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )    		 
		p1p2=ReadRoleValue(Boss,EM_RoleValue_register8)
		playkk=ReadRoleValue(Boss,EM_RoleValue_register9)
		killidtime=ReadRoleValue(Boss,EM_RoleValue_register10)
		time1=time1+1
		time2=time2+1
		if killidtime==1 and play44==0 then													---狂爆了
			AddBuff(Boss,507663,0 ,-1 )
			killidtime=0
			WriteRoleValue(Boss,EM_RoleValue_register10,0)							 		---把口袋10歸0
			play44=1
		end
		if p1p2==1 then
			if playkk==1 then
				ic_magic_ing(Boss,5)
				if play_Mode==2 then
					CastSpellLV( Boss ,Boss, 498790 , 11 )
				elseif	play_Mode==3 then
					CastSpellLV( Boss ,Boss, 498790 , 3 )
				end
				WriteRoleValue(Boss,EM_RoleValue_register9,0)
				sleep(20)
			end
		elseif	p1p2==2 then
			HPPercent=ic_HP_Max_Now(Boss)
			--say(Boss,"HPPercent="..HPPercent)
			--say(Boss,"time5="..time5)
			if time4==0 then
				if play_Mode==2 then
					AddBuff(Boss,621537,0 ,-1 )
				elseif	play_Mode==3 then
					AddBuff(Boss,621537,0 ,-1 )
				end
				time4=1
			end
			time3=time3+1
			if time3>13 then
				ic_magic_ing(Boss,5)
				if play_Mode==2 then
					CastSpellLV( Boss ,Boss, 498790 , 11 )
				elseif	play_Mode==3 then
					CastSpellLV( Boss ,Boss, 498790 , 3 )
				end
				sleep(20)
				time3=0
			elseif	   HPPercent<=1  and time5==0 or
					   HPPercent<0.9 and time5==1 or
					   HPPercent<0.8 and time5==2 or
					   HPPercent<0.7 and time5==3 or
					   HPPercent<0.6 and time5==4 or
					   HPPercent<0.5 and time5==5 or
					   HPPercent<0.4 and time5==6 or
					   HPPercent<0.3 and time5==7 or
					   HPPercent<0.2 and time5==8 or
					   HPPercent<0.1 and time5==9 then
				ic_magic_ing(Boss,5)
				SetModeEx( OwnerID(),EM_SetModeType_Fight, false) 
				if play_Mode==2 then
					CastSpellLV( Boss ,Boss, 498790 , 11 )
				elseif	play_Mode==3 then
					CastSpellLV( Boss ,Boss, 498790 , 3 )
				end
				sleep(20)
				SetModeEx( OwnerID(),EM_SetModeType_Fight, true) 
				time3=0
				time5=time5+1	   
			end
		end	
		if time2>8 then
			ic_magic_ing(Boss,5)
			if play_Mode==2 then
				CastSpellLV( Boss ,Boss, 498789 , 199 )
			elseif	play_Mode==3 then
				CastSpellLV( Boss ,Boss, 498789 , 49 )
			end
			sleep(10)
			time2=0
		end
		if hatelistcount(Boss)~=0 then
			if time1>7 then--隨機+自己
				if play_Mode==2 then
					ic_All_mob_KK123(Boss,6,1,498788,3,20,498787,0,10)
				elseif	play_Mode==3 then
					ic_All_mob_KK123(Boss,6,1,498788,0,0,498787,0,5)
				end
				time1=0
			end
		end	
	end	
end