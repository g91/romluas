--==================================================--
--  全域變數區                                      --
--==================================================--
function LuaPE_ZONE16_PE01ORC_GlobalSet()
	ZONE16_PE01ORC_Obj = {}								-- 使用物件管理陣列
	ZONE16_PE01ORC_Var = {}								-- 使用參數管理陣列
	ZONE16_PE01ORC_Phase = 0							-- 階段標籤
	ZONE16_PE01ORC_PEIndex = 1
	ZONE16_PE01ORC_Total = 0							-- 總共給予積分
	
	ZONE16_PE01ORC_Var["ResetTime"] = 3600				-- 公眾任務重置時間(秒)	1小時
	ZONE16_PE01ORC_Var["MapID"] = 824					-- 公眾事件分區編號		灰煙林地(824)
	ZONE16_PE01ORC_Var["TestID"] = 1					-- 公眾事件測試區編號
	ZONE16_PE01ORC_Var["RoomID"] = 0
	ZONE16_PE01ORC_Var["ControllerFlag"] = 0			-- 中控產生位置 0
	
	ZONE16_PE01ORC_Var["CreaterID"] = 115506			-- 記錄勝負物件ID
	ZONE16_PE01ORC_Var["Creater"] = 0					-- 記錄勝負物件
	ZONE16_PE01ORC_Var["ControllerID"] = 115053			-- 控制物件
	ZONE16_PE01ORC_Var["Controller"] = 0				-- 控制物件GID
	ZONE16_PE01ORC_Var["FlagID"] = 780656				-- 旗標ID
	ZONE16_PE01ORC_Var["GuardFlagID"] = { 5,6,7,8,9 }	-- 民兵出生位置
	ZONE16_PE01ORC_Var["GLordFlagID"] = 10				-- 民兵隊長出生位置
	ZONE16_PE01ORC_Var["OrcFlagID"] = { 11,12,13,14,15 }-- 獸人出生位置
	ZONE16_PE01ORC_Var["OLordFlagID"] = 16				-- 獸人BOSS出生位置
	
	ZONE16_PE01ORC_Var["GuardArt"] = {}
	ZONE16_PE01ORC_Var["GuardArtID"] = { 115578,		--裝飾用民兵隊長
										115575,			--裝飾用民兵
										115577,			--裝飾用民兵
										115576 }		--裝飾用民兵
	ZONE16_PE01ORC_Var["GuardArtFlag"] = { 30,31,32,33}	--裝飾用民兵隊長產生位置
	
	ZONE16_PE01ORC_Var["Worker"] = {}
	ZONE16_PE01ORC_Var["WorkerFlag"] = { 20,21,22,23,	--伐木工產生位置
										 24,25,26,27}
	
	ZONE16_PE01ORC_Var["WorkerID"] = { 	115488,			-- 伐木工
										115574,			-- 伐木工
										115573 }		-- 伐木工
			
	ZONE16_PE01ORC_Var["GuardID"] = { 103853,			-- 民兵
									  103854,			-- 民兵
									  103939,			-- 民兵
									  103940 }			-- 民兵
	ZONE16_PE01ORC_Var["GuardLordID"] = 103841 			-- 民兵隊長
	
	ZONE16_PE01ORC_Var["OrcID"] = { 103605,				-- 雷安卡斥侯
									103604,				-- 雷安卡獵手
									103603,				-- 雷安卡戰士
									103606 } 			-- 雷安卡巫醫
	ZONE16_PE01ORC_Var["OrcLordID"] = 103607 			-- 雷安卡首領 邦邦洛姆
	
	ZONE16_PE01ORC_Var["TimeSpace"] = 15				-- 計時間隔(秒)
	ZONE16_PE01ORC_Var["TimeCreateGuard"] = 3			-- 每次間隔出場的民兵數目
	ZONE16_PE01ORC_Var["TimeCreateOrc"] = 4				-- 每次間隔出場的獸人數目
	ZONE16_PE01ORC_Var["MaxGuard"] = 5					-- 場上維持的民兵數目
	ZONE16_PE01ORC_Var["MaxOrc"] = 8					-- 場上維持的獸人數目

	ZONE16_PE01ORC_Var["GuardDead"] = 0					-- 目前民兵死亡數目
	ZONE16_PE01ORC_Var["OrcDead"] = 0					-- 目前獸人死亡數目
	
	ZONE16_PE01ORC_Var["PH1Require"]  = 30				-- 階段一需要殺死獸人數目
	ZONE16_PE01ORC_Var["PH2Require"]  = 40				-- 階段二需要殺死獸人數目
	ZONE16_PE01ORC_Var["PH3Time"] = 60					-- 階段三總時間(秒)
	
	ZONE16_PE01ORC_Var["MaxGuardDead"] = 12				-- 民兵最大死亡數 (失敗條件)
	
	ZONE16_PE01ORC_Var["ExCha_Ratio"] = 100				-- 回饋比率
end
--==================================================--



