------------------------------------------------------------------
-- Z34副本
-- Boss 2
--塔蘇克之觸
------------------------------------------------------------------

---------------------------------全域變數設定---------------------------------
--NPC
local g_Boss_GUID = { 106193 , 109227 , 109155 };	--Boss塔蘇克之觸
local g_Door_GUID = 106249	--阻擋門物件編號

local g_Skill = {}; 
g_Skill.Base = {};	--Boss基礎法術
g_Skill.Base.ID_A = 492395;	--心靈穿刺
g_Skill.Base.ID_B = 492648;	--心靈波動
g_Skill.Base.Range = 150;	--判斷距離
g_Skill.Base.CD = 4;		--冷卻

g_Skill.Pace = {};	--厄運步伐
g_Skill.Pace.BuffID = 503558;	--厄運步伐 - 狀態
g_Skill.Pace.SkillID = 492656;	--厄運步伐 - 傷害法術
g_Skill.Pace.Time = 10;			--厄運步伐 - 效果持續時間
g_Skill.Pace.CD = 30;			--厄運步伐 - 冷卻
g_Skill.Pace.ObjID = 101510;	--厄運步伐 - 透明球物件

g_Skill.Bomb = {};	--離間炸彈
g_Skill.Bomb.SkillID = 505953;	--離間炸彈 - 狀態
g_Skill.Bomb.CD = 20;			--離間炸彈 - 冷卻

g_Skill.change = {}	--犧牲轉換
g_Skill.change.BuffID_O = 501891;		--犧牲轉換 - 狀態 - 掛在玩家身上
g_Skill.change.BuffID_T = 504568;		--犧牲轉換 - 狀態 - 掛在Boss身上
g_Skill.change.SkillID = 492651;	--犧牲轉換 - 傷害法術
g_Skill.change.CD = 45;				--犧牲轉換 - 冷卻

g_Skill.Color = {}--致命猜疑
g_Skill.Color.SkillID = { 491860 , 491861 , 491862 , 491863 , 491864 };	--致命猜疑 - 法術
g_Skill.Color.BuffID = { 509397 , 509398 , 509399 , 509400 , 509401 };	--致命猜疑 - 特效
g_Skill.Color.ObjID = 100217;											--致命猜疑 - 透明球物件
g_Skill.Color.HP = { 75 , 50 , 25 };									--致命猜疑 - 施展HP條件

--狂暴
local g_FrenzyBuff = 503281;					--狂暴狀態
local g_FrenzyTime = { 480 , 360 , 9999999 };	--狂暴時間

--顯像旗子
local g_FlagID = {};
g_FlagID.FlagID = 781424;	--Z34_2王用旗標
g_FlagID.Boss = 0;			--Boss產生點
g_FlagID.BeforeDoor = 1;	--前門產生點
g_FlagID.AfterDoor = 2;		--後門產生點
g_FlagID.Color = { 11 , 12 , 13 , 14 , 15 };	--致命猜疑產生點

--紀錄用參數
local g_Boss = {};			--紀錄Boss物件編號
local g_FightSwitch = {};	--戰鬥開關判斷
local g_Difficulty = {};	--紀錄副本難度
local g_Color = {};			--紀錄致命猜疑當前選擇的顏色
local g_ColorObj = {};		--紀錄場上致命猜疑的物件
local g_Rebirth = {};		--紀錄Boss是否已重生過
local g_ChangeTarget = {};	--紀錄犧牲轉換的目標
local g_PaceObj = {};		--紀錄厄運步伐的物件

