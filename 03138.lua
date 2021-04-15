--Author : K.J. Aris
--Version : 14.02.05.
--Ignitor : 108890
--NPC : 108800--raid
--Script : 703138

local _Lua_703138_AI_GlobalVars = {};

local Skill = {}
Skill.Lv = {}
Skill.Lv[851666] = {0,0,0}
Skill.Lv[851664] = {0,0,0}
Skill.Lv[851676] = {0,0,0}
Skill.Lv[851665] = {0,0,0}
Skill.Lv[851662] = {0,0,0}
Skill.Lv[851667] = {0,0,0}
Skill.Lv[851668] = {0,0,0}
Skill.Lv[851675] = {0,0,0}
Skill.Lv[851677] = {0,0,0}
Skill.Lv[851678] = {0,0,0}
Skill.Lv[851678] = {0,0,0}

--Skill.Lv[851666][Cl_GetDiff(172)]

function Lua_703138_AI_Init( _inputCtrID )--controller  NPC 108890	--Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703138_AI_Init : NPC 108890       Z33-1B1  V140205 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --以防重複執行 將原有控制器刪除

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108890
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108890
	
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
	local _bossGUIDs = { 108800 , 108912 , 108914 };
	local _electricityTotemGUIDs = { 108900 , 108913 , 108915 };

	--參數設定表
	
	_Lua_703138_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossGUID = _bossGUIDs[ _difficulty ] ,
					_electricityTotemGUID = _electricityTotemGUIDs[ _difficulty ] ,
					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 106246 , 

					_flagGUID = 781403 , --781403 Z33-1_1王用旗標
					_bossFlagPos = 1 , 
					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					_bladeGUID = 108899 , 

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					_skillAeCD = 30 , --每30秒會對場上所有人施放負面狀態，單數的玩家施放「巫毒漩渦」、複數的玩家為「闇影纏繞」
					_skillBladeCD = 15 , --迴旋大砍刀CD
					_skillIronBloodCD = 21 , --鐵血狂傲CD
					_skillChargeCD = 10 , --衝鋒CD
					_skillChaosConvolutionCD = 9 , --暴亂迴旋CD

					_skillThrowCD = 20 , --巫毒巨砍刀  電流圖騰CD
					};
	--唯讀資訊
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];

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
end--function Lua_703138_AI_Init( _inputCtrID )

function Lua_703138_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	--Lua_703175_ClearAll( _roomID );
	Lua_703138_AI_Init();
end

function Lua_703138_AI_onFight()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	--Cl_Resist_HackersFightBegin( _bossID )
	DebugMsg( 0 , 0 , "--Lua_703138_AI_onFight ".._bossID.." RID : ".._roomID );
	--唯讀資訊
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703138_AI_reignite( _roomID ); return; end

	--控制器與衍伸物件
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--衍生物(處理招喚物 或 長出來的東西)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		SetModeEx( _objID , EM_SetModeType_Mark , false );	--不可點選
		SetModeEx( _objID , EM_SetModeType_HideName , false );	--不顯示名稱
		SetModeEx( _objID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
		SetModeEx( _objID , EM_SetModeType_Strikback , false );	--不會反擊
		SetModeEx( _objID , EM_SetModeType_Move , false );	--不會移動
		SetModeEx( _objID , EM_SetModeType_Fight , false );	--不可攻擊
		SetModeEx( _objID , EM_SetModeType_Searchenemy , false );	--不會索敵
		SetModeEx( _objID , EM_SetModeType_Obstruct , false );	--無阻擋效果
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );

	--generate front door

	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703138_AI_Engage" , 0 );

	ScriptMessage(_bossID,0,2,"[LUA_703138_AI_ONFIGHT]",0);

end--function Lua_703138_AI_onFight()


