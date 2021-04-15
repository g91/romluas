function ic_104694_01()   ------主控器
	local Ctrl = OwnerID()					--控制器
	local open=0						    --開戰旗標
	local open1=0						    --開戰旗標
	local BOSS1open=0						    --開戰旗標
	local BOSS2open1=0						    --開戰旗標
	local time5=0								--計時器
	local time44=0
	local opendoor0=0								--開門用
	local opendoor=0								--開門用
	local time1=0
	local time2=0
	local time3=0
	local time10=0
	local time20=0
	local killidtime=0
	local killidtime1=0	
	local mob1
	local mob2
	local door1								--阻擋門1
	local door2								--阻擋門2
	local door3								--阻擋門1
	local door4								--阻擋門2
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Boss1=CreateObjByFlag(104763,780772,1,1) 	-----BOSS創在  旗標1--門羅‧沃克
	local Boss2=CreateObjByFlag(104764,780772,2,1) 	-----BOSS創在  旗標2--剛提寇
	local door=CreateObjByFlag(104198,780772,3,1)	-----阻擋門(王死才會消失)
	local door0=CreateObjByFlag(104198,780772,4,1)	-----阻擋門(王死才會消失)
	local boss1up=0
	local boss2up=0
	local XBoss1--=ReadRoleValue(Boss1 ,EM_RoleValue_X)
	local YBoss1--=ReadRoleValue(Boss1 ,EM_RoleValue_Y)
	local ZBoss1--=ReadRoleValue(Boss1 ,EM_RoleValue_Z)
	local XBoss2--=ReadRoleValue(Boss2 ,EM_RoleValue_X)
	local YBoss2--=ReadRoleValue(Boss2 ,EM_RoleValue_Y)
	local ZBoss2--=ReadRoleValue(Boss2 ,EM_RoleValue_Z)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)
				SetModeEx( door0 , EM_SetModeType_Mark, false)
				SetModeEx( door0 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door0 , EM_SetModeType_Obstruct, true) 
				SetModeEx( door0 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door0 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door0 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door0 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door0 , EM_SetModeType_Searchenemy, false)
				AddToPartition(door0,RoomID)					
				AddToPartition(Boss1,RoomID)
				SetPlot( Boss1,"dead","ic_104694_0344",0 )
				SetPlot( boss2,"dead","ic_104694_0444",0 )
	WriteRoleValue(Boss1,EM_RoleValue_register1,Ctrl)   --暫存口袋1 BOSS1=ctrl
	WriteRoleValue(Ctrl,EM_RoleValue_register1,Boss1)
	AddToPartition(Boss2,RoomID)
	WriteRoleValue(Boss2,EM_RoleValue_register2,Ctrl)   --暫存口袋2 BOSS2=ctrl
	WriteRoleValue(Ctrl,EM_RoleValue_register2,Boss2)
	WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --暫存口袋5 BOSS1=BOSS2
	WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)
	while true do
		sleep(10)
		--say(OwnerID(),"opendoor0="..opendoor0)
		--say(OwnerID(),"opendoor="..opendoor)
		--say(OwnerID(),"time3="..time44)
		boss1up=ReadRoleValue(OwnerID(),EM_RoleValue_register6)--1王
		boss2up=ReadRoleValue(OwnerID(),EM_RoleValue_register7)--2王
		BOSS1open= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		BOSS2open1= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		opendoor0= ReadRoleValue(OwnerID(),EM_RoleValue_register3)---1王
		opendoor= ReadRoleValue(OwnerID(),EM_RoleValue_register4)----2王
		if opendoor0==1 or opendoor==1 and time3<=19 then
			time3=time3+1
		end
		if opendoor0==1 and time3>=10 and time3<=12 then
		WriteRoleValue(OwnerID(),EM_RoleValue_register6,1)
		time3=0
		elseif opendoor==1 and time3>=10 and time3<=12 then
		WriteRoleValue(OwnerID(),EM_RoleValue_register7,1)
		time3=0
		end
		if opendoor0==1 and opendoor==1 then---2王都死了 刪除門用
			time3=20
			DelObj(door1)										--刪除阻擋門
			DelObj(door2)										--刪除阻擋門
			DelObj(door3)
			DelObj(door4)
			BeginPlot(OwnerID(), "ic_ha_de_191_03" , 0)----防駭客
			bobo=CreateObjByFlag(105111,780772,1,1)-------寶箱  
				SetModeEx( bobo , EM_SetModeType_Mark, true)			---可點選(否)
				SetModeEx( bobo , EM_SetModeType_ShowRoleHead, true) 		---頭像框(否)
				SetModeEx( bobo , EM_SetModeType_Obstruct, true) 			--阻擋(是)
				SetModeEx( bobo , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( bobo , EM_SetModeType_Move, false) ---移動	
				SetModeEx( bobo , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( bobo , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
				SetModeEx( bobo , EM_SetModeType_Searchenemy, false)			--索敵(否)	
				SetModeEx( bobo , EM_SetModeType_NotShowHPMP, true) --
				AddToPartition(bobo,RoomID)
			bobo2=CreateObjByFlag(105112,780772,2,1)-------寶箱
				SetModeEx( bobo2 , EM_SetModeType_Mark, true)			---可點選(否)
				SetModeEx( bobo2 , EM_SetModeType_ShowRoleHead, true) 		---頭像框(否)
				SetModeEx( bobo2 , EM_SetModeType_Obstruct, true) 			--阻擋(是)
				SetModeEx( bobo2 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( bobo2 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( bobo2 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( bobo2 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
				SetModeEx( bobo2 , EM_SetModeType_Searchenemy, false)			--索敵(否)	
				SetModeEx( bobo2 , EM_SetModeType_NotShowHPMP, true) ---反擊
			AddToPartition(bobo2,RoomID)	
			DelObj(door)
			DelObj(door0)
			BeginPlot(OwnerID(), "ic_104694_99" , 0)
			sleep(50)
			WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
			break			
		end
		if BOSS1open==1 or BOSS2open1==1  then---1王開戰 或 2王開戰
			time5=time5+1
		end
		if BOSS1open==1 or BOSS2open1==1  then---1王開戰 或 2王開戰
			time44=time44+1
		end
		if time44>=30 then
		WriteRoleValue(boss2,EM_RoleValue_register3,1)
		WriteRoleValue(boss1,EM_RoleValue_register3,1)
		time44=0
		end
		if BOSS1open==1 and BOSS2open1==0 and time5>=10  then
			XBoss1=ReadRoleValue(Boss1 ,EM_RoleValue_X)
			YBoss1=ReadRoleValue(Boss1 ,EM_RoleValue_Y)
			ZBoss1=ReadRoleValue(Boss1 ,EM_RoleValue_Z)
			SetPos( Boss2, XBoss1, YBoss1, ZBoss1 , 0 )
			AddToPartition(Boss2,RoomID)
			sleep(10)
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(5)
			end
			CastSpellLV( Boss2 , Boss2 , 496358 , 20)
			BOSS2open1=2
			time5=0
		end	
		if BOSS1open==0 and BOSS2open1==1 and time5>=10 then---1王沒有開戰 2王開戰
			XBoss2=ReadRoleValue(Boss2 ,EM_RoleValue_X)
			YBoss2=ReadRoleValue(Boss2 ,EM_RoleValue_Y)
			ZBoss2=ReadRoleValue(Boss2 ,EM_RoleValue_Z)
			SetPos( Boss1, XBoss2, YBoss2, ZBoss2 , 0 )	
			AddToPartition(Boss1,RoomID)
			sleep(10)
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					--say(OwnerID(),"time8NO")
					sleep(5)
			end
			CastSpellLV( Boss1 , Boss1 , 496355 , 20)
			BOSS1open=2
			time5=0
		end
		
		if hatelistcount(boss1)~=0 then    		---讀仇恨人數
			killidtime=killidtime+1
			if killidtime>=360 and time1==0 then
				WriteRoleValue(boss1,EM_RoleValue_register7,1)---回傳1給BOSS
			end
			if open==0 then
				open=1					--開打了
				time10=0 
			 door2=CreateObjByFlag(104198,780772,7,1)-------入口阻擋門
				SetModeEx( door2 , EM_SetModeType_Mark, false)			----可點選(否)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
				SetModeEx( door2 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( door2 , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---可砍殺(否)
				SetModeEx( door2 , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)	---索敵(否)
				AddToPartition(door2,RoomID)	
			door1=CreateObjByFlag(104198,780772,8,1)-------王身後阻擋門
				SetModeEx( door1 , EM_SetModeType_Mark, false)			---可點選(否)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(否)
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 			--阻擋(是)
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)			--索敵(否)	
				AddToPartition(door1,RoomID)
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_104694_01]" , 2 )	-------開打對話--這個區域我來守護
				BeginPlot(boss1 , "ic_104694_03" , 0)				------命令角色做事情
			end
		end
		if boss1up==1 then---1王復活用
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_104694_06]" , 2 )---感謝娜塔沙的力量
				Boss1=CreateObjByFlag(104763,780772,1,1)           --再創造1之				
				AddToPartition(Boss1,RoomID)					---創造王 必要		
				SetPlot( Boss1,"dead","ic_104694_0344",0 )
				WriteRoleValue(Ctrl,EM_RoleValue_register1,Boss1)
				WriteRoleValue(Boss1,EM_RoleValue_register1,Ctrl)
				WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --暫存口袋5 BOSS1=BOSS2
				WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)
				BeginPlot(OwnerID(), "ic_104694_05" , 0)
				open=0					--重置戰鬥
				WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)
				BOSS1open=0
				Check_pet = 0
				time5=0
				time44=0
				killidtime=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)
		end		
		if hatelistcount(boss1)==0 and open==1 then			--開戰後仇恨表沒人
			if ReadRoleValue( boss1 , EM_RoleValue_IsDead)==0 then   --王沒死 玩家滅團
				sleep(10)
				DelObj(boss1)                                        --沒死自己殺死王
				DelObj(door1)										--刪除阻擋門
				DelObj(door2)										--刪除阻擋門
				sleep(10)                                           --1秒
				Boss1=CreateObjByFlag(104763,780772,1,1)           --再創造1之				
				AddToPartition(Boss1,RoomID)	                                ---創造王 必要				
				WriteRoleValue(Ctrl,EM_RoleValue_register1,Boss1)
				WriteRoleValue(Boss1,EM_RoleValue_register1,Ctrl)
				WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --暫存口袋5 BOSS1=BOSS2
				WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)
				BeginPlot(OwnerID(), "ic_104694_05" , 0)
				open=0					--重置戰鬥
				BOSS1open=0
				Check_pet = 0
				time5=0
				time44=0
				killidtime=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)
			elseif	ReadRoleValue( boss1 , EM_RoleValue_IsDead)==1 and time10==0 then---王死了
				BeginPlot(OwnerID(), "ic_104694_05" , 0)
				DelObj(door1)
				DelObj(door2)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,1)---回傳1給BOSS	
				open=0				--重置戰鬥
				BOSS1open=0
				killidtime=0
				time5=0
				time44=0
				time10=1
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)
			end				
		end	
		if ReadRoleValue( boss1 , EM_RoleValue_IsDead)==1 and time10==0  then---無敵殺了王
				open=0
				BOSS1open=0	
				killidtime=0
				time5=0
				time44=0
				time10=1
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,1)---回傳1給BOSS
				WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)	
		end		
		if hatelistcount(boss2)~=0 then    		---讀仇恨人數
			killidtime1=killidtime1+1
			if killidtime1>=360 and time2==0 then
				WriteRoleValue(boss2,EM_RoleValue_register7,1)---回傳1給BOSS
			end
			if open1==0 then
				open1=1					--開打了
				time20=0 
			 door4=CreateObjByFlag(104198,780772,9,1)-------入口阻擋門
				SetModeEx( door4 , EM_SetModeType_Mark, false)			----可點選(否)
				SetModeEx( door4 , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
				SetModeEx( door4 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				SetModeEx( door4 , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( door4 , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( door4 , EM_SetModeType_Fight, false) ---可砍殺(否)
				SetModeEx( door4 , EM_SetModeType_SearchenemyIgnore, false) ---是否被搜尋(否)
				SetModeEx( door4 , EM_SetModeType_Searchenemy, false)	---索敵(否)
				AddToPartition(door4,RoomID)	
			door3=CreateObjByFlag(104198,780772,10,1)-------王身後阻擋門
				SetModeEx( door3 , EM_SetModeType_Mark, false)			---可點選(否)
				SetModeEx( door3, EM_SetModeType_ShowRoleHead, false) 		---頭像框(否)
				SetModeEx( door3 , EM_SetModeType_Obstruct, true) 			--阻擋(是)
				SetModeEx( door3 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( door3 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( door3 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( door3 , EM_SetModeType_SearchenemyIgnore, false) 	---是否被搜尋(否)
				SetModeEx( door3 , EM_SetModeType_Searchenemy, false)			--索敵(否)	
				AddToPartition(door3,RoomID)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104694_02]" , 2 )	-------開打對話--這個區域我來防衛
				BeginPlot(boss2 , "ic_104694_04" , 0)				------命令角色做事情
			end
		end	
		if boss2up==1 then---2王復活用
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104694_07]" , 2 )	-------開打對話--感謝可琳的力量
				Boss2=CreateObjByFlag(104764,780772,2,1)           --再創造1之				
				AddToPartition(Boss2,RoomID)	    				---創造王 必要	
				SetPlot( boss2,"dead","ic_104694_0444",0 )		
				WriteRoleValue(Ctrl,EM_RoleValue_register2,Boss2)
				WriteRoleValue(Boss2,EM_RoleValue_register2,Ctrl)
				WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --暫存口袋5 BOSS1=BOSS2
				WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)	
				BeginPlot(OwnerID(), "ic_104694_06" , 0)
				open1=0					--重置戰鬥
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)
				BOSS2open1=0
				Check_pet = 0
				killidtime1=0
				time5=0
				time44=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
		end
		if hatelistcount(boss2)==0 and open1==1 then			--開戰後仇恨表沒人
			if ReadRoleValue( boss2 , EM_RoleValue_IsDead)==0 then   --王沒死 玩家滅團
				sleep(10)
				DelObj(boss2)                                        --沒死自己殺死王
				DelObj(door3)										--刪除阻擋門
				DelObj(door4)										--刪除阻擋門
				sleep(10)                                           --1秒
				Boss2=CreateObjByFlag(104764,780772,2,1)           --再創造1之				
				AddToPartition(Boss2,RoomID)	                                ---創造王 必要				
				WriteRoleValue(Ctrl,EM_RoleValue_register2,Boss2)
				WriteRoleValue(Boss2,EM_RoleValue_register2,Ctrl)
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
				WriteRoleValue(Boss1,EM_RoleValue_register5,Boss2)   --暫存口袋5 BOSS1=BOSS2
				WriteRoleValue(Boss2,EM_RoleValue_register5,Boss1)	
				BeginPlot(OwnerID(), "ic_104694_06" , 0)
				open1=0					--重置戰鬥
				BOSS2open1=0
				Check_pet = 0
				killidtime1=0
				time5=0
				time44=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
			elseif	ReadRoleValue( boss2 , EM_RoleValue_IsDead)==1 and time20==0  then---王死了
				BeginPlot(OwnerID(), "ic_104694_06" , 0)
				DelObj(door3)
				DelObj(door4)			
				open1=0										--重置戰鬥
				BOSS2open1=0
				killidtime1=0
				time5=0
				time44=0
				time20=1
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
			end				
		end	
		if ReadRoleValue( boss2 , EM_RoleValue_IsDead)==1 and time20==0 then---無敵殺了王
				open1=0
				BOSS2open1=0	
				killidtime1=0
				time5=0
				time44=0
				time20=1
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register4,1)
				
		end	
	end			
end  
function ic_104694_0344()    ------王AI--門羅‧沃克
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
ScriptMessage( Ctrl, -1 , 1 , "[SC_104694_08]" , 2 )----怎麼可能會被打敗---死亡
WriteRoleValue(Ctrl,EM_RoleValue_register3,1)
end
function ic_104694_0444()    ------王AI--剛提寇
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
ScriptMessage( Ctrl, -1 , 2 , "[SC_104694_09]" , 2 )----怎麼可能會輸---死亡
WriteRoleValue(Ctrl,EM_RoleValue_register4,1)
end
function ic_104694_03()    ------王AI--門羅‧沃克
	local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local boss2=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	local Boss1=OwnerID()
	local time1=0 	----計時器
	local Luck=0	----隨機表用---技能用
	local time3=0 	----計時器
	local time8=0 	----計時器
	local time6=0 	----計時器
	local play1x={} ---隨機打用
	local plays=0   ---隨機打用
	local time11=0
	local time111=0
	local time1111=0
	local time11111=0
	WriteRoleValue(OwnerID(),EM_RoleValue_register9,time111)
	local play1x={} 
	local plays=0
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local killidtime1 =0---狂暴用
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --讀取目前血量
	local HPPercent = NowHP / MaxHP	
	while 1 do
		Sleep(10)
		--say(OwnerID(),"time1111="..time1111)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
		NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------讀取目前血量
		HPPercent = NowHP / MaxHP	--血量百分比
		time111=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		time8=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		if time3==0 then
			WriteRoleValue(Ctrl,EM_RoleValue_register8,1)---回傳1給控制器
			time3=1
		end
		killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		if killidtime1>=1 then
			AddBuff( OwnerID(),508659,0 ,-1 )
			killidtime1=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---把口袋8歸0
		end
		time1=time1+1
		time11111=time11111+1
			if  time11111 ==5 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_104694_04]" , 2 )---水波衝擊來臨
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,time111+1)
				CastSpellLV( OwnerID() , OwnerID() , 496355 , 5)
				sleep(90)
			end
			if time111==0 and time8==1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				ScriptMessage( OwnerID(), -1 , 1 , "[SC_104694_04]" , 2 )---水波衝擊來臨
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,time111+1)
				time111=1
				CastSpellLV( OwnerID() , OwnerID() , 496355 , 5)
				sleep(90)
			elseif	time111==1 and time8==1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(5)
				end
				time111=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
			end
		if 	HPPercent>=0.5 then
			if time1>=8 then ---單體技能
					Luck=DW_Rand(2)---隨機取得數字用
				if luck==1 then
					CastSpellLV( OwnerID() , BossTarget , 496353 , 150)
					sleep(10)
					time1=0
				elseif luck==2 then
					CastSpellLV( OwnerID() , OwnerID() , 496354 , 120 )
					sleep(30)
					time1=0
				end
			end
		elseif 	HPPercent<=0.49 then
		time1111=time1111+1	
			if	time1111>=20 then 
				if hatelistcount(Boss1)==1 then	
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
					end
					CastSpellLV( OwnerID() , BossTarget , 496704 , 0 )
					time1111=0	
					sleep(30)
				elseif hatelistcount(Boss1)>=1 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
					end
					play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV( OwnerID() , play1x[plays] , 496704 , 0 )
					time1111=0	
					sleep(30)
				end				
			end
			if time1>=8 then ---單體技能
					Luck=DW_Rand(2)---隨機取得數字用
				if luck==1 then
					CastSpellLV( OwnerID() , BossTarget , 496353 , 150)
					time1=0
				elseif luck==2 then
					CastSpellLV( OwnerID() , OwnerID() , 496354 , 120)
					time1=0
				end
			end
		end	
	end
