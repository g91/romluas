-- 2013.04.30 因應6.0.1活動副本調整，修改哥布林礦坑，調整50級以上的級距，變更為50~59，並新增60級的級距。 --
function Lua_Hao_GoblinRange()	-- 隱藏火堆上的起始劇情
-- 2013.09.12 原先由隱藏火堆執行範圍劇情生怪方式，調整為Npc生怪，避免玩家同時間被傳送至範圍劇情觸發範圍內，有機率重複生怪的問題 --
--	SetPlot( OwnerID() , "Range" , "Lua_Hao_GoblinACT_ALLBegin" , 150 )	-- 正常模式
end

function Lua_Hao_GoblinACT_ALLBegin( Npc , Player )
--	local Player = OwnerID()
--	local Npc = TargetID()
--	SetPlot( Npc , "Range" , "" , 0 )
	local Opengate = CheckFlag( Player , 542905 )	-- 是否有賄賂
	if DeadCount == nil then	-- 全域變數，宣告場地上的死亡記數據情
		DeadCount = {}
	end
	BeginPlot( Npc , "Lua_Hao_GoblinACT_Clock" , 0 )	-- 由隱藏火堆觸發的計時劇情
	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )	--取得所在Room
	DeadCount[RoomID] = { 0 , 0 }	-- 第1關卡、第2關卡上的死亡計數劇情

	local TempObj = {}	-- 第1關卡的Npc ID
	local TempObj1 = {}	-- 第2關卡的Npc ID
	local Boxobj = {}	-- 哥布林寶箱ID
	local MonsterObj = {}	-- 第1關卡的Npc
	local MonsterObj1 = {}	-- 第2關卡的Npc
	local Itemobj = {}	-- 建立寶箱的Npc
	local PlayerTeam = LuaFunc_PartyData( Player )           --判斷所有小隊成員資料(排除不同Zone但未排除死亡者)， PlayerTeam[0] 第一筆資料為成員人數、第二筆以後為成員資料。
	local PlayerLV = 0
	for i= 1,PlayerTeam[0] do	-- 取得所有的玩家等級，並從中取得最大值
		local LV = ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV  )  --取得玩家等級
	 	if PlayerLV < LV then
			PlayerLV = LV
		end
	end

	local Step	-- 決定關卡的等級區間
	if PlayerLV <= 29 then
		TempObj = { 102051,102052,102053 }	-- 第1關卡的Npc ID
		TempObj1 = { 102054,102055,102056 }	-- 第2關卡的Npc ID
		Boxobj = {113093}	-- 寶箱ID
		Step = 1
	elseif PlayerLV <= 39 then
		TempObj = { 102071,102072,102073 }
		TempObj1 = { 102074,102075,102076 }
		Boxobj = {113162}
		Step = 2
	elseif PlayerLV <= 49 then
		TempObj = { 102082,102083,102084 }
		TempObj1 = { 102085,102086,102087 }
		Boxobj = {113163}
		Step = 3
	elseif PlayerLV <= 59 then
		TempObj = { 102092,102093,102094 }
		TempObj1 = { 102095,102096,102097 }
		Boxobj = {113164}
		Step = 4
	elseif PlayerLV <= 200 then
		TempObj = { 102092,102093,102094 }	-- 不會掉落任何物品，只有機率掉落寶箱
		TempObj1 = { 102095,102096,102097 }	-- 同上
		Boxobj = {113164}	-- 寶箱的ID
		Step = 5
	end
--寶箱
	local KK = Rand(3)
	for i= 1 , 5 , 1 do 
		Itemobj[i] = CreateObjByFlag( Boxobj[1] , 780369 , i + KK - 1  , 1 ) 	-- 建立怪物在旗標上	--K.J. Aris Fixed 140127
		WriteRoleValue( Itemobj[i] , EM_RoleValue_Register+1 , Step )	-- 將關卡層級寫入寶箱		
		AddToPartition( Itemobj[i] , RoomID )	--使消失的物件出現
		SetPlot( Itemobj[i] , "touch" , "Hao_Zone352_Chest_1" , 50 )
	end
--ACT1
	for i= 1 , 20 , 1 do
		MonsterObj[i] = CreateObjByFlag( TempObj[1] , 780366 , (i*2-1)-Rand(1)  , 1 ) 	-- 建立怪物在旗標上
		SetRandMove( MonsterObj[i] , 45 , 30 , 15 )	--讓角色亂數移動
	end
	for i = 21 , 35 , 1 do 
		MonsterObj[i] = CreateObjByFlag( TempObj[2] , 780366 , (i*2-1)-Rand(1)  , 1 )
		SetRandMove( MonsterObj[i] , 50 , 20 , 25 )
	end
	for i= 36 , 50 , 1 do 
		MonsterObj[i] = CreateObjByFlag( TempObj[3] , 780366 , (i*2-1)-Rand(1) , 1 )
		SetRandMove( MonsterObj[i] , 40 , 15 , 20 )
	end
	for i= 1 , 50 , 1 do
		WriteRoleValue( MonsterObj[i] , EM_RoleValue_LV , PlayerLV )	-- 將ACT1怪物等級變更為與小隊內最高等級為準
		AddToPartition(MonsterObj[i] , RoomID)
		SetPlot( MonsterObj[i] , "dead" , "Lua_Hao_GoblinACT1_Buff" , 0 )	-- 死亡時觸發此劇情，計算怪物的當前死亡次數
	end
