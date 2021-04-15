function cl_139_105663() ----擦地女僕
	local skill_497615 = 0
	local skill_497617 = 0
	local skill_497618 = 0
	local CombatBegin = 0
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP3 )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE ) 
				addbuff ( OwnerID() , 509729 , 0 , -1 ) ----給BOSS一個假的表演BUFF(光罩)
			end
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				skill_497615 = skill_497615 + 1
				skill_497617 = skill_497617 + 1
				skill_497618 = skill_497618 + 1
				if skill_497617 >= 4 then
					CastSpelllv ( OwnerID() , AttackTarget , 497617 , 26 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					skill_497617 = 0
				end
				if skill_497615 >= 7 then
					local hate_Table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					local hate=table.getn(hate_Table) ----取出仇恨表內的數量
					local Rand_Num = DW_Rand(hate)  ----隨機選一個值代表TABLE裡的位置
					if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 0 then --檢查男女角
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497615 , 20 ) ---
					elseif ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 1 then --檢查男女角
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497666 , 20 ) ---
					end
					sleep ( 10 )
					skill_497615 = 0
				end
				if skill_497618 >= 13 then
					CastSpelllv ( OwnerID() , OwnerID() , 497618 , 20 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep( 30 )
					skill_497618 = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				sleep ( 30 )
				CancelBuff_NoEvent( OwnerID() , 509729 ) ----清除掉流血BUFF
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP3 )
			end
		end
	end
end
function cl_139_105679() ----掃地女僕
	local skill_497615 = 0
	local skill_497617 = 0
	local skill_497618 = 0
	local CombatBegin = 0
	local open = 0
	local open_time = 0
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP1 )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE )
			end
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				skill_497615 = skill_497615 + 1
				skill_497617 = skill_497617 + 1
				skill_497618 = skill_497618 + 1
				if skill_497617 >= 4 then
					CastSpelllv ( OwnerID() , AttackTarget , 497617 , 26 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					skill_497617 = 0
				end
				if skill_497615 >= 7 then
					local hate_Table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					local hate=table.getn(hate_Table) ----取出仇恨表內的數量
					local Rand_Num = DW_Rand(hate)  ----隨機選一個值代表TABLE裡的位置
					if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 0 then --檢查如果不是GM才執行以下
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497615 , 20 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					elseif ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 1 then --檢查如果不是GM才執行以下
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497666 , 20 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					end
					sleep ( 10 )
					skill_497615 = 0
				end
				if skill_497618 >= 13 then
					CastSpelllv ( OwnerID() , OwnerID() , 497618 , 20 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep ( 30 )
					skill_497618 = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP1 )
			end
			--[[if open == 0 then
				local Search = SearchRangeNPC ( OwnerID() , 50 )
				for i = 0 , table.getn(Search) do
					if Search[i] ~= OwnerID() then
						if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105659 and 
							ReadRoleValue( Search[i] , EM_RoleValue_IsDead)== 0 then---BOSS是否存在 -12人王
							local dir = ReadRoleValue ( OwnerID() ,  EM_RoleValue_Dir )
							AdjustFaceDir( OwnerID(), Search[i], 0 ) --使自己面向目標
							SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_CUTE2 )
							sleep ( 20 )
							SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP1 )
							SetDir ( OwnerID() , dir )
							open = 1	
							break							
						end
					end
				end
			elseif open == 1 then
				open_time = open_time + 1
				if open_time >= 20 then
					open = 0
					open_time = 0
				end
			end]]--
		end
	end
end
function cl_139_105652() ----灰塵女僕
	local skill_497615 = 0
	local skill_497617 = 0
	local skill_497618 = 0
	local CombatBegin = 0
	local open = 0
	local open_time = 0
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP2 )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE )
			end
			if CombatBegin == 1 then   -----如果王的仇恨表內有人~就將這個值改變
				skill_497615 = skill_497615 + 1
				skill_497617 = skill_497617 + 1
				skill_497618 = skill_497618 + 1
				if skill_497617 >= 4 then
					CastSpelllv ( OwnerID() , AttackTarget , 497617 , 26 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep ( 10 )
					skill_497617 = 0
				end
				if skill_497615 >= 7 then
					local hate_Table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					local hate=table.getn(hate_Table) ----取出仇恨表內的數量
					local Rand_Num = DW_Rand(hate)  ----隨機選一個值代表TABLE裡的位置
					if ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 0 then --檢查如果不是GM才執行以下
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497615 , 20 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					elseif ReadRoleValue( hate_Table[Rand_Num] , EM_RoleValue_SEX ) == 1 then --檢查如果不是GM才執行以下
						CastSpelllv ( OwnerID() , hate_Table[Rand_Num] , 497666 , 20 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					end
					sleep ( 10 )
					skill_497615 = 0
				end
				if skill_497618 >= 13 then
					CastSpelllv ( OwnerID() , OwnerID() , 497618 , 20 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep ( 30 )
					skill_497618 = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP2 )
			end
			--[[if open == 0 then
				local Search = SearchRangeNPC ( OwnerID() , 50 )
				for i = 0 , table.getn(Search) do
					if Search[i] ~= OwnerID() then
						if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105659 and 
							ReadRoleValue( Search[i] , EM_RoleValue_IsDead)== 0 then---BOSS是否存在 -12人王
							local dir = ReadRoleValue ( OwnerID() ,  EM_RoleValue_Dir )
							AdjustFaceDir( OwnerID(), Search[i], 0 ) --使自己面向目標
							SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_CUTE2 )
							sleep ( 20 )
							SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SWEEP2 )
							SetDir ( OwnerID() , dir )
							open = 1	
							break							
						end
					end
				end
			elseif open == 1 then
				open_time = open_time + 1
				if open_time >= 20 then
					open = 0
					open_time = 0
				end
			end]]--
		end
	end
