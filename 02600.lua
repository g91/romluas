function Cl_Z22_MonsterAI_106446()
	local OwnerID = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local ctarlAI = ReadRoleValue( OwnerID , EM_RoleValue_PID ) ----紀錄讀取到的層數
	local AttackTarget = 0
	local Pose_Flag = 0
	local CombatBegin = 0
	local Old_X = ReadRoleValue ( OwnerID , EM_RoleValue_X)
	local Old_Y = ReadRoleValue ( OwnerID , EM_RoleValue_Y)
	local Old_Z = ReadRoleValue ( OwnerID , EM_RoleValue_Z)
	Cl_Z22_PlayMotion()
	if ReadRoleValue ( OwnerID , EM_RoleValue_OrgID ) == 106446 or
		ReadRoleValue ( OwnerID , EM_RoleValue_OrgID ) == 106757 then
		local Rand_Pose = DW_Rand(100)
		if ( Rand_Pose >= 1 and Rand_Pose <= 10) or( Rand_Pose >=21 and Rand_Pose <= 30 ) or
		   ( Rand_Pose >= 41 and Rand_Pose <= 50 ) or ( Rand_Pose >= 61 and Rand_Pose <= 70 ) or
		   ( Rand_Pose >= 81 and Rand_Pose <= 90 ) then      ------------>當隨機出來的值等於以上的亂數就施放第一招
		   SetModeEx( OwnerID , EM_SetModeType_Searchenemy , false )--索敵(否)
		end
	end
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				Cl_Z22_OpenFlag(1)
				if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 1 then
					PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_END )
					sleep ( 10 )
					SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_NORMAL )----------------------維持動作 
					WriteRoleValue( OwnerID , EM_RoleValue_Register1 , 0 )  --存活時間d
				end
				CombatBegin = 1
			end
		elseif HateListCount( OwnerID ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 0
			end
		end
	end
end
function Cl_CheckBuff621362()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( TargetID , 621362 ) == true and
		ReadRoleValue ( TargetID , EM_RoleValue_VOC ) ~= 0 then
		return true
	elseif CheckBuff( TargetID , 621362 ) == false or
		ReadRoleValue ( TargetID , EM_RoleValue_VOC ) == 0 then
		return false
	end
end
function Cl_MonsterSkill_498847()
	local OwnerID = OwnerID()
	local OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Npc_Table = {}
	if ZoneID == 144 then
		Npc_Table[106431] = 106622
		Npc_Table[106432] = 106623
	elseif ZoneID == 145 then
		Npc_Table[106751] = 106760
		Npc_Table[106752] = 106761
	end
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(OwnerID)
	local HideBall = Cl_CreateObj_ForHideBall( Npc_Table[OrgID] , Npc_X , Npc_Y , Npc_Z , RoomID ) ----產生透明球專用
	WriteRoleValue( HideBall , EM_RoleValue_Livetime, 3 )  --存活時間
	CastSpelllv ( HideBall , HideBall , 498847 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
end
function Cl_MonsterSkill_498841()
	local OwnerID = OwnerID()
	local Rand_Skill = DW_Rand(100)
	if Rand_Skill < 50 then
		addbuff ( OwnerID , 621366 , 0 , 2 )
	end
end
function Cl_MonsterSkill_498850()
	local OwnerID = OwnerID()
	local OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID )
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Npc_Table = {}
	if ZoneID == 144 then
		Npc_Table[106433] = 106624
	elseif ZoneID == 145 then
		Npc_Table[106753] = 106762
	end
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local Npc_X , Npc_Y , Npc_Z = Cl_Rand_HateList( 1 , 0 )
	local HideBall = Cl_CreateObj_ForHideBall( Npc_Table[OrgID] , Npc_X , Npc_Y , Npc_Z , RoomID ) ----產生透明球專用
	WriteRoleValue( HideBall , EM_RoleValue_Livetime, 6 )  --存活時間
	CastSpelllv ( HideBall , HideBall , 498859 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
end
function Cl_MonsterSkill_498851()
	local OwnerID = OwnerID()
	local BuffID = Lua_BuffPosSearch( OwnerID, 621375 )  ---讀取BOSS自己身上有幾層buff
	local BuffLv = BuffInfo( OwnerID, BuffID , EM_BuffInfoType_Power )---讀取技能等級
	if BuffLv >= 3 then
		CancelBuff( OwnerID, 621375 )
		addbuff ( OwnerID , 621377 , 0 , 15 )
	end
end
function Cl_MonsterAI_105810()
	local OwnerID = OwnerID() ----我叫做AI
	addbuff ( OwnerID , 621105 , 0 , -1 )
end
function Cl_Z22_OpenFlag(Flag)
	local OwnerID = OwnerID() ----我叫做AI
	if Flag == 0 then
		SetModeEx( OwnerID , EM_SetModeType_Mark, false)			---可點選(是)
		SetModeEx( OwnerID , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
		SetModeEx( OwnerID , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( OwnerID , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
		SetModeEx( OwnerID , EM_SetModeType_HideName, true )
		SetModeEx ( OwnerID , EM_SetModeType_Obstruct, true) 		---阻擋(是)
		SetModeEx( OwnerID , EM_SetModeType_Move, false) ---移動	(否)
	elseif Flag == 1 then
		SetModeEx ( OwnerID , EM_SetModeType_Obstruct, false) 		---阻擋(是)
		SetIdleMotion( OwnerID ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
		SetModeEx( OwnerID , EM_SetModeType_Mark, true )			---可點選(是)
		SetModeEx( OwnerID , EM_SetModeType_ShowRoleHead, true ) 		---頭像框(是)
		SetModeEx( OwnerID , EM_SetModeType_Fight, true ) ---可砍殺(是)
		SetModeEx( OwnerID , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
		SetModeEx(OwnerID , EM_SetModeType_HideName, false )
		SetModeEx( OwnerID , EM_SetModeType_Move, true) ---移動	(否)
	end
end
function Cl_Z22_ctarlAI_IceAndHot() ---冰與火研究者
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
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
	local ObjMatrix ={}
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106429,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106430,Matrix,2,1)
	elseif ZoneID == 145 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106749,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106750,Matrix,2,1)
	end
	WriteRoleValue( ObjMatrix[1] , EM_RoleValue_Register1, ObjMatrix[2] )  --存活時間
	WriteRoleValue( ObjMatrix[2] , EM_RoleValue_Register1, ObjMatrix[1] )  --存活時間
		
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	CallPlot( OwnerID() , "CL_Z22_ctarlAI_CallFun" , 0 )
end
function CL_Z22_ctarlAI_CallFun()
	sleep( 10 )
	CallPlot( OwnerID() , "Cl_Z22_ctarlAI_IceAndHot" , 0 )
end
function Cl_Z22_MonsterAI_Dead()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local OrgID = ReadRoleValue ( OwnerID , EM_RoleValue_OrgID )
	local Monster = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(OwnerID)
	local OrgID_Table = {}
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		OrgID_Table[106429] = { 499061 , 0 }
		OrgID_Table[106430] = { 499062 , 0 }
	elseif ZoneID == 145 then
		OrgID_Table[106749] = { 499061 , 0 }
		OrgID_Table[106750] = { 499062 , 0 }
	end
	local HideBall = Cl_CreateObj_ForHideBall( 106630 , Npc_X , Npc_Y , Npc_Z , RoomID ) ----產生透明球專用
	WriteRoleValue( HideBall , EM_RoleValue_Livetime, 3 )  --存活時間
	if CheckID( Monster )  == true and  ---檢查GID
		ReadRoleValue( Monster , EM_RoleValue_IsDead ) ==  0 then
		CastSpelllv ( HideBall , Monster , OrgID_Table[OrgID][1] , OrgID_Table[OrgID][2] ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
	end
end
function Cl_Z22_ctarlAI_ToMove_1_3() ---冰與火研究者
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
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
	local ObjMatrix ={}
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106446,Matrix,1,0)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106446,Matrix,2,1)	
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106446,Matrix,2,-1)		
	elseif ZoneID == 145 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106757,Matrix,2,1)	
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106757,Matrix,2,-1)		
	end
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle )
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	CallPlot( OwnerID() , "CL_Z22_ctarlAI_CallFun_1_3" , 0 )
end
function CL_Z22_ctarlAI_CallFun_1_3()
	sleep( 10 )
	CallPlot( OwnerID() , "Cl_Z22_ctarlAI_ToMove_1_3" , 0 )
