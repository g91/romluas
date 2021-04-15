--控制器劇情

-- lua_mika_wolfcome_control_01  -- 狼  控制器
-- lua_mika_wolfcome_control_02  -- 羊  控制器
-- lua_mika_wolfcome_control_03  -- 草 控制器
-- lua_mika_wolfcome_control_04 -- 邊界驅逐用 控制器
-- lua_mika_wolfcome_control_05 -- 牧場偵測點


--  1. 狼控制器
--功能: 活動開始各時間區間 跑狼出生劇情 一次只生一隻

function lua_mika_wolfcome_control_01()

	local wolftimer = 0
	WriteRoleValue(OwnerID(),  EM_RoleValue_Register , 0 ) 
	WriteRoleValue(OwnerID(),  EM_RoleValue_Register2 , 0 ) 	
	local R1 = RandRange(  24 , 28 )  --   31 --   60   [  1 ]
	local R2 = RandRange(  28 , 36 )  --   61 -- 150  [ 2 ~ 3 ]
	local R3 = RandRange(  22 , 32 )  -- 151 -- 210  [ 1 ~ 2]
	local R4 = RandRange(  18 , 28 )  -- 211 -- 260  [ 1 ~ 3 ]
	local R5 = RandRange(  20 , 26 )  -- 261 -- 290 [ 1 ]

--	DebugMsg( 0 , 0 , "R1 = "..R1 )
--	DebugMsg( 0 , 0 , "R2 = "..R2 )
--	DebugMsg( 0 , 0 , "R3 = "..R3 )
--	DebugMsg( 0 , 0 , "R4 = "..R4 )
--	DebugMsg( 0 , 0 , "R5 = "..R5 )

	while true do
		sleep(10)
		wolftimer = wolftimer +1
		local count = ReadRoleValue(OwnerID(), EM_RoleValue_Register ) -- 當場次 目前狼已產生數量
		local check = ReadRoleValue(OwnerID(), EM_RoleValue_Register2 )   -- 狼出生開關  0 = 可以生狼 1 不行  防止script 重複run
		local nowcount = Lua_Hao_NPC_Range_Search( OwnerID() ,105024 , 900 )  -- range 內物件數量 (狼) 
 	--	DebugMsg( 0 , 0 , "wolf timer = "..wolftimer)	
 	--	DebugMsg( 0 , 0 , "wolf summon count = "..count )	
 	--	DebugMsg( 0 , 0 , "check = "..check )
 --		DebugMsg( 0 , 0 , "now count = "..nowcount )

		if wolftimer > 30 and wolftimer <= 60 and count == 0 and nowcount == 0 and check == 0 then   
		--	DebugMsg( 0 , 0 , "R1 = "..R1 )

			if wolftimer%R1 == 0 then
		--		say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- 召喚次數+1
			end 

		elseif wolftimer >= 61  and wolftimer <= 150 and count <= 3 and nowcount == 0 and check == 0 then   
	--		DebugMsg( 0 , 0 , "R2 = "..R2 )

			if wolftimer%R2 == 0 then
	--			say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- 召喚次數+1

			end 

		elseif wolftimer >= 151  and wolftimer <= 210 and count <= 5 and nowcount <= 1 and check == 0 then     -- 0 ~ 2
	--		DebugMsg( 0 , 0 , "R3 = "..R3 )

			if wolftimer%R3 == 0 then
	--			say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- 召喚次數+1

			end 

		elseif wolftimer >= 211  and wolftimer <= 260 and count <= 7 and nowcount <= 2 and check == 0 then  -- 0 ~ 3
		--	DebugMsg( 0 , 0 , "R4 = "..R4 )

			if wolftimer%R4 == 0 then
		--		say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- 召喚次數+1

			end 

		elseif wolftimer >= 261  and wolftimer <= 290 and count <= 9 and nowcount <= 2 and check == 0 then -- 0 ~ 3
	--		DebugMsg( 0 , 0 , "R5 = "..R5 )

			if wolftimer%R5 == 0 then
	--			say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- 召喚次數+1

			end 

		elseif wolftimer >= 300 then

		--	say(OwnerID(), " END ")
			break
		end
	end
end


-- 2. 羊 控制器
--功能: 跑此區域內 如果羊少於3隻, 就隨機在flag上生出羊

function lua_mika_wolfcome_control_02()
	local FlagObjID = 780825 --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量	
	local Obj = 105023 --  羊
	local ObjNum =  3      --math.floor( FlagNum / 4 )   --種植物件數量   3 /9 ( 0 - 8 )
	local resetTime =  10
	local Range = 10 --亂數範圍
	local Gravity = true --重力

	Lua_Zone354_Create( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range ) 
end

