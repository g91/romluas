function Lua_Hao_Test_Skill_001()

--	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	--等同於 ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )		Org = 資料庫內的ID
--	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
--	local BaseX = Obj :X()
--	local BaseY = Obj :Y()
--	local BaseZ = Obj :Z()
--	local BaseDir = Obj:Dir()

--	local MyX = ReadRoleValue( OwnerID() , EM_RoleValue_X )
--	local MyY = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
--	local MyZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
--	local MyDir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
--	
--	local YourX = ReadRoleValue( TargetID() , EM_RoleValue_X )
--	local YourY = ReadRoleValue( TargetID() , EM_RoleValue_Y )
--	local YourZ = ReadRoleValue( TargetID() , EM_RoleValue_Z )
--	local YourDir = ReadRoleValue( TargetID() , EM_RoleValue_Dir )

--	local X = 0

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --取得所在room
	local Count = SetSearchAllPlayer(RoomID) -- 搜索區域內的所有NPC ，回傳值為其數量
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件

			local IDX = ReadRoleValue( ID , EM_RoleValue_X )
			local IDY = ReadRoleValue( ID , EM_RoleValue_Y )
			local IDZ = ReadRoleValue( ID , EM_RoleValue_Z )
			local IDDir = ReadRoleValue( ID , EM_RoleValue_Dir )

		--	X = X + 1
		--	Say( ID , "X="..X )
			Say( ID , "My X="..IDX  )
			Say( ID , "My Y="..IDY  )
			Say( ID , "My Z="..IDZ  )
			Say( ID , "My Dir="..IDDir )
		end
	end

--	Say( OwnerID() , "My X="..MyX  )
--	Say( OwnerID() , "My Y="..MyY  )
--	Say( OwnerID() , "My Z="..MyZ  )
--	Say( OwnerID() , "My Dir="..MyDir )

--	Say( TargetID() , "Your X="..YourX )
--	Say( TargetID() , "Your Y="..YourY )
--	Say( TargetID() , "Your Z="..YourZ )
--	Say( TargetID() , "Your Dir="..YourDir )

--	SetPos( RoleID, X, Y , Z , Dir )	將物件傳送至坐標位置
end

function Lua_Hao_RelationSystem_000(Choose)	-- 關係系統 - 夫妻物品事先檢查

	local I_have_H = Check_Relation( OwnerID() , EM_RelationType_Husband )	-- 取得本身丈夫的資訊
	local I_have_W = Check_Relation( OwnerID() , EM_RelationType_Wife )		-- 取得本身妻子的資訊
	local U_have_H = Check_Relation( TargetID() , EM_RelationType_Husband )	-- 取得目標丈夫的資訊
	local U_have_W = Check_Relation( TargetID() , EM_RelationType_Wife )		-- 取得目標妻子的資訊
	local GetLv = GetRelationLv( OwnerID() , TargetID() )				-- 取得關係系統等級

	if ( Choose == "Type1" ) then		-- 關係系統等級1 ~ 5	此物品1 ~ 5級皆可用
		Say( OwnerID() , Choose )
		if GetLv > 5 then
			return false
		elseif GetLv <= 5 then
			return true
		end
	elseif ( Choose == "Type2" ) then	-- 關係系統等級6 ~ 10	此物品6 ~ 10級皆可用
		Say( OwnerID() , Choose )
		if GetLv < 6 then
			return false
		elseif GetLv >= 6 then
			return true
		end
--	elseif ( Choose == "Type3" ) then	-- 關係系統等級9 ~ 10	此物品1 ~ 10級皆可用
--		Say( OwnerID() , Choose )
--		if GetLv >= 10 then
--			return false
--		elseif GetLv < 10 then
--			return true
--		end
	end

	if ( I_have_H == true and U_have_W == true ) or ( I_have_W == true and U_have_H == true ) then
		if GetLv == nil then
			Say( OwnerID() , "Nil" )
			return false
		elseif GetLv >= 10.0 then
			Say( OwnerID() , "Lv 10" )
			return false
		end
	elseif ( I_have_H == false and U_have_W == false ) or ( I_have_W == false and U_have_H == false ) then
		Say( OwnerID() , "haven't relation between their" )
		return false
	end
	
end

function Lua_Hao_RelationSystem_001()	-- 關係系統 - 夫妻物品使用後結果

