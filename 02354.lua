
--==================================================--
-- 莫名其妙的魔族入侵		中控器就真的是115053了  zone2 zone 6不同						--
--==================================================--

--==================================================--
--  全域變數區                                      --
--==================================================--

function LuaPE_ZONE6_PE01_GlobalSet()	
	ZONE6_PE01_Obj = {}							-- 使用物件管理陣列	
	ZONE6_PE01_Guard = {}
	ZONE6_PE01_Boss = {}
	ZONE6_PE01_Act = {}
	ZONE6_PE01_Var = {}							-- 使用參數管理陣列
	ZONE6_PE01_Phase = 0							-- 階段標籤
	ZONE6_PE01_TotalScore = 0
	ZONE6_PE01_PEIndex = 1
	
	ZONE6_PE01_Message = { 	[1] = "[SC_PE_ZONE6_01_M01]"; --
					[2] = "[SC_PE_ZONE6_01_M02]"; --
					[3] = "[SC_PE_ZONE6_01_M03]"; --
					[4] = "[SC_PE_ZONE6_01_M04]"; --
					[5] = "[SC_PE_ZONE6_01_M05]"; --
					}
							
	ZONE6_PE01_Var["ResetTime"] = 300				-- 公眾任務重置時間(秒)	1小時
	ZONE6_PE01_Var["MapID"] = 251						-- 公眾事件分區編號		斯里威農場(926)
	ZONE6_PE01_Var["TestID"] = 1					-- 公眾事件測試區編號
	ZONE6_PE01_Var["RoomID"] = 0	
		
	ZONE6_PE01_Var["ControllerID"] = 115053			-- PE控制物件GID
	ZONE6_PE01_Var["CreaterID"] = 115506			-- 生產控制物件GID
	ZONE6_PE01_Var["Controller"] = 0				-- PE控制物件
	ZONE6_PE01_Var["PH1_Creater"] = { 0,0,0,0,0,0 }	-- 生產物件
	ZONE6_PE01_Var["PH2_Creater"] = 0
	ZONE6_PE01_Var["PH3_Creater"] = 0
	ZONE6_PE01_Var["GuardFlagID"] = 780656			-- 守衛旗標
	ZONE6_PE01_Var["OtherFlagID"] = 780657			-- 其他旗標
	ZONE6_PE01_Var["ActFlagID"] = 780755			-- 演戲旗標

	ZONE6_PE01_Var["Acter"] = 0						-- 演戲控制物件
	ZONE6_PE01_Var["GuardFlag"] = { 1,2,3,4,5,6,7, 8 }
	ZONE6_PE01_Var["OtherFlag"] = { 1,2,3,4,5,6,7 }
	
	ZONE6_PE01_Var["PH1_Door"] = { 0,0,0,0,0,0 }
	ZONE6_PE01_Var["PH2_Door"] = 0
	ZONE6_PE01_Var["PH3_Door"] = 0
	ZONE6_PE01_Var["Boss"] = 0
	ZONE6_PE01_Var["DoorID"] = {	116403,			-- 傳送門
									116404			-- 傳送門
									}		

	ZONE6_PE01_Var["GuardLeader"] = 0
	ZONE6_PE01_Var["GuardMege"] = 0
	ZONE6_PE01_Var["GuardID"] = {	104608,		-- 大法師
						104609,		-- 隊長
						104610,		-- 隊員
						118173		-- 傳送師
					} 		
								
	ZONE6_PE01_Var["MstID"] = {		105625,		-- lv1
						105626,		-- lv2
						105627,		-- lv3
						105628 }		-- lv4
		
	ZONE6_PE01_Var["TimeSpace"] = 15				-- 計時間隔(秒)
	ZONE6_PE01_Var["MaxGuard"] = { 4, 6 }				-- 出場的守衛數目
	ZONE6_PE01_Var["MaxMst"] = { 6,8 }				-- 怪物最大值
	ZONE6_PE01_Var["TimeCreateMst"] = { 4, 6 }			-- 每次間隔出場的怪物數目	
	ZONE6_PE01_Var["TimeCreateGuard"] = 3			-- 每次間隔出場的怪物數目
	
	ZONE6_PE01_Var["Guard"] = {}					--產生數量
	ZONE6_PE01_Var["Mst"] = {}					--產生數量
	
	ZONE6_PE01_Var["PH1_Num"] = 4				-- 第一階段入侵點數量
	ZONE6_PE01_Var["PH1_BossDead"] = 0				-- 第一階段條件進度
	ZONE6_PE01_Var["PH2_Time"] = 900				-- 第二階段倒數時間	
end

--==================================================--

