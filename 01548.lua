
---------------------------------------------------------------
function LuaS_102499_0() --鐵脊龍的陣形劇情
---------------------------------------------------------------
--宣告所有變數及設定值
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 0  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
--制定陣列位置
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--設定怪物資料
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102499,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102499,Matrix,3,2)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102499,Matrix,5,-1)
	for i=1,table.getn(ObjMatrix),1 do
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
		BeginPlot(ObjMatrix[i],"LuaS_102499_2",0)
	end
	sleep(20)
	for i=1,table.getn(ObjMatrix),1 do
		SetFightMode ( ObjMatrix[i],1,1,0,1 )
	end
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
	DelObj(OwnerID())
end
---------------------------------------------------------------
function LuaS_102499_1() --鐵脊龍的移動劇情
---------------------------------------------------------------
--使用旗子780092 編號 all
	local FlagNum
	while	true	do
		FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
		if	FlagNum==GetMoveFlagCount(780092) 	then
			break
		end
		DW_MoveToFlag( OwnerID(), 780092 , FlagNum , 10,1 )
	end
	DelObj(OwnerID())
end
---------------------------------------------------------------
function LuaS_102499_2() --鐵脊龍的檢測劇情
---------------------------------------------------------------
	while	CheckID(TargetID())	do
		sleep(10)
	end
	DelObj(OwnerID())
end




---------------------------------------------------------------
function LuaS_102499_3() --蛇人運輸線的鐵脊龍馱運導演劇情
---------------------------------------------------------------
--使用旗子 780093 編號 all
	while	true	do
		Leader = Lua_DW_CreateObj("obj",102280,OwnerID(),0)
		Lua_DW_LeaderSet(Leader)
		AddToPartition(Leader,0)
		WriteRoleValue(Leader,EM_RoleValue_IsWalk,1)
		WriteRoleValue(Leader,EM_RoleValue_Register1,1)
		Hide(Leader)
		sleep(20)
		Show(Leader,0)
		BeginPlot(Leader,"LuaS_102499_4",0)
		BeginPlot(Leader,"LuaS_102499_5",0)
		while	CheckID(Leader)	do
			sleep(10)
		end
		Sleep(600)
	end
end
---------------------------------------------------------------
function LuaS_102499_4() --蛇人運輸線的鐵脊龍的陣形劇情
---------------------------------------------------------------
--宣告所有變數及設定值
	local dis = 20
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 0  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
--制定陣列位置
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--設定怪物資料
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102499,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102499,Matrix,3,2)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102499,Matrix,5,-1)
	for i=1,table.getn(ObjMatrix),1 do
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
		BeginPlot(ObjMatrix[i],"LuaS_102499_2",0)
	end
	sleep(20)
	for i=1,table.getn(ObjMatrix),1 do
		SetFightMode ( ObjMatrix[i],1,1,0,1 )
	end
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
	DelObj(OwnerID())
end
---------------------------------------------------------------
function LuaS_102499_5() --蛇人運輸線的鐵脊龍的移動劇情
---------------------------------------------------------------
--使用旗子780093 編號 all
	local FlagNum
	while	true	do
		FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
		if	FlagNum==GetMoveFlagCount(780093) 	then
			break
		end
		DW_MoveToFlag( OwnerID(), 780093 , FlagNum , 10,1 )
	end
	DelObj(OwnerID())
end

---------------------------------------------------------------
function LuaS_102545_0() --蛇人部隊著裝劇情的 導演劇情
---------------------------------------------------------------
	local Leader
	while	true	do
--建立帶頭者
--掛上帶隊劇情
--掛上移動劇情d
		Leader = Lua_DW_CreateObj("obj",102280,OwnerID(),0)
		Lua_DW_LeaderSet(Leader)
		AddToPartition(Leader,0)
		BeginPlot(Leader,"LuaS_102545_1",0)
		sleep(20)
		BeginPlot(Leader,"LuaS_102545_2",0)
