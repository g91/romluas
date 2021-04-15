------------------------------------------------------------------
-- Z34副本
-- Boss 5
--「撕裂者」馬爾文
------------------------------------------------------------------

---------------------------------全域變數設定---------------------------------
--NPC
local g_Door_GUID = 106249	--阻擋門物件編號
local g_Boss_GUID = { 106210 , 109996 , 107356 };	--Boss馬爾文
local g_MobA_GUID = { 106268 , 106286 , 107813 };	--追擊吞噬者
local g_MobB_GUID = { 106269 , 106287 , 107814 };	--腐化吞噬者
local g_MobC_GUID = { 106270 , 106288 , 107844 };	--貪婪吞噬者

--法術集合
local g_Skill_Usually_A_ID = 491582;		--撕裂之爪
local g_Skill_Usually_B_ID = 491583;		--忘卻沼泥
local g_Skill_Usually_B_Lv = { 2 , 1 , 0 };	--忘卻沼泥 - 法術等級
local g_Skill_Usually_CD = 3;

local g_Skill_DarkFear_ID = 491580;		--黑獄恐懼
local g_Skill_DarkFear_CD = 15;

local g_Skill_BigSkill_A_ID = 491584;			--忘卻異能
local g_Skill_BigSkill_A_Lv = { 2 , 1 , 0 };	--忘卻異能 - 法術等級
local g_Skill_BigSkill_B_ID = 491585;			--馬爾文能量
local g_Skill_BigSkill_C_ID = 500769;			--吸收吞噬者
local g_Skill_BigSkill_CD = 30;

local g_skill_Vampire_ID = 491656;			--汲取生命
local g_skill_Vampire_Casting_ID = 491657	--汲取生命施法表演

local g_Skill_Swallow_ID = 491634;			--吞食．分裂
local g_Skill_Swallow_Lv = { 2 , 1 , 0 };	--吞食．分裂 - 法術等級

--基本法術
local g_Buff_Vampire_A_ID = 502004;		--汲取生命
local g_Buff_Vampire_B_ID = 502119;		--暈眩
local g_Buff_Vampire_HP_1 = 60;			--汲取生命施展HP條件1
local g_Buff_Vampire_HP_2 = 30;			--汲取生命施展HP條件2

local g_Buff_MobFollow_ID_A = 500374;	--目標鎖定
local g_Buff_MobFollow_ID_B = 502913;	--追擊信標

local g_Buff_Spread_ID = 623035;		--腐化擴散

--顯像旗子
local g_FlagID = 781427;	--Z34_5王用旗標
local g_FlagNum_Boss = 0;	--Boss產生點
local g_FlagNum_Door = 1;	--阻擋門產生點
local g_FlagNum_Mob_1 = 2;	--小怪出生點1
local g_FlagNum_Mob_2 = 3;	--小怪出生點2

--狂暴
local g_FrenzyBuff = 503281;	--狂暴Buff
local g_FrenzyTime = { 480 , 360 , 9999999 };		--狂暴時間

--紀錄用參數
local g_FightSwitch = {};	--戰鬥開關判斷
local g_Difficulty = {};	--紀錄副本難度
local g_Boss = {};			--紀錄Boss物件編號
local g_VampireTarget = {};	--紀錄汲取生命時目標的編號
local g_Mob = {};			--紀錄召喚小怪的物件編號
g_Mob[ g_FlagNum_Mob_1 ] = {};
g_Mob[ g_FlagNum_Mob_2 ] = {};

--廣播訊息
local g_BossTalk = {};
g_BossTalk[ "FifhtBegin" ]	= "[LUA_106210_AI_FIGHTBEGIN]";	--戰鬥開始
g_BossTalk[ "BossWin" ]		= "[LUA_106210_AI_BOSSWIN]";	--戰鬥結束
g_BossTalk[ "BossDie" ]		= "[LUA_106210_AI_BOSSDEAD]";	--Boss死亡
g_BossTalk[ "BossFrenzy" ]	= "[LUA_106210_AI_BOSSFRENZY]";	--Boss狂暴
g_BossTalk[ "BossVampire" ]	= "[LUA_106210_AI_VAMPIRE]";	--Boss施展汲取生命
g_BossTalk[ "Interrupt" ]	= "[LUA_106210_AI_INTERRUPT]";	--Boss馬爾文能量被中斷
g_BossTalk[ "CallMobA" ]	= "[LUA_106210_AI_CALLMOBA]";	--Boss召喚追擊吞噬者
g_BossTalk[ "CallMobB" ]	= "[LUA_106210_AI_CALLMOBB]";	--Boss召喚腐化吞噬者
g_BossTalk[ "MobMerge" ]	= "[LUA_106210_AI_MOBMERGE]";	--吞噬者合併為貪婪吞噬者
g_BossTalk[ "MobCSplit" ]	= "[LUA_106210_AI_MOBCSPLIT][$SETVAR1=";	--貪婪吞噬者吃人後分裂

