----------------------------------------------------後台測試/gm刪除指令
function Lua_jiyi_0222test(item)
	local Player = OwnerID()
	if CountBodyItem ( Player , item ) > 0 then
		DelBodyItem( Player , item , 1 ) --將玩家身上的item物品刪除
	else
		ScriptMessage( Player , Player , 1 , "Without this item" , 0 )
	end
end
----------------------------------------------------以下活動測試
function Lua_jiyi_0305test()
	local Player = OwnerID() 
	PlayMotion( Player , 115 )
	Sleep(10)
	PlayMotion( Player , 110 )
 end

function Lua_jiyi_0308test01(Time,NowTime,type)		--時間倒數記數器
	local Player = OwnerID() 
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				StartClientCountDown ( ID, Time, NowTime, 0, 0, type, "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數5秒
				sleep(15)
			end
		end	
	end
end

function Lua_jiyi_0308test02()
	local Player = OwnerID()
	CallPlot( Player , "Lua_jiyi_0308test01" , 5 , 5 , 0 )
end
------------------------------------------------------------------
function jiyi_test0415(num)
	local Player = OwnerID()
	local CreateID = 121109 
	local CreateCount = { 16 , 20 , 1 }
	local Distance = { 80 , 150 , 0 }

	Lua_jiyi_Round_0415( Player , CreateID , CreateCount[num] , Distance[num] , 0 )
	-- 參考物件、建立物件的ID、建立物件的數量、圓的半徑、建立物件是否延遲
end

function Lua_jiyi_Round_0415( ObjID , CreateID , CreateCount , Distance , Delay )
-- 參考物件、建立物件的ID、建立物件的數量、圓的半徑、建立物件是否延遲
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local BaseX = ReadRoleValue( ObjID , EM_RoleValue_X )
	local BaseY = ReadRoleValue( ObjID , EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( ObjID , EM_RoleValue_Z )
	local BaseDir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	local CreateWall
	local CreateID = CreateID -- 門
	local Polygon = CreateCount -- 幾邊型
	local dis = Distance -- 距離圓心的距離
	local Count = 1

	for i = 1 , Polygon , 1 do
		CreateWall = CreateObj( CreateID , BaseX-dis*math.cos(math.pi*2*(i/Polygon)) , BaseY , BaseZ+dis*math.sin(math.pi*2*(i/Polygon)) , BaseDir , 1 )
		SetModeEx( CreateWall , EM_SetModeType_Strikback , true )--反擊
		SetModeEx( CreateWall , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( CreateWall , EM_SetModeType_Obstruct , false )--阻擋
		SetModeEx( CreateWall , EM_SetModeType_Mark , true )--標記
		SetModeEx( CreateWall , EM_SetModeType_Move , true )--移動
		SetModeEx( CreateWall , EM_SetModeType_Searchenemy , true )--索敵
		SetModeEx( CreateWall , EM_SetModeType_HideName , true )--名稱
		SetModeEx( CreateWall , EM_SetModeType_ShowRoleHead , true )--頭像框
		SetModeEx( CreateWall , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( CreateWall , EM_SetModeType_Drag , false )--阻力
		SetModeEx( CreateWall , EM_SetModeType_Show , true )--顯示
		AdjustFaceDir( CreateWall , ObjID , 0 ) 	-- 讓建立物件面向參考物件
		AddToPartition( CreateWall , RoomID )
		if Delay ~= 0 or Delay ~= nil then
			Sleep(Delay)
		end
	end
end
-------------------------------------------------------------------------------------巧藝節+BUFF測試指令
function Lua_jiyi_Z26_test0510(num)
	local Player = OwnerID()
	local buff = 623964
	local NPC = SearchRangeNPC( Player , 400 )
	local box = 103890
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == box then
			AddBuff( NPC[i] , buff , num-1 , -1 )
		end
	end
end
function Lua_jiyi_game_test0510(num)
	local Player = OwnerID()
	local buff = 507824
	local NPC = SearchRangeNPC( Player , 400 )
	local box = 103890
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == box then
			AddBuff( NPC[i] , buff , num-1 , -1 )
		end
	end
end

-------------------------------------------------------------------------------------------Z27佈置用
function Lua_jiyi_Z27_NPC_Follow()
--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 6
	local count = 2 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 0  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107917,Matrix,2,-1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107918,Matrix,1,-1 )
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "Lua_jiyi_Z27_Follow_Reset" , 0 )
end

function Lua_jiyi_Z27_Follow_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_jiyi_Z27_NPC_Follow" , 0 )
end
-------------------------------------物件連結測試
function Lua_jiyi_0729test()
	local Player = OwnerID()
	local Box = SearchRangeNPC( Player , 100 )
	local OrgID = 119403
	local Bushy = DW_CreateObjEX("obj", 120222 , Player ) ----生成隱藏人物
		
	for i = 0 , table.getn( Box ) do
		if ReadRoleValue( Box[i] , EM_RoleValue_OrgID ) == OrgID then
			AttachObj( Box[i] , Player , 0 , "p_right_hand" , "p_right_weapon" ) 
			
		else
			Say( Player , "no box" )
		end
	end	
end
------------------------------------------刪除物件劇情
function Lua_jiyi_Cancelobj(Item)	
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { Item }
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						DelObj( ID )
					end
				end
			end
		end
	end
end
---------------------------------------------------------------------Z30
function Lua_Z30_422656_test1119()	--任務結束表演劇情
	local Player = TargetID()
 	local NPC_Will = OwnerID()
	local PID = ReadRoleValue( NPC_Will , EM_RoleValue_PID )	--控制表演開始=0開始表演，=1表演中

	Setflag( Player , 548818 , 1 )
	if PID == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426862_01]" , 0 )	--表演進行中…
	elseif PID == 0 then
		Callplot( NPC_Will , "Lua_jiyi_1030test" , NPC_Will )
		WriteRoleValue( NPC_Will , EM_RoleValue_PID , 1 )
	end
end

function Lua_jiyi_1030test(NPC_Will)	-- 產生帕里戰士
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --確認伺服器的分流
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 121774	--帕里戰士
	local X = { 5 }	-- 幾邊型
	local dis = { 70 }	-- 距離圓心的距離
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			MonsterGroup[Count] = CreateObj( MonsterID , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			WriteRoleValue( MonsterGroup[Count] , EM_RoleValue_PID , Count )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( MonsterGroup[i] , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Obstruct , false )--阻擋
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Mark , true )--標記
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Move , true )--移動
		SetModeEx( MonsterGroup[i], EM_SetModeType_Gravity, true )--重力
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( MonsterGroup[i] , EM_SetModeType_HideName , true )--名稱
		SetModeEx( MonsterGroup[i] , EM_SetModeType_ShowRoleHead , true )--頭像框
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Drag , false )--阻力
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Show , true )--顯示
		AdjustFaceDir( MonsterGroup[i] , OwnerID() , 0 ) 
		AddToPartition( MonsterGroup[i] , RoomID )
		MoveToFlagEnabled( MonsterGroup[i] , false )-- 關閉巡邏劇情
 --		local Reg1 = ReadRoleValue( MonsterGroup[i] , EM_RoleValue_Register1 )
