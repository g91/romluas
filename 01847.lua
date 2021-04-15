function at_103821_01()   ------BOSS的主控器
	local Ctrl = OwnerID()					--宣告控制器叫做Ctrl
	local open=0						    --開戰旗標		
	local killidtime=0  					--狂爆時間
	local time1=0							--計時器 小怪用
	local Luck7=0	----隨機表用
	local mob								--小怪1
	local mob123                            --計數器 小怪用
	local door1								--阻擋門1
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)       ---宣告這個地圖~是我現在讀到的地圖
	local Boss=CreateObjByFlag(103821,781027,1,1) 	-----BOSS創在  旗標1
	local door=CreateObjByFlag(104199,781027,2,1)	-----阻擋門(王死才會消失)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)
	AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
	while true do
		sleep(10)	
		if hatelistcount(boss)~=0 then    		---讀仇恨人數
			time1=time1+1
			killidtime=killidtime+1
			mob123=ReadRoleValue(Ctrl,EM_RoleValue_register1)
			if killidtime>=480 then
				WriteRoleValue(boss,EM_RoleValue_register2,1)---回傳1給BOSS
			end
			if open==0 then
				open=1
			door1=CreateObjByFlag(104198,781027,3,1)-------入口阻擋門 
				SetModeEx( door1 , EM_SetModeType_Mark, false)			---可點選(否)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(否)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--阻擋(是)
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--索敵(否)
				AddToPartition(door1,RoomID)				
				BeginPlot(boss , "at_103821_02" , 0)				------命令角色做事情
				say(OwnerID(),"1")
			end
			if time1>=20 and mob123<20  then			---10秒生1次  最多5隻
				mob123=ReadRoleValue(Ctrl,EM_RoleValue_register1)    -----讀小怪數量
				WriteRoleValue(Ctrl,EM_RoleValue_register1,mob123+1)      -----讀小怪數量   把數量記進口袋裡
				mob=CreateObjByFlag(104110,781027,4,1) 			----生小怪 
				AddToPartition(mob,RoomID)
				AddBuff(Boss,507663,0 ,-1 )
					Luck7=DW_Rand(3)---隨機取得數字用
					if Luck7 == 1 then
					AddBuff(mob,507663,0 ,-1 )
					elseif Luck7 == 2 then 
					AddBuff(mob,507663,0 ,-1 )
					elseif Luck7 == 3 then 
					AddBuff(mob,507663,0 ,-1 )
					end
				BeginPlot(mob , "at_103821_03" , 0)				------命令角色做事情
				SetPlot( mob,"dead","ic_106292_mobXX",0 )			----小怪死亡劇情
				WriteRoleValue(mob,EM_RoleValue_PID,Ctrl)
			time1=0 		--重置計時
			end
		end
		if hatelistcount(boss)==0 and open==1 then			--開戰後仇恨表沒人
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --王沒死 玩家滅團
			local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----自身範圍300  掃區域找NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---找固定ID NPC
							DelObj( NPCXX[i] )
						end
					end
				end		
				say(OwnerID(),"2")
				DelObj(boss)                                        --沒死自己殺死王
				DelObj(door1)										--刪除阻擋門
				sleep(50)                                           --5秒
				Boss=CreateObjByFlag(103821,781027,1,1)           --再創造1之				
				AddToPartition(Boss,RoomID)	                                ---創造王 必要		
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				WriteRoleValue(Ctrl,EM_RoleValue_register1,0)   ---小怪記數歸零
				time1=0 		                               --重置計時
				open=0										--重置戰鬥
				killidtime=0
			elseif	ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---王死了
				local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----自身範圍300  掃區域找NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---找固定ID NPC
							DelObj( NPCXX[i] )
						end
					end
				end
				DelObj(door)										--刪除阻擋門
				DelObj(door1)										--刪除阻擋門
				open=0										--重置戰鬥
				killidtime=0
				say(OwnerID(),"3")
			end				
		end	
		if ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then 
			local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----自身範圍300  掃區域找NPC
			for i = 0 , table.getn(NPCXX)	do
				if NPCXX[i] ~= OwnerID() then
					if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---找固定ID NPC
						DelObj( NPCXX[i] )
					end
				end
			end
			DelObj(door)										--刪除阻擋門
			DelObj(door1)										--刪除阻擋門
			open=0										--重置戰鬥
			killidtime=0
			say(OwnerID(),"4")
			break	
		end
	end
end