--ACT2
	for i= 1 , 12 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[1] , 780367 , (i*2-1)-Rand(1) , 1 )
	end
	for i= 13 , 25 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[1] , 780367 , (i*2-1)-Rand(1) , 1 )
		SetRandMove( MonsterObj1[i] , 45 , 30 , 15 )
	end
	for i = 26 , 38 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[2] , 780367 , (i*2-1)-Rand(1) , 1 ) 	
	end
	for i = 39 , 50 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[2] , 780367 , (i*2-1)-Rand(1) , 1 ) 	
		SetRandMove( MonsterObj1[i] , 50 , 20 , 25 )
	end
	for i= 51 , 65 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[3] , 780367 , (i*2-1)-Rand(1) , 1 ) 	
	end
	for i= 66 , 80 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[3] , 780367 , (i*2-1)-Rand(1) , 1 ) 	
		SetRandMove( MonsterObj1[i] , 40 , 15 , 20 )
	end
	for i= 1 , 80 , 1 do
		WriteRoleValue( MonsterObj1[i] , EM_RoleValue_LV , PlayerLV )	-- 將ACT1怪物等級變更為與小隊內最高等級為準
		AddToPartition( MonsterObj1[i] , RoomID )
		SetPlot( MonsterObj1[i] , "dead" , "Lua_Hao_GoblinACT2_Buff" , 0 )
	end

	local ACT = {}
	ACT[1] = CreateObj( 102175 , 2114 , 282 , 3463 , 77 , 1 )	-- ACT1 門
	ACT[2] = CreateObj( 102175 , 3333 , 85 , 3257 , 266 , 1 )	-- ACT2 門

	for i = 1 , 2 , 1 do
		SetModeEx( ACT[i] , EM_SetModeType_Strikback , false )	--反擊
		SetModeEx( ACT[i] , EM_SetModeType_SearchenemyIgnore , false )	--被搜尋
		SetModeEx( ACT[i] , EM_SetModeType_Obstruct , true )	--阻擋
		SetModeEx( ACT[i] , EM_SetModeType_Mark , false )	--標記
		SetModeEx( ACT[i] , EM_SetModeType_Move , false )	--移動
		SetModeEx( ACT[i] , EM_SetModeType_Searchenemy , false )	--索敵
		SetModeEx( ACT[i] , EM_SetModeType_HideName , false )	--名稱
		SetModeEx( ACT[i] , EM_SetModeType_ShowRoleHead , false )	--頭像框
		SetModeEx( ACT[i] , EM_SetModeType_Fight , false )	--可砍殺攻擊
		SetModeEx( ACT[i] , EM_SetModeType_Drag , true )	--阻力
		SetModeEx( ACT[i] , EM_SetModeType_Show , true )	--顯示
		AddToPartition( ACT[i] , RoomID )	
	end	

	if Opengate ~= true then	-- 當玩家沒有賄賂裁判時，執行此劇情
		BeginPlot( ACT[1] , "Lua_Hao_GoblinACT1_value" , 0 )
		BeginPlot( ACT[2] , "Lua_Hao_GoblinACT2_value", 0 )
	else	-- 當玩家執行賄絡時，執行開門劇情
		for i = 1 , 2 , 1 do
			SetModeEx( ACT[i] , EM_SetModeType_Obstruct , false )--阻擋
			Hide( ACT[i] )
			Show( ACT[i] , RoomID )--RoomID記得先宣告
			PlayMotionEX( ACT[i] , 145 , 146 )--撥放開門動作
		end
	end

	local King = 0
	if Step == 5 then	-- 當小隊內玩家的最高等級 >= 60 時，則哥布林國王會100%出現
		King = CreateObj( 113245 , 3439.5 , 85.0 , 3139.1 , 236.0 , 1 )
		SetModeEx( King , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( King , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( King , EM_SetModeType_Obstruct , false )--阻擋
		SetModeEx( King , EM_SetModeType_Mark , true )--標記
		SetModeEx( King , EM_SetModeType_Move , true )--移動
		SetModeEx( King , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( King , EM_SetModeType_HideName , false )--名稱
		SetModeEx( King , EM_SetModeType_ShowRoleHead , true )--頭像框
		SetModeEx( King , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( King , EM_SetModeType_Drag , false )--阻力
		SetModeEx( King , EM_SetModeType_Show , true )--顯示
		AddToPartition( King , RoomID )
	--	ScriptMessage( Player , -1 , 2 , "[SC_GOBLINARENA_38]" , C_SYSTEM )
	--	ScriptMessage( Player , -1 , 0 , "[SC_GOBLINARENA_38]" , C_SYSTEM ) -- KING's here
	--	SetRandMove( King , 50 , 20 , 25 )
	end

	ACT[3] = CreateObj( 100292 , 3365 , 85 , 2986 , 110 , 1)	-- 火堆
	SetModeEx( ACT[3] , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( ACT[3] , EM_SetModeType_SearchenemyIgnore , false ) --被搜尋
	SetModeEx( ACT[3] , EM_SetModeType_Obstruct , false )--阻擋
	SetModeEx( ACT[3] , EM_SetModeType_Mark , false )--標記
	SetModeEx( ACT[3] , EM_SetModeType_Move , false )--移動
	SetModeEx( ACT[3] , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( ACT[3] , EM_SetModeType_HideName , false )--名稱
	SetModeEx( ACT[3] , EM_SetModeType_ShowRoleHead , false )--頭像框
	SetModeEx( ACT[3] , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( ACT[3] , EM_SetModeType_Drag , false )--阻力
	SetModeEx( ACT[3] , EM_SetModeType_Show , false )--顯示
	AddToPartition( ACT[3]  , RoomID )
	WriteRoleValue( ACT[3] , EM_RoleValue_PID , Step )
	CallPlot( ACT[3]  , "Lua_Hao_GoblinACT3" , ACT[3]  , Step , RoomID , PlayerLV , King )	-- 火堆、關卡層級、Room、副本內玩家的最高等級、代入國王(無國王時為0)
end

function Lua_Hao_GoblinACT_Clock()	-- 由隱藏火堆執行的計時劇情

	local Fire = OwnerID()
	local Time = 1800	-- 遊戲時間
	local RoomID = ReadRoleValue( Fire , EM_RoleValue_RoomID )
	local XX = 15
	local Obj

	for i = 1 , 2000 do
		if XX >= 15 then	-- 每15秒掃描一次區域，並重整玩家的計數器狀態(非重置，方便後續加入的玩家取得正確時間)
			local Count = SetSearchAllPlayer(RoomID)
			if Count ~= 0 then
				for j = 1 , Count , 1 do
					local ID = GetSearchResult()
					ClockClose( ID )
					ClockOpen( ID , EM_ClockCheckValue_5  , Time - i , Time - i , 0  ,"Lua_Clockending"  , "Lua_Clockending" )	--時間以秒算
				end
			end
			XX = 0
		end
		if i < Time then	-- i 越來越大， Time 不變
			XX = XX + 1
			if i == (Time-10) then	-- 秒數剩下10秒時，對此區域的玩家廣播
				local Count = SetSearchAllPlayer(RoomID)
				if Count ~= 0 then
					for i = 1 , Count , 1 do
						local ID = GetSearchResult()
						LuaDan_HitShrew_CheckOK(10,10,0)
						ScriptMessage( ID , ID , 1 , "[SC_GOBLINARENA_16]" , 0 ) -- 競賽限制時間即將到期，10秒後將關閉此區域。
						ScriptMessage( ID , ID , 0 , "[SC_GOBLINARENA_16]" , 0 )
					end
				end
			end
		else	-- 當 i >= 1800 時，將玩家從副本中踢出，並連續執行 i - Time 秒
			local Count = SetSearchAllPlayer(RoomID)
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					ChangeZone( ID , 4 , 0 , -5852.6 , 572.2 , 3326.3 , 149.5 )	--前往銀瀑村
				end	
			end
		end
		Sleep(10)
	end
end

function Lua_Hao_GoblinACT1_Buff()	-- 掛載在ACT1怪物上的死亡觸發劇情。

	local Monster = OwnerID()
	local RoomID = ReadRoleValue( Monster , EM_RoleValue_RoomID )
	DeadCount[RoomID][1] = DeadCount[RoomID][1] + 1

	if DeadCount[RoomID][1] <= 40 then
		ScriptMessage( Monster , -1 , 1 , "[SC_GOBLINACT1DEAD][$SETVAR1="..DeadCount[RoomID][1].."]" , C_SYSTEM ) 
		ScriptMessage( Monster , -1 , 0 , "[SC_GOBLINACT1DEAD][$SETVAR1="..DeadCount[RoomID][1].."]" , C_SYSTEM ) 
	end
	DelObj(Monster)
end

function Lua_Hao_GoblinACT1_value()	-- 掛載在ACT1大門上的生怪劇情
	sleep(20)
	local Door = OwnerID()
	local RoomID = ReadRoleValue( Door , EM_RoleValue_RoomID )	

	while true do	--判斷怪物剩下幾隻
		if DeadCount[RoomID][1] >= 40 then
			SetModeEx( Door , EM_SetModeType_Obstruct , false )	--阻擋關閉使玩家可以通行
			Hide( Door )
			Show( Door , RoomID )--RoomID記得先宣告
			PlayMotionEX( Door , 145 , 146 )--撥放開門動作
			ScriptMessage( Door , -1 , 1 , "[SC_GOBLIN_OPENDOOR1]" , C_SYSTEM )	-- 第二關入口的門已經被打開了，各位哥布林勇士，向前邁進吧！
			ScriptMessage( Door , -1 , 0 , "[SC_GOBLIN_OPENDOOR1]" , C_SYSTEM )
			ScriptMessage( Door , -1 , 2 , "[SC_GOBLINARENA_14]" , C_SYSTEM )	-- 只要打倒60位以上的哥布林，第三關入口的大門就會開啟。
			ScriptMessage( Door , -1 , 0 , "[SC_GOBLINARENA_14]" , C_SYSTEM )
			break
		end
		sleep(10)	
	end
end

function Lua_Hao_GoblinACT2_Buff()	-- 掛載在ACT2怪物上的死亡觸發劇情。

	local Monster = OwnerID()
	local RoomID = ReadRoleValue( Monster , EM_RoleValue_RoomID )
	DeadCount[RoomID][2] = DeadCount[RoomID][2] + 1

	if DeadCount[RoomID][2] <= 60 then
		ScriptMessage( Monster , -1 , 1 , "[SC_GOBLINACT2DEAD][$SETVAR1="..DeadCount[RoomID][2].."]" , C_SYSTEM )
		ScriptMessage( Monster , -1 , 0 , "[SC_GOBLINACT2DEAD][$SETVAR1="..DeadCount[RoomID][2].."]" , C_SYSTEM )
	end
	
	local TempObj = {102054,102055,102056,102074,102075,102076,102085,102086,102087,102095,102096,102097}
	local Count = SetSearchAllNPC(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			for j = 1, table.getn(TempObj) do
				if ReadRoleValue( ID ,EM_RoleValue_OrgID ) == TempObj[j] and ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 then
					AddBuff( ID , 503610 , 0 , -1 )
					castspell( ID , ID , 493376 )
				end
			end
		end
	end
	DelObj(Monster)
end

function Lua_Hao_GoblinACT2_value()	-- 掛載在ACT2大門上的生怪劇情
--	sleep(20)
	local Door = OwnerID()
	local RoomID = ReadRoleValue( Door , EM_RoleValue_RoomID )

	while true do	--判斷怪物剩下幾隻
		if DeadCount[RoomID][2] >= 60 then
		--	DebugMsg( 0 , RoomID , "Dead = "..DeadCount[RoomID][2] )
			SetModeEx( Door , EM_SetModeType_Obstruct , false )--阻擋關閉使玩家可以通行
			Hide( Door )
			Show( Door , RoomID )
			PlayMotionEX( Door , 145 , 146 )--撥放開門動作
			ScriptMessage( Door , -1 , 1 , "[SC_GOBLIN_OPENDOOR2]" , C_SYSTEM ) -- 第三關入口的門已經被打開了，各位哥布林勇士，繼續向前邁進吧！
			ScriptMessage( Door , -1 , 0 , "[SC_GOBLIN_OPENDOOR2]" , C_SYSTEM )
			ScriptMessage( Door , -1 , 2 , "[SC_GOBLINARENA_15]" , C_SYSTEM ) -- 最後的挑戰，只要打倒全部的元素，就能爭取到最高的榮耀！
			ScriptMessage( Door , -1 , 0 , "[SC_GOBLINARENA_15]" , C_SYSTEM )
			break
		end
		sleep(10)	
	end
end

function Lua_Hao_GoblinACT3( Fire , Step , RoomID , PlayerLV , King )	-- 掛載在ACT3大門旁的隱藏火堆執行的劇情
	-- 火堆、關卡層級、Room、副本內玩家的最高等級、國王(無國王時為0)
	-- 2012.12.27 新增 DesignLog 
	local List = {}
	List[1] = 11265111	-- 清掉風屬性的元素怪物後，於風屬性鎔爐出現寶箱時，記錄下的玩家清單
	List[2] = 11265112	-- 清掉火屬性的元素怪物後，於火屬性鎔爐出現寶箱時，記錄下的玩家清單
	List[3] = 11265113	-- 清掉水屬性的元素怪物後，於水屬性鎔爐出現寶箱時，記錄下的玩家清單
	List[4] = 11265114	-- 清掉土屬性的元素怪物後，於土屬性鎔爐出現寶箱時，記錄下的玩家清單	
	--
	local BoxLv = {}	-- 第3關卡的寶箱Lv
	BoxLv[RoomID] = 0
	local BoxBorn = {0,0,0,0}	-- 記錄高級寶箱產生的數量
	local GoodBoxNM = math.random(4)	-- 隨機挑選一個高級寶箱作為完美寶箱
	
	local BossBorn = 0	-- 記錄Boss產生的數量

	local TempObj = {} --第3關卡的Npc ID
	TempObj[1] = { 102057,102058,102059,102060 }	-- Lv   1 ~ 29
	TempObj[2] = { 102077,102078,102079,102080 }	-- Lv 30 ~ 39
	TempObj[3] = { 102088,102089,102090,102091 }	-- Lv 40 ~ 49
	TempObj[4] = { 102098,102099,102100,102101 }	-- Lv 50 ~ 59
	TempObj[5] = { 102098,102099,102100,102101 }	-- 風、火、水、土元素怪	 Lv 60 ~ 200

	local BossObj = {}	-- 第3關卡的BossID
	BossObj[1] = { 102062 }	-- Lv   1 ~ 29 土元素王
	BossObj[2] = { 102081 }	-- Lv 30 ~ 39 水元素王
	BossObj[3] = { 102061 }	-- Lv 40 ~ 49 火元素王
	BossObj[4] = { 102102 }	-- Lv 50 ~ 59 風元素王
	BossObj[5] = { 102062 , 102081 , 102061 , 102102 }	-- Lv 60 ~ 200 風、火、水、土元素王隨機出一
	BossObj[5] = { BossObj[5][math.random(#BossObj[5])] }	-- 決定60級以上的關卡是什麼元素型的Boss

	local MonsterObj = {}	-- 第3關卡的Npc
	
	for i = 1 , 40 , 1 do	-- 產生的風、火、水、土元素怪
		MonsterObj[i] = CreateObjByFlag( TempObj[Step][math.ceil( i/10 )] , 780368 , (i*2-1)-Rand(1)  , 1 )
		WriteRoleValue( MonsterObj[i] , EM_RoleValue_LV , PlayerLV )	-- 將ACT3怪物等級變更為與小隊內最高等級為準
		SetPlot( MonsterObj[i] , "dead" , "Hao_GoblinACT3_Dead" , 0 )	-- 死亡時觸發此劇情，讓玩家無法拾取屍體
		AddToPartition( MonsterObj[i] , RoomID )
		SetRandMove( MonsterObj[i] , 50 , 20 , 25 )
	end
	Sleep(20)
--	local OldLive = Lua_Hao_GoblinACT3_SearchLive( TempObj[Step][1] , TempObj[Step][2] , TempObj[Step][3] , TempObj[Step][4] )
	local OldLive = { 10 , 10 , 10 , 10 }	-- 初次產生元素怪時，各屬性元素怪的數量
	Sleep(20)
	while true do
		local NewLive = Lua_Hao_GoblinACT3_SearchLive( TempObj[Step][1] , TempObj[Step][2] , TempObj[Step][3] , TempObj[Step][4] )
		local Elemental = 0
		local ElementalMsg
		--判斷死4隻生一隻
		for i = 1 , 4 do
			if NewLive[i] > OldLive[i] then	-- 更新元素怪數量的基數
				OldLive[i] = NewLive[i]
			end
		end
		if (OldLive[1] - NewLive[1]) >= 4 then
			Elemental = CreateObjByFlag( TempObj[Step][2] , 780368 , Rand(19)+20  , 1 )
			ElementalMsg = "[SC_GOBLINARENA_17]" -- 火元素因為風元素的衰弱而不安了起來。
		end
		if (OldLive[2] - NewLive[2]) >= 4 then
			Elemental = CreateObjByFlag( TempObj[Step][3] , 780368 , Rand(19)+40  , 1 )
			ElementalMsg = "[SC_GOBLINARENA_18]" -- 土元素因為火元素的衰弱而不安了起來。
		end
		if (OldLive[3] - NewLive[3]) >= 4 then
			Elemental = CreateObjByFlag( TempObj[Step][4] , 780368 , Rand(19)+60  , 1 )
			ElementalMsg = "[SC_GOBLINARENA_19]" -- 水元素因為土元素的衰弱而不安了起來。
		end
 		if (OldLive[4] - NewLive[4]) >= 4 then
			Elemental = CreateObjByFlag( TempObj[Step][1] , 780368 , Rand(19) , 1 )
			ElementalMsg = "[SC_GOBLINARENA_20]" -- 風元素因為水元素的衰弱而不安了起來。
		end
		if Elemental ~= 0 then	-- 當有元素怪物產生時，則執行此 if 下的劇情
			WriteRoleValue( Elemental , EM_RoleValue_LV , PlayerLV )	-- 將ACT3怪物等級變更為與小隊內最高等級為準
		--	ScriptMessage( Fire , -1 , 2 , ElementalMsg , C_SYSTEM )
			ScriptMessage( Fire , -1 , 0 , ElementalMsg , C_SYSTEM )
			SetPlot( Elemental , "dead" , "Hao_GoblinACT3_Dead" , 0 )	-- 死亡時觸發此劇情，讓玩家無法拾取屍體
			AddToPartition( Elemental , RoomID )
			SetRandMove( Elemental , 50 , 20  , 25 )
			OldLive = NewLive
		end
--		DebugMsg( 0, RoomID ,"OldLive[1] = "..OldLive[1].."OldLive[2] = "..OldLive[2].."OldLive[3] = "..OldLive[3].."OldLive[4] = "..OldLive[4])
		--判斷相差6隻生王
		if BossBorn == 0 then
			local Monster = 0		
			if NewLive[1] - NewLive[2] >= 6 then	-- 火 - 土
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+20 , 1 )
			elseif NewLive[2] - NewLive[1] >=6 then	-- 土 - 火
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19) , 1 )
			end
			if NewLive[2] - NewLive[3] >=6 then	-- 土 - 水
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+40 , 1 )
			elseif NewLive[3] - NewLive[2] >=6 then	-- 水 - 土
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+20 , 1 )
			end
			if NewLive[3] - NewLive[4] >=6 then	-- 水 - 風
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+60 , 1 )
			elseif NewLive[4] - NewLive[3] >=6 then	-- 風 - 水
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+40 , 1 )
			end
			if NewLive[4] - NewLive[1] >=6 then	-- 風 - 火
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)  , 1 )
			elseif NewLive[1] - NewLive[4] >=6 then	-- 火 - 風
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+60  , 1 )
			end
			if Monster ~= 0 then
				local Player = Lua_Hao_Goblin_SearchPlayer(RoomID)	-- 先取得玩家資訊			
				WriteRoleValue( Monster , EM_RoleValue_LV , PlayerLV )	-- 將Boss等級調整為與小隊內玩家的最高等級相同
				WriteRoleValue( Monster , EM_RoleValue_Register+1 , Step )	-- 將關卡層級寫入Boss的Reg+1中
				WriteRoleValue( Monster , EM_RoleValue_Register+2 , 1 )	-- 判斷用，方便系統記錄執行死亡劇情時，如果讀取到 Reg+2=1時為Boss
				SetPlot( Monster , "dead" , "Hao_GoblinACT3_Dead" , 0 )	-- 死亡時觸發此劇情，讓玩家無法拾取屍體
				AddToPartition( Monster , RoomID )
				SetRandMove( Monster , 50 , 20 , 25 )
				SetAttack( Monster, Player[1] )
				ScriptMessage( Fire , -1 , 2 , "[SC_GOBLINARENA_21]" , C_SYSTEM )	-- 能量急遽改變令元素群感到不安，這股不安感凝聚出了元素的庇護者。
				ScriptMessage( Fire , -1 , 0 , "[SC_GOBLINARENA_21]" , C_SYSTEM )
				BossBorn = 1
			end
		end
		for i = 1 , 4 do	-- 置入寶箱
			if NewLive[i] == 0 and BoxBorn[i] == 0 then
				local Box = CreateObjByFlag( 113137 , 780370 , i-1  , 1 )
				local PlayerName = {}	-- 2013.03.20 新增
				local ChestMsg = ""
				
				local Msg = {}
				Msg[1] = { "[SC_GOBLINARENA_25]" , "[SC_GOBLINARENA_43]" }	-- 隱藏在風之鎔爐門口的寶箱出現了。、獲得開啟風鎔爐寶箱資格的挑戰者是：
				Msg[2] = { "[SC_GOBLINARENA_26]" , "[SC_GOBLINARENA_44]" }	-- 隱藏在火之鎔爐門口的寶箱出現了。、獲得開啟火鎔爐寶箱資格的挑戰者是：
				Msg[3] = { "[SC_GOBLINARENA_27]" , "[SC_GOBLINARENA_46]" }	-- 隱藏在土之鎔爐門口的寶箱出現了。、獲得開啟土鎔爐寶箱資格的挑戰者是：
				Msg[4] = { "[SC_GOBLINARENA_28]" , "[SC_GOBLINARENA_45]" }	-- 隱藏在水之鎔爐門口的寶箱出現了。、獲得開啟水鎔爐寶箱資格的挑戰者是：
			
				local Keyitem = {}
				Keyitem[1] = { 542875 , 543557 }
				Keyitem[2] = { 542876 , 543558 }
				Keyitem[3] = { 542877 , 543559 }
				Keyitem[4] = { 542878 , 543560 }

				WriteRoleValue( Box , EM_RoleValue_PID , i )	-- 將元素區寫入寶箱中
				WriteRoleValue( Box , EM_RoleValue_Register+1 , Step )		-- 將寶箱等級寫入寶箱中
				WriteRoleValue( Box , EM_RoleValue_Register+4 , PlayerLV )	-- 將小隊玩家最高等級寫入寶箱中
				AddToPartition( Box , RoomID )
				ScriptMessage( Fire , -1 , 2 , Msg[i][1] , C_SYSTEM )
				ScriptMessage( Fire , -1 , 0 , Msg[i][1] , C_SYSTEM )
				
				local Count = SetSearchAllPlayer(RoomID)
				if Count ~= 0 then
					ChestMsg = Msg[i][2]
					for j = 1 , Count , 1 do
						local ID = GetSearchResult()
						PlayerName[j] = GetName(ID)
						if CheckFlag( ID , 542743 ) == true then
							if j == Count then	-- 句末時不加、
								ChestMsg = ChestMsg..PlayerName[j]
							else	-- 未斷句時加入、
								ChestMsg = ChestMsg..PlayerName[j].."[SC_SEPARATEMARK]"
							end
							SetFlag( ID , Keyitem[i][1] , 1 )
							SetFlag( ID , Keyitem[i][2] , 1 )	-- 12/03 新增旗標 給予玩家 大師安心修理鎚&3點魔幻寶盒能量
							DesignLog( ID , List[i] , "A treasure chest appears in the mouth of the wind furnace." )				
						end
					end
					ScriptMessage( Fire , -1 , 0 , ChestMsg , C_SYSTEM )
				end				
				if i == GoodBoxNM then	-- 完美寶箱
					SetPlot(Box,"touch","Lua_Hao_GoblinboxACT3_02",50)
				else	-- 高級寶箱
					SetPlot(Box,"touch","Lua_Hao_GoblinboxACT3_01",50)
				end
				BoxBorn[i] = 1
			end
		end
		local AllNPCdead = Lua_Hao_Goblin_Openthegate( TempObj[Step][1] , TempObj[Step][2] , TempObj[Step][3] , TempObj[Step][4] , BossObj[Step] )
		local NPCCount = 0
		for i = 1, 5 do 
			if AllNPCdead[i] == 0 then 
		 		NPCCount = NPCCount + 1
			end
		end 

		-------------------------------------------------------140127 K.J. Aris 確保寶箱都已給完才中斷迴圈   
		local _boxesAllGave = true;
		for _index , _value in pairs( BoxBorn ) do
			if ( _value == 0 ) then
				_boxesAllGave = false;--若有寶箱還沒給   則使迴圈繼續
				break;
			end
		end
		----------------------------------------END------------140127 K.J. Aris 確保寶箱都已給完才中斷迴圈   
		
		--if NPCCount  == 5 then	-- 當元素怪與Boss均被清除後...
		if ( NPCCount  == 5 ) and ( _boxesAllGave == true ) then--140127 K.J. Aris 確保寶箱都已給完才中斷迴圈   
		-- 2011.08.19 新增全破1次稱號 --
			local Count = SetSearchAllPlayer(RoomID)
			if Count ~= 0 then
				for j = 1 , Count , 1 do
					local ID = GetSearchResult()
					-- 2011.08.19 新增全破1次稱號 --
					if CountBodyItem( ID , 530085 ) < 1 then
						GiveBodyItem( ID , 530085 , 1 )
					end
				end
			end
			if King ~= 0 then	-- 在哥布林首領出現的情況下，通知哥布林首領該關卡已被突破
				WriteRoleValue( King , EM_RoleValue_Register+1 , 1 )
			end
			ScriptMessage( Fire , -1 , 2 , "[SC_GOBLINARENA_29]" , C_SYSTEM ) -- 出口的傳送陣已經開啟。
			ScriptMessage( Fire , -1 , 0 , "[SC_GOBLINARENA_29]" , C_SYSTEM )
			local Leave_Gate = CreateObjByFlag( 113166 , 780368 , 80 , 1 ) 
			SetModeEx( Leave_Gate, EM_SetModeType_Strikback, false )--反擊
			SetModeEx( Leave_Gate, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
			SetModeEx( Leave_Gate, EM_SetModeType_Obstruct, false )--阻擋
			SetModeEx( Leave_Gate, EM_SetModeType_Mark, false )--標記
			SetModeEx( Leave_Gate, EM_SetModeType_Move, false )--移動
			SetModeEx( Leave_Gate, EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Leave_Gate, EM_SetModeType_HideName, false )--名稱
			SetModeEx( Leave_Gate, EM_SetModeType_ShowRoleHead, false )--頭像框
			SetModeEx( Leave_Gate, EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( Leave_Gate, EM_SetModeType_Drag , false )--阻力
			SetModeEx( Leave_Gate, EM_SetModeType_Show, true)--顯示
			AddToPartition( Leave_Gate , RoomID )

			break;--若所有寶箱都已給定  則中斷迴圈
		end
		Sleep(10)
	end
end

function Hao_GoblinACT3_Dead()	-- 掛載在ACT3怪物上的死亡觸發劇情。

	local Monster = OwnerID()
	local RoomID = ReadRoleValue( Monster , EM_RoleValue_RoomID )	-- 讀取Room
--	local Sex = GameObjInfo_int( Monster , "Sex" )	-- 讀取資料庫中物件的性別，此值死亡時，無法被處理
	local Level = ReadRoleValue( Monster , EM_RoleValue_Register+1 )	-- 讀取Boss紀錄的關卡層級
	local Boss = ReadRoleValue( Monster , EM_RoleValue_Register+2 )	-- 當Reg+2=1時，則為Boss

	if Boss == 1 then
		local Chest = CreateObjByObj( 122390 , Monster )	-- 寶箱	--113137
		SetModeEx( Chest , EM_SetModeType_Show , true)--顯示
		SetModeEx( Chest , EM_SetModeType_HideName , false )--名稱
		SetModeEx( Chest , EM_SetModeType_ShowRoleHead , false )--頭像框
		WriteRoleValue( Chest , EM_RoleValue_Register+1 , Level )	-- 將關卡層級寫入寶箱
		WriteRoleValue( Chest , EM_RoleValue_IsWalk , 1 )--用走路的
		ScriptMessage( Chest , -1 , 2 , "[SC_GOBLINARENA_47]" , C_SYSTEM ) -- 寶箱怪出現了！快點擊它取得更多的獎勵。
		ScriptMessage( Chest , -1 , 0 , "[SC_GOBLINARENA_47]" , C_SYSTEM )
		ReCalculate( Chest )	
		AddToPartition( Chest , RoomID )
	--	SetRandMove( Chest , 100 , 10 , 75 )
		CallPlot( Chest , "Hao_GoblinACT3_Boss_Chest_RandMove" , Chest )
		SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 10 )		
	end
	DelObj(Monster)
end

function Hao_GoblinACT3_Boss_Chest_RandMove(Chest)	-- 亂數移動

	local X , Y , Z , Dir =DW_Location( Chest )
	while true do
	     	local X , Y , Z , Dir = DW_NewLocation( DW_Rand(360) , 50 , X , Y , Z , Dir )
	     	local Sec = Move( Chest , X , Y , Z )
 	    	Sleep( Sec+1 )
	end
end

function Hao_GoblinACT3_Boss_Chest()	-- Boss 死亡後，跑出寶箱怪的劇情

	local Player = OwnerID()	-- 玩家
	local Chest = TargetID()	-- 寶箱
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )

	SetPlot( Chest , "touch" , "" , 0 )
		
	if CheckFlag( Player , 542743 ) == false then	-- 如果該玩家沒報名，又有開啟寶箱的紀錄，則警告並回報為作弊。
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --你沒有權限開啟這個寶箱。
		SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 15 )		
		DesignLog( Player , 113137 , "Cheater" )	-- 哥布林寶箱
		return
	end
	
	if ReadRoleValue( Chest , EM_RoleValue_PID ) == 1 then				-- 防止複數玩家於同時開啟寶箱，都能得到的問題。
		ScriptMessage( Player , Player , 1 ,"[SYS_AUCTION_WAIT_NEXT]" , 0 )		-- 忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( Chest , EM_RoleValue_PID, 1 )
	
	if BeginCastBarEvent( Player , Chest , "[SO_110195_1]" , 5 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 , "Hao_GoblinACT3_Boss_Chest_1" ) ~= 1 then
		ScriptMessage( Player , Player , 0 , "[SAY_NPC_BUSY]" , 0 )	--目標正在忙碌中
		return
	end	
