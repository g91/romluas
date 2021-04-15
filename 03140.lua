--Author : K.J. Aris
--Version : 14.02.12.
--Ignitor : 108895
--NPC : 108804--raid
--Script : 703140

local _Lua_703140_AI_GlobalVars = {};
--宣告所有技能不同難度施放等級
local Skill = {}
Skill.Lv = {}
Skill.Lv[851685] = {0,0,0}
Skill.Lv[851681] = {0,0,0}
Skill.Lv[851682] = {0,0,0}
Skill.Lv[851683] = {0,0,0}
Skill.Lv[851690] = {0,0,0}
Skill.Lv[851687] = {0,0,0}
Skill.Lv[851688] = {0,0,0}
Skill.Lv[851686] = {0,0,0}
Skill.Lv[851695] = {0,0,0}
Skill.Lv[851693] = {0,0,0}
Skill.Lv[851694] = {0,0,0}
Skill.Lv[851692] = {0,0,0}
--宣告所有技能冷卻
Skill.CD = {}
Skill.CD[851681] = 3
Skill.CD[851682] = 7
Skill.CD[851695] = 9
Skill.CD[851693] = 20

Skill.CD[851694] = 15
Skill.CD[851692] = 19

					


function Lua_703140_AI_Init( _inputCtrID )--controller  NPC 108895 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703140_AI_Init : NPC 108895       Z33-1B2  V140212 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --以防重複執行 將原有控制器刪除

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108895
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108804
	
	--this NPC is using as a controller
	SetModeEx( _ctrlID , EM_SetModeType_Show , false );	--不可點選
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _ctrlID , EM_SetModeType_HideName , false );	--不顯示名稱
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--無阻擋效果


	-------------------------------------------initialize settings
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );
	local _difficulty = 1;
	local _frenzyCD = 480;

	if ( _zoneID == 173 ) then
		_difficulty = 2;
		_frenzyCD = 360;
	end

	if ( _zoneID == 174 ) then
		_difficulty = 3;
		_frenzyCD = 9999999;
	end
	
	--請依難易度順序放置
	local _bossGUIDs = { 108804 , 108916 , 108921 };--葛諾什
	local _healTotemGUIDs = { 108904 , 108917 , 108922 };--冥醫圖騰
	local _earthShatteringTotemGUIDs = { 108905 , 108918 , 108923 };--地裂圖騰
	local _curseTotemGUIDs = { 108906 , 108919 , 108924 };--詛咒圖騰
	local _abandonedSpiritGUIDs = { 108907 , 108920 , 108925 };--棄靈之影


	--參數設定表
	
	_Lua_703140_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossGUID = _bossGUIDs[ _difficulty ] ,
					_healTotemGUID = _healTotemGUIDs[ _difficulty ] , --冥醫圖騰
					_earthShatteringTotemGUID = _earthShatteringTotemGUIDs[ _difficulty ] , --地裂圖騰
					_curseTotemGUID = _curseTotemGUIDs[ _difficulty ] , --詛咒圖騰
					_abandonedSpiritGUID = _abandonedSpiritGUIDs[ _difficulty ] , --棄靈之影
					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 106246 ,

					_flagGUID = 781405 , --781405 Z33-1_2王用旗標
					_bossFlagPos = 1 , 
					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					--values
					--_maxCurseTotem = 2;--詛咒圖騰數量
					_stage1CurseTotem = 2 ,--階段一詛咒圖騰數量
					_stage2CurseTotem = 4 ,--階段二詛咒圖騰數量

					--functions
					ExtObj = nil , 
					DelExtObjs = nil , 

					--tables
					_curseTotemIDs = nil , 

					_frenzyCD = _frenzyCD ,

					--stage 1
					_skillEearthTotemCD = 9 , --. 每9秒：在場上兩名隨機仇恨目標處放置地裂圖騰。
					_skillCurseCD = 20 , --每20秒：在場上的圖騰點隨機放置2根詛咒圖騰→接著施展致命詛咒。

					--stage 2
					_skillAbandonSpiritCD = 17 , --每17秒：招喚棄靈之影，持續15秒後消失。
					_skillHealTotemCD = 20 , --HP低於25%：在自身位置施放冥醫圖騰，之後每20秒施放一次。

					};
	--唯讀資訊
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];

	--產生 Boss
	--local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._bossFlagPos );
	Lua_DavisDelObj( _gConsts._bossGUID );--kill reduplicated
	local _bossID = CreateObjByFlag( _gConsts._bossGUID , _gConsts._flagGUID , _gConsts._bossFlagPos , 1 );--108800
	_gConsts._bossID = _bossID;--
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false);
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true);
	SetModeEx( _bossID , EM_SetModeType_Strikback , true);

	--產生後門
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--delete trigger
	DelObj( _ctrlID );

	return _roomID;
