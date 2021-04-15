function Lua_na_11xmas_Trans()--傳送判斷火堆初始劇情
	local Owner = OwnerID()
	local Muven = LuaFunc_SearchNPCbyOrgID( Owner , 120086  , 50 , 0 ) 	--以隱藏物件114041為中心，向周圍100碼搜尋NPC塔蘭西亞 120085 
									--(最後的0為Type，Type 0 的話會在只找到一個目標時回傳該目標，適用於已知數量目標)
									--(1 的話則是無論找到幾個，都回傳整個群組，適用於未知數量目標)
	SetDefIdleMotion( Owner , 242 )  --熄滅的狀態
 	WriteRoleValue ( Muven , EM_RoleValue_PID , 0 )
	local X = ReadRoleValue( Muven , EM_RoleValue_PID )
--	say( Muven ,"before start" ..  X)
end


function Lua_storm_path_start()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID) --確認伺服器的分流
	local Count = SetSearchAllNPC( RoomID) --尋找分流內所有的NPC
	local Obj
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsg( Owner , 1 , "[SC_2011XMAS_TRANS_MSG]" ) 	-- (0 自己 1 區域 2 全部玩家 )。冰凍的氣息已經散去，1分鐘之後將所有冒險者傳送回海波拉高原！
	end
	if  Count ~= 0 then
		for i=1 , Count, 1 do  --設定搜尋所有NPC次數的迴圈
			local ID = GetSearchResult() --取得搜尋NPC的結果
			Obj=Role:New(ID)
			
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue(  ID, EM_RoleValue_OrgID)--確認所有玩家的編號
				if Name ==120090 then  --ZONE5 傳送判斷
					 BeginPlot( ID , "Lua_na_11xmas_Trans2" , 0 )
				end
			end
		end
	end
end


function Lua_na_11xmas_Trans2() --開放一小時之後關閉
	local Owner = OwnerID()
	local Muven = LuaFunc_SearchNPCbyOrgID( Owner , 120086  , 50 , 0 ) 	
	SetDefIdleMotion( Owner , 11 )	
	WriteRoleValue( Muven , EM_RoleValue_PID , 1 )
	sleep( 36000 ) -- 36000 1小時後刪除NPC
	WriteRoleValue ( Muven , EM_RoleValue_PID , 0 )
	BeginPlot( Owner , "Lua_na_11xmas_Trans" , 0 )
end


--測試指令
--------------------------------------------------------------------------------------------------------------------

function Lua_na_11xmas_buffadd() --疊加BUFF至19層
	KORS_buffUpDown( OwnerID()  , 621897 , 0 , 19 )  -- KORS_buffUpDown( ObjID , BuffID , UpDown , Level ,time )  , UP == 0，DOWN == 1 
end


function Lua_na_11xmas_test_start()
	BeginPlot( OwnerID(), "Lua_na_11xmas_start" , 0 )
	BeginPlot( OwnerID(), "Lua_na_11xmas_wood_born" , 0 )
end

function Lua_na_11xmas_test_transout() --傳送出活動區
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Player = SetSearchAllPlayer( RoomID ) --檢查區域中的玩家總數
	local ID 
	for i=1, table.getn(PlayerList) , 1  do
		if CheckID( PlayerList[i] ) ==true then
			AddBuff( PlayerList[i] , 621720 , 2 , 1)--清除BUFF，玩家會傳送出此區域
		else
			DebugMsg( 0, 0 ,"ID = "..PlayerList[i])
		end					
	end
end


function Lua_na_xmas_test_1() --將自己寫入Player
	local Owner = OwnerID()
	table.insert( PlayerList , Owner )
end


function Lua_na_xmas_test_2() --讀取目前的Reg值
	local Owner = OwnerID()
	local O_Reg2 = ReadRoleValue( Owner , EM_RoleValue_Register2 )
	say( Owner , " score = " .. O_Reg2 )
end


function Lua_na_11xmas_ClearBuff()
	local Xmas = { 621727 , 621729 , 621731 , 621897, 621715 }
	local Owner = OwnerID()
	for i = 1, table.getn(Xmas), 1 do
		CancelBuff(Owner , Xmas[i] )  --清除玩家身上所有活動相關BUFF
	end
	say( Owner , "CancelBuff")
end	