--	Say( OwnerID() , "1" )
--	Say( TargetID() , "2" )

	local Exp = { 300 , 900 , 2700 , 8100 , 24300 , 72900 , 218700 , 656100 , 1968300 , 5904900 }
	local GetLv = GetRelationLv( OwnerID() , TargetID() )							-- 取得關係系統等級
--	Say( OwnerID() , "GetLv ="..GetLv )
	local Step = 0
	local Level
	if math.floor(GetLv)~=0	then
		Level = Exp[math.floor(GetLv)+1]								-- 此等級區間的升級所需經驗值
	else
		Level = Exp[math.floor(GetLv)]									-- 此等級區間的升級所需經驗值
	end
	
	if Level == nil then
		Level = 0
	end
--	Say( OwnerID() , "Level ="..Level )
	local NowLv = ( GetLv - math.floor(GetLv) ) * Level							-- 現有等級已有經驗值
--	Say( OwnerID() , "NowLv ="..NowLv )
	local Value = 5000											-- 物品增加的經驗值
	local I_have_H = Check_Relation( OwnerID() , EM_RelationType_Husband )				-- 取得本身丈夫的資訊
	local I_have_W = Check_Relation( OwnerID() , EM_RelationType_Wife )					-- 取得本身妻子的資訊
	local U_have_H = Check_Relation( TargetID() , EM_RelationType_Husband )				-- 取得目標丈夫的資訊
	local U_have_W = Check_Relation( TargetID() , EM_RelationType_Wife )					-- 取得目標妻子的資訊

	if I_have_H == true and U_have_W == true then
		Step = 1
	elseif I_have_W == true and U_have_H == true then
		Step = 2
	end

	if ( I_have_H == true and U_have_W == true ) or ( I_have_W == true and U_have_H == true ) then

		if ( NowLv + Value ) <= Level then
		-- 如果現有等級已有經驗值 + 物品增加的經驗值 <= 此等級區間需求的升級經驗值時
			local AddValue = Value / Level				
			local NewLv = GetLv + AddValue	
		--	Say( OwnerID() , "NewGetLv ="..GetLv )					
		--	Say( OwnerID() , "I.AddValue ="..AddValue )
		--	Say( OwnerID() , "I.NewLv ="..NewLv )
			if NewLv <= 10.0 then

				if Step == 1 then
				--	Say( OwnerID() , "Step =".."1" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Wife , NewLv , EM_RelationType_Husband , NewLv )
				-- SetRelation( OwnerID() , TargetID() , 目標 , 值 , 本身 , 值 )
				elseif Step == 2 then
				--	Say( OwnerID() , "Step =".."2" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Husband , NewLv , EM_RelationType_Wife , NewLv )
				end
			elseif NewLv > 10.0 then

				if Step == 1 then
				--	Say( OwnerID() , "Step =".."3" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Wife , 10.0 , EM_RelationType_Husband , 10.0 )
				elseif Step == 2 then
				--	Say( OwnerID() , "Step =".."4" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Husband , 10.0 , EM_RelationType_Wife , 10.0 )
				end
			end
		else	--超過等級
	  		local Count = ( ( NowLv + Value ) )							
			-- 現有等級已有的經驗值 加上 物品增加的經驗值 (兩者相加後的總經驗值)
			local Rank = math.floor(GetLv)
			-- 現在的關係系統等級
			local LevelRank = Level
			if LevelRank == 0 then
				LevelRank = Exp[1]
			end
			-- 下一次升級所需的總經驗值
		--	Say( OwnerID() , "Count ="..Count )	
		--	Say( OwnerID() , "LevelRank ="..LevelRank )	

			while true do		
				if Count >= LevelRank then
					Count = Count - LevelRank
				--	Say( OwnerID() , "NewCount =" .. Count  )
					Rank = Rank + 1
				--	Say( OwnerID() , "NewRank ="..Rank )	
					if Rank >= 10 then
						Rank = 10
						Count = 0
						break
					end
					LevelRank = Exp[Rank+1]
				--	Say( OwnerID(OO) , "NewRank ="..Rank )
				--	Say( OwnOerID() , "NewLevelRank ="..LevelRank )
				elseif Count < LevelRank then
					break
				end
			end