end
function Cl_Z22_PlayMotion()
	local OwnerID = OwnerID()
	Cl_Z22_OpenFlag(0)
	if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 0 then	
		PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_BEGIN )
		sleep ( 10 )
		SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_SLEEP_LOOP )
		sleep ( 40 )
		WriteRoleValue( OwnerID , EM_RoleValue_Register1, 1 )  --存活時間
	end
end
function Cl_Z22_Fight_FlagOpen()
	local OwnerID = OwnerID() ----我叫做AI
	local AttackTarget = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				Cl_Z22_OpenFlag(1)
				--[[if ReadRoleValue( OwnerID , EM_RoleValue_Register1 ) ~= 1 then
					PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_END )
					sleep ( 10 )
					SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_NORMAL )----------------------維持動作 
				end]]--
				CombatBegin = 1
			end
		elseif HateListCount( OwnerID ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 0
			end
		end
	end
end
function Cl_Z22_Stop_PlayMotion()
	local OwnerID = OwnerID()
	if HateListCount( OwnerID ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
		--WriteRoleValue( OwnerID , EM_RoleValue_Register1, 1 )
		PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_BEGIN )
		Cl_Z22_OpenFlag(0)
		MoveToFlagEnabled( OwnerID, false) ---系統內建的路徑關掉
		sleep ( 10 )
		SetIdleMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_LOOP )
		sleep ( 30 )
		Cl_Z22_OpenFlag(1)
		PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_SLEEP_END )
		sleep ( 10 )
		SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_NORMAL )----------------------維持動作 ruFUSION_ACTORSTATE_NORMAL
		--WriteRoleValue( OwnerID , EM_RoleValue_Register1, 0 )
		MoveToFlagEnabled( OwnerID, true) ---系統內建的路徑關掉
	elseif HateListCount( OwnerID ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
		return
	end
end
function Cl_Z22_MonsterAI_106447()
	local OwnerID = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local ctarlAI = ReadRoleValue( OwnerID , EM_RoleValue_PID ) ----紀錄讀取到的層數
	local AttackTarget = 0
	local Pose_Flag = 0
	local CombatBegin = 0
	local Old_X = ReadRoleValue ( OwnerID , EM_RoleValue_X)
	local Old_Y = ReadRoleValue ( OwnerID , EM_RoleValue_Y)
	local Old_Z = ReadRoleValue ( OwnerID , EM_RoleValue_Z)
	while 1 do
		sleep ( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				Cl_Z22_OpenFlag(1)
				if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 1 then
					SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_NORMAL )----------------------維持動作 
					WriteRoleValue( OwnerID , EM_RoleValue_Register1 , 0 )  --存活時間d
				end
				CombatBegin = 1
			end
		elseif HateListCount( OwnerID ) == 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 0
			end
		end
	end
end
function Cl_Z22_PlayMotion_Dead()
	local OwnerID = OwnerID()
	Cl_Z22_OpenFlag(0)
	if ReadRoleValue ( OwnerID , EM_RoleValue_Register1 ) == 0 then
		PlayMotion ( OwnerID , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
		sleep ( 20 )
		SetIdleMotion( OwnerID , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
		sleep ( 30 )
		WriteRoleValue( OwnerID , EM_RoleValue_Register1, 1 )  --存活時間
	end
end
function Cl_Z22_ctarlAI_IceAndHot_2() ---冰與火研究者
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
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
	local ObjMatrix ={}
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106429,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106430,Matrix,1,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106435,Matrix,2,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106436,Matrix,2,1)
	elseif ZoneID == 145 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106755,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106756,Matrix,1,1)
	end
	WriteRoleValue( ObjMatrix[1] , EM_RoleValue_Register1, ObjMatrix[2] )  --存活時間
	WriteRoleValue( ObjMatrix[2] , EM_RoleValue_Register1, ObjMatrix[1] )  --存活時間
		
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	CallPlot( OwnerID() , "CL_Z22_ctarlAI_CallFun_2" , 0 )
end
function CL_Z22_ctarlAI_CallFun_2()
	sleep( 10 )
	CallPlot( OwnerID() , "Cl_Z22_ctarlAI_IceAndHot_2" , 0 )
end
function Cl_Z22_ctarlAI_IceAndHot_3() ---冰與火研究者
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
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
	local ObjMatrix ={}
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	if ZoneID == 144 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106435,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106436,Matrix,1,1)
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106435,Matrix,2,-1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106436,Matrix,2,1)
	elseif ZoneID == 145 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106755,Matrix,1,-1)
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106756,Matrix,1,1)
	end
	WriteRoleValue( ObjMatrix[1] , EM_RoleValue_Register1, ObjMatrix[2] )  --存活時間
	WriteRoleValue( ObjMatrix[2] , EM_RoleValue_Register1, ObjMatrix[1] )  --存活時間
	
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	CallPlot( OwnerID() , "CL_Z22_ctarlAI_CallFun_3" , 0 )
end
function CL_Z22_ctarlAI_CallFun_3()
	sleep( 10 )
	CallPlot( OwnerID() , "Cl_Z22_ctarlAI_IceAndHot_3" , 0 )