end

function Hao_GoblinACT3_Boss_Chest_1( Player , CheckStatus )	-- 活動副本 - 哥布林礦坑Boss寶箱怪  Player = 玩家、CheckStatus = 執行結果(大於0是成功，小於0是失敗)

	local Chest = TargetID()	-- 寶箱
	local Level = ReadRoleValue( Chest , EM_RoleValue_Register+1 )	-- 讀取關卡層級，以決定寶箱等級

	local Treasure = {}	-- 寶箱內容物 6.0.1 後適用
	Treasure[1] = {			-- Lv 1~39 寶箱內容
			520022 ,	-- 力氣 II
			520042 ,	-- 耐力 II
			520062 ,	-- 聰慧 II
			520082 ,	-- 精力 II
			520102 ,	-- 靈活 II
			520122 ,	-- 體力 II
			520142 ,	-- 魔力 II
			520162 ,	-- 傷害 II
			520182 ,	-- 魔攻 II
			520202 ,	-- 防衛 II
			520222 ,	-- 魔防 II
					}
		
	Treasure[2] = {			--Lv 40~59 寶箱內容
			520023 ,	-- 力氣 III	
			520043 ,	-- 耐力 III
			520063 ,	-- 聰慧 III
			520083 ,	-- 精力 III
			520103 ,	-- 靈活 III
			520123 ,	-- 體力 III
			520143 ,	-- 魔力 III
			520163 ,	-- 傷害 III
			520183 ,	-- 魔攻 III
			520203 ,	-- 防衛 III
			520223 ,	-- 魔防 III
					}
	
	Treasure[3] = {			-- Lv 60+ 寶箱內容
			520024 ,	-- 力氣 IV	
			520044 ,	-- 耐力 IV
			520064 ,	-- 聰慧 IV
			520084 ,	-- 精力 IV
			520104 ,	-- 靈活 IV
			520124 ,	-- 體力 IV
			520144 ,	-- 魔力 IV
			520164 ,	-- 傷害 IV
			520184 ,	-- 魔攻 IV
			520204 ,	-- 防衛 IV
			520224 ,	-- 魔防 IV
					}	

	if CheckStatus ~= 0 then	-- 如果有施法條時
		if CheckStatus > 0 then	-- 施法成功
			if EmptyPacketCount(Player) >= 1 and QueuePacketCount(Player) == 0 then --檢查背包欄位
				local Pass = ReadRoleValue( Chest , EM_RoleValue_Register+2 )			
				local Select = {}
				Select["X"] = math.ceil(Level/2)	-- 決定 Treasure[X] 中的 X 
				Select["Y"] = math.random(#Treasure[Select["X"]])	-- 決定 Treasure[X][Y] 中的 Y
				WriteRoleValue( Chest , EM_RoleValue_PID, 0 )	-- 解除忙碌狀態
				GiveBodyItem( Player , Treasure[Select["X"]][Select["Y"]] , 1 )				
				WriteRoleValue( Chest , EM_RoleValue_Register+2 , Pass+1 )	-- 將取出符文數量+1				
				if Pass+1 >= 6 then	-- 當取出符文數量 >= 5 時，則刪除掉自己
					DelObj( Chest )
				else
					SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 15 )
				end				
			else
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
				WriteRoleValue( Chest , EM_RoleValue_PID , 0 )
				SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 15 )
			end
			EndCastBar( Player , CheckStatus )
		else	-- 施法失敗
			WriteRoleValue( Chest , EM_RoleValue_PID , 0 )
			SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 15 )
			EndCastBar( Player , CheckStatus )
		end
	end