--==================================================--
--  公眾事件設定區                                  --
--==================================================--
function LuaPE_ZONE16_PE01ORC_PESet()

	local PE_Name = "SC_PE_ZONE16_01_NAME"					-- 灰煙林地的爭奪
	local PE_Desc = "SC_PE_ZONE16_01_DESC"					-- 隨著號角的響起，卡雅村的村民與雷安卡獸人的衝突擴大，灰煙林地的爭奪戰在此展開。
	local PEIndex = ZONE16_PE01ORC_PEIndex
	PE_AddPE( PE_Name , PE_Desc , PEIndex , 0 ) 	-- 新增一個事件

	local MapID = ZONE16_PE01ORC_Var["MapID"]
	local TestID = ZONE16_PE01ORC_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
	
	local PH0Index = 100	--階段變數
	local PH1Index = 101	
	local PH2Index = 102
	local PH3Index = 103
	local PH4Index = 104
	
	local PH0_Name = "SC_PE_ZONE16_DW_22" --重置時間
	local PH1_Name = "SC_PE_ZONE16_01_PHNAME01"	-- 零星的襲擾	
	local PH2_Name = "SC_PE_ZONE16_01_PHNAME02"	-- 大舉進攻
	local PH3_Name = "SC_PE_ZONE16_01_PHNAME03"	-- 雷安卡的反擊
	local PH4_Name = "SC_PE_ZONE16_01_PHNAME04"	-- 最終的決戰
	
	local PH1_Desc = ""	-- 佔據灰煙林地的雷安卡獸人，襲擾過往的旅人與依靠灰煙林地維生的卡雅村村民。	
	local PH2_Desc = ""	-- 因為族人遭受攻擊而死亡，引起了雷安卡獸人的憤怒，決定血祭人類。	
	local PH3_Desc = ""	-- 隨著號角響起灰煙林地的戰況進入了白熱化。
	local PH4_Desc = ""	-- 獸人首領決定親自出場帶領族人將灰煙的人類趕盡殺絕。
	
	PE_AddPhase( PEIndex , PH0Index , PH0_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- 新增階段0
	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- 新增階段1
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- 新增階段2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- 新增階段3
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- 新增階段4

	local OB0Index = 1000
	local OB1Index = 1001
	local OB2Index = 1002
	local OB3Index = 1003
	local OB4Index = 1004
	local OB5Index = 1005
	
	local OB0_Name = "SC_PE_ZONE16_DW_21" --剩餘時間
	local OB1_Name = "SC_PE_ZONE16_01_OBNAME01"	-- 打擊雷安卡獸人
	local OB2_Name = "SC_PE_ZONE16_01_OBNAME02"	-- 殲滅雷安卡獸人
	local OB3_Name = "SC_PE_ZONE16_01_OBNAME03"	-- 抵擋雷安卡獸人的攻擊
	local OB4_Name = "SC_PE_ZONE16_01_OBNAME04"	-- 擊敗雷安卡獸人首領 邦邦洛姆
	local OB5_Name = "SC_PE_ZONE16_01_OBNAME05"	-- 卡雅村民兵的敗退
	
	local OB0_Desc = ""
	local OB1_Desc = ""
	local OB2_Desc = ""
	local OB3_Desc = ""
	local OB4_Desc = ""
	local OB5_Desc = ""
	
	local PH1Require = ZONE16_PE01ORC_Var["PH1Require"]
	local PH2Require = ZONE16_PE01ORC_Var["PH2Require"]	
	local MaxGuardDead = ZONE16_PE01ORC_Var["MaxGuardDead"]	
	
	-- PE重置倒數
	PE_PH_AddObjective_TimeLimit( PEIndex , PH0Index , OB0Index , OB0_Name , OB0_Desc , "ZONE16_PE01_ResetTime" , ZONE16_PE01ORC_Var["ResetTime"]*1000 , 0 ,  true )
	
	-- 新增一個目標，階段1成功條件：雷安卡獸人的死亡超過30
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "ZONE16_PE01ORC_Var_OrcDead1" , 0 , PH1Require ,  true )	
	
	-- 新增一個目標，階段2成功條件：殺死50個獸人
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE16_PE01ORC_Var_OrcDead2" , 0 , PH2Require ,  true )	
	
	-- 新增一個目標，階段3成功條件：等待獸人首領的登場
	PE_PH_AddObjective_TimeLimit( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE16_PE01_PH3Time" , ZONE16_PE01ORC_Var["PH3Time"]*1000 , 0 ,  true )	
	
	-- 新增一個目標，階段4成功條件：打倒獸人首領
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "ZONE16_PE01ORC_Var_OrcBossDead" , 0 , 1 ,  true )	
	
	-- 新增一個目標，階段2,3,4失敗條件：民兵死亡過多
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB5Index , OB5_Name , OB5_Desc , "ZONE16_PE01ORC_Var_MaxGuardDead" , 0 , MaxGuardDead ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB5Index , OB5_Name , OB5_Desc , "ZONE16_PE01ORC_Var_MaxGuardDead" , 0 , MaxGuardDead ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB5Index , OB5_Name , OB5_Desc , "ZONE16_PE01ORC_Var_MaxGuardDead" , 0 , MaxGuardDead ,  false )

	-- 設定階段連接
	PE_PH_SetNextPhase( PEIndex , PH0Index , PH1Index )
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )
	
	
	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE16_PE01ORC_OB_OnAchieve" )
	
	-- 設定事件結束的結算回摳函式
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE16_PE01ORC_FinalExchange" )

	-- 事件啟動
	PE_Start( PEIndex , PH0Index )

end

function LuaPE_ZONE16_PE01ORC_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	local Controller = ZONE16_PE01ORC_Var["Controller"]	-- 控制物件	
	local creater = ZONE16_PE01ORC_Var["Creater"]	
	local Phase = ZONE16_PE01ORC_Phase
	
	if PHIndex == 100 and OBIndex == 1000 then 	-- 滿足第一階段 民兵開始集結
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		BeginPlot( Controller ,"LuaPE_ZONE16_PE01ORC_DelGuardArt", 0 )			--刪除裝飾民兵
	elseif PHIndex == 101 and OBIndex == 1001 then 	-- 滿足第一階段 民兵開始集結	
		ZONE16_PE01ORC_Var["OrcDead"] = 0		
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_GuardDo" , 0 ) 			--產生民兵
		sleep(50)
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_OrcDo" , 0 )				--產生獸人
	elseif PHIndex == 102 and OBIndex == 1002 then -- 滿足第二階段 開始倒數		
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		--ZONE16_PE01ORC_Var["TimeSpace"] = ZONE16_PE01ORC_Var["TimeSpace"]*2/3 -- 計時間隔(秒) 未實裝
	elseif PHIndex == 103 and OBIndex == 1003 then -- 滿足第三階段 BOSS出現
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_BossCreate", 0 ) 			--產生獸人BOSS
	elseif PHIndex == 104 and OBIndex == 1004 then 								-- 民兵勝利
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		WriteRoleValue( creater, EM_RoleValue_Register1, 1 )					--民兵勝利
		Sleep(20)
		BeginPlot( Controller, "LuaPE_ZONE16_PE01ORC_CreateWorker", 0 ) 		--產生伐木工 
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_Reset" , 0 )				-- 重置公眾任務
	elseif OBIndex == 1005 then
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", 5 )  				-- 民兵敗退 獸人勝利
		WriteRoleValue( creater, EM_RoleValue_Register1, 0 )					--獸人勝利
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_Reset" , 0 )				-- 重置公眾任務
	end
