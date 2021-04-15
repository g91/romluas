function ic_105062_01()   ------主控器   
	local Ctrl = OwnerID()					--控制器
	local open1=0						    --開戰旗標	
	local open2=0						    --開戰旗標			
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	local luck
	local luck1---(ReadRoleValue(OwnerID(),EM_RoleValue_register10)
	local Boss1
	local Boss2
	local Boss1open=0---(ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local Boss2open=0---(ReadRoleValue(OwnerID(),EM_RoleValue_register3)
	local boss19898=0---(ReadRoleValue(OwnerID(),EM_RoleValue_register8)
	local boss29898=0---(ReadRoleValue(OwnerID(),EM_RoleValue_register9)
	local boss1xx=0---(ReadRoleValue(OwnerID(),EM_RoleValue_register4)	
	local boss2xx=0---(ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	local time1=0	--真假交換用 
	local time2=0	--真假交換用
	local time3=0	--交換開關
	local time4=0	--假王復活用
	local time5=0	--假王對真王放BUFF
	local time6=0	--假王太早死要對真王放BUFF
	local time7=0	--
	local time11=0	--
	local time22=0	--
	local boss1NowHP --= ReadRoleValue(Boss1, EM_RoleValue_HP )     --讀取目前血量	
	local boss1HP---(ReadRoleValue(OwnerID(),EM_RoleValue_register6)記錄血量用
	local PlayerInHate = {}	---PlayerInHate = star_HateListSort(OwnerID())			
	local Tank = PlayerInHate[1]---第1仇恨
	local Xplay1--=ReadRoleValue(Boss1 ,EM_RoleValue_X)
	local Yplay1--=ReadRoleValue(Boss1 ,EM_RoleValue_Y)
	local Zplay1--=ReadRoleValue(Boss1 ,EM_RoleValue_Z)
	local yy
	local xx=0
	local POWERLV=0---(ReadRoleValue(OwnerID(),EM_RoleValue_register7)
	Luck=DW_Rand(2)---隨機取得數字用
	WriteRoleValue(OwnerID(),EM_RoleValue_register10,Luck)
	if 	Luck==1 then----BOSS 隨機出
		Boss1=CreateObjByFlag(105063,780794,13,1) 	-----BOSS創在  旗標16
		Boss2=CreateObjByFlag(105065,780794,14,1) 	-----BOSS創在  旗標13
		AddToPartition(Boss1,RoomID)
		AddBuff( Boss1,507951,0 ,-1 )
		AddBuff( Boss1,507952,0 ,-1 )
		SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
		WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
		AddToPartition(Boss2,RoomID)
		AddBuff( Boss2,507951,0 ,-1 )
		AddBuff( Boss2,507952,0 ,-1 )
		SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
		ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_01]" , 2 )--猜看看~哪個才是真的我~哈哈
	elseif	Luck==2 then
		Boss1=CreateObjByFlag(105063,780794,14,1) 	-----BOSS創在  旗標13
		Boss2=CreateObjByFlag(105065,780794,13,1) 	-----BOSS創在  旗標16
		AddToPartition(Boss1,RoomID)
		AddBuff( Boss1,507951,0 ,-1 )
		SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
		WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
		AddToPartition(Boss2,RoomID)
		AddBuff( Boss2,507951,0 ,-1 )
		SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
		ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_01]" , 2 )--猜看看~哪個才是真的我~哈哈
	end
	while true do
		Boss1open=ReadRoleValue(OwnerID(),EM_RoleValue_register1)---真王開戰
		Boss2open=ReadRoleValue(OwnerID(),EM_RoleValue_register3)---假王開戰
		boss1xx=ReadRoleValue(OwnerID(),EM_RoleValue_register4)---真王死
		boss2xx=ReadRoleValue(OwnerID(),EM_RoleValue_register5)---假王死
		luck1=ReadRoleValue(OwnerID(),EM_RoleValue_register10)---開關上下路
		boss19898=ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		boss29898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		--say(OwnerID(),"time1="..time1)
		--say(OwnerID(),"time2="..time2)
		--say(OwnerID(),"time4="..time4)
		--say(OwnerID(),"boss1xx="..boss1xx)
		--say(OwnerID(),"boss2xx="..boss2xx)
		if  boss1xx==1 and time7==0  then---1王都死了
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_05]" , 2 )---------------玩過火了~劇毒提阿里斯~救救我~阿~~~~
			SetModeEx( Boss2 , EM_SetModeType_Fight, true) ---可砍殺
			SetModeEx( Boss2 , EM_SetModeType_Strikback, true) ---反擊
			SetModeEx( Boss2 , EM_SetModeType_Move, true) ---移動
			SetModeEx( Boss2 , EM_SetModeType_Searchenemy, true)	---索敵(否)
			WriteRoleValue(mob,EM_RoleValue_register9,2)
			time7=1
			time3=1
			--DelObj(Ctrl)
			
		end
		--if boss2xx==1 and time4<=10 and boss1xx==0 then
		--	time4=time4+1
		--end
		--if boss2xx==1 and time4>=10 and boss1xx==0 then---2王死1亡沒死
		--	boss29898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)			
		--	if luck1==1 then 
		--		if boss29898==0 then
		--			Boss2=CreateObjByFlag(105065,780794,14,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==1 then
		--			Boss2=CreateObjByFlag(105065,780805,10,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==2 then
		--			Boss2=CreateObjByFlag(105065,780805,11,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==3 then	
		--			Boss2=CreateObjByFlag(105065,780805,12,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==4 then	
		--			Boss2=CreateObjByFlag(105065,780805,24,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl	
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		end
		--	elseif luck1==2 then
		--		if boss29898==0 then
		--			Boss2=CreateObjByFlag(105065,780794,13,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==1 then
		--			Boss2=CreateObjByFlag(105065,780805,7,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==2 then
		--			Boss2=CreateObjByFlag(105065,780805,8,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==3 then
		--			Boss2=CreateObjByFlag(105065,780805,9,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==4 then	
		--			Boss2=CreateObjByFlag(105065,780805,21,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl	
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		----			time4=0
		--		end
		--	end
		--	ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_03]" , 2 )---------------感謝提阿里斯的能量
		--	WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--	time2=0
		--end	
		if time2<=40  and  boss1xx==0 and boss2xx==1 and time6==0 then---假的太早死
			--say(OwnerID(),"444")
			say(Boss1,"[SC_105062_03]")
			POWERLV=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
			WriteRoleValue(OwnerID(),EM_RoleValue_register7,POWERLV+1)
			POWERLV=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
			time6=1
		end
		if time1>=55 and time5==0 and  boss1xx==0 and boss2xx==0 or time2>=55 and time5==0 and  boss1xx==0 and boss2xx==0 then---假的55秒沒死
			time5=1
			DelObj(Boss2)
			PlayerInHate = star_HateListSort(Boss1)
			Tank = PlayerInHate[1]
			Xplay1=ReadRoleValue(Tank ,EM_RoleValue_X)
			Yplay1=ReadRoleValue(Tank ,EM_RoleValue_Y)
			Zplay1=ReadRoleValue(Tank ,EM_RoleValue_Z)
			sleep(10)
			Boss2=CreateObj( 105065 , Xplay1 , Yplay1 , Zplay1 , 0 , 1 )
			AddToPartition(Boss2,RoomID)
			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
			SetModeEx( Boss2 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Boss2 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Boss2 , EM_SetModeType_Move, false) ---移動
			SetModeEx( Boss2 , EM_SetModeType_Searchenemy, false)	---索敵(否)
			CastSpellLV( Boss2 , Boss1 , 496408 ,0)
			
			say(Boss2,"[SC_105062_04]")
			POWERLV=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
			WriteRoleValue(OwnerID(),EM_RoleValue_register7,POWERLV+1)
			POWERLV=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
			--say(OwnerID(),"POWERLV="..POWERLV)
		end
		if time1>=60 and time3==0 and  boss1xx==0 or time2>=60 and time3==0 and  boss1xx==0 then---1王2王換位子
			time3=1	
			boss1NowHP= ReadRoleValue(Boss1, EM_RoleValue_HP )
			boss19898=ReadRoleValue(OwnerID(),EM_RoleValue_register8)
			boss29898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
			POWERLV=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
			WriteRoleValue(ctrl,EM_RoleValue_register6,boss1NowHP)
			DelObj(Boss1)
			DelObj(Boss2)
			--say(OwnerID(),"POWERLV="..POWERLV)
			if luck1==2 then
				if boss19898==0 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss1=CreateObjByFlag(105063,780794,13,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss19898==1 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss1=CreateObjByFlag(105063,780805,7,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss19898==2 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss1=CreateObjByFlag(105063,780805,8,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0
					time5=0
				elseif boss19898==3 then	
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss1=CreateObjByFlag(105063,780805,9,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0
					time5=0
				elseif boss19898==4 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss1=CreateObjByFlag(105063,780805,21,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0					
				end
				if boss29898==0 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss2=CreateObjByFlag(105065,780794,14,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss29898==1 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss2=CreateObjByFlag(105065,780805,10,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss29898==2 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss2=CreateObjByFlag(105065,780805,11,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss29898==3 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss2=CreateObjByFlag(105065,780805,12,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss29898==4 then	
					WriteRoleValue(ctrl,EM_RoleValue_register10,1)
					Boss2=CreateObjByFlag(105065,780805,24,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0					
				end
			elseif luck1==1 then
				if boss19898==0 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss1=CreateObjByFlag(105063,780794,14,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0	
					time2=0	
					time3=0	
					time5=0
				elseif boss19898==1 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss1=CreateObjByFlag(105063,780805,10,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss19898==2 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss1=CreateObjByFlag(105063,780805,11,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0
					time5=0
				elseif boss19898==3 then	
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss1=CreateObjByFlag(105063,780805,12,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0
					time5=0
				elseif boss19898==4 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss1=CreateObjByFlag(105063,780805,24,1)
					boss1HP=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
					sleep(10)
					WriteRoleValue( Boss1, EM_RoleValue_HP,boss1HP)
					AddToPartition(Boss1,RoomID)
					if POWERLV>=1 then
						AddBuff( Boss1,507953,POWERLV-1 ,-1 )
					end
					SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 ) 
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0	
				end
				if boss29898==0 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss2=CreateObjByFlag(105065,780794,13,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss29898==1 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss2=CreateObjByFlag(105065,780805,7,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss29898==2 then
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss2=CreateObjByFlag(105065,780805,8,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0
					time5=0
				elseif boss29898==3 then	
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss2=CreateObjByFlag(105065,780805,9,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0
				elseif boss29898==4 then	
					WriteRoleValue(ctrl,EM_RoleValue_register10,2)
					Boss2=CreateObjByFlag(105065,780805,21,1)
					AddToPartition(Boss2,RoomID)
					SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0	
				end
			end	
		ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_01]" , 2 )--冒險者~猜看看~哪個才是真的我~哈哈
		end	
		if hatelistcount(Boss1)~=0 then    		---讀仇恨人數
			time1=time1+1
			WriteRoleValue(Ctrl,EM_RoleValue_register1,1)
			StopMove(Boss1,false)
			if open1==0 then
				open1=1					--開打了
				time11=0
				BeginPlot(Boss1 , "ic_105062_BOSS1" , 0)				------命令角色做事情
			end
		end	
		if hatelistcount(Boss1)==0 and open1==1 and boss1xx==0 or hatelistcount(Boss1)==0 and open1==0 and boss1xx==0 then			--開戰後仇恨表沒人
			WriteRoleValue(Ctrl,EM_RoleValue_register1,0)
			open1=0
			if time11==0 then		
				BeginPlot(Boss1 , "ic_105062_BOSS19898" , 0)
				time11=1
			end	
		end	
		if hatelistcount(Boss2)~=0 then    		---讀仇恨人數
			time2=time2+1
			time6=0
			WriteRoleValue(Ctrl,EM_RoleValue_register3,1)
			StopMove(Boss2,false)
			if open2==0 then
				open2=1					--開打了
				time22=0
				BeginPlot(Boss2 , "ic_105062_BOSS2" , 0)				------命令角色做事情	
			end
		end	
		if hatelistcount(Boss2)==0 and open2==1 and boss2xx==0 or hatelistcount(Boss1)==0 and open2==0 and boss2xx==0 then			--開戰後仇恨表沒人
			WriteRoleValue(Ctrl,EM_RoleValue_register3,0)
			open2=0	
			if time22==0 then	
				BeginPlot(Boss2 , "ic_105062_BOSS29898" , 0)
				time22=1
			end	
		end	
	end		
end 
function ic_105062_BOSS1xx()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local Ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	StopMove(OwnerID(),false)
	WriteRoleValue(Ctrl,EM_RoleValue_register4,1)
end
function ic_105062_BOSS2xx()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local Ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	StopMove(OwnerID(),false)
	WriteRoleValue(Ctrl,EM_RoleValue_register5,1)
end
function ic_105062_BOSS19898()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local Ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local Boss1 =OwnerID()
	while true do
		boss19898=ReadRoleValue(Ctrl,EM_RoleValue_register8)
		luck1=ReadRoleValue(Ctrl,EM_RoleValue_register10)
		sleep(10)
		if 	luck1==1 then
				MoveToFlagEnabled(Boss1, false)
				if boss19898==0 then
					MoveToFlagEnabled(Boss1, false)
					WriteRoleValue(  Boss1,EM_RoleValue_IsWalk,0)
					Hide(Boss1)
					Show(Boss1,RoomID)
					DW_MoveToFlag( Boss1 , 780805 ,7,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register8,boss19898+1)
					sleep(10)
				elseif boss19898==1 then
					MoveToFlagEnabled(Boss1, false)
					WriteRoleValue(Boss1,EM_RoleValue_IsWalk,0)
					Hide(Boss1)
					Show(Boss1,RoomID)
					DW_MoveToFlag(Boss1 , 780805 ,8,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register8,boss19898+1)
				elseif boss19898==2 then
					MoveToFlagEnabled(Boss1, false)
					WriteRoleValue(Boss1,EM_RoleValue_IsWalk,0)
					Hide(Boss1)
					Show(Boss1,RoomID)
					SetPosByFlag(Boss1, 780805 , 9 )
					WriteRoleValue(Ctrl,EM_RoleValue_register8,boss19898+1)
				elseif boss19898==3 then	
					MoveToFlagEnabled(Boss1, false)
					WriteRoleValue(Boss1,EM_RoleValue_IsWalk,0)
					Hide(Boss1)
					Show(Boss1,RoomID)
					DW_MoveToFlag(Boss1 , 780805 ,24,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register8,boss19898+1)
				end	
			elseif	luck1==2 then
				MoveToFlagEnabled(Boss1, false)
				if boss19898==0 then
					MoveToFlagEnabled(Boss1, false)
					WriteRoleValue(  Boss1,EM_RoleValue_IsWalk,0)
					Hide(Boss1)
					Show(Boss1,RoomID)
					DW_MoveToFlag( Boss1 , 780805 ,10,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register8,boss19898+1)
					sleep(10)
				elseif boss19898==1 then
					MoveToFlagEnabled(Boss1, false)
					WriteRoleValue(Boss1,EM_RoleValue_IsWalk,0)
					Hide(Boss1)
					Show(Boss1,RoomID)
					DW_MoveToFlag( Boss1 , 780805 ,11,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register8,boss19898+1)
				elseif boss19898==2 then
					MoveToFlagEnabled(Boss1, false)
					WriteRoleValue(Boss1,EM_RoleValue_IsWalk,0)
					Hide(Boss1)
					Show(Boss1,RoomID)
					SetPosByFlag(Boss1, 780805 , 12 )
					WriteRoleValue(Ctrl,EM_RoleValue_register8,boss19898+1)
				elseif boss19898==3 then	
					MoveToFlagEnabled(Boss1, false)
					WriteRoleValue(Boss1,EM_RoleValue_IsWalk,0)
					Hide(Boss1)
					Show(Boss1,RoomID)
					DW_MoveToFlag(Boss1 , 780805 ,24,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register8,boss19898+1)
				end	
			end	
	end
end
function ic_105062_BOSS29898()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local Ctrl = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local Boss2 =OwnerID()
	while true do	
		boss29898=ReadRoleValue(Ctrl,EM_RoleValue_register9)
		luck1=ReadRoleValue(Ctrl,EM_RoleValue_register10)
		sleep(10)
		if 	luck1==1 then
				MoveToFlagEnabled(Boss2, false)
				if boss29898==0 then
					MoveToFlagEnabled(Boss2, false)
					WriteRoleValue(  Boss2,EM_RoleValue_IsWalk,0)
					Hide(Boss2)
					Show(Boss2,RoomID)
					DW_MoveToFlag( Boss2 , 780805 ,10,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register9,boss29898+1)
					sleep(10)
				elseif boss29898==1 then
					MoveToFlagEnabled(Boss2, false)
					WriteRoleValue(Boss2,EM_RoleValue_IsWalk,0)
					Hide(Boss2)
					Show(Boss2,RoomID)
					DW_MoveToFlag(Boss2 , 780805 ,11,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register9,boss29898+1)
				elseif boss29898==2 then
					MoveToFlagEnabled(Boss2, false)
					WriteRoleValue(Boss2,EM_RoleValue_IsWalk,0)
					Hide(Boss2)
					Show(Boss2,RoomID)
					SetPosByFlag(Boss2, 780805 , 12 )
					WriteRoleValue(Ctrl,EM_RoleValue_register9,boss29898+1)
				elseif boss29898==3 then	
					MoveToFlagEnabled(Boss2, false)
					WriteRoleValue(Boss2,EM_RoleValue_IsWalk,0)
					Hide(Boss2)
					Show(Boss2,RoomID)
					DW_MoveToFlag(Boss2 , 780805 ,24,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register9,boss29898+1)
				end	
		elseif	luck1==2 then
				MoveToFlagEnabled(Boss2, false)
				if boss29898==0 then
					MoveToFlagEnabled(Boss2, false)
					WriteRoleValue(  Boss2,EM_RoleValue_IsWalk,0)
					Hide(Boss2)
					Show(Boss2,RoomID)
					DW_MoveToFlag( Boss2 , 780805 ,7,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register9,boss29898+1)
					sleep(10)
				elseif boss29898==1 then
					MoveToFlagEnabled(Boss2, false)
					WriteRoleValue(Boss2,EM_RoleValue_IsWalk,0)
					Hide(Boss2)
					Show(Boss2,RoomID)
					DW_MoveToFlag( Boss2 , 780805 ,8,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register9,boss29898+1)
				elseif boss29898==2 then
					MoveToFlagEnabled(Boss2, false)
					WriteRoleValue(Boss2,EM_RoleValue_IsWalk,0)
					Hide(Boss2)
					Show(Boss2,RoomID)
					SetPosByFlag(Boss2, 780805 , 9)
					WriteRoleValue(Ctrl,EM_RoleValue_register9,boss29898+1)
				elseif boss29898==3 then
					MoveToFlagEnabled(Boss2, false)
					WriteRoleValue(Boss2,EM_RoleValue_IsWalk,0)
					Hide(Boss2)
					Show(Boss2,RoomID)
					DW_MoveToFlag(Boss2 , 780805 ,21,0)
					WriteRoleValue(Ctrl,EM_RoleValue_register9,boss29898+1)
				end	
		end	
	end			
end
function ic_105062_BOSS1()    ------王AI
	local time1=0 	----計時器1 -技能用
	local time2=0	---- 計時器-技能大招用
	local time3=0 	----計時器1 -技能用
	local time10=0	------表演用
	local Luck=0	----隨機表用
	local play1x={} ---隨機打用
	local plays=0   ---隨機打用
	local plays44=0 ---有進入戰鬥再跑AI 
	AddBuff( OwnerID(),507952,0 ,-1 )
	while 1 do 
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標  
		local BossTarget=AttackTarget
			if time10<=0 then
				time10=time10+1
				CastSpellLV( OwnerID() , OwnerID() ,495953, 1)------表演丟披風
				CancelBuff( OwnerID() ,507951 ) ----------------------------清除他的buff
				SetModeEx( OwnerID() , EM_SetModeType_Move, true)
				sleep(5)
			end
				sleep(10)
				time1=time1+1
				time2=time2+1
				time3=time3+1
			--say(OwnerID(),"time2="..time2)	
			if time2>=13 then------大招 20秒固定放---全體
				if  hatelistcount(OwnerID())~=0 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end			
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_02]" , 2 )---------------冒險者~你們以為你們跑得掉嗎?---大絕用
					sleep(10)
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
					sleep(5)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------攻擊動作
					CastSpellLV( OwnerID() , OwnerID() , 496400 , 0 )
					sleep(40)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end			
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------播放下來
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
				end	
				time2=0
			end
			if time3>=8 then
				if  hatelistcount(OwnerID())~=0 then
					if  hatelistcount(OwnerID())==1 then
						CastSpellLV( OwnerID() , BossTarget , 496403, 6 )
						sleep(10)
					elseif hatelistcount(OwnerID())>=1 then
						play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
						plays=DW_Rand(table.getn(play1x))
						CastSpellLV( OwnerID() , play1x[plays] , 496403, 6 )
						sleep(10)
					end
				end	
				time3=0
			end
			if time1>=5 then 
				if  hatelistcount(OwnerID())~=0 then
					Luck=DW_Rand(2)---隨機取得數字用
					if Luck == 1 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
						end
						CastSpellLV( OwnerID() , BossTarget , 496401, 300 )-----單體技能
						sleep(10)
					elseif Luck == 2 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
						end	
						CastSpellLV( OwnerID() , OwnerID() , 496402, 1)-----自身範圍
						sleep(10)		    
					end
				end	
				time1=0
			end	
		sleep(10)
	end
end
function ic_105062_BOSS2()    ------王AI
	local time1=0 	----計時器1 -技能用
	local time2=0	---- 計時器-技能大招用
	local time3=0 	----計時器1 -技能用
	local time10=0	------表演用
	local Luck=0	----隨機表用
	local play1x={} ---隨機打用
	local plays=0   ---隨機打用
	local plays44=0 ---有進入戰鬥再跑AI 
	AddBuff( OwnerID(),507952,0 ,-1 )
	while 1 do 	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標  
		local BossTarget=AttackTarget
			if time10<=0 then
				time10=time10+1
				CastSpellLV( OwnerID() , OwnerID() ,495953, 1)------表演丟披風
				CancelBuff( OwnerID() ,507951 ) ----------------------------清除他的buff
				SetModeEx( OwnerID() , EM_SetModeType_Move, true)
				sleep(5)
			end
				sleep(10)
				time1=time1+1
				time2=time2+1
				time3=time3+1
			--say(OwnerID(),"time2="..time2)		
			if time2>=13 then------大招 20秒固定放---全體
				if  hatelistcount(OwnerID())~=0 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end			
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_02]" , 2 )---------------冒險者~你們以為你們跑得掉嗎?---大絕用
					sleep(10)
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------第1ㄍ動作
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
					sleep(5)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------攻擊動作
					CastSpellLV( OwnerID() , OwnerID() , 496400 , 0 )
					sleep(40)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
					end			
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------播放下來
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
				end	
				time2=0
			end
			if time3>=8 then
				if  hatelistcount(OwnerID())~=0 then
					if  hatelistcount(OwnerID())==1 then
					CastSpellLV( OwnerID() , BossTarget , 496403, 6 )
					sleep(10)
					
					elseif hatelistcount(OwnerID())>=1 then
					play1x=DW_HateRemain(1)-----------------------隨機打--不打坦
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV( OwnerID() , play1x[plays] , 496403, 6 )
					sleep(10)
					end
				end	
				time3=0
			end
			if time1>=5 then 
				if  hatelistcount(OwnerID())~=0 then	
					Luck=DW_Rand(2)---隨機取得數字用
					if Luck == 1 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(5)
						end
						CastSpellLV( OwnerID() , BossTarget , 496401, 300 )-----單體技能
						sleep(10)
					elseif Luck == 2 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(5)
						end	
						CastSpellLV( OwnerID() , OwnerID() , 496402, 1)-----自身範圍
						sleep(10)		    
					end
				end	
				time1=0
			end	
		sleep(10)
	end
end