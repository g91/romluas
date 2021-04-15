--Auther : K.J. Aris
--Version : 13.10.18.14.05

--Z166	Z167	Z168
--Z30 dungen Boss	No.1
--Script	703110
--NPC 108432

function AI_703110_Init()--NPC 108432
	--basics
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location( _bossID );

	--local _bossRole = Christine.Role:new( _bossID );

	-------------------------------------------initialize settings
		--------------------------------------------------------public functions
		local _AddParasite , _ctrlID = AssignParasiteHost( _bossID );

		local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--衍生物(招喚物 或 長出來的東西)
			x,y,z,dir = DW_Location( _bossID );
			local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
			_AddParasite( _objID );
			AddToPartition( _objID , _roomID );
			return _objID;
		end
		-----------------------------------------------END------public functions

		--------------------------------------------------------value object settings
		_Z30D_Boss1_VO = {};--value object --global oriented
		--public variables
		_Z30D_Boss1_VO._bossID = _bossID;
		_Z30D_Boss1_VO._roomID = _roomID;
		_Z30D_Boss1_VO._bunkerID = 0;
		--_Z30D_Boss1_VO._oriPos = { "_x" = x , "_y" = y , "_z" = z , "_dir" = dir };

		_Z30D_Boss1_VO._battlePhase = 0;	--紀錄戰鬥階段	--0.一般戰鬥階段	
										--1.動作階段 ( 進入/跌出 Bunker )( 該階段只做表演動作   )		
										--2.Bunker戰鬥階段

		--_Z30D_Boss1_VO._one10thHP = ReadRoleValue( _bossID , EM_RoleValue_MaxHP )*0.1;
		_Z30D_Boss1_VO._ctrlID = _ctrlID;--中控器


		--public methods
		_Z30D_Boss1_VO.AddParasite = _AddParasite;	--衍生物件
		_Z30D_Boss1_VO.CreateDerivativeOnBoss = CreateDerivativeOnBoss;	--快速在BOSS附近創造物件

		-----------------------------------------------END------value object settings
	---------------------------------END-------initialize settings

end--function AI_703110_Init

function ResetSequence( _bossID )--重置流程
	DW_UnFight( _bossID , true );
	Lua_ObjDontTouch( _bossID , true );
	--Lua_WaitToMoveFlag( _bossID , FlagID , FlagNum , 0 );	--repositioning	--need a flag on stage
	DelFromPartition( _bossID );
	Sleep( 50 );
	AddToPartition( _bossID , _Z30D_Boss1_VO._roomID );--
	DW_UnFight( _bossID , false );
	Lua_ObjDontTouch( _bossID , false );

	_Z30D_Boss1_VO._ctrlID = 0;--clear central controller
	_Z30D_Boss1_VO._battlePhase = 0;--reset battle phase
end--function ResetSequence


function AI_703110_Engage()--NPC 108432

	--if ( not _Z30D_Boss1_VO ) then	
	--	DebugMsg(0,0,"-------Initialize");
		AI_703110_Init();--無法掛PLOT在初始階段   因此只好每次都做起始動作
	--end

	--_Z30D_Boss1_VO._bossID = OwnerID();

	local _bossID = _Z30D_Boss1_VO._bossID;
	local _roomID = _Z30D_Boss1_VO._roomID;
	local _ctrlID = _Z30D_Boss1_VO._ctrlID;
	local x,y,z,dir = DW_Location( _bossID );

	
	
	------ignition sequence
	--start fight
	BeginPlot( _ctrlID , "AI_703110_BattleLoop" , 0 );

	--阻擋門
		--##

	--create bunker
	local _bunkerAvatarID = 108433;--武裝邦卡

	local _bunkerID = _Z30D_Boss1_VO.CreateDerivativeOnBoss( _bunkerAvatarID , x , y , z , dir );
	DW_UnFight( _bunkerID , true );	--一開始不戰鬥	for test
	Lua_ObjDontTouch( _bunkerID , true );	--一開始不戰鬥	for test
		
	_Z30D_Boss1_VO._bunkerID = _bunkerID;

	--DW_UnFight( _Z30D_Boss1_VO._bunkerID , false );	--開啟BUNKER戰鬥	(正式流程)
	--Lua_ObjDontTouch( _Z30D_Boss1_VO._bunkerID , false );	