--檢查是否要重新開始演戲
		while CheckID(Leader) do
			sleep(10)
		end
--建立第二段劇情的帶頭者
--改變移動狀態:走
		Leader = Lua_DW_CreateObj("flag",102280,780092,1,0)
		Lua_DW_LeaderSet(Leader)
		AddToPartition(Leader,0)
		WriteRoleValue(Leader,EM_RoleValue_IsWalk,1)
		WriteRoleValue(Leader,EM_RoleValue_Register1,1)
		Hide(Leader)
		sleep(20)
		Show(Leader,0)
		BeginPlot(Leader,"LuaS_102499_0",0)
		BeginPlot(Leader,"LuaS_102499_1",0)
		while	CheckID(Leader)	do
			sleep(10)
		end
	end
end


---------------------------------------------------------------
function LuaS_102545_1() --陣形劇情
---------------------------------------------------------------
--宣告所有變數及設定值
	local dis = 15
	local count = 4 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 0  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
--制定陣列位置
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--設定怪物資料
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,0)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,-1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,0)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,1)
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(102545,Matrix,2,-2)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],1,1,0,1 )
	end
--迴圈命令怪物跟隨
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end

---------------------------------------------------------------
function LuaS_102545_2() --移動劇情→表演劇情→移動劇情→表演劇情
---------------------------------------------------------------
	local	StopPoint = 6 --停下著裝的點(多1)
	local	FlagNum
	local 	ShowEnd = 1
	local	Team = {}
--使用旗子 780090 編號 all

--先掌握所有的隊員ID
	local	NPC = SearchRangeNPC ( OwnerID() , 100 )
	for i = 0,table.getn(NPC),1	do
		if	ReadRoleValue(NPC[i],EM_RoleValue_IsAttackMode)==0	and
			(ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==102544 or ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==102545)	then
			Team[table.getn(Team)+1] = NPC[i]
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
	sleep(20)
--移動劇情(第一段)
	while	true	do
		FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
		if	FlagNum == StopPoint	then
			break
		end
		DW_MoveToFlag( OwnerID(), 780090 , FlagNum , 10,1 )
	end
	sleep(50)
--表演劇情：著裝(第一段)
--刪除原有的蛇人重新補滿
	for i=1,table.getn(Team),1 do
		if	CheckID(Team[i])	then
			DelObj(Team[i])
		end
	end
	local dis = 15
	local count = 4 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 0  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	Team[1] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,-1)
	Team[2] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,0)
	Team[3] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,1)
	Team[4] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,-1)
	Team[5] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,0)
	Team[6] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,1)
	Team[7] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,-1)
	Team[8] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,0)
	Team[9] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,1)
	Team[10] = LuaFunc_CreateNPCByMatrix(102545,Matrix,2,-2)
--至指定位置著裝
	for i=1,9,1 do
		WriteRoleValue(Team[i],EM_RoleValue_IsWalk,0)
		Hide(Team[i])
		CallPlot(Team[i],"LuaS_102545_3",i)
	end
	Say(Team[10],"[SC_102545_0]")
	for i=1,10,1 do
		sleep(10)
	end
	Say(Team[10],"[SC_102545_1]")
--等待到所有蛇人都稱自己準備好
	while	true	do
		sleep(25)
		while	ShowEnd<10 do
			if	ReadRoleValue(Team[ShowEnd],EM_RoleValue_Register1)==0	then
				ShowEnd=1
				break
			end
			ShowEnd = ShowEnd + 1
		end
		if	ShowEnd>=10	then
			break
		end
	end
	for i=1,10,1 do
		WriteRoleValue(Team[i],EM_RoleValue_IsWalk,1)
	end
	sleep(10)
	Say(Team[10],"[SC_102545_2]")
	sleep(10)
--先記錄帶頭者的id
--命令所有人準備第二段表演
	for i=1,table.getn(Team),1 do
		WriteRoleValue(Team[i],EM_RoleValue_Register1,OwnerID())
		BeginPlot(Team[i],"LuaS_102545_5",0)
	end