function Lua_703138_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
	DebugMsg( 0 , 0 , "--Lua_703138_AI_Engage" );
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
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
	
	local _GCD = 5;
	local _CD = {
		_skillAeCD = _gConsts._skillAeCD ,
		_skillBladeCD = _gConsts._skillBladeCD ,
		_skillChaosConvolutionCD = _gConsts._skillChaosConvolutionCD ,
		_skillChargeCD = _gConsts._skillChargeCD ,
		_skillIronBloodCD = _gConsts._skillIronBloodCD ,
		_skillThrowCD = _gConsts._skillThrowCD ,
		}

	-----------------------------------------狂暴參數
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;
	----------------------------END----------狂暴參數

	local _hateListCounter = 0;
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

		--_currentCompletedGameLevel = ReadRoleValue( _bossID , EM_RoleValue_Register1 );
		--------------END---Routines

		-------------------------------------------------戰鬥結束條件
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss 死亡時 挑戰成功
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			Lua_703138_AI_Conquered( _roomID );
			Cl_Resist_HackersBossDead( _bossID )
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗
			DebugMsg( 0 , 0 , "--quit fight" );
			--Lua_703138_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
			Lua_703138_AI_Reset( _roomID );
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
				ScriptMessage(_bossID,0,2,"[LUA_703138_AI_FRENZY]",0);
		end		

	
		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 
			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉
			
			if( _CD._skillAeCD <= 0 )then--BOSS每30秒會對場上所有人施放負面狀態，單數的玩家施放「巫毒漩渦」、複數的玩家為「闇影纏繞」。
				DebugMsg( 0 , 0 , "--_skillAeCD release" );
				CastSpellLV( _bossID , _bossID , 851666 , Skill.Lv[851666][Cl_GetDiff(172)] );--851666巫毒漩渦+闇影纏繞
				_CD._skillAeCD = _gConsts._skillAeCD;
				_GCD = 5;
				break;
			end

			
			if( _CD._skillIronBloodCD <= 0 )then--851664鐵血狂傲
				DebugMsg( 0 , 0 , "--_skillIronBloodCD release" );--21sec
				CastSpellLV( _bossID , _bossID , 851664 , Skill.Lv[851664][Cl_GetDiff(172)] );--851664鐵血狂傲
				_CD._skillIronBloodCD = _gConsts._skillIronBloodCD;
				_GCD = 5;
				break;
			end
			
			
			if( _CD._skillThrowCD <= 0 )then--851676巫毒巨砍刀施放動作  每20秒會投擲「巫毒巨砍刀」以及「電流圖騰」在場上隨機位置，持續時間15秒。
				DebugMsg( 0 , 0 , "--_skillThrowCD release" );--20sec
				CastSpellLV( _bossID , _bossID , 851676 , Skill.Lv[851676][Cl_GetDiff(172)]);--851676巫毒巨砍刀施放動作
				_CD._skillThrowCD = _gConsts._skillThrowCD;
				_GCD = 15;
				break;
			end
			
			
			if( _CD._skillBladeCD <= 0 )then--851665迴旋大砍刀
				DebugMsg( 0 , 0 , "--_skillBladeCD release" );--15sec
				CastSpellLV( _bossID , _bossID , 851665, Skill.Lv[851665][Cl_GetDiff(172)] );--851665迴旋大砍刀
				_CD._skillBladeCD = _gConsts._skillBladeCD;
				_GCD = 10;
				break;
			end
			
			
			if( _CD._skillChaosConvolutionCD <= 0 )then--851662暴亂迴旋
				DebugMsg( 0 , 0 , "--_skillChaosConvolutionCD release" );--9sec
				CastSpellLV( _bossID , _bossID , 851662 , Skill.Lv[851662][Cl_GetDiff(172)] );--851663暴亂迴旋
				_CD._skillChaosConvolutionCD = _gConsts._skillChaosConvolutionCD;
				_GCD = 5;
				break;
			end


			if( _CD._skillChargeCD <= 0 )then
				DebugMsg( 0 , 0 , "--_skillChargeCD release" );--1sec
				CallPlot( _bossID , "Lua_703138_Skill_Rush" );--851663衝鋒
				_CD._skillChargeCD = _gConsts._skillChargeCD;
				_GCD = 5;
				break;
			end
			
		end


	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703138_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703138_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703138_AI_Reset" );

	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
	
	local _bossID = _gConsts._bossID;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703138_AI_RESET]",0);

	DW_UnFight( _bossID , true );

	Delobj( _frontDoorID );	--刪除前門
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 20 );
	
	DelFromPartition( _bossID );

	Sleep( 50 );

	DW_UnFight( _bossID , false );
	SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos );
	AddToPartition( _bossID , _roomID );