--		WriteRoleValue( MonsterGroup[i] , EM_RoleValue_Register1 , NPC_Will )	--將威爾記入帕里戰士的Reg1
	--	say( MonsterGroup[i] , "i remember Will="..Reg1 )	
		Beginplot( MonsterGroup[i] , "LuaWS_COMBAT_1H" , 0 )	--備戰動作
		Callplot(MonsterGroup[i] , "Lua_jiyi_1030test2" , OwnerID() )
	end
end

function Lua_jiyi_1030test2(player)	-- 帕里戰士前進
	local Warrior = OwnerID()	
	Lua_MoveLine( Warrior , 30 )	--參考物件，向前移動到Dis距離的位置(Dis填負數為向後移動)
end
-----------------------------Z30 426869 坦希拉石像------------------------------
function Lua_jiyi_Z30_123370_speak()
	local player = OwnerID()
	local PaPa = TargetID()
	local star = ReadRoleValue( PaPa , EM_RoleValue_Register1 )	--紀錄是否可以進行活動的REG值 0表示可以 1表示玩家挑戰中 
	LoadQuestOption( player )	
	if CheckAcceptQuest( player , 426869 ) == true and CheckFlag( player , 548817 ) == false then
		if Countbodyitem( player ,  241086 ) > 0 then
			if star == 1 then	--REG1值==1表示有玩家正在挑戰中
				SetSpeakDetail( player , "Please wait" ) --等一等
			else
				SetSpeakDetail( player , "[SC_Z28Q426633_01]" )	--(描述帕帕瓦加似乎感應到你身上有黑晶石)		
				AddSpeakOption( player , player ,"game start","Lua_jiyi_Z30_123370_speak2" , 0 )
			end
		else
			SetSpeakDetail( player , "[SC_Z28Q426633_03]" )	--(帕帕瓦加好奇地看著你...)
		end			
	else
		LoadQuestOption( player )
	end	
