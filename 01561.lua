function LuaFunc_NPCWalkByMatrix_2(ObjMatrix,Matrix,dis,count,checktime , Circle )  --讓物件走到陣型座標點的函式
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--各參數的處理--
	local ObjRecord = LuaFunc_ObjMatrix_Record(ObjMatrix) --紀錄所有 NPC 的資料，以供重生使用

	if Circle <= 0 or Circle == nil or Type(Circle) ~= "number" then
		Circle = -1
	else
		Circle = math.ceil( Circle  ) --無條件進位強制 Circle  為整數
	end

	if checktime== nil or Type(checktime) ~= "number" then --如果 Checktime 不合法則填入 10 
		checktime = 10
	end

	if count <= 0 or count == nil or Type(count) ~= "number" then
		return
	end

	if dis < 0 or dis == nil or Type(dis) ~= "number" then
		return
	end

	--
	local A
	local B
	local RC = 0

	local WaitCount = 0 --需要等待的數量
	local Wait = 0 --是否等待的狀態
	local GoFight = 1
	local GetTarget = 0

	local OID = Role:new(OwnerID())
	local Dir0 = OID:Dir()
	local Time = math.floor(25 *(100/GameObjInfo_int( ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) , "MoveSpeed" ) ) ) + DW_Rand(5)
	 --用導引物的速度來計算迴圈的檢查間隔，此時間約為導引物走直線 50 左右的距離，再加上 0.5 秒的亂數值來錯開
	local CheckDis  = math.floor(75*(GameObjInfo_int( ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ), "MoveSpeed" ) ) / 100 )
	 --用導引物的速度來計算離開多遠要開始用跑的，判斷基準為速度 100 的話，單一座標軸差距 50 的 1.5 倍就切換成跑步

	--計算矩陣中合法的NPC數量，並初始化此物件關於移動的部分
	local Num = 0
	for pry , obj in pairs(ObjMatrix)  do 
		if obj ~= nil then
			MoveToFlagEnabled( obj , false )  --關閉MoveToFlag
			WriteRoleValue( obj ,EM_RoleValue_IsWalk , 1 ) --設定為走路
			Num = Num + 1
		end
	end
	----------------------------------------------------------------------------------------------------------
--	local tick = GetTickCount()
	--迴圈開始--------------------------------------------------------------------------------------------
	while 1 do
--		tick = GetTickCount() 

		--找尋新的位置
		Matrix = LuaFunc_Matrix_Maker( dis , count )
		--重置需要等待的人數
		WaitCount = 0
		--命令他們移動到新的位置並檢查是否都已經抵達新的位置了
		for pry , obj in pairs(ObjMatrix) do
			if obj ~= nil then
				--是 NPC 並且不在戰鬥中才檢查
				if ReadRoleValue(obj, EM_RoleValue_IsNPC) == 1 and ReadRoleValue(obj, EM_RoleValue_RoomID) == ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then 
					if ReadRoleValue( obj , EM_RoleValue_AttackTargetID) ~= 0 then 
