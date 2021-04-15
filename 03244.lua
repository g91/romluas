------------------------------------------------------------------
-- Z34副本
-- Boss 1
-- 菁英鬥士小隊
------------------------------------------------------------------

---------------------------------全域變數設定---------------------------------
--NPC
local g_Door_GUID = 106249	--阻擋門物件編號
local g_Boss_GUID = {};
g_Boss_GUID[ 1 ] = { 106256 , 107353 , 107383 };		--蝕光者
g_Boss_GUID[ 2 ] = { 106257 , 107354 , 107384 };		--熄望者
g_Boss_GUID[ 3 ] = { 106258 , 107355 , 107385 };		--播禍者
local g_Treasure_GUID = { 101378 , 107352 , 107382 };	--小隊戰利品
local g_RandFormat = { 1 , 3 };							--隨機陣型的選擇範圍（方便測試用）

local g_FormationTime = 30;	--陣型切換時間
local g_RevivalTime = 30;	--死亡復活時間

local g_Skill = {}; 
--通用狀態
g_Skill.BuffID_LockHpBuff = 502707;	--停止自動回血，避免取消索敵的物件快速回血。
g_Skill.BuffID_Avengers = 503452;	--復仇者
g_Skill.BuffID_Frenzy = 503281;		--狂暴：撕裂靈魂
g_Skill.FrenzyTime = { 480 , 360 , 9999999 };	--狂暴時間

--Boss基礎法術
g_Skill.Boss1 = {};	--蝕光者
g_Skill.Boss1.SkillID = 493181;			--雷光狂襲
g_Skill.Boss1.CD = 10;					--雷光狂襲 - 法術冷卻
g_Skill.Boss1.ObjID = 107349;			--雷光狂襲 - 透明球物件
g_Skill.Boss1.BuffID_Show = 509880;		--雷光狂襲 - 表演特效
g_Skill.Boss1.SkillID_Dmg = 493182;		--雷光狂襲 - 傷害法術
g_Skill.Boss1.Interval = 0.2;			--雷光狂襲 - 傷害法術施展間隔
g_Skill.Boss1.DmgCount = 10;			--雷光狂襲 - 傷害法術施展次數
g_Skill.Boss1.SkillLv = { 2 , 1 , 0 };	--雷光狂襲 - 法術等級


g_Skill.Boss2 = {};	--熄望者
g_Skill.Boss2.SkillID = 493228;			--紫焰灼身
g_Skill.Boss2.CD = 3;					--紫焰灼身 - 法術冷卻
g_Skill.Boss2.SkillLv = { 2 , 1 , 0 };	--紫焰灼身 - 法術等級

g_Skill.Boss3 = {}	--播禍者
g_Skill.Boss3.SkillID = 495032;			--震地擊
g_Skill.Boss3.CD = 7;					--震地擊 - 法術冷卻

--陣型相關
g_Skill.FormationA = {};	--瞬影陣
g_Skill.FormationA.SkillID_FlashDmg = 493335;		--瞬影磁能
g_Skill.FormationA.SkillID_FlashCharge = 492352;	--瞬影衝鋒
g_Skill.FormationA.CD = 3;							--瞬影衝鋒 - 法術冷卻

g_Skill.FormationB = {};	--碎滅陣
g_Skill.FormationB.SkillID_Thunder = 494574;		--闇雷力場
g_Skill.FormationB.SkillID_Fire = 495079;			--紫焰噴射
g_Skill.FormationB.ObjID_Thunder = 107350;			--闇雷力場 - 透明球物件
g_Skill.FormationB.ObjID_Fir = 107351;				--紫焰噴射 - 透明球物件
g_Skill.FormationB.BuffID_Thunder_Dmg = 500287;		--闇雷力場 - 持續製造傷害狀態
g_Skill.FormationB.BuffID_Fire_Dmg = 503997;		--紫焰噴射 - 持續製造傷害狀態
g_Skill.FormationB.Time_Thunder = 3;				--闇雷力場 - 持續時間
g_Skill.FormationB.Time_Fire = 1;					--紫焰噴射 - 持續時間
g_Skill.FormationB.SkillLv_Thunder = { 2 , 1 , 0 };	--闇雷力場 - 法術等級
g_Skill.FormationB.SkillLv_Fire = { 2 , 1 , 0 };	--紫焰噴射 - 法術等級

g_Skill.FormationC = {};	--牽引陣
g_Skill.FormationC.BuffID_Shield = 503544;			--牽引導護
g_Skill.FormationC.SkillID_LineShow = 493325;		--紫雷牽引 - 充能
g_Skill.FormationC.SkillID_LineDmg = 493326;		--紫雷牽引 - 傷害
g_Skill.FormationC.CD = 6;							--紫雷牽引 - 法術冷卻
g_Skill.FormationC.BuffID_Charged = 503543;			--牽引充能
g_Skill.FormationC.ChargedMax = 10;					--牽引充能集滿放紫焰焚境的層數
g_Skill.FormationC.SkillID_Burn = 495290;			--紫焰焚境
g_Skill.FormationC.SkillLv_LineDmg = { 2 , 1 , 0 };	--紫雷牽引 - 法術等級
g_Skill.FormationC.SkillLv_Burn = { 2 , 1 , 0 };	--紫焰焚境 - 法術等級

g_Skill.FormationD = {};	--三角陣
g_Skill.FormationD.BuffID_01 = 500865;			--三角陣 - 蝕光者
g_Skill.FormationD.BuffID_02 = 500866;			--三角陣 - 熄望者
g_Skill.FormationD.BuffID_03 = 500867;			--三角陣 - 播禍者
g_Skill.FormationD.BuffID_Invincible = 500868;	--無敵
g_Skill.FormationD.BuffID_Hot = 500869;			--再生
g_Skill.FormationD.SkillID_Fire = 495102;		--紫焰迴旋
g_Skill.FormationD.SkillLv = { 2 , 1 , 0 };		--紫焰迴旋 - 法術等級

--狂暴
local g_FrenzyBuff = 503281;	--狂暴Buff
local g_FrenzyTime = { 480 , 360 , 9999999 };		--狂暴時間

local g_FlagID = {};	--顯像旗子
g_FlagID.FlagID = 781423;		--Z34_1王用旗標
g_FlagID.Boss = { 0 , 1 , 2 };	--Boss產生點
g_FlagID.Treasure = 3;			--戰利品產生點
g_FlagID.BeforeDoor = 11;		--前門產生點
g_FlagID.AfterDoor = 12;		--後門產生點
g_FlagID.FormationCenter = 100;	--陣型中心點
g_FlagID.FormationList = { 101 , 102 , 103 , 104 , 105 , 106 , 107 , 108 , 109 , 110 , 111 , 112 };	--陣型點01~12

