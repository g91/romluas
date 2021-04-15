
function ESFR_Initialize()
	DebugMsg(0,0, "This is ESFR initializing")
	CloseSpeak( OwnerID())
	CallPlot(OwnerID(),"Event_Story_Fest_RedRidinghood");
end

------------------------------------------------------------------------------------------------------------------------------------------------------
	--活動完整運作函式--
------------------------------------------------------------------------------------------------------------------------------------------------------
function Event_Story_Fest_RedRidinghood()
	AddBuff(OwnerID() , 503217, 0, -1)
	DebugMsg(0,0," this is plot Wy_02959!!")

	local EndEvent = false;	-- 2015.08.31 阿浩:將全域變數變更為區域變數，用以判斷重置機制，各別在任務完成時、目標不存在(離線)時、Buff消失(死亡或離線)時、超出活動範圍時重置。

	local PlayerTable = {}							--場內玩家的GUID table
	local player = 0							--參與玩家的GUID
	local EventOwner = false
	local iDebug = false							--(煩死人的)初始化除蟲用開關
	local Debug = true							--(煩死人的)除蟲用開關
	local waiting = true							--活動待命開關
	local activated = false							--活動場景啟動
	local tempTarget = 0							--勢必會用到的變數(?)
	local tempX, tempY, tempZ, tempDir = 0, 0, 0, 0				--勢必會用到的變數(們?)
	local wolf_OrgID = 107846						--大野狼的OrgID
	local RedRidinghood_OrgID = 122609					--小紅帽的OrgID
	local Roadsigns_OrgID = 122690						--路標的OrgID
	local Flowers_OrgTable = {0,122621, 122718, 122721} 			--三朵花的OrgID_table
	local Flags = 781318							--顯像旗幟OrgID
	local AllFlags = GetMoveFlagCount(Flags);				--取得顯像旗幟
	local Roadsigns_GUID_table = {}						--路標的GUID_Table
	local Wolves_GUID_table = {}						--大野狼的GUID_Table
	local Flowers_GUID_table = {}						--三朵花的GUID_Table
	local RedRidinghood = 0						--(會一直死又一直重寫的)小紅帽GUID
	local score = 0
	local halt = false							--小紅帽的暫停開關
	local halt_timer = 0							--小紅帽的暫停計時器
	local red_moving = true							--小紅帽移動開關									
	local restart = true							--小紅帽回到起點開關
	local RRH_now = 1							--所有人共用的暫存位置判斷
	local RRH_Dir = 1							--所有人共用的暫存方向判斷
	local RRH_Des = 1							--所有人共用的暫存目的地判斷
	local Wolf_now = {}							--狼當前路標table
	local Wolf_Dir = {}							--狼當前路標方位table
	local Wolf_Des = {}							--狼當前目的地路標 table
	local All_Roadsigns_Where_To_GO_table = {				--(落落長的)路標指向表
		{2,0,0,0},
		{5,0,1,3},
		{6,2,0,4},
		{7,3,0,0},
		{10,0,2,6},
		{8,5,3,7},
		{9,6,4,0},
		{11,0,6,9},
		{0,8,7,0},
		{0,0,5,11},
		{12,10,8,0},
		{0,0,11,0}
	}				
	local Wolf_Temp_Position = {						--大野狼位置要素table	{ {1x,1y,1z} , {2x, 2y, 2z } }
		{ 	},							--第一隻的XYZ
		{	}							--第二隻的XYZ
	}			
	local Score_Position = {}							--得分(小花、終點)位置要素table	{ {1x,1y,1z} , {2x, 2y, 2z } , {3x, 3y, 3z } , {4x, 4y, 4z } }
	Score_Position[1] = {	}						--第一朵的XYZ
	Score_Position[2] = {	}						--第二朵的XYZ
	Score_Position[3] = {	}						--第三朵的XYZ
	Score_Position[4]= {1,2,3}						--終點的XYZ	
	local RRH_Position = {}							--小紅帽當前位置table
	local wolf_spawn_num = {
		{4, 6, 9},
		{ 10,11,8}
	}
------------------------------------------------------------------------------------------------------------------------------------------------------
	--依照旗幟產生路標並依照編號收集GUID--