end

function Lua_Hao_GoblinACT3_SearchLive(TempObj1,TempObj2,TempObj3,TempObj4)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --取得所在room
	local Live = {0,0,0,0}
--	Say(OwnerID(),"TempObj1 = "..TempObj1.."TempObj2 = "..TempObj2.."TempObj3 = "..TempObj3.."TempObj4 = "..TempObj4)
	local Obj
	local Count = SetSearchAllNPC(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:RoomID() == RoomID and Obj:IsNPC() == true and ReadRoleValue( ID , EM_RoleValue_IsDead) == 0 then
				local FlagOrgID = Obj:OrgID()
				if (FlagOrgID == TempObj1) then
					Live[1] = Live[1] + 1
				end
				if (FlagOrgID == TempObj2) then
					Live[2] = Live[2] + 1
				end
				if (FlagOrgID == TempObj3) then
					Live[3] = Live[3] + 1
				end
				if (FlagOrgID == TempObj4) then
					Live[4] = Live[4] + 1
				end
			end
		end	
	end
--	DebugMsg( 0, RoomID ,"======2")
	return Live
end

function Lua_Hao_Goblin_SearchPlayer(RoomID)
	local Player = {}	
	local NM = 1
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				Player[NM] = ID
				NM = NM + 1
			end
		end	
	end
	if Player[1] == nil then
		Player[1] = -1
	end
	return Player
end

function Lua_Hao_Goblin_113166_0()	-- 破關後出現的傳送陣所執行的劇情

	SetPlot(OwnerID() ,"range","Lua_Hao_Goblin_113166_1",100)
end

function Lua_Hao_Goblin_113166_1()

	if CheckBuff( OwnerID() , 501570) == false then 	--增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1)	--然後給予BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GOBLINARENA_32]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" )
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	--資料送出有問題
			return
		end
		
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					ChangeZone( OwnerID() , 4, 0, -5852.6, 572.2, 3326.3, 149.5 ) --前往銀瀑村
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end		
end

