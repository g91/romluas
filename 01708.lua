--==================================================--
-- 階段流程
-- 1. Phase1 運輸隊運送過程
-- 2. Phase2 怪物團前鋒攻擊(1成功)
-- 3. Phase3 怪物團總攻擊(2成功)
-- 4. Phase4 怪物團首領攻擊(3成功)
-- ?. Phase? 運輸隊防衛成功(4成功)
-- ?. Phase? 怪物團搶奪成功(2,3,4失敗)
-- ?. Phase? 運送隊死光(不檢測)
--==================================================--

--==================================================--
--  測試函式區                                      --
--==================================================--

function LuaPE_ZONE15_PE03MAD_DeleteAll( DeleteMode )
	local Obj = ZONE15_PE03MAD_Obj
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

function LuaPE_ZONE15_PE03MAD_KillMonster()
	PE_SetVar( "ZONE15_PE03MAD_Var_MonsterKilled" , 30 )
end
function LuaPE_ZONE15_PE03MAD_KillGuard()
	PE_SetVar( "ZONE15_PE03MAD_Var_GuardKilled" , 25 )
end

--==================================================--



--==================================================--
--  全域變數區                                      --
--==================================================--
function LuaPE_ZONE15_PE03MAD_GlobalSet()
	ZONE15_PE03MAD_Obj = {}		-- 使用物件管理陣列
	ZONE15_PE03MAD_Var = {}		-- 使用參數管理陣列
	ZONE15_PE03MAD_Phase = 0	-- 階段標籤

	ZONE15_PE03MAD_Var["ControllerID"] = 113714	-- 控制物件(破爛木箱)
	ZONE15_PE03MAD_Var["Controller"] = 0		-- 控制物件GID

	ZONE15_PE03MAD_Var["FlagID"] = 780538	-- 旗標ID
	
	ZONE15_PE03MAD_Var["TotalGuardNum"] = 0	-- 隊員總數
	ZONE15_PE03MAD_Var["GuardNum"] = 0	-- 目前隊員數量
	ZONE15_PE03MAD_Var["MonsterNum"] = 0	-- 目前怪物數量

	ZONE15_PE03MAD_Var["PH2NeedKillMonster"]  = 30	-- 階段二需要殺死怪物數目
	ZONE15_PE03MAD_Var["PH2CanKillGuard"] = 25		-- 階段二會出現的隊員數目

	ZONE15_PE03MAD_Var["GoFlag"] = 12	-- 戰鬥發生旗子位置

	ZONE15_PE03MAD_Var["ResetTime"] = 3600	-- 公眾任務重置時間(秒)	1小時
	ZONE15_PE03MAD_Var["TimeSpace"] = 15		-- 計時間隔(秒)

	ZONE15_PE03MAD_Var["GuardID"] = { 103107, 103108 }	-- 下水道管理騎士
	ZONE15_PE03MAD_Var["GuardLeaderID"] = 103109	-- 下水道管理騎士

	ZONE15_PE03MAD_Var["MonsterID"] = { 103117, 103118 }	-- 噁心巨蟑螂,枯毛巨蜘蛛
	ZONE15_PE03MAD_Var["MonsterLeaderID"] = 103119	-- 黃綠黏液病原體

	ZONE15_PE03MAD_Var["GuardCreateNum"] = 4		-- 一次隊員產生數量
	ZONE15_PE03MAD_Var["MaxGuardNum"] = 7		-- 場上維持隊員數量

	ZONE15_PE03MAD_Var["PH3Time"] = 90		-- 階段三總時間(秒)	3分鐘	

	ZONE15_PE03MAD_Var["AreaID"] = 775		-- 公眾事件分區編號		達拉尼斯廢城區
	ZONE15_PE03MAD_Var["TestID"] = 1		-- 公眾事件測試區編號
	
end
--==================================================--



