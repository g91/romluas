-- 移動至薩洛
--/gm ? zone 219 0 -1982.0 466.3 70.6
local g_Msg = {};
g_Msg.BeginCastSafeArea = "[$MUTE]".."[SC_MIRRORWORLD_SARO_01]";	-- 嘿！我們來比賽誰先跑到安全地點吧！
g_Msg.WinTheRace = "[$MUTE]".."[SC_MIRRORWORLD_SARO_02]";	-- 別...別得意，這次是我讓你的...
g_Msg.LostTheRace = "[$MUTE]".."[SC_MIRRORWORLD_SARO_03]";	-- 嘻～嘻！我才不是因為跑贏了而開心呢。

local g_Magic = {};	-- 法術集合清單
-- 荊棘術
g_Magic.Thorns = {};
g_Magic.Thorns.WarningTime = 10;	-- 傷害前的預警時間(單位:0.1 秒)
g_Magic.Thorns.CastID = 852291;	-- 施法ID
g_Magic.Thorns.CastTime = 10;	-- 施法時間(單位:0.1秒)
g_Magic.Thorns.AttackID = 852295;	-- 傷害ID
g_Magic.Thorns.TickCount = 5;	-- 每次施放的波次總數
g_Magic.Thorns.TickDelayTime = 5;	-- 每波次的間隔時間(單位:0.1 秒)
g_Magic.Thorns.OffsetDis = 20;	-- 每波次施放時與目標位置的偏移量
g_Magic.Thorns.CD = 8;	-- 冷卻時間(單位:1 秒)

-- 蛇咬術
g_Magic.SnakeBite = {};
g_Magic.SnakeBite.CastID = 852292;	-- 施法ID
g_Magic.SnakeBite.AttackID = 852293;	-- 傷害ID
g_Magic.SnakeBite.TickCount = 5;	-- 每次施放時會施放幾波次
g_Magic.SnakeBite.TickTime = 2;	-- 每個波次的間隔時間
g_Magic.SnakeBite.RandomDis = 25;	-- 每個坡次施放位置與 SafeAreaObj 的間隔距離

-- 安全地帶
g_Magic.SafeArea = {};
g_Magic.SafeArea.GuideActID = 491160;	-- 導引特效，代表指引玩家移動至安全地帶

-- 祖靈曲
g_Magic.SoundOfTheAncients = {};
g_Magic.SoundOfTheAncients.CastID = 852294;	-- 施法ID
g_Magic.SoundOfTheAncients.CastTime = 10;	-- 施法時間(單位:0.1秒)
g_Magic.SoundOfTheAncients.TriggerRange = 10;	-- 施法時間(單位:0.1秒)

-- 咒縛術 ( 對玩家觸發效果的各項機率寫於 function 中 )
g_Magic.CurseBind = {};
g_Magic.CurseBind.CastIDWithPlayer = 852305;	-- 對玩家的施法ID
g_Magic.CurseBind.CastIDWithSaro = 852306;	-- 對薩洛的施法ID
g_Magic.CurseBind.AttackID = 852296;	-- 傷害ID(橫禍術)

local g_Buff = {};	-- 基本法術清單
g_Buff.Thorns = {};
g_Buff.SafeArea = {};
g_Buff.CurseBind = {};

--g_Buff.UnRecoverHp = 502707;	-- 停止自動回血，避免取消索敵的物件快速回血。

g_Buff.Thorns.WarningActID = 623261;	-- 荊棘術預警ID
g_Buff.SafeArea.CastID = 623262;	-- 安全地帶ID
g_Buff.CurseBind.PowerLevel = 626296;	-- 咒縛術層數
g_Buff.CurseBind.RegularlyCheck = 623235;	-- 咒縛術定時檢查&執行
g_Buff.CurseBind.RootID = 626298;	-- 息止術
g_Buff.CurseBind.RootTime = 2;	-- 息止術持續時間( 單位:1秒 )
g_Buff.CurseBind.WeakID = 626299;	-- 無力術
g_Buff.CurseBind.WeakTime = 3;	-- 無力術持續時間( 單位:1秒 )

local g_LeaveFightTime = 6;	-- 6秒規則，脫離戰鬥的時間
local g_SaroIsRunning = {};	-- 記錄各層(Room)的薩洛是否正在奔跑中
local g_SaroAttackTarget = {};	-- 記錄各層(Room)的薩洛攻擊目標
local g_HateList = {};	-- 記錄各層(Room)的薩洛仇恨表

