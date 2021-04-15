
--================================== Init ====================================--

function Lua_Zone13_PE02_GlobalSet()--變數宣告
	Zone13_PE02_PEIndex = 1302
	Zone13_PE02_Phase = 2	--開始階段
	Zone13_PE02_PHIndex = { 100, 200, 300 }
	
	Zone13_PE02_Var = {}	
	Zone13_PE02_Var["MapID"] = 334
	
	Zone13_PE02_Var["Enemy"] = {	105157,
									105162,
									105163
								}
	Zone13_PE02_Var["Friendly"] = {	105222,
									105300
									}
	
	Zone13_PE02_Follow = {}
	
	Zone13_PE02_Var["EnemyNum"] = 0
	Zone13_PE02_Var["FriendlyNum"] = 0		
end

function Lua_Zone13_PE02_PESet()--PE功能
	local PE_Name = "SC_PE_ZONE13_02_NAME"					-- 狂暴蛇群的襲擊
	local PE_Desc = "SC_PE_ZONE13_02_DESC"					-- 近期蛇群的數量與活動力異常大增，造成「英德姆駐地」各種難以輕估的傷害，甚至是善於與蛇作戰的「蘭薩德氏族」也無可避免。
	
	local PEIndex = Zone13_PE02_PEIndex
	local PHIndex = Zone13_PE02_PHIndex
	local TestID = 1
	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- 新增一個事件
	PE_AddRegion( PEIndex , Zone13_PE02_Var["MapID"] )							-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )						-- 把PE放進測試區
			
	local PH_Name = {	"SC_PE_ZONE13_02_PH1_NAME",	--(我方優勢)
						"SC_PE_ZONE13_02_PH2_NAME",	--(敵我均勢)
						"SC_PE_ZONE13_02_PH3_NAME"	--(我方劣勢)
					}
	
	local PH_Desc = {	"SC_PE_ZONE13_02_PH1_DESC",--
						"SC_PE_ZONE13_02_PH2_DESC",--
						"SC_PE_ZONE13_02_PH3_DESC"--
					}

	PE_AddPhase( PEIndex , PHIndex[1] , PH_Name[1], PH_Desc[1], 0 , 1 , 1 , 0 )	
	PE_AddPhase( PEIndex , PHIndex[2] , PH_Name[2], PH_Desc[2], 0 , 1 , 1 , 0 )
	PE_AddPhase( PEIndex , PHIndex[3] , PH_Name[3], PH_Desc[3], 0 , 1 , 1 , 0 )

	PE_PH_AddObjective_Greater( PEIndex , PHIndex[1], PHIndex[1], "", "", "Zone13_PE02_Lock" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[2], PHIndex[2], "", "", "Zone13_PE02_Lock" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[3], PHIndex[3], "", "", "Zone13_PE02_Lock" , 0, 1,  true )
	
	PE_OB_SetVisible( PEIndex, PHIndex[1], PHIndex[1], false )
	PE_OB_SetVisible( PEIndex, PHIndex[2], PHIndex[2], false )
	PE_OB_SetVisible( PEIndex, PHIndex[3], PHIndex[3], false )
	
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_Zone13_PE02_Leave" )--離開區域
	
	PE_SetScoreVisible( PEIndex, false )--不顯示積分
	
	-- 事件啟動
	PE_Start( PEIndex , PHIndex[2] )
end

function Lua_Zone13_PE02_Leave( PEIndex, Player )--離開區域
	if CheckBuff( Player, 508622 ) == true then
		CancelBuff( Player, 508622 )
	end
end

function Lua_Zone13_PE02_CheckFollow()--固定跟隨
	local Follow = Zone13_PE02_Follow
	while true do
		sleep(50)
		for site in pairs( Follow ) do
			if CheckID(site) == true and KS_InCombat(site) ~= true then
				SetFollow( site, Follow[site] )
			elseif CheckID(site) ~= true then
				table.remove( Follow, site )
			end
		end
		Lua_Zone13_PE02_CheckPhase()--檢查階段
	end
end

