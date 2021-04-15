
local g_Flag = {};
g_Flag.ID = 781402;
g_Flag.CreateDoorNum = 0;	-- 門的產生位置
g_Flag.CreateMonsterNum = 0;	-- 各階段怪物的產生位置
g_Flag.CreateUnLockRuneNum = { Min = 6, Max = 30 };	-- 解鎖符文的亂數產生位置
g_Flag.CreateTreasureNum = 31;	-- 寶箱的產生位置

local g_Time = {};	-- 時間
--g_Time.CreateUnLockRuneDelayTime = 1;	-- 測試加快用：每階段開始出現解鎖符文的延遲時間( 單位:秒 )
--g_Time.NextStepDelayTime = 1;	-- 測試加快用：每階段進入下一階段前出怪的延遲時間( 單位:秒 )
g_Time.CreateUnLockRuneDelayTime = 20;	-- 每階段開始出現解鎖符文的延遲時間( 單位:秒 )
g_Time.NextStepDelayTime = 10;	-- 每階段進入下一階段前出怪的延遲時間( 單位:秒 )
g_Time.CreateMonsterTickTime = 10;	-- 各階段每次生成怪物的間隔時間( 單位:秒 )

g_Time.KillCaptain = {};	-- 開戰後直至馬薩里被自殺的時間
g_Time.KillCaptain[951] = 300;
g_Time.KillCaptain[169] = 480;
g_Time.KillCaptain[170] = 360;
g_Time.KillCaptain[171] = nil;

local g_Msg = {};
g_Msg.OverPower = "[SC_108684_03]";	-- 再不加快腳步，敵人將會越來越難應付！
g_Msg.TimeOut = "[$MUTE]".."[SC_108684_RAID]";	-- 拖了太久時間，[108684]已經撐不下去了……
g_Msg.MissionFail = "[SC_108684_RESET]";	-- 營救失敗！
g_Msg.MissionComplete = "[SC_108684_DEATH]";	-- 營救成功！
g_Msg.KeyAppears = "[SC_108684_04]";	-- 解鎖的關鍵鑰匙出現了！
g_Msg.KeyUseComplete = "[$MUTE]".."[SC_108684_01]";	-- [$VAR1]已經解開了[$VAR2]結界鎖。
g_Msg.KeyUseFail = "[SC_108684_02]";	-- 沒有相對應的符文可以解開結界鎖
g_Msg.Saved = "[EM_421042_2]";	-- 終於得救了，謝謝你。

local g_Step = {};	-- 記錄各層當前攻略的階段

local g_TouchRune = {};	-- 監控是否有目標碰觸解鎖符文
g_TouchRune.CreateStatus = {};	-- 各層當前是否已生成解鎖符文
g_TouchRune.Guid = {};	-- 各層當前碰觸解鎖符文的玩家
g_TouchRune.BuffID = {};	-- 各層當前碰觸解鎖符文後獲得的符文編號

local g_Buff = {};
g_Buff.RuneList = {};	-- 各層當前符文 Buff 的清單
g_Buff.BindShelter = 500343;	-- 禁錮結界，馬里薩產生時掛載的 Buff
g_Buff.LockTarget = 622105;	-- 鎖定目標，不因仇恨值而改變目標
g_Buff.Fury = 625468;	-- 體能響應，魯莽的庫柏獲得的強化效果
g_Buff.FuryEffectRange = 30;	-- 體能響應觸發的範圍

g_Buff.Rune = { 625443, 625444, 625445, 625446, 625447 };	-- 玩家身上的符文Buff ( 火焰、寒冰、活力、虛空、時光 )
g_Buff.Shelter = { 625448, 625449, 625450, 625451, 625452 };	-- 符文機關身上的符文對應結界 ( 火焰、寒冰、活力、虛空、時光 )