------------------------------------------------------------------------------------------------------------------------------------------------------
	for a = 1, 12 do
		tempX = GetMoveFlagValue( Flags, a , EM_RoleValue_X )  
		tempY = GetMoveFlagValue( Flags, a , EM_RoleValue_Y)  
		tempZ = GetMoveFlagValue( Flags, a , EM_RoleValue_Z )  
		tempDir = GetMoveFlagValue( Flags, a , EM_RoleValue_Dir ) 
		local CreateRoadsigns = CreateObj(Roadsigns_OrgID, tempX, tempY,tempZ,tempDir,1)
		table.insert(Roadsigns_GUID_table, CreateRoadsigns)
		MoveToFlagEnabled( CreateRoadsigns , false ); 
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register1, All_Roadsigns_Where_To_GO_table[a][1])
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register2, All_Roadsigns_Where_To_GO_table[a][2])
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register3, All_Roadsigns_Where_To_GO_table[a][3])
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register4, All_Roadsigns_Where_To_GO_table[a][4])
		WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register5, a)
		local random = RandRange(1,4)
		local not_finish = true
		while not_finish do
			random = random+1
			-----------------------				
			if random > 4 then
				random = 1
			end
			-----------------------
			if All_Roadsigns_Where_To_GO_table[a][random] ~=0 then
				WriteRoleValue(CreateRoadsigns , EM_RoleValue_Register9, random)
				-----------------------
				if  ReadRoleValue(CreateRoadsigns , EM_RoleValue_Register9) == 2 then
					AdjustDir(CreateRoadsigns , 90)
				elseif ReadRoleValue(CreateRoadsigns , EM_RoleValue_Register9) == 3 then
					AdjustDir(CreateRoadsigns , 180)
				elseif ReadRoleValue(CreateRoadsigns , EM_RoleValue_Register9) == 4 then
					AdjustDir(CreateRoadsigns , 270)
				else
					AdjustDir(CreateRoadsigns , 0)				
				end
				not_finish=false
				SetPlot(CreateRoadsigns , "touch" , "Roadsigns_Plot" , 15)
				-----------------------
			end
			-----------------------
		sleep(1)
		end
		AddToPartition(CreateRoadsigns ,0)
		-----------------------
	end
	-----------------------
	local PointBuff = CreateObj(113117 ,tempX, 65 ,tempZ ,tempDir,1)
	Score_Position[4][1]= tempX
	Score_Position[4][2]= tempY
	Score_Position[4][3]= tempZ
------------------------------------------------------------------------------------------------------------------------------------------------------
	--依照路標產生小紅帽--
------------------------------------------------------------------------------------------------------------------------------------------------------
	local CreateRRH = Lua_CreateObjByDir( Roadsigns_GUID_table[1] , 122609 , -9 , 45); 				--122609產生小紅帽於1號路標後方
	AddToPartition(CreateRRH , 0)
	RedRidinghood = (CreateRRH)
	WriteRoleValue(RedRidinghood,EM_RoleValue_Register10,1)
	MoveToFlagEnabled( RedRidinghood , false );								--關閉小紅帽的預設巡邏
	WriteRoleValue(RedRidinghood , EM_RoleValue_IsWalk , 1)						--啟用行走模式
	RRH_Des = 1												--紅帽要前往的路標號碼
	WriteRoleValue(RedRidinghood, EM_RoleValue_Register5, 10 )	
	AddBuff(RedRidinghood , 624228, 0, -1)									--紅帽減速NURF
------------------------------------------------------------------------------------------------------------------------------------------------------
	--當活動待命中--
