function ic_780937_2()	
local isaac=OwnerID()																	
local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
local boss1
local boss2
local mob1																				---暈BOSS用小球
local mob2																				---暈BOSS用小球
local mob3																				---暈BOSS用小球
local mob4
local mob5
local mob9898=0
local Luck=0
local time0=0
local boss1xx=0
local boss3
local boss4
local boss5
local boss6
local boss7
local boss8
local boss3xx
local boss4xx
local boss5xx
local boss6xx
local time1=0
local time2=0
local time3=0
local time4=0
	boss1=CreateObjByFlag(105749,780886,6,1)												---中間
		SetModeEx( boss1 , EM_SetModeType_DisableRotate, false)
		SetModeEx( boss1 , EM_SetModeType_Searchenemy, false)
		SetModeEx( boss1 , EM_SetModeType_Obstruct, true) 									---阻擋(是)
		SetModeEx( boss1 , EM_SetModeType_Strikback, false) 								---反擊
		SetModeEx( boss1 , EM_SetModeType_Move, false) 										---移動	
		SetModeEx( boss1  , EM_SetModeType_Searchenemy, false )								--索敵
		SetModeEx( boss1 , EM_SetModeType_Fight, false) 									---可砍殺
		SetModeEx( boss1 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否) 
		AddToPartition(boss1,RoomID)
		WriteRoleValue(boss1,EM_RoleValue_PID,isaac)
		SetPlot( boss1,"dead","ic_780937_BOSS1XX",0 )								---掛死亡劇情	
		SetIdleMotion( boss1 ,ruFUSION_ACTORSTATE_ACTIVATE_END)
		BeginPlot(boss1 , "ic_780937_BOSS1" , 0)	
	AddBuff(boss1,509845,0 ,-1 ) 	
	boss2=CreateObjByFlag(105730,780886,7,1)											---後門
		SetModeEx( boss2 , EM_SetModeType_ShowRoleHead, false) 								---頭相框(否)
		SetModeEx( boss2 , EM_SetModeType_Mark, false)										---可點選(否)
		SetModeEx( boss2 , EM_SetModeType_Obstruct, true) 									---阻擋(是)
		SetModeEx( boss2 , EM_SetModeType_Strikback, false) 								---反擊
		SetModeEx( boss2 , EM_SetModeType_Move, false) 										---移動	
		SetModeEx( boss2  , EM_SetModeType_Searchenemy, false )								--索敵
		SetModeEx( boss2 , EM_SetModeType_Fight, false) 									---可砍殺
		SetModeEx( boss2 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
		SetModeEx( boss2  , EM_SetModeType_HideName	, true )	
		SetIdleMotion( boss2 ,ruFUSION_ACTORSTATE_ACTIVATE_END)	
		AddToPartition(boss2,RoomID)		
	mob1=CreateObjByFlag(105651 ,780886,1,1)												---? zone 38 0 -287 0 609		
			SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob1  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob1  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob1  , EM_SetModeType_Show, false )
			SetModeEx( mob1  , EM_SetModeType_HideName	, true )
			AddToPartition( mob1 , RoomID )
			WriteRoleValue(mob1,EM_RoleValue_PID,isaac)										---mob1暫存口袋PID 
	mob2=CreateObjByFlag(105651 ,780886,2,1)												---? zone 38 0 -214 0 591
			SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob2  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob2  , EM_SetModeType_Fight , false )								--可砍殺攻擊	
			SetModeEx( mob2  , EM_SetModeType_Show, false )
			SetModeEx( mob2  , EM_SetModeType_HideName	, true )
			AddToPartition( mob2 , RoomID )
			WriteRoleValue(mob2,EM_RoleValue_PID,isaac)										---mob2暫存口袋PID 
	mob3=CreateObjByFlag(105651 ,780886,3,1)												---? zone 38 0 -135 0 592
			SetModeEx( mob3  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob3  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob3  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob3  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob3  , EM_SetModeType_Show, false )
			SetModeEx( mob3  , EM_SetModeType_HideName	, true )		
			AddToPartition( mob3 , RoomID )
			WriteRoleValue(mob3,EM_RoleValue_PID,isaac)										---mob3暫存口袋PID
	mob4=CreateObjByFlag(105732 ,780886,4,1)												---前門
			SetModeEx( mob4  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob4  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob4  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob4 , EM_SetModeType_Obstruct, true) 								---阻擋(是)
			SetModeEx( mob4  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob4  , EM_SetModeType_HideName	, true )	
			SetModeEx( mob4 , EM_SetModeType_Mark, false)									---可點選(否)
			AddToPartition( mob4 , RoomID )
			WriteRoleValue(mob4,EM_RoleValue_PID,isaac)										---mob3暫存口袋PID 	
	mob5=CreateObjByFlag(105746 ,780886,5,1)	
			AddToPartition( mob5 , RoomID )
			WriteRoleValue(mob5,EM_RoleValue_PID,isaac)										---mob3暫存口袋PID 	
			SetPlot( mob5,"dead","ic_780937_mob4",0 )								---掛死亡劇情	
			BeginPlot(mob5 , "ic_780937_boss1234_2" , 0)	
	while true do
		mob9898=ReadRoleValue(isaac , EM_RoleValue_register1)
		boss1xx=ReadRoleValue(isaac , EM_RoleValue_register10)
		boss3xx=ReadRoleValue(isaac , EM_RoleValue_register3)
		boss4xx=ReadRoleValue(isaac , EM_RoleValue_register4)
		boss5xx=ReadRoleValue(isaac , EM_RoleValue_register5)
		boss6xx=ReadRoleValue(isaac , EM_RoleValue_register6)
	if boss3xx==1 and time2==0 or boss4xx==1 and time2==0 or boss5xx==1 and time2==0 or boss6xx==1 and time2==0 then
		time3=time3+1
	end	
	if boss3xx==1 and time3>=10 or boss4xx==1 and time3>=10 or boss5xx==1 and time3>=10 or boss6xx==1 and time3>=10 then
		time2=1
		if boss3xx==1 then
			boss3=CreateObjByFlag(105748,780886,93,1)
			SetModeEx( boss3 , EM_SetModeType_Move, false) 										
			AddToPartition(boss3,RoomID)
			WriteRoleValue(boss3,EM_RoleValue_PID,isaac)
			SetPlot( boss3,"dead","ic_780937_BOSS3XX",0 )
			BeginPlot(boss3 , "ic_780937_boss35_2" , 0)
			WriteRoleValue(isaac,EM_RoleValue_register3,0)
		end
		if boss4xx==1 then
			boss4=CreateObjByFlag(105747,780886,94,1)
			SetModeEx( boss4, EM_SetModeType_Move, false)
			AddToPartition(boss4,RoomID)
			WriteRoleValue(boss4,EM_RoleValue_PID,isaac)
			SetPlot( boss4,"dead","ic_780937_BOSS4XX",0 )
			BeginPlot(boss4 , "ic_780937_boss46_2" , 0)
			WriteRoleValue(isaac,EM_RoleValue_register4,0)
		end
		if boss5xx==1 then
			boss5=CreateObjByFlag(105748,780886,95,1)
			SetModeEx( boss5, EM_SetModeType_Move, false)
			AddToPartition(boss5,RoomID)
			WriteRoleValue(boss5,EM_RoleValue_PID,isaac)
			SetPlot( boss5,"dead","ic_780937_BOSS5XX",0 )
			BeginPlot(boss5, "ic_780937_boss35_2" , 0)
			WriteRoleValue(isaac,EM_RoleValue_register5,0)
		end
		if boss6xx==1 then
			boss6=CreateObjByFlag(105747,780886,96,1)
			SetModeEx( boss6, EM_SetModeType_Move, false)
			AddToPartition(boss6,RoomID)
			WriteRoleValue(boss6,EM_RoleValue_PID,isaac)
			SetPlot( boss6,"dead","ic_780937_BOSS6XX",0 )
			BeginPlot(boss6 , "ic_780937_boss46_2" , 0)
			WriteRoleValue(isaac,EM_RoleValue_register6,0)
		end
		time2=0
		time3=0
	end	
	if boss3xx==1 and boss4xx==1 and boss5xx==1 and boss6xx==1 then
		SetIdleMotion( boss2 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
		SetModeEx( boss2, EM_SetModeType_Obstruct, false)
		WriteRoleValue(isaac,EM_RoleValue_register3,2)
		WriteRoleValue(isaac,EM_RoleValue_register4,2)
		WriteRoleValue(isaac,EM_RoleValue_register5,2)
		WriteRoleValue(isaac,EM_RoleValue_register6,2)
		WriteRoleValue(isaac,EM_RoleValue_register10,2)
		sleep(20)
		SetIdleMotion( boss2 ,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
	end
	if boss1xx==2 then
		sleep(100)
		break
	end
	if boss1xx==0 then	
		if time4==0 and mob9898==1 then
			SetIdleMotion( mob4 ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
			SetModeEx( mob4 , EM_SetModeType_Obstruct, false) 								---阻擋(是)
			SetModeEx( boss1 , EM_SetModeType_Fight, true) 									---可砍殺
			boss7=CreateObjByFlag(105745,780886,97,1)
			SetModeEx( boss7, EM_SetModeType_Move, false)
			AddToPartition(boss7,RoomID)
			AddBuff(boss7,509810,0 ,-1 )
			WriteRoleValue(boss7,EM_RoleValue_PID,boss1)
			BeginPlot(boss7, "ic_780937_boss78_2" , 0)
			boss8=CreateObjByFlag(105745,780886,98,1)
			SetModeEx( boss8, EM_SetModeType_Move, false)
			AddToPartition(boss8,RoomID)
			AddBuff(boss8,509810,0 ,-1 )
			WriteRoleValue(boss8,EM_RoleValue_PID,boss1)
			BeginPlot(boss8, "ic_780937_boss78_2" , 0)
			time4=1
		end
		if mob9898==1 and time0==0 then
			Luck=DW_Rand(3)
			if Luck==1 then
			SetModeEx( mob1  , EM_SetModeType_Show, true )
			SetModeEx( mob1  , EM_SetModeType_Move, true )									--移動
				time0=1
				BeginPlot(mob1 , "ic_780937_mob1_2" , 0)
				sleep(5)
				--sysCastSpellLV( mob1 , mob1 , 497656  , 1 )
				sleep(15)
			mob1=CreateObjByFlag(105651 ,780886,1,1)												
			SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob1  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob1  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob1  , EM_SetModeType_Show, false )
			SetModeEx( mob1  , EM_SetModeType_HideName	, true )
			AddToPartition( mob1 , RoomID )
			WriteRoleValue(mob1,EM_RoleValue_PID,isaac)										---mob1暫存口袋PID 
			time0=0	
			elseif Luck==2	then
			SetModeEx( mob2  , EM_SetModeType_Show, true )
			SetModeEx( mob2  , EM_SetModeType_Move, true )									--移動
				time0=1
				BeginPlot(mob2 , "ic_780937_mob2_2" , 0)
				sleep(5)
				--sysCastSpellLV( mob2 , mob2 , 497656  , 1 )
				sleep(15)
			mob2=CreateObjByFlag(105651 ,780886,2,1)
			SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob2  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob2  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob2  , EM_SetModeType_Show, false )
			SetModeEx( mob2  , EM_SetModeType_HideName	, true )
			AddToPartition( mob2 , RoomID )
			WriteRoleValue(mob2,EM_RoleValue_PID,isaac)										---mob2暫存口袋PID 	
			time0=0	
			elseif Luck==3 then
			SetModeEx( mob3  , EM_SetModeType_Show, true )
			SetModeEx( mob3  , EM_SetModeType_Move, true )									--移動
				time0=1
				BeginPlot(mob3 , "ic_780937_mob3_2" , 0)
				sleep(5)
				--sysCastSpellLV( mob3 , mob3 , 497656  , 1 )
				sleep(15)
			mob3=CreateObjByFlag(105651 ,780886,3,1)
			SetModeEx( mob3  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob3  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob3  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob3  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob3  , EM_SetModeType_Show, false )
			SetModeEx( mob3  , EM_SetModeType_HideName	, true )	
			AddToPartition( mob3 , RoomID )	
			WriteRoleValue(mob3,EM_RoleValue_PID,isaac)										---mob3暫存口袋PID
			time0=0	
			end	
		end
	elseif boss1xx==1 then
		if time1==0 then
			CancelBuff(Boss7, 509810)
			CancelBuff(Boss8, 509810)
			WriteRoleValue(Boss7,EM_RoleValue_register1,1)
			WriteRoleValue(Boss8,EM_RoleValue_register1,1)
			boss3=CreateObjByFlag(105748,780886,93,1)
			boss4=CreateObjByFlag(105747,780886,94,1)
			boss5=CreateObjByFlag(105748,780886,95,1)
			boss6=CreateObjByFlag(105747,780886,96,1)
			SetModeEx( boss3 , EM_SetModeType_Move, false)
			SetModeEx( boss4 , EM_SetModeType_Move, false)
			SetModeEx( boss5 , EM_SetModeType_Move, false)
			SetModeEx( boss6 , EM_SetModeType_Move, false)
			AddToPartition(boss3,RoomID)
			AddToPartition(boss4,RoomID)
			AddToPartition(boss5,RoomID)
			AddToPartition(boss6,RoomID)
			WriteRoleValue(boss3,EM_RoleValue_PID,isaac)
			WriteRoleValue(boss4,EM_RoleValue_PID,isaac)
			WriteRoleValue(boss5,EM_RoleValue_PID,isaac)
			WriteRoleValue(boss6,EM_RoleValue_PID,isaac)
			SetPlot( boss3,"dead","ic_780937_BOSS3XX",0 )
			SetPlot( boss4,"dead","ic_780937_BOSS4XX",0 )
			SetPlot( boss5,"dead","ic_780937_BOSS5XX",0 )
			SetPlot( boss6,"dead","ic_780937_BOSS6XX",0 )
			BeginPlot(boss3 , "ic_780937_boss35_2" , 0)
			BeginPlot(boss4 , "ic_780937_boss46_2" , 0)
			BeginPlot(boss5 , "ic_780937_boss35_2" , 0)
			BeginPlot(boss6 , "ic_780937_boss46_2" , 0)
			time1=1
		end
		if mob9898==1 and time0==0 then
			Luck=DW_Rand(3)
			if Luck==1 then
			SetModeEx( mob1  , EM_SetModeType_Show, true )
			SetModeEx( mob1  , EM_SetModeType_Move, true )									--移動
				time0=1
				BeginPlot(mob1 , "ic_780937_mob1_1_2" , 0)
				sleep(5)
				--sysCastSpellLV( mob1 , mob1 , 497656  , 1 )
				sleep(15)
			mob1=CreateObjByFlag(105651 ,780886,1,1)												
			SetModeEx( mob1  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob1  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob1  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob1  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob1  , EM_SetModeType_Show, false )
			SetModeEx( mob1  , EM_SetModeType_HideName	, true )
			AddToPartition( mob1 , RoomID )
			WriteRoleValue(mob1,EM_RoleValue_PID,isaac)										---mob1暫存口袋PID 
			time0=0	
			elseif Luck==2	then
			SetModeEx( mob2  , EM_SetModeType_Show, true )
			SetModeEx( mob2  , EM_SetModeType_Move, true )									--移動
				time0=1
				BeginPlot(mob2 , "ic_780937_mob2_1_2" , 0)
				sleep(5)
				--sysCastSpellLV( mob2 , mob2 , 497656  , 1 )
				sleep(15)
			mob2=CreateObjByFlag(105651 ,780886,2,1)
			SetModeEx( mob2  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob2  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob2  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob2  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob2  , EM_SetModeType_Show, false )
			SetModeEx( mob2  , EM_SetModeType_HideName	, true )	
			AddToPartition( mob2 , RoomID )
			WriteRoleValue(mob2,EM_RoleValue_PID,isaac)										---mob2暫存口袋PID 	
			time0=0	
			elseif Luck==3 then
			SetModeEx( mob3  , EM_SetModeType_Show, true )
			SetModeEx( mob3  , EM_SetModeType_Move, true )									--移動
				time0=1
				BeginPlot(mob3 , "ic_780937_mob3_1_2" , 0)
				sleep(5)
				--sysCastSpellLV( mob3 , mob3 , 497656  , 1 )
				sleep(15)
			mob3=CreateObjByFlag(105651 ,780886,3,1)
			SetModeEx( mob3  , EM_SetModeType_ShowRoleHead, false )							--不秀頭像框
			SetModeEx( mob3  , EM_SetModeType_Move, false )									--移動
			SetModeEx( mob3  , EM_SetModeType_Searchenemy, false )							--索敵
			SetModeEx( mob3  , EM_SetModeType_Fight , false )								--可砍殺攻擊
			SetModeEx( mob3  , EM_SetModeType_Show, false )
			SetModeEx( mob3  , EM_SetModeType_HideName	, true )	
			AddToPartition( mob3 , RoomID )	
			WriteRoleValue(mob3,EM_RoleValue_PID,isaac)										---mob3暫存口袋PID
			time0=0	
			end	
		end
	end
		sleep(10)
	end
end


function ic_780937_boss35_2()	--射手
local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_AttackTargetID )    		 ---找尋目前的攻擊目標
local time1=0
	while 1 do
		if hatelistcount(OwnerID())~=0 then 
			AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_AttackTargetID )
			sleep(10)
			CastSpellLV( OwnerID() , AttackTarget , 497650, 0 )
		elseif hatelistcount(OwnerID())==0 then
			sleep(10)
		end	
	end