function Lua_Zone13_PE02_CheckPhase()--檢查階段
	local PEIndex = Zone13_PE02_PEIndex
	local PHIndex = Zone13_PE02_PHIndex
	local EnemyNum = Zone13_PE02_Var["EnemyNum"]
	local FriendlyNum = Zone13_PE02_Var["FriendlyNum"]
	
	if EnemyNum >= math.floor(FriendlyNum*1.2) then
		PE_JumpToPhase( PEIndex, PHIndex[3] )
		Zone13_PE02_Phase = 3
	elseif FriendlyNum >= math.floor(EnemyNum*1.2) then
		PE_JumpToPhase( PEIndex, PHIndex[1] )
		Zone13_PE02_Phase = 1
	else
		PE_JumpToPhase( PEIndex, PHIndex[2] )
		Zone13_PE02_Phase = 2
	end
end

--================================== CheckType ====================================--

function Lua_Zone13_PE02_CheckType01()--檢查是否為蛇類
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Enemy = Zone13_PE02_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then		
			return true
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE02_CheckCombat01()--戰鬥中且目標不是自己
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Enemy = Zone13_PE02_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] and ReadRoleValue( TID, EM_RoleValue_AttackTargetID ) ~= OID then		
			return true
		end
	end	
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE02_CheckMap()--檢查區域
	local OID = OwnerID()--使用者
	if DW_CheckMap( OID, Zone13_PE02_Var["MapID"] ) == true then
		return true		
	end	
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end

--================================== Skill 1 ====================================--