--繼續前進
	BeginPlot(OwnerID(),"LuaS_102545_4",0)
	LuaFunc_NPCWalkByMatrix( Team , Matrix , dis , count , checktime , circle )
end


---------------------------------------------------------------
function LuaS_102545_3(Flag) --著裝劇情
---------------------------------------------------------------
	sleep(20)
	Show(OwnerID(),0)
--將數值歸零
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
--使用旗子 780091 編號 1 2 3 4 5 6 7 8 9 
	local X,Y,Z
	X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	DW_MoveToFlag( OwnerID() , 780091 , Flag,0 , 1  )
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(15)
	sleep(5)
	AddBuff(OwnerID(),504311,1,-1)
--移動回指定位置
	DW_WaitMoveTo( OwnerID() , X , Y, Z)
	DW_WaitMoveTo( OwnerID() , X-10 , Y, Z)
--告訴領頭者自己已經準備完成
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
end

---------------------------------------------------------------
function LuaS_102545_4() --第二段的移動劇情
---------------------------------------------------------------
	while	true	do
		DW_MoveToFlag( OwnerID(), 780090 , ReadRoleValue(OwnerID(),EM_RoleValue_Register1) , 10 )
		FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
		if	GetMoveFlagCount(780090) == FlagNum	then
			break
		end
	end
	DelObj(OwnerID())
end

---------------------------------------------------------------
function LuaS_102545_5()--第二段的表演劇情
---------------------------------------------------------------
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	while CheckID(Master)	do
		sleep(20)
	end
	if	ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==102545		then
		Say(OwnerID(),"[SC_102545_3]")
	end
	sleep(20)
	DelObj(OwnerID())
end

---------------------------------------------------------------
function LuaS_102650_0() -- 禁制之壁的蛇人遇伏劇情 的導演劇情
---------------------------------------------------------------
	local Leader
	while	true	do
		sleep(50)
--建立帶頭者
		Leader = Lua_DW_CreateObj("obj",102280,OwnerID(),0)
		Lua_DW_LeaderSet(Leader)
		AddToPartition(Leader,0)
		Hide(Leader)
		WriteRoleValue(Leader,EM_RoleValue_IsWalk,1)
--賦予帶隊的劇情
		BeginPlot(Leader,"LuaS_102650_1",0)
		sleep(20)
--配合移動的劇情
--掛上移動控制劇情
		Show(Leader,0)
		BeginPlot(Leader,"LuaS_102650_2",0)
--檢查是否演戲完成
--透過checkid來判斷
		while	CheckID(Leader)	do
			sleep(20)
		end
	end
end

---------------------------------------------------------------
function LuaS_102650_1() -- 禁制之壁的陣形劇情
---------------------------------------------------------------
--宣告所有變數及設定值
	local dis = 12
	local count = 2 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = -1  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 0  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
--制定陣列位置
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--設定怪物資料
--無敵 改變走路型態
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102650,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102650,Matrix,1,1)
	for i =1,2,1 do
		DelFromPartition(ObjMatrix[i])
		SetModeEx(ObjMatrix[i],EM_SetModeType_ShowRoleHead,false) 
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
		AddToPartition(ObjMatrix[i],0)
	end
	sleep(30)
--迴圈命令怪物跟隨
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end


---------------------------------------------------------------
function LuaS_102650_2() -- 帶隊與控制表演的劇情
---------------------------------------------------------------
	local NPC
	local Team = {}
	local Sula = {}
--使用旗子 780088 編號 all
--使用旗子 780089 編號 1 2 3
--因為此人身上有陣形劇情  所以從Register1開始使用
	NPC = SearchRangeNPC ( OwnerID() , 100 )
	for i = 0,table.getn(NPC),1	do
		if	ReadRoleValue(NPC[i],EM_RoleValue_IsAttackMode)==0	and
			ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==102650	then
			Team[table.getn(Team)+1] = NPC[i]
		end
	end
	while	true	do
		local FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