local g_FightSwitch = {};	--戰鬥開關判斷
local g_Difficulty = {};	--紀錄副本難度
local g_Formation = {};		--紀錄使用中的陣型
--0（無）
--1（瞬影陣）
--2（碎滅陣）
--3（牽引陣）
--4（三角陣）
--5（陣型轉換階段）
local g_RandFlagPos = {}	--紀錄陣型點經亂數排序後的順序
local g_Boss = {};			--紀錄Boss的物件編號
g_Boss[ 1 ] = {};	--蝕光者
g_Boss[ 2 ] = {};	--熄望者
g_Boss[ 3 ] = {};	--播禍者
local g_BossAlive = {};	--用來記錄三位Boss是否活著
g_BossAlive[ 1 ] = {};	--蝕光者
g_BossAlive[ 2 ] = {};	--熄望者
g_BossAlive[ 3 ] = {};	--播禍者
local g_BossNowPos = {};	--用來記錄三位Boss當前傳送的旗標位置
g_BossNowPos[ 1 ] = {};	--蝕光者
g_BossNowPos[ 2 ] = {};	--熄望者
g_BossNowPos[ 3 ] = {};	--播禍者
local g_HaveCast = {};	--用來判斷瞬影衝鋒、紫雷牽引是否已施展
g_HaveCast[ 1 ] = {};	--蝕光者
g_HaveCast[ 2 ] = {};	--熄望者
g_HaveCast[ 3 ] = {};	--播禍者
local g_LineDmg = {};	--用來判斷紫雷牽引的傷害是否有作用
g_LineDmg[ 1 ] = {};	--蝕光者
g_LineDmg[ 2 ] = {};	--熄望者
g_LineDmg[ 3 ] = {};	--播禍者

--廣播訊息
local g_BossTalk = {};
g_BossTalk[ "FifhtBegin" ]	= "[LUA_106256_AI_FIGHTBEGIN]";				--戰鬥開始
g_BossTalk[ "BossWin" ]		= "[LUA_106256_AI_BOSSWIN]";				--戰鬥結束
g_BossTalk[ "BossDie" ]		= "[LUA_106256_AI_BOSSDEAD]";				--Boss死亡
g_BossTalk[ "BossFrenzy" ]	= "[LUA_106256_AI_BOSSFRENZY]";				--Boss狂暴
g_BossTalk[ "BossReBirth" ]	= "[LUA_106256_AI_BOSSREBIRTH][$SETVAR1=";	--Boss重生
g_BossTalk[ "Formation1" ]	= "[LUA_106256_AI_FORMATION_1]";			--啟動瞬影陣
g_BossTalk[ "Formation2" ]	= "[LUA_106256_AI_FORMATION_2]";			--啟動碎滅陣
g_BossTalk[ "Formation3" ]	= "[LUA_106256_AI_FORMATION_3]";			--啟動牽引陣
g_BossTalk[ "Formation4" ]	= "[LUA_106256_AI_FORMATION_4]";			--啟動三角陣

---------------------------------中控器 - 產王與階段處理---------------------------------
function Z34_BOSS1_CtrlCenter_Begin()	--初始劇情
	local CtrlCenter = OwnerID();	--中控器
	local RoomID = ReadRoleValue( CtrlCenter , EM_RoleValue_RoomID );
	CallPlot( CtrlCenter , "Z34_BOSS1_CtrlCenter_Stage" , CtrlCenter , RoomID );	--中控器 - 產王與階段處理
