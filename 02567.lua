--function Lua_na_zone358(RoomID )
function Lua_na_11xmas_zoneAI() --活動區域AI， 區域重置；建立全域變數 PlayerList 為陣列，時間設定
	if PlayerList == nil then
		PlayerList = {}
	end
	while true do
		local hour = GetSystime(1) --抓系統時間(小時)
		local min = GetSystime(2) --抓系統時間(分鐘)
		local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_RealZoneID)				
		local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流
	--	say( OwnerID() , hour..":"..min)
		say( OwnerID() , "now = "..hour .." : ".. min )
		if Zone == 358 then  --只有出現在ZONE 358
			if  hour == 3 or hour  == 7 or hour  == 11 or hour  == 15 or hour  ==19 or hour  == 23  then   --通知玩家關閉區域
				if min == 50 then --50分的時候進行廣播，10分鐘後將關閉此區域
  					RunningMsgEx( OwnerID() , 1 , 3 , "[SC_2011XMAS_05]" )	-- 冰凍的傳送氣息呈現不穩定的狀態，將於10分鐘之後將所有冒險者傳送回海波拉高原！
				elseif min  == 59 then --59分時進行廣播，剩下一分鐘關閉，區域中的物件全部清除
  					RunningMsgEx( OwnerID() , 1 , 3 , "[SC_2011XMAS_09]" ) 	-- (0 自己 1 區域 2 全部玩家 )。冰凍的氣息已經散去，1分鐘之後將所有冒險者傳送回海波拉高原！
					BeginPlot( OwnerID() , "Lua_na_11xmas_del" , 0 ) --刪除
				end


			elseif hour  == 0 or hour  == 4 or hour  == 8 or hour  == 12 or hour  == 16 or hour  == 20  then   --將玩家強制傳送出ZONE 358
				if min == 0 then 	---執行將玩家傳送出ZONE，區域重置劇情
					local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Player = SetSearchAllPlayer( RoomID ) --檢查區域中的玩家總數
			
					if  table.getn(PlayerList) ~= nil then 
						for i=1, table.getn(PlayerList) , 1  do
							if CheckID( PlayerList[i] ) ==true then
								CancelBuff( PlayerList[i] , 621720)--清除BUFF，玩家會傳送出此區域
							else
								DebugMsg( 0, 0 ,"ID = "..PlayerList[i])
							end	
						end				
					end
				elseif min == 5 then --開啟暴風雪人劇情
					Lua_na_11xmas_ResetAll() --執行刪除阻擋門、塔蘭西亞劇情
					Lua_na_11xmas_start() --產生火堆與阻擋牆
					Lua_na_11xmas_wood_born()
				end
	--		elseif hour  == 17 then   --將玩家強制傳送出ZONE 358
	--			if min == 40 then 	---執行將玩家傳送出ZONE，區域重置劇情
	--				local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--				local Player = SetSearchAllPlayer( RoomID ) --檢查區域中的玩家總數
	--		
	--				if  table.getn(PlayerList) ~= nil then 
	--					for i=1, table.getn(PlayerList) , 1  do
	--						if CheckID( PlayerList[i] ) ==true then
	--							CancelBuff( PlayerList[i] , 621720)--清除BUFF，玩家會傳送出此區域  		--
	--						else
	--							DebugMsg( 0, 0 ,"ID = "..PlayerList[i])
	--						end	
	--					end				
	--				end
	--			elseif min == 42 then --開啟暴風雪人劇情
	--				Lua_na_11xmas_ResetAll() --執行刪除阻擋門、塔蘭西亞劇情
	--				Lua_na_11xmas_start() --產生火堆與阻擋牆
	--				Lua_na_11xmas_wood_born()
	--			end
			end
		end
		Sleep(600)   --一分鐘跑一次
	end
end	