end--function Lua_703140_AI_Init( _inputCtrID )

function Lua_703140_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	--Lua_703175_ClearAll( _roomID );
	Lua_703140_AI_Init();
end

function Lua_703140_AI_onFight()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	Cl_Resist_HackersFightBegin( _bossID )
	DebugMsg( 0 , 0 , "--Lua_703140_AI_onFight ".._bossID.." RID : ".._roomID );
	--唯讀資訊
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703140_AI_reignite( _roomID ); return; end

	--控制器與衍伸物件
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--衍生物(處理招喚物 或 長出來的東西)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );

	--_Lua_703140_AI_GlobalVars[ _roomID ]._maxCurseTotem = 2;--強制刷新

	--generate front door

	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703140_AI_Engage" , 0 );
	CallPlot( _bossID , "Cl_703140_FightAI" );
	ScriptMessage(_bossID,0,2,"[LUA_703140_AI_ONFIGHT]",0);
	--CallPlot( _bossID , "Cl_Resist_HackersFightBegin" );
end--function Lua_703140_AI_onFight()

function Cl_703140_FightAI()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local time = 0
	local AttackTarget = 0
	local Diff = Cl_GetDiff(172)
	while ReadRoleValue( _bossID , EM_RoleValue_IsAttackMode ) == 1 do
		sleep( 10 )
		if ReadRoleValue( _bossID , EM_RoleValue_SpellMagicID ) == 0 then
			time = time + 1
			AttackTarget = ReadRoleValue( _bossID , EM_RoleValue_AttackTargetID )
			DebugMsg( 0 ,  0 ,"HP="..( ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP ) ) )
			if time%Skill.CD[851692] == 0 and
				( ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP ) ) <= 0.25 then
				--say( _bossID , "["..tostring(851692).."]" )
				CastSpellLv( _bossID , _bossID , 851692 , Skill.Lv[851692][Diff] ) 
			elseif time%Skill.CD[851694] == 0 and
				( ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP ) ) <= 0.5 then
				--say( _bossID , "["..tostring(851694).."]" )
				CastSpellLv( _bossID , _bossID , 851694 , Skill.Lv[851694][Diff] ) 
			elseif time%Skill.CD[851693] == 0 then
				--say( _bossID , "["..tostring(851693).."]" )
				CastSpellLv( _bossID , _bossID , 851693 , Skill.Lv[851693][Diff] ) 
			elseif time%Skill.CD[851695] == 0 then
				--say( _bossID , "["..tostring(851695).."]" )
				CastSpellLv( _bossID , _bossID , 851695 , Skill.Lv[851695][Diff] ) 
			elseif time%Skill.CD[851682] == 0 then
				--say( _bossID , "["..tostring(851682).."]" )
				CastSpellLv( _bossID , AttackTarget , 851682 , Skill.Lv[851682][Diff] ) 
			elseif time%Skill.CD[851681] == 0 then
				--say( _bossID , "["..tostring(851681).."]" )
				CastSpellLv( _bossID , AttackTarget , 851681 , Skill.Lv[851681][Diff] ) 
			end
		end
	end
