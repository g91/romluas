function ic_106444_01()  																	---第10口袋固定死亡劇情用--第9口袋固定測試距離用					--say(OwnerID(),"boss44="..boss44)											
	local isaac=OwnerID()																	---控制器
	local flag_id=781046																	---旗標
	local boss_id																---BOSS
	local boss2_id																---BOSS(重置過換生這支)
	local door_id=105078																	---阻擋門
	local boss_Reset=700																	---測距離
	local open=0						  													---開戰旗標				        
	local killidtime=0																		---狂暴計時
	local BOSSXX=0																			---BOSS死亡				
	local door1																				---阻擋門
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local BossID
	local box
	if ZoneID == 151 then
		boss_id=106444																	---BOSS
		boss2_id=106444	
		box = 106201
	elseif ZoneID == 152 then
		boss_id=107591																	---BOSS
		boss2_id=107591	
		box = 107590
	elseif ZoneID == 153 then
		boss_id=107606																	---BOSS
		boss2_id=107606	
		box = 107607
	end
	local BOSS9898=0																		---測試距離																		
	local bobo
	local RoomID=ic_ReadRoleValue(isaac,11)													---0=PID 1-10=1-10口袋 11=ROOMID 12=當前目標
	local Boss=ic_mob_flag_add_Y_N(isaac,boss_id,flag_id,1,1)									---BOSS創在  旗標1
	local door=ic_mob_flag_add_Y_N(isaac,door_id,flag_id,2,1)									---阻擋門(王死才會消失)    						 		
	local HPPercent																			---讀血量用
	local mob00
	
	

		ic_All_door(door)
		ic_WriteRoleValue(Boss,0,Boss)   	
		ic_WriteRoleValue(Boss,9,0)	
		LockHP(Boss,ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.2 ,"")	
		mob00=ic_mob_Rand_noadd(isaac,106200 ,0,0)
		ic_All_nolook_00(mob00)
		AddToPartition(mob00,RoomID)
		ic_WriteRoleValue(mob00,0,Boss)
		BeginPlot(mob00,"ic_106444_00",0)
	while true do
		sleep(10)
		BOSS9898=ic_ReadRoleValue(isaac,9)
		HPPercent=ic_HP_Max_Now(Boss)	
		if hatelistcount(Boss)~=0 then    													---讀仇恨人數
			killidtime=killidtime+1
			--say(Boss,"crazy = "..killidtime)
			if killidtime>=360 then			 --修改秒數												---狂暴時間
				ic_WriteRoleValue(Boss,10,1)												---狂爆了
				AddBuff(Boss,623851,0 ,-1 )
				ic_say_all_play("[SC_106444_04]",2)	
				killidtime=0
			end
			if open==0 then
				MoveToFlagEnabled(Boss, true)
				DelObj(mob00)
				open=1																		----開打了
				ic_All_Boss100_1(flag_id,isaac,Boss,boss_Reset)								---測是距離用(旗標,中控器,BOSS,距離)回傳值到第10口袋
			door1=ic_mob_flag_add_Y_N( isaac,door_id,flag_id,3,2)							---王身後阻擋門
				ic_All_door(door1)
				AddToPartition(door1,RoomID)
				ic_say_all_play("[SC_106444_01]",2)											---開打對話---
				BeginPlot(boss , "ic_106444_02" , 0)										---命令角色做事情
			end
		end	
		if hatelistcount(boss)==0 and open==1 or BOSS9898==1 and open==1 then				---開戰後仇恨表沒人
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   						---王沒死 玩家滅團
			ic_say_all_play("[SC_106444_02]",2)
				sleep(20)
				DelObj(boss)                                        						---沒死自己殺死王
				DelObj(door1)																---刪除阻擋門
				ic_WriteRoleValue(isaac,9,0)
				ic_WriteRoleValue(isaac,10,0)
				sleep(30)                                          
				Boss=ic_mob_flag_add_Y_N( isaac,boss2_id,flag_id,1,1)           			---再創造1之				                               			
				ic_WriteRoleValue(Boss,0,isaac)
				ic_WriteRoleValue(Boss,9,0)
				mob00=ic_mob_Rand_noadd(isaac,106200 ,0,0)
				ic_All_nolook_00(mob00)
				AddToPartition(mob00,RoomID)
				ic_WriteRoleValue(mob00,0,Boss)
				BeginPlot(mob00,"ic_106444_00",0)
				LockHP(Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.2 , "" )	
				ic_playBUFFXX(0,622348,0,0,0,0,0,0,0,0,0)									---刪除BUFF
				open=0																		---重置戰鬥
				killidtime=0
			end
		end	
		if HPPercent<=0.2 and  ReadRoleValue( boss , EM_RoleValue_IsDead)~=0  then			---無敵殺了王 或王死了
			ic_say_all_play("[SC_106444_03]",2)		   										---我們怎會輸呢 這跟遊戲規則不符阿~~不~~---死亡
			AddBuff(Boss,509424,0 ,-1 )	
			ic_WriteRoleValue(Boss,9,1)
			SetModeEx( Boss , EM_SetModeType_Fight, false) 	
			ic_NoAttackPlayer( Boss )
			SetModeEx( Boss , EM_SetModeType_Strikback, false)
			SetModeEx( Boss , EM_SetModeType_Searchenemy, false)							---索敵
			ic_NoAttackPlayer( Boss )
			bobo=ic_mob_Rand_add( Boss , box ,0,0) 
			ic_All_bobo(bobo)
			StopMove(Boss,false)
			MoveToFlagEnabled(Boss, true)
			Hide(Boss)
			Show(Boss,RoomID)
			WriteRoleValue(Boss,EM_RoleValue_IsWalk,0)
			DW_MoveToFlag( Boss , flag_id ,30,0)
			DelObj(Boss)
			---防駭客
			DelObj(mob00)
			DelObj(door)
			if open==1 then
				DelObj(door1)
			end	
			ic_WriteRoleValue(isaac,9,0)
			ic_WriteRoleValue(isaac,10,0)
			ic_playBUFFXX(0,622348,0,0,0,0,0,0,0,0,0)							  			---刪除BUFF
			open=0	
			time1=0
			killidtime=0
			BOSSXX=2
			sleep(100)		
			break	
		end
	end		
