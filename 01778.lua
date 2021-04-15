
function Cang_127_Pat01()

	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime = checktime + 1
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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(103791,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(103795,Matrix,2,1)

	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Cang_127_Pat02" , 0 )
end

function Cang_127_Pat02()
	sleep( 10 )
	BeginPlot( OwnerID() , "Cang_127_Pat01" , 0 )
end


----棺材產生
function Cang_127_coffin_all()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Coffin = {}
	
	Coffin[0] = CreateObjByFlag( 114982, 780590, 0, 1)
	Coffin[1] = CreateObjByFlag( 114982, 780590, 1, 1)
	Coffin[2] = CreateObjByFlag( 114982, 780590, 2, 1)
	Coffin[3] = CreateObjByFlag( 114982, 780590, 3, 1)
	Coffin[4] = CreateObjByFlag( 114982, 780590, 4, 1)

	--for i= 0 , 4 do		
	--	AddToPartition( Coffin[i] , RoomID )
	--	SetPlot( Coffin[i], "touch" , "Cang_127_coffin_touch" , 10 )
	--end
	
	AddToPartition( Coffin[0] , RoomID )
	AddToPartition( Coffin[1] , RoomID )
	AddToPartition( Coffin[2] , RoomID )
	AddToPartition( Coffin[3] , RoomID )
	AddToPartition( Coffin[4] , RoomID )
	SetPlot( Coffin[0], "touch" , "Cang_127_coffin_touch" , 10 )
	SetPlot( Coffin[1], "touch" , "Cang_127_coffin_touch" , 10 )
	SetPlot( Coffin[2], "touch" , "Cang_127_coffin_touch" , 10 )
	SetPlot( Coffin[3], "touch" , "Cang_127_coffin_touch" , 10 )
	SetPlot( Coffin[4], "touch" , "Cang_127_coffin_touch" , 10 )
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, Coffin[0])
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, Coffin[1])	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Coffin[2])
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register4, Coffin[3])
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register5, Coffin[4])
	SetPlot( OwnerID(), "range" , "Cang_127_coffin_range" , 50 )
end

----觸碰range, 丟入空range, begin主體script
function Cang_127_coffin_range()
	SetPlot( TargetID(),"range", "" ,40 )
	BeginPlot( TargetID(), "Cang_127_coffin_allfire", 10)
end

----檢查所有棺材是否被開啟, 沒有開啟的丟怪
function Cang_127_coffin_allfire()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	
	local coffin = {}
	local Monster = {}
	coffin[0] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1 )
	coffin[1] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register2 )
	coffin[2] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register3 )	
	coffin[3] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register4 )
	coffin[4] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register5 )

	if GetDistance( OwnerID(), TargetID()) <= 50 then
		if CheckBuff ( coffin[0] , 506431 ) == false then
			AddBuff( coffin[0], 506431, 0 , -1)
			SetPlot( coffin[0],"touch", "" ,40 )
			Monster[0] = CreateObjByFlag( 103794, 780590, 0, 1)
			AddToPartition( Monster[0] , RoomID )	--加進舞台
			SetAttack( Monster[0], OwnerID())
		end
		if CheckBuff ( coffin[1] , 506431 ) == false then
			AddBuff( coffin[1], 506431, 0 , -1)
			SetPlot( coffin[1],"touch", "" ,40 )
			Monster[1] = CreateObjByFlag( 103794, 780590, 1, 1)
			AddToPartition( Monster[1] , RoomID )	--加進舞台
			SetAttack( Monster[1], OwnerID())
		end
		if CheckBuff ( coffin[2] , 506431 ) == false then
			AddBuff( coffin[2], 506431, 0 , -1)
			SetPlot( coffin[2],"touch", "" ,40 )
			Monster[2] = CreateObjByFlag( 103794, 780590, 2, 1)
			AddToPartition( Monster[2] , RoomID )	--加進舞台
			SetAttack( Monster[2], OwnerID())
		end
		if CheckBuff ( coffin[3] , 506431 ) == false then
			AddBuff( coffin[3], 506431, 0 , -1)
			SetPlot( coffin[3],"touch", "" ,40 )
			Monster[3] = CreateObjByFlag( 103794, 780590, 3, 1)
			AddToPartition( Monster[3] , RoomID )	--加進舞台
			SetAttack( Monster[3], OwnerID())
		end
		if CheckBuff ( coffin[4] , 506431 ) == false then
			AddBuff( coffin[4], 506431, 0 , -1)
			SetPlot( coffin[4],"touch", "" ,40 )
			Monster[4] = CreateObjByFlag( 103794, 780590, 4, 1)
			AddToPartition( Monster[4] , RoomID )	--加進舞台
			SetAttack( Monster[4], OwnerID())
		end
	end