end--function Lua_703138_AI_Reset( _roomID )

function Lua_703138_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703138_AI_Conquered" );
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];--for read

	if( _gConsts == nil ) then return; end
	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	ScriptMessage(_gConsts._bossID,0,2,"[$MUTE]".."[LUA_703138_AI_CONQUERED]",0);	
	
	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703138_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	--Cl_Resist_HackersBossDead();
end--function Lua_703138_AI_Conquered( _roomID )


-------------------------------------------------------------------------------------skills functions below


---------------------------------------------------------------------------巫毒漩渦+闇影纏繞
--每3秒會對範圍75碼的其他玩家造成傷害，持續15秒，範圍內有越多此狀態的玩家時，傷害會堆疊。需由闇影纏繞解除，若是等時間到自然解除的話，該玩家死亡。
function Lua_703138_Skill_DarkTwining_And_VoodooEddy()
	local _bossID = OwnerID();
	local _targetList = KS_GetHateList( _bossID, 1 );
	--local _targetList = Lua_RandomPlayerFromHateList( _bossID ,  math.floor( _hateListCounter*0.5 )  , false ); 
	local _tickTock = RandRange( 0 , 100 );

	if ( _tickTock > 50 ) then
		_tickTock = 1;
	else
		_tickTock = -1;
	end

	for _index , _id in pairs( _targetList ) do
		DebugMsg( 0 , 0 , "--_targetList : ".._index.." : ".._id );
		if ( _tickTock == 1 ) then
			AddBuff( _id , 625478 , 0 ,  15 );--625478巫毒漩渦
			CallPlot( _id , "Lua_703138_Skill_VoodooEddy_Loop" , 851667 );--851667巫毒漩渦傷害
		else
			AddBuff( _id , 625479 , 0 ,  12 );--625479闇影纏繞
			CallPlot( _id , "Lua_703138_Skill_DarkTwining_Loop" , 851668 );--851668闇影纏繞傷害
		end
		_tickTock = _tickTock * -1;
	end
end

function Lua_703138_Skill_VoodooEddy()--625478巫毒漩渦 持續傷害
	DebugMsg( 0 , 0 , "Lua_703138_Skill_VoodooEddy");
	local _ownerID = OwnerID();--施法者
	local _targetID = TargetID();--受害者

	local _voodooEddyGUID = 851667;--巫毒漩渦 傷害
	
	--CallPlot( _targetID , "Lua_703138_Skill_VoodooEddy_Loop" , 851667 );
	CallPlot( _targetID , "Lua_703138_Skill_VoodooEddy_Loop" , _voodooEddyGUID );

	return true;
end

function Lua_703138_Skill_VoodooEddy_Loop( _voodooEddyGUID )--巫毒漩渦 持續傷害
	DebugMsg( 0 , 0 , "Lua_703138_Skill_VoodooEddy_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;

	local x,y,z,dir = DW_Location( _ownerID );

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703138_AI_FINDCOVER]",0);--在 巫毒漩渦 爆炸之前 找到 闇影纏繞 的隊友以解除
	while ( CheckBuff( _ownerID , 625478 ) ) do
		DebugMsg( 0 , 0 , "巫毒漩渦 持續傷害 : ".._ownerID );
		SysCastSpellLv_Pos( _bossID , x,y,z , _voodooEddyGUID , Skill.Lv[_voodooEddyGUID][Cl_GetDiff(172)] );--851625負能量波
		
		Sleep( 30 );
	end
end

function Lua_703138_Skill_VoodooEddy_End()--巫毒漩渦 結束
	DebugMsg( 0 , 0 , "Lua_703138_Skill_VoodooEddy_End");
	
	return true;
end

