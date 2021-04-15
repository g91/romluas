--寫在106690
--Ctrl,執行cl_AC1_WB_ctarlAICheakP
--Ctrl,R1 =>記錄最終boss是否被殺了。
--ctarlAI,PID =>記錄Ctrl
function cl_AC1_WB_ctarlAICheakP()
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue ( Ctrl , EM_RoleValue_RoomID )
	local Npc_X,Npc_Y,Npc_Z = Cl_Read_OwnerXYZ( Ctrl )
	local Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )
	local CombatBegin = 0
	local ZoneID = 2
	local XX = 2235
	local YY = 59
	local ZZ = 1849
	local Dir = 69
	local Clock_Npc = Cl_CreateObj_ForHideBall( 102679 , 267 , -150 , -77 , RoomID ) 	--四倍阻擋箱(用來產生計時的npc)
		SetModeEx( Clock_Npc , EM_SetModeType_Show, false) 
		WriteRoleValue ( Clock_Npc , EM_RoleValue_PID , Ctrl ) 
		CallPlot( Clock_Npc, "cl_Open_Clock", 0 )

	local Send_Door = CreateObjByFlag( 106149 , 781061 , 0 , 1 ) 				--傳送門150%
		SetModeEx ( Send_Door , EM_SetModeType_Obstruct, false) 
		SetModeEx( Send_Door , EM_SetModeType_Strikback, false) 
		SetModeEx( Send_Door , EM_SetModeType_Move, false) 
		SetModeEx( Send_Door , EM_SetModeType_Searchenemy, false)
		SetModeEx( Send_Door , EM_SetModeType_Mark, false)
		SetModeEx( Send_Door , EM_SetModeType_ShowRoleHead, false) 
		SetModeEx( Send_Door , EM_SetModeType_Fight, false) 
		SetModeEx( Send_Door , EM_SetModeType_NotShowHPMP , false) 
		SetPlot( Send_Door , "collision" , "cl_AC1_WB_OutDoor" , 30 )
		AddToPartition ( Send_Door , RoomID ) 
	local time = 1;
	while 1 do
		--測試訊息
		if time%30==0 then 
			if ReadRoleValue( Ctrl,EM_RoleValue_Register9)==1 then
			local PlayNum = SetSearchAllPlayer( RoomID ) 	-----讀取整個ZONE的所有玩家這裡讀取到的是數量
				DebugMsg( 0,RoomID,"AC1,RoomID,Close="..RoomID )
				for i = 1 , PlayNum , 1 do ---把玩家抓入房間用 讀取到的玩家數量下去決定for迴圈跑幾次
					local PlayerID = GetSearchResult()  ---將掃到ZONE裡的所有玩家依序存入這個暫存器
					if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
						if ReadRoleValue ( PlayerID , EM_RoleValue_RoomID ) == RoomID then
							ScriptMessage( PlayerID,PlayerID,3,"[SC_BLACKWATER_BUFF]",0 )
							Addbuff (  PlayerID , 622121 , 0 , 300 ) ---封印行動失敗BUFF	
							ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
						end
					end
				end
			end
		 time=0 
		end
		time = time + 1
		--
		sleep ( 10 )
		Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )
		if Door_Open == 1 then
			--不再產生中控魔菇人
			if CombatBegin == 0 then
				if RoomID ~= 0 then
					local ctarlAI = Cl_CreateObj_ForHideBall( 105305 , Npc_X , Npc_Y , Npc_Z , RoomID ) ----產生魔菇人中控
						SetModeEx( ctarlAI , EM_SetModeType_Show, false) 
						WriteRoleValue ( ctarlAI , EM_RoleValue_PID , Ctrl )
						BeginPlot( ctarlAI , "cl_Ac1_BW_Z194_ctarlAI" , 0 )
						CombatBegin = 1
				end
			end
		elseif Door_Open ~= 1 then
			if CombatBegin == 1 then
				CombatBegin = 0
			end
		end
		--用Ctrl，R1值記錄是否將玩家傳出
		if ReadRoleValue( Ctrl , EM_RoleValue_Register1 ) == 1 then
			local PlayNum = SetSearchAllPlayer(RoomID) 	-----讀取整個ZONE的所有玩家這裡讀取到的是數量
			--DebugMsg(0,RoomID,"Ctrl,AllPlayer="..PlayNum)
			for i = 1 , PlayNum , 1 do
				local PlayerID = GetSearchResult() 
				if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
					ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
				end
			end
			sleep ( 50 )
			WriteRoleValue ( Ctrl , EM_RoleValue_Register1 , 0 )
		end
	end