--==================================================--
--  公眾事件設定區                                  --
--==================================================--
function LuaPE_ZONE6_PE01_PESet()

	local PE_Name = "SC_PE_ZONE6_01_NAME"					-- 漩渦的裂痕
	local PE_Desc = "SC_PE_ZONE6_01_DESC"					-- XXX的漩渦裂痕再次出現在[ZONE_SILVERSPRING]，必須在[ZONE_VARANAS]的人民發現之前阻止他，否則將會帶來恐慌。
	local PEIndex = ZONE6_PE01_PEIndex
	PE_AddPE( PE_Name , PE_Desc , PEIndex , 0 ) 	-- 新增一個事件

	local MapID = ZONE6_PE01_Var["MapID"]
	local TestID = ZONE6_PE01_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )						-- 把PE放進實際分區
	PE_AddRegion( PEIndex , 261 )						-- 把PE放進實際分區
	PE_AddRegion( PEIndex , 254 )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , 259 )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
	
	local PHIndex = 100	--階段變數
	
	local PH0_Name = "SC_PE_ZONE2_01_PHNAME00" --詭異能量高漲中
	local PH1_Name = "SC_PE_ZONE6_01_PHNAME01"	-- XXX的裂痕
	local PH2_Name = "SC_PE_ZONE6_01_PHNAME02"	-- XXX的保護
	local PH3_Name = "SC_PE_ZONE6_01_PHNAME03"	-- XXX的反擊
	local PH4_Name = "SC_PE_ZONE6_01_PHNAME04"	-- XXX的反擊
	
	local PH0_Desc = ""
	local PH1_Desc = "SC_PE_ZONE6_01_DESC_01"	-- 協助[104448]阻止XXX的裂痕被開啟
	local PH2_Desc = "SC_PE_ZONE6_01_DESC_02"	-- 保護XXX所開起通往XX的通道。
	local PH3_Desc = "SC_PE_ZONE6_01_DESC_03"	-- 保護XXX所開起通往XX的通道。
	local PH4_Desc = "SC_PE_ZONE6_01_DESC_04"	-- 保護XXX所開起通往XX的通道。

	PE_AddPhase( PEIndex , PHIndex , PH0_Name , PH0_Desc , 0 , 0 , 0 , 0 )	-- 新增階段0
	PE_AddPhase( PEIndex , PHIndex+1 , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- 新增階段1
	PE_AddPhase( PEIndex , PHIndex+2 , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- 新增階段2
	PE_AddPhase( PEIndex , PHIndex+3 , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- 新增階段3
	PE_AddPhase( PEIndex , PHIndex+4 , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- 新增階段4

	local OBIndex = 1000
	
	local OB0_Name = "SC_PE_ZONE2_01_OBNAME00" --距離能量臨界點
	local OB1_Name = "SC_PE_ZONE6_01_OBNAME01"	-- 擊敗裂痕開啟者
	local OB2_Name = "SC_PE_ZONE6_01_OBNAME02"	-- 保護大法師
	local OB3_Name = "SC_PE_ZONE6_01_OBNAME03"	-- 保護大法師
	local OB4_Name = "SC_PE_ZONE6_01_OBNAME04"	-- 保護大法師
	
	local OB0_Desc = ""
	local OB1_Desc = ""
	local OB2_Desc = ""
	local OB3_Desc = ""
	local OB4_Desc = ""
	
	-- PE重置倒數
	PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex , OBIndex , OB0_Name , OB0_Desc , "ZONE6_PE01_ResetTime" , ZONE6_PE01_Var["ResetTime"]*1000 , 0 ,  true )
	
	-- 新增一個目標，階段1成功條件：Boss 死亡
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PHIndex+1 , OBIndex+1 , OB1_Name , OB1_Desc ,  "ZONE6_PE01_PH1_BossDead", 0 , ZONE6_PE01_Var["PH1_Num"],  true )
	
	-- 新增一個目標，階段2成功條件：安全倒數
	PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex+2 , OBIndex+2 , OB2_Name , OB2_Desc , "ZONE6_PE01_PH2_Time" , ZONE6_PE01_Var["PH2_Time"]*1000 , 0 ,  true )
	
	-- 新增一個目標，階段3成功條件：法師死亡
	PE_PH_AddObjective_Equal( PEIndex , PHIndex+3 , OBIndex+3 , OB3_Name , OB3_Desc , "ZONE6_PE01_PH3_MegeDead" , 0 , 1 ,  true )

	-- 新增一個目標，階段4成功條件：Boss 死亡
	PE_PH_AddObjective_Equal( PEIndex , PHIndex+4 , OBIndex+4 , OB4_Name , OB4_Desc , "ZONE6_PE01_PH4_BossDead" , 0 , 1 ,  true )
		
	-- 設定階段連接
	PE_PH_SetNextPhase( PEIndex , PHIndex , PHIndex+1 )
	PE_PH_SetNextPhase( PEIndex , PHIndex+1 , PHIndex+2 )
	PE_PH_SetNextPhase( PEIndex , PHIndex+2 , PHIndex+3 )
	PE_PH_SetNextPhase( PEIndex , PHIndex+3 , PHIndex+4 )
		
	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE6_PE01_OB_OnAchieve" )
	
	PE_SetScoreVisible( PEIndex, false )--不顯示積分
	-- 事件啟動
	PE_Start( PEIndex , PHIndex )
end


function LuaPE_ZONE6_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	local Controller = ZONE6_PE01_Var["Controller"]	-- 控制物件
	local Phase = ZONE6_PE01_Phase+1
	ZONE6_PE01_Phase = Phase

	if PHIndex == 100 and OBIndex == 1000 then 
	-- PE倒數結束-->進入第一階段
		local PEIndex = ZONE6_PE01_PEIndex
		local OB1_Name = "SC_PE_ZONE6_01_OBNAME01"		
		local PH1_Num = rand(5)+2
		ZONE6_PE01_Var["PH1_Num"] = PH1_Num
		PE_PH_AddObjective_EqualAndGreater( PEIndex , 101 , 1001 , OB1_Name , "" ,  "ZONE6_PE01_PH1_BossDead", 0 , PH1_Num,  true )
		PE_RefreshConfig()--更新PE介面
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )		-- 在XXX發現了旋渦裂痕，必須馬上前往。
		CallPlot( Controller, "LuaPE_ZONE6_PE01_PhaseCreate", 1 )		-- 產生怪物/護衛
	elseif PHIndex == 101 and OBIndex == 1001 then 
	-- 滿足第一階段-->進入第二階段
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )
		CallPlot( Controller, "LuaPE_ZONE6_PE01_PhaseCreate", 2 )		-- 產生護衛
	elseif PHIndex == 102 and OBIndex == 1002 then 
	-- 滿足第二階段-->進入第三階段
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )		-- 來襲
		CallPlot( Controller, "LuaPE_ZONE6_PE01_PhaseCreate", 3 )		-- 產生怪物
	elseif PHIndex == 103 and OBIndex == 1003 then
	-- 滿足第三階段-->進入第四階段
		CallPlot( Controller, "LuaPE_ZONE6_PE01_CreateHelp", 0 )	--增援
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )		-- 				
	elseif PHIndex == 104 and OBIndex == 1004 then
	-- 滿足第四階段
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )		-- 
		CallPlot( Controller , "LuaPE_ZONE6_PE01_Start" , 0 )			-- 重置公眾任務
	end
end

--==================================================--

--==================================================--
--  階段/訊息處理區                                 --
--==================================================--

function LuaPE_ZONE6_PE01_Message( Index )--發送訊息
	local Message = ZONE6_PE01_Message
	local Color = "0xffffff00"	-- 強制訊息為黃色
	
	ScriptMessage( OwnerID(), -1 , 1 , Message[Index] , Color )
	ScriptMessage( OwnerID(), -1 , 0 , Message[Index] , Color )
end

--==================================================--

--==================================================--
--  斯里威農場  物件產生區                        --
--==================================================--

