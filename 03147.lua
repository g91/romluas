--Author : K.J. Aris
--Version : 14.02.25.
--Ignitor : 108909
--NPC : 108909--raid
--Script : 703147

local _Lua_703147_AI_GlobalVars = {};

function Lua_703147_AI_Init( _inputCtrID )--controller  NPC 108909 --Note : this NPC is using as a ignitor
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Init : NPC 108909       Z33-2B2  V140225 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --以防重複執行 將原有控制器刪除

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108909
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108814
	
	--this NPC is using as a controller
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
	local _frenzyCD = 480;--狂暴參數

	if ( _zoneID == 176 ) then
		_difficulty = 2;
		_frenzyCD = 360;
	end

	if ( _zoneID == 177 ) then
		_difficulty = 3;
		_frenzyCD = 9999999;
	end
	---------------------------------------

	----------------------------END----------狂暴參數
	
	--請依難易度順序放置
	local _bossCornowaGUIDs = { 108825 , 103769 , 103771 };--科諾瓦
	local _bossOsokenGUIDs = { 108826 , 103770 , 103772 };--奧索肯
	local _ballOfSoulGUIDs = { 109069 , 109070 , 109071 };--靈魂之球

	local _treasureBoxGUIDs = { 106289 , 108835 , 108836 };--實驗虛寶

	--參數設定表	
	_Lua_703147_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossVOs = {
						_Osoken = {	-- 奧索肯
							_id = 0 ,
							_guid = _bossOsokenGUIDs[ _difficulty ] ,
							_flagPos = 1 , 
							IndiSpec = Lua_703147_AI_IndividualSpec_Osoken
							} , 

						_Cornowa = {	-- 科諾瓦
							_id = 0 ,
							_guid = _bossCornowaGUIDs[ _difficulty ] ,
							_flagPos = 2 , 
							IndiSpec = Lua_703147_AI_IndividualSpec_Cornowar
							} , 
						} , 

					_ballOfSoulGUID = _ballOfSoulGUIDs[ _difficulty ] ,	-- 靈魂之球

					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 106012 , 	-- 門ID
					_treasureBoxGUID = _treasureBoxGUIDs[ _difficulty ] ,--實驗虛寶

					_phase2BuffGUID = 625553,	-- 奧索肯之怒 (625553)	戰鬥第二階段的標示BUFF

					_flagGUID = 781416 , --781416 Z33-2_2王用旗標

					_frontDoorFlagPos = 3 , 
					_backDoorFlagPos = 4 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,
					};
	--唯讀資訊
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];

	--產生 Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703147_GenerateBoss( _bossVO , _roomID );
		_gConsts._bossVOs[_bossName]._id = _bossID;--_Cornowa
	end
	_gConsts._bossID = _bossID;--presiding boss 

	--產生後門
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
---	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--delete trigger
	DelObj( _ctrlID );

	return _roomID;
end--function Lua_703147_AI_Init( _inputCtrID )

function Lua_703147_ClearAll()--for test	刪除所有相關物件 ( 科諾瓦、奧索肯、中控器、前門、後門 )
---	DebugMsg( 0 , 0 , "--Lua_703147_ClearAll : all values will be cleared , reinit this by redeploying NPC 108909" );--
	if ( _Lua_703147_AI_GlobalVars ~= nil ) then
		for _roomID , _valuePack in pairs( _Lua_703147_AI_GlobalVars ) do
			if ( _valuePack.DelExtObjs ~= nil ) then
				_valuePack.DelExtObjs();
			end

			for _bossName , _bossVO in pairs( _valuePack._bossVOs ) do
				DelObj( _bossVO._id );
			end
			DelObj( _valuePack._ctrlID );
			DelObj( _valuePack._frontDoorID );
			DelObj( _valuePack._backDoorID );
			_Lua_703147_AI_GlobalVars[ _roomID ] = nil;
		end
	end