end

function LuaPE_ZONE16_PE01ORC_FinalExchange( PEIndex , GUID , Score )
	local LV = 55
	local MapID = ZONE16_PE01ORC_Var["MapID"] 
	if LuaPE_KS_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = ZONE16_PE01ORC_Var["ExCha_Ratio"]
	local Total = ZONE16_PE01ORC_Total
	
	if Score > 0 then
		if Score < ExCha_Ratio and Score > ExCha_Ratio/2 then
			CallPlot(GUID, "YOYO_GetTokenValue", 2, 1);--古代遺物"
		else
			if Score >= 800 then Score = 800 end
			CallPlot(GUID, "YOYO_GetTokenValue", 2, math.floor( Score/ExCha_Ratio ));--古代遺物"
		end
	end

end
--==================================================--



--==================================================--
--  階段/訊息處理區                                 --
--==================================================--
--階段處理
function LuaPE_ZONE16_PE01ORC_PhaseDO( Phase )
	local Controller = ZONE16_PE01ORC_Var["Controller"]
	local OrcID = ZONE16_PE01ORC_Var["OrcID"]
	local creater = ZONE16_PE01ORC_Var["Creater"]
	local winner = ReadRoleValue( creater, EM_RoleValue_Register1 ) --0為獸人勝利 1為民兵勝利
	local OrcDead = ZONE16_PE01ORC_Var["PH1Require"]
	local Total = ZONE16_PE01ORC_Total
	debugmsg( 0, 0, "winner = "..winner .."; Phase = " ..Phase )
	
	if Phase == 0 then
		ZONE16_PE01ORC_Phase = 1
		if winner == 0 then
			LuaPE_ZONE16_PE01ORC_Message( 1 , C_SYSTEM )
		else
			LuaPE_ZONE16_PE01ORC_DelWorker()
		end
	elseif Phase == 1 then
		ZONE16_PE01ORC_Phase = 2
		if winner == 0 then
			LuaPE_ZONE16_PE01ORC_Message( 2 , C_DEFAULT )
		else
			LuaPE_ZONE16_PE01ORC_Message( 3 , C_DEFAULT )
		end
	elseif Phase == 2 then
		ZONE16_PE01ORC_Phase = 3
		if winner == 0 then
			LuaPE_ZONE16_PE01ORC_Message( 4 , C_DEFAULT )
		else
			LuaPE_ZONE16_PE01ORC_Message( 5 , C_DEFAULT )
		end
	elseif Phase == 3 then	
		ZONE16_PE01ORC_Phase = 4		
		LuaPE_ZONE16_PE01ORC_Message( 6 , C_DEFAULT )
	elseif Phase == 4 then
		ZONE16_PE01ORC_Phase = 8
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE16_PE01ORC_Message( 8 , C_SYSTEM )
	elseif Phase == 5 then
		ZONE16_PE01ORC_Phase = 9
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE16_PE01ORC_Message( 7 , C_DEFAULT )
	end
	
end


--傳送訊息
function LuaPE_ZONE16_PE01ORC_Message( Index , Color )
	Color = "0xffffff00"	-- 強制訊息為黃色

	local AreaPlayer = LuaPE_ZONE16_PE01ORC_GetAreaPlayer()
	local Message = {}
	Message = {	
	[1] = "[SC_PE_ZONE16_01_M01]";								-- 卡雅村的民兵又開始集結，並且在等待機會...
	[2] = "[SC_PE_ZONE16_01_M02]";								-- 民兵隊長 威廉‧華勒感覺時機來臨，因此率領著民兵前往灰煙林地，打算趕離雷安卡獸人!!		
	[3] = "[SC_PE_ZONE16_01_M03]";								-- 雷安卡族要趕離破壞他們生活平靜的人類!!		
	[4] = "[SC_PE_ZONE16_01_M04]";								-- 人類大舉來犯的行為，再次惹惱了灰煙林地中的雷安卡族...	
	[5] = "[SC_PE_ZONE16_01_M05]";								-- 雷安卡族決定全面進攻!!...	
	[6] = "[SC_PE_ZONE16_01_M06]";								-- 為了爭奪居住地，雷安卡的首領 邦邦洛姆親自出場!!
	[7] = "[SC_PE_ZONE16_01_M07]";								-- 雷安卡人成功的保衛住他們的家園，失敗的卡雅村民只好再次放棄他們的伐木林地。
	[8] = "[SC_PE_ZONE16_01_M08]";								-- 由於雷安卡首領的敗退，雷安卡人只好暫時退回灰煙林地深處的營地。
	}

	if Index == 1 or Index == 3 then
		debugmsg( 0, 0, "PE Start")
		ScriptMessage( OwnerID(), -1 , 1 , Message[Index] , Color )
		ScriptMessage( OwnerID(), -1 , 0 , Message[Index] , Color )
		debugmsg( 0, 0, "PE Start!!!")
	else
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message[Index] , Color )
			ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message[Index] , Color )
		end
	end
end
--==================================================--



--==================================================--
--  共用函式區                                      --
--==================================================--
--抓取區域玩家
function LuaPE_ZONE16_PE01ORC_GetAreaPlayer()
	local MapID = ZONE16_PE01ORC_Var["MapID"]	-- 盜賊補給線東邊
	local TestID = ZONE16_PE01ORC_Var["TestID"]	-- 測試區
	local RoomID = ZONE16_PE01ORC_Var["RoomID"]
	local AreaPlayer = {}
	local ZonePlayer = {}

	local PlayerCount = SetSearchAllPlayer( RoomID )	-- 回傳找到個數
	for i = 1 , PlayerCount do
		ZonePlayer[i] = GetSearchResult()	-- 取得搜尋到的玩家
		local X = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_X )
		local Y = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Y )
		local Z = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Z )
		if CheckMapID( X , Y , Z , MapID ) == true or CheckMapID( X , Y , Z , TestID ) then
			table.insert( AreaPlayer , ZonePlayer[i] )	-- 搜尋到這個分區的玩家就加進去
		end
	end

	return AreaPlayer;
end