--控制物件設定
function LuaPE_ZONE6_PE01_ControlSet( ObjID , RoomID, Site )	
	local Obj = KS_CreateObjMode( ObjID, Site , nil, 10, 1, 0 )
	
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( Obj , EM_SetModeType_Obstruct , false )			-- 阻擋
	SetModeEx( Obj , EM_SetModeType_Gravity , false )			-- 重力
	SetModeEx( Obj , EM_SetModeType_Mark , false )				-- 標記
	SetModeEx( Obj , EM_SetModeType_Move , false )				-- 移動
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false )		-- 索敵
	SetModeEx( Obj , EM_SetModeType_HideName , false )			-- 名稱
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- 頭像框
	SetModeEx( Obj , EM_SetModeType_Fight , false )				-- 可砍殺攻擊
	SetModeEx( Obj , EM_SetModeType_Show , false )				-- 顯示
	AddToPartition( Obj , RoomID )
	table.insert( ZONE6_PE01_Obj, Obj )
	
	return Obj
end

function LuaPE_ZONE6_PE01_PhaseCreate( Phase )	-- 種怪控制
	local CreaterID = ZONE6_PE01_Var["CreaterID"]
	local Controller = ZONE6_PE01_Var["Controller"]	
	local RoomID = ZONE6_PE01_Var["RoomID"]
	local OtherFlag = ZONE6_PE01_Var["OtherFlag"]
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
	local GuardFlag = ZONE6_PE01_Var["GuardFlag"]			-- 產生位置
	local Creater
	
	if Phase == nil or Phase == 1 then
		local PH1_Num = ZONE6_PE01_Var["PH1_Num"]
		
		local FlagNum = table.getn(PH1_Door)
		Creater = ZONE6_PE01_Var["PH1_Creater"]	
		
		local Acter = LuaPE_ZONE6_PE01_ControlSet( CreaterID , RoomID, Controller )	-- 設定控制物件
		ZONE6_PE01_Var["Acter"] = Acter
		BeginPlot( Acter, "LuaPE_ZONE6_PE01_GuardAct", 0 )	--演戲
		
		for i = 1 , PH1_Num do
			local random = rand(FlagNum)+1
			if Creater[random] ~= nil and Creater[random] ~= 0 then
				random = ks_CreateObjSearch( Creater, FlagNum, 0 )
			end
			Creater[random] = LuaPE_ZONE6_PE01_ControlSet( CreaterID , RoomID, Controller )	-- 設定控制物件
			debugmsg(0,0,"random = "..random)
			CallPlot( Creater[random], "LuaPE_ZONE6_PE01_CreateMst", random, 1 )--產生怪物
			CallPlot( Creater[random], "LuaPE_ZONE6_PE01_CreateGuard", random, 1 )--產生護衛									
		end
	elseif Phase == 2 then
		Creater = LuaPE_ZONE6_PE01_ControlSet( CreaterID , RoomID, Controller )	-- 設定控制物件
		ZONE6_PE01_Var["PH2_Creater"] = Creater
		CallPlot( Creater, "LuaPE_ZONE6_PE01_CreateGuard", 7, 2 )--產生護衛	
	elseif Phase == 3 then
		Creater = LuaPE_ZONE6_PE01_ControlSet( CreaterID , RoomID, Controller )	-- 設定控制物件
		ZONE6_PE01_Var["PH3_Creater"] = Creater
		CallPlot( Creater, "LuaPE_ZONE6_PE01_CreateMst", 7, 2 )--產生怪物
	end
	
end

function LuaPE_ZONE6_PE01_CreateDoor( Mode, Site )--產生門
	local DoorID = ZONE6_PE01_Var["DoorID"]
	local OtherFlagID = ZONE6_PE01_Var["OtherFlagID"]
	local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
	local door
	local Height = 20
	local Trans = false
	
	if Site == 8 then
		door = LuaPE_ZONE6_PE01_ObjCreate( DoorID[Mode] , "Other", GuardFlagID, Site, 1 )
		SetPlot( door , "Collision" , "LuaZone_wb01_EnterPortal" , 50 )
		Height = 45
		Site = 7
		Trans = true
	else
		door = LuaPE_ZONE6_PE01_ObjCreate( DoorID[Mode] , "Other", OtherFlagID, Site, 1 )
	end
	SetModeEx( door , EM_SetModeType_Gravity , false )			-- 重力
	local X1 = ReadRoleValue( door, EM_RoleValue_X )
	local Y = ReadRoleValue( door, EM_RoleValue_Y )
	local Z1 = ReadRoleValue( door, EM_RoleValue_Z )
	local X2 = GetMoveFlagValue( GuardFlagID, Site, EM_RoleValue_X )
	local Z2 = GetMoveFlagValue( GuardFlagID, Site, EM_RoleValue_Z )	
	local Dir = CalDir( (X2-X1), (Z2-Z1) )
	
	if Trans == true then
		local PosDir = Dir+180
		if PosDir < 0 then PosDir = PosDir + 360
		elseif PosDir > 360 then PosDir = PosDir -360 end
	
		local Dis = 30	
		local radian = (math.pi/180)*( PosDir )--徑度
		local PosX = X1 +(Dis*math.cos(radian))
		local PosZ = Z1 - (Dis*math.sin(radian))	
		SetPos( door, PosX, Y+Height, PosZ, Dir )
	else
		SetPos( door, X1, Y+Height, Z1, Dir )
	end
	ks_ActSetMode( door )
	return door
end

function LuaPE_ZONE6_PE01_CreateGuard( Site, Num )--產生護衛
	local Var = ZONE6_PE01_Var
	local GuardFlagID = Var["GuardFlagID"]
	local GuardID = Var["GuardID"]					-- 護衛物件ID	
	local MaxGuard = Var["MaxGuard"]				-- 護衛數目最大值
	local TimeCreateGuard = Var["TimeCreateGuard"] 	-- 產生數量
	local TimeSpace = Var["TimeSpace"]				-- 計時間隔(秒)	
	local CreateGuard = 0
	local GuardNum = 0
	local Ctrl = OwnerID()
	local CreateType = 0
	
	Var["Guard"][Site] = 0
	if Site == 7 then
		ZONE6_PE01_Var["PH2_Door"] = LuaPE_ZONE6_PE01_CreateDoor( 2, Site+1 )
		LuaPE_ZONE6_PE01_ObjCreate( GuardID[1] , "Guard", GuardFlagID , Site, 1 )--法師
		CreateType = 1
	end
	
	while true do		
		GuardNum = Var["Guard"][Site] --讀取數量
		
		if GuardNum < MaxGuard[Num] then
			CreateGuard = MaxGuard[Num] - GuardNum
			if CreateGuard >= TimeCreateGuard then
				LuaPE_ZONE6_PE01_ObjCreate( GuardID[3] , "Guard", GuardFlagID, Site, TimeCreateGuard, CreateType )
			elseif CreateGuard < TimeCreateGuard and CreateGuard > 0 then
				LuaPE_ZONE6_PE01_ObjCreate( GuardID[3] , "Guard", GuardFlagID, Site, CreateGuard, CreateType )
			end
		end
		--DebugMsg(0,0,"GuardNum["..Site.."] = "..Var["Guard"][Site])
		Sleep( TimeSpace*30 ) --生產間隔
	end
