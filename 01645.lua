-- 2013.05.28 阿浩：重寫或調整以下所有 function，調整城門寫法。
function PlayOpenDoor_Main1() --城門初始劇情

	local Door = OwnerID()
	local Zone = ReadRoleValue( Door , EM_RoleValue_ZoneID )	-- 讀取Zone ID
	local RoomID = ReadRoleValue( Door , EM_RoleValue_RoomID)
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- 讀取伺服器設定的等級上限

	if Zone == 402 or ( Zone >= 930 and Zone <= 957 ) then
		WriteRoleValue( Door, EM_RoleValue_LV , ServerMaxLv )--等級會隨伺服器等級開放的上限而成長
		SetModeEx( Door , EM_SetModeType_Show , true )	--顯示
		SetModeEx( Door , EM_SetModeType_Mark , true )	--標記
		SetModeEx( Door , EM_SetModeType_HideName , false )	--名稱
		SetModeEx( Door , EM_SetModeType_ShowRoleHead , true )	--頭像框
		SetModeEx( Door , EM_SetModeType_Fight , true )	--可砍殺攻擊
		SetModeEx( Door , EM_SetModeType_Move , false )	--移動
		SetModeEx( Door , EM_SetModeType_Obstruct , true )	--阻擋
		SetModeEx( Door , EM_SetModeType_Strikback , false )	--反擊
		SetModeEx( Door , EM_SetModeType_SearchenemyIgnore , false )	--忽略搜尋
		SetModeEx( Door , EM_SetModeType_DisableRotate , true )	--轉向
		SetModeEx( Door , EM_SetModeType_Searchenemy , false )	--索敵
		SetModeEx( Door , EM_SetModeType_NotShowHPMP , true )	--不顯示血條
		SetModeEx( Door , EM_SetModeType_Revive , false )	--重生

		AddBuff( Door , 505921 , 98 , -1 )	-- 被玩家攻擊時，受到的傷害量減少 99%
		AddBuff( Door , 505516 , 99 , -1 )	-- 被NPC攻擊時，受到的傷害量增加 100%
		AddBuff( Door , 506164 , 0 , -1 )	-- 受到的治療效果下降 95%
		AddBuff( Door , 502707 , 0 , -1 )	-- 不回血

		WriteRoleValue( Door , EM_RoleValue_Register+1 , 38 )	-- 記錄為大型建築物，讓移形換影無法作用於此目標
		SetPlot( Door , "range" , "Hao_GuildWar_Door_Switch_Car" , 90 )	-- 載具接近城門後的範圍劇情
		SetPlot( Door , "dead" , "Hao_GuildWar_Door_Death_Plot" , 0 )	--大門的死亡劇情
	end
	Setplot( Door , "touch" , "Hao_GuildWar_Door_Switch_Player" , 20 )	-- 玩家觸碰城門後的觸碰劇情
	
	-- 2013.07.15 YoYo：新增寵物阻擋線相關功能，防止寵物穿牆打人。
	local LeftX , LeftZ , RightX , RightZ = Hao_GuildWar_Door_Biock( Door , 25 , 100 , 100 )	--計算城門後方25阻擋線兩端點的X、Z座標

	local BlockLineFlag = 780234	--寵物阻擋線專用的旗標
	local DoorFlagSite = { 21 , 22 , 23 , 31 , 32 , 33 }	--判斷城門位置的旗標編號
	local BlockLineID = { 107 , 108 , 109 , 207 , 208 , 209 }	--阻擋線的編號
	--21：藍隊 - 右門(布魯克)
	--22：藍隊 - 左門(愛薩奇)
	--23：藍隊 - 正門
	--31：紅隊 - 右門(貝里尼)
	--32：紅隊 - 左門(阿納德)
	--33：紅隊 - 正門
	for I = 1 ,  #DoorFlagSite do
		if KS_GetFlagDistance( Door , BlockLineFlag , DoorFlagSite[ I ] ) < 200 then	--當門與判斷距離<200，則生成阻擋線
			AddLineBlock( RoomID , BlockLineID[ I ] , LeftX , LeftZ , RightX , RightZ )	-- 建立城門的阻擋線
		end
	end	