--==================================================--
--  公眾事件設定區                                  --
--==================================================--
function LuaPE_ZONE15_PE03MAD_PESet()

	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_PESet Start!!" )
	local PE_Name = "SC_PE_ZONE15_03MAD_PENAME"	-- 下水道生物的反攻
	local PE_Desc = "SC_PE_ZONE15_03MAD_PEDESC"	-- 達拉尼斯城下水道有著神秘詭異的氣氛，體型長得異常巨大的生物不知為何紛紛竄出，下水道管理騎士目前正對這些巨型生物展開肅清...
	local PEIndex = 3
	local PE_ResetTime = ZONE15_PE03MAD_Var["ResetTime"] * 1000
	-- 新增一個事件
	PE_AddPE( PE_Name , PE_Desc , PEIndex , PE_ResetTime )

	local AreaID = ZONE15_PE03MAD_Var["AreaID"]
	local TestID = ZONE15_PE03MAD_Var["TestID"]
	PE_AddRegion( PEIndex , AreaID )	-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )	-- 把PE放進測試區


	local PH2Index = 302
	local PH2_Name = "SC_PE_ZONE15_03MAD_PHNAME02"	-- 黑色生物的活動
	local PH2_Desc = ""
	local PH3Index = 303
	local PH3_Name = "SC_PE_ZONE15_03MAD_PHNAME03"	-- 一湧而出的巨型生物們
	local PH3_Desc = ""
	local PH4Index = 304
	local PH4_Name = "SC_PE_ZONE15_03MAD_PHNAME04"	-- 作亂的黃綠黏液病原體
	local PH4_Desc = ""

	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- 新增階段2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- 新增階段3
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- 新增階段4

	local OB2Index = 3002
	local OB2_Name = "SC_PE_ZONE15_03MAD_OBNAME02"	-- 殺死噁心巨蟑螂
	local OB2_Desc = ""
	-- 新增一個目標，階段2成功條件：殺死30個怪物
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE15_PE03MAD_Var_MonsterKilled" , 0 , ZONE15_PE03MAD_Var["PH2NeedKillMonster"] ,  true )

	local OB3Index = 3003
	local OB3_Name = "SC_PE_ZONE15_03MAD_OBNAME03"	-- 肅清一湧而出的巨型生物
	local OB3_Desc = ""
	-- 新增一個目標，階段3成功條件：撐過指定時間
	PE_PH_AddObjective_TimeLimit( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE15_PE03MAD_Time" , ZONE15_PE03MAD_Var["PH3Time"]*1000 , 0 ,  true )

	local OB4Index = 3004
	local OB4_Name = "SC_PE_ZONE15_03MAD_OBNAME04"	-- 殲滅黃綠黏液病原體
	local OB4_Desc = ""
	-- 新增一個目標，階段4成功條件：幹掉怪物團首領
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "ZONE15_PE03MAD_Var_MonsterBossKill" , 0 , 1 ,  true )

	local OB5Index = 3005
	local OB5_Name = "SC_PE_ZONE15_03MAD_OBNAME05"	-- 下水道管理騎士被擊退
	local OB5_Desc = ""
	-- 新增一個目標，階段2,3,4失敗條件：騎士掰掰
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE03MAD_Var_GuardKilled" , 0 , ZONE15_PE03MAD_Var["PH2CanKillGuard"] ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE03MAD_Var_GuardKilled" , 0 , ZONE15_PE03MAD_Var["PH2CanKillGuard"] ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE03MAD_Var_GuardKilled" , 0 , ZONE15_PE03MAD_Var["PH2CanKillGuard"] ,  false )

	-- 設定階段連接
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )


	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE15_PE03MAD_OB_OnAchieve" )
	
	-- 設定事件結束的結算回摳函式
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE15_PE03MAD_FinalExchange" )

	-- 事件啟動
	PE_Start( PEIndex , PH2Index )

	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_PESet END!!" )
