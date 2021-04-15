function ic_Flora_01 ()																		---ZONE1(有水的地方)(旗標OK)120312
local mob1=OwnerID()----/gm ? createflag 781083 
local RoomID=ReadRoleValue(mob1,EM_RoleValue_RoomID)
local mob9898
local mob123
local mobGOGO
local time1=0
local time2=0
local time3=0
local Luck=0
local mob9999
MoveToFlagEnabled(mob1, false )
Luck=DW_Rand(3)
AddBuff(mob1,621957,0 ,-1 )
SetPosByFlag( mob1 , 781083 , 100+Luck*10 )
WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
WriteRoleValue(mob1,EM_RoleValue_register1,1)
WriteRoleValue(mob1,EM_RoleValue_register3,0)
	while true do
		sleep(10)
		mob9999=ReadRoleValue(mob1,EM_RoleValue_register9)
		time1=time1+1
		if time1>=250 or mob9999==1 then
			Luck=DW_Rand(3)
			AddBuff(mob1,621957,0 ,-1 )
			SetPosByFlag( mob1 , 781083 , 100+Luck*10 )
			WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
			WriteRoleValue(mob1,EM_RoleValue_register1,1)
			WriteRoleValue(mob1,EM_RoleValue_register3,0)
			WriteRoleValue(mob1,EM_RoleValue_register9,0)
			time1=0
			time2=0
			time3=0
		end
		mob9898=ReadRoleValue(mob1,EM_RoleValue_register1)
		if mob9898==1 then
			time2=time2+1
			if time2>20 then
				mob123=ReadRoleValue(mob1,EM_RoleValue_register2)
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				--say(mob1,"mobGOGO="..mobGOGO)
				if time3==0 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)	
				elseif time3==1 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
					mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
					if mobGOGO<0 then
						time3=0
						WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)
					end
				end	
				if mob123==1 then
					DW_MoveToFlag(mob1, 781083 ,111+mobGOGO,0)
				elseif mob123==2  then
					DW_MoveToFlag(mob1, 781083 ,121+mobGOGO,0)
				elseif mob123==3  then
					DW_MoveToFlag(mob1, 781083 ,131+mobGOGO,0)
				end
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				if mobGOGO==1 then
					npcsay(mob1,"[SC_VALENTINE_IC_02]")
				elseif	mobGOGO==2 then
					npcsay(mob1,"[SC_VALENTINE_IC_03]")
				elseif	mobGOGO==3 then					
					npcsay(mob1,"[SC_VALENTINE_IC_04]")
				elseif	mobGOGO==4 then	
					npcsay(mob1,"[SC_VALENTINE_IC_05]")
				elseif	mobGOGO==5 then		
					time3=1
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
				end	
				time2=0
			end	
		end
	end
end
--------------------------------------------------------------------------------------------
function ic_Flora_02 ()																		---ZONE2 (傳送師可以傳到地方)(旗標OK)120313
local mob1=OwnerID()----/gm ? createflag 781083 
local mob9898
local mob123
local mobGOGO
local time1=0
local time2=0
local time3=0
local Luck=0
local mob9999
MoveToFlagEnabled(mob1, false )
Luck=DW_Rand(5)
AddBuff(mob1,621957,0 ,-1 )
SetPosByFlag( mob1 , 781083 , 200+Luck*10 )
WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
WriteRoleValue(mob1,EM_RoleValue_register1,1)
WriteRoleValue(mob1,EM_RoleValue_register3,0)
	while true do
		sleep(10)
		mob9999=ReadRoleValue(mob1,EM_RoleValue_register9)
		time1=time1+1
		if time1>=250 or mob9999==1 then
			Luck=DW_Rand(5)
			AddBuff(mob1,621957,0 ,-1 )
			SetPosByFlag( mob1 , 781083 , 200+Luck*10 )
			WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
			WriteRoleValue(mob1,EM_RoleValue_register1,1)
			WriteRoleValue(mob1,EM_RoleValue_register3,0)
			WriteRoleValue(mob1,EM_RoleValue_register9,0)
			time1=0
			time2=0
			time3=0
		end
		mob9898=ReadRoleValue(mob1,EM_RoleValue_register1)
		if mob9898==1 then
			time2=time2+1
			if time2>20 then
				mob123=ReadRoleValue(mob1,EM_RoleValue_register2)
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				--say(mob1,"mobGOGO="..mobGOGO)
				if time3==0 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)	
				elseif time3==1 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
					mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
					if mobGOGO<0 then
						time3=0
						WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)
					end
				end	
				if mob123==1 then
					DW_MoveToFlag(mob1, 781083 ,211+mobGOGO,0)
				elseif mob123==2  then
					DW_MoveToFlag(mob1, 781083 ,221+mobGOGO,0)
				elseif mob123==3  then
					DW_MoveToFlag(mob1, 781083 ,231+mobGOGO,0)
				elseif mob123==4 then
					DW_MoveToFlag(mob1, 781083 ,241+mobGOGO,0)
				elseif mob123==5  then
					DW_MoveToFlag(mob1, 781083 ,251+mobGOGO,0)	
				end
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				if mobGOGO==1 then
					npcsay(mob1,"[SC_VALENTINE_IC_02]")
				elseif	mobGOGO==2 then
					npcsay(mob1,"[SC_VALENTINE_IC_03]")
				elseif	mobGOGO==3 then					
					npcsay(mob1,"[SC_VALENTINE_IC_04]")
				elseif	mobGOGO==4 then	
					npcsay(mob1,"[SC_VALENTINE_IC_05]")
				elseif	mobGOGO==5 then		
					time3=1
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
				end	
				time2=0
			end	
		end
	end