function LuaPE_ZONE16_PE01ORC_StopAttack( Player ) --停止攻擊
	local times = 0
	while CheckID( OwnerID() ) and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) ~= 1 do
		times = times+1
		SetStopAttack( Player )
		SetModeEx( Player , EM_SetModeType_Strikback , false )		-- 反擊
		SetModeEx( Player , EM_SetModeType_Searchenemy , false )	-- 索敵
		SetModeEx( Player , EM_SetModeType_Fight , false )			-- 可砍殺攻擊
		SetModeEx( Player , EM_SetModeType_Mark	, false )			-- 標記
		--SetRoleCamp( Player, "Visitor" )			
		WriteRoleValue( Player , EM_RoleValue_IsAttackMode , 0 )
		if times == 4 then DelObj(OwnerID()) end
		sleep(10)
	end
end
--==================================================--





--==================================================--
--  灰煙林地爭奪戰  啟動處理區                      --
--==================================================--
function LuaPE_ZONE16_PE01ORC_Start( Mode )
	local FlagTmp
	local GuardArt
	local worker = {}
	
	if Mode == 1 then
		FlagTmp = ZONE16_PE01ORC_Var["Controller"]		
		GuardArt = ZONE16_PE01ORC_Var["GuardArt"]
	end
		
	local Creater = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115506, 100, 0 )
	local winner = ReadRoleValue( creater, EM_RoleValue_Register1 ) --0為獸人勝利 1為民兵勝利
	
	
	if winner == 1 then 
		worker = ZONE16_PE01ORC_Var["Worker"]
	end	
	
	LuaPE_ZONE16_PE01ORC_GlobalSet()	-- 共用變數設定
	LuaPE_ZONE16_PE01ORC_PESet()		-- 公眾事件設定		
	ZONE16_PE01ORC_Var["Creater"] = Creater
	ZONE16_PE01ORC_Var["Worker"] = worker
	ZONE16_PE01ORC_Var["GuardArt"] = GuardArt
	
	local Phase = ZONE16_PE01ORC_Phase
	local ControllerID = ZONE16_PE01ORC_Var["ControllerID"]		-- 木桶
	local ControllerFlag = ZONE16_PE01ORC_Var["ControllerFlag"] --產生中控位置
	local FlagID = ZONE16_PE01ORC_Var["FlagID"]					-- 旗子ID
	local RoomID = ZONE16_PE01ORC_Var["RoomID"]
	local winner = ReadRoleValue( creater, EM_RoleValue_Register1 ) --0為獸人勝利 1為民兵勝利
	local OrcDead = ZONE16_PE01ORC_Var["PH1Require"]
	
	local Controller = LuaPE_ZONE16_PE01ORC_ControllerSet( ControllerID , FlagID , ControllerFlag , RoomID )	-- 設定控制物件
	WriteRoleValue( Controller, EM_RoleValue_Register1, 0 ) --獸人數量初始
	WriteRoleValue( Controller, EM_RoleValue_Register2, 0 ) --民兵數量初始

	if winner == 1 then
		PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead1" , OrcDead )
	end
	
	if FlagTmp ~= nil then
		DelObj( FlagTmp )	-- 刪除前一個控制物件	
	end
end
--==================================================--


--==================================================--
--  雷安卡的逆襲  物件產生區                        --
--==================================================--
--控制物件設定
function LuaPE_ZONE16_PE01ORC_ControllerSet( ControllerID , FlagID , ControllerBronFlag , RoomID )
	local Controller = CreateObjByFlag( ControllerID , FlagID , ControllerBronFlag , 1 )
	SetModeEx( Controller , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( Controller , EM_SetModeType_Obstruct , false )			-- 阻擋
	SetModeEx( Controller , EM_SetModeType_Gravity , false )			-- 重力
	SetModeEx( Controller , EM_SetModeType_Mark , false )				-- 標記
	SetModeEx( Controller , EM_SetModeType_Move , false )				-- 移動
	SetModeEx( Controller , EM_SetModeType_Searchenemy , false )		-- 索敵
	SetModeEx( Controller , EM_SetModeType_HideName , false )			-- 名稱
	SetModeEx( Controller , EM_SetModeType_ShowRoleHead , false )		-- 頭像框
	SetModeEx( Controller , EM_SetModeType_Fight , false )				-- 可砍殺攻擊
	SetModeEx( Controller , EM_SetModeType_Show , false )				-- 顯示
	AddToPartition( Controller , RoomID )

	ZONE16_PE01ORC_Obj[1] = Controller	-- 將操作物件加入第一項

	ZONE16_PE01ORC_Var["Controller"] = Controller	-- 領導物件GID

	return Controller;
end

--裝飾伐木工
function LuaPE_ZONE16_PE01ORC_CreateWorker()	
	local Var = ZONE16_PE01ORC_Var					
	local FlagID = Var["FlagID"]
	local RoomID = Var["RoomID"]
	local workerID = Var["WorkerID"]
	local workerFlag = Var["WorkerFlag"]
	local Obj = {}
	
	for i = 1 , table.getn(workerFlag) do
		Obj[i] = CreateObjByFlag( workerID[rand(3)+1] , FlagID , workerFlag[i] , 1 )
		SetModeEx( Obj[i] , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
		SetModeEx( Obj[i] , EM_SetModeType_Obstruct , false )			-- 阻擋
		SetModeEx( Obj[i] , EM_SetModeType_Gravity , true )				-- 重力
		SetModeEx( Obj[i] , EM_SetModeType_Mark , false )				-- 標記
		SetModeEx( Obj[i] , EM_SetModeType_Move , true )				-- 移動
		SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , false )		-- 索敵
		SetModeEx( Obj[i] , EM_SetModeType_HideName , true )			-- 名稱
		SetModeEx( Obj[i] , EM_SetModeType_ShowRoleHead , false )		-- 頭像框
		SetModeEx( Obj[i] , EM_SetModeType_Fight , false )				-- 可砍殺攻擊
		SetModeEx( Obj[i] , EM_SetModeType_Show , true )				-- 顯示
		AddToPartition( Obj[i] , RoomID )
		table.insert( Var["Worker"] , Obj[i] )	
	end
end

function LuaPE_ZONE16_PE01ORC_Mining()
	while 1 do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN )
		sleep(50)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_END )
		sleep(30)
	end	
end

