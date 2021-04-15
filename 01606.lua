function LuaS_RecipeItemUpgrade(X)	--系統呼叫提昇階級機率
	local Proba = { 		15000,
				13125,
				11250,
				9375,
				7501,
				5626,
				3751,
				1876,
				100 }
	return Proba[X+1]
end

function SysRecipeItemUPgrade(BasicRare)	--2011.06.28 回傳升級的等級

	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	-- 升階的機率
	local Probability = { 	[0] = 15000 ,		-- 稀有度0 -> 1 白轉綠
				[1] = 13125 ,		-- 稀有度1 -> 2 綠轉藍
				[2] = 11250 ,		-- 稀有度2 -> 3 藍轉紫
				[3] = 9375 ,		-- 稀有度3 -> 4 紫轉橘
				[4] = 7501 ,		-- 稀有度4 -> 5 橘轉金
				[5] = 5626 ,		-- 稀有度5 -> 6
				[6] = 3751 ,		-- 稀有度6 -> 7
				[7] = 1876 ,		-- 稀有度7 -> 8
				[8] = 100 ,		-- 稀有度8 -> 9
				[9] = 0		}	-- 稀有度9

	-- 增加昇階機率
	local BuffList = {	{ 508456 , 10 } ,		-- 10% 一天生產幸運基礎藥劑 種植專用
				{ 508457 , 25 } , 		-- 25% 一天生產幸運進階藥劑 種植專用
				{ 622944 , 100 } ,		-- 100% 一天生產幸運藥劑 2012.05.21 應廠商需求新增
				{ 508458 , 100 } ,		-- 100% 七天生產幸運藥劑
				{ 508459 , 100 } ,		-- 100% 三十天生產幸運藥劑
				{ 508460 , 25 } ,		-- 25% 稱號 - 1%天分，99%努力(530076) 裝備時專用
				{ 508461 , Lua_Hao_Return_Buff_Lv( OwnerID() , 508461 ) } ,	-- 自訂(測試用)
				{ 508463 , 10 } ,			-- 10% 消耗次數、尚未使用
				{ 508464 , 20 } ,		}	-- 20% 消耗次數、尚未使用
			
	local Reward , Rare = 0 , 0				-- 增加機率、提昇的稀有度
	local Destiny_1 , Destiny_2 , Percent , BuffLv , Key	-- 提昇1階的機率、提昇2階的機率、總機率、法術等級(消耗次數)、是否成功
--	DebugMsg( OwnerID() , 0 , "BasicRare = "..BasicRare )
	for i = 1 , table.getn(BuffList) , 1 do
		if CheckBuff( OwnerID() , BuffList[i][1] ) == true then
			Reward = BuffList[i][2]
			if BuffList[i][1] == 508463 or BuffList[i][1] == 508464 then	-- 消耗次數用
				BuffLv = Lua_Hao_Return_Buff_Lv( OwnerID() , BuffList[i][1] )
				CancelBuff( OwnerID() , BuffList[i][1] )
				if BuffLv ~= 0 then
					AddBuff( OwnerID() , BuffList[i][1] , BuffLv-1 , 3600 )
				end
				break
			end
		end
	end
