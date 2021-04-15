--	旗標 781187
--		0：中央祕法瑰寶位置
--		1：開場阻擋門：銀翼堡壘(紅隊)
--		2：開場阻擋門：獅心城寨(藍隊)
--		3：陣營據點：獅心城寨(藍隊)
--		4：陣營據點：銀翼堡壘(紅隊)
--		5：補給點：銀月哨站
--		6：補給點：星殞哨站
--		21、22、23、24、25、26：野怪重生點
--		27：邪靈谷地的BOSS怪重生點
--		31、32：獅心城寨(藍隊)據點的守護怪重生點
--		41、42：銀翼堡壘(紅隊)據點的守護怪重生點
--		51、52、53：獅心城寨(藍隊)的三路阻擋路障
--		54、55、56、57、58、59：獅心城寨(藍隊)的三路防衛箭塔
--		61、62、63：銀翼堡壘(紅隊)的三路阻擋路障
--		64、65、66、67、68、69：銀翼堡壘(紅隊)的三路防衛箭塔
--	HideUnit (中控器)
--	 	Register + 1：紀錄銀翼堡壘(紅隊)的開場阻擋門
--		Register + 2：紀錄獅心城寨(藍隊)的開場阻擋門
--		Register + 3：紀錄獅心城寨(藍隊)的據點
--		Register + 4：紀錄銀翼堡壘(紅隊)的據點
--		Register + 5：紀錄銀月哨站的補給點
--		Register + 6：紀錄星殞哨站的補給點
--		Register + 7：紀錄現在的NPC重生等級
--	 戰場據點資料
--		57：中立圖案
--		58：銀翼堡壘(紅隊)圖案
--		59：獅心城寨(藍隊)圖案
-- 	Camp
-- 		2：中立
--		8：T1 - 銀翼堡壘(紅隊)
--		9：T2 - 獅心城寨(藍隊)
-- 	Team
--		1：T1 - 銀翼堡壘(紅隊)
--		2：T2 - 獅心城寨(藍隊)
--	DesignLog
--		121169		遊戲完成場次(訊息告知哪隊贏、或是平手)
--		121433		每場花費多少時間
--		121435		物資被奪取的次數(訊息告知哪隊奪取)
--		121434		旗子被交還的次數(訊息告知哪隊還旗)
--		121440		使用卷軸的次數(訊息告知使用哪個卷軸)
--		121439		遺忘技能次數(訊息告知遺忘哪個技能)

