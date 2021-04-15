--==================================================--
-- 階段流程
-- 1. Phase1 運輸隊運送過程
-- 2. Phase2 盜賊團前鋒攻擊(1成功)
-- 3. Phase3 盜賊團總攻擊(2成功)
-- 4. Phase4 盜賊團首領攻擊(3成功)
-- ?. Phase? 運輸隊防衛成功(4成功)
-- ?. Phase? 盜賊團搶奪成功(2,3,4失敗)
-- ?. Phase? 運送隊死光(不檢測)
--==================================================--

--==================================================--
--  測試函式區                                      --
--==================================================--

function LuaPE_ZONE15_PE01TAD_DeleteAll( DeleteMode )
	local Obj = ZONE15_PE01TAD_Obj
	local StartNum = 1

	if DeleteMode ~= nil and DeleteMode == 1 then
		StartNum = 2
	end

	for i = StartNum, table.getn(Obj) do
		if CheckID(Obj[i]) == true then
			DelObj( Obj[i] )
		end
	end
end

function LuaPE_ZONE15_PE01TAD_KillThief()
	PE_SetVar( "ZONE15_PE01TAD_Var_ThiefKilled" , 30 )
end

function LuaPE_ZONE15_PE01TAD_KillGuard()
	local Var = ZONE15_PE01TAD_Var
	local GuardID = Var["GuardID"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local Obj = ZONE15_PE01TAD_Obj
	
	for i=1, table.getn(Obj) do
		local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
		if OrgID == GuardID[1] or OrgID == GuardID[2] Or OrgID == GuardLeaderID then
			DelObj( Obj[i] )
		end
	end
	ZONE15_PE01TAD_Var["TotalGuardNum"] = ZONE15_PE01TAD_Var["PH2CanKillGuard"] + 1
end
--==================================================--



--==================================================--
--  全域變數區                                      --
--==================================================--
function LuaPE_ZONE15_PE01TAD_GlobalSet()
	ZONE15_PE01TAD_Obj = {}		-- 使用物件管理陣列
	ZONE15_PE01TAD_Var = {}		-- 使用參數管理陣列
	ZONE15_PE01TAD_Phase = 0	-- 階段標籤

	ZONE15_PE01TAD_Var["ControllerID"] = 113714	-- 控制物件(破爛木箱)
	ZONE15_PE01TAD_Var["Controller"] = 0		-- 控制物件GID

	ZONE15_PE01TAD_Var["FlagID"] = 780536	-- 旗標ID
	
	ZONE15_PE01TAD_Var["TotalGuardNum"] = 0	-- 隊員總數
	ZONE15_PE01TAD_Var["GuardNum"] = 0		-- 目前隊員數量
	ZONE15_PE01TAD_Var["ThiefNum"] = 0		-- 目前盜賊數量
	
	ZONE15_PE01TAD_Var["GuardCreateNum"] = 4 	-- 每次產生隊員數
	ZONE15_PE01TAD_Var["MaxGuardNum"] = 7	-- 隊員隊多數量

	ZONE15_PE01TAD_Var["PH2NeedKillThief"]  = 30	-- 階段二需要殺死盜賊數目
	ZONE15_PE01TAD_Var["PH2CanKillGuard"] = 25		-- 階段二會出現的隊員數目

	ZONE15_PE01TAD_Var["TransCarID"] = 103100	-- 運貨車ID
	ZONE15_PE01TAD_Var["TransCar"] = 0			-- 運貨車GID
	ZONE15_PE01TAD_Var["TransTeam"] = {}		-- 運輸隊桌

	ZONE15_PE01TAD_Var["RobFlag"] = 24	-- 運貨車走到哪個旗標，盜賊登場

	ZONE15_PE01TAD_Var["ResetTime"] = 3600	-- 公眾任務重置時間(秒)	1小時
	ZONE15_PE01TAD_Var["TimeSpace"] = 15			-- 計時間隔(秒)
	
	ZONE15_PE01TAD_Var["GuardID"] = { 103101, 103102 }	-- 運輸隊員, 厚裝運輸隊員
	ZONE15_PE01TAD_Var["GuardLeaderID"] = 103103	-- 運輸小隊長

	ZONE15_PE01TAD_Var["ThiefID"] = { 103104, 103105 }	-- 劫掠盜賊, 粗猛盜賊
	ZONE15_PE01TAD_Var["ThiefLeaderID"] = 103106		-- 盜賊團首領．塔娜

	ZONE15_PE01TAD_Var["PH3Time"] = 90				-- 階段三總時間(秒)
	
	ZONE15_PE01TAD_Var["AreaID"] = 765		-- 公眾事件分區編號		林格羅村
	ZONE15_PE01TAD_Var["TestID"] = 1		-- 公眾事件測試區編號
	
end
--==================================================--



--==================================================--
--  公眾事件設定區                                  --
--==================================================--

function LuaPE_ZONE15_PE01TAD_PESet()

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_PESet Start!!" )
	local PE_Name = "SC_PE_ZONE15_01TAD_PENAME"	-- 盜賊團的襲擊
	local PE_Desc = "SC_PE_ZONE15_01TAD_PEDESC"	-- 羅芙洛運輸隊是將貨物平安送抵各地的一個武裝運輸隊，但是他們所運送的貨物已經被塔娜盜賊團所盯上，如今運貨車即將抵達達拉尼斯廢城區的西門...
	local PEIndex = 1
	local PE_ResetTime = ZONE15_PE01TAD_Var["ResetTime"] * 1000
	-- 新增一個事件
	PE_AddPE( PE_Name , PE_Desc , PEIndex , PE_ResetTime )

	local AreaID = ZONE15_PE01TAD_Var["AreaID"]
	local TestID = ZONE15_PE01TAD_Var["TestID"]
	PE_AddRegion( PEIndex , AreaID )	-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )	-- 把PE放進測試區

	local PH1Index = 101
	local PH1_Name = "SC_PE_ZONE15_01TAD_PHNAME01"	-- 羅芙洛運輸隊的來臨
	local PH1_Desc = ""	-- 由於運輸隊的努力，將貨物成功護送到了村莊附近。
	local PH2Index = 102
	local PH2_Name = "SC_PE_ZONE15_01TAD_PHNAME02"	-- 塔娜盜賊團探子的突擊
	local PH2_Desc = ""	-- 埋伏多時的劫掠盜賊顯現身影，開始襲擊運輸隊！
	local PH3Index = 103
	local PH3_Name = "SC_PE_ZONE15_01TAD_PHNAME03"	-- 塔娜盜賊團的全力攻擊
	local PH3_Desc = ""	-- 盜賊一湧而出，全力攻擊運輸隊以奪取貨物！
	local PH4Index = 104
	local PH4_Name = "SC_PE_ZONE15_01TAD_PHNAME04"	-- 盜賊團首領．塔娜的最後攻擊
	local PH4_Desc = ""	-- 盜賊團已全數傾巢而出，快協助運輸隊，保護住貨物吧！

	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- 新增階段1
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- 新增階段2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- 新增階段3
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- 新增階段4

	local OB1Index = 1001
	local OB1_Name = "SC_PE_ZONE15_01TAD_OBNAME01"	-- 運貨車抵達
	local OB1_Desc = ""
	-- 新增一個目標，階段1成功條件：運貨車抵達
	PE_PH_AddObjective_Equal( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "ZONE15_PE01TAD_Var_TransCarComing" , 0 , 1 ,  true )

	local OB2Index = 1002
	local OB2_Name = "SC_PE_ZONE15_01TAD_OBNAME02"	-- 殲滅劫掠盜賊
	local OB2_Desc = ""
	-- 新增一個目標，階段2成功條件：殺死30個盜賊
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE15_PE01TAD_Var_ThiefKilled" , 0 , ZONE15_PE01TAD_Var["PH2NeedKillThief"] ,  true )

	local OB3Index = 1003
	local OB3_Name = "SC_PE_ZONE15_01TAD_OBNAME03"	-- 抵擋塔娜盜賊團的全力攻擊 
	local OB3_Desc = ""
	-- 新增一個目標，階段3成功條件：撐過指定時間
	PE_PH_AddObjective_TimeLimit( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE15_PE01TAD_Time" , ZONE15_PE01TAD_Var["PH3Time"]*1000 , 0 ,  true )

	local OB4Index = 1004
	local OB4_Name = "SC_PE_ZONE15_01TAD_OBNAME04"	-- 打倒盜賊團首領．塔娜
	local OB4_Desc = ""
	-- 新增一個目標，階段4成功條件：幹掉盜賊團首領
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "ZONE15_PE01TAD_Var_ThiefBossKill" , 0 , 1 ,  true )

	local OB5Index = 1005
	local OB5_Name = "SC_PE_ZONE15_01TAD_OBNAME05"	-- 運貨車被掠奪一空
	local OB5_Desc = ""
	-- 新增一個目標，階段2,3,4失敗條件：運貨車被打爛
	PE_PH_AddObjective_Equal( PEIndex , PH2Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE01TAD_Var_TransCarKill" , 0 , 1 ,  false )
	PE_PH_AddObjective_Equal( PEIndex , PH3Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE01TAD_Var_TransCarKill" , 0 , 1 ,  false )
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE01TAD_Var_TransCarKill" , 0 , 1 ,  false )

	-- 設定階段連接
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )

	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE15_PE01TAD_OB_OnAchieve" )
	
	-- 設定事件結束的結算回摳函式
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE15_PE01TAD_FinalExchange" )

	-- 事件啟動
	PE_Start( PEIndex , PH1Index )
	
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_PESet END!!" )
end

function LuaPE_ZONE15_PE01TAD_OB_OnAchieve( PEIndex , PHIndex , OBIndex )
	local Ctrl = ZONE15_PE01TAD_Var["Controller"]

	if PHIndex == 101 and OBIndex == 1001 then
		LuaPE_ZONE15_PE01TAD_Message( 2  )--盜賊開始出現
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_ThiefTimeCreate" , 0 )	-- 產盜賊
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_GuardTimeCreate" , 0 )	-- 產護衛
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_FlagtoCallAttack", 0 )	--定時檢查
	elseif PHIndex == 102 and OBIndex == 1002 then
		LuaPE_ZONE15_PE01TAD_Message( 3  )--盜賊大量出現		
	elseif PHIndex == 103 and OBIndex == 1003 then
		LuaPE_ZONE15_PE01TAD_Message( 4  )--BOSS出現
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_BossCreate", 0 )-- 產BOSS怪
	elseif PHIndex == 104 and OBIndex == 1004 then
		LuaPE_ZONE15_PE01TAD_Message( 5  )
		LuaPE_ZONE15_PE01TAD_Message( 7  )
		LuaPE_ZONE15_PE01TAD_RobBack( true )--NPC離開
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_Reset", 0 )
	elseif OBIndex == 1005 then
		LuaPE_ZONE15_PE01TAD_Message( 6  )
		LuaPE_ZONE15_PE01TAD_RobBack( false )--NPC離開
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_Reset", 0 )
	end
end

function LuaPE_ZONE15_PE01TAD_FinalExchange( PEIndex , GUID , Score )
	local LV = 54
	local MapID = ZONE15_PE01TAD_Var["AreaID"]
	if LuaPE_ZONE15_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = 10
	local TokenID = 206871	-- 羅芙洛白色珍珠
	
	if Score > ExCha_Ratio then
		if Score >= 600 then Score = 600 end
		GiveBodyItem( GUID , TokenID , math.floor( Score/ExCha_Ratio ) )
	end
end

--==================================================--

--==================================================--
--  訊息處理區                                      --
--==================================================--

--傳送訊息
function LuaPE_ZONE15_PE01TAD_Message( Index  )	
	ZONE15_PE01TAD_Phase = Index
	local Ctrl = ZONE15_PE01TAD_Var["Controller"]
	local Color = "0xffffff00"	-- 強制訊息為黃色

	local Message = {}
	Message[1] = "[SC_PE_ZONE15_01TAD_M04]"	-- 羅芙洛運輸隊即將抵達達拉尼斯廢城區西門！
	Message[2] = "[SC_PE_ZONE15_01TAD_M05]"	-- 埋伏在附近的塔娜盜賊團探子出現了！
	Message[3] = "[SC_PE_ZONE15_01TAD_M06]"	-- 塔娜盜賊團的盜賊展開了全力攻擊！
	Message[4] = "[SC_PE_ZONE15_01TAD_M07]"	-- 盜賊團首領．塔娜現身發動最後攻擊！！
	Message[5] = "[SC_PE_ZONE15_01TAD_M08]"	-- 貨物車成功的被保護下來！
	Message[6] = "[SC_PE_ZONE15_01TAD_M09]"	-- 塔娜盜賊團的盜賊將貨物搶奪回去了！！
	Message[7] = "[SC_PE_ZONE15_01TAD_M10]"	-- 塔娜盜賊團殘餘的盜賊倉皇的撤退了！！
	
	
	if Index == 1 or Index > 5 then
		ScriptMessage( Ctrl, -1 , 1 , Message[Index] , Color )
		ScriptMessage( Ctrl, -1 , 0 , Message[Index] , Color )
	else
		local AreaID = ZONE15_PE01TAD_Var["AreaID"]	-- 怪物補給線東邊
		local AreaPlayer = LuaPE_ZONE15_GetAreaPlayer( AreaID )
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( Ctrl, AreaPlayer[i] , 1 , Message[Index] , Color )
			ScriptMessage( Ctrl, AreaPlayer[i] , 0 , Message[Index] , Color )
		end
	end
	DebugMsg(0,0,"LuaPE_ZONE15_PE01TAD_Message "..Index )
end

--==================================================--



--==================================================--
--  共用函式區                                      --
--==================================================--

--物件產生
function LuaPE_ZONE15_PE01TAD_ObjCreate( ObjID , FlagID , Flag , ObjNum, ObjType )
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ObjCreate Start!!" )
	local Obj = {}
	local RoomID = 0
		
	for i = 1 , ObjNum do
		if Type(ObjID) == "table" then
			Obj[i] = CreateObjByFlag( ObjID[(i%2)+1], FlagID , Flag[i], 1 )
		else
			Obj[i] = CreateObjByFlag( ObjID, FlagID , Flag, 1 )
		end

		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 0 )	-- 用跑的移動
		AddToPartition( Obj[i] , RoomID )
		SetIdleMotion( Obj[i] , ruFUSION_ACTORSTATE_COMBAT_1H )	-- 預設是戰鬥動作
		MoveToFlagEnabled( Obj[i] , false )		-- 關閉巡邏劇情
		table.insert( ZONE15_PE01TAD_Obj , Obj[i] )	-- 加入物件管理陣列
		
		AddBuff( Obj[i] , 506303 , 0 , -1 )	-- 防AE的Buff
		SetFlag( Obj[i], 544801, 1 )--關閉帕奇鼠(4.0.0追加)
		
		if ObjType == "NPC" then
			ZONE15_PE01TAD_Var["TotalGuardNum"] = ZONE15_PE01TAD_Var["TotalGuardNum"] +1
			ZONE15_PE01TAD_Var["GuardNum"] = ZONE15_PE01TAD_Var["GuardNum"] + 1
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE01TAD_GuardDead", 0 )
		elseif ObjType == "Thief" then
			ZONE15_PE01TAD_Var["ThiefNum"] = ZONE15_PE01TAD_Var["ThiefNum"] + 1
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE01TAD_ThiefDead", 0 )
		else
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE01TAD_BossDead", 0 )			
		end
		
		CallPlot( Obj[i] , "LuaPE_ZONE15_PE01TAD_NPCDo" , 0 )
		Sleep( 1 )
	end

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ObjCreate END!!" )
	if ObjNum == 1 then
		return obj[1]
	end
	return obj
