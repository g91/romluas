
local g_Msg = {};
g_Msg.BeginFight = "[$MUTE]".."[SC_30_DUPLICATION_1_1]";	-- 利索姆姆：「咦，居然有人敢闖進我掌管的大廳內？」
g_Msg.LeaveFight = "[$MUTE]".."[SC_30_DUPLICATION_1_2]";	-- 利索姆姆得意地笑著：「啊哈哈…果然在我的看守下是不可能有人成功闖入的！」
g_Msg.MumuIsDead = "[$MUTE]".."[SC_30_DUPLICATION_1_3]";	-- 利索姆姆：「無知…無知！……你們不可能活著走出這裡…」
g_Msg.MumuCombineBanka = "[$MUTE]".."[SC_30_DUPLICATION_1_4]";	-- 利索姆姆：「看我進到我可愛的邦卡內打爆你們…唔哼哼…」
g_Msg.MumuDetachBanka = "[$MUTE]".."[SC_30_DUPLICATION_1_5]";	-- 利索姆姆：「唉呀！不！我的邦卡！！」
g_Msg.BeginFury = "[$MUTE]".."[SC_30_DUPLICATION_1_6]";	-- 利索姆姆感到有些歇斯底里：「真是惹火我了，惹火我了！！」

local g_Magic = {};	-- 法術集合清單
g_Magic.HateMaker = 495751;	-- 強制給予目標 1 點仇恨，在每次合體時，必須讓武裝邦卡繼承利索姆姆的仇恨清單，用仇恨表內的目標對武裝邦卡施放這個方式繼承。

-------------- 利索姆姆 --------------
-- 鎖鏈之網
g_Magic.ChainNet = {};
g_Magic.ChainNet.ActID = 852299;	-- 施法表演ID
g_Magic.ChainNet.CastID = 852297;	-- 施法ID
g_Magic.ChainNet.AttackID = 851253;	-- 傷害ID
g_Magic.ChainNet.TransportDis = 25;	-- 傳送目標與 Boss 的間隔距離
g_Magic.ChainNet.CD = 8;	-- 冷卻時間( 單位:1 秒 )
g_Magic.ChainNet.Targets = 2;	-- 目標人數

-- 狂妄擊退
g_Magic.Rejection = {};
g_Magic.Rejection.ActID = 852298;	-- 施法表演ID
g_Magic.Rejection.AttackID = 851450;	-- 傷害ID
g_Magic.Rejection.Range = 90;	-- 狂妄擊退的有效射程
g_Magic.Rejection.CD = 10;	-- 冷卻時間( 單位:1 秒 )
g_Magic.Rejection.CastCount = 3;	-- 每次施放時的次數
g_Magic.Rejection.CastDelayTime = 5;	-- 每次施放後的延遲時間( 單位: 0.1 秒 )
g_Magic.Rejection.Spacing = 30;	-- 每次施放時的間隔距離

-- 武裝沉擊
g_Magic.DeepStrike = {};
g_Magic.DeepStrike.RunLuaID = 851451;	-- 施法ID
g_Magic.DeepStrike.BonusAttackID = 851481;	-- 武裝沉擊.破擊，當目標身上有 DeBuff - 迷煙印記(625234)時的追加傷害
g_Magic.DeepStrike.CD = 17;	-- 冷卻時間( 單位:1 秒 )

-- 鎖鏈跳躍 ( 施放時因表演會花時間，故在每個因表演而延遲的時間點都要確認 Mumu 是否已符合合體條件，是的話則取消表演與傷害 )
g_Magic.ChainJump = {};
g_Magic.ChainJump.ActID = 851473;	-- 施法表演ID
g_Magic.ChainJump.TauntID = 852300;	-- 挑釁ID，由目標對Boss執行挑釁，使Boss鎖定攻擊目標(不因仇恨值改變目標)
g_Magic.ChainJump.AttackID = 852301;	-- 傷害ID，Boss抵達目標面前時才執行傷害。
g_Magic.ChainJump.TransportDis = 15;	-- Boss 傳送至目標面前多少的間隔距離
g_Magic.ChainJump.CD = 19;	-- 冷卻時間( 單位:1秒 )

-------------- 武裝邦卡 --------------
-- 投射彈
g_Magic.ThrowingBomb = {};
g_Magic.ThrowingBomb.ActID = 852302;	--施法表演ID
g_Magic.ThrowingBomb.AttackID = 851474;	--傷害ID
g_Magic.ThrowingBomb.CD = 9;	-- 冷卻時間( 單位:1秒 )

-- 戰火迷煙
g_Magic.CombatFog = {};
g_Magic.CombatFog.NpcID = 124310;	-- 飛彈物件ID
g_Magic.CombatFog.Dis = 300;	-- 有效射程
g_Magic.CombatFog.Width = 15;	-- 有效寬度(半徑為15)
g_Magic.CombatFog.Height = 60;	-- 有效高度(上下)
g_Magic.CombatFog.FlySpeed = 15;	-- 技能速度(單位:0.1秒)，與有效長度需整除，對應 Npc (109318) 1/10 的移動速度
g_Magic.CombatFog.ActID = 852303;	-- 施法ID
g_Magic.CombatFog.AttackID = 851475;	-- 傷害ID
g_Magic.CombatFog.CD = 11;	-- 冷卻時間( 單位:1秒 )
g_Magic.CombatFog.TickTime = 30;	-- 每波飛彈的間隔時間( 單位:0.1秒 )
g_Magic.CombatFog.DelayTime = 10;	-- 每波飛彈產生後，開始執行移動的時間( 單位:0.1 秒)必須要有此時間，物件在剛生成瞬間執行移動會不準，必須要延遲 1 秒後執行移動位置才準...
g_Magic.CombatFog.Spacing = 0;	-- 每波飛彈產生時，與邦卡間隔的距離
g_Magic.CombatFog.ShootDir = {}	-- 每發飛彈產生時的角度
g_Magic.CombatFog.ShootDir[1] = { -45, -30, -15, 0, 15, 30, 45 };	-- 第1波飛彈(60度) 0 度為面向正中央
g_Magic.CombatFog.ShootDir[2] = { -90, -67.5, -45, -22.5, 0, 22.5, 45, 67.5, 90 };	-- 第2波飛彈(180度)
g_Magic.CombatFog.ShootDir[3] = { -135, -108, -81, -54, -27, 0, 27, 54, 81, 108, 135 };	-- 第三波，不是第3波飛彈(360度)
g_Magic.CombatFog.HitUnits = {};	-- 戰火迷煙擊中清單，避免複數飛彈同時對單一目標造成傷害導致目標被秒殺的情況發生

-------------- 利索姆姆與武裝邦卡合體 --------------
-- 流沙彈
g_Magic.QuicksandBomb = {};
g_Magic.QuicksandBomb.RunLuaID = 851476;	-- 執行Lua
g_Magic.QuicksandBomb.AttackID = 851480;	-- 地面的流沙特效與傷害
g_Magic.QuicksandBomb.ActID = 852290;	-- 施法特效 ( 邦卡與流沙共用 )
g_Magic.QuicksandBomb.HitUnits = {};	-- 流沙擊中清單，避免複數流沙同時對單一目標造成傷害導致目標被秒殺的情況發生
g_Magic.QuicksandBomb.Range = 15;	-- 傷害範圍(圓半徑)
g_Magic.QuicksandBomb.CD = 4;	-- 冷卻時間( 單位:1秒 )
g_Magic.QuicksandBomb.Count = 6;	-- 每次施放的波數
g_Magic.QuicksandBomb.TickTime = 5;	-- 每次施放時的波次間隔時間
g_Magic.QuicksandBomb.ContinuousCastTickTime = 10;	-- 流沙彈每次施法時的間隔時間( 單位:0.1秒 )
g_Magic.QuicksandBomb.LiveTime = 15;	-- 流沙在地上存活的時間

-- 地勤導彈
g_Magic.GroundMissile = {};
g_Magic.GroundMissile.ActID = 851504;	-- 施法表演ID
g_Magic.GroundMissile.ContinuousActID = 852304;	-- 地勤導彈持續施法ID，代表地勤導彈的外觀
g_Magic.GroundMissile.ContinuousCastTickTime = 5;	-- 地勤導彈每次施法時的間隔時間( 單位:0.1秒 )
g_Magic.GroundMissile.AttackID = 851483;	-- 傷害ID
g_Magic.GroundMissile.CD = 10;	-- 冷卻時間( 單位:1秒 )
g_Magic.GroundMissile.Count = 3;	-- 每次施放時的最大波數( 目標人數少於 3 人時，僅施放剩餘人數的次數 )
g_Magic.GroundMissile.TickTime = 5;	-- 每波地勤導彈的間隔時間( 單位:0.1秒 )
g_Magic.GroundMissile.ReadyTime = 50;	-- 地勤導彈在產生後，開始作用前的準備時間，避免一開始就對自己或玩家造成傷害的問題 ( 單位:0.1秒 )
g_Magic.GroundMissile.HitBanka = {};	-- 地勤導彈是否已命中邦卡，避免複數地勤導彈同時命中邦卡時，因函式重複觸發而導致劇情中斷的問題
g_Magic.GroundMissile.List = {};	-- 紀錄該區域內的地勤所有導彈，當任一地勤導彈擊中邦卡時，刪除場上其他的地勤導彈
g_Magic.GroundMissile.BankaTriggerRange = 50;	-- 地勤導彈對邦卡的觸發範圍( 邦卡的體積遠大於玩家，故觸發範圍要有差異 )
g_Magic.GroundMissile.PlayerTriggerRange = 25;	-- 地勤導彈對玩家的觸發範圍