end
function Lua_703140_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
	DebugMsg( 0 , 0 , "--Lua_703140_AI_Engage" );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;--_captainID
	--local _roomID = _gConsts._roomID;
	local _ctrlID = _gConsts._ctrlID;

	--Routines Vars
	local _clock = 0;
	local _availableTargetPlayer = nil;--hash list
	local _engaging = true;
	--Routines Vars
		--Lua_RandomPlayerFromHateList
	
	local _timeTick = 1;--Time Speed
	local _miniTimeTick = _timeTick*10;--Time Speed for Sleep
	--local _GCD = 0;--int

	--local __isFrenzied = false;
	--stage 1
		--_skillEearthTotemCD = 9 , --. 每9秒：在場上兩名隨機仇恨目標處放置地裂圖騰。
		--_skillCurseCD = 20 , --每20秒：在場上的圖騰點隨機放置2根詛咒圖騰→接著施展致命詛咒。

	--stage 2
		--_skillAbandonSpiritCD = 17 , --每17秒：招喚棄靈之影，持續15秒後消失。
		--_skillHealTotemCD = 20 , --HP低於25%：在自身位置施放冥醫圖騰，之後每20秒施放一次。
	local _GCD = 5;
	local _CD = {
		--stage 1
		_skillEearthTotemCD = _gConsts._skillEearthTotemCD ,
		_skillCurseCD = _gConsts._skillCurseCD ,


		--stage 2
		_skillAbandonSpiritCD = _gConsts._skillAbandonSpiritCD ,

		--<25%>
		_skillHealTotemCD = _gConsts._skillHealTotemCD ,

		}

	----------------------------------------技能參數
	local _maxCurseTotem = _gConsts._maxCurseTotem;--進入第二階段後，詛咒圖騰變為一次4根。
	
	-----------------------------END--------技能參數

	-----------------------------------------狂暴參數
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;
	----------------------------END----------狂暴參數

	local _hateListCounter = 0;
	local _bossHpRatio = 0;
	DebugMsg( 0 , 0 , "--Start loop" );

	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--------------END---clock
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );

		--------------------Routines
		--_availableTargetPlayer = LUA_YOYO_RangePlayerNotGM_EX( _bossID , _gConsts._effectiveRange , true ); --抓取自己距離_effectiveRange的存活玩家，排除GM--702774
		--_engaging = #_availableTargetPlayer ~= 0;

		_hateListCounter = HateListCount( _bossID );
		_engaging = _hateListCounter ~= 0;

		_bossHpRatio = ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP );--HP ratio
		--------------END---Routines

		-------------------------------------------------戰鬥結束條件
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss 死亡時 挑戰成功
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			Lua_703140_AI_Conquered( _roomID );
			Cl_Resist_HackersBossDead( _bossID )
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗
			DebugMsg( 0 , 0 , "--quit fight" );
			--Lua_703140_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
			Lua_703140_AI_Reset( _roomID );
			break;
		end
		-------------------------------------END--------戰鬥結束條件

		-------------------------------------------------Timers
		if ( _GCD > 0 ) then _GCD = _GCD - _timeTick; end

		for _key , _value in pairs( _CD ) do
			--DebugMsg( 0 , 0 , "-- : ".._key.." __ ".. _value );
			if ( _CD[ _key ] > 0 ) then _CD[ _key ] = _value - _timeTick; end
		end
		---------------------------------------END-------Timers


		--狂暴機制
		if ( _clock >= _frenzyCD and (_isFrenzied == false) ) then
			_isFrenzied = true;
			AddBuff( _bossID , 625848 , 0 , -1 );-- 625848 暴君
			DebugMsg( 0 , 0 , "-----狂狂暴----" );
			ScriptMessage(_bossID,0,2,"[LUA_703140_AI_FRENZY]",0);
		end		


		---------------------------------------------------階段轉換條件