function Lua_na_11xmas_start() --從旗標產生主火堆
	local BIGFIRE
	local HideZoneObj
	local Tarlen 
	local Boss

	Tarlen = CreateObjByFlag( 120085, 781065 , 36 , 1 ) --在旗標 781065，0的位置建立聖焰火堆
	SetModeEx( Tarlen , EM_SetModeType_SearchenemyIgnore , false ) --不被搜尋
	SetModeEx( Tarlen , EM_SetModeType_Obstruct , false ) --不阻擋
	SetModeEx( Tarlen , EM_SetModeType_Mark , true ) --標記
	SetModeEx( Tarlen , EM_SetModeType_Move , false ) --不移動
	SetModeEx( Tarlen , EM_SetModeType_HideName , true ) --顯示名稱
	SetModeEx( Tarlen , EM_SetModeType_ShowRoleHead , true ) --顯示頭像框
	AddToPartition( Tarlen , 0 ) --使建立出來的NPC出現
	Tarlencia = Tarlen

	BIGFIRE = CreateObjByFlag( 120081, 781065 , 0 , 1 ) --在旗標 781065，0的位置建立聖焰火堆
	SetModeEx( BIGFIRE , EM_SetModeType_SearchenemyIgnore , false ) --不被搜尋
	SetModeEx( BIGFIRE, EM_SetModeType_Show , false ) --不顯示 
	SetModeEx( BIGFIRE , EM_SetModeType_Obstruct , false) --阻擋
	SetModeEx( BIGFIRE , EM_SetModeType_Mark , false ) --不標記
	SetModeEx( BIGFIRE , EM_SetModeType_Move , false ) --不移動
	SetModeEx( BIGFIRE , EM_SetModeType_HideName , false ) --不顯示名稱
	SetModeEx( BIGFIRE , EM_SetModeType_ShowRoleHead , false ) --不顯示頭像框
	AddToPartition( BIGFIRE , 0 ) --聖焰判斷
	SaintFire = BIGFIRE

	HideZoneObj= CreateObjByFlag( 120089 , 781065 , 37 , 1 ) --在旗標 781065，0的位置建立區域隱藏物件
	SetModeEx(HideZoneObj,  EM_SetModeType_Strikback, false )--反擊
	SetModeEx( HideZoneObj, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( HideZoneObj, EM_SetModeType_Show,false ) --不顯示 
	SetModeEx( HideZoneObj, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( HideZoneObj, EM_SetModeType_Mark,  false )--標記
	SetModeEx( HideZoneObj, EM_SetModeType_Move, false )--移動
	SetModeEx( HideZoneObj, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( HideZoneObj, EM_SetModeType_HideName, false )--名稱
	SetModeEx( HideZoneObj, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( HideZoneObj, EM_SetModeType_Fight , false )--可砍殺攻擊
	AddToPartition( HideZoneObj , 0 ) 

	Boss= CreateObjByFlag( 106539 , 781066 , 0 , 1 ) --在旗標 781065，0的位置產生暴風雪人
	SetModeEx(Boss,  EM_SetModeType_Strikback, true )--反擊
	SetModeEx(Boss,  EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx(Boss,  EM_SetModeType_Show , true ) --不顯示 
	SetModeEx(Boss,  EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx(Boss,  EM_SetModeType_Mark,  true )--標記
	SetModeEx(Boss,  EM_SetModeType_Move, true  )--移動
	SetModeEx(Boss,  EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx(Boss,  EM_SetModeType_HideName, true )--名稱
	SetModeEx(Boss,  EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx(Boss,  EM_SetModeType_Fight , true )--可砍殺攻擊
	AddToPartition( Boss, 0 ) --使建立出來的魔法陣出現
	StormMan = Boss
	CallPlot ( StormMan,"MoveAllFlag", 781066 )

end


function Lua_na_11xmas_wood_born()

--	local X = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}  --20個
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local firewood = {}
	for i = 1 , 35, 1 do   -- 產生35個
		firewood[i] = CreateObjByFlag( 120083 , 781065, i ,1) --使用旗子產生雪堆 npc 旗子編號 數量 
		SetModeEx( firewood[i] , EM_SetModeType_Show, true )
		SetModeEx( firewood[i]  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( firewood[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( firewood[i]  , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( firewood[i]  , EM_SetModeType_Mark, true )--標記
		SetModeEx( firewood[i]  , EM_SetModeType_Move, true )--移動
		SetModeEx( firewood[i]  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( firewood[i]  , EM_SetModeType_HideName, false )--名稱
		SetModeEx( firewood[i]  , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( firewood[i]  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetDefIdleMotion( firewood[i] , 242 )  --熄滅的狀態
		AddToPartition( firewood[i] , Room )	--讓小木堆產生
	--	say( firewood[i] , " i = ".. i )
	end
end



--區域隱藏物件，檢查玩家狀態及控制NPC塔蘭西亞身上的數值
function Lua_na_11xmas_gamezone() --120089 暖冬活動區域物件
	local BOX = OwnerID()	
	if table.getn(PlayerList) >= 0 then
		PlayerList = {}   --設定player為空的陣列
	--	Say( BOX ,  "TABLE = " ..table.getn(PlayerList) )
	end
	SetPlot( BOX , "Range" , "Lua_na_11xmas_insert_PlayerList" ,10 )
	WriteRoleValue( Tarlencia ,  EM_RoleValue_Register1 , 0 )	
	while true do --迴圈，活動結束前一直執行給BUFF的動作
		TarlenReg1 =ReadRoleValue( Tarlencia , EM_RoleValue_Register1 )	
		local X = table.getn(PlayerList)
		if TarlenReg1 == 1 then  -- 已有玩家成為聖焰使者
			local TarlenCount = 0;
		--	say(  Tarlencia , "1 = ".. TarlenReg1 )  -- 有使者
		--	Say( Tarlencia , " Player = " .. X )
 			for i = 1 , table.getn(PlayerList) , 1 do  
				if CheckID( PlayerList[i] ) == true then
				--	Say( PlayerList[i] , "Player = "..PlayerList[i] )
					if CheckBuff( PlayerList[i] , 621729 ) == true then --如果場上有聖焰使者 
						TarlenCount = TarlenCount + 1;
					--	Say( Tarlencia , "TarlenCount = "..TarlenCount )
					end
				else
					DebugMsg( 0, 0 ,"ID = "..PlayerList[i]);
				end
			end
			--如果上述迴圈中的玩家沒有聖焰使者
			if TarlenCount == 0 then
				WriteRoleValue( Tarlencia , EM_RoleValue_Register1 , 0 ) --將塔蘭西亞的值寫為0
				TarlenReg1 = ReadRoleValue( Tarlencia , EM_RoleValue_Register1 )	
			--	say(  Tarlencia , "02 = ".. TarlenReg1 )  --回到0
			end

		elseif TarlenReg1 == 2 then  --如果活動已經結束
		--	say(  Tarlencia , "END = ".. TarlenReg1)
			Lua_na_11xmas_delallbuff()
			Lua_na_11xmas_del()
			break
		end	
	sleep(10)
	end
	Delobj( BOX)
end



--安全區火堆物件，給予BUFF
function Lua_na_120081_safe() --安全區的初始劇情						       
	WriteRoleValue( SaintFire , EM_RoleValue_Register1 , 0 )  --將火焰值寫為0
--	Lua_na_11xmas_saferange() --出現魔法陣
	Lua_na_11xmas_addDoor() --阻擋門出現	
	BeginPlot( SaintFire , "Lua_na_11xmas_coldbuff" , 0) --寒冷值
--	while true do --迴圈，活動結束前一直執行給BUFF的動作
--		SysCastSpellLv( SaintFire , SaintFire , 498901, 0 ) --施放溫暖的祝福
--		sleep(10)
--	end
	
end	



--function Lua_na_11xmas_saferange() --火堆
--
--	local Obj = Role:new( OwnerID() ) --在"活動隱形物件"原位置，建立新的NPC
--	local BaseX = Obj :X() --隱形物件的X軸
--	local BaseY = Obj :Y() --隱形物件的Y軸
--	local BaseZ = Obj :Z() --隱形物件的Z軸
--	local BaseDir = Obj:Dir() --隱形物件的面向
--	local Magic
--
--	Magic = CreateObj( 120082 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --建立"魔法陣"
--	SetModeEx( Magic , EM_SetModeType_SearchenemyIgnore , false ) --不被搜尋
----	SetModeEx( Magic, EM_SetModeType_Gravity, false )--重力
--	SetModeEx( Magic , EM_SetModeType_Obstruct , false ) --不阻擋
--	SetModeEx( Magic , EM_SetModeType_Mark , false ) --不標記
--	SetModeEx( Magic , EM_SetModeType_Move , false ) --不移動
--	SetModeEx( Magic , EM_SetModeType_HideName , false ) --不顯示名稱
--	SetModeEx( Magic , EM_SetModeType_ShowRoleHead , false ) --不顯示頭像框
--	AddToPartition( Magic , 0 ) --使建立出來的魔法陣出現
--end
--

function Lua_na_11xmas_S_fire() --燃燒的火堆初始劇情
	local Owner = OwnerID()
	local Target = TargetID()
	SetDefIdleMotion( Owner , 11 )  --顯示有火的狀態
	for i = 1 , 15, 1 do  --15 * 1 sec = 30sec 後消失
		CastSpell( Owner , Owner ,498904)
		sleep(10)
	end
	Lua_na_11xmas_delfire()
end

-------------------------------------------------------------------------------------------------------------

function Lua_na_11xmas_delallbuff() --暴風雪人死亡後， 清除玩家身上所有相關BUFF
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Xmas = { 621727 , 621729 , 621731 ,621897, 621715 }
	for i = 1 , table.getn(PlayerList), 1 do
		if CheckID( PlayerList[i]) == true then
			for j = 1 , table.getn(Xmas), 1 do
				CancelBuff(PlayerList[i] , Xmas[j] )  --清除玩家身上所有活動相關BUFF
			--	say( PlayerList[i] , "CancelBuff")
			end
		end	
	end
end



		

function Lua_na_11xmas_del() --暴風雪人死亡後執行劇情，刪除聖焰、安全區魔法陣、乾操的木柴堆、燃燒的木柴堆
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 120081 ,120083 , 120084 , 120089 , 106539 }  --聖焰、乾操的木柴堆、燃燒的木柴堆、暖冬活動物件、暴風雪人

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						Delobj( ID) --刪除乾燥及燃燒的木柴堆
					end
				end
			end
		end
	end
--	Sleep(600)   --一分鐘跑一次
end


function Lua_na_11xmas_delDoor()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC ={ 120087, 120085 }  --刪除阻擋牆、塔蘭西亞

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						Delobj( ID) --阻擋牆
					end
				end
			end
		end
	end
end




--------------------------------------------------------------------------------------------------------------------
function Lua_na_2011xmas_delrange() --刪除魔法陣

	local Modelnpc = { 120082 }

	for i = 1 , table.getn(Modelnpc) , 1 do
		Lua_Hao_NPCofAll_Clear( Modelnpc[i] , 300 )
	end
end



function Lua_na_11xmas_ResetAll()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC ={ 120081 ,120082 ,120083 , 120084  , 120089, 120087, 120085, 106539 }  --刪除聖焰、安全區魔法陣、乾操的木柴堆、燃燒的木柴堆、暖冬活動物件、阻擋牆、塔蘭西亞

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						Delobj( ID) --阻擋牆
					end
				end
			end
		end
	end
end