function BG_AA_Set()		--掛在物件產生劇情，為整個戰場的初始化
	local HideUnit = OwnerID()
	local RoomID = ReadRoleValue( HideUnit, EM_RoleValue_RoomID )
	--全域變數
	if Z448_v == nil then
		Z448_v = {}	--創建屬於祕法棋戰的全域變數
	end
	
	Z448_v[RoomID] = {}	--創建屬於該層的全域變數

	Z448_v[RoomID][1] = HideUnit	--中控器
	Z448_v[RoomID][2] = 5		--用來判斷補給點目前哪個開放
	Z448_v[RoomID][3] = 0		--紀錄奪旗的旗子
	Z448_v[RoomID][30] = -1		--戰場Timer
	Z448_v[RoomID][31] = ""		--戰場現狀
	--
	--紀錄值
	WriteRoleValue(HideUnit, EM_RoleValue_Register+7, 1)	-- 用來判斷玩家目前該提升到幾級，和野怪重生時設定的等級，每60秒會+1
	--規則建立
	SetZoneReviveScript( "BG_AA_Revive" )		-- 玩家重生劇情，寫在後面
	SetZonePVPScript( "BG_AA_PVPDead" )	-- 玩家擊殺劇情，寫在後面

	--創建兩邊陣營的門
	for i = 1, 2 do
		local Gate = CreateObjByFlag( 121433 , 781187 , i , 1 ) 
		SetModeEx( Gate, EM_SetModeType_Strikback, false )			--反擊
		SetModeEx( Gate, EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
		SetModeEx( Gate, EM_SetModeType_Obstruct, true )			--阻擋
		SetModeEx( Gate, EM_SetModeType_Mark, false )			--標記
		SetModeEx( Gate, EM_SetModeType_Move, false )			--移動
		SetModeEx( Gate, EM_SetModeType_Searchenemy, false )		--索敵
		SetModeEx( Gate, EM_SetModeType_HideName, false )			--名稱
		SetModeEx( Gate, EM_SetModeType_ShowRoleHead, false )		--頭像框
		SetModeEx( Gate, EM_SetModeType_Fight , false )			--可砍殺攻擊
		SetModeEx( Gate, EM_SetModeType_Drag , true )			--阻力
		AddToPartition(Gate , RoomID)
		WriteRoleValue(HideUnit, EM_RoleValue_Register+i, Gate )		-- 把門記到中控器的Register值
	end
	
	--創建據點
	local FightingPoint
	for i = 3, 4 do
		if i == 3 then	FightingPoint = CreateObjByFlag( 107775 , 781187 , i , 1 )	--雄獅據點
		else				FightingPoint = CreateObjByFlag( 107774 , 781187 , i , 1 )	--銀翼據點
		end
		SetModeEx( FightingPoint, EM_SetModeType_Strikback , true )			--反擊
		SetModeEx( FightingPoint, EM_SetModeType_SearchenemyIgnore , false )	--被搜尋
		SetModeEx( FightingPoint, EM_SetModeType_Obstruct , true )			--阻擋
		SetModeEx( FightingPoint, EM_SetModeType_Mark , true )			--標記
		SetModeEx( FightingPoint, EM_SetModeType_Move , false )			--移動
		SetModeEx( FightingPoint, EM_SetModeType_Searchenemy , true )		--索敵
		SetModeEx( FightingPoint, EM_SetModeType_HideName , true )			--名稱
		SetModeEx( FightingPoint, EM_SetModeType_ShowRoleHead , true )		--頭像框
		SetModeEx( FightingPoint, EM_SetModeType_Fight , true )			--可砍殺攻擊
		SetModeEx( FightingPoint, EM_SetModeType_Drag , true )			--阻力
		if i == 3 then
			SetRoleCampID( FightingPoint , 9 )	--陣營：T2 - 獅心城寨(藍隊)
			WriteRoleValue( HideUnit , EM_RoleValue_Register + i , 9 )		-- 把據點陣營記到中控器的Register值
		else
			SetRoleCampID( FightingPoint , 8 )	--陣營：T1 - 銀翼堡壘(紅隊)
			WriteRoleValue( HideUnit , EM_RoleValue_Register + i , 8 )		-- 把據點陣營記到中控器的Register值
		end
		AddToPartition( FightingPoint , RoomID )
		AddBuff( FightingPoint , 502707 , 0 , -1 )	-- 不回血
		
		--創建裝飾水晶
		local AdornPoint
		if i == 3 then	AdornPoint = CreateObjByFlag( 121438 , 781187 , i , 1 )	--雄獅據點裝飾紅水晶
		else				AdornPoint = CreateObjByFlag( 121437 , 781187 , i , 1 )	--銀翼據點裝飾藍水晶
		end
		SetModeEx( AdornPoint, EM_SetModeType_Strikback, false )			--反擊
		SetModeEx( AdornPoint, EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
		SetModeEx( AdornPoint, EM_SetModeType_Obstruct, false )			--阻擋
		SetModeEx( AdornPoint, EM_SetModeType_Mark, false )			--標記
		SetModeEx( AdornPoint, EM_SetModeType_Move, false )			--移動
		SetModeEx( AdornPoint, EM_SetModeType_Searchenemy, false )		--索敵
		SetModeEx( AdornPoint, EM_SetModeType_HideName, false )			--名稱
		SetModeEx( AdornPoint, EM_SetModeType_ShowRoleHead, false )		--頭像框
		SetModeEx( AdornPoint, EM_SetModeType_Fight , false )			--可砍殺攻擊
		SetModeEx( AdornPoint, EM_SetModeType_Drag , false )			--阻力
		if i == 3 then	SetRoleCampID( AdornPoint , 9 )	--陣營：T2 - 獅心城寨(藍隊)
		else				SetRoleCampID( AdornPoint , 8 )	--陣營：T1 - 銀翼堡壘(紅隊)
		end
		AddToPartition( AdornPoint , RoomID )
		
		local pX = ReadRoleValue( FightingPoint , EM_RoleValue_X )
		local pY = ReadRoleValue( FightingPoint , EM_RoleValue_Y )
		local pZ = ReadRoleValue( FightingPoint , EM_RoleValue_Z )
		local pName = "[BG_AA_POINT_" ..i.. "]"
		if i == 3 then	SetLandMarkInfo( RoomID, i, 59, pX, pY, pZ, pName, 59 )	--設定戰場據點資料，59：獅心城寨(藍隊)圖案
		else				SetLandMarkInfo( RoomID, i, 58, pX, pY, pZ, pName, 58 )	--設定戰場據點資料，58：銀翼堡壘(紅隊)圖案
		end
		WriteRoleValue( FightingPoint , EM_RoleValue_PID , i )				-- 把據點的MarkNum記在據點自己的PID上面
		WriteRoleValue( FightingPoint , EM_RoleValue_Register + 1 , AdornPoint )	--把裝飾記到據點的Register值
		
		SetPlot( FightingPoint , "dead" , "BG_AA_Flag_Dead" , 30 )			-- 據點死亡事件
		
		--創建據點守衛
		for j = 1, 2 do
			local Guard	--守衛
			if j == 1 then	Guard = CreateObjByFlag( 102899 , 781187 ,  i * 10 + j , 1 )	--鎮軍衛士，i * 10 + j 是判斷位置
			else				Guard = CreateObjByFlag( 102900 , 781187 ,  i * 10 + j , 1 )	--鎮軍術士，i * 10 + j 是判斷位置
			end
			if i == 3 then	SetRoleCampID( Guard , 9 )	--陣營：T2 - 獅心城寨(藍隊)
			else				SetRoleCampID( Guard , 8 )	--陣營：T1 - 銀翼堡壘(紅隊)
			end
			AddToPartition( Guard , RoomID )
			SetPlot( Guard , "dead" , "BG_AA_Guard_Kill" , 0 )
		end
	end
	
	--創建戰場路障與防衛箭塔
	for i = 5 , 6 do
		for j = 1 , 3 do	--戰場路障
			local Barrier = CreateObjByFlag( 104858 , 781187 , i * 10 + j , 1 ) 
			SetModeEx( Barrier , EM_SetModeType_Strikback , false )			--反擊
			SetModeEx( Barrier , EM_SetModeType_SearchenemyIgnore , false )	--被搜尋
			SetModeEx( Barrier , EM_SetModeType_Obstruct , true )			--阻擋
			SetModeEx( Barrier , EM_SetModeType_Mark , true )			--標記
			SetModeEx( Barrier , EM_SetModeType_Move , false )			--移動
			SetModeEx( Barrier , EM_SetModeType_Searchenemy , false )		--索敵
			SetModeEx( Barrier , EM_SetModeType_HideName , true )			--名稱
			SetModeEx( Barrier , EM_SetModeType_ShowRoleHead , true )		--頭像框
			SetModeEx( Barrier , EM_SetModeType_Fight , true )			--可砍殺攻擊
			SetModeEx( Barrier , EM_SetModeType_Drag , true )			--阻力
			if i == 5 then	SetRoleCampID( Barrier , 9 )	--9：T2 - 獅心城寨(藍隊)
			else	SetRoleCampID( Barrier , 8 )	--8：T1 - 銀翼堡壘(紅隊)
			end
			AddToPartition( Barrier , RoomID )
			SetPlot( Barrier , "touch" , "BG_AA_TouchBarrier" , 60 )			-- 路障觸碰事件
			SetPlot( Barrier , "dead" , "BG_AA_BarrierDeath" , 0 )	--大門的死亡劇情
			AddBuff( Barrier , 502707 , 0 , -1 )	-- 不回血
			CallPlot( Barrier , "BG_AA_CreateSoldiers" , i , j , HideUnit )		--持續創建陣營小兵函示，帶入參數：i = 陣營、j = 路線、中控器objID
		end
		
		for j = 4 , 9 do	--防衛箭塔
			local Towers = CreateObjByFlag( 104860 , 781187 , i * 10 + j , 1 ) 
			SetModeEx( Towers , EM_SetModeType_Strikback , true )			--反擊
			SetModeEx( Towers , EM_SetModeType_SearchenemyIgnore , false )	--被搜尋
			SetModeEx( Towers , EM_SetModeType_Obstruct , true )			--阻擋
			SetModeEx( Towers , EM_SetModeType_Mark , true )			--標記
			SetModeEx( Towers , EM_SetModeType_Move , false )			--移動
			SetModeEx( Towers , EM_SetModeType_Searchenemy , true )		--索敵
			SetModeEx( Towers , EM_SetModeType_HideName , true )			--名稱
			SetModeEx( Towers , EM_SetModeType_ShowRoleHead , true )		--頭像框
			SetModeEx( Towers , EM_SetModeType_Fight , true )			--可砍殺攻擊
			SetModeEx( Towers , EM_SetModeType_Drag , true )			--阻力
			if i == 5 then	SetRoleCampID( Towers , 9 )	--9：T2 - 獅心城寨(藍隊)
			else	SetRoleCampID( Towers , 8 )	--8：T1 - 銀翼堡壘(紅隊)
			end
			AddToPartition( Towers , RoomID )
			SetPlot( Barrier , "dead" , "BG_AA_TowersDeath" , 0 )	--防衛箭塔的死亡劇情
			AddBuff( Towers , 502707 , 0 , -1 )	-- 不回血
		end
	end
	
	--創建補給點
	for i = 5, 6 do
		local Treasure = CreateObjByFlag( 113716 , 781187 , i , 1 ) 
		SetModeEx( Treasure, EM_SetModeType_Strikback, false )		--反擊
		SetModeEx( Treasure, EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
		SetModeEx( Treasure, EM_SetModeType_Obstruct, true )		--阻擋
		SetModeEx( Treasure, EM_SetModeType_Mark, true )			--標記
		SetModeEx( Treasure, EM_SetModeType_Move, false )			--移動
		SetModeEx( Treasure, EM_SetModeType_Searchenemy, false )		--索敵
		SetModeEx( Treasure, EM_SetModeType_HideName, true )		--名稱
		SetModeEx( Treasure, EM_SetModeType_ShowRoleHead, false )		--頭像框
		SetModeEx( Treasure, EM_SetModeType_Fight , false )			--可砍殺攻擊
		SetModeEx( Treasure, EM_SetModeType_Drag , true )			--阻力
		SetRoleCampID( Treasure, 2 )						--預設為中立友好陣營
		AddToPartition( Treasure , RoomID)
		
		local pX = ReadRoleValue(Treasure,EM_RoleValue_X)
		local pY = ReadRoleValue(Treasure,EM_RoleValue_Y)
		local pZ = ReadRoleValue(Treasure,EM_RoleValue_Z)
		local pName = "[BG_AA_POINT_" ..i.. "]"
		SetLandMarkInfo( RoomID, i, 57, pX, pY, pZ, pName, 57 );		-- 設定戰場據點資料，57：中立圖案、58：銀翼堡壘(紅隊)圖案、59：獅心城寨(藍隊)圖案
		WriteRoleValue( Treasure, EM_RoleValue_PID, i )			-- 把據點的MarkNum記在據點自己的PID上面
		WriteRoleValue( HideUnit, EM_RoleValue_Register+i, Treasure )		-- 把補給點記到中控器的Register值
		SetPlot( Treasure, "touch" , "BG_AA_TakeTreasure" , 60 )			-- 據點觸碰事件
	end
end

function LuaZone_BG_AA_EnterZoneScript()	--玩家進入戰場觸發
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID )
	local HideUnit = Z448_v[RoomID][1]

	if Z448_v[RoomID][30] == -1 then	--第一個玩家進到戰場之後才開始計時器
		CallPlot( HideUnit, "BG_AA_Timer" )
	end
	--玩家起始設定
	DebugMsg( 0, RoomID, "Player "..Player.." enter battle ground" )
	BG_AA_PlayerSet( RoomID, Player )
	InitBgIndependence( Player , 	Def_InitBgIndependence_MaxWeaponSkill +
	Def_InitBgIndependence_MaxMagicSkill + Def_InitBgIndependence_TitleClear +
	Def_InitBgIndependence_KeyItemClear + Def_InitBgIndependence_QuestClear +
	Def_InitBgIndependence_PetClear + Def_InitBgIndependence_BuffClear )	-- 這麼長一串都是跟獨立戰場的設定有關
end

--==================================
--			戰場整個時間進程
--==================================
function BG_AA_Timer()	--戰場整個時間進程
	local HideUnit = OwnerID()
	local RoomID = ReadRoleValue( HideUnit, EM_RoleValue_RoomID )

	local BG_time = 90									--戰場正式開始前的準備時間
	local BG_State = "Prepare"						--戰場目前狀態，用來做判定
	local Score1700Check = { false, false }	--用來判斷兩隊各自到達1700分時的訊息，只要放送一次
	Z448_v[RoomID][30] = BG_time
	Z448_v[RoomID][31] = BG_State
	
	local MaxLv = 10				--等級上限
	local PlayerAddExp = 100		--玩家每次增加經驗值
	local NpcLvUpTime = 60			--NPC重生設定等級時間
	local PlayerAddExpTime = 30	--玩家每次增加經驗值時間

	local Flag
	local FlagNowTimer = 300			-- 一開始設300是用來當作計算旗子開場第一次的等候時間
	local FlagReplaceTimer = 180		-- 旗子重生的時間 填1為1秒

	local MonsterType = { 
	[21] = 102901; 
	[22] = 102902; 
	[23] = 102903; 
	[24] = 102904; 
	[25] = 102905; 
	[26] = 102915; 
	[27] = 107369 }	--各個野怪點的怪物類型
	local MonsterTable = {}	--紀錄各野怪點的怪物
	local MonsterTime = { [21] = 0; [22] = 0; [23] = 0; [24] = 0; [25] = 0; [26] = 0; [27] = 300 }	--紀錄各野怪的重生時間
	local MonsterSpawnCD = { [21] = 30; [22] = 30; [23] = 30; [24] = 30; [25] = 30; [26] = 30; [27] = 300 }	--這邊設定各野怪的重生時間CD

	local PointTable = {}
	for p = 3 , 4 do									--把雙方的兩個據點紀錄到PointTable
		PointTable[p] = ReadRoleValue( HideUnit , EM_RoleValue_Register + p )
	end

	local TreasureChangeTimer = -1							--為0表示該轉換寶箱了，轉換會有120秒時間，-1表示轉換完成還沒被占領
	local TreasureTakeTeam = 0								--哪一隊有領取持續獎勵的資格
	local TreasureGiveGold = 100								--持續獎勵每次給予多少黃金
	local BeginHideTreasure = ReadRoleValue( HideUnit , EM_RoleValue_Register + 6 )	--在一開始不顯示的那個寶箱
	Hide(BeginHideTreasure)								--隱藏那個寶箱
	SetLandMark( RoomID , 6 , 0 )								--設為0表示把隱藏寶箱LandMark從小地圖上隱藏

	while true do
		if BG_time % 10 == 0 then DebugMsg( 0, RoomID, "BG_time="..BG_time ) end
		--戰場開始前	======================================================================
		if BG_State == "Prepare" then		
			local BG_PrepareString = {[90]="[BG_AA_PREPARE01]";
						[60]="[BG_AA_PREPARE02]";
						[30]="[BG_AA_PREPARE03]";
						[0]="[BG_AA_PREPARE04]";}
			if  (BG_time == 90 or BG_time == 60 or BG_time == 30 or BG_time == 0) then
--			if  (BG_time == 9 or BG_time == 6 or BG_time == 3 or BG_time == 0) then
				ScriptMessage( HideUnit,  -1, 2, BG_PrepareString[BG_time] , C_SYSTEM )	--比賽將在XX秒後開始
				ScriptMessage( HideUnit,  -1, 0, BG_PrepareString[BG_time] , C_SYSTEM )	--比賽將在XX秒後開始
				if BG_time == 0 then
					for i=1,2 do
						local Gate = ReadRoleValue(HideUnit, EM_RoleValue_Register+i )
						DebugMsg( 0, RoomID, "Del Gate="..Gate )
						DelObj(Gate)
					end
					BG_State = "fighting"
					Z448_v[RoomID][31] = BG_State
				end
			end
		--戰場進行中	======================================================================
		elseif BG_State == "fighting" then
			--===== 檢查戰場是否符合結束條件
			local T1Score = GetScore( RoomID, 1 )
			local T2Score = GetScore( RoomID, 2 )
			if T1Score >= 2000 or T2Score >= 2000 then
				BG_State = "end"
				Z448_v[RoomID][31] = BG_State
			end
			if T1Score >= 1700 and Score1700Check[1] == false then
				Score1700Check[1] = true	--用來判斷1700分時的訊息 只要放送一次
				ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_6]", C_SYSTEM )	--正邁向勝利
			elseif T2Score >= 1700 and Score1700Check[2] == false then
				Score1700Check[2] = true	--用來判斷1700分時的訊息 只要放送一次
				ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_7]", C_SYSTEM )	--正邁向勝利
			end
			--
			local Team1Count = GetNumEnterTeamMember(RoomID,1)
			local Team2Count = GetNumEnterTeamMember(RoomID,2)
			if Team1Count == 0 or Team2Count == 0 then
				BG_State = "leave"
				Z448_v[RoomID][31] = BG_State
			end
			--===== 固定時間觸發相關檢查
			if BG_time % NpcLvUpTime == 0 then	--提升一次NPC重生設定等級
				local NPCLV = ReadRoleValue( HideUnit , EM_RoleValue_Register + 7 )
				if NPCLV < MaxLv then WriteRoleValue( HideUnit , EM_RoleValue_Register+7, ( NPCLV + 1 ) ) end
				DebugMsg( 0 , RoomID , "Up NPC rebirth level to ".. NPCLV )
			end
			
			if BG_time % PlayerAddExpTime == 0 then	--提升一次玩家經驗值
				local AllPlayer = SetSearchAllPlayer( RoomID )
				for i = 0 , AllPlayer do
					local TempPlayerID = GetSearchResult()
					local PlayerLV = ReadRoleValue( TempPlayerID , EM_RoleValue_LV )
					if PlayerLV < MaxLv then
						local BeforeEXP = ReadRoleValue( TempPlayerID , EM_RoleValue_EXP )
						WriteRoleValue( TempPlayerID , EM_RoleValue_EXP , BeforeEXP + PlayerAddExp )
					end
				end
			end
			--===== 搶旗相關檢查
			local Flag = Z448_v[RoomID][3]
			if FlagNowTimer == 0 then					--冷卻時間為0，表示該產生旗子於中央
				ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_3]", C_SYSTEM )	--戰旗已經出現在戰場中央
				DebugMsg( 0, RoomID, "Creat Flag" )
				BG_AA_FlagCreat(HideUnit)
				FlagNowTimer = -1
			elseif FlagNowTimer > 0 then					--旗子還在倒數
				FlagNowTimer = FlagNowTimer - 1
			elseif FlagNowTimer == -1 and CheckID(Flag) == false then	--檢查旗子是不是被奪走了
				FlagNowTimer = FlagReplaceTimer
			end

			--===== 補給點(寶箱)
			local MapPosNum = Z448_v[RoomID][2]
			local Treasure = ReadRoleValue(HideUnit, EM_RoleValue_Register+MapPosNum)
			if TreasureChangeTimer == 0 then							--表示補給點轉換CD結束，該出現了
				SetLandMark( RoomID, MapPosNum, 57 ) 					--57：中立圖案、58：銀翼堡壘(紅隊)圖案、59：獅心城寨(藍隊)圖案
				Show( Treasure, RoomID )							--讓玩家可以觸碰據點
				TreasureChangeTimer = -1
				TreasureTakeTeam = 0
				if MapPosNum == 6 then
		 			ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_1]", C_SYSTEM )	--支援物資已被送至星殞哨站
				else
					ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_2]", C_SYSTEM )	--支援物資已被送至銀月哨站
				end
				--DebugMsg( 0, RoomID, "Show Treasure "..MapPosNum )
			elseif TreasureChangeTimer > 0 then							--表示補給點還在轉換CD中
				TreasureChangeTimer = TreasureChangeTimer - 1
				--DebugMsg( 0, RoomID, "TreasureChangeTimer="..TreasureChangeTimer )
			elseif TreasureChangeTimer == -1 and ReadRoleValue( Treasure, EM_RoleValue_Register+2 ) == 1 then	--已經偵測到補給點被佔據，該進入CD了
				--DebugMsg( 0, RoomID, "take Treasure "..MapPosNum )
				WriteRoleValue(Treasure, EM_RoleValue_Register+2, 0)				--把Treasure的Register+2寫為還沒被奪取過
				TreasureChangeTimer = 60							--設定Treasure冷卻時間
				TreasureTakeTeam =  ReadRoleValue(Treasure, EM_RoleValue_Register+3)	--紀錄奪得Treasure的隊伍
				local TreasureTeamMember = GetTeamMemberList(RoomID, TreasureTakeTeam )
				for j= 1, table.getn(TreasureTeamMember) do					--給予據點所屬陣營的所有玩家錢
						AddRoleValue( TreasureTeamMember[j], EM_RoleValue_Money, TreasureGiveGold )
				end
				if MapPosNum == 5 then							--決定下次要讓哪個出現
					Z448_v[RoomID][2] = 6
				else
					Z448_v[RoomID][2] = 5
				end
			end
			--===== 野怪重生
			for c = 21, 27 do
				 if  MonsterTime[c] > 0 then							--重生時間>0 表示還在重生倒數
					MonsterTime[c] = MonsterTime[c] - 1
				elseif MonsterTime[c] == 0 then						--重生時間=0 將怪物重生
					DebugMsg( 0, RoomID, "--- Point"..c.." monster revive")
					local LV = ReadRoleValue(HideUnit, EM_RoleValue_Register+7)
					local Monster = CreateObjByFlag( MonsterType[c] , 781187 ,  c, 1 )
					WriteRoleValue( Monster, EM_RoleValue_LV, LV )			-- 設定怪物等級
					AddToPartition( Monster , RoomID)
					if c == 27 then
						SetPlot( Monster , "dead" , "BG_AA_MapBoss_Kill" , 0 )
						ScriptMessage( HideUnit, -1, 3, "[BG_AA_BF_0]", C_SYSTEM )	--[107369]已出現在[ZONE_GORGE_OF_GHOST]
					else
						SetPlot( Monster , "dead" , "BG_AA_Monster_Kill" , 0 )
					end	
					MonsterTable[c] = Monster
					MonsterTime[c] = -1
				elseif MonsterTime[c] == -1 then						--重生時間=-1 表示怪物還在，檢查怪物是否死亡
					if ReadRoleValue( MonsterTable[c], EM_RoleValue_IsDead ) == 1 then 	-- 1是死亡
						DebugMsg( 0, RoomID, "--- Point"..c.." monster has die")
						MonsterTime[c] = MonsterSpawnCD[c]				-- 確定死亡的話啟動重生倒數
					end	
				end
			end
	
		--戰場結束	======================================================================
		elseif BG_State == "end" or BG_State == "leave" then
			local T1Score = GetScore( RoomID, 1 )
			local T2Score = GetScore( RoomID, 2 )

			if BG_State == "end" then						--判斷是正常結束
				DebugMsg( 0, RoomID, "BG go End, Count Score, Who Win?" )
				local WinTeam 
				local LoseTeam 
				if T1Score >= 2000 and T2Score < 2000 then		--T1贏
					DebugMsg( 0, RoomID, "T1 Win !!" )
					ScriptMessage( HideUnit,  -1, 3, "[SC_THEWINNER][$SETVAR1=".."[BG_450_TEAM1_NAME]".."]" , C_SYSTEM )
					WinTeam = GetTeamMemberList(RoomID, 1 )
					LoseTeam = GetTeamMemberList(RoomID, 2 )
					EndBattleGround( RoomID, 1 )
					DesignLog( HideUnit , 121169 , "T1 Win" )
				elseif T2Score >= 2000 and T1Score < 2000 then		--T2贏
					DebugMsg( 0, RoomID, "T2 Win !!" )
					ScriptMessage( HideUnit,  -1, 3, "[SC_THEWINNER][$SETVAR1=".."[BG_450_TEAM2_NAME]".."]" , C_SYSTEM )
					WinTeam = GetTeamMemberList(RoomID, 2 )
					LoseTeam = GetTeamMemberList(RoomID, 1 )
					EndBattleGround( RoomID, 2 )
					DesignLog( HideUnit , 121169 , "T2 Win" )
				elseif T1Score >= 2000 and T2Score >= 2000 then		--平手
					DebugMsg( 0, RoomID, "2 team draw !!" )
					ScriptMessage( HideUnit,  -1, 3, "[BG_AA_RESULT_DRAW]" , C_SYSTEM )
					WinTeam = GetTeamMemberList(RoomID, -1 )
					EndBattleGround( RoomID, -1 )
					DesignLog( HideUnit , 121169 , "T1T2 DRAW" )
				end
				DesignLog( HideUnit , 121433 , "Game Time="..BG_time )
				for i = 1, table.getn(WinTeam) do							--先紀錄勝利隊伍的獎勵在戰場專用佔存值，在出戰場之後才會給予
					if LoseTeam ~= nil then									--平手就沒有loseTeam
						WriteRoleValue(WinTeam[i], EM_RoleValue_BG_Return_Value+0, 50)

					elseif LoseTeam == nil then
						WriteRoleValue(WinTeam[i], EM_RoleValue_BG_Return_Value+0, 35)						
					end
				end
				if LoseTeam ~= nil then									--平手就沒有loseTeam
					for i = 1, table.getn(LoseTeam) do							--先紀錄戰敗隊伍的獎勵在戰場專用佔存值，在出戰場之後才會給予
						WriteRoleValue(LoseTeam[i], EM_RoleValue_BG_Return_Value+0, 20)	
					end
				end
			else
				ScriptMessage( HideUnit,  -1, 3, "[SC_1V1PVP_EMLEAVEERROR]" , C_SYSTEM )	--對方隊伍離開，比賽結束
			end
			--
			Sleep(50)
			ScriptMessage( HideUnit,  -1, 3, "[BG_AA_END]" , C_SYSTEM )	--比賽已結束，將在兩分鐘後關閉
			Sleep(1200)
			CloseBattleGround(RoomID)
			return
		end
		--
		Sleep(10)
		if BG_State == "Prepare" then
			BG_time = BG_time - 1
		elseif BG_State == "fighting" or BG_State == "end" or BG_State == "leave" then
			BG_time = BG_time + 1
		end
		Z448_v[RoomID][30] = BG_time
	end