end

function LuaPE_ZONE6_PE01_CreateHelp()--增援
	local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
	local GuardID = ZONE6_PE01_Var["GuardID"]					-- 護衛物件ID	
	local OtherFlagID = ZONE6_PE01_Var["OtherFlagID"]
	local MstID = ZONE6_PE01_Var["MstID"]
	
	local Boss = LuaPE_ZONE6_PE01_ObjCreate( MstID[4] , "Mst", OtherFlagID, 7, 1 )
	ZONE6_PE01_Var["Boss"] = Boss
	AddBuff( Boss, 509569, 0, -1 )--放大30%
	AddBuff( Boss, 502707, 0, -1 )--不會回血
	table.insert( ZONE6_PE01_Boss, Boss )
	
	Sleep(30)
	local Leader = LuaPE_ZONE6_PE01_ObjCreate( GuardID[2] , "Guard", GuardFlagID , 7, 1 )--隊長
	SetAttack( Leader, Boss )
	SysCastSpellLv( Boss, Leader, 495767, 0 )--仇恨MAX
	LuaPE_ZONE6_PE01_ObjCreate( GuardID[3] , "Guard", GuardFlagID, 7, 5 )
	Sleep(10)
	NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_19]" )
	Sleep(25)
	NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_20]" )
end

function LuaPE_ZONE6_PE01_GuardAct()--產生護衛
	local Var = ZONE6_PE01_Var
	local Phase = ZONE6_PE01_Phase
	local ActFlagID = Var["ActFlagID"]
	local CreaterID = ZONE6_PE01_Var["CreaterID"]
	local RoomID = ZONE6_PE01_Var["RoomID"]
	local GuardID = Var["GuardID"]					-- 護衛物件ID	
	local TimeSpace = Var["TimeSpace"]				-- 計時間隔(秒)	
	local ActFlag = ZONE6_PE01_Var["ActFlag"] 		-- 產生位置
	local Acter = ZONE6_PE01_Var["Acter"]
	local Creater = ZONE6_PE01_Var["PH1_Creater"]
	local Mege
	local Leader
	local Guard = {}
	local create
	
	local Trans = CreateObjByFlag( GuardID[4], ActFlagID, 4, 1 )
	AddToPartition( Trans , 0 )
	local shinning = LuaFunc_CreateObjByObj ( 111432 , Trans )
	table.insert( ZONE6_PE01_Obj , Trans )-- 加入物件管理陣列
	table.insert( ZONE6_PE01_Obj , shinning )-- 加入物件管理陣列
	SetMinimapIcon ( Trans, EM_MapIconType_FlightPoint )
	
	local Count = PE_GetActivePlayerGUIDCount( ZONE6_PE01_PEIndex )
	for i = 1 , Count do
		local GUID = PE_GetActivePlayerGUID( ZONE6_PE01_PEIndex )
		if ReadRoleValue( GUID, EM_RoleValue_LV ) >= 30 and GetDistance( GUID, Trans ) > 250 then
			local X = ReadRoleValue( GUID, EM_RoleValue_X )
			local Y = ReadRoleValue( GUID, EM_RoleValue_Y )
			local Z = ReadRoleValue( GUID, EM_RoleValue_Z )
			if CheckMapID( X , Y , Z , 261 ) == false then
				CallPlot( GUID, "LuaPE_ZONE6_PE01_Go", 0, "[SC_PE_ZONE6_01_TRANS_1]" )--測試用傳送
			end
		end
	end
	
	while (Phase == 1) do
		local count = 0
		for i =1, table.getn(Creater) do
			if Creater[i] > 0 and CheckID(Creater[i]) == true then
				count = count +1
			end
		end
		
		Phase = ZONE6_PE01_Phase
		if count <= 1 or Phase > 1 then
			DelObj(Acter)
			break
		end
		
		Mege = LuaPE_ZONE6_PE01_ObjCreate( GuardID[1] , "Act", ActFlagID , 1, 1 )
		Leader = LuaPE_ZONE6_PE01_ObjCreate( GuardID[2] , "Act", ActFlagID , 2, 1 )

		local X1 = GetMoveFlagValue( ActFlagID , 2 , EM_RoleValue_X )
		local X2 = GetMoveFlagValue( ActFlagID , 3 , EM_RoleValue_X )
		local Z1 = GetMoveFlagValue( ActFlagID , 2 , EM_RoleValue_Z )
		local Z2 = GetMoveFlagValue( ActFlagID , 3 , EM_RoleValue_Z )
		local Y = GetMoveFlagValue( ActFlagID , 3 , EM_RoleValue_Y )
		local Dir = CalDir( (X2-X1), (Z2-Z1) )
		local gDir = CalDir( (X1-X2), (Z1-Z2) )

		for i=1, 9 do
			local Dis = 30
			if i < 6 then
				PosDir =(gDir-60)+(120/5)*i
			else
				PosDir =(gDir-90)+(120/4)*(i-4)
				Dis = 20
			end
			if PosDir < 0 then PosDir = PosDir + 360
			elseif PosDir > 360 then PosDir = PosDir -360 end			
			
			local radian = (math.pi/180)*( PosDir )--徑度
			local PosX = X2 +(Dis*math.cos(radian))
			local PosZ = Z2 - (Dis*math.sin(radian))
			Y = GetHeight( PosX, Y, PosZ )
			Guard[i] = CreateObj ( GuardID[3] , PosX , Y, PosZ , gDir , 1)						
			AddToPartition( Guard[i] , 0 )
			
			ks_ActSetMode( Guard[i] )--設定演戲用NPC
			table.insert( ZONE6_PE01_Act, Guard[i] )
			table.insert( ZONE6_PE01_Obj , Guard[i] )
		end
		
		SetDir( Leader, Dir ) --面向目標
		AdjustFaceDir( Mege, Guard[3], 0 ) --面向目標
				
		Sleep(20)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_01]" )--看來這裡也成為敵方攻擊的目標了。
		Sleep(20)
		AdjustFaceDir( Leader, Mege, 0 ) --面向目標
		NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_02]" ) -- 你說的敵人到底是...
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(25)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_03]" )--從不明區域來到這裡的入侵者。
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(25)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_04]" )--目前[ZONE_VARANAS]也遭到攻擊，幸好及時反應才沒有讓消息傳到百姓耳中，但入侵事件仍在持續發生。
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--搖頭
		Sleep(35)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_05]" )--符文能量的距離相當近，看來對方打算發動奇襲。
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
		Sleep(25)
		AdjustFaceDir( Leader, Guard[3], 0 ) --面向目標
		NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_06]" )--那麼事不宜遲！我們也立刻出動！
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		Sleep(20)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_07]" )--穿過魔法，你們將與敵人交鋒，請立刻做好準備！
		AddBuff( Mege, 502662, 1, 30 ) --手發光
		PlayMotion( Mege, ruFUSION_ACTORSTATE_CHANNEL_LOOP )--施法
		Sleep(25)
		
		AdjustFaceDir( Mege, Guard[1], 0 ) --面向目標
		for i = 1, table.getn(Guard) do
			if rand(3) == 0 then
				NPCSay( Guard[i], "[SC_PE_ZONE6_01_ACT_08]" )--我們的武器隨時都做好準備了！
			end
			PlayMotion( Guard[i], ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		end
		Sleep(15)
		for i = 1, table.getn(Guard) do
			PlayMotion( Mege, ruFUSION_ACTORSTATE_BUFF_BEGIN )
			CastSpell( Mege, Guard[i], 495735 )--傳送特效
			WriteRoleValue( Guard[i], EM_RoleValue_LiveTime, 1 )
			sleep(10)
		end
		CancelBuff( Mege, 502662 )
		sleep(15)
		
		AdjustFaceDir( Mege, Leader, 0 ) --面向目標
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_09]" )--有自信是很好，但騎士的素質越來越差了。
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--搖頭		
		Sleep(25)
		AdjustFaceDir( Leader, Mege, 0 ) --面向目標
		NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_10]" )--說是這麼說，但我們為了對付北方的怪物已經沒有多餘的人力了。
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(25)		
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_11]" )--如果這裡失手，[ZONE_VARANAS]就可能成為敵人聚集火力的目標，到時[ZONE_CANDARA]將完全淪陷。
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_SPEAK )		
		Sleep(25)		
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_12]" )--所以你們不能輸！
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
		Sleep(20)		
		CastSpell( Mege, Mege, 495735 )--傳送特效
		WriteRoleValue( Mege, EM_RoleValue_LiveTime, 1 )
		
		NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_13]" )--看來即使是傭兵也有無法選擇的戰鬥...
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--搖頭
		WriteRoleValue( Leader, EM_RoleValue_IsWalk, 1 )
		Sleep(10)
		ks_Move( Leader, 50, Leader )--亂數移動
		WriteRoleValue( Leader, EM_RoleValue_LiveTime, 2 )
		Sleep( TimeSpace*10 ) --生產間隔
	end
