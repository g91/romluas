function Lua_Hao_Return_Coordinate( ObjID )	-- 回傳座標

	local X = ReadRoleValuefloat( ObjID , EM_RoleValue_X )
	local Y = ReadRoleValuefloat( ObjID , EM_RoleValue_Y )  
	local Z = ReadRoleValuefloat( ObjID , EM_RoleValue_Z )
	local Dir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	return X , Y , Z , Dir
end

function Lua_Hao_Pumpkin_CreateObj( ObjID , Room , Choise )	-- 建立物件

	if Choise == nil then
		SetModeEx( ObjID , EM_SetModeType_ShowRoleHead , false )	--頭像框
		SetModeEx( ObjID , EM_SetModeType_Show , true )		--顯示
		SetModeEx( ObjID , EM_SetModeType_Mark , false )		--標記 
		SetModeEx( ObjID , EM_SetModeType_HideName , true )	--不顯示名稱
		SetModeEx( ObjID , EM_SetModeType_Fight , false )		--砍殺		
	elseif Choise == 1 then	
		SetModeEx( ObjID , EM_SetModeType_Show , false )		--顯示
		SetModeEx( ObjID , EM_SetModeType_Mark , false )		--標記
		SetModeEx( ObjID , EM_SetModeType_HideName , true )	--不顯示名稱
		SetModeEx( ObjID , EM_SetModeType_Move , false )		--移動		
	end
	MoveToFlagEnabled( ObjID , false )				--關閉巡邏劇情
	AddToPartition( ObjID , Room )
end

function Lua_Hao_Pumpkin_Step_1()	-- 建立起始的隱形物件

	local Maker = OwnerID()
	local Player = {}
	local Room = ReadRoleValue( Maker , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate( Maker )	-- 取得座標
	local ObjID = CreateObj( 101227 , X , Y , Z , Dir , 1 )		-- 建立物件
	CallPlot( ObjID , "Lua_Hao_Pumpkin_CreateObj" , ObjID , Room )
	CallPlot( ObjID , "Lua_Hao_Pumpkin_Step_2" , ObjID , Room , X , Y , Z , Dir )	-- 掃描場地起點範圍內玩家
	CallPlot( ObjID , "Lua_Hao_Pumpkin_Step_3" , ObjID , Room )			-- 呼叫起始的隱形物件產生小怪
end

function Lua_Hao_Pumpkin_Step_2( ObjID , Room , Boxer_X , Boxer_Y , Boxer_Z , Boxer_Dir )	-- 掃描場地起點範圍內玩家

	local X , Y , Z , Dir	-- 每位玩家的 X , Y , Z 
	local Player = {}	-- 玩家群
	local Boxer		-- 每位玩家的黑盒子

	while true do	-- 掃描範圍內的已報名的玩家
		Player = SearchRangePlayer( ObjID , 20 )
		for i = 0 , #Player , 1 do
		--	if CheckID( Player[i] ) == true and CheckFlag( Player[i] , 547023 ) == false then	-- 判斷入場條件 已報名(547023)、進行中(547024)、已完成(547025)
			if CheckID( Player[i] ) == true and CheckBuff( Player[i] , 623477 ) == false then	-- 判斷入場條件 已報名(547023)、進行中(547024)、已完成(547025)
				X , Y , Z , Dir = Lua_Hao_Return_Coordinate( Player[i] )	-- 取得座標
				Boxer = CreateObj( 113105 , X , Y , Z , Dir , 1 )
				CallPlot( Boxer , "Lua_Hao_Pumpkin_CreateObj" , Boxer , Room , 1 )	-- 建立每位參與玩家的專屬黑盒子
				CallPlot( Boxer , "Lua_Hao_Pumpkin_Gravitation" , Player[i] , ObjID , Boxer , Room , Boxer_X , Boxer_Y , Boxer_Z , Boxer_Dir )	-- 萬有引力
				-- 玩家、起始物件、個人的隱形物件、起始物件的 Room , X , Y , Z , Dir
				AddBuff( Player[i] , 623477 , 0 , -1 )
			--	SetFlag( Player[i] , 547023 , 1 )
			end
		end
		sleep(1)
	end
end

function Lua_Hao_Pumpkin_Step_3( Maker , Room )	-- 呼叫起始的隱形物件產生小怪

	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Maker)	-- 取得座標
	local ObjID , Random , Choise , MagicChoise
	local Range = 150
	local Num = 0
	local Build = 107336				-- 欄杆