------------------------------------------------------------------------------------------------------------------------------------------------------
	while waiting do
		if ReadRoleValue(OwnerID(),EM_RoleValue_Register8) == 1 then
			player = ReadRoleValue(OwnerID(), EM_RoleValue_Register7)
			DesignLog(Player ,122722 ,"Accept" )
			waiting = false
			activated = true
			AddBuff ( player, 624633, 0, 90 )
			AddBuff ( player, 624635, 0, -1)
			SetFlag( player , 548188 , 1 ) 
			ScriptMessage( player , player , 2, "[WY_STORY_REDRIDINGHOOD_START]", 0)
			Yell(OwnerID(), "[WY_STORY_REDRIDINGHOOD_REDSTART]"..GetName(player).." !", 3)
		end
		sleep(10)
		if activated then												--啟動後產生野狼、小花--
			SetModeEx(PointBuff, EM_SetModeType_Gravity , false)
			SetModeEx(PointBuff, EM_SetModeType_AlignToSurface , false)
			SetModeEx(PointBuff, EM_SetModeType_Mark, false)
			AddToPartition(PointBuff ,0)
			----------------------------------------------------------------------------------------------------------------------------------------------------	
			local  random_number = RandRange(1,#wolf_spawn_num[1])
			for b = 1 , 2 do
				local TempNumber = wolf_spawn_num[b][random_number]
				tempX = ReadRoleValue(Roadsigns_GUID_table[TempNumber] , EM_RoleValue_X)
				tempY = ReadRoleValue(Roadsigns_GUID_table[TempNumber] , EM_RoleValue_Y)
				tempZ = ReadRoleValue(Roadsigns_GUID_table[TempNumber] , EM_RoleValue_Z)
				tempDir = ReadRoleValue(Roadsigns_GUID_table[TempNumber] , EM_RoleValue_Dir)
				local CreateWolves = CreateObj(wolf_OrgID, tempX, tempY, tempZ, tempDir , 1)		--107846產生大野狼表格中的隨機兩個路標位置上
				AddToPartition(CreateWolves , 0)
				table.insert(Wolves_GUID_table , CreateWolves)
				WriteRoleValue(Wolves_GUID_table[b] , EM_RoleValue_Register10 , TempNumber)		--各別註冊兩隻狼的出生點
				table.insert(Wolf_now, TempNumber)								--建立符合狼出生點的當前位置table
				table.insert(Wolf_Des, TempNumber)
				AddBuff (Wolves_GUID_table[b], 624635, 0, -1)
				MoveToFlagEnabled( Wolves_GUID_table[b] , false );						--關閉狼的預設巡邏
				WriteRoleValue(Wolves_GUID_table[b] , EM_RoleValue_IsWalk , 1)				--啟用行走模式
				WriteRoleValue(Wolves_GUID_table[b], EM_RoleValue_Register5, 18 )
				WriteRoleValue(Wolves_GUID_table[b], EM_RoleValue_Register1, TempNumber)
				Wolf_now[b] = TempNumber
				AddBuff(Wolves_GUID_table[b] , 624228, 0, -1)						--紅帽減速NURF
				SetModeEx(Wolves_GUID_table[b] ,EM_SetModeType_Strikback , false)				--不要反擊
				SetModeEx(Wolves_GUID_table[b] ,EM_SetModeType_Searchenemy , false)			--不要索敵
				SetModeEx(Wolves_GUID_table[b] ,EM_SetModeType_Fight , false)				--不要被攻擊
			end
------------------------------------------------------------------------------------------------------------------------------------------------------
			flower_spawn_num = {6,9,10}
			for c =  1 , 3 do
				local TempNumber  = flower_spawn_num[c]
				local CreateFlowers = Lua_CreateObjByDir( Roadsigns_GUID_table[TempNumber] , Flowers_OrgTable[c+1] , 13 , 180)	 --產生三種小花於6、9、10三個路標位置前
				AddToPartition(CreateFlowers , 0)
				table.insert(Flowers_GUID_table , CreateFlowers)
				Score_Position[c][1]=ReadRoleValue(Flowers_GUID_table[c],EM_RoleValue_X)
				Score_Position[c][2]=ReadRoleValue(Flowers_GUID_table[c],EM_RoleValue_Y)
				Score_Position[c][3]=ReadRoleValue(Flowers_GUID_table[c],EM_RoleValue_Z)
			end
		end
	end
	sleep(25)
------------------------------------------------------------------------------------------------------------------------------------------------------
	--當活動受啟動--
------------------------------------------------------------------------------------------------------------------------------------------------------
	while activated do
		PlayerTable = SearchRangePlayer (Roadsigns_GUID_table[9] , 135)
		for n = 0, #PlayerTable-1 do
			tempTarget = PlayerTable[n]
			if tempTarget ~= player then
				ScriptMessage( OwnerID() ,OwnerID()  , 2, "[WY_STORY_REDRIDINGHOOD_INVAID]", 0)
				SetPos(tempTarget, 3200, 45, 65, ReadRoleValue(tempTarget, EM_RoleValue_Dir))
				AddBuff(tempTarget, 624678, 0, 1)
			end
		end
-----------------------------------------------------
	--大野狼要怎樣--
-----------------------------------------------------
		for n = 1,2 do	
			Wolf_Temp_Position[n][1] = ReadRoleValue(Wolves_GUID_table[n],EM_RoleValue_X)						--記錄大野狼當前位置到方便使用的table
			Wolf_Temp_Position[n][2] = ReadRoleValue(Wolves_GUID_table[n],EM_RoleValue_Y)						--^
			Wolf_Temp_Position[n][3] = ReadRoleValue(Wolves_GUID_table[n],EM_RoleValue_Z)						--^
			tempX = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_X)
			tempY = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Y)
			tempZ = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Z)
			tempDir = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Dir)	
			if math.abs(Wolf_Temp_Position[n][1] - tempX)<10 and math.abs(Wolf_Temp_Position[n][3] - tempZ)<10 then			--如果抵達路標重新指向
				-----------------------大野狼防閉鎖機制
				if ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]], EM_RoleValue_Register5) == ReadRoleValue(Wolves_GUID_table[n], EM_RoleValue_Register1) then
					CallPlot(Roadsigns_GUID_table[Wolf_Des[n]], "Roadsigns_Org_Plot")
				else
					WriteRoleValue(Wolves_GUID_table[n], EM_RoleValue_Register1, Wolf_now[n])
				end
				-----------------------
				Wolf_now[n] = Wolf_Des[n]												--重新定義狼當前路標號碼
				if Wolf_now[n] ~= ReadRoleValue(Wolves_GUID_table[n], EM_RoleValue_Register5) then
					Wolf_Dir[n] = ReadRoleValue(Roadsigns_GUID_table[Wolf_now[n]],EM_RoleValue_Register9)			--狼當前目標方位
					Wolf_Des[n] = All_Roadsigns_Where_To_GO_table[Wolf_now[n]][Wolf_Dir[n]]
					tempX = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_X)
					tempY = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Y)
					tempZ = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Z)
					tempDir = ReadRoleValue(Roadsigns_GUID_table[Wolf_Des[n]] , EM_RoleValue_Dir)								
					move(Wolves_GUID_table[n], tempX , tempY , tempZ)
					WriteRoleValue(Wolves_GUID_table[n],EM_RoleValue_Register10,Wolf_now[n])
					WriteRoleValue(Wolves_GUID_table[n],EM_RoleValue_Register10,Wolf_des[n])					--狼將要前往的路標號碼
				end
			end
		end