end
--------------------------------------------------------------------------------------------
function ic_Flora_03 ()																		---ZONE6(8區域)(旗標OK)120314
local mob1=OwnerID()----/gm ? createflag 781083 
local mob9898
local mob123
local mobGOGO
local time1=0
local time2=0
local time3=0
local Luck=0
local mob9999
MoveToFlagEnabled(mob1, false )
Luck=DW_Rand(8)
AddBuff(mob1,621957,0 ,-1 )
SetPosByFlag( mob1 , 781083 , 300+Luck*10 )
WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
WriteRoleValue(mob1,EM_RoleValue_register1,1)
WriteRoleValue(mob1,EM_RoleValue_register3,0)
	while true do
		sleep(10)
		mob9999=ReadRoleValue(mob1,EM_RoleValue_register9)
		time1=time1+1
		if time1>=250 or mob9999==1 then
			Luck=DW_Rand(8)
			AddBuff(mob1,621957,0 ,-1 )
			SetPosByFlag( mob1 , 781083 , 300+Luck*10 )
			WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
			WriteRoleValue(mob1,EM_RoleValue_register1,1)
			WriteRoleValue(mob1,EM_RoleValue_register3,0)
			WriteRoleValue(mob1,EM_RoleValue_register9,0)
			time1=0
			time2=0
			time3=0
		end
		mob9898=ReadRoleValue(mob1,EM_RoleValue_register1)
		if mob9898==1 then
			time2=time2+1
			if time2>20 then
				mob123=ReadRoleValue(mob1,EM_RoleValue_register2)
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				--say(mob1,"mobGOGO="..mobGOGO)
				if time3==0 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)	
				elseif time3==1 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
					mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
					if mobGOGO<0 then
						time3=0
						WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)
					end
				end	
				if mob123==1 then
					DW_MoveToFlag(mob1, 781083 ,311+mobGOGO,0)
				elseif mob123==2  then
					DW_MoveToFlag(mob1, 781083 ,321+mobGOGO,0)
				elseif mob123==3  then
					DW_MoveToFlag(mob1, 781083 ,331+mobGOGO,0)
				elseif mob123==4 then
					DW_MoveToFlag(mob1, 781083 ,341+mobGOGO,0)
				elseif mob123==5  then
					DW_MoveToFlag(mob1, 781083 ,351+mobGOGO,0)	
				elseif mob123==6  then
					DW_MoveToFlag(mob1, 781083 ,361+mobGOGO,0)	
				elseif mob123==7  then
					DW_MoveToFlag(mob1, 781083 ,371+mobGOGO,0)	
				elseif mob123==8  then
					DW_MoveToFlag(mob1, 781083 ,381+mobGOGO,0)			
				end
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				if mobGOGO==1 then
					npcsay(mob1,"[SC_VALENTINE_IC_02]")
				elseif	mobGOGO==2 then
					npcsay(mob1,"[SC_VALENTINE_IC_03]")
				elseif	mobGOGO==3 then					
					npcsay(mob1,"[SC_VALENTINE_IC_04]")
				elseif	mobGOGO==4 then	
					npcsay(mob1,"[SC_VALENTINE_IC_05]")
				elseif	mobGOGO==5 then		
					time3=1
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
				end	
				time2=0
			end	
		end
	end
end
--------------------------------------------------------------------------------------------
function ic_Flora_04 ()																		---ZONE15(6個村落)(旗標OK)120315
local mob1=OwnerID()----/gm ? createflag 781083 
local mob9898
local mob123
local mobGOGO
local time1=0
local time2=0
local time3=0
local Luck=0
local mob9999
MoveToFlagEnabled(mob1, false )
Luck=DW_Rand(6)
AddBuff(mob1,621957,0 ,-1 )
SetPosByFlag( mob1 , 781083 , 400+Luck*10 )
WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
WriteRoleValue(mob1,EM_RoleValue_register1,1)
WriteRoleValue(mob1,EM_RoleValue_register3,0)
	while true do
		sleep(10)
		mob9999=ReadRoleValue(mob1,EM_RoleValue_register9)
		time1=time1+1
		if time1>=250 or mob9999==1 then
			Luck=DW_Rand(6)
			AddBuff(mob1,621957,0 ,-1 )
			SetPosByFlag( mob1 , 781083 , 400+Luck*10 )
			WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
			WriteRoleValue(mob1,EM_RoleValue_register1,1)
			WriteRoleValue(mob1,EM_RoleValue_register3,0)
			WriteRoleValue(mob1,EM_RoleValue_register9,0)
			time1=0
			time2=0
			time3=0
		end
		mob9898=ReadRoleValue(mob1,EM_RoleValue_register1)
		if mob9898==1 then
			time2=time2+1
			if time2>20 then
				mob123=ReadRoleValue(mob1,EM_RoleValue_register2)
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				--say(mob1,"mobGOGO="..mobGOGO)
				if time3==0 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)	
				elseif time3==1 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
					mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
					if mobGOGO<0 then
						time3=0
						WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)
					end
				end	
				if mob123==1 then
					DW_MoveToFlag(mob1, 781083 ,411+mobGOGO,0)
				elseif mob123==2  then
					DW_MoveToFlag(mob1, 781083 ,421+mobGOGO,0)
				elseif mob123==3  then
					DW_MoveToFlag(mob1, 781083 ,431+mobGOGO,0)
				elseif mob123==4 then
					DW_MoveToFlag(mob1, 781083 ,441+mobGOGO,0)
				elseif mob123==5  then
					DW_MoveToFlag(mob1, 781083 ,451+mobGOGO,0)	
				elseif mob123==6  then
					DW_MoveToFlag(mob1, 781083 ,461+mobGOGO,0)		
				end
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				if mobGOGO==1 then
					npcsay(mob1,"[SC_VALENTINE_IC_02]")
				elseif	mobGOGO==2 then
					npcsay(mob1,"[SC_VALENTINE_IC_03]")
				elseif	mobGOGO==3 then					
					npcsay(mob1,"[SC_VALENTINE_IC_04]")
				elseif	mobGOGO==4 then	
					npcsay(mob1,"[SC_VALENTINE_IC_05]")
				elseif	mobGOGO==5 then		
					time3=1
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
				end	
				time2=0
			end	
		end
	end
end
--------------------------------------------------------------------------------------------
function ic_Flora_05 ()																		---ZONE21 (主城海邊)(旗標OK)120316  ---? gotoorgid 120316
local mob1=OwnerID()----/gm ? createflag 781083 
local mob9898
local mob123
local mobGOGO
local time1=0
local time2=0
local time3=0
local Luck=0
local mob9999
MoveToFlagEnabled(mob1, false )
Luck=DW_Rand(4)
AddBuff(mob1,621957,0 ,-1 )
SetPosByFlag( mob1 , 781083 , 500+Luck*10 )
WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
WriteRoleValue(mob1,EM_RoleValue_register1,1)
WriteRoleValue(mob1,EM_RoleValue_register3,0)
	while true do
		sleep(10)
		mob9999=ReadRoleValue(mob1,EM_RoleValue_register9)
		time1=time1+1
		if time1>=300 or mob9999==1 then
			Luck=DW_Rand(4)
			AddBuff(mob1,621957,0 ,-1 )
			SetPosByFlag( mob1 , 781083 , 500+Luck*10 )
			WriteRoleValue(mob1,EM_RoleValue_register2,Luck)
			WriteRoleValue(mob1,EM_RoleValue_register1,1)
			WriteRoleValue(mob1,EM_RoleValue_register3,0)
			WriteRoleValue(mob1,EM_RoleValue_register9,0)
			time1=0
			time2=0
			time3=0
		end
		mob9898=ReadRoleValue(mob1,EM_RoleValue_register1)
		if mob9898==1 then
			time2=time2+1
			if time2>20 then
				mob123=ReadRoleValue(mob1,EM_RoleValue_register2)
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				--say(mob1,"mobGOGO="..mobGOGO)
				WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)	
				if mobGOGO==1 then
					npcsay(mob1,"[SC_VALENTINE_IC_07]")
				elseif	mobGOGO==2 then
					npcsay(mob1,"[SC_VALENTINE_IC_08]")
				elseif	mobGOGO==3 then					
					npcsay(mob1,"[SC_VALENTINE_IC_09]")
				elseif	mobGOGO==4 then	
					npcsay(mob1,"[SC_VALENTINE_IC_10]")	
					WriteRoleValue(mob1,EM_RoleValue_register3,1)
				end	
				time2=0
			end	
		end
	end