--每3秒會對範圍75碼的其他玩家造成傷害，持續12秒，時間到以後會解除範圍75碼內的巫毒漩渦。
function Lua_703138_Skill_DarkTwining()--625479闇影纏繞

	local _ownerID = OwnerID();--施法者
	local _targetID = TargetID();--受害者

	DebugMsg( 0 , 0 , "Lua_703138_Skill_DarkTwining : ".._ownerID.."  : ".._targetID);

	local _darkTwiningGUID = 851668;--闇影纏繞 傷害
	
	--CallPlot( _targetID , "Lua_703138_Skill_DarkTwining_Loop" , 851668 );
	CallPlot( _targetID , "Lua_703138_Skill_DarkTwining_Loop" , _darkTwiningGUID );

	return true;
	
end

function Lua_703138_Skill_DarkTwining_Loop( _darkTwiningGUID )--闇影纏繞 持續傷害
	DebugMsg( 0 , 0 , "Lua_703138_Skill_DarkTwining_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;

	local x,y,z,dir = DW_Location( _ownerID );
	while ( CheckBuff( _ownerID , 625479 ) ) do
		DebugMsg( 0 , 0 , "闇影纏繞 持續傷害 : ".._ownerID );
		SysCastSpellLv_Pos( _bossID , x,y,z , _darkTwiningGUID , Skill.Lv[_darkTwiningGUID][Cl_GetDiff(172)] );--851625闇影纏繞
	
		Sleep( 30 );
	end
	
end

function Lua_703138_Skill_DarkTwining_End()--闇影纏繞 結束	--時間到以後會解除範圍75碼內的巫毒漩渦。
	DebugMsg( 0 , 0 , "Lua_703138_Skill_DarkTwining_End");
	local _ownerID = OwnerID();
	local _effectiveRange = 75;
	local _rangePlayerList = SearchRangePlayer( _ownerID , _effectiveRange );

	for _index , _playerID in pairs( _rangePlayerList ) do
		CancelBuff_NoEvent( _playerID , 625478 );--625478巫毒漩渦
	end
	
end
-----------------------------------------------------END---------------巫毒漩渦+闇影纏繞


-----------------------------------------------------------------------迴旋大砍刀
function Lua_703138_Skill_BigBlade()
	DebugMsg( 0 , 0 , "Lua_703138_Skill_BigBlade");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;
	local _bigBladeDamageSkillGUID = 851675;--851675 迴旋大砍刀傷害技能

	local _maxTarget = 2;
	local _availableTargetPlayer = Lua_RandomPlayerFromHateList( _bossID , _maxTarget , false ); --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦

	local x,y,z,dir = 0;
	local _cloneGUID = _gConsts._bladeGUID;--108899 迴旋大砍刀
	local _cloneID = 0;

	for _index , _playerID in pairs( _availableTargetPlayer ) do--在Boss位置創造丟刀的NPC
		x,y,z,dir = DW_Location( _bossID );
		_cloneID = _gConsts.ExtObj( _cloneGUID , x,y,z,dir );
		WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , 16 );

		x,y,z,dir = DW_Location( _playerID );
		CastSpellPos( _cloneID , x , y , z , 851680 , 1 );--飛刀特效
		CallPlot( _cloneID , "Lua_703138_Skill_CreateSpinningBlade" , _bigBladeDamageSkillGUID , _cloneGUID ,x,y,z , _roomID );
		DebugMsg( 0 , 0 , "--BossClone : ".._index);
	end

end

function Lua_703138_Skill_CreateSpinningBlade( _bigBladeDamageSkillGUID , _bladeGUID , x,y,z , _roomID )
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];

	Sleep( 20 );

	local _bladeID = _gConsts.ExtObj( _bladeGUID , x,y,z,dir );
	WriteRoleValue( _bladeID , EM_RoleValue_LiveTime , 16 );
	SetModeEx( _bladeID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _bladeID , EM_SetModeType_HideName , false );	--不顯示名稱
	SetModeEx( _bladeID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _bladeID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _bladeID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _bladeID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _bladeID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _bladeID , EM_SetModeType_Obstruct , false );	--無阻擋效果

	AddBuff( _bladeID , 625486 , 0 , -1 );--大砍刀特效
	CallPlot( _bladeID , "Lua_703138_Skill_BigBlade_Loop" , _bigBladeDamageSkillGUID );
	DebugMsg( 0 , 0 , "--大砍刀 : " );

end