-- 3. 草 控制器
function lua_mika_wolfcome_control_03()
	local FlagObjID = 780822  --旗幟物件編號
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量	
	local Obj = 117052 -- 牧草
	local ObjNum =  5      --math.floor( FlagNum / 4 )   --種植物件數量       5 /10 ( 0 - 9 )
	local resetTime =  40
	local Range = 10 --亂數範圍
	local Gravity = true --重力

	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )--這是定時執行的迴圈
end
-- 草 本身沒有掛劇情

-- 4 場地中央隱藏物件 趕回來專用
function lua_mika_wolfcome_control_04()
	local range = 500
	local limitdis = 350

	while true do
		sleep(30)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- 場地內所有物件數量   羊
	--	say(OwnerID(), "obj1 count ="..count1 )

		if count1 == 0  then -- 如果無
	--		say(OwnerID(), "nobody " )
		else
			local  SearchID= LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
				local dis = GetDistance(OwnerID(), SearchID[i] )
	--			say(OwnerID(), "obj"..i.."range ="..dis )
				if dis > limitdis then -- 如果兩者距離超過可允許範圍
	--				Say(SearchID[i], "obj"..i.."over range" )
					AdjustFaceDir(SearchID[i], OwnerID() , 0 ) --面向 背對
					WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
					sleep(5)
					Lua_MoveLine( SearchID[i] , 40 ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
				else
	--				Say(SearchID[i], "obj"..i.."range is ok" )
				end
			end
		end
	end

end


-- 石堆 : 資料庫NPC設定  物件產生劇情有掛 點擊

-- 5  牧場偵測器 (終點)
function lua_mika_wolfcome_control_05()
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	local range = 95
	local score = 5  -- 送羊回家成功時, 獲得的分數

--	say(OwnerID(), range )

	while true do
--		say(OwnerID(), "CHECK" )
		sleep(30)  --每秒掃一次

		local count1 = Lua_Hao_NPC_Closest_Search( OwnerID() , 105023, range )-- 以Owner為中心做范圍搜尋，回傳最接近的物件
		local count2 = Lua_Hao_NPC_Range_Search( OwnerID() , 105024, range )  -- range 內物件數量  狼

		if count1 ==0 and count2 == 0 then
	--		say(OwnerID(), "no sheep" )
		elseif count1 > 0 then
			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
		--		Say( SearchID[i] , "i = "..i )
				local bufflv = FN_CountBuffLevel(SearchID[i], 507700 )  -- 羊餵食buff 等級

				if bufflv >= 0 then  
					--可以回牧場
	--				Say( SearchID[i] , "buff ok  "..i ) 

					local Player = SearchRangePlayer( OwnerID() , 900 ) --搜尋周圍玩家

					ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_07][$SETVAR1="..score.."]" , C_SYSTEM )  --成功帶領[105023]回到農場，獲得[$VAR1]分。
					ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_07][$SETVAR1="..score.."]" , C_SYSTEM )  
					GuildWolfcomeScore[RoomID] = GuildWolfcomeScore[RoomID] + score
					SetSmallGameMenuStr( Player[0] , 14 , 2 , "[SC_TRAIN10_INTERFACE_02][$SETVAR1="..GuildWolfcomeScore[RoomID].."]" ) 

					DelObj(SearchID[i])
					Lua_Zone354_Reset( SearchID[i] )--產生位置清空
			--		say(OwnerID(), "del sheep ok " )

				else
			--		Say( SearchID[i] , "buff no ok  "..i )

					-- 羊還不能回家喔
					local dis = Rand( 60 )+1    --移動距離40-60
					if dis < 40 then
						dis = 40
					end
			--		Say(SearchID[i], "Move="..dis )
					AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --面向 背對
					WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
					sleep(5)
					Lua_MoveLine( SearchID[i] , dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
					sleep(10)

				end
			end
		elseif count2 > 0 then
			local  SearchID2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105024 , range , 1 )

			for i = 0 , table.getn(SearchID2) , 1 do
				-- 這裡不准再靠近
				local dis = Rand( 80 )+1    --移動距離60-80
				if dis < 60 then
					dis = 60
				end
		--		Say(SearchID2[i], "Move back ="..dis )
				AdjustFaceDir(SearchID2[i], OwnerID() , 180 ) --面向 背對
				WriteRoleValue( SearchID2[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
				sleep(5)
				Lua_MoveLine( SearchID2[i] , dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
			end

		end

	end
end


-- 水池邊界驅逐 偵測_ range 100
-- 擋npc 隨機移動 意外落水

function lua_mika_wolfcome_control_R1()
	local range = 160

	while true do
		sleep(10)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- range 內物件數量  羊
		local count2 = Lua_Hao_NPC_Range_Search( OwnerID() , 105024, range )  -- range 內物件數量  狼

	--	say(OwnerID(), "obj1 count ="..count1 )
	--	say(OwnerID(), "obj2 count ="..count2 )

		if count1 ==0 and count2 == 0 then
		--	say(OwnerID(), "nobody " )

		elseif count1 > 0 then

			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
				-- 這裡不准再靠近
				local dis = Rand( 60 )+1    --移動距離40-60
				if dis < 40 then
					dis = 40
				end
		--		Say(SearchID[i], "Move back ="..dis )
				AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --面向 背對
				WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
				sleep(5)
				Lua_MoveLine( SearchID[i] , dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
			end

		elseif count2 > 0 then
			local  SearchID2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105024 , range , 1 )

			for i = 0 , table.getn(SearchID2) , 1 do
				-- 這裡不准再靠近
				local dis = Rand( 80 )+1    --移動距離60-80
				if dis < 60 then
					dis = 60
				end
		--		Say(SearchID2[i], "Move back ="..dis )
				AdjustFaceDir(SearchID2[i], OwnerID() , 180 ) --面向 背對
				WriteRoleValue( SearchID2[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
				sleep(5)
				Lua_MoveLine( SearchID2[i] , dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
			end

		end
	end
end


function lua_mika_wolfcome_control_R2()
	local range = 250

	while true do
		sleep(10)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- range 內物件數量  羊
		local count2 = Lua_Hao_NPC_Range_Search( OwnerID() , 105024, range )  -- range 內物件數量  狼

--		say(OwnerID(), "obj1 count ="..count1 )
--		say(OwnerID(), "obj2 count ="..count2 )

		if count1 ==0 and count2 == 0 then
--			say(OwnerID(), "nobody " )

		elseif count1 > 0 then

			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
				-- 這裡不准再靠近
				local dis = Rand( 60 )+1    --移動距離40-60
				if dis < 40 then
					dis = 40
				end
--				Say(SearchID[i], "Move back ="..dis )
				AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --面向 背對
				WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
				sleep(5)
				Lua_MoveLine( SearchID[i] , dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
			end

		elseif count2 > 0 then
			local  SearchID2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105024 , range , 1 )

			for i = 0 , table.getn(SearchID2) , 1 do
				-- 這裡不准再靠近
				local dis = Rand( 80 )+1    --移動距離60-80
				if dis < 60 then
					dis = 60
				end
--				Say(SearchID2[i], "Move back ="..dis )
				AdjustFaceDir(SearchID2[i], OwnerID() , 180 ) --面向 背對
				WriteRoleValue( SearchID2[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
				sleep(5)
				Lua_MoveLine( SearchID2[i] , dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
			end

		end
	end
end

function lua_mika_wolfcome_control_R3()
	local range = 200

	while true do
		sleep(10)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- range 內物件數量  羊
		local count2 = Lua_Hao_NPC_Range_Search( OwnerID() , 105024, range )  -- range 內物件數量  狼

	--	say(OwnerID(), "obj1 count ="..count1 )
	--	say(OwnerID(), "obj2 count ="..count2 )

		if count1 ==0 and count2 == 0 then
		--	say(OwnerID(), "nobody " )

		elseif count1 > 0 then

			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
				-- 這裡不准再靠近
				local dis = Rand( 60 )+1    --移動距離40-60
				if dis < 40 then
					dis = 40
				end
		--		Say(SearchID[i], "Move back ="..dis )
				AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --面向 背對
				WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
				sleep(5)
				Lua_MoveLine( SearchID[i] , dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
			end

		elseif count2 > 0 then
			local  SearchID2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105024 , range , 1 )

			for i = 0 , table.getn(SearchID2) , 1 do
				-- 這裡不准再靠近
				local dis = Rand( 80 )+1    --移動距離60-80
				if dis < 60 then
					dis = 60
				end
		--		Say(SearchID2[i], "Move back ="..dis )
				AdjustFaceDir(SearchID2[i], OwnerID() , 180 ) --面向 背對
				WriteRoleValue( SearchID2[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
				sleep(5)
				Lua_MoveLine( SearchID2[i] , dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
			end

		end
	end
end



-- 羊專用
function lua_mika_wolfcome_control_RR()
	local range = 200

	while true do
		sleep(30)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- range 內物件數量  羊
	--	say(OwnerID(), "obj1 count ="..count1 )

		if count1 == 0 then
	--		say(OwnerID(), "nobody " )

		else
			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )
			for i = 0 , table.getn(SearchID) , 1 do
				-- 這裡不准再靠近
				local dis = Rand( 80 )+1    --移動距離60-80
				if dis < 60 then
					dis = 60
				end
	--			Say(SearchID[i], "Move back ="..dis )
				AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --面向 背對
				WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--用跑的
				sleep(5)
				Lua_MoveLine( SearchID[i] , dis ) --參考物件，向前移動到Dis距離的位置 (Dis 填 負數 為 向後移動)
				sleep(10)
			end
		end
	end
end