end

--==================================
--		戰場路障相關
--==================================
function BG_AA_CreateSoldiers( Camp , Route , HideUnit )	--戰場路障持續創建小兵，帶入：陣營、路線、中控器objID
	--Camp：5 = 獅心城寨(藍隊)、6 = 銀翼堡壘(紅隊)
	--Route：1 = 右路、2 = 中路、3 = 左路
	local Barrier = OwnerID()	--戰場路障
	local RoomID = ReadRoleValue( Barrier , EM_RoleValue_RoomID )
	local SoldierFlag = {}
	SoldierFlag[ 1 ] = { 781467 , 781466 , 781465 }	--銀翼堡壘(紅隊)小兵路線旗標
	SoldierFlag[ 2 ] = { 781470 , 781469 , 781468 }	--獅心城寨(藍隊)小兵路線旗標
	local SoldierType = {}
	SoldierType[ 1 ] = { 104980 , 104981 , 104980 , 104981 , 104980 }	--銀翼堡壘(紅隊)每次出兵NPC編號
	SoldierType[ 2 ] = { 105025 , 105026 , 105025 , 105026 , 105025 }	--獅心城寨(藍隊)每次出兵NPC編號
	local SoldierTime = 0	--紀錄此路小兵當前的重生時間
	local SoldierSpawnCD = 30	--設定生兵CD
	local SoldierTable = {}	--紀錄小兵的objID
	
	--校正陣營編號
	if Camp == 6 then	Camp = 1	--銀翼堡壘(紅隊)
	else						Camp = 2	--獅心城寨(藍隊)
	end

	while true do
		--小兵出兵判斷
		if Z448_v[ RoomID ][ 31 ] == "fighting" then	--檢查全域變數，是否為開戰狀態
			if  SoldierTime > 0 then							--此路小兵的重生時間 > 0 表示還在重生倒數
				SoldierTime = SoldierTime - 1
				
			elseif SoldierTime == 0 then						--此路小兵的生兵CD = 0 將小兵重生
				--DebugMsg( 0 , RoomID , "--- Camp".. Camp .." Route " .. Route .. " soldier revive" )
				
				for i = 1 , 5 do	--每路出5隻小兵
					local Soldier = CreateObjByFlag( SoldierType[ Camp ][ i ] , SoldierFlag[ Camp ][ Route ] , 0 , 1 )
					SetModeEx( Soldier , EM_SetModeType_Strikback , true )			--反擊
					SetModeEx( Soldier , EM_SetModeType_Obstruct , false )			--阻擋
					SetModeEx( Soldier , EM_SetModeType_Mark , true )			--標記
					SetModeEx( Soldier , EM_SetModeType_Move , true )			--移動
					SetModeEx( Soldier , EM_SetModeType_Searchenemy , true )		--索敵
					SetModeEx( Soldier , EM_SetModeType_HideName , true )			--名稱
					SetModeEx( Soldier , EM_SetModeType_ShowRoleHead , true )		--頭像框
					SetModeEx( Soldier , EM_SetModeType_Fight , true )			--可砍殺攻擊
					local LV = ReadRoleValue( HideUnit , EM_RoleValue_Register + 7 )	--從中控器上抓取當前的怪物重生等級
					WriteRoleValue( Soldier , EM_RoleValue_LV, LV )			-- 設定小兵等級
					if Camp == 1 then	SetRoleCampID( Soldier , 8 )	--設定小兵陣營：T1 - 銀翼堡壘(紅隊)
					else						SetRoleCampID( Soldier , 9 )	--設定小兵陣營：T2 - 獅心城寨(藍隊)
					end
					AddToPartition( Soldier , RoomID )
					AddBuff( Soldier , 503993 , 0 , 1 )	--生兵特效
					WriteRoleValue( Soldier , EM_RoleValue_IsWalk , 0  ) -- 將小兵移動方式設定為跑步
					SetPlot( Soldier , "dead" , "BG_AA_Soldier_Kill" , 0 )	--設定小兵死亡劇情
					CallPlot( Soldier , "BG_AA_Soldier_Move" , SoldierFlag[ Camp ][ Route ] )	--設定小兵延著路線的旗標移動
					SoldierTable[ i ] = Soldier	--寫入小兵的objID
					Sleep(10)
				end
				SoldierTime = SoldierSpawnCD	--此路小兵進入生兵倒數
			end
		end
		Sleep(10)
	end