function Lua_703138_Skill_BigBlade_Loop( _bigBladeDamageSkillGUID )
	DebugMsg( 0 , 0 , "Lua_703138_Skill_BigBlade_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;

	local x,y,z,dir = DW_Location( _ownerID );
	local _maxTime = 30;--施放15次
	local _currentTime = 1;
	while ( _currentTime <= _maxTime ) do
		--DebugMsg( 0 , 0 , "迴旋大砍刀 持續傷害 : ".._ownerID );
		SysCastSpellLv_Pos( _bossID , x,y,z , _bigBladeDamageSkillGUID , Skill.Lv[_bigBladeDamageSkillGUID][Cl_GetDiff(172)] );--108899迴旋大砍刀
		
		Sleep( 5 );
	end
	DelObj( _ownerID );
	
end
--------------------------------------------------------END------------迴旋大砍刀


-----------------------------------------------------------------------衝鋒
function Lua_703138_Skill_Rush()
	DebugMsg( 0 , 0 , "Lua_703138_Skill_Rush");
	local _bossID = OwnerID();
	local _maxTarget = 2;
	local _availableTargetPlayer = Lua_RandomPlayerFromHateList( _bossID , _maxTarget , false );

	for _index , _playerID in pairs( _availableTargetPlayer ) do
		CastSpellLV( _bossID , _playerID , 851663 , 0 );--851663衝鋒
	end
	return;
end

--------------------------------------------------------END------------衝鋒


--------------------------------------------------------------------------巫毒巨砍刀
--每20秒會投擲「巫毒巨砍刀」以及「電流圖騰」在場上隨機位置，持續時間15秒。
function Lua_703138_Skill_ThrowWoodooBlade()
	DebugMsg( 0 , 0 , "Lua_703138_Skill_ThrowWoodooBlade");
	
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;
	local _woodooBladeDamageSkillGUID = 851677;--851677巫毒巨砍刀傷害技能
	local _electricityTotemSkillGUID = 851678;--851678電流圖騰傷害技能

	local x,y,z,dir = DW_Location( _bossID );
	local _cloneGUID = _gConsts._bladeGUID;--108899透明球
	local _cloneID = 0;

	local _skills = { 	[_woodooBladeDamageSkillGUID] = "Lua_703138_Skill_CreateSpinningWoodooBlade",
 			[_electricityTotemSkillGUID] = "Lua_703138_Skill_CreateElectricityTotem"
		};

	local _targetX , _targetZ = 0;
	for _skillGUID , _functionName in pairs( _skills ) do--在Boss位置創造丟刀的NPC
		--丟刀NPC
		_cloneID = _gConsts.ExtObj( _cloneGUID , x,y,z,dir );--在Boss位置創造丟刀的NPC
		WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , 16 );
		SetModeEx( _cloneID , EM_SetModeType_Mark , false );	--不可點選
		SetModeEx( _cloneID , EM_SetModeType_HideName , false );	--不顯示名稱
		SetModeEx( _cloneID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
		SetModeEx( _cloneID , EM_SetModeType_Strikback , false );	--不會反擊
		SetModeEx( _cloneID , EM_SetModeType_Move , false );	--不會移動
		SetModeEx( _cloneID , EM_SetModeType_Fight , false );	--不可攻擊
		SetModeEx( _cloneID , EM_SetModeType_Searchenemy , false );	--不會索敵
		SetModeEx( _cloneID , EM_SetModeType_Obstruct , false );	--無阻擋效果

		_targetX = x + ( RandRange( 1 , 300 ) - 150 );
		_targetZ = z + ( RandRange( 1 , 300 ) - 150 );

		CastSpellPos( _cloneID , x , y , z , 851680 , 1 );--飛刀特效
		DebugMsg( 0 , 0 , "--BossClone : ".._skillGUID );
		CallPlot( _cloneID , _functionName , _skillGUID , _cloneGUID ,_targetX,y,_targetZ , _roomID );
	end

	return;
end

function Lua_703138_Skill_CreateSpinningWoodooBlade( _woodooBladeDamageSkillGUID , _bladeGUID ,x,y,z , _roomID )
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];

	Sleep( 20 );

	local _bladeID = _gConsts.ExtObj( _bladeGUID , x,y,z,dir );--巫毒巨砍刀
	WriteRoleValue( _bladeID , EM_RoleValue_LiveTime , 11 );
	SetModeEx( _bladeID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _bladeID , EM_SetModeType_HideName , false );	--不顯示名稱
	SetModeEx( _bladeID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _bladeID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _bladeID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _bladeID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _bladeID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _bladeID , EM_SetModeType_Obstruct , false );	--無阻擋效果

	AddBuff( _bladeID , 625486 , 0 , -1 );--625486迴旋(巫毒)大砍刀特效BUFF
	CallPlot( _bladeID , "Lua_703138_Skill_WoodooBlade_Loop" , _woodooBladeDamageSkillGUID );
	DebugMsg( 0 , 0 , "--巫毒巨砍刀 : ");