end

function LuaPE_ZONE15_PE01TAD_SetAttack()--要求攻擊貨車
	local Obj = ZONE15_PE01TAD_Obj
	local Var = ZONE15_PE01TAD_Var
	local TransCarID = Var["TransCarID"]
	local ThiefID = Var["ThiefID"]
	local ThiefLeaderID = Var["ThiefLeaderID"]
	local x = ReadRoleValue( TransCarID, EM_RoleValue_X )
	local y = ReadRoleValue( TransCarID, EM_RoleValue_Y )
	local z = ReadRoleValue( TransCarID, EM_RoleValue_Z )
		
	for i=1, table.getn(Obj) do
		local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
		if OrgID == ThiefID[1] or OrgID == ThiefID[2] or OrgID == ThiefLeaderID then
			ClearHateList( Obj[i], -1 )
			MoveDirect( Obj[i], x, y, z )
			SetAttack( Obj[i] , TransCarID )	-- 所有人攻擊
		end
	end
end

--==================================================--

--==================================================--
--  盜賊團夜襲  物件產生區                          --
--==================================================--
function LuaPE_ZONE15_PE01TAD_GuardTimeCreate()--產生護衛
	local Var = ZONE15_PE01TAD_Var
	
	local TimeSpace = Var["TimeSpace"]		-- 計時間隔(秒)
	local GuardID = Var["GuardID"]	
	local FlagID = Var["FlagID"]	
	local GuardNum = Var["GuardNum"]	-- 隊員產生數目
	local MaxNum = Var["MaxGuardNum"]
	local TimeCreateNum = Var["GuardCreateNum"]
	local Flag = { 1 , 2 , 3 , 4 , 5 }

	while true do
		Sleep( TimeSpace * 20 )
		local Num = Var["GuardNum"]	-- 隊員產生數目
		local CreateNum = 0
	
		if ZONE15_PE01TAD_Phase > 4 or Var["TotalGuardNum"] >= Var["PH2CanKillGuard"] then
			break;
		elseif Num < MaxNum then
			CreateNum = MaxNum - Num
			if CreateNum >= TimeCreateNum then
				LuaPE_ZONE15_PE01TAD_ObjCreate( GuardID , FlagID , Flag , TimeCreateNum, "NPC" )
			elseif CreateNum < TimeCreateNum and CreateNum > 0 then
				LuaPE_ZONE15_PE01TAD_ObjCreate( GuardID , FlagID , Flag , CreateNum, "NPC" )
			else
				DebugLog( 2, "LuaPE_ZONE15_PE01TAD_GuardTimeCreate 0" )
			end
		end		
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_GuardTimeCreate END" ) 
end