local g_Obj = {};	-- 物件清單
-- 薩洛
g_Obj.Saro = {};	-- 記錄各層(Room)的薩洛
g_Obj.Saro.Clone = {};
g_Obj.Saro.CloneID = 124323;	-- 薩洛分身，由分身來執行奔跑至安全地帶的劇情，避免玩家重複看到離開戰鬥、進入戰鬥的提示訊息

-- 安全地帶
g_Obj.SafeArea = {};	-- 記錄各層(Room)的安全地帶
g_Obj.SafeArea.RunningDelayTime = 5;	-- 薩洛分身奔跑至安全地帶前的延遲時間，給玩家搶先奔跑的時間
g_Obj.SafeArea.LiveTime = 50;	-- 安全地帶產生後的存活時間
g_Obj.SafeArea.TriggerRange = 10;	-- 安全地帶的觸發範圍

-- 祖靈
g_Obj.Ancient = {};	-- 祖靈
g_Obj.Ancient.ID = 124320;	-- 物件ID
g_Obj.Ancient.CreateCount = 5;	-- 每次召喚的數量
g_Obj.Ancient.NowCount = {};	-- 記錄各層當前於場上的數量
g_Obj.Ancient.MaxCount = 25;	-- 場上召喚的最大數量
g_Obj.Ancient.Dis = 25;	-- 召喚時與薩洛的間隔距離
g_Obj.Ancient.MoveDelayTime = 10;	-- 召喚後開始移動前的延遲時間，祖靈移動後才會有施法作用

local function GetAttackTarget( Saro, HateList )	-- 取得薩洛攻擊的玩家目標

	local Target = false;
	for i = 0, HateListCount( Saro )-1 do
		local AttackTarget = HateListInfo( Saro, i, EM_HateListInfoType_GItemID );
		if ReadRoleValue( AttackTarget, EM_RoleValue_IsPlayer ) == 1 then
			Target = AttackTarget;
			break;
		end
	end
	return Target
end

local function GetRandomPos( Obj, Room )	-- 安全地帶的隨機建立位置

	local ObjPos = Vector_GetRolePos( Obj );
	local CheckLineAngles = { 0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330 };	-- 將圓角度均分，每次打線檢查的角度
	local MinDis =100;	-- 最近距離
	local MaxDis =150;	-- 最遠距離
	local PosList = {};
	local CreatePos = ObjPos;

	for i = 1, #CheckLineAngles do	-- 先篩選打線檢查通過的點
		local VecDir = Vector_DirToVector( CheckLineAngles[i] );
		local TargetPos = ObjPos + VecDir * Math.Random( MinDis, MaxDis );
		TargetPos.Y = GetHeight( TargetPos.X, TargetPos.Y, TargetPos.Z );	-- Rom 的高度檢查，不合法時會回傳原點
		if CheckLine( Obj, TargetPos.X, TargetPos.Y, TargetPos.Z ) then
			table.insert( PosList, TargetPos );
		end
	end

	if #PosList > 0 then
		CreatePos = PosList[ Math.random( #PosList ) ];
	end
	return CreatePos;
end

local function DelAllObj( Saro, Room )	-- 刪除所有物件，當薩洛產生、死亡與離開戰鬥時執行

	-- 刪除場上既有的薩洛分身
	if g_Obj.Saro.Clone[Room] and CheckID( g_Obj.Saro.Clone[Room] ) then	-- 防呆，避免場上因未知原因重覆生成薩洛分身
		DelObj( g_Obj.Saro.Clone[Room] );
	end

	-- 刪除場上既有的安全地帶
	if g_Obj.SafeArea[Room] and CheckID(g_Obj.SafeArea[Room]) then
		DelObj( g_Obj.SafeArea[Room] );
	end
	
	-- 刪除場上既有的祖靈
	if g_Obj.Ancient.NowCount[Room] and #g_Obj.Ancient.NowCount[Room] > 0 then
		for i = 1, #g_Obj.Ancient.NowCount[Room] do
			if CheckID( g_Obj.Ancient.NowCount[Room][i] ) then
				DelObj( g_Obj.Ancient.NowCount[Room][i] );
			end
		end
	end
	WriteRoleValue( Saro, EM_RoleValue_PID, 0 );
end

function MirrorWorld_109999_InitLua()	-- 薩洛 物件產生劇情

	local Saro = OwnerID();
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );

	if g_Obj.Saro[Room] and CheckID( g_Obj.Saro[Room] ) then	-- 防呆
		DelObj( g_Obj.Saro[Room] );
	end
	g_Obj.Saro[Room] = Saro;

	DelAllObj( Saro, Room );	-- 防呆，刪除場上既有物件

	g_Obj.Saro.Clone[Room] = false;	-- 宣告薩洛分身
	g_Obj.SafeArea[Room] = false;	-- 宣告安全地帶
end

function MirrorWorld_109999_Dead()	-- 薩洛 死亡劇情

	local Saro = OwnerID();
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );
	DelAllObj( Saro, Room );
	DebugMsg( 0, 0, "死亡" );