end

function Hao_GuildWar_Door_Switch_Player()	-- 玩家觸碰城門後的觸碰劇情

	local Player = OwnerID()
	local Door = TargetID()
	local Dis = 120
	AdjustFaceDir( Player , Door , 0 ) --面向
	CallPlot( Player , "Hao_GuildWar_Door_Switch_1" , Player , Door , Dis )
end

function Hao_GuildWar_Door_Switch_Car()	-- 載具接近城門後的範圍劇情

	local Player = OwnerID()
	local Door = TargetID()
	local Car = ReadRoleValue( Player , EM_RoleValue_PID )	-- 讀取載具編號
	local Driver = CheckFlag( Player , 543769 )	-- 檢查是否正在駕駛載具中
	
	if Car ~= 0 and Driver == true then	-- 載具存在且有駕駛員時
		local Dis = 150
		AdjustFaceDir( Car , Door , 0 ) --面向
		AdjustFaceDir( Player , Door , 0 ) --面向
		CallPlot( Player , "Hao_GuildWar_Door_Switch_1" , Player , Door , Dis )
	else
		return
	end
end

function Hao_GuildWar_Door_Switch_1( Player , Door , Dis )	-- 公會城共用開關門劇情(Zone 401、Zone 402)，玩家、門、距離

	local PlayerGuildID = GetRoleCampID( Player )	-- 讀取玩家陣營
	local BuildingGuildID = GetRoleCampID( Door )	-- 讀取大門陣營
	local Zone = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Zone == 402 or ( Zone >= 930 and Zone <= 957 ) then
		if ( PlayerGuildID == BuildingGuildID ) or ReadRoleValue( Player , EM_RoleValue_VOC ) == 0 then	-- 當玩家陣營與大門陣營符合或玩家職業為 gm 時
			local Pos = {}
			Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Door) -- 取得城門所在座標
			Pos["PlayerDir"] = ReadRoleValue( Player , EM_RoleValue_Dir )	--玩家
			local Cal = (math.pi/180)*(Pos["Dir"])	-- 弧度
			local Ca = Pos["PlayerDir"] - Pos["Dir"]	-- 玩家與大門相差角度
			if Ca < 0 then
				Ca = Ca + 360
			end
			if Ca < 90 or Ca > 270 then
				SetPos( Player , Pos["X"]+Dis*math.cos(Cal) , Pos["Y"]+5 , Pos["Z"]-Dis*math.sin(Cal) , Pos["Dir"] )
			else
				SetPos( Player , Pos["X"]-Dis*math.cos(Cal) , Pos["Y"]+5 , Pos["Z"]+Dis*math.sin(Cal) , Pos["Dir"]+180 )
			end
			AddBuff( Player , 503993 , 0 , 1 )	--傳送特效
		end
	else
		if ReadRoleValue( Door , EM_RoleVAlue_PID ) == 0 then	-- 非公會城戰執行開門
			CallPlot( Door , "Hao_GuildWar_Door_Switch_2" , Door , "Open" , 50 )
		elseif ReadRoleValue( Door , EM_RoleVAlue_PID ) == 1 then	-- 非公會城戰執行關門
			CallPlot( Door , "Hao_GuildWar_Door_Switch_2" , Door , "Close" , 50 )
		else
			DebugMsg( Player , Room , "Repeat" )
		end
	end
end