end
--------------------------------------------------------------------------------------------
function ic_Flora_06_0()----120317
local mob1=OwnerID()----/gm ? createflag 781083   
local Luck=0
	AddBuff(mob1,621957,0 ,-1 )
	Luck=DW_Rand(4)
	--say(mob1,"Luck="..Luck)
	SetModeEx(mob1,EM_SetModeType_Show, false) 
	if Luck==1  then--21
		SetWorldVar( "SC_VALENTINE_IC_30",21)	
		ZonePCall(21,"ic_Flora_06_21")
		sleep(20)
		DelObj(mob1)
	elseif Luck==2  then--15
		SetWorldVar( "SC_VALENTINE_IC_30",15)
		ZonePCall(15,"ic_Flora_06_15")
		sleep(20)
		DelObj(mob1)
	elseif Luck==3  then--6
		SetWorldVar( "SC_VALENTINE_IC_30",6)
		ZonePCall(6,"ic_Flora_06_06")
		sleep(20)
		DelObj(mob1)
	elseif Luck==4  then--2
		SetWorldVar( "SC_VALENTINE_IC_30",2)
		ZonePCall(2,"ic_Flora_06_02")
		sleep(20)
		DelObj(mob1)
	end
end
function ic_Flora_06_21 ()
local Mob
local Luck=0
	Luck=DW_Rand(2)
	if Luck==1 then
		Mob=CreateObjByFlag(120317,781083,610,1)
		AddToPartition( Mob,0)
		WriteRoleValue(Mob,EM_RoleValue_PID,1)
		SetModeEx(Mob,EM_SetModeType_HideName, true)
		BeginPlot(Mob, "ic_Flora_06_1" , 0)
		AddBuff(Mob,621956,0 ,-1 )
	elseif Luck==2 then
		Mob=CreateObjByFlag(120317,781083,650,1)
		AddToPartition( Mob,0)
		WriteRoleValue(Mob,EM_RoleValue_PID,5)
		SetModeEx(Mob,EM_SetModeType_HideName, true)
		BeginPlot(Mob, "ic_Flora_06_1" , 0)
		AddBuff(Mob,621953,0 ,-1 )
	end
end
function ic_Flora_06_15 ()
local Mob
local Luck=0
	Luck=DW_Rand(2)
	if Luck==1 then
		Mob=CreateObjByFlag(120317,781083,620,1)
		AddToPartition( Mob,0)
		WriteRoleValue(Mob,EM_RoleValue_PID,2)
		SetModeEx(Mob,EM_SetModeType_HideName, true)
		BeginPlot(Mob, "ic_Flora_06_1" , 0)
		AddBuff(Mob,621947,0 ,-1 )
	elseif Luck==2 then
		Mob=CreateObjByFlag(120317,781083,660,1)
		AddToPartition( Mob,0)
		WriteRoleValue(Mob,EM_RoleValue_PID,6)
		SetModeEx(Mob,EM_SetModeType_HideName, true)
		BeginPlot(Mob, "ic_Flora_06_1" , 0)
		AddBuff(Mob,621947,0 ,-1 )
	end
end
function ic_Flora_06_06 ()
local Mob
local Luck=0
	Luck=DW_Rand(2)
	if Luck==1 then
		Mob=CreateObjByFlag(120317,781083,630,1)
		AddToPartition( Mob,0)
		WriteRoleValue(Mob,EM_RoleValue_PID,3)
		SetModeEx(Mob,EM_SetModeType_HideName, true)
		BeginPlot(Mob, "ic_Flora_06_1" , 0)
		AddBuff(Mob,621955,0 ,-1 )
	elseif Luck==2 then
		Mob=CreateObjByFlag(120317,781083,670,1)
		AddToPartition( Mob,0)
		WriteRoleValue(Mob,EM_RoleValue_PID,7)
		SetModeEx(Mob,EM_SetModeType_HideName, true)
		BeginPlot(Mob, "ic_Flora_06_1" , 0)
		AddBuff(Mob,621955,0 ,-1 )
	end
end
function ic_Flora_06_02 ()
local Mob
local Luck=0
	Luck=DW_Rand(2)
	if Luck==1 then
		Mob=CreateObjByFlag(120317,781083,640,1)
		AddToPartition( Mob,0)
		WriteRoleValue(Mob,EM_RoleValue_PID,4)
		SetModeEx(Mob,EM_SetModeType_HideName, true)
		BeginPlot(Mob, "ic_Flora_06_1" , 0)
		AddBuff(Mob,621954,0 ,-1 )	
	elseif Luck==2 then
		Mob=CreateObjByFlag(120317,781083,680,1)
		AddToPartition( Mob,0)
		WriteRoleValue(Mob,EM_RoleValue_PID,8)
		SetModeEx(Mob,EM_SetModeType_HideName, true)
		BeginPlot(Mob, "ic_Flora_06_1" , 0)
		AddBuff(Mob,621954,0 ,-1 )	
	end
end
function ic_Flora_06_1 ()																		---ZONE4大警備隊(凡成*2~黑曜*2~達拉尼斯*2~雷拉夫*2)120317
local mob1=OwnerID()----/gm ? createflag 781083
local mob2
local mob9898
local mob123
local mobGOGO
local time1=0
local time2=0
local time3=0
local Luck=0
local mob9999
MoveToFlagEnabled(mob1,false)
WriteRoleValue(mob1,EM_RoleValue_register1,1)
WriteRoleValue(mob1,EM_RoleValue_register3,0)
	while true do
		sleep(10)
		mob9999=ReadRoleValue(mob1,EM_RoleValue_register9)
		time1=time1+1
		if time1>=250 or mob9999==1  then
			ic_Flora_06_0()
		end
		mob9898=ReadRoleValue(mob1,EM_RoleValue_register1)
		if mob9898==1 then
			time2=time2+1
			if time2>20 then
				mob123=ReadRoleValue(mob1,EM_RoleValue_PID)
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				--say(mob1,"mobGOGO="..mobGOGO)
				if time3==0 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)	
				elseif time3==1 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
					mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
					if mobGOGO<0 then
						time3=0
						WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)
					end
				end	
				if mob123==1 then
					DW_MoveToFlag(mob1, 781083 ,611+mobGOGO,0)
				elseif mob123==2  then
					DW_MoveToFlag(mob1, 781083 ,621+mobGOGO,0)
				elseif mob123==3  then
					DW_MoveToFlag(mob1, 781083 ,631+mobGOGO,0)
				elseif mob123==4 then
					DW_MoveToFlag(mob1, 781083 ,641+mobGOGO,0)
				elseif mob123==5  then
					DW_MoveToFlag(mob1, 781083 ,651+mobGOGO,0)	
				elseif mob123==6  then
					DW_MoveToFlag(mob1, 781083 ,661+mobGOGO,0)	
				elseif mob123==7  then
					DW_MoveToFlag(mob1, 781083 ,671+mobGOGO,0)	
				elseif mob123==8  then
					DW_MoveToFlag(mob1, 781083 ,681+mobGOGO,0)			
				end
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				if	mobGOGO==5 then	
					time3=1
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
				end
				time2=0
			end	
		end
	end