function LuaPE_ZONE15_PE01TAD_ThiefTimeCreate()--產生盜賊團
	local Var = ZONE15_PE01TAD_Var
	local FlagID = Var["FlagID"]
	local TimeSpace = Var["TimeSpace"]		-- 計時間隔(秒)
	local ThiefID = Var["ThiefID"]
	local Flag = { 6 , 7 , 8 , 9 , 10 , 6 , 7 , 8 , 9 , 10 }
	
	while true do			
		local Num = Var["ThiefNum"]-- 目前怪物數量
		local MaxNum = ZONE15_PE01TAD_Phase*4 
		local TimeCreateNum = math.floor( ZONE15_PE01TAD_Phase*2 )
		local CreateNum = 0
		
		if ZONE15_PE01TAD_Phase > 4 then
			break;	
		elseif Num < MaxNum then
			CreateNum = MaxNum - Num			
			if CreateNum >= TimeCreateNum then
				LuaPE_ZONE15_PE01TAD_ObjCreate( ThiefID , FlagID , Flag , TimeCreateNum, "Thief" )
			elseif CreateNum < TimeCreateNum and CreateNum > 0 then
				LuaPE_ZONE15_PE01TAD_ObjCreate( ThiefID , FlagID , Flag , CreateNum, "Thief" )
			else
				DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ThiefTimeCreate 0" )
			end
		end

		Sleep( TimeSpace * 10 )
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ThiefTimeCreate END!!" )
end