end 
function ic_106444_00()																		---讓BOSS走路用
	local flag_id=781046																	---旗標
	local Boss=ic_ReadRoleValue(OwnerID(),0)
	local time1=0    						 			
	local HPPercent
	while 1 do
		if  time1==0 then
			for i=4,9 do 
				HPPercent =ic_HP_Max_Now(Boss)
				if HPPercent==1 then
					DW_MoveToFlag(Boss,flag_id ,i,0)
					--SetDir(Boss, 36.8)
					--sleep(30)
				end	
			end	
		end	
		sleep(10)
	end	
end
function ic_106444_mob1011()																---定點傷害用
	local mob=OwnerID()
	local ZoneID = ReadRoleValue ( mob , EM_RoleValue_ZoneID )
	if ZoneID == 151 then
		skilllv = 11
	elseif ZoneID == 152 then
		skilllv =14
	elseif ZoneID == 153 then
		skilllv =9
	end
	addbuff(mob,623994,0,-1)	
	  sleep(30)
	  CastSpellLV( mob, mob, 850089, skilllv )
	  sleep(20)
	  DelObj(mob)
end
function ic_106444_02()   																	---王AI(第10固定狂暴用)
	local Boss=OwnerID()
	local isaac=ic_ReadRoleValue(Boss,0)
	local AttackTarget
	local RoomID=ic_ReadRoleValue(Boss,11)													---0=PID 1-10=1-10口袋 11=ROOMID 12=當前目標
	local play44=0																			---狂爆用
	local killidtime=0								 										---狂暴用
	local Luck=0										 									---隨機表用	
	local time1=0
	local time2=0
	local time3=0
	local time4=0
	local time5=0
	local bosskkpaly = {}
	local playKKboss
	local play123
	local mobkk1
	local mobkk2
	local play1
	local play2
	local mob10
	local mob11
	local boss9898=0    						 		
	local HPPercent
	local time6=0
	local time7=0
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	while 1 do
		Sleep(10)
		boss9898=ic_ReadRoleValue(Boss,9)	
	if 	boss9898==1 then
			time1=0
			time2=0
			time3=0
			time4=0
	elseif boss9898==0 then	
			AttackTarget = ic_ReadRoleValue(Boss,12)    		 							---找尋目前的攻擊目標
			boss9898=ic_ReadRoleValue(Boss,9)
			killidtime=ic_ReadRoleValue(Boss,10)
			HPPercent =ic_HP_Max_Now(Boss)
			time1=time1+1
			time2=time2+1
			time3=time3+1
			time4=time4+1
			if killidtime==1 and play44==0 then												---狂爆了
				AddBuff(Boss,623851,0 ,-1 )
				killidtime=0
				ic_WriteRoleValue(Boss,10,0)							 					---把口袋10歸0
				play44=1
			end
			if time1>=19 then																---投擲斧頭6人
				--SetModeEx( Boss  , EM_SetModeType_Fight , false )
				SetModeEx( Boss  , EM_SetModeType_Move , false )
				CastSpellLV( Boss, Boss, 497601, 0 )
				sleep(30)
				ic_say_all_play("[SC_106444_05]",2)	
				ic_playkk_mob_1_6_LUA01(Boss,6,0,106200,"ic_106444_mob1011") 
					sleep(20)
					time1=0
					--SetModeEx( Boss  , EM_SetModeType_Fight , true )
					SetModeEx( Boss  , EM_SetModeType_Move , true )
			elseif	HPPercent<0.9 and time5==0 or 
					HPPercent<0.8 and time5==1 or 
					HPPercent<0.7 and time5==2 or 
					HPPercent<0.6 and time5==3 or 
					HPPercent<0.5 and time5==4 or 
					HPPercent<0.4 and time5==5 or 
					HPPercent<0.3 and time5==6 then
					--SetModeEx( Boss  , EM_SetModeType_Fight , false )
					SetModeEx( Boss  , EM_SetModeType_Move , false )
					time5=time5+1
					CastSpellLV( Boss, Boss, 497601, 0 )
					sleep(30)
					ic_say_all_play("[SC_106444_05]",2)	
				ic_playkk_mob_1_6_LUA01(Boss,6,0,106200,"ic_106444_mob1011")   
					sleep(20)	
					time1=0
					--SetModeEx( Boss  , EM_SetModeType_Fight , true )
					SetModeEx( Boss  , EM_SetModeType_Move , true )
			end
			if time2>=15 then				---全場傷害
				if ZoneID == 151 then
					skilllv = 49
				elseif ZoneID == 152 then
					skilllv =69
				elseif ZoneID == 153 then
					skilllv =9
				end
			ic_say_all_play("[SC_106444_06]",2)	
				CastSpellLV( Boss, Boss, 850088, skilllv )
				sleep(60)
				time2=0
			end
			if time3>=9 then																---前扇形
				CastSpellLV( Boss, Boss, 850087, 0 )
				sleep(10)
				time3=0
			end
			if time4>=4 then																---左右手各一
				--SetModeEx(Boss,EM_SetModeType_Fight , false )
				SetModeEx(Boss,EM_SetModeType_Move , false )
				playKKboss=hatelistcount(Boss)
				if playKKboss==1 then
					boss9898=ic_ReadRoleValue(Boss,9)	
					if boss9898==0 then
						AdjustFaceDir(Boss,AttackTarget,0)
						CastSpellLV( Boss, AttackTarget, 850086, 0 )						---左手
						ic_magic_ing(Boss,5)
						sleep(10)
					end	
					boss9898=ic_ReadRoleValue(Boss,9)	
					if boss9898==0 then
						AdjustFaceDir(Boss,AttackTarget,0)
						CastSpellLV( Boss, AttackTarget, 850090, 0 )						---右手
						ic_magic_ing(Boss,5)
						sleep(10)
					end	
				elseif	playKKboss>=2 then
					boss9898=ic_ReadRoleValue(Boss,9)	
					if boss9898==0 then
						play123=playKKboss-1
						Luck=DW_Rand(play123)
						play1=Luck
						play2=Luck+1
						bosskkpaly = ic_HateListSort(Boss)
						mobkk1=bosskkpaly[play1]
						mobkk2=bosskkpaly[play2]
						if CheckID( mobkk1 ) == true and time6==0 then
							AdjustFaceDir(Boss,mobkk1,0)
							CastSpellLV( Boss, mobkk1, 850086, 0 )
							time6=1
						elseif	CheckID( mobkk1 ) == false and time6==0 then
							AttackTarget = ic_ReadRoleValue(Boss,12)
							AdjustFaceDir(Boss,AttackTarget,0)
							CastSpellLV( Boss, AttackTarget, 850086, 0 )					---左手
							time6=1
						end	
						ic_magic_ing(Boss,5)
						sleep(10)
					end	
					boss9898=ic_ReadRoleValue(Boss,9)	
					if boss9898==0 then
						if CheckID( mobkk2 ) == true and time7==0 then
							AdjustFaceDir(Boss,mobkk2,0)
							CastSpellLV( Boss, mobkk2, 850090, 0 )
							time7=1
						elseif	CheckID( mobkk2 ) == false and time7==0 then
							AttackTarget = ic_ReadRoleValue(Boss,12)
							AdjustFaceDir(Boss,AttackTarget,0)
							CastSpellLV( Boss, AttackTarget, 850090, 0 )					---左手
							time7=1
						end	
						ic_magic_ing(Boss,5)
						sleep(10)
					end	
					time6=0
					time7=0
				end
				time4=0
				--SetModeEx(Boss,EM_SetModeType_Fight , true )
				SetModeEx(Boss,EM_SetModeType_Move , true )
			end
		end
	end	
end
function ic_playkk_mob_1_6_LUA01(TargetObj,play1_6_Rand,play1kkOX,ObjDBID,LUA)
	--TargetObj=讀誰得仇恨表 play1_6=幾人已上隨機  play1kk=1排坦 0打坦 ObjDBID=物件號碼 LUA="LUA"
	if TargetObj == nil then
		return
	end
	local mob=TargetObj
	local RoomID=ReadRoleValue(mob,EM_RoleValue_RoomID)
	ic_playkk_mob_1_6(mob,play1_6_Rand,play1kkOX,ObjDBID)
	local NPCXX = SetSearchAllNPC(RoomID )
	for i = 0 , NPCXX do
		local ID=GetSearchResult()
		local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
		if ID2==ObjDBID then
			BeginPlot(ID,LUA, 0)
		end
	end
end
