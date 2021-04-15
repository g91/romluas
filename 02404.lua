function LuaM_drdog_matrix()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 10
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105764,Matrix,2, 0 )
--	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 1 )
--	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 0 )
--	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100054,Matrix,1, 0 )
--	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 1 )
--	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 0 )
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaM_drdog_matrix" , 0 )
end

function LuaM_drdog_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_drdog_matrix" , 0 )
end


----------------------------------------------

function LuaM_drmilitary_matrix()			--士兵

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 25
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(118762,Matrix,2, 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(118762,Matrix,2, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(118762,Matrix,2, -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(118762,Matrix,1, 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(118762,Matrix,1, 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(118762,Matrix,1, -1 )
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaM_drmilitary_matrix" , 0 )
end

function LuaM_drmilitary_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_drmilitary_matrix" , 0 )
end

---------------------------------------------------------

function LuaQ_drKalorn_1()										--喀洛恩城守衛踢人用
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetPlot(O_ID,"range","LuaQ_drKalorn_2",80)
end

function LuaQ_drKalorn_2()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if CheckBuff(O_ID,620129)==true or CheckCompleteQuest(O_ID,424305)==true then
	return
	else
	say(T_ID,"[SC_KALORN_1]")								--非喀洛恩人不得進城！
	PlayMotion(T_ID,32)
	SetPos(O_ID,-12339,424,37725,0)
	end
end


----------------------------------------------------
function LuaQ_dr118475_1()										--看守者踢人用
	local own=OwnerID()
	local tar=TargetID()
	local RoomID=ReadRoleValue(Own,EM_RoleValue_RoomID)
	local Amonster = CreateObj(118475,-8533.2,486.6,36539.6,216,1)
	SetModeEx(Amonster,EM_SetModeType_Mark,false)
	SetModeEx(Amonster,EM_SetModeType_HideName,false)
	SetModeEx(Amonster,EM_SetModeType_Show,false)
	AddToPartition(Amonster,RoomID)   
	WriteRoleValue(Amonster,EM_RoleValue_register1,own)
	WriteRoleValue(own,EM_RoleValue_register1,Amonster)
	CallPlot(Amonster,"LuaQ_dr118475_2",Amonster)
	SetPlot(Amonster,"range","LuaQ_drKalorn_4",80)
end

function LuaQ_dr118475_2(Amonster)
	local boss = ReadRoleValue(Amonster,EM_RoleValue_Register1)
	while 1 do
		sleep(20)
		if CheckBuff(boss,620026)==true then
		CallPlot(Amonster,"LuaQ_dr118475_3",Amonster)
		Hide(Amonster)
		end
	end
end

function LuaQ_dr118475_3(Amonster)
	sleep(300)
	Show(Amonster,0)
end

function LuaQ_drKalorn_4()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	local boss = ReadRoleValue(T_ID,EM_RoleValue_Register1)
	if CheckBuff(O_ID,620027)==true  then
	return
	else
	say(boss,"[ST_100459_0]")
	PlayMotion(boss,109)
	ScriptMessage(O_ID,O_ID,1,"[SC_118475_01]",0)					
	SetPos(O_ID,-8687,469,36678,44)
	end
end
---------------------------------------------------------
Function LuaP_Dr_Mining()
	AttachCastMotionTool( OwnerID(), 212753 )
	MoveToFlagEnabled( OwnerID(), false );
	sleep( 30 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_END)
	sleep(30)
	MoveToFlagEnabled( OwnerID(), true );
end