end
function ic_780937_boss46_2()	--法師
	local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_AttackTargetID )    		 ---找尋目前的攻擊目標
	local time1=0
	while 1 do
		if hatelistcount(OwnerID())~=0 then 
			AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_AttackTargetID )
			sleep(10)
			CastSpellLV( OwnerID() , AttackTarget , 497651, 70 )
		elseif hatelistcount(OwnerID())==0 then
			sleep(10)
		end	
	end
end
function ic_780937_boss78_2()	--補師
local time1=0
local p1p2=0
local boss1 = ReadRoleValue(OwnerID(), EM_RoleValue_PID )    		 ---找尋目前的攻擊目標
	while 1 do
		p1p2=ReadRoleValue(OwnerID(), EM_RoleValue_register1 )
		if p1p2==0 then
			CastSpellLV( OwnerID() , boss1 , 497657,0)
			sleep(20)
		elseif	p1p2==1 then
			CastSpellLV( OwnerID() , OwnerID() , 497658,0)
			sleep(20)
		end
	end
end
function ic_780937_boss1234_2()	--門神
	local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_AttackTargetID )    		 ---找尋目前的攻擊目標
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )							 ---讀取血量
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )     						 ---讀取目前血量
	local HPPercent = NowHP / MaxHP	
	local time1=0
	local time2=0
	local time3=0
	while 1 do
		AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_AttackTargetID )
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )						 		---讀取血量
		NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     					 		---讀取目前血量
		HPPercent = NowHP / MaxHP
		sleep(10)
		if hatelistcount(OwnerID())~=0 then 
			if HPPercent>0.6 then
				time1=time1+1
				time2=time2+1
				if time2>=20 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end
					CastSpellLV( OwnerID() , OwnerID() , 497652, 99 )
					sleep(50)
					CastSpellLV( OwnerID() , OwnerID() , 497653, 0 )
					time2=0
				end
			elseif HPPercent<0.6 then
				time1=time1+1
				time2=time2+1
				time3=time3+1
				if time2>=20 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end
					CastSpellLV( OwnerID() , OwnerID() , 497652, 99 )
					sleep(50)
					CastSpellLV( OwnerID() , OwnerID() , 497653, 0 )
					time2=0
				end
				if time3>=10 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end
					CastSpellLV( OwnerID() , OwnerID() , 497654, 0 )
					sleep(20)
					time3=0
				end	
			end
		elseif hatelistcount(OwnerID())==0 then
			time1=0
			time2=0
			time3=0
		end
	end