end
--ctarlAI,執行cl_Ac1_BW_Z194_ctarlAI
--ctarlAI,R6 => 記錄boss死了幾隻，每死一隻+1
--ctarlAI,R5 => 記錄小怪數量
--ctarlAI,R1 => BOSS是否在戰鬥
--ctarlAI,PID => Ctrl
function cl_Ac1_BW_Z194_ctarlAI() --副本內控制器
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local Ctrl = ReadRoleValue ( ctarlAI , EM_RoleValue_PID )
	local Stand_Out = 300
	local Stand_Out_Time = 0
	local ctarlAI_Table = {}
		ctarlAI_Table[1] = 120424
		ctarlAI_Table[2] = 120122 
		ctarlAI_Table[3] = 106571
		ctarlAI_Table[4] = 106549
	local Function_Table = {}
		Function_Table[1] = "AC1_boss1CenterCtrlCreat"  ---BOSS1
		Function_Table[2] = "Lua_kors_ACboss_ctrl"          ---Boss2
		Function_Table[3] = "sasa_106572_Counter"          ---Boss3
		Function_Table[4] = "Cl_ACWB_P3Boss4_CtarlAI"   ---Boss4
		Function_Table[5] = "Cl_ACWB_P3Boss4_KillPolice"	--當守備被殺後
		Function_Table[6] = "Cl_ACWB_P3Boss4_GiveWP"	--加入對話劇情
		Function_Table[7] = "Cl_ACWB_P3Boss4_ThPolice"	--開啟觸碰
	local ZoneID = 2
	local XX = 2235
	local YY = 59
	local ZZ = 1849
	local Dir = 69
	local Flag_Table = {}
		Flag_Table[1] = 781061
	local BossAI_Table = {}
	local BossIsDead = ReadRoleValue( ctarlAI , EM_RoleValue_Register6 )		--ctarlAI,R6
		WriteRoleValue ( ctarlAI , EM_RoleValue_Register6 , 0 ) 			--ctarlAI,R6
	local Door_Open = 0
	local Door_Time = 0
	local BossInFight = 0
	local flagID = 0
	local close_door = 0
	local delAllNPc = 0
		for i = 1 , 4 , 1 do
			BossAI_Table[i] = CreateObjByFlag( ctarlAI_Table[i] , Flag_Table[1] , i , 1 ) ------------BOSS產生器
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Show , false)
			SetModeEx ( BossAI_Table[i] , EM_SetModeType_Obstruct, false) 
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Strikback, false) 
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Move, false) 
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Searchenemy, false)
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Mark, false)
			SetModeEx( BossAI_Table[i] , EM_SetModeType_ShowRoleHead, false) 	
			SetModeEx( BossAI_Table[i] , EM_SetModeType_Fight, false) 
			SetModeEx( BossAI_Table[i] , EM_SetModeType_NotShowHPMP , false) 
			AddToPartition ( BossAI_Table[i] , RoomID )
			WriteRoleValue ( BossAI_Table[i] , EM_RoleValue_PID , ctarlAI ) 
			BeginPlot( BossAI_Table[i] , Function_Table[i] , 0 ) ---塞入BOSS的戰鬥給他
			sleep ( 1 )
		end
	local Police_Npc = {}
		Police_Npc[1] = CreateObjByFlag( 106698 , Flag_Table[1] , 11 , 1 ) ------------巴納吉
			--SetModeEx( Police_Npc[1] , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( Police_Npc[1] , EM_SetModeType_Fight, true ) 
			SetModeEx( Police_Npc[1] , EM_SetModeType_Strikback, true) 
			AddToPartition( Police_Npc[1] , RoomID )
		WriteRoleValue ( Police_Npc[1] , EM_RoleValue_PID , ctarlAI ) 
		BeginPlot( Police_Npc[1] , Function_Table[7] , 0 )
		SetPlot( Police_Npc[1], "dead", Function_Table[5], 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
		sleep ( 1 )
		for i = 1 , 4 , 1 do
			Police_Npc[i+1] = CreateObjByFlag( 106699 , Flag_Table[1] , 11+i , 1 ) ------------凡瑞娜絲警備隊
				--SetModeEx( Police_Npc[i+1] , EM_SetModeType_Searchenemy, false)--索敵(否)
				SetModeEx( Police_Npc[i+1] , EM_SetModeType_Fight, true) 
				SetModeEx( Police_Npc[i+1] , EM_SetModeType_Strikback, true) 
				AddToPartition( Police_Npc[i+1] , RoomID )
		end
		Police_Npc[6] = CreateObjByFlag( 120205 , Flag_Table[1] , 16 , 1 ) ------------產生法洛坤瑟
		AddToPartition( Police_Npc[6] , RoomID )
		Police_Npc[7] = CreateObjByFlag( 120206 , Flag_Table[1] , 17 , 1 ) ------------產生柏拉克
		AddToPartition( Police_Npc[7] , RoomID )
	local Monster_Time = 55
	local Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
	local Ctrltime = 0
--		SetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" , 0 )

	while 1 do
		sleep ( 10 )
		Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )	-- 世界變數P-3階段
		Door_Time = GetWorldVar( "SC_BLACKWATER_P3_TIME" )		-- 世界變數記時器
		Door_MONSTER = GetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" )	-- 世界變數出怪

		BossInFight = ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 )
		Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
		--ctarlAI,R9=1 失敗，事件結束。
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register9 ) == 1 then
			WriteRoleValue ( Ctrl , EM_RoleValue_Register9 , 1 ) 
			Cl_ACWB_DELOBJ()
			delobj ( ctarlAI )
		end
		--檢查BOSS死了幾隻
		for i = 1 , 4 , 1 do
			--boss,R4,存是否死亡
			if ReadRoleValue ( BossAI_Table[i] , EM_RoleValue_Register4 ) == 1 then
				BossIsDead = ReadRoleValue( ctarlAI , EM_RoleValue_Register6 )
				WriteRoleValue ( ctarlAI , EM_RoleValue_Register6 , BossIsDead+1 ) 
				WriteRoleValue ( BossAI_Table[i] , EM_RoleValue_Register4 , 2 ) 	--boss死亡記錄過後，改寫為2
				DebugMsg(0,RoomID,"AC1,Z194,BOSS_IS_DEAD,NUM="..ReadRoleValue( ctarlAI , EM_RoleValue_Register6 ))
			end
		end
		--假設已經擊倒最終BOSS，切換了狀態
		if Door_Open == 2 or Door_Open == 3 then
			Stand_Out_Time = 1
			Ctrltime = 1
		end
		--執行計時
		if Ctrltime == 1 then
			local PlayNum = SetSearchAllPlayer(RoomID) 	-----讀取整個ZONE的所有玩家這裡讀取到的是數量
			--DebugMsg(0,RoomID,"-----ctarlAI,AllPlayer="..PlayNum)
			for i = 1 , PlayNum , 1 do
				local PlayerID = GetSearchResult() 
				if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
					--DebugMsg(0,RoomID,"-----ctarlAI,ClockOpen")
					CallPlot(PlayerID,"lua_ACtestClockOpen",PlayerID )
				end
			end
			Ctrltime = 2
		end
		--判讀1800S後，將Ctrl,R1寫成1，傳出所有玩家。
		if Stand_Out_Time == 1 then
