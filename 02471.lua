function ic_106022_01()  																	---第10口袋固定死亡劇情用--第9口袋固定測試距離用					--say(OwnerID(),"boss44="..boss44)														
		local isaac=OwnerID()																	---控制器
		local open=0						  													---開戰旗標				        
		local killidtime=0																		---狂暴計時
		local BOSSXX=0																			---BOSS死亡				
		local door1																				---阻擋門
		local BOSS9898=0																		---測試距離
		local Boss100																			---測試距離用球
		local BOSSP1P2																			---生怪用
		local mob1
		local mob2
		local mob3
		local play1
		local play2
		local play3
		local Luck=0	
		local time1=0
		local time2=0
		local bosskkpaly = {}																	---boss仇恨表
		local mobkk1																			
		local mobkk2																			
		local mobkk3																				
		local Boss1
		local Boss2
		local Boss3
		local Boss4
		local playKKboss																		
		local bosshp
		local Luck1=0
		local XX=0
		local timeboss=0
		local mobstop=0
		local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
		local Boss=CreateObjByFlag(106022,780886,1,1) 											---BOSS創在  旗標1
		local door=CreateObjByFlag(106006,780886,2,1)											---阻擋門(王死才會消失)	509083
				SetModeEx( door , EM_SetModeType_Mark, false)										
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 								
				SetModeEx( door , EM_SetModeType_Obstruct, true) 									---阻擋(是)
				SetModeEx( door , EM_SetModeType_Strikback, false) 									---反擊
				SetModeEx( door , EM_SetModeType_Move, false) 										---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) 										---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)								---索敵(否)
				AddToPartition(door,RoomID)	
				door1=CreateObjByFlag(106006,780886,3,1)									---王身後阻擋門
				SetModeEx( door1 , EM_SetModeType_Mark, false)							---可點選(否)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 					---頭像框(否)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 						---阻擋(是)
				SetModeEx( door1 , EM_SetModeType_Strikback, false) 					---反擊
				SetModeEx( door1 , EM_SetModeType_Move, false) 							---移動	
				SetModeEx( door1 , EM_SetModeType_Fight, false) 						---可砍殺
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 			---是否被搜尋(否)
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)					---索敵(否)	
				AddToPartition(door1,RoomID)
				AddToPartition(Boss,RoomID)
				SetPlot( Boss,"dead","ic_106022_BOSSXX",0 )											---掛死亡劇情
				SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
				SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_END)	
				WriteRoleValue(Boss,EM_RoleValue_PID,isaac)   										---BOSS暫存口袋PID BOSS=isaac
				WriteRoleValue(isaac,EM_RoleValue_PID,Boss)											---isaac暫存口袋PID isaac=BOSS	
		local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )							 ---讀取血量
		local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )     						 ---讀取目前血量
		local HPPercent = NowHP / MaxHP	
		while true do
			sleep(10)
			---say(OwnerID(),"123")
			mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
			BOSSP1P2=ReadRoleValue(isaac , EM_RoleValue_register8)
			BOSS9898=ReadRoleValue(isaac , EM_RoleValue_register9)								
			BOSSXX=ReadRoleValue(isaac , EM_RoleValue_register10)
			MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )						 		---讀取血量
			NowHP = ReadRoleValue(  Boss , EM_RoleValue_HP )     					 		---讀取目前血量
			HPPercent = NowHP / MaxHP
			if  HPPercent<0.6 and HPPercent>0.3 and timeboss==0 then			   	
					timeboss=1
					NowHP = ReadRoleValue(  Boss , EM_RoleValue_HP ) 
					WriteRoleValue(isaac,EM_RoleValue_register5,NowHP)
					DelObj(boss)  
					bosshp=ReadRoleValue(isaac , EM_RoleValue_register5)
					Boss=CreateObjByFlag(106023,780886,1,1)
					WriteRoleValue( Boss, EM_RoleValue_HP,bosshp)
					AddToPartition(Boss,RoomID)
					ScriptMessage( Boss, -1 , 2 , "[SC_105366_05]" , 2 )
					SetPlot( Boss,"dead","ic_106022_BOSSXX",0 )											---掛死亡劇情
					AddBuff(Boss,509424,0 ,-1 ) 
					AddBuff(Boss,620838,0 ,-1 )
					WriteRoleValue(Boss,EM_RoleValue_PID,isaac)   										---BOSS暫存口袋PID BOSS=isaac
					WriteRoleValue(isaac,EM_RoleValue_PID,Boss)											---isaac暫存口袋PID isaac=BOSS
						local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
						local ID=GetSearchResult()
						local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						for i = 0 , NPCXX do
							ID=GetSearchResult()
							ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
							if ID2==105367 or  ID2==105368 or ID2==105369   then     
							WriteRoleValue(ID,EM_RoleValue_register5,Boss)
							end
						end
					CastSpellLV(Boss, Boss, 497237, 0 )										---全場傷害OK
					sleep(30)
					BeginPlot(boss , "ic_106022_02" , 0)
			elseif HPPercent>0 and HPPercent<0.3 and timeboss==1 then			  	
					timeboss=2
					NowHP = ReadRoleValue(  Boss , EM_RoleValue_HP ) 
					WriteRoleValue(isaac,EM_RoleValue_register5,NowHP)
					DelObj(boss)  
					bosshp=ReadRoleValue(isaac , EM_RoleValue_register5)
					Boss=CreateObjByFlag(106024,780886,1,1)
					WriteRoleValue( Boss, EM_RoleValue_HP,bosshp)
					AddToPartition(Boss,RoomID)
					ScriptMessage( Boss, -1 , 2 , "[SC_105366_06]" , 2 )
					SetPlot( Boss,"dead","ic_106022_BOSSXX",0 )											---掛死亡劇情
					AddBuff(Boss,509424,0 ,-1 )
					WriteRoleValue(Boss,EM_RoleValue_PID,isaac)   										---BOSS暫存口袋PID BOSS=isaac
					WriteRoleValue(isaac,EM_RoleValue_PID,Boss)											---isaac暫存口袋PID isaac=BOSS
						local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
						local ID=GetSearchResult()
						local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						for i = 0 , NPCXX do
							ID=GetSearchResult()
							ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
							if ID2==105367 or  ID2==105368 or ID2==105369   then     
								WriteRoleValue(ID2,EM_RoleValue_register5,Boss)
							end
						end
					CastSpellLV(Boss, Boss, 497237, 0 )											---全場傷害OK
					sleep(30)
					BeginPlot(boss , "ic_106022_02" , 0)
			end
				if hatelistcount(boss)~=0 then    												---讀仇恨人數
					killidtime=killidtime+1
					if BOSSP1P2==1 then
								time1=time1+1
					end	
					if  BOSSP1P2==3 then
						time1=time1+1
					end	
						if time1>=30 then														---第1階段15秒生3隻小怪
							if mobstop>3 then
								time1=0
							elseif mobstop<3 then
								ScriptMessage( OwnerID(), -1 , 1 , "[SC_105366_04]" , 2 )				---我們來支援你 
								Luck1=DW_Rand(20)---隨機取得數字用
								playKKboss=hatelistcount(boss)
								if playKKboss==1 then											---少於5ㄍ人隨機打
										bosskkpaly = ic_HateListSort(Boss)
										mobkk1=bosskkpaly[1]
										mob1=CreateObjByFlag(106025,780886,Luck1+11,1)
										AddToPartition(mob1,RoomID)
										WriteRoleValue(mob1,EM_RoleValue_register9,mobkk1)
										WriteRoleValue(mob1,EM_RoleValue_register1,Boss1)
										WriteRoleValue(mob1,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob1,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob1,EM_RoleValue_register5,Boss)
										SetPlot( mob1,"dead","ic_106022_mob1xx",0 )		
										BeginPlot(mob1, "ic_106022_mob_1" , 0)
										SetAttack(mob1 , mobkk1)
										sysCastSpellLV( mobkk1, mob1, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										sleep(5)
										mob2=CreateObjByFlag(106026,780886,Luck1+12,1)
										AddToPartition(mob2,RoomID)											
										WriteRoleValue(mob2,EM_RoleValue_register9,mobkk1)
										WriteRoleValue(mob2,EM_RoleValue_register1,Boss2)
										WriteRoleValue(mob2,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob2,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob2,EM_RoleValue_register5,Boss)
										SetPlot( mob2,"dead","ic_106022_mob2xx",0 )			
										BeginPlot(mob2, "ic_106022_mob_2" , 0)
										SetAttack(mob2 , mobkk1)
										sysCastSpellLV( mobkk1, mob2, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)	
										mob3=CreateObjByFlag(106027,780886,Luck1+13,1)
										AddToPartition(mob3,RoomID)
										WriteRoleValue(mob3,EM_RoleValue_register9,mobkk1)
										WriteRoleValue(mob3,EM_RoleValue_register1,Boss3)
										WriteRoleValue(mob3,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob3,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob3,EM_RoleValue_register5,Boss)
										SetPlot( mob3,"dead","ic_106022_mob3xx",0 )		
										BeginPlot(mob3, "ic_106022_mob_3" , 0)
										SetAttack(mob3 , mobkk1)
										sysCastSpellLV( mobkk1, mob3, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										time1=0
								elseif playKKboss==2 then											---大於5人排第1第2仇恨
										bosskkpaly = ic_HateListSort(Boss)
										mobkk1=bosskkpaly[1]
										mob1=CreateObjByFlag(106025,780886,Luck1+11,1)
										AddToPartition(mob1,RoomID)
										WriteRoleValue(mob1,EM_RoleValue_register9,mobkk1)
										WriteRoleValue(mob1,EM_RoleValue_register1,Boss1)
										WriteRoleValue(mob1,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob1,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob1,EM_RoleValue_register5,Boss)
										SetPlot( mob1,"dead","ic_106022_mob1xx",0 )		
										BeginPlot(mob1, "ic_106022_mob_1" , 0)
										SetAttack(mob1 , mobkk1)
										sysCastSpellLV( mobkk1, mob1, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										sleep(5)
										bosskkpaly = ic_HateListSort(Boss)
										mobkk2=bosskkpaly[2]
										mob2=CreateObjByFlag(106026,780886,Luck1+12,1)
										AddToPartition(mob2,RoomID)											
										WriteRoleValue(mob2,EM_RoleValue_register9,mobkk2)
										WriteRoleValue(mob2,EM_RoleValue_register1,Boss2)
										WriteRoleValue(mob2,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob2,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob2,EM_RoleValue_register5,Boss)
										SetPlot( mob2,"dead","ic_106022_mob2xx",0 )			
										BeginPlot(mob2, "ic_106022_mob_2" , 0)
										SetAttack(mob2 , mobkk2)
										sysCastSpellLV( mobkk2, mob2, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)	
										mob3=CreateObjByFlag(106027,780886,Luck1+13,1)
										AddToPartition(mob3,RoomID)
										WriteRoleValue(mob3,EM_RoleValue_register9,mobkk2)
										WriteRoleValue(mob3,EM_RoleValue_register1,Boss3)
										WriteRoleValue(mob3,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob3,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob3,EM_RoleValue_register5,Boss)
										SetPlot( mob3,"dead","ic_106022_mob3xx",0 )		
										BeginPlot(mob3, "ic_106022_mob_3" , 0)
										SetAttack(mob3 , mobkk2)
										sysCastSpellLV( mobkk2, mob3, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										time1=0
								elseif playKKboss==3 then											---大於5人排第1第2仇恨
										bosskkpaly = ic_HateListSort(Boss)
										mobkk1=bosskkpaly[1]
										mobkk2=bosskkpaly[2]
										mobkk3=bosskkpaly[3]
										mob1=CreateObjByFlag(106025,780886,Luck1+11,1)
										AddToPartition(mob1,RoomID)
										WriteRoleValue(mob1,EM_RoleValue_register9,mobkk1)
										WriteRoleValue(mob1,EM_RoleValue_register1,Boss1)
										WriteRoleValue(mob1,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob1,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob1,EM_RoleValue_register5,Boss)
										SetPlot( mob1,"dead","ic_106022_mob1xx",0 )		
										BeginPlot(mob1, "ic_106022_mob_1" , 0)
										SetAttack(mob1 , mobkk1)
										sysCastSpellLV( mobkk1, mob1, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										sleep(5)
										bosskkpaly = ic_HateListSort(Boss)
										mobkk2=bosskkpaly[2]
										mob2=CreateObjByFlag(106026,780886,Luck1+12,1)
										AddToPartition(mob2,RoomID)											
										WriteRoleValue(mob2,EM_RoleValue_register9,mobkk2)
										WriteRoleValue(mob2,EM_RoleValue_register1,Boss2)
										WriteRoleValue(mob2,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob2,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob2,EM_RoleValue_register5,Boss)
										SetPlot( mob2,"dead","ic_106022_mob2xx",0 )			
										BeginPlot(mob2, "ic_106022_mob_2" , 0)
										SetAttack(mob2 , mobkk2)
										sysCastSpellLV( mobkk2, mob2, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)	
										bosskkpaly = ic_HateListSort(Boss)
										mobkk3=bosskkpaly[3]
										mob3=CreateObjByFlag(106027,780886,Luck1+13,1)
										AddToPartition(mob3,RoomID)
										WriteRoleValue(mob3,EM_RoleValue_register9,mobkk3)
										WriteRoleValue(mob3,EM_RoleValue_register1,Boss3)
										WriteRoleValue(mob3,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob3,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob3,EM_RoleValue_register5,Boss)
										SetPlot( mob3,"dead","ic_106022_mob3xx",0 )		
										BeginPlot(mob3, "ic_106022_mob_3" , 0)
										SetAttack(mob3 , mobkk3)
										sysCastSpellLV( mobkk3, mob3, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										time1=0
								elseif playKKboss==4 then											---大於5人排第1第2仇恨
										bosskkpaly = ic_HateListSort(Boss)
										mobkk1=bosskkpaly[2]
										mobkk2=bosskkpaly[3]
										mobkk3=bosskkpaly[4]
										mob1=CreateObjByFlag(106025,780886,Luck1+11,1)
										AddToPartition(mob1,RoomID)
										WriteRoleValue(mob1,EM_RoleValue_register9,mobkk1)
										WriteRoleValue(mob1,EM_RoleValue_register1,Boss1)
										WriteRoleValue(mob1,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob1,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob1,EM_RoleValue_register5,Boss)
										SetPlot( mob1,"dead","ic_106022_mob1xx",0 )		
										BeginPlot(mob1, "ic_106022_mob_1" , 0)
										SetAttack(mob1 , mobkk1)
										sysCastSpellLV( mobkk1, mob1, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										sleep(5)
										bosskkpaly = ic_HateListSort(Boss)
										mobkk2=bosskkpaly[3]
										mob2=CreateObjByFlag(106026,780886,Luck1+12,1)
										AddToPartition(mob2,RoomID)											
										WriteRoleValue(mob2,EM_RoleValue_register9,mobkk2)
										WriteRoleValue(mob2,EM_RoleValue_register1,Boss2)
										WriteRoleValue(mob2,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob2,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob2,EM_RoleValue_register5,Boss)
										SetPlot( mob2,"dead","ic_106022_mob2xx",0 )			
										BeginPlot(mob2, "ic_106022_mob_2" , 0)
										SetAttack(mob2 , mobkk2)
										sysCastSpellLV( mobkk2, mob2, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										bosskkpaly = ic_HateListSort(Boss)
										mobkk3=bosskkpaly[4]	
										mob3=CreateObjByFlag(106027,780886,Luck1+13,1)
										AddToPartition(mob3,RoomID)
										WriteRoleValue(mob3,EM_RoleValue_register9,mobkk3)
										WriteRoleValue(mob3,EM_RoleValue_register1,Boss3)
										WriteRoleValue(mob3,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob3,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob3,EM_RoleValue_register5,Boss)
										SetPlot( mob3,"dead","ic_106022_mob3xx",0 )		
										BeginPlot(mob3, "ic_106022_mob_3" , 0)
										SetAttack(mob3 , mobkk3)
										sysCastSpellLV( mobkk3, mob3, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										time1=0
								elseif playKKboss>4 then											---大於5人排第1第2仇恨
										--say(OwnerID(),"playKKboss="..playKKboss)
										XX=playKKboss-5												
										Luck=DW_Rand(XX)											
										play1=Luck+3
										play2=Luck+4
										play3=Luck+5	
										bosskkpaly = ic_HateListSort(Boss)
										mobkk1=bosskkpaly[play1]									
										mobkk2=bosskkpaly[play2]									
										mobkk3=bosskkpaly[play3] 																		
										mob1=CreateObjByFlag(106025,780886,Luck1+11,1)
										AddToPartition(mob1,RoomID)
										WriteRoleValue(mob1,EM_RoleValue_register9,mobkk1)
										WriteRoleValue(mob1,EM_RoleValue_register1,Boss1)
										WriteRoleValue(mob1,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob1,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob1,EM_RoleValue_register5,Boss)
										SetPlot( mob1,"dead","ic_106022_mob1xx",0 )		
										BeginPlot(mob1, "ic_106022_mob_1" , 0)
										SetAttack(mob1 , mobkk1)
										sysCastSpellLV( mobkk1, mob1, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										bosskkpaly = ic_HateListSort(Boss)								
										mobkk2=bosskkpaly[play2]										
										mob2=CreateObjByFlag(106026,780886,Luck1+12,1)
										AddToPartition(mob2,RoomID)											
										WriteRoleValue(mob2,EM_RoleValue_register9,mobkk2)
										WriteRoleValue(mob2,EM_RoleValue_register1,Boss2)
										WriteRoleValue(mob2,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob2,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob2,EM_RoleValue_register5,Boss)
										SetPlot( mob2,"dead","ic_106022_mob2xx",0 )			
										BeginPlot(mob2, "ic_106022_mob_2" , 0)
										SetAttack(mob2 , mobkk2)
										sysCastSpellLV( mobkk2, mob2, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										bosskkpaly = ic_HateListSort(Boss)									
										mobkk3=bosskkpaly[play3] 		
										mob3=CreateObjByFlag(106027,780886,Luck1+13,1)
										AddToPartition(mob3,RoomID)
										WriteRoleValue(mob3,EM_RoleValue_register9,mobkk3)
										WriteRoleValue(mob3,EM_RoleValue_register1,Boss3)
										WriteRoleValue(mob3,EM_RoleValue_register3,isaac)
										WriteRoleValue(mob3,EM_RoleValue_register4,BOSSP1P2)
										WriteRoleValue(mob3,EM_RoleValue_register5,Boss)
										SetPlot( mob3,"dead","ic_106022_mob3xx",0 )		
										BeginPlot(mob3, "ic_106022_mob_3" , 0)
										SetAttack(mob3 , mobkk3)
										sysCastSpellLV( mobkk3, mob3, 497235, 0 )
										mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
										WriteRoleValue(isaac,EM_RoleValue_register7,mobstop+1)
										time1=0
								end	
							end	
						end
					if killidtime>=480 then														
						WriteRoleValue(boss,EM_RoleValue_register10,1)							
					end
					if open==0 then
						open=1																	
						SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_END)
					Boss100=Lua_DW_CreateObj("flag",104693,780886,1,0)							
						SetModeEx( Boss100  , EM_SetModeType_HideName, false )					
						SetModeEX( Boss100  , EM_SetModeType_Gravity , false )					
						SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				
						SetModeEx( Boss100  , EM_SetModeType_Mark, false )						
						SetModeEx( Boss100  , EM_SetModeType_Move, false )						
						SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				
						SetModeEx( Boss100  , EM_SetModeType_Fight , false )					
						SetModeEx( Boss100  , EM_SetModeType_Strikback, false )					
						AddToPartition(Boss100,RoomID)
						WriteRoleValue(Boss100,EM_RoleValue_PID,isaac)
						WriteRoleValue(Boss100,EM_RoleValue_register1,Boss)
						BeginPlot(Boss100 , "ic_106022_100" , 0)
						ScriptMessage( Boss, -1 , 2 , "[SC_105366_01]" , 2 )				
						BeginPlot(boss , "ic_106022_02" , 0)									
					Boss1=CreateObjByFlag(106108,780886,71,1)
						SetModeEx( Boss1 , EM_SetModeType_Fight, false) 						
						SetModeEx( Boss1 , EM_SetModeType_ShowRoleHead, false) 					
						SetModeEx( Boss1 , EM_SetModeType_Searchenemy, false)
						SetModeEx( Boss1 , EM_SetModeType_Mark, false)						
						sleep(10)
						AddToPartition(Boss1,RoomID)
						BeginPlot(Boss1 , "ic_106022_BOSS123" , 0)
					Boss2=CreateObjByFlag(106108,780886,72,1)
						SetModeEx( Boss2 , EM_SetModeType_Fight, false) 						
						SetModeEx( Boss2 , EM_SetModeType_ShowRoleHead, false) 					
						SetModeEx( Boss2 , EM_SetModeType_Searchenemy, false)	
						SetModeEx( Boss2 , EM_SetModeType_Mark, false)	
						sleep(10)
						AddToPartition(Boss2,RoomID)
						BeginPlot(Boss2 , "ic_106022_BOSS123" , 0)
					Boss3=CreateObjByFlag(106108,780886,73,1)
						SetModeEx( Boss3 , EM_SetModeType_Fight, false) 						
						SetModeEx( Boss3 , EM_SetModeType_ShowRoleHead, false) 					
						SetModeEx( Boss3 , EM_SetModeType_Searchenemy, false)
						SetModeEx( Boss3 , EM_SetModeType_Mark, false)	
						sleep(10)	
						AddToPartition(Boss3,RoomID)	
						BeginPlot(Boss3 , "ic_106022_BOSS123" , 0)			
					end
				end	
				if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then			
					if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   					
						SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
						sleep(20)
						SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
						sleep(20)
						DelObj(boss)                                        					
						DelObj(boss1)
						DelObj(boss2)
						DelObj(boss3) 	
						DelObj(Boss100)
						local NPCXX = SetSearchAllNPC(RoomID )
						local ID=GetSearchResult()
						local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						for i = 0 , NPCXX do
							ID=GetSearchResult()
							ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
							if ID2==106025 or  ID2==106026 or ID2==106027 or ID2==104693  then     
							DelObj(ID)
							end
						end
						WriteRoleValue(isaac,EM_RoleValue_register7,0)
						WriteRoleValue(isaac,EM_RoleValue_register8,0)
						WriteRoleValue(isaac,EM_RoleValue_register9,0)
						WriteRoleValue(isaac,EM_RoleValue_register10,0)
						sleep(30)                                          
						Boss=CreateObjByFlag(106022,780886,1,1)           									
						AddToPartition(Boss,RoomID)	                               					
						SetPlot( Boss,"dead","ic_106022_BOSSXX",0 )								
						WriteRoleValue(isaac,EM_RoleValue_PID,Boss)
						WriteRoleValue(Boss,EM_RoleValue_PID,isaac)
						BeginPlot(isaac, "ic_106022_BUFFXX" , 0)								
						open=0																	
						killidtime=0
						time1=0
						time2=0
						Luck=0
						XX=0
						plays=0
						timeboss=0
					elseif	BOSSXX==1 and open==1 then											
						ScriptMessage( Boss, -1 , 2 , "[SC_105366_03]" , 2 )				
						SetIdleMotion( door1 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
						SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
						sleep(10)
						SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
						DelObj(Boss100)
						DelObj(Boss1)
						DelObj(Boss2)
						DelObj(Boss3)
						local NPCXX = SetSearchAllNPC(RoomID )
						local ID=GetSearchResult()
						local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						for i = 0 , NPCXX do
							ID=GetSearchResult()
							ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
							if ID2==106025 or  ID2==106026 or ID2==106027  or ID2==104693  then  
							DelObj(ID)
							end
						end
						WriteRoleValue(isaac,EM_RoleValue_register7,0)
						WriteRoleValue(isaac,EM_RoleValue_register8,0)
						WriteRoleValue(isaac,EM_RoleValue_register9,0)
						WriteRoleValue(isaac,EM_RoleValue_register10,0)
						BeginPlot(isaac, "ic_106022_BUFFXX" , 0)								
						open=0																	
						killidtime=0
						BOSSXX=2
						time1=0
						time2=0
						Luck=0
						XX=0
						plays=0
						timeboss=0
						sleep(100)
						DelObj(door)
						DelObj(door1)
						break
					end				
				end	
				if BOSSXX==1  then															   ---無敵殺了王
						ScriptMessage( Boss, -1 , 2 , "[SC_105366_03]" , 2 )			   ---死亡
						SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
						sleep(10)
						SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
						SetModeEx( door , EM_SetModeType_Obstruct, false) 	
						SetModeEx( door1 , EM_SetModeType_Obstruct, false) 	
						local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
						local ID=GetSearchResult()
						local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
						for i = 0 , NPCXX do
							ID=GetSearchResult()
							ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
							if ID2==105367 or  ID2==105368 or ID2==105369 or ID2==104693  then
							DelObj(ID)
							end
						end
						WriteRoleValue(isaac,EM_RoleValue_register7,0)
						WriteRoleValue(isaac,EM_RoleValue_register8,0)
						WriteRoleValue(isaac,EM_RoleValue_register9,0)
						WriteRoleValue(isaac,EM_RoleValue_register10,0)
						BeginPlot(isaac, "ic_106022_BUFFXX" , 0)							   ---刪除BUFF
						open=0	
						killidtime=0
						BOSSXX=2
						time1=0
						time2=0
						Luck=0
						XX=0
						plays=0
						timeboss=0
						sleep(100)
						DelObj(door)
						DelObj(door1)						
						break	
				end	
		end		
end  
function ic_106022_BOSSXX()																	---死亡用
		local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
			WriteRoleValue(isaac,EM_RoleValue_register10,1)
end 
function ic_106022_BOSS123()
		local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
		local mobXX=0																			 ---小怪1死了																			 
		local mob98=0																			 ---小怪1要跑了																			 
		local mobKK=0	
		while true do	
				mob98=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
				mobKK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
				mobXX=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
				if mob98==1 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
					end
					ScriptMessage( OwnerID(), -1 , 1 , "[SC_105366_08]" , 2 )				---讓我掩護你...趕快離開 
					CastSpellLV( OwnerID() , mobKK , 497391, 0 )							---顯護用
					WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
					sleep(10)
				end
				if mobxx==1 then																
					mobKK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
								sleep(5)
					end
					ScriptMessage( OwnerID(), -1 , 1 , "[SC_105366_07]" , 2 )				---竟敢殺死我的人...受死吧 
					CastSpellLV( OwnerID() , mobKK , 498278, 49 )							---沙玩家
					WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
					sleep(10)
				end
			sleep(10)	
		end
end
function ic_106022_PlayBUFF()																	
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local TempPlayer = SetSearchAllPlayer(RoomID)											
		local ThesePlayer = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() 												
				if ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then			
					if  CheckBuff( ThesePlayer[i] , 509079 ) == true then						
						CancelBuff(ThesePlayer[i], 509079)
					end
				end					
			end
end	
function ic_106022_BUFFXX()																	
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local TempPlayer = SetSearchAllPlayer(RoomID)											
		local ThesePlayer = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() 												
				if CheckID( ThesePlayer[i] ) == true and 										
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 				
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then			
					if CheckBuff( ThesePlayer[i] , 508381 ) == true or
					   CheckBuff( ThesePlayer[i] , 509076 ) == true or
					   CheckBuff( ThesePlayer[i] , 620835 ) == true or
					   CheckBuff( ThesePlayer[i] , 620836 ) == true or
					   CheckBuff( ThesePlayer[i] , 620837 ) == true or
					   CheckBuff( ThesePlayer[i] , 620839 ) == true or
					   CheckBuff( ThesePlayer[i] , 509079 ) == true then						---確認BUFF
						CancelBuff(ThesePlayer[i], 508381)										---要刪除的BUFF
						CancelBuff(ThesePlayer[i], 509076)
						CancelBuff(ThesePlayer[i], 620835)
						CancelBuff(ThesePlayer[i], 620836)
						CancelBuff(ThesePlayer[i], 620837)
						CancelBuff(ThesePlayer[i], 620839)
						CancelBuff(ThesePlayer[i], 509079)
					end
				end					
			end
end	
function ic_106022_100()																	---測試距離用
	local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local BOSS9898=GetDistance( OwnerID(), Boss)
		while true do
			BOSS9898=GetDistance( OwnerID(), Boss)
			sleep(10)
			if  BOSS9898>=580 then
				WriteRoleValue(isaac,EM_RoleValue_register9,1)
			end
		end
end
function ic_106022_mob_1()																	---法師
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local Boss1=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
		local BOSSP1P2	
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					 		
		local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     				 		
		local HPPercent = NowHP / MaxHP	
		local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )    				
		local time1=0
		local time2=0
		local bosskkpaly = {}																	
		local mobkk1
		local mobstop
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )									
		while 1 do
			MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )						 		
			NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     					 		
			HPPercent = NowHP / MaxHP
			time1=time1+1
			BOSSP1P2=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
			Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register5)	
			if 	BOSSP1P2==3 and time2==0 then
				AddBuff(OwnerID(),509325,0,-1 )	
				time2=2
			end
			if HPPercent>0.1 then
				AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )
				if  ReadRoleValue( AttackTarget , EM_RoleValue_IsDead ) == 1  then
					if hatelistcount(boss)==0 then
						DelObj(OwnerID())
					elseif hatelistcount(boss)~=0 then			
						bosskkpaly = star_HateListSort(Boss)
						mobkk1=bosskkpaly[1]
						WriteRoleValue(OwnerID(),EM_RoleValue_register9,mobkk1)
					end
				end	
				AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )
				SetAttack(OwnerID() , AttackTarget)
				if time1>=11 then
					CastSpellLV( OwnerID() , AttackTarget , 498274,200)
					sleep(40)
					time1=0
				elseif time1>=0 then	
					CastSpellLV( OwnerID() , AttackTarget , 497233,300)	
					sleep(10)
				end
			elseif HPPercent<0.1  then
				SetModeEx( OwnerID()  , EM_SetModeType_Move, true )								
				CastSpellLV( OwnerID() , OwnerID() , 497234, 0 )								
				SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )						
				SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )						
				WriteRoleValue(Boss1,EM_RoleValue_register2,AttackTarget)
				WriteRoleValue(Boss1,EM_RoleValue_register1,1)
				MoveToFlagEnabled(OwnerID(), false)
				KS_NoAttackPlayer( OwnerID() )
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780886 ,98,0)
				DW_MoveToFlag( OwnerID() , 780886 ,99,0)
				mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
				WriteRoleValue(isaac,EM_RoleValue_register7,mobstop-1)
				DelObj(OwnerID())
			end
			sleep(10)
		end
end
function ic_106022_mob1xx()																	
		local Boss1=ReadRoleValue(OwnerID(),EM_RoleValue_register1)	
		local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register3)	
		local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )    				
		local mobstop
			AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )
			mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
			WriteRoleValue(isaac,EM_RoleValue_register7,mobstop-1)
			WriteRoleValue(Boss1,EM_RoleValue_register2,AttackTarget)
			WriteRoleValue(Boss1,EM_RoleValue_register3,1)
			sleep(10)
			DelObj(OwnerID())
