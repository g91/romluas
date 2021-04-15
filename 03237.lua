
local g_ObjID = {};	-- 除 Boss 外的物件清單
local g_MagicID = {};	-- 法術集合清單
local g_BuffID = {};	-- 基本法術清單
local g_Msg = {};	-- 訊息清單
local g_FlagID_CreateObj = 781379;	-- 物件產生旗標
local g_Control = {};	-- 中控器
local g_Switch = {};	-- 區域控制器
local g_Stage = {}; 	-- 階段控制器
local g_BossList = {};	-- Boss 清單
local g_HateList = {}	-- 記錄仇恨列表
local g_Door = {};	-- 門控制器
local g_MagicFlySpeed = 200; -- 指向目標的預設秒速，詢問祥人後，得出的系統預設值(同出手延遲加上與目標距離的功能)，避免避開拋物線，卻依然會命中的問題

g_MagicID.Act = 499223;	-- 共用表演特效

g_BuffID.Bind = 500467;	-- 束縛特效，各物件在未開戰前套用特效
g_BuffID.Fury = 625217;	-- 卡沙之怒 狂暴化
g_BuffID.UnRecoverHp = 502707;	-- 停止自動回血，避免取消索敵的物件快速回血。
g_BuffID.Unstoppable = 508071;	-- 防駭客機制：毀天滅地
g_BuffID.ForBoss1 = 500476;	-- 沼澤楞喀起始時掛載的Buff，讓沼澤楞喀施放火焰衝鋒後殘留的小型夜火，能夠判斷是否要治療沼澤楞喀。
g_BuffID.ForBoss3 = 500477;	-- 貪食沙蟲起始時掛載的Buff，讓沼澤楞喀的夜火燎播，能夠判斷是否要強化貪食沙蟲。
--g_BuffID.UnFight = 507899;	-- 不可用物理攻擊，給表演用物件使用

g_Msg.StartFight = "[SC_108434_01]"	-- 開戰：[104492]：「嗚嘎…你們是誰呢？知道什麼是宿奴嗎…？」
g_Msg.Fury = "[SC_108434_02]"	-- 狂暴：[104492]：「嘻嘻…我還有更多更多招式沒用唷，懊悔…嗎？」
g_Msg.Reset = "[SC_108434_03]"	-- 重置：[104492]：「啊…？就只有這樣子？還以為會很好玩…呼嗯…」
g_Msg.Dead = "[SC_108434_04]"	-- 死亡：[104492]訝異地看著自己身上的傷痕：「嗚嗚…不要死，不想……」
g_Msg.Stage1 = "[SC_108434_05]"	-- 第一階段開始：[104492]：「愣喀的火焰你們一定沒體會過！有試過靈魂燃燒的感覺嗎…？」
g_Msg.Stage2 = "[SC_108434_06]"	-- 第二階段開始：[104492]開心地看著一切：「哇，這個呢？換嚐嚐元素之靈的能量好了！」
g_Msg.Stage3 = "[SC_108434_07]"	-- 第三階段開始：[104492]：「嘎嗚…沙蟲的劇毒很可怕喔！」

g_Switch[166] = {}	-- 困難模式
g_Switch[166].Boss0 = 108434;	-- 階段四：艾拉那那 10%
g_Switch[166].Boss1 = 108437;	-- 階段一：沼澤楞喀
g_Switch[166].Boss2 = 108435;	-- 階段二：焰風魅惑者
g_Switch[166].Boss3 = 108436;	-- 階段三：貪食沙蟲
g_Switch[166].furyTime = 480;	-- 狂暴時間

g_Switch[167] = {}	-- 普通模式
g_Switch[167].Boss0 = 103402;	-- 階段四：艾拉那那 10%
g_Switch[167].Boss1 = 103405;	-- 階段一：沼澤楞喀
g_Switch[167].Boss2 = 103403;	-- 階段二：焰風魅惑者
g_Switch[167].Boss3 = 103404;	-- 階段三：貪食沙蟲
g_Switch[167].furyTime = 360;	-- 狂暴時間

g_Switch[168] = {}	-- 簡單模式
g_Switch[168].Boss0 = 103412;	-- 階段四：艾拉那那 10%
g_Switch[168].Boss1 = 103415;	-- 階段一：沼澤楞喀
g_Switch[168].Boss2 = 103413;	-- 階段二：焰風魅惑者
g_Switch[168].Boss3 = 103414;	-- 階段三：貪食沙蟲
g_Switch[168].furyTime = 360;	-- 狂暴時間

g_Switch[951] = {}	-- 困難模式
g_Switch[951].Boss0 = 106966;	-- 階段四：艾拉那那 10%
g_Switch[951].Boss1 = 106963;	-- 階段一：沼澤楞喀
g_Switch[951].Boss2 = 106964;	-- 階段二：焰風魅惑者
g_Switch[951].Boss3 = 106965;	-- 階段三：貪食沙蟲
g_Switch[951].furyTime = 480;	-- 狂暴時間

-- 階段一：沼澤楞喀 --------------------------------------
g_MagicID.Steam = 499225;	-- 噴蒸氣
g_MagicID.SteamCD = 11;	-- 冷卻時間：11秒
g_MagicID.SteamCastTime = 10;	-- 法術集合中的施法時間(單位:0.1秒)

g_MagicID.FireCharge = 499227;	-- 火焰衝鋒，平均分擔傷害
g_MagicID.FireChargeCD = 19;	-- 冷卻時間：19秒(單位:1秒)
g_MagicID.FireChargeCastTime = 5;	-- 法術集合中的施法時間(單位:0.1秒)
g_MagicID.FireChargeObj = 107071;	-- 火焰衝鋒，透明物件
g_MagicID.FireChargeObjLiveTime = 10;	-- 火焰衝鋒，透明物件生存時間(單位:1秒)
g_MagicID.NightBlaze = 499229;	-- 夜火燎播，第三階段開始後新增技能
g_MagicID.NightBlazeCD = 3;	-- 冷卻時間：3秒(單位:1秒)
g_MagicID.NightBlazeCastTime = 0;	-- 法術集合中的施法時間(單位:0.1秒)