function LuaPE_ZONE16_PE01ORC_CreateGuardArt()
	local Var = ZONE16_PE01ORC_Var					
	local FlagID = Var["FlagID"]
	local RoomID = Var["RoomID"]
	local GuardArtID = Var["GuardArtID"]
	local GuardArtFlag = Var["GuardArtFlag"]
	local GuardArt = {}
	
	for i = 1 , table.getn(GuardArtFlag) do	
		GuardArt[i] = CreateObjByFlag( GuardArtID[i], FlagID, GuardArtFlag[i], 1 )
		sleep(10)
		SetModeEx( GuardArt[i], EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
		SetModeEx( GuardArt[i], EM_SetModeType_Obstruct , false )			-- 阻擋
		SetModeEx( GuardArt[i], EM_SetModeType_Gravity , true )				-- 重力
		SetModeEx( GuardArt[i], EM_SetModeType_Mark , true )				-- 標記
		SetModeEx( GuardArt[i], EM_SetModeType_Move , true )				-- 移動
		SetModeEx( GuardArt[i], EM_SetModeType_Searchenemy , true )			-- 索敵
		SetModeEx( GuardArt[i], EM_SetModeType_HideName , false )			-- 名稱
		SetModeEx( GuardArt[i], EM_SetModeType_ShowRoleHead , true )		-- 頭像框
		SetModeEx( GuardArt[i], EM_SetModeType_Strikback , true )			-- 反擊
		SetModeEx( GuardArt[i], EM_SetModeType_Fight , true )				-- 可砍殺攻擊
		SetModeEx( GuardArt[i], EM_SetModeType_Show , true )				-- 顯示
		sleep(10)
		WriteRoleValue( GuardArt[i] , EM_RoleValue_IsWalk , 1 )				-- 用走的移動
		MoveToFlagEnabled( GuardArt[i], true )
		AddToPartition( GuardArt[i], RoomID )
		CallPlot( GuardArt[i], "LuaPE_ZONE16_PE01ORC_GuardArtMove", i )		
	end
	return GuardArt
end

-- 刪除伐木工
function LuaPE_ZONE16_PE01ORC_DelWorker()	
	local Worker = ZONE16_PE01ORC_Var["Worker"]
	for i = 1 , table.getn(Worker) do
		DelObj(Worker[i])
	end
end

-- 刪除裝飾民兵
function LuaPE_ZONE16_PE01ORC_DelGuardArt()	
	local GuardArt = ZONE16_PE01ORC_Var["GuardArt"]
	if GuardArt ~= nil then
		for i = 1 , table.getn(GuardArt) do
			DelObj(GuardArt[i])
		end
	end
end

--裝飾民兵移動
function LuaPE_ZONE16_PE01ORC_GuardArtMove( FlagNum )
	local Var = ZONE16_PE01ORC_Var					
	local FlagID = Var["FlagID"]
	local GuardArtFlag = Var["GuardArtFlag"]
	while true do
		WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )				-- 用走的移動
		sleep(rand(30)+50)
		LuaFunc_MoveToFlag( OwnerID(), FlagID, GuardArtFlag[FlagNum], 20 )		
	end
end

--物件產生
function LuaPE_ZONE16_PE01ORC_ObjCreate( ObjID, FlagID, ObjBronFlag, ObjNum )
	local Obj = {}
	local OrgID
	local Phase = ZONE16_PE01ORC_Phase
	local Var = ZONE16_PE01ORC_Var
	local RoomID = Var["RoomID"]
	local GuardID = Var["GuardID"]					-- 民兵物件ID
	local GuardLordID = Var["GuardLordID"]			-- 民兵隊長物件ID
	local OrcID = Var["OrcID"]						-- 獸人物件ID
	local OrcLordID = Var["OrcLordID"]				-- 獸人BOSS物件ID
	local Controller = Var["Controller"]			-- 中控物件	
	local rnd
	local count
	local Guard = {}
	local Orc = {}
		
	for i = 1 , ObjNum do			
		if type( ObjID ) ~= "table" then
			Obj[i] = CreateObjByFlag( ObjID , FlagID , ObjBronFlag, 1 )
		elseif type( ObjID ) == "table" then
			if Phase == 2 then
				rnd = rand(2)+1
			elseif Phase == 3 then
				rnd = rand(4)+1
			elseif Phase == 4 then
				rnd = rand(2)+3
			end	
			
			if ObjID == GuardID then		
				Obj[i] = CreateObjByFlag( ObjID[ rand(4)+1 ] , FlagID , ObjBronFlag[ rand(5)+1 ] , 1 )
			elseif ObjID == OrcID then
				Obj[i] = CreateObjByFlag( ObjID[ rnd ] , FlagID , ObjBronFlag[ rand(5)+1 ] , 1 )
			end
		end
		
		Sleep(2)
		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 0 )			-- 用跑的移動
		SetModeEx( Obj[i] , EM_SetModeType_Mark , true )			-- 標記
		SetModeEx( Obj[i] , EM_SetModeType_Strikback , true )		-- 反擊
		SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , true )		-- 索敵
		SetModeEx( Obj[i] , EM_SetModeType_Fight , true )			-- 可砍殺攻擊
		SetIdleMotion( Obj[i] , ruFUSION_ACTORSTATE_COMBAT_1H )		-- 預設是戰鬥動作
		AddToPartition( Obj[i] , RoomID )
		MoveToFlagEnabled( Obj[i] , false )							-- 關閉巡邏劇情
		table.insert( ZONE16_PE01ORC_Obj , Obj[i] )					-- 加入物件管理陣列
		AddBuff( Obj[i] , 506303 , 0 , -1 )							-- 防AE的Buff		
		BeginPlot( Obj[i], "LuaPE_ZONE16_PE01ORC_MoveToAttack", 0 ) -- 自主移動攻擊判斷	
		MoveToFlagEnabled( Obj[i], false )
		
		OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
		for j = 1, table.getn( OrcID ) do
			if OrgID == OrcID[j] or OrgID == OrcLordID then		--找到獸人	
				count = ReadRoleValue( Controller, EM_RoleValue_Register1 )
				WriteRoleValue( Controller, EM_RoleValue_Register1, count+1 )
				SetPlot( Obj[i], "DEAD", "LuaPE_ZONE16_PE01ORC_OrcDead", 0 )
				WriteRoleValue( Obj[i], EM_RoleValue_Register2, 1 ) -- 註記為獸人				
				break			
			elseif OrgID == GuardID[j] or OrgID == GuardLordID then		--找到民兵	
				count = ReadRoleValue( Controller, EM_RoleValue_Register2 )					
				WriteRoleValue( Controller, EM_RoleValue_Register2, count+1 )
				SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , false ) -- 關掉民兵鎖敵
				WriteRoleValue( Obj[i], EM_RoleValue_Register2, 2 ) -- 註記為民兵
				SetPlot( Obj[i], "DEAD", "LuaPE_ZONE16_PE01ORC_GuardDead", 0 )				
				break				
			end
		end		
		Sleep( 2 )
	end
	return Obj