function Hao_GuildWar_Door_Switch_2( Door , Status , Time )	-- 門、狀態、Sleep時間

	if Status == "Open" then	-- 播放開門動作
		PlayMotionEX( Door , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
		WriteRoleValue( Door , EM_RoleValue_PID , 2 )	-- 避免 Already running
		Sleep(Time)
		WriteRoleValue( Door , EM_RoleValue_PID , 1 )	-- 寫為可關門
	else	-- 播放關門動作
		PlayMotionEX( Door , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )
		WriteRoleValue( Door , EM_RoleValue_PID , 2 )	-- 避免 Already running
		Sleep(Time)
		WriteRoleValue( Door , EM_RoleValue_PID , 0 )	-- 寫為可開門
	end
end
-- 2013.04.23 阿浩:調整公會城戰場(Zone 402)生成城門建築點的寫法，修正城門被摧毀時，有機率不會產生城門建築點(113200)的問題。
function Hao_GuildWar_Door_Death_Plot()	--城門死亡表演劇情

	local Gate = OwnerID()	--城門
	local Gate_OrgID = ReadRoleValue( Gate , EM_RoleValue_OrgID )	-- 取得城門OrgID
	local Gate_CampID = GetRoleCampID( Gate )	-- 取得城門陣營
	
	local Pos = {}
	Pos["RoomID"] = ReadRoleValue( Gate , EM_RoleValue_RoomID )	-- 取得城門所在 Room
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Gate) -- 取得城門所在座標
	SetModeEx( Gate , EM_SetModeType_Fight , false )	-- 不可砍殺
	
	-- 2013.07.11 YoYo：新增寵物阻擋線相關功能，防止寵物穿牆打人。
	local BlockLineFlag = 780234	--寵物阻擋線專用的旗標
	local DoorFlagSite = { 21 , 22 , 23 , 31 , 32 , 33 }	--判斷城門位置的旗標編號
	local BlockLineID = { 107 , 108 , 109 , 207 , 208 , 209 }	--阻擋線的編號
	--21：藍隊 - 右門(布魯克)
	--22：藍隊 - 左門(愛薩奇)
	--23：藍隊 - 正門
	--31：紅隊 - 右門(貝里尼)
	--32：紅隊 - 左門(阿納德)
	--33：紅隊 - 正門
	for I = 1 , #DoorFlagSite do
		if KS_GetFlagDistance( Gate , BlockLineFlag , DoorFlagSite[ I ] ) < 200 then	--當門與判斷距離<200，則移除對應阻擋線
			DelLineBlock( Pos["RoomID"] , BlockLineID[ I ] )	--移除阻擋線
		end
	end

	local Bonfire = CreateObjByObj( 114740 , Gate , 1 )	-- 在城門上建立隱藏火堆物件，播放城門被摧毀後，持續燃燒的動作
	SetModeEx( Bonfire , EM_SetModeType_Fight , false )	-- 不可砍殺
	SetModeEx( Bonfire , EM_SetModeType_HideName , true )	--隱藏名稱
	SetModeEx( Bonfire , EM_SetModeType_Mark , false )	--標記
	CallPlot( Bonfire , "Hao_GuildWar_DelObj" , Bonfire , 35 )	--  讓火堆在設定秒數後刪除自己。

	local GatePoint = CreateObj( 113200 , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , 1 )	-- 建立城門建築點
	SetModeEx( GatePoint , EM_SetModeType_Fight , false )	-- 不可砍殺
	SetModeEx( GatePoint , EM_SetModeType_Show , false )	-- 顯示
	SetModeEx( GatePoint , EM_SetModeType_Mark , false )	-- 標記	
	SetModeEx( GatePoint , EM_SetModeType_HideName , false )	-- 名稱
	SetModeEx( GatePoint , EM_SetModeType_ShowRoleHead , true )	-- 頭像框
	SetModeEx( GatePoint , EM_SetModeType_Move , false )	-- 移動
	SetModeEx( GatePoint , EM_SetModeType_Obstruct , false )	-- 阻擋
	SetModeEx( GatePoint , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	SetRoleCampID( GatePoint , Gate_CampID )	-- 將城門陣營寫入城門建築點中
	WriteRoleValue( GatePoint  , EM_RoleValue_Register+4 , Gate_OrgID )	-- 將城門的OrgID寫入城門建築點中
	-- 2013.06.28 追加死亡劇情，查詢誰殺死城門建築點，追蹤城門建築點無故死亡的問題，並將死亡劇情 return false
	SetPlot( GatePoint , "dead" , "Hao_GuildWar_GatePoint_Dead" , 0 )	--死亡劇情
	--
	AddToPartition( GatePoint , Pos["RoomID"] )
	Beginplot( GatePoint ,"Hao_GuildWar_GatePoint", 0 )	-- 執行城門建築點的劇情

	local GatePoint_CampID = GetRoleCampID( GatePoint )	-- 取得城門建築點陣營
	CallPlot( Gate , "Hao_GuildWar_DelObj" , Gate , 0 )	--  讓城門在設定秒數後刪除自己。
end

function Hao_GuildWar_GatePoint_Dead()	-- 城門建築點死亡劇情

	local GatePoint = OwnerID()
	local Count = HateListCount(GatePoint)	-- 讀取仇恨列表

	for i = 1 , Count , 1 do	-- 逐一拆解仇恨列表名單
			local Killer = HateListInfo( GatePoint , i-1 , EM_HateListInfoType_GItemID )
			local OrgID = ReadRoleValue( Killer , EM_RoleValue_OrgID )
			DesignLog( Killer , 113200 , "Killer = "..OrgID )	-- 讓兇手回傳自己的OrgID到Designlog中
	end
	
	local MaxHP = ReadRoleValue( GatePoint , EM_RoleValue_MaxHP )	-- 將城門建築點血量補滿
	WriteRoleValue( GatePoint , EM_RoleValue_HP , MaxHP )
	return false
end

function Hao_GuildWar_DelObj( Obj , Time)
	Sleep(Time)
	DelObj(Obj)
end

function Hao_GuildWar_GatePoint()	-- 城門建築點執行劇情

	local GatePoint = OwnerID()
	sleep(40)
	SetModeEx( GatePoint , EM_SetModeType_Show , true )	--顯示
	SetModeEx( GatePoint , EM_SetModeType_Mark , true )	--標記
	SetPlot( GatePoint , "touch" , "Hao_GuildWar_GatePoint_Touch" , 50 )	--觸碰再生劇情
	SetCursorType( GatePoint , eCursor_repair )	 -- 游標變成修理鎚
--	SetCursorType( GatePoint , eCursor_Interact )	 -- 游標變成齒輪
end

-- 2013.03.07 阿浩：重寫以下劇情，修正公會城戰場(Zone 402)點擊城門建築點(113200)時發生的問題，詳情請見版本日誌，以城門建築點為關鍵字搜尋
function Hao_GuildWar_GatePoint_Touch() -- 城門建築點的觸碰劇情

	local Player = OwnerID()	-- 玩家
	local GatePoint = TargetID()	-- 城門建築點
	local Voc = ReadRoleValue( Player , EM_RoleValue_VOC )	-- 取得玩家職業，職業設定為GM時，可忽略陣營判斷條件
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local PlayerGuildID = GetRoleCampID( Player )		-- 取得玩家陣營
	local GatePointGuildID = GetRoleCampID( GatePoint )	-- 取得城門建築點陣營
	local Player_Energy = GetGuildWarEnergy( Player )	-- 取得玩家持有能量
	local Player_Record =  CountBodyItem( Player , 206685 )	-- 取得玩家持有戰績
	local Record = 20 -- 重新建造城門所需戰績
	local Energy = 200 -- 重新建造城門所需能量

	DialogClose( Player )

	if Voc ~= 0 then	-- 職業非 GM 時，加入陣營判斷
		if PlayerGuildID ~= GatePointGuildID then	-- 不同陣營就 return
			ScriptMessage( Player , Player , 1 , "[GUILD_REMINDER]" , C_SYSTEM )	--你不是此公會的成員
			ScriptMessage( Player , Player , 0 , "[GUILD_REMINDER]" , C_SYSTEM )
			return
		end
	end

	if ReadRoleValue( GatePoint , EM_RoleValue_PID ) == 1 then
		ScriptMessage( Player , Player , 1 ,"[SYS_AUCTION_WAIT_NEXT]" , 0 )	-- 忙碌中，請稍候再試。
		return
	end

	if CheckBuff( Player , 501570 ) == true then
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )	--視窗已經打開了
		return
	end

	AddBuff( Player , 501570 , 0 , -1 )

	local Time = 0
	local DialogStatus , Distance
	local DistanceLimit = 50
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_OKAY]" }	-- 確定
	TransferSelect[1] = { "[SC_CANCEL]" }	-- 離開對話

	DialogCreate( Player , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_BUILD_87][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" )	-- 建造城門需花費...
	for i = 0 , table.getn(TransferSelect) , 1 do
		DialogSelectStr( Player , TransferSelect[i][1] )
	end

	if DialogSendOpen(Player) == false then
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return
	end
	
	while true do
		Sleep(1)
		Time = Time + 1
		Distance = GetDistance( Player , GatePoint )		
		if Time  > 600 then	-- 防無窮迴圈
			DebugMsg( Player , RoomID ,"Idle for more than 60 sec , Menu will close automatically." )
			break
		elseif Distance > DistanceLimit then
			ScriptMessage( Player , Player , 1 , "[SC_204425_5]" , 0 )	-- 目標距離過遠
			break
		end
		DialogStatus = DialogGetResult( Player )
		if DialogStatus == 0 then	-- 玩家點選是
			if Player_Energy >= Energy and Player_Record >= Record then	-- 當持有能量>=研發能量及持有戰績>=研發戰績時
				CallPlot( GatePoint , "Hao_GuildWar_GatePoint_Touch_1" , GatePoint , Player , Record , Energy , DistanceLimit )
			elseif Player_Energy < Energy and Player_Record < Record then
				ScriptMessage( Player , Player , 1 , "[SC_YU_GUILDWAR_BUILD_27]" , 0 )	-- 研發所需之能量、戰績不足
				ScriptMessage( Player , Player , 0 , "[SC_YU_GUILDWAR_BUILD_27]" , 0 )
			elseif Player_Energy < Energy and Player_Record >= Record then				
				ScriptMessage( Player , Player , 1 , "[SC_YU_GUILDWAR_BUILD_31]" , 0 )	-- 研發所需之能量不足
				ScriptMessage( Player , Player , 0 , "[SC_YU_GUILDWAR_BUILD_31]" , 0 )
			elseif Player_Energy >= Energy and Player_Record < Record then				
				ScriptMessage( Player , Player , 1 , "[SC_YU_GUILDWAR_BUILD_32]" , 0 )	-- 研發所需之戰績不足
				ScriptMessage( Player , Player , 0 , "[SC_YU_GUILDWAR_BUILD_32]" , 0 )
			end
			break
		elseif DialogStatus == 1 or DialogStatus == -1 then	-- 點選否或中斷劇情
			break
		end
	end
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Hao_GuildWar_GatePoint_Touch_1( GatePoint , Player , Record , Energy , DistanceLimit )	-- 重新建設城門
	-- 城門建築點、玩家、消耗戰績、消耗能量、城門建築點與玩家之間可允取點擊的距離
	local CastTime = 200			-- 建築城門需求時間
	if ReadRoleValue( GatePoint , EM_RoleValue_PID ) == 1 then	-- 城門建築點有玩家正在使用時
		ScriptMessage( Player , Player , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )	--忙碌中，請稍候再試。
		return
	end
	CallPlot( GatePoint , "Hao_GuildWar_Check_State" , GatePoint , Player , DistanceLimit )	-- 查詢玩家是否還在該區域
	WriteRoleValue( GatePoint , EM_RoleValue_PID , 1 )	--研發鎖定中，讓城門建築點不可再被其他玩家點擊
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )	-- 開始建築
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )
	if BeginCastBarEvent( Player , GatePoint , "[SC_YU_GUILDWAR_BUILD_88]" , CastTime , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 , "Hao_GuildWar_Door_Rebirth" ) ~= 1 then
		ScriptMessage( Player , Player , 0 , "[SAY_NPC_BUSY]" , 0 )	--目標正在忙碌中
		return
	else
		AttachCastMotionTool( Player , 210644 )	--置換武器為榔頭
	end