-----------------------------------------------------
	--小紅帽要怎樣--
-----------------------------------------------------
		if ReadRoleValue(RedRidinghood,EM_RoleValue_Register4) == 0 then
			halt = false
		end
		if not halt then
			RRH_Position[1] = ReadRoleValue(RedRidinghood,EM_RoleValue_X)
			RRH_Position[2] = ReadRoleValue(RedRidinghood,EM_RoleValue_Y)
			RRH_Position[3] = ReadRoleValue(RedRidinghood,EM_RoleValue_Z)
			tempX = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_X)
			tempY = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Y)
			tempZ = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Z)
			tempDir = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Dir)
			-----------------------
			if math.abs(RRH_Position[1] - tempX)<10 and math.abs(RRH_Position[3] - tempZ)<10 then							--如果抵達路標重新指向
				RRH_now = RRH_Des
				if RRH_now ~= ReadRoleValue(RedRidinghood ,EM_RoleValue_Register5 ) then
					StopMove(RedRidinghood,false)  
					RRH_Dir = ReadRoleValue(Roadsigns_GUID_table[RRH_now],EM_RoleValue_Register9)					--紅帽前目標方位
					RRH_Des = All_Roadsigns_Where_To_GO_table[RRH_now][RRH_Dir]							--紅帽要前往的路標號碼
					tempX = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_X)
					tempY = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Y)
					tempZ = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Z)
					tempDir = ReadRoleValue(Roadsigns_GUID_table[RRH_Des] , EM_RoleValue_Dir)
					move(RedRidinghood, tempX , tempY , tempZ)		
					WriteRoleValue(RedRidinghood, EM_RoleValue_Register5, RRH_now )							--註冊小紅帽的出發點	
					WriteRoleValue(RedRidinghood, EM_RoleValue_Register10, RRH_Des)							--重新定義紅帽所在的路標號碼
				end
			end
		end
		for m = 1,2 do	
			if math.abs(Wolf_Temp_Position[m][1] - RRH_Position[1]) <15 and math.abs(Wolf_Temp_Position[m][3] - RRH_Position[3] )<15 then		--如遇到野狼觸發紅帽重啟
				ScriptMessage( player , player  , 2, "[WY_STORY_REDRIDINGHOOD_FAIL]", 0)
				Say(RedRidinghood, "[WY_STORY_REDRIDINGHOOD_FAIL]")
				StopMove(RedRidinghood,0)
				tempX = 3188
				tempY = 45
				tempZ = -30
				tempDir = ReadRoleValue(Roadsigns_GUID_table[1] , EM_RoleValue_Dir)
				RRH_Position[1] = ReadRoleValue(RedRidinghood, EM_RoleValue_X)
				RRH_Position[2] = ReadRoleValue(RedRidinghood, EM_RoleValue_Y)
				RRH_Position[3] = ReadRoleValue(RedRidinghood, EM_RoleValue_Z)
				while math.abs(tempX - RRH_Position[1])>5 or math.abs(tempZ - RRH_Position[3]) >5 do
					RRH_Position[1] = ReadRoleValue(RedRidinghood,EM_RoleValue_X)
					RRH_Position[2] = ReadRoleValue(RedRidinghood,EM_RoleValue_Y)
					RRH_Position[3] = ReadRoleValue(RedRidinghood,EM_RoleValue_Z)
					WriteRoleValue(RedRidinghood, EM_RoleValue_IsWalk, 0)
					move(RedRidinghood, tempX, tempY, tempZ)
					RRH_now = 1
					RRH_Des = 1
					sleep(10)
				end
				WriteRoleValue(RedRidinghood, EM_RoleValue_IsWalk, 1)
				StopMove(RedRidinghood,0)
				WriteRoleValue(RedRidinghood, EM_RoleValue_Register4, 5)
				halt = true
				WriteRoleValue(RedRidinghood, EM_RoleValue_Register5, 18)
			end
		end
		WriteRoleValue(RedRidinghood, EM_RoleValue_Register10, RRH_now)
		---------------------
		for index , value in ipairs(Score_Position) do	-- 得分點的座標
			if math.abs(value[1] - RRH_Position[1])<10 and math.abs(value[3] - RRH_Position[3])<10 then						--如果遇到小花或是終點得分
				if value[1] == ReadRoleValue(Roadsigns_GUID_table[12], EM_RoleValue_X) and value[3] == ReadRoleValue(Roadsigns_GUID_table[12], EM_RoleValue_Z) then
					Say(RedRidinghood, "[WY_STORY_REDRIDINGHOOD_FIN]"..GetName(player).. "[WY_STORY_REDRIDINGHOOD_FINISH]")	-- 小紅帽至終點時的對話
					EndEvent = true;
					halt_timer = GetSystime( 0 )
					RRH_Position[1] = 0
					RRH_Position[2] = 0
					RRH_Position[3] = 0
					AddBuff ( player, 624516, 0, -1 )
					CancelBuff(player , 624633)
					ScriptMessage( OwnerID() ,OwnerID()  , 2, "[WY_STORY_REDRIDINGHOOD_END]", 0)
				else	-- 接近花時得分
					Say(RedRidinghood, "[WY_STORY_REDRIDINGHOOD_FLOWER]")
					AddBuff ( player, 624516, 0, -1 )
					AddBuff ( RedRidinghood, 621971 , 0 , 1)
					DelObj(Flowers_GUID_table[index])
					table.remove(Flowers_GUID_table, index)
					table.remove(Score_Position , index)
				end
			score = score +1
			end
		end
		if not CheckID(player) or not CheckBuff(player, 624633) then	-- 當目標不存在或因死亡致使 Buff 消失時
			halt_timer = GetSystime( 0 )
			RRH_Position[1] = 0
			RRH_Position[2] = 0
			RRH_Position[3] = 0
			EndEvent = true;
		end
		if not CheckDistance( player, Roadsigns_GUID_table[9], 190 ) then
			CancelBuff(player , 624633)
			ScriptMessage( player , player , 2, "[WY_STORY_REDRIDINGHOOD_OOR]", 0)	-- 您已超出活動範圍，導致活動中止。
			EndEvent = true;
		elseif not CheckDistance( player, Roadsigns_GUID_table[9], 175 ) then	-- 注意！ 您目前距離活動範圍過遠，脫離活動範圍將導致活動中斷！
			ScriptMessage( player ,player  , 2, "[WY_STORY_REDRIDINGHOOD_WARNING]", 0)
		end
		if EndEvent then
			StopMove(RedRidinghood,0)
			for index , value in ipairs(Wolves_GUID_table) do
				StopMove(value, 0)
			end
			Sleep(50);
		--	for Countdown = 1,5 do
		--		if Countdown == 5 then
					activated = false
					Delobj(RedRidinghood)
					for index , value in ipairs(Wolves_GUID_table) do
						Delobj(value)
					end
					for i , v in ipairs(Roadsigns_GUID_table) do
						Delobj(v)
					end
					for i, v in ipairs(Flowers_GUID_table) do
						DelObj(v)
					end
					EndEvent = false;
					DelObj(PointBuff)
					Yell(OwnerID(),"[WY_STORY_REDRIDINGHOOD_REDEND]"..GetName(player).."!", 3)
		--		end
		--		sleep(10)
		--	end
		--	WriteRoleValue(OwnerID(), EM_RoleValue_Register8, 0)
		end
	sleep(10)
	end --while end here
	WriteRoleValue(OwnerID(), EM_RoleValue_Register8, 0)
	CallPlot(OwnerID(),"ESFR_Initialize");
