--小怪移動控制
function Cl_Monster_WarkInFlag( Flag)
	local MonsterAI = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( MonsterAI , EM_RoleValue_RoomID ) 	----紀錄讀取到的層數
	local ctarlAI = ReadRoleValue( MonsterAI , EM_RoleValue_Register1 ) 	----R1裝ctarlAI
	local flag_Num = ReadRoleValue( MonsterAI , EM_RoleValue_Register6 ) --boss死了幾隻
	local flagID = {}
		flagID[0] = 30
		flagID[1] = 20
		flagID[2] = 10
		flagID[3] = 0
	local flag_Tabld = {}
		flag_Tabld[1] = 781071
		flag_Tabld[2] = 781072
	CallPlot( MonsterAI, "CL_Monster_FightOut", RoomID )
	--每秒判定自己走到哪了
	while 1 do
		sleep ( 10 )
		if ReadRoleValue( MonsterAI , EM_RoleValue_Register1 ) == 0 then 
			if flagID[flag_Num] <= 39 then
				flagID[flag_Num] = flagID[flag_Num] + 1
				MoveToFlagEnabled(MonsterAI, false) 
				WriteRoleValue(  MonsterAI,EM_RoleValue_IsWalk,0)
				Hide(MonsterAI)
				Show( MonsterAI,RoomID )
				LuaFunc_MoveToFlag ( MonsterAI , flag_Tabld[Flag] , flagID[flag_Num] , 0 )
			elseif flagID[flag_Num] >= 40 then
				delobj ( MonsterAI )
			end
		elseif ReadRoleValue( MonsterAI , EM_RoleValue_Register1 ) == 1 then
			StopMove( MonsterAI , false )
		end
	end
end
function CL_Monster_FightOut( RoomID )
	local MonsterAI = OwnerID()
	local ctarlAI = ReadRoleValue( MonsterAI , EM_RoleValue_Register1 ) ----紀錄讀取到的層數
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 20 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end
	local Npc_Table = {}
		Npc_Table[1] = 106592
		Npc_Table[2] = 106593
		Npc_Table[3] = 106594
		Npc_Table[4] = 106642
		Npc_Table[5] = 106643
		Npc_Table[6] = 106644
		Npc_Table[7] = 106645
	local ObjMatrix ={}
	local Npc_Num = DW_Rand(7)
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix( Npc_Table[Npc_Num] , Matrix , 1 , 0 )
	Cl_Monster_MoveFlag ( ObjMatrix[1] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,2,-1)
	Cl_Monster_MoveFlag ( ObjMatrix[2] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,2,1)
	Cl_Monster_MoveFlag ( ObjMatrix[3] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,3,1)
	Cl_Monster_MoveFlag ( ObjMatrix[4] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,3,0)
	Cl_Monster_MoveFlag ( ObjMatrix[5] , RoomID , MonsterAI , ctarlAI )
	Npc_Num = DW_Rand(7)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(Npc_Table[Npc_Num],Matrix,3,-1)
	Cl_Monster_MoveFlag ( ObjMatrix[6] , RoomID , MonsterAI , ctarlAI )
	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "CL_Monster_CallFun" , 0 )
end
function CL_Monster_CallFun()
	sleep( 10 )
	BeginPlot( OwnerID() , "CL_Monster_FightOut" , 0 )
