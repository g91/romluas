function Cl_DE3Y_Frog_Table(Num)
	local Frog_Table = {}
	Frog_Table[1] = 106660
	Frog_Table[2] = 106659
	Frog_Table[3] = 106661
	Frog_Table[4] = 106662
	Frog_Table[5] = 106663
	Frog_Table[6] = 120468   
	Frog_Table[7] = 106664 
	Frog_Table[8] = 120418
	Frog_Table[9] = 120411
	Frog_Table[10] = 120469
	Frog_Table[11] = 120517  ---需HIDE起來
	if Num > 0 then
		return Frog_Table[Num]
	elseif Num == 0 then
		Table_Num = table.getn( Frog_Table )
		return Table_Num
	elseif Num == nil then
		return Frog_Table
	end
end
function Cl_DE3Y_Flag_Table(Num)
	local Flag_Table = {}
	Flag_Table[1] = 781100
	Flag_Table[2] = 781101
	Flag_Table[3] = 781102
	Flag_Table[4] = 781103
	Flag_Table[5] = 781104
	Flag_Table[6] = 781105 ----隨機效果球
	Flag_Table[7] = 781108 ----必吃路線
	return Flag_Table[Num]
end
function Cl_DE3Y_BuffTable(Num)
	local Buff_Table = {}
	Buff_Table[1] = 622071
	Buff_Table[2] = 622072
	Buff_Table[3] = 622073
	Buff_Table[4] = 622074
	Buff_Table[5] = 622075
	return Buff_Table[Num]
end
function Cl_DE3Y_BuffSkill(Num)
	local Buff_Table = {}
	Buff_Table[1] = {622058,"[SC_DE3Y_FORG_PLAY_622058]"}  ---喜從天降
	Buff_Table[2] = {622060,"[SC_DE3Y_FORG_PLAY_622060]"}  ---火焰陷阱
	Buff_Table[3] = {622061,"[SC_DE3Y_FORG_PLAY_622061]"}  ---跑得快
	Buff_Table[4] = {622059,"[SC_DE3Y_FORG_PLAY_622059]"}  ---美味蟲肉大餐
	Buff_Table[5] = {622057,"[SC_DE3Y_FORG_PLAY_622057]"}  ---霹靂嬌蛙
	if Num ~= 0 then
		return Buff_Table[Num]
	elseif Num == 0 then
		local Rand = DW_Rand(5)
		return Buff_Table[Rand]
	end
end
function Cl_DE3Y_Give_Gift(Rank)
	local Gift = {}
	Gift[1] = 241126
	Gift[2] = 241127
	Gift[3] = 241128
	return Gift[Rank]
end
function Cl_DE3Y_Frog_Game_NPC()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Register = {}
	local Play_Num = 0
	local Start_Time = 300
	local BuffID = 622056
	local Flag_Table = Cl_DE3Y_Flag_Table(6)
	local NPCID = Cl_DE3Y_Frog_Table(8)
	local Buff = 0
	local ItemID = 546204
	local Ball = SearchRangeNPC ( OwnerID , 400 )
	local Ball_Num = table.getn( Ball )
	for i = 1 , Ball_Num , 1 do
		if ReadRoleValue( Ball[i] , EM_RoleValue_OrgID ) == 100938 then
			SetModeEx( Ball[i] , EM_SetModeType_Show, false) ----秀出
		end
	end
	WriteRoleValue ( OwnerID , EM_RoleValue_Register8 , Start_Time )
	while 1 do
		sleep ( 10 )
		for i = 0 , 4 , 1 do
			if ReadRoleValue( OwnerID , EM_RoleValue_Register+i ) > 0 then
				Register[i+1] = ReadRoleValue( OwnerID , EM_RoleValue_Register+i )
			end
		end
		Play_Num = table.getn( Register )
		if Play_Num > 0 and Play_Num < 5 then
			Start_Time = Start_Time - 1
			---DebugMsg( 0 , RoomID , "Start_Time="..Start_Time.."_"..Play_Num )
			WriteRoleValue ( OwnerID , EM_RoleValue_Register8 , Start_Time )			
			if Start_Time == 0 then
				Cl_DE3Y_Frog_Game_CtarlAI()
				for i = 1 , Play_Num , 1 do
					if CheckID( Register[i] )  == true then
						GiveBodyItem ( Register[i], ItemID, 1 )
						CancelBuff_NoEvent( Register[i] , BuffID ) ---清除BUFF
						Buff = Cl_DE3Y_BuffTable(i)
						CancelBuff_NoEvent( Register[i] , Buff ) ---清除BUFF
						CancelBuff_NoEvent( Register[i] , 507828 ) ---清除BUFF
						Cl_DE3Y_CancelBuff()
					end
				end
				--Cl_DE3Y_DELOBJ()
				Register = {}
				Start_Time = 300
				WriteRoleValue ( OwnerID , EM_RoleValue_Register8 , Start_Time )
			end
		elseif Play_Num == 5 then
			Cl_DE3Y_Frog_Game_CtarlAI()
			for i = 1 , Play_Num , 1 do
				if CheckID( Register[i] )  == true then
					GiveBodyItem ( Register[i], ItemID, 1 )
					CancelBuff_NoEvent( Register[i] , BuffID ) ---清除BUFF
					Buff = Cl_DE3Y_BuffTable(i)
					CancelBuff_NoEvent( Register[i] , Buff ) ---清除BUFF
					CancelBuff_NoEvent( Register[i] , 507784 ) ---清除BUFF
					CancelBuff_NoEvent( Register[i] , 507828 ) ---清除BUFF
					Cl_DE3Y_CancelBuff()
				end
			end
			--Cl_DE3Y_DELOBJ()
			Register = {}
			Start_Time = 300
			WriteRoleValue ( OwnerID , EM_RoleValue_Register8 , Start_Time )
		end
	end