end
function ic_780937_boss1234_3_2()	--門神~斜坡顧門用
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_AttackTargetID )    		 ---找尋目前的攻擊目標
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )							 ---讀取血量
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )     						 ---讀取目前血量
	local HPPercent = NowHP / MaxHP	
	local time1=0
	local time2=0
	local time3=0
	local door=CreateObjByFlag(105814,780886,99,1)
			SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 								---頭相框(否)
			SetModeEx( door , EM_SetModeType_Mark, false)										---可點選(否)
			SetModeEx( door , EM_SetModeType_Obstruct, true) 									---阻擋(是)
			SetModeEx( door , EM_SetModeType_Strikback, false) 								---反擊
			SetModeEx( door , EM_SetModeType_Move, false) 										---移動	
			SetModeEx( door  , EM_SetModeType_Searchenemy, false )								--索敵
			SetModeEx( door , EM_SetModeType_Fight, false) 									---可砍殺
			SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否)
			SetModeEx( door  , EM_SetModeType_HideName	, true )	
			SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_END)	
			AddToPartition(door,RoomID)
			WriteRoleValue(OwnerID(),EM_RoleValue_PID,door)	
	SetPlot( OwnerID(),"dead","ic_780937_boss1234_33_2",0 )		
	while 1 do
		AttackTarget = ReadRoleValue(OwnerID(), EM_RoleValue_AttackTargetID )
		MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )						 		---讀取血量
		NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     					 		---讀取目前血量
		HPPercent = NowHP / MaxHP
		sleep(10)
		if hatelistcount(OwnerID())~=0 then 
			if HPPercent>0.6 then
				time1=time1+1
				time2=time2+1
				if time2>=20 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end
					CastSpellLV( OwnerID() , OwnerID() , 497652, 99 )
					sleep(50)
					CastSpellLV( OwnerID() , OwnerID() , 497653, 0 )
					time2=0
				end
			elseif HPPercent<0.6 then
				time1=time1+1
				time2=time2+1
				time3=time3+1
				if time2>=20 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end
					CastSpellLV( OwnerID() , OwnerID() , 497652, 99 )
					sleep(50)
					CastSpellLV( OwnerID() , OwnerID() , 497653, 0)
					time2=0
				end
				if time3>=10 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end
					CastSpellLV( OwnerID() , OwnerID() , 497654,0)
					sleep(20)
					time3=0
				end	
			end
		elseif hatelistcount(OwnerID())==0 then
			time1=0
			time2=0
			time3=0
		end
	end