end

function MirrorWorld_109999_LeaveFight()	-- 薩洛 離開戰鬥

	local Saro = OwnerID();
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );
	DelAllObj( Saro, Room );
--	CancelBuff_NoEvent( Saro, g_Buff.UnRecoverHp );	-- 刪除停止自動回血
	DebugMsg( 0, 0, "戰鬥結束" );
end

function MirrorWorld_109999_BeginFight()	-- 薩洛 開始戰鬥

	local Saro = OwnerID();
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );	
	g_SaroIsRunning[Room] = false;
	g_SaroAttackTarget[Room] = false;
	g_HateList[Room] = false;
	DebugMsg( 0, 0, "戰鬥開始" );

	if ReadRoleValue( Saro, EM_RoleValue_PID ) == 0 then	-- 防呆，避免賽跑時因反覆進入戰鬥，導致 Script Already Running 的問題
	--	AddBuff( Saro, g_Buff.UnRecoverHp, 0, -1 );	-- 停止自動回血
		if g_Obj.Ancient.NowCount[Room] and #g_Obj.Ancient.NowCount[Room] > 0 then	-- 防呆，刪除舊有存在於場上的祖靈
			for i = 1, #g_Obj.Ancient.NowCount[Room] do
				DelObj( g_Obj.Ancient.NowCount[Room][i] );
			end
		end
		g_Obj.Ancient.NowCount[Room] = {};
		WriteRoleValue( Saro, EM_RoleValue_PID, 1 );
		CallPlot( Saro, "MirrorWorld_109999_BeginFight_2", Saro, Room );
	end
end

function MirrorWorld_109999_BeginFight_2( Saro, Room )

--	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );
	local Counter = 0;	-- 戰鬥計數器
--	local LeaveFightTime = 0;

	while g_HateList[Room] ~= 0 do	-- 戰鬥中
--	while LeaveFightTime < g_LeaveFightTime and ReadRoleValue( Saro, EM_RoleValue_IsDead ) == 0 do	-- 當薩洛沒有死亡，且未脫離戰鬥時

		Counter = Counter + 1;

		-- 脫離戰鬥判斷
		g_HateList[Room] = HateListCount( Saro );
	--	if g_HateList[Room] == 0 and not g_SaroIsRunning[Room] then	-- 當薩洛的仇恨表為 0 人時
	--		LeaveFightTime = LeaveFightTime + 1;
	--		DebugMsg( 0, 0, "LeaveFightTime = "..LeaveFightTime );
	--	else
	--		LeaveFightTime = 0;	-- 恢復預設設定
	--	end

		if not g_SaroAttackTarget[Room] then	-- 取得攻擊玩家目標
			g_SaroAttackTarget[Room] = GetAttackTarget( Saro );
		end

		-- 當轉到荊棘術的冷卻時間，而薩洛也有攻擊的玩家目標、仇恨人數 > 0 及不在奔跑狀態下時
		if Counter%g_Magic.Thorns.CD == 0 and g_SaroAttackTarget[Room] and g_HateList[Room] > 0 and not g_SaroIsRunning[Room] then
		--	DebugMsg( 0, 0, "施放荊棘術" );
			CastSpellLV( Saro, g_SaroAttackTarget[Room], g_Magic.Thorns.CastID, 0 );
			Sleep(g_Magic.Thorns.CastTime);	-- 施法表演時間
		end
		Sleep(10);
	end
end