end

function BG_AA_Soldier_Move( SoldierFlag )	--陣營小兵延著路線的旗標移動
	local Soldier = OwnerID()
	local FlagCount = GetMoveFlagCount( SoldierFlag ) - 1
	while true do
		if ReadRoleValue( Soldier , EM_RoleValue_AttackTargetID ) == 0 then	--非戰鬥才繼續執行
			for i = 0 , FlagCount do
				Lua_WaitMovetoFlag( Soldier , SoldierFlag , i , 0 )
			end
		end
		sleep( 5 ) 
	end
end

function BG_AA_TouchBarrier()	-- 玩家觸碰戰場路障劇情

	local Player = OwnerID()
	local Barrier = TargetID()
	local Dis = 120
	AdjustFaceDir( Player , Barrier , 0 ) --面向
	CallPlot( Player , "BG_AA_ThroughBarrier" , Player , Barrier , Dis )
end

function BG_AA_ThroughBarrier( Player , Barrier , Dis )	-- 觸碰戰場路障後傳送劇情，玩家、門、距離
	local PlayerCamp = GetRoleCampID( Player )	-- 讀取玩家陣營
	local BarrierCamp = GetRoleCampID( Barrier )	-- 讀取戰場路障陣營

	if ( PlayerCamp == BarrierCamp ) or ReadRoleValue( Player , EM_RoleValue_VOC ) == 0 then	-- 當玩家陣營與大門陣營符合或玩家職業為 gm 時
		local Pos = {}
		Pos[ "X" ] , Pos[ "Y" ] , Pos[ "Z" ] , Pos[ "Dir" ] = Lua_Hao_Return_Coordinate( Barrier ) -- 取得城門所在座標
		Pos[ "PlayerDir" ] = ReadRoleValue( Player , EM_RoleValue_Dir )	--玩家
		local Cal = ( math.pi / 180 ) * ( Pos[ "Dir" ] )	-- 弧度
		local Ca = Pos[ "PlayerDir" ] - Pos[ "Dir" ]	-- 玩家與大門相差角度
		if Ca < 0 then	Ca = Ca + 360
		end
		if Ca < 90 or Ca > 270 then
			SetPos( Player , Pos[ "X" ] + Dis * math.cos( Cal ) , Pos[ "Y" ] + 5 , Pos[ "Z" ] - Dis * math.sin( Cal ) , Pos[ "Dir" ] )
		else
			SetPos( Player , Pos[ "X" ] - Dis * math.cos( Cal ) , Pos[ "Y" ] + 5 , Pos[ "Z" ] + Dis * math.sin( Cal ) , Pos[ "Dir" ] + 180 )
		end
		AddBuff( Player , 503993 , 0 , 1 )	--傳送特效
	end
