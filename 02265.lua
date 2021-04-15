
--================================== 設定 ====================================--

function Lua_ZONE14_PE04_GlobalSet()--變數宣告
	ZONE14_PE04_PEIndex = 1404
	ZONE14_PE04_Count = 0
	ZONE14_PE04_Phase = 1	--開始階段
	ZONE14_PE04_Ctrl = 0
	ZONE14_PE04_PHIndex = { 100, 200 }	
	
	ZONE14_PE04_Obj = {}--所有
	ZONE14_PE04_Core = {}--核心群組
	ZONE14_PE04_Giant = {}--園丁
	ZONE14_PE04_Other = {}--雜魚
	ZONE14_PE04_Team = {}--友方
	ZONE14_PE04_Dead = {}--等死
	
	ZONE14_PE04_Rnd = 0
	ZONE14_PE04_Boss = 0
	ZONE14_PE04_Wind = 0
	
	ZONE14_PE04_Debuff = {
		[1] = {	508796, 	508803 };--邪穢機關學(園丁)
		[2] = {	0, 		508804 };--穢暗力量2(佈陣者)
		[3] = {	508798,	508805 };--構化軀體(佈陣者)
		[4] = {	508799,	508806 };--尖刺核心(核心)
		[5] = {	508800,	508807 };--汙穢之境(友方)
		[6] = {	0,		508808 };--聚靈之地(貧死)
		[7] = {	508802,	508809 };--能量豐沛(敵方)
		[8] = {	0,		508810 };--德莉亞的溺愛(無)
		}
	
	ZONE14_PE04_SkillBuff = {	508858,--坦用
								508859,--近D
								508893,--補
								508895--法D
							}
	
	ZONE14_PE04_Var = {}
	ZONE14_PE04_Var["MapID"] = 436
	ZONE14_PE04_Var["FlagID"] = 780656 -- 旗標號碼
	ZONE14_PE04_Var["BackTime"] = 180
	ZONE14_PE04_Var["ResetTime"] = 300
	ZONE14_PE04_Var["BossID"] = 105289	--大魔王
	ZONE14_PE04_Var["WindID"] = 105327 -- 烈風
	ZONE14_PE04_Var["CoreID"] = 105299	--核心
	ZONE14_PE04_Var["MageID"] = {	105290,--佈陣者
									105291,
									105292,
									105293
								}
																
	ZONE14_PE04_Var["GiantID"] = 105294	--園丁
	ZONE14_PE04_Var["OtherID"] = {	105407, --雜魚
						105408,
						105413,
						105415
								}
	
	ZONE14_PE04_Var["TeamID"] = {	105322,--坦
									105323,--DD
									105324,--補
									105325--法
								}							
end

function Lua_ZONE14_PE04_PESet()--PE功能
	local PE_Name = "SC_PE_ZONE14_04_NAME"					-- 德莉亞的花園
	local PE_Desc = "SC_PE_ZONE14_04_DESC"					-- 在美麗的花叢間，竟然進行著收集逝者靈魂的可怕儀式，銀野協會不可能坐視此等邪惡的行為發生。
	
	local PEIndex = ZONE14_PE04_PEIndex
	local MapID = ZONE14_PE04_Var["MapID"]
	local PHIndex = ZONE14_PE04_PHIndex
	local TestID = 1
	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- 新增一個事件
	PE_AddRegion( PEIndex , MapID )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
			
	local PH_Name = {	"SC_PE_ZONE14_04_PH1_NAME",	--奧格斯特的計策
						"SC_PE_ZONE14_04_PH2_NAME",	--浴血苦戰
					}
	
	local PH_Desc = {	"SC_PE_ZONE14_04_PH1_DESC",--奧格斯特是德莉亞的心腹之一，擅長整合可用的資源，對符文機關有著精擅的能力。
						"SC_PE_ZONE14_04_PH2_DESC",--雖然少了奧格斯特的影響，但是冒險者們面臨的壓力仍然沉重無比，在盡量不損失人手的情況下，戰事的慘烈程度是難以想像的。
					}
					
	local OBName = {	"SC_PE_ZONE14_04_OBNAME01",	-- 奧格斯特撤退
						"SC_PE_ZONE14_04_OBNAME02"	-- 奧格斯特回歸
					}

	PE_AddPhase( PEIndex , PHIndex[1] , PH_Name[1], PH_Desc[1], 0 , 1 , 1 , 0 )	
	PE_AddPhase( PEIndex , PHIndex[2] , PH_Name[2], PH_Desc[2], 0 , 1 , 1 , 0 )

	PE_PH_AddObjective_Equal( PEIndex , PHIndex[1], PHIndex[1], OBName[1], "", "ZONE14_PE04_BossLeave" , 0, 1,  true )
	PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex[1], PHIndex[1]+1, "", "", "ZONE14_PE04_BossBack1" , ZONE14_PE04_Var["ResetTime"]*1000, 0,  true )--隱藏條件
	PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex[2], PHIndex[2], OBName[2], "", "ZONE14_PE04_BossBack2" , ZONE14_PE04_Var["BackTime"]*1000, 0,  true )
	
	PE_OB_SetVisible( PEIndex, PHIndex[1], PHIndex[1]+1, false )--隱藏條件
	
	PE_SetCallBackOnPlayerEnter( PEIndex, "Lua_ZONE14_PE04_Enter" )--進入區域
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_ZONE14_PE04_Leave" )--離開區域
	
	-- 設定階段連接
	--PE_PH_SetNextPhase( PEIndex , PHIndex[1], PHIndex[2] )
	--PE_PH_SetNextPhase( PEIndex , PHIndex[2], PHIndex[1] )
	
	-- 設定目標達成的回摳函式
	PE_OB_SetCallBackOnAchieve( PEIndex , "Lua_ZONE14_PE04_OnAchieve" )
	
	PE_SetScoreVisible( PEIndex, false )--不顯示積分	
			
	-- 事件啟動
	PE_Start( PEIndex , PHIndex[2] )
end


function Lua_ZONE14_PE04_Enter( PEIndex, Player )--進入區域
	local Rnd = ZONE14_PE04_Rnd
	local Debuff = ZONE14_PE04_Debuff
	if Rnd ~= 0 then
		if Rnd == 5 then
			AddBuff( Player, Debuff[Rnd][1], 0, -1 )
		end
		AddBuff( Player, Debuff[Rnd][2], 0, -1 )
	end
end

function Lua_ZONE14_PE04_Leave( PEIndex, Player )--離開區域
	local Rnd = ZONE14_PE04_Rnd
	local Debuff = ZONE14_PE04_Debuff
	if Rnd ~= 0 then
		if CheckBuff( Player, Debuff[Rnd][1] ) == true then
			CancelBuff( Player, Debuff[Rnd][1] )
		end
		CancelBuff( Player, Debuff[Rnd][2] )
	
		if CheckBuff( Player, 508844 ) == true then
			CancelBuff( Player, 508844 )
		end
	end
end