---------------------------------中控器 - 產王與階段處理---------------------------------
function Z34_BOSS5_CtrlCenter_Begin()	--初始劇情
	local CtrlCenter = OwnerID();	--中控器
	local RoomID = ReadRoleValue( CtrlCenter , EM_RoleValue_RoomID );
	CallPlot( CtrlCenter , "Z34_BOSS5_CtrlCenter_Stage" , CtrlCenter , RoomID );	--中控器 - 產王與階段處理
end
function Z34_BOSS5_CtrlCenter_Stage( CtrlCenter , RoomID )
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
	local WingEffect = {};
	
	g_FightSwitch[ RoomID ] = false;	--戰鬥開關判斷先設為false
	
	--生成Boss
	Boss = CreateObjByFlag( g_Boss_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID , g_FlagNum_Boss , 1 );
	SetModeEx( Boss , EM_SetModeType_Mark , true );				--點選(是)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); 	--頭像框(是)
	SetModeEx( Boss , EM_SetModeType_Fight , true );			--砍殺(是)
	SetModeEx( Boss , EM_SetModeType_Strikback , true );		--反擊(是)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true );		--索敵(是)
	SetModeEx( Boss , EM_SetModeType_Move , true ); 			--移動(是)
	AddToPartition( Boss , RoomID );
	CallPlot( Boss , "Z34_BOSS5_Boss_Init" , Boss , RoomID );	--Boss - 起始翅膀特效加掛劇情
	g_Boss[ RoomID ] = Boss;	--將Boss編號寫回全域變數中
	if Zone ~= 941 then	Hao_antiHacker_Init( 5 );	end	--防駭客新制，掛在物件產生劇情，後面填入Boss順序
	
	while true do
	Sleep( 10 );
		if HateListCount( Boss ) ~= 0 then	--仇恨表有人
			if g_FightSwitch[ RoomID ] == false then	--戰鬥開關未開
				g_FightSwitch[ RoomID ] = true;			--將戰鬥開關打開
				CallPlot( Boss , "Z34_BOSS5_Boss_Fight" , Boss , RoomID );	--Boss - 戰鬥劇情
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "FifhtBegin" ] , 2 );	--廣播Boss開戰
				if Zone ~= 941 then	Hao_antiHacker_Fight( 5 , Boss );	end --防駭客新制，掛在戰鬥劇情，後面填入Boss順序、Boss物件編號
				--生成阻擋門
				Door = CreateObjByFlag( g_Door_GUID , g_FlagID , g_FlagNum_Door , 1 )
				SetModeEx( Door , EM_SetModeType_HideName , false );		--顯示名稱(否)
				SetModeEx( Door , EM_SetModeType_NotShowHPMP , false );		--顯示血條(否)
				SetModeEx( Door , EM_SetModeType_ShowRoleHead , false );	--頭像框(否)
				SetModeEx( Door , EM_SetModeType_Mark , false );			--點選(否)
				SetModeEx( Door , EM_SetModeType_Fight , false );			--砍殺(否)
				SetModeEx( Door , EM_SetModeType_Strikback , false );		--反擊(否)
				SetModeEx( Door , EM_SetModeType_Searchenemy , false );		--索敵(否)
				SetModeEx( Door , EM_SetModeType_Move , false );			--移動(否)
				SetModeEx( Door , EM_SetModeType_Obstruct , true );			--阻擋(是)
				AddToPartition( Door , RoomID );
			end
		end
	
		if HateListCount( Boss ) == 0 and g_FightSwitch[ RoomID ] == true then	--仇恨表沒人，戰鬥開關已開
			if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0 then	--BOSS還存活
				g_FightSwitch[ RoomID ] = false;	--將戰鬥開關關閉
				DelObj( Boss );	--刪除BOSS
				Delobj( Door );	--刪除阻擋門
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossWin" ] , 2 );	--廣播Boss勝利
				CallPlot( CtrlCenter , "Z34_BOSS5_CtrlCenter_Clear" , CtrlCenter , RoomID );	--中控器 - 清場劇情
				sleep( 50 );
				
				--重置Boss
				Boss = CreateObjByFlag( g_Boss_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID , g_FlagNum_Boss , 1 );
				SetModeEx( Boss , EM_SetModeType_Mark , true );				--點選(是)
				SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); 	--頭像框(是)
				SetModeEx( Boss , EM_SetModeType_Fight , true );			--砍殺(是)
				SetModeEx( Boss , EM_SetModeType_Strikback , true );		--反擊(是)
				SetModeEx( Boss , EM_SetModeType_Searchenemy , true );		--索敵(是)
				SetModeEx( Boss , EM_SetModeType_Move , true ); 			--移動(是)
				AddToPartition( Boss , RoomID );
				CallPlot( Boss , "Z34_BOSS5_Boss_Init" , Boss , RoomID );	--Boss - 起始翅膀特效加掛劇情
				g_Boss[ RoomID ] = Boss;	--將Boss編號寫回全域變數中
				if Zone ~= 941 then	Hao_antiHacker_Init( 5 );	end	--防駭客新制，掛在物件產生劇情，後面填入Boss順序
			end
		end			
			
		if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 then	--BOSS已死亡
			g_FightSwitch[ RoomID ] = false;	--將戰鬥開關關閉
			Delobj( Door );	--刪除阻擋門
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossDie" ] , 2 );	--廣播Boss死亡
			CallPlot( CtrlCenter , "Z34_BOSS5_CtrlCenter_Clear" , CtrlCenter , RoomID );	--中控器 - 清場劇情
			if Zone ~= 941 then	Hao_antiHacker_Dead( 5 );	end	--防駭客新制，掛在死亡劇情，填入Boss順序
			sleep( 50 );
			return	--結束此函式
		end
	end
