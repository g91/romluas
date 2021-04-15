--------------------------------------------------------------------永夜陣型產生
function Lua_EverNight_matrix()	

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 900 --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 0 --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local dis = 8	--間距

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	if ZoneID == 1 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101478,Matrix,1, 0 )
	elseif ZoneID == 2 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101478,Matrix,1, 0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101479,Matrix,2, 1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101479,Matrix,2, -1)
	elseif ZoneID == 4 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101480,Matrix,1, 0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2, 1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2, -1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2,0 )
	elseif ZoneID == 5 then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101480,Matrix,2, 0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101481,Matrix,1, 1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101481,Matrix,1, -1)
		ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2, 1 )
		ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101481,Matrix,2, -1 )
	end

--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )
--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "Lua_EverNight_matrix_Reset" , 0 )
end

function Lua_EverNight_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_EverNight_matrix" , 0 )
end


---------開啟巡邏鑰匙
function Lua_EverNightKey()
	if EverNightKey == 0 then
		local FollowMonster = 101471
		local Count = SetSearchAllNPC(0)
		local NPC = {}
		local HowMany = 0
		for i = 1 , Count do
			NPC[i] = GetSearchResult()
		end
		for i = 1, Count do
			if ReadRoleValue(NPC[i] ,EM_RoleValue_OrgID) == FollowMonster then
				BeginPlot( NPC[i], "Lua_EverNight_matrix" , 5 )
			end
		end
	ClientSkyType( EM_ClientSkyProcType_Night ) --改變遊戲時間為 夜晚
	EverNightKey = 1
	else
	Say(OwnerID(),"Patrol already ON")
	end
end

function Lua_EverNightKeyOneSetp()
	if EverNightKeyOneStep == 0 then
		local Obj = Role:new( OwnerID() )
		local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
		if ZoneID == 2 then
			local Monster = CreateObj ( 101417, -435 , 35 , 7788 ,20 , 1)      --特效   照座標         
			local Ball = CreateObj ( 112060, -435 , 70 , 7788 ,20 , 1)      --特效   照座標         
			SetModeEx( Monster , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( Monster , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Monster , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Monster , EM_SetModeType_Obstruct, true )--阻擋
			SetModeEx( Monster   , EM_SetModeType_Mark, false )--標記
			SetModeEx( Monster , EM_SetModeType_Move, false )--移動
			SetModeEx( Monster , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Monster , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Monster , EM_SetModeType_Gravity, false )--重力
			SetModeEx( Ball    , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( Ball    , EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Ball    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Ball    , EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Ball    , EM_SetModeType_Gravity, false )--重力
			SetModeEx( Ball    , EM_SetModeType_Move, false )--移動
			SetModeEx( Ball    , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false )--頭像框
			SetPlot( Ball,"touch","Lua_EverNightKeyOneSetpClear", 50 )
			WriteRoleValue( Ball , EM_RoleValue_PID , Monster )   
			AddToPartition( Monster , 0)
			AddToPartition( Ball , 0)
			ClientSkyType( EM_ClientSkyProcType_Night ) --改變遊戲時間為 夜晚
			EverNightKeyOneStep = 1
		else
			ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."You are Not in Zone 2 !".. "|r" , 0 ) 
		end
	else
		Say(OwnerID(),"OneStep already ON")
	end
end

function Lua_EverNightKeyOneSetpClear()
	local KEY =  CountBodyItem( OwnerID() , 203582 )  --特殊劇情觸發鑰匙
	local KeyMan = ReadRoleValue( TargetID() , EM_RoleValue_PID  )  
	if KEY >= 1 then
		if CheckID(KeyMan) == true then
			DelObj(KeyMan)
		end
		if CheckID(TargetID()) == true then
			DelObj(TargetID())
		end
		EverNightKeyOneStep = 0
	end
end
function Lua_ClientSkyType()
	Beginplot( OwnerID() ,"Lua_ClientSkyTypeChange", 0 )
end

function Lua_ClientSkyTypeChange()
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "Normal" }
	TransferSelect[1] = { "Day" }
	TransferSelect[2] = { "NightFall" }
	TransferSelect[3] = { "Night" }
	TransferSelect[4] = { "Dawn" }
	TransferSelect[5] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "What Weaver Do You Want ?" )
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 5 or DialogStatus == -1 then
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then
			ClientSkyType( EM_ClientSkyProcType_Normal ) --改變遊戲時間為 一般
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then
			ClientSkyType( EM_ClientSkyProcType_Day ) --改變遊戲時間為 白天
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 2 then
			ClientSkyType( EM_ClientSkyProcType_NightFall ) --改變遊戲時間為 黃昏
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 3 then
			ClientSkyType( EM_ClientSkyProcType_Night ) --改變遊戲時間為 夜晚
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 4 then
			ClientSkyType( EM_ClientSkyProcType_Dawn ) --改變遊戲時間為 黎明
			DialogClose( PlayerID )
			break
		end
	end

end