end 
function ic_106022_mob_2()												--戰士					
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local Boss2=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register5)		
		local BOSSP1P2
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					 		
		local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     				 		
		local HPPercent = NowHP / MaxHP	
		local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )    				
		local time1=0
		local time2=0
		local bosskkpaly = {}																	
		local mobkk1
		local mobstop
		while 1 do
			MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )						 		
			NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     					 		
			HPPercent = NowHP / MaxHP	
			time1=time1+1
			Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
			BOSSP1P2=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
			if 	BOSSP1P2==3 and time2==0 then
				AddBuff(OwnerID(),509325,0,-1 )		
				time2=2
			end	
			if HPPercent>0.1 then
				AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )
				if  ReadRoleValue( AttackTarget , EM_RoleValue_IsDead ) == 1  then
					if hatelistcount(boss)==0 then
						DelObj(OwnerID())
					elseif hatelistcount(boss)~=0 then	
						bosskkpaly = star_HateListSort(Boss)
						mobkk1=bosskkpaly[1]
						WriteRoleValue(OwnerID(),EM_RoleValue_register9,mobkk1)
					end
				end	
				AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )
				SetAttack(OwnerID() , AttackTarget)
				if time1>=20 then
					CastSpellLV( OwnerID() , AttackTarget , 498275,30)
					sleep(10)
					time1=0
				end
			elseif HPPercent<0.1 then
				CastSpellLV( OwnerID() , OwnerID() , 497234, 0 )								
				SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )						
				SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )							
				WriteRoleValue(Boss2,EM_RoleValue_register2,AttackTarget)
				WriteRoleValue(Boss2,EM_RoleValue_register1,1)
				MoveToFlagEnabled(OwnerID(), false)
				KS_NoAttackPlayer( OwnerID() )
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780886 ,98,0)
				DW_MoveToFlag( OwnerID() , 780886 ,99,0)
				mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
				WriteRoleValue(isaac,EM_RoleValue_register7,mobstop-1)
				DelObj(OwnerID())
			end
			sleep(10)
		end