function LuaPE_ZONE15_PE01TAD_BossCreate()--產生BOSS
	local ThiefLeaderID = ZONE15_PE01TAD_Var["ThiefLeaderID"]	
	local FlagID = ZONE15_PE01TAD_Var["FlagID"]
	local Boss = LuaPE_ZONE15_PE01TAD_ObjCreate( ThiefLeaderID , FlagID , 24 , 1 , "Boss" )
	AddBuff( Boss, 502546, 0, -1 )--放大1.3
	NPCSay( Boss, "[SC_PE_ZONE15_01TAD_M13]" )	-- 太慢了！我親自來搶貨物車！
	
	CallPlot( ZONE15_PE01TAD_Var["Controller"], "LuaPE_ZONE15_PE01TAD_SetAttack", 0 )
end

function LuaPE_ZONE15_PE01TAD_TransTeamCreate()	-- 產生運輸隊
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_TransTeamCreate Start!!" )
	local Var = ZONE15_PE01TAD_Var

-- 這以下是運貨車
	local TransCarID = Var["TransCarID"]
	local FlagID = Var["FlagID"]
	local TransCarBronFlag = 21
	local RoomID = 0

	local TransCar = CreateObjByFlag( TransCarID , FlagID , TransCarBronFlag , 1 )
	SetModeEx( TransCar , EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( TransCar , EM_SetModeType_Strikback , false )	-- 反擊
	SetModeEx( TransCar , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( TransCar , EM_SetModeType_Fight , false )		-- 可砍殺攻擊
	SetModeEx( TransCar , EM_SetModeType_ShowRoleHead , false )	-- 頭像框
	--WriteRoleValue( TransCar , EM_RoleValue_IsAttackMode , 0 )	-- 不是攻擊狀態
	WriteRoleValue( TransCar , EM_RoleValue_IsWalk , 1 )	-- 用走的移動
	AddToPartition( TransCar , RoomID )
	MoveToFlagEnabled( TransCar , false )	-- 關閉巡邏劇情
	AddBuff( TransCar, 502707, 0, -1 )--HP停止回復
	table.insert( ZONE15_PE01TAD_Obj , TransCar )
	ZONE15_PE01TAD_Var["TransCar"] = TransCar 
	Sleep( 5 )
	
	SetPlot( TransCar , "DEAD" , "LuaPE_ZONE15_PE01TAD_CarDead" , 0 )	-- 設定死亡劇情

-- 這以下是運輸隊
	local GuardID = Var["GuardID"]
	local GuardLeaderID =  Var["GuardLeaderID"]
	
	local TransTeamID = { GuardLeaderID , GuardID[2] , GuardID[2] , GuardID[1] , GuardID[1], GuardID[1] }
	local TransTeamNum = 5	-- 這邊只產生 前跟左右兩邊的護衛

	local X = ReadRoleValue( TransCar , EM_RoleValue_X )
 	local Y = ReadRoleValue( TransCar , EM_RoleValue_Y )
 	local Z = ReadRoleValue( TransCar , EM_RoleValue_Z )
	local Dir = ReadRoleValue( TransCar , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( TransCar , EM_RoleValue_RoomID )

	local Width = 30
	local Height = 30

	local TransTeam = {}
	local TransTeamBornPosition = LuaPE_ZONE15_FormationPosition( X , Y , Z , Width , Height , Dir )

	for i = 1 , TransTeamNum do
		if TransTeamID[i] ~= nil then
			TransTeam[i] = CreateObj( TransTeamID[i] , TransTeamBornPosition["X"][i], TransTeamBornPosition["Y"][i] , TransTeamBornPosition["Z"][i] , Dir , 1 )
			SetModeEx( TransTeam[i] , EM_SetModeType_Mark , false )			-- 標記
			SetModeEx( TransTeam[i] , EM_SetModeType_Strikback , false )	-- 反擊
			SetModeEx( TransTeam[i] , EM_SetModeType_Searchenemy , false )	-- 索敵
			SetModeEx( TransTeam[i] , EM_SetModeType_Fight , false )		-- 可砍殺攻擊
			WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 1 )		-- 用走的移動
			AddToPartition( TransTeam[i] , RoomID )
			MoveToFlagEnabled( TransTeam[i] , false )	-- 關閉巡邏劇情
			table.insert( ZONE15_PE01TAD_Obj , TransTeam[i] )
			SetPlot( TransTeam[i] , "DEAD" , "LuaPE_ZONE15_PE01TAD_GuardDead" , 0 )	-- 設定死亡劇情
		end
	end
	
	ZONE15_PE01TAD_Var["GuardNum"] = ZONE15_PE01TAD_Var["GuardNum"] + TransTeamNum
	ZONE15_PE01TAD_Var["TotalGuardNum"] = ZONE15_PE01TAD_Var["TotalGuardNum"] + TransTeamNum
	ZONE15_PE01TAD_Var["TransTeam"] = TransTeam

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_TransTeamCreate END!!" )
end
--==================================================--



--==================================================--
--  盜賊團夜襲  死亡處理區                          --
--==================================================--
function LuaPE_ZONE15_PE01TAD_GuardDead()
	if ZONE15_PE01TAD_Phase < 5 then
		ZONE15_PE01TAD_Var["GuardNum"] = ZONE15_PE01TAD_Var["GuardNum"] - 1
	end
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE01TAD_ThiefDead()
	if ZONE15_PE01TAD_Phase < 5 then
		local PEIndex = 1
		local MapID = ZONE15_PE01TAD_Var["AreaID"]
		local Car = ZONE15_PE01TAD_Var["TransCar"]
		LuaPE_ZONE15_GetBonus( PEIndex, MapID, 3,  450, Car )         -- 擊殺給予分數
		
		ZONE15_PE01TAD_Var["ThiefNum"] = ZONE15_PE01TAD_Var["ThiefNum"] - 1
		PE_SetVar( "ZONE15_PE01TAD_Var_ThiefKilled" , PE_GetVar( "ZONE15_PE01TAD_Var_ThiefKilled" )+1  )		-- PE變數改變
	end
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE01TAD_BossDead()
	PE_SetVar( "ZONE15_PE01TAD_Var_ThiefBossKill" , 1 )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ReadRoleValue( TargetID() , EM_RoleValue_IsNPC ) == 0 then
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷	
			RunningMsg( OwnerID() , 1 , "[SC_PE_ZONE15_01TAD_M14][$SETVAR1="..GetName(TargetID()).."]" )		-- 在玩家 [$VAR1] 英勇的作戰之下，[103106] 被擊退了！
		end
	else
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷	
			RunningMsg( OwnerID() , 1 , "[SC_PE_ZONE15_01TAD_M15]" )		-- 在眾人英勇的作戰之下，[103106] 被擊退了！
		end
	end

	local PEIndex = 1
	local MapID = ZONE15_PE01TAD_Var["AreaID"]
	local Car = ZONE15_PE01TAD_Var["TransCar"]
	LuaPE_ZONE15_GetBonus( PEIndex, MapID, 50, 450, Car )         -- 擊殺給予分數
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE01TAD_CarDead()
	PE_SetVar( "ZONE15_PE01TAD_Var_TransCarKill" , 1 )
	DelObj( OwnerID() )
	return true;
end
--==================================================--



--==================================================--
--  盜賊團夜襲  移動表演區                          --
--==================================================--

function LuaPE_ZONE15_PE01TAD_NPCDo()
	local FlagObjID = ZONE15_PE01TAD_Var["FlagID"]
	local FlagGoID = ZONE15_PE01TAD_Var["RobFlag"]
	local Range = 30

	LuaPE_ZONE15_ObjGoFlag( OwnerID() , FlagObjID , FlagGoID , Range )
end

function LuaPE_ZONE15_PE01TAD_TransTeamDo()
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_TransTeamDo Start!!" )
	local Var = ZONE15_PE01TAD_Var

	local TransCar = Var["TransCar"]
	local TransTeam = Var["TransTeam"]
	local FlagObjID = Var["FlagID"]
	local FlagGoID = 21	-- 從第 21 點開始走
	local Range = 30
	local Width = 30
	local Height = 50
	local CheckDis = 30
	local TransTeamNum = 5	-- 這邊只產生 前跟左右兩邊的護衛

	local FlagX = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )
	
	local RoomID = 0

	local TransCarDir = ReadRoleValue( TransCar , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( TransCar, EM_RoleValue_RoomID )
	PreviousDir = TransCarDir

	while true do
		Sleep( 10 )
		local TransCarX = ReadRoleValue( TransCar , EM_RoleValue_X )
	 	local TransCarY = ReadRoleValue( TransCar , EM_RoleValue_Y )
	 	local TransCarZ = ReadRoleValue( TransCar , EM_RoleValue_Z )
		local TransCarDir = ReadRoleValue( TransCar , EM_RoleValue_Dir )

		if math.abs( TransCarX - FlagX ) < Range and math.abs( TransCarZ - FlagZ ) < Range then	-- 走到定點設定下一點位置
			FlagGoID = FlagGoID + 1
			FlagX = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
			FlagY = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
			FlagZ = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )
			FlagX = FlagX + Rand( Range ) * 2 - Range + 1
			FlagZ = FlagZ + Rand( Range ) * 2 - Range + 1
			MoveDirect( TransCar , FlagX , FlagY , FlagZ )	-- 運貨車移動
		end

		local DeltaDir = math.abs( PreviousDir - TransCarDir )	--轉向處理，看是否需要變化陣型位置
		if DeltaDir > 90 and DeltaDir < 270 then	-- 變化陣型位置
			local tmp = 0
			if TransTeam[1] ~= nil and TransTeam[6] ~= nil then
				tmp = TransTeam[1]
				TransTeam[1] = TransTeam[6]
				TransTeam[6] = tmp
			end
			if TransTeam[2] ~= nil and TransTeam[5] ~= nil then
				tmp = TransTeam[2]
				TransTeam[2] = TransTeam[5]
				TransTeam[5] = tmp
			end
			if TransTeam[3] ~= nil and TransTeam[4] ~= nil then
				tmp = TransTeam[3]
				TransTeam[3] = TransTeam[4]
				TransTeam[4] = tmp
			end
		end
		PreviousDir = TransCarDir

		local TransTeamBornPosition = LuaPE_ZONE15_FormationPosition( TransCarX , TransCarY , TransCarZ , Width , Height , TransCarDir )	-- 計算該走到的位置

		for i = 1 , TransTeamNum do
			if TransTeam[i] ~= nil and CheckID( TransTeam[i] ) == true and ReadRoleValue( TransTeam[i] , EM_RoleValue_IsNPC ) == 1 then	-- 是否 NPC 且存在
				local DeltaX = math.abs( TransTeamBornPosition["X"][i]-ReadRoleValue( TransTeam[i] , EM_RoleValue_X ) )
				local DeltaY = math.abs( TransTeamBornPosition["Y"][i]-ReadRoleValue( TransTeam[i] , EM_RoleValue_Y ) )
				local DeltaZ = math.abs( TransTeamBornPosition["Z"][i]-ReadRoleValue( TransTeam[i] , EM_RoleValue_Z ) )
				if DeltaX > CheckDis or DeltaY > CheckDis or DeltaZ > CheckDis then
					WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 0 )
					if DeltaX < 2*CheckDis and DeltaY < 2*CheckDis and DeltaZ < 2*CheckDis then
						WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 1 )
						MoveDirect( TransTeam[i] , TransTeamBornPosition["X"][i] , TransTeamBornPosition["Y"][i] , TransTeamBornPosition["Z"][i] )
					else
						WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 0 )
						Move( TransTeam[i] , TransTeamBornPosition["X"][i] , TransTeamBornPosition["Y"][i] , TransTeamBornPosition["Z"][i] )
					end
				else
					WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 1 )
					MoveDirect( TransTeam[i] , TransTeamBornPosition["X"][i] , TransTeamBornPosition["Y"][i] , TransTeamBornPosition["Z"][i] )
				end
			end
		end
		
		if FlagGoID == Var["RobFlag"] then
			PE_SetVar( "ZONE15_PE01TAD_Var_TransCarComing" , 1 )

			for j = 1 , table.getn(TransTeam) do
				Hide( TransTeam[j] )
				SetModeEx( TransTeam[j] , EM_SetModeType_Mark , true )			-- 標記
				SetModeEx( TransTeam[j] , EM_SetModeType_Strikback , true )		-- 反擊
				SetModeEx( TransTeam[j] , EM_SetModeType_Searchenemy , true )	-- 索敵
				SetModeEx( TransTeam[j] , EM_SetModeType_Fight , true )			-- 可砍殺攻擊
				SetIdleMotion( TransTeam[j] , ruFUSION_ACTORSTATE_COMBAT_1H )	-- 預設是戰鬥動作			
				Show( TransTeam[j] , RoomID )
				if j == 1 then
					NPCSay( TransTeam[j] , "[SC_PE_ZONE15_01TAD_M11]" )
				else
					NPCSay( TransTeam[j] , "[SC_PE_ZONE15_01TAD_M12]" )
				end
			end

	--注意！有人來搶劫了，保護好貨物車！
			Hide( TransCar )
			SetModeEx( TransCar , EM_SetModeType_Mark , true )		-- 標記
			SetModeEx( TransCar , EM_SetModeType_Fight , true )		-- 可砍殺攻擊
			SetModeEx( TransCar , EM_SetModeType_Move , false )		-- 不移動
			SetModeEx( TransCar , EM_SetModeType_ShowRoleHead , true )	-- 頭像框			
			Show( TransCar , RoomID )
			break;
		end
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_TransTeamDo END!!" )
end