end--function Lua_703147_ClearAll()

function Lua_703147_GenerateBoss( _bossVO , _roomID )	-- 生成 Boss
	Lua_DavisDelObj( _bossVO._guid );	-- 防呆，刪除區域內指定編號的 Npc
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	local _bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );	-- 阻擋
	SetModeEx( _bossID , EM_SetModeType_Fight , true );	-- 戰鬥
	SetModeEx( _bossID , EM_SetModeType_Move , true );	-- 移動
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );	-- 索敵
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );	-- 反擊

	return _bossID;
end--function Lua_703147_GenerateBoss( _bossVO )

function Lua_703147_CornowaInitSetting()--on NPC 108818	科諾瓦 起始劇情
	local _ownerID = OwnerID();
---	DebugMsg( 0 , 0 , "--Lua_703147_CornowaInitSetting ".._ownerID );
	AddBuff( _ownerID , 625549 , 0 , -1 );--鎖MP SP回復
	WriteRoleValue( _ownerID , EM_RoleValue_MaxMP , 100 );
	WriteRoleValue( _ownerID , EM_RoleValue_MP , 0 );--SP歸0

	Cl_Resist_HackersBossNum();
end

function Lua_703147_AI_reignite( _specRoomID )--for test	刪除所有物件、並重新建立所有物件
---	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703147_ClearAll();
	Lua_703147_AI_Init();
end

function Lua_703147_AI_onFight()--_Cornowa 科諾瓦戰鬥劇情
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );

---	DebugMsg( 0 , 0 , "--Lua_703147_AI_onFight ".._bossID.." RID : ".._roomID );

	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703147_AI_reignite( _roomID ); return; end

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--當上一次循環的控制器還在作動時則不動作  (防止_Schulize重生時重複觸發戰鬥)
---		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--控制器與衍伸物件
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--衍生物(處理招喚物 或 長出來的東西)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	WriteRoleValue( _ctrlID , EM_RoleValue_Register1 , 1 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

---	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );
	--唯讀資訊
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703147_AI_Engage" , 0 );

	ScriptMessage(_bossID,0,2,"[LUA_703147_AI_ONFIGHT]",0);	-- 魔法噴出的寒氣瀰漫著四周，令人不寒而慄。
	CallPlot( _bossID , "Cl_Resist_HackersFightBegin" );
end--function Lua_703147_AI_onFight()

function Lua_703147_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Engage" );
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._ctrlID;--_gConsts._bossID;--there's no guarantee that presiding boss is always alive
	local _bossVOs = _gConsts._bossVOs;--there's 2 bosses in there
	local _ctrlID = _gConsts._ctrlID;

	local _bossOsokenID = _bossVOs._Osoken._id;
	local _bossCornowaID = _bossVOs._Cornowa._id;

	local _phase2BuffGUID = _gConsts._phase2BuffGUID;
	--Routines Vars
	local _clock = 0;

	local _engaging = true;
	local _allBossAreDead = false;
	--Routines Vars
		--Lua_RandomPlayerFromHateList
	
	local _timeTick = 1;--Time Speed
	local _miniTimeTick = _timeTick*10;--Time Speed for Sleep
	
	local _GCD = 5;
	local _CD = {
--		_skillAeCD = _gConsts._skillAeCD ,
--		_skillBladeCD = _gConsts._skillBladeCD ,
--		_skillChaosConvolutionCD = _gConsts._skillChaosConvolutionCD ,
--		_skillChargeCD = _gConsts._skillChargeCD ,
--		_skillIronBloodCD = _gConsts._skillIronBloodCD ,
--		_skillThrowCD = _gConsts._skillThrowCD ,
		}

	-----------------------------------------狂暴參數
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;
	----------------------------END----------狂暴參數

