function LuaFunc_Random_Transport()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = 780067
	local FlagCount = GetMoveFlagCount ( Flag )
	local Num = Rand( FlagCount ) 
--	Say( OwnerID() , FlagCount )
	if SetPosByFlag( TargetID(), Flag , Num ) then
--		AddToPartition( TargetID() , RoomID )
	end

end

function LuaFunc_Random_TransportEX(Target , Flag,Transport) --傳送複數人數
	-- Flag 要傳送的旗子編號
	-- Transport 要傳送的人數
	local ReturnTag = {}
	local FlagCount = GetMoveFlagCount ( Flag ) - 1 --計算該旗子編號的個數(不包括第0號旗)
	local Pos = {} --儲存使用的旗標資料
	local PC = {} --儲存被傳送的玩家資料
	local Player = LuaFunc_PartyData(Target) --取得玩家隊伍的資料

	if FlagCount < 1 then
		Say( OwnerID() , "Error Flag" )
		return
	end

	for i = 1 , Player[0] , 1 do --初始化陣列 PC 
		PC[i] = 0
	end

	for i = 1 , FlagCount , 1 do --初始化陣列 Pos 
		Pos[i] = 0
	end

	for i = 1 , Player[0] , 1 do --讓陣列 PC 等於亂數排列的玩家陣列

		local Num = Rand(Player[0]) + 1

		for j = 1 , table.getn( PC ) , 1 do
			if PC[Num] ~= 0 then
				Num = Num + 1
				if Num > table.getn(PC) then
					Num = 1
					for k = 1 , table.getn(PC) , 1 do
						if PC[Num] ~= 0 then
							Num = Num + 1
						end
					end
				end
			else
				break
			end
		end

		PC[Num] = Player[i]

	end

	for i = 1 , FlagCount , 1 do --讓陣列 Pos 等於亂數排列的旗號陣列
		local Num = Rand(FlagCount) + 1

		for j = 1 , table.getn(Pos) , 1 do
			if Pos[Num] ~= 0 then
				Num = Num + 1
				if Num > table.getn(Pos) then
					Num = 1
					for k = 1 , table.getn(Pos) , 1 do
						if Pos[Num] ~= 0 then
							Num = Num + 1
						else
							break
						end
					end
				end
			else
				break
			end
		end
		Pos[Num] = i
	end

--	local temp = ""
--	for i = 1 , table.getn(PC) , 1 do --初始化陣列 PC 
--		temp = temp..PC[i]..", "
--	end
--	Say( OwnerID() , "Player : "..temp )
--	temp = ""
--	for i = 1 , table.getn(Pos) , 1 do --初始化陣列 PC 
--		temp = temp..Pos[i]..", "
--	end
--	Say( OwnerID() , "Flag : "..temp )

	for i = 1 , Transport , 1 do --將陣列 PC 中的玩家傳送到對應的陣列 Pos 位置代表的旗號

		if PC[i] == nill or Pos[i] == nill then
			break
		end
		if ReadRoleValue( PC[i] , EM_RoleValue_IsDead ) ~= 1 then
			SetPosByFlag( PC[i], Flag , Pos[i] ) --將該角色傳送到特定旗標
			ReturnTag[i] = PC[i]
		end
--		Say( PC[i],  PC[i].." GoTo "..Pos[i] )
	end
	return ReturnTag
end