-- 能量網
g_Magic.EngryWeb = {};
g_Magic.EngryWeb.ActID = 851482;	-- 施法表演ID
g_Magic.EngryWeb.ActCastTime = 60;	-- 施法表演ID的施法時間( 單位:0.1秒)
g_Magic.EngryWeb.ContinuousActID = 851477;-- 能量網持續施法ID，代表能量網的外觀與給予目標提示已被鎖定的 Buff
g_Magic.EngryWeb.ContinuousCastTickTime = 5;-- 能量網持續施法時的間隔時間( 單位:0.1秒 )
g_Magic.EngryWeb.CD = 6;	-- 冷卻時間( 單位:1秒 )
g_Magic.EngryWeb.Count = 10;	-- 每次施放時的數量
g_Magic.EngryWeb.TickTime = 0;	-- 每個能量網的間隔時間( 單位:0.1秒 )
g_Magic.EngryWeb.ReadyTime = 5;	-- 能量網在產生後，開始作用前的準備時間，避免一開始就對玩家造成效果( 單位:0.1秒 )
g_Magic.EngryWeb.MiniRange = 30;	-- 能量網的最小有效射程
g_Magic.EngryWeb.MaxRange = 120;	-- 能量網的最大有效射程

-- 能量砲
g_Magic.EnergizedCannonShot = {};
g_Magic.EnergizedCannonShot.AttackID = 851478;	-- 傷害ID
g_Magic.EnergizedCannonShot.ActCastTime = 20;	-- 施法表演ID的施法時間( 單位:0.1秒)