end

function LuaPE_ZONE6_PE01_CreateMst( Site, Num )	--產生魔族
	local Phase
	local Var = ZONE6_PE01_Var
	local OtherFlagID = Var["OtherFlagID"]
	local MstID = Var["MstID"]						-- 怪物物件ID
	local MaxMst = Var["MaxMst"]					-- 怪物數量
	local TimeSpace = Var["TimeSpace"]				-- 計時間隔(秒)
	local TimeCreateMst = Var["TimeCreateMst"] 		-- 產生數量
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
	local PH3_Door = ZONE6_PE01_Var["PH3_Door"]
	
	local type = 0
	local CreateMst = 0
	local MstNum = 0
	local Ctrl = OwnerID()
	
	Var["Mst"][Site] = 0
	if Site ~= 7 then
		PH1_Door[Site] = LuaPE_ZONE6_PE01_CreateDoor( 1, Site )
		local Boss = LuaPE_ZONE6_PE01_ObjCreate( MstID[3] , "Mst", OtherFlagID, Site, 1 )
		AddBuff( Boss, 509568, 0, -1 )--放大20%
		AddBuff( Boss, 502707, 0, -1 )--不會回血
		table.insert( ZONE6_PE01_Boss, Boss )
		DebugMsg( 0,0, "CreateBoss  ; Site = "..Site )
	else
		ZONE6_PE01_Var["PH3_Door"] = LuaPE_ZONE6_PE01_CreateDoor( 1, Site )				
		type = 1		
	end
	
	while true do
		MstNum = Var["Mst"][Site] --讀取數量
		
		if MstNum < MaxMst[Num] then
			CreateMst = MaxMst[Num] - MstNum
			if CreateMst >= TimeCreateMst[Num] then
				LuaPE_ZONE6_PE01_ObjCreate( MstID[type+1] , "Mst", OtherFlagID, Site, TimeCreateMst[Num] )
			elseif CreateMst < TimeCreateMst[Num] then
				LuaPE_ZONE6_PE01_ObjCreate( MstID[type+1] , "Mst", OtherFlagID, Site, CreateMst )
			end
		end
		--DebugMsg(0,0,"MstNum["..Site.."] = "..Var["Mst"][Site])
		Sleep( TimeSpace*10 ) --生產間隔
	end
end