end
--==================================================--



--==================================================--
--  雷安卡的逆襲  死亡處理區                        --
--==================================================--
function LuaPE_ZONE16_PE01_Orc() --地圖原始怪物掛載
	SetPlot( OwnerID(), "DEAD", "LuaPE_ZONE16_PE01ORC_OrcDead", 0 )
end

function LuaPE_ZONE16_PE01ORC_GuardDead()	
	if ZONE16_PE01ORC_Phase > 0 and ZONE16_PE01ORC_Phase < 5 then
		local Var = ZONE16_PE01ORC_Var
		local Controller = Var["Controller"]		-- 控制物件
		local GuardDead = Var["GuardDead"]			-- 目前被殺隊員數目
		local MaxDeadGuard = Var["MaxDeadGuard"]	-- 事件失敗最大民兵死亡數目
		local MaxGuard = Var["MaxGuard"]			-- 場上最多民兵數量
		local FlagID = Var["FlagID"]	
		local GuardFlagID = Var["GuardFlagID"]		--民兵產生位置
		local count
		local backSay = {	"[SC_PE_ZONE16_01_M09]", 					--我要先退離了。
							"[SC_PE_ZONE16_01_M10]"	}					--剩下就交給你們了。
		
		GuardDead = GuardDead + 1		-- 死亡計數
		Var["GuardDead"] = GuardDead
		PE_SetVar( "ZONE16_PE01ORC_Var_MaxGuardDead" , GuardDead )		-- PE變數改變
		count = ReadRoleValue( Controller, EM_RoleValue_Register2 )
		WriteRoleValue( Controller, EM_RoleValue_Register2, count-1 )
				
		NPCSay( OwnerID(), backSay[rand(2)+1] )	
		for i=1, 3 do
			rnd = rand(5)+1		
			ks_MoveToFlag( OwnerID(), FlagID, GuardFlagID[rnd], 20 )
			Sleep(10)
		end
		DelObj( OwnerID() )
		return false
	end	
	return true
end

function LuaPE_ZONE16_PE01ORC_OrcDead()
	if ZONE16_PE01ORC_Phase > 0 and ZONE16_PE01ORC_Phase < 5 then
		local PEIndex = ZONE16_PE01ORC_PEIndex
		local Phase = ZONE16_PE01ORC_Phase
		local Var = ZONE16_PE01ORC_Var
		local Controller = Var["Controller"]	-- 控制物件
		local OrcLordID = Var["OrcLordID"]		-- 獸人BossID
		local OrcDead = Var["OrcDead"]			-- 目前殺死獸人數量
		local PH1Require = Var["PH1Require"]	-- 事件滿足需要殺死獸人數目
		local PH2Require = Var["PH2Require"]	-- 事件滿足需要殺死獸人數目
		local MapID = Var["MapID"] 
		local MaxOrc = Var["MaxOrc"]			-- 場上最大獸人數量
		local Total = ZONE16_PE01ORC_Total      -- PE累積總積分
		local OrcBossDead
		local count
		local ObjID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
		local OrcID = ZONE16_PE01ORC_Var["OrcID"]--怪物
		
		local Bonus = 5
		for i=1, table.getn(OrcID) do
			if ObjID == OrcID[i] then
				if i >2 then
					Bonus = 20
				end
				break
			end
		end

		count = ReadRoleValue( Controller, EM_RoleValue_Register1 )
		if count > 0 then
			WriteRoleValue( Controller, EM_RoleValue_Register1, count-1 )
		end
				
		OrcDead = OrcDead + 1		-- 死亡計數
		Var["OrcDead"] = OrcDead
		if Phase == 1 then			
			PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead1" , OrcDead )		-- PE變數改變
		elseif Phase == 2 then
			PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead2" , OrcDead )		-- PE變數改變
		end	
		if ObjID == OrcLordID then	--Boss死亡 勝利
			OrcBossDead = 1
			PE_SetVar( "ZONE16_PE01ORC_Var_OrcBossDead" , OrcBossDead )
			LuaPE_KS_GetBonus( PEIndex, MapID, 300 )
			Total = Total + 300
			ZONE16_PE01ORC_Total  = Total
		else
			LuaPE_KS_GetBonus( PEIndex, MapID, Bonus )         -- 擊殺給予分數
			Total = Total + Bonus
			ZONE16_PE01ORC_Total  = Total
		end
		return true	
	end
end

--==================================================--

--==================================================--
--  灰煙林地爭奪戰  移動表演區                      --
--==================================================--
function LuaPE_ZONE16_PE01ORC_GuardDo()
	local Var = ZONE16_PE01ORC_Var
	local Phase = ZONE16_PE01ORC_Phase
	local FlagID = Var["FlagID"]					
	local GuardLordID = Var["GuardLordID"]			--民兵隊長物件ID
	local GuardID = Var["GuardID"]					--民兵物件ID
	local Controller = Var["Controller"]			--中控物件
	local GuardFlagID = Var["GuardFlagID"]			--民兵產生位置
	local GLordFlagID = Var["GLordFlagID"]			--民兵隊長產生位置
	local OrcFlagID = Var["OrcFlagID"]				--獸人產生位置
	local MaxGuard = Var["MaxGuard"]				--場上最大民兵數量	
	local TimeSpace = Var["TimeSpace"]				--計時間隔(秒)
	local TimeCreateGuard = Var["TimeCreateGuard"]	--每次間隔出場的民兵數目
	local RoomID = Var["RoomID"]
	local GuardNum = 0								--場上目前民兵數量	
	local CreateGuard								--實際產生數量
	local Guard = {}
	local GuardLord 
	
	GuardLord = LuaPE_ZONE16_PE01ORC_ObjCreate( GuardLordID , FlagID , GLordFlagID , 1 )

	while true do
		Phase = ZONE16_PE01ORC_Phase
		if Phase > 4 then break end --停止
		GuardNum = ReadRoleValue( Controller, EM_RoleValue_Register2 )	--讀取民兵數量
		if GuardNum < MaxGuard then			
			CreateGuard = MaxGuard - GuardNum			
			if CreateGuard >= TimeCreateGuard then
				LuaPE_ZONE16_PE01ORC_ObjCreate( GuardID , FlagID , GuardFlagID , TimeCreateGuard )			
			elseif CreateGuard < TimeCreateGuard then
				LuaPE_ZONE16_PE01ORC_ObjCreate( GuardID , FlagID , GuardFlagID , CreateGuard )
			end
		end
		Sleep( TimeSpace*10 ) --生產間隔
	end