end

---------------------------------Boss - 起始翅膀特效加掛劇情---------------------------------
function Z34_BOSS5_Boss_Init( Boss , RoomID )
	local Dir = ReadRoleValue( Boss, EM_RoleValue_Dir );
	local Pos = Vector_GetRolePos( Boss );

	local WingEffect = {};	--Boss的翅膀特效物件
	WingEffect[ 1 ] = { ID = 106271 , ReferencePoint = "p_left_foot" };		--左邊特效
	WingEffect[ 2 ] = { ID = 106271 , ReferencePoint = "p_right_foot" };	--右邊特效

	for i = 1 , 2 do
		local Wing = CreateObj( WingEffect[ i ].ID , Pos.x , Pos.y , Pos.z , Dir , 1 );
		SetModeEx( Wing , EM_SetModeType_Move , false );			--移動(否)
		SetModeEx( Wing , EM_SetModeType_Mark , false );			--標記(否)
		SetModeEx( Wing , EM_SetModeType_ShowRoleHead , false );	--頭像(否)
		SetModeEx( Wing , EM_SetModeType_Searchenemy , false );		--索敵(否)
		SetModeEx( Wing , EM_SetModeType_Fight , false );			--砍殺(否)
		SetModeEx( Wing , EM_SetModeType_Strikback , false );		--反擊(否)
		AddToPartition( Wing , RoomID );
		AttachObj( Wing , Boss , 4 , WingEffect[ i ].ReferencePoint , WingEffect[ i ].ReferencePoint );
		CallPlot( Wing , "Z34_BOSS5_Boss_ObjCheckDead" , Wing , Boss );	--翅膀特效物件偵測死亡後自我刪除
	end
end
function Z34_BOSS5_Boss_ObjCheckDead( Wing , Boss )
	while CheckID( Boss ) and ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0 do Sleep( 10 ); end
	DelObj( Wing );
end