end

function Hao_GuildWar_Check_State( Npc , Player , DistanceLimit )	-- 查詢玩家是否還在該區域

	while ReadRoleValue( Npc , EM_RoleValue_PID ) == 1 do
		if CheckID(Player) == false or GetDistance( Npc , Player ) > DistanceLimit then	-- 確認點擊的玩家是否離開區域或斷線
			WriteRoleValue( Npc , EM_RoleValue_PID , 0 )
			break
		end
		Sleep(10)
	end
end

function Hao_GuildWar_Door_Rebirth( Player , CheckStatus ) -- 執行者、執行結果(大於0是成功，小於0是失敗)

	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local GatePoint = TargetID()
	local PlayerGuildID = GetRoleCampID( Player )	--玩家的陣營
	local DoorID = ReadRoleValue( GatePoint , EM_RoleValue_Register+4 )	-- 讀取記錄在城門建築點上的大門ID
	local Player_Energy = GetGuildWarEnergy( Player )	-- 取得玩家持有能量
	local Energy = 200	--生產所需能量	
	local Player_Record =  CountBodyItem( Player , 206685 )	-- 取得玩家持有戰績
	local Record = 20	--生產所需戰績
	local Voc = ReadRoleValue( Player , EM_RoleValue_VOC )	-- 讀取玩家職業
	
	if CheckStatus ~= 0 then	-- 如果有施法條時
		if CheckStatus > 0 and ( Player_Record >= Record and Player_Energy >= Energy ) then	-- 施法成功、持有資源>=需求資源時
			local Door = CreateObjByObj( DoorID , GatePoint , 1 )	-- 在城門建築點上重建大門
			local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- 讀取伺服器設定的等級上限
			WriteRoleValue( Door, EM_RoleValue_LV , ServerMaxLv )--等級會隨伺服器等級開放的上限而成長
			AddBuff( Door , 505013 , 1 , 1  )	-- 縮小
			SetRoleCampID( Door , PlayerGuildID )	-- 將玩家陣營寫入城門
			DelBodyItem( Player , 206685 , Record )	-- 扣除玩家持有戰績
			AddGuildWarEnergy( Player , -Energy )	-- 扣除玩家持有能量
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	-- 建築完成，消耗能量[$VAR1]、戰績[$VAR2]
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
			AttachCastMotionTool( Player , 212076 )  --置換武器為空手			
			EndCastBar( Player , CheckStatus )
			Delobj(GatePoint)
			