--廣播訊息
local g_BossTalk = {};
g_BossTalk[ "FifhtBegin" ]	= "[LUA_106193_AI_FIGHTBEGIN]";				--戰鬥開始
g_BossTalk[ "BossWin" ]		= "[LUA_106193_AI_BOSSWIN]";				--戰鬥結束
g_BossTalk[ "BossDie" ]		= "[LUA_106193_AI_BOSSDEAD]";				--Boss死亡
g_BossTalk[ "BossFrenzy" ]	= "[LUA_106193_AI_BOSSFRENZY]";				--Boss狂暴
g_BossTalk[ "PaseCast" ]	= "[LUA_106193_AI_PACE_CAST][$SETVAR1=";	--施展厄運步伐
g_BossTalk[ "PaseDead" ]	= "[LUA_106193_AI_PACE_DEAD][$SETVAR1=";	--厄運步伐造成玩家死亡
g_BossTalk[ "BombCast" ]	= "[LUA_106193_AI_BOMB_CAST][$SETVAR1=";	--施展離間炸彈
g_BossTalk[ "BombDead" ]	= "[LUA_106193_AI_BOMB_DEAD][$SETVAR1=";	--離間炸彈造成玩家死亡
g_BossTalk[ "ChangeCast" ]	= "[LUA_106193_AI_CHANGE_CAST][$SETVAR1=";	--施展犧牲轉換
g_BossTalk[ "ChangeDead" ]	= "[LUA_106193_AI_CHANGE_DEAD][$SETVAR1=";	--犧牲轉換造成玩家死亡
g_BossTalk[ "ColorCast" ]	= "[LUA_106193_AI_COLOR_CAST][$SETVAR1=";	--施展致命猜疑_前段
g_BossTalk[ "Color" ]		= {};
g_BossTalk[ "Color" ][ 1 ]	= "[LUA_106193_AI_COLOR_RED]";				--致命猜疑顏色選項_紅色
g_BossTalk[ "Color" ][ 2 ]	= "[LUA_106193_AI_COLOR_GREEN]";			--致命猜疑顏色選項_綠色
g_BossTalk[ "Color" ][ 3 ]	= "[LUA_106193_AI_COLOR_BLUE]";				--致命猜疑顏色選項_藍色
g_BossTalk[ "Color" ][ 4 ]	= "[LUA_106193_AI_COLOR_BLACK]";			--致命猜疑顏色選項_黑色
g_BossTalk[ "Color" ][ 5 ]	= "[LUA_106193_AI_COLOR_YELLOW]";			--致命猜疑顏色選項_黃色
g_BossTalk[ "ColorDead" ]	= "[LUA_106193_AI_COLOR_DEAD]";				--致命猜疑造成玩家死亡
g_BossTalk[ "BossRebirth" ]	= "[LUA_106193_AI_PLAY_REBIRTH]";			--施展死之詭詐
g_BossTalk[ "SetVer2" ]		= "][$SETVAR2=";							--有2個替代變數時使用的字串

---------------------------------中控器 - 產王與階段處理---------------------------------
function Z34_BOSS2_CtrlCenter_Begin()	--初始劇情
	local CtrlCenter = OwnerID();	--中控器
	local RoomID = ReadRoleValue( CtrlCenter , EM_RoleValue_RoomID );
	CallPlot( CtrlCenter , "Z34_BOSS2_CtrlCenter_Stage" , CtrlCenter , RoomID );	--中控器 - 產王與階段處理
