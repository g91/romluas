
--================================== Init ====================================--

function Lua_Zone14_PE02_GlobalSet()--變數宣告
	Zone14_PE02_PEIndex = 1402
	Zone14_PE02_PHIndex = 100
	
	Zone14_PE02_Team = {}
	
	Zone14_PE02_Var = {}
	Zone14_PE02_Var["MapID"] = 422

	Zone14_PE02_Var["EnemyID"] = {	105395,
						105396,
						105397,
						105398
					}
					
	Zone14_PE02_Var["TeamID"] = {	105330,
						105392,
						105393,
						105394
						}
					
	Zone14_PE02_Var["HorseID"] = 117528		--走失的馬
	Zone14_PE02_Var["ForageID"] = 117529	--糧草
	Zone14_PE02_Var["CarID"] = 105329		--車
	Zone14_PE02_Var["CarHorseID"] = 105401	--拉車的馬
	Zone14_PE02_Var["DeadID"] = 117530		--屍體
	Zone14_PE02_Var["InjuriesID"] = 117534	--重傷者
	Zone14_PE02_Var["BombID"] = 117533 	--炸彈	
	
	Zone14_PE02_Var["FlagID"] = 780657 -- 旗標號碼
	Zone14_PE02_Var["Ctrl"] = 0
	Zone14_PE02_Var["Car"] = 0
end

function Lua_ZONE14_PE02_PESet()--PE功能
	local PE_Name = "SC_PE_ZONE14_02_NAME"					-- 哀鳴森林穿越戰
	local PE_Desc = "SC_PE_ZONE14_02_DESC"					-- 哀鳴森林是一道狹長的地形，但是這狹長區域卻遍布殭屍，使這裡成為危險的死亡地形......
	
	local PEIndex = ZONE14_PE02_PEIndex	
	local PHIndex = ZONE14_PE02_PHIndex
	local MapID = ZONE14_PE02_Var["MapID"]
	local TestID = 1
	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- 新增一個事件
	PE_AddRegion( PEIndex , MapID )					-- 把PE放進實際分區
	PE_AddRegion( PEIndex , TestID )					-- 把PE放進測試區
			
	local PH_Name = "SC_PE_ZONE14_02_PH1_NAME"	--明知山有虎	
	local PH_Desc = "SC_PE_ZONE14_02_PH1_DESC"	--如果不將支援向前運送，前線的先驅者就會陷入困境，所以就算知道森林裡滿是殭屍，冒險者還是得朝森林的另一頭衝去！
					
	PE_AddPhase( PEIndex , PHIndex , PH_Name, PH_Desc, 0 , 1 , 1 , 0 )	
	PE_PH_AddObjective_Equal( PEIndex , PHIndex, PHIndex, "", "", "ZONE14_PE02_Value" , 0, 1,  true )	
	PE_OB_SetVisible( PEIndex, PHIndex, PHIndex, false )--隱藏條件
	
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_ZONE14_PE02_Leave" )--離開區域
		
	PE_SetScoreVisible( PEIndex, false )--不顯示積分	
			
	-- 事件啟動
	PE_Start( PEIndex , PHIndex )
end

function Lua_ZONE14_PE02_Leave( PEIndex, Player )--離開區域

end

--================================== Type ====================================--

function Lua_Zone14_PE02_CheckMap( Type )
	local OID = OwnerID()--使用者
	if DW_CheckMap( OID, Zone14_PE02_Var["MapID"] ) == true then
		return true		
	end	
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end

function Lua_Zone14_PE02_Check01()--殭屍/冒險者
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	local TeamID = Zone14_PE02_Var["TeamID"]
	
	for i=1, table.getn(EnemyID) do
		local ObjID = ReadRoleValue( TID, EM_RoleValue_OrgID )
		if ObjID == EnemyID[i] or ObjID == TeamID[i] then
			return true
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE02_Check02( Type )--殭屍
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	local ObjID = ReadRoleValue( TID, EM_RoleValue_OrgID )
	
	for i=1, table.getn(EnemyID) do		
		if ObjID == EnemyID[i] then
			return true
		end
	end
	if Type == nil then
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
		return false
	end
	return false
end

function Lua_Zone14_PE02_Check03( Type )--冒險者
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local TeamID = Zone14_PE02_Var["TeamID"]
	local ObjID = ReadRoleValue( TID, EM_RoleValue_OrgID )
	
	for i=1, table.getn(TeamID) do		
		if ObjID == TeamID[i] then
			return true
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE02_Check04()--冒險者/推車/玩家
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local TeamID = Zone14_PE02_Var["TeamID"]
	local CarID = Zone14_PE02_Var["CarID"]
	for i=1, table.getn(TeamID) do
		local ObjID = ReadRoleValue( TID, EM_RoleValue_OrgID )
		if ObjID == TeamID[i] or ObjID == CarID or TID == OID then	
			return true
		end
	end

	return false	
end

function Lua_Zone14_PE02_CheckCar()--車子
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if TID == Zone14_PE02_Var["Car"] then
		return true
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end	

function Lua_Zone14_PE02_CheckHorse()--馬
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Zone14_PE02_Var["HorseID"] then
		if ReadRoleValue( OID, EM_RoleValue_Register3 ) < 5 then
			return true
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_MAX]" , 0 )--最大數量
		return false		
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false	
end