--		if ( _bossHpRatio < 0.5 ) then--第一階段為HP 50%~100%，第二階段為HP 0%~49%。
--			--DebugMsg( 0 , 0 , "--Phase 2" );
--			_maxCurseTotem = 4;--進入第二階段後，詛咒圖騰變為一次4根。
--			_Lua_703140_AI_GlobalVars[ _roomID ]._maxCurseTotem = _maxCurseTotem;
--		else
		if ( _bossHpRatio > 0.5 ) then
			--DebugMsg( 0 , 0 , "--Phase 1" );
			--_maxCurseTotem = 2;
			_CD._skillAbandonSpiritCD = _gConsts._skillAbandonSpiritCD;--不讓他倒數( 階段一不施放 )
		end

		if ( _bossHpRatio > 0.25 ) then--HP低於25%：在自身位置施放冥醫圖騰，之後每20秒施放一次。
			_CD._skillHealTotemCD = _gConsts._skillHealTotemCD;--不讓他倒數( >25%不施放 )
		end
		-------------------------------------END--------階段轉換條件
		
		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 
			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉
			
		

			--[[
			if( _CD._skillHealTotemCD <= 0 )then--冥醫圖騰--20sec
				DebugMsg( 0 , 0 , "--_skillHealTotemCD release" );
				CastSpellLv( _bossID , _bossID , 851692 );--851692冥醫圖騰
				_CD._skillHealTotemCD = _gConsts._skillHealTotemCD;
				_GCD = 5;
			end

			if( _CD._skillCurseCD <= 0 )then--詛咒圖騰--20sec
				DebugMsg( 0 , 0 , "--_skillCurseCD release" );
				CastSpellLv( _bossID , _bossID , 851693 );--851693詛咒圖騰   之後觸發致命詛咒
				_CD._skillCurseCD = _gConsts._skillCurseCD;
				_GCD = 25;
				break;
			end

			if( _CD._skillAbandonSpiritCD <= 0 )then--棄靈之影--17sec
				DebugMsg( 0 , 0 , "--_skillAbandonSpiritCD release" );
				CastSpellLv( _bossID , _bossID , 851694 );--851694棄靈之影
				_CD._skillAbandonSpiritCD = _gConsts._skillAbandonSpiritCD;
				_GCD = 2;
			end
			
			if( _CD._skillEearthTotemCD <= 0 )then--裂地圖騰--9sec
				DebugMsg( 0 , 0 , "--_skillEearthTotemCD release" );
				CastSpellLv( _bossID , _bossID , 851695 );--851695裂地圖騰
				_CD._skillEearthTotemCD = _gConsts._skillEearthTotemCD;
				_GCD = 5;
			end



			if( _CD._timer4 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer4 release" );
				_CD._timer4 = 25;
				_GCD = 2;
			end
			]]--
			
		end


	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703140_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703140_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703140_AI_Reset" );

	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	
	local _bossID = _gConsts._bossID;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703140_AI_RESET]",0);

	DW_UnFight( _bossID , true );

	Delobj( _frontDoorID );	--刪除前門
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 20 );

	DelFromPartition( _bossID );

	Sleep( 50 );

	DW_UnFight( _bossID , false );
	SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos );
	AddToPartition( _bossID , _roomID );
	
end--function Lua_703140_AI_Reset( _roomID )

function Lua_703140_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703140_AI_Conquered" );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];--for read

	if( _gConsts == nil ) then return; end
	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	ScriptMessage(_gConsts._bossID,0,2,"[$MUTE]".."[LUA_703140_AI_CONQUERED]",0);	
	
	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703140_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	--Cl_Resist_HackersBossDead();
end--function Lua_703140_AI_Conquered( _roomID )



-----------------------------------sub functions


--------------------------------------------------------------------------------skills functions below

function  Lua_703140_Item_TotemInit()
	DebugMsg( 0 , 0 , "Lua_703140_Item_TotemInit" );
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , true );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , true );	--有阻擋效果
	
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	--local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];

	return;
end

--------------------------------------------------------------------------------------------------------冥醫圖騰
function Lua_703140_Skill_HealTotem()
	DebugMsg( 0 , 0 , "Lua_703140_Skill_HealTotem" );
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	local _maxTarget = 2;


	local _healTotemGUID = _gConsts._healTotemGUID;

	--local x,y,z,dir = 0;
	--x = x + ( RandRange( 1 , 100 ) - 50 );
	--z = z + ( RandRange( 1 , 100 ) - 50 );
	local x,y,z,dir = DW_Location( _ownerID );
	_gConsts.ExtObj( _healTotemGUID , x,y,z,dir );

end

function Lua_703140_Item_HealTotemInit()--冥醫圖騰
	DebugMsg( 0 , 0 , "Lua_703140_Item_HealTotemInit" );
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--有阻擋效果

	WriteRoleValue( _ownerID , EM_RoleValue_LiveTime , 11 );--冥醫圖騰會持續對BOSS恢復HP，持續10秒，結束後會自己消滅。

	CallPlot( _ownerID , "Lua_703140_Item_HealTotem_Loop" );
end

function Lua_703140_Item_HealTotem_Loop()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703140_AI_GlobalVars[ _roomID ]._bossID;
	while ( CheckID( _bossID ) and ReadRoleValue( _bossID , EM_RoleValue_IsDead ) ~= 1 ) do
		CastSpellLv( _ownerID , _bossID , 851685 ,Skill.Lv[851685][Cl_GetDiff(172)]);--851685更生能量
		sleep( 10 );
	end

end

-----------------------------------------------------------------------------------------------------------
function Lua_703140_Skill_Cure()
	DebugMsg( 0 , 0 , "Lua_703140_Skill_Cure" );
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	DebugMsg( 0 , 0 , "-----> Totem : ".._ownerID.."   ------> Boss : ".._targetID );
	return true;