end
function Z34_BOSS2_CtrlCenter_Stage( CtrlCenter , RoomID )
	--難度判斷
	local ZoneID = ReadRoleValue( CtrlCenter , EM_RoleValue_ZoneID );
	if ZoneID == 180 then
		g_Difficulty[ RoomID ] = 3;	--簡單
	elseif ZoneID == 179 then
		g_Difficulty[ RoomID ] = 2;	--普通
	else
		g_Difficulty[ RoomID ] = 1;	--困難
	end	

	local Boss;			--Boss
	local BeforeDoor;	--前門
	local AfterDoor;	--後門
	
	g_FightSwitch[ RoomID ] = false;	--戰鬥開關判斷先設為false
	
	--生成Boss
	Boss = CreateObjByFlag( g_Boss_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Boss , 1 );
	SetModeEx( Boss , EM_SetModeType_Mark , true );			--點選(是)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); --頭像框(是)
	SetModeEx( Boss , EM_SetModeType_Fight , true );		--砍殺(是)
	SetModeEx( Boss , EM_SetModeType_Strikback , true );	--反擊(是)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true );	--索敵(是)
	SetModeEx( Boss , EM_SetModeType_Move , true ); 		--移動(是)
	AddToPartition( Boss , RoomID );
	g_Boss[ RoomID ] = Boss;		--將Boss編號寫回全域變數中
	g_Rebirth[ RoomID ] = false;	--重置Boss的重生紀錄
	SetPlot( Boss , "dead" , "Z34_BOSS2_Boss_Dead" , 0 );	--Boss - 死亡重生判斷劇情
	if Zone ~= 941 then	Hao_antiHacker_Init( 2 );	end	--防駭客新制，掛在物件產生劇情，後面填入Boss順序
	
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
		if HateListCount( Boss ) ~= 0 then	--仇恨表有人
			if g_FightSwitch[ RoomID ] == false then	--戰鬥開關未開
				g_FightSwitch[ RoomID ] = true;			--將戰鬥開關打開
				CallPlot( Boss , "Z34_BOSS2_Boss_Fight" , Boss , RoomID );	--Boss - 戰鬥劇情
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "FifhtBegin" ] , 2 );	--廣播Boss開戰
				if Zone ~= 941 then	Hao_antiHacker_Fight( 2 , Boss );	end --防駭客新制，掛在戰鬥劇情，後面填入Boss順序、Boss物件編號
				--生成前門
				BeforeDoor = CreateObjByFlag( g_Door_GUID , g_FlagID , g_FlagNum_Door , 1 )
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
	
		if HateListCount( Boss ) == 0 and g_FightSwitch[ RoomID ] == true then	--仇恨表沒人，戰鬥開關已開
			if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0 then	--BOSS還存活
				g_FightSwitch[ RoomID ] = false;	--將戰鬥開關關閉
				DelObj( Boss );			--刪除BOSS
				Delobj( BeforeDoor );	--刪除前門
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossWin" ] , 2 );	--廣播Boss勝利
				CallPlot( CtrlCenter , "Z34_BOSS2_CtrlCenter_Clear" , CtrlCenter , RoomID );	--中控器 - 清場劇情
				sleep( 50 );
				
				--重置Boss
				Boss = CreateObjByFlag( g_Boss_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Boss , 1 );
				SetModeEx( Boss , EM_SetModeType_Mark , true );			--點選(是)
				SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); --頭像框(是)
				SetModeEx( Boss , EM_SetModeType_Fight , true );		--砍殺(是)
				SetModeEx( Boss , EM_SetModeType_Strikback , true );	--反擊(是)
				SetModeEx( Boss , EM_SetModeType_Searchenemy , true );	--索敵(是)
				SetModeEx( Boss , EM_SetModeType_Move , true ); 		--移動(是)
				AddToPartition( Boss , RoomID );
				g_Boss[ RoomID ] = Boss;	--將Boss編號寫回全域變數中
				g_Rebirth[ RoomID ] = false;	--重置Boss的重生紀錄
				SetPlot( Boss , "dead" , "Z34_BOSS2_Boss_Dead" , 0 );	--Boss - 死亡重生判斷劇情
				if Zone ~= 941 then	Hao_antiHacker_Init( 2 );	end	--防駭客新制，掛在物件產生劇情，後面填入Boss順序
			end
		end			
			
		if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 and g_Rebirth[ RoomID ] == true then	--BOSS已死亡，並且已重生過
			g_FightSwitch[ RoomID ] = false;	--將戰鬥開關關閉
			DelObj( BeforeDoor );	--刪除前門
			Delobj( AfterDoor );	--刪除後門
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossDie" ] , 2 );	--廣播Boss死亡
			CallPlot( CtrlCenter , "Z34_BOSS2_CtrlCenter_Clear" , CtrlCenter , RoomID );	--中控器 - 清場劇情
			if Zone ~= 941 then	Hao_antiHacker_Dead( 2 );	end	--防駭客新制，掛在死亡劇情，填入Boss順序
			sleep( 50 );
			return	--結束此函式
		end
	end