end		

function Lua_jiyi_Z30_123370_speak2() --出題目
	local player = OwnerID() --玩家
	local turkey = TargetID() --鶴鴕
	local star = ReadRoleValue( turkey , EM_RoleValue_Register1 )	--紀錄是否可以進行活動的REG值 0表示可以 1表示玩家挑戰中 
	local Reg9 = ReadRoleValue( turkey , EM_RoleValue_Register9 )	--讓NPC記住玩家
	WriteRoleValue( turkey , EM_RoleValue_Register1 , 1 )	--紀錄是否可以進行活動的REG值 0表示可以 1表示玩家挑戰中
	WriteRoleValue( turkey , EM_RoleValue_Register9 , player )	--讓NPC記住玩家
	DW_CancelMount( 68, player ) --進入遊戲不可騎乘
	CloseSpeak( player )
	BeginPlot( turkey , "Lua_Z30_test1114" , 0 ) --執行檢查偵測時間、距離、離線、換區消失、領獎勵
end
		
function Lua_Z30_test1114() --由鶴鴕執行偵測玩家與鶴鴕之間的距離並判斷是否將鶴鴕的PID值寫回0
	local turkey = OwnerID() --鶴鴕
	local Reg9 = ReadRoleValue( turkey , EM_RoleValue_Register9 ) --記在鶴鴕身上的玩家 
	local star = ReadRoleValue( turkey , EM_RoleValue_Register1 )	--紀錄是否可以進行活動的REG值 0表示可以 1表示玩家挑戰中 
	local reward = 548817 --完成任務旗標
	local Dis
	local Time = 0
	local shinyball = { [1]=123366 ,
			 [2]=123367 ,
			 [3]=123368 ,
			 [4]=123369  } --題目光球
	while true do	
		Dis = GetDistance( turkey , Reg9 ) --檢查鶴鴕和玩家之間的距離
		if CheckID( Reg9 ) == false then--如果玩家離線，跳出迴圈
			break
		end
		if Dis >= 100 and Dis < 150 then --如果距離太遠，跳出警告訊息
			ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_02]" , C_SYSTEM )--警告訊息 ：距離過遠	
		elseif Dis >= 150 then
			ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_03] " , C_SYSTEM )--警告訊息 ：距離太遠了		
			break
		end
	   	Time = Time + 1
		if Time == 30 then
	   		ScriptMessage( turkey , Reg9 , 2 , "[SC_2012THANKS_NPC_121493_SYSTEM_05]" , C_SYSTEM )--時間到跳出迴圈	
			break
		elseif Time == 5 or Time == 10 or Time == 15 or Time == 20 or Time == 25 then
			local NewX , NewY , NewZ , NewDir = DW_Location( turkey )
			local RandNum= DW_Rand( table.getn ( shinyball ) )
			NpcOnBox = CreateObj( shinyball[RandNum] , NewX , NewY + 10 , NewZ , dir , 1 )
			SetModeEx( NpcOnBox , EM_SetModeType_Gravity , false )--取消重力
			addToPartition( NpcOnBox , 0 )
			Beginplot( NpcOnBox , "Lua_Z30_BallDisappear" , 0 )
		end						
		if CheckFlag( Reg9 , reward ) == true then --如果玩家身上有完成任務旗標，跳出迴圈
			break
		end
		Sleep( 10 )
	end
	WriteRoleValue( turkey , EM_RoleValue_Register1 , 0 )	--跳出迴圈就把REG值寫成0
	say( turkey , "game over" )
end

function Lua_Z30_BallDisappear()	--光球的物件產生劇情
	Sleep(50)
	DelObj(  OwnerID() )
end

function Lua_Z30_BallAppear()
	SetPlot( OwnerID() ,"range","Lua_Z30_BallAppear2", 30 ) 
end

function Lua_Z30_BallAppear2()	--藍色
	local Player = OwnerID()
	local Shinyball = TargetID()
	if CheckAcceptQuest( Player , 426869 ) == true and Checkflag( Player , 548817 ) == false then
		SetPlot( Shinyball , "range" , "" , 30 )
		Addbuff( Player , 506229 , 0 , 10 )
	end
end