end
-----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------END-----------------------冥醫圖騰


----------------------------------------------------------------------------------------------------------暗流四射
function Lua_703140_Skill_DarkSplash()
	DebugMsg( 0 , 0 , "Lua_703140_Skill_DarkSplash" );
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	local _spellID = 851683;--暗流四射分化
	local _effectSpellID = 851690;--暗流四射分化飛行特效

	DebugMsg( 0 , 0 , "-----> Attacker : ".._ownerID.."   ------> Victim : ".._targetID );
	local _maxSplashes = 4;--最多四人
	local _maxRange = 50;--yard
	local _victims = LUA_YOYO_RangePlayerNotGM_EX( _targetID , _maxRange , true );
	local _currentVictimID = _targetID;
	SysCastSpellLv( _ownerID , _currentVictimID , _spellID , Skill.Lv[_spellID][Cl_GetDiff(172)] );
	for _i = 1 , _maxSplashes , 1 do
		_currentVictimID = _victims[ _i ];
		if ( _currentVictimID == nil or CheckID( _currentVictimID ) == false ) then
			_currentVictimID = _targetID;
		end
		CastSpellLv( _targetID , _currentVictimID , _effectSpellID , Skill.Lv[_effectSpellID][Cl_GetDiff(172)] );--從目標四濺出去
		SysCastSpellLv( _ownerID , _currentVictimID , _spellID , Skill.Lv[_spellID][Cl_GetDiff(172)] );
		DebugMsg( 0 , 0 , "-----> DarkSplash to : ".._currentVictimID );
	end

end
-------------------------------------------------------------------------------END------------------------暗流四射





-------------------------------------------------------------------------------------------------------------詛咒圖騰
function Lua_703140_Skill_CurseTotem()--詛咒圖騰
	--每20秒：在場上的圖騰點隨機放置2根詛咒圖騰→接著施展致命詛咒。
	
	local _ownerID = OwnerID();--boss
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	local _maxCurseTotem = _gConsts._stage1CurseTotem;

	if ( ReadRoleValue( _ownerID , EM_RoleValue_HP )/ReadRoleValue( _ownerID , EM_RoleValue_MaxHP ) < 0.5 ) then
		_maxCurseTotem = _gConsts._stage2CurseTotem;
	end

	DebugMsg( 0 , 0 , "Lua_703140_Skill_CurseTotem , max : ".._maxCurseTotem );
	local _curseTotemGUID = _gConsts._curseTotemGUID;

	local _curseTotemIDs = _gConsts._curseTotemIDs;

	local x,y,z,dir = DW_Location( _ownerID );

	if ( _curseTotemIDs ~= nil ) then
		for _index , _totemID in pairs( _curseTotemIDs ) do--放置詛咒圖騰時若有未打完的圖騰，會直接拔掉舊的換新的。
			DelObj( _totemID );
		end
	end

	_curseTotemIDs = {};
	local _targetX , _targetZ = 0;
	for _step = 1 , _maxCurseTotem , 1 do
		_targetX = x + ( RandRange( 1 , 300 ) - 150 );
		_targetZ = z + ( RandRange( 1 , 300 ) - 150 );
		
		table.insert( _curseTotemIDs , _gConsts.ExtObj( _curseTotemGUID , _targetX,y,_targetZ,dir ) );
	end
	_Lua_703140_AI_GlobalVars[ _roomID ]._curseTotemIDs = _curseTotemIDs;

	--施展致命詛咒 --施展時間10秒

	--CastSpellLv( _ownerID , _ownerID , 851684 );

end

--PS : 詛咒圖騰 會觸發 致命詛咒
function Lua_703140_Item_CurseTotemInit()--詛咒圖騰
	DebugMsg( 0 , 0 , "Lua_703140_Item_CurseTotemInit" );
	local _ownerID = OwnerID();
	--SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	--SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--有阻擋效果

	WriteRoleValue( _ownerID , EM_RoleValue_LiveTime , 11 );--詛咒圖騰存活時間

	CallPlot( _ownerID , "Lua_703140_Item_CurseTotem_Loop" );
end

function Lua_703140_Item_CurseTotem_Loop()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703140_AI_GlobalVars[ _roomID ]._bossID;
	while ( CheckID( _bossID ) and ReadRoleValue( _bossID , EM_RoleValue_IsDead ) ~= 1 ) do
		SysCastSpellLv( _ownerID , _ownerID , 851687 , Skill.Lv[851687][Cl_GetDiff(172)] );--851687失力
		SysCastSpellLv( _ownerID , _ownerID , 851688 , 0 );--851688詛咒
		sleep( 20 );
	end