function Lua_ZONE14_PE04_OnAchieve( PEIndex, PH_Index , OB_Index )--條件滿足
	local PHIndex = ZONE14_PE04_PHIndex
	local Boss = ZONE14_PE04_Boss
	local Wind = ZONE14_PE04_Wind
	debugmsg(0,0,"PHIndex = "..PH_Index.."; OB_Index = "..OB_Index )
	local OBName = {	"SC_PE_ZONE14_04_OBNAME01",	-- 奧格斯特撤退
				"SC_PE_ZONE14_04_OBNAME02"	-- 奧格斯特回歸
			}
	if OB_Index ~= PHIndex[1] then--奧格斯特的計策
		Lua_ZONE14_PE04_GetDebuff()--隨機Debuff
		--if OB_Index == PHIndex[1]+1 then
		--	PE_JumpToPhase( PEIndex, PHIndex[1] )--重上BUFF			
		--	PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex[1], PHIndex[1]+1, "", "", "ZONE14_PE04_BossBack1" , ZONE14_PE04_Var["ResetTime"]*1000, 0,  true )--隱藏條件
		--else
		if OB_Index ~= PHIndex[1]+1 then
			Show( Boss, 0 )
			ks_AttackMode( Boss )--Boss進場
		end
		PE_JumpToPhase( PEIndex, PHIndex[1] )
		PE_PH_AddObjective_Equal( PEIndex , PHIndex[1], PHIndex[1], OBName[1], "", "ZONE14_PE04_BossLeave" , 0, 1,  true )
		PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex[1], PHIndex[1]+1, "", "", "ZONE14_PE04_BossBack1" , ZONE14_PE04_Var["ResetTime"]*1000, 0,  true )--隱藏條件
	else
		ks_ActorMode( Boss, true )--設定演戲用NPC
		ClearHateList( Boss, -1 )	
		Hide( Boss )
		KillID( Boss, Boss )
		Lua_ZONE14_PE04_ClearDebuff()--清除負面效果
		PE_JumpToPhase( PEIndex, PHIndex[2] )
		PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex[2], PHIndex[2], OBName[2], "", "ZONE14_PE04_BossBack2" , ZONE14_PE04_Var["BackTime"]*1000, 0,  true )
	end
	PE_RefreshConfig()--更新PE介面
end

function Lua_ZONE14_PE04_BossInCombat()
	WriteRoleValue( OwnerID(), EM_RoleValue_PID, 0 )
	BeginPlot( OwnerID(), "Lua_ZONE14_PE04_BossFight", 0 )
end

function Lua_ZONE14_PE04_BossFight()--開始戰鬥判斷
	local OID = OwnerID()
	local MaxHP = ReadRoleValue( OID, EM_RoleValue_MaxHP )	
	while true do
		sleep(30)
		if ReadRoleValue( OID, EM_RoleValue_PID ) ~= 0 then
			break
		end
		if ReadRoleValue( OID, EM_RoleValue_HP ) <= MaxHP*0.5 then			
			NPCSay( OID, "[SC_PE_ZONE14_04_BOSSDEAD01]")
			ScriptMessage( OID, -1, 1 , "[SC_PE_ZONE14_04_BOSSDEAD02]" , 0 )--沒有作用
			for i=1, HateListCount( OID ) do
				local Hate = HateListInfo( OID , i-1, EM_HateListInfoType_GItemID )
				if CheckBuff( Hate, 508814 ) == true then--最佳協助者
					Lua_Zone14_PE04_QuestKill( Hate, 10 )--關鍵表現取得
				end		
			end			
			PE_SetVar( "ZONE14_PE04_BossLeave" , 1 )		-- PE變數改變
			return
		end
	end
end

function Lua_ZONE14_PE04_BossOutCombat()--離開戰鬥
	local Boss=OwnerID();
	WriteRoleValue( Boss, EM_RoleValue_PID, 1  )
	if ReadRoleValue(Boss,EM_RoleValue_IsDead)==0 then
		SetPos(Boss,7177,170,1381,253);
	end
end
function Lua_ZONE14_PE04_WindInCombat()--烈風進入戰鬥
	if ZONE14_PE04_Rnd == 8 then
		WriteRoleValue( OwnerID(), EM_RoleValue_PID, 1 )
	end
end

function Lua_ZONE14_PE04_WindOutCombat()--烈風離開戰鬥
	local Wind = OwnerID()
	local x,y,z,dir
	x=ReadRoleValue(Wind,EM_RoleValue_X)
	y=ReadRoleValue(Wind,EM_RoleValue_Y)
	z=ReadRoleValue(Wind,EM_RoleValue_Z)
	dir=0;
	local Box=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(Box,EM_SetModeType_Show,false);
	SetModeEx(Box,EM_SetModeType_Mark,false);
	SetModeEx(Box,EM_SetModeType_ShowRoleHead,false);
	AddToPartition(Box,0);
	CallPlot(Box,"Lua_ZONE14_PE04_WindDelayHide",Wind);
end
function Lua_ZONE14_PE04_WindDelayHide(Wind)--烈風延時隱藏
	local Box=OwnerID();
	local WaitSec=200
	local IsWindLive=false;
	for Sec=0,WaitSec,20 do
		sleep(20)
		IsWindLive=(ReadRoleValue(Wind,EM_RoleValue_HP)>10);
		if ReadRoleValue( Wind, EM_RoleValue_PID ) == 1 and ZONE14_PE04_Rnd ~= 8 then
			if  IsWindLive==true then
				Hide(Wind);
				KillID( Wind, Wind )
				WriteRoleValue( Wind, EM_RoleValue_PID, 0 );
				WriteRoleValue(Wind,EM_RoleValue_Register5,1);
			end
		else
			if IsWindLive==true then
				WriteRoleValue(Box,EM_RoleValue_LiveTime,1);
				return
			end
		end
	end
	WriteRoleValue(Box,EM_RoleValue_LiveTime,1)
	if CheckID(Wind) and ReadRoleValue(Wind,EM_RoleValue_Register5)==0 then
		Hide(Wind);
		WriteRoleValue(Wind,EM_RoleValue_Register5,1);
	end
end


--================================== Debuff ====================================--

function Lua_ZONE14_PE04_ClearDebuff()--清除負面效果
	local PEIndex = ZONE14_PE04_PEIndex
	local Debuff = ZONE14_PE04_Debuff
	local Obj = ZONE14_PE04_Obj
	
	if ZONE14_PE04_Rnd ~= 0 then
		DebugMsg(0,0,"ZONE14_PE04 Old Debuff = "..ZONE14_PE04_Rnd)
		for i=1, table.getn(Obj) do--清除所有負面效果			
			if Obj[i] == nil or CheckID(Obj[i]) ~= true then
				table.remove( Obj, i )
			elseif CheckID(Obj[i]) == true and CheckBuff( Obj[i], Debuff[ZONE14_PE04_Rnd][1] ) == true then
				CancelBuff( Obj[i], Debuff[ZONE14_PE04_Rnd][1] )			
			end
		end
	
		for i = 1 , PE_GetActivePlayerGUIDCount( PEIndex ) do
			local GUID = PE_GetActivePlayerGUID( PEIndex )
			--if CheckBuff(GUID, Debuff[ZONE14_PE04_Rnd][1] ) == true then
			--	CancelBuff( GUID, Debuff[ZONE14_PE04_Rnd][1] )
			--end
			--CancelBuff( GUID, Debuff[ZONE14_PE04_Rnd][2] )
			for j=1, table.getn(Debuff) do
				CancelBuff( GUID, Debuff[j][1] )
				CancelBuff( GUID, Debuff[j][2] )
			end
		end
	end
end