function at_103821_02()   ----bossAI
	local time2=0 	----計時器  技能用
	local time3=0	---- 計時器  技能用
	local time4=0	------計時器  技能用
	local Luck=0	----隨機表用
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)    ---宣告這個地圖~是我現在讀到的地圖
	local killidtime1 =0    ----狂暴計時器
	local play1x={} 
	local plays=0
	local mbe1
	local mbe2
	local mbe3
	local mbe4
	while 1 do 
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標  
		local BossTarget=AttackTarget
		killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		time2=time2+1
		time3=time3+1
		if killidtime1>=1 then
			AddBuff( OwnerID(),507277,0 ,-1 ) 
			sleep(600)
			end
		if time2>=9 then
			Luck=DW_Rand(2)---隨機取得數字用
			if Luck == 1 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
				sleep(10)
			end
			play1x=DW_HateRemain(0)	---1排坦
			plays=DW_Rand(table.getn(play1x))
			CastSpellLV( OwnerID() ,play1x[plays] , 496022 , 19 )   ---隨機找1人放技能
			elseif Luck == 2 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
				sleep(10)
			end
			local bosskkpaly = {}
			play1x=DW_HateRemain(1)	---1排坦
			plays=DW_Rand(table.getn(play1x))
			CastSpellLV( OwnerID() ,play1x[plays] , 497733 , 1 )
			bosskkpaly = ic_HateListSort(OwnerID())
			local Tank = bosskkpaly[1]
			SYSCastSpellLV( OwnerID(), Tank, 497733, 1 )  ---指定打坦
			end
			time2=0
		end
		if time3>=21 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
				sleep(10)
			end
		if hatelistcount(boss)==1 then   -----讀boss仇恨表有幾人
			local bosskkpaly = {}
			bosskkpaly = ic_HateListSort(OwnerID())
			mbe1 = bosskkpaly[1]       -------仇恨表第1名為mbe1
			SYSCastSpellLV( OwnerID(), mbe1, 497733, 1 )     -------對mbe1施放法術
			elseif hatelistcount(boss)==2 then
			local bosskkpaly = {}
			bosskkpaly = ic_HateListSort(OwnerID())
			mbe1 = bosskkpaly[1]           
			mbe2 = bosskkpaly[2]             -------仇恨表第2名為mbe2
			SYSCastSpellLV( OwnerID(), mbe1, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe2, 497733, 1 )
			elseif hatelistcount(boss)==3 then
			local bosskkpaly = {}
			bosskkpaly = ic_HateListSort(OwnerID())
			mbe1 = bosskkpaly[1]
			mbe2 = bosskkpaly[2]
			mbe3 = bosskkpaly[3]             -------仇恨表第3名為mbe3
			SYSCastSpellLV( OwnerID(), mbe1, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe2, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe3, 497733, 1 )
			elseif hatelistcount(boss)>=4 then
			local bosskkpaly = {}
			bosskkpaly = ic_HateListSort(OwnerID())
			mbe2 = bosskkpaly[2]
			mbe3 = bosskkpaly[3]
			mbe4 = bosskkpaly[4]           -------仇恨表第4名為mbe4
			SYSCastSpellLV( OwnerID(), mbe2, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe3, 497733, 1 )
			SYSCastSpellLV( OwnerID(), mbe4, 497733, 1 )
			end
			time3=0
		end
	end	
end		
		


		
function at_103821_03()    ----小怪ai
	local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local AttackTarget = ReadRoleValue( boss, EM_RoleValue_AttackTargetID )   ------ 找尋BOSS的攻擊目標  
	local BossTarget=0
	local time6=0
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )							---讀取血量
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )     						 	---讀取目前血量
	local HPPercent = NowHP / MaxHP
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)    ---宣告這個地圖~是我現在讀到的地圖
	SetAttack( ownerid() , AttackTarget)
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標  
		if  HPPercent >0.10 then	
			sleep(10)
			CastSpellLV( OwnerID() , AttackTarget , 495948, 100 )  ----減跑速技能
		end
		if  HPPercent <0.10 then    ------血量低於40% 用這技能
			time6=time6+1
			if time6<10 then 
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				CastSpellLV( OwnerID() , AttackTarget, 495948, 100 )  ----施法10秒的技能
			end
			if time6>=10 then 
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				local NPCXX = SearchRangeNPC ( OwnerID() , 300 )----自身範圍300  掃區域找NPC
				for i = 0 , table.getn(NPCXX)	do
					if NPCXX[i] ~= OwnerID() then
						if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---找固定ID NPC
							DelObj( NPCXX[i] )
						end
					end
				end
				ic_mob_Rand_noadd( OwnerID() , 103821 ,0,0)
			end
		end
	end
end



function ic_106292_mobXX()			  	---死亡用  記數用
	local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local mob123	
		mob123=ReadRoleValue(Ctrl,EM_RoleValue_register1)
		WriteRoleValue(Ctrl,EM_RoleValue_register1,mob123-1)
	local NPCXX = SearchRangeNPC ( OwnerID() , 300 )      ----自身範圍300  掃區域找NPC
			for i = 0 , table.getn(NPCXX)	do
				if NPCXX[i] ~= OwnerID() then
					if	ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	104110	then  ---找固定ID NPC
					sleep(10)
					elseif ReadRoleValue(NPCXX[i],EM_RoleValue_OrgID) == 	103821	then
					CancelBuff(boss, 507663)
					end
				end
	end
end

				