end

---------------------------------Boss - 戰鬥劇情---------------------------------
function Z34_BOSS2_Boss_Fight( Boss , RoomID )
	local Clock = 0;	--計時器
	local FrenzyRecord = false;		--狂暴施展過的紀錄
	local ColorRecord = { false , false , false };	--致命猜疑施展過的紀錄
	local ColorScratch = 0;	--暫存顏色，廣播訊息用
	g_Color[ RoomID ] = 0;	--顏色先設為0
	
	while true do
		Sleep( 10 );	--每1秒跑一次
		Clock = Clock + 1;
		
		local NowTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID );
		local HateList = KS_GetHateList( Boss , 1 );	--取得Boss仇恨清單內的玩家，依仇恨高低排序
		
		--HP判斷相關
		for i = 1 , #ColorRecord do
			if Lua_PercentHP( Boss ) <= g_Skill.Color.HP[ i ] then
				ColorRecord[ i ] = true;
				g_Color[ RoomID ] = RandRange( 1 , 5 );	--隨機顏色5選1
				while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
				CastSpellLV( Boss , Boss , g_Skill.Color.SkillID[ i ] , 0 );	--施展致命猜疑
				CallPlot( Boss , "Z34_BOSS2_Color_Cast" , Boss , RoomID );		--Boss - 致命猜疑 - 法術施展劇情
				ColorScratch = RandRange( 1 , 5 );	--隨機顏色5選1 - 暫存顏色
				while g_Color[ RoomID ] == ColorScratch do	ColorScratch = RandRange( 1 , 5 );	end	--如果兩個顏色相同就重骰暫存顏色
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "ColorCast" ] .. g_BossTalk[ "Color" ][ g_Color[ RoomID ] ] .. g_BossTalk[ "SetVer2" ] .. g_BossTalk[ "Color" ][ ColorScratch ] .. "]" , 2 );	--廣播Boss施展：致命猜疑
			end
		end

		--秒數判斷相關
		if Clock % g_FrenzyTime[ g_Difficulty[ RoomID ] ] == 0 and FrenzyRecord == false then	--狂暴秒數與條件判斷
			AddBuff( Boss , g_FrenzyBuff , 0 , -1 );	--給予自身Buff：狂暴
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossFrenzy" ] , 2 );	--廣播Boss狂暴
			FrenzyRecord = true;	--紀錄已狂暴

		elseif Clock % g_Skill.change.CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
			local RandTarget = HateList[ RandRange( 1 , #HateList ) ];	--從仇恨表中隨機挑一人
			g_ChangeTarget[ RoomID ] = RandTarget;	--紀錄至全域變數
			AddBuff( Boss , g_Skill.change.BuffID_O , 0 , -1 );			--給予自身狀態：犧牲轉換
			AddBuff( RandTarget , g_Skill.change.BuffID_T , 0 , -1 );	--給予目標狀態：犧牲轉換
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "ChangeCast" ] .. Getname( HateList[ RandNum ] ) .. "]" , 2 );	--廣播Boss施展：犧牲轉換
		
		elseif Clock % g_Skill.Pace.CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
			local RandTarget;
			if #HateList > 1 then	RandTarget = HateList[ RandRange( 2 , #HateList ) ];	--從仇恨表中隨機選一人，排除最高仇恨
			else					RandTarget = HateList[ 1 ];								--仇恨表只有一人時，才選最高仇恨者
			end
			AddBuff( RandTarget , g_Skill.Pace.BuffID , 0 , -1 );	--給予目標狀態：厄運步伐
			CallPlot( RandTarget , "Z34_BOSS2_Pase_Run" , RandTarget , RoomID );	--目標 - 厄運步伐 - 效果執行劇情
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "PaseCast" ] .. Getname( RandTarget ) .. "]" , 2 );	--廣播Boss施展：厄運步伐
		
		elseif Clock % g_Skill.Bomb.CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
			local RandTarget;
			if #HateList > 1 then	RandTarget = HateList[ RandRange( 2 , #HateList ) ];	--從仇恨表中隨機選一人，排除最高仇恨
			else					RandTarget = HateList[ 1 ];								--仇恨表只有一人時，才選最高仇恨者
			end
			AddBuff( RandTarget , g_Skill.Bomb.BuffID , 0 , -1 );	--給予目標狀態：離間炸彈
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BombCast" ] .. Getname( RandTarget ) .. "]" , 2 );	--廣播Boss施展：離間炸彈
		
		elseif Clock % g_Skill.Base.CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
			if CheckDistance( Boss , NowTarget , g_Skill.Base.Range ) == true then	--判斷當前目標距離是否符合
				CastSpellLV( Boss , NowTarget , g_Skill.Base.ID_A , 0 );	--施展：心靈穿刺
			else
				CastSpellLV( Boss , NowTarget , g_Skill.Base.ID_B , 0 );	--施展：心靈波動
			end
		end
	end