end
function Z34_BOSS1_CtrlCenter_Stage( CtrlCenter , RoomID )
	--難度判斷
	local ZoneID = ReadRoleValue( CtrlCenter , EM_RoleValue_ZoneID );
	if ZoneID == 180 then
		g_Difficulty[ RoomID ] = 3;	--簡單
	elseif ZoneID == 179 then
		g_Difficulty[ RoomID ] = 2;	--普通
	else
		g_Difficulty[ RoomID ] = 1;	--困難
	end	

	local Boss = { 0 , 0 , 0 };	
	local BeforeDoor;	--前門
	local AfterDoor;	--後門
	
	g_FightSwitch[ RoomID ] = false;	--戰鬥開關判斷先設為false
	g_Formation[ RoomID ] = 0;			--將陣型改為：0（無）
	
	--生成Boss
	for i = 1 , 3 do
		Boss[ i ] = CreateObjByFlag( g_Boss_GUID[ i ][ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Boss[ i ] , 1 );
		SetModeEx( Boss[ i ] , EM_SetModeType_Mark , true );			--點選(是)
		SetModeEx( Boss[ i ] , EM_SetModeType_ShowRoleHead , true ); 	--頭像框(是)
		SetModeEx( Boss[ i ] , EM_SetModeType_Fight , true );			--砍殺(是)
		SetModeEx( Boss[ i ] , EM_SetModeType_Strikback , true );		--反擊(是)
		SetModeEx( Boss[ i ] , EM_SetModeType_Searchenemy , true );		--索敵(是)
		SetModeEx( Boss[ i ] , EM_SetModeType_Move , true ); 			--移動(是)
		AddToPartition( Boss[ i ] , RoomID );
		g_Boss[ i ][ RoomID ] = Boss[ i ];	--將Boss的物件編號寫回全域變數中
		g_BossAlive[ i ][ RoomID ] = true;		--設定Boss為活著
		SetPlot( Boss[ i ] , "dead" , "Z34_BOSS1_Boss_Dead" , 0 );			--Boss - 死亡不消失劇情
	end
	if Zone ~= 941 then	Hao_antiHacker_Init( 1 );	end	--防駭客新制，掛在物件產生劇情，後面填入Boss順序
	
	--生成後門
	AfterDoor = CreateObjByFlag( g_Door_GUID , g_FlagID.FlagID , g_FlagID.AfterDoor , 1 )
	SetModeEx( AfterDoor , EM_SetModeType_HideName , false );		--顯示名稱(否)
	SetModeEx( AfterDoor , EM_SetModeType_NotShowHPMP , false );	--顯示血條(否)
	SetModeEx( AfterDoor , EM_SetModeType_ShowRoleHead , false );	--頭像框(否)
	SetModeEx( AfterDoor , EM_SetModeType_Mark , false );			--點選(否)
	SetModeEx( AfterDoor , EM_SetModeType_Fight , false );			--砍殺(否)
	SetModeEx( AfterDoor , EM_SetModeType_Strikback , false );		--反擊(否)
	SetModeEx( AfterDoor , EM_SetModeType_Searchenemy , false );	--索敵(否)
	SetModeEx( AfterDoor , EM_SetModeType_Move , false );			--移動(否)
	SetModeEx( AfterDoor , EM_SetModeType_Obstruct , true );		--阻擋(是)
	AddToPartition( AfterDoor , RoomID );
	
	while true do
	Sleep( 10 );
		if HateListCount( Boss[ 1 ] ) ~= 0 or HateListCount( Boss[ 2 ] ) ~= 0 or HateListCount( Boss[ 3 ] ) ~= 0 then	--任何一隻Boss的仇恨表有人
			if g_FightSwitch[ RoomID ] == false then	--戰鬥開關未開
				g_FightSwitch[ RoomID ] = true;			--將戰鬥開關打開
				CallPlot( CtrlCenter , "Z34_BOSS1_FormationCtrl" , CtrlCenter , RoomID );	--中控器 - 陣型控制劇情
				CallPlot( Boss[ 1 ] , "Z34_BOSS1_Boss_1_Fight" , Boss[ 1 ] , RoomID );		--蝕光者 - 戰鬥劇情
				CallPlot( Boss[ 2 ] , "Z34_BOSS1_Boss_2_Fight" , Boss[ 2 ] , RoomID );		--熄望者 - 戰鬥劇情
				CallPlot( Boss[ 3 ] , "Z34_BOSS1_Boss_3_Fight" , Boss[ 3 ] , RoomID );		--播禍者 - 戰鬥劇情
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "FifhtBegin" ] , 2 );	--廣播Boss開戰
				for i = 1 , 3 do	AddBuff( Boss[ i ] , g_Skill.BuffID_LockHpBuff , 0 , -1 );	end	--給所有Boss停止自動回HP的狀態
				--1王戰鬥開始不用掛防駭客
				
				--生成前門
				BeforeDoor = CreateObjByFlag( g_Door_GUID , g_FlagID.FlagID , g_FlagID.BeforeDoor , 1 )
				SetModeEx( BeforeDoor , EM_SetModeType_HideName , false );		--顯示名稱(否)
				SetModeEx( BeforeDoor , EM_SetModeType_NotShowHPMP , false );	--顯示血條(否)
				SetModeEx( BeforeDoor , EM_SetModeType_ShowRoleHead , false );	--頭像框(否)
				SetModeEx( BeforeDoor , EM_SetModeType_Mark , false );			--點選(否)
				SetModeEx( BeforeDoor , EM_SetModeType_Fight , false );			--砍殺(否)
				SetModeEx( BeforeDoor , EM_SetModeType_Strikback , false );		--反擊(否)
				SetModeEx( BeforeDoor , EM_SetModeType_Searchenemy , false );	--索敵(否)
				SetModeEx( BeforeDoor , EM_SetModeType_Move , false );			--移動(否)
				SetModeEx( BeforeDoor , EM_SetModeType_Obstruct , true );		--阻擋(是)
				AddToPartition( BeforeDoor , RoomID );
			end
		end
	
		if HateListCount( Boss[ 1 ] ) == 0 and HateListCount( Boss[ 2 ] ) == 0 and HateListCount( Boss[ 3 ] ) == 0	--所有Boss的仇恨表沒人
		and g_Formation[ RoomID ] ~= 5 and g_FightSwitch[ RoomID ] == true then	--陣型不是在 5（陣型轉換階段），戰鬥開關已開
			sleep( 10 );
			--延遲1秒後再次判斷，避免剛好遇上陣型切換仇恨還沒上的空檔
			if HateListCount( Boss[ 1 ] ) == 0 and HateListCount( Boss[ 2 ] ) == 0 and HateListCount( Boss[ 3 ] ) == 0	--所有Boss的仇恨表沒人
			and g_Formation[ RoomID ] ~= 5 and g_FightSwitch[ RoomID ] == true then	--陣型不是在 5（陣型轉換階段），戰鬥開關已開
				if g_BossAlive[ 1 ][ RoomID ] == true or g_BossAlive[ 2 ][ RoomID ] == true or g_BossAlive[ 3 ][ RoomID ] == true then	--任何一隻BOSS還存活
					g_FightSwitch[ RoomID ] = false;	--將戰鬥開關關閉
					Delobj( BeforeDoor );	--刪除前門
					ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "BossWin" ] , 2 );	--廣播Boss勝利
					CallPlot( CtrlCenter , "Z34_BOSS1_CtrlCenter_Clear" , CtrlCenter , RoomID );	--中控器 - 清場劇情
					sleep( 50 );
					
					--重置Boss
					for i = 1 , 3 do
						Boss[ i ] = CreateObjByFlag( g_Boss_GUID[ i ][ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Boss[ i ] , 1 );
						SetModeEx( Boss[ i ] , EM_SetModeType_Mark , true );			--點選(是)
						SetModeEx( Boss[ i ] , EM_SetModeType_ShowRoleHead , true ); 	--頭像框(是)
						SetModeEx( Boss[ i ] , EM_SetModeType_Fight , true );			--砍殺(是)
						SetModeEx( Boss[ i ] , EM_SetModeType_Strikback , true );		--反擊(是)
						SetModeEx( Boss[ i ] , EM_SetModeType_Searchenemy , true );		--索敵(是)
						SetModeEx( Boss[ i ] , EM_SetModeType_Move , true ); 			--移動(是)
						AddToPartition( Boss[ i ] , RoomID );
						g_Boss[ i ][ RoomID ] = Boss[ i ];	--將Boss的物件編號寫回全域變數中
						g_BossAlive[ i ][ RoomID ] = true;		--設定Boss為活著
						SetPlot( Boss[ i ] , "dead" , "Z34_BOSS1_Boss_Dead" , 0 );			--Boss - 死亡不消失劇情
					end
					if Zone ~= 941 then	Hao_antiHacker_Init( 1 );	end	--防駭客新制，掛在物件產生劇情，後面填入Boss順序
				end
			end
		end			
			
		if g_BossAlive[ 1 ][ RoomID ] == false and g_BossAlive[ 2 ][ RoomID ] == false and g_BossAlive[ 3 ][ RoomID ] == false then	--BOSS皆已死亡
			g_FightSwitch[ RoomID ] = false;	--將戰鬥開關關閉
			Delobj( BeforeDoor );	--刪除前門
			Delobj( AfterDoor );	--刪除後門
			ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "BossDie" ] , 2 );	--廣播Boss死亡
			CallPlot( CtrlCenter , "Z34_BOSS1_CtrlCenter_Clear" , CtrlCenter , RoomID );	--中控器 - 清場劇情
			local Treasure = CreateObjByFlag( g_Treasure_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Treasure , 1 );	--生成戰利品
			SetModeEx( Treasure , EM_SetModeType_HideName , false );		--顯示名稱(否)
			SetModeEx( Treasure , EM_SetModeType_NotShowHPMP , false );		--顯示血條(否)
			SetModeEx( Treasure , EM_SetModeType_Mark , true );				--點選(是)
			SetModeEx( Treasure , EM_SetModeType_ShowRoleHead , true ); 	--頭像框(是)
			SetModeEx( Treasure , EM_SetModeType_Fight , false );			--砍殺(否)
			SetModeEx( Treasure , EM_SetModeType_Strikback , false );		--反擊(否)
			SetModeEx( Treasure , EM_SetModeType_Searchenemy , false );		--索敵(否)
			SetModeEx( Treasure , EM_SetModeType_Move , false ); 			--移動(否)
			SetModeEx( Treasure , EM_SetModeType_Obstruct , true );			--阻擋(是)
			AddToPartition( Treasure , RoomID );
			if Zone ~= 941 then	Hao_antiHacker_Dead( 1 );	end	--防駭客新制，掛在死亡劇情，填入Boss順序
			sleep( 50 );
			return	--結束此函式
		end
	end
end