end

--==================================
--		玩家相關設定（起始、擊殺對手、重生）
--==================================
function BG_AA_PlayerSet(RoomID, Player)	--玩家起始設定
	local BG_time = Z448_v[RoomID][30]
	local BG_State = Z448_v[RoomID][31]
	
	AddRoleValue( Player, EM_RoleValue_Money, 300 )				--給予起始金錢
	if BG_time >= 60 and BG_State == "fighting" then
		AddRoleValue( Player, EM_RoleValue_Money, (BG_time/60)*160 )	--晚進戰場的玩家補償的金錢，遊戲時間每分鐘*160
		WriteRoleValue( Player, EM_RoleValue_LV, BG_time/60)		--設定等級
	end

	Z448_v[RoomID][Player] = 0					--建立專屬該玩家的技能上限判斷用的全域變數
	WriteRoleValue( Player, EM_RoleValue_VOC, 11 )		--主職寫為鬥棋士(11)
	WriteRoleValue( Player, EM_RoleValue_VOC_SUB, -1 )	--副職沒有(-1)

	--移除所有Buff	
	local CountBuff = BuffCount( Player )
	for i = 0, CountBuff do
		TempBuff = BuffInfo( Player , i , EM_BuffInfoType_BuffID )
		CancelBuff_NoEvent( Player, TempBuff )
	end

	--設定裝備
	local EqTable
	local RuneTable = { 521742, 521738, 521744, 521742, 521742, 521739, 521736, 521736, 521737, 0, 0, 521745, 521745, 521741, 521741, 521737}
	if GetTeamID( Player ) == 1 then
		EqTable = { 230828, 230823, 230826, 230822, 230827, 230834, 230825, 230824, 230833, 0, 0, 230829, 230830, 230831, 230832, 213836 }
	elseif GetTeamID( Player ) == 2 then
		EqTable = { 230815, 230810, 230813, 230809, 230814, 230821, 230812, 230811, 230820, 0, 0, 230816, 230817, 230818, 230819, 213837 }
	end
	for i = 1, 16 do
		if i ~= 10 or i ~= 11 then
			SetRoleEq_Player( Player , (i-1) , EqTable[i] )
			SetItemInfo( Player, EM_ItemPacketType_EQ, (i-1), EM_ItemValueType_RuneVolume, 1 )
		end
	end
