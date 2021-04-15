function ic_780796_mobboss_03()--小怪跟BOSS用
local mob= OwnerID()
local RoomID=ReadRoleValue(mob,EM_RoleValue_RoomID)
local isaac= ReadRoleValue(OwnerID(),EM_RoleValue_register8)---控制器
local boss1								--	1王					
local boss2								--	2王
local boss3								--	3王
local boss4								--	4王 
local mobopen=0 						--(EM_RoleValue_PID)	1王前面小怪=1 2王前面小怪=2 3王前面小怪=3 4王前面小怪=4
local bosstime=0 						--(EM_RoleValue_register5)	招喚王用
local time1=0
local time2=0
local time3=0
local time4=0	
local time5=0
local time6=0
local pe2xx=0							
local mob13xx=0							--(EM_RoleValue_register1)
local mob24xx=0							--(EM_RoleValue_register2)
local boss00=3							--(EM_RoleValue_register4)
local mob1								
local mob2								
local mob3								
local mob4								
local mob5								
local mob6								
local mob7
local mob8
local mob9
local mob10
local mob11
local mob12
local mobtime1							--(EM_RoleValue_register3)生小怪用計數器
local mobtime2							--(EM_RoleValue_register6)生小怪用計數器
local bosxx=0							--(EM_RoleValue_register9)王死後回傳值用(EM_RoleValue_register9)
local npcboss=CreateObjByFlag(104894,780794,27,1) 
SetModeEx( npcboss , EM_SetModeType_Strikback, false) 			---反擊(否)
SetModeEx( npcboss , EM_SetModeType_Move, false) 					---移動	(否)
SetModeEx( npcboss , EM_SetModeType_Searchenemy, false)			---索敵(否)
WriteRoleValue(isaac,EM_RoleValue_register8,mob)   	--暫存口袋 8 	isaac=mob
WriteRoleValue(mob,EM_RoleValue_register8,isaac)
WriteRoleValue(npcboss,EM_RoleValue_register8,mob)
AddToPartition(npcboss,RoomID)
AddBuff( npcboss,508120,0 ,-1 )
	while true do
		sleep(10)
		bosxx=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		---檢查王是否死亡	
		mobopen= ReadRoleValue(OwnerID(),EM_RoleValue_PID)		---4王前面小怪=4 3王前面小怪=32王前面小怪=2 1王前面小怪=1
		pe2xx= ReadRoleValue(isaac,EM_RoleValue_register1)		---讀控制器的第1口袋 PE2失敗=1 
		mob13xx= ReadRoleValue(OwnerID(),EM_RoleValue_register1)	---小怪計數器1-3王
		mob24xx= ReadRoleValue(OwnerID(),EM_RoleValue_register2)	---小怪計數器2-4王		
		mobtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register3)	---小怪計數器波數1-3王
		boss00= ReadRoleValue(OwnerID(),EM_RoleValue_register4)		---生王計數器
		bosstime=ReadRoleValue(OwnerID(),EM_RoleValue_register5)	---生王用
		mobtime2=ReadRoleValue(OwnerID(),EM_RoleValue_register6)	---小怪計數器波數2-4王
		if bosxx==1 then 		---1王死了
		local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
		local ID=GetSearchResult()
		local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2==105040  then
					DelObj(ID)
					end
				end
		WriteRoleValue(isaac,EM_RoleValue_register9,1)				---回傳給控制器1
		sleep(5)
		WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
		elseif bosxx==2 then	---2王死了
		WriteRoleValue(isaac,EM_RoleValue_register9,2)				---回傳給控制器2
		sleep(5)
		WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
		elseif bosxx==3 then	---3王死了
		WriteRoleValue(isaac,EM_RoleValue_register9,3)				---回傳給控制器3
		sleep(5)
		WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
		elseif bosxx==4 then	---4王死了
		WriteRoleValue(isaac,EM_RoleValue_register9,4)				---回傳給控制器4
		sleep(5)
		WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
		elseif bosxx==5 then	---NPC死了
		WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
		WriteRoleValue(isaac,EM_RoleValue_register9,6)
		break
		end
		if bosstime==1 and boss00==0  then
			WriteRoleValue(OwnerID(),EM_RoleValue_register5,7)				
			WriteRoleValue(OwnerID(),EM_RoleValue_register4,boss00+1)
			Boss1=CreateObjByFlag(104811,780794,1,1) 						---BOSS1創在  
			SetModeEx( Boss1 , EM_SetModeType_Mark, false)					
			SetModeEx( Boss1 , EM_SetModeType_ShowRoleHead, false) 			
			SetModeEx( Boss1 , EM_SetModeType_Obstruct, false) 				
			SetModeEx( Boss1 , EM_SetModeType_Strikback, false) 			
			SetModeEx( Boss1 , EM_SetModeType_Move, false) 					
			SetModeEx( Boss1 , EM_SetModeType_Fight, false) 				
			SetModeEx( Boss1 , EM_SetModeType_SearchenemyIgnore, false) 	
			SetModeEx( Boss1 , EM_SetModeType_Searchenemy, false)			
			AddToPartition(Boss1,RoomID)
			WriteRoleValue(Boss1,EM_RoleValue_register1,mob)				---在1王的第1口袋紀錄控制器
			BeginPlot(boss1 , "un_762_190001AI" , 0)							
		elseif bosstime==2 and boss00==1 then
			WriteRoleValue(OwnerID(),EM_RoleValue_register5,7)				
			WriteRoleValue(OwnerID(),EM_RoleValue_register4,boss00+1)
			Boss2=CreateObjByFlag(104811,780794,2,1) 						-----BOSS2創在  
			SetModeEx( Boss2 , EM_SetModeType_Mark, false)					
			SetModeEx( Boss2 , EM_SetModeType_ShowRoleHead, false) 			
			SetModeEx( Boss2 , EM_SetModeType_Obstruct, false) 				
			SetModeEx( Boss2 , EM_SetModeType_Strikback, false) 			
			SetModeEx( Boss2 , EM_SetModeType_Move, false) 					
			SetModeEx( Boss2 , EM_SetModeType_Fight, false)					
			SetModeEx( Boss2 , EM_SetModeType_SearchenemyIgnore, false) 	
			SetModeEx( Boss2 , EM_SetModeType_Searchenemy, false)			
			AddToPartition(Boss2,RoomID)
			WriteRoleValue(Boss2,EM_RoleValue_register2,mob)				---在2王的第2口袋紀錄控制器
			BeginPlot(Boss2 , "ic_105062_01" , 0)							
		elseif bosstime==3  and boss00==2 then
			WriteRoleValue(OwnerID(),EM_RoleValue_register5,7)				
			WriteRoleValue(OwnerID(),EM_RoleValue_register4,boss00+1)
			Boss3=CreateObjByFlag(104811,780794,3,1) 						---BOSS3創在  
			SetModeEx( Boss3 , EM_SetModeType_Mark, false)					
			SetModeEx( Boss3 , EM_SetModeType_ShowRoleHead, false) 			
			SetModeEx( Boss3 , EM_SetModeType_Obstruct, false) 				
			SetModeEx( Boss3 , EM_SetModeType_Strikback, false) 			
			SetModeEx( Boss3 , EM_SetModeType_Move, false)					
			SetModeEx( Boss3 , EM_SetModeType_Fight, false) 				
			SetModeEx( Boss3 , EM_SetModeType_SearchenemyIgnore, false) 	
			SetModeEx( Boss3 , EM_SetModeType_Searchenemy, false)			
			AddToPartition(Boss3,RoomID)
			WriteRoleValue(Boss3,EM_RoleValue_register3,mob)				---在3王的第3口袋紀錄控制器
			BeginPlot(Boss3 , "kg_105039_01" , 0)							
		elseif bosstime==4 and boss00==3 then
			WriteRoleValue(OwnerID(),EM_RoleValue_register5,7)				
			WriteRoleValue(OwnerID(),EM_RoleValue_register4,boss00+1)
			Boss4=CreateObjByFlag(104811,780794,4,1) 						---BOSS4創在  
			SetModeEx( Boss4 , EM_SetModeType_Mark, false)					
			SetModeEx( Boss4 , EM_SetModeType_ShowRoleHead, false) 			
			SetModeEx( Boss4 , EM_SetModeType_Obstruct, false) 				
			SetModeEx( Boss4 , EM_SetModeType_Strikback, false) 			
			SetModeEx( Boss4 , EM_SetModeType_Move, false)					
			SetModeEx( Boss4 , EM_SetModeType_Fight, false)					
			SetModeEx( Boss4 , EM_SetModeType_SearchenemyIgnore, false) 	
			SetModeEx( Boss4 , EM_SetModeType_Searchenemy, false)			
			AddToPartition(Boss4,RoomID)
			WriteRoleValue(Boss4,EM_RoleValue_register4,mob)				---在4王的第4口袋紀錄控制器
			WriteRoleValue(Boss4,EM_RoleValue_register6,npcboss)			---在4王的第6口袋紀綠NPCBOSS
			BeginPlot(Boss4 , "cl_762_193304AI" , 0)							
			WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)				---把口袋9歸0		
		end
		if mobopen==1 then
			if time2==57 then
				local mob91								
				local mob92								
				local mob93								
				local mob94
				mob91=CreateObjByFlag(104810,780796,130,1)
				mob92=CreateObjByFlag(104810,780796,131,1)
				mob93=CreateObjByFlag(104810,780796,132,1)
				mob94=CreateObjByFlag(104810,780796,133,1)
				SetModeEx( mob91 , EM_SetModeType_Mark, false)
				SetModeEx( mob91 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob91 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob91 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob91 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob91 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob91 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob91 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob92 , EM_SetModeType_Mark, false)
				SetModeEx( mob92 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob92 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob92 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob92 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob92 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob92 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob92 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob93 , EM_SetModeType_Mark, false)
				SetModeEx( mob93 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob93 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob93 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob93 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob93 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob93 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob93 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob94 , EM_SetModeType_Mark, false)
				SetModeEx( mob94 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob94 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob94 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob94 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob94 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob94 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob94 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob91 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob92 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob93 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob94 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				AddToPartition(mob91,RoomID)
				AddToPartition(mob92,RoomID)
				AddToPartition(mob93,RoomID)
				AddToPartition(mob94,RoomID)
			end	
			WriteRoleValue(OwnerID(),EM_RoleValue_register2,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
				time1=time1+1	---生小怪用
				time2=time2+1	---生BOSS用		
			if time1>=60 and mobtime1<=3 or time1<=60 and mobtime1==1 and mob13xx==12 or time1<=60 and mobtime1==2 and mob13xx==24 or time1<=60 and mobtime1==3 and mob13xx==36 then
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,mobtime1+1)	
				mob1=CreateObjByFlag(104878,780794,5,1)	--3隻小怪上
				mob2=CreateObjByFlag(104878,780794,5,1)	--3隻小怪上
				mob3=CreateObjByFlag(104878,780794,5,1)	--3隻小怪上
				mob4=CreateObjByFlag(104879,780794,6,1)	--3隻小怪上
				mob5=CreateObjByFlag(104879,780794,6,1)	--3隻小怪上
				mob6=CreateObjByFlag(104879,780794,6,1)	--3隻小怪上
				mob7=CreateObjByFlag(104878,780794,7,1)	--3隻小怪下
				mob8=CreateObjByFlag(104878,780794,7,1)	--3隻小怪下
				mob9=CreateObjByFlag(104878,780794,7,1)	--3隻小怪下
				mob10=CreateObjByFlag(104879,780794,8,1)	--3隻小怪下
				mob11=CreateObjByFlag(104879,780794,8,1)	--3隻小怪下
				mob12=CreateObjByFlag(104879,780794,8,1)	--3隻小怪下
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				AddToPartition(mob7,RoomID)
				AddToPartition(mob8,RoomID)
				AddToPartition(mob9,RoomID)
				AddToPartition(mob10,RoomID)
				AddToPartition(mob11,RoomID)
				AddToPartition(mob12,RoomID)
				WriteRoleValue(mob1,EM_RoleValue_PID,mob)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(mob7,EM_RoleValue_PID,mob)
				WriteRoleValue(mob8,EM_RoleValue_PID,mob)
				WriteRoleValue(mob9,EM_RoleValue_PID,mob)
				WriteRoleValue(mob10,EM_RoleValue_PID,mob)
				WriteRoleValue(mob11,EM_RoleValue_PID,mob)
				WriteRoleValue(mob12,EM_RoleValue_PID,mob)
				BeginPlot(mob1 , "ic_780796_mob_981" , 0)
				BeginPlot(mob2 , "ic_780796_mob_981" , 0)
				BeginPlot(mob3 , "ic_780796_mob_981" , 0)
				BeginPlot(mob4 , "ic_780796_mob_981" , 0)
				BeginPlot(mob5 , "ic_780796_mob_981" , 0)
				BeginPlot(mob6 , "ic_780796_mob_981" , 0)
				BeginPlot(mob7 , "ic_780796_mob_981_1" , 0)
				BeginPlot(mob8 , "ic_780796_mob_981_1" , 0)
				BeginPlot(mob9 , "ic_780796_mob_981_1" , 0)
				BeginPlot(mob10, "ic_780796_mob_981_1" , 0)
				BeginPlot(mob11, "ic_780796_mob_981_1" , 0)
				BeginPlot(mob12, "ic_780796_mob_981_1" , 0)
				AddBuff( mob1,508128,0 ,-1 )
				AddBuff( mob2,508128,0 ,-1 )
				AddBuff( mob3,508128,0 ,-1 )
				AddBuff( mob4,508128,0 ,-1 )
				AddBuff( mob5,508128,0 ,-1 )
				AddBuff( mob6,508128,0 ,-1 )
				AddBuff( mob7,508128,0 ,-1 )
				AddBuff( mob8,508128,0 ,-1 )
				AddBuff( mob9,508128,0 ,-1 )
				AddBuff( mob10,508128,0 ,-1 )
				AddBuff( mob11,508128,0 ,-1 )
				AddBuff( mob12,508128,0 ,-1 )
				time1=0
			end
			if time2>=300 and mobtime1>=4  and time2<=305 or time2<=300 and mobtime1==4 and mob13xx==48 then
				time2=350
				local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2==104810  then
					DelObj(ID)
					end
				end
				WriteRoleValue(isaac,EM_RoleValue_register3,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,1)---把口袋5歸1--出1王
			end
		elseif	mobopen==2 then
				if time6==57 then
				local mob91								
				local mob92								
				local mob93								
				local mob94
				local mob95								
				local mob96
				mob91=CreateObjByFlag(104810,780796,134,1)
				mob92=CreateObjByFlag(104810,780796,135,1)
				mob93=CreateObjByFlag(104810,780796,136,1)
				mob94=CreateObjByFlag(104810,780796,137,1)
				mob95=CreateObjByFlag(104810,780796,138,1)
				mob96=CreateObjByFlag(104810,780796,139,1)
				SetModeEx( mob91 , EM_SetModeType_Mark, false)
				SetModeEx( mob91 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob91 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob91 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob91 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob91 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob91 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob91 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob92 , EM_SetModeType_Mark, false)
				SetModeEx( mob92 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob92 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob92 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob92 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob92 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob92 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob92 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob93 , EM_SetModeType_Mark, false)
				SetModeEx( mob93 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob93 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob93 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob93 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob93 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob93 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob93 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob94 , EM_SetModeType_Mark, false)
				SetModeEx( mob94 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob94 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob94 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob94 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob94 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob94 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob94 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob95 , EM_SetModeType_Mark, false)
				SetModeEx( mob95 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob95 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob95 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob95 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob95 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob95 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob95 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob96 , EM_SetModeType_Mark, false)
				SetModeEx( mob96 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob96 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob96 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob96 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob96 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob96 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob96 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob91 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob92 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob93 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob94 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob95 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob96 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				AddToPartition(mob91,RoomID)
				AddToPartition(mob92,RoomID)
				AddToPartition(mob93,RoomID)
				AddToPartition(mob94,RoomID)
				AddToPartition(mob95,RoomID)
				AddToPartition(mob96,RoomID)
			end	
				WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				time1=0
				time2=0
				time3=0
				time4=time4+1	---生小怪用
				time5=time5+1	---生小王用
				time6=time6+1	---生BOSS用
			if time4>=60 and mobtime2<=3 or time4<=60 and mobtime2==1 and mob24xx==12 or time4<=60 and mobtime2==2 and mob24xx==24 or time4<=60 and mobtime2==3 and mob24xx==36 then
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,mobtime2+1)
				mob1=CreateObjByFlag(104880,780794,9,1)		--3隻小怪上
				mob2=CreateObjByFlag(104880,780794,9,1)		--3隻小怪上
				mob3=CreateObjByFlag(104880,780794,9,1)		--3隻小怪上
				mob4=CreateObjByFlag(104881,780794,10,1)	--3隻小怪上
				mob5=CreateObjByFlag(104881,780794,10,1)	--3隻小怪上
				mob6=CreateObjByFlag(104881,780794,10,1)	--3隻小怪上
				mob7=CreateObjByFlag(104880,780794,11,1)	--3隻小怪下
				mob8=CreateObjByFlag(104880,780794,11,1)	--3隻小怪下
				mob9=CreateObjByFlag(104880,780794,11,1)	--3隻小怪下
				mob10=CreateObjByFlag(104881,780794,12,1)	--3隻小怪下
				mob11=CreateObjByFlag(104881,780794,12,1)	--3隻小怪下
				mob12=CreateObjByFlag(104881,780794,12,1)	--3隻小怪下
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				AddToPartition(mob7,RoomID)
				AddToPartition(mob8,RoomID)
				AddToPartition(mob9,RoomID)
				AddToPartition(mob10,RoomID)
				AddToPartition(mob11,RoomID)
				AddToPartition(mob12,RoomID)
				WriteRoleValue(mob1,EM_RoleValue_PID,mob)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(mob7,EM_RoleValue_PID,mob)
				WriteRoleValue(mob8,EM_RoleValue_PID,mob)
				WriteRoleValue(mob9,EM_RoleValue_PID,mob)
				WriteRoleValue(mob10,EM_RoleValue_PID,mob)
				WriteRoleValue(mob11,EM_RoleValue_PID,mob)
				WriteRoleValue(mob12,EM_RoleValue_PID,mob)
				BeginPlot(mob1 , "ic_780796_mob_982" , 0)
				BeginPlot(mob2 , "ic_780796_mob_982" , 0)
				BeginPlot(mob3 , "ic_780796_mob_982" , 0)
				BeginPlot(mob4 , "ic_780796_mob_982" , 0)
				BeginPlot(mob5 , "ic_780796_mob_982" , 0)
				BeginPlot(mob6 , "ic_780796_mob_982" , 0)
				BeginPlot(mob7 , "ic_780796_mob_982_1" , 0)
				BeginPlot(mob8 , "ic_780796_mob_982_1" , 0)
				BeginPlot(mob9 , "ic_780796_mob_982_1" , 0)
				BeginPlot(mob10, "ic_780796_mob_982_1" , 0)
				BeginPlot(mob11, "ic_780796_mob_982_1" , 0)
				BeginPlot(mob12, "ic_780796_mob_982_1" , 0)
				AddBuff( mob1,508129,0 ,-1 )
				AddBuff( mob2,508129,0 ,-1 )
				AddBuff( mob3,508129,0 ,-1 )
				AddBuff( mob4,508129,0 ,-1 )
				AddBuff( mob5,508129,0 ,-1 )
				AddBuff( mob6,508129,0 ,-1 )
				AddBuff( mob7,508129,0 ,-1 )
				AddBuff( mob8,508129,0 ,-1 )
				AddBuff( mob9,508129,0 ,-1 )
				AddBuff( mob10,508129,0 ,-1 )
				AddBuff( mob11,508129,0 ,-1 )
				AddBuff( mob12,508129,0 ,-1 )
				time4=0
			end
			if time5>=300 and mobtime2>=4 and time5<=305 or time5<=300 and mobtime2==4 and mob24xx==48  then
				time5=350
				mob5=CreateObjByFlag(104882,780794,13,1)--1隻小王上
				mob6=CreateObjByFlag(104882,780794,14,1)--1隻小王下
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				BeginPlot(mob5 , "ic_780796_mob_982" , 0)
				BeginPlot(mob6 , "ic_780796_mob_982_1" , 0)
			end
			if time6>=420 and mobtime2>=4 and time6<=425 or  time6<=420 and mobtime2==4 and mob24xx==50 then
				time6=450
				local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2==104810  then
					DelObj(ID)
					end
				end
				WriteRoleValue(isaac,EM_RoleValue_register2,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,2)---把口袋5歸2
				
			end
		elseif	mobopen==3 then
				if time3==57 then
				local mob91								
				local mob92								
				local mob93								
				local mob94
				local mob95								
				local mob96
				mob91=CreateObjByFlag(104810,780796,140,1)
				mob92=CreateObjByFlag(104810,780796,141,1)
				mob93=CreateObjByFlag(104810,780796,142,1)
				mob94=CreateObjByFlag(104810,780796,143,1)
				mob95=CreateObjByFlag(104810,780796,144,1)
				mob96=CreateObjByFlag(104810,780796,145,1)
				SetModeEx( mob91 , EM_SetModeType_Mark, false)
				SetModeEx( mob91 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob91 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob91 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob91 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob91 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob91 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob91 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob92 , EM_SetModeType_Mark, false)
				SetModeEx( mob92 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob92 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob92 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob92 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob92 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob92 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob92 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob93 , EM_SetModeType_Mark, false)
				SetModeEx( mob93 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob93 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob93 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob93 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob93 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob93 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob93 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob94 , EM_SetModeType_Mark, false)
				SetModeEx( mob94 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob94 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob94 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob94 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob94 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob94 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob94 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob95 , EM_SetModeType_Mark, false)
				SetModeEx( mob95 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob95 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob95 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob95 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob95 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob95 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob95 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob96 , EM_SetModeType_Mark, false)
				SetModeEx( mob96 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob96 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob96 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob96 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob96 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob96 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob96 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob91 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob92 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob93 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob94 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob95 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob96 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				AddToPartition(mob91,RoomID)
				AddToPartition(mob92,RoomID)
				AddToPartition(mob93,RoomID)
				AddToPartition(mob94,RoomID)
				AddToPartition(mob95,RoomID)
				AddToPartition(mob96,RoomID)
			end	
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
				time4=0
				time5=0
				time6=0
				time1=time1+1	---生小怪用
				time2=time2+1	---生小王用
				time3=time3+1	---生BOSS用
			if time1>=60 and mobtime1<=3 or time1<=60 and mobtime1==1 and mob13xx==12 or time1<=60 and mobtime1==2 and mob13xx==24 or time1<=60 and mobtime1==3 and mob13xx==36  then
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,mobtime1+1)
				mob1=CreateObjByFlag(104883,780794,15,1)	--3隻小怪上
				mob2=CreateObjByFlag(104883,780794,15,1)	--3隻小怪上
				mob3=CreateObjByFlag(104883,780794,15,1)	--3隻小怪上
				mob4=CreateObjByFlag(104884,780794,16,1)	--3隻小怪上
				mob5=CreateObjByFlag(104884,780794,16,1)	--3隻小怪上
				mob6=CreateObjByFlag(104884,780794,16,1)	--3隻小怪上
				mob7=CreateObjByFlag(104883,780794,17,1)	--3隻小怪下
				mob8=CreateObjByFlag(104883,780794,17,1)	--3隻小怪下
				mob9=CreateObjByFlag(104883,780794,17,1)	--3隻小怪下
				mob10=CreateObjByFlag(104884,780794,18,1)	--3隻小怪下
				mob11=CreateObjByFlag(104884,780794,18,1)	--3隻小怪下
				mob12=CreateObjByFlag(104884,780794,18,1)	--3隻小怪下
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				AddToPartition(mob7,RoomID)
				AddToPartition(mob8,RoomID)
				AddToPartition(mob9,RoomID)
				AddToPartition(mob10,RoomID)
				AddToPartition(mob11,RoomID)
				AddToPartition(mob12,RoomID)
				WriteRoleValue(mob1,EM_RoleValue_PID,mob)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(mob7,EM_RoleValue_PID,mob)
				WriteRoleValue(mob8,EM_RoleValue_PID,mob)
				WriteRoleValue(mob9,EM_RoleValue_PID,mob)
				WriteRoleValue(mob10,EM_RoleValue_PID,mob)
				WriteRoleValue(mob11,EM_RoleValue_PID,mob)
				WriteRoleValue(mob12,EM_RoleValue_PID,mob)
				BeginPlot(mob1 , "ic_780796_mob_983" , 0)
				BeginPlot(mob2 , "ic_780796_mob_983" , 0)
				BeginPlot(mob3 , "ic_780796_mob_983" , 0)
				BeginPlot(mob4 , "ic_780796_mob_983" , 0)
				BeginPlot(mob5 , "ic_780796_mob_983" , 0)
				BeginPlot(mob6 , "ic_780796_mob_983" , 0)
				BeginPlot(mob7 , "ic_780796_mob_983_1" , 0)
				BeginPlot(mob8 , "ic_780796_mob_983_1" , 0)
				BeginPlot(mob9 , "ic_780796_mob_983_1" , 0)
				BeginPlot(mob10, "ic_780796_mob_983_1" , 0)
				BeginPlot(mob11, "ic_780796_mob_983_1" , 0)
				BeginPlot(mob12, "ic_780796_mob_983_1" , 0)
				AddBuff( mob1,508129,0 ,-1 )
				AddBuff( mob2,508129,0 ,-1 )
				AddBuff( mob3,508129,0 ,-1 )
				AddBuff( mob4,508128,0 ,-1 )
				AddBuff( mob5,508128,0 ,-1 )
				AddBuff( mob6,508128,0 ,-1 )
				AddBuff( mob7,508129,0 ,-1 )
				AddBuff( mob8,508129,0 ,-1 )
				AddBuff( mob9,508129,0 ,-1 )
				AddBuff( mob10,508128,0 ,-1 )
				AddBuff( mob11,508128,0 ,-1 )
				AddBuff( mob12,508128,0 ,-1 )
				time1=0
			end
			if time2>=300 and time2<=305 and mobtime1==4 or time2<=300 and mobtime1==4 and mob13xx==48  then
				time2=350
				mob5=CreateObjByFlag(104885,780794,19,1)--1隻小王上
				mob6=CreateObjByFlag(104885,780794,20,1)--1隻小王下
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				BeginPlot(mob5 , "ic_780796_mob_983" , 0)
				BeginPlot(mob6 , "ic_780796_mob_983_1" , 0)
			end
			if time3>=420 and mobtime1>=4 and time3<=425 or time3<=420 and mobtime1==4 and mob13xx==50 then
				time3=450
				local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2==104810  then
					DelObj(ID)
					end
				end
				WriteRoleValue(isaac,EM_RoleValue_register3,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,3)---把口袋9歸3
			end
		elseif	mobopen==4 then
				if time6==57 then
				local mob91								
				local mob92								
				local mob93								
				local mob94
				local mob95								
				local mob96
				mob91=CreateObjByFlag(104810,780796,146,1)
				mob92=CreateObjByFlag(104810,780796,147,1)
				mob93=CreateObjByFlag(104810,780796,148,1)
				mob94=CreateObjByFlag(104810,780796,149,1)
				mob95=CreateObjByFlag(104810,780796,150,1)
				mob96=CreateObjByFlag(104810,780796,151,1)
				SetModeEx( mob91 , EM_SetModeType_Mark, false)
				SetModeEx( mob91 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob91 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob91 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob91 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob91 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob91 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob91 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob92 , EM_SetModeType_Mark, false)
				SetModeEx( mob92 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob92 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob92 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob92 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob92 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob92 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob92 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob93 , EM_SetModeType_Mark, false)
				SetModeEx( mob93 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob93 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob93 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob93 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob93 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob93 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob93 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob94 , EM_SetModeType_Mark, false)
				SetModeEx( mob94 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob94 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob94 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob94 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob94 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob94 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob94 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob95 , EM_SetModeType_Mark, false)
				SetModeEx( mob95 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob95 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob95 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob95 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob95 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob95 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob95 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob96 , EM_SetModeType_Mark, false)
				SetModeEx( mob96 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( mob96 , EM_SetModeType_Obstruct, true) 
				SetModeEx( mob96 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob96 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob96 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob96 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mob96 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mob91 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob92 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob93 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob94 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob95 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				SetModeEx( mob96 , EM_SetModeType_Obstruct, false) 				---阻擋(否)
				AddToPartition(mob91,RoomID)
				AddToPartition(mob92,RoomID)
				AddToPartition(mob93,RoomID)
				AddToPartition(mob94,RoomID)
				AddToPartition(mob95,RoomID)
				AddToPartition(mob96,RoomID)
			end	
				WriteRoleValue(OwnerID(),EM_RoleValue_register1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				time1=0
				time2=0
				time3=0
				time4=time4+1	---生小怪用
				time5=time5+1	---生小王用
				time6=time6+1	---生BOSS用
			if time4>=60 and mobtime2<=3 or time4<=60 and mobtime2==1 and mob24xx==12 or time4<=60 and mobtime2==2 and mob24xx==24 or time4<=60 and mobtime2==3 and mob24xx==36 then
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,mobtime2+1)
				mob1=CreateObjByFlag(104886,780794,21,1)	--3隻小怪上
				mob2=CreateObjByFlag(104886,780794,21,1)	--3隻小怪上
				mob3=CreateObjByFlag(104886,780794,21,1)	--3隻小怪上
				mob4=CreateObjByFlag(104887,780794,22,1)	--3隻小怪上
				mob5=CreateObjByFlag(104887,780794,22,1)	--3隻小怪上
				mob6=CreateObjByFlag(104887,780794,22,1)	--3隻小怪上
				mob7=CreateObjByFlag(104886,780794,23,1)	--3隻小怪下
				mob8=CreateObjByFlag(104886,780794,23,1)	--3隻小怪下
				mob9=CreateObjByFlag(104886,780794,23,1)	--3隻小怪下
				mob10=CreateObjByFlag(104887,780794,24,1)	--3隻小怪下
				mob11=CreateObjByFlag(104887,780794,24,1)	--3隻小怪下
				mob12=CreateObjByFlag(104887,780794,24,1)	--3隻小怪下
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				AddToPartition(mob7,RoomID)
				AddToPartition(mob8,RoomID)
				AddToPartition(mob9,RoomID)
				AddToPartition(mob10,RoomID)
				AddToPartition(mob11,RoomID)
				AddToPartition(mob12,RoomID)
				WriteRoleValue(mob1,EM_RoleValue_PID,mob)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(mob7,EM_RoleValue_PID,mob)
				WriteRoleValue(mob8,EM_RoleValue_PID,mob)
				WriteRoleValue(mob9,EM_RoleValue_PID,mob)
				WriteRoleValue(mob10,EM_RoleValue_PID,mob)
				WriteRoleValue(mob11,EM_RoleValue_PID,mob)
				WriteRoleValue(mob12,EM_RoleValue_PID,mob)
				BeginPlot(mob1 , "ic_780796_mob_984" , 0)
				BeginPlot(mob2 , "ic_780796_mob_984" , 0)
				BeginPlot(mob3 , "ic_780796_mob_984" , 0)
				BeginPlot(mob4 , "ic_780796_mob_984" , 0)
				BeginPlot(mob5 , "ic_780796_mob_984" , 0)
				BeginPlot(mob6 , "ic_780796_mob_984" , 0)
				BeginPlot(mob7 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob8 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob9 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob10, "ic_780796_mob_984_1" , 0)
				BeginPlot(mob11, "ic_780796_mob_984_1" , 0)
				BeginPlot(mob12, "ic_780796_mob_984_1" , 0)
				AddBuff( mob1,508129,0 ,-1 )
				AddBuff( mob2,508129,0 ,-1 )
				AddBuff( mob3,508129,0 ,-1 )
				AddBuff( mob4,508128,0 ,-1 )
				AddBuff( mob5,508128,0 ,-1 )
				AddBuff( mob6,508128,0 ,-1 )
				AddBuff( mob7,508129,0 ,-1 )
				AddBuff( mob8,508129,0 ,-1 )
				AddBuff( mob9,508129,0 ,-1 )
				AddBuff( mob10,508128,0 ,-1 )
				AddBuff( mob11,508128,0 ,-1 )
				AddBuff( mob12,508128,0 ,-1 )
				time4=0			
			elseif time4>=180 and mobtime2<=5 or time4>=60 and mobtime2>=6 and mobtime2<=8  or time4<=180 and mobtime2==5 and mob24xx==52 or time4<=60 and mobtime2==6 and mob24xx==64 or time4<=60 and mobtime2==7 and mob24xx==76 or time4<=60 and mobtime2==8 and mob24xx==88 then
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,mobtime2+1)
				mob1=CreateObjByFlag(104888,780794,21,1)	--3隻小怪上
				mob2=CreateObjByFlag(104888,780794,21,1)	--3隻小怪上
				mob3=CreateObjByFlag(104888,780794,21,1)	--3隻小怪上
				mob4=CreateObjByFlag(104889,780794,22,1)	--3隻小怪上
				mob5=CreateObjByFlag(104889,780794,22,1)	--3隻小怪上
				mob6=CreateObjByFlag(104889,780794,22,1)	--3隻小怪上
				mob7=CreateObjByFlag(104888,780794,23,1)	--3隻小怪下
				mob8=CreateObjByFlag(104888,780794,23,1)	--3隻小怪下
				mob9=CreateObjByFlag(104888,780794,23,1)	--3隻小怪下
				mob10=CreateObjByFlag(104889,780794,24,1)	--3隻小怪下
				mob11=CreateObjByFlag(104889,780794,24,1)	--3隻小怪下
				mob12=CreateObjByFlag(104889,780794,24,1)	--3隻小怪下
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				AddToPartition(mob7,RoomID)
				AddToPartition(mob8,RoomID)
				AddToPartition(mob9,RoomID)
				AddToPartition(mob10,RoomID)
				AddToPartition(mob11,RoomID)
				AddToPartition(mob12,RoomID)
				WriteRoleValue(mob1,EM_RoleValue_PID,mob)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(mob7,EM_RoleValue_PID,mob)
				WriteRoleValue(mob8,EM_RoleValue_PID,mob)
				WriteRoleValue(mob9,EM_RoleValue_PID,mob)
				WriteRoleValue(mob10,EM_RoleValue_PID,mob)
				WriteRoleValue(mob11,EM_RoleValue_PID,mob)
				WriteRoleValue(mob12,EM_RoleValue_PID,mob)
				BeginPlot(mob1 , "ic_780796_mob_984" , 0)
				BeginPlot(mob2 , "ic_780796_mob_984" , 0)
				BeginPlot(mob3 , "ic_780796_mob_984" , 0)
				BeginPlot(mob4 , "ic_780796_mob_984" , 0)
				BeginPlot(mob5 , "ic_780796_mob_984" , 0)
				BeginPlot(mob6 , "ic_780796_mob_984" , 0)
				BeginPlot(mob7 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob8 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob9 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob10, "ic_780796_mob_984_1" , 0)
				BeginPlot(mob11, "ic_780796_mob_984_1" , 0)
				BeginPlot(mob12, "ic_780796_mob_984_1" , 0)
				AddBuff( mob1,508129,0 ,-1 )
				AddBuff( mob2,508129,0 ,-1 )
				AddBuff( mob3,508129,0 ,-1 )
				AddBuff( mob4,508128,0 ,-1 )
				AddBuff( mob5,508128,0 ,-1 )
				AddBuff( mob6,508128,0 ,-1 )
				AddBuff( mob7,508129,0 ,-1 )
				AddBuff( mob8,508129,0 ,-1 )
				AddBuff( mob9,508129,0 ,-1 )
				AddBuff( mob10,508128,0 ,-1 )
				AddBuff( mob11,508128,0 ,-1 )
				AddBuff( mob12,508128,0 ,-1 )
				time4=0			
			elseif time4>180 and mobtime2<=10  or time4>=60 and mobtime2>=11 and mobtime2<=13 or time4<=180 and mobtime2==10 and mob24xx==104 or time4<=60 and mobtime2==11 and mob24xx==116 or time4<=60 and mobtime2==12 and mob24xx==128 or time4<=60 and mobtime2==13 and mob24xx==140 then
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,mobtime2+1)
				mob1=CreateObjByFlag(104886,780794,21,1)	--3隻小怪上
				mob2=CreateObjByFlag(104886,780794,21,1)	--3隻小怪上
				mob3=CreateObjByFlag(104886,780794,21,1)	--3隻小怪上
				mob4=CreateObjByFlag(104889,780794,22,1)	--3隻小怪上
				mob5=CreateObjByFlag(104889,780794,22,1)	--3隻小怪上
				mob6=CreateObjByFlag(104889,780794,22,1)	--3隻小怪上
				mob7=CreateObjByFlag(104886,780794,23,1)	--3隻小怪下
				mob8=CreateObjByFlag(104886,780794,23,1)	--3隻小怪下
				mob9=CreateObjByFlag(104886,780794,23,1)	--3隻小怪下
				mob10=CreateObjByFlag(104889,780794,24,1)	--3隻小怪下
				mob11=CreateObjByFlag(104889,780794,24,1)	--3隻小怪下
				mob12=CreateObjByFlag(104889,780794,24,1)	--3隻小怪下
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				AddToPartition(mob7,RoomID)
				AddToPartition(mob8,RoomID)
				AddToPartition(mob9,RoomID)
				AddToPartition(mob10,RoomID)
				AddToPartition(mob11,RoomID)
				AddToPartition(mob12,RoomID)
				WriteRoleValue(mob1,EM_RoleValue_PID,mob)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(mob7,EM_RoleValue_PID,mob)
				WriteRoleValue(mob8,EM_RoleValue_PID,mob)
				WriteRoleValue(mob9,EM_RoleValue_PID,mob)
				WriteRoleValue(mob10,EM_RoleValue_PID,mob)
				WriteRoleValue(mob11,EM_RoleValue_PID,mob)
				WriteRoleValue(mob12,EM_RoleValue_PID,mob)
				BeginPlot(mob1 , "ic_780796_mob_984" , 0)
				BeginPlot(mob2 , "ic_780796_mob_984" , 0)
				BeginPlot(mob3 , "ic_780796_mob_984" , 0)
				BeginPlot(mob4 , "ic_780796_mob_984" , 0)
				BeginPlot(mob5 , "ic_780796_mob_984" , 0)
				BeginPlot(mob6 , "ic_780796_mob_984" , 0)
				BeginPlot(mob7 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob8 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob9 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob10, "ic_780796_mob_984_1" , 0)
				BeginPlot(mob11, "ic_780796_mob_984_1" , 0)
				BeginPlot(mob12, "ic_780796_mob_984_1" , 0)
				AddBuff( mob1,508129,0 ,-1 )
				AddBuff( mob2,508129,0 ,-1 )
				AddBuff( mob3,508129,0 ,-1 )
				AddBuff( mob4,508128,0 ,-1 )
				AddBuff( mob5,508128,0 ,-1 )
				AddBuff( mob6,508128,0 ,-1 )
				AddBuff( mob7,508129,0 ,-1 )
				AddBuff( mob8,508129,0 ,-1 )
				AddBuff( mob9,508129,0 ,-1 )
				AddBuff( mob10,508128,0 ,-1 )
				AddBuff( mob11,508128,0 ,-1 )
				AddBuff( mob12,508128,0 ,-1 )
				time4=0
			end
			if time5>=300 and time5<=305 and mobtime2==4 and pe2xx==0 or time5<=300 and mobtime2==4 and mob24xx==48 and pe2xx==0 then
				time5=310
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,mobtime2+1)
				mob3=CreateObjByFlag(104890,780794,25,1)--1隻小王上
				mob4=CreateObjByFlag(104892,780794,25,1)--1隻小王下
				mob5=CreateObjByFlag(104890,780794,26,1)--1隻小王上
				mob6=CreateObjByFlag(104892,780794,26,1)--1隻小王下
				AddBuff( mob4,508120,0 ,-1 )
				AddBuff( mob6,508120,0 ,-1 )
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(npcboss,EM_RoleValue_register2,mob4)
				WriteRoleValue(npcboss,EM_RoleValue_register4,mob6)
				WriteRoleValue(mob3,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob4,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob5,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob6,EM_RoleValue_register4,npcboss)
				BeginPlot(mob3 , "ic_780796_mob_984" , 0)
				BeginPlot(mob4 , "ic_780796_mob_984_0" , 0)
				BeginPlot(mob5 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob6 , "ic_780796_mob_984_2" , 0)
			elseif time5>=670 and time5<=675 and mobtime2==9 and pe2xx==0 or time5<=670 and mobtime2==9 and mob24xx==100 and pe2xx==0 then
				time5=690
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,mobtime2+1)
				mob3=CreateObjByFlag(104891,780794,25,1)--1隻小王上
				mob4=CreateObjByFlag(104892,780794,25,1)--1隻小王下
				mob5=CreateObjByFlag(104891,780794,26,1)--1隻小王上
				mob6=CreateObjByFlag(104892,780794,26,1)--1隻小王下
				AddBuff( mob4,508120,0 ,-1 )
				AddBuff( mob6,508120,0 ,-1 )
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(npcboss,EM_RoleValue_register2,mob4)
				WriteRoleValue(npcboss,EM_RoleValue_register4,mob6)
				WriteRoleValue(mob3,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob4,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob5,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob6,EM_RoleValue_register4,npcboss)
				BeginPlot(mob3 , "ic_780796_mob_984" , 0)
				BeginPlot(mob4 , "ic_780796_mob_984_0" , 0)
				BeginPlot(mob5 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob6 , "ic_780796_mob_984_2" , 0)		
			end
			if time5>=300 and time5<=305 and mobtime2==4 and pe2xx==1 or time5<=300 and mobtime2==4 and mob24xx==48 and pe2xx==1  then
				time5=310
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,mobtime2+1)
				mob3=CreateObjByFlag(104890,780794,25,1)--1隻小王上
				mob4=CreateObjByFlag(104893,780794,25,1)--1隻小王下
				mob5=CreateObjByFlag(104890,780794,26,1)--1隻小王上
				mob6=CreateObjByFlag(104893,780794,26,1)--1隻小王下
				AddBuff( mob4,508120,0 ,-1 )
				AddBuff( mob6,508120,0 ,-1 )
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(npcboss,EM_RoleValue_register2,mob4)
				WriteRoleValue(npcboss,EM_RoleValue_register4,mob6)
				WriteRoleValue(mob3,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob4,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob5,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob6,EM_RoleValue_register4,npcboss)
				BeginPlot(mob3 , "ic_780796_mob_984" , 0)
				BeginPlot(mob4 , "ic_780796_mob_984_0" , 0)
				BeginPlot(mob5 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob6 , "ic_780796_mob_984_2" , 0)		
			elseif time5>=670 and time5<=675 and mobtime2==9 and pe2xx==1 or time5<=670 and mobtime2==9 and mob24xx==100 and pe2xx==1 then
				time5=690
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,mobtime2+1)
				mob3=CreateObjByFlag(104891,780794,25,1)--1隻小王上
				mob4=CreateObjByFlag(104893,780794,25,1)--1隻小王下
				mob5=CreateObjByFlag(104891,780794,26,1)--1隻小王上
				mob6=CreateObjByFlag(104893,780794,26,1)--1隻小王下
				AddBuff( mob4,508120,0 ,-1 )
				AddBuff( mob6,508120,0 ,-1 )
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				AddToPartition(mob5,RoomID)
				AddToPartition(mob6,RoomID)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob)
				WriteRoleValue(mob5,EM_RoleValue_PID,mob)
				WriteRoleValue(mob6,EM_RoleValue_PID,mob)
				WriteRoleValue(npcboss,EM_RoleValue_register2,mob4)
				WriteRoleValue(npcboss,EM_RoleValue_register4,mob6)
				WriteRoleValue(mob3,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob4,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob5,EM_RoleValue_register4,npcboss)
				WriteRoleValue(mob6,EM_RoleValue_register4,npcboss)
				BeginPlot(mob3 , "ic_780796_mob_984" , 0)
				BeginPlot(mob4 , "ic_780796_mob_984_0" , 0)
				BeginPlot(mob5 , "ic_780796_mob_984_1" , 0)
				BeginPlot(mob6 , "ic_780796_mob_984_2" , 0)	
			end
			if time6>=1020 and mobtime2>=14 or time6<=1025 and mobtime2==14 and mob24xx==152 then
				time6=1050
				local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2==104810  then
					DelObj(ID)
					end
				end
				WriteRoleValue(isaac,EM_RoleValue_register2,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,4)---把口袋5歸4
			end
		end
	end	
end 