end 
------------------------------------------------------------------------------------------------------------------------------------------------------
	--路標Plot啟動函式--
------------------------------------------------------------------------------------------------------------------------------------------------------
function Roadsigns_Plot()
	if CheckBuff( OwnerID() , 624635) then
		Roadsigns_Org_Plot()
	else
		ScriptMessage( OwnerID() ,OwnerID()  , 2, "[WY_STORY_REDRIDINGHOOD_MESSAGE]", 0)
	end
end

function Roadsigns_Org_Plot()
	local n = ReadRoleValue(TargetID(),EM_RoleValue_Register9)
	local current_Displace = ReadRoleValue(TargetID(), EM_RoleValue_Dir) %90
	local Displace_Value = n
	local Adj_Value = 0
	n = n+1
	local Direction_Table={
		ReadRoleValue(TargetID(), EM_RoleValue_Register1), 
		ReadRoleValue(TargetID(), EM_RoleValue_Register2),
		ReadRoleValue(TargetID(), EM_RoleValue_Register3),
		ReadRoleValue(TargetID(), EM_RoleValue_Register4)
				}
	-----------------------
	while not Direction_Table[n] or Direction_Table[n] == 0 do
		if not Direction_Table[n] then n = 1
		else n = n+1 end
	end
	WriteRoleValue(TargetID(), EM_RoleValue_Register9, n)
	-----------------------判斷此路標在各種情況該如何旋轉-----------------------
	if n <Displace_Value then
		Adj_Value = ( 4 - Displace_Value  +  n) * 90
	else
		Adj_Value = ( n - Displace_Value )*90
	end
	AdjustDir(TargetID(), Adj_Value)