function MagicBase_626310_Plot()	-- 荊棘術

	local Saro = OwnerID();	-- Boss
	local Target = TargetID();	-- 目標玩家
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );

	local CtrlObj = Hao_CreateSpellObj( Target );	-- 在目標位置建立中控器，並由中控器控制後續劇情
	CallPlot( CtrlObj, "MagicBase_626310_Plot2", CtrlObj, Saro, Target, Room );
end

function MagicBase_626310_Plot2( CtrlObj, Saro, Target, Room )	-- 建立施法物件

	local WaveCount = 0;	-- 累積波次

	while WaveCount <= g_Magic.Thorns.TickCount do

		local TargetPos = Vector_GetRolePos( Target );	-- 目標位置
		local TargetDir = ReadRoleValue( Target, EM_RoleValue_Dir );
		local VecDir = Vector_DirToVector( TargetDir+Math.Random( 360) );	-- 角度轉向量
		TargetPos = TargetPos + VecDir * g_Magic.Thorns.OffsetDis;	-- 偏移量
		local CastObj = Hao_CreateSpellObjbyPos( TargetPos );	-- 在目標位置建立施法物件
		CallPlot( CastObj, "MagicBase_626310_Plot3", CastObj, Saro, Target, WaveCount, Room );
		WaveCount = WaveCount + 1;
		Sleep( g_Magic.Thorns.TickDelayTime );
	end
end

function MagicBase_626310_Plot3( CastObj, Saro, Target, WaveCount, Room )

--	Sleep(g_Magic.Thorns.TickDelayTime*WaveCount);
--	DebugMsg( 0, 0, "DelayTime = "..g_Magic.Thorns.TickDelayTime*WaveCount );
	AddBuff( CastObj, g_Buff.Thorns.WarningActID, 0, 1 );	-- 預警特效
	Sleep( g_Magic.Thorns.WarningTime );
	SysCastSpellLv( Saro, CastObj, g_Magic.Thorns.AttackID, 0 );	-- 傷害

	if WaveCount == g_Magic.Thorns.TickCount and g_HateList[Room] > 0 then	-- 施放完荊棘術後，開始施放安全地帶
		local SafeAreaPos = GetRandomPos( Saro, Room );	-- 隨機從可建立安全地帶的參照點中選出一點
		local TargetPos = Vector_GetRolePos( Target );
		local Distance = (TargetPos - SafeAreaPos):Len();

	--	DebugMsg( 0, 0, "SafeAreaPos = "..tostring( SafeAreaPos ) );
		local SafeAreaObj = Hao_CreateSpellObjbyPos( SafeAreaPos, 0, 60 );	-- 在該點建立施法物件( 位置、角度、生存時間( 單位:1秒 ) )

		if g_Obj.SafeArea[Room] and CheckID( g_Obj.SafeArea[Room] ) then	-- 防呆，避免場上因未知原因重覆生成安全地帶
			DelObj( g_Obj.SafeArea[Room] );
		end
		g_Obj.SafeArea[Room] = SafeAreaObj;

		local SaroPos = Vector_GetRolePos( Saro );
		local SaroDir = ReadRoleValue( Saro, EM_RoleValue_Dir );
		SaroDir = SaroDir + 180;	-- 相反面向
		if SaroDir > 360 then SaroDir = SaroDir - 360 end
		local CloneSaro = CreateObj( g_Obj.Saro.CloneID, SaroPos.X, SaroPos.Y, SaroPos.Z, SaroDir, 1 );
		SetModeEx( CloneSaro, EM_SetModeType_HideName, true );	-- 不顯示名稱
		SetModeEx( CloneSaro, EM_SetModeType_Mark, false );	-- 標記
		AddToPartition( CloneSaro, Room );
		SysCastSpellLv( CloneSaro, SafeAreaObj, g_Magic.SafeArea.GuideActID, 0 );	-- 導引特效
		SysCastSpellLv( Target, SafeAreaObj, g_Magic.SafeArea.GuideActID, 0 );	-- 導引特效

		ScriptMessage( Saro, -1, 3, g_Msg.BeginCastSafeArea, 0 );

		local DelayAddBuffTime = Math.Ceil( Distance/200*10 );
	--	DebugMsg( 0, 0, "安全地帶延遲顯示特效的時間 = "..DelayAddBuffTime );
		Sleep( DelayAddBuffTime+5 );

		if g_HateList[Room] == 0 then
			DelAllObj( Saro, Room );
			return;
		end
		AddBuff( SafeAreaObj, g_Buff.SafeArea.CastID, 0, -1 );

		if g_Obj.Saro.Clone[Room] and CheckID( g_Obj.Saro.Clone[Room] ) then	-- 防呆，避免場上因未知原因重覆生成薩洛分身
			DelObj( g_Obj.Saro.Clone[Room] );
		end
		g_Obj.Saro.Clone[Room] = CloneSaro;
		CallPlot( SafeAreaObj, "MirrorWorld_Saro_RuntoSafeArea", SafeAreaObj, SafeAreaPos, Saro, CloneSaro, Target, Room );
	end