--			local NextLv = ( ( NowLv + Value ) - Level ) / Exp[math.floor(GetLv)+1]
--			Say( OwnerID() , "II.NextLv ="..NextLv )
--			local NewLv = math.floor(GetLv) + NextLv + 1
--			local NewLv2 = GetLv + NextLv 

			local NextLv = Count / LevelRank
			-- 計算後的總經驗值  / 下一次升級所需的總經驗值
		--	Say( OwnerID() , "II.NextLv ="..NextLv )
			local NewLv = Rank + NextLv
		--	Say( OwnerID() , "NewGetLv ="..GetLv )	
			-- 本身等級 + 計算後的%比經驗值
		--	local NewLv2 = GetLv + NextLv 
		--	Say( OwnerID() , "II.NewLv ="..NewLv )
		--	Say( OwnerID() , "II.NewLv2 ="..NewLv2 )
			if NewLv <= 10.0 then

				if Step == 1 then
				--	Say( OwnerID() , "Step =".."5" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Wife , NewLv , EM_RelationType_Husband , NewLv )
				elseif Step == 2 then
				--	Say( OwnerID() , "Step =".."6" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Husband , NewLv , EM_RelationType_Wife , NewLv )
				end
			elseif NewLv > 10.0 then

				if Step == 1 then
				--	Say( OwnerID() , "Step =".."7" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Wife , 10.0 , EM_RelationType_Husband , 10.0 )
				elseif Step == 2 then
				--	Say( OwnerID() , "Step =".."8" )
				--	Say( OwnerID() , NewLv )
					SetRelation( OwnerID() , TargetID() , EM_RelationType_Husband , 10.0 , EM_RelationType_Wife , 10.0 )
				end
			end
		end
	else
		Say( OwnerID() , "haven't relation" )		-- 當前兩者沒有夫妻關係。
	end
end

function Lua_Hao_Test_Report_Value()

	local Player = OwnerID()
	local Value = {}	
	local String

	Value["STR"] = EM_RoleValue_FinStr
	Value["STA"] = EM_RoleValue_FinSta
	Value["INT"] = EM_RoleValue_FinInt
	Value["MND"] = EM_RoleValue_FinMnd
	Value["AGI"] = EM_RoleValue_FinAgi
	
	for Var , List in pairs(Value) do
		String = ReadRoleValue( Player , Value[Var] )
		DebugMsg( Player , 0 , Var.."="..String )
	end
end


function Lua_Hao_Test_Report_Value_2()

	local Player = OwnerID()
	local Value = {}	
	local Title = {}
	Value[1] = ReadRoleValue( Player , EM_RoleValue_FinStr )
	Value[2] = ReadRoleValue( Player , EM_RoleValue_FinAgi )
	Value[3] = ReadRoleValue( Player , EM_RoleValue_FinSta )
	Value[4] = ReadRoleValue( Player , EM_RoleValue_FinInt )
	Value[5] = ReadRoleValue( Player , EM_RoleValue_FinMnd )
	
	Title[1] = "STR"
	Title[2] = "AGI"
	Title[3] = "STA"
	Title[4] = "INT"
	Title[5] = "MND"

	for i = 1 , #Value , 1 do
		DebugMsg( Player , 0 , Title[i].."="..Value[i] )
	end
end

function Lua_Hao_Test_Set_Weapon_Tier(ID)	-- 

	if ID == nil then
		ID = 0
	end

	local Player = OwnerID()
	local Level = { 0 , 2 , 5 , 9 , 12 , 15 }	-- 白裝、綠裝、藍裝、紫裝、橘裝、金裝
	local Tier	-- 階層
	local LimitLv = GameObjInfo_Int( ID , "LimitLv" )	-- 該裝備的等級
	local Rare = GameObjInfo_Int( ID , "Rare" )	-- 稀有度
	local WeaponLV = ( ( ( LimitLv + ( Level[Rare+1]*1.5 )) - 1 ) / 20 ) + 1	-- 階層
	--( ( ( 裝備當前等級限制 + ( 稀有度額外加成Lv * 1.5 ) ) -1 ) / 20 ) + 1
	DebugMsg( Player , 0 , "LimitLv = "..LimitLv.." Rare = "..Level[Rare+1].." WeaponLV = "..WeaponLV )
	Tier = GetItemInfo( Player , EM_ItemPacketType_EQ , 15 , EM_ItemValueType_PowerQuality )
	DebugMsg( Player , 0 , "Tier = "..Tier )
-- 4階武器未升級前為10，升為5階後為11，升為20階後為26	
	SetItemInfo( Player , EM_ItemPacketType_EQ , 15 , EM_ItemValueType_PowerQuality , 21 )
	Tier = GetItemInfo( Player , EM_ItemPacketType_EQ , 0 , EM_ItemValueType_PowerQuality )
	DebugMsg( Player , 0 , "New Tier = "..Tier )
end