g_ObjID.NightFire = 103937;	-- 夜火
g_ObjID.NightFireLiveTime = 6;	-- 夜火存在於場上的時間(單位1秒)
g_MagicID.NightFireHeal = 499224;	-- 夜火的正面效果，治療沼澤楞喀，並強化貪食沙蟲
g_MagicID.NightFireDmg = 499228;	-- 夜火的負面效果，對玩家造成傷害
g_MagicID.NightFireTickTime = 5;	-- 夜火每次施放傷害(治療)後的間格時間
g_MagicID.NightFireRange = 25;	-- 每個夜火的圓直徑
g_BuffID.NightFire = 500466;	-- 夜火 Buff (火焰燃燒的特效)

-- 階段二：焰風魅惑者 --------------------------------------
-- 靈氣對 Npc 效果
g_MagicID.AuraBuff = {};
g_MagicID.AuraBuff[0] = 499231;	-- 風
g_MagicID.AuraBuff[1] = 0;	-- 地
g_MagicID.AuraBuff[2] = 499234;	-- 水

-- 靈氣對玩家效果
g_MagicID.AuraDeBuff = {};
g_MagicID.AuraDeBuff[0] = 499222;	-- 風
g_MagicID.AuraDeBuff[1] = 499232;	-- 地
g_MagicID.AuraDeBuff[2] = 499221;	-- 水

-- 靈氣特效
g_BuffID.Aura = {};
g_BuffID.Aura[0] = 500508;	-- 風速之靈
g_BuffID.Aura[1] = 500951;	-- 地源之靈
g_BuffID.Aura[2] = 500953;	-- 水精之靈

-- 將指定目標召喚至面前
g_MagicID.ReCall = {};
g_MagicID.ReCall[0] = 499230;	-- 風
g_MagicID.ReCall[1] = 499233;	-- 地
g_MagicID.ReCall[2] = 499235;	-- 水

-- 將指定目標召喚至面前的特效
g_BuffID.ReCall = {};
g_BuffID.ReCall[0] = 500624;	-- 風召喚
g_BuffID.ReCall[1] = 500625;	-- 地召喚
g_BuffID.ReCall[2] = 500626;	-- 水召喚

-- 階段三：貪食沙蟲 --------------------------------------
g_MagicID.TerrorArrow = 499236;	-- 恐懼毒箭
g_MagicID.TerrorArrowCD = 11;	-- 冷卻時間：11秒(單位:1秒)
g_MagicID.TerrorArrowCastTime = 0;	-- 法術集合中的施法時間(單位:0.1秒)
g_MagicID.TerrorArrowTargetsCount = 2;	-- 每次施放時的目標數量

g_MagicID.Whirlwind = 499239;	-- 旋風斬
g_MagicID.WhirlwindCD = 13;	-- 冷卻時間：13秒(單位:1秒)
g_MagicID.WhirlwindCastTime = 0;	-- 法術集合中的施法時間(單位:0.1秒)

 --------------------------------------
local function HpPercent( ObjID )	-- 查詢 HP%

	local Hp = ReadRoleValue( ObjID, EM_RoleValue_Hp );	-- 當前 Hp
	local MaxHp = ReadRoleValue( ObjID, EM_RoleValue_MaxHp );	-- 最大 Hp
	return Hp/MaxHp;
end

local function Boss0CommonAct( Owner, Target )	-- Boss 通用表演與開戰設定

	SetModeEx( Owner, EM_SetModeType_Show, false );	-- 顯示
	SetModeEx( Owner, EM_SetModeType_Mark, false );	-- 標記
	SysCastSpellLv( Target, Target, g_MagicID.Act, 0 );	-- 表演特效
	CancelBuff( Target, g_BuffID.Bind );	-- 取消束縛特效
	SetModeEx( Target, EM_SetModeType_Move, true );	-- 移動
	SetModeEx( Target, EM_SetModeType_Fight, true );	-- 砍殺
	SetModeEx( Target, EM_SetModeType_Searchenemy, true );	-- 索敵
end

local function DelObjInit( Room )	-- 刪除場上相關物件

	for i = 0, #g_BossList[Room], 1 do	-- 刪除 Boss
		if type(g_BossList[Room][i]) == "table" then	-- 刪除階段二：焰風魅惑者
			for j = 0, #g_BossList[Room][i] do
				DelObj( g_BossList[Room][i][j] );
			end
		else
			DelObj( g_BossList[Room][i] );
		end
	end
	Lua_DavisDelObj( g_ObjID.NightFire );	-- 刪除殘留夜火
end

local function CheckObjFury( Room )	-- Boss 狂暴判斷

	if g_BossList[Room][0] and not CheckBuff( g_BossList[Room][0], g_BuffID.Fury ) then	-- 階段四：艾拉那那本體
		AddBuff( g_BossList[Room][0], g_BuffID.Fury, 0, -1 );
	end

	if not g_BossList[Room].BossIsDead[1] and not CheckBuff( g_BossList[Room][1], g_BuffID.Fury ) then	-- 階段一：沼澤愣喀
		AddBuff( g_BossList[Room][1], g_BuffID.Fury, 0, -1 );
		ScriptMessage( g_BossList[Room][1], -1, 2, g_Msg.Fury, 0 );
	end

	for i = 0, #g_BossList[Room][2], 1 do	-- 階段二：焰風魅惑者
		if CheckID( g_BossList[Room][2][i] ) and not CheckBuff( g_BossList[Room][2][i], g_BuffID.Fury ) then
			AddBuff( g_BossList[Room][2][i], g_BuffID.Fury, 0, -1 );
		end
	end

	if not CheckBuff( g_BossList[Room][3], g_BuffID.Fury ) then	-- 階段三：貪食沙蟲
		AddBuff( g_BossList[Room][3], g_BuffID.Fury, 0, -1 );
	end
end