end
function cl_139_497669()--------不死隨從分身術
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告??地?~是我?在?到的地?
	local X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	local Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	local Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------?里是捉出Attackplayer里面的那?人的座?
	local ball = CreateObj( 105744 , X1+20, Y1 , Z1+20 , 0 , 1 )  ------------
	AddToPartition ( ball,RoomID ) ----物件加入?景,例行公事
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
	SetAttack( ball , AttackTarget)
end
function cl_139_105660()
	local CombatBegin = 0
	local rand_Motion = 0
	local ch_Motion = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				SetIdleMotion( OwnerID() ,  ruFUSION_ACTORSTATE_NORMAL)--------保持地下模式
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
			end
			if ReadRoleValue ( OwnerID() , EM_RoleValue_NpcOnMove ) == 0 then
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_GATHER_LOOP )
			end
		end
	end
end
function cl_139_105657()
	local skill = 0
	local skill_1 = 0
	local CombatBegin = 0
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_1H )
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
			end	
			skill = skill + 1
			skill_1 = skill_1 + 1
			if skill >= 2 then
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_ATTACK_1H )
				sleep ( 10 )
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_1H )
				skill = 0
			end
			if skill_1 >= 4 then
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_ATTACK_2H )
				sleep ( 10 )
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_COMBAT_1H )
				skill_1 = 0
			end
		end
	end
end
--------------------巡邏怪專區------------------------
function cl_139_00_01_P1() ----------0~1王的巡邏--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105659,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105658,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105658,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_00_01_P1wark01" , 0 )
end
function cl_139_00_01_P1wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_00_01_P1" , 0 )
end
function cl_139_01_02_P1() ----------0~1王的巡邏--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105659,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105656,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105656,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105656,Matrix,2,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_01_02_P1wark01" , 0 )
end
function cl_139_01_02_P1wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_01_02_P1" , 0 )
end
function cl_139_03_04_P1() ----------0~1王的巡邏--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105660,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_03_04_P1wark01" , 0 )
end
function cl_139_03_04_P1wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_03_04_P1" , 0 )
end
function cl_139_04_05_P1() ----------0~1王的巡邏--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105662,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,1)
	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105662,Matrix,2,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_139_04_05_P1wark01" , 0 )
end
function cl_139_04_05_P1wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_139_04_05_P1" , 0 )
end
-------------------符文裝置機關區-----------------------
function cl_Rune_equipment_AI()
	local AI = OwnerID() -- 宣告機關控制器的名稱
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---讀取ZONEID
	local number_flag = 0
	local rand_number = 0
	local rand_Rune = 0
	local Rune_table = {105653,105654,105655}
	for i = 1 , 5 , 1 do
		rand_number = DW_Rand(5)
		rand_Rune = DW_Rand(3)
		local Rune_equipment = CreateObjByFlag( Rune_table[rand_Rune] , 780966 , rand_number+number_flag , 1 ) ------------誰是boss要在哪裡產生		
		SetModeEx( Rune_equipment , EM_SetModeType_Show, false) ---秀出	(否)
		SetModeEx( Rune_equipment , EM_SetModeType_Move, false) ---移動	(否)
		AddToPartition ( Rune_equipment , RoomID ) ----物件加入場景,例行公事
		WriteRoleValue ( Rune_equipment , EM_RoleValue_Register1 , rand_Rune )
		BeginPlot( Rune_equipment,"cl_Rune_equipment", 0 ) -----表演固定動作用劇情
		number_flag = number_flag + 5
	end
end
function cl_Rune_equipment() ---閃電
	local Rune_equipment = OwnerID()
	local RoomID = ReadRoleValue( Rune_equipment , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local skill_number = ReadRoleValue ( Rune_equipment , EM_RoleValue_Register1 )
	local skill_time = 0
	local CombatBegin = 0
	local skill_table = {497858,497859,497857}
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( Rune_equipment , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( Rune_equipment ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then  ----如果王仇恨表內沒有人了~就將這個值改變
				SetModeEx( Rune_equipment , EM_SetModeType_Show, true) ---秀出	(否)
				Addbuff ( Rune_equipment , 509873 , 0 , -1 )
				CastSpelllv ( Rune_equipment , Rune_equipment , skill_table[skill_number] , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
				CombatBegin = 1
			end
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				skill_time = skill_time + 1
				if skill_time >= 3 then
					CastSpelllv ( Rune_equipment , Rune_equipment , 497856 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
					ScriptMessage( Rune_equipment , -1 , 2 ,"[SC_139_118583_2]" , 2 )----
					--say ( Rune_equipment , "BBB")
					skill_time = 0
				end
			end
		elseif HateListCount ( Rune_equipment ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				skill_time = 0
				CombatBegin = 0
			end
		end
	end
end
function cl_Rune_SearchRangeNPC() ---閃電
	local Rune_equipment = OwnerID()
	local RoomID = ReadRoleValue( Rune_equipment , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local skill_number = ReadRoleValue ( Rune_equipment , EM_RoleValue_Register1 )
	local AttackTarget = ReadRoleValue( Rune_equipment , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
	local skill_table = {}
	local most = {}
	local mostbon = {}
	most = SearchRangeNPC ( Rune_equipment , 180 )
	local mostno = table.getn(most)
	for i=1 , mostno , 1 do
		if ReadRoleValue ( most[i] , EM_RoleValue_IsDead ) == 0 then
			if ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105652 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105656 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105657 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105658 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105659 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105660 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105661 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105662 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105663 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105679 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105680 or
				ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105726 then
				SetAttack( most[i] , AttackTarget)
				say ( most[i] , "[SC_139_RUNE_1]")
			end
		end
	end
end