end
------------------------------------------------------------------------------------------------------------------------------------------------------
	--活動對話啟動函式--
------------------------------------------------------------------------------------------------------------------------------------------------------
function Event_Story_Fest_RedRidinghood_Dialogue()
	if ReadRoleValue(TargetID(), EM_RoleValue_Register7) == OwnerID() and ReadRoleValue(TargetID(), EM_RoleValue_Register8) == 1 then
		SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_INPLAY]")
		return
	end
	if CheckFlag( OwnerID() , 548188) then
		SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_ALREADY]")
	else
		if ReadRoleValue(TargetID(), EM_RoleValue_Register8) == 1 then
			SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_WAIT]")
		else
			SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_GREET] ")
			AddSpeakOption(OwnerID(),TargetID(), "[WY_STORY_REDRIDINGHOOD_HOW]", "Event_Story_Fest_Explan" , 0)
			AddSpeakOption(OwnerID(),TargetID(), "[WY_STORY_REDRIDINGHOOD_OPT_JOIN]", "ESFR_start" , 0)
		end
	end
end

function Event_Story_Fest_Explan()
	SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_EXPLANE]")
	AddSpeakOption(OwnerID(),TargetID(), "[WY_STORY_REDRIDINGHOOD_OPT_JOIN]", "ESFR_start" , 0)
	WriteRoleValue(TargetID(),EM_RoleValue_Register7,OwnerID())
	CloseSpeak(OwnerID())