end

function LuaPE_ZONE16_PE01ORC_OrcDo()
	local Phase = ZONE16_PE01ORC_Phase
	local Var = ZONE16_PE01ORC_Var				
	local FlagID = Var["FlagID"]					
	local Controller = Var["Controller"]			-- 中控物件
	local GuardID = Var["GuardID"]					-- 民兵物件ID
	local OrcID = Var["OrcID"]						-- 獸人物件ID
	local GuardFlagID = Var["GuardFlagID"]			-- 民兵產生位置
	local OrcFlagID = Var["OrcFlagID"]				-- 獸人產生位置
	local MaxOrc = Var["MaxOrc"]					-- 場上最大獸人數量
	local TimeCreateOrc = Var["TimeCreateOrc"]		-- 每次間隔出場的獸人數目
	local TimeSpace = Var["TimeSpace"]				-- 計時間隔(秒)
	local OrcNum = 0								-- 場上目前獸人數量
	local CreateOrc									-- 實際產生數量
	
	while true do
		Phase = ZONE16_PE01ORC_Phase
		if Phase > 4 then break end --停止
		TimeSpace = Var["TimeSpace"]
		CreateOrc = 0		
		OrcNum = ReadRoleValue( Controller, EM_RoleValue_Register1 ) --讀取獸人數量
		if OrcNum < MaxOrc then
			CreateOrc = MaxOrc - OrcNum 
			if CreateOrc >= TimeCreateOrc then
				LuaPE_ZONE16_PE01ORC_ObjCreate( OrcID , FlagID , OrcFlagID , TimeCreateOrc )
			elseif CreateOrc < TimeCreateOrc then
				LuaPE_ZONE16_PE01ORC_ObjCreate( OrcID , FlagID , OrcFlagID , CreateOrc )
			end
		end				
		Sleep( TimeSpace*10 ) --生產間隔
	end
end

function LuaPE_ZONE16_PE01ORC_BossCreate()
	local Var = ZONE16_PE01ORC_Var
	local FlagID = Var["FlagID"]
	local OrcLordID = Var["OrcLordID"]				-- 獸人BOSS物件ID
	local OLordFlagID = Var["OLordFlagID"]			-- 獸人BOSS產生位置
	local OrcLord
	OrcLord = LuaPE_ZONE16_PE01ORC_ObjCreate( OrcLordID , FlagID , OLordFlagID , 1 )
end


--==================================================--