---------------------------------Boss - 戰鬥劇情---------------------------------
function Z34_BOSS5_Boss_Fight( Boss , RoomID )
	local FightClock = 0;	--計時器
	local FrenzyRecord = false;	--狂暴施展過的紀錄
	
	--汲取生命施展過的紀錄	
	local VampireRecordA = false;
	local VampireRecordB = false;
	
	while true do
		Sleep( 10 );	--每1秒跑一次
		FightClock = FightClock + 1;
		
		local NowTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID );
		local HateList = KS_GetHateList( Boss , 1 );	--取得Boss仇恨清單內的玩家，依仇恨高低排序
		
		--HP判斷相關
		if Lua_PercentHP( Boss ) <= g_Buff_Vampire_HP_2 and VampireRecordB == false then
			g_VampireTarget[ RoomID ] = HateList[ 1 ];							--將仇恨最高目標寫進汲取生命紀錄的全域變數中
			CallPlot( Boss , "Z34_BOSS5_Boss_Vampire" , RoomID );				--Boss - 汲取生命 - 施展劇情
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossVampire" ] , 2 );	--廣播Boss施展汲取生命
			VampireRecordB = true;	--紀錄已施展過
			while CheckBuff( Boss , g_Buff_Vampire_A_ID ) == true do sleep( 5 ) end	--若汲取生命的狀態還在，則等待0.5秒
			
		elseif Lua_PercentHP( Boss ) <= g_Buff_Vampire_HP_1 and VampireRecordA == false then
			g_VampireTarget[ RoomID ] = HateList[ 1 ];							--將仇恨最高目標寫進汲取生命紀錄的全域變數中
			CallPlot( Boss , "Z34_BOSS5_Boss_Vampire" , RoomID );				--Boss - 汲取生命 - 施展劇情
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossVampire" ] , 2 );	--廣播Boss施展汲取生命
			VampireRecordA = true;	--紀錄已施展過
			while CheckBuff( Boss , g_Buff_Vampire_A_ID ) == true do sleep( 5 ) end	--若汲取生命的狀態還在，則等待0.5秒
		end
		
		--秒數判斷相關
		if FightClock % g_FrenzyTime[ g_Difficulty[ RoomID ] ] == 0 and FrenzyRecord == false then	--狂暴秒數與條件判斷
			AddBuff( Boss , g_FrenzyBuff , 0 , -1 );	--給予自身Buff：狂暴
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossFrenzy" ] , 2 );	--廣播Boss狂暴
			FrenzyRecord = true;	--紀錄已狂暴
			
		elseif FightClock % g_Skill_BigSkill_CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
			CallPlot( Boss , "Z34_BOSS5_Boss_BigSkill" , Boss , RoomID , HateList );	--Boss - 絕招施展劇情
			
		elseif FightClock % g_Skill_DarkFear_CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
			CastSpellLV( Boss , Boss , g_Skill_DarkFear_ID , 0 );	--施展：黑獄恐懼
			
		elseif FightClock % g_Skill_Usually_CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
			if RandRange( 1 , 2 ) == 1 then	--隨機二選一
				CastSpellLV( Boss , Boss , g_Skill_Usually_A_ID , 0 );	--施展：撕裂之爪
			else
				if #HateList > 1 then	CastSpellLV( Boss , HateList[ 2 ] , g_Skill_Usually_B_ID , g_Skill_Usually_B_Lv[ g_Difficulty[ RoomID ] ] );	--對次高仇恨者施展：忘卻沼泥
				else					CastSpellLV( Boss , HateList[ 1 ] , g_Skill_Usually_B_ID , g_Skill_Usually_B_Lv[ g_Difficulty[ RoomID ] ] );	--對最高仇恨者施展：忘卻沼泥
				end
			end
		end
	end	
end