--			if Door_Time <= 1800 then
				close_door = close_door + 1
				if close_door >= 180 then
					WriteRoleValue ( Ctrl , EM_RoleValue_Register1 , 1 )
					sleep ( 10 )
					delobj ( ctarlAI )
				end
--			end
		end
		--用Door_MONSTER來控制是否出怪
		if BossInFight == 0 then
			if ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 ) < 80 then
				if Door_MONSTER == 0 then
					Monster_Time = Monster_Time + 1
				end
				if Monster_Time >= 60 then
					for i = 1 , 2 , 1 do
						BossIsDead = ReadRoleValue( ctarlAI , EM_RoleValue_Register6 )
						DebugMsg( 0 , RoomID , "AC1,BossIsDead="..BossIsDead )
						cl_Call_MonsterAI( i , BossIsDead )
					end
					Monster_Time = 0
				end
			end
		end
	end
end
--產生兩個小怪中控器
function cl_Call_MonsterAI( Flag , FlagID )
	local ctarlAI = OwnerID()
	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
	local Flag_Num = {}
		Flag_Num[0] = 30
		Flag_Num[1] = 20
		Flag_Num[2] = 10
		Flag_Num[3] = 0
	--DebugMsg( 0 , RoomID , "Flag_Num[FlagID]="..Flag_Num[FlagID] )
	local Flag_Table = {}
		Flag_Table[1] = 781071
		Flag_Table[2] = 781072
	--DebugMsg( 0 , RoomID , "FlagID="..Flag_Num[FlagID] )
	local MonsterAI = CreateObjByFlag( 106590 , Flag_Table[Flag] , Flag_Num[FlagID] , 1 ) ------------產生"小怪"
		SetModeEx ( MonsterAI , EM_SetModeType_Obstruct, false) 			
		SetModeEx( MonsterAI , EM_SetModeType_Strikback, false)		
		SetModeEx( MonsterAI , EM_SetModeType_Searchenemy, false)	
		SetModeEx( MonsterAI , EM_SetModeType_Mark, false)		
		SetModeEx( MonsterAI , EM_SetModeType_ShowRoleHead, false) 	
		SetModeEx( MonsterAI , EM_SetModeType_Fight, false) 		
		SetModeEx( MonsterAI , EM_SetModeType_NotShowHPMP , false) 	
		AddToPartition ( MonsterAI , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( MonsterAI , EM_RoleValue_Register1 , ctarlAI ) 		---
	WriteRoleValue ( MonsterAI , EM_RoleValue_Register6 , FlagID ) 		---裝boss死了幾隻
	CallPlot( MonsterAI, "Cl_Monster_WarkInFlag", Flag )
end 
--各boss的中控器，記錄是否戰鬥中。
function Cl_ACWB_BossIsDeadFlag(Flag_Tag)  --1=進入戰鬥  2=戰鬥重置 3=BOSS死亡
	local BossCtrl = OwnerID()
	local RoomID = ReadRoleValue ( BossCtrl , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( BossCtrl , EM_RoleValue_PID )

	if Flag_Tag == 1 then
		WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 1 ) ---進入戰鬥
	elseif Flag_Tag == 2 then
		WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 0 ) --玩家滅團
	elseif Flag_Tag == 3 then
		WriteRoleValue ( ctarlAI , EM_RoleValue_Register1 , 0 )
		WriteRoleValue ( BossCtrl , EM_RoleValue_Register4 , 1 )
	end
	DebugMsg(0,RoomID,"AC1,Z194,BossStatus_NOW="..Flag_Tag)