------------------
local g_BuffID = {};	-- 基本法術清單
g_BuffID.UnRecoverHp = 502707;	-- 停止自動回血，避免取消索敵的物件快速回血。
g_BuffID.MistImprint = 625234;	-- 迷煙印記
g_BuffID.MumuInvincible = 626313;	-- 利索姆姆身上的無敵Buff ( 特效A
g_BuffID.BankaInvincible = 625231;	-- 武裝邦卡身上的無敵Buff ( 特效B
g_BuffID.Driving = 625242;	-- 代表利索姆姆駕駛武裝邦卡中
g_BuffID.QuicksandBombWarning = 507881;	-- 流沙彈預警效果
g_BuffID.Fury = 625217;	-- 狂暴
g_BuffID.EnergyMark = 625238;	-- 能量標記

local g_Combination = {};	-- 記錄合體狀態，True 為合體中，false 為未合體
local g_CombinationSetHpPercent = 0.1;	-- 利索姆姆每減少 _ %生命後與武裝邦卡合體 ( 單位 0.01 = 1% )
local g_CombinationCount = {};	-- 利索姆姆變身的次數
local g_CombinationActOver = {};	-- 合體表演是否已結束

local g_HateList = {};	-- 仇恨表
local g_LeaveFightTime = 6;	-- 6秒規則，脫離戰鬥的時間

local g_Mumu = {};	-- 利索姆姆
g_Mumu.NpcID = {};	-- 物件ID
g_Mumu.NpcID[951] = 106978;
g_Mumu.NpcID[166] = 108432;	-- 困難副本
g_Mumu.NpcID[167] = 108634;	-- 普通副本
g_Mumu.NpcID[168] = 108644;	-- 簡單副本

local g_Banka = {};	-- 武裝邦卡
g_Banka.FollowRange = 750;	-- 資料庫中的追逐距離
g_Banka.NpcID = {};	-- 物件ID
g_Banka.NpcID[951] = 106979;
g_Banka.NpcID[166] = 108433;	-- 困難副本
g_Banka.NpcID[167] = 108635;	-- 普通副本
g_Banka.NpcID[168] = 108645;	-- 簡單副本

local g_CtrlObj = {};	-- 中控器
g_CtrlObj.NpcID = 124311;	-- 物件ID
g_CtrlObj.ResetCounter = {};	-- 	-- 每次合體開始與解散合體時，需要重置計數器，技能施放的時機才會準確

local g_FuryTime = {};	-- 狂暴時間( 單位:1秒 )
g_FuryTime[951] = 60;
g_FuryTime[166] = 480;
g_FuryTime[167] = 360;
g_FuryTime[168] = nil;	-- 不狂暴

local g_Door = {};
g_Door.FrontDoor = {};	-- 前門
g_Door.FrontDoor.NpcID = 108510;	-- 物件ID
--g_Door.FrontDoor.Pos = { X = -135, Y = -257.2, Z = -400.5, Dir = 270 };	-- Zone 951 測試區座標
g_Door.FrontDoor.Pos = { X = 818, Y = 3156, Z = -1793, Dir = 270 };	-- 座標

g_Door.RearDoor = {};	-- 後門
g_Door.RearDoor.NpcID = 108510;	-- 物件ID
--g_Door.RearDoor.Pos = { X = -304, Y = -257.2, Z = -409.2, Dir = 90 };	-- Zone 951 測試區座標
g_Door.RearDoor.Pos = { X = 405, Y = 3156, Z = -1497, Dir = 90 };	-- 座標

local function CompDis( A, B )	-- 比較遠近，由近至遠依序排序，提供此編號的 Script 判斷距離用

	if A.Dis < B.Dis then
		return true;
	end
end

local function CompHatePoint( A, B )	-- 比照仇恨點數，由高至低依序排序，提供此編號的 Script 判斷仇恨用

	if A.HatePoint > B.HatePoint then
		return true;
	end
end

local function GetHateList( ObjID, Haters )	-- 取參考物件的仇恨表，整理 Guid、距離、仇恨點數後回傳 Table，提供此編號的 Script 判斷資訊用

	local HateList = {};
	for i = 0, Haters-1 do	-- 取仇恨表內的目標
		local Targets = {};
		local Player = HateListInfo( ObjID, i, EM_HateListInfoType_GItemID );
		if ReadRoleValue( Player, EM_RoleValue_Voc ) ~= 0 then	-- 非GM
			Targets.Guid = Player;
			Targets.Dis = GetDistance( ObjID, Player );
			Targets.HatePoint = HateListInfo( ObjID, i, EM_HateListInfoType_HatePoint );
		--	DebugMsg( 0, Room, Getname( Targets.Guid )..", Dis = "..Targets.Dis..", HatePoint = "..Targets.HatePoint );
			table.insert( HateList, Targets );
		end
	end
	return HateList;
end

function Instance_Z30_Boss1_Combination()	-- 合體開始

	local Mumu = OwnerID();	-- 利索姆姆
	local Room = ReadRoleValue( Mumu, EM_RoleValue_RoomID );
	local Banka = g_Banka[Room];	-- 武裝邦卡
	local CtrlObj = g_CtrlObj[Room];	-- 中控器
	g_CombinationCount[Room] = g_CombinationCount[Room] + 1;

	if not g_Combination[Room] then
		DebugMsg( 0, 0, "合體開始, Combination = "..tostring(g_Combination[Room])..", CombinationCount = "..g_CombinationCount[Room] );
		g_Combination[Room] = true;	-- 合體開始
		g_CombinationActOver[Room] = false;	-- 宣告合體表演開始
		CallPlot( Mumu, "Instance_Z30_Boss1_Combination_2", Mumu, Banka, CtrlObj, Room )
	end
end

function Instance_Z30_Boss1_Combination_2( Mumu, Banka, CtrlObj, Room )

	local HateList = GetHateList( Mumu, g_HateList[Room] );
	DebugMsg( 0, 0, "合體開始後姆姆的仇恨人數 = "..tostring(#HateList) );
	local Caster = {};

	table.sort( HateList, CompHatePoint );	-- 將利索姆姆仇恨表內的玩家依照仇恨由高至低排序
	SetAttack( Banka, HateList[1].Guid );	-- 呼叫邦卡攻擊仇恨第1的目標

	ScriptMessage( Mumu, -1, 3, g_Msg.MumuCombineBanka, 0 );
	StopMove( Mumu, false );	-- 停止利索姆姆移動
	StopMove( Banka, false );	-- 停止武裝邦卡移動
	SetModeEx( Banka, EM_SetModeType_Move, false );	-- 關閉武裝邦卡的移動，讓合體順利對位
	SetModeEx( Mumu, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( Mumu, EM_SetModeType_Strikback, false );	-- 反擊
	SetModeEx( Mumu, EM_SetModeType_ShowRoleHead, false );	-- 頭相框
	SetModeEx( Mumu, EM_SetModeType_Mark, false );	-- 標記

	LockHP( Mumu, -100, "" );	-- 將 Boss 的血量鎖定解除
	AddBuff( Mumu, g_BuffID.MumuInvincible, 0, -1 );	-- 給予利索姆姆無敵

	WriteRoleValue( Mumu, EM_RoleValue_IsWalk, 0 );	-- 跑步
	SetDefIdleMotion( Mumu, ruFUSION_MIME_RUN_FORWARD );	-- 將動作變更為跑步中
	local BankaPos = Vector_GetRolePos( Banka );
	MoveDirect( Mumu, BankaPos.X, BankaPos.Y, BankaPos.Z );
	DebugMsg( 0, 0, "利索姆姆與武裝邦卡的距離為"..(Vector_GetRolePos(Mumu)-BankaPos):Len() );
	SetStopAttack( Mumu );	-- 停止攻擊、離開戰鬥並清空仇恨
	Sleep(5);	-- 表演時間
	Sleep(DelayTime);	-- 表演時間
	SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_UP );	-- 將動作變更為開始跳躍
	Sleep(4);	-- 表演時間
	SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_LOOP );	-- 將動作變更為跳躍中
	Sleep(4);	-- 表演時間
--	BankaPos = Vector_GetRolePos( Banka );	-- 重取一次武裝邦卡位置
	local BankaDir = ReadRoleValue( Banka, EM_RoleValue_Dir );
	local VecDir = Vector_DirToVector( BankaDir + 90 );
	local TransferPos = BankaPos + VecDir * 15	-- 將利索姆姆傳送至武裝邦卡面向的前方位置
	SetPos( Mumu, TransferPos.X, TransferPos.Y+50, TransferPos.Z, BankaDir-180 );
	SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_DOWN );	-- 將動作變更為跳躍落下
	Sleep(4);	-- 表演時間
	SetDefIdleMotion( Mumu, ruFUSION_MIME_IDLE_STAND );	-- 將動作變更為站立
	g_CtrlObj.ResetCounter[Room] = true;	-- 重置計數器

	SetModeEx( Mumu, EM_SetModeType_Show, false );	-- 顯示
	SetModeEx( Mumu, EM_SetModeType_Move, false );	-- 移動
	SetModeEx( Banka, EM_SetModeType_Move, true );	-- 重新開啟武裝邦卡的移動
	SetModeEx( Mumu, EM_SetModeType_Gravity, false );	-- 關閉重力
	AddBuff( Banka, g_BuffID.Driving, 0, -1 );	-- 利索姆姆駕駛武裝邦卡中
	g_CombinationActOver[Room] = true;	-- 宣告合體表演結束
	Sleep(4);	-- 表演時間
	SetPos( Mumu, TransferPos.X, TransferPos.Y+200, TransferPos.Z, 0 );	-- 將利索姆姆的位置拉高，避免AE法術打到該位置時跳出免疫提示的問題
end

function Instance_Z30_Boss1_Detach( Banka, Mumu, Room )	-- 解除合體

	-- 利索姆姆與武裝邦卡分離，解除合體
	local BankaPos = Vector_GetRolePos( Banka );
	local BankaDir = ReadRoleValue( Banka, EM_RoleValue_Dir );
	ScriptMessage( Mumu, -1, 3, g_Msg.MumuDetachBanka, 0 );
	SetPos( Mumu, BankaPos.X, BankaPos.Y, BankaPos.Z, BankaDir );

	CancelBuff_NoEvent( Mumu, g_BuffID.MumuInvincible );
	CancelBuff_NoEvent( Banka, g_BuffID.Driving );

	SetModeEx( Mumu, EM_SetModeType_Gravity, true );	-- 重力
	SetModeEx( Mumu, EM_SetModeType_ShowRoleHead, true );	-- 頭相框
	SetModeEx( Mumu, EM_SetModeType_Show, true );	-- 顯示
	SetModeEx( Mumu, EM_SetModeType_Move, true );	-- 移動
	SetModeEx( Mumu, EM_SetModeType_Searchenemy, true );	-- 索敵
	SetModeEx( Mumu, EM_SetModeType_Mark, true );	-- 標記
	SetModeEx( Mumu, EM_SetModeType_Strikback, true );	-- 反擊
--	SetModeEx( Mumu, EM_SetModeType_Fight, true );	-- 砍殺
	g_Combination[Room] = false;	-- 解除合體
end

function Instance_Z30_Mumu_Init()	-- 利索姆姆 物件產生劇情

	local Mumu = OwnerID();
	local Zone = ReadRoleValue( Mumu, EM_RoleValue_ZoneID );

	if Zone ~= 951 then	-- 避免於測試區測試時報錯，致使劇情中斷
		Cl_Resist_HackersBossNum( Mumu );	-- 防駭客機制 掛於物件產生
	end

	local Room = ReadRoleValue( Mumu, EM_RoleValue_RoomID );
	local MumuPos = Vector_GetRolePos(Mumu);
	local MumuDir = ReadRoleValue( Mumu, EM_RoleValue_Dir );
	local VecDir = Vector_DirToVector( MumuDir + 90 + 180 );
	local BankaPos = MumuPos + VecDir * 100;	-- 邦卡位於 Mumu 正後方 100 的位置
	local Banka = CreateObj( g_Banka.NpcID[Zone], BankaPos.X, BankaPos.Y, BankaPos.Z, MumuDir, 1 );
	AddToPartition( Banka, Room );
	CallPlot( Banka, "Instance_Z30_Banka_Init", Banka, Room, Zone );	-- 邦卡物件產生劇情
--	DebugMsg( 0, 0, "Room = "..Room..", Zone = "..Zone );

	AddBuff( Mumu, g_BuffID.UnRecoverHp, 0, -1 );

	if g_Mumu[Room] and CheckID( g_Mumu[Room] ) then	-- 防呆，初始化利索姆姆
		DelObj( g_Mumu[Room] );
		DebugMsg( 0, 0, "刪除舊有利索姆姆" );
	end

	if g_Banka[Room] and CheckID( g_Banka[Room] ) then	-- 防呆，初始化武裝邦卡
		DelObj( g_Banka[Room] );
		DebugMsg( 0, 0, "刪除舊有武裝邦卡" );
	end

	-- 仇恨表初始化
	g_HateList[Room] = {};	-- 仇恨表

	-- 合體狀態初始化
	g_Combination[Room] = false;	-- 變身狀態
	g_CombinationCount[Room] = 0;	-- 變身次數

	-- 宣告利索姆姆與武裝邦卡，方便其他function使用
	g_Mumu[Room] = Mumu;
	g_Banka[Room] = Banka;

	if g_CtrlObj[Room] and CheckID( g_CtrlObj[Room] ) then	-- 防呆，初始化中控器
		DelObj( g_CtrlObj[Room]) ;
		DebugMsg( 0, 0, "刪除舊有中控器" );
	end
	local CtrlObj = CreateObj( g_CtrlObj.NpcID, MumuPos.X, MumuPos.Y, MumuPos.Z, MumuDir, 1 );	-- 建立此區域的中控器
	AddToPartition( CtrlObj, Room );
	g_CtrlObj[Room] = CtrlObj;
	SetModeEx( CtrlObj, EM_SetModeType_Show, false );	-- 顯示
	SetModeEx( CtrlObj, EM_SetModeType_Mark, false );	-- 標記
	SetModeEx( CtrlObj, EM_SetModeType_Move, false );	-- 移動
	SetModeEx( CtrlObj, EM_SetModeType_HideName, true );	-- 名稱
	DebugMsg( 0, 0, "建立中控器" );

	-- 建立前門
	if g_Door.FrontDoor[Room] and CheckID( g_Door.FrontDoor[Room] ) then	-- 防呆
		DelObj( g_Door.FrontDoor[Room] );
		DebugMsg( 0, 0, "刪除舊有前門" );
	end
	local FrontDoor = CreateObj( g_Door.FrontDoor.NpcID, g_Door.FrontDoor.Pos.X, g_Door.FrontDoor.Pos.Y, g_Door.FrontDoor.Pos.Z, g_Door.FrontDoor.Pos.Dir, 1 );
	SetModeEx( FrontDoor, EM_SetModeType_Gravity, false );	-- 重力
	SetModeEx( FrontDoor, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( FrontDoor, EM_SetModeType_Strikback, false );	-- 反擊
	SetModeEx( FrontDoor, EM_SetModeType_Fight, false );	-- 砍殺
	SetModeEx( FrontDoor, EM_SetModeType_Move, false );	-- 移動
	SetModeEx( FrontDoor, EM_SetModeType_Obstruct, false );	-- 阻擋
	SetModeEx( FrontDoor, EM_SetModeType_HideName, true );	-- 名稱
	SetModeEx( FrontDoor, EM_SetModeType_Mark, false );	-- 標記
	SetModeEx( FrontDoor, EM_SetModeType_Show, false );	-- 顯示
	AddToPartition( FrontDoor, Room );
	g_Door.FrontDoor[Room] = FrontDoor;
	DebugMsg( 0, 0, "建立前門" );

	-- 建立後門
	if g_Door.RearDoor[Room] and CheckID( g_Door.RearDoor[Room] ) then	-- 防呆
		DelObj( g_Door.RearDoor[Room] );
		DebugMsg( 0, 0, "刪除舊有後門" );
	end
	local RearDoor = CreateObj( g_Door.RearDoor.NpcID, g_Door.RearDoor.Pos.X, g_Door.RearDoor.Pos.Y, g_Door.RearDoor.Pos.Z, g_Door.RearDoor.Pos.Dir, 1 );
	SetModeEx( RearDoor, EM_SetModeType_Gravity, false );	-- 重力
	SetModeEx( RearDoor, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( RearDoor, EM_SetModeType_Strikback, false );	-- 反擊
	SetModeEx( RearDoor, EM_SetModeType_Fight, false );	-- 砍殺
	SetModeEx( RearDoor, EM_SetModeType_Move, false );	-- 移動
	SetModeEx( RearDoor, EM_SetModeType_Obstruct, true );	-- 阻擋
	SetModeEx( RearDoor, EM_SetModeType_HideName, true );	-- 名稱
	SetModeEx( RearDoor, EM_SetModeType_Mark, false );	-- 標記
	AddToPartition( RearDoor, Room );
	g_Door.RearDoor[Room] = RearDoor;
	DebugMsg( 0, 0, "建立後門" );
end

function Instance_Z30_Banka_Init( Banka, Room, Zone )	-- 武裝邦卡 物件產生劇情

	AddBuff( Banka, g_BuffID.UnRecoverHp, 0, -1 );
	AddBuff( Banka, g_BuffID.BankaInvincible, 0, -1 );	-- 給予武裝邦卡無敵
end

function Instance_Z30_Mumu_LeaveFight()	-- 利索姆姆 離開戰鬥

	local Mumu = OwnerID();
	DebugMsg( 0, 0, "利索姆姆脫離戰鬥" );
end

function Instance_Z30_Mumu_OnDead()	-- 利索姆姆 死亡劇情
	
	local Mumu = OwnerID();
	local Zone = ReadRoleValue( Mumu, EM_RoleValue_ZoneID );

	if Zone ~= 951 then	-- 避免於測試區測試時報錯，致使劇情中斷
		Cl_Resist_HackersBossDead( Mumu );	-- 防駭客機制 掛於物件死亡
	end

	local Room = ReadRoleValue( Mumu, EM_RoleValue_RoomID );
	ScriptMessage( Mumu, -1, 3, g_Msg.MumuIsDead, 0 );
	SetStopAttack( g_Banka[Room] );	-- 停止攻擊、離開戰鬥並清空仇恨
	KillID( g_Banka[Room], g_Banka[Room] );

	PlayMotion( g_Door.FrontDoor[Room], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN );	-- 開啟前門
	SetDefIdleMotion( g_Door.FrontDoor[Room], ruFUSION_MIME_ACTIVATE_BEGIN );
	SetIdleMotion( g_Door.FrontDoor[Room], ruFUSION_MIME_ACTIVATE_LOOP );

	PlayMotion( g_Door.RearDoor[Room], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN );	-- 開啟後門
	SetDefIdleMotion( g_Door.RearDoor[Room], ruFUSION_MIME_ACTIVATE_BEGIN );
	SetIdleMotion( g_Door.RearDoor[Room], ruFUSION_MIME_ACTIVATE_LOOP );

	CallPlot( g_CtrlObj[Room], "Instance_Z30_Mumu_OnDead2", Room );
end

function Instance_Z30_Mumu_OnDead2( Room )

	Sleep(70);	-- 播放開門的時間
	DelObj( g_Door.FrontDoor[Room] );	-- 刪除前門
	DelObj( g_Door.RearDoor[Room] );	-- 刪除後門
	DelObj( g_CtrlObj[Room] );	-- 刪除中控器自己
end

function Instance_Z30_Mumu_BeginFight()	-- 利索姆姆 戰鬥開始

	local Mumu = OwnerID();
	local Zone = ReadRoleValue( Mumu, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Mumu, EM_RoleValue_RoomID );
--	Yell( g_Mumu[Room], "Mumu", 3 );	-- 利索姆姆
--	Yell( g_Banka[Room], "Banka", 3 );	-- 邦卡

	if ReadRoleValue( g_CtrlObj[Room], EM_RoleValue_PID ) == 0 then	-- 避免 Already Running 的問題

		local Target = ReadRoleValue( g_Mumu[Room], EM_RoleValue_AttackTargetID );
		SetAttack( g_Banka[Room], Target );	-- 呼叫邦卡攻擊利索姆姆的攻擊目標，SetAttack在版本 6.5.0 前僅處理攻擊，執行時不會塞仇恨給目標
		SysCastSpellLv( Target, g_Banka[Room], g_Magic.HateMaker, 100 );	-- 硬塞仇恨值給邦卡

		local PartyNum = GetPartyID( Target, -1 );	-- 將利索姆姆攻擊目標的隊伍成員，也同步給武裝邦卡，避免武裝邦卡因無敵而只鎖定 1 名目標，當該目標死亡後會離開戰鬥的問題。
		if PartyNum > 0 then
			for Index = 1, PartyNum do
				if Index == 1 then
					DebugMsg( 0, 0, "隊伍人數 = "..tostring(PartyNum) );
				end
				local Partner = GetPartyID( Target, Index );	-- 當隊伍成員與邦卡的距離 < 追逐距離且在存活時
				if Partner ~= Target and GetDistance( g_Banka[Room], Partner ) < g_Banka.FollowRange and CheckID( Partner ) and ReadRoleValue( Partner, EM_RoleValue_IsDead ) == 0 then
				--	Yell( Partner, "Hit Banka", 3 );
					SysCastSpellLv( Partner, g_Banka[Room], g_Magic.HateMaker, 100 );
				end
			end
		end

		-- 建立前門
		SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Obstruct, true );	-- 阻擋
		SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Show, true );	-- 顯示
		DebugMsg( 0, 0, "利索姆姆進入戰鬥，關閉前門" );

		ScriptMessage( g_Mumu[Room], -1, 3, g_Msg.BeginFight, 0 );
		CallPlot( g_CtrlObj[Room], "Instance_Z30_Boss1_BeginFight", g_CtrlObj[Room], g_Mumu[Room], g_Banka[Room], Zone, Room );
		WriteRoleValue( g_CtrlObj[Room], EM_RoleValue_PID, 1 );
	end
end

function Instance_Z30_Boss1_CheckFury( CtrlObj, Mumu, Banka, Zone, Room )	-- 確認利索姆姆是否狂暴

	local FuryCounter = 0;	-- 狂暴計數器
	while ReadRoleValue( Mumu, EM_RoleValue_IsDead ) == 0 do	-- 當姆姆沒有死亡
		if FuryCounter == g_FuryTime[Zone] then
			ScriptMessage( Mumu, -1, 3, g_Msg.BeginFury, 0 );
			AddBuff( Mumu, g_BuffID.Fury, 0, -1 );
			AddBuff( Banka, g_BuffID.Fury, 0, -1 );
			break;
		end
		DebugMsg( 0, 0, "狂暴時間 = "..FuryCounter );
		Sleep(10);
		if not g_Combination[Room] then	-- 未合體時，才處理計數器
			FuryCounter = FuryCounter + 1;
		end
	end
end

function Instance_Z30_Boss1_BeginFight( CtrlObj, Mumu, Banka, Zone, Room )	-- 由中控器執行戰鬥

	local CombinationSetHpPercent = g_CombinationSetHpPercent;	-- 變身條件
	local MumuHpRatio = 1;	-- Mumu 血量比率
	local Counter = 0;	-- 計數器，用於統計戰鬥時間
	local LeaveFightTime = 0;	-- 離開戰鬥時間
	local HateSourcer = false;	-- 仇恨目標

	if g_FuryTime[Zone] then	-- 處理狂暴
		CallPlot( CtrlObj, "Instance_Z30_Boss1_CheckFury", CtrlObj, Mumu, Banka, Zone, Room )	-- 確認利索姆姆是否狂暴
	end

	while LeaveFightTime < g_LeaveFightTime and ReadRoleValue( Mumu, EM_RoleValue_IsDead ) == 0 do	-- 當姆姆沒有死亡，且未脫離戰鬥時

		--  計數器判斷
		if g_CtrlObj.ResetCounter[Room] then	-- 每次合體完成、取消合體時需要重置計數器，以符合技能實際的施放時間
			Counter = 0;
			g_CtrlObj.ResetCounter[Room] = false;
		end
		Counter = Counter + 1;

		local MumuHateList = HateListCount( Mumu );	-- 取利索姆姆的仇恨表
		local BankaHateList = HateListCount( Banka );	-- 取武裝邦卡的仇恨表
		DebugMsg( 0, 0, "利索姆姆仇恨數量 : "..MumuHateList );
		DebugMsg( 0, 0, "武裝邦卡仇恨數量 : "..BankaHateList );

		-- 脫離戰鬥判斷
		if MumuHateList == 0 and BankaHateList == 0 then	-- 當利索姆姆與武裝邦卡的仇恨表均為 0 人時
			LeaveFightTime = LeaveFightTime + 1;
			DebugMsg( 0, 0, "LeaveFightTime = "..LeaveFightTime );
		else
			LeaveFightTime = 0;	-- 恢復預設設定
		end

		-- 仇恨表來源
		if not g_Combination[Room] then	-- 非合體時，以利索姆姆的仇恨表為參照
			g_HateList[Room] = MumuHateList;	-- 取利索姆姆的仇恨表
			if HateSourcer ~= Mumu then
				HateSourcer = Mumu;
				DebugMsg( 0, 0, "參照利索姆姆的仇恨表" );
			end
		else	-- 合體時，以武裝邦卡的仇恨表為參照
			g_HateList[Room] = BankaHateList;	-- 取武裝邦卡的仇恨表
			if HateSourcer ~= Banka then
				HateSourcer = Banka;
				DebugMsg( 0, 0, "參照武裝邦卡的仇恨表" );
			end
		end

		-- 合體判斷
		local LockHpRatio = 1 - CombinationSetHpPercent*(g_CombinationCount[Room]+1);
	--	DebugMsg( 0, 0, "MumuHpRatio = "..MumuHpRatio..", LockHpRatio = "..LockHpRatio );
		if MumuHpRatio ~= LockHpRatio and LockHpRatio ~= 0 then	-- 每當 Mumu 血量符合變身條件，且鎖定生命不等於 0 時
			MumuHpRatio = LockHpRatio
		--	DebugMsg( 0, 0, "LockHpRatio = "..LockHpRatio );
			LockHP( Mumu, ReadRoleValue( Mumu, EM_RoleValue_MaxHP)*LockHpRatio, "Instance_Z30_Boss1_Combination" );	-- 將 Boss 的血量鎖住，避免被秒殺的情況發生，致使劇情中斷
		end

		-- 施放技能 - 利索姆姆
		if Counter%g_Magic.ChainNet.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- 鎖鏈之網
			DebugMsg( 0, 0, Counter..", 利索姆姆 - 鎖鏈之網, 仇恨目標數量 = "..g_HateList[Room] );
			CastSpellLv( Mumu, Mumu, g_Magic.ChainNet.ActID, 0 );
			Sleep(10);	-- 施法表演的延遲時間
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			table.sort( HateList, CompDis );	-- 將仇恨表內的玩家依照距離由近至遠排序
			for i = 1, g_Magic.ChainNet.Targets do
				if #HateList > 0 then
					local Targets = table.remove( HateList, #HateList );	-- 仇恨表中最遠的目標清單 ( 包括 Guid, Dis, HatePoint )
				--	DebugMsg( 0, Room, Counter..", 利索姆姆 - 鎖鏈之網 Lock Target = "..Getname( Targets.Guid )..", 目標與姆姆距離 = "..Targets.Dis );
					SysCastSpellLv( Mumu, Targets.Guid, g_Magic.ChainNet.CastID, 0 );
				end
			end
		elseif Counter%g_Magic.Rejection.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- 狂妄擊退
			DebugMsg( 0, 0, Counter..", 利索姆姆 - 狂妄擊退, 仇恨目標數量 = "..g_HateList[Room] );
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			table.sort( HateList, CompHatePoint );	-- 將仇恨表內的玩家依照仇恨由高至低排序
			local Target = nil
			for i = 1, #HateList do
				if GetDistance( Mumu, HateList[i].Guid ) <= g_Magic.Rejection.Range then
					Target = HateList[i].Guid;
				--	DebugMsg( 0, Room, Counter..", 利索姆姆 - 狂妄擊退 Lock Target = "..Getname( HateList[i].Guid )..", HatePoint = "..HateList[i].HatePoint );
					break;
				end
			end
			if Target then	-- 範圍內有符合條件的目標時
				local MumuPos = Vector_GetRolePos( Mumu );
				local MumuDir = ReadRoleValue( Mumu, EM_RoleValue_Dir );
				local VecDir = Vector_DirToVector( MumuDir+90 );
				CastSpellLv( Mumu, Target, g_Magic.Rejection.ActID, 0 );	-- 施法表演
				Sleep(10);	-- 施法表演的延遲時間
				for i = 1, g_Magic.Rejection.CastCount do
					local TargetPos = MumuPos + VecDir *( i*g_Magic.Rejection.Spacing );
					local CastObj = Hao_CreateSpellObjbyPos( TargetPos );	-- 在目標位置建立施法物件
					CallPlot( CastObj, "MagicCol_851450", CastObj, Mumu, g_Magic.Rejection.CastDelayTime*i );
				end
			end
		elseif Counter%g_Magic.DeepStrike.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- 武裝沉擊
			DebugMsg( 0, 0, Counter..", 利索姆姆 - 武裝沉擊, 仇恨目標數量 = "..g_HateList[Room] );
			CastSpellLv( Mumu, Mumu, g_Magic.DeepStrike.RunLuaID, 0 );
		elseif Counter%g_Magic.ChainJump.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- 鎖鏈跳躍
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			DebugMsg( 0, 0, Counter..", 利索姆姆 - 鎖鏈跳躍, 仇恨目標數量 = "..#HateList );
			table.sort( HateList, CompHatePoint );	-- 將仇恨表內的玩家依照仇恨由高至低排序
			local Target = HateList[1].Guid;	-- 仇恨表中第 1 仇恨的玩家
			if HateList[2] and GetDistance( Mumu, HateList[2].Guid ) < 200 then
				Target = HateList[2].Guid;	-- 仇恨表中第 2 仇恨的玩家
			end
			SetDefIdleMotion( Mumu, ruFUSION_MIME_RUN_FORWARD );	-- 將動作變更為移動中
			SysCastSpellLv( Target, Mumu, g_Magic.ChainJump.TauntID, 0 );	-- 由目標執行挑釁，並使Boss鎖定攻擊目標(不因仇恨值改變目標)
			SetAttack( Mumu, Target );	-- 指定攻擊目標
			local TargetPos = Vector_GetRolePos( Target );
			MoveDirect( Mumu, TargetPos.X, TargetPos.Y, TargetPos.Z );
			Sleep(4);
		--	SysCastSpellLv( Mumu, Target, g_Magic.ChainJump.CastID, 0 );	-- 施法表演ID
			if not g_Combination[Room] then	-- 在每個有 Sleep 的時間點都要檢查利索姆姆是否已符合合體條件，是的話則取消表演與傷害
				CastSpellLv( Mumu, Target, g_Magic.ChainJump.ActID, 0 );	-- 施法表演ID
				Sleep(4);	-- 施法表演時間
				SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_UP );	-- 將動作變更為開始跳躍
			end
			if not g_Combination[Room] then
				Sleep(4);	-- 開始跳躍的表演時間
				SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_LOOP );	-- 將動作變更為跳躍中
			end
			if not g_Combination[Room] then
				Sleep(4);	-- 延長表演時間
				TargetPos = Vector_GetRolePos( Target );	-- 重取新的玩家位置
				local TargetDir = ReadRoleValue( Target, EM_RoleValue_Dir );
				local VecDir = Vector_DirToVector( TargetDir + 90 );
				local TransferPos = TargetPos + VecDir * g_Magic.ChainJump.TransportDis;	-- 傳送至目標面向前方 g_Magic.ChainJump.TransportDis 距離的位置
				SetPos( Mumu, TransferPos.X, TransferPos.Y, TransferPos.Z, TargetDir-180 );
				SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_DOWN );	-- 將動作變更為跳躍落下
			end

			if not g_Combination[Room] then
				Sleep(4);	-- 跳躍落下的表演時間
				SetDefIdleMotion( Mumu, ruFUSION_MIME_IDLE_STAND );	-- 將動作變更為站立
				SysCastSpellLv( Target, Mumu, g_Magic.ChainJump.TauntID, 0 );	-- 由目標執行挑釁，並使Boss鎖定攻擊目標(不因仇恨值改變目標)，重新更新一次，讓目標被固定鎖定 5 秒
				SysCastSpellLv( Mumu, Target, g_Magic.ChainJump.AttackID, 0 );	-- 執行傷害
			end
		end

		-- 邦卡
		if Counter%g_Magic.CombatFog.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- 戰火迷煙
			DebugMsg( 0, 0, Counter..", 武裝邦卡 - 戰火迷煙, 仇恨目標數量 = "..g_HateList[Room] );
			Instance_Z30_Banka_CombatFog( Banka, Mumu, Room );	-- 攻擊場上任一有能量標記的目標

		elseif Counter%g_Magic.ThrowingBomb.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- 投射彈
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			DebugMsg( 0, 0, Counter..", 武裝邦卡 - 投射彈, 仇恨目標數量 = "..#HateList );
			if #HateList > 0 then
				local Target = table.remove( HateList, Math.Random(#HateList) );	-- 仇恨表中 1 名隨機目標 ( 包括 Guid, Dis, HatePoint )
				CastSpellLv( Banka, Target.Guid, g_Magic.ThrowingBomb.ActID, 0 );	-- 施法ID
			end

		else	-- 命令邦卡攻擊利索姆姆最仇視的目標
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			table.sort( HateList, CompHatePoint );	-- 將仇恨表內的玩家依照仇恨由高至低排序
			if #HateList > 0 then
				SetAttack( Banka, HateList[1].Guid );
			end
		end

		-- 利索姆姆&邦卡
		if Counter%g_Magic.GroundMissile.CD == 0 and g_HateList[Room] ~= 0 and g_Combination[Room] and g_CombinationActOver[Room] then	-- 地勤導彈
			DebugMsg( 0, 0, Counter..", 武裝邦卡 合體 - 地勤導彈, 仇恨目標數量 = "..g_HateList[Room] );
			 Instance_Z30_Banka_GroundMissile( Banka, Mumu, Room );
		elseif Counter%g_Magic.EngryWeb.CD == 0 and g_HateList[Room] ~= 0 and g_Combination[Room] and g_CombinationActOver[Room] then	-- 能量網
			DebugMsg( 0, 0, Counter..", 武裝邦卡 合體 - 能量網, 仇恨目標數量 = "..g_HateList[Room] );
			StopMove( Banka, false );
			SetModeEx( Banka, EM_SetModeType_Move, false );
			CastSpellLv( Banka, Banka, g_Magic.EngryWeb.ActID, 0 );
			Sleep( g_Magic.EngryWeb.ActCastTime );
			SetModeEx( Banka, EM_SetModeType_Move, true );
			Instance_Z30_Banka_EngryWeb( Banka, Room );
		elseif Counter%g_Magic.QuicksandBomb.CD == 0 and g_HateList[Room] ~= 0 and g_Combination[Room] and g_CombinationActOver[Room] then	-- 流沙彈
			DebugMsg( 0, 0, Counter..", 武裝邦卡 合體 - 流沙彈, 仇恨目標數量 = "..g_HateList[Room] );
			Instance_Z30_Banka_QuicksandBomb( Banka, Mumu, Room );
		elseif g_HateList[Room] ~= 0 and g_Combination[Room] and g_CombinationActOver[Room] then	-- 能量砲
			DebugMsg( 0, 0, Counter..", 武裝邦卡 合體 - 能量砲檢查, 仇恨目標數量 = "..g_HateList[Room] );
			if Instance_Z30_Banka_EnergizedCannonShot( Banka, Mumu, Room ) then	-- 有發射能量砲時
				Sleep(g_Magic.EnergizedCannonShot.ActCastTime);	-- 施法時間
			else	-- 因為利索姆姆已脫離戰鬥，故每當邦卡空閒時(沒有施放技能)，命令邦卡攻擊仇恨最高者
				local HateList = GetHateList( Banka, g_HateList[Room] );
				table.sort( HateList, CompHatePoint );	-- 將仇恨表內的玩家依照仇恨由高至低排序
				if #HateList > 0 then
					SetAttack( Banka, HateList[1].Guid );
				end
			end
		end
	--	DebugMsg( 0, 0, Counter..", 合體狀態 = "..tostring(g_Combination[Room]) );
		Sleep(10);
	end

	if ReadRoleValue( Mumu, EM_RoleValue_IsDead ) == 0 then	-- 當利索姆姆存活時重置
		PlayMotion( Mumu, ruFUSION_ACTORSTATE_BUFF_SP02 );
		ScriptMessage( Mumu, -1, 3, g_Msg.LeaveFight, 0 );
		CallPlot( g_CtrlObj[Room], "Instance_Z30_Boss1_Reset", g_CtrlObj[Room], Mumu, Banka, Room );
	end
end

function Instance_Z30_Boss1_Reset( CtrlObj, Mumu, Banka, Room )	-- 由中控器執行重置

	DelObj( Mumu );
	DelObj( Banka );
	DelObj( g_Door.FrontDoor[Room] );	-- 刪除前門

	Sleep(50);
	WriteRoleValue( CtrlObj, EM_RoleValue_PID, 0 );
	local CtrlObjPos = Vector_GetRolePos( CtrlObj );
	local CtrlObjDir = ReadRoleValue( CtrlObj, EM_RoleValue_Dir );
	local Zone = ReadRoleValue( CtrlObj, EM_RoleValue_ZoneID );
	local NewMumu = CreateObj( g_Mumu.NpcID[Zone], CtrlObjPos.X, CtrlObjPos.Y, CtrlObjPos.Z, CtrlObjDir, 1 );
	AddToPartition( NewMumu, Room );
	DebugMsg( 0, 0, "重建利索姆姆" )
end
---------- 利索姆姆 ----------
function MagicBase_626311_Plot()	-- 鎖鏈之網

	local Mumu = OwnerID();
	local Target = TargetID();	-- Player
	SysCastSpellLv( Mumu, Target, g_Magic.ChainNet.AttackID, 0 );	-- 傷害

	if GetDistance( Mumu, Target ) > g_Magic.ChainNet.TransportDis then
		local MumuPos = Vector_GetRolePos( Mumu );
		local MumuDir = ReadRoleValue( Mumu, EM_RoleValue_Dir );
		local VecDir = Vector_DirToVector( MumuDir+90 );	-- 當前面向
		local TargetDir = ReadRoleValue( Target, EM_RoleValue_Dir );
		local TargetPos = MumuPos + VecDir * g_Magic.ChainNet.TransportDis;
		SetPos( Target, TargetPos.X, TargetPos.Y, TargetPos.Z, TargetDir );
	end
end
----
function MagicBase_625223_Check()	-- 狂妄擊退，檢查

	local Mumu = OwnerID();	-- Boss
	local Target = TargetID();	-- 目標
	if not CheckRelation( Mumu, Target, EM_CheckRelationType_Enemy ) then	-- 非敵對物件不執行傷害
		return false;
	end
	return true;
end

function MagicCol_851450( CastObj, Mumu, DelayTime )	-- 狂妄擊退傷害

	Sleep( DelayTime );
--	DebugMsg( 0, 0, "SysTime = "..GetSystime(0)..", DelayTime = "..DelayTime..", Dis = "..( Vector_GetRolePos(Mumu) - Vector_GetRolePos(CastObj) ):Len() );
	SysCastSpellLv( Mumu, CastObj, g_Magic.Rejection.AttackID, 0 );	-- 傷害
end
----
function MagicBase_625224_Check()	-- 武裝沉擊　追加傷害

	local Mumu = OwnerID();
	local Target = TargetID();
	local BonusDmgLv = Lua_Hao_Return_Buff_Lv( Target, g_BuffID.MistImprint );	-- 查詢目標身上迷煙印記的等級
--	DebugMsg( 0, 0, "迷煙印記等級 = "..BonusDmgLv );
	if BonusDmgLv > -1 then
		SysCastSpellLv( Mumu, Target, g_Magic.DeepStrike.BonusAttackID, BonusDmgLv );
	end
end

---------- 武裝邦卡 ----------
function MagicBase_626312_Plot()	-- 投射彈 擊中時執行傷害

	local Banka = OwnerID();
	local Target = TargetID();	-- 玩家
	CallPlot( Banka, "MagicBase_626312_Plot2", Banka, Target );
end

function MagicBase_626312_Plot2( Banka, Target )

	Sleep(5);	-- 延遲時間再執行攻擊
	SysCastSpellLv( Banka, Target, g_Magic.ThrowingBomb.AttackID, 0 );
end
----
function Instance_Z30_Banka_CombatFog( Banka, Mumu, Room )	-- 戰火迷煙

	local CastObj = Hao_CreateSpellObj( Banka, 0, 10 );	-- 於 Banka 位置產生透明施法物件，監控此次戰火迷煙的飛彈( 參考物件、參考角度、生存時間( 單位:1秒 ) )
 	CallPlot( CastObj, "Instance_Z30_Banka_CombatFog2", CastObj, Banka, Mumu );
end

function Instance_Z30_Banka_CombatFog2( CastObj, Banka, Mumu )

	local Room = ReadRoleValue( Banka, EM_RoleValue_RoomID );
	local ShootDir = g_Magic.CombatFog.ShootDir;
	local DelayTime = g_Magic.CombatFog.DelayTime;
--	DebugMsg( 0, 0, "RandomShootDir = "..RandomShootDir );

	g_Magic.CombatFog.HitUnits[Room] = {};	-- 重置戰火迷煙的命中狀態

	for Wave = 1, #ShootDir do
		-- 合體中、利索姆姆死亡、邦卡離開戰鬥、仇恨目標 = 0 時提前退出
		if g_Combination[Room] or ReadRoleValue( Mumu, EM_RoleValue_IsDead ) == 1 or ReadRoleValue( Banka, EM_RoleValue_IsAttackMode ) == 0 or g_HateList[Room] == 0 then
			break;
		end

		local HateList = GetHateList( Mumu, g_HateList[Room] );	-- 取仇恨表內的目標
		local Haters = {};
		for i = 1, #HateList do
			local Player = HateList[i].Guid;
			if ReadRoleValue( Player, EM_RoleValue_Voc ) ~= 0 then	-- 非GM
				table.insert( Haters, Player );
			end
		end

		local BankaPos = Vector_GetRolePos( Banka );
		local BankaDir = ReadRoleValue( Banka, EM_RoleValue_Dir );
		StopMove( Banka, false );
		CastSpellLv( Banka, Banka, g_Magic.CombatFog.ActID, 0 );

		g_Magic.CombatFog.HitUnits[Room][Wave] = {};	-- 每次發射飛彈時，重置飛彈波次的命中狀態

		local RandomShootDir = Math.Random(360);	-- 自由射擊

		for j = 1, #ShootDir[Wave] do
			local MissileDir = BankaDir+ShootDir[Wave][j];
			if Wave ~= 1 then
				MissileDir = MissileDir + RandomShootDir;
			end
			local VecDir = Vector_DirToVector( MissileDir+90 );	-- 角度轉向量，Rom 使用角度轉向量時必須 + 90 度才會為物件角度
			local MissilePos = BankaPos + VecDir * g_Magic.CombatFog.Spacing;
			if MissileDir > 360 then MissileDir = MissileDir - 360 end;
		--	DebugMsg( 0, 0, "MissileDir = "..MissileDir );
			local Missile = CreateObj( g_Magic.CombatFog.NpcID, MissilePos.X, MissilePos.Y+10, MissilePos.Z, MissileDir, 1 );
			WriteRoleValue( Missile, EM_RoleValue_LiveTime, 6 );	-- 預設生存時間 6 秒
			MoveToFlagEnabled( Missile, false );	-- 關閉巡邏劇情
			WriteRoleValue( Missile, EM_RoleValue_IsWalk, 0 );	-- 跑步
			SetModeEx( Missile, EM_SetModeType_ShowRoleHead, false );	-- 頭相框
			SetModeEx( Missile, EM_SetModeType_Mark, false );	-- 標記
			SetModeEx( Missile, EM_SetModeType_Gravity, false );	-- 重力
			SetModeEx( Missile, EM_SetModeType_Fight, false );	-- 砍殺
			SetModeEx( Missile, EM_SetModeType_Searchenemy, false );	-- 索敵
			SetModeEx( Missile, EM_SetModeType_Strikback, false );	-- 反擊
			AddToPartition( Missile, Room );
			CallPlot( Missile, "Instance_Z30_Banka_CombatFog3", Missile, Banka, Room, MissileDir, Haters, Wave );
		--	DelayTime = DelayTime + g_Magic.CombatFog.TickTime;
		end
		Sleep( g_Magic.CombatFog.TickTime );
	end
	DelObj( CastObj );
end

function Instance_Z30_Banka_CombatFog3( Owner, Banka, Room, MissileDir, Haters, Wave )	-- 範圍判定由 Lua 進行，不使用法術集合，法術集合沒辦法以飛行道具的方式設定，也不能設定寬度

	-- 技能設定 (仿三專的法術盒子 )
	local OwnerPos = Vector_GetRolePos( Owner );
	local FlyTime = Math.Ceil( g_Magic.CombatFog.Dis / g_Magic.CombatFog.FlySpeed );	-- 技能由起點飛行至終點的時間(單位:0.1秒)
	Sleep(g_Magic.CombatFog.DelayTime);

	local BeginPos = OwnerPos;	-- 每段區間的起點座標
	local VecDir = Vector_DirToVector( MissileDir+90 );	-- 角度轉向量，計算ROM的角度時，要先轉 90 度角才會變為正確向量。
	local EndPos	-- 每段區間的終點座標
	local HitUnits = {};	-- 每枚飛彈獨自的命中狀態，避免單一目標被重複命中

	while FlyTime > -1 do

		if not g_Magic.CombatFog.HitUnits[Room][Wave][FlyTime] then
			g_Magic.CombatFog.HitUnits[Room][Wave][FlyTime] = {};
		end

		EndPos = BeginPos + VecDir * g_Magic.CombatFog.FlySpeed;
		MoveDirect( Owner, EndPos.X, EndPos.Y, EndPos.Z );
		Sleep(1);
		for i = 1, #Haters do
			local Target = Haters[i];
			local TargetPos = Vector_GetRolePos( Target );
			--檢查目標是否在指定長、寬的直線範圍內，否回傳Nil、是的話回傳目標與起點的距離 ( 起點座標、終點座標、寬度、高度、目標座標)
			local Status = Vector_CheckShootObj( BeginPos, EndPos, g_Magic.CombatFog.Width, g_Magic.CombatFog.Height, TargetPos );
		--	if Status then
			--	DebugMsg( 0, 0, "No. "..i.. ", Hit = "..tostring( Status ) );
		--	end
			-- 當命中成立，且此飛彈尚未命中目標以及其他飛彈在此檢查點也尚未命中時
			if Status and not HitUnits[Target] and not g_Magic.CombatFog.HitUnits[Room][Wave][FlyTime][Target] then
				HitUnits[Target] = true; 
				g_Magic.CombatFog.HitUnits[Room][Wave][FlyTime][Target] = true;	-- 複數飛彈在同時間擊中同一目標時，只會執行一次傷害，避免重複命中
				SysCastSpellLv( Banka, Target, g_Magic.CombatFog.AttackID, 0 );
				DebugMsg( 0, 0, "武裝邦卡 - 戰火迷煙, 目標與飛彈距離 = "..String.format( "%.1f", tostring( Status ) )..", 目標與發射起點距離 = "..String.format( "%.1f", (OwnerPos-TargetPos):Len() ) );
			end
		end
		BeginPos = EndPos;
		FlyTime = FlyTime - 1;
	end
	DelObj( Owner );
end

-------------- 利索姆姆與武裝邦卡合體 --------------
function Instance_Z30_Banka_QuicksandBomb( Banka, Mumu, Room )	-- 流沙彈

	local HateList = GetHateList( Banka, g_HateList[Room] );	-- 取仇恨表內的目標
	StopMove( Banka, false );
	SetModeEx( Banka, EM_SetModeType_Move, false );
	CastSpellLv( Banka, Banka, g_Magic.QuicksandBomb.ActID, 0 );	-- 施法特效
	Sleep(10);
	
	for i = 1, g_Magic.QuicksandBomb.Count do
		if not g_Combination[Room] then	-- 因為有時間差，故在每次施放時，都要先檢查是否在和體狀態，避免合體解除時，武裝邦卡依然在施放流沙彈的問題
			break;
		end
	--	DebugMsg( 0, 0, "流沙彈 "..i..", 仇恨目標數量 = "..#HateList );
		local Targets = HateList[ Math.random( #HateList ) ];
		local CastObj = Hao_CreateSpellObj( Targets.Guid, 0, g_Magic.QuicksandBomb.LiveTime );	-- 於仇恨表內 1 名隨機目標位置產生透明施法物件( 參考物件、參考角度、生存時間( 單位:1秒 ) )
		Addbuff( CastObj, g_BuffID.QuicksandBombWarning, 0, -1 );	-- 預警效果
		SysCastSpellLv( Banka, CastObj, g_Magic.QuicksandBomb.RunLuaID, 0 );	-- 飛行特效 ( 施法特效與飛行特效不可結合... 動作過慢時，法術會發不出來...
		Sleep( g_Magic.QuicksandBomb.TickTime );
	end
	SetModeEx( Banka, EM_SetModeType_Move, true );
end

function MagicBase_626308_Plot()	-- 流沙彈 擊中特效物件時

	local Banka = OwnerID();	-- Boss
	local Target = TargetID();	-- 特效物件
	local Room = ReadRoleValue( Banka, EM_RoleValue_RoomID );
	local FlySpeed = 200;	-- ROM 中飛行特效的飛行速度統一為秒速 200
	local Distance = GetDistance( Banka, Target );
	local DelayTime = Math.Ceil( (Distance/FlySpeed)*10 );	-- 到達目的地前的延遲時間
--	DebugMsg( 0, 0, "DelayTime = "..DelayTime );

	if not g_Magic.QuicksandBomb.HitUnits[Room] then
		g_Magic.QuicksandBomb.HitUnits[Room] = {};
	--	DebugMsg( 0, Room, "Create Room" );
	end
	CallPlot( Target, "MagicBase_626308_Plot2", Target, Banka, Room, DelayTime );
end

function MagicBase_626308_Plot2( Owner, Banka, Room, DelayTime )	-- 由各特效物件執行，避免 Already running 的問題

	Sleep(DelayTime);
	CancelBuff_NoEvent( Owner, 507881 );	-- 刪除預警特效

	local HateList = GetHateList( Banka, g_HateList[Room] );	-- 取仇恨表內的目標
	local Haters = {};
	for i = 1, #HateList do
		local Player = HateList[i].Guid;
		if ReadRoleValue( Player, EM_RoleValue_Voc ) ~= 0 then	-- 非GM
			table.insert( Haters, Player );
		end
	end

	while true do
		SysCastSpellLv( Owner, Owner, g_Magic.QuicksandBomb.ActID, 0 );	-- 流沙特效
		local Time = GetSystime(0);
		if not g_Magic.QuicksandBomb.HitUnits[Room][Time] then	-- 複數流沙同時間只能對玩家造成 1 次傷害 (最小單位:1秒，以迴圈的 Sleep 時間為準)
			g_Magic.QuicksandBomb.HitUnits[Room][Time] = {};
		--	DebugMsg( 0, Room, "Create Time"..Time );
		end

		if #Haters > 0 then
			for i = 1, #Haters do
				local Target = Haters[i];
				if GetDistance( Owner, Target ) <= g_Magic.QuicksandBomb.Range and not g_Magic.QuicksandBomb.HitUnits[Room][Time][Target] then
					g_Magic.QuicksandBomb.HitUnits[Room][Time][Target] = true;
					SysCastSpellLv( Banka, Target, g_Magic.QuicksandBomb.AttackID, 0 );	-- 流沙的單體傷害&緩速
				--	DebugMsg( 0, Room, "流沙彈 擊中時間:"..Time );
				end
			end
		end
		Sleep(g_Magic.QuicksandBomb.ContinuousCastTickTime);
	end
end
--------------
function Instance_Z30_Banka_GroundMissile( Banka, Mumu, Room )	-- 地勤導彈

	if g_Magic.GroundMissile.List[Room] == nil then
		g_Magic.GroundMissile.List[Room] = {};
	end
	g_Magic.GroundMissile.HitBanka[Room] = false;

	StopMove( Banka, false );
	CastSpellLv( Banka, Banka, g_Magic.GroundMissile.ActID, 0 );
	Sleep(10);	-- 施法表演時間

	local HateList = GetHateList( Banka, g_HateList[Room] );
	for i = 1, g_Magic.GroundMissile.Count do
		if #HateList == 0 then
			break;
		end
		local BankaPos = Vector_GetRolePos( Banka );
		local BankaDir = ReadRoleValue( Banka, EM_RoleValue_Dir );
		BankaPos.Y = BankaPos.Y + 15;
		local GroundMissile = Hao_CreateSpellObjbyPos( BankaPos, BankaDir, 60 )	-- 產生施法物件( 參考位置、參考面向、存在時間( 單位: 1秒 ) )
		SetModeEx( GroundMissile, EM_SetModeType_Move, true );	-- 開啟移動
		table.insert( g_Magic.GroundMissile.List[Room], GroundMissile );

		local Target = table.remove( HateList, Math.Random(#HateList) );	-- 仇恨表中 1 名隨機目標
		CallPlot( GroundMissile, "Instance_Z30_Banka_GroundMissile_2", GroundMissile, Banka, Mumu, Target.Guid, Room );
		Sleep( g_Magic.GroundMissile.TickTime );
	end
end

function Instance_Z30_Banka_GroundMissile_2( GroundMissile, Banka, Mumu, LockTarget, Room )

	local Counter = 0;
	local Target = LockTarget;

	while g_Combination[Room] and CheckID( Banka ) do	--  當合體中及武裝邦卡存在時

		SysCastSpellLv( GroundMissile, GroundMissile, g_Magic.GroundMissile.ContinuousActID, 0 );

		if Counter > g_Magic.GroundMissile.ReadyTime then	-- 當準備時間結束後，才開始搜尋

			-- 先檢查玩家再檢查武裝邦卡，避免玩家貼近武裝邦卡站著不動，地勤導彈就會命中武裝邦卡的問題。
			local HateList = GetHateList( Banka, g_HateList[Room] );
			for i = 1, #HateList do
				if GetDistance( GroundMissile, HateList[i].Guid ) <= g_Magic.GroundMissile.PlayerTriggerRange then
					DebugMsg( 0, 0, "地勤導彈與鎖定玩家距離 = "..GetDistance( HateList[i].Guid, GroundMissile ) );
					SysCastSpellLv( Banka, HateList[i].Guid, g_Magic.GroundMissile.AttackID, 0 );
					DelObj( GroundMissile );
					return;
				end
			end

			if GetDistance( Banka, GroundMissile ) < g_Magic.GroundMissile.BankaTriggerRange and not g_Magic.GroundMissile.HitBanka[Room] then
				DebugMsg( 0, 0, "地勤導彈與武裝邦卡距離 = "..GetDistance( Banka, GroundMissile ) );
				g_Magic.GroundMissile.HitBanka[Room] = true;
				SysCastSpellLv( Banka, Banka, g_Magic.GroundMissile.AttackID, 0 );
				break;
			end
		end

		if not CheckID(Target) or ReadRoleValue( Target, EM_RoleValue_IsDead ) == 1 then	-- 當追蹤途中目標死亡或消失時，重取 1 名隨機目標
			local HateList = GetHateList( Banka, g_HateList[Room] );
			if #HateList > 0 then
				local Targets = table.remove( HateList, Math.Random(#HateList) );
				Target = Targets.Guid;
			else	-- 仇恨表內沒有任何目標時
				break;
			end
		end
		local TargetPos = Vector_GetRolePos( Target );
	--	DebugMsg( 0, 0, "Target = "..tostring(Target.Guid) );
	--	Say( Target, "I'm here" );
		MoveDirect( GroundMissile, TargetPos.X, TargetPos.Y+15, TargetPos.Z );

		Sleep( g_Magic.GroundMissile.ContinuousCastTickTime );
		Counter = Counter + g_Magic.GroundMissile.ContinuousCastTickTime;
	end

	for i = 1, #g_Magic.GroundMissile.List[Room] do	-- 刪除場上其他的地勤導彈，先排除掉自己
		if g_Magic.GroundMissile.List[Room][i] ~= GroundMissile and CheckID( g_Magic.GroundMissile.List[Room][i] ) then
			DelObj( g_Magic.GroundMissile.List[Room][i] );
		end
	end

	Instance_Z30_Boss1_Detach( Banka, Mumu, Room )
	DelObj( GroundMissile );
end

function MagicBase_625245_Check()	-- 地勤導彈 命中檢查

	local Banka = OwnerID();	-- 邦卡
	local Target = TargetID();	-- 目標
	if Target == Banka then
		return false;
	end
	return true;
end
--------------
function Instance_Z30_Banka_EngryWeb( Banka, Room )	-- 能量網

	if g_Combination[Room] and ReadRoleValue( Banka, EM_RoleValue_IsDead ) == 0 then	-- 判斷是否為合體中，避免因表演時間內已解除合體而引發的後續問題。
	--	DebugMsg( 0, 0, "撒出能量網"..", SysTime = "..GetSystime(0) );
		local BankaPos = Vector_GetRolePos( Banka );
		for i = 1, g_Magic.EngryWeb.Count do
			local VecDir = Vector_DirToVector( Math.Random( 36*(i-1), 36*i-1 ) );	-- 每 1 個刻度隨機 1 次，最後分布成固定區域但隨機位置的圓
			local TargetPos = BankaPos + VecDir * Math.Random( g_Magic.EngryWeb.MiniRange, g_Magic.EngryWeb.MaxRange );
			local CastObj = Hao_CreateSpellObjbyPos( TargetPos );	-- 在目標位置建立施法物件
			CallPlot( CastObj, "Instance_Z30_Banka_EngryWeb_2", CastObj, Banka, Room );
			Sleep(g_Magic.EngryWeb.TickTime);
		end
	end
end

function Instance_Z30_Banka_EngryWeb_2( CastObj, Banka, Room )	-- 能量網

	Sleep( g_Magic.EngryWeb.ReadyTime );
	while g_Combination[Room] and ReadRoleValue( Banka, EM_RoleValue_IsDead ) == 0 do	-- 避免因表演時間內已解除合體而引發的後續問題。
		SysCastSpellLv( CastObj, CastObj, g_Magic.EngryWeb.ContinuousActID, 0 );
		Sleep( g_Magic.EngryWeb.ContinuousCastTickTime );
	end
--	DebugMsg( 0, 0, "刪除能量網" );
	DelObj( CastObj );
end

function Instance_Z30_Banka_EnergizedCannonShot( Banka, Mumu, Room )	-- 能量砲

	local HateList = GetHateList( Banka, g_HateList[Room] );
	for i = #HateList, 1, -1 do
		local Targets = table.remove( HateList, Math.Random(#HateList) );	-- 仇恨表中 1 名隨機目標 ( 包括 Guid, Dis, HatePoint )
		if CheckBuff( Targets.Guid, g_BuffID.EnergyMark ) then
			DebugMsg( 0, 0, ", 合體 - 施放能量砲" );
			StopMove( Banka, false );
			CastSpellLv( Banka, Targets.Guid, g_Magic.EnergizedCannonShot.AttackID, 0 );	-- 傷害ID
			return true;
		end
	end
	return false;
end

function MagicBase_625240_Check()	-- 能量砲命中檢查

	local Banka = OwnerID();
	local Target = TargetID();

	if CheckBuff( Target, g_BuffID.EnergyMark ) then	-- 攻擊後，消除目標身上的能量網Debuff
		CancelBuff_NoEvent( Target, g_BuffID.EnergyMark );
		return true;
	end
	return false;
end
--------------