function LuaPE_ZONE6_PE01_ObjCreate( ObjID, ObjType, FlagID, FlagObjID, ObjNum, CreateType )--物件產生
	local Obj = {}
	local Var = ZONE6_PE01_Var
	local RoomID = ZONE6_PE01_Var["RoomID"]
	local PhaseFlag = ZONE6_PE01_Var["OtherFlag"]
	local FlagNum = table.getn(PhaseFlag)-1
	local count = 0
	local Camp = {	["Guard"] = EM_RoleValue_Register1,
			["Mst"] = EM_RoleValue_Register2 
			}			
	local Ctrl = OwnerID()
	local Dir = 0
	local Range = 10
	
	if ObjType == "Guard" then
		if FlagObjID ~= 7 then
			local OtherFlagID = ZONE6_PE01_Var["OtherFlagID"]
			local X1 = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_X )
			local Z1 = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_Z )
			local X2 = GetMoveFlagValue( OtherFlagID, FlagObjID, EM_RoleValue_X )
			local Z2 = GetMoveFlagValue( OtherFlagID, FlagObjID, EM_RoleValue_Z )
			Dir = CalDir( (X2-X1), (Z2-Z1) )
			Range = 35
		else
			local X1 = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_X )
			local Z1 = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_Z )
			local X2 = GetMoveFlagValue( FlagID, FlagObjID+1, EM_RoleValue_X )
			local Z2 = GetMoveFlagValue( FlagID, FlagObjID+1, EM_RoleValue_Z )
			if ObjID == ZONE6_PE01_Var["GuardID"][1] then
				Dir = CalDir( (X2-X1), (Z1-Z2) )
				Range = 0
			else
				Dir = CalDir( (X1-X2), (Z1-Z2) )
				Range = 45
			end
		end
	elseif ObjType == "Other" then
		Range = 0		
	end

	local X = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_X )
	local Y= GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_Y )
	local Z = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_Z )
	
	for i = 1 , ObjNum do
		if CreateType == 1 then
			local PosDir = (Dir-60)+(120/ObjNum)*i
			if PosDir < 0 then PosDir = PosDir + 360
			elseif PosDir > 360 then PosDir = PosDir -360 end			
			
			local Dis = rand(20)+30
			local PosDir = PosDir - rand(15)+rand(15)
			local radian = (math.pi/180)*( PosDir )--徑度
			local PosX = X +(Dis*math.cos(radian))
			local PosZ = Z - (Dis*math.sin(radian))
			Y = GetHeight( PosX, Y, PosZ )
			Obj[i] = CreateObj ( ObjID , PosX , Y, PosZ , Dir , 1 )
		else
			Obj[i] = KS_CreateObjMode( ObjID, FlagID , FlagObjID, Range, 1, 0 )
		end
		Sleep(1)
		
		if ObjType ~= "Other" then
			WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 1 )			-- 走路
			MoveToFlagEnabled( Obj[i] , false )					-- 關閉巡邏劇情
			AddBuff( Obj[i] , 506303 , 0 , -1 )					-- 防AE的Buff
			
			if ObjType == "Guard" then		--守衛
				table.insert( ZONE6_PE01_Guard, Obj[i] )
				SetPlot( Obj[i], "DEAD", "LuaPE_ZONE6_PE01_GuardDead", 0 )
				WriteRoleValue( Obj[i], EM_RoleValue_Dir, Dir )
			elseif ObjType == "Mst" then	--怪物			
				SetPlot( Obj[i], "DEAD", "LuaPE_ZONE6_PE01_MstDead", 0 )
				BeginPlot( Obj[i], "LuaPE_ZONE6_PE01_AI", 0 )			-- AI
			elseif ObjType == "Act" then
				table.insert( ZONE6_PE01_Act, Obj[i] )
				ks_ActSetMode( Obj[i] )--設定演戲用NPC
			end
			
			if ObjType ~= "Act" then
				Var[ObjType][FlagObjID] = Var[ObjType][FlagObjID] + 1
				WriteRoleValue( Obj[i], EM_RoleValue_Register1, Ctrl )--老爸
				WriteRoleValue( Obj[i], EM_RoleValue_Register3, FlagObjID )--出生位置
			end
		end		
		AddToPartition( Obj[i] , RoomID )
		if ObjType == "Guard" then 
			if ObjID == ZONE6_PE01_Var["GuardID"][1] then
				CallPlot( Obj[i], "LuaPE_ZONE6_PE01_Mege", 0 )--連續施法
			end
			AddBuff( Obj[i], 509570, 4, -1 )--仇恨增加50%
			SysCastSpellLv( Obj[i], Obj[i], 495735, 0 )--傳送特效
			SetIdleMotion( Obj[i], ruFUSION_ACTORSTATE_COMBAT_1H )	-- 預設是戰鬥動作
		end
		SetFlag( Obj[i], 544801, 1 )--關閉帕奇鼠
		table.insert( ZONE6_PE01_Obj , Obj[i] )-- 加入物件管理陣列
	end
	if ObjNum == 1 then
		return Obj[1]
	else
		return Obj
	end
end

function LuaPE_ZONE6_PE01_Mege()--賢者施法
	local OID = OwnerID()
	local MaxHP = ReadRoleValue( OID, EM_RoleValue_MaxHP )
	local lock = { 0,0,0 }

	AddBuff( OID, 507514, 0, -1 )--免疫治療
	AddBuff( OID, 502707, 0, -1 )--不會回血
	SetModeEx( OID , EM_SetModeType_Searchenemy , false )		-- 索敵
	SetModeEx( OID , EM_SetModeType_Move , false )			-- 移動
	SetModeEx( OID , EM_SetModeType_Strikback , false )			-- 反擊	
	
	while CheckID(OID) do
		AdjustFaceDir( OID, ZONE6_PE01_Var["PH2_Door"], 0 ) --面向目標
		AddBuff( OID, 504936, 0, -1 ) --手發光
		PlayMotionEX( OID,ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		ClearHateList( OID, -1 )
		local HP = ReadRoleValue( OID, EM_RoleValue_HP )
		for i=1, 3 do
			if HP > 0 and HP< MaxHP*(0.25*i) and lock[i] == 0 then
				lock[i] = 1
				NPCSay( OID, "[SC_PE_ZONE6_01_ACT_1"..(8-i).."]" )
				break
			end
		end
		SysCastSpellLv( OID, OID, 496946, 2 )--群體仇恨
		sleep(20)
	end
end

--==================================================--

--==================================================--
--    死亡處理區                       				--
--==================================================--

function LuaPE_ZONE6_PE01_GuardDead()
	local OID = OwnerID()
	if GetModeEx( OID , EM_SetModeType_Fight ) == true then
		local GuardID = ZONE6_PE01_Var["GuardID"]
		local Create = ReadRoleValue( OID, EM_RoleValue_Register1 )
		local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID )	
		local site = ReadRoleValue( OID, EM_RoleValue_Register3 )
		ZONE6_PE01_Var["Guard"][Site] = ZONE6_PE01_Var["Guard"][Site] - 1
	
		if OrgID == GuardID[1] then		
			local PH2_Door = ZONE6_PE01_Var["PH2_Door"]
			PE_SetVar( "ZONE6_PE01_PH3_MegeDead" , 1 )	-- PE變數改變
			NPCSay( OID, "[SC_PE_ZONE2_01_ACT_18]" )
			DelObj(PH2_Door)
		elseif OrgID ~= GuardID[2] and rand(2) > 0 and CheckBuff( OID, 504345 ) ~= true then
			NPCSay( OID, "[SC_PE_ZONE6_01_ACT_1"..(rand(5)+4).."]" )
		end
		SetModeEx( OID , EM_SetModeType_Fight , false )			-- 可砍殺攻擊
		SetModeEx( OID , EM_SetModeType_Searchenemy , false )		-- 索敵
		SetModeEx( OID , EM_SetModeType_Move , false )			-- 移動
		SetModeEx( OID , EM_SetModeType_Strikback , false )			-- 反擊		
		SetStopAttack( OID )
		ClearHateList( OID, -1 )
		SysCastSpellLv( OID, OID, 495735, 0 )--傳送特效
		WriteRoleValue( OID, EM_RoleValue_LiveTime, 1 )
	end
	return false