function Lua_Zone13_PE02_StealPoison()--偷毒
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	local MID = ReadRoleValue( OID, EM_RoleValue_SpellMagicID )--讀取技能
	if MID == 496943 then--趁亂竊取
		ks_QuestKill( OID, 105221, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	elseif MID == 496944 then--偷取毒液
		ks_QuestKill( OID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	end
	AddBuff( TID, 508661, 0, -1 )--無毒
end

--===============================================================================--

--================================== Skill 2 ====================================--

function Lua_Zone13_PE02_SnakeCheck()--蛇類攻擊檢查
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者	
	if CheckBuff( TID, 508665 ) == true and CheckBuff( TID, 508668 ) ~= true then
		if rand(10) > 3 then--反噬
			NPCSay( TID, "[SC_PE_ZONE13_02_ERROR01]")--出錯了
			AddBuff( TID, 508666, 0, 10 )
			ScriptMessage( TID, TID, 1 , "[SC_PE_ZONE13_02_ERROR04]" , 0 )--提示訊息
			ScriptMessage( TID, TID, 0 , "[SC_PE_ZONE13_02_ERROR04]" , 0 )--提示訊息
			local obj = KS_CreateObjMode( 117313, TID, nil,  15, 1, false, 15 )--目標附近產生物件
			CallPlot( Obj, "Lua_Zone13_PE02_MagicErrorCheck", TID )--開始檢查
		else
			ks_QuestKill( TID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )			
			ScriptMessage( TID, TID, 1 , "[SC_PE_ZONE13_02_ERROR03]" , "0xffffff00" )--提示訊息
			ScriptMessage( TID, TID, 0 , "[SC_PE_ZONE13_02_ERROR03]" , "0xffffff00" )--提示訊息
		end
		CancelBuff( TID, 508665 )
		return true
	end
	
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) ~= 105196 then
		local Poison = { 496917, 496918, 496919 }
		SysCastSpellLv( OID, TID, Poison[rand(3)+1], 10 )
	end
	return true
end


function Lua_Zone13_PE02_MagicErrorCheck( TID )--魔法失敗檢查
	local OID = OwnerID()--NPC
	local Type = GameObjInfo_Int( 496948, "ColdownType" )
	
	for i=1, 10 do
		if CheckID(TID) == true and ReadRoleValue( TID, EM_RoleValue_IsDead ) ~= 1 and
			ReadRoleValue( TID, EM_RoleValue_Coldown_Job + Type  ) <= 0 then
			sleep(10)
			AddBuff( TID, 508668, 0, 8 )--解除反噬中			
			CastSpell( TID, TID, 496948 )--開始冷卻
			ScriptMessage( TID, TID, 1 , "[SC_PE_ZONE13_02_ERROR02]" , "0xffffff00" )--提示訊息
			ScriptMessage( TID, TID, 0 , "[SC_PE_ZONE13_02_ERROR02]" , "0xffffff00" )--提示訊息
			ks_ActorMode( OID )
			AddToPartition( OID, 0 )
			AdjustFaceDir( OID, TID, 0 ) --面向目標
			SysCastSpellLv( OID, OID, 495735, 0 )--傳送特效
			sleep(10)
			CastSpell( OID, TID, 496973 )--集氣施法動作
			sleep(20)
			CancelBuff_NoEvent( TID, 508666 )--取消反噬
			MagicInterrupt( OID )
			ks_QuestKill( TID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			SysCastSpellLv( OID, OID, 495735, 0 )--傳送特效
			sleep(5)
			DelFromPartition(OID)
			break
		elseif CheckID(TID) ~= true or ReadRoleValue( TID, EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep(10)
	end
	DelObj(OID)
end

function Lua_Zone13_PE02_ErrorToDie()--麻痺死了
	local OID = OwnerID()--使用者
	if CheckBuff( OID, 508668 ) == true then
		return false
	end
	return true
end

--===============================================================================--

--================================== Skill 3 ====================================--

function Lua_Zone13_PE02_CreateTrap()--創造陷阱
	local OID = OwnerID()--使用者	
	local obj = KS_CreateObjMode( 105228, OID, nil,  0, 1, true )--目標附近產生物件
	ks_TrapMode(obj)--陷阱用
	WriteRoleValue( obj, EM_RoleValue_LiveTime, 14 )
	WriteRoleValue( obj, EM_RoleValue_Register1, OID )--寫入創造者
end

function Lua_Zone13_PE02_TrapDo()--陷阱作的事情
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Enemy = Zone13_PE02_Var["Enemy"]

	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			local Creater = ReadRoleValue( OID, EM_RoleValue_Register1 )
			KillID( Creater, TID )--殺死
			Hide(TID)
			AddBuff( Creater, 508670, 0, -1 )
			ks_QuestKill( Creater, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			DelObj(OID)
			return
		end
	end
end

function Lua_Zone13_PE02_CatchSnakeCheck()--抓蛇確認
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Enemy = Zone13_PE02_Var["Enemy"]
	
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			if ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.05 then			
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SYS_CASTSPELL_NEED_HP_LOWER]", 0 )--血量過高
			return false
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE02_CatchSnake()--成功抓蛇
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_SNAKE]" , "0xffffff00" )--提示訊息
	ScriptMessage( OID, OID, 0 , "[SC_PE_ZONE13_02_SNAKE]" , "0xffffff00" )--提示訊息
	ks_QuestKill( OID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	Hide(TID)
	KillID( OID, TID )--殺死
end

--===============================================================================--

--================================== Skill 4 ====================================--

function Lua_Zone13_PE02_CreateTree( TID )-- 種樹
	local OID = OwnerID()--使用者
	TID = TID or OID
	local tree = ReadRoleValue( OID, EM_RoleValue_Register1 )
	if tree > 0 and CheckID(tree) == true then
		DelObj(tree)
	end
	local obj = KS_CreateObjMode( 117316, OID, nil,  0, 1, true )--目標附近產生物件
	ks_ActorMode( obj )
	WriteRoleValue( obj, EM_RoleValue_Register1, TID )--寫入創造者
	BeginPlot( obj, "Lua_Zone13_PE02_TreeGrow", 0 )
	if ReadRoleValue( OID, EM_RoleValue_IsPlayer ) == 0 then Hide(OID) end
	return true
end

function Lua_Zone13_PE02_TreeGrow()--樹長大	
	local OID = OwnerID()--土堆
	sleep(50)
	local obj = KS_CreateObjMode( 105223, OID, nil,  0, 1, true )--目標附近產生物件
	ks_TrapMode(obj)--陷阱用
	AddBuff( Obj, 508946, 0, -1 )
	local Creater = ReadRoleValue( OID, EM_RoleValue_Register1 )
	WriteRoleValue( obj, EM_RoleValue_Register1, Creater )--寫入創造者
	WriteRoleValue( obj, EM_RoleValue_LiveTime, 180 )
	WriteRoleValue( Creater, EM_RoleValue_Register1, obj )--寫入
	DelObj(OID)
end

function Lua_Zone13_PE02_TreeHate()--樹討厭
	local TID = TargetID()
	local Creater = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )--創造者	
	local Enemy = Zone13_PE02_Var["Enemy"]
	
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			SysCastSpellLv( Creater, TID, 496946, 0 )--增加仇恨	
			return true
		end
	end
	return false
end


function Lua_Zone13_PE02_DieAndLive()--生與死
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105163 then		
		local Obj = SearchRangeNPC( TID, 100 ) --TargetID()
		for i=0, table.getn(Obj) do
			if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 105223 and ReadRoleValue( Obj[i], EM_RoleValue_Register1 ) == OID then
				DelObj(Obj[i])
				ks_QuestKill( OID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
				CallPlot( TID, "Lua_Zone13_PE02_CreateTree", OID )--種樹
				return true
			end
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_NATURE]" , 0 )--附近沒有自然之形
		return false
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE02_LifeStyle()--生命的形式
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105162 then
		local Obj = SearchRangeNPC( TID, 100 ) --TargetID()
		for i=0, table.getn(Obj) do
			if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 105223 and ReadRoleValue( Obj[i], EM_RoleValue_Register1 ) == OID then
				BeginPlot( TID, "Lua_Zone13_PE02_Reset", 0 )--重生
				return true
			end
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_NATURE]" , 0 )--附近沒有自然之形
		return false		
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE02_LifeStyleDmg()--生命的形式傷害
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Enemy = Zone13_PE02_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] and ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.3 then
			ks_QuestKill( OID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
		end
	end
	return true
end

--===============================================================================--

--================================== Skill 5 ====================================--

function Lua_Zone13_PE02_CheckSmith()--檢查是否為工匠
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
		
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 117317 then
		local reg = ReadRoleValue( TID, EM_RoleValue_Register2 )
		if reg == 0 or reg == OID then
			return true
		else
			ScriptMessage( OID, OID, 1 , "[SAY_NPC_BUSY]" , 0 )--目標正在忙碌中
			return false
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE02_PlayerWork()--開始工作
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	local reg = ReadRoleValue( TID, EM_RoleValue_Register2 )
	if reg == 0 and ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 496957 then
		WriteRoleValue( TID, EM_RoleValue_Register2, OID )--註冊
		CallPlot( TID, "Lua_Zone13_PE02_SmithWork", OID )--工匠開始工作
		ScriptMessage( TID, OID, 1 , "[SC_PE_ZONE13_01_WORK]" , "0xffffff00" )--提示訊息
		ScriptMessage( TID, OID, 0 , "[SC_PE_ZONE13_01_WORK]" , "0xffffff00" )--提示訊息	
	elseif reg == OID then
		local type = {	[496958] = 1, 
						[496959] = 2,
						[496960] = 3 }	
		local MID = ReadRoleValue( OID, EM_RoleValue_SpellMagicID )--讀取技能		
		if type[MID] ~= nil then
			WriteRoleValue( TID, EM_RoleValue_Register4, type[MID] )--註冊工作內容
		end
	end
end

function Lua_Zone13_PE02_SmithWork( player )--工匠工作
	local OID = OwnerID()--工匠
	local count = 0 --成功次數
	
	while true do		
		sleep(25)
		local WorkInfo = ReadRoleValue( OID, EM_RoleValue_Register3 )--工作內容
		local PlayerWork = ReadRoleValue( OID, EM_RoleValue_Register4 )--玩家執行的工作
		if 	WorkInfo == 0 then
			local rnd = rand(3)+1
			WriteRoleValue( Player, EM_RoleValue_Coldown_Job + 382 , 0 )
			WriteRoleValue( OID, EM_RoleValue_Register3, rnd )--註冊工作內容
			ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_02_SMITH0"..rnd.."]" , "0xffffff00" )--提示訊息
			ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_02_SMITH0"..rnd.."]" , "0xffffff00" )--提示訊息
		else
			if PlayerWork == WorkInfo then				
				if count == 3 then
					ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_02_SMITH05]" , "0xffffff00" )--完成訊息
					ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_02_SMITH05]" , "0xffffff00" )--完成訊息					
					ks_QuestKill( player, 105221, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
					sleep(15)
					ks_ResetRegValue()--暫存值重置
					CallPlot( OID, "ks_resetObj", OID, 60 )--60秒後重生
					break
				else
					count = count +1
					WriteRoleValue( OID, EM_RoleValue_Register3, 0 )--清除工作內容
				end
			else
				MagicInterrupt( player )--中斷
				ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_02_SMITH04]" , 0 )--失敗訊息
				ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_02_SMITH04]" , 0 )--失敗訊息				
				ks_ResetRegValue()--暫存值重置
				break
			end			
		end
		Sleep(15)
	end