end
--當巴吉納被殺...
function Cl_ACWB_P3Boss4_KillPolice()
	local Baneji = OwnerID()
	local RoomID = ReadRoleValue ( Baneji , EM_RoleValue_RoomID )
	local ctarlAI = ReadRoleValue ( Baneji , EM_RoleValue_PID )
	local ZoneID = 2
	local XX = 2235
	local YY = 59
	local ZZ = 1849
	local Dir = 69
	Sleep(30)
	local PlayNum = SetSearchAllPlayer( RoomID ) -----讀取整個ZONE的所有玩家這裡讀取到的是數量
	for i = 1 , PlayNum , 1 do ---把玩家抓入房間用 讀取到的玩家數量下去決定for迴圈跑幾次
		local PlayerID = GetSearchResult()  ---將掃到ZONE裡的所有玩家依序存入這個暫存器
		if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
			if ReadRoleValue ( PlayerID , EM_RoleValue_RoomID ) == RoomID then
				ScriptMessage( PlayerID,PlayerID,3,"[SC_BLACKWATER_BUFF]",0 )
				Addbuff (  PlayerID , 622121 , 0 , 3600 ) ---封印行動失敗BUFF	
				ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
			end
		end
	end
	WriteRoleValue ( ctarlAI , EM_RoleValue_Register9 , 1 )
	delobj ( Baneji )
end
--東西販賣
function Cl_ACWB_P3Boss4_GiveWP()
	local play = OwnerID()
	local Npc = TargetID()
	LoadQuestOption( play )
	AddSpeakOption( play , Npc , "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
end

function cl_ACWB_P3_Shop()--------------------------------賣藥水的
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Weapon )
	SetShop( OwnerID() , 600381 , "Test_Shop_Close" )
end

--清除所有npc
function Cl_ACWB_DELOBJ()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數 
	local PPL = SetSearchAllNPC(RoomID )
	for i = 1 , PPL , 1 do ---把玩家抓入房間用 
		local ID = GetSearchResult()
		if ReadRoleValue ( ID , EM_RoleValue_OrgID ) ~= 106690 and		--副本內AI
			ReadRoleValue ( ID , EM_RoleValue_OrgID ) ~= 103044 and	--副本用阻擋
			ReadRoleValue ( ID , EM_RoleValue_OrgID ) ~= 103120 and	--防駭客
			ReadRoleValue ( ID , EM_RoleValue_OrgID ) ~= 106149 then	--傳送門
			if ReadRoleValue ( ID , EM_RoleValue_RoomID ) == RoomID then
				Delobj (ID)
			end
		end
	end