--	local Monster = { 107337 , 107338 , 107339 }	-- 未決定、南瓜死神、三頭犬
--	local Magic = { 850395 , 850395 , 850397 }	-- 分數、緩速、睡眠
	local Monster = { 107337 , 107338 }	-- 小南瓜怪、南瓜死神
	local Magic = { 850395 , 850397 }	-- 緩速、睡眠
	local MonsterCount = #(Monster)		-- 怪物總量
	local MagicCount = #(Magic)			-- 法術總量
	local Motion = ruFUSION_ACTORSTATE_BUFF_BEGIN -- emotion 81

	while true do
--	while Num < 30 do
		if Num%5 == 0 then
			Random = Math.Random( -25 , 25 )					-- 隨機產生的X距離
			MagicChoise = 0							-- 施放法術
			ObjID = CreateObj( Build , X+Random , Y , Z-Range , Dir , 1 )		-- 產生欄杆
			SetPlot( ObjID , "Collision" ,  "Lua_Hao_Pumpkin_Fence" , 0 )		-- 碰撞劇情
		--	BeginPlot( ObjID , "Lua_Hao_Pumpkin_Fence" , 0 )			-- 欄杆施放法術
		--	DebugMsg( 0 , 0 , "Dir = "..Dir )
		else
			Random = Math.Random( -30 , 30 )					-- 隨機產生的X距離
			Choise = Math.Random(MonsterCount)				-- 隨機產生的怪物
			MagicChoise = Magic[Choise]						-- 施放法術
			ObjID = CreateObj( Monster[Choise] , X+Random , Y , Z-Range , Dir , 1 )	-- 產生小怪
		end
		CallPlot( ObjID , "Lua_Hao_Pumpkin_CreateObj" , ObjID , Room )	-- 建立物件
	--	if Dir > 45 or Dir <= 135 then		-- 46 ~ 135
		--	SetDir( ObjID , 90 )
	--		SetDir( ObjID , 270 )
	--	elseif Dir > 135 or Dir <= 215 then	-- 136 ~ 215
		--	SetDir( ObjID , 180 )
	--		SetDir( ObjID , 0 )
	--	elseif Dir > 215 or Dir <= 315 then	-- 216 ~ 315
		--	SetDir( ObjID , 270 )
	--		SetDir( ObjID , 90 )
	--	else					-- 316 ~ 45
		--	SetDir( ObjID , 0 )
	--		SetDir( ObjID , 180 )
	--	end
	
	--	SetDir( ObjID , Dir )
		AdjustFaceDir( ObjID , Maker , 0 )
		Callplot( ObjID , "Lua_Hao_Pumpkin_Direction" , Maker , 1 , 2 , MagicChoise , Motion )	-- 目標物件、每幾秒瞬移一次、每次瞬移的距離、法術ID、常駐動作
		Sleep(10)
		Num = Num + 1
	end
	DelObj(Maker)
end

function Lua_Hao_Pumpkin_Gravitation( Player , ObjID , Boxer , Room , Boxer_X , Boxer_Y , Boxer_Z , Boxer_Dir )

	Sleep(30)
--	DebugMsg( 0 , 0 , "Start" )
	local Time , X_Dis , Z_Dis = 1 , 0.5 , 0.5	-- 每幾秒瞬移一次、每次瞬移的X距離、每次瞬移的Y距離
	local X , Y , Z , Dir , Status
	local Num = 0
	local Buff = 623475
	
	while true do
		Status = CheckBuff( Player , Buff )
	--	Run = ReadRoleValue( Player , EM_RoleValue_NpcOnMove )
	--	還要檢查是否進行中
	--	if Status == 0 then
		if Status == true then
			X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取得座標
			if Math.Abs( X - Boxer_X ) > 1 then
				if X > Boxer_X then
			--		X = X - (X_Dis*Math.Cos(Cal))
					X = X - X_Dis
				else
			--		X = X + (X_Dis*Math.Cos(Cal))
					X = X + X_Dis   
				end
			end
			if Math.Abs( Z - Boxer_Z ) > 1 then
				if Z > Boxer_Z then
			--		Z = Z + (Z_Dis*Math.Sin(Cal))
					Z = Z - Z_Dis
				else
			--		Z = Z - (Z_Dis*Math.Sin(Cal))
					Z = Z + Z_Dis
				end
			end
			SetPos( Player , X , Y , Z , Dir )
			if Math.Abs( X - Boxer_X ) < 1 and Math.Abs( Z - Boxer_Z ) < 1 then
			--	SetPos( Player , Boxer_X , Boxer_Y , Boxer_Z , Boxer_Dir )
				DebugMsg( Player , Room , "break" )
				break
			end
		end
		Sleep(Time)			
	end
	DelObj(Boxer)
end