end
function ic_780937_boss1234_33_2()
local door=ReadRoleValue(OwnerID() , EM_RoleValue_PID)
	  SetIdleMotion( door ,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)	
	  SetModeEx( door , EM_SetModeType_Obstruct, false)
end
function ic_780937_mob1_2()																		
local Luck=0	
	Luck=DW_Rand(3)
	if Luck==1 then
		DW_MoveToFlag( OwnerID() , 780886 ,11,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,21,0)
		killid( OwnerID() , OwnerID() )
	elseif	Luck==2 then
		DW_MoveToFlag( OwnerID() , 780886 ,11,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,22,0)
		killid( OwnerID() , OwnerID() )
	elseif Luck==3 then
		DW_MoveToFlag( OwnerID() , 780886 ,11,0)
		DW_MoveToFlag( OwnerID() , 780886 ,23,0)
		killid( OwnerID() , OwnerID() )
	end
end
function ic_780937_mob2_2()																		
local Luck=0		
	Luck=DW_Rand(3)
	if Luck==1 then
		DW_MoveToFlag( OwnerID() , 780886 ,12,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,21,0)
		killid( OwnerID() , OwnerID() )
	elseif	Luck==2 then
		DW_MoveToFlag( OwnerID() , 780886 ,12,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,22,0)
		killid( OwnerID() , OwnerID() )	
	elseif Luck==3 then
		DW_MoveToFlag( OwnerID() , 780886 ,12,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,23,0)
		killid( OwnerID() , OwnerID() )
	end
