function ic_105062_01()   ------�D����   
	local Ctrl = OwnerID()					--���
	local open1=0						    --�}�ԺX��	
	local open2=0						    --�}�ԺX��			
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
	local time1=0	--�u���洫�� 
	local time2=0	--�u���洫��
	local time3=0	--�洫�}��
	local time4=0	--�����_����
	local time5=0	--������u����BUFF
	local time6=0	--�����Ӧ����n��u����BUFF
	local time7=0	--
	local time11=0	--
	local time22=0	--
	local boss1NowHP --= ReadRoleValue(Boss1, EM_RoleValue_HP )     --Ū���ثe��q	
	local boss1HP---(ReadRoleValue(OwnerID(),EM_RoleValue_register6)�O����q��
	local PlayerInHate = {}	---PlayerInHate = star_HateListSort(OwnerID())			
	local Tank = PlayerInHate[1]---��1����
	local Xplay1--=ReadRoleValue(Boss1 ,EM_RoleValue_X)
	local Yplay1--=ReadRoleValue(Boss1 ,EM_RoleValue_Y)
	local Zplay1--=ReadRoleValue(Boss1 ,EM_RoleValue_Z)
	local yy
	local xx=0
	local POWERLV=0---(ReadRoleValue(OwnerID(),EM_RoleValue_register7)
	Luck=DW_Rand(2)---�H�����o�Ʀr��
	WriteRoleValue(OwnerID(),EM_RoleValue_register10,Luck)
	if 	Luck==1 then----BOSS �H���X
		Boss1=CreateObjByFlag(105063,780794,13,1) 	-----BOSS�Цb  �X��16
		Boss2=CreateObjByFlag(105065,780794,14,1) 	-----BOSS�Цb  �X��13
		AddToPartition(Boss1,RoomID)
		AddBuff( Boss1,507951,0 ,-1 )
		AddBuff( Boss1,507952,0 ,-1 )
		SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
		WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
		AddToPartition(Boss2,RoomID)
		AddBuff( Boss2,507951,0 ,-1 )
		AddBuff( Boss2,507952,0 ,-1 )
		SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
		ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_01]" , 2 )--�q�ݬ�~���Ӥ~�O�u����~����
	elseif	Luck==2 then
		Boss1=CreateObjByFlag(105063,780794,14,1) 	-----BOSS�Цb  �X��13
		Boss2=CreateObjByFlag(105065,780794,13,1) 	-----BOSS�Цb  �X��16
		AddToPartition(Boss1,RoomID)
		AddBuff( Boss1,507951,0 ,-1 )
		SetPlot( Boss1,"dead","ic_105062_BOSS1xx",0 )
		WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
		AddToPartition(Boss2,RoomID)
		AddBuff( Boss2,507951,0 ,-1 )
		SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
		ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_01]" , 2 )--�q�ݬ�~���Ӥ~�O�u����~����
	end
	while true do
		Boss1open=ReadRoleValue(OwnerID(),EM_RoleValue_register1)---�u���}��
		Boss2open=ReadRoleValue(OwnerID(),EM_RoleValue_register3)---�����}��
		boss1xx=ReadRoleValue(OwnerID(),EM_RoleValue_register4)---�u����
		boss2xx=ReadRoleValue(OwnerID(),EM_RoleValue_register5)---������
		luck1=ReadRoleValue(OwnerID(),EM_RoleValue_register10)---�}���W�U��
		boss19898=ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		boss29898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		--say(OwnerID(),"time1="..time1)
		--say(OwnerID(),"time2="..time2)
		--say(OwnerID(),"time4="..time4)
		--say(OwnerID(),"boss1xx="..boss1xx)
		--say(OwnerID(),"boss2xx="..boss2xx)
		if  boss1xx==1 and time7==0  then---1�������F
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_05]" , 2 )---------------���L���F~�@�r��������~�ϱϧ�~��~~~~
			SetModeEx( Boss2 , EM_SetModeType_Fight, true) ---�i���
			SetModeEx( Boss2 , EM_SetModeType_Strikback, true) ---����
			SetModeEx( Boss2 , EM_SetModeType_Move, true) ---����
			SetModeEx( Boss2 , EM_SetModeType_Searchenemy, true)	---����(�_)
			WriteRoleValue(mob,EM_RoleValue_register9,2)
			time7=1
			time3=1
			--DelObj(Ctrl)
			
		end
		--if boss2xx==1 and time4<=10 and boss1xx==0 then
		--	time4=time4+1
		--end
		--if boss2xx==1 and time4>=10 and boss1xx==0 then---2����1�`�S��
		--	boss29898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)			
		--	if luck1==1 then 
		--		if boss29898==0 then
		--			Boss2=CreateObjByFlag(105065,780794,14,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==1 then
		--			Boss2=CreateObjByFlag(105065,780805,10,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==2 then
		--			Boss2=CreateObjByFlag(105065,780805,11,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==3 then	
		--			Boss2=CreateObjByFlag(105065,780805,12,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==4 then	
		--			Boss2=CreateObjByFlag(105065,780805,24,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl	
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		end
		--	elseif luck1==2 then
		--		if boss29898==0 then
		--			Boss2=CreateObjByFlag(105065,780794,13,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==1 then
		--			Boss2=CreateObjByFlag(105065,780805,7,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==2 then
		--			Boss2=CreateObjByFlag(105065,780805,8,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==3 then
		--			Boss2=CreateObjByFlag(105065,780805,9,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--			time4=0
		--		elseif boss29898==4 then	
		--			Boss2=CreateObjByFlag(105065,780805,21,1)
		--			AddToPartition(Boss2,RoomID)
		--			SetPlot( Boss2,"dead","ic_105062_BOSS2xx",0 )
		--			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl	
		--			WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		----			time4=0
		--		end
		--	end
		--	ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_03]" , 2 )---------------�P�´�����������q
		--	WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
		--	time2=0
		--end	
		if time2<=40  and  boss1xx==0 and boss2xx==1 and time6==0 then---�����Ӧ���
			--say(OwnerID(),"444")
			say(Boss1,"[SC_105062_03]")
			POWERLV=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
			WriteRoleValue(OwnerID(),EM_RoleValue_register7,POWERLV+1)
			POWERLV=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
			time6=1
		end
		if time1>=55 and time5==0 and  boss1xx==0 and boss2xx==0 or time2>=55 and time5==0 and  boss1xx==0 and boss2xx==0 then---����55��S��
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
			WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
			SetModeEx( Boss2 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( Boss2 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( Boss2 , EM_SetModeType_Move, false) ---����
			SetModeEx( Boss2 , EM_SetModeType_Searchenemy, false)	---����(�_)
			CastSpellLV( Boss2 , Boss1 , 496408 ,0)
			
			say(Boss2,"[SC_105062_04]")
			POWERLV=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
			WriteRoleValue(OwnerID(),EM_RoleValue_register7,POWERLV+1)
			POWERLV=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
			--say(OwnerID(),"POWERLV="..POWERLV)
		end
		if time1>=60 and time3==0 and  boss1xx==0 or time2>=60 and time3==0 and  boss1xx==0 then---1��2������l
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss1,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
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
					WriteRoleValue(Boss2,EM_RoleValue_PID,Ctrl)   --�Ȧs�f�U 1 BOSS2=ctrl
					WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
					time4=0
					time1=0
					time2=0	
					time3=0	
					time5=0	
				end
			end	
		ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_01]" , 2 )--�_�I��~�q�ݬ�~���Ӥ~�O�u����~����
		end	
		if hatelistcount(Boss1)~=0 then    		---Ū����H��
			time1=time1+1
			WriteRoleValue(Ctrl,EM_RoleValue_register1,1)
			StopMove(Boss1,false)
			if open1==0 then
				open1=1					--�}���F
				time11=0
				BeginPlot(Boss1 , "ic_105062_BOSS1" , 0)				------�R�O���ⰵ�Ʊ�
			end
		end	
		if hatelistcount(Boss1)==0 and open1==1 and boss1xx==0 or hatelistcount(Boss1)==0 and open1==0 and boss1xx==0 then			--�}�ԫᤳ���S�H
			WriteRoleValue(Ctrl,EM_RoleValue_register1,0)
			open1=0
			if time11==0 then		
				BeginPlot(Boss1 , "ic_105062_BOSS19898" , 0)
				time11=1
			end	
		end	
		if hatelistcount(Boss2)~=0 then    		---Ū����H��
			time2=time2+1
			time6=0
			WriteRoleValue(Ctrl,EM_RoleValue_register3,1)
			StopMove(Boss2,false)
			if open2==0 then
				open2=1					--�}���F
				time22=0
				BeginPlot(Boss2 , "ic_105062_BOSS2" , 0)				------�R�O���ⰵ�Ʊ�	
			end
		end	
		if hatelistcount(Boss2)==0 and open2==1 and boss2xx==0 or hatelistcount(Boss1)==0 and open2==0 and boss2xx==0 then			--�}�ԫᤳ���S�H
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
function ic_105062_BOSS1()    ------��AI
	local time1=0 	----�p�ɾ�1 -�ޯ��
	local time2=0	---- �p�ɾ�-�ޯ�j�ۥ�
	local time3=0 	----�p�ɾ�1 -�ޯ��
	local time10=0	------��t��
	local Luck=0	----�H�����
	local play1x={} ---�H������
	local plays=0   ---�H������
	local plays44=0 ---���i�J�԰��A�]AI 
	AddBuff( OwnerID(),507952,0 ,-1 )
	while 1 do 
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�  
		local BossTarget=AttackTarget
			if time10<=0 then
				time10=time10+1
				CastSpellLV( OwnerID() , OwnerID() ,495953, 1)------��t��ܭ�
				CancelBuff( OwnerID() ,507951 ) ----------------------------�M���L��buff
				SetModeEx( OwnerID() , EM_SetModeType_Move, true)
				sleep(5)
			end
				sleep(10)
				time1=time1+1
				time2=time2+1
				time3=time3+1
			--say(OwnerID(),"time2="..time2)	
			if time2>=13 then------�j�� 20��T�w��---����
				if  hatelistcount(OwnerID())~=0 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
					end			
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_02]" , 2 )---------------�_�I��~�A�̥H���A�̶]�o����?---�j����
					sleep(10)
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
					sleep(5)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------�����ʧ@
					CastSpellLV( OwnerID() , OwnerID() , 496400 , 0 )
					sleep(40)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
					end			
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------����U��
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
				end	
				time2=0
			end
			if time3>=8 then
				if  hatelistcount(OwnerID())~=0 then
					if  hatelistcount(OwnerID())==1 then
						CastSpellLV( OwnerID() , BossTarget , 496403, 6 )
						sleep(10)
					elseif hatelistcount(OwnerID())>=1 then
						play1x=DW_HateRemain(1)-----------------------�H����--�����Z
						plays=DW_Rand(table.getn(play1x))
						CastSpellLV( OwnerID() , play1x[plays] , 496403, 6 )
						sleep(10)
					end
				end	
				time3=0
			end
			if time1>=5 then 
				if  hatelistcount(OwnerID())~=0 then
					Luck=DW_Rand(2)---�H�����o�Ʀr��
					if Luck == 1 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
						end
						CastSpellLV( OwnerID() , BossTarget , 496401, 300 )-----����ޯ�
						sleep(10)
					elseif Luck == 2 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
						end	
						CastSpellLV( OwnerID() , OwnerID() , 496402, 1)-----�ۨ��d��
						sleep(10)		    
					end
				end	
				time1=0
			end	
		sleep(10)
	end
end
function ic_105062_BOSS2()    ------��AI
	local time1=0 	----�p�ɾ�1 -�ޯ��
	local time2=0	---- �p�ɾ�-�ޯ�j�ۥ�
	local time3=0 	----�p�ɾ�1 -�ޯ��
	local time10=0	------��t��
	local Luck=0	----�H�����
	local play1x={} ---�H������
	local plays=0   ---�H������
	local plays44=0 ---���i�J�԰��A�]AI 
	AddBuff( OwnerID(),507952,0 ,-1 )
	while 1 do 	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ ��M�ثe�������ؼ�  
		local BossTarget=AttackTarget
			if time10<=0 then
				time10=time10+1
				CastSpellLV( OwnerID() , OwnerID() ,495953, 1)------��t��ܭ�
				CancelBuff( OwnerID() ,507951 ) ----------------------------�M���L��buff
				SetModeEx( OwnerID() , EM_SetModeType_Move, true)
				sleep(5)
			end
				sleep(10)
				time1=time1+1
				time2=time2+1
				time3=time3+1
			--say(OwnerID(),"time2="..time2)		
			if time2>=13 then------�j�� 20��T�w��---����
				if  hatelistcount(OwnerID())~=0 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
					end			
					ScriptMessage( OwnerID(), -1 , 2 , "[SC_105062_02]" , 2 )---------------�_�I��~�A�̥H���A�̶]�o����?---�j����
					sleep(10)
					PlayMotion ( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_BEGIN	 )---------------��1�|�ʧ@
					SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
					sleep(5)
					SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP	)-----------------------�����ʧ@
					CastSpellLV( OwnerID() , OwnerID() , 496400 , 0 )
					sleep(40)
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
					end			
					PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END )---------------------����U��
					SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---�i���
					SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---����	
					SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------�O���a�U�Ҧ�
				end	
				time2=0
			end
			if time3>=8 then
				if  hatelistcount(OwnerID())~=0 then
					if  hatelistcount(OwnerID())==1 then
					CastSpellLV( OwnerID() , BossTarget , 496403, 6 )
					sleep(10)
					
					elseif hatelistcount(OwnerID())>=1 then
					play1x=DW_HateRemain(1)-----------------------�H����--�����Z
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV( OwnerID() , play1x[plays] , 496403, 6 )
					sleep(10)
					end
				end	
				time3=0
			end
			if time1>=5 then 
				if  hatelistcount(OwnerID())~=0 then	
					Luck=DW_Rand(2)---�H�����o�Ʀr��
					if Luck == 1 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
							sleep(5)
						end
						CastSpellLV( OwnerID() , BossTarget , 496401, 300 )-----����ޯ�
						sleep(10)
					elseif Luck == 2 then
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------���S�����b�I��ޯ�
						sleep(5)
						end	
						CastSpellLV( OwnerID() , OwnerID() , 496402, 1)-----�ۨ��d��
						sleep(10)		    
					end
				end	
				time1=0
			end	
		sleep(10)
	end
end