local g_Obj = {};
g_Obj.Ctrl = {};	-- 記錄各層的中控器
g_Obj.ShelterList = {};	-- 記錄各層的符文機關狀態
g_Obj.UnlockList = {};	-- 記錄各層的解鎖符文
g_Obj.LockRune = 123511;	-- 符文機關
g_Obj.UnlockRune = 123515;	-- 解鎖符文
g_Obj.DoorID = 106251;	-- 門
g_Obj.Door = {};	-- 記錄各層的門

g_Obj.Treasure = {};	-- 寶箱
g_Obj.Treasure[951] = 108616;
g_Obj.Treasure[169] = 108616;	-- 困難
g_Obj.Treasure[170] = 106154;	-- 普通
g_Obj.Treasure[171] = 106155;	-- 簡單

g_Obj.Boss = {}	-- 馬薩里隊長
g_Obj.Boss[951] = 106984;
g_Obj.Boss[169] = 108684;	-- 困難
g_Obj.Boss[170] = 108880;	-- 普通
g_Obj.Boss[171] = 108886;	-- 簡單

g_Obj.Captain = {};	-- 記錄各層的馬薩里隊長
g_Obj.Monster = {};	-- 記錄各層產出的Npc
g_Obj.Kobolds = {};	-- 監控場上的魯莽庫柏，重生機制與增加攻擊力機制。
g_Obj.Kobolds.MaxCount = 20;	-- 場上魯莽庫柏的產生上限

g_Obj.Step = {};	-- Npc清單
g_Obj.Step[1] = {};	-- 階段 1 產出Npc ( 狡詐的獄卒、強壯的獄卒 )
g_Obj.Step[1][951] = { 106985, 106986 };
g_Obj.Step[1][169] = { 108660, 108661 };	-- 困難
g_Obj.Step[1][170] = { 108875, 108876 };	-- 普通
g_Obj.Step[1][171] = { 108881, 108882 };	-- 簡單

g_Obj.Step[2] = {}	-- 階段 2 產出Npc ( 魯莽的庫柏 )
g_Obj.Step[2][951] = { 106987, 106987 };
g_Obj.Step[2][169] = { 108663, 108663 };	-- 困難
g_Obj.Step[2][170] = { 108878, 108878 };	-- 普通
g_Obj.Step[2][171] = { 108884, 108884 };	-- 簡單

g_Obj.Step[3] = {}	-- 階段 3 產出Npc ( 黑牢門衛 )
g_Obj.Step[3][951] = { 106990 };
g_Obj.Step[3][169] = { 108662 };	-- 困難
g_Obj.Step[3][170] = { 108877 };	-- 普通
g_Obj.Step[3][171] = { 108883 };	-- 簡單

g_Obj.Step[4] = {}	-- 階段 4 產出Npc ( 黑牢拷問者 )
g_Obj.Step[4][951] = { 106988 };
g_Obj.Step[4][169] = { 108664 };	-- 困難
g_Obj.Step[4][170] = { 108879 };	-- 普通
g_Obj.Step[4][171] = { 108885 };	-- 簡單

g_Obj.Step[5] = {}	-- 階段 5 產出Npc ( 階段1 ~ 階段4 每隻怪物 )
g_Obj.Step[5][951] = { 106985, 106986, 106987, 106990, 106988 };
g_Obj.Step[5][169] = { 108660, 108661, 108663, 108662, 108664 };	-- 困難
g_Obj.Step[5][170] = { 108875, 108876, 108878, 108877, 108879 };	-- 普通
g_Obj.Step[5][171] = { 108881, 108882, 108884, 108883, 108885 };	-- 簡單

local function DelAllObj( Ctrl, Captain, Room, StopDelMonster )	-- 刪除物件劇情