end

function Event_Story_Fest_Restart()
	CloseSpeak(OwnerID())
	WriteRoleValue(TargetID(), EM_RoleValue_Register4, 0)
	Say(TargetID(), "[WY_STORY_REDRIDINGHOOD_GO]")
end

function ESFR_start()

	local Owner = OwnerID();
	local Target = TargetID();
	local Running = ReadRoleValue( Target, EM_RoleValue_Register8 );

	if Running == 1 then
		SetSpeakDetail( Owner, "[WY_STORY_REDRIDINGHOOD_WAIT]" );	-- 任務進行中
	else
		WriteRoleValue( Target, EM_RoleValue_Register7, Owner );	-- 將玩家寫入任務 Npc 的 Reg+7 中
		WriteRoleValue( Target, EM_RoleValue_Register8, 1 );	-- 將已接取任務狀態寫入至 Npc 的 Reg+8 中
	end

	local TempTable = SearchRangePlayer( Target, 80 );	-- 關閉範圍內其他已開啟對話視窗的玩家
	for i,v in pairs(TempTable) do
		CloseSpeak(v);
	end
end

function ESFR_Buff_Count()
	local X = BuffCount(OwnerID())
	DebugMsg(0,0, "X = "..X)
	local TempID = 0
	local score = 10
	local score_count_buff = 624516
	for Y = 0, X-1 do
		DebugMsg(0,0, "found buff ID = "..BuffInfo(OwnerID(), Y ,EM_BuffInfoType_BuffID ))
		if BuffInfo(OwnerID(), Y ,EM_BuffInfoType_BuffID ) == score_count_buff then
			DebugMsg(0,0, "Buff Power = "..BuffInfo(OwnerID(), Y ,EM_BuffInfoType_Power ))
			score = BuffInfo(OwnerID(), Y ,EM_BuffInfoType_Power )
		end
	end
	if score <= 2 then
		GiveBodyItem(OwnerID(), 240059 , score+1 )
	elseif  score == 10 then
		GiveBodyItem(OwnerID(), 724509 , 1)
	elseif score == 3 then
		GiveBodyItem(OwnerID(), 240059 , 5)
	end
	CancelBuff(OwnerID() , score_count_buff)
	CancelBuff (OwnerID(), 624635)
end

function RED_122609()
	if CheckBuff( OwnerID() , 624635) then
		if ReadRoleValue(TargetID(), EM_RoleValue_Register4) ==5 then
			SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_RESTART]")
			AddSpeakOption(OwnerID(),TargetID(),"[WY_STORY_REDRIDINGHOOD_RSOP]","Event_Story_Fest_Restart", 0)
		else
			SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_RED]")
		end
	else
		SetSpeakDetail(OwnerID(), "[WY_STORY_REDRIDINGHOOD_WHORU]")
	end
end

function kill_all_event_NPC()
	local TempTable = {}
	local TempID = 0
	TempTable = SearchRangeNPC(OwnerID(), 800)
	for a = 1, #TempTable do
		TempID = TempTable[a]
		if ReadRoleValue(TempID, EM_RoleValue_OrgID) == 122609 or ReadRoleValue(TempID, EM_RoleValue_OrgID) == 122690 or ReadRoleValue(TempID, EM_RoleValue_OrgID) == 122722 or
		   ReadRoleValue(TempID, EM_RoleValue_OrgID) == 113117 then
			DelObj(TempID)
		end
	end
end

function Event_RRH_Add_Score()
	AddBuff (OwnerID(), 624516, 0, -1 )
end