end

function LuaPE_ZONE6_PE01_MstDead()
	local OID = OwnerID()
	local Phase = ZONE6_PE01_Phase
	local MstID = ZONE6_PE01_Var["MstID"]	
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID )
	local Create = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local site = ReadRoleValue( OID, EM_RoleValue_Register3 )
	ZONE6_PE01_Var["Mst"][Site] = ZONE6_PE01_Var["Mst"][Site] - 1
	
	if OrgID == MstID[3] then
		local Obj = ZONE6_PE01_Obj
		local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
		ZONE6_PE01_Var["PH1_BossDead"] = ZONE6_PE01_Var["PH1_BossDead"] + 1
		PE_SetVar( "ZONE6_PE01_PH1_BossDead", ZONE6_PE01_Var["PH1_BossDead"] )	-- PE變數改變
		
		for i=1, table.getn(Obj) do
			if CheckID( Obj[i] ) == true and ReadRoleValue( Obj[i], EM_RoleValue_Register3 ) == site then
				AddBuff( Obj[i], 504345, 0, -1 )--半透明
				KillID( Obj[i], Obj[i] )
			end
		end
		DelObj(Create)
		DelObj(PH1_Door[site])
		local Hider = LuaFunc_CreateObjByObj ( 115506 , OID )
		Hide(Hider)
		SetModeEx( Hider , EM_SetModeType_Show , false )-- 顯示
		SetModeEx( Hider , EM_SetModeType_Mark , false )-- 標記
		Show( Hider, 0 )
		BeginPlot( Hider, "LuaPE_ZONE6_PE01_TransPlayer", 0 )
		DebugMsg(0,0, "PH1_Boss["..site.."] Dead")
	elseif OrgID == MstID[4] then
		local PH3_Door = ZONE6_PE01_Var["PH3_Door"]
		local PH2_Creater = ZONE6_PE01_Var["PH2_Creater"]
		local PH3_Creater = ZONE6_PE01_Var["PH3_Creater"]
		PE_SetVar( "ZONE6_PE01_PH4_BossDead", 1 )	-- PE變數改變
		DelObj(PH2_Creater)
		DelObj(PH3_Creater)
		DelObj(PH3_Door)
		DebugMsg(0,0, "PH1_Boss Dead" )
	end
	
	DelObj(OID)
	return false
end

function LuaPE_ZONE6_PE01_TransPlayer()--傳送
	Sleep(20)
	local Player = SearchRangePlayer( OwnerID() , 250 )
	for i = 0 , table.getn( Player ) do
		if Player[i] == -1 then 
			break
		end
		if ReadRoleValue( Player[i], EM_RoleValue_LV ) >= 30 then
			CallPlot( Player[i], "LuaPE_ZONE6_PE01_SetPos", Str )--傳送
		end
	end
	DelObj(OwnerID())
end

--==================================================--

--==================================================--
--  	移動處理區                      			--
--==================================================--

function LuaPE_ZONE6_PE01_AI()--怪物AI
	local OID = OwnerID()
	local GuardID = ZONE6_PE01_Var["GuardID"]
	local MstID = ZONE6_PE01_Var["MstID"]
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID )
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
	local PH2_Door = ZONE6_PE01_Var["PH2_Door"]
	local PH3_Door = ZONE6_PE01_Var["PH3_Door"]
	local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
	local Create = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local Site = ReadRoleValue( OID, EM_RoleValue_Register3 )	
	
	while CheckID(Create) do
		if KS_InCombat( OID ) == false then -- 非戰鬥
			if OrgID == MstID[3] or OrgID == MstID[4] then
				SysCastSpellLv( OID, OID, 496179, 0 )--群體最高級挑釁
			end			
			WriteRoleValue( OID, EM_RoleValue_IsWalk, 1 )
			if PH3_Door ~= 0 and CheckID(PH3_Door) == true then
				ks_Move( OID, 30, GuardFlagID, Site )--亂數移動
			elseif Site ~= 0 then
				ks_Move( OID, 40, GuardFlagID, Site )--亂數移動
			end
		end
		sleep(20)
	end
end

--==================================================--

--==================================================--
--  	傳送處理區                      			--
--==================================================--

function LuaPE_ZONE6_PE01_Say()
	local T_ID = TargetID() --NPC
	local O_ID = OwnerID() --玩家
	
	AdjustFaceDir( T_ID, O_ID, 0 ) --面向目標
	
	if ReadRoleValue( O_ID, EM_RoleValue_LV ) >= 30 then
		SetSpeakDetail( O_ID, "[SC_PE_ZONE6_01_TRANS_YES]" ) --可以傳送
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "LuaPE_ZONE6_PE01_SetPos",0)
	else
		SetSpeakDetail( O_ID, "[SC_PE_ZONE6_01_TRANS_NO]" ) --不可以傳送
	end
end

function LuaPE_ZONE6_PE01_SetPos( Str )--設定傳送
	CloseSpeak( OwnerID() )
	local Phase = ZONE6_PE01_Phase
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
	local Creater = ZONE6_PE01_Var["PH1_Creater"]
	local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
	Str = Str or "[SC_PE_ZONE6_01_TRANS_2]"
	local Flag = {}
	
	if Phase == 1 then
		for i =1, table.getn(PH1_Door) do
			if Creater[i] > 0 and CheckID(Creater[i]) == true then
				table.insert( Flag, i )
				debugmsg(0,0,"Flag = "..i)
			end
		end
	elseif Phase > 1 then
		Str = "[SC_PE_ZONE6_01_TRANS_3]"
		table.insert( Flag, 7 )
	end
	debugmsg(0,0,"-------------------")
	local Site = table.getn(Flag)
	CallPlot( OwnerID(), "LuaPE_ZONE6_PE01_DialogRePort", OwnerID(), GuardFlagID, Flag[rand(Site)+1], str, 30, 100, 15 )--詢問玩家後傳送
end