---------------------------------Boss - 絕招施展劇情---------------------------------
function Z34_BOSS5_Boss_BigSkill( Boss , RoomID , HateList )
	local MobList = {};
	MobList[ 1 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobA_GUID[ g_Difficulty[ RoomID ] ] );	--取出場上所有的追擊吞噬者
	MobList[ 2 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobB_GUID[ g_Difficulty[ RoomID ] ] );	--取出場上所有的腐化吞噬者
	MobList[ 3 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobC_GUID[ g_Difficulty[ RoomID ] ] );	--取出場上所有的貪婪吞噬者
	local MobCount = #MobList[ 1 ] + #MobList[ 2 ] + #MobList[ 3 ];
	
	if MobCount > 0 then	SysCastSpellLV( Boss , Boss , g_Skill_BigSkill_C_ID , MobCount - 1 );	end	--施展：吸收吞噬者
	
	--清除尚在場上的吞噬者
	for i = 1 , #MobList do
		if #MobList[ i ] > 0 then
			for j = 1 , #MobList[ i ] do
				DelObj( MobList[ i ][ j ] );
			end
		end
	end
	
	--召喚新的吞噬者與施展法術
	if RandRange( 1 , 2 ) == 1 then	--隨機二選一
		for i = g_FlagNum_Mob_1 , g_FlagNum_Mob_2 , 1 do
			local Mob = CreateObjByFlag( g_MobA_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID , i , 1 );	--追擊吞噬者
			SetModeEx( Mob , EM_SetModeType_Mark , true );			--點選(是)
			SetModeEx( Mob , EM_SetModeType_ShowRoleHead , true ); 	--頭像框(是)
			SetModeEx( Mob , EM_SetModeType_Fight , true );			--砍殺(是)
			SetModeEx( Mob , EM_SetModeType_Strikback , true );		--反擊(是)
			SetModeEx( Mob , EM_SetModeType_Searchenemy , true );	--索敵(是)
			SetModeEx( Mob , EM_SetModeType_Move , true ); 			--移動(是)
			AddToPartition( Mob , RoomID );
			g_Mob[ i ][ RoomID ] = Mob;	--將小怪編號寫進全域變數中
			CallPlot( Mob , "Z34_BOSS5_MobA_Fight" , Mob , RoomID );	--追擊吞噬者 - 戰鬥劇情
		end
		CallPlot( g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] , "Z34_BOSS5_Mob_Assembly" , RoomID );	--吞噬者 - 判斷距離合體劇情
		CastSpellLV( Boss , HateList[ 1 ] , g_Skill_BigSkill_A_ID , g_Skill_BigSkill_A_Lv[ g_Skill_Usually_B_Lv[ g_Difficulty[ RoomID ] ] ] );	--對最高仇恨者施展：忘卻異能
		ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "CallMobA" ] , 2 );	--廣播召喚追擊吞噬者
	else
		for i = g_FlagNum_Mob_1 , g_FlagNum_Mob_2 , 1 do
			local Mob = CreateObjByFlag( g_MobB_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID , i , 1 );	--腐化吞噬者
			SetModeEx( Mob , EM_SetModeType_Mark , true );			--點選(是)
			SetModeEx( Mob , EM_SetModeType_ShowRoleHead , true ); 	--頭像框(是)
			SetModeEx( Mob , EM_SetModeType_Fight , true );			--砍殺(是)
			SetModeEx( Mob , EM_SetModeType_Strikback , false );	--反擊(否)
			SetModeEx( Mob , EM_SetModeType_Searchenemy , false );	--索敵(否)
			SetModeEx( Mob , EM_SetModeType_Move , true ); 			--移動(是)
			AddToPartition( Mob , RoomID );
			g_Mob[ i ][ RoomID ] = Mob;	--將小怪編號寫進全域變數中
			CallPlot( Mob , "Z34_BOSS5_MobB_Fight" , Mob , RoomID );	--腐化吞噬者 - 戰鬥劇情
		end
		CallPlot( g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] , "Z34_BOSS5_Mob_Assembly" , RoomID );	--吞噬者 - 判斷距離合體劇情
		CastSpellLV( Boss , Boss , g_Skill_BigSkill_B_ID , 0 );	--施展：馬爾文能量
		ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "CallMobB" ] , 2 );	--廣播召喚腐化吞噬者
	end
end

---------------------------------Boss - 汲取生命相關劇情---------------------------------
function Z34_BOSS5_Boss_Vampire( RoomID )	--Boss - 汲取生命 - 施展劇情
	local Boss = g_Boss[ RoomID ];	--Boss
	AddBuff( Boss , g_Buff_Vampire_A_ID , 0 , -1 );				--給予自身Buff：汲取生命
	AddBuff( g_VampireTarget[ RoomID ] , g_Buff_Vampire_B_ID , 0 , -1 );	--給予目標Buff：暈眩
	while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--若還有技能在施展中則等待0.2秒
	local TargetPos = Vector_GetRolePos( g_VampireTarget[ RoomID ] );	--取出目標的座標
	local Dir = ReadRoleValue( Boss , EM_RoleValue_Dir );				--取出自身面向
	SetPos( Boss , TargetPos.x , TargetPos.y , TargetPos.z , Dir );		--傳至目標的位置
	CastSpellLV( Boss , Boss , g_skill_Vampire_Casting_ID , 0 );	--施展：汲取生命 - 表演用施法