end

--===============================================================================--

--================================== Skill 6 ====================================--

function Lua_Zone13_PE02_CheckDeed()--確認簽約者
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if TID ~= OID and ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 and DW_CheckMap( TID, Zone13_PE02_Var["MapID"] ) == true then
		return true
	end	
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone13_PE02_Deed()--簽約
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	WriteRoleValue( TID, EM_RoleValue_Register2, OID )--契約
	return true
end

function Lua_Zone13_PE02_ResetReg2()--清除暫存2
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0 )
	return true
end

function Lua_Zone13_PE02_MoneyCheck()--榨取價值
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if rand(2) > 0 then
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_MONEY01]" , "0xffffff00" )--成功訊息
		ScriptMessage( OID, OID, 0 , "[SC_PE_ZONE13_02_MONEY01]" , "0xffffff00" )--成功訊息
		ks_QuestKill( OID, 105221, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	else
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_MONEY02]" , 0 )--失敗訊息
		ScriptMessage( OID, OID, 0 , "[SC_PE_ZONE13_02_MONEY02]" , 0 )--失敗訊息
		ks_QuestKill( OID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )	
	end
	CancelBuff( TID, 508675 )--取消全屍
	BeginPlot( TID, "Lua_Zone13_PE02_Reset", 0 )--重生
	return true