--[[			-- 2013.07.11 YoYo：新增寵物阻擋線相關功能，防止寵物穿牆打人。
			local BlockLineFlag = 780234	--寵物阻擋線專用的旗標
			local DoorFlagSite = { 21 , 22 , 23 , 31 , 32 , 33 }	--判斷城門位置的旗標編號
			local BlockLineID = { 107 , 108 , 109 , 207 , 208 , 209 }	--阻擋線的編號
			--21：藍隊 - 右門(布魯克)
			--22：藍隊 - 左門(愛薩奇)
			--23：藍隊 - 正門
			--31：紅隊 - 右門(貝里尼)
			--32：紅隊 - 左門(阿納德)
			--33：紅隊 - 正門
			local BlockPointTable = { { 2 , 3 } , { 5 , 6 } , { 8 , 9 } , { 12 , 13 } , { 15 , 16 } , { 18 , 19 } }	--阻擋連線用的點
			for I = 1 , #DoorFlagSite do
				if KS_GetFlagDistance( Door , BlockLineFlag , DoorFlagSite[ I ] ) < 100 then	--當門與判斷距離<100，則生成阻擋線
					local BP1X , BP1Y , BP1Z , BP1Dir = DW_Location( BlockLineFlag , BlockPointTable[ I ][ 1 ] ) --取得阻擋線旗標1的位置與面向
					local BP2X , BP2Y , BP2Z , BP2Dir = DW_Location( BlockLineFlag , BlockPointTable[ I ][ 2 ] ) --取得阻擋線旗標2的位置與面向
					AddLineBlock( RoomID , BlockLineID[ I ] , BP1X , BP1Z , BP2X , BP2Z )	--新增阻擋線
				end
			end
			--]]
		else	-- 施法失敗
			WriteRoleValue( GatePoint , EM_RoleValue_PID , 0 )	--解除鎖定可再次研發
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )	-- 建築失敗
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )
			AttachCastMotionTool( Player , 212076 )  --置換武器為空手
			EndCastBar( Player , CheckStatus )
		end
	end