end
function ic_104694_04()    ------王AI--剛提寇
	local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	local boss1=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	local Boss2=OwnerID()
	local time2=0 	----計時器
	local time7=0 	----計時器
	local play1x={} ---隨機打用
	local plays=0   ---隨機打用
	local time9=0	
	local time4=0
	local time22=0
	local time222=0
	local time2222=0
	local time22222=0
	WriteRoleValue(OwnerID(),EM_RoleValue_register9,time222)
	local Luck=0	----隨機表用---技能用
	local play1x={} 
	local plays=0
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local killidtime1 =0---狂暴用
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
	local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --讀取目前血量
	local HPPercent = NowHP / MaxHP	
	while 1 do
		Sleep(10)
		--say(OwnerID(),"time2222="..time2222)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
		NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------讀取目前血量
		HPPercent = NowHP / MaxHP	--血量百分比
		time9=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		time222=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if time4==0 then
			WriteRoleValue(Ctrl,EM_RoleValue_register9,1)---回傳1給控制器
			time4=1
		end
		killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		if killidtime1>=1 then
			AddBuff( OwnerID(),508659,0 ,-1 )
			AddBuff( boss1,508659,0 ,-1 )
			killidtime1=0
			WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---把口袋8歸0
		end
		--say(OwnerID(),"time9="..time9)
		--say(OwnerID(),"time222="..time222)
		time2=time2+1
		time22222=time22222+1
		if time22222==5 then
			while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
			end
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104694_05]" , 2 )---怒火燃燒降臨
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,time222+1)
				CastSpellLV( OwnerID() , OwnerID() , 496358 , 5)
				sleep(90)
		end
		if time222==0 and time9==1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104694_05]" , 2 )---怒火燃燒降臨
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,time222+1)
				time222=1
				CastSpellLV( OwnerID() , OwnerID() , 496358 , 5)
				sleep(90)
		elseif time222==1 and time9==1 then
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(5)
				end
				time222=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
		end
		if 	HPPercent>=0.5 then
			if time2>=8 then ---單體技能
				Luck=DW_Rand(2)---隨機取得數字用
				if luck==1 then
					CastSpellLV( OwnerID() , BossTarget , 496356 , 150)
					sleep(10)
					time2=0
				elseif luck==2 then
					CastSpellLV( OwnerID() , OwnerID() , 496357 , 120)
					sleep(30)
					time2=0
				end
			end
		elseif 	HPPercent<=0.49 then
			time2222=time2222+1
			if time2222>=20 then
				if hatelistcount(Boss2)==1 then	
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
					end
					CastSpellLV( OwnerID() ,BossTarget , 496705 , 0 )
					time2222=0
					sleep(30)
				elseif hatelistcount(Boss2)>=1 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
					end
					play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV( OwnerID() , play1x[plays] , 496705 , 0 )
					time2222=0
					sleep(30)
				end
			end
			if time2>=8 then ---單體技能
				Luck=DW_Rand(2)---隨機取得數字用
				if luck==1 then
					CastSpellLV( OwnerID() , BossTarget , 496356 , 150)
					sleep(10)
					time2=0
				elseif luck==2 then
					CastSpellLV( OwnerID() , OwnerID() , 496357 , 120)
					sleep(30)
					time2=0
				end
			end
		end	
	end
end
function ic_104694_06()----刪除BUFF用--3王
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 507969 ) == true then
					CancelBuff(ThesePlayer[i], 507969)
				end	
		end					
	end
end
function ic_104694_05()----刪除BUFF用---2王
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 507970 ) == true then
					CancelBuff(ThesePlayer[i], 507970)
				end	
		end					
	end
end
function ic_104694_99()----刪除BUFF用---2王
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
						CancelBuff(ThesePlayer[i], 507970)
						CancelBuff(ThesePlayer[i], 507969)	
		end					
	end
end