end

---------------------------------Player - 厄運步伐 - 效果執行劇情---------------------------------
function Z34_BOSS2_Pase_Run( Target , RoomID )
	for i = 1 , g_Skill.Pace.Time do
		local TargetPos = Vector_GetRolePos( Target );					--取出當前座標
		local TargetDir = ReadRoleValue( Target , EM_RoleValue_Dir );	--取出當前面向
		if g_PaceObj[ RoomID ] == 0 then
			g_PaceObj[ RoomID ] = CreateObj( g_Skill.Pace.ObjID , TargetPos.x, TargetPos.y , TargetPos.z , TargetDir , 1 ); --在當前位置創建厄運步伐物件
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_HideName , false );		--顯示名稱(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_NotShowHPMP , false );	--顯示血條(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_ShowRoleHead , false );	--頭像框(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Mark , false );			--點選(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Fight , false );		--砍殺(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Strikback , false );	--反擊(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Searchenemy , false );	--索敵(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Move , false );			--移動(否)
			AddToPartition( g_PaceObj[ RoomID ] , RoomID );
		else
			if GetDistance( Target , g_PaceObj[ RoomID ] ) > 1 then
				CastSpellLV( Target , Target , g_Skill.Pace.SkillID , 0 );	--施展：厄運步伐 - 傷害法術
			end
			DelObj( g_PaceObj[ RoomID ] );	--移除上次的厄運步伐物件
			g_PaceObj[ RoomID ] = CreateObj( g_Skill.Pace.ObjID , TargetPos.x, TargetPos.y , TargetPos.z , TargetDir , 1 ); --在當前位置創建新的厄運步伐物件
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_HideName , false );		--顯示名稱(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_NotShowHPMP , false );	--顯示血條(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_ShowRoleHead , false );	--頭像框(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Mark , false );			--點選(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Fight , false );		--砍殺(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Strikback , false );	--反擊(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Searchenemy , false );	--索敵(否)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Move , false );			--移動(否)
			AddToPartition( g_PaceObj[ RoomID ] , RoomID );
		end
		Sleep( 10 );
	end
	DelObj( g_PaceObj[ RoomID ] );	--結束移除厄運步伐物件
	g_PaceObj[ RoomID ] = 0;	--結束後將全域變數歸零
end
---------------------------------Player - 厄運步伐 - 傷害檢查劇情---------------------------------
function Z34_BOSS2_Pase_Check()
	if OwnerID() == TargetID() then return false	--不會傷害自己
	else return true
	end