end

----棺材觸碰劇情, rnd 1出怪, rnd 2給buff
function Cang_127_coffin_touch()

	SetPlot( TargetID()  ,"touch", "" ,0 )
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	AddBuff( TargetID(), 506431, 0 , -1)
	
	local RND =  DW_Rand( 2 )	-- 產生亂數
	if RND == 2 then
		local Monster = LuaFunc_CreateObjByObj ( 103794, OwnerID() )
		AddToPartition( Monster , RoomID )	--加進舞台
		SetAttack( Monster, OwnerID())
	elseif RND == 1 then
		--給buff
		local Ghost = LuaFunc_CreateObjByObj ( 103800, OwnerID() )
		AddToPartition( Ghost , RoomID )
		SetModeEX( Ghost  , EM_SetModeType_Gravity , false )--重力
		SetModeEx( Ghost  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
		SetModeEx( Ghost  , EM_SetModeType_Mark, false )--標記
		SetModeEx( Ghost  , EM_SetModeType_Move, false )--移動
		SetModeEx( Ghost  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Ghost  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Ghost  , EM_SetModeType_Strikback, false )--反擊

		local Player = SearchRangePlayer ( TargetID() , 200 )
		for i=0,table.getn(Player)-1 do
			if CheckID( Player[i] ) == true and 
			ReadRoleValue( Player[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( Player[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡；檢查是不是玩家
				AddBuff( Player[i], 506432, 0 , 300)
				--Castspell
			end	
		end	
		sleep(150)
		DelObj( Ghost )
	end
end

--------------------------中間機關建立--------------------------
function Cang_127_trap_01()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Door = {}
	Door[0] = CreateObjByFlag( 103281, 780591, 0, 1)			
	SetModeEX( Door[0]  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Door[0]  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Door[0]  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door[0]  , EM_SetModeType_Move, false )--移動
	SetModeEx( Door[0]  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Door[0]  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door[0]  , EM_SetModeType_Strikback, false )--反擊
	AddToPartition( Door[0] , RoomID )	
	Door[1] = CreateObjByFlag( 103281, 780591, 1, 1)			
	SetModeEX( Door[1]  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Door[1]  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Door[1]  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door[1]  , EM_SetModeType_Move, false )--移動
	SetModeEx( Door[1]  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Door[1]  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door[1]  , EM_SetModeType_Strikback, false )--反擊
	AddToPartition( Door[1] , RoomID )	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, 	Door[0])
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, 	Door[1])

	SetPlot( OwnerID() , "range" , "Cang_127_trap_range" , 50 )
end
----機關範圍
function Cang_127_trap_range()
	
	if CheckID ( OwnerID() ) == true or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )==0 then
		SetPlot( TargetID() , "range" , "" , 10 )
		BeginPlot( TargetID() , "Cang_127_trap_02" , 0)
		WriteRoleValue( TargetID() ,EM_RoleValue_PID, OwnerID())
	end
end
----機關主體
function Cang_127_trap_02()

	local Doorstart = 0
	local Door = {}
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Target = ReadRoleValue(OwnerID(),EM_RoleValue_PID)		
	
	Door[0] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1 )
	Door[1] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register2 )
	if Doorstart == 0 then
		SetDefIdleMotion( Door[0],ruFUSION_MIME_ACTIVATE_LOOP)
		SetDefIdleMotion( Door[1],ruFUSION_MIME_ACTIVATE_LOOP)
		SetModeEx( Door[0]  , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( Door[1]  , EM_SetModeType_Obstruct, true )--阻擋
		Doorstart = 1
	end	
----蟲子掉落
	local roach = {}
	for i = 0, 9 do
		local RND01 = DW_Rand( 50 )
		local RND02 = DW_Rand( 50 )
		--roach[i] = CreateObjByFlag( 103796, 780591, 2, 1)		
		roach[i] = star_CreateObj( OwnerID() , 103796 , RND01 , 50 , RND02 , RoomID , 0) 
		AddToPartition( roach[i] , RoomID )	
		SetModeEX ( roach[i]  , EM_SetModeType_Gravity , true )--重力
		SetAttack ( roach[i], Target )
	end
	
	local open = 0
	local count1 = 0	
	local count2 = 0
	local count3 = 0 
	local count4 = 0
	local count5 = 0
	local count6 = 0
	local count7 = 0
	local count8 = 0	
 	local count9 = 0
	local count10 = 0		
	while true do
		sleep(10)
		Say( OwnerID(), "open="..open)
		if CheckID ( Target ) == false or ReadRoleValue( Target , EM_RoleValue_IsDead )==1 then
			SetDefIdleMotion( Door[0] , ruFUSION_MIME_IDLE_STAND )
			SetDefIdleMotion( Door[1] , ruFUSION_MIME_IDLE_STAND )	
			SetModeEx( Door[0]  , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Door[1]  , EM_SetModeType_Obstruct, false )--阻擋
			SetPlot( OwnerID() , "range" , "Cang_127_trap_range" , 50 )
			for i=0 , 9 do
				DelObj( roach[i] )
			end
			break
		end
----蟲子檢查結束開門
		if count1 == 0 then
			if CheckID ( roach[0] ) == false or
				ReadRoleValue( roach[0] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count1 = 1
			end
		end
		if count2 == 0 then		
			if CheckID ( roach[1] ) == false or
				ReadRoleValue( roach[1] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count2 = 1
			end
		end	
		if count3 == 0 then			
			if CheckID ( roach[2] ) == false or
				ReadRoleValue( roach[2] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count3 = 1
			end
		end
		if count4 == 0 then			
			if CheckID ( roach[3] ) == false or
				ReadRoleValue( roach[3] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count4 = 1
			end
		end
		if count5 == 0 then			
			if CheckID ( roach[4] ) == false or
				ReadRoleValue( roach[4] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count5 = 1
			end
		end
		if count6 == 0 then			
			if CheckID ( roach[5] ) == false or
				ReadRoleValue( roach[5] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count6 = 1
			end
		end
		if count7 == 0 then			
			if CheckID ( roach[6] ) == false or
				ReadRoleValue( roach[6] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count7 = 1
			end
		end
		if count8 == 0 then			
			if CheckID ( roach[7] ) == false or
				ReadRoleValue( roach[7] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count8 = 1
			end
		end	
		if count9 == 0 then			
			if CheckID ( roach[8] ) == false or
				ReadRoleValue( roach[8] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count9 = 1
			end
		end
		if count10 == 0 then			
			if CheckID ( roach[9] ) == false or
				ReadRoleValue( roach[9] , EM_RoleValue_IsDead )==1 then
				open = open + 1
				count10 = 1
			end
		end

		if open == 10 then 
			SetDefIdleMotion( Door[0] , ruFUSION_MIME_IDLE_STAND )
			SetDefIdleMotion( Door[1] , ruFUSION_MIME_IDLE_STAND )
			SetModeEx( Door[0]  , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Door[1]  , EM_SetModeType_Obstruct, false )--阻擋
			break
		end
	end	
end

------------------------最後王前機關------------------------


--機關發動
function Cang_127_trap02()
	SetPlot( OwnerID(), "range" , "Cang_127_trap02_range" , 50 )
end

function Cang_127_trap02_range()
	SetPlot( TargetID(), "range" , "" , 0 )
	BeginPlot( TargetID(), "Cang_127_Marsh_trap02_01", 0 )
end

function Cang_127_Marsh_trap02_01()
--關門放狗	
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Trap = {}
	local R = 0
	local Door = CreateObjByFlag( 103281, 780593, 10, 1)			
	SetModeEX( Door  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Door  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Door  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Door  , EM_SetModeType_Move, false )--移動
	SetModeEx( Door  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Door  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Door  , EM_SetModeType_Strikback, false )--反擊
	AddToPartition( Door , RoomID )
	SetDefIdleMotion( Door,ruFUSION_MIME_ACTIVATE_LOOP)
	SetModeEx( Door  , EM_SetModeType_Obstruct, true )--阻擋	
--建立10個可以攻擊的機關
	for i= 0, 9 do
		--Say(OwnerID(), "i="..i )
		Trap[i] = CreateObjByFlag( 103278, 780593, i, 1)
		SetModeEX( Trap[i]  , EM_SetModeType_Gravity , false )--重力
		--SetModeEx( Trap[i]  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
		--SetModeEx( Trap[i]  , EM_SetModeType_Mark, false )--標記
		SetModeEx( Trap[i]  , EM_SetModeType_Move, false )--移動
		SetModeEx( Trap[i]  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Trap[i]  , EM_SetModeType_Strikback, false )--反擊
		AddToPartition( Trap[i] , RoomID )
		AddBuff( Trap[i], 506700, 0, -1)
	end
--10個機關只有一個是正確的，其他九個是錯的
	if R == 0 then
		local RND =  Rand( 9 )	-- 產生亂數
		--BeginPlot( Trap[RND] , "Cang_127_trap02_true" , 0)
		WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, 	Trap[RND])
		R = 1
		for i= 0, 9 do
			if i ~= RND then
				--BeginPlot( , "Cang_127_trap02_false" , 0)
				SetPlot( Trap[i] , "Dead" , "Cang_127_trap02_false" , 10 )
			end
		end
	end
--當正確的機關被打壞，機關整個停止	
	local close
	while true do
		sleep(10)
		close = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1 )
		if CheckID ( close ) == false or
		ReadRoleValue( close , EM_RoleValue_IsDead )==1 then
			SetModeEx( Door  , EM_SetModeType_Obstruct, false )--阻擋
			SetDefIdleMotion( Door,ruFUSION_MIME_IDLE_STAND)
		end
	end
end

function Cang_127_trap02_false()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local burst01 = LuaFunc_CreateObjByObj ( 103797, OwnerID() )
	local burst02 = LuaFunc_CreateObjByObj ( 103797, OwnerID() )
	local burst03 = LuaFunc_CreateObjByObj ( 103797, OwnerID() )
	AddToPartition( burst01 , RoomID )
	AddToPartition( burst02 , RoomID )
	AddToPartition( burst03 , RoomID )	
	WriteRoleValue( burst01 , EM_RoleValue_Livetime, 30 )
	WriteRoleValue( burst02 , EM_RoleValue_Livetime, 30 )
	WriteRoleValue( burst03 , EM_RoleValue_Livetime, 30 )
end



------------------------真理之手劇情------------------------

function Cang_127_Truehand()

	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue(  OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			CastSpellLV( OwnerID(), OwnerID(), 495454 , 1 ) --慌亂
			Say( OwnerID(), "[SC_103791_01]")
			--我不會把我們的計畫告訴任何人的!!
			sleep(100)
			Hide ( OwnerID() )
		end
	end
end

function Cang_127_Truehand_02()

	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue(  OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			CastSpellLV( OwnerID(), OwnerID(), 495454 , 1 ) --慌亂
			Say( OwnerID(), "[SC_103791_02]")
			--真理遠超過死亡的意義，沒有人可以竊取..
			sleep(100)
			CastSpellLV( OwnerID(), OwnerID(), 495455 , 1 ) --自殺
		end
	end
end

------------------------小怪技能檢查------------------------

function Cang_127_SkillA()
	if CheckBuff ( OwnerID() , 506434 ) == true then
		AddBuff( OwnerID(), 506438, 10, 5 )
	end 
end

------------------------老鼠自爆控制------------------------

function Cang_127_bomb()

	while true do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 	
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			if GetDistance( AttackTarget , OwnerID() ) < 70 then
				CastSpellLV( OwnerID(), OwnerID(), 495463 , 8 ) --爆炸
			end
		end
	end
end