end

function Z34_BOSS5_Boss_Vampire_Spell()	--Boss - 汲取生命 - 每秒施放劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	SysCastSpellLV( g_Boss[ RoomID ] , g_VampireTarget[ RoomID ] , g_skill_Vampire_ID , 0 );	--施展：汲取生命
end

function Z34_BOSS5_Boss_Vampire_TimeOut()	--Boss - 汲取生命 - 狀態時間到劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	for i = 1 , HateListCount( g_Boss[ RoomID ] ) do
		if HateListInfo( g_Boss[ RoomID ] , i , EM_HateListInfoType_GItemID ) == g_VampireTarget[ RoomID ] then
			SetHateListPoint( g_Boss[ RoomID ] , i , 1 );	--將目標仇恨值降為1點
		end
	end
end

function Z34_BOSS5_Boss_Vampire_End()	--Boss - 汲取生命 - 狀態結束劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	if ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) == g_skill_Vampire_Casting_ID then
		MagicInterrupt( OwnerID() );	--中斷唱咒表演
	end
	CancelBuff( g_VampireTarget[ RoomID ] , g_Buff_Vampire_B_ID );	--解除目標Buff：暈眩
	g_VampireTarget[ RoomID ] = 0;	--清空紀錄用的全域變數
end

---------------------------------追擊吞噬者 - 戰鬥劇情---------------------------------
function Z34_BOSS5_MobA_Fight( Mob , RoomID )
	AddBuff( Mob , g_Buff_MobFollow_ID_A , 0 , -1 );	--給予自身Buff：目標鎖定
	local LuckyGuy = 0;	--待會要被打的人會放這
	
	while LuckyGuy == 0 or ReadRoleValue( LuckyGuy , EM_RoleValue_IsDead ) == 1 do	--沒目標或是目標已死亡，就重選目標
		Sleep( 10 );
		local PlayerList = LUA_YOYO_RangePlayerNotGM( Mob , 2000 ); --抓取自己距離2000的所有玩家，排除GM
		if #PlayerList == 0 then
			return
		elseif #PlayerList == 1 then
			LuckyGuy = PlayerList[ 1 ];	--只有一人的狀況
		else
			while LuckyGuy == 0 do
				local LuckyNumber = RandRange( 1 , #PlayerList );
				if PlayerList[ LuckyNumber ] == ReadRoleValue( g_Boss[ RoomID ] , EM_RoleValue_AttackTargetID ) then
					table.remove( PlayerList , LuckyNumber );	--目標若為坦則從清單移除
				else LuckyGuy = PlayerList[ LuckyNumber ];
				end
			end
		end
		SetAttack( Mob , LuckyGuy );	--命令追擊吞噬者打人
		AddBuff( LuckyGuy , g_Buff_MobFollow_ID_B , 0 , -1 );	--給予目標Buff：追擊信標
	end
end

---------------------------------腐化吞噬者 - 戰鬥劇情---------------------------------
function Z34_BOSS5_MobB_Fight( Mob , RoomID )
	AddBuff( Mob , g_Buff_Spread_ID , 0 , -1 );	--給予自身Buff：腐化擴散
	--讓兩隻腐化吞噬者互相往對面旗子移動
	if Mob == g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] then
		LuaFunc_MoveToFlag( Mob , g_FlagID , g_FlagNum_Mob_2 , 0 );
	elseif Mob == g_Mob[ g_FlagNum_Mob_2 ][ RoomID ] then
		LuaFunc_MoveToFlag( Mob , g_FlagID , g_FlagNum_Mob_1 , 0 );
	end
end

---------------------------------腐化吞噬者 - 腐化擴散 - 檢查目標是否為玩家---------------------------------
function Z34_BOSS5_Skill_CheckPlayer()
	if OwnerID() == TargetID() then return false	--不會傳染給自己
	elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then return true
	else return false
	end
end

---------------------------------腐化吞噬者 - 腐化干擾 - 檢查目標是否為BOSS---------------------------------
function Z34_BOSS5_Skill_CheckBoss()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == g_Boss_GUID[ 1 ]
	or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == g_Boss_GUID[ 2 ]
	or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == g_Boss_GUID[ 3 ] then
		if ReadRoleValue( TargetID() , EM_RoleValue_SpellMagicID ) == g_Skill_BigSkill_B_ID then	--Boss正在施展馬爾文能量
			MagicInterrupt( TargetID() );	--中斷唱咒
			ScriptMessage( TargetID() , -1 , 2 , g_BossTalk[ "Interrupt" ] , 2 );	--廣播馬爾文能量被中斷
		end
		return true
	else return false
	end