local function CheckObjHackAction( Room )	-- 防駭客機制判斷 - 跳王的玩家會遇到附加 - Buff 卡沙之怒的 Boss

	if CheckBuff( g_BossList[Room][0], g_BuffID.Unstoppable ) then	-- 艾拉那那

		if not g_BossList[Room].BossIsDead[1] and not CheckBuff( g_BossList[Room][1], g_BuffID.Unstoppable ) then	-- 階段一：沼澤愣喀
			AddBuff( g_BossList[Room][1], g_BuffID.Unstoppable, 0, -1 );
		end

		for i = 0, #g_BossList[Room][2], 1 do	-- 階段二：焰風魅惑者
			if CheckID( g_BossList[Room][2][i] ) and not CheckBuff( g_BossList[Room][2][i], g_BuffID.Unstoppable ) then
				AddBuff( g_BossList[Room][2][i], g_BuffID.Unstoppable, 0, -1 );
			end
		end

		if not CheckBuff( g_BossList[Room][3], g_BuffID.Unstoppable ) then	-- 階段三：貪食沙蟲
			AddBuff( g_BossList[Room][3], g_BuffID.Unstoppable, 0, -1 );
		end
	end
end

local function ObjDefaultStatus( ObjID, FlagNum, Zone, Room )	-- 各階段 Boss 產生時的預設狀態

	local X, Y, Z, Dir = DW_Location( g_FlagID_CreateObj, FlagNum );	-- 讀取指定旗標指定編號的座標
	local Boss = CreateObj( ObjID, X, Y, Z, Dir, 1 );	-- 建立物件

	if FlagNum == 0 then	-- 艾拉那那
		SetModeEx( Boss, EM_SetModeType_Fight, false );	-- 關閉砍殺
		SetModeEx( Boss, EM_SetModeType_Searchenemy, true );	-- 索敵
		SetModeEx( Boss, EM_SetModeType_Move, true );	-- 關閉移動
		WriteRoleValue( Boss, EM_RoleValue_IsWalk, 0 );	-- 設定為跑步
		MoveToFlagEnabled( Boss, false );	-- 關閉巡邏劇情
		AddToPartition( Boss, Room );
		return Boss;
	end

	if FlagNum == 1 then	-- 沼澤楞喀
		AddBuff( Boss, g_BuffID.ForBoss1, 0, -1 );
	elseif FlagNum == 3 then	-- 貪食沙蟲
		AddBuff( Boss, g_BuffID.ForBoss3, 0, -1 );
	end
	AddBuff( Boss, g_BuffID.Bind, 0, -1 );	-- 束縛特效
	SetModeEx( Boss, EM_SetModeType_Fight, false );	-- 關閉砍殺
	SetModeEx( Boss, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( Boss, EM_SetModeType_Move, false );	-- 關閉移動
	AddToPartition( Boss, Room );
	return Boss;
end

local function CreateObjInit( Zone, Room )	-- 物件產生劇情

	g_Door[Room] = 0;	-- 門開關， 0 = 開啟、1 = 關閉

	g_BossList[Room] ={};	-- 重置此 Room 記錄的 Boss 清單
	g_BossList[Room][0] = ObjDefaultStatus( g_Switch[Zone].Boss0, 0, Zone, Room );	-- 艾拉那那本體
	g_BossList[Room][1] = ObjDefaultStatus( g_Switch[Zone].Boss1, 1, Zone, Room );	-- 階段一：沼澤楞喀
	g_BossList[Room][2] = {}
	g_BossList[Room][2][0] = ObjDefaultStatus( g_Switch[Zone].Boss2, 2, Zone, Room );	-- 階段二：焰風魅惑者
	g_BossList[Room][3] = ObjDefaultStatus( g_Switch[Zone].Boss3, 3, Zone, Room );	-- 階段三：貪食沙蟲

	Cl_Resist_HackersBossNum( g_BossList[Room][0] );	-- 防駭客機制，避免玩家跳王打
	SetPlot( g_BossList[Room][0], "Dead", "Zone_166_Boss2_Boss0_DeadPlot", 0 );	-- 艾拉那那死亡劇情
	SetPlot( g_BossList[Room][1], "Dead", "Zone_166_Boss2_Boss1_DeadPlot", 0 );	-- 沼澤楞喀死亡劇情
	SetPlot( g_BossList[Room][3], "Dead", "Zone_166_Boss2_Boss3_DeadPlot", 0 );	-- 貪食沙蟲死亡劇情

	-- 死亡狀態
	g_BossList[Room].BossIsDead ={};	-- 重置此 Room 記錄的 Boss 死亡狀態
	g_BossList[Room].BossIsDead[0] = false;	-- 艾拉那那
	g_BossList[Room].BossIsDead[1] = false;	-- 沼澤楞喀
--	g_BossList[Room].BossIsDead[2] = {};
--	g_BossList[Room].BossIsDead[2][0] = false;	-- 焰風魅惑者 1
--	g_BossList[Room].BossIsDead[2][1] = false;	-- 焰風魅惑者 2
--	g_BossList[Room].BossIsDead[2][2] = false;	-- 焰風魅惑者 3
	g_BossList[Room].BossIsDead[3] = false;	-- 貪食沙蟲

	g_HateList[Room] = {};	-- 重置此 Room 記錄的仇恨列表清單 ( 階段一 - 三為沼澤楞喀使用，階段四後轉由艾拉那那使用 )
	g_Stage[Room] = 0;	-- 將階段控制重置為 0
end

function Zone_166_Boss2_Boss0_DeadPlot()	-- 艾拉那那死亡劇情

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	g_BossList[Room].BossIsDead[0] = true;	-- 艾拉那那
	g_Door[Room] = 2;	-- 讓門撥放開啟動作
	ScriptMessage( Owner, -1, 2, g_Msg.Dead, 0 );	-- 死亡訊息
	Cl_Resist_HackersBossDead( Owner );	-- 防駭客死亡時註冊
end

function Zone_166_Boss2_Boss1_DeadPlot()	-- 沼澤楞喀死亡劇情

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	g_BossList[Room].BossIsDead[1] = true;
end

function Zone_166_Boss2_Boss3_DeadPlot()	-- 貪食沙蟲死亡劇情

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	g_BossList[Room].BossIsDead[3] = true;
end

-- 測試用物件 106961
function Instacne_166_108329_InitLua()	-- 中控器起始劇情

	local Control = OwnerID();
	local Room = ReadRoleValue( Control, EM_RoleValue_RoomID );
	local Zone = ReadRoleValue( Control, EM_RoleValue_ZoneID );
	g_Control[Room] = Control;

	CreateObjInit( Zone, Room );	-- 產生各階段的 Boss
end

function Zone_166_Boss2_FightPlot()	-- 艾拉那那戰鬥劇情

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Control = g_Control[Room];
	local AttackTarget

	local HateList = HateListCount( Owner );
	for i = 0, HateList-1 do	-- 取仇恨表內的目標
		AttackTarget = HateListInfo( Owner, i, EM_HateListInfoType_GItemID );	-- 仇恨表中的隨機 1 名目標
		break;
	end

	if not g_BossList[Room].BossIsDead[1] then	-- 當沼澤楞喀沒死時
		SetModeEx( Owner, EM_SetModeType_Fight, false );	-- 關閉砍殺
		SetModeEx( Owner, EM_SetModeType_Searchenemy, false );	-- 索敵
		SetStopAttack( Owner );	-- 停止戰鬥，並清空戰鬥
		CallPlot( Control, "Instacne_166_CheckStage", Control, AttackTarget );
		return
	end
end

function Instacne_166_CheckStage( Control, AttackTarget  )	--  由中控器執行

	local Zone = ReadRoleValue( Control, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Control, EM_RoleValue_RoomID );
	local Boss0 = g_BossList[Room][0];	-- 艾拉那那
	local Boss1 = g_BossList[Room][1];	-- 沼澤楞喀
	local Boss2 = g_BossList[Room][2][0];	-- 焰風魅惑者
	local Boss3 = g_BossList[Room][3];	-- 貪食沙蟲

	g_Door[Room] = 1;	-- 進入戰鬥後，門關閉

	local Counter = 0;	-- 計數器
	local MoveTime = 0;	-- 艾拉那那移動至各Boss的時間
	local LeaveFightTime = 0;	-- 離開戰鬥累積時間
	local DefaultLeaveFightTime = 6;	-- 當仇恨表內沒有任何目標時，> 6 秒後會離開戰鬥，並重置正個機制
	local ActTime = 20;	-- 艾拉那那移動至各Boss後的表演時間

	ScriptMessage( Boss0, -1, 2, g_Msg.StartFight, 0 );	-- 開戰訊息

	while true do
	--	DebugMsg( 0, Room, "Counter = "..Counter );

		-- 共用仇恨列表
		if not g_BossList[Room].BossIsDead[1] then	-- 當沼澤楞喀存活時，仇恨列表以沼澤楞喀為準
			g_HateList[Room] = HateListCount( Boss1 );
		--	DebugMsg( 0, 0, "Boss1 , ".."LeaveFightTime = "..LeaveFightTime )
		elseif not g_BossList[Room].BossIsDead[3] then	-- 當沼澤楞喀死亡時，仇恨表以貪食沙蟲為準
			g_HateList[Room] = HateListCount( Boss3 );
		--	DebugMsg( 0, 0, "Boos3 , ".."LeaveFightTime = "..LeaveFightTime )
		else	-- 當沼澤楞喀與貪食沙蟲均死亡時，進入第四階段，仇恨表則以艾拉那那為準
			g_HateList[Room] = HateListCount( Boss0 );
		--	DebugMsg( 0, 0, "Boss0 , ".."LeaveFightTime = "..LeaveFightTime )
		end

		-- 脫離戰鬥判斷
		if g_HateList[Room] == 0 then
			LeaveFightTime = LeaveFightTime + 1;
		else
			LeaveFightTime = 0;	-- 恢復預設設定
		end

		-- 檢查是否以不正當的攻略方式進行擊殺Boss的行為，是的話給予各 Boss Buff - 毀天滅地
		CheckObjHackAction( Room );

		-- 檢查是否狂暴
		if Counter >= g_Switch[Zone].furyTime then
			CheckObjFury( Room );
		end
	--	DebugMsg( 0, 0, "g_HateList = "..g_HateList[Room] );

		-- 當開戰後仇恨列表中沒有目標時，重置戰鬥
		if not g_BossList[Room].BossIsDead[0] and LeaveFightTime > DefaultLeaveFightTime then

			g_Stage[Room] = 0;	-- 將階段回寫為 0
			local X, Y, Z, Dir = DW_Location( g_FlagID_CreateObj, 0 );	-- 讀取指定旗標指定編號的座標
			SetPos( Boss0, X, Y, Z, Dir );
    			SetModeEx( Boss0, EM_SetModeType_Show, true );	-- 顯示
			SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- 標記
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_BEGIN );
			Sleep( ActTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_END );
			ScriptMessage( Boss0, -1, 2, g_Msg.Reset, 0 );	-- 重置訊息
		--	Sleep( 10 );
			DelObjInit( Room );
			Sleep( 50 );	--  5 秒後初始化
			CreateObjInit( Zone, Room );	-- 產生各階段的 Boss
			break;
		end

		local Boss1_Hp = HpPercent( Boss1 );
	--	DebugMsg( 0, Room, "Hp percent = "..Boss1_Hp );

		if g_Stage[Room] == 0 then	-- 進入第一階段
			g_Stage[Room] = 1;
			LockHP( Boss1, ReadRoleValue( Boss1, EM_RoleValue_MaxHP)*0.65, "" );	-- 將 Boss 的血量鎖定在 65%，避免被秒殺的情況發生，致使劇情中斷
			MoveTime = MoveTarget( Boss0, Boss1 );	-- 艾拉那那往沼澤楞喀移動
			Sleep( MoveTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_BEGIN );
			Sleep( ActTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_END );
			ScriptMessage( Boss0, -1, 2, g_Msg.Stage1, 0 );	-- 第一階段訊息
			Boss0CommonAct( Boss0, Boss1 );
			SetAttack( Boss1, AttackTarget );
			CallPlot( Boss1, "Zone_166_Boss2_Stage1_Fight", Boss1, Boss0, Room );

		elseif g_Stage[Room] == 1 and Boss1_Hp < 0.7 then	-- 進入第二階段
			g_Stage[Room] = 2;
			LockHP( Boss1, ReadRoleValue( Boss1, EM_RoleValue_MaxHP)*0.35, "" );	-- 將 Boss 的血量鎖定在 35%，避免被秒殺的情況發生，致使劇情中斷
			local Boss1Pos = Vector_GetRolePos( Boss1 );
			local Dir = ReadRoleValue( Boss1, EM_RoleValue_Dir );
			SetPos( Boss0, Boss1Pos.X, Boss1Pos.Y, Boss1Pos.Z, Dir );
    			SetModeEx( Boss0, EM_SetModeType_Show, true );	-- 顯示
			SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- 標記
			MoveTime = MoveTarget( Boss0, Boss2 );	-- 艾拉那那往焰風魅惑者移動
			Sleep( MoveTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_BEGIN );
			Sleep( ActTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_END );
			ScriptMessage( Boss0, -1, 2, g_Msg.Stage2, 0 );	-- 第二階段訊息
			Boss0CommonAct( Boss0, Boss2 );
			CallPlot( Boss2, "Zone_166_Boss2_Stage2_Fight", Boss2, Boss0, Boss1, Control, Zone, Room );

		elseif g_Stage[Room] == 2 and Boss1_Hp < 0.4 then	-- 進入第三階段
			local Boss2_Hp = {};
			local Count = 0;	-- 焰風魅惑者(本體、分身)的Hp是否已進入 50%
			for i = 0, #g_BossList[Room][2] do	-- Boss 2
				Boss2_Hp[i] = HpPercent( g_BossList[Room][2][i] );
			--	DebugMsg( 0, Room, "Boss2["..i.."] Hp percent = "..Boss2_Hp[i] );
				if not CheckID(g_BossList[Room][2][i]) or Boss2_Hp[i] < 0.5 then	-- 該目標是否已死亡或生命 <  50%
					Count = Count + 1;
				end
			end
		--	DebugMsg( 0, Room, "Boss2 Stage2 LowHp(Dead) Count = "..Count );
			if Count == 3 then
				g_Stage[Room] = 3;
				LockHP( Boss1, -100, "" );	-- 解鎖 Boss 的血量鎖定

				local Boss1Pos = Vector_GetRolePos( Boss1 );
				local Dir = ReadRoleValue( Boss1, EM_RoleValue_Dir );
				SetPos( Boss0, Boss1Pos.X, Boss1Pos.Y, Boss1Pos.Z, Dir );
    				SetModeEx( Boss0, EM_SetModeType_Show, true );	-- 顯示
				SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- 標記
				MoveTime = MoveTarget( Boss0, Boss3 );	-- 艾拉那那往貪食沙蟲移動
				Sleep( MoveTime );
				PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_BEGIN );
				Sleep( ActTime );
				PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_END );
				ScriptMessage( Boss0, -1, 2, g_Msg.Stage3, 0 );	-- 第三階段訊息
				Boss0CommonAct( Boss0, Boss3 );

				local HateList = {};
				for i = 0, g_HateList[Room]-1 do	-- 取仇恨表內的目標
					local HateTarget = HateListInfo( Boss1, i, EM_HateListInfoType_GItemID );
					table.insert( HateList, HateTarget );
				end
				local Target = HateList[math.random(#HateList)];	-- 仇恨表中的隨機 1 名目標
				SetAttack( Boss3, Target );
				CallPlot( Boss3, "Zone_166_Boss2_Stage3_Fight", Boss3, Boss0, Boss1, Room );
			end

		elseif g_Stage[Room] == 3 then	-- 進入第四階段
			-- 當沼澤楞喀與貪食沙蟲不存在或都死亡時進入第四階段
		--	DebugMsg( 0, 0, "Boss1 = "..tostring(g_BossList[Room].BossIsDead[1]).." , Boss3 = "..tostring(g_BossList[Room].BossIsDead[3]) );
			if g_BossList[Room].BossIsDead[1] and g_BossList[Room].BossIsDead[3] then
		--	if ( not CheckID( Boss1 ) or ReadRoleValue( Boss1, EM_RoleValue_IsDead ) == 1 ) and ( not CheckID(Boss3) or ReadRoleValue( Boss3, EM_RoleValue_IsDead ) == 1 ) then
				g_Stage[Room] = 4;
				CallPlot( Boss0, "Zone_166_Boss2_Stage4_Fight", Boss0, Boss1, Boss3, Control, Room );
			end
		end
		Sleep(10);
		Counter = Counter + 1;
	end
end

function Zone_166_Boss2_Stage1_Fight( Boss1, Boss0, Room )	--  階段一：由沼澤楞喀執行

	local Counter = 0;	-- 計數器
	local Systime = GetSystime(0);

	Cl_Resist_HackersFightBegin( Boss0 );	-- 掛載於戰鬥開始的防駭客機制
	while true do
		Counter = Counter + 1;
		local NowSystime = GetSystime(0) - Systime;
	--	DebugMsg( 0, Room, "Counter = "..Counter..", Fighting time = "..NowSystime );
		if g_HateList[Room] > 0 then	-- 當仇恨表內有任一目標時
			if Counter%g_MagicID.FireChargeCD == 0 then	-- 火焰衝鋒
				Zone_166_Boss2_Stage1_FireCharge( Boss1, Room );
			elseif Counter%g_MagicID.SteamCD == 0 then	-- 噴蒸氣
				CastSpell( Boss1, Boss1, g_MagicID.Steam );
				Sleep( g_MagicID.SteamCastTime );
			elseif g_Stage[Room] == 3 and Counter%g_MagicID.NightBlazeCD == 0 then	-- 階段三後，加入夜火燎播
				Zone_166_Boss2_Stage1_NightBlaze( Boss1, Room );
			end
		end
		Sleep(10);
	end
end

function Zone_166_Boss2_Stage1_FireCharge( Boss1, Room )	-- 火焰衝鋒

	local HateList = {};
--	local AttackTarget = ReadRoleValue( Boss1, EM_RoleValue_AttackTargetID );	-- 沼澤楞喀的當前目標
	for i = 0, g_HateList[Room]-1 do	-- 取仇恨表內的目標
		local HateTarget = HateListInfo( Boss1, i , EM_HateListInfoType_GItemID );
	--	if HateTarget ~= AttackTarget then	-- 把沼澤楞喀當前的目標擋掉
			table.insert( HateList, HateTarget );
	--	end
	end

	local Target = HateList[math.random(#HateList)];	-- 仇恨表中的隨機 1 名目標
	local Boss1Pos = Vector_GetRolePos(Boss1);	-- Boss1 座標
	local TargetPos = Vector_GetRolePos(Target);	-- Target 座標
	local Distance = (Boss1Pos - TargetPos):Len();	-- Owner 至 Target 的距離
	local Dir = Lua_GetAngle( Boss1Pos.X, Boss1Pos.Z, TargetPos.X, TargetPos.Z );	-- Owner 座標點向 Target 座標點看過去的角度
	local VecDir = Vector_DirToVector( Dir );	-- 角度轉向量

	local MinimunChargeDistance = g_MagicID.NightFireRange*4;	-- 最小衝鋒距離
	if Distance < MinimunChargeDistance then
		Distance = MinimunChargeDistance;
		local NewPos = Boss1Pos + VecDir * Distance;
		if CheckLine( Boss1, NewPos.X, NewPos.Y+15, NewPos.Z ) then	-- 當可打線時，最小衝鋒距離才成立，避免 Boss 穿牆
			TargetPos = NewPos;
		end
	end

	local ChargeObj = CreateObj( g_MagicID.FireChargeObj, TargetPos.X, TargetPos.Y, TargetPos.Z, 0, 1 ); 	-- 衝鋒透明物件
	SetModeEx( ChargeObj, EM_SetModeType_Show, false );	-- 顯示
	SetModeEx( ChargeObj, EM_SetModeType_Mark, false );	-- 標記
	SetModeEx( ChargeObj, EM_SetModeType_Strikback, false );	-- 反擊
	SetModeEx( ChargeObj, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( ChargeObj, EM_SetModeType_Move, false );	-- 關閉移動
	WriteRoleValue( ChargeObj, EM_RoleValue_LiveTime, g_MagicID.FireChargeObjLiveTime );	-- 透明物件生存時間
	AddToPartition( ChargeObj, Room );

	CastSpell( Boss1, ChargeObj, g_MagicID.FireCharge );	-- 衝鋒
	Sleep( g_MagicID.FireChargeCastTime );	-- 等待施法時間

	for i = 1, math.Ceil( Distance / g_MagicID.NightFireRange ) do
		local NightFirePos = Boss1Pos + VecDir * (g_MagicID.NightFireRange*i );	-- 每個夜火(透明物件)建立時的座標
		local NightFire = Zone_166_Boss2_Stage1_CreateNightFire( NightFirePos, Dir, Room );	-- 夜火
		Sleep(2);
	end
	return true;
end

function Zone_166_Boss2_Stage1_NightBlaze( Boss1, Room )	-- 夜火燎播

	local HateList = {};
	for i = 0, g_HateList[Room]-1 do	-- 取仇恨表內的目標
	--	local AttackTarget = ReadRoleValue( Boss1, EM_RoleValue_AttackTargetID );	-- 沼澤楞喀的當前目標
		local HateTarget = HateListInfo( Boss1, i , EM_HateListInfoType_GItemID );
	--	if HateTarget ~= AttackTarget then	-- 把沼澤楞喀當前的目標擋掉
		table.insert( HateList, HateTarget );
	--	end
	end

	local Target = HateList[Math.random(#HateList)];	-- 仇恨表中的隨機 1 名目標
	local Boss1Pos = Vector_GetRolePos( Boss1 );	--  沼澤楞喀當前位置
	local TargetPos = Vector_GetRolePos( Target );	-- 目標當前位置
	local Dir = ReadRoleValue( Target, EM_RoleValue_Dir );
	local Distance = GetDistance( Boss1, Target );	-- 距離
	local DelayTime = ( Distance / g_MagicFlySpeed )*10;
--	DebugMsg( 0, 0, "DelayTime = "..Math.ceil(DelayTime)..", Distance = "..Distance );
	CastSpellPos( Boss1, TargetPos.X, TargetPos.Y, TargetPos.Z, g_MagicID.NightBlaze, 0 );
	Sleep( DelayTime+12 );	-- 拋物線非直線，起點至終點，在速度相同的情況下，拋物線會較直線慢抵達，故加入 1.2 秒的粗估延遲時間
	CallPlot( Boss1, "Zone_166_Boss2_Stage1_CreateNightFire", TargetPos, Dir, Room );
	Sleep( g_MagicID.NightBlazeCastTime );	-- 等待
	return true;
end

function Zone_166_Boss2_Stage1_CreateNightFire( NightFirePos, Dir, Room )	-- 生成夜火

	local NightFire = CreateObj( g_ObjID.NightFire, NightFirePos.X, NightFirePos.Y, NightFirePos.Z, Dir, 1 );	-- 建立夜火(透明物件)
	SetModeEx( NightFire, EM_SetModeType_Move, false );	-- 移動
	SetModeEx( NightFire, EM_SetModeType_Fight, false );	-- 砍殺
	SetModeEx( NightFire, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( NightFire, EM_SetModeType_Strikback, false );	-- 反擊
	WriteRoleValue( NightFire, EM_RoleValue_LiveTime, g_ObjID.NightFireLiveTime );
	AddBuff( NightFire, g_BuffID.NightFire, 0, -1 );
	AddToPartition( NightFire, Room );
	CallPlot( NightFire, "Zone_166_Boss2_Stage1_NightFire", NightFire );
	return NightFire;
end

function Zone_166_Boss2_Stage1_NightFire( NightFire )	-- 小型夜火起始劇情

	local Counter = 0;
	while true do
		Sleep(g_MagicID.NightFireTickTime);	-- g_MagicID.NightFireTickTime = 5
		Counter = Counter + 5;
		if Counter%5 == 0 then	-- 每 0.5 秒施放一次傷害
			SysCastSpellLv( NightFire, NightFire, g_MagicID.NightFireDmg, 0 );
		end
		if Counter%10 == 0 then	-- 每 1 秒施放一次治療
			SysCastSpellLv( NightFire, NightFire, g_MagicID.NightFireHeal, 0 );
		end
	end
end

function Zone_166_Boss2_Stage2_Fight( Boss2, Boss0, Boss1, Control, Zone, Room )	-- 階段二，焰風魅惑者戰鬥劇情

	local ControlPos = Vector_GetRolePos( Control );	-- 中控器的座標
	local Boss2Pos = Vector_GetRolePos( Boss2 )	-- 焰風魅惑者的座標
	local Dir = ReadRoleValue( Control, EM_RoleValue_Dir );	-- 中控器的面向

	-- 施放分身
	local AvatarCount = 2;	-- 分身數量
	for i = 1, AvatarCount do	-- 0 為本體，故從 1 開始
		g_BossList[Room][2][i] = CreateObj( g_Switch[Zone].Boss2, Boss2Pos.X, Boss2Pos.Y, Boss2Pos.Z, Dir, 1 );	-- 焰風魅惑者
		AddToPartition( g_BossList[Room][2][i], Room );
		CastSpell( g_BossList[Room][2][i], g_BossList[Room][2][i], g_MagicID.Act );	-- 表演特效
	end

	for i = 0, #g_BossList[Room][2] do
		Addbuff( g_BossList[Room][2][i], g_BuffID.UnRecoverHp, 0, -1 );	-- 掛載不自動回血
		AddBuff( g_BossList[Room][2][i], g_BuffID.Aura[i], 0, -1 );	-- 掛載靈氣 風速、地源、水精之靈
		SetModeEx( g_BossList[Room][2][i], EM_SetModeType_Searchenemy, false );	-- 索敵
		SetModeEx( g_BossList[Room][2][i], EM_SetModeType_Strikback, false );	-- 反擊
		CallPlot( g_BossList[Room][2][i], "Zone_166_Boss2_Stage2_Move", g_BossList[Room][2][i], ControlPos, Dir, Room );	-- 隨機移動
		CallPlot( g_BossList[Room][2][i], "Zone_166_Boss2_Stage2_Cast", g_BossList[Room][2][i], Boss1, i, Room );	-- 施放靈氣、隨機拉人
	end
end

function Zone_166_Boss2_Stage2_Move( Owner, ControlPos, Dir, Room )	-- 隨機移動

	local Distance	-- 每次隨機移動的距離
	local VecDir	-- 每次隨機移動的向量
	local TargetPos	-- 每次移動的目標位置

	while true do
		Distance = Math.random(50,150);
		VecDir = Vector_DirToVector( Dir + Math.random(360) );	-- 角度轉向量
		TargetPos = ControlPos + VecDir * Distance;	-- 目標位置
		Lua_WaitMoveto( Owner, TargetPos.X, TargetPos.Y, TargetPos.Z );	-- 移動至指定位置後才執行下一行
		Sleep(1);
	end
end

function Zone_166_Boss2_Stage2_Cast( Owner, Boss1, Select, Room )	-- 系統施法(隨機拉人、施放靈氣)

	local Count = 0;
	local DelayTime = 10;	-- 拉人前的延遲施法時間

	while true do
		Count = Count + 1;

		if Count % 10 == 0 then	-- 每 10 秒施放一次隨機召喚
			local HateList = {};
			for i = 0, g_HateList[Room]-1 do	-- 取仇恨表內的目標
			--	local AttackTarget = ReadRoleValue( Boss1, EM_RoleValue_AttackTargetID );	-- 沼澤楞喀的當前目標
				local HateTarget = HateListInfo( Boss1, i , EM_HateListInfoType_GItemID );
			--	if HateTarget ~= AttackTarget then	-- 把沼澤楞喀當前的目標擋掉
					table.insert( HateList, HateTarget );
			--	end
			end

			for i = 0, #g_BossList[Room][2] do
				local Count = #HateList
			--	DebugMsg( 0, 0, "Search Count = "..Count );
				if Count == 0 then
					break;
				end
				local Target = table.remove( HateList, math.random(#HateList) );	-- 隨機目標，並使被傳送目標不重複，不會互搶
				AddBuff( Target, g_BuffID.ReCall[Select], 0, -1 );
				Sleep(DelayTime);
				SysCastSpellLv( Owner, Target, g_MagicID.ReCall[Select], 0 );
			end
		end

		if g_MagicID.AuraBuff[Select] ~= 0 then	-- 每 1 秒施放一次靈氣：正面效果(對怪物)
        			SysCastSpellLv( Owner, Owner, g_MagicID.AuraBuff[Select], 0 );
		end
		-- 每 1 秒施放一次靈氣負面效果(對玩家)
		SysCastSpellLv( Owner, Owner, g_MagicID.AuraDeBuff[Select], 0 );
		Sleep(10);
	end
end

function Zone_166_Boss2_Stage3_Fight( Boss3, Boss0, Boss1, Room )	-- 階段三，貪食沙蟲戰鬥劇情

	local GetAuraObjList = { Boss1, Boss3 };	-- 繼承靈氣的目標清單：沼澤楞喀、貪食沙蟲

	for i = 0, #g_BossList[Room][2] do
		if CheckID( g_BossList[Room][2][i] ) and ReadRoleValue( g_BossList[Room][2][i], EM_RoleValue_IsDead ) == 0 then	-- 當場上尚有活著的焰風魅惑者時，沼澤楞喀或貪食沙蟲會繼承焰風魅惑者的能力
			local Count = #GetAuraObjList;
			if Count > 0 then
				local GetAuraObj = table.remove( GetAuraObjList, Math.random( #GetAuraObjList) );	-- 從沼澤楞喀與貪食沙蟲中隨機選一
				AddBuff( GetAuraObj, g_BuffID.Aura[i], 0, -1 );	-- 掛載靈氣 風速、地源、水精之靈
				CallPlot( GetAuraObj, "Zone_166_Boss2_Stage2_Cast", GetAuraObj, Boss1, i, Room );	-- 施放靈氣、隨機拉人
			end
			DelObj( g_BossList[Room][2][i] );	-- 將焰風魅惑者從場上召喚回墳場
		end
	end

	local Counter = 0;

	while true do	-- 戰鬥劇情
	--	DebugMsg( 0, 0, "Counter = "..Counter.." , HateCount = "..g_HateList[Room] );
		Counter = Counter + 1;
		if g_HateList[Room] > 0 then	-- 當仇恨表內有任一目標時
			if Counter%g_MagicID.TerrorArrowCD == 0 then	-- 恐懼毒箭
        				Zone_166_Boss2_Stage3_TerrorArrow( Boss3, Boss1, Room );
			elseif Counter%g_MagicID.WhirlwindCD == 0 then	-- 旋風斬
				local AttackTarget = ReadRoleValue( Boss3, EM_RoleValue_AttackTargetID );	-- 貪食沙蟲的當前目標
				CastSpell( Boss3, AttackTarget, g_MagicID.Whirlwind );
			end
		end
		Sleep(10);
	end
end

function Zone_166_Boss2_Stage3_TerrorArrow( Boss3, Boss1, Room )	-- 恐懼毒箭

	local HateList = {};
	for i = 0, g_HateList[Room]-1 do	-- 取仇恨表內的目標
		local HateTarget
		local AttackTarget = ReadRoleValue( Boss3, EM_RoleValue_AttackTargetID );	-- 貪食沙蟲的當前目標
		if not g_BossList[Room].BossIsDead[1] then
	--	if ReadRoleValue( Boss1, EM_RoleValue_IsDead ) == 0 and CheckID( Boss1 ) then	-- 當沼澤楞喀存在時，仇恨列表以沼澤楞喀為準
			HateTarget = HateListInfo( Boss1, i , EM_HateListInfoType_GItemID );
		else
			HateTarget = HateListInfo( Boss3, i , EM_HateListInfoType_GItemID );
		end
		if HateTarget ~= AttackTarget then	-- 排除貪食沙蟲的當前目標
			table.insert( HateList, HateTarget );
		end 
	end

	for i = 1, g_MagicID.TerrorArrowTargetsCount do
		local Count = #HateList;
		if Count == 0 then
			break;
		end
	--	DebugMsg( 0, 0, "TargetsCount = "..Count );
		local Target = table.remove( HateList, math.random(#HateList) );	-- 隨機 2 名不重複的目標
		SysCastSpellLv( Boss3, Target, g_MagicID.TerrorArrow, 0 );
	end
	return true;
end

function Zone_166_Boss2_Stage4_Fight( Boss0, Boss1, Boss3, Control, Room )	-- 階段四

	local ShowPos	-- 艾拉那那登場位置
	local Dir

	if CheckID( Boss1 ) then	-- 從沼澤楞喀的位置登場
		ShowPos = Vector_GetRolePos( Boss1 );
		Dir = ReadRoleValue( Boss1, EM_RoleValue_Dir );
		DebugMsg( 0, 0, "Stage4 Boss1 Pos" );
	elseif CheckID( Boss3 ) then	-- 從貪食沙蟲的位置登場
		ShowPos = Vector_GetRolePos( Boss3 );
		Dir = ReadRoleValue( Boss3, EM_RoleValue_Dir );
		DebugMsg( 0, 0, "Stage4 Boss3 Pos" );
	else	-- 從中控器的位置產生，防呆
		ShowPos = Vector_GetRolePos( Control );
		Dir = ReadRoleValue( Control, EM_RoleValue_Dir );
		DebugMsg( 0, 0, "Stage4 Control Pos" );
	end

	local MaxHp = ReadRoleValue( Boss0, EM_RoleValue_MaxHP );
        	WriteRoleValue( Boss0, EM_RoleValue_HP, MaxHp/10 );	-- 將艾拉那那的生命設為 10%

	SetPos( Boss0, ShowPos.X, ShowPos.Y, ShowPos.Z, Dir );
	SetModeEx( Boss0, EM_SetModeType_Show, true );	-- 顯示
	SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- 標記
	SetModeEx( Boss0, EM_SetModeType_Fight, true );	-- 砍殺
	SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- 標記
	SetModeEx( Boss0, EM_SetModeType_Move, true );	-- 移動
	SetModeEx( Boss0, EM_SetModeType_Searchenemy, true );	-- 索敵
	SysCastSpellLv( Boss0, Boss0, g_MagicID.Act, 0 );	-- 表演特效
end

function MagicBase_500488_CheckUse()	-- 將自己從噴蒸氣的連結中移除

	local Owner = OwnerID();
	local Target = TargetID();

	if Target == Owner then
	--	DebugMsg( 0, 0, "fasle" );
		return false;
	end
--	DebugMsg( 0, 0, "true" );
	return true;
end

function Zone_166_Boss2_FrontDoor()	-- 前門

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	SetDefIdleMotion( Owner, ruFUSION_MIME_IDLE_STAND );
	while true do
		Sleep(10);
		if g_Door[Room] == 0 then	-- 離開戰鬥
			SetModeEx( Owner, EM_SetModeType_show, false );	-- 顯示
			SetModeEx( Owner, EM_SetModeType_Obstruct, false );	-- 阻擋
		elseif g_Door[Room] == 1 then	-- 進入戰鬥
			SetModeEx( Owner, EM_SetModeType_show, true );
			SetModeEx( Owner, EM_SetModeType_Obstruct, true );
		elseif g_Door[Room] == 2 then	-- 擊殺艾拉那那後，播放開門。
			PlayMotionEX( Owner, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP );
		--	break;
		end
	end
end

function Zone_166_Boss2_BackDoor()	-- 後門

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	SetDefIdleMotion( Owner, ruFUSION_MIME_IDLE_STAND );
	while true do
		sleep(10);
		if g_Door[Room] == 2 then	-- 擊殺艾拉那那後，播放開門。
			PlayMotionEX( Owner, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP );
		--	break;
		end
	end
end