end

function MirrorWorld_Saro_RuntoSafeArea( SafeAreaObj, SafeAreaPos, Saro, CloneSaro, Target, Room )

	local Distance = 0;
	local RunningTime = false;
	local Counter = 0;	-- 計數器

	while Counter < g_Obj.SafeArea.LiveTime do
		if Counter == g_Obj.SafeArea.RunningDelayTime then	-- 薩洛分身奔跑至安全地帶前的延遲時間
			g_SaroIsRunning[Room] = true;
			RunningTime = MoveDirect( CloneSaro, SafeAreaPos.X, SafeAreaPos.Y, SafeAreaPos.Z );
		--	DebugMsg( 0, 0, "奔跑時間 = "..RunningTime );
		end
		
	--	DebugMsg( 0, 0, "奔跑劇情 時間 = "..Counter..", 距離玩家 = "..GetDistance( SafeAreaObj, Target )..", 距離薩洛 = "..GetDistance( SafeAreaObj, CloneSaro ) );
		if CheckID( Target ) and GetDistance( SafeAreaObj, Target ) < g_Obj.SafeArea.TriggerRange then	-- 目標玩家存在，且在安全地帶的觸發範圍內時
		--	Say( Target, "I'm winner!" );
			return MirrorWorld_Saro_SnakeBite( SafeAreaObj, Target, Saro, CloneSaro, Room, 1 );
		elseif GetDistance( SafeAreaObj, CloneSaro ) < g_Obj.SafeArea.TriggerRange then
		--	Say( Saro, "I'm winner!" );
			return MirrorWorld_Saro_SnakeBite( SafeAreaObj, Target, Saro, CloneSaro, Room, 2 );
		end
		Sleep(1);
		Counter = Counter + 1;
	end
--	DebugMsg( 0, 0, "安全地帶自動消失" );
	return MirrorWorld_Saro_SnakeBite( SafeAreaObj, Target, Saro, CloneSaro, Room, 3 );
end

function MirrorWorld_Saro_SnakeBite( SafeAreaObj, Target, Saro, CloneSaro, Room, Mode )

	StopMove( CloneSaro, false );
	CancelBuff_NoEvent( SafeAreaObj, g_Buff.SafeArea.CastID );

	local AttackTarget
	local Lv = 4;	-- 預設為扣除 5% 生命

	if Mode == 1 then	-- 玩家贏
		DebugMsg( 0, 0, "玩家搶先至安全地帶，攻擊薩洛" );
		AttackTarget = Saro;
		Lv = 1;
		AdjustFaceDir( CloneSaro, Saro, 0 );
		ScriptMessage( Saro, -1, 3, g_Msg.WinTheRace, 0 );
	elseif Mode == 2 then	-- 薩洛贏
		DebugMsg( 0, 0, "薩洛搶先至安全地帶，攻擊玩家" );
		AttackTarget = Target;
		AdjustFaceDir( CloneSaro, AttackTarget, 0 );
		ScriptMessage( Saro, -1, 3, g_Msg.LostTheRace, 0 );
	elseif Mode == 3 then	-- 時限內沒人跑至安全地帶就攻擊玩家
		DebugMsg( 0, 0, "時限內均沒人跑至安全地帶，攻擊玩家" );
		AttackTarget = Target;
		AdjustFaceDir( CloneSaro, AttackTarget, 0 );
		ScriptMessage( Saro, -1, 3, g_Msg.LostTheRace, 0 );
	end

	Sleep(5);	-- 轉向時間
	PlayMotion( CloneSaro, ruFUSION_ACTORSTATE_CAST_SP01 );
	Sleep(10);	-- 表演動作時間
	WriteRoleValue( SafeAreaObj, EM_RoleValue_PID, Lv );	-- 把施法等級寫入透明物件
	DelObj( CloneSaro );

	if CheckID(Target) then
		g_SaroIsRunning[Room] = false;
	end

	-- 施放蛇咬術
	if g_HateList[Room] == 0 then	-- 施放前檢查
		return
	end

	local SafeAreaObjPos = Vector_GetRolePos( SafeAreaObj );
	for i = 1, g_Magic.SnakeBite.TickCount do
		Sleep(g_Magic.SnakeBite.TickTime);
		local VecDir = Vector_DirToVector( Math.Random( 360 *  i/g_Magic.SnakeBite.TickCount ) );
		local TargetPos = SafeAreaObjPos + VecDir * g_Magic.SnakeBite.RandomDis ;
		SetPos( SafeAreaObj, TargetPos.X, TargetPos.Y, TargetPos.Z, 0 );	-- 製造蛇群從四面亂竄而來的效果
	--	DebugMsg( 0, 0, "No,"..i..", 施放蛇咬術" );
		SysCastSpellLv( SafeAreaObj, AttackTarget, g_Magic.SnakeBite.CastID, 0 );	-- 由透明物件施放飛行特效，再由 Boss 執行傷害
	end
	CallPlot( Saro, "MirrorWorld_Saro_SoundOfTheAncients", Saro, Room );	-- 開始施放祖靈曲

	Sleep(100);	-- 10 秒後刪除安全地帶
	DelObj( SafeAreaObj );
