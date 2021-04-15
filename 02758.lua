-- 702758 萬聖節版瑪拉蒂娜  - 地板與地磚


function lua_mika_2012hallow_floor_01()   --生出地板 Jok
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
 	local floor = CreateObjByFlag( 101471, 780201, 0 , 1 );  --地板引導者 隱藏物件
	AddToPartition( floor, RoomID) 

	SetModeEx( floor    , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( floor    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( floor    , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( floor    , EM_SetModeType_Mark, false )--標記
	SetModeEx( floor    , EM_SetModeType_Move, false )--移動
	SetModeEx( floor    , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( floor    , EM_SetModeType_HideName, true )--名稱
	SetModeEx( floor   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( floor   , EM_SetModeType_Show , false ) --顯示
	SetModeEx( floor   , EM_SetModeType_Fight , false )--可砍殺攻擊
--	say(floor, "1234")
	BeginPlot( floor , "lua_mika_2012hallow_floor_02" , 0 )   -- 701121 地磚陣型
end


--陣型產生範例
function lua_mika_2012hallow_floor_02()
	local floor = OwnerID()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 32
	local count = 7 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 60000 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 8000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local RoomID = ReadRoleValue( floor ,EM_RoleValue_RoomID) 


--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(111812,Matrix,1,0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(111811,Matrix,1,1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(111811,Matrix,1,-1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(111812,Matrix,1,2)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(111812,Matrix,1,-2)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(111811,Matrix,1,3)

	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(111811,Matrix,2,0 )
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(111812,Matrix,2,1 )
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(111812,Matrix,2,-1 )
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(111811,Matrix,2,2)
	ObjMatrix[11] = LuaFunc_CreateNPCByMatrix(111811,Matrix,2,-2)
	ObjMatrix[12] = LuaFunc_CreateNPCByMatrix(111812,Matrix,2,3)

	ObjMatrix[13] = LuaFunc_CreateNPCByMatrix(111812,Matrix,3,0 )
	ObjMatrix[14] = LuaFunc_CreateNPCByMatrix(111811,Matrix,3,1 )
	ObjMatrix[15] = LuaFunc_CreateNPCByMatrix(111811,Matrix,3,-1 )
	ObjMatrix[16] = LuaFunc_CreateNPCByMatrix(111812,Matrix,3,2)
	ObjMatrix[17] = LuaFunc_CreateNPCByMatrix(111812,Matrix,3,-2)
	ObjMatrix[18] = LuaFunc_CreateNPCByMatrix(111811,Matrix,3,3)

	ObjMatrix[19] = LuaFunc_CreateNPCByMatrix(111811,Matrix,4,0 )
	ObjMatrix[20] = LuaFunc_CreateNPCByMatrix(111812,Matrix,4,1 )
	ObjMatrix[21] = LuaFunc_CreateNPCByMatrix(111812,Matrix,4,-1)
	ObjMatrix[22] = LuaFunc_CreateNPCByMatrix(111811,Matrix,4,2)
	ObjMatrix[23] = LuaFunc_CreateNPCByMatrix(111811,Matrix,4,-2)
	ObjMatrix[24] = LuaFunc_CreateNPCByMatrix(111812,Matrix,4,3)

	ObjMatrix[25] = LuaFunc_CreateNPCByMatrix(111812,Matrix,5,0 )
	ObjMatrix[26] = LuaFunc_CreateNPCByMatrix(111811,Matrix,5,1 )
	ObjMatrix[27] = LuaFunc_CreateNPCByMatrix(111811,Matrix,5,-1 )
	ObjMatrix[28] = LuaFunc_CreateNPCByMatrix(111812,Matrix,5,2)
	ObjMatrix[29] = LuaFunc_CreateNPCByMatrix(111812,Matrix,5,-2)
	ObjMatrix[30] = LuaFunc_CreateNPCByMatrix(111811,Matrix,5,3)

	ObjMatrix[31] = LuaFunc_CreateNPCByMatrix(111811,Matrix,6,0 )
	ObjMatrix[32] = LuaFunc_CreateNPCByMatrix(111812,Matrix,6,1 )
	ObjMatrix[33] = LuaFunc_CreateNPCByMatrix(111812,Matrix,6,-1 )
	ObjMatrix[34] = LuaFunc_CreateNPCByMatrix(111811,Matrix,6,2)
	ObjMatrix[35] = LuaFunc_CreateNPCByMatrix(111811,Matrix,6,-2)
	ObjMatrix[36] = LuaFunc_CreateNPCByMatrix(111812,Matrix,6,3)

	for i = 1 , table.getn(ObjMatrix) do
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Mark, true )--標記
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Move, false )--移動
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_HideName, false )--名稱
		SetModeEx( ObjMatrix[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( ObjMatrix[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( ObjMatrix[i],  EM_SetModeType_Gravity, false )--重力
		SetModeEx( ObjMatrix[i]    , EM_SetModeType_Obstruct, true )--阻擋
		Hide(ObjMatrix[i])
		Show(  ObjMatrix[i],RoomID)

	end


	local floor1 = LuaFunc_SearchNPCbyOrgID( floor , 111811, 300 , 1)       --地磚1

--地板1
	local floorX={}
	for i=0,table.getn(floor1)-1 do
		floorX[i+1]=floor1[i]
	end
	local Y={}

	for i=1 , 18 do
		local W = rand(table.getn(floorX))+1
		--ScriptMessage( OwnerID(),  -1, 0 , " W = "..W , 0 )	--對手未進入，比賽結束
		Y[i] = floorX[W]
		--ScriptMessage( OwnerID(),  -1, 0 , "Y["..i.."] = "..Y[i] , 0 )	--對手未進入，比賽結束
		table.remove(floorX,W)
	end

	for i=1, 10 do  
		SetCursorType( Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "lua_mika_2012hallow_obj1_01" , 10 )   -- 怪異魔瓜
	end

	for i=11, 13 do 
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "lua_mika_2012hallow_obj3_01" , 10 )   -- 炸彈瓜
	end

	for i=14,18 do
		SetCursorType(Y[i] , eCursor_Mine );
		SetPlot( Y[i] ,"touch",  "lua_mika_2012hallow_obj4_01" , 10 )    --  陷阱
	end

--地板2
	sleep(5)

	local floor2 = LuaFunc_SearchNPCbyOrgID( floor , 111812, 300 , 1)       --地磚2

	local floorY={}
	for g=0,table.getn(floor2)-1 do
		floorY[g+1]=floor2[g]
		--ScriptMessage( OwnerID(),  -1, 0 , "floorY[g+1] = "..floorY[g+1].."g="..g , 0 )	--對手未進入，比賽結束
	end
	local H={}
	for g=1 , 18 do
		local W =rand(table.getn(floorY))+1

		H[g] = floorY[W]
		table.remove(floorY,W)
	end

	for g=1, 4 do
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g] ,"touch",  "lua_mika_2012hallow_obj4_01" , 10 )   -- 陷阱	
	end

	for g=5, 14 do -- 10
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g] ,"touch",  "lua_mika_2012hallow_obj5_01" , 10 )   --墳墓
	end

	for g=15, 18 do  -- x4
		SetCursorType(H[g] , eCursor_Mine );
		SetPlot( H[g]  ,"touch",  "lua_mika_2012hallow_obj6_01" , 10 )   -- 補血
	end
end


-- 刪除所有物件  --  瑪拉的部分也要刪 (避免玩家先玩瑪拉後再來玩此活動時物件沒刪除 )
function lua_mika_2012hallow_delall()
	local jok = OwnerID()  
	local TempObj = { 107346, 107347, 107348}

	Lua_DavisDelObj(TempObj)

end

function lua_mika_2012hallow_delall2()
	local jok = OwnerID()  
	local TempObj2 = { 
			107346, 107347, 107348, 
			121404, 121405, 121408, 121411, 121407, 121410, 121412, 121413, 111811, 111812,  
			101472, 101273, 101269, 101270, 101271, 101272, 101636, 101637, 101638, 101639, 
			101640, 101641, 101642, 101643, 101644, 101645, 101646, 101647, 101648, 101649, 
			101650, 101651, 101652, 101653, 101654, 101655, 102982, 102983, 102984, 102985, 
			101486, 101487, 101488, 101489, 111956, 101471, 113105, 100044
			}

	Lua_DavisDelObj(TempObj2)

end


--------------------------------------------- 出現噴火瓜

function lua_mika_2012hallow_fire01()
	local jok = OwnerID() 
	local RoomID = ReadRoleValue( jok ,EM_RoleValue_RoomID)
	local objid = 121413
	local flag = 780235
	local number = {1, 6, 15, 20}
	local pumpkin

	for i = 1 , 4 , 1 do
		pumpkin = CreateObjByFlag( objid , flag , number[i] , 1 ) --使用旗子產生兔子 npc 旗子編號 數量 
		SetModeEx( pumpkin , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( pumpkin , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( pumpkin , EM_SetModeType_Obstruct , false )--阻擋
		SetModeEx( pumpkin , EM_SetModeType_Mark , true )--標記
		SetModeEx( pumpkin , EM_SetModeType_Move , true )--移動
		SetModeEx( pumpkin , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( pumpkin , EM_SetModeType_HideName , true )--名稱
		SetModeEx( pumpkin , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( pumpkin , EM_SetModeType_Show , True ) --顯示
		SetModeEx( pumpkin , EM_SetModeType_Fight , false )--可砍殺攻擊
		WriteRoleValue( pumpkin , EM_RoleValue_IsWalk , 0 ) --命令該角色用跑的
		MoveToFlagEnabled( pumpkin , false )	-- 關閉巡邏劇情
		AddToPartition( pumpkin , RoomID )
		CallPlot( pumpkin , "lua_mika_2012hallow_fire02_1" , pumpkin , i )	-- 巡邏劇情
		CallPlot( pumpkin , "lua_mika_2012hallow_obj2_001" , pumpkin )	-- 觸碰劇情
	end

end

function lua_mika_2012hallow_fire02_1( pumpkin , Step )

	local flag1 = 780235
	local flagnumber = {1, 6, 15, 20}
	local number = 1
	local X , Y , Z = {}  , {} , {}

	for i = 1 , #flagnumber , 1 do
		X[i] = GetMoveFlagValue( Flag1 , flagnumber[i] , EM_RoleValue_X )
		Y[i] = GetMoveFlagValue( Flag1 , flagnumber[i] , EM_RoleValue_Y )
		Z[i] = GetMoveFlagValue( Flag1 , flagnumber[i] , EM_RoleValue_Z )
	end

	while true do
		if Step + 1 == 5 then
			Step = 1
		else
			Step = Step + 1
		end
	--	DebugMsg( 0 , 0 , "Base "..i.." : "..X[Step].." , "..Y[Step].." , "..Z[Step] )		
		MoveDirect( pumpkin , X[Step] , Y[Step] , Z[Step] )
		Sleep(50)
	end
end


function lua_mika_2012hallow_obj2_001(OID)
	setplot(OID, "touch", "lua_mika_2012hallow_obj2_002", 50 )
end

function lua_mika_2012hallow_obj2_002()
	local OID = OwnerID()  --玩家
	local TID = TargetID()  -- 瓜

	if CheckBuff(TID, 623500)  == false then  --瓜沒在cd
		local playerdir = ReadRoleValue(OID, EM_RoleValue_DIR )
		AdjustFaceDir(TID, OID, 0 )
		Beginplot(TID, "lua_mika_2012hallow_obj2_005", 0 )  -- 點瓜劇情
	else
		NPCSAY(TID, "[SC_2012HALLOW_MALA_25]" )	-- 讓我休息一下吧，嘻嘻！
	end
end

function lua_mika_2012hallow_obj2_005()
	local OID = OwnerID()  -- 瓜

	setplot(OID, "touch", "", 0 )
	CastSpell( OID , OID , 850413 )  -- 參考法術  498629
	NPCSAY(OID, "[SC_2012HALLOW_MALA_23]" )	-- 就是這樣！嘻嘻！
	AddBuff(OID, 623500, 0, 30 )  -- 給瓜Buff X秒鐘 CD用  暈眩
	sleep(15)
	setplot(OID, "touch", "lua_mika_2012hallow_obj2_002", 30 )
end


-- 基本法術執行
function lua_mika_2012hallow_obj2_003()
	local OID = OwnerID()  -- 瓜
	local TID = TargetID()  -- 鬼
	local OrgID = ReadRoleValue( TID , EM_RoleValue_OrgID ) -- 目標的orgid 
	local ghostlist = {107346, 107347, 107348}

	if orgid == ghostlist[1] or orgid == ghostlist[2] or  orgid == ghostlist[3] then
		if CheckBUff(TID, 623501) == false then
			Beginplot(TID, "lua_mika_2012hallow_obj2_004", 0 )
		end
	end
end

function lua_mika_2012hallow_obj2_004()
	local OID = OwnerID()  -- 鬼
	local grave = ReadRoleValue(OID, EM_RoleValue_Register+9 )  -- 墳墓

--	say(OID, "dead")
	AddBuff(OID, 623501, 0, -1 )

	PlayMotionEX( OID, ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	WriteRoleValue(grave, EM_RoleValue_Register+2 , 99 )  -- 告訴墳墓他死了
--	say(grave, "ghost dead" )
	sleep(15)
	Delobj(OID)
end