end
-- 2013.07.16 阿浩：新增公會城戰阻擋線共用函式
function Hao_GuildWar_Door_Biock( Obj , BehindDis , LeftDis , RightDis )	-- 參考物件、後方垂直距離、左方水平距離、右方水平距離

	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local Pos , Dir , Cal = {} , {} , {}	-- 座標、角度、弧度
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"]  = Lua_Hao_Return_Coordinate(Obj) -- 取得Obj所在座標

	-- 算出物件後方180度的弧度
	Dir["Behind"] = Pos["Dir"] + 180
	if Dir["Behind"] >= 360 then
		Dir["Behind"] = Dir["Behind"] - 360
	end
	Cal["Behind"] = (math.pi/180)*(Dir["Behind"])	-- 後方弧度

	-- 算出物件左方90度時的弧度
	Dir["Left"] = Pos["Dir"]+90
	if Dir["Left"] >= 360 then
		Dir["Left"] = Dir["Left"] - 360
	end
	Cal["Left"] = (math.pi/180)*(Dir["Left"])	-- 左方弧度

	-- 算出物件右方90度時的弧度
	Dir["Right"] = Pos["Dir"]-90
	if Dir["Right"] < 0 then
		Dir["Right"] = Dir["Right"] + 360
	end
	Cal["Right"] = (math.pi/180)*(Dir["Right"])	-- 右方弧度

	-- 當前面向的後方180度，向後BehindDis距離後的 X Y Z 點
	Pos["BehindX"] = Pos["X"]+(BehindDis*math.cos(Cal["Behind"]))
	Pos["BehindZ"] = Pos["Z"]-(BehindDis*math.sin(Cal["Behind"]))
	Pos["BehindY"] = GetHeight( Pos["BehindX"] , Pos["Y"] , Pos["BehindZ"] )	-- 取得該點的地表高度
	
	-- 當前面向的左方90度，向左LeftDis距離後的 X Y Z 點
	Pos["LeftX"] = Pos["BehindX"]-(LeftDis*math.cos(Cal["Left"]))
	Pos["LeftZ"] = Pos["BehindZ"]+(LeftDis*math.sin(Cal["Left"]))
	Pos["LeftY"] = GetHeight( Pos["LeftX"] , Pos["Y"] , Pos["LeftZ"] )
	
	-- 當前面向的右方90度，向右RightDis距離後的 X Y Z 點
	Pos["RightX"] = Pos["BehindX"]-(RightDis*math.cos(Cal["Right"]))
	Pos["RightZ"] = Pos["BehindZ"]+(RightDis*math.sin(Cal["Right"]))
	Pos["RightY"] = GetHeight( Pos["RightX"] , Pos["Y"] , Pos["RightZ"] )

--	local Obj1 = CreateObj( 110987 , Pos["LeftX"] , Pos["LeftY"] , Pos["LeftZ"] , Pos["Dir"] , 1 )
--	local Obj2 = CreateObj( 110987 , Pos["RightX"] , Pos["RightY"] , Pos["RightZ"] , Pos["Dir"] , 1 )
--	local Obj3 = CreateObj( 110987 , Pos["BehindX"] , Pos["BehindY"] , Pos["BehindZ"] , Pos["Dir"] , 1 )
--	AddToPartition( Obj1 , Room )
--	AddToPartition( Obj2 , Room )
--	AddToPartition( Obj3 , Room )
	return Pos["LeftX"] , Pos["LeftZ"] , Pos["RightX"] , Pos["RightZ"]	
end