---------------------------------中控器 - 清場劇情---------------------------------
function Z34_BOSS1_CtrlCenter_Clear( CtrlCenter , RoomID )
	for i = 1 , 3 do
		DelObj( g_Boss[ i ][ RoomID ] );		--刪除Boss
		g_BossAlive[ i ][ RoomID ] = false;		--設定該Boss為活死亡
	end	--刪除BOSS
end

---------------------------------Boss - 死亡不消失劇情---------------------------------
function Z34_BOSS1_Boss_Dead()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	MagicInterrupt( Boss );	--中斷法術唱咒
	PlayMotionEX( Boss, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP );	--播放死亡動作
	SetModeEx( Boss , EM_SetModeType_Mark , false );		--點選(否)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , false ); --頭像框(否)
	SetModeEx( Boss , EM_SetModeType_Fight , false );		--砍殺(否)
	SetModeEx( Boss , EM_SetModeType_Strikback , false );	--反擊(否)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , false );	--索敵(否)
	SetModeEx( Boss , EM_SetModeType_Move , false );		--移動(否)
	ClearHateList( Boss , -1 );	--清空仇恨
	for i = 1 , 3 do
		if ReadRoleValue( Boss , EM_RoleValue_OrgID ) == g_Boss_GUID[ i ][ g_Difficulty[ RoomID ] ] then
			g_BossAlive[ i ][ RoomID ] = false;	--設定該Boss為死亡
			CallPlot( Boss , "Z34_BOSS1_Boss_Rebirth" , Boss , RoomID , i );	--BOSS - 重生劇情
		end
	end
	return false
end

---------------------------------BOSS - 重生劇情---------------------------------
function Z34_BOSS1_Boss_Rebirth( Boss , RoomID , i )
	Sleep( g_RevivalTime * 10 );
	PlayMotion( Boss, ruFUSION_ACTORSTATE_ACTIVATE_END );	--播放復活動作
	WriteRoleValue( Boss , EM_RoleValue_HP , ReadRoleValue( Boss , EM_RoleValue_MaxHP ));	--回滿生命
	SetModeEx( Boss , EM_SetModeType_Mark , true );			--點選(是)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); --頭像框(是)
	SetModeEx( Boss , EM_SetModeType_Fight , true );		--砍殺(是)
	SetModeEx( Boss , EM_SetModeType_Strikback , true );	--反擊(是)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true );	--索敵(是)
	SetModeEx( Boss , EM_SetModeType_Move , true );			--移動(是)
	AddBuff( Boss , g_Skill.BuffID_Avengers , 0 , -1 );		--給予一層復仇者狀態
	g_BossAlive[ i ][ RoomID ] = true;		--設定Boss為活著
	local BossName = Getname( Boss );	--目標名稱
	ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossReBirth" ] .. BossName .. "]" , 2 );	--廣播Boss重生
end

---------------------------------中控器 - 陣型控制劇情---------------------------------
function Z34_BOSS1_FormationCtrl( CtrlCenter , RoomID )
	local Clock = 0;	--秒數計數器
	local Count = 0;	--陣型啟動計數器
	local FrenzyRecord = false;	--狂暴施展過的紀錄
	
	while true do
		Sleep( 10 );	--每1秒偵測一次
		Clock = Clock + 1;
		
		--狂暴秒數與條件判斷
		if Clock % g_FrenzyTime[ g_Difficulty[ RoomID ] ] == 0 and FrenzyRecord == false then
			for i = 1 , 3 do	AddBuff( g_Boss[ 1 ][ RoomID ] , g_FrenzyBuff , 0 , -1 );	end	--給予Boss狂暴狀態
			ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "BossFrenzy" ] , 2 );	--廣播Boss狂暴
			FrenzyRecord = true;	--紀錄已狂暴
		end
		
		if g_FightSwitch[ RoomID ] == false then	--戰鬥開關已關
			g_Formation[ RoomID ] = 0;	--將陣型改為：0（無）
			return						--結束此函示
			
		elseif Clock % g_FormationTime == 0 then	--符合陣型切換時間
			Count = Count + 1;
			
			--每次切換陣型時，就將陣型點重新洗牌
			g_RandFlagPos[ RoomID ] = g_FlagID.FormationList
			for i = 1 , 999 do --洗牌，隨機清單中的順序999次，多洗幾次避免太整齊
				local j = RandRange( 1 , #g_RandFlagPos[ RoomID ] );
				local k = RandRange( 1 , #g_RandFlagPos[ RoomID ] );
				local temp = g_RandFlagPos[ RoomID ][ k ];
				g_RandFlagPos[ RoomID ][ k ] = g_RandFlagPos[ RoomID ][ j ];
				g_RandFlagPos[ RoomID ][ j ] = temp;
			end
			
			local RandNumber = RandRange( g_RandFormat[ 1 ] , g_RandFormat[ 2 ] );
			if Count % 3 == 0 then	--3的倍數次轉換，一律轉為三角陣
				g_Formation[ RoomID ] = 5;	--將陣型改為：5（陣型轉換階段）
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--中控器 - 陣型轉換
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "Formation4" ] , 2 );	--廣播啟動三角陣
				g_BossNowPos[ 1 ][ RoomID ] = 104;	--蝕光者
				g_BossNowPos[ 2 ][ RoomID ] = 108;	--熄望者
				g_BossNowPos[ 3 ][ RoomID ] = 112;	--播禍者
				for i = 1 , 3 do	SetPosByFlag( g_Boss[ i ][ RoomID ] , g_FlagID.FlagID , g_BossNowPos[ i ][ RoomID ] );	end	--移到指定陣型點
				Sleep( 20 );
				g_Formation[ RoomID ] = 4;	--將陣型改為：4（三角陣）
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--中控器 - 陣型轉換
				if g_BossAlive[ 1 ][ RoomID ] == true then	--若蝕光者活著
					SetModeEx( g_Boss[ 1 ][ RoomID ] , EM_SetModeType_Move , true );			--蝕光者：移動(是)
					AddBuff( g_Boss[ 1 ][ RoomID ] , g_Skill.FormationD.BuffID_01 , 0 , -1 );	--掛上三角陣判斷狀態
				end
				if g_BossAlive[ 2 ][ RoomID ] == true then	--若熄望者活著
					SetModeEx( g_Boss[ 2 ][ RoomID ] , EM_SetModeType_Move , true );			--熄望者：移動(是)
					AddBuff( g_Boss[ 2 ][ RoomID ] , g_Skill.FormationD.BuffID_02 , 0 , -1 );	--掛上三角陣判斷狀態
				end
				if g_BossAlive[ 3 ][ RoomID ] == true then	--若播禍者活著
					SetModeEx( g_Boss[ 3 ][ RoomID ] , EM_SetModeType_Move , true );			--播禍者：移動(是)
					AddBuff( g_Boss[ 3 ][ RoomID ] , g_Skill.FormationD.BuffID_03 , 0 , -1 );	--掛上三角陣判斷狀態
				end
				
			elseif RandNumber == 1 then		--準備轉為瞬影陣
				g_Formation[ RoomID ] = 5;	--將陣型改為：5（陣型轉換階段）
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--中控器 - 陣型轉換
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "Formation1" ] , 2 );	--廣播啟動瞬影陣
				g_BossNowPos[ 1 ][ RoomID ] = g_FlagID.FormationCenter;		--蝕光者：陣型中心點
				g_BossNowPos[ 2 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 1 ];	--熄望者：隨機陣型點1
				g_BossNowPos[ 3 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 2 ];	--播禍者：隨機陣型點2
				for i = 1 , 3 do	SetPosByFlag( g_Boss[ i ][ RoomID ] , g_FlagID.FlagID , g_BossNowPos[ i ][ RoomID ] );	end	--移到指定陣型點
				Sleep( 20 );
				g_Formation[ RoomID ] = 1;	--將陣型改為：1（瞬影陣）
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--中控器 - 陣型轉換
				if g_BossAlive[ 1 ][ RoomID ] == true then	--若蝕光者活著
					SetModeEx( g_Boss[ 1 ][ RoomID ] , EM_SetModeType_Move , true );			--蝕光者：移動(是)
				end
				
			elseif RandNumber == 2 then		--準備轉為碎滅陣
				g_Formation[ RoomID ] = 5;	--將陣型改為：5（陣型轉換階段）
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--中控器 - 陣型轉換
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "Formation2" ] , 2 );	--廣播啟動碎滅陣
				g_BossNowPos[ 1 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 1 ];	--蝕光者：隨機陣型點1
				g_BossNowPos[ 2 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 2 ];	--熄望者：隨機陣型點2
				g_BossNowPos[ 3 ][ RoomID ] = g_FlagID.FormationCenter;		--播禍者：陣型中心點
				for i = 1 , 3 do	SetPosByFlag( g_Boss[ i ][ RoomID ] , g_FlagID.FlagID , g_BossNowPos[ i ][ RoomID ] );	end	--移到指定陣型點
				Sleep( 20 );
				g_Formation[ RoomID ] = 2;	--將陣型改為：2（碎滅陣）
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--中控器 - 陣型轉換
				if g_BossAlive[ 3 ][ RoomID ] == true then	--若播禍者活著
					SetModeEx( g_Boss[ 3 ][ RoomID ] , EM_SetModeType_Move , true );			--播禍者：移動(是)
				end
				
			else							--準備轉為牽引陣
				g_Formation[ RoomID ] = 5;	--將陣型改為：5（陣型轉換階段）
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--中控器 - 陣型轉換
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "Formation3" ] , 2 );	--廣播啟動牽引陣
				g_BossNowPos[ 1 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 1 ];	--蝕光者：隨機陣型點1
				g_BossNowPos[ 2 ][ RoomID ] = g_FlagID.FormationCenter;		--熄望者：陣型中心點
				g_BossNowPos[ 3 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 2 ];	--播禍者：隨機陣型點2
				for i = 1 , 3 do	SetPosByFlag( g_Boss[ i ][ RoomID ] , g_FlagID.FlagID , g_BossNowPos[ i ][ RoomID ] );	end	--移到指定陣型點
				Sleep( 20 );
				g_Formation[ RoomID ] = 3;	--將陣型改為：3（牽引陣）
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--中控器 - 陣型轉換
				if g_BossAlive[ 2 ][ RoomID ] == true then	--若熄望者活著
					SetModeEx( g_Boss[ 2 ][ RoomID ] , EM_SetModeType_Move , true );			--熄望者：移動(是)
				end
				
			end
		end
	end