--		-- Pos 物品位置
--	0	--頭部		230828	230815	521742
--	1	--手套		230823	230810	521738
--	2	--鞋子		230826	230813	521744
--	3	--上身		230822	230809	521742
--	4	--下身		230827	230814	521742
--	5	--披風		230834	230821	521739
--	6	--腰帶		230825	230812	521736
--	7	--肩甲		230824	230811	521736
--	8	--項鍊		230833	230820	521737
--	9	--彈藥
--	10	--遠程武器
--	11	--戒指 1	230829	230816	521745
--	12	--戒指 2	230830	230817	521745
--	13	--耳環 1	230831	230818	521741
--	14	--耳環 2	230832	230819	521741
end

function BG_AA_Revive()	--玩家重生劇情

	local Player = OwnerID()
	local TeamID = GetTeamID(Player)
	local X = 0
	local Y = 0
	local Z = 0
	local Dir = 0

	if TeamID == 1 then	--設定Team1復活位置
		X = -1688.5
		Y = 86
		Z = -1682.2
		Dir = 315
	else			--設定Team2復活位置
		X = 1686.5
		Y = 76.7
		Z = 1687.8
		Dir = 135
	end

	WriteRoleValue( Player , EM_RoleValue_X , X )
	WriteRoleValue( Player , EM_RoleValue_Y , Y )
	WriteRoleValue( Player , EM_RoleValue_Z , Z )
	WriteRoleValue( Player , EM_RoleValue_Dir , Dir )
	Lua_PVPAllFull( OwnerID() )	--補滿狀態
end

function BG_AA_PVPDead( KillerID , DeadID , ZoneID , ParallelZoneID , pRoomID )	--擊殺敵對玩家
	local RoomID = ReadRoleValue(KillerID, EM_RoleValue_RoomID)
	local KillerTeamID = GetTeamID(KillerID)
	local DeadLV = ReadRoleValue(DeadID, EM_RoleValue_LV)	--取得被擊殺玩家的等級
	
	if KillerID ~= DeadID then
		AddRoleValue( KillerID, EM_RoleValue_Money, DeadLV )	--給予對應玩家等級的賞金

		local Score = GetScore( RoomID , KillerTeamID )
		SetScore( RoomID , KillerTeamID , Score + 3 )
	end