function Lua_Hao_Goblin_Openthegate(TempObj1, TempObj2, TempObj3, TempObj4, BossObj1)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --取得所在room
	local Live = {0,0,0,0,0}

	local Obj
	local Count = SetSearchRangeInfo( OwnerID() , 3000 )
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )	
		if Obj:RoomID() == RoomID and Obj:IsNPC() == true and ReadRoleValue( ID , EM_RoleValue_IsDead) == 0 then
			local FlagOrgID = Obj:OrgID()
			if (FlagOrgID == TempObj1) then
				Live[1] = Live[1] + 1
			end
			if (FlagOrgID == TempObj2) then
				Live[2] = Live[2] + 1
			end
			if (FlagOrgID == TempObj3) then
				Live[3] = Live[3] + 1
			end
			if (FlagOrgID == TempObj4) then
				Live[4] = Live[4] + 1
			end
			if (FlagOrgID == BossObj1) then
				Live[5] = Live[5] + 1
			end
		end
	end
--	DebugMsg( 0, RoomID ,"======2")
	return Live
end

function Lua_Hao_Goblin_Reset_Instance()	-- 重置哥布林副本

	local Player = OwnerID()
	local Ticket = {}
	Ticket[1] = 542743	--哥布林競速計時開始
	Ticket[2] = 542742	--哥布林元素區寶箱01	
	Ticket[3] = 542869	--哥布林元素區寶箱02
	Ticket[4] = 542870	--哥布林元素區寶箱03
	Ticket[5] = 542871	--哥布林元素區寶箱04
	Ticket[6] = 542875	--哥布林風區寶箱Key
	Ticket[7] = 542876	--哥布林火區寶箱Key
	Ticket[8] = 542877	--哥布林水區寶箱Key
	Ticket[9] = 542878	--哥布林土區寶箱Key
	Ticket[10] = 542904	--哥布林首領秘寶已領取
	Ticket[11] = 542905	--已用傳送者賄賂管理員
	Ticket[12] = 543557	--哥布林破關贈送01
	Ticket[13] = 543558	--哥布林破關贈送02
	Ticket[14] = 543559	--哥布林破關贈送03
	Ticket[15] = 543560	--哥布林破關贈送04
	Ticket[16] = 542689	--挑戰資格	
	
	for i = 1 , table.getn(Ticket) , 1 do
		SetFlag( Player , Ticket[i] , 0 )
	end
end

function Lua_Hao_GoblinACT3_ChestTouch()
--	SetPlot(OwnerID(),"touch","Lua_Hao_GoblinACT3_ChangeChest",30)
end