end
function ic_106022_mob2xx()																	
		local Boss2=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register3)		
		local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )    				
		local mobstop	
			AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )
			mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
			WriteRoleValue(isaac,EM_RoleValue_register7,mobstop-1)
			WriteRoleValue(Boss2,EM_RoleValue_register2,AttackTarget)
			WriteRoleValue(Boss2,EM_RoleValue_register3,1)
			sleep(10)
			DelObj(OwnerID())
end 
function ic_106022_mob_3()																	
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local Boss3=ReadRoleValue(OwnerID(),EM_RoleValue_register)
		local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register3)	
		local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
		local BOSSP1P2
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					 		
		local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     				 		
		local HPPercent = NowHP / MaxHP	
		local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register1 )    				
		local time1=0
		local time2=0
		local bosskkpaly = {}																	
		local mobkk1
		local mobstop
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )									
		while 1 do
			MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )						 		
			NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     					 		
			HPPercent = NowHP / MaxHP	
			time1=time1+1
			Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
			BOSSP1P2=ReadRoleValue(OwnerID(),EM_RoleValue_register4)	
			if 	BOSSP1P2==3 and time2==0 then 
				AddBuff(OwnerID(),509325,0,-1 )	
				time2=2
			end
			if HPPercent>0.1 then
				AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9)
				if  ReadRoleValue( AttackTarget , EM_RoleValue_IsDead ) == 1  then
					if hatelistcount(boss)==0 then
						DelObj(OwnerID())
					elseif hatelistcount(boss)~=0 then		
						bosskkpaly = star_HateListSort(Boss)
						mobkk1=bosskkpaly[1]
						WriteRoleValue(OwnerID(),EM_RoleValue_register9,mobkk1)
					end
				end
				AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9)
				SetAttack(OwnerID() , AttackTarget)
				if time1>=11 then
					CastSpellLV( OwnerID() , AttackTarget , 498276,220)
					sleep(20)
					time1=0
				elseif time1>=0 then	
					CastSpellLV( OwnerID() , AttackTarget , 497232,2)
					sleep(10)
				end	
			elseif HPPercent<=0.1  then
				SetModeEx( OwnerID()  , EM_SetModeType_Move, true )								
				CastSpellLV( OwnerID() , OwnerID() , 497234, 0)									
				SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )						
				SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )						
				WriteRoleValue(Boss3,EM_RoleValue_register2,AttackTarget)
				WriteRoleValue(Boss3,EM_RoleValue_register1,1)
				MoveToFlagEnabled(OwnerID(), false)
				KS_NoAttackPlayer( OwnerID() )
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780886 ,98,0)
				DW_MoveToFlag( OwnerID() , 780886 ,99,0)
				mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
				WriteRoleValue(isaac,EM_RoleValue_register7,mobstop-1)
				DelObj(OwnerID())
			end
			sleep(10)
		end