function Lua_ZONE14_PE04_GetDebuff( Rnd )--負面效果
	local PEIndex = ZONE14_PE04_PEIndex
	local Debuff = ZONE14_PE04_Debuff
	local Obj = ZONE14_PE04_Obj
	
	Lua_ZONE14_PE04_ClearDebuff()--清除負面效果
	
	Rnd = Rnd or rand(8)+1
	ZONE14_PE04_Rnd = Rnd
	DebugMsg(0,0,"ZONE14_PE04 New Debuff = "..ZONE14_PE04_Rnd )

	for i = 1 , PE_GetActivePlayerGUIDCount( PEIndex ) do--玩家
		local GUID = PE_GetActivePlayerGUID( PEIndex )
		AddBuff( GUID, Debuff[Rnd][2], 0, -1 )
		if Rnd == 5 then
			AddBuff( GUID, Debuff[Rnd][1], 0, -1 )
		end
	end
		
	if Rnd == 4 or Rnd == 7 then
		Obj = ZONE14_PE04_Core--核心
		for Ctrl in pairs( Obj ) do--核心
			if CheckID( Obj[Ctrl][1]["GUID"] ) == true then
				AddBuff( Obj[Ctrl][1]["GUID"], Debuff[Rnd][1], 0, -1 )
			end
		end
	end

	if Rnd == 1 or Rnd == 7 then--園丁
		Obj = ZONE14_PE04_Giant
		for i=1, table.getn(Obj) do
			AddBuff( Obj[i], Debuff[Rnd][1], 0, -1 )
		end
	end
	
	if Rnd == 2 or Rnd == 3 or Rnd == 7 then--佈陣者
		Obj = ZONE14_PE04_Core--核心
		for Ctrl in pairs( Obj ) do--核心
			for i=2, 5 do
				if CheckID( Obj[Ctrl][i]["GUID"] ) == true then
					AddBuff( Obj[Ctrl][i]["GUID"], Debuff[Rnd][1], 0, -1 )
				end
			end
		end		
	end
		
	if Rnd == 5 then--友方
		Obj = ZONE14_PE04_Team
		for i=1, table.getn(Obj) do
			AddBuff( Obj[i], Debuff[Rnd][1], 0, -1 )
		end
	end
	
	if Rnd == 6 then--等死
		Obj = ZONE14_PE04_Dead
		for i=1, table.getn(Obj) do
			AddBuff( Obj[i], Debuff[Rnd][1], 0, -1 )
		end
	end
	
	if Rnd == 7 then--雜魚
		Obj = ZONE14_PE04_Other
		for i=1, table.getn(Obj) do
			AddBuff( Obj[i], Debuff[Rnd][1], 0, -1 )
		end		
	end
	
	local Wind = ZONE14_PE04_Wind
	if Rnd == 8 then
		Hide( Wind )
		MoveToFlagEnabled( Wind, true )
		Show( Wind, 0 )
	elseif KS_InCombat( Wind ) ~= true then
		if ReadRoleValue(Wind,EM_RoleValue_Register5)==0 then
			Hide( Wind )
			MoveToFlagEnabled( Wind, false )
			Show( Wind, 0 )
			local BaseX = ReadRoleValue( Wind, EM_RoleValue_Register8 )
			local BaseZ = ReadRoleValue( Wind, EM_RoleValue_Register10 )
			local NowX = ReadRoleValue( Wind, EM_RoleValue_X )
			local NowZ = ReadRoleValue( Wind, EM_RoleValue_Z )
			local DisX = ( NowX - BaseX )^2
			local DisZ = ( NowZ - BaseZ )^2
			if math.floor( (DisX+DisZ)^0.5 ) > 50 then
				local BaseY = ReadRoleValue( Wind, EM_RoleValue_Register9 )
				SetPos( Wind, BaseX, BaseY, BaseZ, 0 )			
			end
		else
			WriteRoleValue(Wind,EM_RoleValue_Register5,0);
		end
	end
end

--================================== CheckType ====================================--

function Lua_Zone14_PE04_CheckMage()--檢查是否為佈陣者
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Mage = ZONE14_PE04_Var["MageID"]
	for i=1, table.getn(Mage) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Mage[i] then		
			return true
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE04_CheckGiant()--檢查是否為園丁
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者

	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == ZONE14_PE04_Var["GiantID"] then
		return true		
	end	

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE04_CheckCore()--檢查是否為核心
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者

	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == ZONE14_PE04_Var["CoreID"] then		
		return true
	end	

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE04_CheckTeam()--確認冒險隊
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local TeamID = ZONE14_PE04_Var["TeamID"]
	
	for i=1, table.getn(TeamID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == TeamID[i] then
			return true
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE04_CheckDeader()--瀕死的冒險者
	local OID = OwnerID()
	local TID = TargetID()
	
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105321 then
		if CheckBuff( TID, 508855 ) ~= true then
			return true
		else
			ScriptMessage( OID, OID, 1 , "[SC_FIREDAY_EV3_03]", 0 ) --無法對目標使用
			return false
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE04_CheckMap()--確認區域
	local OID = OwnerID()--使用者
	if DW_CheckMap( OID, Zone14_PE04_Var["MapID"] ) == true then
		return true		
	end	
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end

--================================== 冒險隊設定 ====================================--

function Lua_Zone14_PE04_CreateTeamCtrl()--創造冒險隊中控
	local FlagID = Zone14_PE04_Var["FlagID"]
	local BaseX = GetMoveFlagValue( FlagID, 1, EM_RoleValue_X )--起點
	local BaseY = GetMoveFlagValue( FlagID, 1, EM_RoleValue_Y )--起點
	local BaseZ = GetMoveFlagValue( FlagID, 1, EM_RoleValue_Z )--起點
	local Ctrl = CreateObj( 115053, BaseX, BaseY, BaseZ, 0, 1 )--產生核心
	ZONE14_PE04_Ctrl = Ctrl
	SetModeEx( Ctrl, EM_SetModeType_Mark, false )--標記
	SetModeEx( Ctrl, EM_SetModeType_Fight, false )--砍殺
	SetModeEx( Ctrl, EM_SetModeType_Show, false )--顯示
	AddToPartition( Ctrl, 0 )
	BeginPlot( Ctrl, "Lua_Zone14_PE04_TeamCtrlSet", 0 )--產生帶隊中控
end

function Lua_Zone14_PE04_TeamCtrlSet()--設定冒險隊
	local Ctrl = OwnerID()
	local TeamID = ZONE14_PE04_Var["TeamID"]
	local FlagID = Zone14_PE04_Var["FlagID"]
	local Goal = GetMoveFlagCount( FlagID )-1
	local CtrlX = ReadRoleValue( Ctrl, EM_RoleValue_X )
	local CtrlY = ReadRoleValue( Ctrl, EM_RoleValue_Y )
	local CtrlZ = ReadRoleValue( Ctrl, EM_RoleValue_Z )
	local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID )
	local Site = 1
	local Team = ZONE14_PE04_Team
	local Leader
	local TeamNum
	while true do
		if Leader == nil or CheckID(Leader) ~= true then
			Leader = CreateObj( 115053, CtrlX, CtrlY, CtrlZ, 0, 1 )--產生帶隊者
			SetModeEx( Leader, EM_SetModeType_Mark, false )--標記
			SetModeEx( Leader, EM_SetModeType_Fight, false )--砍殺
			SetModeEx( Leader, EM_SetModeType_Show, false )--顯示
			MoveToFlagEnabled( Leader, false )
			AddToPartition( Leader, RoomID )
			TeamNum = table.getn(TeamID)
			site = 1
			
			for i=1, TeamNum do
				Team[i] = CreateObj( TeamID[i], CtrlX-25*math.cos(math.pi*2*(i/TeamNum)), CtrlY, CtrlZ+25*math.sin(math.pi*2*(i/TeamNum)), 0, 1 )
				WriteRoleValue( Team[i], EM_RoleValue_IsWalk, 1 )
				MoveToFlagEnabled( Team[i], false )
				AddToPartition( Team[i], RoomID )
				SetFlag( Team[i], 544801, 1 )--關閉帕奇鼠
				table.insert( ZONE14_PE04_Obj, Team[i] )--物件管理
			end
		else
			local dead = 0
			local count = 0
			local Fight = false
			
			for i=1, TeamNum do
				if CheckID(Team[i]) ~= true then
					dead = dead + 1
				elseif KS_InCombat(Team[i]) ~= true then
					count = count +1
				elseif KS_InCombat(Team[i]) == true then
					StopMove( Leader, true )
					local AttackTarget = ReadRoleValue( Team[i], EM_RoleValue_AttackTargetID )
					if AttackTarget == 0 then
						local Hate = KS_GetHateList( Team[i] )
						AttackTarget = Hate[1]
					end
					for j=1, TeamNum do
						if CheckID(Team[j]) == true and KS_InCombat(Team[j]) ~= true then
							SysCastSpellLv( AttackTarget, Team[j], 496946, 9 )--製造仇恨
						end
					end
					Fight = true
					break
				end
			end
			if DW_CheckDis( Leader, FlagID, site, 30 ) == true and Fight == false then
				if Site < Goal then
					site = site +1
				else
					for i=1, TeamNum do
						DelObj(Team[i])
					end
					--DebugMsg( 0,0,"Move End" )
					DelObj(Leader)
				end			
			end
			if dead ~= TeamNum and (dead+count) == TeamNum and Fight ~= true then
				WriteRoleValue( Leader, EM_RoleValue_IsWalk, 1 )
				--DebugMsg( 0,0,"Zone14PE04 Team Move To Flag "..Site )
				MoveDirect( Leader, GetMoveFlagValue( FlagID, Site, EM_RoleValue_X ), GetMoveFlagValue( FlagID, Site, EM_RoleValue_Y ), GetMoveFlagValue( FlagID, Site, EM_RoleValue_Z ) )
				sleep(10)
				local X = ReadRoleValue( Leader, EM_RoleValue_X )
				local Y = ReadRoleValue( Leader, EM_RoleValue_Y )
				local Z = ReadRoleValue( Leader, EM_RoleValue_Z )
				for i=1, TeamNum do
					if CheckID(Team[i]) == true then
						WriteRoleValue( Team[i], EM_RoleValue_IsWalk, 1 )
						MoveDirect( Team[i], X-25*math.cos(math.pi*2*(i/TeamNum)), Y, Z+25*math.sin(math.pi*2*(i/TeamNum)) )
					end
				end
				count = 0
			elseif dead == TeamNum then
				DelObj(Leader)
			end
		end
		sleep(10)
	end