end
function LuaPE_ZONE15_PE03MAD_OB_OnAchieve( PEIndex , PHIndex , OBIndex )
	local Ctrl = ZONE15_PE03MAD_Var["Controller"]
	
	if PHIndex == 302 and OBIndex == 3002 then
		LuaPE_ZONE15_PE03MAD_Message( 2 )
	elseif PHIndex == 303 and OBIndex == 3003 then
		LuaPE_ZONE15_PE03MAD_Message( 3 )
		LuaPE_ZONE15_PE03MAD_BossCreate()	-- 產BOSS怪
	elseif PHIndex == 304 and OBIndex == 3004 then
		LuaPE_ZONE15_PE03MAD_Message( 4 )		
		LuaPE_ZONE15_PE03MAD_RobBack()--NPC離開
		CallPlot( Ctrl, "LuaPE_ZONE15_PE03MAD_Reset", 0 )
	elseif OBIndex == 3005 then
		LuaPE_ZONE15_PE03MAD_Message( 5 )
		LuaPE_ZONE15_PE03MAD_Message( 6 )
		LuaPE_ZONE15_PE03MAD_RobBack()--NPC離開
		CallPlot( Ctrl, "LuaPE_ZONE15_PE03MAD_Reset", 0 )
	end
end
function LuaPE_ZONE15_PE03MAD_FinalExchange( PEIndex , GUID , Score )
	local LV = 54
	local MapID = ZONE15_PE03MAD_Var["AreaID"]
	if LuaPE_ZONE15_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = 10
	local TokenID = 206873	-- 管理騎士的銅幣
	
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
function LuaPE_ZONE15_PE03MAD_Message( Index )
	ZONE15_PE03MAD_Phase = Index
	local Ctrl = ZONE15_PE03MAD_Var["Controller"]	
	local Color = "0xffffff00"	-- 強制訊息為黃色	
	local Message = {}
	Message[1] = "[SC_PE_ZONE15_03MAD_M05]"	-- 噁心巨蟑螂瘋狂的逃竄出來！
	Message[2] = "[SC_PE_ZONE15_03MAD_M06]"	-- 枯毛巨蜘蛛交雜著噁心巨蟑螂群體一湧而出！
	Message[3] = "[SC_PE_ZONE15_03MAD_M07]"	-- 黃綠黏液病原體悄悄的出現在巨型生物群體之中！！
	Message[4] = "[SC_PE_ZONE15_03MAD_M08]"	-- 下水道管理騎士成功的肅清竄出的巨型生物群體！
	Message[5] = "[SC_PE_ZONE15_03MAD_M09]"	-- 下水道管理騎士無法抵擋巨型生物群體的攻擊！！
	Message[6] = "[SC_PE_ZONE15_03MAD_M10]"	-- 殘餘的巨型生物們一溜煙的消失在下水道之中！！
	
	if Index == 1 or Index == 4 or Index == 6 then
		ScriptMessage( Ctrl, -1 , 1 , Message[Index] , Color )
		ScriptMessage( Ctrl, -1 , 0 , Message[Index] , Color )
	else
		local AreaID = ZONE15_PE03MAD_Var["AreaID"]	-- 怪物補給線東邊
		local AreaPlayer = LuaPE_ZONE15_GetAreaPlayer( AreaID )
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( Ctrl, AreaPlayer[i] , 1 , Message[Index] , Color )
			ScriptMessage( Ctrl, AreaPlayer[i] , 0 , Message[Index] , Color )
		end
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_Message "..Index )
end

--==================================================--



--==================================================--
--  共用函式區                                      --
--==================================================--

