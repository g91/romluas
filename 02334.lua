function cl_105603_N() -------------被操控的鋼鐵衛士-------------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local time1 = 0
	local time2 = 0
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
			end
			if CombatBegin == 1 then
				local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					--總血量
				local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )						--當前血量
				local HPPercent = ( NowHP / MaxHP )*100
				if HPPercent <= 50 then
					if time1 == 0 then
						time1 = 1
					end
				elseif HPPercent >= 50 then
					if time1 == 1 then
						time1 = 0
						time2 = 0
					end
				end
				if HPPercent <= 50 and time1 == 1  and time2 == 0 then   -----當HP低於80%的時候~要開始生血球中控器
					say(OwnerID(),"[SC_19104733]")
					time2 = 1
					local Search = SearchRangeNPC ( OwnerID() , 150 )
					for i = 0 , table.getn(Search) do
						if Search[i] ~= OwnerID() then
							if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105603 and 
								ReadRoleValue( Search[i] , EM_RoleValue_IsDead)== 0 then---BOSS是否存在 -12人王
								SetAttack( Search[i] , AttackTarget)
								say ( Search[i] , "[SC_19104733_2]")
							end
						end
					end
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
			end
		end
	end
end
--------------------------魔術師的學------------
function cl_105601_N()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local skill = 0
	local skill2 = 0
	local CombatBegin = 0
	local Six_Table = {}
	local six = 0
	local Six2_Table = {}
	local six2 = 0
	local go = 0
	local open = 0
	local Rand_Num = 0
	local Rand_Num2 = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
			skill = skill + 1
			skill2 = skill2 + 1
				if skill >= 9 then
					Six_Table = DW_HateRemain(0)
					six = table.getn(Six_Table)
					Rand_Num = DW_Rand(six)
					if six >= 1 then
						CastSpelllv ( OwnerID() , Six_Table[Rand_Num] , 497027 , 40 )
						sleep ( 10 )
					end
					Six_Table = {}
					skill = 0
				end
				local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					--讀取BOSS總血量
				local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )						--讀取BOSS當前血量
				local HPPercent = ( NowHP / MaxHP )*100	
				if HPPercent <= 50 and go == 0 then   -----當HP低於60%以及go=0的時候~要開始生血球中控器 
					sysCastSpelllv ( OwnerID() , OwnerID() , 497032 , 0 )
					sleep ( 10 )
					go = 1
				end
				if skill2 >= 15 then
					open = 1
					if open == 1 then
						Six2_Table = DW_HateRemain(0)
						six2 = table.getn(Six2_Table)
						Rand_Num = DW_Rand(six2)
						if six2 >=1 then
							if CheckBuff(  Six2_Table[Rand_Num] , 508771 ) == false then
								Addbuff ( Six2_Table[Rand_Num]  , 508771 , 0 , -1 )
								sleep ( 30 )
								local x = ReadRoleValue (Six2_Table[Rand_Num], EM_RoleValue_X)
								local y = ReadRoleValue (Six2_Table[Rand_Num], EM_RoleValue_Y)
								local z = ReadRoleValue (Six2_Table[Rand_Num], EM_RoleValue_Z)
								local ball = CreateObj ( 105602 , x , y , z , 0 , 1) --隨機字身周圍生怪
								SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
								SetModeEx( ball , EM_SetModeType_Move, false) ---移動	(否)
								SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
								SetModeEx( ball , EM_SetModeType_Mark, true)			---可點選(是)
								SetModeEx( ball , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
								SetModeEx( ball , EM_SetModeType_Fight, true) ---可砍殺(是)
								SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
								AddToPartition( ball,RoomID )
								WriteRoleValue ( ball , EM_RoleValue_PID , OwnerID() )
								WriteRoleValue ( ball , EM_RoleValue_Register1 ,Six2_Table[Rand_Num])
								BeginPlot( ball,"cl_105602_N", 0 )
								Six2_Table = {}
								open = 0
								skill2 = 0
							elseif CheckBuff(  Six2_Table[Rand_Num] , 508771 ) == true then
								table.remove ( Six2_Table , Rand_Num )
								six2 = table.getn(Six2_Table)
							end
						end
					end
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				go = 0
				skill = 0
				skill2 = 0
				open = 0
			end
		end
	end
end
function cl_105602_N() 
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	local boss = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	Addbuff ( OwnerID()  , 508514 , 0 ,-1 )
	Addbuff ( player  , 508772 , 0 , -1 )
	SetPlot(  OwnerID(), "dead","cl_105602_dead_N", 20 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		--if HateListCount( boss ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 then
				delobj( OwnerID() )
				CancelBuff( player, 508771 )
				CancelBuff( player, 508772 )
			end
			if ReadRoleValue( boss , EM_RoleValue_IsDead ) == 1 then
				sysCastSpelllv ( OwnerID() , OwnerID() , 496928 , 3 )
				sleep ( 10 )
				CancelBuff( player, 508771 )
				CancelBuff( player, 508772 )
				delobj( OwnerID() )
			end
		--elseif HateListCount ( boss ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			--CancelBuff( player, 508771 )
			--CancelBuff( player, 508772 )
			--delobj( OwnerID() )
		--end
	end
end
function cl_105602_dead_N()
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	CancelBuff( player, 508771 )
	CancelBuff( player, 508772 )
	delobj( OwnerID() )
end
-------------被操控的大雄--------------
function cl_136_AI_N() ----大熊控制器
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local baer = LuaFunc_CreateObjByObj ( 105605 , OwnerID() )
	AddToPartition ( baer,RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------對BOSS說是中控器AI產生的
	BeginPlot( baer,"cl_136_105605_N", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
	while 1 do
		sleep (5)
		local star = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if star == 1 then
		elseif star == 2 then
		elseif star == 3 then
			delobj ( baer )
			sleep ( 30 )
			baer = LuaFunc_CreateObjByObj ( 105605 , OwnerID() )
			AddToPartition ( baer,RoomID ) ----物件加入場景,例行公事
			WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------對BOSS說是中控器AI產生的
			BeginPlot( baer,"cl_136_105605_N", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
end
function cl_136_105605_N() -----------被操控的大熊------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local CombatBegin = 0
	local skill = 0
	local open = 0
	local xx = 0
	local yy = 0
	local zz = 0
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	SetModeEx(OwnerID(),EM_SetModeType_HideName, true )
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	(否)
	SetDefIdleMotion( OwnerID(), ruFUSION_ACTORSTATE_KNOCKDOWN_END )  
	while 1 do
		sleep ( 5 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				WriteRoleValue ( AI , EM_RoleValue_Register1, 1 ) --------對BOSS說是中控器AI產生的
				open = 1
			end
			if CombatBegin == 1 then
				SetModeEx( OwnerID() , EM_SetModeType_Mark, true )			---可點選(是)
				SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true ) 		---頭像框(是)
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true ) ---可砍殺(是)
				SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
				SetModeEx( OwnerID() , EM_SetModeType_HideName , false )
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	(否)
				SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1, 3 ) --------對BOSS說是中控器AI產生的
			end
		end
	end
end
------------各組巡邏小怪-----------------
function cl_136_01_01_N() ----------0~1王的巡邏--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105598,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark01_N" , 0 )
end
function cl_136_wark01_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_01_01_N" , 0 )
end
function cl_136_03_01_N() -----------------------2~3王巡邏1-----------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105596,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105597,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105597,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105601,Matrix,3,0)
	BeginPlot( ObjMatrix[4] , "cl_105601_N" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_01_N" , 0 )
end
function cl_136_wark03_01_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_01_N" , 0 )
end
function cl_136_03_02_N() --PAT屍妖
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105599,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105598,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105598,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105231,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_02_N" , 0 )
end
function cl_136_wark03_02_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_02_N" , 0 )
end
function cl_136_03_04_N() ----------------------------3~4王--------------------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105599,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105598,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105598,Matrix,2,-1)	
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105601,Matrix,3,0)
	BeginPlot( ObjMatrix[4] , "cl_105601_N" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_04_2_N" , 0 )
end
function cl_136_wark03_04_2_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_04_N" , 0 )
end
function cl_136_03_042_N() --PAT屍妖
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105599,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105601,Matrix,2,1)
	BeginPlot( ObjMatrix[2] , "cl_105601_N" , 0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105601,Matrix,2,-1)
	BeginPlot( ObjMatrix[3] , "cl_105601_N" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark04_03_2_N" , 0 )
end
function cl_136_wark04_03_2_N()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_042_N" , 0 )
end