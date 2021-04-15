function LuaP_CastBersark()
	MoveToFlagEnabled( OwnerID(), false );
	sleep( 30 )
	CastSpell( OwnerID() , OwnerID() , 491028 )
	sleep( 10 )
	MoveToFlagEnabled( OwnerID(), true );
end

function LuaI_Follow_A()
--改變行走速度
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
	Hide(OwnerID())
--指定移動旗標
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
	BeginPlot(OwnerID(),"LuaI_Follow_A_1",0)
--執行創造陣形
--等待秒數
	sleep(20)
	Show(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	CallPlot(OwnerID(),"LuaI_Follow_A_0",780014)
end

function LuaI_Follow_B()
--改變行走速度
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
	Hide(OwnerID())
--指定移動旗標
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
	BeginPlot(OwnerID(),"LuaI_Follow_A_1",0)
--執行創造陣形
--等待秒數
	sleep(20)
	Show(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	CallPlot(OwnerID(),"LuaI_Follow_A_0",780068)
end

function LuaI_Follow_C()
--改變行走速度
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
	Hide(OwnerID())
--指定移動旗標
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
	BeginPlot(OwnerID(),"LuaI_Follow_A_1",0)
--執行創造陣形
--等待秒數
	sleep(20)
	Show(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	CallPlot(OwnerID(),"LuaI_Follow_A_0",780069)
end




function LuaI_Follow_A_0(Flag)
--使用旗子 780014 編號 all
	local FlagNum
	while	true	do
		while	true	do
			FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			DW_MoveToFlag( OwnerID(), Flag , FlagNum , 10,1 )
			FlagNum = FlagNum + 1
			WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
			if	FlagNum==GetMoveFlagCount(Flag) 	then
				break
			end
		end
		while	true	do
			FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			FlagNum = FlagNum - 1
			if	FlagNum==0	then
				break
			end
			WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
			DW_MoveToFlag( OwnerID(), Flag , FlagNum , 10,1 )
		end
	end
end


function LuaI_Follow_A_1()
--宣告所有變數及設定值
	local dis = 8
	local count = 2 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 8 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 0  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
--制定陣列位置
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--設定怪物資料
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100653,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100393,Matrix,1,1)
	for i=1,table.getn(ObjMatrix),1 do
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end