end

---------------------------------中控器 - 陣型轉換---------------------------------
function Z34_BOSS1_Boss_FormationChange( CtrlCenter , RoomID )
	if g_Formation[ RoomID ] == 5 then	--陣型轉換階段
		for i = 1 , 3 do
			if g_BossAlive[ i ][ RoomID ] == true then		--若Boss活著
				StopMove( g_Boss[ i ][ RoomID ] , false );	--停止Boss移動
				MagicInterrupt( g_Boss[ i ][ RoomID ] );	--中斷法術唱咒
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Strikback , false );		--反擊(否)
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Searchenemy , false );	--索敵(否)
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Move , false );			--移動(否)
				SetStopAttack( g_Boss[ i ][ RoomID ] );     --停止攻擊、離開戰鬥並清空仇恨
				g_HaveCast[ i ][ RoomID ] = false;			--重置特定法術的施展判斷
				g_LineDmg[ i ][ RoomID ] = false;			--重置紫雷牽引的傷害判斷
				PlayMotion( g_Boss[ i ][ RoomID ], ruFUSION_ACTORSTATE_CAST_SP01 );	--播放動作
			end
		end
		CancelBuff( g_Boss[ 1 ][ RoomID ] , g_Skill.FormationD.BuffID_01 );			--蝕光者：移除三角陣狀態
		CancelBuff( g_Boss[ 2 ][ RoomID ] , g_Skill.FormationD.BuffID_02 );			--熄望者：移除三角陣狀態
		CancelBuff( g_Boss[ 3 ][ RoomID ] , g_Skill.FormationD.BuffID_03 );			--播禍者：移除三角陣狀態
		CancelBuff( g_Boss[ 1 ][ RoomID ] , g_Skill.FormationD.BuffID_Hot );		--蝕光者：移除再生狀態
		CancelBuff( g_Boss[ 3 ][ RoomID ] , g_Skill.FormationD.BuffID_Invincible );	--播禍者：移除無敵狀態
		CancelBuff( g_Boss[ 1 ][ RoomID ] , g_Skill.FormationC.BuffID_Shield );		--蝕光者：移除牽引導護狀態
		CancelBuff( g_Boss[ 2 ][ RoomID ] , g_Skill.FormationC.BuffID_Charged );	--熄望者：移除牽引充能狀態
		CancelBuff( g_Boss[ 3 ][ RoomID ] , g_Skill.FormationC.BuffID_Shield );		--播禍者：移除牽引導護狀態

	else
		for i = 1 , 3 do
			if g_BossAlive[ i ][ RoomID ] == true then	--若Boss活著
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Strikback , true );	--反擊(是)
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Searchenemy , true );	--索敵(是)
				local Boss_RangePlayer = LUA_YOYO_RangePlayerNotGM( g_Boss[ i ][ RoomID ] , 1000 ) --抓取Boss範圍1000的玩家，排除GM
				if #Boss_RangePlayer >= 1 then	--若有抓到玩家
					Setattack( g_Boss[ i ][ RoomID ] , Boss_RangePlayer[ 1 ] );	--命令去打最近的玩家
				end
			end
		end
	end