end

function MirrorWorld_Saro_SoundOfTheAncients( Saro, Room )	-- 祖靈曲

	CastSpellLV( Saro, Saro, g_Magic.SoundOfTheAncients.CastID, 0 );
	Sleep( g_Magic.SoundOfTheAncients.CastTime+5 );	-- 讓表演多飛一會

	if g_HateList[Room] == 0 then
		return false;
	end

	if #g_Obj.Ancient.NowCount[Room] > 0 then	-- 每次施放祖靈曲時，重整祖靈清單中，刪除無效的祖靈。
		for i = #g_Obj.Ancient.NowCount[Room], 1, -1 do
			if not CheckID(g_Obj.Ancient.NowCount[Room][i]) then
				table.remove( g_Obj.Ancient.NowCount[Room], i );
			end
		end
	end

	local SaroPos = Vector_GetRolePos( Saro );
	local SaroDir = ReadRoleValue( Saro, EM_RoleValue_Dir );

	-- 召喚祖靈
	for i = 1, g_Obj.Ancient.CreateCount do
		if #g_Obj.Ancient.NowCount[Room] >= g_Obj.Ancient.MaxCount then
			local FirstAncient = table.remove( g_Obj.Ancient.NowCount[Room], 1 );		-- 最早出現的祖靈
			DelObj( FirstAncient );
		end
		local AncientDir = SaroDir + 360 * ( i/g_Obj.Ancient.CreateCount ) ;
		local SaroVecDir = Vector_DirToVector( AncientDir + 90 );
		local AncientPos = SaroPos + SaroVecDir * g_Obj.Ancient.Dis;
		local Ancient = CreateObj( g_Obj.Ancient.ID, AncientPos.X, AncientPos.Y+10, AncientPos.Z, AncientDir, 1 );
		MoveToFlagEnabled( Ancient, false );
		SetModeEx( Ancient, EM_SetModeType_Gravity, false );
		SetModeEx( Ancient, EM_SetModeType_Fight, false );
		SetModeEx( Ancient, EM_SetModeType_Searchenemy, false );
		SetModeEx( Ancient, EM_SetModeType_Strikback, false );
		SetModeEx( Ancient, EM_SetModeType_Mark, false );
		AddToPartition( Ancient, Room );
		table.insert( g_Obj.Ancient.NowCount[Room], Ancient );
		CallPlot( Ancient, "MirrorWorld_Saro_Ancient_Init", Ancient, Saro, Room );
	end
	DebugMsg( 0, 0, "祖靈總數 = "..#g_Obj.Ancient.NowCount[Room] );
end

function MirrorWorld_Saro_Ancient_Init( Ancient, Saro, Room )	-- 祖靈曲

	Sleep( g_Obj.Ancient.MoveDelayTime );	-- 召喚後開始移動前的延遲時間，祖靈移動後才會有施法作用

	local Player = g_SaroAttackTarget[Room]	-- 薩洛攻擊的目標玩家
	local MoveToNextPos = false;
	local VecDir
	local TargetPos

	while true do
		if not MoveToNextPos then
			MoveToNextPos = true;
			local SaroPos = Vector_GetRolePos( Saro );
			SaroPos.Y = SaroPos.Y + 10;
			VecDir = Vector_DirToVector( Math.Random(360) );
			TargetPos = SaroPos + VecDir * Math.Random( 0, 150 );
		--	Move( Ancient, TargetPos.X, TargetPos.Y, TargetPos.Z );
			MoveDirect( Ancient, TargetPos.X, TargetPos.Y, TargetPos.Z );
		else
			local AncientPos = Vector_GetRolePos( Ancient );
		--	DebugMsg( 0, 0, "Ancient Pos = "..tostring( AncientPos ) );
			if ( AncientPos - TargetPos ):Len() < 5 then
				MoveToNextPos = false;
			end
		end
		-- 符合觸發條件時，優先判斷薩洛
		if GetDistance( Ancient, Saro ) < g_Magic.SoundOfTheAncients.TriggerRange then
			DebugMsg( 0, 0, "祖靈, 靠近薩洛 = "..GetDistance( Ancient, Saro ) );
			SysCastSpellLv( Saro, Saro, g_Magic.CurseBind.CastIDWithSaro, 0 );
		--	Say( Saro, "Hit Saro" );
			break;
		elseif GetDistance( Ancient, Player ) < g_Magic.SoundOfTheAncients.TriggerRange then
			DebugMsg( 0, 0, "祖靈, 靠近玩家 = "..GetDistance( Ancient, Player ) );
			SysCastSpellLv( Saro, Player, g_Magic.CurseBind.CastIDWithPlayer, 0 );
		--	Say( Player, "Hit Me" );
			break;
		end
		Sleep(2);
	end
	DelObj( Ancient );
end

function MagicBase_623263_Plot()	-- 蛇咬術傷害

	local Owner = OwnerID();	-- 透明物件
	local Target = TargetID();	-- 玩家或薩洛
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Saro = g_Obj.Saro[Room];	-- 薩洛
	local Lv = ReadRoleValue( Owner, EM_RoleValue_PID );

--	DebugMsg( 0, 0, "蛇咬等級 = "..Lv+1 );
	if CheckID( Saro ) and ReadRoleValue( Saro, EM_RoleValue_IsDead ) == 0 then
		SysCastSpellLv( Saro, Target, g_Magic.SnakeBite.AttackID, Lv );	-- 由Boss執行傷害
	end
end

function MagicBase_623236_Plot()	-- 咒縛術 定時執行亂數效果

	local Owner = OwnerID();

	if not CheckBuff( Owner, g_Buff.CurseBind.PowerLevel ) then	-- 當玩家身上沒有咒縛術的層術時，刪除定時執行Buff，並提早跳出檢查
		CancelBuff_NoEvent( Owner, g_Buff.CurseBind.RegularlyCheck );
		return;
	end

	-- 各效果機率，參數為累進機率
	local Odds = {};
	Odds.Attack = 500;	-- 橫禍術
	Odds.Root = 750;	-- 息止術
	Odds.Weak = 1000;	-- 無力術

	local Random = Math.Random( 0, 1000 ); 
	if Random <= 500 then	-- 橫禍術
		local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
		local Saro = g_Obj.Saro[Room];	-- 薩洛
		SysCastSpellLv( Saro, Owner, g_Magic.CurseBind.AttackID, 0 );	-- 呼叫薩洛對玩家施放橫禍術
	elseif Random <= 750 then	-- 息止術
		AddBuff( Owner, g_Buff.CurseBind.RootID, 0, g_Buff.CurseBind.RootTime );
	else	-- 無力術
		AddBuff( Owner, g_Buff.CurseBind.WeakID, 0, g_Buff.CurseBind.WeakTime );
	end

	local BuffLv = Lua_Hao_Return_Buff_Lv( Owner, g_Buff.CurseBind.PowerLevel );	-- 咒縛術的層數
	CancelBuff_NoEvent( Owner, g_Buff.CurseBind.PowerLevel );
	if BuffLv > 0 then
		BuffLv = BuffLv - 1;
		AddBuff( Owner, g_Buff.CurseBind.PowerLevel, BuffLv, -1 );
	end
end