end




-----------------------------------------------------------------------------------------------------------致命詛咒
function Lua_703140_Skill_DeadlyCurse()--致命詛咒
	DebugMsg( 0 , 0 , "Lua_703140_Skill_DeadlyCurse" );
	local _ownerID = OwnerID();--Attacker
	local _targetID = TargetID();--Victim
	DebugMsg( 0 , 0 , "-----> Attacker : ".._ownerID.."   ------> Victim : ".._targetID );
	local _buffID = 625510;--625510詛咒狀態
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _buffID ) + 1;
	local _spellID = 851691;--851691致命詛咒傷害
	DebugMsg( 0 , 0 , "-----> buffLevel : ".._currentBuffLv );
	if _currentBuffLv >= 0 then
		SysCastSpellLv( _ownerID , _targetID , _spellID , _currentBuffLv );--讀到多少Lv就用多少Lv的法術打目標
		DebugMsg( 0 , 0 , "-----> Damage : ".._currentBuffLv.." *5% " );
	end
	CancelBuff( _targetID , _buffID );

end
-----------------------------------------------------------------------------END---------------------------致命詛咒
---------------------------------------------------------------------------------END-------------------------詛咒圖騰


-------------------------------------------------------------------------------------------------------------地裂圖騰
function Lua_703140_Skill_EarthShatteringTotem()--地裂圖騰
	DebugMsg( 0 , 0 , "Lua_703140_Skill_EarthShatteringTotem" );
	-- 每9秒：在場上兩名隨機仇恨目標處放置地裂圖騰。
	--Lua_RandomPlayerFromHateList(BossID,HowMuch,AntiTank) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	local _maxTarget = 2;
	local _targets = Lua_RandomPlayerFromHateList( _ownerID , _maxTarget , false );

	local _earthShatteringTotemGUID = _gConsts._earthShatteringTotemGUID;

	local x,y,z,dir = 0;
	for _index , _playerID in pairs( _targets ) do
		x,y,z,dir = DW_Location( _playerID );
		_gConsts.ExtObj( _earthShatteringTotemGUID , x,y,z,dir );
	end
end

function Lua_703140_Item_EarthShatteringTotemInit()--詛咒圖騰
	DebugMsg( 0 , 0 , "Lua_703140_Item_EarthShatteringTotemInit" );
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true ); --顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , false );	--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--有阻擋效果

	WriteRoleValue( _ownerID , EM_RoleValue_LiveTime , 120 );--詛咒圖騰存活時間

	CallPlot( _ownerID , "Lua_703140_Item_EarthShatteringTotem_Loop" );
end

function Lua_703140_Item_EarthShatteringTotem_Loop()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703140_AI_GlobalVars[ _roomID ]._bossID;
	while ( CheckID( _bossID ) and ReadRoleValue( _bossID , EM_RoleValue_IsDead ) ~= 1 ) do
		CastSpellLv( _ownerID , _ownerID , 851686 ,Skill.Lv[851686][Cl_GetDiff(172)]);--851686裂地能量
		sleep( 10 );
	end

end
---------------------------------------------------------------------------------END-------------------------地裂圖騰



-------------------------------------------------------------------------------------------------------------棄靈之影
function Lua_703140_Skill_AbandonedSpirit()--棄靈之影
	DebugMsg( 0 , 0 , "Lua_703140_Skill_AbandonedSpirit" );
	--進入第二階段後，每17秒：招喚棄靈之影，持續15秒後消失。
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	local _abandonedSpiritGUID = _gConsts._abandonedSpiritGUID;

	local x,y,z,dir = DW_Location( _ownerID );
	x = x + ( RandRange( 1 , 100 ) - 50 );
	z = z + ( RandRange( 1 , 100 ) - 50 );
	local _abandonedSpiritID = _gConsts.ExtObj( _abandonedSpiritGUID , x,y,z,dir );
	WriteRoleValue( _abandonedSpiritID , EM_RoleValue_LiveTime , 16 );--15秒生存時間

	AddBuff( _abandonedSpiritID , 625507 , 0 , -1 );--625507棄靈降世

end

---------------------------------------------------------------------------------END-------------------------棄靈之影