end
--------------------------------------------------------------------------------------------
function ic_Flora_07_0 ()----120318
local mob1=OwnerID()----/gm ? createflag 781083   
local Luck=0
	AddBuff(mob1,621957,0 ,-1 )
	Luck=DW_Rand(7)
	--say(mob1,"Luck="..Luck)
	SetModeEx(mob1,EM_SetModeType_Show, false) 
	if Luck==1  then
		ZonePCall(15,"ic_Flora_07_151")
		SetWorldVar( "SC_VALENTINE_IC_31",15)
		sleep(20)
		DelObj(mob1)
	elseif Luck==2  then
		ZonePCall(15,"ic_Flora_07_152")
		SetWorldVar( "SC_VALENTINE_IC_31",15)
		sleep(20)
		DelObj(mob1)
	elseif Luck==3  then
		ZonePCall(16,"ic_Flora_07_16")
		SetWorldVar( "SC_VALENTINE_IC_31",16)
		sleep(20)
		DelObj(mob1)
	elseif Luck==4  then
		ZonePCall(17,"ic_Flora_07_17")
		SetWorldVar( "SC_VALENTINE_IC_31",17)
		sleep(20)
		sleep(20)
		DelObj(mob1)
	elseif Luck==5  then
		ZonePCall(18,"ic_Flora_07_18")
		SetWorldVar( "SC_VALENTINE_IC_31",18)
		sleep(20)
		DelObj(mob1)
	elseif Luck==6  then
		ZonePCall(20,"ic_Flora_07_20")
		SetWorldVar( "SC_VALENTINE_IC_31",20)
		sleep(20)
		DelObj(mob1)
	elseif Luck==7  then
		ZonePCall(21,"ic_Flora_07_21")
		SetWorldVar( "SC_VALENTINE_IC_31",21)
		sleep(20)
		DelObj(mob1)	
	end
end
function ic_Flora_07_151 ()
local Mob
	Mob=CreateObjByFlag(120318,781083,710,1)
	AddToPartition( Mob,0)
	WriteRoleValue(Mob,EM_RoleValue_PID,1)
	SetModeEx(Mob,EM_SetModeType_HideName, true)
	BeginPlot(Mob, "ic_Flora_07_1" , 0)
	AddBuff(Mob,621947,0 ,-1 )
end
function ic_Flora_07_152 ()
local Mob
	Mob=CreateObjByFlag(120318,781083,720,1)
	AddToPartition( Mob,0)
	WriteRoleValue(Mob,EM_RoleValue_PID,2)
	SetModeEx(Mob,EM_SetModeType_HideName, true)
	BeginPlot(Mob, "ic_Flora_07_1" , 0)
	AddBuff(Mob,621948,0 ,-1 )
end
function ic_Flora_07_16 ()
local Mob
	Mob=CreateObjByFlag(120318,781083,730,1)
	AddToPartition( Mob,0)
	WriteRoleValue(Mob,EM_RoleValue_PID,3)
	SetModeEx(Mob,EM_SetModeType_HideName, true)
	BeginPlot(Mob, "ic_Flora_07_1" , 0)
	AddBuff(Mob,621949,0 ,-1 )
end
function ic_Flora_07_17 ()
local Mob
	Mob=CreateObjByFlag(120318,781083,740,1)
	AddToPartition( Mob,0)
	WriteRoleValue(Mob,EM_RoleValue_PID,4)
	SetModeEx(Mob,EM_SetModeType_HideName, true)
	BeginPlot(Mob, "ic_Flora_07_1" , 0)
	AddBuff(Mob,621950,0 ,-1 )
end
function ic_Flora_07_18 ()
local Mob
	Mob=CreateObjByFlag(120318,781083,750,1)
	AddToPartition( Mob,0)
	WriteRoleValue(Mob,EM_RoleValue_PID,5)
	SetModeEx(Mob,EM_SetModeType_HideName, true)
	BeginPlot(Mob, "ic_Flora_07_1" , 0)
	AddBuff(Mob,621951,0 ,-1 )
end
function ic_Flora_07_20 ()
local Mob
	Mob=CreateObjByFlag(120318,781083,760,1)
	AddToPartition( Mob,0)
	WriteRoleValue(Mob,EM_RoleValue_PID,6)
	SetModeEx(Mob,EM_SetModeType_HideName, true)
	BeginPlot(Mob, "ic_Flora_07_1" , 0)
	AddBuff(Mob,621952,0 ,-1 )
end
function ic_Flora_07_21 ()
local Mob
	Mob=CreateObjByFlag(120318,781083,770,1)
	AddToPartition( Mob,0)
	WriteRoleValue(Mob,EM_RoleValue_PID,7)
	SetModeEx(Mob,EM_SetModeType_HideName, true)
	BeginPlot(Mob, "ic_Flora_07_1" , 0)
	AddBuff(Mob,621953,0 ,-1 )
end			
function ic_Flora_07_1 ()																	---7大領主(達拉尼斯~艾翁~夏多爾~安格爾~萊慕恩~喀洛恩~雷奇夫)120318
local mob1=OwnerID()----/gm ? createflag 781083 
local mob9898
local mob123
local mobGOGO
local time1=0
local time2=0
local time3=0
local Luck=0
local mob9999
MoveToFlagEnabled(mob1, false )
WriteRoleValue(mob1,EM_RoleValue_register1,1)
WriteRoleValue(mob1,EM_RoleValue_register3,0)
	while true do
		sleep(10)
		mob9999=ReadRoleValue(mob1,EM_RoleValue_register9)
		time1=time1+1
		if time1>=250 or mob9999==1 then
			ic_Flora_07_0()
		end
		mob9898=ReadRoleValue(mob1,EM_RoleValue_register1)
		if mob9898==1 then
			time2=time2+1
			if time2>20 then
				mob123=ReadRoleValue(mob1,EM_RoleValue_PID)
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				--say(mob1,"mobGOGO="..mobGOGO)
				if time3==0 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)	
				elseif time3==1 then
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
					mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
					if mobGOGO<0 then
						time3=0
						WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO+1)
					end
				end	
				if mob123==1 then
					DW_MoveToFlag(mob1, 781083 ,711+mobGOGO,0)
				elseif mob123==2  then
					DW_MoveToFlag(mob1, 781083 ,721+mobGOGO,0)
				elseif mob123==3  then
					DW_MoveToFlag(mob1, 781083 ,731+mobGOGO,0)
				elseif mob123==4 then
					DW_MoveToFlag(mob1, 781083 ,741+mobGOGO,0)
				elseif mob123==5  then
					DW_MoveToFlag(mob1, 781083 ,751+mobGOGO,0)	
				elseif mob123==6  then
					DW_MoveToFlag(mob1, 781083 ,761+mobGOGO,0)	
				elseif mob123==7  then
					DW_MoveToFlag(mob1, 781083 ,771+mobGOGO,0)			
				end
				mobGOGO=ReadRoleValue(mob1,EM_RoleValue_register3)
				if	mobGOGO==5 then	
					time3=1
					WriteRoleValue(mob1,EM_RoleValue_register3,mobGOGO-1)
				end
				time2=0
			end	
		end
	end