function LuaPE_ZONE6_PE01_DialogRePort( Obj, var1, var2, str, RndRange, CloseRange, time  )--詢問玩家後傳送
--範例1 玩家(Obj) 旗標物件編號(var1) 旗標位置(var2) 訊息字串(str) 隨機距離(Rnd_Range) 視窗關閉(距離CloseRange/ 時間time )
--範例2 玩家(Obj) 物件GUID(var1) 空值(var2) 訊息字串(str) 隨機距離(Rnd_Range) 視窗關閉(距離CloseRange/ 時間time )

	if CheckBuff( Obj, 501570 ) == false then  --增加檢查判斷
		AddBuff( Obj, 501570, 0, -1);--然後給予BUFF

		DialogCreate( Obj, EM_LuaDialogType_YesNo, str )
		DialogSelectStr( Obj, "[SO_YES]" )
		DialogSelectStr( Obj, "[SO_NO]" )
		if	ks_DialogRePort_TwoChoose( Obj, CloseRange, time ) == "Yes" then
			local Creater = ZONE6_PE01_Var["PH1_Creater"]
			local Phase = ZONE6_PE01_Phase
			local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
			local Flag = {}
			--DebugMsg(0,0,"var2 = "..var2)
			if Phase == 1 and CheckID(Creater[var2]) ~= true then
				for i =1, table.getn(PH1_Door) do
					if Creater[i] > 0 and CheckID(Creater[i]) == true then
						table.insert( Flag, i )
						--debugmsg(0,0,"Flag = "..i)
					end
				end
			elseif Phase > 1 then
				table.insert( Flag, 7 )
			end
			local Site = table.getn(Flag)
			if Site > 0 then
				var2 = Flag[rand(Site)+1]
			end
			AddBuff( Obj, 506098, 0, -1 )--畫面一黑
			sleep(5)
		
			AddBuff( Obj, 509583, var2-1, -1 )--檢察傳送用
			ks_RandRangeSetPos( Obj, var1, var2, RndRange )--傳送至旗標位置
			CancelBuff( Obj, 506098 )
		end
	else
		ScriptMessage( Obj, Obj, 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaPE_ZONE6_PE01_CheckSite()--確認位置
	local Obj = OwnerID()
	local Site = KS_CheckBuffLV( Obj, 509583 )	
	DebugMsg(0,0,"Site = "..Site)
	local Creater = ZONE6_PE01_Var["PH1_Creater"]
	local Phase = ZONE6_PE01_Phase
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]	
	local Flag = {}
	local str = "[SC_PE_ZONE6_01_TRANS_2]"
	if Site ~= 7 and Site > 0 then
		if Phase == 1 and CheckID(Creater[Site]) ~= true then
			for i =1, table.getn(PH1_Door) do
				if Creater[i] > 0 and CheckID(Creater[i]) == true then
					table.insert( Flag, i )
					debugmsg(0,0,"Flag = "..i)
				end
			end
		elseif Phase > 1 then
			Str = "[SC_PE_ZONE6_01_TRANS_3]"
			table.insert( Flag, 7 )				
		end
		local SiteNum = table.getn(Flag)
		if SiteNum > 0 then		
			Site = Flag[rand(SiteNum)+1]
			local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
			DebugMsg(0,0,"NewSite = "..Site)
			CancelBuff( Obj, 509583 )--清除檢察傳送用
			--CallPlot( Obj, "ks_RandRangeSetPos", Obj, GuardFlagID, Site, 30 )--傳送至旗標位置
			CallPlot( Obj, "LuaPE_ZONE6_PE01_DialogRePort", Obj, GuardFlagID, Site, str, 20, 100, 60 )--詢問玩家後傳送
		end
		--CancelBuff( Obj, 509583 )--清除檢察傳送用
	else
		CancelBuff( Obj, 509583 )--清除檢察傳送用
	end
end

--==================================================--

--==================================================--
--    啟動處理區                   				  	--
--==================================================--

function LuaPE_ZONE6_PE01_Start( Mode )
	if ZONE6_PE01_Obj ~= nil then		
		LuaPE_ZONE6_PE01_DelObj( 1 )
	end
	
	LuaPE_ZONE6_PE01_GlobalSet()	-- 共用變數設定
	ZONE6_PE01_Var["Controller"] = OwnerID()
	if Mode == nil then
		LuaPE_ZONE6_PE01_PESet()	-- 公眾事件設定		
	end
	debugmsg(0,0,"ZONE6_PE01 Start")
end

--==================================================--

--==================================================--
--		刪除物件與測試處理區						--
--==================================================--

function LuaPE_ZONE6_PE01_DelObj( Mode, Kill )
	local Obj
	
	if Mode == nil or Mode == 1 then
		Obj = ZONE6_PE01_Obj
	elseif Mode == 2 then
		Obj = ZONE6_PE01_Boss
	elseif Mode == 3 then
		Obj = ZONE6_PE01_Guard
	elseif Mode == 4 then
		Obj = ZONE6_PE01_Act
	end
		
	local ObjNum = table.getn(Obj)
	if ObjNum > 0 then
		for i = 1, ObjNum do
			if CheckID( Obj[i]) == true then
				DelObj( Obj[i] )
			end
		end
	end	
end

function LuaPE_ZONE6_PE01_KillBoss()--殺死所有BOSS
	local Obj = ZONE6_PE01_Boss
	local ObjNum = table.getn(Obj)
	if ObjNum > 0 then
		for i = 1, ObjNum do
			if CheckID( Obj[i]) == true then
				KillID( Obj[i], Obj[i] )
			end
		end
	end
end

function LuaPE_ZONE6_PE01_Go( Site, Str )--測試用傳送
	Str = Str or "[SC_PE_ZONE16_DW_40]"
	local FlagID = ZONE6_PE01_Var["GuardFlagID"]
	local OID = OwnerID()
	Site = Site or 0
	
	if Site == 0 then
		FlagID = ZONE6_PE01_Var["ActFlagID"]
		CallPlot( OID, "ks_DialogRePort_SetPos", OID, FlagID, 3, str, 30, 100, 15 )--詢問玩家後傳送
	else
		CallPlot( OID, "ks_DialogRePort_SetPos", OID, FlagID, Site, str, 30, 100, 15 )--詢問玩家後傳送
	end
end

function LuaPE_ZONE6_PE01_SetTime( Type )--設定PE時間
	Type = Type or 0
	
	if Type == 0 then
		PE_SetVar( "ZONE6_PE01_ResetTime", 20000 )
	elseif Type == 1 then
		PE_SetVar( "ZONE6_PE01_PH2_Time", 20000 )
	end
end

--==================================================--