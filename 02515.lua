function ic_BOSS4_23_0_123()--(6小蟲+12支護衛)(1小蟲2護衛) 1小蟲>>2守衛*6 >>門神  			---4王後面																											
	local isaac=OwnerID()																	---控制器   
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local mob1
	local mob2
	local mob3
	local mob4
	local mob5
	local mob6
	local mob11
	local mob12
	local mob21
	local mob22
	local mob31
	local mob32
	local mob41
	local mob42
	local mob51
	local mob52
	local mob61
	local mob62
	local mob1XX
	local mob2XX
	local mob3XX
	local mob4XX
	local mob5XX
	local mob6XX
	local mob7XX
	local mob8XX
	local time1=0
	local mob00
	local mob0
	local mob0_id={106124,106124,106124}													---守衛
	local mob1_6_id={106127,106127,106127}													---小蟲
	local mob11_id={106125,106125,106125}													---雄蟻1
	local mob22_id={106126,106126,106126}													---雄蟻2
	local ZoneID=ic_ReadRoleValue(isaac,17)
	local Zone={146,147,148}
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(isaac,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(isaac,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(isaac,0,3)
	end
	local play_Mode=ic_ReadRoleValue(isaac,0)----[play_Mode]
	while true do
		sleep(10)
		if time1==0 then
			sleep(5)
			mob00=ic_mob_flag_add_Y_N( isaac,106123,781014,498,2)								---阻擋
			mob0=ic_mob_flag_add_Y_N( isaac,mob0_id[play_Mode],781014,499,1)								---守衛
			ic_All_door(mob00)
			SetModeEx( mob0 , EM_SetModeType_Fight, false) 										---可砍殺
			SetModeEx( mob0 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否) 
			SetModeEx( mob0 , EM_SetModeType_Move, false)									---索敵(否)
			AddToPartition(mob00,RoomID)
			WriteRoleValue(mob0,EM_RoleValue_PID,isaac)
			--BeginPlot(mob0 , "ic_BOSS45_23_mob0_1" , 0)
			sleep(5)
			mob1=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,401,1)	
			mob2=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,402,1)
			mob3=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,403,1)
			SetPlot( mob1,"dead","ic_BOSS45_23_1",0 )---免改
			SetPlot( mob2,"dead","ic_BOSS45_23_2",0 )---免改
			SetPlot( mob3,"dead","ic_BOSS45_23_3",0 )---免改
			BeginPlot(mob1 , "ic_BOSS45_23_7" , 0)---免改
			BeginPlot(mob2 , "ic_BOSS45_23_7" , 0)---免改
			BeginPlot(mob3 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(mob1,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob2,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob3,EM_RoleValue_PID,isaac)
			sleep(5)
			mob4=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,404,1)
			mob5=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,405,1)
			mob6=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,406,1)								
			SetPlot( mob4,"dead","ic_BOSS45_23_4",0 )---免改
			SetPlot( mob5,"dead","ic_BOSS45_23_5",0 )---免改
			SetPlot( mob6,"dead","ic_BOSS45_23_6",0 )---免改
			BeginPlot(mob4 , "ic_BOSS45_23_7" , 0)---免改
			BeginPlot(mob5 , "ic_BOSS45_23_7" , 0)---免改
			BeginPlot(mob6 , "ic_BOSS45_23_7" , 0)---免改		
			WriteRoleValue(mob4,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob5,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob6,EM_RoleValue_PID,isaac)
			time1=1
			sleep(5)
		end
		if time1==1 then
			mob11=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,411,1)
			mob12=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,412,1)
			mob21=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,421,1)
			BeginPlot(mob11 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob12 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob21 , "ic_BOSS45_23_12_1" , 0)
			WriteRoleValue(mob11,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob12,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob21,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob11,EM_RoleValue_register4,411)
			WriteRoleValue(mob12,EM_RoleValue_register4,412)
			WriteRoleValue(mob21,EM_RoleValue_register4,421)
			WriteRoleValue(mob11,EM_RoleValue_register5,1)
			WriteRoleValue(mob12,EM_RoleValue_register5,1)
			WriteRoleValue(mob21,EM_RoleValue_register5,2)
			WriteRoleValue(mob11,EM_RoleValue_register10,1)
			WriteRoleValue(mob12,EM_RoleValue_register10,2)
			WriteRoleValue(mob21,EM_RoleValue_register10,1)
			sleep(5)
			mob22=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,422,1)
			mob31=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,431,1)
			mob32=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,432,1)
			BeginPlot(mob22 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob31 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob32 , "ic_BOSS45_23_12_1" , 0)
			WriteRoleValue(mob22,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob31,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob32,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob22,EM_RoleValue_register4,422)
			WriteRoleValue(mob31,EM_RoleValue_register4,431)
			WriteRoleValue(mob32,EM_RoleValue_register4,432)
			WriteRoleValue(mob22,EM_RoleValue_register5,2)
			WriteRoleValue(mob31,EM_RoleValue_register5,3)
			WriteRoleValue(mob32,EM_RoleValue_register5,3)
			WriteRoleValue(mob22,EM_RoleValue_register10,2)
			WriteRoleValue(mob31,EM_RoleValue_register10,1)
			WriteRoleValue(mob32,EM_RoleValue_register10,2)
			sleep(5)
			mob41=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,441,1)
			mob42=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,442,1)
			mob51=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,451,1)
			BeginPlot(mob41 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob42 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob51 , "ic_BOSS45_23_12_1" , 0)
			WriteRoleValue(mob41,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob42,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob51,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob41,EM_RoleValue_register4,441)
			WriteRoleValue(mob42,EM_RoleValue_register4,442)
			WriteRoleValue(mob51,EM_RoleValue_register4,451)
			WriteRoleValue(mob41,EM_RoleValue_register5,4)
			WriteRoleValue(mob42,EM_RoleValue_register5,4)
			WriteRoleValue(mob51,EM_RoleValue_register5,5)
			WriteRoleValue(mob41,EM_RoleValue_register10,1)
			WriteRoleValue(mob42,EM_RoleValue_register10,2)
			WriteRoleValue(mob51,EM_RoleValue_register10,1)
			sleep(5)
			mob52=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,452,1)
			mob61=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,461,1)
			mob62=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,462,1)
			BeginPlot(mob52 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob61 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob62 , "ic_BOSS45_23_12_1" , 0)
			WriteRoleValue(mob52,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob61,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob62,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob52,EM_RoleValue_register4,452)
			WriteRoleValue(mob61,EM_RoleValue_register4,461)
			WriteRoleValue(mob62,EM_RoleValue_register4,462)
			WriteRoleValue(mob52,EM_RoleValue_register5,5)
			WriteRoleValue(mob61,EM_RoleValue_register5,6)
			WriteRoleValue(mob62,EM_RoleValue_register5,6)
			WriteRoleValue(mob52,EM_RoleValue_register10,2)
			WriteRoleValue(mob61,EM_RoleValue_register10,1)
			WriteRoleValue(mob62,EM_RoleValue_register10,2)
			time1=2
		end	
		mob1XX=ReadRoleValue(isaac , EM_RoleValue_register1)
		mob2XX=ReadRoleValue(isaac , EM_RoleValue_register2)
		mob3XX=ReadRoleValue(isaac , EM_RoleValue_register3)
		mob4XX=ReadRoleValue(isaac , EM_RoleValue_register4)
		mob5XX=ReadRoleValue(isaac , EM_RoleValue_register5)
		mob6XX=ReadRoleValue(isaac , EM_RoleValue_register6)
		mob7XX=ReadRoleValue(isaac , EM_RoleValue_register7)
		mob8XX=ReadRoleValue(isaac , EM_RoleValue_register8)
		
		if mob8XX==1  then
			DelObj(mob00)
		end
		if mob7XX==12  then
			SetModeEx( mob0 , EM_SetModeType_Fight, true) 									---可砍殺
			SetModeEx( mob0 , EM_SetModeType_Move, true)									---索敵(否)
			WriteRoleValue(isaac,EM_RoleValue_register7,20)
		end
		if mob1XX==4 then
			mob1=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,401,1)											
			SetPlot( mob1,"dead","ic_BOSS45_23_1",0 )---免改
			BeginPlot(mob1 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(isaac,EM_RoleValue_register1,0)
		elseif mob2XX==4 then										
			mob2=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,402,1)
			SetPlot( mob2,"dead","ic_BOSS45_23_2",0 )---免改
			BeginPlot(mob2 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(mob1,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob2,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register2,0)	
		elseif mob3XX==4 then
			mob3=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,403,1)
			SetPlot( mob3,"dead","ic_BOSS45_23_3",0 )---免改
			BeginPlot(mob3 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(mob3,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register3,0)
		elseif mob4XX==4 then
			mob4=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,404,1)				
			AddToPartition(mob4,RoomID)			
			SetPlot( mob4,"dead","ic_BOSS45_23_4",0 )---免改
			BeginPlot(mob4 , "ic_BOSS45_23_7" , 0)---免改		
			WriteRoleValue(mob4,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register4,0)			
		elseif mob5XX==4 then
			mob5=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,405,1)
			SetPlot( mob5,"dead","ic_BOSS45_23_5",0 )---免改
			BeginPlot(mob5 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(mob5,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register5,0)
		elseif mob6XX==4 then
			mob6=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,406,1)						
			SetPlot( mob6,"dead","ic_BOSS45_23_6",0 )---免改
			BeginPlot(mob6 , "ic_BOSS45_23_7" , 0)---免改	
			WriteRoleValue(mob6,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register6,0)
		end
		if mob1XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register1,2)
			WriteRoleValue(mob11,EM_RoleValue_register1,1)
			WriteRoleValue(mob12,EM_RoleValue_register1,1)
			SetModeEx( mob11  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob12  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob11)
			ic_NoAttackPlayer( mob12)
		elseif mob2XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register2,2)
			WriteRoleValue(mob21,EM_RoleValue_register1,1)
			WriteRoleValue(mob22,EM_RoleValue_register1,1)
			SetModeEx( mob21  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob22  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob21)
			ic_NoAttackPlayer( mob22)
		elseif mob3XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register3,2)
			WriteRoleValue(mob31,EM_RoleValue_register1,1)
			WriteRoleValue(mob32,EM_RoleValue_register1,1)
			SetModeEx( mob31  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob32  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob31)
			ic_NoAttackPlayer( mob32)
		elseif mob4XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register4,2)
			WriteRoleValue(mob41,EM_RoleValue_register1,1)
			WriteRoleValue(mob42,EM_RoleValue_register1,1)
			SetModeEx( mob41  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob42  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob41)
			ic_NoAttackPlayer( mob42)			
		elseif mob5XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register5,2)
			WriteRoleValue(mob51,EM_RoleValue_register1,1)
			WriteRoleValue(mob52,EM_RoleValue_register1,1)
			SetModeEx( mob51  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob52  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob51)
			ic_NoAttackPlayer( mob52)
		elseif mob6XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register6,2)
			WriteRoleValue(mob61,EM_RoleValue_register1,1)
			WriteRoleValue(mob62,EM_RoleValue_register1,1)	
			SetModeEx( mob61  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob62  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob61)
			ic_NoAttackPlayer( mob62)
		end
	end	