end
--測試指令，value調整成0之外的數就不出怪
function Cl_ACWB_GM_STOPMONSTERTIME(Value)
	Value = Value or 0
	SetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" , Value )
end
--測試指令，重置變數為value
function Cl_ACWBRESET(  )
	SetWorldVar( "SC_BLACKWATER_P3_MONSTERTIME" , 0 )
	SetWorldVar( "SC_BLACKWATER_P3_TIME" , 3600 )
	SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , 0 )
end
--測試指令，重置各別變數,重寫P3的時間
function lua_AC1RESET_P3TIME( Value )
	Value = Value or 10	--10秒後關門
	SetWorldVar( "SC_BLACKWATER_P3_TIME" , Value )
end
--測試指令，重置各別變數,開門階段，0為剛開，1為開，2和3為關
function lua_AC1RESET_OPENDOOR( Value )
	Value = Value or 0	--不帶值為剛開
	SetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" , Value )
end
--測試指令，讀出階段
function Cl_AcTest_ReadWorldVar()
	local Door_Open = GetWorldVar( "SC_BLACKWATER_P3_OPENDOOR" )	-- 世界變數P-3階段
	local Door_Time = GetWorldVar( "SC_BLACKWATER_P3_TIME" )	-- 世界變數記時器
	say ( OwnerID() , "Door_Time="..Door_Time.."___Door_Open="..Door_Open)    
end
--巴納吉的初始表演，對話劇情
function Cl_ACWB_P3Boss4_ThPolice()
	SetPlot( OwnerID(), "touch","Cl_ACWB_P3_touchNpc", 20 ) 
end
function Cl_ACWB_P3_touchNpc()
	local Player = OwnerID() ----我叫做AI
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_AttackTargetID ) == 0 then
		if ReadRoleValue( Target , EM_RoleValue_Register5 ) ~= 1 then
			WriteRoleValue ( Target , EM_RoleValue_Register5 , 1 )
			say ( Target , "[SC_WBP3_SHOWNPC_75]")
			sleep ( 30 )
			say ( Target , "[SC_WBP3_SHOWNPC_76]")
			sleep ( 30 )
			say ( Target , "[SC_WBP3_SHOWNPC_77]")
			sleep ( 30 )
			say ( Target , "[SC_WBP3_SHOWNPC_78]")
			sleep ( 30 )
			WriteRoleValue ( Target , EM_RoleValue_Register5 , 0 )
		end
	end
end

function lua_ACtestClockOpen(PlayerID)
	ClockOpen( PlayerID , EM_ClockCheckValue_25 , 180 , 180 , 0 , "Cl_ACWB_NotTime" , "Cl_ACWB_NotTime" )
end
--function Cl_Test_Open194Door()
--	local OwnerID = OwnerID()
--	SetPlot( OwnerID , "collision" , "cl_AC1_WB_InDoor" , 30 )
--end
--function Cl_test_zone()
--	local ctarlAI = OwnerID()
--	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
--	local ZoneID = 2
--	local XX = 2235
--	local YY = 59
--	local ZZ = 1849
--	local Dir = 69
--	local PlayNum = SetSearchAllPlayer( RoomID ) -----讀取整個ZONE的所有玩家這裡讀取到的是數量
--	for i = 1 , PlayNum , 1 do ---把玩家抓入房間用 讀取到的玩家數量下去決定for迴圈跑幾次
--		local PlayerID = GetSearchResult()  ---將掃到ZONE裡的所有玩家依序存入這個暫存器
--		if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
--			ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
--		end
--	end
--end
--function Cl_test_zone_0()
--	local ctarlAI = OwnerID()
--	local RoomID = ReadRoleValue ( ctarlAI , EM_RoleValue_RoomID )
--	local ZoneID = 2
--	local XX = 2235
--	local YY = 59
--	local ZZ = 1849
--	local Dir = 69
--	local PlayNum = SetSearchAllPlayer( 0 ) -----讀取整個ZONE的所有玩家這裡讀取到的是數量
--	for i = 1 , PlayNum , 1 do ---把玩家抓入房間用 讀取到的玩家數量下去決定for迴圈跑幾次
--		local PlayerID = GetSearchResult()  ---將掃到ZONE裡的所有玩家依序存入這個暫存器
--		if ReadRoleValue ( PlayerID , EM_RoleValue_VOC ) ~= 0 then
--			ChangeZone( PlayerID , ZoneID , 0 , XX , YY , ZZ , Dir )
--		end
--	end
--end