--物件產生
function LuaPE_ZONE15_PE03MAD_ObjCreate( ObjID , FlagID , Flag , ObjNum, ObjType )
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ObjCreate "..ObjType.." Start!!" )
	local Obj = {}
	local RoomID = 0
	
	for i = 1 , ObjNum do
		if Type(ObjID) == "table" then
			Obj[i] = CreateObjByFlag( ObjID[(i%2)+1], FlagID , Flag[i], 1 )
		elseif Type(Flag) == "table" then
			Obj[i] = CreateObjByFlag( ObjID, FlagID , Flag[i], 1 )
		else
			Obj[i] = CreateObjByFlag( ObjID, FlagID , Flag, 1 )
		end
		
		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 0 )	-- 用跑的移動
		AddToPartition( Obj[i] , RoomID )
		SetIdleMotion( Obj[i] , ruFUSION_ACTORSTATE_COMBAT_1H )	-- 預設是戰鬥動作
		MoveToFlagEnabled( Obj[i] , false )		-- 關閉巡邏劇情
		table.insert( ZONE15_PE03MAD_Obj , Obj[i] )	-- 加入物件管理陣列
		
		AddBuff( Obj[i] , 506303 , 0 , -1 )	-- 防AE的Buff
		SetFlag( Obj[i], 544801, 1 )--關閉帕奇鼠(4.0.0追加)
		
		if ObjType == "NPC" then
			ZONE15_PE03MAD_Var["TotalGuardNum"] = ZONE15_PE03MAD_Var["TotalGuardNum"] +1
			ZONE15_PE03MAD_Var["GuardNum"] = ZONE15_PE03MAD_Var["GuardNum"]+1	-- 目前隊員數量
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE03MAD_GuardDead" , 0 )
		elseif ObjType == "Mst" then
			ZONE15_PE03MAD_Var["MonsterNum"] = ZONE15_PE03MAD_Var["MonsterNum"]+1	-- 目前怪物數量
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE03MAD_MstDead" , 0 )
		else
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE03MAD_BossDead" , 0 )
		end
		
		CallPlot( Obj[i] , "LuaPE_ZONE15_PE03MAD_NPCDo" , 0 )
		
		Sleep( 1 )
	end

	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ObjCreate "..ObjType.." END!!" )
	if ObjNum == 1 then
		return obj[1]
	end
	return obj;
end

--==================================================--