end  
function ic_BOSS5_23_0_123()--(6小蟲+12支護衛)(1小蟲2護衛) 1小蟲>>2守衛*6 >>門神  			---5王前面													
	local isaac=OwnerID()																	---控制器 	
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local mob1
	local mob2
	local mob3
	local mob4
	local mob5
	local mob6
	local mob11
	local mob12
	local mob21
	local mob22
	local mob31
	local mob32
	local mob41
	local mob42
	local mob51
	local mob52
	local mob61
	local mob62
	local mob1XX
	local mob2XX
	local mob3XX
	local mob4XX
	local mob5XX
	local mob6XX
	local mob7XX
	local mob8XX
	local time1=0
	local mob00
	local mob0
	local mob0_id={106124,106124,106124}													---守衛
	local mob1_6_id={106127,106127,106127}													---小蟲
	local mob11_id={106125,106125,106125}													---雄蟻1
	local mob22_id={106126,106126,106126}													---雄蟻2
	local ZoneID=ic_ReadRoleValue(isaac,17)
	local Zone={146,147,148}
	if 		ZoneID==Zone[1] then														
		ic_WriteRoleValue(isaac,0,1)
	elseif 	ZoneID==Zone[2] then													
		ic_WriteRoleValue(isaac,0,2)
	elseif 	ZoneID==Zone[3] then														
		ic_WriteRoleValue(isaac,0,3)
	end
	local play_Mode=ic_ReadRoleValue(isaac,0)----[play_Mode]
	while true do
		sleep(10)
		if time1==0 then
			sleep(5)
			mob00=ic_mob_flag_add_Y_N( isaac,106123,781014,598,2)								---阻擋
			mob0=ic_mob_flag_add_Y_N( isaac,mob0_id[play_Mode],781014,599,1)								---守衛
			ic_All_door(mob00)
			SetModeEx( mob0 , EM_SetModeType_Fight, false) 										---可砍殺
			SetModeEx( mob0 , EM_SetModeType_SearchenemyIgnore, false)							---是否被搜尋(否) 
			SetModeEx( mob0 , EM_SetModeType_Move, false)										---索敵(否)
			AddToPartition(mob00,RoomID)
			--SetPlot( mob0,"dead","ic_BOSS45_23_BOSSXX",0 )---免改
			WriteRoleValue(mob0,EM_RoleValue_PID,isaac)
			--BeginPlot(mob0 , "ic_BOSS45_23_mob0_1" , 0)
			sleep(5)
			mob1=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,501,1)
			mob2=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,502,1)
			mob3=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,503,1)
			SetPlot( mob1,"dead","ic_BOSS45_23_1",0 )---免改
			SetPlot( mob2,"dead","ic_BOSS45_23_2",0 )---免改
			SetPlot( mob3,"dead","ic_BOSS45_23_3",0 )---免改
			BeginPlot(mob1 , "ic_BOSS45_23_7" , 0)---免改
			BeginPlot(mob2 , "ic_BOSS45_23_7" , 0)---免改
			BeginPlot(mob3 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(mob1,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob2,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob3,EM_RoleValue_PID,isaac)
			sleep(5)
			mob4=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,504,1)
			mob5=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,505,1)
			mob6=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,506,1)							
			SetPlot( mob4,"dead","ic_BOSS45_23_4",0 )---免改
			SetPlot( mob5,"dead","ic_BOSS45_23_5",0 )---免改
			SetPlot( mob6,"dead","ic_BOSS45_23_6",0 )---免改
			BeginPlot(mob4 , "ic_BOSS45_23_7" , 0)---免改
			BeginPlot(mob5 , "ic_BOSS45_23_7" , 0)---免改
			BeginPlot(mob6 , "ic_BOSS45_23_7" , 0)---免改	
			WriteRoleValue(mob4,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob5,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob6,EM_RoleValue_PID,isaac)
			time1=1
			sleep(5)
		end
		if time1==1 then
			mob11=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,511,1)
			mob12=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,512,1)
			mob21=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,521,1)
			BeginPlot(mob11 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob12 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob21 , "ic_BOSS45_23_12_1" , 0)
			WriteRoleValue(mob11,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob12,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob21,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob11,EM_RoleValue_register4,511)
			WriteRoleValue(mob12,EM_RoleValue_register4,512)
			WriteRoleValue(mob21,EM_RoleValue_register4,521)
			WriteRoleValue(mob11,EM_RoleValue_register5,1)
			WriteRoleValue(mob12,EM_RoleValue_register5,1)
			WriteRoleValue(mob21,EM_RoleValue_register5,2)
			WriteRoleValue(mob11,EM_RoleValue_register10,3)
			WriteRoleValue(mob12,EM_RoleValue_register10,4)
			WriteRoleValue(mob21,EM_RoleValue_register10,3)
			sleep(5)
			mob22=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,522,1)
			mob31=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,531,1)
			mob32=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,532,1)
			BeginPlot(mob22 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob31 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob32 , "ic_BOSS45_23_12_1" , 0)
			WriteRoleValue(mob22,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob31,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob32,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob22,EM_RoleValue_register4,522)
			WriteRoleValue(mob31,EM_RoleValue_register4,531)
			WriteRoleValue(mob32,EM_RoleValue_register4,532)
			WriteRoleValue(mob22,EM_RoleValue_register5,2)
			WriteRoleValue(mob31,EM_RoleValue_register5,3)
			WriteRoleValue(mob32,EM_RoleValue_register5,3)
			WriteRoleValue(mob22,EM_RoleValue_register10,4)
			WriteRoleValue(mob31,EM_RoleValue_register10,3)
			WriteRoleValue(mob32,EM_RoleValue_register10,4)
			sleep(5)
			mob41=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,541,1)
			mob42=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,542,1)
			mob51=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,551,1)
			BeginPlot(mob41 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob42 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob51 , "ic_BOSS45_23_12_1" , 0)
			WriteRoleValue(mob41,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob42,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob51,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob41,EM_RoleValue_register4,541)
			WriteRoleValue(mob42,EM_RoleValue_register4,542)
			WriteRoleValue(mob51,EM_RoleValue_register4,551)
			WriteRoleValue(mob41,EM_RoleValue_register5,4)
			WriteRoleValue(mob42,EM_RoleValue_register5,4)
			WriteRoleValue(mob51,EM_RoleValue_register5,5)
			WriteRoleValue(mob41,EM_RoleValue_register10,3)
			WriteRoleValue(mob42,EM_RoleValue_register10,4)
			WriteRoleValue(mob51,EM_RoleValue_register10,3)
			sleep(5)
			mob52=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,552,1)
			mob61=ic_mob_flag_add_Y_N( isaac,mob11_id[play_Mode],781014,561,1)
			mob62=ic_mob_flag_add_Y_N( isaac,mob22_id[play_Mode],781014,562,1)
			BeginPlot(mob52 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob61 , "ic_BOSS45_23_12_1" , 0)
			BeginPlot(mob62 , "ic_BOSS45_23_12_1" , 0)
			WriteRoleValue(mob52,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob61,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob62,EM_RoleValue_PID,isaac)
			WriteRoleValue(mob52,EM_RoleValue_register4,552)
			WriteRoleValue(mob61,EM_RoleValue_register4,561)
			WriteRoleValue(mob62,EM_RoleValue_register4,562)
			WriteRoleValue(mob52,EM_RoleValue_register5,5)
			WriteRoleValue(mob61,EM_RoleValue_register5,6)
			WriteRoleValue(mob62,EM_RoleValue_register5,6)
			WriteRoleValue(mob52,EM_RoleValue_register10,4)
			WriteRoleValue(mob61,EM_RoleValue_register10,3)
			WriteRoleValue(mob62,EM_RoleValue_register10,4)
			time1=2
		end	
		mob1XX=ReadRoleValue(isaac , EM_RoleValue_register1)
		mob2XX=ReadRoleValue(isaac , EM_RoleValue_register2)
		mob3XX=ReadRoleValue(isaac , EM_RoleValue_register3)
		mob4XX=ReadRoleValue(isaac , EM_RoleValue_register4)
		mob5XX=ReadRoleValue(isaac , EM_RoleValue_register5)
		mob6XX=ReadRoleValue(isaac , EM_RoleValue_register6)
		mob7XX=ReadRoleValue(isaac , EM_RoleValue_register7)
		mob8XX=ReadRoleValue(isaac , EM_RoleValue_register8)
		if mob8XX==1  then
			DelObj(mob00)
		end
		if mob7XX==12  then
			SetModeEx( mob0 , EM_SetModeType_Fight, true) 						---可砍殺
			SetModeEx( mob0 , EM_SetModeType_Move, true)						---索敵(否)
			WriteRoleValue(isaac,EM_RoleValue_register7,20)
		end
		if mob1XX==4 then
			mob1=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,501,1)												
			SetPlot( mob1,"dead","ic_BOSS45_23_1",0 )---免改
			BeginPlot(mob1 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(mob1,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register1,0)
		elseif mob2XX==4 then										
			mob2=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,502,1)
			SetPlot( mob2,"dead","ic_BOSS45_23_2",0 )---免改
			BeginPlot(mob2 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(mob2,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register2,0)	
		elseif mob3XX==4 then
			mob3=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,503,1)
			SetPlot( mob3,"dead","ic_BOSS45_23_3",0 )---免改
			BeginPlot(mob3 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(mob3,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register3,0)
		elseif mob4XX==4 then
			mob4=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,504,1)				
			SetPlot( mob4,"dead","ic_BOSS45_23_4",0 )---免改
			BeginPlot(mob4 , "ic_BOSS45_23_7" , 0)---免改	
			WriteRoleValue(mob4,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register4,0)			
		elseif mob5XX==4 then
			mob5=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,505,1)
			SetPlot( mob5,"dead","ic_BOSS45_23_5",0 )---免改
			BeginPlot(mob5 , "ic_BOSS45_23_7" , 0)---免改
			WriteRoleValue(mob5,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register5,0)
		elseif mob6XX==4 then
			mob6=ic_mob_flag_add_Y_N( isaac,mob1_6_id[play_Mode],781014,506,1)						
			SetPlot( mob6,"dead","ic_BOSS45_23_6",0 )---免改	
			BeginPlot(mob6 , "ic_BOSS45_23_7" , 0)---免改	
			WriteRoleValue(mob6,EM_RoleValue_PID,isaac)
			WriteRoleValue(isaac,EM_RoleValue_register6,0)
		end
		if mob1XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register1,2)
			WriteRoleValue(mob11,EM_RoleValue_register1,1)
			WriteRoleValue(mob12,EM_RoleValue_register1,1)
			SetModeEx( mob11  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob12  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob11)
			ic_NoAttackPlayer( mob12)
		elseif mob2XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register2,2)
			WriteRoleValue(mob21,EM_RoleValue_register1,1)
			WriteRoleValue(mob22,EM_RoleValue_register1,1)
			SetModeEx( mob21  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob22  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob21)
			ic_NoAttackPlayer( mob22)
		elseif mob3XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register3,2)
			WriteRoleValue(mob31,EM_RoleValue_register1,1)
			WriteRoleValue(mob32,EM_RoleValue_register1,1)
			SetModeEx( mob31  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob32  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob31)
			ic_NoAttackPlayer( mob32)
		elseif mob4XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register4,2)
			WriteRoleValue(mob41,EM_RoleValue_register1,1)
			WriteRoleValue(mob42,EM_RoleValue_register1,1)
			SetModeEx( mob41  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob42  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob41)
			ic_NoAttackPlayer( mob42)			
		elseif mob5XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register5,2)
			WriteRoleValue(mob51,EM_RoleValue_register1,1)
			WriteRoleValue(mob52,EM_RoleValue_register1,1)
			SetModeEx( mob51  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob52  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob51)
			ic_NoAttackPlayer( mob52)
		elseif mob6XX==1 then
			WriteRoleValue(isaac,EM_RoleValue_register6,2)
			WriteRoleValue(mob61,EM_RoleValue_register1,1)
			WriteRoleValue(mob62,EM_RoleValue_register1,1)	
			SetModeEx( mob61  , EM_SetModeType_Searchenemy, false )				---索敵
			SetModeEx( mob62  , EM_SetModeType_Searchenemy, false )				---索敵
			ic_NoAttackPlayer( mob61)
			ic_NoAttackPlayer( mob62)
		end
	end	