function Lua_Hao_Pumpkin_Fence()	-- 欄杆起始劇情

	SetPlot( Npc , "Collision" ,  "" , 0 )		-- 碰撞劇情
--	local Npc = OwnerID()
	local Player = OwnerID()
	local Npc = TargetID()
--	local Player = {}
	local Effect = 623475			-- 撞到時觸發的法術 - 混亂
	local X , Y , Z , Dir			-- 欄杆的 X , Y , Z , Dir
	local P_X , P_Y , P_Z , P_Dir		-- 玩家的 X , Y , Z , Dir
	local X_Dis , Y_Dis , Z_Dis = 5 , 7 , 20	-- 玩家與物件允許差距的 X , Y , Z 距離

--	X , Y , Z =  Lua_Hao_Return_Coordinate( Npc )
--	P_X , P_Y , P_Z , P_Dir =  Lua_Hao_Return_Coordinate( Player )
--	while true do
	--	Player = SearchRangePlayer( Npc , 20 )
	--	for i = 0 , #Player , 1 do
	--		if CheckID( player[i] ) == true then
			if ReadRoleValue( Player , EM_RoleValue_IsPlayer ) == 1 then
				X , Y , Z =  Lua_Hao_Return_Coordinate( Npc )
				P_X , P_Y , P_Z =  Lua_Hao_Return_Coordinate( Player )
	--			if Math.Abs( X - P_X ) < X_Dis and Math.Abs( Z - P_Z ) < Z_Dis then
--	Say( Npc , "|cff0000ff" ..X.. "|r".." ".."|cff0000ff" ..Y.. "|r".." ".."|cff0000ff" ..Z.. "|r" )
			--	DebugMsg( 0 , 0 , "Y = "..Y.." P_Y = "..P_Y )
					if Math.Abs( Y - P_Y ) > Y_Dis then
						DebugMsg( 0 , 0 , Math.Abs( Y - P_Y ) )
						Say( Npc , "|cff00ff00" .."Cross".. "|r" )
					--	Say( Npc , "Cross" )					
					else
					--	AddBuff( Player[i] , Effect , 0 , 3 )
						AddBuff( Player , Effect , 0 , 3 )
						Say( Npc , "|cffff0000" .."Hit".. "|r" )
					--	Say( Npc , "Hit" )
					end
	--			else
	--				Say( Npc , "|cffffff00" .."Close".. "|r" )				
				--	Say( Npc , "Close" )			
	--			end
	--		end
			end
	--	end
--		sleep(1)
--	end
	SetPlot( Npc , "Collision" ,  "Lua_Hao_Pumpkin_Fence" , 0 )		-- 碰撞劇情
end

function Lua_Hao_Pumpkin_Direction( Target , Time , Dis , Magic , Motion )	-- 目標物件、每幾秒瞬移一次、每次瞬移的距離、法術ID、常駐動作
	-- 是否需要加入 Dir
	local ObjID = OwnerID()	-- 瞬移物件
--	Say( ObjID , "Magic  = "..Magic )
	local Target_X , Target_Y , Target_Z , Target_Dir = Lua_Hao_Return_Coordinate( Target )	-- 取得座標
--	local Target_X , Target_Y , Target_Z	-- 目標物件的 X , Y , Z
--		Target_X = ReadRoleValue( Target , EM_RoleValue_X )
--		Target_Y = ReadRoleValue( Target , EM_RoleValue_Y )
--		Target_Z = ReadRoleValue( Target , EM_RoleValue_Z )
	local X , Y , Z , Dir , NewZ	-- 瞬移物件的 X , Y , Z , 瞬移物件與目標物件的距離
--	local Dir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	local Count = 0
	local PID

	while true do
		X , Y , Z , Dir = Lua_Hao_Return_Coordinate( ObjID )	-- 取得座標
	--	X = ReadRoleValue( ObjID , EM_RoleValue_X )
	--	Z = ReadRoleValue( ObjID , EM_RoleValue_Z )
	--	Y = GetHeight( X , ReadRoleValue( ObjID , EM_RoleValue_Y ) , Z )
		NewZ = Math.Abs( Target_Z - Z )
		if Count % 5 == 0 then
			PlayMotion( ObjID , Motion )
		end
		if NewZ - Dis >= 0 then
			if Magic > 0 then
				SysCastSpellLv ( ObjID , ObjID , Magic , 0 )
			else
				PID = ReadRoleValue( ObjID , EM_RoleValue_PID )
				if PID == 0 then
					WriteRoleValue( ObjID , EM_RoleValue_PID , Rand(2)+1 )
				end
				PID = ReadRoleValue( ObjID , EM_RoleValue_PID )
				if PID == 1 then
					Dir = Dir + 20
					if Dir >= 360 then
						Dir = Dir - 360
					end
				elseif PID == 2 then
					Dir = Dir - 20
					if Dir <= 0 then
						Dir = Dir + 360
					end
				end
			end
			if Z > Target_Z then
				SetPos( ObjID , X , Y , Z-Dis , Dir )
			elseif Z < Target_Z then
				SetPos( ObjID , X , Y , Z+Dis , Dir )
			end
		else
			SetPos( ObjID , X , Y , Target_Z , Dir )
			Sleep(1)
			DelObj(ObjID)
			break
		end
		ReCalculate( ObjID )
		Sleep(Time)
		Count = Count + 1
	end