--==================================================--
--  怪物團夜襲  物件產生區                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_GuardTimeCreate()--產生騎士
	local Var = ZONE15_PE03MAD_Var
	local TimeSpace = Var["TimeSpace"]		-- 計時間隔(秒)
	local GuardID = Var["GuardID"]
	local FlagID = Var["FlagID"]	
	local MaxNum = Var["MaxGuardNum"]
	local TimeCreateNum = Var["GuardCreateNum"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local Flag = { 1 , 2 , 3 , 4 , 5 }
		
	while true do
		local Num = Var["GuardNum"]	-- 隊員產生數目
		local CreateNum = 0
	
		if ZONE15_PE03MAD_Phase > 3 or Var["TotalGuardNum"] >= Var["PH2CanKillGuard"] then
			break;
		elseif Num < MaxNum then
			CreateNum = MaxNum - Num
			if CreateNum >= TimeCreateNum then
				LuaPE_ZONE15_PE03MAD_ObjCreate( GuardLeaderID , FlagID , 1 , 1, "NPC" )
				LuaPE_ZONE15_PE03MAD_ObjCreate( GuardID , FlagID , Flag , TimeCreateNum, "NPC" )
			elseif CreateNum < TimeCreateNum and CreateNum > 0 then
				LuaPE_ZONE15_PE03MAD_ObjCreate( GuardID , FlagID , Flag , CreateNum, "NPC" )
			else
				DebugLog( 2, "LuaPE_ZONE15_PE03MAD_GuardTimeCreate 0" )
			end
		end
		Sleep( TimeSpace * 20 )
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_GuardTimeCreate END!!" )
end

function LuaPE_ZONE15_PE03MAD_MstTimeCreate()--產生怪物
	local Var = ZONE15_PE03MAD_Var
	local TimeSpace = Var["TimeSpace"]		-- 計時間隔(秒)
	local MonsterID = Var["MonsterID"]
	local FlagID = Var["FlagID"]
	local Flag = { 6 , 7 , 8 , 9 , 10 , 6 , 7 , 8 , 9 , 10 }
	local MstID

	while true do
		local Num = Var["MonsterNum"]-- 目前怪物數量
		local MaxNum = math.floor( (ZONE15_PE03MAD_Phase+1)*4 )
		local TimeCreateNum = math.floor( (ZONE15_PE03MAD_Phase+1)*2 )
		local CreateNum = 0			
		if ZONE15_PE03MAD_Phase == 1 then
			MstID = MonsterID[1]
		else
			MstID = MonsterID
		end
		
		if ZONE15_PE03MAD_Phase > 3 then
			break;
		elseif Num < MaxNum then
			CreateNum = MaxNum - Num			
			if CreateNum >= TimeCreateNum then
				LuaPE_ZONE15_PE03MAD_ObjCreate( MstID , FlagID , Flag , TimeCreateNum, "Mst" )
			elseif CreateNum < TimeCreateNum and CreateNum > 0 then
				LuaPE_ZONE15_PE03MAD_ObjCreate( MstID , FlagID , Flag , CreateNum, "Mst" )
			else
				DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ThiefTimeCreate 0" )
			end
		end
		Sleep( TimeSpace * 10 )
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ThiefTimeCreate END!!" )
end

function LuaPE_ZONE15_PE03MAD_BossCreate()--產生BOSS
	local MonsterLeaderID = ZONE15_PE03MAD_Var["MonsterLeaderID"]
	local FlagID = ZONE15_PE03MAD_Var["FlagID"]
	local Boss = LuaPE_ZONE15_PE03MAD_ObjCreate( MonsterLeaderID, FlagID , 6 , 1, "Boss" )
	AddBuff( Boss, 502546, 0, -1 )--放大1.3
end

--==================================================--



--==================================================--
--  怪物團夜襲  死亡處理區                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_GuardDead()--騎士死亡
	if ZONE15_PE03MAD_Phase < 5 then
		ZONE15_PE03MAD_Var["GuardNum"] = ZONE15_PE03MAD_Var["GuardNum"] - 1
		PE_SetVar( "ZONE15_PE03MAD_Var_GuardKilled" , PE_GetVar( "ZONE15_PE03MAD_Var_GuardKilled" )+1 )		-- PE變數改變		
	end
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE03MAD_MstDead()--怪物死亡
	if ZONE15_PE03MAD_Phase < 4 then
		local PEIndex = 3	
		local MapID = ZONE15_PE03MAD_Var["AreaID"]
		LuaPE_ZONE15_GetBonus( PEIndex, MapID, 3 )         -- 擊殺給予分數
			
		ZONE15_PE03MAD_Var["MonsterNum"] = ZONE15_PE03MAD_Var["MonsterNum"] - 1		
		PE_SetVar( "ZONE15_PE03MAD_Var_MonsterKilled" , PE_GetVar( "ZONE15_PE03MAD_Var_MonsterKilled" )+1 )		-- PE變數改變
	end
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE03MAD_BossDead()--BOSS死亡
	PE_SetVar( "ZONE15_PE03MAD_Var_MonsterBossKill" , 1 )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域

	if ReadRoleValue( TargetID() , EM_RoleValue_IsNPC ) == 0 then
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 1 , "[SC_PE_ZONE15_03MAD_M14][$SETVAR1="..GetName(TargetID()).."]" )		-- 在玩家 [$VAR1] 大力的協助之下，[103119]被成功的殲滅了！
		end
	else
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 1 , "[SC_PE_ZONE15_03MAD_M15]" )		-- 在眾人大力的協助之下，[103119]被成功的殲滅了！
		end
	end
	
	local PEIndex = 3
	local MapID = ZONE15_PE03MAD_Var["AreaID"]
	LuaPE_ZONE15_GetBonus( PEIndex, MapID, 50 )         -- 擊殺給予分數
	DelObj( OwnerID() )
	return true;
end

--==================================================--



--==================================================--
--  怪物團夜襲  移動表演區                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_NPCDo()--NPC移動
	local FlagObjID = ZONE15_PE03MAD_Var["FlagID"]
	local FlagGoID = ZONE15_PE03MAD_Var["GoFlag"]
	local Range = 30

	LuaPE_ZONE15_ObjGoFlag( OwnerID() , FlagObjID , FlagGoID , Range )
