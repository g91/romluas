function LuaFunc_NPCWalkByMatrix(ObjMatrix,Matrix,dis,count,checktime , Circle )  --讓物件走到陣型座標點的函式
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

	local A
	local B
	local RC = 0
	local OID = Role:new(OwnerID())

	local X0 = OID:X()
	local Y0 = OID:Y()
	local Z0 = OID:Z()
	local MoveIdentify = "Yes"

	local ObjRecord = LuaFunc_ObjMatrix_Record(ObjMatrix) --紀錄所有 NPC 的資料，以供重生使用

	if Circle <= 0 or Circle == nil or Type(Circle) ~= "number" then
		Circle = -1
	else
		Circle = math.ceil( Circle  ) --無條件進位強制 Circle  為整數
	end

	if checktime < 15 or checktime== nil or Type(checktime) ~= "number" then --強制迴圈的檢查間隔為 1.5 秒以上，並給予 0.5 秒的亂數值
		CheckTime = 15 + DW_Rand(5) 
	else
		CheckTime = CheckTime + DW_Rand(5) 
	end

	if count <= 0 or count == nil or Type(count) ~= "number" then
		return
	end

	if dis < 0 or dis == nil or Type(dis) ~= "number" then
		return
	end

	local Num = 0
	for pry , obj in pairs(ObjMatrix)  do --計算矩陣中合法的NPC數量
		if obj ~= nil then
			Num = Num + 1
		end
	end

	while 1 do
		--檢查自己移動的距離是否足夠
		if ( ( X0 - OID:X() )^2 + ( Y0 - OID:Y() )^2 +( Z0 - OID:Z() )^2 ) > 100 and MoveIdentify == "No" then
			MoveIdentify = "Yes"
			X0 = OID:X() 
			Y0 = OID:Y() 
			Z0 = OID:Z() 
		else
			MoveIdentify = "No"
		end

		if MoveIdentify == "Yes" then
--			SetModeEX( OwnerID() , EM_SetModeType_Move , false )
			--找尋新的位置
			Matrix = LuaFunc_Matrix_Maker( dis , count )
 
			--命令他們移動到新的位置
			for pry , obj in pairs(ObjMatrix) do
				if obj ~= nil then
					if ReadRoleValue(obj, EM_RoleValue_IsNPC) == 1 and ReadRoleValue(obj, EM_RoleValue_RoomID) == ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) and ReadRoleValue(obj, EM_RoleValue_IsDead) == 0 then --檢查是不是 NPC
						if ReadRoleValue( obj , EM_RoleValue_AttackTargetID) ~= 0 then 
							if ReadRoleValue( obj , EM_RoleValue_IsWalk ) == 1 then
								WriteRoleValue( obj ,EM_RoleValue_IsWalk , 0  ) --設定為跑步
							end
						else
							MoveToFlagEnabled( obj , false )
							A = ObjRecord["A"][pry] --取出紀錄於物品上的 A 值
							B = ObjRecord["B"][pry] --取出紀錄於物品上的 B 值

							Local Role = Role:new(obj)
							Local DeltaX = Matrix[A][B]["X"]-Role:X()
							Local DeltaY = Matrix[A][B]["Y"]-Role:Y()
							Local DeltaZ = Matrix[A][B]["Z"]-Role:Z()
							local Distance = ( DeltaX*DeltaX ) + ( DeltaY*DeltaY ) + ( DeltaZ*DeltaZ )
							local FinalDis = 10*dis
							local LongMove = 0

							if 10*dis < 150 then
								FinalDis = 150
							end
							if Distance >= (300)*(300) then --為了節省資源，直接用平方數作判定
								SetPos( obj, Matrix[A][B]["X"], Matrix[A][B]["Y"], Matrix[A][B]["Z"] , Matrix[A][B]["Dir"] )
							elseif Distance >= (FinalDis)*(FinalDis) then
								WriteRoleValue( Obj , EM_RoleValue_IsWalk , 0 )
								LongMove = 1
							else
								WriteRoleValue( Obj , EM_RoleValue_IsWalk , 1 )
							end
							
							if LongMove ~= 0 or HateListCount( OwnerID() ) > 0 then
								Move( obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
							else
								MoveDirect(obj, Matrix[A][B]["X"] , Matrix[A][B]["Y"]  , Matrix[A][B]["Z"]  )
							end
						end
					end
				end
			end
		end

		sleep(checktime)

		--檢查是否都已經抵達新的位置了
		for i = 1 , 10 , 1 do --等太久直接跳下一個位置
			local Check = 0
			for pry , obj in pairs(ObjMatrix) do
				if obj ~= nil then
					if ReadRoleValue(obj, EM_RoleValue_IsNPC) == 1 and ReadRoleValue( obj , EM_RoleValue_AttackTargetID) == 0 and ReadRoleValue(obj, EM_RoleValue_RoomID) == ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then --是 NPC 並且不在戰鬥中才檢查
						A = ObjRecord["A"][pry] --取出紀錄於物品上的 A 值
						B = ObjRecord["B"][pry] --取出紀錄於物品上的 B 值
						local Role = Role:new(obj)
						if Role:X() == Matrix[A][B]["X"] or Role:Y() == Matrix[A][B]["Y"] or Role:Z() == Matrix[A][B]["Z"] then
							Check = Check + 1
						end
					end
				end
			end
			if Check == Num then
				break
			end
			sleep( 3 )
		end
--		SetModeEX( OwnerID() , EM_SetModeType_Move , true )
		--每移動 Circle 圈，檢查是否要重生陣列中所有NPC
		if Circle > 0 then
			RC = RC + 1
			if RC >= Circle then
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

		--檢查陣列中的物件是否都還存在，如果都不存在，便結束回圈
		local Reset = 0
		for pry , obj in pairs(ObjMatrix) do 
			if obj ~= nil then
				if ReadRoleValue(obj, EM_RoleValue_IsNPC) ~= 1 or ReadRoleValue(obj, EM_RoleValue_IsDead) ~= 0 or CheckID(obj) ~= true or ReadRoleValue(obj, EM_RoleValue_RoomID) ~= ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) then -- NPC 是否存在
					Reset = Reset + 1
				end
			end
		end
		if Reset == Num then
			break
		end
	end

end