end
function CL_Monster_FightIn()
	local Monster = OwnerID() ----我叫做AI
	local MoveAI = ReadRoleValue ( Monster , EM_RoleValue_Register1 )
	local ctarlAI = ReadRoleValue ( Monster , EM_RoleValue_Register2 )
	SetPlot( Monster, "dead", "CL_Monster_IsDead" , 0 )
	while 1 do
		sleep ( 10 )
		if HateListCount( Monster ) ~= 0 then ---如果仇恨表內有人就繼續戰鬥
			WriteRoleValue ( MoveAI , EM_RoleValue_Register1 , 1 ) ---
			SetModeEx( Monster , EM_SetModeType_Move , true ) ---移動	(否)
		elseif HateListCount( Monster ) == 0 then ---如果仇恨表內有人就繼續戰鬥
			if CheckID( MoveAI )  ~= true then
				local Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
				WriteRoleValue(  ctarlAI , EM_RoleValue_Register5 , Monster_Num-1 )		
				delobj ( Monster )
			end
			WriteRoleValue ( MoveAI , EM_RoleValue_Register1 , 0 ) ---
		end
		if ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 1 then
			SetModeEx( Monster , EM_SetModeType_Move , false ) ---移動	(否)
		elseif ReadRoleValue ( ctarlAI , EM_RoleValue_Register1 ) == 0 then
			SetModeEx( Monster , EM_SetModeType_Move , true ) ---移動	(否)
		end
	end
end
function Cl_Monster_MoveFlag( ObjID, RoomID , MoveAI , ctarlAI )
	WriteRoleValue(  ObjID , EM_RoleValue_IsWalk , 0 )
	Hide(ObjID)
	Show(ObjID,RoomID)
	MoveToFlagEnabled( ObjID, false) ---系統內建的路徑關掉
	WriteRoleValue ( ObjID , EM_RoleValue_Register1 , MoveAI ) ---
	WriteRoleValue(  ObjID , EM_RoleValue_Register2 , ctarlAI )
	local Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 ) 
	WriteRoleValue(  ctarlAI , EM_RoleValue_Register5 , Monster_Num+1 )
	CallPlot( ObjID , "CL_Monster_FightIn", 0 )
end
function CL_Monster_IsDead()
	local Monster = OwnerID() ----我叫做AI
	local MoveAI = ReadRoleValue ( Monster , EM_RoleValue_Register1 )
	local ctarlAI = ReadRoleValue ( Monster , EM_RoleValue_Register2 )
	local Monster_Num = ReadRoleValue ( ctarlAI , EM_RoleValue_Register5 )
	WriteRoleValue(  ctarlAI , EM_RoleValue_Register5 , Monster_Num-1 )
end
function Cl_ACWB_MonsterAI_Dead()
	local MonsterAI = OwnerID()
	local RoomID = ReadRoleValue( MonsterAI , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ( MonsterAI )
	local HideBall = Cl_CreateObj_ForHideBall( 106647 , Npc_X , Npc_Y , Npc_Z , RoomID ) ----產生透明球專用
	WriteRoleValue( HideBall , EM_RoleValue_Livetime, 3 )  --存活時間
	CastSpelllv ( HideBall , HideBall , 499024 , 7 ) 
end
function Cl_Z194_MonsterAI()
	local MonsterAI = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( MonsterAI , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local ctarlAI = ReadRoleValue( MonsterAI , EM_RoleValue_PID ) ----紀錄讀取到的層數
	local AttackTarget = 0
	local Pose_Flag = 0
	local CombatBegin = 0
	local Old_X = ReadRoleValue ( MonsterAI , EM_RoleValue_X)
	local Old_Y = ReadRoleValue ( MonsterAI , EM_RoleValue_Y)
	local Old_Z = ReadRoleValue ( MonsterAI , EM_RoleValue_Z)
	Cl_Z22_PlayMotion()
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( MonsterAI , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( MonsterAI ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				Cl_Z22_OpenFlag(1)
				if ReadRoleValue ( MonsterAI , EM_RoleValue_Register1 ) == 1 then
					PlayMotion ( MonsterAI , ruFUSION_ACTORSTATE_SLEEP_END )
					sleep ( 10 )
					SetIdleMotion( MonsterAI , ruFUSION_ACTORSTATE_NORMAL )----------------------維持動作 
					WriteRoleValue( MonsterAI , EM_RoleValue_Register1 , 0 )  --存活時間d
				end
				CombatBegin = 1
			end
		elseif HateListCount( MonsterAI ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 0
			end
		end
	end
end