end
---------------------------------Player - 厄運步伐 - 傷害結束劇情---------------------------------
function Z34_BOSS2_Pase_End()
	local Player = OwnerID();
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID );
	if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 then	--該目標玩家已死亡
		ScriptMessage( g_Boss[ RoomID ] , -1 , 2 , g_BossTalk[ "PaseDead" ] .. Getname( Player ) .. "]" , 2 );	--廣播厄運步伐造成玩家死亡訊息
	end
end

---------------------------------Boss - 離間炸彈 - 傷害檢查劇情---------------------------------
function Z34_BOSS2_Bomb_Check()
	if OwnerID() == TargetID() then return false	--不會傷害自己
	else return true
	end
end
---------------------------------Boss - 離間炸彈 - 傷害結束劇情---------------------------------
function Z34_BOSS2_Bomb_End()
	local Player = OwnerID();
	local Target = TargetID();
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID );
	if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 then	--該目標玩家已死亡
		ScriptMessage( g_Boss[ RoomID ] , -1 , 2 , g_BossTalk[ "BombDead" ] .. Getname( Player ) .. g_BossTalk[ "SetVer2" ] .. Getname( Target ) .. "]" , 2 );	--廣播離間炸彈造成玩家死亡訊息
	end
end

---------------------------------Boss - 犧牲轉換 - 傷害轉換劇情---------------------------------
function Z34_BOSS2_change_Run()
	local Boss = OwnerID();
	local Target = TargetID();
	local LastDamage = math.abs( ReadRoleValue( Boss, EM_RoleValue_LastDHp ) );			--抓最後的傷害，取絕對值
	local LastAttackOwner = ReadRoleValue( Boss, EM_RoleValue_LastAttackOwnerID );		--抓最後一次攻擊者(全域) 
	SysCastSpellLv( LastAttackOwner , g_ChangeTarget[ RoomID ] , g_Skill.change.SkillID , LastDamage );
end
---------------------------------Boss - 犧牲轉換 - 傷害結束劇情---------------------------------
function Z34_BOSS2_change_End()
	local Target = TargetID();
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID );
	if ReadRoleValue( Target , EM_RoleValue_IsDead ) == 1 then	--該目標玩家已死亡
		ScriptMessage( g_Boss[ RoomID ] , -1 , 2 , g_BossTalk[ "ChangeDead" ] .. Getname( Target ) .. "]" , 2 );	--廣播犧牲轉換造成玩家死亡訊息
	end
end

---------------------------------Boss - 致命猜疑 - 法術施展劇情---------------------------------
function Z34_BOSS2_Color_Cast( Boss , RoomID )
	local RandColorFlag = g_FlagID.Color;	--準備拿來洗牌的旗標位置
	for i = 1 , 99 do --洗牌，隨機清單中的順序99次
		local j = RandRange( 1 , #RandColorFlag );
		local k = RandRange( 1 , #RandColorFlag );
		local temp = RandColorFlag[ k ];
		RandColorFlag[ k ] = RandColorFlag[ j ];
		RandColorFlag[ j ] = temp;
	end
	
	g_ColorObj[ Room ] = {};
	for i = 1 , #RandColorFlag do
		g_ColorObj[ Room ][ i ] = CreateObjByFlag( g_Skill.Color.ObjID , g_FlagID.FlagID , RandColorFlag[ i ] , 1 );	--產生致命猜疑物件
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_HideName , false );		--顯示名稱(否)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_NotShowHPMP , false );	--顯示血條(否)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_ShowRoleHead , false );	--頭像框(否)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Mark , false );			--點選(否)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Fight , false );		--砍殺(否)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Strikback , false );	--反擊(否)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Searchenemy , false );	--索敵(否)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Move , false );			--移動(否)
		AddToPartition( g_ColorObj[ Room ][ i ] , RoomID );
		AddBuff( g_ColorObj[ Room ][ i ] , g_Skill.Color.BuffID[ i ] , 0 , -1 );	--掛上顯示特效
	end