end
function ic_780937_mob3_2()																		
local Luck=0		
	Luck=DW_Rand(3)
	if Luck==1 then
		DW_MoveToFlag( OwnerID() , 780886 ,13,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,21,0)
		killid( OwnerID() , OwnerID() )
	elseif	Luck==2 then
		DW_MoveToFlag( OwnerID() , 780886 ,13,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,22,0)
		killid( OwnerID() , OwnerID() )	
	elseif Luck==3 then
		DW_MoveToFlag( OwnerID() , 780886 ,13,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,23,0)
		killid( OwnerID() , OwnerID() )
	end
end
function ic_780937_mob1_1_2()																		
local Luck=0
SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )	
	Luck=DW_Rand(3)
	if Luck==1 then
		DW_MoveToFlag( OwnerID() , 780886 ,11,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,31,0)
		killid( OwnerID() , OwnerID() )
	elseif	Luck==2 then
		DW_MoveToFlag( OwnerID() , 780886 ,11,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,32,0)
		killid( OwnerID() , OwnerID() )
	elseif Luck==3 then
		DW_MoveToFlag( OwnerID() , 780886 ,11,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,33,0)
		killid( OwnerID() , OwnerID() )
	end
end
function ic_780937_mob2_1_2()																		
local Luck=0		
	Luck=DW_Rand(3)
	if Luck==1 then
		DW_MoveToFlag( OwnerID() , 780886 ,12,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,31,0)
		killid( OwnerID() , OwnerID() )
	elseif	Luck==2 then
		DW_MoveToFlag( OwnerID() , 780886 ,12,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,32,0)
		killid( OwnerID() , OwnerID() )	
	elseif Luck==3 then
		DW_MoveToFlag( OwnerID() , 780886 ,12,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )
		DW_MoveToFlag( OwnerID() , 780886 ,33,0)
		killid( OwnerID() , OwnerID() )
	end