end

function Lua_Zone14_PE04_DeaderSet()--瀕死者設定
	local OID = OwnerID()
	WriteRoleValue( OID, EM_RoleValue_Register1, 0 )
	
	if ReadRoleValue( OID, EM_RoleValue_HP )*0.25 >= ReadRoleValue( OID, EM_RoleValue_MaxHP )*0.20 then		
		SetModeEx( OID, EM_SetModeType_Fight , false )				-- 可砍殺攻擊
		SetModeEx( OID, EM_SetModeType_Searchenemy , false )		-- 索敵
		SetModeEx( OID, EM_SetModeType_Mark , true )				-- 標記
		SetModeEx( OID, EM_SetModeType_NotShowHPMP , false )		-- 不顯示血條
		SetModeEx( OID, EM_SetModeType_HideName , false )			-- 名稱
		AddBuff( OID, 507532, 0, -1 )--不會回血
		AddBuff( OID, 507514, 0, -1 )--治療無效
		SetPlot( OID, "DEAD", "Lua_Zone14_PE04_DeaderToDie", 0 )
		SetDefIdleMotion( OID, ruFUSION_MIME_IDLE_DEAD )
		WriteRoleValue( OID, EM_RoleValue_HP, ReadRoleValue( OID, EM_RoleValue_MaxHP )*0.25 )
	end	
	CancelBuff( OID, 508801 )
	if ZONE14_PE04_Rnd == 6 then
		AddBuff( OID, 508801, 1, -1 )
	else
		AddBuff( OID, 508801, 0, -1 )
	end
	local Dead = ZONE14_PE04_Dead
	for i = 1, table.getn(Dead) do
		if Dead[i] == OID then
			return
		end
	end
	table.insert( Dead, OID )
	table.insert( ZONE14_PE04_Obj, OID )--物件管理
end

function Lua_Zone14_PE04_DeaderToDie()--瀕死者
	local OID = OwnerID()
	Hide(OID)
	return true
end

--================================== 佈陣者設定 ====================================--

function Lua_Zone14_PE04_CoreCtrlSet()--中控設定
	local Ctrl = OwnerID()
	local MageID = ZONE14_PE04_Var["MageID"]	
	local BaseX = ReadRoleValue( Ctrl, EM_RoleValue_X )
	local BaseY = ReadRoleValue( Ctrl, EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( Ctrl, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Ctrl, EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID )
	ZONE14_PE04_Core[Ctrl] = {}
	local Obj = ZONE14_PE04_Core[Ctrl]
	Obj[1]={}
	Obj[1]["GUID"] = 0
	Obj[1]["ObjID"] = ZONE14_PE04_Var["CoreID"]
	Obj[1]["X"] = BaseX
	Obj[1]["Y"] = BaseY
	Obj[1]["Z"] = BaseZ
	Obj[1]["RoomID"] = RoomID

	for i=2, table.getn(MageID)+1 do
		Obj[i] = {}
		Obj[i]["GUID"] = 0
		Obj[i]["ObjID"] = MageID[i-1]
		Obj[i]["X"] = BaseX-50*math.cos(math.pi*2*(i/table.getn(MageID)))
		Obj[i]["Y"] = BaseY
		Obj[i]["Z"] = BaseZ+50*math.sin(math.pi*2*(i/table.getn(MageID)))
		Obj[i]["RoomID"] = RoomID
	end
	
	local ReviveTime = 0	
	while true do
		for i=1, 5 do
			if CheckID(Obj[i]["GUID"]) == true and KS_InCombat(Obj[i]["GUID"]) == true then
				ReviveTime = 60
				break
			end
		end
		if ReviveTime > 0 then
			ReviveTime = ReviveTime - 10
		else
			if Obj[1]["GUID"] == 0 or CheckID(Obj[1]["GUID"]) ~= true then
				Obj[1]["GUID"] = CreateObj( Obj[1]["ObjID"], Obj[1]["X"], Obj[1]["Y"], Obj[1]["Z"], 0, 1 )--產生核心
				sleep(5)				
				WriteRoleValue( Ctrl, EM_RoleValue_Register, Obj[1]["GUID"] )--註冊身分
				WriteRoleValue( Obj[1]["GUID"], EM_RoleValue_Register1, Ctrl )--註冊中控				
				AddToPartition( Obj[1]["GUID"], Obj[1]["RoomID"] )
				table.insert( ZONE14_PE04_Obj, Obj[1]["GUID"] )--物件管理
				AddBuff( Obj[1]["GUID"], 507899, 0, -1 )--不可物理攻擊
				AddBuff( Obj[1]["GUID"], 508560, 9999, -1 )--不可移動
			elseif Obj[1]["GUID"] ~= 0 and CheckID(Obj[1]["GUID"]) == true then
				AddBuff( Obj[1]["GUID"], 508560, 9999, -1 )--不可移動
			end
			for i=2, 5 do
				if Obj[i]["GUID"] == 0 or CheckID(Obj[i]["GUID"]) ~= true then
					Obj[i]["GUID"] = CreateObj( Obj[i]["ObjID"], Obj[i]["X"], Obj[i]["Y"], Obj[i]["Z"], 0, 1 )--產生佈陣者
					sleep(5)
					SetModeEx( Obj[i]["GUID"], EM_SetModeType_Searchenemy, false )--鎖敵
					AddToPartition( Obj[i]["GUID"], Obj[i]["RoomID"] )
					table.insert( ZONE14_PE04_Obj, Obj[i]["GUID"] )--物件管理
					WriteRoleValue( Ctrl, EM_RoleValue_Register+i-1, Obj[i]["GUID"] )--註冊身分
					WriteRoleValue( Obj[i]["GUID"], EM_RoleValue_Register1, Ctrl )--註冊中控
				elseif Obj[i]["GUID"] ~= 0 and CheckID(Obj[i]["GUID"]) == true and 
					CheckID(Obj[1]["GUID"] ) == true and KS_InCombat(Obj[i]["GUID"]) ~= true 
					and GetDistance( Obj[i]["GUID"], Obj[1]["GUID"]) <= 100 then
					adjustFaceDir( Obj[i]["GUID"], Obj[1]["GUID"], 0 ) 
					CastSpell( Obj[i]["GUID"], Obj[1]["GUID"], 497076 )--導引
				end	
			end
		end
		sleep(100)
	end
end

function Lua_Zone14_PE04_SetCore()--核心產生劇情
	local OID = OwnerID()
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local partner = ZONE14_PE04_Core[Ctrl]
	local count = 0
	WriteRoleValue( OID, EM_RoleValue_Register6, 0 )--清除結構竊取
	--SetModeEx( OID, EM_SetModeType_Move, false )		--移動
	SetFlag( OID, 544801, 1 )--關閉帕奇鼠
	SetPlot( OID, "DEAD", "Lua_Zone14_PE04_BadDead", 0 )
	
	local fake = LuaFunc_CreateObjByObj (  117910 , OID )
	SetModeEx( fake, EM_SetModeType_Mark, false )--標記
	SetModeEx( fake, EM_SetModeType_HideName, true )--隱藏名稱
	SetModeEx( fake, EM_SetModeType_Fight, false )--砍殺
	WriteRoleValue( OID, EM_RoleValue_Register5, fake )--註冊身分
	AddBuff ( fake, 509212, 0, -1 )
	
	for i=2, 5 do
		if CheckID( partner[i]["GUID"] ) ~= true or KS_InCombat( partner[i]["GUID"] ) ~= true then
			count = count +1
		end
	end
	if count == 4 then
		for i=2, 5 do
			if CheckID(partner[i]["GUID"]) == true and ReadRoleValue( partner[i]["GUID"], EM_RoleValue_SpellMagicID ) ~= 497076 then
				adjustFaceDir( partner[i]["GUID"], OID, 0 ) 
				CastSpell( partner[i]["GUID"], OID, 497076 )--導引
			end
		end
	end
end

function Lua_Zone14_PE04_CoreHeal()--核心治療
	CastSpell( OwnerID(), OwnerID(), 497079 )--範圍治療
end

function Lua_Zone14_PE04_SetMage( Mode )--佈陣者產生劇情
	local OID = OwnerID()
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register1 )
	SetPlot( OID, "DEAD", "Lua_Zone14_PE04_BadDead", 0 )
	SetFlag( OID, 544801, 1 )--關閉帕奇鼠
	local partner = ZONE14_PE04_Core[Ctrl]
	local count = 0
	
	if CheckID( partner[1]["GUID"] ) == true and KS_InCombat( partner[1]["GUID"] ) ~= true then
		for i=2, 5 do
			if CheckID( partner[i]["GUID"] ) ~= true or KS_InCombat( partner[i]["GUID"] ) ~= true then
				count = count +1
			end
		end
		if count == 4 and CheckID( partner[1]["GUID"] ) == true then
			if Mode ~= nil and ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) ~= 497076 then
				adjustFaceDir( OID, partner[1]["GUID"], 0 ) 
				CastSpell( OID, partner[1]["GUID"], 497076 )--導引
			else
				for i=2, 5 do
					if CheckID(partner[i]["GUID"]) == true and ReadRoleValue( partner[i]["GUID"], EM_RoleValue_SpellMagicID ) ~= 497076 then
						if CheckID( partner[1]["GUID"] ) == true then
							adjustFaceDir( partner[i]["GUID"], partner[1]["GUID"], 0 ) 
							CastSpell( partner[i]["GUID"], partner[1]["GUID"], 497076 )--導引
						end
					end
				end
			end
		end
	elseif CheckID( partner[1]["GUID"] ) == true then
		local Hate = KS_GetHateList( partner[1]["GUID"] )
		if Hate[1] ~= nil then
			for i=2, 5 do
				if CheckID(partner[i]["GUID"]) == true and GetDistance( Hate[1], partner[i]["GUID"] ) < 350 then
					SysCastSpellLv( Hate[1], partner[i]["GUID"], 496946, 5 )--製造仇恨
				end
			end
		end
	end