function Lua_Zone14_PE02_CheckForage()--糧草
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Zone14_PE02_Var["ForageID"] then
		return true
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false	
end

function Lua_Zone14_PE02_CheckDead()--屍體
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Zone14_PE02_Var["DeadID"] then
		return true
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false	
end

function Lua_Zone14_PE02_CheckInjuries()--重傷者
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Zone14_PE02_Var["InjuriesID"] then
		if CheckAttachAble( OID ) == true and ReadRoleValue( OID, EM_RoleValue_Register2 ) == 0 then
			return true
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_MAX]" , 0 )--最大數量
		return false
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false	
end

function Lua_Zone14_PE02_CheckNPC( Type )--檢查任務NPC
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID )
	
	if OrgID == 117448 or OrgID == 117480 then
		if Type == 0 or Type == nil then--馬用
			if ReadRoleValue( OID, EM_RoleValue_Register3 ) > 0 then
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_NULL]" , 0 )--數量不足
			return false
		elseif Type == 1 then
			if ReadRoleValue( OID, EM_RoleValue_Register2 ) ~= 0 then
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_HELP]" , 0 )--尚未救人
			return false			
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

--================================== Skill 01 ====================================--

function Lua_Zone14_PE02_Skill01Type01()--殭屍
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	for i=1, table.getn(EnemyID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == EnemyID[i] then
			if ( ReadRoleValue( TID, EM_RoleValue_HP ) - ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.3 ) <= 0 then
				ks_QuestKill( OID, 105399, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			else
				ks_QuestKill( OID, 105399, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			end
			return true
		end
	end

	return false
end

function Lua_Zone14_PE02_Skill01Type02()--冒險者
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local TeamID = Zone14_PE02_Var["TeamID"]
	for i=1, table.getn(TeamID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == TeamID[i] then
			ks_QuestKill( OID, 105399, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			return true
		end
	end

	return false
end

function Lua_Zone14_PE02_CheckDefence()--守禦的目的
	local OID = OwnerID()--使用者
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	local TeamID = Zone14_PE02_Var["TeamID"]
	local EnemyNum = 0
	local TeamNum = 0
	
	local Obj = SearchRangeNPC ( OID, 100 )
	for i=0, table.getn(obj)-1 do
		local ObjID = ReadRoleValue( Obj[i], EM_RoleValue_OrgID )
		for j=1, table.getn(EnemyID) do
			if ObjID == EnemyID[j] then
				EnemyNum = EnemyNum + 1
				KillID( OID, Obj[i] )
			elseif ObjID == TeamID[j] then
				TeamNum = TeamNum + 1
			end
		end
	end
	if TeamNum ~= 0 and EnemyNum > TeamNum then
		ks_QuestKill( OID, 105399, TeamNum )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	end
end

--==================================Skill 02  ====================================--

function Lua_Zone14_PE02_Legend()--傳說效應
	local Team = Zone14_PE02_Team	
	for i=1, table.getn(Team) do
		if CheckID(Team[i])== true then
			AddBuff( Team[i], 509370, 0, 10 )
		end
	end
	AddBuff( Zone14_PE02_Var["Car"], 509370, 0, 10 )
	ks_QuestKill( OwnerID(), 105399, 2 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
end

--==================================Skill 03  ====================================--

function Lua_Zone14_PE02_ClearReg()--清除暫存
	local OID = OwnerID()
	WriteRoleValue( OID, EM_RoleValue_Register1, 0 )--打殭屍數量
	WriteRoleValue( OID, EM_RoleValue_Register2, 0 )--救人
	WriteRoleValue( OID, EM_RoleValue_Register3, 0 )--抓馬
	AddBuff( OID, 509379, 0, 1 )--解除騎乘
end

function Lua_Zone14_PE02_ClearReg2()--清除暫存
	local OID = OwnerID()
	local Injuries = ReadRoleValue( OID, EM_RoleValue_Register2 )
	if Injuries ~= 0 then--救人
		DelObj( Injuries )
		WriteRoleValue( OID, EM_RoleValue_Register2, 0 )
	end
end

function Lua_Zone14_PE02_CatchHorse()--抓馬
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local X = ReadRoleValue( TID, EM_RoleValue_X )
	local Y = ReadRoleValue( TID, EM_RoleValue_Y )
	local Z = ReadRoleValue( TID, EM_RoleValue_Z )
	
	local Horse = CreateObj( Zone14_PE02_Var["HorseID"], X, Y, Z, 0, 1 )
	AddToPartition( Horse, 0 )
	WriteRoleValue( Horse, EM_RoleValue_Register1, OID )
	WriteRoleValue( Horse, EM_RoleValue_IsWalk, 0 )
	WriteRoleValue( OID, EM_RoleValue_Register3, ReadRoleValue( OID, EM_RoleValue_Register3 )+1 )--馬匹數量
	ks_ActorMode( Horse, true )--設定演戲用NPC
	SysCastSpellLv( Horse, OID, 497284, 0 )
	AddBuff( Horse, 506984, 0, -1 )--加速30%
	BeginPlot( Horse, "Lua_Zone14_PE02_HorseRun", 0 )
	Hide( TID )
	KillID( TID, TID )
end

function Lua_Zone14_PE02_HorseRun()--馬兒跑
	local  OID = OwnerID()
	local master = ReadRoleValue( OID, EM_RoleValue_Register1 )
	while true do
		if CheckID( master ) == true and CheckBuff( master, 509119 ) == true 
			and ReadRoleValue( master, EM_RoleValue_Register3 ) > 0 
			and ReadRoleValue( master, EM_RoleValue_IsDead ) ~= 1 
			and DW_CheckMap( master, Zone14_PE02_Var["MapID"] ) == true then
			SetFollow( OID, master )
		else
			WriteRoleValue( master, EM_RoleValue_Register3, 0 )
			MagicInterrupt( OID )
			sleep(10)
			DelObj(OID)
		end
		sleep(20)
	end
end

function Lua_Zone14_PE02_HorseBye()--馬兒掰
	local OID = OwnerID()
	local Num = ReadRoleValue( OID, EM_RoleValue_Register3 )
	if Num > 0 then
		WriteRoleValue( OID, EM_RoleValue_Register3, 0 )
		ks_QuestKill( OID, 105399, Num )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	end
end

function Lua_Zone14_PE02_CheckHorseNum()--快速替換檢查
	local OID = OwnerID()--使用者
	if TargetID() == Zone14_PE02_Var["Car"] then
		if ReadRoleValue( OID, EM_RoleValue_Register3 ) > 0 then
			return true
		end
		local HorseID = Zone14_PE02_Var["HorseID"]
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_NULL]" , 0 )--數量不足
		return false
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end

function Lua_Zone14_PE02_CheckFast()--快速替換
	local OID = OwnerID()
	local Num = ReadRoleValue( OID, EM_RoleValue_Register3 )
	local Team = Zone14_PE02_Team
	for i=1, table.getn(Team) do
		if CheckID(Team[i])== true then
			AddBuff( Team[i], 509324, 0, Num*2 )
		end
	end
	AddBuff( Zone14_PE02_Var["Car"], 509324, 0, Num*2 )
	ks_QuestKill( OwnerID(), 105399, Num )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )		
end

--==================================Skill 04  ====================================--

function Lua_Zone14_PE02_SetBomb()--放炸彈
	local OID = OwnerID()
	local dis = 30
	local X = ReadRoleValue( OID, EM_RoleValue_X )
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local Z = ReadRoleValue( OID, EM_RoleValue_Z )
	local Dir = ReadRoleValue( OID, EM_RoleValue_Dir )+180
	local PD = Dir*math.pi/180

	X = X+dis/2*math.cos(PD)
	Z = Z-dis/2*math.sin(PD)
	local Bomb = CreateObj( Zone14_PE02_Var["BombID"], X, Y, Z, 0, 1 )
	ks_ActorMode(Bomb, true )
	AddToPartition( Bomb, 0 )
	WriteRoleValue( Bomb, EM_RoleValue_Register1, OID )
	BeginPlot( Bomb, "Lua_Zone14_PE02_Bomb", 0 )
end

function Lua_Zone14_PE02_Bomb()--炸彈爆炸
	local OID = OwnerID()
	local master = ReadRoleValue( OID, EM_RoleValue_Register1 )
	for i=1, 3 do
		ScriptMessage( master, master, 0 , (4-i ).."......", 0 )--最大數量
		sleep(5)
	end
	SysCastSpellLv( OID, OID, 497286, 0 )--特效用
	SysCastSpellLv( master, master, 497122, 0 )--傷害用
	Sleep(10)
	DelObj(OID)
end

function Lua_Zone14_PE02_BombKill()--炸彈殺人了
	local TID = TargetID()--目標
	local master = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	--Say( TID, "HI")
	for i=1, table.getn(EnemyID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == EnemyID[i] then
			local count = ReadRoleValue( master, EM_RoleValue_Register1 )
			if count == 1 then
				ks_QuestKill( master, 105399, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
				WriteRoleValue( master, EM_RoleValue_Register1, 0 ) 
			else
				WriteRoleValue( master, EM_RoleValue_Register1, count+1 )
			end
			return true
		end
	end
	
	return false
end

--==================================Skill 05  ====================================--

function Lua_Zone14_PE02_HelpInjuries()--救人
	local OID = OwnerID()
	local TID = TargetID()
	local obj = CreateObj( ReadRoleValue( TID, EM_RoleValue_OrgID ), ReadRoleValue( TID, EM_RoleValue_X ), ReadRoleValue( TID, EM_RoleValue_Y ), ReadRoleValue( TID, EM_RoleValue_Z ), 0, 1 )
	WriteRoleValue( OID, EM_RoleValue_Register2, obj )
	WriteRoleValue( obj, EM_RoleValue_Register2, OID )
	AddToPartition( obj, 0 )
	CallPlot( obj, "Lua_Zone14_PE02_CheckHelpInjuries", 0 )
	ks_ActorMode( obj, true )--設定演戲用NPC
	AttachObj( obj, OID, 2,  "" , "" )
	Hide(TID)
	KillID( TID, TID )
end

function Lua_Zone14_PE02_CheckHelpInjuries()--檢查救人
	local OID = OwnerID();
	local master = ReadRoleValue( OID, EM_RoleValue_Register2 )
	while true do
		if CheckBuff( master, 509133 ) ~= true then
			DelObj( OID)
		end
		sleep(30)
	end
end

function Lua_Zone14_PE02_InjuriesBye()--放人
	local OID = OwnerID()
	local obj = ReadRoleValue( OID, EM_RoleValue_Register2 )
	DetachObj(  obj )
	ks_QuestKill( OID, 105399, 5 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	WriteRoleValue( OID, EM_RoleValue_Register2, 0 )
	DelObj( Obj )
end

function Lua_Zone14_PE02_HumanUse()--人的利用
	local TID = TargetID()--目標
	local OID = OwnerID()--使用者
	local Obj = ReadRoleValue( OID, EM_RoleValue_Register2 )
	if Obj ~= 0 then
		if TID == Zone14_PE02_Var["Car"] then
			if ReadRoleValue( Zone14_PE02_Var["Ctrl"], EM_RoleValue_Register1 ) > 0 then
				WriteRoleValue( OID, EM_RoleValue_Register2, 0 )
				ks_QuestKill( OID, 105399, 5 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
				DelObj(Obj)
				AddBuff( TID, 509375, 0, -1 )--充分利用
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SYS_CANOT_DO_IT]" , 0 )--還不能這麼做
			return false
		end		
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--目標錯誤
		return false
	end
	ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_HELP]" , 0 )--尚未救援冒險者
	return false
end

--==================================Skill 06  ====================================--

function Lua_Zone14_PE02_Forage()--取得糧草	
	local TID = TargetID()
	ks_QuestKill( OwnerID(), 105399, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	Hide( TID )
	KillID( TID, TID )
end

function Lua_Zone14_PE02_Heal()--治療75%
	local OID = OwnerID()
	local TID = TargetID()
	local MaxHP = ReadRoleValue( TID, EM_RoleValue_MaxHP )
	local HP = ReadRoleValue( TID, EM_RoleValue_HP )
	if HP < MaxHP*0.7 then
		ks_QuestKill( OID, 105399, 4 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	end
	WriteRoleValue( TID, EM_RoleValue_HP,  HP+MaxHP*0.75 )
end

--==================================Skill 07  ====================================--

function Lua_Zone14_PE02_Deader()--欺負屍體
	local OID = OwnerID()
	local TID = TargetID()
	local X = ReadRoleValue( TID, EM_RoleValue_X )
	local Y = ReadRoleValue( TID, EM_RoleValue_Y )
	local Z = ReadRoleValue( TID, EM_RoleValue_Z )
	local Dir = ReadRoleValue( TID, EM_RoleValue_Dir )
	
	local Skull =  CreateObj( 117531, X, Y, Z, Dir, 1 )
	AddToPartition( Skull, 0 )
	ks_ActorMode( SKull, true )--設定演戲用NPC
	WriteRoleValue( Skull, EM_RoleValue_LiveTime, 10 )
	ks_QuestKill( OID, 105399, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	Hide(TID)
	KillID( TID, TID )
end

function Lua_Zone14_PE02_Power()--激勵
	ks_QuestKill( OwnerID(), 105399, 3 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )		
end

--================================== 車隊 ====================================--

function Lua_Zone14_PE02_CreateTeamCtrl()--創造冒險隊中控
	local FlagID = Zone14_PE02_Var["FlagID"]
	local BaseX = GetMoveFlagValue( FlagID, 1, EM_RoleValue_X )--起點
	local BaseY = GetMoveFlagValue( FlagID, 1, EM_RoleValue_Y )--起點
	local BaseZ = GetMoveFlagValue( FlagID, 1, EM_RoleValue_Z )--起點
	local Ctrl = CreateObj( 115053, BaseX, BaseY, BaseZ, 0, 1 )--產生核心
	Zone14_PE02_Var["Ctrl"] = Ctrl
	SetModeEx( Ctrl, EM_SetModeType_Mark, false )--標記
	SetModeEx( Ctrl, EM_SetModeType_Fight, false )--砍殺
	SetModeEx( Ctrl, EM_SetModeType_Show, false )--顯示
	WriteRoleValue( Ctrl, EM_RoleValue_PID, 0 )--初始值(車子沒掛)
	AddToPartition( Ctrl, 0 )
	CallPlot( Ctrl, "Lua_Zone14_PE02_CreateTeam", 0 )--創造車隊
end

function Lua_Zone14_PE02_CreateTeam()--創造冒險隊中控
	local Ctrl = OwnerID()
	local CtrlX = ReadRoleValue( Ctrl, EM_RoleValue_X )
	local CtrlY = ReadRoleValue( Ctrl, EM_RoleValue_Y )
	local CtrlZ = ReadRoleValue( Ctrl, EM_RoleValue_Z )
	local TeamCtrl = CreateObj( 115053, CtrlX, CtrlY, CtrlZ, 0, 1 )--產生核心
	WriteRoleValue( TeamCtrl, EM_RoleValue_IsWalk, 0 )
	MoveToFlagEnabled( TeamCtrl, false )
	SetModeEx( TeamCtrl, EM_SetModeType_Mark, false )--標記
	SetModeEx( TeamCtrl, EM_SetModeType_Fight, false )--砍殺
	SetModeEx( TeamCtrl, EM_SetModeType_Show, false )--顯示	
	AddToPartition( TeamCtrl, 0 )
	sleep(50)
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )--初始值(車隊死亡數量)
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )--初始值(襲擊死亡數量)
	CallPlot( TeamCtrl, "Lua_Zone14_PE02_TeamCtrlSet", 0 )--產生帶隊中控
end

function Lua_Zone14_PE02_TeamCtrlSet()--設定冒險隊
	local TeamCtrl = OwnerID()
	local Ctrl = Zone14_PE02_Var["Ctrl"]	
	local TeamID = ZONE14_PE02_Var["TeamID"]
	local CarID = Zone14_PE02_Var["CarID"]
	local CarHorseID = Zone14_PE02_Var["CarHorseID"]
	local FlagID = Zone14_PE02_Var["FlagID"]
	local Goal = GetMoveFlagCount( FlagID )-1
	local Site = 1
	local CheckRange = 35
	local Range = 50
	local CheckDis = 700
	local FlagX = GetMoveFlagValue( FlagID , Site , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( FlagID , Site , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( FlagID , Site , EM_RoleValue_Z )	
	local RoomID = ReadRoleValue( TeamCtrl, EM_RoleValue_RoomID )
	local Team = Zone14_PE02_Team
	local TeamNum = table.getn(TeamID)
	local Attack = false
	local AttackSite = Rand(Goal-2)+2
	DebugMsg(0,0,"AttackSite = "..AttackSite)
	
	local Horse = CreateObj( CarHorseID, FlagX, FlagY, FlagZ, 0, 1 )
	WriteRoleValue( Horse, EM_RoleValue_IsWalk, 0 )
	SetModeEx( Horse, EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Horse, EM_SetModeType_Fight , false )		-- 可砍殺攻擊
	SetModeEx( Horse, EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Horse, EM_SetModeType_ShowRoleHead , false )	-- 頭像框
	SetModeEx( Horse, EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( Horse, EM_SetModeType_HideName , true )	-- 名稱
	MoveToFlagEnabled( Horse, false )
	AddToPartition( Horse, RoomID )
	FaceFlag( Horse, FlagID, 2 )
	WriteRoleValue( Horse, EM_RoleValue_PassengerAttackable, 1 )--搭乘載具者可被砍殺
	AddBuff( Horse, 506984, 0, -1 )--加速30%
	
	local Car = LuaFunc_CreateObjByObj( CarID, Horse )
	Zone14_PE02_Var["Car"] = Car
	WriteRoleValue( Car, EM_RoleValue_IsWalk, 0 )
	SetModeEx( Car, EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Car, EM_SetModeType_Strikback , true )	-- 反擊
	SetModeEx( Car, EM_SetModeType_ShowRoleHead , true )	-- 頭像框
	SetModeEx( Car, EM_SetModeType_Fight , true )		-- 可砍殺攻擊
	SetModeEx( Car, EM_SetModeType_Mark , true )		-- 標記
	MoveToFlagEnabled( Car, false )
	
	WriteRoleValue( Car, EM_RoleValue_Register1, Horse )
	WriteRoleValue( Car, EM_RoleValue_Register2, TeamCtrl )
	SetPlot( Car, "dead", "Lua_Zone14_PE02_CarDead", 0 )
	SetFlag( Car, 544801, 1 )--關閉帕奇鼠
	AddBuff( Car, 507514, 0, -1 )--免疫治療
	AddBuff( Car, 506984, 0, -1 )--加速30%
	AddBuff( Car, 502707, 0, -1 )--不會回血
	AddBuff( Car, 504113, 0, -1 )--無法反擊
	AttachObj( Car , Horse , 0 ,"p_hit_point02","p_hit_point01" )
	--AttachObj( Car , Horse , 0 ,"p_down","p_top" )
			
	AddBuff( TeamCtrl, 506984, 0, -1 )--加速30%
	
	local TransCarDir = ReadRoleValue( TeamCtrl, EM_RoleValue_Dir )
	local TransTeamPosition = Lua_Zone14_PE02_FormationPosition( FlagX , FlagY , FlagZ , Range, TransCarDir )--四角陣型設定區
	
	for i=1, TeamNum do
		Team[i] = CreateObj( TeamID[i] , TransTeamPosition["X"][i], TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] , TransCarDir , 1 )
		WriteRoleValue( Team[i], EM_RoleValue_IsWalk, 0 )
		MoveToFlagEnabled( Team[i], false )		
		AddToPartition( Team[i], RoomID )
		SetFlag( Team[i], 544801, 1 )--關閉帕奇鼠
		AddBuff( Team[i], 509304, 0, -1 )--騎乘30%
		AddBuff( Team[i], 502707, 0, -1 )--不會回血
		SetPlot( Team[i], "dead", "Lua_Zone14_PE02_TeamDead", 0 )
	end
				
	local PreviousDir = TransCarDir

	while true do
		local InFight = false
		
		if CheckBuff( Car, 509375 ) == true then--充份利用
			DebugMsg(0,0,"Human Use OK!!")
			for i=1, TeamNum do
				if CheckID(Team[i]) ~= true then
					Team[i] = CreateObj( TeamID[i] , TransTeamPosition["X"][i], TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] , TransCarDir , 1 )
					WriteRoleValue( Team[i], EM_RoleValue_IsWalk, 0 )
					MoveToFlagEnabled( Team[i], false )
					WriteRoleValue( Team[i], EM_RoleValue_HP, ReadRoleValue( Team[i], EM_RoleValue_MaxHP )*0.45 )
					AddToPartition( Team[i], RoomID )
					SetFlag( Team[i], 544801, 1 )--關閉帕奇鼠
					AddBuff( Team[i], 509304, 0, -1 )--騎乘30%
					AddBuff( Team[i], 502707, 0, -1 )--不會回血
					SetPlot( Team[i], "dead", "Lua_Zone14_PE02_TeamDead", 0 )
					WriteRoleValue( Ctrl, EM_RoleValue_Register1, ReadRoleValue( Ctrl, EM_RoleValue_Register1 )- 1 )
					CancelBuff( Car, 509375 )
					break
				end
			end
		end
		
		for i=1, TeamNum do
			if CheckID(Team[i]) == true then
				if CheckBuff( Team[i], 509370 ) == true then--傳說效應
					SetModeEx( Team[i], EM_SetModeType_Searchenemy , false )	-- 索敵
					SetModeEx( Team[i], EM_SetModeType_Strikback , false )	-- 反擊
					SetStopAttack( Team[i] )  
					ClearHateList( Team[i], -1 )
				else
					SetModeEx( Team[i], EM_SetModeType_Searchenemy , true )	-- 索敵
					SetModeEx( Team[i], EM_SetModeType_Strikback , true )	-- 反擊
					if KS_InCombat(Team[i]) == true or KS_InCombat(Car) == true then
						InFight = true
						local AttackTarget
						local Hate = KS_GetHateList( Car )
						if Hate[1] ~= nil then
							AttackTarget = Hate[1]
						else
							AttackTarget = ReadRoleValue( Team[i], EM_RoleValue_AttackTargetID )
							if AttackTarget == 0 then
								local Hate = KS_GetHateList( Team[i] )
								AttackTarget = Hate[1]
							end
						end
	
						for j=1, TeamNum do
							if CheckID(Team[j]) == true and KS_InCombat(Team[j]) ~= true and AttackTarget ~= nil then
								SysCastSpellLv( AttackTarget, Team[j], 496946, 9 )--製造仇恨
								CancelBuff( Team[j], 509304 )--解除騎乘				
							end
						end				
						StopMove( Horse, true )
						StopMove( TeamCtrl, true )
					end
				end
			end
		end
				
		local TransCarX = ReadRoleValue( TeamCtrl , EM_RoleValue_X )
	 	local TransCarY = ReadRoleValue( TeamCtrl , EM_RoleValue_Y )
	 	local TransCarZ = ReadRoleValue( TeamCtrl , EM_RoleValue_Z )
		TransCarDir = ReadRoleValue( TeamCtrl , EM_RoleValue_Dir )
		local DisX = ( TransCarX - FlagX )^2
		local DisZ = ( TransCarZ - FlagZ )^2
		
		local TeamDead = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
		if math.floor( (DisX+DisZ)^0.5) < CheckRange and InFight == false then	-- 走到定點設定下一點位置
			if Site == Goal then
				for i =1, TeamNum do
					if CheckID( Team[i] ) == true then								
						WriteRoleValue( Team[i] , EM_RoleValue_IsWalk , 1 )
						WriteRoleValue( Team[i], EM_RoleValue_LiveTime, 1 )
						CancelBuff( Team[i], 509304 )
					end
				end
								
				DelObj( Horse )
				DelObj( TeamCtrl )
				DelObj( Car )
				CallPlot( Ctrl, "Lua_Zone14_PE02_CreateTeam", 0 )--重新發車
				return
			else
				if Site == AttackSite and Attack == false then
					Attack = true
					InFight = true
					StopMove( Horse, true )
					StopMove( TeamCtrl, true )
					CallPlot( Ctrl, "Lua_Zone14_PE02_TeamAttack", Horse, Car )--觸發點攻擊
				elseif TeamDead ~= TeamNum then
					Site = Site + 1
					FlagX = GetMoveFlagValue( FlagID , Site , EM_RoleValue_X )
					FlagY = GetMoveFlagValue( FlagID , Site , EM_RoleValue_Y )
					FlagZ = GetMoveFlagValue( FlagID , Site , EM_RoleValue_Z )					
				end
			end
		elseif InFight == false then
			MoveDirect( TeamCtrl , FlagX , FlagY , FlagZ )-- 中控移動
		end

		if TeamDead ~= TeamNum and InFight == false then
			local DeltaDir = math.abs( PreviousDir - TransCarDir )	--轉向處理，看是否需要變化陣型位置
			if DeltaDir > 90 and DeltaDir < 270 then	-- 變化陣型位置
				local tmp = 0
				if Team[1] ~= nil and Team[4] ~= nil then
					tmp = Team[1]
					Team[1] = Team[4]
					Team[4] = tmp
				end
				if Team[2] ~= nil and Team[3] ~= nil then
					tmp = Team[2]
					Team[2] = Team[3]
					Team[3] = tmp
				end
			end
			PreviousDir = TransCarDir

			TransTeamPosition = Lua_Zone14_PE02_FormationPosition( TransCarX , TransCarY , TransCarZ, Range, TransCarDir )--四角陣型設定區
			--[[local DeltaX = ( TransCarX - ReadRoleValue( Horse , EM_RoleValue_X ) )^2
			local DeltaZ = ( TransCarZ - ReadRoleValue( Horse , EM_RoleValue_Z ) )^2
					
			if math.floor( (DeltaX+DeltaZ)^0.5) > CheckDis then	--是否偏離定位
				AddBuff( Horse, 508176, 0, 3 )--加速15%
			end--]]
			MoveDirect( Horse , TransCarX , TransCarY , TransCarZ )	-- 運貨車移動
			
			for i = 1 , TeamNum do
				if Team[i] ~= nil and CheckID( Team[i] ) == true then	-- 是否 NPC 且存在
					if CheckBuff( Team[i], 509304 ) ~= true then
						MoveToFlagEnabled( Team[i], false )
						AddBuff( Team[i], 509304, 0, -1 )--騎乘
					end
					
					--[[DeltaX = ( TransTeamPosition["X"][i] - ReadRoleValue( Team[i] , EM_RoleValue_X ) )^2
					DeltaZ = ( TransTeamPosition["Z"][i] - ReadRoleValue( Team[i] , EM_RoleValue_Z ) )^2
					--Say( Team[i], "Dis = "..math.floor( (DeltaX+DeltaZ)^0.5) )
					if math.floor( (DeltaX+DeltaZ)^0.5) > CheckDis then	--是否偏離定位
						AddBuff( Team[i], 508956, 0, 3 )--加速15%
					end--]]
					MoveDirect( Team[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
				end
			end
		elseif TeamDead == TeamNum then
			return
		elseif GetDistance( Car, Horse ) < 20 then
			local X = ReadRoleValue( Horse , EM_RoleValue_X )
	 		local Y = ReadRoleValue( Horse , EM_RoleValue_Y )
	 		local Z = ReadRoleValue( Horse , EM_RoleValue_Z )
	 		local Dir = ReadRoleValue( Horse , EM_RoleValue_Dir )
	 		
	 		local nDir = Dir-180
	 		if nDir > 360 then nDir = nDir -360
			elseif nDir < 0 then nDir = nDir +360 end
			
	 		local radian = (math.pi/180)*nDir
		 	X = X +(25*math.cos(radian))
		 	Z = Z - (25*math.sin(radian))
	 		SetPos( Car, X, Y, Z, Dir )
		end
		Sleep(10)
	end
end

function Lua_Zone14_PE02_TeamAttack( Horse, Car )--觸發點攻擊
	local Ctrl = OwnerID()
	local X = ReadRoleValue( Horse, EM_RoleValue_X )
	local Y = ReadRoleValue( Horse, EM_RoleValue_Y )
	local Z = ReadRoleValue( Horse, EM_RoleValue_Z )
	local RoomID = ReadRoleValue( Horse, EM_RoleValue_RoomID )
	local Team = Zone14_PE02_Team
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	local TeamNum  = table.getn(Team)
	local MstNum = table.getn(EnemyID)
	local Range = 80
	local obj = {}
	
	for i=1, MstNum do
		obj[i] = CreateObj( EnemyID[i], X-Range*math.cos(math.pi*2*(i/MstNum)), Y, Z+Range*math.sin(math.pi*2*(i/MstNum)), 0, 1 )		
		MoveToFlagEnabled( obj[i], false )
		AddToPartition( obj[i], RoomID )
		SetFlag( obj[i], 544801, 1 )--關閉帕奇鼠
		WriteRoleValue( obj[i], EM_RoleValue_Register4, 1 )--攻擊車隊辨識用
		SetPlot( obj[i], "dead", "Lua_Zone14_PE02_MstDead", 0 )
	end
	
	Sleep(10)
	local MstDead = ReadRoleValue( Ctrl, EM_RoleValue_Register2 )--殭屍死亡數量
	DebugMsg(0,0,"TeamAttack MstDead = "..MstDead)
	while ( MstDead < MstNum and CheckID(Car) == true ) do
		local TeamDead = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )--車隊死亡數量
		MstDead = ReadRoleValue( Ctrl, EM_RoleValue_Register2 )--殭屍死亡數量
		for i=1, MstNum do
			if CheckID( Obj[i] ) == true then		
				MoveDirect( Obj[i], X, Y, Z )
				SysCastSpellLv( Car, Obj[i], 496946, 9 )--製造仇恨
				SysCastSpellLv( Obj[i], Car, 496946, 9 )--製造仇恨
				for i=1, TeamNum do
					if CheckID( Team[i] ) == true then
						MoveDirect( Team[i], X, Y, Z )							
						SysCastSpellLv( Obj[i], Team[i], 496946, 9 )--製造仇恨
						SysCastSpellLv( Team[i], Obj[i], 496946, 9 )--製造仇恨
					end
				end
			end
		end
		sleep(10)
	end
	for i=1, MstNum do
		if CheckID( Obj[i] ) == true then
			DelObj(Obj[i])
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
	DebugMsg(0,0,"TeamAttack End")
end

function Lua_Zone14_PE02_TeamLeave()--車隊消失
	local Car = Zone14_PE02_Var["Car"]
	if CheckID(Car )~= true or ReadRoleValue( Car, EM_RoleValue_IsDead ) == 1 then--車子掛了 車隊消失
		KillID( OwnerID(), OwnerID() )
	end
end

function Lua_Zone14_PE02_TeamDead()--車隊死了
	local Ctrl = Zone14_PE02_Var["Ctrl"]
	local Car = Zone14_PE02_Var["Car"]
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, ReadRoleValue( Ctrl, EM_RoleValue_Register1 )+ 1 )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == table.getn(Zone14_PE02_Team) then
		if CheckID(Car) ~= true  then
			CallPlot( Ctrl, "Lua_Zone14_PE02_CreateTeam", 0 )--重新發車
		else
			CallPlot( Car, "Lua_Zone14_PE02_CheckCombat", 0 )--檢查是否戰鬥中
		end
	end
	DelObj( OwnerID() )
	return true
end

function Lua_Zone14_PE02_CheckCombat()--檢查是否戰鬥中
	local OID = OwnerID()
	while true do
		if CheckBuff( OID, 509136 ) ~= true then
			AddBuff( OID, 509136, 0, -1 )
		else
			Hide(OID)
			KillID( OID, OID )
		end
		sleep(30)
	end
end

function Lua_Zone14_PE02_CarDead()--車子死了
	local OID = OwnerID()	
	local Horse = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local TeamCtrl = ReadRoleValue( OID, EM_RoleValue_Register2 )
	local Team = Zone14_PE02_Team
	DelObj(Horse)
	DelObj(TeamCtrl)
	
	local Ctrl = Zone14_PE02_Var["Ctrl"]
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == table.getn(Team) then		
		CallPlot( Ctrl, "Lua_Zone14_PE02_CreateTeam", 0 )--重新發車
	else
		for i=1, table.getn(Team) do
			if CheckID(Team[i]) == true then
				CallPlot( Team[i], "Lua_Zone14_PE02_CheckCombat", 0 )
			end
		end
	end
	DelObj(OID)
	return true
end

function Lua_Zone14_PE02_FormationPosition( X , Y , Z , Range , Dir )--四角陣型設定區
	local Position = {}
	Position["X"] = {}
	Position["Y"] = {}
	Position["Z"] = {}

	Position["X"][1] = X-Range*math.sin(Dir*math.pi/180+15 )	-- 右前
	Position["Y"][1] = Y
	Position["Z"][1] = Z-Range*math.cos(Dir*math.pi/180+15)

	Position["X"][2] = X+Range*math.sin(Dir*math.pi/180-15)	-- 左前
	Position["Y"][2] = Y
	Position["Z"][2] = Z+Range*math.cos(Dir*math.pi/180-15)

	Position["X"][3] = X-Range*math.sin(Dir*math.pi/180-15)	-- 右後
	Position["Y"][3] = Y
	Position["Z"][3] = Z-Range*math.cos(Dir*math.pi/180-15)

	Position["X"][4] = X+Range*math.sin(Dir*math.pi/180+15)	-- 左後
	Position["Y"][4] = Y
	Position["Z"][4] = Z+Range*math.cos(Dir*math.pi/180+15)

	return Position;
end

--==================================死亡劇情  ====================================--

function Lua_Zone14_PE02_MstSet()--初始劇情
	SetFlag( OwnerID(), 544801, 1 )--關閉帕奇鼠
	SetPlot( OwnerID(), "DEAD", "Lua_Zone14_PE02_MstDead", 0 )
end

function Lua_Zone14_PE02_MstDead()--殭屍死亡
	local OID = OwnerID()
	local Hate = KS_GetHateList( OID )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家)
	if Hate[1] ~= nil and CheckBuff( Hate[1], 509118 ) == true then--獨角獸的眷顧
		local count = ReadRoleValue( Hate[1], EM_RoleValue_Register1 )--被動技記數用
		if count == 2 then
			ks_QuestKill( Hate[1], 105399, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			WriteRoleValue( Hate[1], EM_RoleValue_Register1, 0 ) 
		else
			WriteRoleValue( Hate[1], EM_RoleValue_Register1, count+1 )
		end
	elseif Hate[1] ~= nil and CheckBuff( Hate[1], 509120 ) == true then--洛伊的建議
		local count = ReadRoleValue( Hate[1], EM_RoleValue_Register1 )--被動技記數用
		if count == 1 then
			ks_QuestKill( Hate[1], 105399, 1 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
			WriteRoleValue( Hate[1], EM_RoleValue_Register1, 0 ) 
		else
			WriteRoleValue( Hate[1], EM_RoleValue_Register1, count+1 )
		end	
	end
	
	
	if ReadRoleValue( OID, EM_RoleValue_Register4 ) > 0 then--攻擊車隊
		local Ctrl = Zone14_PE02_Var["Ctrl"]
		WriteRoleValue( Ctrl, EM_RoleValue_Register2, ReadRoleValue( Ctrl, EM_RoleValue_Register2 )+ 1 )
		--DelObj(OwnerID())
		return true
	end
	
	--Hide(OID)
	return true
end

--========================================================================--

function Lua_Zone14PE02_QuestComplete()--完成任務執行
	local Player = TargetID()
	if LuaPE_KS_CleanBuff( Player ) == true then
		local BuffID = 509378
		local Buff = ReadRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2 )
		
		if CheckBuff( Player, Buff ) == true and Buff ~= BuffID then
			CancelBuff( Player, Buff )
			WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			DebugMsg(0,0,"14PE02 QuestFin Count = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
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

--========================================================================--