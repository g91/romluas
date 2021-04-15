--Author : K.J. Aris
--Version : 140528
--Ignitor : none
--Script : 703187

local _Lua_703187_AI_GlobalVars = nil;

--Z34B3的招喚小隊   由ServerScript 703177呼叫
function Lua_703187_SquadCreater( _masterID )--It's a Closure
	local _squads = {};
	local _maxSquad = -1;
	local _masterID = _masterID or OwnerID();
	local function CreateSquad()
		if ( #_squads < _maxSquad or _maxSquad <= -1 ) then
			DebugMsg( 0 , 0 , "--CreateSquad _squadNum : "..#_squads );	
			local _squad = Lua_703187_AI_Init( _masterID , #_squads );
			table.insert( _squads , _squad );
		else
			DebugMsg( 0 , 0 , "--Squad Maxinum Reached : "..#_squads );
			return
		end	
	end

	return _squads , CreateSquad;
end

function Lua_703187_AI_Init( _masterID , _squadNum )--controller  
	DebugMsg( 0 , 0 , "--Lua_703187_AI_Init : Z34B1_Squad      V 140606  MasterID : ".._masterID.." : ".._squadNum );
	local _ctrlID = _masterID;

	-------------------------------------------initialize settings
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );

	local _difficulty = 1;
	local _frenzyCD = 9999999;--狂暴參數

	if ( _zoneID == 179 ) then
		_difficulty = 2;
		_frenzyCD = 480;
	end

	if ( _zoneID == 180 ) then
		_difficulty = 3;
		_frenzyCD = 360;
	end
	---------------------------------------

	----------------------------END----------狂暴參數
	--請依難易度順序放置
	local _bossFearGUIDs = { 109157 , 109167 , 109172 };--恐懼幻象
	local _bossEvilGUIDs = { 109158 , 109168 , 109173 };--邪能幻象
	local _bossShadowGUIDs = { 109159 , 109169 , 109174 };--暗影幻象

	--參數設定表
	if ( _Lua_703187_AI_GlobalVars == nil ) then _Lua_703187_AI_GlobalVars = {}; end
	if ( _Lua_703187_AI_GlobalVars[ _roomID ] == nil ) then _Lua_703187_AI_GlobalVars[ _roomID ] = {}; end
	_Lua_703187_AI_GlobalVars[ _roomID ][ _squadNum ] = {	--non 
					_masterID = _masterID , 
					_bossID = 0 ,--以_Fear做代表( 讓其他函式好找 _bossID)

					_bossVOs = {
						_Fear = {
							_id = 0,
							_guid = _bossFearGUIDs[ _difficulty ] ,
							_flagPos = 4 , 					--旗標位置

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = nil ,	--function個別的特殊流程
							},	
									
						_Evil = {
							_id = 0,
							_guid = _bossEvilGUIDs[ _difficulty ] ,
							_flagPos = 5 , 					--旗標位置

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = Lua_703187_Skill_Evil_Spec ,	--function個別的特殊流程
							},

						_Shadow = {
							_id = 0,
							_guid = _bossShadowGUIDs[ _difficulty ],
							_flagPos = 6 , 					--旗標位置

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = Lua_703187_Skill_Shadow_Spec ,	--function個別的特殊流程
							},
						},

					_roomID = _roomID ,
					_ctrlID = 0 ,
					_ctrlGUID = 108705 ,--控制器ID

					_flagGUID = 781425 , --781425 Z34_3王用旗標

					ExtObj = nil , 
					DelExtObjs = nil , 

					_genuineBodySwitchCD = 5 ,--每五秒切換真身

					};
	--唯讀資訊
	local _gConsts = _Lua_703187_AI_GlobalVars[ _roomID ][ _squadNum ];

	--產生 Boss
	local _masterHP = ReadRoleValue( _masterID , EM_RoleValue_HP );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703187_GenerateBoss( _bossVO , _roomID , _squadNum );
		_gConsts._bossVOs[ _bossName ]._id = _bossID;--
		WriteRoleValue( _bossID , EM_RoleValue_HP , _masterHP );--HP跟master一樣
		LockHP( _bossID , _masterHP , "" );
	end

	_gConsts._bossID = _gConsts._bossVOs._Fear._id;--presiding Boss --_Fear
		
	return _gConsts._bossVOs;
end--function Lua_703187_AI_Init( _inputCtrID )

function Lua_703187_GenerateBoss( _bossVO , _roomID , _squadNum )
	--Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703187_AI_GlobalVars[ _roomID ][ _squadNum ];
	local _bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	AddToPartition( _bossID , _roomID ); 

	CastSpell( _bossID , _bossID , 851912 );

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );

	WriteRoleValue( _bossID , EM_RoleValue_PID , _squadNum );--將小隊編號寫入NPC身上 以方便取值
	WriteRoleValue( _bossID , EM_RoleValue_Register1 , _bossVO._masterID );--將小隊編號寫入NPC身上 以方便取值

	--Lua_703187_AI_Count( _gConsts._masterID , 1 );--紀錄場上小怪數量 +1 -1

	--DebugMsg( 0 , 0 , "--NpcID : ".._bossID );
	
	return _bossID;
end--function Lua_703187_GenerateBoss( _bossVO )

function Lua_703187_ClearAll( _specRoomID )--for test
	if ( _Lua_703187_AI_GlobalVars ~= nil ) then
		--DebugMsg( 0 , 0 , "--Lua_703187_ClearAll : all values will be cleared , reinit this by redeploying NPC 109084" );--
		local function ClearData( _valuePack )
			if ( _valuePack.DelExtObjs ~= nil ) then
				_valuePack.DelExtObjs();
			end

			for _bossName , _bossVO in pairs( _valuePack._bossVOs ) do
				DelObj( _bossVO._id );
			end

			DelObj( _valuePack._ctrlID );
		end

		if ( _specRoomID ~= nil ) then
			local _squadPack = _Lua_703187_AI_GlobalVars[ _specRoomID ];
			if ( _squadPack ~= nil ) then
				for _squadNum , _valuePack in pairs( _squadPack ) do--清除每一個小隊的數據包
					ClearData( _valuePack );
				end
			end
			_Lua_703187_AI_GlobalVars[ _specRoomID ] = nil;
			return;
		end

		for _roomID , _squadPack in pairs( _Lua_703187_AI_GlobalVars ) do
			
			for _squadNum , _valuePack in pairs( _squadPack ) do--清除每一個小隊的數據包
				ClearData( _valuePack );
			end

			_Lua_703187_AI_GlobalVars[ _roomID ] = nil;
		end
	end
end--function Lua_703187_ClearAll()

function Lua_703187_AI_reignite( _specRoomID , _masterID , _squadNum )--for test
	--DebugMsg( 0 , 0 , "--Lua_703187_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703187_ClearAll( _roomID );
	Lua_703187_AI_Init( _masterID , _squadNum );
end


function Lua_703187_AI_onFight()--當有多隻王時 只放在其中一隻身上  模板請設"群組"
	--戰鬥初始
	local _bossID = OwnerID();--_Domisource
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local _squadNum = ReadRoleValue( _bossID , EM_RoleValue_PID );
	local _masterID = ReadRoleValue( _bossID , EM_RoleValue_Register1 );
	--DebugMsg( 0 , 0 , "--Lua_703187_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703187_AI_GlobalVars == nil ) then Lua_703187_AI_reignite( _roomID , _masterID , _squadNum ); return; end

	local _gConsts = _Lua_703187_AI_GlobalVars[ _roomID ][ _squadNum ];

	if ( _gConsts == nil ) then Lua_703187_AI_reignite( _roomID , _masterID , _squadNum ); return; end

	DebugMsg( 0 , 0 , "--Engage Msg : ".._roomID.." : ".._squadNum.." : ".._masterID );

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--當上一次循環的控制器還在作動時則不動作  (防止_Shadow重生時重複觸發戰鬥)
		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--控制器與衍伸物件
	local _ctrlID , _AddParasite , _RemoveParasites = Lua_703182_ExtendObjectClosure( _bossID );

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

	--唯讀資訊

	CallPlot( _ctrlID , "Lua_703187_AI_Engage" , _roomID , _squadNum , _masterID );--啟動戰鬥流程

	--ScriptMessage(_bossID,0,2,"[Lua_703187_AI_OnFight]",0);

end--function Lua_703187_AI_onFight()

function Lua_703187_AI_Engage( _roomID , _squadNum , _masterID )
	DebugMsg( 0 , _roomID , "--Lua_703187_AI_Engage : ".._roomID.." : ".._squadNum.." : ".._masterID );
	local _gConsts = _Lua_703187_AI_GlobalVars[ _roomID ][ _squadNum ];
	local _bossID = _gConsts._ctrlID;--_gConsts._bossID;--take ctrl as boss , because there's no guarantee that presiding Boss is always alive
	local _bossVOs = _gConsts._bossVOs;--there's 3 bosses in there
	local _ctrlID = _gConsts._ctrlID;
	
	--Routines Vars
	local _clock = 0;

	--Routines Vars
	
	local _timeTick = 1;--Time Speed
	local _miniTimeTick = _timeTick*10;--Time Speed for Sleep

	local _GCD = _gConsts._genuineBodySwitchCD;
	_GCD = 0;

	DebugMsg( 0 , 0 , "--Start loop" );

	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );
		--------------END---clock
		
		--------------------Routines
		--------------END---Routines

		-------------------------------------------------Timers
		if ( _GCD > 0 ) then _GCD = _GCD - _timeTick; end
		---------------------------------------END-------Timers
	
		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 
			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉
			
			--切換真身
			Lua_703187_GenuineBodySwitch( _gConsts );
			_GCD = _gConsts._genuineBodySwitchCD;
			
		end--for --switch case simulation

	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
end--function Lua_703187_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values

-----------------------------------sub functions
function Lua_703187_GenuineBodySwitch( _gConsts )
	local _bossID = 0;
	local _genuineBodyBuffGUID = 625978;--625978魔幻殘影
	local _phantomBuffGUID = 625979;--625979幻象

	local _maxPhantoms = 3;--#_gConsts._bossVOs;
	local _randomNum = RandRange( 1 , _maxPhantoms );--隨機選一個真身

	DebugMsg( 0 , 0 , "--Lua_703187_GenuineBodySwitch : ".._randomNum );
	local _counter = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = _bossVO._id;
		CancelBuff_NoEvent( _bossID , _genuineBodyBuffGUID );--625978魔幻殘影
		CancelBuff_NoEvent( _bossID , _phantomBuffGUID );--625979幻象

		_counter = _counter + 1;
		if ( _counter == _randomNum ) then --當是選中的對象時
			AddBuff( _bossID , _genuineBodyBuffGUID , 0 , -1 );--625978魔幻殘影
		else
			AddBuff( _bossID , _phantomBuffGUID , 0 , -1 );--625979幻象
		end

	end
end
------------------------------------------------------------------------------------------------個別王的特殊處理程序

---------------------------------------------------------------------END------------------------個別王的特殊處理程序	

------------------------------------------------------------------------------------------以下是技能
function Lua_703187_Skill_PhantomAttacked()--幻影被攻擊 --BOSS補血
	local _ownerID = OwnerID();
	--local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	--local _gConsts = _Lua_703187_AI_GlobalVars[ _roomID ];
	
	local _squadNum = ReadRoleValue( _ownerID , EM_RoleValue_PID );--小隊編號
	local _masterID = ReadRoleValue( _ownerID , EM_RoleValue_Register1 );--

	local _spellGUID = 852045;--852045幻象連結治癒
	DebugMsg( 0 , 0 , "--Lua_703187_Skill_PhantomAttacked : ".._masterID.." : ".._spellGUID );
	SysCastSpellLv( _ownerID , _masterID , _spellGUID , 0 );--852045幻象連結治癒
	
end

function Lua_703187_Skill_GenuineAttacked()--真身被攻擊 --BOSS扣血
	local _ownerID = OwnerID();
	--local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	--local _gConsts = _Lua_703187_AI_GlobalVars[ _roomID ];

	local _squadNum = ReadRoleValue( _ownerID , EM_RoleValue_PID );--小隊編號
	local _masterID = ReadRoleValue( _ownerID , EM_RoleValue_Register1 );--

	local _spellGUID = 852046;--852046幻象連結傷害
	DebugMsg( 0 , 0 , "--Lua_703187_Skill_GenuineAttacked : ".._masterID.." : ".._spellGUID );
	SysCastSpellLv( _ownerID , _masterID , _spellGUID , 0 );--852046幻象連結傷害

end