---	DebugMsg( 0 , 0 , "--Start loop" );
	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );
		--------------END---clock

		--------------------Routines
		--------------END---Routines

		-------------------------------------------------戰鬥結束條件
		_allBossAreDead = true;--假設所有BOSS皆陣亡
		_engaging = false;--假設所有BOSS都脫離戰鬥
		for _bossName , _bossVO in pairs( _bossVOs ) do--檢查Boss有沒有通通活蹦亂跳
			_currentBossID = _bossVO._id;
			if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 ) then--當有任一BOSS存活時 代表還未全死
				_allBossAreDead = false;
				_bossVO.IndiSpec( _bossVO , _clock );--趁還活著的時候  順便執行個別的特殊流程
				if( ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) ~= 0 ) then--當有任一BOSS仍在戰鬥 代表還有玩家存活 
					--DebugMsg(0,0,_currentBossID.." 正在追殺玩家 : "..ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) );
					_engaging = true;
				end	
			else
				--DebugMsg( 0 , 0 , "------dead boss : ".._bossName );
				--有BOSS死了  順便設定亡者復活CD

			end
		end

		if ( _allBossAreDead == true ) then-- boss 全部死亡時 挑戰成功
---			DebugMsg(0,0,"------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703147_AI_Conquered( _roomID );	-- 生成寶箱，並刪除門等物件
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗
---			DebugMsg( 0 , 0 , "--all players are gone , quit fighting "..tostring(_engaging) );
			--Lua_703147_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
			Lua_703147_AI_Reset( _roomID );
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
				for _bossName , _bossVO in pairs( _bossVOs ) do
					_currentBossID = _bossVO._id;
					AddBuff( _currentBossID , 625849 , 0 , -1 );-- 625849 神棄
				end
				
			--	DebugMsg( 0 , 0 , "-----狂狂暴----" );
				ScriptMessage( _bossID , 0 , 2 , "[LUA_703147_AI_FRENZY]" , 0 );	-- 身為一個大死靈師是不會浪費任何一具屍體的，現在他將結束一切。
		end		

		---------------------------------------------------階段轉換
		-- 當科諾瓦被擊殺或是奧索肯HP低於40%時進入第二階段。
		if ( CheckBuff( _bossOsokenID , _phase2BuffGUID ) == false ) then--當未進入第二階段時才判定
			local HpRatio = ReadRoleValue( _bossOsokenID, EM_RoleValue_HP ) / ReadRoleValue( _bossOsokenID, EM_RoleValue_MaxHP );
			if not CheckID( _bossCornowaID ) or ReadRoleValue( _bossCornowaID , EM_RoleValue_IsDead ) == 1 or ( CheckID( _bossOsokenID ) and HpRatio < 0.4 ) then
				--加上第二階段的Buff
				AddBuff( _bossOsokenID , _phase2BuffGUID , 0 , -1 );
			--	DebugMsg( 0 , 0 , "--第二階段" );
				if HpRatio > 0 then
					ScriptMessage( _bossID , 0 , 2 , "[LUA_703147_AI_PHASE2]" , 0 );	-- 竟然能把[108826]逼到這個地步，看來他要氣炸了！
				end
			end
		end
		-------------------------------------END---------階段轉換
		
		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 
			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉


			--[[
			if( _CD._timer2 <= 0 )then
---				DebugMsg( 0 , 0 , "--_timer2 release" );
				_CD._timer2 = 15;
				_GCD = 2;
			end

			if( _CD._timer3 <= 0 )then
---				DebugMsg( 0 , 0 , "--_timer3 release" );
				_CD._timer3 = 20;
				_GCD = 2;
			end

			if( _CD._timer4 <= 0 )then
---				DebugMsg( 0 , 0 , "--_timer4 release" );
				_CD._timer4 = 25;
				_GCD = 2;
			end
			]]--
			
		end

	end--while
---	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703147_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703147_AI_Reset( _roomID )
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Reset" );

	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	local _bossVOs = _gConsts._bossVOs;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中

	local Osoken = _gConsts._bossVOs._Osoken._id;
	if CheckID( Osoken ) and ReadRoleValue( Osoken, EM_RoleValue_Hp ) > 0 then
		ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[LUA_703147_AI_RESET]",0);	-- 冷覷一眼，[108826]又繼續著他的實驗工作。
	end

	Delobj( _frontDoorID );	--刪除前門
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 10 );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--關閉戰鬥
		_bossID = _bossVO._id;
		DW_UnFight( _bossID , true );
		DelObj( _bossID );
	end
	Sleep( 10 );

	Delobj( _frontDoorID );	--刪除前門
	
	--_Lua_703147_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--開啟戰鬥
		_bossID = _bossVO._id;
		DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703147_GenerateBoss( _bossVO , _roomID );--重生對應的BOSS
	end