end  
function ic_BOSS45_23_mob0_1()--守衛技能ok
local mob=OwnerID()
local ZoneID=ic_ReadRoleValue(mob,17)
local Zone={146,147,148}
SetPlot(mob,"dead","ic_BOSS45_23_BOSSXX",0 )
AddBuff(mob,620908,0 ,-1 )
	if 		ZoneID==Zone[1] then														
		ic_All_mob_KKplay_4(498319,1500,5,5,2,0,
						498318,4,20,11,3,0,
						498314,100,10,15,3,0,
						498320,0,30,20,3,0)
	elseif 	ZoneID==Zone[2] then													
		ic_All_mob_KKplay_4(498319,1500,5,5,2,0,
						498318,4,20,11,3,0,
						498314,100,10,15,3,0,
						498320,0,30,20,3,0)
	elseif 	ZoneID==Zone[3] then														
		ic_All_mob_KKplay_4(498319,1500,5,5,2,0,
						498318,4,20,11,3,0,
						498314,100,10,15,3,0,
						498320,0,30,20,3,0)
	end
end
function ic_BOSS45_23_12_1() 
local mob=OwnerID() 
local mob0_id	={106124,106124,106124}														---守衛
local mob11_id	={106125,106125,106125}														---雄蟻1
local mob22_id	={106126,106126,106126}														---雄蟻2
local skill_1	={498317,498317,498317}
local skill_2	={498315,498315,498315}
local skill_3	={498313,498313,498313}
local skill_4	={498321,498321,498321}
local skill_1_LV={15,15,15}
local skill_2_LV={3000,3000,3000}
local skill_3_LV={0,0,0}
local skill_4_LV={0,0,0}
local isaac=ReadRoleValue(mob, EM_RoleValue_PID)
local mobxx
local mob123456XX
local mobff
local mob1=0
local gogo=0
local go123=0
local RoomID=ReadRoleValue(mob,EM_RoleValue_RoomID)
local Boss100
local X0
local Y0
local Z0
local time1=0
local time2=0
local time3=0
local time4=0
local time5=0
local play1x={} 
local plays=0
local AttackTarget
local mob1234
local play_Mode=ic_ReadRoleValue(isaac,5)													---難度 1=困難12人 2=正常6人 3=簡單6人 
SetPlot(mob,"dead","ic_BOSS45_23_AllXX",0 )---免改
	while true do
		mobxx=ReadRoleValue(mob, EM_RoleValue_register5)
		mobff=ReadRoleValue(mob, EM_RoleValue_register4)
		gogo=ReadRoleValue(mob, EM_RoleValue_register1)
		go123=ReadRoleValue(mob, EM_RoleValue_register2)
		if gogo==0 then
			if hatelistcount(mob)~=0 then
				local Search = SearchRangeNPC (mob, 100 )
						for i = 0 , table.getn(Search) do
							if Search[i] ~= mob then
								if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob0_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 or 
									ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob11_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0	or 
									ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob22_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 then
									AddBuff(mob,620916,0 ,-1 )
								end		
							end
						end
				AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID ) 		
				time1=time1+1
				time2=time2+1
				time3=time3+1
				time4=time4+1
				if time1>=3 then--單體
					ic_magic_ing(mob,5)
					CastSpellLV(mob,AttackTarget , skill_1[play_Mode] , skill_1_LV[play_Mode])
					sleep(10)
					time1=0
				end
				if time2>=11 then--隨機範圍
					ic_magic_ing(mob,5)
					play1x=DW_HateRemain(0)	---1排坦
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV(mob,play1x[plays] , skill_2[play_Mode] , skill_2_LV[play_Mode] )
					sleep(20)
					time2=0
				end
				if time3>=15 then--全場
					ic_magic_ing(mob,5)
					CastSpellLV(mob,mob, skill_3[play_Mode] , skill_3_LV[play_Mode])
					sleep(10)
					time3=0
				end
				if time4>=20 then--自補
					ic_magic_ing(mob,5)
					CastSpellLV(mob,mob, skill_4[play_Mode] , skill_4_LV[play_Mode])
					sleep(10)
					time4=0
				end
			elseif hatelistcount(mob)==0 then	
				time1=0
				time2=0
				time3=0
				time4=0
				ic_NoAttackPlayer(mob)
			end
		elseif gogo==1 then
			if hatelistcount(mob)~=0 then
					local Search = SearchRangeNPC (mob, 100 )
							for i = 0 , table.getn(Search) do
								if Search[i] ~= mob then
									if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob0_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 or 
										ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob11_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0	or 
										ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob22_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 then
									AddBuff(mob,620916,0 ,-1 )
									end	
								end
							end	
					AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID ) 		
					time1=time1+1
					time2=time2+1
					time3=time3+1
					time4=time4+1
					if time1>=3 then--單體
						ic_magic_ing(mob,5)
						CastSpellLV(mob,AttackTarget , skill_1[play_Mode] , skill_1_LV[play_Mode])
						sleep(10)
						time1=0
					end
					if time2>=11 then--隨機範圍
						ic_magic_ing(mob,5)
						play1x=DW_HateRemain(0)	---1排坦
						plays=DW_Rand(table.getn(play1x))
						CastSpellLV(mob,play1x[plays] , skill_2[play_Mode] , skill_2_LV[play_Mode] )
						sleep(20)
						time2=0
					end
					if time3>=15 then--全場
						ic_magic_ing(mob,5)
						CastSpellLV(mob,mob, skill_3[play_Mode] , skill_3_LV[play_Mode])
						sleep(10)
						time3=0
					end
					if time4>=20 then--自補
						ic_magic_ing(mob,5)
						CastSpellLV(mob,mob, skill_4[play_Mode] , skill_4_LV[play_Mode])
						sleep(10)
						time4=0
					end		
			elseif hatelistcount(mob)==0 then
				time1=0
				time2=0
				time3=0
				time4=0
				gogo=ReadRoleValue(mob, EM_RoleValue_register1)
				go123=ReadRoleValue(mob, EM_RoleValue_register2)
				mob1234=ReadRoleValue(mob, EM_RoleValue_register10)
				ic_NoAttackPlayer(mob)
				if go123==0 then
					MoveToFlagEnabled(mob, false)
					WriteRoleValue(mob,EM_RoleValue_IsWalk,0)
					Hide(mob)
					Show(mob,RoomID)
					SetModeEx(mob, EM_SetModeType_Searchenemy, false )				---索敵
					SetModeEx(mob, EM_SetModeType_Strikback, false )				---反擊
					if mob1234==1 then--4王1號
						DW_MoveToFlag(mob, 781014 ,481,0)
					elseif mob1234==2 then--4王2號
						DW_MoveToFlag(mob, 781014 ,491,0)
					elseif mob1234==3 then--5王1號
						DW_MoveToFlag(mob, 781014 ,581,0)
					elseif mob1234==4 then--5王2號
						DW_MoveToFlag(mob, 781014 ,591,0)
					end
					SetModeEx(mob, EM_SetModeType_Searchenemy, true )				---索敵
					SetModeEx(mob, EM_SetModeType_Strikback, true )				---反擊	
					WriteRoleValue(mob,EM_RoleValue_register2,go123+1)
					sleep(20)
				elseif	go123==1 then
					MoveToFlagEnabled(mob, false)
					WriteRoleValue(mob,EM_RoleValue_IsWalk,0)
					Hide(mob)
					Show(mob,RoomID)
					SetModeEx(mob, EM_SetModeType_Searchenemy, false )				---索敵
					SetModeEx(mob, EM_SetModeType_Strikback, false )				---反擊
					if mob1234==1 then--4王1號
						DW_MoveToFlag(mob, 781014 ,482,0)
					elseif mob1234==2 then--4王2號
						DW_MoveToFlag(mob, 781014 ,492,0)
					elseif mob1234==3 then--5王1號
						DW_MoveToFlag(mob, 781014 ,582,0)
					elseif mob1234==4 then--5王2號
						DW_MoveToFlag(mob, 781014 ,592,0)
					end
					SetModeEx(mob, EM_SetModeType_Searchenemy, true )				---索敵
					SetModeEx(mob, EM_SetModeType_Strikback, true )				---反擊	
					WriteRoleValue(mob,EM_RoleValue_register2,go123+1)
					sleep(20)
				elseif	go123==2 then
					MoveToFlagEnabled(mob, false)
					WriteRoleValue(mob,EM_RoleValue_IsWalk,0)
					Hide(mob)
					Show(mob,RoomID)
					SetModeEx(mob, EM_SetModeType_Searchenemy, false )				---索敵
					SetModeEx(mob, EM_SetModeType_Strikback, false )				---反擊
					if mob1234==1 then--4王1號
						DW_MoveToFlag(mob, 781014 ,483,0)
					elseif mob1234==2 then--4王2號
						DW_MoveToFlag(mob, 781014 ,493,0)
					elseif mob1234==3 then--5王1號
						DW_MoveToFlag(mob, 781014 ,583,0)
					elseif mob1234==4 then--5王2號
						DW_MoveToFlag(mob, 781014 ,593,0)
					end
					SetModeEx(mob, EM_SetModeType_Searchenemy, true )				---索敵
					SetModeEx(mob, EM_SetModeType_Strikback, true )				---反擊	
					WriteRoleValue(mob,EM_RoleValue_register2,go123+1)
					WriteRoleValue(mob,EM_RoleValue_register1,2)
				end		
			end	
		elseif gogo==2 then	
			if hatelistcount(mob)~=0 then
				WriteRoleValue(mob,EM_RoleValue_register9,1)
				local Search = SearchRangeNPC (mob, 100 )
						for i = 0 , table.getn(Search) do
							if Search[i] ~= mob then
								if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob0_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 or 
									ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob11_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0	or 
									ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob22_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 then
									AddBuff(mob,620916,0 ,-1 )
								end	
							end
						end	
				AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID ) 		
				time1=time1+1
				time2=time2+1
				time3=time3+1
				time4=time4+1
				if time1>=3 then--單體
					ic_magic_ing(mob,5)
					CastSpellLV(mob,AttackTarget , skill_1[play_Mode] , skill_1_LV[play_Mode])
					sleep(10)
					time1=0
				end
				if time2>=11 then--隨機範圍
					ic_magic_ing(mob,5)
					play1x=DW_HateRemain(0)	---1排坦
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV(mob,play1x[plays] , skill_2[play_Mode] , skill_2_LV[play_Mode] )	
					sleep(20)
					time2=0
				end
				if time3>=15 then--全場
					ic_magic_ing(mob,5)
					CastSpellLV(mob,mob, skill_3[play_Mode] , skill_3_LV[play_Mode])
					sleep(10)
					time3=0
				end
				if time4>=20 then--自補
					ic_magic_ing(mob,5)
					CastSpellLV(mob,mob, skill_4[play_Mode] , skill_4_LV[play_Mode])
					sleep(10)
					time4=0
				end		
			elseif hatelistcount(mob)==0  then
				time1=0
				time2=0
				time3=0
				time4=0
				WriteRoleValue(mob,EM_RoleValue_register9,0)
				ic_NoAttackPlayer(mob)
				sleep(30)
				time5=ReadRoleValue(mob, EM_RoleValue_register9)
				if  time5==0 then
					SetModeEx(mob, EM_SetModeType_Strikback, false )					
					SetModeEx(mob, EM_SetModeType_Searchenemy, false )
					ic_NoAttackPlayer(mob)
					AddBuff(mob,509647,0 ,-1 )
					sleep(10)
					SetPosByFlag(mob, 781014 , mobff )
					CancelBuff(mob, 509647)
					SetModeEx(mob, EM_SetModeType_Strikback, true )
					SetModeEx(mob, EM_SetModeType_Searchenemy, true )	
					sleep(10)
					if mobxx==1 then
						mob123456XX=ReadRoleValue(isaac , EM_RoleValue_register1)
						WriteRoleValue(isaac,EM_RoleValue_register1,mob123456XX+1)
					elseif mobxx==2 then
						mob123456XX=ReadRoleValue(isaac , EM_RoleValue_register2)
						WriteRoleValue(isaac,EM_RoleValue_register2,mob123456XX+1)
					elseif mobxx==3 then
						mob123456XX=ReadRoleValue(isaac , EM_RoleValue_register3)
						WriteRoleValue(isaac,EM_RoleValue_register3,mob123456XX+1)
					elseif mobxx==4 then
						mob123456XX=ReadRoleValue(isaac , EM_RoleValue_register4)
						WriteRoleValue(isaac,EM_RoleValue_register4,mob123456XX+1)
					elseif mobxx==5 then
						mob123456XX=ReadRoleValue(isaac , EM_RoleValue_register5)
						WriteRoleValue(isaac,EM_RoleValue_register5,mob123456XX+1)
					elseif mobxx==6 then
						mob123456XX=ReadRoleValue(isaac , EM_RoleValue_register6)
						WriteRoleValue(isaac,EM_RoleValue_register6,mob123456XX+1)
					end
					WriteRoleValue(mob,EM_RoleValue_register1,0)
					WriteRoleValue(mob,EM_RoleValue_register2,0)
				end	
			end
		elseif gogo==3 then
			if hatelistcount(mob)~=0 then
				mob1=1
				local Search = SearchRangeNPC (mob, 100 )
						for i = 0 , table.getn(Search) do
							if Search[i] ~= mob then
								if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob0_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 or 
									ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob11_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0	or 
									ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	mob22_id[play_Mode] and ReadRoleValue(Search[i],EM_RoleValue_IsDead)== 0 then
									AddBuff(mob,620916,0 ,-1 )
								end		
							end
						end
				AttackTarget = ReadRoleValue(mob, EM_RoleValue_AttackTargetID ) 		
				time1=time1+1
				time2=time2+1
				time3=time3+1
				time4=time4+1
				if time1>=3 then--單體
					ic_magic_ing(mob,5)
					CastSpellLV(mob,AttackTarget , skill_1[play_Mode] , skill_1_LV[play_Mode])
					sleep(10)
					time1=0
				end
				if time2>=11 then--隨機範圍
					ic_magic_ing(mob,5)
					play1x=DW_HateRemain(0)	---1排坦
					plays=DW_Rand(table.getn(play1x))
					CastSpellLV(mob,play1x[plays] , skill_2[play_Mode] , skill_2_LV[play_Mode] )
					sleep(20)
					time2=0
				end
				if time3>=15 then--全場
					ic_magic_ing(mob,5)
					CastSpellLV(mob,mob, skill_3[play_Mode] , skill_3_LV[play_Mode])
					sleep(10)
					time3=0
				end
				if time4>=20 then--自補
					ic_magic_ing(mob,5)
					CastSpellLV(mob,mob, skill_4[play_Mode] , skill_4_LV[play_Mode])
					sleep(10)
					time4=0
				end
			elseif hatelistcount(mob)==0 then	
				if mob1==1 then
					AddBuff(mob,509647,0 ,-1 )
					sleep(10)
					SetPosByFlag(mob, 781014 , mobff )
					CancelBuff(mob, 509647)
					mob1=2
				end	
				time1=0
				time2=0
				time3=0
				time4=0
				ic_NoAttackPlayer(mob)
			end	
		end
		sleep(10)
	end