end

function Lua_Zone14_PE04_CoreInBattle()--核心在戰鬥中
	BeginPlot( OwnerID(), "Lua_Zone14_PE04_CheckCoreBattle", 0 )
end

function Lua_Zone14_PE04_CheckCoreBattle()
	local OID = OwnerID()
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local partner = ZONE14_PE04_Core[Ctrl]
	
	while ( HateListCount( OID ) > 0 ) do
		local Hate = KS_GetHateList( OID, 2 )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
		local HateCount = table.getn(Hate)
		if HateCount == 0 or GetDistance( Hate[HateCount], OID ) > 350 then
			Hide(OID)
			local fake = ReadRoleValue( OID, EM_RoleValue_Register5 )
			WriteRoleValue( fake, EM_RoleValue_LiveTime, 1 )
			CancelBuff ( fake, 509212 )
			DelObj(fake)
			partner[1]["GUID"] = CreateObj( partner[1]["ObjID"], partner[1]["X"], partner[1]["Y"], partner[1]["Z"], 0, 1 )--產生核心
			sleep(5)
			WriteRoleValue( Ctrl, EM_RoleValue_Register, partner[1]["GUID"] )--註冊身分
			WriteRoleValue( partner[1]["GUID"], EM_RoleValue_Register1, Ctrl )--註冊中控				
			AddToPartition( partner[1]["GUID"], partner[1]["RoomID"] )
			table.insert( ZONE14_PE04_Obj, partner[1]["GUID"] )--物件管理
			AddBuff( partner[1]["GUID"], 507899, 0, -1 )--不可物理攻擊
			AddBuff( partner[1]["GUID"], 508560, 9999, -1 )--不可移動
			BeginPlot( partner[1]["GUID"], "Lua_Zone14_PE04_WaitLeave", 0 )
			DelObj( OID )
			return
		end
		--DebugMsg(0,0,"Hate[1] Dis = "..GetDistance(Hate[1], OID ).."; Hate["..HateCount.."] Dis = "..GetDistance( Hate[HateCount], OID ))
		for i=2, 5 do
			if CheckID( partner[i]["GUID"] ) == true then
				local Target = ReadRoleValue( OID, EM_RoleValue_AttackTargetID )
				if ReadRoleValue( partner[i]["GUID"], EM_RoleValue_SpellMagicID ) == 497076 then
					MagicInterrupt( partner[i]["GUID"] )--中斷
				end
				if Target ~= 0 and CheckBuff( partner[i]["GUID"], 508938 ) ~= true and GetDistance( Target, OID ) < 350 then
					SysCastSpellLv( Target, partner[i]["GUID"], 496946, 1 )--製造仇恨
				end
			end
		end
		--DebugMsg(0,0,"Core In Combat; HateCount = "..HateListCount( OID ))
		sleep(20)
	end
end