--	DebugMsg( OwnerID() , 0 , "Reward = "..Reward )
	for i = 0 , table.getn(Probability) , 1 do
		if BasicRare == i then
			Percent = math.random(100000)
			Destiny_1 = Probability[i]*( 1+Reward/100 )
			Key = math.floor( (Destiny_1 / Percent) / 0.01 )
		--	DebugMsg( OwnerID() , 0 , "Probability = "..Probability[i] )
			if Key >= 100 then
				DebugMsg( OwnerID() , Room , "Rare 1 = "..Destiny_1.." / "..Percent )
		--		DebugMsg( OwnerID() , Room , "Chance = "..Destiny_1.." / "..Percent.." , Increased Rare" )
		--	else
			end
		--	math.floor(Destiny_1 / Percent / 0.01 )
			if Destiny_1 >= Percent then
				Rare = Rare + 1
				Percent = math.random(100000)
				Destiny_2 = Probability[i+1]*( 1+Reward/100 )
				Key = math.floor( ( Destiny_2 / Percent ) / 0.01 )
			--	DebugMsg( OwnerID() , 0 , "Probability = "..Probability[i+1] )
			--	if Key >= 100 then
					DebugMsg( OwnerID() , Room , "Rare 2 = "..Destiny_2.." / "..Percent )
			--		DebugMsg( OwnerID() , Room , "Chance = "..Destiny_2.." / "..Percent.." , Increased Rare again" )
			--	else
			--	end
				if Destiny_2 >= Percent then
					Rare = Rare + 1
				end
			end
		end
	end
	if Rare >= 1 then
		DebugMsg( OwnerID() , Room , "Increased Rare "..Rare )
	end
--	DebugMsg( OwnerID() , 0 , "Rare = "..Rare )
	return Rare
end

function Lua_Hao_Test_Recipe_Buff(Lv)

	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Buff = { 508461 , 508462 } -- 增加製作成品稀有度機率、增加製作成品時的速度(固定0.5秒)

	for i = 1 , table.getn(Buff) , 1 do
		CancelBuff( OwnerID() , Buff[i] )
		if Lv > 0 then
			AddBuff( OwnerID() , Buff[i] , Lv-1 , 3600 )
		else
			DebugMsg( OwnerID() , Room , "Entry error" )
		end
	end
end

function Lua_Hao_Test_Recipe_Give(ObjID)	-- 輸入物品ID後，給予生產配方的製作材料

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Recipe
	-- 物品：200000 ~ 209999、240001 ~ 249999　武器：210001 ~ 219999　防具：220001 ~ 239999
	if ( ObjID >= 200000 and ObjID <= 209999 ) or ( ObjID >= 240001 and ObjID <= 249999 ) or ( ObjID >= 210001 and ObjID <= 219999 ) or ( ObjID >= 220001 and ObjID <= 239999 ) then
		for i = 550001 , 559999 , 1 do
			Recipe = GameObjInfo_Int( i ,"Item1_Normal" )
			if Recipe == ObjID then
				ObjID = i
				DebugMsg( Player , Room , "Recipe = "..i )
				break
			end
		end
	else
		DebugMsg( Player , Room , "Entry error" )
		return false
	end

	local Source = 	{	{ GameObjInfo_Int( ObjID ,"Source1" ) , GameObjInfo_Int( ObjID ,"SourceCount1"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source2" ) , GameObjInfo_Int( ObjID ,"SourceCount2"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source3" ) , GameObjInfo_Int( ObjID ,"SourceCount3"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source4" ) , GameObjInfo_Int( ObjID ,"SourceCount4"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source5" ) , GameObjInfo_Int( ObjID ,"SourceCount5"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source6" ) , GameObjInfo_Int( ObjID ,"SourceCount6"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source7" ) , GameObjInfo_Int( ObjID ,"SourceCount7"  )	 } , 
				{ GameObjInfo_Int( ObjID ,"Source8" ) , GameObjInfo_Int( ObjID ,"SourceCount8"  )	 } 	}
	local MaxHeap , GiveCount

	for i = 1 , table.getn( Source ) , 1 do
		if Source[i] ~= 0 then
			MaxHeap = GameObjInfo_Int( Source[i][1] ,"MaxHeap" )	-- 抓物品的堆疊量
			GiveCount = Source[i][2]
			for j = 1 , GiveCount , 1 do
				DebugMsg( Player , 0 , "MaxHeap = "..MaxHeap )
				if MaxHeap < 2 then
					for k = 1 , 10 , 1 do
						GiveBodyItem( Player , Source[i][1] , MaxHeap )
						if K%5 == 0 then
							Sleep(1)
						end
					end
				else
					GiveBodyItem( Player , Source[i][1] , MaxHeap )
				end
			end
			sleep(1)
		end
	end
end