end
function ic_780937_mob3_1_2()																		
local Luck=0	
	Luck=DW_Rand(3)
	if Luck==1 then
		DW_MoveToFlag( OwnerID() , 780886 ,13,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )	
		DW_MoveToFlag( OwnerID() , 780886 ,31,0)
		killid( OwnerID() , OwnerID() )
	elseif	Luck==2 then
		DW_MoveToFlag( OwnerID() , 780886 ,13,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )	
		DW_MoveToFlag( OwnerID() , 780886 ,32,0)
		killid( OwnerID() , OwnerID() )	
	elseif Luck==3 then
		DW_MoveToFlag( OwnerID() , 780886 ,13,0)
		SetPlot( OwnerID(), "range","ic_780937_mob123_2", 30 )	
		DW_MoveToFlag( OwnerID() , 780886 ,33,0)
		killid( OwnerID() , OwnerID() )
	end
end
function ic_780937_mob123_2()
local mob=TargetID()
local Room = ReadRoleValue(mob , EM_RoleValue_RoomID )			----讀在哪一層
local mob10 = star_CreateObj_NoAdd( mob , 105704 , 0 , 0 , 0 , Room , 0 ) 			----小怪死掉生球
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
		AddBuff(OwnerID(),508867,0 ,-1 ) 
		--StopMove(mob,false)
		--SetModeEx( mob  , EM_SetModeType_Move, false )
		killid( mob,mob)	
		SetModeEx( mob10  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
		SetModeEx( mob10  , EM_SetModeType_Move, false )--移動
		SetModeEx( mob10  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( mob10  , EM_SetModeType_Fight , false )--可砍殺攻擊
		AddToPartition( mob10 , Room )
		WriteRoleValue( mob10, EM_RoleValue_Livetime, 3)				--存在秒數
		CastSpellLv( mob10 , mob10 , 497655 , 0 )
	end	
end