end--function Lua_703147_AI_Reset( _roomID )

function Lua_703147_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Conquered" );
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];--for read
	
	if( _gConsts == nil ) then return; end
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中

	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	--寶箱
	local x,y,z,dir = DW_Location( _gConsts._ctrlID );
	local _loot  = WY_Create_an_obj( _gConsts._treasureBoxGUID , x,y,z,dir );

	SetModeEx( _loot , EM_SetModeType_ShowRoleHead , false );
	
	SetModeEx( _loot , EM_SetModeType_Mark , true );	--不可點選
	SetModeEx( _loot , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( _loot , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _loot , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _loot , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _loot , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _loot , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _loot , EM_SetModeType_Obstruct , true );	--有阻擋效果

	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703147_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	Cl_Resist_HackersBossDead();
end--function Lua_703147_AI_Conquered( _roomID )

function Lua_703147_AI_Dead(Select)
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then return; end
	KillID( _ownerID , _ownerID );

	if Select == 2 then
		ScriptMessage( _ownerID, 0 , 2 , "[$MUTE]".."[LUA_703147_AI_CONQUERED]" , 0 );	-- [108826]不敢置信，但他確實感受到了「死亡」……
	end

	local _bossVOs = _gConsts._bossVOs;
	local _allBossAreDead = true;
	local _currentBossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--檢查Boss有沒有通通活蹦亂跳
		_currentBossID = _bossVO._id;
		if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 and _currentBossID ~= _ownerID ) then--當有任一BOSS存活時 代表還未全死
			_allBossAreDead = false;
		end
	end
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Dead : "..tostring( _allBossAreDead ) );

	if ( _allBossAreDead ) then
		Lua_703147_AI_Conquered( _roomID );
	end

	return true;
end
-----------------------------------sub functions


------------------------------------------------------------------------------------------------個別王的特殊處理程序	在MAINLOOP執行時被掃描
function Lua_703147_AI_IndividualSpec_Osoken( _bossOsokenVO , _clock )-- _Osoken 奧索肯
	--local _bossID = _bossOsokenVO._id;
end