end
--------------------------------------------------------------------------------------------
function ic_Flora_08_0()----120323
local mob1=OwnerID()----/gm ? createflag 781083   
local Luck=0
	AddBuff(mob1,621957,0 ,-1 )
	Luck=DW_Rand(10)
	--say(mob1,"Luck="..Luck)
	SetModeEx(mob1,EM_SetModeType_Show, false) 
	if Luck==1  then
		ZonePCall(4,"ic_Flora_08_4")
		SetWorldVar( "SC_VALENTINE_IC_32",4)
		sleep(20)
		DelObj(mob1)
	elseif Luck==2  then
		ZonePCall(3,"ic_Flora_08_3")
		SetWorldVar( "SC_VALENTINE_IC_32",3)
		sleep(20)
		DelObj(mob1)
	elseif Luck==3  then
		ZonePCall(7,"ic_Flora_08_7")
		SetWorldVar( "SC_VALENTINE_IC_32",7)
		sleep(20)
		DelObj(mob1)
	elseif Luck==4  then
		ZonePCall(9,"ic_Flora_08_9")
		SetWorldVar( "SC_VALENTINE_IC_32",9)
		sleep(20)
		sleep(20)
		DelObj(mob1)
	elseif Luck==5  then
		ZonePCall(11,"ic_Flora_08_11")
		SetWorldVar( "SC_VALENTINE_IC_32",11)
		sleep(20)
		DelObj(mob1)
	elseif Luck==6  then
		ZonePCall(15,"ic_Flora_08_15")
		SetWorldVar( "SC_VALENTINE_IC_32",15)
		sleep(20)
		DelObj(mob1)
	elseif Luck==7  then
		ZonePCall(17,"ic_Flora_08_17")
		SetWorldVar( "SC_VALENTINE_IC_32",17)
		sleep(20)
		DelObj(mob1)	
	elseif Luck==8  then
		ZonePCall(18,"ic_Flora_08_18")
		SetWorldVar( "SC_VALENTINE_IC_32",18)
		sleep(20)
		DelObj(mob1)
	elseif Luck==9  then
		ZonePCall(19,"ic_Flora_08_19")
		SetWorldVar( "SC_VALENTINE_IC_32",19)
		sleep(20)
		DelObj(mob1)
	elseif Luck==10  then
		ZonePCall(20,"ic_Flora_08_20") 
		SetWorldVar( "SC_VALENTINE_IC_32",20)
		sleep(20)
		DelObj(mob1)	
	end
end
function ic_Flora_08_4 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,810,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_3 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,820,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_7 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,830,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_9 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,840,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_11 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,850,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_15 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,860,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_17 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,870,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_18 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,880,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_19 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,890,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_20 ()
local Mob
	Mob=CreateObjByFlag(120323,781083,900,1)
	AddToPartition( Mob,0)
	BeginPlot(Mob, "ic_Flora_08_1" , 0)
end
function ic_Flora_08_1 ()																		---副本入口(藏寶秘窟~太初之所~海音之心~蛇人魔都~獨眼巢城~7英雄之墓~薩多爾堡~佩謝神殿~卡沃克之墓~格拉夫古堡)120323
local mob1=OwnerID()----/gm ? createflag 781083 
local mob9898
local mob123
local mobGOGO
local time1=0
local time2=0
local time3=0
local Luck=0
local mob9999
MoveToFlagEnabled(mob1, false )
WriteRoleValue(mob1,EM_RoleValue_register1,1)
WriteRoleValue(mob1,EM_RoleValue_register3,0)
	while true do
		sleep(10)
		mob9999=ReadRoleValue(mob1,EM_RoleValue_register9)
		time1=time1+1
		if time1>=300 or mob9999==1 then
			ic_Flora_08_0()
		end
	end
end
--------------------------------------------------------------------------------------------
function ic_Flora_npc_1()								
	local own = OwnerID()
	local tar = TargetID()
	if CheckScriptFlag(own, 546179 ) ==true  then
		if ReadRoleValue(tar,EM_RoleValue_OrgID) ==120311 then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_20]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120312 	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_22]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120313	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_23]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120314	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_24]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120315	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_25]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120316	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_26]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120317	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_27]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120318	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_27]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120323	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_28]")
		end
	end
	if  CheckScriptFlag(own, 546170 ) ==false then
		if	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120311	then	---團長
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_21]")
			AddSpeakOption(own,tar,"[SC_VALENTINE_IC_01]","ic_Flora_npc_2",0)
			AddSpeakOption(own,tar,"[SC_VALENTINE_IC_17]","ic_Flora_npc_4",0)
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120311 then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_20]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120312 	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_22]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120313	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_23]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120314	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_24]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120315	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_25]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120316	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_26]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120317	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_27]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120318	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_27]")
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120323	then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_28]")
		end
	elseif	CheckScriptFlag(own, 546170 ) ==true and CheckScriptFlag(own, 546179 ) ==false then
		if	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120311 then
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_21]")
			if CheckScriptFlag(own, 546179 ) ==false	then 	---團長
				AddSpeakOption(own,tar,"[SC_VALENTINE_IC_06]","ic_Flora_npc_3",0)
				AddSpeakOption(own,tar,"[SC_VALENTINE_IC_17]","ic_Flora_npc_4",0)
			end	
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120312 then 
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_22]")
			if CheckScriptFlag(own, 546171 ) ==false	then	---1號
				AddSpeakOption(own,tar,"[SC_VALENTINE_IC_15]","ic_Flora_npc_2",0)
			end	
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120313 then 
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_23]")
			if CheckScriptFlag(own, 546172 ) ==false	then	---2號
			AddSpeakOption(own,tar,"[SC_VALENTINE_IC_15]","ic_Flora_npc_2",0)
			end
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120314	then 
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_24]")
			if CheckScriptFlag(own, 546173 ) ==false	then	---3號
			AddSpeakOption(own,tar,"[SC_VALENTINE_IC_15]","ic_Flora_npc_2",0)
			end
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120315	then 
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_25]")
			if CheckScriptFlag(own, 546174 ) ==false	then	---4號
			AddSpeakOption(own,tar,"[SC_VALENTINE_IC_15]","ic_Flora_npc_2",0)
			end
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120316	then 
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_26]")
			if CheckScriptFlag(own, 546175 ) ==false	then	---5號
			AddSpeakOption(own,tar,"[SC_VALENTINE_IC_15]","ic_Flora_npc_2",0)
			end
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120317	then 
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_27]")
			if CheckScriptFlag(own, 546176 ) ==false	then	---6號
			AddSpeakOption(own,tar,"[SC_VALENTINE_IC_15]","ic_Flora_npc_2",0)
			end
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120318	then 
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_27]")
			if CheckScriptFlag(own, 546177 ) ==false	then	---7號
			AddSpeakOption(own,tar,"[SC_VALENTINE_IC_15]","ic_Flora_npc_2",0)
			end
		elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120323	then 
			SetSpeakDetail(OwnerID(),"[SC_VALENTINE_IC_28]")
			if CheckScriptFlag(own, 546178 ) ==false	then	---8號
			AddSpeakOption(own,tar,"[SC_VALENTINE_IC_15]","ic_Flora_npc_2",0)
			end
		end	
	end