end
function Cl_DE3Y_Frog_Game_CtarlAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Frog_Table = 0
	local Flag_Table = 0
	local FrogID = {}
	local FrogballOrgID =  Cl_DE3Y_Frog_Table(6)
	local DoorID = 106664
	local HideBall = {}
	local Frog_Game = 0
	local Ranking_Table = {}
	local Rank = 0
	local Game_Num = 0
	local FrogOrgID = 0
	local fnuction_Table = {}
	fnuction_Table["Frog"] = "Cl_DE3Y_Frog_Run"
	local BuffID = 622053
	WriteRoleValue( OwnerID , EM_RoleValue_Register9 , 1 )
	local Play_Num = {}
	local RankPlay_Table = {}
	local FlagID = Cl_DE3Y_Flag_Table(6)
	local Buff = 0
	local fire = 0
	local Flag_OP = Cl_DE3Y_Flag_Table(6)
	local Over_Time = 0
	local FlagNum = 0
	local PlayID = 0
	local MessagFlag = 0
	local Del_Table = {}
	sleep ( 10 )
	for i = 0 , 4 , 1 do
		Flag_Table = Cl_DE3Y_Flag_Table(i+1)
		HideBall[i+1] = CreateObjByFlag( FrogballOrgID , Flag_Table, 17 , 1 )  ------------生出魔術帽
		SetModeEx( HideBall[i+1] , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( HideBall[i+1] , EM_SetModeType_Move, false) ---移動	(否)
		SetModeEx( HideBall[i+1] , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( HideBall[i+1] , EM_SetModeType_Mark, false)			---可點選(是)
		SetModeEx( HideBall[i+1] , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
		SetModeEx( HideBall[i+1] , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( HideBall[i+1] , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
		AddToPartition( HideBall[i+1] , RoomID )
		Play_Num[i+1] = ReadRoleValue( OwnerID , EM_RoleValue_Register+i ) ----紀錄讀取到的層數
		if Play_Num[i+1] ~= nil then
			if CheckID( Play_Num[i+1] )  == true then
				SetPosByFlag( Play_Num[i+1] , Flag_OP , i+1 )
			end
		end
		Frog_Table = Cl_DE3Y_Frog_Table(i+1)
		FrogID[i+1] = Cl_CreateObj_ForFlag( Frog_Table , Flag_Table , 0 , RoomID ) ----產生透明球專用
		WriteRoleValue ( FrogID[i+1] , EM_RoleValue_Register1 , OwnerID )
		WriteRoleValue ( FrogID[i+1] , EM_RoleValue_Register4 , Play_Num[i+1] )
		SetModeEx( FrogID[i+1] , EM_SetModeType_Mark, true)			---可點選(是)
		SetModeEx( FrogID[i+1] , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
		SetModeEx( FrogID[i+1] , EM_SetModeType_Move, true ) ---移動	(否)
		MoveToFlagEnabled( FrogID[i+1] , false ) ---系統內建的路徑關掉
		table.insert( Del_Table , FrogID[i+1] )
	end
	local MoveLine = Cl_DE3Y_Forg_MoveLineCreate()
	local RandBAll = Cl_DE3Y_CreateRandBAll()
	local CheckDis =  Cl_CreateObj_ForFlag( Cl_DE3Y_Frog_Table(11) , 781105 , 99 , RoomID ) ----產生透明球專用
	SetModeEx( CheckDis , EM_SetModeType_Show, false) ----秀出
	table.insert( Del_Table , CheckDis )
	ScriptMessage( OwnerID , 0 , 2 , "[SC_DE3Y_FORG_RUN_15]" , 0 )
	local Play = table.getn( Play_Num )
	for i = 0 , Play-1 , 1 do
		StartClientCountDown ( Play_Num[i+1], 5, 0, 0, 0, 0, "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數10秒
	end	
	for i = 4 , 0 , -1 do
		sleep ( 10 )
		--say ( OwnerID , "Time="..i )
	end
	PlayMotion ( OwnerID , ruFUSION_MIME_EMOTE_VICTORY )
	say ( OwnerID , "[SC_DE3Y_FORG_RUN_16]")
	sleep ( 10 )
	for i = 1 , 5 , 1 do
		WriteRoleValue( CheckDis , EM_RoleValue_Register+i , FrogID[i] )
		if ReadRoleValue( FrogID[i] , EM_RoleValue_Register4 ) ~= 0 then--讀取隱藏物件位於哪個Zone
			CallPlot( FrogID[i] , "Cl_DE3Y_Forg_Move" , 0 )
		elseif ReadRoleValue( FrogID[i] , EM_RoleValue_Register4 ) == 0 then--讀取隱藏物件位於哪個Zone
			CallPlot( FrogID[i] , "Cl_DE3Y_Frog_Run" , i )
		end
	end
	CallPlot( CheckDis , "Cl_DE3Y_CheckDis_Forg" , 300 )
	WriteRoleValue( OwnerID , EM_RoleValue_PID , 0 )
	WriteRoleValue ( OwnerID , EM_RoleValue_Register7 , 1 )
	--WriteRoleValue ( OwnerID , EM_RoleValue_Register8 , 1 )
	while ReadRoleValue ( OwnerID , EM_RoleValue_PID ) ~= 1  do
		sleep ( 5 )
		for i = 1 , 5 , 1 do
			if ReadRoleValue ( FrogID[i] , EM_RoleValue_PID ) == 1 then
				Rank = Rank + 1		
				Ranking_Table[Rank] = FrogID[i]
				RankPlay_Table[Rank] = Play_Num[i]
				WriteRoleValue( FrogID[i] , EM_RoleValue_PID , 2 )
				--DebugMsg( 0 , RoomID , "PlayerName="..GetName( PlayID ).."_"..Rank )
			end
		end
		Game_Num = table.getn( Ranking_Table )
		if Game_Num >= 5 then
			for i = 1 , 5 , 1 do
				PlayID = ReadRoleValue ( Ranking_Table[i] , EM_RoleValue_Register4 )
				if PlayID > 0 then
					if i == 1 then
						if CheckID( PlayID ) == true then
							local PlayerName = GetName( PlayID )
							local ZoneID = ReadRoleValue( OwnerID , EM_RoleValue_ZoneID )
							local RealZoneID = ReadRoleValue( OwnerID , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
							if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
								RunningMsgEx( OwnerID , 2 , 3 , "[SC_DE3Y_FORG_RUN_14][$SETVAR1="..PlayerName.."]"  )
							end
						end
					end
					GiveBodyItem ( RankPlay_Table[i] , 209561 , 1 )
					GiveBodyItem ( RankPlay_Table[i] , 241114 , 3 )
					if i <= 3 then
						GiveBodyItem ( RankPlay_Table[i] , Cl_DE3Y_Give_Gift(i) , 1 )
					end
				end
			end
			WriteRoleValue( OwnerID , EM_RoleValue_PID , 1 )
		end
		Over_Time = Over_Time + 1
		--DebugMsg( 0 , RoomID , "Over_Time="..Over_Time )
		if Over_Time >= 600 then
			for i = 1 , 5 , 1 do
				if ReadRoleValue ( FrogID[i] , EM_RoleValue_PID ) == 0 then
					SetModeEx( FrogID[i] , EM_SetModeType_Move, false ) ---移動	(否)
					PlayID = ReadRoleValue ( FrogID[i] , EM_RoleValue_Register4 )
					ScriptMessage ( PlayID , PlayID , 1 , "[SC_DE3Y_FORG_RUN_20]" , C_SYSTEM )
					WriteRoleValue( FrogID[i] , EM_RoleValue_Register9 , 2 )
					FlagNum = Cl_DE3Y_Flag_Table(i)
					SetPosByFlag( FrogID[i] , FlagNum , 17 )
				end
			end
			WriteRoleValue( OwnerID , EM_RoleValue_PID , 1 )
		elseif Over_Time == 480 then
			if MessagFlag == 0 then
				for i = 1 , 5 , 1 do
					if ReadRoleValue ( FrogID[i] , EM_RoleValue_PID ) == 0 then
						PlayID = ReadRoleValue ( FrogID[i] , EM_RoleValue_Register4 )
						if PlayID ~= nil then
							ScriptMessage ( PlayID , PlayID , 1 , "[SC_DE3Y_FORG_RUN_19]" , C_SYSTEM )
						end
					end
				end
				MessagFlag = 1
			end
		end
	end
	WriteRoleValue ( OwnerID , EM_RoleValue_Register8 , 300 )
	WriteRoleValue ( OwnerID , EM_RoleValue_Register9 , 0 )
	WriteRoleValue ( OwnerID , EM_RoleValue_Register , 0 )
	for i = 0 , 9 , 1 do
		WriteRoleValue( OwnerID , EM_RoleValue_Register+i , 0 )
	end
	ScriptMessage( OwnerID , 0 , 2 , "[SC_DE3Y_FORG_RUN_18]" , 0 )
	for i = 1 , table.getn( FrogID ) , 1 do
		if FrogID[i] ~= nil then
			delobj ( FrogID[i] )
		end
	end
	for i = 1 , table.getn( MoveLine ) , 1 do
		if MoveLine[i] ~= nil then
			delobj ( MoveLine[i] )
		end
	end
	for i = 1 , table.getn( RandBAll ) , 1 do
		if  CheckID( RandBAll[i] ) == true then	
			delobj ( RandBAll[i] )
		end
	end
	for i = 1 , table.getn( HideBall ) , 1 do
		if HideBall[i] ~= nil then
			delobj ( HideBall[i] )
		end
	end
	delobj ( CheckDis )
end
function Cl_DE3Y_Forg_Move()
	local OwnerID = OwnerID()
	local Player = ReadRoleValue( OwnerID , EM_RoleValue_Register4 ) --讀取隱藏物件位於哪個Zone
	local Game_Npc = ReadRoleValue( OwnerID , EM_RoleValue_Register1 ) --讀取隱藏物件位於哪個Zone
	Addbuff ( OwnerID  , 622269 , 0 , -1 ) ---兔子變大
	local Dis = GetDistance( OwnerID , Player );
	local Move_Time = 2
	local Ball = SearchRangeNPC ( OwnerID , 12 )
	local Ball_Num = table.getn( Ball )
	local fire = 0
	local Ranking = ReadRoleValue ( Game_Npc , EM_RoleValue_Register7 )
	while ReadRoleValue ( OwnerID , EM_RoleValue_PID ) == 0 do
		sleep (3)
		Ball = SearchRangeNPC ( OwnerID , 12 )
		Ball_Num = table.getn( Ball )
		for i = 1 , Ball_Num , 1 do
			if ReadRoleValue( Ball[i] , EM_RoleValue_OrgID ) == 120468 then
				if ReadRoleValue( OwnerID , EM_RoleValue_Register9 ) == 2 then
					Ranking = ReadRoleValue ( Game_Npc , EM_RoleValue_Register7 )
					WriteRoleValue( Game_Npc , EM_RoleValue_Register7 , Ranking+1 )
					CancelBuff_NoEvent( OwnerID , 622269 ) ---清除BUFF
					if ReadRoleValue( OwnerID , EM_RoleValue_Register4 ) ~= 0 then
						ScriptMessage ( Player , Player , 1 , "[SC_DE3Y_FORG_RUN_13][$SETVAR1="..Ranking.."]" , C_SYSTEM )
						ScriptMessage ( Player , Player , 0 , "[SC_DE3Y_FORG_RUN_13][$SETVAR1="..Ranking.."]" , C_SYSTEM )
					end
					WriteRoleValue( OwnerID , EM_RoleValue_PID , 1 )
					WriteRoleValue( OwnerID , EM_RoleValue_Register9 , 3 )
					break
				elseif ReadRoleValue( OwnerID , EM_RoleValue_Register9 ) < 2 then
					local FlagID = ReadRoleValue( OwnerID , EM_RoleValue_Register9 )
					SetPosByFlag( Player , 781105 , 0 )
					SetPosByFlag( OwnerID , 781105 , 0 )
					ScriptMessage ( Player , Player , 1 , "[SC_DE3Y_FORG_RUN_12]" , 0 )
				end
			elseif ReadRoleValue( Ball[i] , EM_RoleValue_OrgID ) == 120418 then
				if ReadRoleValue( OwnerID , EM_RoleValue_Register9 ) == 0 then
					Addbuff ( OwnerID  , 622115 , 0 , -1 ) ---兔子變大
					if ReadRoleValue( OwnerID , EM_RoleValue_Register4 ) ~= 0 then
						ScriptMessage ( Player , Player , 1 , "[SC_DE3Y_FORG_RUN_10]" , C_SYSTEM )
					end
					WriteRoleValue( OwnerID , EM_RoleValue_Register9 , 1 )
				end
			elseif ReadRoleValue( Ball[i] , EM_RoleValue_OrgID ) == 120411 then
				if ReadRoleValue( OwnerID , EM_RoleValue_Register9 ) == 1 then
					Addbuff ( OwnerID  , 622114 , 0 , -1 ) ---兔子變大
					if ReadRoleValue( OwnerID , EM_RoleValue_Register4 ) ~= 0 then
						ScriptMessage ( Player , Player , 1 , "[SC_DE3Y_FORG_RUN_11]" , C_SYSTEM )
					end
					WriteRoleValue( OwnerID , EM_RoleValue_Register9 , 2 )
				elseif ReadRoleValue( OwnerID , EM_RoleValue_Register9 ) < 1 then
					local FlagID = ReadRoleValue( OwnerID , EM_RoleValue_Register9 )
					SetPosByFlag( Player , 781105 , 0 )
					SetPosByFlag( OwnerID , 781105 , 0 )
					ScriptMessage ( Player , Player , 1 , "[SC_DE3Y_FORG_RUN_12]" , 0 )
				end
			end
		end
		Ball = {}
	end
end
function Cl_DE3Y_Forg_RunMove()
	local OwnerID = OwnerID()
	local Player = ReadRoleValue( OwnerID , EM_RoleValue_Register4 ) --讀取隱藏物件位於哪個Zone
	local Dis = GetDistance( OwnerID , Player );
	local BuffID = 0
	if CheckID( Player ) == true then
		Dis = GetDistance( OwnerID , Player )
		if Dis > 10 and Dis <= 50 then
			Cl_DE3Y_CtarlForg_Move()
		elseif Dis <= 10 then
			ScriptMessage ( Player , Player , 1 , "[SC_DE3Y_FORG_RUN_09]" , 0 )
			Cl_DE3Y_CtarlForg_Move()
		elseif Dis > 50 and Dis <= 300 then
			ScriptMessage ( Player , Player , 1 , "[SC_DE3Y_FORG_RUN_26]" , 0 )
		elseif Dis > 300 then
			ScriptMessage ( Player , Player , 1 , "[SC_DE3Y_FORG_RUN_27]" , 0 )
			for i = 1 , 5 , 1 do
				BuffID = Cl_DE3Y_BuffTable(i)
				CancelBuff_NoEvent( Player , BuffID ) ---清除BUFF
			end
			WriteRoleValue( OwnerID , EM_RoleValue_Register4 , 0 )
			CancelBuff_NoEvent( OwnerID , 622269 ) ---清除BUFF
			CallPlot( OwnerID , "Cl_DE3Y_Frog_Run" , 1 )
		end
	elseif  CheckID( Player ) ~= true then
		CancelBuff_NoEvent( OwnerID , 622269 ) ---清除BUFF
		WriteRoleValue( OwnerID , EM_RoleValue_Register4 , 0 )
		CallPlot( OwnerID , "Cl_DE3Y_Frog_Run" , 1 )
	end
end
function Cl_DE3Y_CtarlForg_Move()
	local Obj = OwnerID();
	local RoomID = ReadRoleValue( Obj , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Player = ReadRoleValue( Obj , EM_RoleValue_Register4 ) --讀取隱藏物件位於哪個Zone
	local Tx = ReadRoleValue( Obj, EM_RoleValue_X );
	local Tz = ReadRoleValue( Obj, EM_RoleValue_Z );
	local Od = ReadRoleValue( Player, EM_RoleValue_Dir );
	local Ox = ReadRoleValue( Player, EM_RoleValue_X );
	local Oz = ReadRoleValue( Player, EM_RoleValue_Z );
	local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  
	MoveToFlagEnabled(Obj, false) ---系統內建的路徑關掉
	WriteRoleValue( Obj ,EM_RoleValue_IsWalk , 0 )
	--Hide( Obj )
	--Show( Obj , RoomID )
	local deltaDir = (Dir-Od);
	local X , Y , Z = kg_GetPosRX( Player , nil , 50 , 0 , deltaDir )
	Move( Obj , X , Y , Z )
end
function Cl_DE3Y_Frog_Run(Num)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數 
	local Game_Npc = ReadRoleValue( OwnerID , EM_RoleValue_Register1 ) --讀取隱藏物件位於哪個Zone
	local pley = ReadRoleValue( OwnerID , EM_RoleValue_Register4 ) --讀取隱藏物件位於哪個Zone
	local Flag_Table = Cl_DE3Y_Flag_Table(Num)
	local Sleep_Rand = DW_Rand(3)
	local Ranking = ReadRoleValue ( Game_Npc , EM_RoleValue_Register7 )
	for i = 1 , 17 , 1 do
		WriteRoleValue( OwnerID , EM_RoleValue_IsWalk , 0 )
		Hide( OwnerID )
		Show( OwnerID , RoomID )
		LuaFunc_MoveToFlag( OwnerID, Flag_Table , i , 0 )
		WriteRoleValue( OwnerID , EM_RoleValue_Register3 , i )
		Sleep_Rand = DW_Rand(3)
		sleep ( Sleep_Rand*10 )
	end
	local Ball = SearchRangeNPC ( OwnerID , 10 )
	local Ball_Num = table.getn( Ball )
	for i = 1 , Ball_Num , 1 do
		if ReadRoleValue( Ball[i] , EM_RoleValue_OrgID ) == 120468 then
			WriteRoleValue( OwnerID , EM_RoleValue_PID , 1 )
			Ranking = ReadRoleValue ( Game_Npc , EM_RoleValue_Register7 )
			WriteRoleValue( Game_Npc , EM_RoleValue_Register7 , Ranking+1 )
			--say ( Ball[i] , "BBB" )
			--say ( OwnerID , "to 120468 for".."=="..Ranking )
			break
		end
	end
	if ReadRoleValue( OwnerID , EM_RoleValue_Register3 ) >= 16 then
		CancelBuff_NoEvent( OwnerID , 622053 ) ---清除BUFF
		SetModeEx( OwnerID , EM_SetModeType_Mark, false)			---可點選(是)
		SetModeEx( OwnerID , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
		SetModeEx( OwnerID , EM_SetModeType_Move, false ) ---移動	(否)
	end
end
function Cl_DE3Y_DELOBJ(Table)
	local Table_Num = table.getn( Table )
	for i = 1 , Table_Num , 1 do
		if Table[i] ~= nil then
			if CheckID( Table[i] ) == true then
				delobj ( Table[i] )
			end
		end
	end
end
function Cl_DE3Y_For_Game_Npc()
	local play = OwnerID()
	local Npc = TargetID()
	local Play_Num = 0
	local Game_Time = ReadRoleValue( Npc , EM_RoleValue_Register8 )--= GetWorldVar( "SC_DE3Y_FORG_GAME_TIME" )	-- 世界變數1
	if CheckScriptFlag ( play, 546204 ) == false then
		if CheckBuff( play , 507828 ) == false then
			if ReadRoleValue( Npc , EM_RoleValue_Register9 ) ~= 1 then
				SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_04"))
				AddSpeakOption( play , Npc , "[SC_DE3Y_FORG_RUN_02]" , "Cl_DE3Y_NpcTalkString01", 0 ); --/我想看看你賣的東西
				AddSpeakOption( play , Npc , "[SC_DE3Y_FORG_RUN_01]" , "Cl_DE3Y_Read_NPC", 0 ); --/我想看看你賣的東西
				if CheckScriptFlag ( play, 546204 ) == true then
					AddSpeakOption( play , Npc , "[SC_CLICKFUNGO31]" , "Cl_DE3Y_ResetPlay", 0 ); --/我想看看你賣的東西
				end
			elseif ReadRoleValue( Npc , EM_RoleValue_Register9 ) == 1 then
				SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_07"))
			end
		elseif CheckBuff( play , 507828 ) == true then
			for i = 0 , 4 , 1 do
				if ReadRoleValue( Npc , EM_RoleValue_Register+i ) > 0 then
					Play_Num = Play_Num + 1
				end
			end
			if ReadRoleValue( Npc , EM_RoleValue_Register9 ) ~= 1 then
				Game_Time = ReadRoleValue( Npc , EM_RoleValue_Register8 )
				local Time_M , Time_S = Cl_DE3Y_ReadTime(Game_Time)
				SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_08[$SETVAR1="..Play_Num.."][$SETVAR2="..Time_M.."][$SETVAR3="..Time_S.."]"))
			elseif ReadRoleValue( Npc , EM_RoleValue_Register9 ) == 1 then
				SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_07"))
			end
		end
	elseif CheckScriptFlag ( play, 546204 ) == true then
		LoadQuestOption( play )
		AddSpeakOption( play , Npc , "[SC_CLICKFUNGO31]" , "Cl_DE3Y_ResetPlay", 0 ); --/我想看看你賣的東西
	end
end
function Cl_DE3Y_NpcTalkString01()
	local play = OwnerID()
	local Npc = TargetID()
	local Play_Num = 0
	if CheckBuff( play , 507828 ) == false then
		if ReadRoleValue( Npc , EM_RoleValue_Register9 ) ~= 1 then
			SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_06"))
			AddSpeakOption( play , Npc , "[SC_DE3Y_FORG_RUN_01]" , "Cl_DE3Y_Read_NPC", 0 ); --/我想看看你賣的東西
			if CheckScriptFlag ( play, 546204 ) == true then
				AddSpeakOption( play , Npc , "[SC_CLICKFUNGO31]" , "Cl_DE3Y_ResetPlay", 0 ); --/我想看看你賣的東西
			end
			AddSpeakOption( play , Npc , "[SC_111352_2]" , "Cl_DE3Y_NpcBack", 0 ); --/我想看看你賣的東西
		elseif ReadRoleValue( Npc , EM_RoleValue_Register9 ) == 1 then
			SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_07"))
			AddSpeakOption( play , Npc , "[SC_111352_2]" , "Cl_DE3Y_NpcBack", 0 ); --/我想看看你賣的東西
		end
	elseif CheckBuff( play , 507828 ) == true then
		for i = 0 , 4 , 1 do
			if ReadRoleValue( Npc , EM_RoleValue_Register+i ) > 0 then
				Play_Num = Play_Num + 1
			end
		end
		local Game_Time = ReadRoleValue( Npc , EM_RoleValue_Register8 )
		local Time_M , Time_S = Cl_DE3Y_ReadTime(Game_Time)
		SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_08[$SETVAR1="..Play_Num.."][$SETVAR2="..Time_M.."][$SETVAR3="..Time_S.."]"))
	end
end
function Cl_DE3Y_NpcTalkString02()
	local play = OwnerID()
	local Npc = TargetID()
	local Play_Num = 0
	if CheckBuff( play , 507828 ) == false then
		if ReadRoleValue( Npc , EM_RoleValue_Register9 ) ~= 1 then
			SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_05"))
			AddSpeakOption( play , Npc , "[SC_DE3Y_FORG_RUN_02]" , "Cl_DE3Y_NpcTalkString01", 0 ); --/我想看看你賣的東西
			AddSpeakOption( play , Npc , "[SC_DE3Y_FORG_RUN_01]" , "Cl_DE3Y_Read_NPC", 0 ); --/我想看看你賣的東西
			AddSpeakOption( play , Npc , "[SC_111352_2]" , "Cl_DE3Y_NpcBack", 0 ); --/我想看看你賣的東西
		elseif ReadRoleValue( Npc , EM_RoleValue_Register9 ) == 1 then
			SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_07"))
			AddSpeakOption( play , Npc , "[SC_111352_2]" , "Cl_DE3Y_NpcBack", 0 ); --/我想看看你賣的東西
		end
		if CheckScriptFlag ( play, 546204 ) == true then
			AddSpeakOption( play , Npc , "[SC_CLICKFUNGO31]" , "Cl_DE3Y_ResetPlay", 0 ); --/我想看看你賣的東西
		end
	elseif CheckBuff( play, 507828 ) == true then
		for i = 0 , 4 , 1 do
			if ReadRoleValue( Npc , EM_RoleValue_Register+i ) > 0 then
				Play_Num = Play_Num + 1
			end
		end
		local Game_Time = ReadRoleValue( Npc , EM_RoleValue_Register8 )
		local Time_M , Time_S = Cl_DE3Y_ReadTime(Game_Time)
		SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_08[$SETVAR1="..Play_Num.."][$SETVAR2="..Time_M.."][$SETVAR3="..Time_S.."]"))
	end
end
function Cl_DE3Y_NpcBack()
	local play = OwnerID()
	Cl_DE3Y_For_Game_Npc()
end
function Cl_DE3Y_Read_NPC()
	local play = OwnerID()
	local Npc = TargetID()
	local Play_Num = 0
	local Read_Num = ReadRoleValue( Npc , EM_RoleValue_Register6 )
	if ReadRoleValue( Npc , EM_RoleValue_Register9 ) ~= 1 then
		WriteRoleValue( Npc , EM_RoleValue_Register6 , Read_Num+1 )
		if ReadRoleValue( Npc , EM_RoleValue_Register6 ) <= 5 then
			for i = 0 , 4 , 1 do
				if ReadRoleValue( Npc , EM_RoleValue_Register+i ) ~= play then
					if ReadRoleValue( Npc , EM_RoleValue_Register+i ) == 0 then
						local Buff = Cl_DE3Y_BuffTable(i+1)
						Addbuff ( play  , Buff , 0 , -1 ) ---兔子變大
						Addbuff ( play  , 507828 , 0 , -1 ) ---兔子變大
						WriteRoleValue( Npc , EM_RoleValue_Register+i , play )
						for i = 0 , 4 , 1 do
							if ReadRoleValue( Npc , EM_RoleValue_Register+i ) > 0 then
								Play_Num = Play_Num + 1
							end
						end
						local Game_Time = ReadRoleValue( Npc , EM_RoleValue_Register8 )
						local Time_M , Time_S = Cl_DE3Y_ReadTime(Game_Time)
						SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_08[$SETVAR1="..Play_Num.."][$SETVAR2="..Time_M.."][$SETVAR3="..Time_S.."]"))
						break
					end
				elseif ReadRoleValue( Npc , EM_RoleValue_Register+i ) == play then
					for i = 0 , 4 , 1 do
						if ReadRoleValue( Npc , EM_RoleValue_Register+i ) > 0 then
							Play_Num = Play_Num + 1
						end
					end
					local Game_Time = ReadRoleValue( Npc , EM_RoleValue_Register8 )
					local Time_M , Time_S = Cl_DE3Y_ReadTime(Game_Time)
					SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_08[$SETVAR1="..Play_Num.."][$SETVAR2="..Time_M.."][$SETVAR3="..Time_S.."]"))
					break
				end
			end
		elseif ReadRoleValue( Npc , EM_RoleValue_Register6 ) > 5 then
			for i = 0 , 4 , 1 do
				if ReadRoleValue( Npc , EM_RoleValue_Register+i ) > 0 then
					Play_Num = Play_Num + 1
				end
			end
			--SC_DE3Y_FORG_GAME_TIME
			local Game_Time = ReadRoleValue( Npc , EM_RoleValue_Register8 )
			local Time_M , Time_S = Cl_DE3Y_ReadTime(Game_Time)
			SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_08[$SETVAR1="..Play_Num.."][$SETVAR2="..Time_M.."][$SETVAR3="..Time_S.."]"))
		end
		DesignLog( play , 120417 , "2012 DE 3th Frog Racing Start" )
	elseif ReadRoleValue( Npc , EM_RoleValue_Register9 ) == 1 then
		SetSpeakDetail(play,GetString("SC_DE3Y_FORG_RUN_07"))
		AddSpeakOption( play , Npc , "[SC_111352_2]" , "Cl_DE3Y_NpcBack", 0 ); --/我想看看你賣的東西
	end
end
function Cl_DE3Y_Forg_MoveLineCreate()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Ball = {}
	for i = 1 , 5 , 1 do
		Ball[i] = Cl_CreateObj_ForFlag( 120418 , 781108 , i-1 , RoomID ) ----產生透明球專用
		WriteRoleValue( Ball[i] , EM_RoleValue_Register1 , 1 )
	end
	for i = 6 , 10 , 1 do
		Ball[i] = Cl_CreateObj_ForFlag( 120411 , 781108 , i-1 , RoomID ) ----產生透明球專用
		WriteRoleValue( Ball[i] , EM_RoleValue_Register1 , 2 )
	end
	return Ball
end
function Cl_DE3Y_CreateRandBAll()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Ball = {}
	local NPCID = 0
	for i = 5 , 25 , 5 do
		for X = 1 , 5 , 1 do
			NPCID = Cl_CreateObj_ForFlag( 120469 , 781105 , x+i , RoomID ) ----產生透明球專用
			CallPlot( NPCID , "Cl_DE3Y_LightBall" , 0 )
			table.insert( Ball , NPCID )
		end
	end
	return Ball
end
function Cl_DE3Y_CancelBuff()
	local OwnerID = OwnerID()
	local BuffID = {}
	for i = 1 , 5 , 1 do
		BuffID = Cl_DE3Y_BuffSkill(i)
		CancelBuff_NoEvent( OwnerID , BuffID[1] ) ---清除BUFF
	end
end
function Cl_DE3Y_Skill850015()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Forg = 0
	local ForgID = 0
	if TargetID ~= OwnerID then
		if CheckBuff( TargetID , 622053 ) == false then
			for i = 1 , 5 , 1 do
				Forg = Cl_DE3Y_Frog_Table(i)
				if ReadRoleValue ( TargetID , EM_RoleValue_OrgID ) == Forg then
					ForgID = 1
				end
			end
			if ForgID == 1 then
				Cl_DE3Y_CancelBuff()
				return true
			elseif ForgID ~= 1 then
				return false
			end
		elseif CheckBuff( TargetID , 622053 ) == true then
			return false
		end
	elseif TargetID == OwnerID then
		return false
	end
end
function Cl_DE3Y_Skill496291()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local OrgID = 120470
	local Food_Obj = kg_GetPosRX( TargetID , OrgID , 20 )
	SetModeEx( Food_Obj , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Food_Obj , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Food_Obj , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( Food_Obj , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( Food_Obj , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( Food_Obj , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( Food_Obj , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
	SetIdleMotion( Food_Obj , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )----------------------維持動作  589651
	WriteRoleValue( Food_Obj , EM_RoleValue_Livetime , 5 )
	AddToPartition ( Food_Obj , RoomID ) ----物件加入場景,例行公事
	CallPlot( TargetID , "Cl_DE3Y_ForgEatFood" , Food_Obj )
end
function Cl_DE3Y_ForgEatFood(Food_Obj)
	local OwnerID = OwnerID()
	CastSpelllv ( OwnerID , OwnerID , 850013 , 0 )----每13秒施放一個全場法術AE
	SetModeEx( OwnerID , EM_SetModeType_Move, false) ---移動	(否)
	sleep ( 10 )
	PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_ATTACK_UNARMED )
	sleep ( 10 )
	Hide ( Food_Obj )
	sleep ( 10 )
	CastSpelllv ( OwnerID , OwnerID , 850014 , 0 )----每13秒施放一個全場法術AE
	SetModeEx( OwnerID , EM_SetModeType_Move, true ) ---移動	(否)
	sleep ( 10 )
	Delobj ( Food_Obj )
end
function Cl_DE3Y_SearchRangeForg()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Ball = SearchRangeNPC ( OwnerID , 400 )
	local Ball_Num = table.getn( Ball )
	local OBJID = 0
	for i = 1 , Ball_Num , 1 do
		if ReadRoleValue( Ball[i] , EM_RoleValue_Register4 ) == OwnerID then
			Addbuff (  Ball[i] , 622053 , 0 , 8 ) ---兔子變大
			break
		end
	end
end
function Cl_DE3Y_CheckOwnerForg()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_Register4 ) == OwnerID then
		return true
	elseif ReadRoleValue( TargetID , EM_RoleValue_Register4 ) ~= OwnerID then
		return false
	end
end
function CL_DE3Y_Skill850016()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Ball = SearchRangeNPC ( OwnerID , 400 )
	local Ball_Num = table.getn( Ball )
	local OBJID = 0
	for i = 1 , Ball_Num , 1 do
		if ReadRoleValue( Ball[i] , EM_RoleValue_Register4 ) == OwnerID then
			CallPlot( Ball[i] , "Cl_DE3Y_FireBall" , 0 )
			break
		end
	end
end
function Cl_DE3Y_FireBall()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local FireBal = kg_GetPosRX( OwnerID , 120491 , -20 )
	SetModeEx( FireBal , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( FireBal , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( FireBal , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( FireBal , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( FireBal , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( FireBal , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( FireBal , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
	WriteRoleValue( FireBal , EM_RoleValue_Livetime , 20 )
	AddToPartition ( FireBal , RoomID ) ----物件加入場景,例行公事
	BeginPlot( FireBal , "Cl_DE3Y_ForgSetMotion" , 0 )
end
function Cl_DE3Y_ForgSetMotion()
	local OwnerID = OwnerID()
	local Ball = SearchRangeNPC ( OwnerID , 15 )
	local Ball_Num = table.getn( Ball )
	local OBJID = 0
	while 1 do
		sleep ( 5 )
		Ball = SearchRangeNPC ( OwnerID , 15 )
		Ball_Num = table.getn( Ball )
		for i = 0 , Ball_Num-1 , 1 do
			for X = 1 , 5 , 1 do
				OBJID = Cl_DE3Y_Frog_Table(X)			
				local _OrgID  =  ReadRoleValue ( Ball[i] , EM_RoleValue_OrgID )
				if ReadRoleValue ( Ball[i] , EM_RoleValue_OrgID ) == OBJID then	
					CastSpelllv ( Ball[i] , Ball[i] , 496329 , 0 )----每13秒施放一個全場法術AE
					sleep ( 10 )
					Delobj ( OwnerID )
					break
				end
			end
		end
	end
end
function CL_DE3Y_Skill850012()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Ball = SearchRangeNPC ( OwnerID , 400 )
	local Ball_Num = table.getn( Ball )
	local OBJID = 0
	for i = 1 , Ball_Num , 1 do
		if ReadRoleValue( Ball[i] , EM_RoleValue_Register4 ) == OwnerID then
			CastSpelllv ( Ball[i] , Ball[i] , 850018 , 0 )----每13秒施放一個全場法術AE
		end
	end
end
function Cl_DE3Y_LightBall()
	local OwnerID = OwnerID()
	local Ball = SearchRangeNPC ( OwnerID , 12 )
	local BuffID = {}
	while 1 do
		sleep ( 5 )
		Ball = SearchRangeNPC ( OwnerID , 12 )
		Ball_Num = table.getn( Ball )
		for i = 0 , Ball_Num-1 , 1 do
			for X = 1 , 5 , 1 do
				OBJID = Cl_DE3Y_Frog_Table(X)			
				if ReadRoleValue ( Ball[i] , EM_RoleValue_OrgID ) == OBJID then	
					local Player = ReadRoleValue( Ball[i] , EM_RoleValue_Register4 ) --讀取隱藏物件位於哪個Zone
					BuffID = {}
					local BuffID = Cl_DE3Y_BuffSkill(0)
					Addbuff (  Player , BuffID[1] , 0 , -1 ) ---兔子變大
					ScriptMessage ( Player , Player , 1 , BuffID[2] , C_Pink )
					delobj ( OwnerID )
					break
				end
			end
		end
	end
end
function Cl_DE3Y_CheckDis_Forg(Dis)
	local OwnerID = OwnerID()
	local ForgID = 0
	local NpcDis = 0
	while 1 do
		sleep (10)
		for i = 1 , 5 , 1 do
			ForgID = ReadRoleValue( OwnerID , EM_RoleValue_Register+i ) --讀取隱藏物件位於哪個Zone
			NpcDis = GetDistance( OwnerID , ForgID )
			if NpcDis >= Dis then
				sleep ( 10 )
				ScriptMessage ( OwnerID , OwnerID , 1 , "[SC_DE3Y_FORG_RUN_17]" , 0 )
				SetPosByFlag( ForgID , 781105 , 0 )
			end
		end
	end
end
function Cl_DE3Y_ReSetItem()
	local OwnerID = OwnerID()
	if CheckScriptFlag( OwnerID, 546204 ) == true then
		if CountBodyItem( OwnerID , 202904 ) ~= 0 then 
			DelBodyItem( OwnerID , 202904 , 1 )
			DelBodyItem( OwnerID , 546204 , 1 )
			ScriptMessage ( OwnerID , OwnerID , 1 , "[SC_DE3Y_FORG_RUN_25]" , 0 )
			Cl_DE3Y_For_Game_Npc()
		elseif CountBodyItem( OwnerID , 202904 ) == 0 then 
			ScriptMessage ( OwnerID , OwnerID , 1 , "[SC_DE3Y_FORG_RUN_21]" , 0 )
		end
	elseif CheckScriptFlag( OwnerID, 546204 ) == false then
		ScriptMessage ( OwnerID , OwnerID , 1 , "[SC_DE3Y_FORG_RUN_22]" , 0 )
	end	
end
function Cl_DE3Y_ResetPlay()
	local play = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail( play , GetString("SC_DE3Y_FORG_RUN_23"))
	AddSpeakOption( play , Npc , "[SC_DE3Y_FORG_RUN_24]" , "Cl_DE3Y_ReSetItem", 0 ); --/我想看看你賣的東西
end
function Cl_DE3Y_CheakPlay()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_IsPlayer ) ~= 1 then
		return true
	elseif ReadRoleValue( TargetID , EM_RoleValue_IsPlayer ) == 1 then
		return false
	end
end
function Cl_DE3Y_ReadTime(Game_Time)
	local Time = Game_Time/60 ---
	local num = math.floor(Time)
	local Time_S = Game_Time - (num*60)
	Time_S = math.floor(Time_S)
	local Time_M = (Game_Time-Time_S)/60 
	--say ( OwnerID() , Time_M..":"..Time_S )
	return Time_M , Time_S
end