end--function AI_703110_Engage

function AI_703110_BattleLoop()--NPC 108432
	local _bossID = _Z30D_Boss1_VO._bossID;
	local _bunkerID = _Z30D_Boss1_VO._bunkerID;
	local _roomID = _Z30D_Boss1_VO._roomID;
	local _ctrlID = _Z30D_Boss1_VO._ctrlID;
	--------------variables
	local _bossHpRatio = 0;--計算目前HP比值	(每扣10%血，利索姆姆會進入武裝邦卡內進行戰鬥。)
	local _HpStepping = 0.9;

	local _clock = 0;
	--------------variables

	DebugMsg(0,0,"-----------Combat Loop Started");
	while true do 
		-------------------------------------------------戰鬥結束條件
		Sleep( 10 );
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss 死亡時中斷戰鬥迴圈
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			break;
		end
		-------------------------------------END--------戰鬥結束條件

		
		
		--------------------------------------------------一般戰鬥階段	
		if ( _Z30D_Boss1_VO._battlePhase == 0 ) then	--0.一般戰鬥階段	1.動作階段 ( 進入/跌出 Bunker )	2.Bunker戰鬥階段
			--技能組合一

			-----------------------------------------------戰鬥階段轉換
			_bossHpRatio = ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP );--HP ratio
			if ( _bossHpRatio <= _HpStepping ) then--扣血超過10%觸發
				if ( _HpStepping > 0 ) then
					_HpStepping = _bossHpRatio - 0.1;
					DebugMsg( 0 , 0 , "Next Ratio : ".._HpStepping );
					BeginPlot( _ctrlID , "AI_703110_SwitchToBunkerFight" , 0 );--進入動作 後 切換成BUNKER戰鬥	
				end
			end
			-------------------------------------END-----戰鬥階段轉換
		end
		--------------------------------------END---------一般戰鬥階段




		--------------------------------------------------bunker戰鬥階段
		--in the bunker
		if ( _Z30D_Boss1_VO._battlePhase == 2 ) then	--0.一般戰鬥階段	1.動作階段 ( 進入/跌出 Bunker )	2.Bunker戰鬥階段
			--技能組合二
			--do something bunker
			--DebugMsg(0,0,"----bunker fighting.");

			
			--reset to phase 1 after bumbing by 3 missiles 
			sleep( 50 );--測試   5秒後讓他回到一般戰鬥階段
			BeginPlot( _ctrlID , "AI_703110_SwitchToOrdinaryFight" , 0 );--測試   5秒後讓他回到一般戰鬥階段
			
		end
		--------------------------------------END---------bunker戰鬥階段

		_clock = _clock + 1;
	end--end while
	DebugMsg(0,0,"-----------Combat Loop End");
	--刪除阻擋門
	ResetSequence( _bossID );

end--function AI_703110_BattleLoop




function AI_703110_SwitchToBunkerFight()--進入BUNKER動作
	DebugMsg(0,0,"----Switch to bunker fighting");
	_Z30D_Boss1_VO._battlePhase = 1; --寫為動作階段
	--進入BUNKER動作
		--跑到bunker位置
		--hide	( Caution : player AE )	
		--lock HP
		--##
	--delay
		--##
	--切換成BUNKER戰鬥(無敵)
	DW_UnFight( _Z30D_Boss1_VO._bunkerID , false );	--開啟BUNKER戰鬥	for test
	Lua_ObjDontTouch( _Z30D_Boss1_VO._bunkerID , false );	
	_Z30D_Boss1_VO._battlePhase = 2;--bunker mode
end--function AI_703110_SwitchToBunkerFight

function AI_703110_SwitchToOrdinaryFight()--跌出BUNKER動作
	DebugMsg(0,0,"----Switch to ordinary fighting");
	_Z30D_Boss1_VO._battlePhase = 1; --寫為動作階段
	--跌出BUNKER動作
		--##
	--delay
		--##
	--切換成一般戰鬥
	DW_UnFight( _Z30D_Boss1_VO._bunkerID , true );	--關閉BUNKER戰鬥	for test
	Lua_ObjDontTouch( _Z30D_Boss1_VO._bunkerID , true );	
	_Z30D_Boss1_VO._battlePhase = 0;--一般戰鬥

end--function AI_703110_SwitchToOrdinaryFight