function Lua_703147_AI_IndividualSpec_Cornowar( _bossCornowaVO , _clock )-- _Cornowa 科諾瓦	每秒執行 1 次
	local _bossID = _bossCornowaVO._id;
	local _spRatio = ReadRoleValue( _bossID , EM_RoleValue_MP )/ReadRoleValue( _bossID , EM_RoleValue_MaxMP );

	
	if ( _spRatio <= 0  ) then--能量不足   
		local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
		local _gConsts = _Lua_703147_AI_GlobalVars[_roomID];
		local _osokenID = _gConsts._bossVOs._Osoken._id;
		AddBuff( _bossID , 625566 , 0 , -1 );--625566充能請求
		AddBuff( _osokenID , 625566 , 0 , -1 );--625566充能請求
	--	DebugMsg( 0, 0, "Hao 奧索肯Mp歸零 請求充能" )
	end

	--當精力值超過100% 施展 --851890靈值重荷
	if ( _spRatio >= 1.0  ) then
		AddBuff( _bossID , 625550 , 0 , -1 );--625550處以極刑施放印記 --回收再利用真環保
		--return;
	end

	local _rangePlayer = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 50 , true );--怪力碎擊
	if ( #_rangePlayer >= 4 ) then--當身邊聚集4個（含）以上的玩家時施放，法術傷害，並且消耗65精力。
		AddBuff( _bossID , 625551 , 0 , -1 );--625551殘忍王儲敕令施放印記 ----回收再利用真環保
	end
end
------------------------------------------------------------------------------------END---------個別王的特殊處理程序


------------------------------------------------------------------------------------------以下是技能
function Hao_IncreaseSpRatio( Obj, Ratio, String )	-- 調整 SP%　共用函式

	if String == nil or type(String) ~= "string" then
		String = "";
	end

	local Sp = ReadRoleValue( Obj, EM_RoleValue_MP );
	local MaxSp = ReadRoleValue( Obj, EM_RoleValue_MaxMP );
	local NowSpRatio = Sp / MaxSp;	-- 當前 SP 比率
	local SetSpRatio = NowSpRatio + Ratio;	-- 增加 SP 比率

	if SetSpRatio > 1 then
		SetSpRatio = 1;
	end

	local SetSp = MaxSp * SetSpRatio;
	DebugMsg( 0, 0, String..", NowSpRatio = "..string.format("%.2f", NowSpRatio)..", AddRatio = "..Ratio..", TotalSpRatio = "..string.format("%.2f", SetSpRatio) );
	WriteRoleValue( Obj, EM_RoleValue_MP, SetSp );
end
------------------------------------------------------------------------------Osoken
function Lua_703147_Skill_EnergyCharge()--充能
	local _ownerID = OwnerID();-- _Osoken
	local _targetID = TargetID();--_Cornowa
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_EnergyCharge : ".._ownerID.." : ".._targetID );

	if ReadRoleValue( _targetID, EM_RoleValue_IsDead ) == 1 or CheckID( _targetID ) then
		CancelBuff_NoEvent( _ownerID , 625566 );
		return true;
	end
	
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703147_AI_GlobalVars[_roomID];
	local _cornowaID = _gConsts._bossVOs._Cornowa._id;
	_targetID = _cornowaID;

	Hao_IncreaseSpRatio( _targetID, 0.5, "Energy Influx" )	-- 恢復 奧索肯 50% 精力
	CancelBuff_NoEvent( _ownerID , 625566 );
	CancelBuff_NoEvent( _targetID , 625566 );
	ScriptMessage( _ownerID , 0 , 2 , "[$MUTE]".."[LUA_703147_AI_ENERGIZING]" , 0 );	-- 魂能即將補充完畢！	
	return true;
end

function Lua_703147_Skill_DeadSpiritImpact()--死靈衝擊
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	--DebugMsg( 0 , 0 , "--Lua_703147_Skill_DeadSpiritImpact : ".._targetID );
	local _roomID = ReadRoleValue( _targetID , EM_RoleValue_RoomID );
	
	local _targetGUID = ReadRoleValue( _targetID , EM_RoleValue_OrgID );

	local _gConsts = _Lua_703147_AI_GlobalVars[_roomID];
	if ( _targetGUID == _gConsts._bossVOs._Cornowa._guid ) then
		Hao_IncreaseSpRatio( _targetID, 0.2, "Death Strike" )	-- 恢復 奧索肯 20% 精力
	end

	return true;
end

function Lua_703147_Skill_DarkShadow()--暗影傷害執行劇情
	local _ownerID = OwnerID();
	local _targetID = TargetID();
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_DarkShadow : ".._ownerID.." : ".._targetID );
	local _roomID = ReadRoleValue( _targetID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703147_AI_GlobalVars[_roomID];

	local _bossOsokenID = _gConsts._bossVOs._Osoken._id;
	SysCastSpellLv( _bossOsokenID , _bossOsokenID , 851905 , 0 );--851905暗影傷害

end

function Lua_703147_Skill_EvilSoul()--邪祟奪魄執行劇情
	local _ownerID = OwnerID();	-- Boss
	local _targetID = TargetID();
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_EvilSoul : ".._ownerID.." : ".._targetID );
	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 500 , true );
	local _maxTarget = 2;
	local _zoneID = ReadRoleValue( _ownerID , EM_RoleValue_ZoneID );
	if ( _zoneID == 175 ) then _maxTarget = 4; end--隨機4名玩家	普通、簡易版：2名

	if #_rangePlayerList > 0 then
		local _targetList = {};
		for i = 1, _maxTarget do
			table.insert( _targetList, table.remove( _rangePlayerList, math.random( #_rangePlayerList) ) );
			if #_rangePlayerList == 0 then
				break;
			end
		end

		for _index , _playerID in pairs( _targetList ) do
	---		DebugMsg( 0 , 0 , "------vistim :  ".._playerID );
			AddBuff( _playerID , 625827 , 0 , -1 );--625827邪祟奪魄
		end
	end
--	local _targetList = Lua_703147_RandomFromList( _rangePlayerList , 4 );
end

function Lua_703147_Skill_DeadlyJudgement()--斷魂裁決‧審判 執行劇情
	local _ownerID = OwnerID();
	local _targetID = TargetID();
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_DeadlyJudgement : ".._ownerID.." : ".._targetID );
	local x,y,z,dir = DW_Location( _targetID );

	SysCastSpellLv_Pos( _ownerID , x,y,z , 851907 , 1 );--851907斷魂裁決‧審判 傷害
	ScriptMessage( _ownerID , 0 , 2 , "[LUA_703147_AI_DEADLYJUDGEMENT]" , 0 );	-- 又到了審判的時刻，這次會是誰？
end

function Lua_703147_Skill_SoulBall()--靈魂之球 執行劇情

	local _ownerID = OwnerID();--Osoken
	local _targetID = TargetID();-- 仇恨表內隨機 1 名玩家

---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_SoulBall : ".._ownerID.." : ".._targetID );
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );

	--製造光球
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	local _ballOfSoulGUID = _gConsts._ballOfSoulGUID;
	local x,y,z,dir = DW_Location( _targetID );
	local _ballOfSoulID = _gConsts.ExtObj( _ballOfSoulGUID , x,y,z,dir );
	SetModeEx( _ballOfSoulID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _ballOfSoulID , EM_SetModeType_HideName , false );	--不顯示名稱
	SetModeEx( _ballOfSoulID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _ballOfSoulID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _ballOfSoulID , EM_SetModeType_Move , true );	--可移動
	SetModeEx( _ballOfSoulID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _ballOfSoulID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _ballOfSoulID , EM_SetModeType_Obstruct , false );	--無阻擋效果
	MoveToFlagEnabled( _ballOfSoulID, false );	-- 關閉巡邏劇情
	WriteRoleValue( _ballOfSoulID, EM_RoleValue_LiveTime, 30 );	-- 30秒生存時間

	CallPlot( _ballOfSoulID , "Lua_703147_Item_SoulBall_Spec" , _ballOfSoulID, _ownerID, _targetID );
end

function Lua_703147_Item_SoulBall_Spec( _ballOfSoulID, _masterID, _playerID )--靈魂之球 NPC --_masterID 球擁有者ID、追蹤玩家

	sleep( 10 );

	while ReadRoleValue( _masterID, EM_RoleValue_IsDead ) == 0 do
		if CheckID( _playerID ) and ReadRoleValue( _playerID, EM_RoleValue_IsDead ) == 0 then
			local playerPos = Vector_GetRolePos( _playerID );
			MoveDirect( _ballOfSoulID, playerPos.x, playerPos.y, playerPos.z );
		end
		SysCastSpellLv( _masterID, _ballOfSoulID, 851903, 0 );
		sleep( 10 );
	end
	DelObj( _ballOfSoulID );
end
-----------------------------------------------------------------------------------Cornowa
function Lua_703147_Skill_SoulGravity_End()--靈值重荷
	local _ownerID = OwnerID();
--	DebugMsg( 0 , 0 , "--Lua_703147_Skill_SoulGravity_End : ".._ownerID );
	CancelBuff_NoEvent( _ownerID , 625550 );
	return true;
end

function Hao_625559_EndUseLua()	-- 靈值重荷　結果Lua

	local Owner = OwnerID();
	local nowSpRatio = ReadRoleValue( Owner, EM_RoleValue_Mp )/ReadRoleValue( Owner, EM_RoleValue_MaxMp );
--	DebugMsg( 0, 0, "Hao 靈值重荷 AfterSpRatio = "..string.format( "%.2f" , nowSpRatio ) );
end

function Lua_703147_Skill_SoulSmash()--	_Cornowa --奪魄打擊
	--物理傷害，並回復10精力，若造成傷害的目標生命值高於30%，則每多10%，多回復5精力。
	local _ownerID = OwnerID();-- _Cornowa
	local _targetID = TargetID();--受害者
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_SoulSmash : ".._ownerID );
	local _targetHpRatio = ReadRoleValue( _targetID , EM_RoleValue_HP )/ReadRoleValue( _targetID , EM_RoleValue_MaxHP );
	if ( _targetHpRatio >= 0.4 ) then
		local bonusAddSp = Math.floor((_targetHpRatio-0.3)/0.1) * 0.05; 	-- 目標每多 10% 生命，額外加成 5 %精力
		Hao_IncreaseSpRatio( _ownerID, 0.1+bonusAddSp, " Seize Soul Attack" );
	end
	return true;
end

function Hao_851890_CheckUseScript()	-- 靈值重荷 檢查施放前的 Mp

	local Owner = OwnerID();
	local nowSpRatio = ReadRoleValue( Owner, EM_RoleValue_Mp )/ReadRoleValue( Owner, EM_RoleValue_MaxMp );
--	DebugMsg( 0, 0, "Hao 靈值重荷 nowSpRatio = "..string.format( "%.2f" , nowSpRatio ) );
	return true;
end

function Hao_851893_CheckUseScript()	-- 怪力碎擊 檢查施放前的 Mp

	local Owner = OwnerID();
	local nowSpRatio = ReadRoleValue( Owner, EM_RoleValue_Mp )/ReadRoleValue( Owner, EM_RoleValue_MaxMp );
--	DebugMsg( 0, 0, "Hao 怪力碎擊 nowSpRatio = "..string.format( "%.2f" , nowSpRatio ) );
	return true;
end

function Lua_703147_Skill_MonsterSmash_End()--怪力碎擊
	local _ownerID = OwnerID();
	--DebugMsg( 0 , 0 , "--Lua_703147_Skill_MonsterSmash_End : ".._ownerID );
	CancelBuff_NoEvent( _ownerID , 625551 );

	local nowSpRatio = ReadRoleValue( _ownerID, EM_RoleValue_Mp )/ReadRoleValue( _ownerID, EM_RoleValue_MaxMp );
--	DebugMsg( 0, 0, "Hao 怪力碎擊 AfterSpRatio = "..string.format( "%.2f" , nowSpRatio ) );
	return true;
end

function Lua_703147_Skill_MonsterCharge()
	local _ownerID = OwnerID();-- _Cornowa
	local _targetID = TargetID();
	AddBuff( _targetID , 625564 , 0 , 2 );--625564怪力衝擊標記
	SetAttack( _ownerID , _targetID );
	ScriptMessage( _ownerID , 0 , 2 , "[LUA_703147_AI_MONSTERCHARGE]" , 0 );	-- [108825]低聲怒吼，準備隨處衝撞！
end