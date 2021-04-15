-- 深海重壓
local g_WaterPressureTickTime = 10;	-- 上深海重壓的間隔時間( 單位 0.1 秒 )
local g_WaterPressureBuffID = 626295;	-- Boss給予的Debuff - 深海重壓
local g_WaterPressureMagicID = 852281;	-- 深海重壓的表演特效

-- 浪潮衝擊
local g_WaveObjID = 107071;	-- 透明物件
local g_WaveWarningBuffID = 626303;	-- 預警特效
local g_WaveAttackMagicID = 852287;	-- 傷害效果
local g_WaveWarningTime = 1;	-- 預警時間(單位:1秒)
local g_WaveAttackCount = 2;	--  浪潮衝擊每次攻擊的波次
local g_WaveAttackTickTime = g_WaveWarningTime*10 + 5;	--  浪潮衝擊每次攻擊後的間隔時間(單位:0.1 秒)
local g_WaveLiveTime = Math.ceil(( g_WaveAttackCount*g_WaveAttackTickTime )/10) + ( g_WaveAttackCount * g_WaveWarningTime )+1 ;	-- 生存時間(單位:1秒)，預設值 + 1秒
local g_WaveTickTime = 70;	--  開場後，浪潮衝擊每次產生的間隔時間(單位:0.1 秒)，預設為 70

-- 冰尖柱
local g_IcePierceObjID = 107071;	-- 透明物件
local g_IcePierceWarningBuffID = 626300;	-- 預警特效
local g_IcePierceActMagicID = 852285;	-- 傷害特效
local g_IcePierceAttackMagicID = 852286;	-- 傷害效果
local g_IcePierceWarningTime = 1;	-- 預警時間(單位:1秒)
local g_IcePierceLiveTime = 2;	-- 生存時間(單位:1秒)
local g_IcePierceTickTime = 120;	--  開場後，冰尖柱每次產生的間隔時間(單位:0.1 秒)，預設為 120

-- 音貝
local g_ShellList = {};	-- 產生音貝位置的座標清單
local g_ShellID = 106959;	-- 音貝ID
local g_ShellLiveTime = 60;	-- 音貝生存時間(單位 1 秒)
local g_ShellStraightCount = 5;	-- 產生音貝的直排數量
local g_ShellTransverseCount = 5;	-- 產生音貝的橫排數量
local g_ShellTotallyCount = g_ShellStraightCount * g_ShellTransverseCount;	-- 產生音貝位置的最大數量
local g_ShellStraightDis = 30;	-- 每個音貝間隔的直排間距
local g_ShellTransverseDis = 30;	-- 每個音貝間隔的橫排間距
local g_ShellBuffID = 626294;	-- 觸碰音貝後獲得的 Buff
local g_ShellBuffTime = 15;	-- Buff 的持續時間
local g_ShellMaxCount = 10;	-- 場上音貝的最大數量
local g_ShellDebutPos = { 5, 21, 25 };	-- 開場時產生音貝的起始數量與位置
local g_ShellBornTickTime = 150;		-- 開場後，音貝每次產生的間隔時間( 單位 0.1 秒 )，預設為 150
local g_ShellCloseMagicID = 852284;	-- 接近音貝時的表演特效

-- 嗜血利牙
local g_BloodList = {};	-- 嗜血利牙的總量
local g_BloodID = 106960;	-- 嗜血利牙的ID
local g_BloodBornDis = 50;	-- 嗜血利牙產生時與 Boss 的距離
local g_BloodBornCount = 3;	-- 嗜血利牙每次產生的數量
local g_BloodMaxCount = 9;	-- 場上嗜血利牙的最大數量
local g_BloodBornTickTime = 100;	-- 開場後，嗜血利牙每次產生的間隔時間( 單位 0.1 秒 )，預設為 100
local g_BloodDeadMagicID = 852283;	-- 嗜血利牙死亡時，對Boss造成傷害的表演特效

local g_UnHealHpAuto = 502707;	-- 不自動回血

local function CompDis( A, B )	-- 比較遠近，提供此編號的 Script 判斷距離用
	if A.Dis < B.Dis then
		return true;
	end
end