--	DebugMsg( 0, 0, "物件刪除劇情" );
	-- 刪除玩家身上的符文Buff
	if g_TouchRune.Guid[Room] and CheckID( g_TouchRune.Guid[Room] ) then
		CancelBuff_NoEvent( g_TouchRune.Guid[Room], g_TouchRune.BuffID[Room] );
	end

	-- 刪除馬薩里隊長
	if CheckID( g_Obj.Captain[Room] ) then
		DelObj( g_Obj.Captain[Room] );
	end

	-- 刪除符文機關
	for i = 1, #g_Obj.ShelterList[Room] do
		if CheckID( g_Obj.ShelterList[Room][i] ) then
			DelObj( g_Obj.ShelterList[Room][i] );
		end
	end
	
	-- 刪除解鎖符文
	if g_Obj.UnlockList[Room] and CheckID( g_Obj.UnlockList[Room] ) then
		DelObj( g_Obj.UnlockList[Room] );
	end

	-- 刪除大門
	if g_Obj.Door[Room] and CheckID( g_Obj.Door[Room] ) then
		DelObj( g_Obj.Door[Room] );
	end

	-- 刪除怪物
	if StopDelMonster then
		return
	end

	for i = 1, #g_Obj.Monster[Room] do
		if CheckID( g_Obj.Monster[Room][i] ) then
			DelObj( g_Obj.Monster[Room][i] );
		end
	end
end

local function CreateAllObj( Ctrl, Zone, Room )	-- 產生馬薩里隊長、符文機關、宣告大門

--	DebugMsg( 0, 0, "物件產生劇情" );
	local CtrlPos = Vector_GetRolePos( Ctrl );
	local CtrlDir = ReadRoleValue( Ctrl, EM_RoleValue_Dir );
--	local VecDir = Vector_DirToVector( CtrlDir + 90 );
--	local CaptainPos = CtrlPos + VecDir * -25;

	-- 建立馬薩里隊長