end

--==================================================--



--==================================================--
--  怪物團夜襲  表演分配區                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_RobBack()--NPC離開
	local Obj = ZONE15_PE03MAD_Obj
	local Var = ZONE15_PE03MAD_Var

	local GuardID = Var["GuardID"]
	local MonsterID = Var["MonsterID"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local MonsterLeaderID = Var["MonsterLeaderID"]

	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true then
			LuaPE_ZONE15_StopAttack( Obj[i] )

			local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
			if OrgID == GuardID[1] or OrgID == GuardID[2] Or OrgID == GuardLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE15_PE03MAD_GuardWinDo" , 0 )
			elseif OrgID == MonsterID[1] or OrgID == MonsterID[2] or OrgID == MonsterLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE15_PE03MAD_MonsterRobBackDo" , 0 )
			end
		end
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_RobBack" )
end

function LuaPE_ZONE15_PE03MAD_GuardWinDo()
	Sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 3 )
end

function LuaPE_ZONE15_PE03MAD_MonsterRobBackDo()
	local FlagObjID = ZONE15_PE03MAD_Var["FlagID"]
	local FlagGoID = 6
	local Range = 30
	
	WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 3 )
	LuaPE_ZONE15_ObjGoFlag( OwnerID() , FlagObjID , FlagGoID , Range )
	DelObj( OwnerID() )
end

--==================================================--

--==================================================--
--  怪物團夜襲  啟動處理區                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_Start( Mode )--起始函式
	local Obj = ZONE15_PE03MAD_Obj
	local tmp = 0
	if Obj ~= nil then
		tmp = ZONE15_PE03MAD_Var["Controller"]
		--LuaPE_ZONE15_PE03MAD_DeleteAll( Mode )	-- 將之前的前一個事件的物件全部刪掉
	end

	LuaPE_ZONE15_PE03MAD_GlobalSet()	-- 共用變數設定
	if Mode == nil then
		LuaPE_ZONE15_PE03MAD_PESet()		-- 公眾事件設定
	end

	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ControllerSet Start!!" )
	local ControllerID = ZONE15_PE03MAD_Var["ControllerID"]		-- 破爛木箱
	local FlagID = ZONE15_PE03MAD_Var["FlagID"]		-- 旗子ID
	local Flag = 11					-- 出生旗子11
	local RoomID = 0	
	local Ctrl = LuaPE_ZONE15_ControllerSet( ControllerID , FlagID , Flag , RoomID )	-- 設定控制物件
	ZONE15_PE03MAD_Var["Controller"] = Ctrl
	ZONE15_PE03MAD_Obj[1] = Ctrl	-- 將操作物件加入第一項	
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ControllerSet END!!" )
	
	LuaPE_ZONE15_PE03MAD_Message( 1 )
	CallPlot( Ctrl, "LuaPE_ZONE15_PE03MAD_GuardTimeCreate", 0 )	-- 隊員登場
	CallPlot( Ctrl, "LuaPE_ZONE15_PE03MAD_MstTimeCreate", 0 )	-- 怪物登場
	
	if tmp ~= 0 then 
		DelObj(tmp)
		DebugMsg(0,0,"Del ZONE15_PE03 Ctrl")
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_Start!!" )	
end

function LuaPE_ZONE15_PE03MAD_Reset()
	DebugLog( 2, "LuaPE_ZONE15_PE03WAD_END!!" )	
	
	LuaPE_ZONE15_PE03MAD_DeleteAll( 1 )	-- 將之前的前一個事件的物件全部刪掉
	
	local ResetTime = ZONE15_PE03MAD_Var["ResetTime"]		-- 秒	
	DebugLog( 2, "PE03_ResetTime="..ResetTime )
	Sleep( ResetTime*10 )
	
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_Start Begin!!" )
	LuaPE_ZONE15_PE03MAD_Start( 1 )	
end

--==================================================--