function Lua_Zone14_PE04_LeaveBattle()--核心/佈陣者離開戰鬥
	local OID= OwnerID()
	--DebugMsg(0,0, OID.." Check LeaveBattle; "..ReadRoleValue( OID, EM_RoleValue_Register10 ))
	if ReadRoleValue( OID, EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( OID, EM_RoleValue_Register10 ) == 0 then
		BeginPlot( OID, "Lua_Zone14_PE04_WaitLeave", 0 )--等待離開戰鬥
	end
end

function Lua_Zone14_PE04_WaitLeave()--確認離開戰鬥
	local OID = OwnerID()
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local partner = ZONE14_PE04_Core[Ctrl]	
	WriteRoleValue( OID, EM_RoleValue_Register10, 1 )
	
	if OID ~= partner[1]["GUID"] then		
		CancelBuff( OID, 508797 )
		local MySelf = {}
		for i=2, 5 do
			if partner[i]["GUID"] == OID then
				MySelf = partner[i]
				break
			end
		end
		while true do
			sleep(20)
			if CheckID(partner[1]["GUID"]) ~= true or KS_InCombat(OID) == true then
				--DebugMsg(0,0,"GUID = "..OID.." InCombat return " )
				WriteRoleValue( OID, EM_RoleValue_Register10, 0 )
				return
			end
			local X = ( MySelf["X"]- ReadRoleValue( OID, EM_RoleValue_X ) )^2
			local Z = ( MySelf["Z"]- ReadRoleValue( OID, EM_RoleValue_Z ) )^2
			local Dis = math.floor((X+Z)^0.5)
			--DebugMsg(0,0,"GUID = "..OID.."; Dis = "..Dis )
			local MagicID = ReadRoleValue( OID, EM_RoleValue_SpellMagicID )
			if Dis <= 10 then
				WriteRoleValue( OID, EM_RoleValue_Register10, 0 )
				if MagicID ~= 497076 then
					adjustFaceDir( OID, partner[1]["GUID"], 0 ) 
					CastSpell( OID, partner[1]["GUID"], 497076 )--導引
					--DebugMsg(0,0,"GUID = "..OID.." Spell return " )
					return
				elseif  MagicID == 497076 then
					return
				end
			else
				KS_Move( OID, 0, MySelf["X"], MySelf["Y"], MySelf["Z"] )
			end
		end
	else
		local count = 0
		while count < 4 do
			count = 0
			for j =2, 5 do
				if CheckID(partner[j]["GUID"]) == true and KS_InCombat(partner[j]["GUID"]) == true then
					SetStopAttack( partner[j]["GUID"] )
					ClearHateList( partner[j]["GUID"], -1 )
				elseif CheckID(partner[j]["GUID"]) ~= true or KS_InCombat(partner[j]["GUID"]) ~= true then
					count = count+1
				end
			end
			Sleep(10)
		end
		WriteRoleValue( OID, EM_RoleValue_Register10, 0 )
		--DebugMsg(0,0,"Core Out Combat")
	end
end

function Lua_Zone14_MagePartner()--佈陣者落人
	local OID = OwnerID()--佈陣者自我檢察
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local Target = 0	
	local partner = ZONE14_PE04_Core[Ctrl]
	if ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 497076 then
		MagicInterrupt( OID )--中斷
	end
	
	for i=2, 5 do
		if CheckID( partner[i]["GUID"] ) == true then
			if	( CheckBuff( OID, 508845 ) ~= true and CheckBuff( partner[i]["GUID"], 508845 ) ~= true ) or
				( CheckBuff( OID, 508845 ) == true and CheckBuff( partner[i]["GUID"], 508845 ) == true and
					ReadRoleValue( OID, EM_RoleValue_Register2 ) == ReadRoleValue( partner[i]["GUID"], EM_RoleValue_Register2 ) ) then
					
				Target = ReadRoleValue( OID, EM_RoleValue_AttackTargetID )
				if Target ~= 0 then
					if ReadRoleValue( partner[i]["GUID"], EM_RoleValue_SpellMagicID ) == 497076 then
						MagicInterrupt( partner[i]["GUID"] )--中斷
					end
					SysCastSpellLv( Target, partner[i]["GUID"], 496946, 1 )--製造仇恨
				end
			end
		end
	end

	if OID ~= partner[1]["GUID"] and Target ~= 0 then
		CancelBuff( OID, 508797 )
		if ZONE14_PE04_Rnd == 2 then
			AddBuff( OID, 508797, 1, -1 )
		else
			AddBuff( OID, 508797, 0, -1 )
		end
		if CheckID(partner[1]["GUID"]) == true and ReadRoleValue( partner[1]["GUID"], EM_RoleValue_SpellMagicID ) ~= 497079 then
			for i=2, 5 do
				if ReadRoleValue( partner[i]["GUID"], EM_RoleValue_SpellMagicID ) == 497076 then
					return
				end
			end
			CastSpell( partner[1]["GUID"], partner[1]["GUID"], 497079 )--範圍治療
		end
	end	
end

function Lua_Zone14_PE04_RegBad()--註冊壞人
	local OID = OwnerID()
	WriteRoleValue( OID, EM_RoleValue_Register6, 0 )
	if ReadRoleValue( OID, EM_RoleValue_CampID ) ~= 3 then
		SetRoleCamp( OID, "Monster" )
	end
	
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID );
	if ReadRoleValue( OID, EM_RoleValue_PID ) ~= 0 and ( OrgID == 105407 or OrgID == 105415 ) then
		return;
	end
	
	local Obj = ZONE14_PE04_Obj
	for i=1, table.getn(Obj) do
		if Obj[i] == OID then
			return
		end
	end
	
	SetPlot( OID, "DEAD", "Lua_Zone14_PE04_BadDead", 0 )
	SetFlag( OID, 544801, 1 )--關閉帕奇鼠
	if ReadRoleValue( OID, EM_RoleValue_OrgID ) == ZONE14_PE04_Var["GiantID"] then
		table.insert( ZONE14_PE04_Giant, OID )
		table.insert( ZONE14_PE04_Obj, OID )
	elseif ReadRoleValue( OID, EM_RoleValue_OrgID ) == ZONE14_PE04_Var["BossID"] then
		ZONE14_PE04_Boss = OID
		table.insert( ZONE14_PE04_Obj, OID )
		Hide(OID)			
	elseif ReadRoleValue( OID, EM_RoleValue_OrgID ) == ZONE14_PE04_Var["WindID"] then
		ZONE14_PE04_Wind = OID
		table.insert( ZONE14_PE04_Obj, OID )		
		local X = ReadRoleValue( OID, EM_RoleValue_X )
		local Y = ReadRoleValue( OID, EM_RoleValue_Y )
		local Z = ReadRoleValue( OID, EM_RoleValue_Z )
		WriteRoleValue( OID, EM_RoleValue_Register8, X )
		WriteRoleValue( OID, EM_RoleValue_Register9, Y )
		WriteRoleValue( OID, EM_RoleValue_Register10, Z )
		Hide(OID)
		MoveToFlagEnabled( OID, false )		
		Show( OID, 0 )
	else
		local OtherID = ZONE14_PE04_Var["OtherID"]
		for i=1, table.getn(OtherID) do
			if ReadRoleValue( OID, EM_RoleValue_OrgID ) == OtherID[i] then
				table.insert( ZONE14_PE04_Other, OID )
				table.insert( ZONE14_PE04_Obj, OID )		
				return
			end
		end		
	end	
end

--================================== Skill 1 ====================================--

function Lua_Zone14_PE04_RegPhantom()--註冊幻影
	WriteRoleValue( TargetID(), EM_RoleValue_Register2, OwnerID() )
	return true
end

function Lua_Zone14_PE04_Phantom()--幻影	
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Obj = LuaFunc_CreateObjByObj( 105298, TID )--魔法陣
	ks_TrapMode(obj)--陷阱用
	AddBuff( Obj, 508946, 0, -1 )--無敵盾
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, 15 )--存在時間
end

--================================== Skill 2 ====================================--

function Lua_Zone14_PE04_KillCore()--殺核心
	KillID( OwnerID(), TargetID())
end

--================================== Skill 3 ====================================--

function Lua_Zone14_PE04_Corrosion()--侵蝕	
	local TID = TargetID()
	if KS_CheckBuffLV( TID, 508841 ) == 4 then--取得指定物件身上BUFF等級
		local OID = OwnerID()
		KillID( OID, TID )
		Lua_Zone14_PE04_QuestKill( OID, 5 )--關鍵表現取得
	end
end

--================================== Skill 4 ====================================--

function Lua_Zone14_PE04_CheckPartner()--確認夥伴
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if TID ~= OID and ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 
		and DW_CheckMap( TID, Zone14_PE04_Var["MapID"] ) == true 
		and CheckAcceptQuest( TID, 424038 ) == true then
		return true
	end	
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE04_Partner()--伙伴
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者	
	WriteRoleValue( TID, EM_RoleValue_Register2, OID )--伙伴
	local Partner = ReadRoleValue( OID, EM_RoleValue_Register3 )
	if ReadRoleValue( Partner, EM_RoleValue_Register2 ) == OID then
		CancelBuff( Partner, 508843 )--伙伴
	end
	WriteRoleValue( OID, EM_RoleValue_Register3, TID )--記錄伙伴
	return true