end

function Lua_Hao_Pumpkin_Check_Buff(Buff)

	local Player = TargetID()
--	DebugMsg( 0 , 0 , GetDistance( OwnerID() , TargetID() ) )
	if CheckBuff( Player , Buff ) == true then
		return false
	end
end

function Lua_Hao_Pumpkin_Check_Height()	-- 測試高度

	DebugMsg( 0 , 0 , "123" )
	local Player = TargetID()
	local Y = ReadRoleValuefloat( Player , EM_RoleValue_Y )
	if Y <= 4 then
		Say( Player , "Oh No!!!" )
	elseif Y >= 8 then
		Say( Player , "Well Done!!!" )
	else
		Say( Player , "Good" )
	end
end
	
function Lua_Hao_Direction_Test()	-- 測試移動中

	local Player = OwnerID()
	while true do
		Say( Player , ReadRoleValue( Player , EM_RoleValue_NpcOnMove ) )
		Sleep(1)
	end
end

function Lua_Hao_Test_Color_Change()

	Say( OwnerID() , "|cff00ff00" .."Cross".. "|r" )
--	"|cffff00ff" .."Cross".. "|r"
end

function Lua_Hao_HateListInfo_Test()	-- 測試仇恨列表

	local Boxer = OwnerID()
	local Player = TargetID()
	local Num , ID , HatePoint	-- 仇恨列表、仇恨目標、仇恨點數
	--HateListInfo(OwnerID() ,Pos , EM_HateListInfoType_GItemID )
	Num = HateListCount( Player )
	Say( Player , Num )
	if Num > 0 then
		for i = 0 , Num-1 , 1 do
			ID = HateListInfo( Player , i , EM_HateListInfoType_GItemID )
			if ID == Boxer then
				Say( ID , "I am" )
				return false
			else
				Say( ID , "I am not" )			
			end
		end
	end
end

function Lua_Hao_Test_Collision_0()	-- 測試碰撞劇情

	X , Y , Z , Dir = Lua_Hao_Return_Coordinate( OwnerID() )	-- 取得座標
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boxer
	local Week = GetSystime(5)
	DebugMsg( 0 , 0 , Week )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	BeginPlot( OwnerID() , "Lua_Hao_Test_Collision_2" , 0 )
	for i = 0 , 29 , 1 do
		Boxer = CreateObj( 107336 , X+i*75 , Y , Z , Dir , 1 )
		AdjustFaceDir( Boxer , OwnerID() , 0 )
		CallPlot( Boxer , "Lua_Hao_Pumpkin_CreateObj" , Boxer , Room )	-- 建立每位參與玩家的專屬黑盒子
		SetPlot( Boxer , "Collision" ,  "Lua_Hao_Test_Collision_1" , 0 )
	end
end

function Lua_Hao_Test_Collision_1()	-- 測試碰撞劇情

--1 取得時間的”時”(0-23 午夜12點為0 )
--2 取得時間的”分”(0-59 )
--3 取得時間的”月”(0-11 一月為0 )
--4 取得時間的”日”(1-31)
--5 取得時間的”星期”(0-6 星期天為0 )
	local Num = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Num = Num / 10 
	Say( OwnerID() , Num )
--	SetPlot( TargetID() , "Collision" ,  "" , 0 )
	Say( TargetID() , "|cffff0000" .."Hit".. "|r" )
--	Say( OwnerID() , "I am OwnerID" )	-- 玩家
--	Say( TargetID() , "I am TargetID" )	-- Npc
--	ReCalculate( OwnerID() )
--	ReCalculate( TargetID() )
--	SetPlot( TargetID() , "Collision" ,  "Lua_Hao_Test_Collision_1" , 0 )
end

function Lua_Hao_Test_Collision_2()	-- 測試碰撞劇情

	local Num = 0
	while true do
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , Num )
		sleep(1)
		Num = Num + 1
	end
end