--==================================================--
--  灰煙林地爭奪戰  控制物件攻擊指示區              --
--==================================================--
function LuaPE_ZONE16_PE01ORC_MoveToAttack()		-- 防止人物發呆
	local Phase = ZONE16_PE01ORC_Phase
	local Var = ZONE16_PE01ORC_Var					
	local FlagID = Var["FlagID"]					
	local Controller = Var["Controller"]			-- 中控物件
	local GuardID = Var["GuardID"]					-- 民兵物件ID
	local GuardLordID = Var["GuardLordID"]			-- 民兵隊長物件ID
	local OrcID = Var["OrcID"]						-- 獸人物件ID
	local OrcLordID = Var["OrcLordID"]				-- 民兵隊長物件ID
	local GuardFlagID = Var["GuardFlagID"]			-- 民兵產生位置
	local OrcFlagID = Var["OrcFlagID"]				-- 獸人產生位置	
	local moveCenter = 0
	local rnd = 0
	local SayRnd
	local moveRnd = 0
	local ObjType
	local Obj
	local gd1 = ZONE16_PE01ORC_Var["GuardDead"]
	local gd2 = 0
	local GuardSay = { 	[1] = "[SC_PE_ZONE16_01_M11]",  -- 灰煙林地是我們的!!
						[9] = "[SC_PE_ZONE16_01_M12]",  -- 滾出我們的森林!
						[17] = "[SC_PE_ZONE16_01_M13]",  -- 給那些雷安卡獸人一點教訓!
						[25] = "[SC_PE_ZONE16_01_M14]",  -- 用力砍吧!
						[33] = "[SC_PE_ZONE16_01_M15]" } -- 快來人幫我!

	local OrcSay = { 	[1] = "[SC_PE_ZONE16_01_M16]",  -- 為什麼要打擾我們的生活!!
						[9] = "[SC_PE_ZONE16_01_M17]",  -- 雷安卡族不會被打倒的!
						[17] = "[SC_PE_ZONE16_01_M18]",  -- 你們絕對會付出代價的!
						[25] = "[SC_PE_ZONE16_01_M19]",  -- 可惡的人類...
						[33] = "[SC_PE_ZONE16_01_M20]" } -- 森林絕不可能是你們的!	
	
	while true do
		AddBuff( OwnerID() , 506303 , 0 , -1 ) -- 防AE Buff			
		Phase = ZONE16_PE01ORC_Phase
		rnd = rand(5)+1		
		if CheckID( OwnerID() ) ~= true or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			break
		else
			ObjType = ReadRoleValue( OwnerID(), EM_RoleValue_Register2 )
		end
		
		if Phase > 4 and CheckID( OwnerID() ) == true and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) ~= 1 then			
			LuaPE_ZONE16_PE01ORC_StopAttack( OwnerID() )
			if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID ) == OrcFlagID then
				DelObj( OwnerID() )
			end
			ClearHateList( OwnerID(), -1 )
			
			if ObjType == 2 then --民兵						
				if moveCenter < 2 then
					ks_MoveToFlag( OwnerID(), FlagID, GuardFlagID[rnd], 20 )
				elseif moveCenter == 2 then
					moveRnd = rand(2)+3
					ks_MoveToFlag( OwnerID(), FlagID, moveRnd, 20 )
				end
			elseif ObjType == 1 then	--獸人
				ks_MoveToFlag( OwnerID(), FlagID, OrcFlagID[rnd], 20 )					
			end
			Sleep( 30 )
			DelObj( OwnerID() )
			break
		end
		
		SayRnd = rand(40)+1
		if ObjType == 2 then --民兵	
			gd2 = ZONE16_PE01ORC_Var["GuardDead"]
			if gd2 > gd1 then
				gd1 = gd2
				AddBuff( OwnerID() , 506846 , 0 , -1 ) -- 激勵 Buff
			end	
			if GuardSay[SayRnd] ~= nil and rand(2) == 0 then
				NPCSay( OwnerID(), GuardSay[SayRnd])
			end
		elseif ObjType == 1 then	--獸人 
			if OrcSay[SayRnd] ~= nil and rand(2) == 0 then
				NPCSay( OwnerID(), OrcSay[SayRnd])
			end
		end

		Obj = Role:new( OwnerID())
		if Obj:IsAttack() ~= true and HateListCount( OwnerID() ) == 0 then
			--StopMove( OwnerID(), true )			
			if ObjType == 2 then --民兵			
				if LuaPE_ZONE16_PE01ORC_GuardAttack() == false then
					if moveCenter == 0 then
						if moveRnd == 0 then moveRnd = rand(2)+3 end
						ks_MoveToFlag( OwnerID(), FlagID, moveRnd, 20 )
						if DW_CheckDis( OwnerID(), FlagID, moveRnd, rand(20)+20 ) then
							moveCenter = 1
						end
					elseif moveCenter == 1 then
						ks_MoveToFlag( OwnerID(), FlagID, moveRnd-2, 20 )
						if DW_CheckDis( OwnerID(), FlagID, moveRnd-2, rand(20)+20 ) then
							moveCenter = 2
						end
					elseif moveCenter == 2 then
						ks_MoveToFlag( OwnerID(), FlagID, OrcFlagID[rnd], 30 )
					end
				end
			elseif ObjType == 1 then	--獸人 
				if Phase > 1 then
					if moveCenter == 0 then
						if moveRnd == 0 then moveRnd = rand(2)+1 end
						ks_MoveToFlag( OwnerID(), FlagID, moveRnd, 20 )
						if DW_CheckDis( OwnerID(), FlagID, moveRnd, rand(20)+20 ) then
							moveCenter = 1
						end
					elseif moveCenter == 1 then
						moveRnd = rand(2)+3
						ks_MoveToFlag( OwnerID(), FlagID, moveRnd, 30 )
						if DW_CheckDis( OwnerID(), FlagID, moveRnd, rand(20)+20 ) then
							moveCenter = 0
						end
					end
				end		
			end		
		end
		sleep(10)
	end
end

function LuaPE_ZONE16_PE01ORC_CheckOrc()
	local Obj = TargetID()
	local OrcID = ZONE16_PE01ORC_Var["OrcID"]
	local OrcLordID = ZONE16_PE01ORC_Var["OrcLordID"]
	
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
	for i=1, table.getn( OrcID )-1 do
		if OrgID == OrcID[i] or OrgID == OrcLordID and ReadRoleValue( OrgID, EM_RoleValue_IsDead ) ~= 1 then 
			return true
		end
	end
	return false
end

function LuaPE_ZONE16_PE01ORC_CheckGuard()
	local Obj = TargetID()
	local GuardID = ZONE16_PE01ORC_Var["GuardID"]
	local GuardLordID = ZONE16_PE01ORC_Var["GuardLordID"]
	
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
	for i=1, table.getn( GuardID )-1 do
		if OrgID == GuardID[i] or OrgID == GuardLordID then 
			return true
		end
	end
	return false	
end



function LuaPE_ZONE16_PE01ORC_GetOrc()
	local Guard = OwnerID()
	local Orc = TargetID()
	local target = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
	if target == 0 then
		WriteRoleValue( Guard, EM_RoleValue_Register1, Orc )
		SetAttack( OwnerID() , Orc )
	end
end

function LuaPE_ZONE16_PE01ORC_GuardAttack()	
	local Orc
	CastSpell( OwnerID(), OwnerID(), 495599 )--鎖敵判斷	
	Orc = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
	if CheckID( Orc ) == true and ReadRoleValue( Orc , EM_RoleValue_IsDead ) ~= 1 then
		return true
	else
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
		return false
	end

end
--==================================================--

--==================================================--
--  灰煙林地爭奪戰  啟動處理區                      --
--==================================================--

function LuaPE_ZONE16_PE01ORC_Reset()--讓PE重置
	local Var = ZONE16_PE01ORC_Var					
	local ResetTime = Var["ResetTime"]		-- 秒	
	local creater = ZONE16_PE01ORC_Var["Creater"]
	local Mode = 1
	local GuardArt = LuaPE_ZONE16_PE01ORC_CreateGuardArt()
	ZONE16_PE01ORC_Var["GuardArt"] = GuardArt
	--Sleep( ResetTime*10 )
	LuaPE_ZONE16_PE01ORC_Start( Mode ) --mode
end

function LuaPE_ZONE16_PE01Test()--跳過等待1小時的時間
	local PEIndex = ZONE16_PE01ORC_PEIndex
	local Phase = ZONE16_PE01ORC_Phase	
	local PHIndex = 101
	
	LuaPE_ZONE16_PE01ORC_PhaseDO( Phase )
	PE_JumpToPhase( PEIndex, PHIndex )	
end
function LuaPE_ZONE16_PE01_Pass()--通過第一階段
	PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead1" , 30 )		-- PE變數改變
end
function LuaPE_ZONE16_PE02_Pass()--通過第二階段
	PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead2" , 40 )		-- PE變數改變
end


--==================================================--