end

function Lua_703138_Skill_CreateElectricityTotem( _electricityTotemSkillGUID , _bladeGUID ,x,y,z , _roomID )
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];

	Sleep( 20 );

	local _totemID = _gConsts.ExtObj( _gConsts._electricityTotemGUID , x,y,z,dir );--電流圖騰
	WriteRoleValue( _totemID , EM_RoleValue_LiveTime , 11 );
	SetModeEx( _totemID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _totemID , EM_SetModeType_HideName , false );	--不顯示名稱
	SetModeEx( _totemID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _totemID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _totemID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _totemID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _totemID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _totemID , EM_SetModeType_Obstruct , false );	--無阻擋效果

	AddBuff( _totemID , 625495 , 0 , -1 );--625495電流圖騰特效
	CallPlot( _totemID , "Lua_703138_Skill_ElectricityTotem_Loop" , _electricityTotemSkillGUID );
	DebugMsg( 0 , 0 , "--電流圖騰 : ");
end



function Lua_703138_Skill_WoodooBlade_Loop( _woodooBladeDamageSkillGUID )
	DebugMsg( 0 , 0 , "Lua_703138_Skill_WoodooBlade_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;

	local x,y,z,dir = DW_Location( _ownerID );
	while ( true ) do
		--DebugMsg( 0 , 0 , "巫毒大砍刀 持續傷害 : ".._ownerID );
		SysCastSpellLv_Pos( _bossID , x,y,z , _woodooBladeDamageSkillGUID , Skill.Lv[_woodooBladeDamageSkillGUID][Cl_GetDiff(172)] );--851677巫毒巨砍刀傷害技能
		Sleep( 5 );
	end

end

function Lua_703138_Skill_ElectricityTotem_Loop( _electricityTotemSkillGUID )
	DebugMsg( 0 , 0 , "Lua_703138_Skill_ThrowWoodooBlade");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;
	local _effectiveRange = 75;

	--local _rangePlayerList = SearchRangePlayer( _ownerID , _effectiveRange );
	local x,y,z,dir = DW_Location( _ownerID );
	while ( true ) do
		--if ( #_rangePlayerList > 0 ) then
			DebugMsg( 0 , 0 , "電流圖騰 持續傷害 : ".._ownerID );
			--SysCastSpellLv_Pos( _bossID , x,y,z , _electricityTotemSkillGUID , 1 );--851678電流圖騰
			CastSpellLV( _ownerID , _ownerID , _electricityTotemSkillGUID ,Skill.Lv[_electricityTotemSkillGUID][Cl_GetDiff(172)]);--851678電流圖騰
		--end
		Sleep( 30 );
	end
end

function Lua_703138_Skill_ElectricityTotem_Hit()
	DebugMsg( 0 , 0 , "Lua_703138_Skill_ElectricityTotem_Hit");--當擊中BOSS時 將--625481鐵血狂傲取消
	local _ownerID = OwnerID();--施法者
	local _targetID = TargetID();--受害者

	CancelBuff_NoEvent( _ownerID , 625481 );--625481鐵血狂傲
	CancelBuff_NoEvent( _targetID , 625481 );--625481鐵血狂傲

	return true;
end

function Lua_703138_Skill_KillSelf()
	local OwnerID = OwnerID()
	KillID( OwnerID , OwnerID )
end

--------------------------------------------------------END------------巫毒巨砍刀