end
function ic_106022_mob3xx()																	
		local Boss3=ReadRoleValue(OwnerID(),EM_RoleValue_register1)	
		local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_register3)	
		local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )    				
		local mobstop
			AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_register9 )
			mobstop=ReadRoleValue(isaac , EM_RoleValue_register7)
			WriteRoleValue(isaac,EM_RoleValue_register7,mobstop-1)
			WriteRoleValue(Boss3,EM_RoleValue_register2,AttackTarget)
			WriteRoleValue(Boss3,EM_RoleValue_register3,1)
			sleep(10)
			DelObj(OwnerID())
end 
function ic_106022_02()   																	 
		local isaac=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
		local Boss=OwnerID()
		local RoomID=ReadRoleValue(Boss,EM_RoleValue_RoomID)
		local BOSSXX=0																			
		local play44=0																			 
		local killidtime=0								 										 
		local play1x={} 									 									 
		local plays=0   									 									 
		local Luck=0										 										
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )							 
		local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     						 
		local HPPercent = NowHP / MaxHP
		local time20=0
		local time30=0
		local time1=0
		local time2=0
		local time3=0
		local time4=0
		local time5=0
		local time6=0
			while 1 do
				Sleep(10)
				
				local AttackTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID )    		 
				local BossTarget=AttackTarget
						BOSSXX=ReadRoleValue(isaac, EM_RoleValue_register10)																				
						MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )							 
						NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     						 
						HPPercent = NowHP / MaxHP
						killidtime=ReadRoleValue(Boss,EM_RoleValue_register10)
				if killidtime==1 and play44==0 then												 
					--AddBuff(Boss,620276,0 ,-1 )
					killidtime=0							 	 
				end
				if HPPercent>0.6 then  
						WriteRoleValue(isaac,EM_RoleValue_register8,1)
						
						time1=time1+1
						time2=time2+1
						time3=time3+1
						if time1>= 15 then
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do
								sleep(5)
							end
							CastSpellLV( OwnerID(), OwnerID(), 497237,0)					
							sleep(10)
							time1=0
						end
						if time2>= 13 then
							if hatelistcount(boss)==1 then
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do
								sleep(5)
								end
								CastSpellLV( OwnerID(), BossTarget, 497238,600)				
								sleep(30)
								time2=0
							elseif hatelistcount(boss)>=2 then	
								play1x=DW_HateRemain(1)										
								plays=DW_Rand(table.getn(play1x))
								while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do
								sleep(5)
								end
								CastSpellLV( OwnerID(), play1x[plays], 497238,600)			
								sleep(30)
								time2=0
							end
						end
						if time3>=7 then
							while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do
								sleep(5)
							end
							CastSpellLV( OwnerID(), BossTarget, 497239,10)					
							sleep(10)
							time3=0
						end
				elseif HPPercent<0.6 and HPPercent>0.3 then				
					if time20==0 then
						WriteRoleValue(isaac,EM_RoleValue_register8,2)
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do
								sleep(5)
						end
						CastSpellLV( OwnerID() ,  OwnerID() , 497236, 0 )					
						sleep(10)
						time20=1
						time1=0
						time2=0
						time3=0
					elseif	time20==1 then
						time4=time4+1
						time5=time5+1
						time6=time6+1
						if time4>=9 then
							if hatelistcount(boss)==1 then
								CastSpellLV( OwnerID(), BossTarget, 497058,5)				
								sleep(30)
								time4=0
							elseif hatelistcount(boss)>=2 then	
								play1x=DW_HateRemain(1)										
								plays=DW_Rand(table.getn(play1x))
								CastSpellLV( OwnerID(), play1x[plays], 497058,5)			
								sleep(30)
								time4=0
							end	
						end
						if time5>=4  then
							if hatelistcount(boss)==1 then
								CastSpellLV( OwnerID(), BossTarget, 497393,600)				
								sleep(10)
								time5=0
							elseif hatelistcount(boss)>=2 then	
								play1x=DW_HateRemain(1)										
								plays=DW_Rand(table.getn(play1x))
								CastSpellLV( OwnerID(), play1x[plays], 497393,600)			
								sleep(10)
								time5=0
							end
						end
						if time6>=0 then
							CastSpellLV( OwnerID(), OwnerID(), 498277, 600 )					
							sleep(5)
							time6=0
						end
					end	
				elseif HPPercent<=0.3 then
					local mob991
					local mob992
					local mob993
					local mob994
					local mob995
					local mob996
						WriteRoleValue(isaac,EM_RoleValue_register8,3)
					if HPPercent>0  and HPPercent<0.3  and time3==0 and BOSSXX==0 or 
					   HPPercent>0  and HPPercent<0.26 and time3==1 and BOSSXX==0 or  
					   HPPercent>0  and HPPercent<0.22 and time3==2 and BOSSXX==0 or 
					   HPPercent>0  and HPPercent<0.18 and time3==3 and BOSSXX==0 or  
					   HPPercent>0  and HPPercent<0.14 and time3==4 and BOSSXX==0 or 
					   HPPercent>0  and HPPercent<0.10 and time3==5 and BOSSXX==0 or 
					   HPPercent>0  and HPPercent<0.06 and time3==6 and BOSSXX==0 or 
					   HPPercent>0  and HPPercent<0.02 and time3==7 and BOSSXX==0   then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do
								sleep(5)
						end
						ScriptMessage( OwnerID(), -1 , 2 , "[SC_105366_02]" , 2 )			  
						mob991=CreateObjByFlag(104693,780886,81,1)
						SetModeEx( mob991 , EM_SetModeType_Fight, false) 									
						SetModeEx( mob991 , EM_SetModeType_ShowRoleHead, false) 							
						SetModeEx( mob991 , EM_SetModeType_Searchenemy, false)								
						AddToPartition(mob991,RoomID)
						mob992=CreateObjByFlag(104693,780886,82,1)
						SetModeEx( mob992 , EM_SetModeType_Fight, false) 									
						SetModeEx( mob992 , EM_SetModeType_ShowRoleHead, false) 							
						SetModeEx( mob992 , EM_SetModeType_Searchenemy, false)								
						AddToPartition(mob992,RoomID)
						mob993=CreateObjByFlag(104693,780886,83,1)
						SetModeEx( mob993 , EM_SetModeType_Fight, false) 									
						SetModeEx( mob993 , EM_SetModeType_ShowRoleHead, false) 							
						SetModeEx( mob993 , EM_SetModeType_Searchenemy, false)								
						AddToPartition(mob993,RoomID)
						mob994=CreateObjByFlag(104693,780886,84,1)
						SetModeEx( mob994 , EM_SetModeType_Fight, false) 									
						SetModeEx( mob994 , EM_SetModeType_ShowRoleHead, false) 							
						SetModeEx( mob994 , EM_SetModeType_Searchenemy, false)								
						AddToPartition(mob994,RoomID)
						mob995=CreateObjByFlag(104693,780886,85,1)
						SetModeEx( mob995 , EM_SetModeType_Fight, false) 									
						SetModeEx( mob995 , EM_SetModeType_ShowRoleHead, false) 							
						SetModeEx( mob995 , EM_SetModeType_Searchenemy, false)								
						AddToPartition(mob995,RoomID)
						mob996=CreateObjByFlag(104693,780886,86,1)
						SetModeEx( mob996 , EM_SetModeType_Fight, false) 									
						SetModeEx( mob996 , EM_SetModeType_ShowRoleHead, false) 							
						SetModeEx( mob996 , EM_SetModeType_Searchenemy, false)								
						AddToPartition(mob996,RoomID)
						SetPosByFlag(Boss,780886,1)
						CancelBuff(Boss,509055)
						BeginPlot(mob991, "ic_106022_mob91" , 0)
						BeginPlot(mob992, "ic_106022_mob92" , 0)
						BeginPlot(mob993, "ic_106022_mob93" , 0)
						BeginPlot(mob994, "ic_106022_mob94" , 0)
						BeginPlot(mob995, "ic_106022_mob95" , 0)
						BeginPlot(mob996, "ic_106022_mob96" , 0)
						SetModeEx( Boss , EM_SetModeType_Fight, false) 						
						CastSpellLV( OwnerID(),OwnerID(), 497242, 0 )						
						sleep(70)
						SetModeEx( Boss , EM_SetModeType_Fight, true) 						
						time3=time3+1
					end
					time1=time1+1
					time2=time2+1
						if time1>=15 then
							if hatelistcount(boss)==1 then
								CastSpellLV( OwnerID(), BossTarget, 497392,3)					
								sleep(10)
								time1=0	
							elseif hatelistcount(boss)>=2 then
								play1x=DW_HateRemain(1)											
								plays=DW_Rand(table.getn(play1x))
								CastSpellLV( OwnerID(), play1x[plays], 497392,3)				
								sleep(10)
								time1=0
							end	
						end
						if time2>=10 then
							CastSpellLV( OwnerID(),OwnerID(), 497241, 0 )						
							sleep(10)
							time2=0
						end
				end
			end	
	end
