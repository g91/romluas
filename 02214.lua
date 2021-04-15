function cl_136_01_01() ----------0~1王的巡邏--------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105232,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark01" , 0 )
end
function cl_136_wark01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_01_01" , 0 )
end
function cl_136_105262() ----大熊控制器
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local baer = LuaFunc_CreateObjByObj ( 105237 , OwnerID() )
	AddToPartition ( baer,RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------對BOSS說是中控器AI產生的
	BeginPlot( baer,"cl_136_105237", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
	while 1 do
		sleep (5)
		local star = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if star == 1 then
		elseif star == 2 then
		elseif star == 3 then
			delobj ( baer )
			sleep ( 30 )
			baer = LuaFunc_CreateObjByObj ( 105237 , OwnerID() )
			AddToPartition ( baer,RoomID ) ----物件加入場景,例行公事
			WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------對BOSS說是中控器AI產生的
			BeginPlot( baer,"cl_136_105237", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
end
function cl_136_105237() -----------被操控的大熊------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local CombatBegin = 0
	local skill = 0
	local open = 0
	local xx = 0
	local yy = 0
	local zz = 0
	---SetPlot( OwnerID(), "dead","cl_136_105237_dead", 0 )
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	SetModeEx(OwnerID(),EM_SetModeType_HideName, true )
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	(否)
	--PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_END)
	--PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
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
function cl_136_105262_1() ----暴怒大熊控制器
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local baer = LuaFunc_CreateObjByObj ( 105236 , OwnerID() )
	AddToPartition ( baer,RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------對BOSS說是中控器AI產生的
	BeginPlot( baer,"cl_136_105236", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
	while 1 do
		sleep (10)
		local star = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if star == 1 then
		elseif star == 2 then
		elseif star == 3 then
			delobj ( baer )
			sleep ( 10 )
			baer = LuaFunc_CreateObjByObj ( 105236 , OwnerID() )
			AddToPartition ( baer,RoomID ) ----物件加入場景,例行公事
			WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------對BOSS說是中控器AI產生的
			BeginPlot( baer,"cl_136_105237", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
end
function cl_136_105236() -----------被操控的大熊------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local CombatBegin = 0
	local skill = 0
	local open = 0
	local xx = 0
	local yy = 0
	local zz = 0
	local go = 0
	---SetPlot( OwnerID(), "dead","cl_136_105237_dead", 0 )
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	SetModeEx(OwnerID(),EM_SetModeType_HideName, true )
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	(否)
	--PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_END)
	--PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN)
	SetDefIdleMotion( OwnerID(), ruFUSION_ACTORSTATE_KNOCKDOWN_END )  
	while 1 do
		sleep ( 5 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			open = DW_Rand(15)  ----->有100個亂數去隨機一個值出來
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				sleep ( open )
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
function cl_136_02_01() -------1~2王走道的巡邏
	local dis = 15
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105232,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105229,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105230,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark02" , 0 )
end
function cl_136_wark02()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_02_01" , 0 )
end
function cl_136_105231() -------弄蛇人------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local CombatBegin = 0
	local open = 0
	local x1 = 0
	local y1 = 0
	local z1 = 0
	local skill = 0
	local snake = 0
	local skill_10 = 0
	local skill_16 = 0
	local open2 = 0
	local pot = 0
	local rand_Table = {}
	local rand_number = 0
	local flag_number = 0
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1 , 0 )
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	(否
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---反擊(否)--
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺(是)
	addbuff ( OwnerID() , 508726 , 0 , -1 ) ----給予變身
	while 1 do
		sleep ( 5 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				CastSpelllv ( OwnerID() , OwnerID() , 497019 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
				pot = Lua_CreateObjByDir( OwnerID() , 105256 , 20 , 0 ) --參考物件，產生的物件id，距離 ，面向 ： 0 的話是面向參考物件，180 的話是背向參考物件
				SetModeEx ( pot , EM_SetModeType_Obstruct, false) 		---阻擋(是)
				SetModeEx( pot , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( pot , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( pot , EM_SetModeType_Searchenemy, false)--索敵(否)
				SetModeEx( pot , EM_SetModeType_Mark, false)			---可點選(是)
				SetModeEx( pot , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
				SetModeEx( pot , EM_SetModeType_Fight, false) ---可砍殺(是)
				SetModeEx( pot , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
				AddToPartition ( pot , RoomID ) ----物件加入場景,例行公事
				sleep ( 50 )
				x1 = ReadRoleValue ( pot, EM_RoleValue_X)
				y1 = ReadRoleValue ( pot, EM_RoleValue_Y)
				z1 = ReadRoleValue ( pot, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
				snake = CreateObj( 105257 , x1, y1 , z1 , 0 , 1 )  ------------生出魔術帽
				AddToPartition ( snake , RoomID ) ----物件加入場景,例行公事
				WriteRoleValue ( snake , EM_RoleValue_PID ,OwnerID() ) 
				SetPlot( snake, "dead","cl_105257_dead", 0 )
				SetAttack( snake , AttackTarget )
				delobj ( pot )
				SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	(否
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, true) ---反擊(否)--
				SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺(是)
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				skill_10 = skill_10 + 1
				skill_16 = skill_16 + 1
				local snake_key = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
				if skill_10 >= 10 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					CastSpelllv ( OwnerID() , AttackTarget , 496649 , 3 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep ( 20 )
					skill_10 = 0
				end
				if skill_16 >= 16 then
					while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					rand_Table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					flag_number = table.getn(rand_Table)
					rand_number = DW_Rand(flag_number)
					CastSpelllv ( OwnerID() ,rand_Table[flag_number] , 497035 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
					sleep ( 20 )
					skill_16 = 0
				end
				if snake_key == 1 then
					skill = skill + 1
					if skill >= 15 then 
						if CheckBuff( OwnerID() , 508726 ) == false then
							addbuff ( OwnerID() , 508726 , 0 , -1 ) ----給予變身
						end
						while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(10)
						end
						SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺(是)
						SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	(否
						SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---反擊(否)--
						CastSpelllv ( OwnerID() , OwnerID() , 497019 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
						pot = Lua_CreateObjByDir( OwnerID() , 105256 , 20 , 0 ) --參考物件，產生的物件id，距離 ，面向 ： 0 的話是面向參考物件，180 的話是背向參考物件
						SetModeEx ( pot , EM_SetModeType_Obstruct, false) 		---阻擋(是)
						SetModeEx( pot , EM_SetModeType_Strikback, false) ---反擊(否)
						SetModeEx( pot , EM_SetModeType_Move, false) ---移動	(否)
						SetModeEx( pot , EM_SetModeType_Searchenemy, false)--索敵(否)
						SetModeEx( pot , EM_SetModeType_Mark, false)			---可點選(是)
						SetModeEx( pot , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
						SetModeEx( pot , EM_SetModeType_Fight, false) ---可砍殺(是)
						SetModeEx( pot , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
						AddToPartition ( pot , RoomID ) ----物件加入場景,例行公事
						sleep ( 50 )
						x1 = ReadRoleValue ( pot, EM_RoleValue_X)
						y1 = ReadRoleValue ( pot, EM_RoleValue_Y)
						z1 = ReadRoleValue ( pot, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
						snake = CreateObj( 105257 , x1, y1 , z1 , 0 , 1 )  ------------生出魔術帽
						AddToPartition ( snake , RoomID ) ----物件加入場景,例行公事
						WriteRoleValue ( snake , EM_RoleValue_PID ,OwnerID() ) 
						SetPlot( snake, "dead","cl_105257_dead", 0 )
						SetAttack( snake , AttackTarget )
						delobj ( pot )
						SetModeEx( OwnerID() , EM_SetModeType_Move, true) ---移動	(否
						SetModeEx( OwnerID() , EM_SetModeType_Strikback, true) ---反擊(否)--
						SetModeEx( OwnerID() , EM_SetModeType_Fight, true) ---可砍殺(是)
						WriteRoleValue ( OwnerID() , EM_RoleValue_Register1 , 0 )
						skill = 0
					end
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				open = 0
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺(是)
				WriteRoleValue ( OwnerID() , EM_RoleValue_Register1 , 0 )
				addbuff ( OwnerID() , 508726 , 0 , -1 ) ----給予變身
				skill_10 = 0
				skill_16 = 0
				skill = 0
				delobj ( snake )
			end
		end
	end
end
function cl_105257_dead()
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	local oo = GetDistance( OwnerID(), boss );
	if oo <= 50 then
		CancelBuff( boss, 508726 )
	end
	WriteRoleValue ( boss , EM_RoleValue_Register1 , 1 )
	sleep ( 20 )
	DelObj ( OwnerID() )
end
function cl_105258_1() --------------路上兔子表演用-----------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	SetPlot( OwnerID(), "range","cl_105258_range1", 50 )
end
function cl_105258_range1()
	BeginPlot( TargetID() , "cl_rabbit1" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit1()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local rabbit = CreateObj( 117377 , 378 , 1247 , -1250 , 245 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	AddToPartition ( rabbit , RoomID ) ----物件加入場景,例行公事
	Move( rabbit, 289 , 1247 , -1034 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105258_2() ----cl_105258_collision
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	SetPlot( OwnerID(), "range","cl_105258_range2", 50 )
end
function cl_105258_range2()
	BeginPlot( TargetID() , "cl_rabbit2" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit2()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local rabbit = CreateObj( 117377 , -596 , 1270 , -1358 , 197 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	AddToPartition ( rabbit , RoomID ) ----物件加入場景,例行公事
	Move( rabbit, -783 , -1254 , -1327 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105258_3() ----cl_105258_collision
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	SetPlot( OwnerID(), "range","cl_105258_range3", 50 )
end
function cl_105258_range3()
	BeginPlot( TargetID() , "cl_rabbit3" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit3()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local rabbit = CreateObj( 117377 , -1589 , 1084 , -520 , 192 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	AddToPartition ( rabbit , RoomID ) ----物件加入場景,例行公事
	Move( rabbit, -1717 , -1084 , -483 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105258_4() ----cl_105258_collision
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	SetPlot( OwnerID(), "range","cl_105258_range4", 50 )
end
function cl_105258_range4()
	BeginPlot( TargetID() , "cl_rabbit4" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit4()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local rabbit = CreateObj( 117377 , -2224 , 1095 , 499 , 40 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	AddToPartition ( rabbit , RoomID ) ----物件加入場景,例行公事
	Move( rabbit, -2012 , 1095 , 362 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105258_5() ----cl_105258_collision
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	SetPlot( OwnerID(), "range","cl_105258_range5", 50 )
end
function cl_105258_range5()
	BeginPlot( TargetID() , "cl_rabbit5" , 0 )
	ScriptMessage( TargetID() , -1 , 2 ,"[SC_136_0001]" , 2 )
end
function cl_rabbit5()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local rabbit = CreateObj( 117377 , -1963 , 1031 , 820 , 200 , 1 )
	SetModeEx( rabbit , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( rabbit , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
	AddToPartition ( rabbit , RoomID ) ----物件加入場景,例行公事
	Move( rabbit, -2106 , 987 , 871 )
	sleep ( 50 )
	delobj ( rabbit )
	delobj ( OwnerID() )
end
function cl_105235() -----------------魔術師的學徒
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
						Rand_Num2 = DW_Rand(six2)
						if six2 >=1 then
							if CheckBuff(  Six2_Table[Rand_Num2] , 508771 ) == false then
								Addbuff ( Six2_Table[Rand_Num2]  , 508771 , 0 , -1 )
								sleep ( 30 )
								local x = ReadRoleValue (Six2_Table[Rand_Num2], EM_RoleValue_X)
								local y = ReadRoleValue (Six2_Table[Rand_Num2], EM_RoleValue_Y)
								local z = ReadRoleValue (Six2_Table[Rand_Num2], EM_RoleValue_Z)
								local ball = CreateObj ( 105259 , x , y , z , 0 , 1) --隨機字身周圍生怪
								SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
								SetModeEx( ball , EM_SetModeType_Move, false) ---移動	(否)
								SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
								SetModeEx( ball , EM_SetModeType_Mark, true)			---可點選(是)
								SetModeEx( ball , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
								SetModeEx( ball , EM_SetModeType_Fight, true) ---可砍殺(是)
								SetModeEx( ball , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
								AddToPartition( ball,RoomID )
								WriteRoleValue ( ball , EM_RoleValue_PID , OwnerID() )
								WriteRoleValue ( ball , EM_RoleValue_Register1 ,Six2_Table[Rand_Num2])
								BeginPlot( ball,"cl_105259", 0 )
								Six2_Table = {}
								open = 0
								skill2 = 0
							elseif CheckBuff(  Six2_Table[Rand_Num2] , 508771 ) == true then
								table.remove ( Six2_Table , Rand_Num2 )
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
function cl_105259() 
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	local boss = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	Addbuff ( OwnerID()  , 508514 , 0 ,-1 )
	Addbuff ( player  , 508772 , 0 , -1 )
	SetPlot(  OwnerID(), "dead","cl_105259_dead", 20 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		--if HateListCount( boss ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 then
				CancelBuff( player, 508771 )
				CancelBuff( player, 508772 )
				delobj( OwnerID() )
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
function cl_105259_dead()
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	CancelBuff( player, 508771 )
	CancelBuff( player, 508772 )
	delobj( OwnerID() )
end
function cl_105232_1() -------------被操控的鋼鐵衛士-------------
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
							if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 105260 and 
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
function cl_136_03_01() -----------------------2~3王巡邏1-----------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105229,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105230,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105230,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105229,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,-1)
	BeginPlot( ObjMatrix[5] , "cl_105235" , 0 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,1)
	BeginPlot( ObjMatrix[6] , "cl_105235" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_01" , 0 )
end
function cl_136_wark03_01()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_01" , 0 )
end
function cl_136_03_02() --PAT屍妖
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105233,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105232,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105232,Matrix,2,-1)
	--ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105231,Matrix,3,0)
	--ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,-1)
	--ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_02" , 0 )
end
function cl_136_wark03_02()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_02" , 0 )
end
function cl_136_03_04() ----------------------------3~4王--------------------
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105233,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105235,Matrix,2,1)
	BeginPlot( ObjMatrix[2] , "cl_105235" , 0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105235,Matrix,2,-1)
	BeginPlot( ObjMatrix[3] , "cl_105235" , 0 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105229,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105232,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105232,Matrix,3,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark03_04_2" , 0 )
end
function cl_136_wark03_04_2()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_04" , 0 )
end
function cl_136_03_042() --PAT屍妖
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105233,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105235,Matrix,2,1)
	BeginPlot( ObjMatrix[2] , "cl_105235" , 0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105235,Matrix,2,-1)
	BeginPlot( ObjMatrix[3] , "cl_105235" , 0 )

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark04_03_2" , 0 )
end
function cl_136_wark04_03_2()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_03_042" , 0 )
end
function cl_105238AI()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local baer = LuaFunc_CreateObjByObj ( 105238 , OwnerID() )
	AddToPartition ( baer,RoomID ) ----物件加入場景,例行公事
	SetModeEx( baer , EM_SetModeType_Move, false) ---移動	(否)
	WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------對BOSS說是中控器AI產生的
	BeginPlot( baer,"cl_105238", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
	while 1 do
		sleep (5)
		local star = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if star == 1 then
		elseif star == 2 then
			delobj ( OwnerID() )
		elseif star == 3 then
			delobj ( baer )
			sleep ( 10 )
			baer = LuaFunc_CreateObjByObj ( 105238 , OwnerID() )
			AddToPartition ( baer,RoomID ) ----物件加入場景,例行公事
			SetModeEx( baer , EM_SetModeType_Move, false) ---移動	(否)
			WriteRoleValue ( baer , EM_RoleValue_PID, OwnerID() ) --------對BOSS說是中控器AI產生的
			BeginPlot( baer,"cl_105238", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
			WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 0 )
		end
	end
end
function cl_105238() ----------------大砲---------------------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local AI = ReadRoleValue ( OwnerID() ,  EM_RoleValue_PID )
	local skill = 2
	local x = 0
	local y = 0
	local z = 0
	local CombatBegin = 0
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	(否)
	SetPlot( OwnerID(), "dead","cl_136_105238_dead", 0 ) --boss執行死亡劇情,將直傳回給中控器判斷階段
	--SetStopAttack(OwnerID())   --停止攻擊 
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		local mots = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				WriteRoleValue ( AI , EM_RoleValue_Register1, 1 ) --------對BOSS說是中控器AI產生的
			end
			if CombatBegin == 1 then
				local oo = GetDistance( OwnerID() , AttackTarget );
				if oo <= 300 then
					skill = skill + 1
					if skill >= 3 then
						if mots <= 18 then
							CastSpelllv ( OwnerID() , AttackTarget , 497039 , 0 )
							sleep ( 5 )
							x = ReadRoleValue ( AttackTarget, EM_RoleValue_X)
							y = ReadRoleValue ( AttackTarget, EM_RoleValue_Y)
							z = ReadRoleValue ( AttackTarget, EM_RoleValue_Z)
							local ball = CreateObj ( 105261 , x , y , z , 0 , 1) --隨機字身周圍生怪
							AddToPartition( ball,RoomID )
							WriteRoleValue ( ball , EM_RoleValue_PID , OwnerID() )
							mots = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
							WriteRoleValue ( OwnerID() , EM_RoleValue_Register1 , mots+1 )
							--sysCastSpelllv ( ball , ball , 496414 , 0 )
							BeginPlot( ball , "cl_105229" , 0 )
							skill = 0
						end
					end
				else
					mots = 0
					skill = 0
				end
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1, 3 ) --------對BOSS說是中控器AI產生的
				mots = 0
				skill = 0
			end
		end
	end
end
function cl_136_105238_dead()
	local AI = ReadRoleValue ( OwnerID() ,  EM_RoleValue_PID )
	WriteRoleValue ( AI , EM_RoleValue_Register1, 2 ) --------對BOSS說是中控器AI產生的
	delobj ( OwnerID() )
end
function cl_105229()  ----小丑找不到人打就消失
	SetPlot( OwnerID(), "dead","cl_105229_dead", 0 ) --boss執行死亡劇情,將直傳回給中控器判斷階段
	local deltime = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		if HateListCount( OwnerID() ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
		elseif HateListCount ( OwnerID() ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
			end
			deltime = deltime + 1
			if deltime >= 30 then
				delobj ( OwnerID() )
			end
		end
	end
end
function cl_105229_dead()
	local bogbom = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	local mots = ReadRoleValue ( bogbom , EM_RoleValue_Register1 )
	WriteRoleValue ( bogbom , EM_RoleValue_Register1 , mots-1 )
	delobj ( OwnerID() )
end
function cl_136_04_05() --4~5王中間巡邏
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105233,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105232,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105232,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105235,Matrix,3,1)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark04_05" , 0 )
end
function cl_136_wark04_05()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_04_05" , 0 )
end
function cl_136_04_052() --6~7王中間巡邏
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105237,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105236,Matrix,2,1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105236,Matrix,2,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(105237,Matrix,3,0)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(105236,Matrix,3,-1)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(105236,Matrix,3,1)


	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "cl_136_wark04_052" , 0 )
end
function cl_136_wark04_052()
	sleep( 10 )
	BeginPlot( OwnerID() , "cl_136_04_052" , 0 )
end