end

local g_Color = {};			--紀錄致命猜疑當前選擇的顏色

---------------------------------Boss - 致命猜疑 - 傷害檢查劇情---------------------------------
function Z34_BOSS2_Color_Check()
	local Target = TargetID();
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID );
	if CheckDistance( Target , g_ColorObj[ Room ][ g_Color[ RoomID ] ] , 100 ) == true then	return false
	else	return true
	end
end

---------------------------------Boss - 致命猜疑 - 傷害結束劇情---------------------------------
function Z34_BOSS2_Color_End()
	local Target = TargetID();
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID );
	if ReadRoleValue( Target , EM_RoleValue_IsDead ) == 1 then	--該目標玩家已死亡
		ScriptMessage( g_Boss[ RoomID ] , -1 , 2 , g_BossTalk[ "ColorDead" ] , 2 );	--廣播致命猜疑造成玩家死亡訊息
	end
end

---------------------------------Boss - 死亡重生判斷劇情---------------------------------
function Z34_BOSS2_Boss_Dead()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	if g_Rebirth[ RoomID ] == false then
		g_Rebirth[ RoomID ] = true;
		MagicInterrupt( Boss );	--中斷法術唱咒
		PlayMotionEX( Boss, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP );	--播放死亡動作
		SetModeEx( Boss , EM_SetModeType_Mark , false );		--點選(否)
		SetModeEx( Boss , EM_SetModeType_ShowRoleHead , false ); --頭像框(否)
		SetModeEx( Boss , EM_SetModeType_Fight , false );		--砍殺(否)
		SetModeEx( Boss , EM_SetModeType_Strikback , false );	--反擊(否)
		SetModeEx( Boss , EM_SetModeType_Searchenemy , false );	--索敵(否)
		SetModeEx( Boss , EM_SetModeType_Move , false );		--移動(否)
		ClearHateList( Boss , -1 );	--清空仇恨
		CallPlot( Boss , "Z34_BOSS2_Boss_Rebirth" , Boss , RoomID );	--Boss - 重生劇情
		return false
	end
end
---------------------------------Boss - 重生劇情---------------------------------
function Z34_BOSS2_Boss_Rebirth( Boss , RoomID )
	Sleep( 30 );
	PlayMotion( Boss, ruFUSION_ACTORSTATE_ACTIVATE_END );	--播放復活動作
	WriteRoleValue( Boss , EM_RoleValue_HP , ReadRoleValue( Boss , EM_RoleValue_MaxHP ) / 2 );	--回滿一半HP
	SetModeEx( Boss , EM_SetModeType_Mark , true );			--點選(是)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); --頭像框(是)
	SetModeEx( Boss , EM_SetModeType_Fight , true );		--砍殺(是)
	SetModeEx( Boss , EM_SetModeType_Strikback , true );	--反擊(是)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true );	--索敵(是)
	SetModeEx( Boss , EM_SetModeType_Move , true );			--移動(是)
	g_Skill.Color.HP[ 3 ] = false;							--將致命猜疑25%的施展HP條件設為未施展
	ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossRebirth" ] , 2 );	--廣播Boss重生訊息
end

---------------------------------中控器 - 清場劇情---------------------------------
function Z34_BOSS2_CtrlCenter_Clear( CtrlCenter , RoomID )
	
end


---------------------------------測試指令 - 手動清場---------------------------------
function Z34_BOSS2_Test_Clear()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID );
	CallPlot( Owner , "Z34_BOSS2_CtrlCenter_Clear" , Owner , RoomID );	--中控器 - 清場劇情
	local DoorList = LUA_YOYO_GetSpecificNPC( RoomID , g_Door_GUID ) --取出場上所有的阻擋門物件
	for i = 1 , #DoorList do
		DelObj( DoorList[ i ] ) --清除阻擋門
	end
end