function ic_106022_mob91()
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local Boss100=Lua_DW_CreateObj("flag",104693,780886,91,0)				
		SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				
		SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				
		SetModeEx( Boss100  , EM_SetModeType_Fight , false )					
		AddToPartition(Boss100,RoomID)																	
		sleep(10)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(35)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(10)
		DelObj(OwnerID())
end		
function ic_106022_mob92()																	
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local Boss100=Lua_DW_CreateObj("flag",104693,780886,92,0)				
		SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				
		SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				
		SetModeEx( Boss100  , EM_SetModeType_Fight , false )					
		AddToPartition(Boss100,RoomID)																	
		sleep(10)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(35)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(10)
		DelObj(OwnerID())
end	
function ic_106022_mob93()																	
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local Boss100=Lua_DW_CreateObj("flag",104693,780886,93,0)				
		SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				
		SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				
		SetModeEx( Boss100  , EM_SetModeType_Fight , false )					
		AddToPartition(Boss100,RoomID)																	
		sleep(10)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(35)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(10)
		DelObj(OwnerID())
end	
function ic_106022_mob94()																	
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local Boss100=Lua_DW_CreateObj("flag",104693,780886,94,0)				
		SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				
		SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				
		SetModeEx( Boss100  , EM_SetModeType_Fight , false )					
		AddToPartition(Boss100,RoomID)																	
		sleep(10)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(35)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(10)
		DelObj(OwnerID())
end	
function ic_106022_mob95()																	
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local Boss100=Lua_DW_CreateObj("flag",104693,780886,95,0)				
		SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				
		SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				
		SetModeEx( Boss100  , EM_SetModeType_Fight , false )						
		AddToPartition(Boss100,RoomID)																	
		sleep(10)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(35)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(10)
		DelObj(OwnerID())
end			
function ic_106022_mob96()																	
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		local Boss100=Lua_DW_CreateObj("flag",104693,780886,96,0)				
		SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )				
		SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )				
		SetModeEx( Boss100  , EM_SetModeType_Fight , false )					
		AddToPartition(Boss100,RoomID)																	
		sleep(10)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(35)
		CastSpellLV( Boss100,Boss100, 497243, 0 )								
		sleep(10)
		DelObj(OwnerID())
end						