end

function Lua_Zone14_PE04_ResetReg2()--清除伙伴
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0 )--清除登記伙伴者	
end

--================================== Skill 5 ====================================--

function Lua_Zone14_PE04_HelpDeader()--救死人
	local OID = OwnerID()
	local TID = TargetID()
	if ReadRoleValue( TID, EM_RoleValue_IsDead ) ~= 1 then
		if rand(10)> 3 then
			Hide(TID)		
			WriteRoleValue( TID, EM_RoleValue_IsWalk, 0 )
			SetModeEx( TID, EM_SetModeType_Mark , false )			-- 標記
			SetModeEx( TID, EM_SetModeType_NotShowHPMP , true )		-- 不顯示血條
			SetModeEx( TID, EM_SetModeType_HideName , true )		-- 名稱
			Show(TID, ReadRoleValue( OID, EM_RoleValue_RoomID))
			CancelBuff( TID, 508801 )
			SetDefIdleMotion( TID, ruFUSION_MIME_IDLE_STAND )		
			ks_Move( TID, 150 ) --對象(RoleID)移動到指定位置
			NPCSay( TID, "[SC_PE_ZONE14_04_HELP0"..(rand(3)+1).."]" )
			SysCastSpellLv( TID, TID, 497114, 0 )--自補50%
			Lua_Zone14_PE04_QuestKill( OID, 1 )--關鍵表現取得	
			CallPlot( TID, "ks_WaitToDie", 2 )--Time時間  X秒後自己殺自己
		else
			NPCSay( TID, "[SC_PE_ZONE14_04_WILLDEAD]")--快死了
			AddBuff( TID, 508855, 0, -1 )
		end
	end	
end	

function Lua_Zone14_PE04_CheckSorryBusy()--忙碌中
	local OID = OwnerID()
	local TID = TargetID()
	
	if ReadRoleValue( TID, EM_RoleValue_Register1 ) == 0 then
		return true
	end
	ScriptMessage( OID, OID, 1 , "[SAY_NPC_BUSY]" , 0 )--忙碌中
	return false
end

function Lua_Zone14_PE04_SorryOK()--可以給他死
	local OID = OwnerID()
	local TID = TargetID()
	
	WriteRoleValue( TID, EM_RoleValue_Register1, 1 )
	CallPlot( TID, "Lua_Zone14_PE04_ImSorry", OID )
end

function Lua_Zone14_PE04_ImSorry( Killer )--快去死吧你
	local OID = OwnerID()
	CancelBuff( OID, 508801 )
	AddBuff( Killer, 508860, 0, -1 )--無敵+不能攻擊
	NPCSay( OID, "[SC_PE_ZONE14_04_DEADSAY1]")
	sleep(20)
	NPCSay( OID, "[SC_PE_ZONE14_04_DEADSAY2]")
	sleep(35)
	NPCSay( OID, "[SC_PE_ZONE14_04_DEADSAY3]")
	sleep(15)
	CastSpell( Killer, OID, 497113 )--集氣施法動作
	sleep(25)
	MagicInterrupt( Killer )	
	CancelBuff( Killer, 508860 )
	Lua_Zone14_PE04_QuestKill( Killer, 1 )--關鍵表現取得
	KillID( OID, OID )
end

--================================== Skill 6 ====================================--

function Lua_Zone14_PE04_CheckTeamBuff()--確認冒險隊
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local TeamID = ZONE14_PE04_Var["TeamID"]
	local Buff = ZONE14_PE04_SkillBuff
	
	for i=1, table.getn(TeamID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == TeamID[i] then
			if CheckBuff( TID, Buff[i] ) ~= true then
				WriteRoleValue( TID, EM_RoleValue_Register3, OID )
				return true
			end			
			ScriptMessage( OID, OID, 1 , "[SC_BUFF_EXISTS]" , 0 )--已存在同樣效果
			return false
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE04_CheckTeamAddBuff()--確認冒險隊
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local TeamID = ZONE14_PE04_Var["TeamID"]
	local Buff = ZONE14_PE04_SkillBuff
	
	for i=1, table.getn(TeamID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == TeamID[i] then
			if CheckBuff( TID, Buff[i] ) ~= true then
				AddBuff( TID, Buff[i], 0, 15 )
				return true
			end
		end
	end
end

function Lua_Zone14_PE04_CheckTeam10per()--確認冒險隊10%
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local TeamID = ZONE14_PE04_Var["TeamID"]
	
	for i=1, table.getn(TeamID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == TeamID[i] and ReadRoleValue( TID, EM_RoleValue_IsDead ) ~= 1 then
			if ReadRoleValue( TID, EM_RoleValue_HP ) <= ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.1 then
				if ReadRoleValue( TID, EM_RoleValue_Register1 ) == 0 then
					return true
				end
				ScriptMessage( OID, OID, 1 , "[SAY_NPC_BUSY]" , 0 )--忙碌中
				return false
			end
			ScriptMessage( OID, OID, 1 , "[SYS_CANOT_DO_IT]" , 0 )--還不能這麼做
			return false
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE04_CloseEyeOK()--快閉上眼吧
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	WriteRoleValue( TID, EM_RoleValue_Register1, 1 )
	CallPlot( TID, "Lua_Zone14_PE04_CloseEye", OID )
end

function Lua_Zone14_PE04_CloseEye( Killer )--快去死吧你
	local OID = OwnerID()
	AddBuff( OID, 508954, 0, -1 )--撐著最後一口氣
	AddBuff( Killer, 508860, 0, -1 )--無敵+不能攻擊
	ClearHateList( OID, -1 )
	PlayMotion( OID, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	NPCSay( OID, "[SC_PE_ZONE14_04_CLOSEEYE1]")
	sleep(30)
	NPCSay( OID, "[SC_PE_ZONE14_04_CLOSEEYE2]")
	sleep(30)
	NPCSay( OID, "[SC_PE_ZONE14_04_CLOSEEYE3]")
	sleep(20)
	CastSpell( Killer, OID, 497113 )--集氣施法動作
	sleep(25)
	MagicInterrupt( Killer )
	CancelBuff( Killer, 508860 )
	Lua_Zone14_PE04_QuestKill( Killer, 1 )--關鍵表現取得	
	KillID( OID, OID )
end

function Lua_Zone14_PE04_Reg2()
	WriteRoleValue( TargetID(), EM_RoleValue_Register2, OwnerID() )--治療者
	return true
end

--================================== Skill 7 ====================================--

function Lua_Zone14_PE04_Interrupt()--中斷施法
	local TID = TargetID()
	local OID = OwnerID()
	if ReadRoleValue( TID, EM_RoleValue_SpellMagicID ) ~= 497076 then
		MagicInterrupt( TID )
	else
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_04_INTERRUPT]" , 0 )--此狀態下無法產生作用
	end
end

--================================== Skill 8 ====================================--

function Lua_Zone14_PE04_CheckSteal()--竊取
	local OID = OwnerID()
	local TID = TargetID()
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID )
	
	if OrgID == ZONE14_PE04_Var["CoreID"] or OrgID == ZONE14_PE04_Var["GiantID"] then
		if ReadRoleValue( TID, EM_RoleValue_Register6 ) < 1 then			
			return true
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_04_STEAL]" , 0 )--無法再從目標身上竊取任何結構了
		return false
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE04_SetReg6()
	WriteRoleValue( TargetID(), EM_RoleValue_Register6, 999 )
end

function Lua_Zone14_PE04_CheckBomb()--確認炸彈
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Mage = ZONE14_PE04_Var["MageID"]
	for i=1, table.getn(Mage) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Mage[i] then		
			return true
		end
	end
	return false
end

--================================== Skill 9 ====================================--

function Lua_Zone14_PE04_ChangeCore()--轉換核心
	local TID = TargetID()
	local OID = OwnerID()
	local Ctrl = ReadRoleValue( TID, EM_RoleValue_Register1 )
	local partner = ZONE14_PE04_Core[Ctrl]
	for i=2, 5 do
		if partner[i]["GUID"] ~= nil and CheckBuff( partner[i]["GUID"], 508939 ) ~= true then
			ScriptMessage( OID, OID, 1 , "[SC_NO_EFFECT]" , 0 )--沒有作用
			return false
		end
	end
	local Obj = LuaFunc_CreateObjByObj( 105326, TID )
	AddBuff ( Obj, 509327, 1, -1 )
	AddBuff ( Obj, 509333, 1, -1 )
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, 10 )
	Lua_Zone14_PE04_QuestKill( OID, 5 )--關鍵表現取得
	Hide(TID)
	KillID( OID, TID )