end
---------------------------------蝕光者 - 戰鬥劇情---------------------------------
function Z34_BOSS1_Boss_1_Fight( Boss , RoomID )
	local Clock = 0;	--秒數計數器
	while true do
		Sleep( 10 );
		if g_BossAlive[ 1 ][ RoomID ] == true then
			Clock = Clock + 1;
			if g_Formation[ RoomID ] == 1 then	--瞬影陣
				if Clock % g_Skill.Boss1.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CastSpellLV( Boss , Boss , g_Skill.Boss1.SkillID , 0 );	--施展：雷光狂襲
				end
				
			elseif g_Formation[ RoomID ] == 2 then	--碎滅陣
				while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
				CastSpellLV( Boss , Boss , g_Skill.FormationB.SkillID_Thunder , 0 );	--施展：闇雷力場
				
			elseif g_Formation[ RoomID ] == 3 then	--牽引陣
				if g_HaveCast[ 1 ][ RoomID ] == false then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CallPlot( Boss , "Z34_BOSS1_Boss_ChangePos" , Boss , RoomID , 1 );		--Boss - 切換陣型點
					g_HaveCast[ 1 ][ RoomID ] = true;
					AddBuff( Boss , g_Skill.FormationC.BuffID_Shield , 0 , -1 );			--給予自身牽引導護的狀態
					CastSpellLV( Boss , g_Boss[ 2 ][ RoomID ] , g_Skill.FormationC.SkillID_LineShow , 0 );	--對熄望者施展：紫雷牽引 - 充能
					g_LineDmg[ 1 ][ RoomID ] = true;
					CallPlot( Boss , "Z34_BOSS1_Boss_LineDmg" , Boss , RoomID , 1 );		--Boss - 紫雷牽引傷害劇情
				else
					if Clock % g_Skill.FormationC.CD == 0 then
						g_HaveCast[ 1 ][ RoomID ] = false;
						g_LineDmg[ 1 ][ RoomID ] = false;
					end
				end
				
			elseif g_Formation[ RoomID ] == 4 or g_Formation[ RoomID ] == 0 then	--三角陣或無陣型
				if Clock % g_Skill.Boss1.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CastSpellLV( Boss , Boss , g_Skill.Boss1.SkillID , 0 );	--施展：雷光狂襲
				end
			
			else	Clock = 0;	--切換陣型時重製計數器時間
			end
		end
	end
end