end

--===============================================================================--

--================================== Skill 7 ====================================--

function Lua_Zone13_PE02_Dog()--獵犬
	local OID = OwnerID()
	local TID = TargetID()--目標
	
	local obj = KS_CreateObjMode( 105196, OID, nil,  15, 1, false, 10 )--目標附近產生物件	
	ks_AttackMode( obj )--設定可攻擊NPC
	WriteRoleValue( obj, EM_RoleValue_LiveTime, 42 )
	WriteRoleValue( obj, EM_RoleValue_Register1, OID )--主人
	CastSpell( obj, TID, 490529 )--攻擊
	SysCastSpellLv( TID, obj, 495767, 0 )--挑釁
end

function Lua_Zone13_PE02_RemoveBones()--去骨
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105163 then		
		return true
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false	
end

function Lua_Zone13_PE02_FireBones()--燒骨
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105162 then		
		return true
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false	
end

function Lua_Zone13_PE02_DogCD()--獵犬CD
	local TID = TargetID()
	local OID = OwnerID()--使用者	
	local Type = GameObjInfo_Int( 496965, "ColdownType" )
	local time = ReadRoleValue( OID, EM_RoleValue_Coldown_Job + Type  )
	
	local less = {	[496966] = 25, 
					[496967] = 10 }	
	local MID = ReadRoleValue( OID, EM_RoleValue_SpellMagicID )--讀取技能	
	
	if less[MID] ~= nil and time > less[MID] then
		WriteRoleValue( OID, EM_RoleValue_Coldown_Job + Type , time - less[MID] )
	elseif less[MID] ~= nil then
		WriteRoleValue( OID, EM_RoleValue_Coldown_Job + Type , 0 )
	end
	Hide(TID)
end

--===============================================================================--

--================================== Skill 8 ====================================--

function Lua_Zone13_PE02_HealHunter()--確認獵人
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者

	if DW_CheckMap( OID, Zone13_PE02_Var["MapID"] ) == true then	
		if TID == OID or ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105222 then
			return true
		end
		
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
		return false
	end
	
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end
	