end
function ic_BOSS45_23_1() 																	---共用
local isaac=ReadRoleValue(OwnerID() , EM_RoleValue_PID)
WriteRoleValue(isaac,EM_RoleValue_register1,1)
sleep(5)
DelObj(OwnerID())
end
function ic_BOSS45_23_2() 																	---共用
local isaac=ReadRoleValue(OwnerID() , EM_RoleValue_PID)
WriteRoleValue(isaac,EM_RoleValue_register2,1)
sleep(5)
DelObj(OwnerID())
end
function ic_BOSS45_23_3() 																	---共用
local isaac=ReadRoleValue(OwnerID() , EM_RoleValue_PID)
WriteRoleValue(isaac,EM_RoleValue_register3,1)
sleep(5)
DelObj(OwnerID())
end
function ic_BOSS45_23_4() 																	---共用
local isaac=ReadRoleValue(OwnerID() , EM_RoleValue_PID)
WriteRoleValue(isaac,EM_RoleValue_register4,1)
sleep(5)
DelObj(OwnerID())
end
function ic_BOSS45_23_5() 																	---共用
local isaac=ReadRoleValue(OwnerID() , EM_RoleValue_PID)
WriteRoleValue(isaac,EM_RoleValue_register5,1)
sleep(5)
DelObj(OwnerID())
end
function ic_BOSS45_23_6() 																	---共用
local isaac=ReadRoleValue(OwnerID() , EM_RoleValue_PID)
WriteRoleValue(isaac,EM_RoleValue_register6,1)
sleep(5)
DelObj(OwnerID())
end
function ic_BOSS45_23_7() 																	---共用(小蟲表演)
	while true do
		PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		sleep(200)
	end
end
function ic_BOSS45_23_AllXX() 																---共用
local isaac=ReadRoleValue(OwnerID() , EM_RoleValue_PID)
local MOBXX=0
MOBXX=ReadRoleValue(isaac, EM_RoleValue_register7)
WriteRoleValue(isaac,EM_RoleValue_register7,MOBXX+1)
end
function ic_BOSS45_23_BOSSXX() 																---共用
local isaac=ReadRoleValue(OwnerID() , EM_RoleValue_PID)
WriteRoleValue(isaac,EM_RoleValue_register8,1)
end