end	
function ic_Flora_npc_2()	  							
	local own = OwnerID()
	local tar = TargetID()
	local buff1l3
	local buff1l4
	local buff1l3LV
	local buff1l4LV
	local buff1lv1
	local buff1lv2
	local play123
	play123=GetPartyID(own, -1 )
	--say(own,"play123="..play123)
	if		ReadRoleValue(tar,EM_RoleValue_OrgID) ==120311	then	---團長
		buff1lv1=ReadRoleValue(own, EM_LuaValueFlag_UseItem32)
		buff1lv2=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
		AddRoleValue(own , EM_LuaValueFlag_UseItem32,-buff1lv1)
		AddRoleValue(own , EM_LuaValueFlag_UseItem33,-buff1lv2)
		GiveBodyItem(own, 546170, 1 )
		Tell(own,tar,"[SC_VALENTINE_IC_19]")
		CloseSpeak(own)
		--say(own,"0=OK")
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120312	then	---1號1
		if play123~=2 then
			AddBuff(own,621971,0,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
		elseif play123==2 then
			AddBuff(own,621972,0,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
		end
		GiveBodyItem(own, 546171, 1 )
		CloseSpeak(own)
		--say(own,"1=OK")
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120313	then	---2號2
		if play123~=2 then
			AddBuff(own,621971,1,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
		elseif play123==2 then
			AddBuff(own,621972,1,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
		end
		GiveBodyItem(own, 546172, 1 )
		CloseSpeak(own)
		--say(own,"2=OK")
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120314	then	---3號3
		if play123~=2 then
			AddBuff(own,621971,2,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
		elseif play123==2 then
			AddBuff(own,621972,2,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
		end
		GiveBodyItem(own, 546173, 1 )
		CloseSpeak(own)
		--say(own,"3=OK")
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120315	then	---4號6
		if play123~=2 then
			AddBuff(own,621971,5,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
		elseif play123==2 then
			AddBuff(own,621972,5,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
		end
		GiveBodyItem(own, 546174, 1 )
		CloseSpeak(own)
		--say(own,"4=OK")
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120316	then	---5號8
		if play123~=2 then
			AddBuff(own,621971,7,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
		elseif play123==2 then
			AddBuff(own,621972,7,-1 )
			AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
		end
		GiveBodyItem(own, 546175, 1 )
		CloseSpeak(own)
		--say(own,"5=OK")
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120317	then	---6號1
		AddBuff(own,621973,0,-1 )
		GiveBodyItem(own, 546176, 1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
		CloseSpeak(own)
		--say(own,"6=OK")
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120318	then	---7號3
		if CheckBuff(own, 621586 ) == false then
			buff1l3=Lua_BuffPosSearch( own , 621958 )
			buff1l3LV=BuffInfo( own, buff1l3 , EM_BuffInfoType_Power )
			if buff1l3LV~=2 then
				Tell(own,tar,"[SC_VALENTINE_IC_11]")
				AddBuff(own,621958,0,-1 )
				AddBuff(own,621586,0,-1 )
				CloseSpeak(own)
			end
			buff1l3LV=BuffInfo( own, buff1l3 , EM_BuffInfoType_Power )
			if buff1l3LV==2 then
				--say(own,"7=OK")
				Tell(own,tar,"[SC_VALENTINE_IC_12]")
				AddBuff(own,621973,2,-1 )
				GiveBodyItem(own, 546177, 1 )
				CancelBuff(own, 621958)
				CancelBuff(own, 621586)
				AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
				CloseSpeak(own)	
			end	
		elseif	CheckBuff(own, 621586 ) == true then
			Tell(own,tar,"[SC_VALENTINE_IC_29]")
			CloseSpeak(own)
		end	
	elseif	ReadRoleValue(tar,EM_RoleValue_OrgID) ==120323	then	---8號6
		if CheckBuff(own, 621587 ) == false then
			buff1l4=Lua_BuffPosSearch( own , 621959 )
			buff1l4LV=BuffInfo( own, buff1l4 , EM_BuffInfoType_Power )	
			if	buff1l4LV~=4 then	
				Tell(own,tar,"[SC_VALENTINE_IC_13]")
				AddBuff(own,621959,0,-1 )
				AddBuff(own,621587,0,-1 )
				CloseSpeak(own)
			end	
			buff1l4LV=BuffInfo( own, buff1l4 , EM_BuffInfoType_Power )
			if buff1l4LV==4 then
				Tell(own,tar,"[SC_VALENTINE_IC_14]")
				AddBuff(own,621973,5,-1 )
				GiveBodyItem(own, 546178, 1 )
				CancelBuff(own, 621959)
				CancelBuff(own, 621587)
				AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
				CloseSpeak(own)	
			end	
		elseif	CheckBuff(own, 621587 ) == true then
			Tell(own,tar,"[SC_VALENTINE_IC_29]")
			CloseSpeak(own)
		end	
	end
end
function ic_Flora_npc_3()
	local own = OwnerID()
	local tar = TargetID()
	local buff1lv1
	local buff1lv2
	local buff123
	local AllNPC
	if  CheckScriptFlag(own, 546171 ) ==true	
	and CheckScriptFlag(own, 546172 ) ==true	
	and CheckScriptFlag(own, 546173 ) ==true	
	and CheckScriptFlag(own, 546174 ) ==true	
	and CheckScriptFlag(own, 546175 ) ==true	
	and CheckScriptFlag(own, 546176 ) ==true	
	and CheckScriptFlag(own, 546177 ) ==true	
	and CheckScriptFlag(own, 546178 ) ==true  then											---全部找到
		AddRoleValue(own , EM_LuaValueFlag_UseItem34,1)
		buff1lv1=ReadRoleValue(own, EM_LuaValueFlag_UseItem32)
		buff1lv2=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
		GiveBodyItem(own, 209161,3)
		AllNPC=ReadRoleValue(own, EM_LuaValueFlag_UseItem34)		
		if AllNPC==5 and CountBodyItem(own, 530871 ) ==0 then								---全部找到5次
			GiveBodyItem(own, 530871, 1 )
		elseif AllNPC==20 and CountBodyItem(own, 530872 ) ==0 then							---全部找到20次
			GiveBodyItem(own, 530872, 1 )
		end
		if  CheckScriptFlag(own, 546171 ) ==true											---找到3個NPC				
		or  CheckScriptFlag(own, 546172 ) ==true	
		or	CheckScriptFlag(own, 546173 ) ==true 
		and	CountBodyItem(own, 530869 ) ==0 then
			GiveBodyItem(own, 530869, 1 )
		end
		if  CheckScriptFlag(own, 546171 ) ==true											---找到8個--209161
		and CheckScriptFlag(own, 546172 ) ==true	
		and CheckScriptFlag(own, 546173 ) ==true	
		and CheckScriptFlag(own, 546174 ) ==true	
		and CheckScriptFlag(own, 546175 ) ==true	
		and CheckScriptFlag(own, 546176 ) ==true	
		and CheckScriptFlag(own, 546177 ) ==true	
		and CheckScriptFlag(own, 546178 ) ==true 
		and	CountBodyItem(own, 530870 ) ==0 then	
			GiveBodyItem(own, 530870, 1 )
		end
			--say(own,"1-8=OK")
			AddRoleValue(own , EM_LuaValueFlag_UseItem32,-buff1lv1)
			AddRoleValue(own , EM_LuaValueFlag_UseItem33,-buff1lv2)
			GiveBodyItem(own, 546179, 1 )
			CloseSpeak(own)
	elseif	CheckScriptFlag(own, 546171 ) ==false	
		and CheckScriptFlag(own, 546172 ) ==false	
		and CheckScriptFlag(own, 546173 ) ==false	
		and CheckScriptFlag(own, 546174 ) ==false	
		and CheckScriptFlag(own, 546175 ) ==false	
		and CheckScriptFlag(own, 546176 ) ==false	
		and CheckScriptFlag(own, 546177 ) ==false	
		and CheckScriptFlag(own, 546178 ) ==false  then										---都沒找
			--say(own,"1-8=no")
			Tell(own,tar,"[SC_VALENTINE_IC_16]")
			CloseSpeak(own)
	elseif	CheckScriptFlag(own, 546171 ) ==true	
		or  CheckScriptFlag(own, 546172 ) ==true	
		or	CheckScriptFlag(own, 546173 ) ==true	
		or 	CheckScriptFlag(own, 546174 ) ==true	
		or 	CheckScriptFlag(own, 546175 ) ==true	
		or 	CheckScriptFlag(own, 546176 ) ==true	
		or 	CheckScriptFlag(own, 546177 ) ==true	
		or 	CheckScriptFlag(own, 546178 ) ==true  then										---未找全
			buff1lv1=ReadRoleValue(own, EM_LuaValueFlag_UseItem32)
			buff1lv2=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
			buff123=buff1lv1+buff1lv2
			if buff123<4 then
				GiveBodyItem(own, 209161,1)
			elseif buff123>3 then
				if buff1lv1>buff1lv2 or buff1lv1==buff1lv2 then
					GiveBodyItem(own, 209161,1)
				elseif buff1lv1<buff1lv2 then
					GiveBodyItem(own, 209161,2)
				end
			end
			if  CheckScriptFlag(own, 546171 ) ==true	
			or  CheckScriptFlag(own, 546172 ) ==true	
			or	CheckScriptFlag(own, 546173 ) ==true 
			and	CountBodyItem(own, 530869 ) ==0 then
				GiveBodyItem(own, 530869, 1 )
			end
			AddRoleValue(own , EM_LuaValueFlag_UseItem32,-buff1lv1)
			AddRoleValue(own , EM_LuaValueFlag_UseItem33,-buff1lv2)
			GiveBodyItem(own, 546179, 1 )
			CloseSpeak(own)		
	end
end
function ic_Flora_npc_4()	  							
	local own = OwnerID()
	local tar = TargetID()
	SetSpeakDetail( own, "[SC_VALENTINE_IC_18]" )
end
function ic_Flora_play_all(x)
	local own = OwnerID()
	local time1=x
	local play34
	local buff1lv1
	local buff1lv2
	if time1==0 then
		DelBodyItem(own, 546170 , 1 )														---接過任務
	elseif	time1==1 then
		DelBodyItem(own, 546171 , 1 )														---1號完成
	elseif	time1==2 then
		DelBodyItem(own, 546172 , 1 )														---2號完成
	elseif	time1==3 then
		DelBodyItem(own, 546173 , 1 )														---3號完成
	elseif	time1==4 then
		DelBodyItem(own, 546174 , 1 )														---4號完成
	elseif	time1==5 then
		DelBodyItem(own, 546175 , 1 )														---5號完成
	elseif	time1==6 then
		DelBodyItem(own, 546176 , 1 )														---6號完成
	elseif	time1==7 then
		DelBodyItem(own, 546177 , 1 )														---7號完成
	elseif	time1==8 then
		DelBodyItem(own, 546178 , 1 )														---8號完成
	elseif	time1==9 then
		DelBodyItem(own, 546179 , 1 )														---回過任務
	elseif	time1==10 then																	
		DelBodyItem(own, 546170, 1 )														---全部刪除
		DelBodyItem(own, 546171, 1 )
		DelBodyItem(own, 546172, 1 )
		DelBodyItem(own, 546173, 1 )
		DelBodyItem(own, 546174, 1 )
		DelBodyItem(own, 546175, 1 )
		DelBodyItem(own, 546176, 1 )
		DelBodyItem(own, 546177, 1 )
		DelBodyItem(own, 546178, 1 )
		DelBodyItem(own, 546179, 1 )
		buff1lv1=ReadRoleValue(own, EM_LuaValueFlag_UseItem32)
		buff1lv2=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
		AddRoleValue(own , EM_LuaValueFlag_UseItem32,-buff1lv1)
		AddRoleValue(own , EM_LuaValueFlag_UseItem33,-buff1lv2)
	elseif	time1==11 then																	---1-3完成
		GiveBodyItem(own, 546171, 1 )
		GiveBodyItem(own, 546172, 1 )
		GiveBodyItem(own, 546173, 1 )
		say(own ,"1-3~OK")
	elseif	time1==12 then																	---1-8完成
		GiveBodyItem(own, 546171, 1 )
		GiveBodyItem(own, 546172, 1 )
		GiveBodyItem(own, 546173, 1 )
		GiveBodyItem(own, 546174, 1 )
		GiveBodyItem(own, 546175, 1 )
		GiveBodyItem(own, 546176, 1 )
		GiveBodyItem(own, 546177, 1 )
		GiveBodyItem(own, 546178, 1 )
		say(own ,"1-8~OK")
	elseif	time1==13 then
		DelBodyItem(own, 530869 , 1 ) 
		DelBodyItem(own, 530870 , 1 )
		DelBodyItem(own, 530871 , 1 )
		DelBodyItem(own, 530872 , 1 )			
		play34=ReadRoleValue(own, EM_LuaValueFlag_UseItem34 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem34,-play34 )
		play34=ReadRoleValue(own, EM_LuaValueFlag_UseItem34 )
		--say(own,"play34="..play34)
	elseif	time1==14 then
		AddRoleValue(own , EM_LuaValueFlag_UseItem34,1)
		play34=ReadRoleValue(own, EM_LuaValueFlag_UseItem34 )
		say(own,"play34="..play34)
		if  CheckScriptFlag(own, 546171 ) ==true											---找到3個NPC				
		or  CheckScriptFlag(own, 546172 ) ==true	
		or	CheckScriptFlag(own, 546173 ) ==true 
		and	CountBodyItem(own, 530869 ) ==0 then
			GiveBodyItem(own, 530869, 1 )
		end
		if  CheckScriptFlag(own, 546171 ) ==true											---找到8個
		and CheckScriptFlag(own, 546172 ) ==true	
		and CheckScriptFlag(own, 546173 ) ==true	
		and CheckScriptFlag(own, 546174 ) ==true	
		and CheckScriptFlag(own, 546175 ) ==true	
		and CheckScriptFlag(own, 546176 ) ==true	
		and CheckScriptFlag(own, 546177 ) ==true	
		and CheckScriptFlag(own, 546178 ) ==true  
		and CountBodyItem(own, 530869 ) ==1 	
		and	CountBodyItem(own, 530870 ) ==0	then	
			GiveBodyItem(own, 530870, 1 )
		end
		if play34>=5 and CountBodyItem(own, 530871 )==0 then
			GiveBodyItem(own, 530871, 1 )
			--say(own ,"1")
		elseif play34>=20 and CountBodyItem(own, 530872 )==0 then
			GiveBodyItem(own, 530872, 1 )
			--say(own ,"2")
		end
	elseif	time1==15 then	
		GiveBodyItem(own, 546170, 1 )	
	elseif	time1==16 then	
		GiveBodyItem(own, 546171, 1 )
		GiveBodyItem(own, 546172, 1 )
		GiveBodyItem(own, 546173, 1 )
		GiveBodyItem(own, 546174, 1 )
		GiveBodyItem(own, 546175, 1 )
		say(own ,"1-5~OK")
	elseif	time1==17 then	
		AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
		buff1lv1=ReadRoleValue(own, EM_LuaValueFlag_UseItem32)
		say(own ,"buff1lv1"..buff1lv1)
	elseif	time1==18 then	
		AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
		buff1lv2=ReadRoleValue(own, EM_LuaValueFlag_UseItem33)
		say(own ,"buff1lv2"..buff1lv2)
	elseif	time1==19 then
		AddRoleValue(own , EM_LuaValueFlag_UseItem34,10)
		play34=ReadRoleValue(own, EM_LuaValueFlag_UseItem34 )
		say(own,"play34="..play34)
		if  CheckScriptFlag(own, 546171 ) ==true											---找到3個NPC				
		or  CheckScriptFlag(own, 546172 ) ==true	
		or	CheckScriptFlag(own, 546173 ) ==true 
		and	CountBodyItem(own, 530869 ) ==0 then
			GiveBodyItem(own, 530869, 1 )
		end
		if  CheckScriptFlag(own, 546171 ) ==true											---找到8個
		and CheckScriptFlag(own, 546172 ) ==true	
		and CheckScriptFlag(own, 546173 ) ==true	
		and CheckScriptFlag(own, 546174 ) ==true	
		and CheckScriptFlag(own, 546175 ) ==true	
		and CheckScriptFlag(own, 546176 ) ==true	
		and CheckScriptFlag(own, 546177 ) ==true	
		and CheckScriptFlag(own, 546178 ) ==true  
		and CountBodyItem(own, 530869 ) ==1 	
		and	CountBodyItem(own, 530870 ) ==0	then	
			GiveBodyItem(own, 530870, 1 )
		end
		if play34>=5 and CountBodyItem(own, 530871 )==0 then
			GiveBodyItem(own, 530871, 1 )
			--say(own ,"1")
		elseif play34>=20 and CountBodyItem(own, 530872 )==0 then
			GiveBodyItem(own, 530872, 1 )
			--say(own ,"2")
		end	
	elseif	time1==20 then
		CancelBuff(own, 621586)
	elseif	time1==21 then	
		CancelBuff(own, 621587)
	elseif	time1==22 then
		local Gold6 = GetWorldVar( "SC_VALENTINE_IC_30" )
		local Gold7 = GetWorldVar( "SC_VALENTINE_IC_31" )
		local Gold8 = GetWorldVar( "SC_VALENTINE_IC_32" )
		Tell(own,own,"NPC number 6s zone="..Gold6)
		Tell(own,own,"NPC number 7s zone="..Gold7)
		Tell(own,own,"NPC number 8s zone="..Gold8)
	end
end	
function ic_Flora_play_buff(x)
local own = OwnerID()
local tar = TargetID()
local play123=x
	if play123==1 then
		AddBuff(own,621971,0,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
	elseif play123==11 then
		AddBuff(own,621972,0,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
	elseif play123==2 then
		AddBuff(own,621971,1,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
	elseif play123==22 then
		AddBuff(own,621972,1,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
	elseif play123==3 then
		AddBuff(own,621971,2,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
	elseif play123==33 then
		AddBuff(own,621972,2,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
	elseif play123==4 then
		AddBuff(own,621971,5,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
	elseif play123==44 then
		AddBuff(own,621972,5,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)
	elseif play123==5 then
		AddBuff(own,621971,7,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem32,1)
	elseif play123==55 then
		AddBuff(own,621972,7,-1 )
		AddRoleValue(own , EM_LuaValueFlag_UseItem33,1)	
	elseif play123==6 then
		AddBuff(own,621973,0,-1 )
	elseif play123==7 then
		AddBuff(own,621973,2,-1 )
	elseif play123==8 then
		AddBuff(own,621973,5,-1 )
	end
end	
function ic_Flora_NPC_1_8_9898()
local Search = SearchRangeNPC ( OwnerID() ,300)
	for i = 0 , table.getn(Search) do
		if Search[i] ~= OwnerID() then
			if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	120312 or
				ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	120313 or 
				ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	120314 or 
				ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	120315 or 
				ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	120316 or 
				ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	120317 or 
				ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	120318 or 
				ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	120323 then
				WriteRoleValue(Search[i],EM_RoleValue_register9,1)
			end		
		end
	end	
end
---ZonePCall( 2 , Lua_11111_BornNPC )
--EM_LuaValueFlag_UseItem32  	 --花神節--單人或2人以上buff	
--EM_LuaValueFlag_UseItem33  	 --花神節--雙人buff
--EM_LuaValueFlag_UseItem34  	 --花神節--全部npc找到次數
--SC_VALENTINE_IC_01---尋找花神使者
--SC_VALENTINE_IC_02---花神節，一個傳遞大家心意的節日，在這時後鼓起勇氣，向自己心儀的對象表白吧
--SC_VALENTINE_IC_03---在這戀人的節日裡，付出真心，耐心來守護自己的愛情吧。
--SC_VALENTINE_IC_04---尋找到花神使者，將可以得到花神使者的祝福。
--SC_VALENTINE_IC_05---擁有花神使者的祝福，無論是尋找真愛或者守護愛情都會更順利。
--SC_VALENTINE_IC_06---回報
--SC_VALENTINE_IC_07---5號-1花神節，是我們約定在相會的日子，在這我們認識的海岸......
--SC_VALENTINE_IC_08---5號-2我相信你也同樣期待這一天的到來...
--SC_VALENTINE_IC_09---5號-3回想起我們在一起的點點滴滴......
--SC_VALENTINE_IC_10---5號-4親愛的你哪時候才會回來......
--SC_VALENTINE_IC_11---7號跑走-被發現了嗎？偽裝是我的興趣......
--SC_VALENTINE_IC_12---7號給BUFF-好啦~給你祝福，不要再打擾我了。
--SC_VALENTINE_IC_13---8號跑走-想要得到我的祝福嗎？繼續來尋找我吧！
--SC_VALENTINE_IC_14---8號給BUFF-看來真的很有耐心，夠資格得到我的祝福。
--SC_VALENTINE_IC_15---8號-給我花神的祝福
--SC_VALENTINE_IC_16---未取得任何花神使者的祝福...無法給予獎勵......
--SC_VALENTINE_IC_17---
--SC_VALENTINE_IC_18---
--SC_VALENTINE_IC_19---