---------------------------------熄望者 - 戰鬥劇情---------------------------------
function Z34_BOSS1_Boss_2_Fight( Boss , RoomID )
	local Clock = 0;	--秒數計數器
	while true do
		Sleep( 10 );
		if g_BossAlive[ 2 ][ RoomID ] == true then
			Clock = Clock + 1;
			if g_Formation[ RoomID ] == 1 then	--瞬影陣
				if g_HaveCast[ 2 ][ RoomID ] == false then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CallPlot( Boss , "Z34_BOSS1_Boss_ChangePos" , Boss , RoomID , 2 );				--Boss - 切換陣型點
					g_HaveCast[ 2 ][ RoomID ] = true;
					local PlayerList = LUA_YOYO_RangePlayerNotGM( Boss , 2000 ); 					--抓取Boss範圍2000的玩家，排除GM
					if #PlayerList >= 1 then
						CastSpellLV( Boss , PlayerList[ #PlayerList ] , g_Skill.FormationA.SkillID_FlashCharge , 0 );	--瞬影衝鋒
					end
				else
					if Clock % g_Skill.FormationA.CD == 0 then	g_HaveCast[ 2 ][ RoomID ] = false;	end
				end
				
			elseif g_Formation[ RoomID ] == 2 then	--碎滅陣
				while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
				CastSpellLV( Boss , Boss , g_Skill.FormationB.SkillID_Fire , 0 );	--施展：紫焰噴射
				
			elseif g_Formation[ RoomID ] == 3 then	--牽引陣
				if FN_CountBuffLevel( Boss , g_Skill.FormationC.BuffID_Charged ) >= g_Skill.FormationC.ChargedMax - 1 then	--若牽引充能疊滿10層
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CastSpellLV( Boss , Boss , g_Skill.FormationC.SkillID_Burn , g_Skill.FormationC.SkillLv_Burn[ g_Difficulty[ RoomID ] ] );	--施展：紫焰焚境
					CancelBuff( Boss , g_Skill.FormationC.BuffID_Charged );							--移除牽引充能狀態
				end
				if Clock % g_Skill.Boss2.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CastSpellLV( Boss , Boss , g_Skill.Boss2.SkillID , g_Skill.Boss2.SkillLv[ g_Difficulty[ RoomID ] ] );	--施展：紫焰灼身
				end
				
			elseif g_Formation[ RoomID ] == 4 or g_Formation[ RoomID ] == 0 then	--三角陣或無陣型
				if Clock % g_Skill.Boss2.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CastSpellLV( Boss , Boss , g_Skill.Boss2.SkillID , g_Skill.Boss2.SkillLv[ g_Difficulty[ RoomID ] ] );	--施展：紫焰灼身
				end
			
			else	Clock = 0;	--切換陣型時重製計數器時間
			end
		end
	end
end

---------------------------------播禍者 - 戰鬥劇情---------------------------------
function Z34_BOSS1_Boss_3_Fight( Boss , RoomID )
	local Clock = 0;	--秒數計數器
	while true do
		Sleep( 10 );
		if g_BossAlive[ 3 ][ RoomID ] == true then
			Clock = Clock + 1;
			if g_Formation[ RoomID ] == 1 then	--瞬影陣
				if g_HaveCast[ 3 ][ RoomID ] == false then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CallPlot( Boss , "Z34_BOSS1_Boss_ChangePos" , Boss , RoomID , 3 );				--Boss - 切換陣型點
					g_HaveCast[ 3 ][ RoomID ] = true;
					local PlayerList = LUA_YOYO_RangePlayerNotGM( Boss , 2000 ); 					--抓取Boss範圍2000的玩家，排除GM
					if #PlayerList >= 1 then
						CastSpellLV( Boss , PlayerList[ #PlayerList ] , g_Skill.FormationA.SkillID_FlashCharge , 0 );	--瞬影衝鋒
					end

				else
					if Clock % g_Skill.FormationA.CD == 0 then	g_HaveCast[ 3 ][ RoomID ] = false;	end
				end
				
			elseif g_Formation[ RoomID ] == 2 then	--碎滅陣
				if Clock % g_Skill.Boss3.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CastSpellLV( Boss , Boss , g_Skill.Boss3.SkillID , 0 );	--施展：震地擊
				end
				
			elseif g_Formation[ RoomID ] == 3 then	--牽引陣
				if g_HaveCast[ 3 ][ RoomID ] == false then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CallPlot( Boss , "Z34_BOSS1_Boss_ChangePos" , Boss , RoomID , 3 );		--Boss - 切換陣型點
					g_HaveCast[ 3 ][ RoomID ] = true;
					AddBuff( Boss , g_Skill.FormationC.BuffID_Shield , 0 , -1 );			--給予自身牽引導護的狀態
					CastSpellLV( Boss , g_Boss[ 2 ][ RoomID ] , g_Skill.FormationC.SkillID_LineShow , 0 );	--對熄望者施展：紫雷牽引 - 充能
					g_LineDmg[ 3 ][ RoomID ] = true;
					CallPlot( Boss , "Z34_BOSS1_Boss_LineDmg" , Boss , RoomID , 3 );		--Boss - 紫雷牽引傷害劇情
				else
					if Clock % g_Skill.FormationC.CD == 0 then
						g_HaveCast[ 3 ][ RoomID ] = false;
						g_LineDmg[ 3 ][ RoomID ] = false;
					end
				end

			elseif g_Formation[ RoomID ] == 4 or g_Formation[ RoomID ] == 0 then	--三角陣或無陣型
				if Clock % g_Skill.Boss3.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
					CastSpellLV( Boss , Boss , g_Skill.Boss3.SkillID , 0 );	--施展：震地擊
				end
			
			else	Clock = 0;	--切換陣型時重製計數器時間
			end
		end
	end
end

---------------------------------Boss - 切換陣型點---------------------------------
function Z34_BOSS1_Boss_ChangePos( Boss , RoomID , BossNum )
	SetPosByFlag( Boss , g_FlagID.FlagID , g_BossNowPos[ BossNum ][ RoomID ] );	--將Boss傳到陣型下一個位置
	--DebugMsg( 0 , 0 , "Boss" .. BossNum .. " Pos is " .. g_BossNowPos[ BossNum ][ RoomID ] );
	if g_BossNowPos[ BossNum ][ RoomID ] == g_RandFlagPos[ RoomID ][ 11 ] then
		g_BossNowPos[ BossNum ][ RoomID ] = g_RandFlagPos[ RoomID ][ 1 ];
	elseif g_BossNowPos[ BossNum ][ RoomID ] == g_RandFlagPos[ RoomID ][ 12 ] then
		g_BossNowPos[ BossNum ][ RoomID ] = g_RandFlagPos[ RoomID ][ 2 ];
	else
		for i = 1 , #g_RandFlagPos[ RoomID ] do
			if g_BossNowPos[ BossNum ][ RoomID ] == g_RandFlagPos[ RoomID ][ i ] then
				g_BossNowPos[ BossNum ][ RoomID ] = g_RandFlagPos[ RoomID ][ i + 2 ];
				break
			end
		end
	end	
end

---------------------------------Boss - 紫雷牽引 - 傷害劇情---------------------------------
function Z34_BOSS1_Boss_LineDmg( Boss , RoomID , BossNum )
	while g_Formation[ RoomID ] == 3 and g_LineDmg[ BossNum ][ RoomID ] == true do
		local BossPos = Vector_GetRolePos( Boss );	--取出當前Boss的座標
		local Boss2Pos = Vector_GetRolePos( g_Boss[ 2 ][ RoomID ] );	--取出熄望者的座標
		local BossDir = ReadRoleValue( Boss, EM_RoleValue_Dir ) + 90;	--取出Boss目前面向
		--檢查目標是否在指定長、寬的直線範圍內，否回傳Nil、是的話回傳目標與起點的距離 ( 起點座標、終點座標、寬度、高度、目標座標 ) 
		local BossHateList = KS_GetHateList( Boss , 4 )	--抓取仇恨清單中所有玩家，填4為排除GM
		for i = 1 , #BossHateList do
			local TargetPos = Vector_GetRolePos( BossHateList[ i ] );	--取出目標玩家的座標
			local Status = Vector_CheckShootObj( BossPos , Boss2Pos , 20 , 50 , TargetPos );
			if Status ~= nil then
				SysCastSpellLV( Boss , BossHateList[ i ] , g_Skill.FormationC.SkillID_LineDmg , g_Skill.FormationC.SkillLv_LineDmg[ g_Difficulty[ RoomID ] ] );	--對目標玩家施展：紫雷牽引 - 傷害效果
			end
		end
		Sleep( 10 );
	end
end
---------------------------------紫雷牽引 - 檢查目標是否為玩家---------------------------------
function Z34_BOSS1_Skill_CheckPlayer()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then return true	--目標為玩家
	else return false
	end
end
---------------------------------牽引導護被擊破 - 中斷施法---------------------------------
function Z34_BOSS1_MagicInterrupt()
	MagicInterrupt( OwnerID() );
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	for i = 1 , 3 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == g_Boss_GUID[ i ][ g_Difficulty[ RoomID ] ] then
			g_LineDmg[ i ][ RoomID ] = false;
		end
	end
end

---------------------------------Boss - 雷光狂襲 - 施放劇情---------------------------------
function Z34_BOSS1_Skill_Electro()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	local BossPos = Vector_GetRolePos( Boss );     --取出Boss當前的座標
	local BossDir = ReadRoleValue( Boss, EM_RoleValue_Dir );	--取出Boss目前面向
	local ElectroObj = CreateObj( g_Skill.Boss1.ObjID , BossPos.x, BossPos.y , BossPos.z , BossDir , 1 ); --在Boss位置創建雷光物件
	SetModeEx( ElectroObj , EM_SetModeType_HideName , false );		--顯示名稱(否)
	SetModeEx( ElectroObj , EM_SetModeType_NotShowHPMP , false );	--顯示血條(否)
	SetModeEx( ElectroObj , EM_SetModeType_ShowRoleHead , false );	--頭像框(否)
	SetModeEx( ElectroObj , EM_SetModeType_Mark , false );			--點選(否)
	SetModeEx( ElectroObj , EM_SetModeType_Fight , false );			--砍殺(否)
	SetModeEx( ElectroObj , EM_SetModeType_Strikback , false );		--反擊(否)
	SetModeEx( ElectroObj , EM_SetModeType_Searchenemy , false );	--索敵(否)
	SetModeEx( ElectroObj , EM_SetModeType_Move , false );			--移動(否)
	AddToPartition( ElectroObj, RoomID );
	AddBuff( ElectroObj , g_Skill.Boss1.BuffID_Show , 0 , -1 ); --掛上雷光狂襲 - 表演特效
	CallPlot( ElectroObj , "Z34_BOSS1_Skill_Electro_Dmg" , ElectroObj , RoomID );	--雷光狂襲 - 傷害擴散與刪除劇情
end
---------------------------------雷光狂襲 - 傷害擴散與刪除劇情---------------------------------
function Z34_BOSS1_Skill_Electro_Dmg( ElectroObj , RoomID )
	for i = 1 , g_Skill.Boss1.DmgCount do
		SysCastSpellLV( ElectroObj , ElectroObj , g_Skill.Boss1.SkillID_Dmg , g_Skill.Boss1.SkillLv[ g_Difficulty[ RoomID ] ] );	--施展雷光狂襲 - 傷害法術
		Sleep( g_Skill.Boss1.Interval * 10 );	--執行間隔
	end
	DelObj( ElectroObj )
end

---------------------------------Boss - 闇雷力場 - 施放劇情---------------------------------
function Z34_BOSS1_Skill_Thunder()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	local TargetPos = Vector_GetRolePos( g_Boss[ 3 ][ RoomID ] );   --取出播禍者當前的座標
	local TargetDir = ReadRoleValue( g_Boss[ 3 ][ RoomID ], EM_RoleValue_Dir );	--取出播禍者當前面向
	local ThunderObj = CreateObj( g_Skill.FormationB.ObjID_Thunder , TargetPos.x, TargetPos.y , TargetPos.z , TargetDir , 1 ); --在目標位置創建闇雷物件
	SetModeEx( ThunderObj , EM_SetModeType_HideName , false );		--顯示名稱(否)
	SetModeEx( ThunderObj , EM_SetModeType_NotShowHPMP , false );	--顯示血條(否)
	SetModeEx( ThunderObj , EM_SetModeType_ShowRoleHead , false );	--頭像框(否)
	SetModeEx( ThunderObj , EM_SetModeType_Mark , false );			--點選(否)
	SetModeEx( ThunderObj , EM_SetModeType_Fight , false );			--砍殺(否)
	SetModeEx( ThunderObj , EM_SetModeType_Strikback , false );		--反擊(否)
	SetModeEx( ThunderObj , EM_SetModeType_Searchenemy , false );	--索敵(否)
	SetModeEx( ThunderObj , EM_SetModeType_Move , false );			--移動(否)
	AddToPartition( ThunderObj, RoomID )
	AddBuff( ThunderObj , g_Skill.FormationB.BuffID_Thunder_Dmg , g_Skill.FormationB.SkillLv_Thunder[ g_Difficulty[ RoomID ] ] , -1 ) --掛上闇雷力場 - 持續製造傷害狀態
	CallPlot( ThunderObj , "Z34_BOSS1_Skill_Thunder_Del" , ThunderObj , RoomID );	--闇雷力場 - 刪除劇情
end
---------------------------------闇雷力場 - 刪除劇情---------------------------------
function Z34_BOSS1_Skill_Thunder_Del( ThunderObj , RoomID )
	Sleep( g_Skill.FormationB.Time_Thunder * 10 );
	DelObj( ThunderObj )
end

---------------------------------Boss - 紫焰噴射 - 施放劇情---------------------------------
function Z34_BOSS1_Skill_Fire()
	local Boss = OwnerID();
	local RoomID = ReadRoleValuefloat( Boss , EM_RoleValue_RoomID );
	local FireNumber = 10;	--紫焰物件的數量
	local FireRange = 50;	--紫焰物件的間距
	
	local PlayerList = LUA_YOYO_RangePlayerNotGM( Boss , 2000 ); --抓取Boss範圍2000的玩家，排除GM
	if #PlayerList >= 1 then
		AdjustFaceDir( Boss , PlayerList[ #PlayerList ] , 0 );	--使Boss面向目標
	end
	
	local BossPos = Vector_GetRolePos( Boss );     --取出Boss目前的座標
	local BossDir = ReadRoleValue( Boss, EM_RoleValue_Dir ) + 90;	--取出Boss目前面向
	local VecDir = Vector_DirToVector( BossDir );     -- 角度轉向量
	
	for i = 1 , FireNumber do
		local FirePos = BossPos + VecDir * FireRange * i;     --乘上偏移量後的座標
		local FireObj = CreateObj( g_Skill.FormationB.ObjID_Fir , FirePos.x, FirePos.y , FirePos.z , BossDir , 1 ); --在座標點創建旋風物件
		SetModeEx( FireObj , EM_SetModeType_HideName , false );		--顯示名稱(否)
		SetModeEx( FireObj , EM_SetModeType_NotShowHPMP , false );	--顯示血條(否)
		SetModeEx( FireObj , EM_SetModeType_ShowRoleHead , false );	--頭像框(否)
		SetModeEx( FireObj , EM_SetModeType_Mark , false );			--點選(否)
		SetModeEx( FireObj , EM_SetModeType_Fight , false );		--砍殺(否)
		SetModeEx( FireObj , EM_SetModeType_Strikback , false );	--反擊(否)
		SetModeEx( FireObj , EM_SetModeType_Searchenemy , false );	--索敵(否)
		SetModeEx( FireObj , EM_SetModeType_Move , false );			--移動(否)
		AddToPartition( FireObj, RoomID )
		AddBuff( FireObj , g_Skill.FormationB.BuffID_Fire_Dmg , g_Skill.FormationB.SkillLv_Fire[ g_Difficulty[ RoomID ] ] , -1 ) --掛上紫焰噴射 - 持續製造傷害狀態
		CallPlot( FireObj , "Z34_BOSS1_Skill_Fire_Del" , FireObj , RoomID );	--紫焰噴射 - 刪除劇情
	end
end
---------------------------------紫焰噴射 - 刪除劇情---------------------------------
function Z34_BOSS1_Skill_Fire_Del( FireObj , RoomID )
	Sleep( g_Skill.FormationB.Time_Fire * 10 );
	DelObj( FireObj )
end

---------------------------------Boss - 三角陣每秒判斷劇情---------------------------------
function Z34_BOSS1_Skill_Triangle( BossNum )
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	if BossNum == 1 then		--Boss為蝕光者
		if CheckDistance( Boss , g_Boss[ 2 ][ RoomID ] , 30 ) == true or CheckDistance( Boss , g_Boss[ 3 ][ RoomID ] , 30 ) == true then
			AddBuff( Boss , g_Skill.FormationD.BuffID_Hot , 0 , -1 );	--給予再生狀態
		else CancelBuff( Boss , g_Skill.FormationD.BuffID_Hot );		--移除再生狀態
		end
	elseif BossNum == 2 then	--Boss為熄望者
		if CheckDistance( Boss , g_Boss[ 1 ][ RoomID ] , 30 ) == true or CheckDistance( Boss , g_Boss[ 3 ][ RoomID ] , 30 ) == true then
			SysCastSpellLV( Boss , Boss , g_Skill.FormationD.SkillID_Fire , g_Skill.FormationD.SkillLv[ g_Difficulty[ RoomID ] ] );	--施展紫焰迴旋
		end
	else	--Boss為播禍者
		if CheckDistance( Boss , g_Boss[ 1 ][ RoomID ] , 30 ) == true or CheckDistance( Boss , g_Boss[ 2 ][ RoomID ] , 30 ) == true then
			AddBuff( Boss , g_Skill.FormationD.BuffID_Invincible , 0 , -1 );	--給予無敵狀態
		else CancelBuff( Boss , g_Skill.FormationD.BuffID_Invincible );			--移除無敵狀態
		end
	end
end

---------------------------------測試指令 - 手動清場---------------------------------
function Z34_BOSS1_Test_Clear()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID );
	CallPlot( Owner , "Z34_BOSS1_CtrlCenter_Clear" , Owner , RoomID );	--中控器 - 清場劇情
	local DoorList = LUA_YOYO_GetSpecificNPC( RoomID , g_Door_GUID ) --取出場上所有的阻擋門物件
	for i = 1 , #DoorList do
		DelObj( DoorList[ i ] ) --清除阻擋門
	end
end
---------------------------------測試指令 - 檢視死亡旗標---------------------------------
function Z34_BOSS1_Test_ReadBossAlive()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID );
	for i = 1 , 3 do
		if g_BossAlive[ i ][ RoomID ] == true then
			Say( Owner , "Boss " .. i .. " Alive = true" );
		else
			Say( Owner , "Boss " .. i .. " Alive = false" );
		end
	end

end