--						yell( Obj , " Fight" , 3 )
						WaitCount = WaitCount + 1
						WriteRoleValue( obj ,EM_RoleValue_IsWalk , 0  ) --設定為跑步
					else
						MoveToFlagEnabled( obj , false )  --關閉MoveToFlag
						A = ObjRecord["A"][pry] --取出紀錄於物品上的 A 值
						B = ObjRecord["B"][pry] --取出紀錄於物品上的 B 值
						Local Role = Role:new(obj)
						Local DeltaX = math.abs(Matrix[A][B]["X"]-Role:X() )
						Local DeltaY = math.abs(Matrix[A][B]["Y"]-Role:Y() )
						Local DeltaZ = math.abs(Matrix[A][B]["Z"]-Role:Z() )

						if DeltaX > CheckDis or DeltaZ > CheckDis or DeltaY > CheckDis  then
							WriteRoleValue( obj , EM_RoleValue_IsWalk , 0 )
							if DeltaX < 2*CheckDis and DeltaZ < 2*CheckDis and DeltaY < 2*CheckDis then 
								local CastTime = MoveDirect(obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
--								yell( Obj , " Run :"..CastTime  , 3 )
							else
								WaitCount = WaitCount + 1
								local CastTime =Move( obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
--								yell( Obj , " Long Run :"..CastTime  , 3 )
							end
						else
							WriteRoleValue( obj , EM_RoleValue_IsWalk , 1 )
							local CastTime =MoveDirect(obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
--							yell( Obj , " Walk :"..CastTime  , 3 )
						end

					end
				end
			end
		end
--		Yell( OwnerID() , "Waitting Number : "..WaitCount , 3)
		--太多人脫隊時等待
		if ( ( Num < 4 and WaitCount > 0 ) or WaitCount >=3 ) and Wait == 0 then
			SetModeEX( OwnerID() , EM_SetModeType_Move , false )
			Wait = 1
--			Yell( OwnerID() , "Waitting for Mobs" , 3)
		end
		if ( ( Num < 4 and WaitCount == 0 ) or WaitCount < 3 )  and Wait == 1 then
			SetModeEX( OwnerID() , EM_SetModeType_Move , true )
			Wait = 0
--			Yell( OwnerID() , "Cancel Waitting" , 3)
		end

		--轉彎時等待
		if math.abs( OID:Dir()-Dir0) > 30 then
			SetModeEX( OwnerID() , EM_SetModeType_Move , false )
			sleep( count* ( 1+math.floor( (math.abs( OID:Dir()-Dir0)-30) / 30 ) ) )
--			Yell( OwnerID() , "Angel A = "..Dir0.." Angel B = "..OID:Dir().." Waitting :"..count*( 1+math.floor( (math.abs( OID:Dir()-Dir0)-30) / 30 ) ) , 3 )
			Dir0 = OID:Dir()
			SetModeEX( OwnerID() , EM_SetModeType_Move , true )
		end
		--每固定時間（Circle*checktime) 就檢查是否要重生陣列中所有NPC
		if Circle > 0 then
			RC = RC + 1
			if RC*Time >= Circle*CheckTime then
				for pry , obj in pairs(ObjMatrix)  do --檢查如果 NPC 不在，就產生一隻 NPC
					if obj ~= nil then
						if ReadRoleValue(obj, EM_RoleValue_IsNPC) ~= 1 or ReadRoleValue(obj, EM_RoleValue_IsDead) ~= 0 or CheckID(obj) ~= true or ReadRoleValue(obj, EM_RoleValue_RoomID) ~= ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then -- NPC 是否存在
							ObjMatrix[pry] = LuaFunc_CreateNPCByMatrix(ObjRecord["OrgID"][pry],Matrix,ObjRecord["A"][pry],ObjRecord["B"][pry] )
						end
					end
				end
				RC = 0
			end
		end

		--檢查陣列中的物件是否都還存在，如果都不存在，便結束迴圈
		local Reset = 0
		for pry , obj in pairs(ObjMatrix) do 
			if obj ~= nil then
				if ReadRoleValue(obj, EM_RoleValue_IsNPC) ~= 1 or ReadRoleValue(obj, EM_RoleValue_IsDead) ~= 0 or CheckID(obj) ~= true or ReadRoleValue(obj, EM_RoleValue_RoomID) ~= ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then -- NPC 是否存在
					Reset = Reset + 1
				end
			end
		end

		if Reset >= Num then
			break
		end
--		Yell( OwnerID() , "A Circle Time :"..GetTickCount() - tick , 3 )
		sleep(Time)
	end
end
function LuaS_102523_test()--帶隊巡邏劇情
--宣告所有變數及設定值
	local dis = 20
	local count = 4 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local circle = 30  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
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
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle )
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end