end

--==================================
--			補給點相關
--==================================
--Treasure	Register+1 	用來當作阻擋多人同時開箱的開關
--		Register+2	用來記錄寶箱是不是已經被奪取了
--		Register+3	用來記錄奪取寶箱的是哪一隊
function BG_AA_TakeTreasure()				--補給點產生劇情
	local Player = OwnerID()
	local Treasure = TargetID()
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )

	--觸碰事件
	if ReadRoleValue( Treasure, EM_RoleValue_Register+1 ) == 0 then
		WriteRoleValue(Treasure, EM_RoleValue_Register+1, 1)
		BeginCastBarEvent( Player, Treasure, "[BG_AA_TAKETREASURE]", 80, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "BG_AA_TreasureCheck" )
	elseif ReadRoleValue( Treasure, EM_RoleValue_Register+1 ) == 1 then
		ScriptMessage( Player, Player, 3, "[BG_AA_TAKETREASURE_ERROR]", 0 )
		return
	end
end

function BG_AA_TreasureCheck(Obj,CheckResult)	--CastBar
	local Player = OwnerID()
	local Treasure = TargetID()

	if CheckResult > 0 then					--大於0是成功
		local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )
		local TeamID = GetTeamID(Player)
		local PID = ReadRoleValue(Treasure, EM_RoleValue_PID)

		SetLandMark( RoomID, PID, 0 )			--57：中立圖案、58：銀翼堡壘(紅隊)圖案、59：獅心城寨(藍隊)圖案、0：消失
		WriteRoleValue(Treasure, EM_RoleValue_Register+2, 1)
		WriteRoleValue(Treasure, EM_RoleValue_Register+3, TeamID)
		Hide( Treasure )
		if TeamID == 1 then
 			ScriptMessage( Treasure, -1, 3, "[BG_AA_T1_GOTBOX]", C_SYSTEM ) --[ZONE_SILVERWING_CITADEL]奪取了[121435]！全隊獲得100金幣！
			DesignLog( Player , 121435 , "T1 Take Treasure" )
		else
			ScriptMessage( Treasure, -1, 3, "[BG_AA_T2_GOTBOX]", C_SYSTEM ) --[ZONE_LIONHEART_RAMPART]奪取了[121435]！全隊獲得100金幣！
			DesignLog( Player , 121435 , "T2 Take Treasure" )
		end
	end
	WriteRoleValue(Treasure, EM_RoleValue_Register+1, 0)
	EndCastBar( Player, CheckResult )
end
--==================================
--			祕法瑰寶相關
--==================================
function BG_AA_Flag_touch()	--觸碰劇情
	local Player = OwnerID()
	local Flag = TargetID()
	local TeamID = GetTeamID(Player)
	local FlagCheck = ReadRoleValue( Flag, EM_RoleValue_Register1 )

	if FlagCheck == 1 then	--戰旗被關閉所以沒反應
		return
	end

	BeginCastBarEvent( Player, Flag, "[BG_AA_TAKETREASURE]", 80, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "BG_AA_FlagCheck" )
end

function BG_AA_FlagCheck(Obj,CheckResult)
	local Player = OwnerID()
	local Flag = TargetID()
	local TeamID = GetTeamID(Player)

	if CheckResult > 0 then
		if TeamID == 1 then
	 		ScriptMessage( Flag, -1, 3, "[BG_AA_T1_TAKEFLAG]", C_SYSTEM )	--奪取了戰旗！
			AddBuff( Player, 507919, 0, -1 )			--給予玩家奪旗的Buff - 銀翼堡壘(紅隊)
		else
			 ScriptMessage( Flag, -1, 3, "[BG_AA_T2_TAKEFLAG]", C_SYSTEM )	--奪取了戰旗！
			 AddBuff( Player, 500138, 0, -1 )			--給予玩家奪旗的Buff - 獅心城寨(藍隊)
		end
		Hide( Flag )						--隱藏戰旗物件
		WriteRoleValue( Flag, EM_RoleValue_Register1, 1 )	--關閉戰旗不給點
		WriteRoleValue( Flag, EM_RoleValue_Register2, Player )	--把持旗者記錄在 EM_RoleValue_Register2
		BeginPlot( Flag, "BG_AA_Flager_time_check", 0 )	--開啟定時檢查，檢查持旗者是否離線或消失
	end
	EndCastBar( Player, CheckResult )
end

function BG_AA_Flager_Die()			--持旗者死亡，Buff消失
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID)
	local Flag = Z448_v[RoomID][3] 
	Show(Flag, RoomID)
	WriteRoleValue( Flag, EM_RoleValue_Register1, 0 )	--打開戰旗給點
end

function  BG_AA_Flager_time_check()	--檢查玩家是否離線或是消失
	local Flag = OwnerID()
	local Player = ReadRoleValue( Flag, EM_RoleValue_Register2 )
	
	while true do
		if CheckID( Player ) == false then
			local RoomID = ReadRoleValue(Flag, EM_RoleValue_RoomID)
			Show(Flag, RoomID)
			WriteRoleValue( Flag, EM_RoleValue_Register1, 0 )	--打開戰旗給點
			return
		end
		Sleep( 10 )
	end
end