--	local Captain = CreateObj( g_Obj.Boss[Zone], CaptainPos.X, CaptainPos.Y, CaptainPos.Z, CtrlDir, 1 );
	local Captain = CreateObj( g_Obj.Boss[Zone], CtrlPos.X, CtrlPos.Y, CtrlPos.Z, CtrlDir, 1 );
	SetModeEx( Captain, EM_SetModeType_Strikback, false );	-- 反擊
	SetModeEx( Captain, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( Captain, EM_SetModeType_Move, false );	-- 移動
	AddBuff( Captain, g_Buff.BindShelter, 0, -1 );
	AddToPartition( Captain, Room );
	g_Obj.Captain[Room] = Captain;
	CallPlot( Captain, "Instance_32_Boss2_Init", Captain, Ctrl, Zone, Room );

	-- 建立符文機關
	g_Obj.ShelterList[Room] = {};
--	DebugMsg( 0, 0, "符文機關 table = "..tostring(#g_Buff.Shelter) );
	for i = 1, #g_Buff.Shelter do
		local FlagPos = {};
		local FlagDir
		FlagPos.X, FlagPos.Y, FlagPos.Z, FlagDir = DW_Location( g_Flag.ID, i );
		local LockRune = CreateObj( g_Obj.LockRune, FlagPos.X, FlagPos.Y, FlagPos.Z, 0, 1 );
		SetModeEx( LockRune, EM_SetModeType_ShowRoleHead, true );	-- 頭像框
		SetModeEx( LockRune, EM_SetModeType_NotShowHPMP, true );	-- 血條
		SetModeEx( LockRune, EM_SetModeType_Obstruct, true );	-- 阻擋
		AddBuff( LockRune, g_Buff.Shelter[i], 0, -1 );
		WriteRoleValue( LockRune, EM_RoleValue_PID, i );	-- 方便之後辨識用
		table.insert( g_Obj.ShelterList[Room], LockRune );	-- 讓符文機關在開戰後才可以被點擊
		AddToPartition( LockRune, Room );
	end

	-- 宣告門
	g_Obj.Door[Room] = false;

	-- 重置各層副本怪物清單
	g_Obj.Monster[Room] = {};
end

function Npc_108660_Init()	-- 狡詐的獄卒、強壯的獄卒 產生劇情

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	if g_Obj.Captain[Room] and CheckID( g_Obj.Captain[Room] ) and ReadRoleValue( g_Obj.Captain[Room], EM_RoleValue_IsDead ) == 0 then
		AddBuff( Owner, g_Buff.LockTarget, 0, - 1 );
		SetAttack( Owner, g_Obj.Captain[Room] );
	end
end

function Npc_108663_Dead()	-- 魯莽的庫柏 死亡劇情

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	-- 將自己從魯莽的庫柏清單中移除
	for i = #g_Obj.Kobolds[Room], 1, -1 do
		if g_Obj.Kobolds[Room][i] == Owner then
			table.remove( g_Obj.Kobolds[Room], i );
			break;
		end
	end
--	DebugMsg( 0, 0, "庫柏存活數量 = "..#g_Obj.Kobolds[Room] );
	if g_Step[Room] < 6 and CheckID( g_Obj.Captain[Room] ) and ReadRoleValue( g_Obj.Captain[Room], EM_RoleValue_IsDead ) == 0 then
	--	DebugMsg( 0, 0, "庫柏總數 = "..#g_Obj.Kobolds[Room] );
		local ObjID = ReadRoleValue( Owner, EM_RoleValue_OrgID );
		local MonsterPos = {};
		local MonsterDir = 0;
		MonsterPos.X, MonsterPos.Y, MonsterPos.Z, MonsterDir = DW_Location( g_Flag.ID, g_Flag.CreateMonsterNum );
	--	DebugMsg( 0, 0, "生怪階段 : "..g_Step[Room]..", 產出新庫柏 = "..ObjID );
		local Monster = CreateObj( ObjID, MonsterPos.X, MonsterPos.Y, MonsterPos.Z, MonsterDir, 1 );
		AddToPartition( Monster, Room );

		-- 20151130 阿浩：新版防駭客機制，掛載於戰鬥開始
		Hao_antiHacker_Fight( 2, Monster );

		SetAttack( Monster, g_Obj.Captain[Room] );
		table.insert( g_Obj.Monster[Room], Monster );	-- 加進怪物清單
	end
end

function Npc_108663_Init()	-- 魯莽的庫柏 產生劇情

	local Owner = OwnerID();
	local Zone = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	table.insert( g_Obj.Kobolds[Room], Owner );	-- 加進魯莽的庫柏專屬清單

	CallPlot( Owner, "Npc_108663_CheckFury", Owner, Zone, Room );
end

function Npc_108663_CheckFury( Owner, Zone, Room )

	while true do
		Sleep(10);
		-- 對彼此距離 30 內的庫柏施放體能響應
		for i = #g_Obj.Kobolds[Room], 1, -1 do
			if GetDistance( g_Obj.Kobolds[Room][i], Owner ) < g_Buff.FuryEffectRange then
				AddBuff( Owner, g_Buff.Fury, 0, -1 );
				break;
			end
		end
	end
end

function Instance_32_Boss2_CtrlObj_Init()	-- 中控器(104607)起始劇情

	local Ctrl = OwnerID();
	local Zone = ReadRoleValue( Ctrl, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Ctrl, EM_RoleValue_RoomID );
	g_Obj.Ctrl[Room] = Ctrl;
	CreateAllObj( Ctrl, Zone, Room );
end

function Instance_32_Boss2_Init( Captain, Ctrl, Zone, Room )	-- 馬薩里隊長 產生劇情

	-- 重置指定層資料
	g_Step[Room] = 1;	-- 攻略階段
	g_TouchRune.Guid[Room] = false;	-- 記錄當前碰觸解鎖符文的玩家
	g_TouchRune.BuffID[Room] = false;	-- 記錄當前碰觸解鎖符文後獲得的符文編號
	g_TouchRune.CreateStatus[Room] = false;	-- 記錄目前的解鎖符文生成狀態 ( true = 生成， false = 未生成 )
	g_Buff.RuneList[Room] = {};	-- 記錄當前未解鎖的符文清單
	g_Obj.Kobolds[Room] = {};	-- 記錄當前生成的魯莽的庫柏

	for i = 1, #g_Buff.Rune do
		table.insert( g_Buff.RuneList[Room], g_Buff.Rune[i] );
	end

	while true do
		local PlayerList = SearchRangePlayer( Captain, 100 );
		if #PlayerList ~= 0 then
			for i = 0, #PlayerList-1 do
				if ReadRoleValue( PlayerList[i], EM_RoleValue_IsDead ) == 0 then
					CallPlot( Ctrl, "Instance_32_Boss2_BeginFight", Ctrl, Captain, PlayerList[i], Zone, Room );
					return;
				end

			end
		end
		Sleep(10);
	end
--	SetPlot( Captain, "range", "Instance_32_Boss2_BeginFight", 100 );	-- 使用觸碰劇情時，會有在範圍內無法重新觸發的問題
end

function Instance_32_Boss2_BeginFight( Ctrl, Captain, Player, Zone, Room )	-- 由中控器執行戰鬥開始劇情

	-- 開啟所有符文機關的觸碰劇情
	for i = 1, #g_Obj.ShelterList[Room] do
		SetPlot( g_Obj.ShelterList[Room][i], "touch", "Instance_32_LockRune_Plot", 30 );
	end

	local Counter = {};	-- 計數器
	Counter.GameTime = 0;	-- 遊戲時間
	Counter.CreateMonster = 0;	-- 每階段累計出怪的時間
	Counter.CreateUnlockRune = 0;	-- 每階段累計產出解鎖符文前的時間
	Counter.NextStepDelayTime = 0;	-- 每階段累計產至下階段前的延遲時間

	local Survivalers = {};	-- 生存的玩家數量
	local Step = g_Step[Room];	-- 記錄階段，用以生怪判斷

	-- 生成門
	local DoorPos = {};
	local DoorDir;
	DoorPos.X, DoorPos.Y, DoorPos.Z, DoorDir = DW_Location( g_Flag.ID, g_Flag.CreateDoorNum );
	g_Obj.Door[Room] = CreateObj( g_Obj.DoorID, DoorPos.X, DoorPos.Y, DoorPos.Z, DoorDir, 1 );
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Fight, false );	-- 砍殺
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Strikback, false );	-- 反擊
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Searchenemy, false );	--索敵
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Move, false );	-- 移動
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Mark, false );	-- 標記
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_ShowRoleHead, false );	-- 頭像框
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_NotShowHPMP, true );	-- 血條
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Obstruct, true );	-- 阻擋
	AddToPartition( g_Obj.Door[Room], Room );

	while g_Step[Room] < 6 do

		Sleep(10);
		Counter.GameTime = Counter.GameTime + 1;

		-- 判斷生怪
		if Step == g_Step[Room] then	-- 生怪
			Counter.CreateMonster = Counter.CreateMonster + 1;
			if Counter.CreateMonster%g_Time.CreateMonsterTickTime == 1 then
			--	DebugMsg( 0, 0, "生怪階段 : "..g_Step[Room] );
				for i = 1, #g_Obj.Step[g_Step[Room]][Zone] do
					if ( Step == 2 or ( Step == 5 and i == 3 ) ) and #g_Obj.Kobolds[Room] >= g_Obj.Kobolds.MaxCount then	-- 監控場上的庫柏是否已達上限
						DebugMsg( 0, 0, "魯莽的庫柏，當前數量 = "..#g_Obj.Kobolds[Room]..", 生成上限 = "..g_Obj.Kobolds.MaxCount );
						-- 不進行任何事情
					else
						local MonsterPos = {};
						local MonsterDir = 0;
						MonsterPos.X, MonsterPos.Y, MonsterPos.Z, MonsterDir = DW_Location( g_Flag.ID, g_Flag.CreateMonsterNum );
						DebugMsg( 0, 0, "階段 : "..g_Step[Room]..", 當前階段累計時間："..Counter.CreateMonster..", 產出怪物編號："..g_Obj.Step[g_Step[Room]][Zone][i] );
						local Monster = CreateObj( g_Obj.Step[g_Step[Room]][Zone][i], MonsterPos.X, MonsterPos.Y, MonsterPos.Z, MonsterDir, 1 );
						AddToPartition( Monster, Room );

						-- 20151130 阿浩：新版防駭客機制，掛載於戰鬥開始
						Hao_antiHacker_Fight( 2, Monster );

						SetAttack( Monster, Captain );
						table.insert( g_Obj.Monster[Room], Monster );
					end
					Sleep(1);
				end
			end
		else	-- 更換階段，暫停生怪
			Counter.NextStepDelayTime = Counter.NextStepDelayTime + 1;
			DebugMsg( 0, 0, "變更階段，暫停生怪延遲時間 = "..Counter.NextStepDelayTime );
			if Counter.NextStepDelayTime%g_Time.NextStepDelayTime == 0 then
				Counter.CreateMonster = 0;
				Counter.NextStepDelayTime = 0;
				Step = g_Step[Room];
			end
		end

		-- 時間到期時重置
		if g_Time.KillCaptain[Zone] and Counter.GameTime > g_Time.KillCaptain[Zone] then
			DebugMsg( 0, 0, "時間歸零, 執行刪除與重置" );
			ScriptMessage( Ctrl, -1, 2, g_Msg.TimeOut, 2 );
			KillID( Captain, Captain );
			Sleep(20);
			DelAllObj( Ctrl, Captain, Room );
			Sleep(50);
			CreateAllObj( Ctrl, Zone, Room );
			return
		end

		-- 馬薩里隊長死亡時重置
		if ReadRoleValue( Captain, EM_RoleValue_IsDead ) == 1 then
			DebugMsg( 0, 0, "隊長死亡, 執行刪除與重置" )
			ScriptMessage( Ctrl, -1, 2, g_Msg.MissionFail, 2 );
			Sleep(20);
			DelAllObj( Ctrl, Captain, Room );
			Sleep(50);
			CreateAllObj( Ctrl, Zone, Room );
			return
		end

		-- 範圍內沒有玩家時重置
		local Players = SearchRangePlayer( Ctrl, 250 );
	--	DebugMsg( 0, 0, "Players = "..#Players );
		if #Players == 0 then
			DebugMsg( 0, 0, "範圍內玩家 = 0, 執行刪除與重置" );
			DelAllObj( Ctrl, Captain, Room );
			Sleep(50);
			CreateAllObj( Ctrl, Zone, Room );
			return
		end

		Survivalers = {};
		for i = 0, #Players-1 do
			if ReadRoleValue( Players[i], EM_RoleValue_IsDead ) == 0 then
				table.insert( Survivalers, Players[i] );
			end
		end

		-- 範圍內沒有生存的玩家時重置
	--	DebugMsg( 0, 0, "Survivalers = "..#Survivalers );
		if #Survivalers == 0 then
			DebugMsg( 0, 0, "範圍內生存玩家 = 0, 執行刪除與重置" )
			ScriptMessage( Ctrl, -1, 2, g_Msg.MissionFail, 2 );
			DelAllObj( Ctrl, Captain, Room );
			Sleep(50);
			CreateAllObj( Ctrl, Zone, Room );
			return
		end

		-- 當解鎖符文尚未產生時
		if not g_TouchRune.CreateStatus[Room] and Step == g_Step[Room] then
			Counter.CreateUnlockRune = Counter.CreateUnlockRune + 1
		--	DebugMsg( 0, 0, "UnlockRuneTime = "..Counter.CreateUnlockRune );
			if Counter.CreateUnlockRune%g_Time.CreateUnLockRuneDelayTime == 0 and #g_Buff.RuneList[Room] > 0 then
				Counter.CreateUnlockRune = 0;
				g_TouchRune.CreateStatus[Room] = true;
				g_TouchRune.BuffID[Room] = false;
				ScriptMessage( Ctrl, -1, 2, g_Msg.KeyAppears, 2 );
				CallPlot( Ctrl, "Instance_32_UnLockRune_Init", Ctrl, Zone, Room );	-- 生成解鎖符文
			end
		end

		-- 當解鎖符文已被觸碰且該目標不存在或死亡時
		if g_TouchRune.Guid[Room] and ( not CheckID( g_TouchRune.Guid[Room] ) or ReadRoleValue( g_TouchRune.Guid[Room], EM_RoleValue_IsDead )  == 1 ) then
			DebugMsg( 0, 0, "目標不存在或死亡" );
			g_TouchRune.Guid[Room] = false;
			CallPlot( Ctrl, "Instance_32_UnLockRune_Init", Ctrl, Zone, Room );	-- 生成解鎖符文
		end
	end

	ScriptMessage( Ctrl, -1, 2, g_Msg.MissionComplete, 2 );
	SetModeEx( Captain, EM_SetModeType_Fight, false );

	-- 呼叫場上所有因為馬薩里隊長無敵而失去目標的怪物，攻擊場上任一存活的玩家
	local Players = SearchRangePlayer( Ctrl, 250 );

	for i = 1, #g_Obj.Monster[Room] do
		if CheckID( g_Obj.Monster[Room][i] ) then
			SetAttack( g_Obj.Monster[Room][i], Players[Math.Random(0,#Players-1)] );
		end
	end
	--

	Sleep( 10 );
	PlayMotion( Captain, ruFUSION_ACTORSTATE_BUFF_SP01 );	-- 脫離禁錮
	CancelBuff_NoEvent( Captain, g_Buff.BindShelter );
	Sleep( 10 );
	PlayMotion( Captain, ruFUSION_ACTORSTATE_EMOTE_SALUTE );	-- 敬禮
	ScriptMessage( Ctrl, -1, 2, g_Msg.Saved, 2 );
	Sleep( 10 );

	local CaptainPos = Vector_GetRolePos( Captain );
	local CaptainDir = ReadRoleValue( Captain, EM_RoleValue_Dir );
	local VecDir = Vector_DirToVector( CaptainDir + 90 );

	local TreasurePos = CaptainPos + VecDir * 25;	-- 寶箱位置建立在隊長前方 25 位置處
	local TreasureDir = CaptainDir + 180;
	if TreasureDir > 360 then TreasureDir = TreasureDir - 360 end
	TreasurePos.Y = GetHeight( TreasurePos.X, TreasurePos.Y, TreasurePos.Z );
	-- 2015.11.24 阿浩:因 Zone 170、171 沒有生成寶箱參照的 31 號旗標，故直接改以指定位置建立
--	local TreasureDir
--	TreasurePos.X, TreasurePos.Y, TreasurePos.Z, TreasureDir = DW_Location( g_Flag.ID, g_Flag.CreateTreasureNum );
	local Treasure = CreateObj( g_Obj.Treasure[Zone], TreasurePos.X, TreasurePos.Y, TreasurePos.Z, TreasureDir, 1 );
	SetModeEx( Treasure, EM_SetModeType_Fight, false );
	SetModeEx( Treasure, EM_SetModeType_Searchenemy, false );
	SetModeEx( Treasure, EM_SetModeType_Strikback, false );
	SetModeEx( Treasure, EM_SetModeType_Move, false);	-- 移動
	SetModeEx( Treasure, EM_SetModeType_Mark, true );	-- 標記
	SetModeEx( Treasure, EM_SetModeType_ShowRoleHead, false);	-- 頭像框
	SetModeEx( Treasure, EM_SetModeType_NotShowHPMP, true );	-- 血條
--	WriteRoleValue( Treasure, EM_RoleValue_LiveTime, 600 );	-- 寶箱生存時間 6 分鐘
	AddToPartition( Treasure, Room );

	for i = 1, #Survivalers do
		if CheckID( Survivalers[i]) then
			KilliD( Survivalers[i], Treasure );
			break;
		end
	end

	SetModeEx( Captain, EM_SetModeType_Move, true );
	WriteRoleValue( Captain, EM_RoleValue_IsWalk, 0 );	-- 跑
	CaptainPos = CaptainPos + VecDir * 100;
	local DelayTime = MoveDirect( Captain, CaptainPos.X, CaptainPos.Y, CaptainPos.Z );
	Sleep( DelayTime );

	DelAllObj( Ctrl, Captain, Room, true );
--	DelObj( Captain );
end

function Instance_32_UnLockRune_Init( Ctrl, Zone, Room )	-- 解鎖符文起始劇情

	local CreatePos = Math.random( g_Flag.CreateUnLockRuneNum.Min, g_Flag.CreateUnLockRuneNum.Max );
	DebugMsg( 0, 0, "解鎖符文產生位置 = "..tostring(CreatePos) );

	local FlagPos = {};
	local FlagDir
	FlagPos.X, FlagPos.Y, FlagPos.Z, FlagDir = DW_Location( g_Flag.ID, CreatePos );
	local UnlockRune = CreateObj( g_Obj.UnlockRune, FlagPos.X, FlagPos.Y, FlagPos.Z, 0, 1 );
	AddToPartition( UnlockRune, Room );
	g_Obj.UnlockList[Room] = UnlockRune;
	SetPlot( UnlockRune, "touch", "Instance_32_UnLockRune_Plot", 30  );
end

function Instance_32_UnLockRune_Plot()	-- 解鎖符文觸碰劇情

	local Player = OwnerID();
	local UnlockRune = TargetID();
	local Room = ReadRoleValue( Player, EM_RoleValue_RoomID );

	SetPlot( UnlockRune, "touch", "", 0 );	-- 關閉觸碰劇情，避免多人同時點擊時可能發生的未知問題。

	if not g_TouchRune.BuffID[Room] then
		g_TouchRune.BuffID[Room] = table.remove( g_Buff.RuneList[Room], Math.Random( #g_Buff.RuneList[Room] ) );
	end
	DebugMsg( 0, 0, "解鎖符文 獲得符文 = "..tostring(g_TouchRune.BuffID[Room]) );
	AddBuff( Player, g_TouchRune.BuffID[Room], 0, -1 );
	g_TouchRune.Guid[Room] = Player;
	DelObj( UnlockRune );
end

function Instance_32_LockRune_Plot()	-- 符文機關觸碰劇情

	local Player = OwnerID();
	local LockRune = TargetID();
	local Room= ReadRoleValue( Player, EM_RoleValue_RoomID );

	SetPlot( LockRune, "touch", "", 0 );	-- 關閉觸碰劇情，避免多人同時點擊時可能發生的未知問題。

	local Pos = ReadRoleValue( LockRune, EM_RoleValue_PID );
	if CheckBuff( Player, g_Buff.Rune[Pos] ) then
		g_TouchRune.CreateStatus[Room] = false;
		g_TouchRune.Guid[Room] = false;
		g_Obj.UnlockList[Room] = false;
		g_Step[Room] = g_Step[Room] + 1;

		local String = g_Msg.KeyUseComplete.."[$SETVAR1="..GetName( Player ).."][$SETVAR2=".."["..tostring( g_Buff.Rune[Pos] ).."]".."]"
		ScriptMessage( LockRune, -1, 2, String, 2 );
		DebugMsg( Player, 0, "當前階段 "..g_Step[Room] );
		CancelBuff_NoEvent( Player, g_Buff.Rune[Pos] );
		g_TouchRune.BuffID[Room] = false;
		DelObj( LockRune );
		return
	end

--	DebugMsg( Player, 0, "沒有對應Buff :"..g_Buff.Rune[Pos] );
	ScriptMessage( LockRune, -1, 2, g_Msg.KeyUseFail, 2 );
	SetPlot( LockRune, "touch", "Instance_32_LockRune_Plot", 30 );
	return
end