function Lua_Zone13_PE02_CheckHunter()--擊殺
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105222 then
		ks_QuestKill( OID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
		AddBuff( OID, 508676, 0, 10 )
	end
	return true
end

function Lua_Zone13_PE02_ExpShare()--經驗分享
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Obj = SearchRangeNPC( OID, 80 ) --TargetID()	
	
	for i= 0, table.getn(Obj) do
		if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 105222 then
			ks_QuestKill( OID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			return true
		end
	end	
	return false
end

function Lua_Zone13_PE02_Ice()--冰神
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.17 then
		ks_QuestKill( OID, 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	end
	return true
end

--===============================================================================--

function Lua_Zone13_PE02_Reset()--重生
	sleep(10)
	Hide(OwnerID())
end

function Lua_Zone13_PE02_Born01()--獵人出生
	local OID = OwnerID()
	ks_ResetRegValue()--暫存值重置
	SetFlag( OID, 544801, 1 )--關閉帕奇鼠
	Zone13_PE02_Var["FriendlyNum"] = Zone13_PE02_Var["FriendlyNum"] + 1
	SetPlot( OID, "DEAD", "Lua_Zone13_PE02_Dead01", 0 )--死亡劇情
	
	if Zone13_PE02_Phase == 3 and Zone13_PE02_Var["FriendlyNum"] < 100 and GetModeEx( OID, EM_SetModeType_Revive ) == true then
		local Friendly = Zone13_PE02_Var["Friendly"]
		local Obj = LuaFunc_CreateObjByObj( Friendly[rand(table.getn(Friendly))+1], OID )
		Zone13_PE02_Follow[Obj] = OID
		SetFollow( Obj, OID )
	end
end

function Lua_Zone13_PE02_Born02()--蛇類出生
	local OID = OwnerID()
	DebugLog(2,"ScriptSource:Lua_Zone13_PE02_Born02>>DBID:"..ReadRoleValue(OID,EM_RoleValue_DBID)..">>OrgID:"..ReadRoleValue(OID,EM_RoleValue_OrgID));
	ks_ResetRegValue()--暫存值重置
	SetFlag( OID, 544801, 1 )--關閉帕奇鼠
	Zone13_PE02_Var["EnemyNum"] = Zone13_PE02_Var["EnemyNum"] + 1
	SetPlot( OID, "DEAD", "Lua_Zone13_PE02_Dead02", 0 )--死亡劇情
	
	if Zone13_PE02_Phase == 1 and Zone13_PE02_Var["EnemyNum"] < 100 and GetModeEx( OID, EM_SetModeType_Revive ) == true then
		local Enemy = Zone13_PE02_Var["Enemy"]
		local Obj = LuaFunc_CreateObjByObj( Enemy[rand(table.getn(Enemy))+1], OID )
		Zone13_PE02_Follow[Obj] = OID
		SetFollow( Obj, OID )
	end
end

function Lua_Zone13_PE02_Dead01()--獵人死亡
	local OID = OwnerID()	
	Zone13_PE02_Var["FriendlyNum"] = Zone13_PE02_Var["FriendlyNum"] - 1
	Hide(OID)
end

function Lua_Zone13_PE02_Dead02()--蛇類死亡
	local OID = OwnerID()
	local TID = TargetID()
	DebugLog(2,"ScriptSource:Lua_Zone13_PE02_Dead02>>DBID:"..ReadRoleValue(OID,EM_RoleValue_DBID)..">>OrgID:"..ReadRoleValue(OID,EM_RoleValue_OrgID)..">>TID's OrgID:"..ReadRoleValue(TID,EM_RoleValue_OrgID));
	local Enemy = Zone13_PE02_Var["Enemy"]	
	Zone13_PE02_Var["EnemyNum"] = Zone13_PE02_Var["EnemyNum"] - 1			
	local Num = HateListCount( OID )
	
	if CheckBuff( TID, 508673 ) == true and Num == 1 then--輕手輕腳
		AddBuff( OID, 508675, 0, -1 )--全屍
	end
	
	for i = 0 , Num-1 do
		Hate = HateListInfo( OID, i, EM_HateListInfoType_GItemID )

		if CheckBuff( Hate, 508674 ) == true and rand(10) < 3 then--必爾汀契約
			ks_QuestKill( ReadRoleValue( Hate, EM_RoleValue_Register2 ), 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			AddBuff( OID, 508675, 0, -1 )--全屍
		end
		if ReadRoleValue( Hate, EM_RoleValue_OrgID ) == 105196 then			
			ks_QuestKill( ReadRoleValue( Hate, EM_RoleValue_Register1 ), 105221, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			DelObj(Hate)
		end		
	end
	if KS_CheckBuffLV( TID, 508670 ) >= 3 and CheckBuff( OID, 508679 ) ~= true then
		KS_ClearBuffLV( TID, 508670, 3 )
		AddBuff( OID, 508679, 0, -1 )--無法活捉
		return false
	end
end

function Lua_Zone13_PE02_Test01()
	local OID = OwnerID()
	Say( OID, "Zone13_PE02_Phase = "..Zone13_PE02_Phase )
	Say( OID, " EnemyNum = "..Zone13_PE02_Var["EnemyNum"] .."; FriendlyNum = "..Zone13_PE02_Var["FriendlyNum"] )	
end