end
---------------------------------吞噬者 - 判斷距離合體劇情---------------------------------
function Z34_BOSS5_Mob_Assembly( RoomID )
	while true do
		Sleep( 5 );
		local Pos = Vector_GetRolePos( OwnerID() );					--取出自身的座標
		local Dir = ReadRoleValue( OwnerID(), EM_RoleValue_Dir );	--取出自身面向
		if CheckDistance( g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] , g_Mob[ g_FlagNum_Mob_2 ][ RoomID ] , 25 ) == true then
			local MobC = CreateObj( g_MobC_GUID[ g_Difficulty[ RoomID ] ] , Pos.x , Pos.y , Pos.z , Dir , 1 );	--貪婪吞噬者
			SetModeEx( MobC , EM_SetModeType_Mark , true );			--點選(是)
			SetModeEx( MobC , EM_SetModeType_ShowRoleHead , true ); --頭像框(是)
			SetModeEx( MobC , EM_SetModeType_Fight , true );		--砍殺(是)
			SetModeEx( MobC , EM_SetModeType_Strikback , true );	--反擊(是)
			SetModeEx( MobC , EM_SetModeType_Searchenemy , true );	--索敵(是)
			SetModeEx( MobC , EM_SetModeType_Move , true ); 		--移動(是)
			AddToPartition( MobC , RoomID );
			--刪除合體前的小怪
			DelObj( g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] );	
			DelObj( g_Mob[ g_FlagNum_Mob_2 ][ RoomID ] );
			ScriptMessage( MobC , -1 , 2 , g_BossTalk[ "MobMerge" ] , 2 );	--廣播兩隻吞噬者合體成貪婪吞噬者
		end
	end
end
---------------------------------貪婪吞噬者 - 吞食．分裂劇情---------------------------------
function Z34_BOSS5_MobC_Split()	--掛在502035的結果LUA
	local TargetName = Getname( TargetID() );	--目標名稱
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local Pos = Vector_GetRolePos( TargetID() );				--取出目標的座標
	local Dir = ReadRoleValue( TargetID(), EM_RoleValue_Dir );	--取出目標面向
	local NewMobC = CreateObj( g_MobC_GUID[ g_Difficulty[ RoomID ] ] , Pos.x , Pos.y , Pos.z , Dir , 1 );
	SetModeEx( NewMobC , EM_SetModeType_Mark , true );			--點選(是)
	SetModeEx( NewMobC , EM_SetModeType_ShowRoleHead , true ); 	--頭像框(是)
	SetModeEx( NewMobC , EM_SetModeType_Fight , true );			--砍殺(是)
	SetModeEx( NewMobC , EM_SetModeType_Strikback , true );		--反擊(是)
	SetModeEx( NewMobC , EM_SetModeType_Searchenemy , true );	--索敵(是)
	SetModeEx( NewMobC , EM_SetModeType_Move , true ); 			--移動(是)
	AddToPartition( NewMobC , RoomID );
	ScriptMessage( NewMobC , -1 , 2 , g_BossTalk[ "MobCSplit" ] .. TargetName .. "]" , 2 );	--廣播貪婪吞噬者分裂
end

---------------------------------中控器 - 清場劇情---------------------------------
function Z34_BOSS5_CtrlCenter_Clear( CtrlCenter , RoomID )
	local MobList = {};
	MobList[ 1 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobA_GUID[ g_Difficulty[ RoomID ] ] );	--取出場上所有的追擊吞噬者
	MobList[ 2 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobB_GUID[ g_Difficulty[ RoomID ] ] );	--取出場上所有的腐化吞噬者
	MobList[ 3 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobC_GUID[ g_Difficulty[ RoomID ] ] );	--取出場上所有的貪婪吞噬者
	
	--清除尚在場上的吞噬者
	for i = 1 , #MobList do
		if #MobList[ i ] > 0 then
			for j = 1 , #MobList[ i ] do
				DelObj( MobList[ i ][ j ] );
			end
		end
	end
end