function BG_AA_FlagCreat(HideUnit)
	local RoomID = ReadRoleValue( HideUnit, EM_RoleValue_RoomID )
	DebugMsg( 0, RoomID, "Creat Flag function" )
	local Flag = CreateObjByFlag( 121434 , 781187 , 0 , 1 ) 
	SetModeEx( Flag, EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( Flag, EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
	SetModeEx( Flag, EM_SetModeType_Obstruct, false )			--阻擋
	SetModeEx( Flag, EM_SetModeType_Mark, true )			--標記
	SetModeEx( Flag, EM_SetModeType_Move, false )			--移動
	SetModeEx( Flag, EM_SetModeType_Searchenemy, false )		--索敵
	SetModeEx( Flag, EM_SetModeType_HideName, true )			--名稱
	SetModeEx( Flag, EM_SetModeType_ShowRoleHead, false )		--頭像框
	SetModeEx( Flag, EM_SetModeType_Fight , false )			--可砍殺攻擊
	SetModeEx( Flag, EM_SetModeType_Drag , true )			--阻力
	--
	SetPlot( Flag , "touch" , "BG_AA_Flag_touch" , 50 )	--設定觸碰劇情
	SetRoleCampID( Flag, 2 )			--預設為怪物陣營
	AddToPartition(Flag , RoomID)
	Z448_v[RoomID][3] = Flag
end
--==================================
--			技能相關
--==================================
function BG_AA_UseCheck(KeyItem)	--在使用前確認
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID)
	DebugMsg( 0, RoomID, "Learn Skill num="..Z448_v[RoomID][Player] )
	if Z448_v[RoomID][Player] >= 6 then	--判斷玩家是否擁有超過6個技能
		ScriptMessage( Player, Player, 1, "[BG_AA_REMOVESKILL_WARNING]", 0 )
		return false
	elseif CheckFlag( Player, KeyItem ) == true then	--判斷玩家是否擁有超過6個技能
		ScriptMessage( Player, Player, 1, "[BG_AA_REMOVESKILL_ALREADYHAVE]", 0 )
		return false
	else
		Z448_v[RoomID][Player] = Z448_v[RoomID][Player] + 1
		return true
	end
end

function BG_AA_SkillScroll(ItemNum)	--使用技能卷軸劇情
	local Player = OwnerID()
	--下面這邊是直接用編號為連號的特性，直接計算物品編號並套用到重要物品
	local CheckNum = ItemNum - 241849
	if CheckNum <= 30 then
		SetFlag(Player, (547049+CheckNum), 1)
	elseif CheckNum >= 31 then
		SetFlag(Player, (547066+CheckNum), 1)		
	end
	--特殊處理
	if ItemNum == 241885 then
		AddBuff( Player, 623599, 0, -1 )
	elseif ItemNum == 241886 then
		AddBuff( Player, 623601, 0, -1 )
	end
	--
	CastSpell(Player, Player, 491010 )	--特效用
	DesignLog( Player , 121440 , "ItemNum="..ItemNum )
end

function BG_AA_RemoveSkill_Dialog()			--跟NPC對話移除技能
	local Player = OwnerID()
	local NPC = TargetID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID)
	local SkillNum = 0

	SetSpeakDetail(Player,"[BG_AA_REMOVESKILL_NPC]")
	for i= 1, 60 do
		local KeyItem
		if i <= 30 then KeyItem = 547049+i else KeyItem = 547066+i end
		if CheckFlag( Player, KeyItem ) == true then
			local Spell = 499676+i
			AddSpeakOption(Player, NPC, "["..Spell.."]","BG_AA_RemoveSkill_Run("..KeyItem..")", 0)
			SkillNum = SkillNum + 1
			if SkillNum == Z448_v[RoomID][Player] then
				break
			end
		end
	end	
end

function BG_AA_RemoveSkill_Run(KeyItem)	--keyitem 547050~547079, 547097~547126
	local Player = OwnerID()
	local RoomID = ReadRoleValue(Player, EM_RoleValue_RoomID)
	local Spell = 0

	if  KeyItem <= 547079 then
		Spell = 499676 + (KeyItem - 547049)
	else
		Spell = 499706 + (KeyItem - 547096 )
	end
	SetFlag( Player, KeyItem, 0 )
	Z448_v[RoomID][Player] = Z448_v[RoomID][Player] - 1

	local SkillString = "["..Spell.."]"
	ScriptMessage( Player, Player, 3, "[BG_AA_REMOVESKILL_MESSAGE][$SETVAR1="..SkillString.."]", 0 )
	
	AddBuff( Player, 623735, 0, 2 )	--特效用
	CloseSpeak( Player )
	DesignLog( Player , 121439 , "KeyItem="..KeyItem )
end

--==================================
--			擊殺NPC與破壞建築相關
--==================================
function BG_AA_Monster_Kill()	--擊殺野怪
	local Gold = ReadRoleValue( OwnerID() , EM_RoleValue_LV)	-- 讀取怪物等級
	AddRoleValue( TargetID() , EM_RoleValue_Money, Gold )	-- 給予對應怪物等級的賞金
end

function BG_AA_MapBoss_Kill()	--擊殺禁錮邪靈
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local PlayerTeamID = GetTeamID( TargetID() )
	local PlayerTeamMember = GetTeamMemberList( RoomID , PlayerTeamID )
	
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID , PlayerTeamID , ( Score + 150 ) )	-- 給予150點積分
	
	for i = 1 , #PlayerTeamMember do
		AddRoleValue( PlayerTeamMember[ i ] , EM_RoleValue_Money , 150 )	--給予所屬陣營的所有玩家150點賞金
	end

	if PlayerTeamID == 1 then	ScriptMessage( OwnerID() , -1 , 3 , "[BG_AA_T1_KILLBOSS]" , C_SYSTEM )	--銀翼堡壘擊殺了禁錮邪靈！全隊獲得150金幣！
	else									ScriptMessage( OwnerID() , -1 , 3 , "[BG_AA_T2_KILLBOSS]" , C_SYSTEM )	--獅心城寨擊殺了禁錮邪靈！全隊獲得150金幣！
	end
	
end

function BG_AA_Soldier_Kill()	--擊殺陣營小兵
	local Gold = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- 讀取陣營小兵等級
	AddRoleValue( TargetID() , EM_RoleValue_Money , Gold )	-- 給予對應小兵等級的賞金
end

function BG_AA_BarrierDeath()	--擊殺戰場路障
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local PlayerTeamID = GetTeamID( TargetID() )
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID , PlayerTeamID, (Score + 200 ) )	-- 給予200點積分

	local Bonfire = CreateObjByObj( 114740 , OwnerID() , 1 )	-- 在城門上建立隱藏火堆物件，播放城門被摧毀後，持續燃燒的動作
	SetModeEx( Bonfire , EM_SetModeType_Fight , false )	-- 不可砍殺
	SetModeEx( Bonfire , EM_SetModeType_HideName , true )	--隱藏名稱
	SetModeEx( Bonfire , EM_SetModeType_Mark , false )	--標記
	CallPlot( Bonfire , "BG_AA_DelObj" , Bonfire , 35 )	--  讓火堆在設定秒數後刪除自己。
end

function BG_AA_TowersDeath()	--擊殺防衛箭塔
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local PlayerTeamID = GetTeamID( TargetID() )
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID , PlayerTeamID, (Score + 100 ) )	-- 給予100點積分
end

function BG_AA_Guard_Kill()	--擊殺守衛
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID)
	local PlayerTeamID = GetTeamID( TargetID() )
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID , PlayerTeamID , ( Score + 150 ) )	-- 給予150點積分
end

function BG_AA_Flag_Dead()	--擊殺據點
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID)
	local PlayerTeamID = GetTeamID( TargetID() )
	local Score = GetScore( RoomID , PlayerTeamID )
	SetScore( RoomID, PlayerTeamID , ( Score + 2000) )	-- 給予2000點積分
	--
	local Bonfire = CreateObjByObj( 114740 , OwnerID() , 1 )	-- 在據點建立隱藏火堆物件，播放被摧毀後持續燃燒的動作
	SetModeEx( Bonfire , EM_SetModeType_Fight , false )	-- 不可砍殺
	SetModeEx( Bonfire , EM_SetModeType_HideName , true )	--隱藏名稱
	SetModeEx( Bonfire , EM_SetModeType_Mark , false )	--標記
	CallPlot( Bonfire , "BG_AA_DelObj" , Bonfire , 35 )	--  讓火堆在設定秒數後刪除自己。
	Sleep( 35 )
	DelObj( ReadRoleValue( FightingPoint , EM_RoleValue_Register + 1 ) )	--移除裝飾水晶
end

function BG_AA_DelObj( Obj , Time )	--刪除火堆燃燒劇情
	Sleep( Time )
	DelObj( Obj )
end