end

function Lua_Zone14_PE04_AddMoss()--巨人吃青苔
	local OID = OwnerID()
	local TID = TargetID()
	local lv = KS_CheckBuffLV( TID, 508943 )
	if lv > 0 then
		CancelBuff_NoEvent( TID, 508943 )
		AddBuff( TID, 508943, lv, -1 )
	else
		AddBuff( TID, 508943, 0, -1 )
	end		
end

function Lua_Zone14_PE04_ChangeGiant()--轉換巨人
	local TID = TargetID()
	
	if KS_CheckBuffLV( TID, 508943 ) == 4 then--取得指定物件身上BUFF等級
		ClearhateList( TID, -1 )
		SetRoleCamp( TID, "SNPC" )		
		Lua_Zone14_PE04_QuestKill( OwnerID(), 5 )--關鍵表現取得
	end
	return true
end

function Lua_Zone14_PE04_SetMonster()--設定怪物
	if ReadRoleValue( OwnerID(), EM_RoleValue_CampID ) ~= 3 then
		SetRoleCamp( OwnerID(), "Monster" )
	end
end

--================================== 物件死亡 ====================================--

function Lua_Zone14_PE04_QuestKill( Obj, Num )--關鍵表現取得
	Obj = Obj or OwnerID()
	Num = Num or 1
	ks_QuestKill( Obj, 105320, Num )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	if CheckBuff( Obj, 508843 ) == true then--伙伴		
		local partner =  ReadRoleValue( Obj, EM_RoleValue_Register2 )
		ks_QuestKill( partner, 105320, 1 )
	end	
end

function Lua_Zone14_PE04_BadDead()--壞人死亡
	local OID = OwnerID()
	local Hate = KS_GetHateList( OID )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
	local TeamID = ZONE14_PE04_Var["TeamID"]
	local HateNum = HateListCount( OID )
	
	if Hate[1] == nil then
		Hate[1] = TargetID()
	end
	if ReadRoleValue( OID, EM_RoleValue_OrgID ) == ZONE14_PE04_Var["CoreID"] then--核心死亡
		local fake = ReadRoleValue( OID, EM_RoleValue_Register5 )
		WriteRoleValue( fake, EM_RoleValue_LiveTime, 1 )
		CancelBuff ( fake, 509212 )
		DelObj(fake)
		AddBuff ( OID, 509328, 1, -1 )
		if CheckBuff( Hate[1], 508812 ) == true then--不計後果
			Lua_Zone14_PE04_QuestKill( Hate[1], 1 )--關鍵表現取得
		end
		
		local Hate = {}
		if HateNum > 0 then--職稱領隊
			for i = 1 , HateNum do
				Hate[i] = HateListInfo( OID ,i-1 , EM_HateListInfoType_GItemID )				
				if CheckBuff( Hate[i], 508817 ) == true and ReadRoleValue( Hate[i], EM_RoleValue_IsPlayer ) == 1 and 
					GetDistance( Hate[i], OID ) <= 100 then
					Lua_Zone14_PE04_QuestKill( Hate[i], 3 )--關鍵表現取得					
				end
			end
		end
	else--佈陣者死亡
		local MageID = ZONE14_PE04_Var["MageID"]
		for i=1, table.getn(MageID) do
			if ReadRoleValue( OID, EM_RoleValue_OrgID ) == MageID[i] then			
				if CheckBuff( Hate[1], 508811 ) == true then--賢者之眼的坦誠
					Lua_Zone14_PE04_QuestKill( Hate[1], 1 )--關鍵表現取得
					break
				end
			end
		end
	end
	
	local Hate = {}
	if HateNum > 0 then
		for i = 1 , HateNum do
			Hate[i] = HateListInfo( OID ,i-1 , EM_HateListInfoType_GItemID )									
			for j=1, table.getn(TeamID) do
				if ReadRoleValue( Hate[i], EM_RoleValue_OrgID ) == TeamID[j] then
					if CheckBuff( Hate[i], ZONE14_PE04_SkillBuff[j]) == true then--艾薩克的激勵
						Lua_Zone14_PE04_QuestKill( ReadRoleValue( Hate[i], EM_RoleValue_Register3 ), 1 )--關鍵表現取得
						WriteRoleValue( Hate[i], EM_RoleValue_Register3, 0 )
					end
					if CheckBuff( Hate[i], 508896 ) == true then--長遠之計
						Lua_Zone14_PE04_QuestKill( ReadRoleValue( Hate[i], EM_RoleValue_Register2 ), 1 )--關鍵表現取得
						WriteRoleValue( Hate[i], EM_RoleValue_Register2, 0 )
					end
					break
				end
			end
		end
	end
	
	return true
end

function Lua_ZONE14_PE04_DebuffType()
	Say( OwnerID(), "DebuffType = ".. ZONE14_PE04_Rnd )
end
function Lua_ZONE14_PE04_SetTime()
	PE_SetVar( "ZONE14_PE04_BossBack2" , 20 )		-- PE變數改變	
end


--========================================================================--

function Lua_Zone14PE04_QuestComplete()--完成任務執行
	local Player = TargetID()
	if LuaPE_KS_CleanBuff( Player ) == true then
		local BuffID = 502485
		local Buff = ReadRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2 )
		
		if ZONE14_PE04_Count == 7 then
			ZONE14_PE04_Count = ZONE14_PE04_Count +1
			CallPlot( ZONE14_PE04_Ctrl, "Lua_ZONE14_PE05_CreateCtrl", 0 )--決戰表演
		else
			ZONE14_PE04_Count = ZONE14_PE04_Count +1
		end
		
		if CheckBuff( Player, Buff ) == true and Buff ~= BuffID then
			CancelBuff( Player, Buff )
			WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			DebugMsg(0,0,"14PE04 QuestFin Count = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
			return
		end
		
		local PECount = ReadRoleValue( Player, EM_LuaValueFlag_PECount )		
		local Lv = KS_CheckBuffLV( Player, BuffID )
		DebugMsg(0,0,"Old PECount = "..PECount.."; BuffLV = "..Lv)
		if Lv > 0 or ( Lv == 0 and PECount > 5 ) then--目前進行的PE任務完成次數
			if Lv == 0 and PECount > 5 then
				WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			end
			AddBuff( Player, BuffID, 0, -1 )
			WriteRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2, BuffID )--目前進行的PE所附帶的獎勵狀態
			DebugMsg(0,0,"New PECount = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
		end
	end
end

function Lua_Zone14PE04_ShowQuestCount( Num )--顯示完成次數
	DebugMsg( 0,0,"ZONE14_PE04 QuestCount = "..ZONE14_PE04_Count )
	if Num ~= nil and Num > 0 then		
		ZONE14_PE04_Count = Num
		DebugMsg( 0,0,"ZONE14_PE04 QuestNewCount = "..ZONE14_PE04_Count )
	end
end

--========================================================================--