end
function Cl_Z22_MonsterAI_106106()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local ZoneID = ReadRoleValue( OwnerID , EM_RoleValue_ZoneID )-----------------
	local Ball_Tame = 0
	local BallID = 0
	local NpcID = {}
	NpcID[144] = 106106
	NpcID[145] = 106746
	NpcID[937] = 106106
	while 1 do
		sleep ( 10 )
		Ball_Tame = Ball_Tame + 1
		if Ball_Tame >= 15 then
			BallID = CreateObjByFlag( NpcID[ZoneID] , 781085 , 0 , 1 ) ------------產生副本入口門
			SetModeEx( BallID , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( BallID , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( BallID , EM_SetModeType_Mark, false)			---可點選(是)
			SetModeEx( BallID , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
			SetModeEx( BallID , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( BallID , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
			AddToPartition( BallID , RoomID )
			addbuff ( BallID , 621381 , 0 , -1 )
			CallPlot( BallID , "Cl_Z22_106106_MoveToFlag" , 0 )
			Ball_Tame = 0
		end
	end
end
function Cl_Z22_106106_MoveToFlag()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	for i = 1 , 3 , 1 do
		MoveToFlagEnabled( OwnerID , false ) ---系統內建的路徑關掉
		WriteRoleValue(  OwnerID , EM_RoleValue_IsWalk , 0 )
		Hide( OwnerID )
		Show( OwnerID , RoomID )
		LuaFunc_MoveToFlag( OwnerID , 781085 , i , 0 )
	end
	delobj ( OwnerID )
end
function Cl_Z22_ChackIsMonster()
	local OwnerID = OwnerID()
	local Target = TargetID()
	if ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106753 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106754 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106747 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106748 or
		
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106433 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106434 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106427 or
		ReadRoleValue ( Target , EM_RoleValue_OrgID ) == 106428 then
		return true
	else
		return false
	end
end
function Cl_Z22_ChackIsPlay()
	local OwnerID = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsDead ) ==  0 and 
		ReadRoleValue( Target , EM_RoleValue_IsPlayer ) ==  1 and
		ReadRoleValue ( Target , EM_RoleValue_VOC ) ~= 0 then
		return true
	else
		return false
	end
end
function Cl_Z22TurnMonsteSetPlot()
	local OwnerID = OwnerID()
	
end
function Cl_Z22TurnMonstecollision()
	local OwnerID = OwnerID()
	local Target = TargetID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	if ReadRoleValue ( OwnerID , EM_RoleValue_VOC ) ~= 0 then
		ScriptMessage( OwnerID, -1 , 2 ,"[SC_Z22_MONSTE_01]" , 2 )
		local Hideball = Cl_CreateObj_ForFlag( 106630 , 781110 , 25 , RoomID ) ----產生透明球專用
		WriteRoleValue( Hideball , EM_RoleValue_PID , 1 )
		CallPlot( Hideball , "Cl_Z22_TurnMonsterAI" , 0 )
		delobj ( Target )
	end
	
end
function Cl_Z22_ForTurnAI()
	SetPlot( OwnerID() , "collision","Cl_Z22TurnMonstecollision", 20 ) ---塞入BOSS的戰鬥給他
end
function Cl_Z22_TurnMonsterAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local flag_table = {}
	local Rand_flag = DW_Rand(128)
	while ReadRoleValue( OwnerID , EM_RoleValue_PID )== 1 do
		sleep ( 20 )
		---say( OwnerID , "OwnerID="..ReadRoleValue ( OwnerID , EM_RoleValue_OrgID ) )
		---DebugMsg( 0 , 0 , "Dug="..ReadRoleValue ( OwnerID , EM_RoleValue_OrgID ) )
		for i = 1 , 20 , 1 do
			Rand_flag = DW_Rand(128)
			flag_table[i] = Rand_flag
		end
		for i = 1 , 20 , 1 do
			Hideball = Cl_CreateObj_ForFlag( 106748 , 781110 , flag_table[i] , RoomID ) ----產生透明球專用
			WriteRoleValue( Hideball , EM_RoleValue_Livetime , 3 )
			CallPlot( Hideball , "Cl_Z22_TurnMonster" , 0 )
		end
	end
end
function Cl_Z22_TurnMonster()
	local OwnerID = OwnerID()
	CastSpelllv ( OwnerID , OwnerID , 499066 , 0 )----每13秒施放一個全場法術AE
end
--25 29  95  91
function Cl_Z22_ForTurnMonster()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local FlagNum = {25,29,95,91}
	local Npc_Table = {}	
	Npc_Table = {106702,106703,106704,106705}	
	local NpcID = {}
	local BuffNpc = {}
	local NpcNum = 0
	local ObjNum = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
	WriteRoleValue( OwnerID , EM_RoleValue_Register1 , 0 )
	if ZoneID == 144 then
		for i = 1 , 4 , 1 do
			NpcID[i] = CreateObjByFlag( Npc_Table[i] , 781110 , FlagNum[i] , 1 )  ------------生出魔術帽
			SetModeEx( NpcID[i] , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( NpcID[i] , EM_SetModeType_Searchenemy, false)--索敵(否)
			WriteRoleValue ( NpcID[i] , EM_RoleValue_PID , OwnerID )
			AddToPartition( NpcID[i] , RoomID )
			ObjNum = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
			WriteRoleValue( OwnerID , EM_RoleValue_Register1 , ObjNum+1 )
			Addbuff (  NpcID[i] , 505653 , 0 , -1 ) ---兔子變大
		end
	end
	while 1 do
		ObjNum = ReadRoleValue ( OwnerID , EM_RoleValue_Register1 )
		if ObjNum ~= 0 then
			NpcNum = table.getn(NpcID)
			for i = 1 , NpcNum , 1 do
				if CheckID( NpcID[i] )  == true then--NpcID[i] == nil then--	
					table.insert( BuffNpc , NpcID[i] )  ---將抓取到的玩家塞入一個新的TABLE
					--table.remove ( NpcID , i )  ---抓到後移除掉本來的
				end
			end
			NpcID = {}
			NpcID = BuffNpc
			BuffNpc = {}
			NpcNum = table.getn(NpcID)
			Buff_rand = DW_Rand(NpcNum)
			for i = 1 , NpcNum , 1 do
				if i ~= Buff_rand then
					Addbuff ( NpcID[i] , 622151 , 0 , 7 ) ---兔子變大
				end
			end
		elseif ObjNum == 0 then
			ScriptMessage( OwnerID, -1 , 2 ,"[SC_Z22_MONSTE_02]" , 2 )
			sleep ( 10 )
			delobj ( OwnerID )
		end
		sleep ( 70 )
	end
end
function Cl_Z22_DeadForTurnMonste()
	local OwnerID = OwnerID()
	local AI = ReadRoleValue ( OwnerID , EM_RoleValue_PID )
	local ObjNum = ReadRoleValue ( AI , EM_RoleValue_Register1 )
	WriteRoleValue( AI , EM_RoleValue_Register1 , ObjNum-1 )
	delobj ( OwnerID )
end