function MirrorWorld_104845_GetShellPos(Owner,Room)	-- 音貝產生位置

	-- 設定四邊形陣列，回傳 Table ( 參考物件、起始距離、旋轉角度、直排行數、橫排行數、直排間距、橫排間距 )
	local PosList = Lua_SetQuadrangleFormation( Owner, 0, 0, g_ShellStraightCount, g_ShellTransverseCount, g_ShellStraightDis, g_ShellTransverseDis );

	for i = 1, #PosList do
		PosList[i].Guid = 0;	-- 判斷該點位置是否可生成音貝，0 為可生成，記錄為 Guid 時為為該位置已生成
		table.insert( g_ShellList[Room], PosList[i] );
	end
	return g_ShellList[Room];
end

function MirrorWorld_104845_WaterPressure( Owner, Room )	-- 深海重壓劇情

	local HateList = HateListCount( Owner );
	for i = 0, HateList-1 do
		local Target = HateListInfo( Owner, i, EM_HateListInfoType_GItemID );	-- 取得 Boss 仇恨列表中的目標
		if ReadRoleValue( Target, EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( Target, EM_RoleValue_IsDead ) == 0 then
			if not CheckBuff( Target, g_ShellBuffID ) then
				SysCastSpellLv( Owner, Target, g_WaterPressureMagicID, 0 );
				AddBuff( Target, g_WaterPressureBuffID, 0, -1 );
			end
		end
	end
end

function MirrorWorld_WaveCreate( Master, Player, Room )	-- 浪潮衝擊產生劇情

	local PlayerPos = Vector_GetRolePos( Player );
	local Wave = CreateObj( g_WaveObjID, PlayerPos.X, PlayerPos.Y, PlayerPos.Z, 0, 1 );	-- 建立透明物件
	SetModeEx( Wave, EM_SetModeType_ShowRoleHead, false )	-- 血條
	SetModeEx( Wave, EM_SetModeType_Move, false );	-- 移動
	SetModeEx( Wave, EM_SetModeType_Fight, false );	-- 砍殺
	SetModeEx( Wave, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( Wave, EM_SetModeType_Strikback, false );	-- 反擊
	WriteRoleValue( Wave, EM_RoleValue_LiveTime, g_WaveLiveTime );
	AddToPartition( Wave, Room );
	CallPlot( Wave, "MirrorWorld_WaveDmg", Wave, Master, Player );
end

function MirrorWorld_WaveDmg( Wave, Master, Player )	-- 浪潮衝擊傷害

	local WaveAttackCount = g_WaveAttackCount;

	while WaveAttackCount > 0 and ReadRoleValue( Master, EM_RoleValue_IsAttackMode ) == 1 do
		AddBuff( Wave, g_WaveWarningBuffID, 0, Math.ceil(g_WaveWarningTime) );
		Sleep( g_WaveWarningTime*10 );
		SysCastSpellLv( Master, Wave, g_WaveAttackMagicID, 0 );	-- 傷害
		WaveAttackCount = WaveAttackCount - 1;
		Sleep(g_WaveAttackTickTime);
		local PlayerPos = Vector_GetRolePos( Player );
		SetPos( Wave, PlayerPos.X, PlayerPos.Y, PlayerPos.Z, 0 );
	end
end

function MirrorWorld_626304_Check()	-- 浪潮衝擊檢查劇情

	local Owner = OwnerID();	-- Boss
	local Target = TargetID();	-- 玩家或音貝

	if ReadRoleValue( Target, EM_RoleValue_OrgID ) == g_ShellID then
		DelObj( Target );
	--	DebugMsg( 0, 0, "Del Shell" );
	end
	return true;
end

function MirrorWorld_PierceCreate( Master, Player, Room )	-- 冰尖柱產生劇情

	local PlayerPos = Vector_GetRolePos( Player );
	local Dir = ReadRoleValue( Player, EM_RoleValue_Dir );
	local VecDir	-- 向量
	local IcePierce	-- 冰尖柱
	local IcePierceAngle = { 0, 45, 90, 135, 180, 225, 270, 315 };	-- 冰尖柱生成的角度
	local Distance = GameObjInfo_Int( g_IcePierceAttackMagicID, "EffectRange" );	-- 每個冰尖柱與玩家的距離
	local IcePiercePos
	table.remove( IcePierceAngle, Math.random(#IcePierceAngle) );	-- 製造一個缺口，讓玩家逃離

	for i = 1, #IcePierceAngle do
		VecDir = Vector_DirToVector( Dir + 90 + IcePierceAngle[i]  );
		IcePiercePos = PlayerPos + VecDir * (Distance-10);
		local IcePierce = CreateObj( g_IcePierceObjID, IcePiercePos.X, IcePiercePos.Y, IcePiercePos.Z, 0, 1 );	-- 建立透明物件
		AdjustFaceDir( IcePierce, Player, 0 );	-- 面向
		MoveToFlagEnabled( IcePierce, false );
		WriteRoleValue( IcePierce, EM_RoleValue_IsWalk, 0 );	-- 跑步
		SetModeEx( IcePierce, EM_SetModeType_ShowRoleHead, false )	-- 血條
		SetModeEx( IcePierce, EM_SetModeType_Move, true );	-- 移動
		SetModeEx( IcePierce, EM_SetModeType_Fight, false );	-- 砍殺
		SetModeEx( IcePierce, EM_SetModeType_Searchenemy, false );	-- 索敵
		SetModeEx( IcePierce, EM_SetModeType_Strikback, false );	-- 反擊
		WriteRoleValue( IcePierce, EM_RoleValue_LiveTime, g_IcePierceLiveTime );
		AddBuff( IcePierce, g_IcePierceWarningBuffID, 0, Math.ceil(g_IcePierceWarningTime) );
		AddToPartition( IcePierce, Room );
		CallPlot( IcePierce, "MirrorWorld_PierceDmg", IcePierce, Master, Player, i );
	end
	DebugMsg( 0, 0, "-----------------------------------------------------" );
end

function MirrorWorld_PierceDmg( IcePierce, Master, Player, i )	-- 冰尖柱傷害( 冰柱、冰柱位置、Boss、玩家、玩家當前位置、順序 )

	local IcePiercePos = Vector_GetRolePos( IcePierce );
	local PlayerPos = Vector_GetRolePos( Player );

	Sleep(g_IcePierceWarningTime*10);
	SysCastSpellLv( Master, IcePierce, g_IcePierceActMagicID, 0 );	-- 表演特效

	local Sec = MoveDirect( IcePierce, PlayerPos.X, PlayerPos.Y, PlayerPos.Z );
	local NewPlayerPos = Vector_GetRolePos( Player );
	
	--檢查目標是否在指定長、寬的直線範圍內，否回傳Nil、是的話回傳目標與起點的距離 ( 起點座標、終點座標、寬度、高度、目標座標)
	local Status = Vector_CheckShootObj( IcePiercePos, PlayerPos, 10, 60, NewPlayerPos );
	DebugMsg( 0, 0, "No. "..i.. ", Hit = "..tostring( Status ) );
	if Status then
		SysCastSpellLv( Master, Player, g_IcePierceAttackMagicID, 0 );	-- 傷害
	end
--	DebugMsg( 0, 0, "i = "..i..", Sec = "..Sec );
end

function MirrorWorld_104845_Shell( Owner, Room )	-- 音貝產生劇情

	local List = {};	-- 篩選場上尚未產生音貝的格位，並將清單中已消失的音貝移進清單
	for Index, Shell in ipairs(g_ShellList[Room]) do
		if not CheckID( g_ShellList[Room][Index].Guid ) then
			table.insert( List, Index );
		--	DebugMsg( Owner, Room, "Index = "..Index );
		end
	end

	if g_ShellTotallyCount - #List < g_ShellMaxCount then	-- 場上所有格數 - 當前剩餘格數 < 音貝最大產生數量時
		local Index = List[math.random( #List )];		-- 場上尚未產生音貝的總格數，從這些格子中產生音貝
	--	DebugMsg( Owner, Room, "Index = "..List[Index].." Totally = "..#List );
		local Obj = MirrorWorld_106960_CreateLua( Room, Index );
	end
end

function MirrorWorld_106960_CreateLua( Room, Index )	-- 生成音貝

	local Obj = CreateObj( g_ShellID, g_ShellList[Room][Index].X, g_ShellList[Room][Index].Y+2, g_ShellList[Room][Index].Z, 0, 1 );
	SetModeEx( Obj, EM_SetModeType_Gravity, false );	--重力
	SetModeEx( Obj, EM_SetModeType_ShowRoleHead, true );	--頭像框
	SetModeEx( Obj, EM_SetModeType_Fight, true );	-- 可砍殺
	SetModeEx( Obj, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( Obj, EM_SetModeType_Strikback, false );	-- 反擊
	g_ShellList[Room][Index].Guid = Obj;
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, g_ShellLiveTime );
	AddToPartition( Obj, Room );
	return Obj;
end

function MirrorWorld_106959_DeadLua()	-- 音貝死亡劇情

	DelObj( OwnerID() );
end

function MirrorWorld_104845_InitLua()	-- Boss 戰鬥劇情

	local Owner = OwnerID();
	CallPlot( Owner, "MirrorWorld_104845_Fight", Owner );
	SetPlot( Owner, "Dead", "MirrorWorld_104845_LeaveFight", 0 );	-- 死亡劇情
end

function MirrorWorld_104845_Fight( Owner )	-- Boss 戰鬥開始劇情

	local Room = ReadRoleValuefloat( Owner, EM_RoleValue_RoomID );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );	-- 角度

	g_ShellList = {};	-- 重置音貝位置的座標清單
	g_ShellList[Room] = {};
	g_BloodList = {};	-- 重置嗜血利牙的清單
	g_BloodList[Room] = {};

	g_ShellList[Room] = MirrorWorld_104845_GetShellPos(Owner,Room);

	for i = 1, #g_ShellDebutPos do	-- 每次開場時，產生固定格位的音貝
		local Obj = MirrorWorld_106960_CreateLua( Room, g_ShellDebutPos[i] );
	end

	local Counter = 0;

	-- 音貝、嗜血利牙產生劇情
	While true do

		Sleep(10);
		local Player = false;
		local HateList = HateListCount( Owner );
		for Pos = 0, HateList-1 do	-- 檢查 Boss 仇恨表
			local Guid = HateListInfo( Owner, Pos, EM_HateListInfoType_GItemID );
			if ReadRoleValue( Guid, EM_RoleValue_IsPlayer ) == 1 then	-- 仇恨表內有任一目標為玩家時，避免僅剩音貝時，不跳出戰鬥劇情的問題
				Player = Guid;
				break;
			end
		end

		if not Player then
			break;
		end

		Counter = Counter + 10;

		-- Boss施放深海重壓
		if Counter%g_WaterPressureTickTime == 0 then
		--	DebugMsg( 0, 0, "Counter = "..Counter );
			MirrorWorld_104845_WaterPressure( Owner, Room );
		end

		-- 產生音貝
		if Counter%g_ShellBornTickTime == 0 then
		--	DebugMsg( 0, 0, "Counter = "..Counter );
			MirrorWorld_104845_Shell( Owner, Room );
		end

		-- 產生嗜血利牙
		if Counter%g_BloodBornTickTime == 0 then
		--	DebugMsg( 0, 0, "Counter = "..Counter );
			MirrorWorld_104845_Blood( Owner, Room );
		end

		-- 其他技能
		if Counter%g_WaveTickTime == 0 then	-- Boss施放浪潮衝擊
			MirrorWorld_WaveCreate( Owner, Player, Room );
		elseif Counter%g_IcePierceTickTime == 0 then	-- Boss施放冰尖柱
			MirrorWorld_PierceCreate( Owner, Player, Room );
		end
	end
	MirrorWorld_104845_LeaveFight()
end

function MirrorWorld_104845_LeaveFight()	-- 執行刪除劇情

	local Room = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );

	-- 刪除音貝
	for i = 1, #g_ShellList[Room] do
		if CheckID( g_ShellList[Room][i].Guid ) then
			DelObj( g_ShellList[Room][i].Guid );
		end
	end
	-- 刪除嗜血利牙
	for i = 1, #g_BloodList[Room] do
		if CheckID( g_BloodList[Room][i] ) then
			DelObj( g_BloodList[Room][i] );
		end
	end
end

function MirrorWorld_104845_Blood( Owner, Room )	-- 嗜血利牙產生劇情

	local BloodCount = #g_BloodList[Room];
	DebugMsg( 0, Room, "Blood Totally = "..BloodCount );

	for i = BloodCount, 1, -1 do	-- 刪除清單中無效的嗜血利牙
		if not CheckID( g_BloodList[Room][i] ) then
			table.remove( g_BloodList[Room], i );
		end
	end

	if BloodCount < g_BloodMaxCount then	-- 判斷是否可生成嗜血利牙
		local OwnerPos = Vector_GetRolePos( Owner );	-- 座標
		local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );	-- 角度
		local BornCount = g_BloodMaxCount - BloodCount;	-- 此次生成隻數
	--	DebugMsg( Owner, Room, "Dir = "..Dir..", "..tostring( OwnerPos ) );

		if BornCount > g_BloodBornCount then
			BornCount = g_BloodBornCount;
		end
	--	DebugMsg( Owner, Room, "Blood This Born = "..BornCount );

		for i = 0, BornCount-1 do
			local VecDir = Vector_DirToVector( Dir + i * 360/BornCount );	-- 角度轉向量
			local TargetPos = OwnerPos + VecDir * g_BloodBornDis;
			local Obj = CreateObj( g_BloodID, TargetPos.X, TargetPos.Y, TargetPos.Z, 0, 1 );
			table.insert( g_BloodList[Room], Obj );
			MoveToFlagEnabled( Obj, false );	-- 關閉巡邏劇情
		--	WriteRoleValue( Obj, EM_RoleValue_LiveTime, 60 );
			WriteRoleValue( Obj, EM_RoleValue_PID, Owner );	-- 將 Boss 寫進嗜血利牙的 PID 中
			AddToPartition( Obj, Room );
		--	AddBuff( Obj, g_UnHealHpAuto, 0, -1 );
			SetPlot( Obj, "Dead", "MirrorWorld_106960_Dead", 0 );
		end
	end
end

function MirrorWorld_106960_Dead()	-- 嗜血利牙死亡劇情

	local Owner = OwnerID();
	SetModeEx( Owner, EM_SetModeType_ShowRoleHead, false );	-- 關閉頭像框
	SetModeEx( Owner, EM_SetModeType_Fight, false );	-- 關閉砍殺
	SetModeEx( Owner, EM_SetModeType_Searchenemy, false );	-- 關閉索敵
	SetModeEx( Owner, EM_SetModeType_Strikback, false );	-- 關閉反擊
	PlayMotionEx( Owner, 145, 146 );	-- 播放死亡動作

	local Master = ReadRoleValue( Owner, EM_RoleValue_PID );	-- Boss
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Hp = ReadRoleValue( Master, EM_RoleValue_HP );
	local MaxHp = ReadRoleValue( Master, EM_RoleValue_MaxHP );
--	DebugMsg( 0, 0, "Hp Percent = "..Hp/MaxHp );
	if Hp / MaxHp > 0.01 then	-- 嗜血利牙死亡時，讓 Boss 扣除 1% 生命
		WriteRoleValue( Master, EM_RoleValue_HP, Hp - (MaxHp*0.01) );
		SysCastSpellLv( Owner, Master, g_BloodDeadMagicID, 0 );	-- 表演特效
		CallPlot( Owner, "MirrorWorld_106960_DelSelf", Owner );
	end
	return false;
end

function MirrorWorld_106960_DelSelf( Owner )	-- 刪除自己

	Sleep(10);
	DelObj( Owner );
end

function MirrorWorld_106960_InitLua()	-- 嗜血利牙起始劇情

	local Owner = OwnerID();
	SetModeEx( Owner, EM_SetModeType_Fight, true );	-- 可砍殺
	SetModeEx( Owner, EM_SetModeType_Strikback, false );	-- 反擊
	SetModeEx( Owner, EM_SetModeType_Searchenemy, false );	-- 索敵
	MoveToFlagEnabled( Owner, false );	-- 關閉巡邏劇情
	CallPlot( Owner, "MirrorWorld_106960_Fight", Owner );
end

function MirrorWorld_106960_Fight( Owner )	-- 嗜血利牙戰鬥劇情

	local Master = ReadRoleValue( Owner, EM_RoleValue_PID );	-- Boss
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local AttackShell = 0;	-- 當前攻擊目標

	while true do	-- 每 0.5 秒確認場上是否有音貝，有的話優先攻擊最近的音貝，否則就攻擊玩家。

		local ShellCount = {};	-- 音貝清單
		for i = 1, #g_ShellList[Room] do
			if CheckID( g_ShellList[Room][i].Guid ) then	-- 將存在的音貝放入音貝清單中
				table.insert( ShellCount, g_ShellList[Room][i].Guid );
			end
		end

		if #ShellCount == 0 then	-- 當場上沒有任何音貝時
			Target = HateListInfo( Master, 0, EM_HateListInfoType_GItemID );	-- 取得 Boss 仇恨列表中第一名的目標
			SetAttack( Owner, Target );
		--	DebugMsg( 0, Room, "ShellCount = "..#ShellCount );

		elseif AttackShell == 0 then	-- 當場上有音貝，尚未設定攻擊音貝時
			local OwnerPos = Vector_GetRolePos(Owner);
			local RangeList = {};	-- 距離清單
			for i = 1, #g_ShellList[Room] do	-- 音貝清單
				if CheckID( g_ShellList[Room][i].Guid ) and ReadRoleValue( g_ShellList[Room][i].Guid, EM_RoleValue_IsDead ) == 0 then
					local ShellPos = Vector_GetRolePos( g_ShellList[Room][i].Guid );
					local Dis = ( OwnerPos - ShellPos ):Len();
					local Obj = {};
					Obj.Guid = g_ShellList[Room][i].Guid;
					Obj.Dis = Dis;
					table.insert( RangeList, Obj );
				end
			end
		--	DebugMsg( 0, Room, "ShellCount = "..#RangeList );
			if #RangeList > 0 then
				table.sort( RangeList, CompDis )	-- 將清單內的音貝依照距離由近至遠排序
				AttackShell = RangeList[1].Guid;
				SetStopAttack( Owner );	-- 停止攻擊
				SetAttack( Owner, AttackShell );
			end

		elseif not CheckID( AttackShell ) or ReadRoleValue( AttackShell, EM_RoleValue_IsDead ) == 1 then	-- 當攻擊的音貝不存在或死亡時
			AttackShell = 0;	-- 將當前攻擊目標重置
		--	DebugMsg( 0, Room, "Reset Target" );
		end
		Sleep(5);
	end	
end

function MirrorWorld_106959_InitLua()	-- 音貝起始劇情

	local Owner = OwnerID();
	CallPlot( Owner, "MirrorWorld_106959_Range", Owner );
end

function MirrorWorld_106959_Range( Owner )	-- 接近音貝時給予玩家Buff，並清除玩家身上的深海重壓

	Sleep(10);	-- 1秒後裝置就緒

	while true do
		local Count = SetSearchRangeInfo( Owner, 10 );
		if Count > 0 then	-- 只對玩家有效，忽略其他物件
			for i = 1, Count, 1 do
				local Guid = GetSearchResult();
				if ReadRoleValue( Guid, EM_RoleValue_IsPlayer ) == 1 then
					SetModeEx( Owner, EM_SetModeType_Fight, false );
					WriteRoleValue( Owner, EM_RoleValue_IsWalk, 0 );	-- 跑步
					local OwnerPos = Vector_GetRolePos( Owner );
					local Sec = MoveDirect( Owner, OwnerPos.X, OwnerPos.Y+25, OwnerPos.Z );
					SysCastSpellLv( Guid, Guid, g_ShellCloseMagicID, 0 );
					AddBuff( Guid, g_ShellBuffID, 0, g_ShellBuffTime );
					if CheckBuff( Guid, g_WaterPressureBuffID ) then
						local BuffLv = Lua_Hao_Return_Buff_Lv( Guid, g_WaterPressureBuffID ) - 5;
						CancelBuff_NoEvent( Guid, g_WaterPressureBuffID );
						if BuffLv > -1 then
							AddBuff( Guid, g_WaterPressureBuffID, BuffLv, -1 );
						end
					end
					Sleep(25);
					DelObj( Owner );
				end
			end
		end
		Sleep(1);
	end
end