function LuaPE_ZONE15_PE01TAD_FlagtoCallAttack()	-- 防止人物發呆
	local Obj = ZONE15_PE01TAD_Obj
	local Var = ZONE15_PE01TAD_Var
	local GuardID = Var["GuardID"]
	local ThiefID = Var["ThiefID"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local ThiefLeaderID = Var["ThiefLeaderID"]
	local TransCarID = Var["TransCarID"]

	while true do
		if ZONE15_PE01TAD_Phase > 4 then break end
		
		local Guard = {}	-- 歸零
		local Thief = {}	-- 歸零

		for i = 1, table.getn(Obj) do
			if CheckID(Obj[i]) == true and ReadRoleValue( Obj[i] , EM_RoleValue_IsDead ) ~= 1 then
				local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
				if OrgID == GuardID[1] or OrgID == GuardID[2] or OrgID == GuardLeaderID or OrgID == TransCarID then
					table.insert( Guard , Obj[i] )
				elseif OrgID == ThiefID[1] or OrgID == ThiefID[2] or OrgID == ThiefLeaderID then
					table.insert( Thief , Obj[i] )
				end
			end
		end

		for i = 1, table.getn(Guard) do
			if CheckID( Guard[i]) == true then							
				if ReadRoleValue( Guard[i], EM_RoleValue_AttackTargetID ) == 0 and HateListCount( Guard[i] ) == 0 then
					local Num = table.getn(Thief )
					for j=1, Num do
						local Rnd = rand(Num)+1
						if CheckID(Thief[Rnd]) == true then
							SetAttack( Guard[i] , Thief[Rnd] )
							break
						end
					end
				end
			end
		end

		for i = 1, table.getn(Thief) do
			if CheckID( Thief[i]) == true then							
				if ReadRoleValue( Thief[i], EM_RoleValue_AttackTargetID ) == 0 and HateListCount( Thief[i] ) == 0 then
					local Num = table.getn(Guard )
					for j=1, Num do
						local Rnd = rand(Num)+1
						if CheckID(Guard[Rnd]) == true then
							SetAttack( Thief[i] , Guard[Rnd] )
							break
						end
					end
				end
			end
		end
		sleep( 50 )
	end
end

--==================================================--



--==================================================--
--  盜賊團夜襲  表演分配區                          --
--==================================================--

function LuaPE_ZONE15_PE01TAD_RobBack( Victory )
	local Obj = ZONE15_PE01TAD_Obj
	local Var = ZONE15_PE01TAD_Var
	local TransCar = Var["TransCar"]
	local GuardID = Var["GuardID"]
	local ThiefID = Var["ThiefID"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local ThiefLeaderID = Var["ThiefLeaderID"]
	if CheckID( TransCar ) == true then
		Hide( TransCar )
		DelObj( TransCar )
	end
	
	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true then
			LuaPE_ZONE15_StopAttack( Obj[i] )

			local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
			if OrgID == GuardID[1] or OrgID == GuardID[2] Or OrgID == GuardLeaderID then
				CallPlot( Obj[i] , "LuaPE_ZONE15_PE01TAD_GuardWinDo" , Victory )
			elseif OrgID == ThiefID[1] or OrgID == ThiefID[2] or OrgID == ThiefLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE15_PE01TAD_ThiefRobBackDo" , 0 )
			end
		end
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_RobBack" )
end

function LuaPE_ZONE15_PE01TAD_GuardWinDo( Victory )
	if Victory == true then
		Sleep( 30 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 2 )
	else
		DelObj( OwnerID() )
	end
end

function LuaPE_ZONE15_PE01TAD_ThiefRobBackDo()
	local FlagObjID = ZONE15_PE01TAD_Var["FlagID"]
	local FlagGoID = 6
	local Range = 30
	
	WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 3 )
	LuaPE_ZONE15_ObjGoFlag( OwnerID() , FlagObjID , FlagGoID , Range )
	DelObj( OwnerID() )
end
--==================================================--

--==================================================--
--  盜賊團夜襲  啟動處理區                          --
--==================================================--

function LuaPE_ZONE15_PE01TAD_Start( Mode )
	local Obj = ZONE15_PE01TAD_Obj
	local tmp = 0
	
	if Obj ~= nil then
		tmp = ZONE15_PE01TAD_Var["Controller"]
		--LuaPE_ZONE15_PE01TAD_DeleteAll( Mode )	-- 將之前的前一個事件的物件全部刪掉
	end

	LuaPE_ZONE15_PE01TAD_GlobalSet()	-- 共用變數設定
	if Mode == nil then
		LuaPE_ZONE15_PE01TAD_PESet()		-- 公眾事件設定
	end

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ControllerSet Start!!" )
	local ControllerID = ZONE15_PE01TAD_Var["ControllerID"]		-- 破爛木箱
	local FlagID = ZONE15_PE01TAD_Var["FlagID"]		-- 旗子ID
	local Flag = 11					-- 出生旗子11
	local RoomID = 0
	local Ctrl = LuaPE_ZONE15_ControllerSet( ControllerID , FlagID , Flag , RoomID )	-- 設定控制物件
	ZONE15_PE01TAD_Var["Controller"] = Ctrl
	ZONE15_PE01TAD_Obj[1] = Ctrl	-- 將操作物件加入第一項
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ControllerSet END!!" )
	
	LuaPE_ZONE15_PE01TAD_TransTeamCreate()			-- 產生運輸隊
	CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_TransTeamDo", 0 )	--開始移動	
	LuaPE_ZONE15_PE01TAD_Message( 1 )				--送出訊息
	
	if tmp ~= 0 then 
		DelObj(tmp)
		DebugMsg(0,0,"Del ZONE15_PE01 Ctrl")
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_Start!!" )
	
end

function LuaPE_ZONE15_PE01TAD_Reset()--重置
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_END!!" )
	
	LuaPE_ZONE15_PE01TAD_DeleteAll( 1 )	-- 將之前的前一個事件的物件全部刪掉
	
	local ResetTime = ZONE15_PE01TAD_Var["ResetTime"]
	DebugLog( 2, "PE01_ResetTime="..ResetTime )
	Sleep( ResetTime*10 )

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_Start Begin!!" )
	LuaPE_ZONE15_PE01TAD_Start( 1 )
end

--==================================================--