--走到最後一個點時候
--跳出移動迴圈 進入表演模式
		if	GetMoveFlagCount(780088) == FlagNum	then
			break
		end
		DW_MoveToFlag( OwnerID(), 780088 , FlagNum , 10 , 1 )
	end
	sleep(50)
--刪除兩隻蛇人重新補滿
	DelObj(Team[1])
	DelObj(Team[2])
--制定陣列位置
	local dis = 12
	local count = 2 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--設定怪物資料
	Team[1] = LuaFunc_CreateNPCByMatrix(102650,Matrix,1,-1)
	Team[2] = LuaFunc_CreateNPCByMatrix(102650,Matrix,1,1)
	SetPlot(Team[1],"dead","LuaS_102650_3",0)
	SetPlot(Team[2],"dead","LuaS_102650_3",0)
	SetFightMode ( Team[1],0,1,0,0 )
	SetFightMode ( Team[2],0,1,0,0 )
	sleep(10)
--表演模式
--放遇到埋伏的法術
	SysCastSpellLv(Team[1],Team[1],493894,75)
	SysCastSpellLv(Team[2],Team[2],493894,75)
--改變動作
	SetDefIdleMotion(Team[1],ruFUSION_MIME_IDLE_COMBAT_1H)
	SetDefIdleMotion(Team[2],ruFUSION_MIME_IDLE_COMBAT_1H)
	sleep(10)
--產生埋伏 放箭
	Sula[1] = Lua_DW_CreateObj("flag",102547,780089,1)
	Sula[2] = Lua_DW_CreateObj("flag",102547,780089,2)
	Sula[3] = Lua_DW_CreateObj("flag",102547,780089,3)
	SysCastSpellLv(Sula[1],Team[1],493914,15)
	SysCastSpellLv(Sula[2],Team[1],493914,15)
	SysCastSpellLv(Sula[3],Team[1],493914,15)
	sleep(10)
	SetFightMode ( Team[2],1,1,0,1 )
	sleep(10)
	PlayMotion(Team[2],ruFUSION_ACTORSTATE_BUFF_INSTANT)
	Say(Team[2],"[SC_102650_0]")
	for i=1,table.getn(Sula),1 do
		SetAttack(Sula[i],Team[2])
	end
	sleep(20)
	Say(Sula[1],"[SC_102650_1]")
	while true do
		sleep(10)
		if	ReadRoleValue(Team[2],EM_RoleValue_IsDead)==1	then
			break
		end
	end
	Say(Sula[1],"[SC_102650_2]")
	sleep(10)
	for i=1,table.getn(Sula),1 do
		DelObj(Sula[i])
	end
	for i=1,table.getn(Team),1 do
		DelObj(Team[i])
	end
	DelObj(OwnerID())
end


---------------------------------------------------------------
function LuaS_102650_3() --小?劇情 蛇人身上的死亡劇情
---------------------------------------------------------------
	local temp
--判斷死亡時 仇恨表裡的人有沒有接任務
	for i=0,HateListCount( OwnerID()),1 do
		temp = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID)
		if	CheckAcceptQuest(temp,422672)	then
			SetFlag(temp,543348,1)
		end
	end
end


---------------------------------------------------------------
function LuaS_102523_0()--帶隊巡邏劇情
---------------------------------------------------------------
--宣告所有變數及設定值
	local dis = 20
	local count = 4 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 180  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
--制定陣列位置
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--設定怪物資料
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102523,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102523,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102523,Matrix,1,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102524,Matrix,2,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102524,Matrix,2,0)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102524,Matrix,2,1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102523,Matrix,3,-1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(102523,Matrix,3,0)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(102523,Matrix,3,1)
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(102525,Matrix,2,-2)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],1,1,0,1 )
	end
--迴圈命令怪物跟隨
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end