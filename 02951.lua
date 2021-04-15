
function Lua_702951_DelDuplicateDoor( _doorID , _doorGUID )
	local _doorIDs = SearchRangeNPC( _doorID , 10 ); 

	local _npcGUID = 0;
	for _index , _npcID in pairs( _doorIDs ) do
		_npcGUID = ReadRoleValue( _npcID , EM_RoleValue_OrgID );
		if ( _npcGUID == _doorGUID and _npcID ~= _doorID ) then
			DelObj( _npcID );
		end
	end

	return;
end

function BY_28_Init()
	local _Boss=OwnerID( );
	local room=ReadRoleValue(_Boss,EM_RoleValue_RoomID);
	--出口阻擋門
	local _X,_Y,_Z,_Dir=1143.6,3545,1640.8,258.7;
	local _CtrlDoor_Exit=CreateObj(106247,_X,_Y,_Z,_Dir,1);
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Obstruct , true );	--有阻擋效果
	LockHP( _CtrlDoor_Exit , 100 , "" );--避免門被打到
	AddToPartition(_CtrlDoor_Exit,room);
	Lua_702951_DelDuplicateDoor( _CtrlDoor_Exit , 106247 );--避免門重複
	Cl_Resist_HackersBossNum();
	WriteRoleValue( _Boss , EM_RoleValue_Register10 , _CtrlDoor_Exit );--紀錄後門ID

	function BY_28_CreateAll()
		local _Boss=OwnerID( );
		local room=ReadRoleValue(_Boss,EM_RoleValue_RoomID);
		--入口阻擋門
		local _X,_Y,_Z,_Dir=1335.8,3544.5,917.3,74;--74
		local _CtrlDoor_Entrance=CreateObj(106247,_X,_Y,_Z,_Dir,1);--106249
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Mark , false );	--不可點選
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_HideName , true );	--不顯示名稱
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Strikback , false );	--不會反擊
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Move , false );	--不會移動
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Fight , false );	--不可攻擊
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Searchenemy , false );	--不會索敵
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Obstruct , true );	--有阻擋效果
		LockHP( _CtrlDoor_Entrance , 100 , "" );--避免門被打到
		AddToPartition(_CtrlDoor_Entrance,room);
		Lua_702951_DelDuplicateDoor( _CtrlDoor_Entrance , 106247 );--避免門重複
		local _CtrlDoor_Exit = ReadRoleValue( _Boss , EM_RoleValue_Register10 );--紀錄後門ID
--		--出口阻擋門
--		local _X,_Y,_Z,_Dir=1143.6,3545,1640.8,258.7;
--		local _CtrlDoor_Exit=CreateObj(106247,_X,_Y,_Z,_Dir,1);
--		SetModeEx(_CtrlDoor_Exit,EM_SetModeType_Obstruct,true);--會阻擋(阻擋其他的物件)
--		SetModeEx( _CtrlDoor_Exit, EM_SetModeType_Mark, false );
--		SetModeEx( _CtrlDoor_Exit, EM_SetModeType_Searchenemy , false );
--		SetModeEx(_CtrlDoor_Exit, EM_SetModeType_Fight , false );
--		SetModeEx( _CtrlDoor_Exit, EM_SetModeType_Strikback , false );
--		AddToPartition(_CtrlDoor_Exit,room);
		--中央控制物件
		local _X,_Y,_Z,_Dir = 1247.2 , 3541.5 , 1256.1 , 74;
		local _CtrlBox=CreateObj(110987,_X,_Y,_Z,_Dir,1);
		SetModeEx( _CtrlBox, EM_SetModeType_Show , false );
	--	SetModeEx( _CtrlBox, EM_SetModeType_Fight , false );
		AddToPartition(_CtrlBox,room);
		--小怪
		local _Monster={ };
		local _MonsterNum=6;--小怪隻數
		for i=1,_MonsterNum,1 do
			_Monster[ i ]=0;
		end
		--執行動作
		CallPlot(_CtrlBox,"BY_28_BossCtrl",_CtrlBox,_Boss,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);
		Cl_Resist_HackersFightBegin()	--防駭客機制_戰鬥開始_BICO
	end
	function BY_28_BossCtrl( _CtrlBox,_Boss,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit)
		local room=ReadRoleValue(_Boss,EM_RoleValue_RoomID);
		local zone=ReadRoleValue(_Boss,EM_RoleValue_ZoneID);
		local _timer=0;
		local _countDown ={ 
					_7SecCD=7;--Boss7秒施法
					_30SecCD=30;--Boss30秒施法
					_5SecCD=5;--小怪5秒施法
					_BossSlowNum=49;--Boss緩速法術等級
					}
		local fury_course=false;--狂暴模式
		local _ctrlBossSlow=false;--Boss緩速控制
		--local _ctrlBossReset=false;--Boss重設控制
		local _ctrlBossInitial=false;--Boss初始控制
		lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_START]",0);--孵育者的進化方式顯然和其他幽羅不同，那恐怖的重拳肯定不易抵擋！

		local _zoneID = zone;
		local _difficulty = 1;--Z160 default

		local _fellowsGUIDs = {103378 , 108297 , 108298 };

		if ( _zoneID == 161 ) then
			_difficulty = 2;
		end

		if ( _zoneID == 162 ) then
			_difficulty = 3;
		end

		local _fellowGUID = _fellowsGUIDs[ _difficulty ];

		--戰鬥迴圈
		while true  do
			--Boss不存在 刪除場景上所有東西 停止戰鬥
			if CheckID(_Boss)==false or ReadRoleValue(_Boss,EM_RoleValue_IsDead)==1 then 
				BY_28_RemoveAll(_CtrlBox,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);--刪除場景物件
				break ;
			end
			--判斷戰鬥狀態
			local _BossHateListNum=HateListCount(_Boss);--取得仇恨列表內物件數量
			if _BossHateListNum~=0 then 
				--SetModeEx(_CtrlDoor_Entrance,EM_SetModeType_Obstruct,true); --戰鬥開始 關閉入口門
			else
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_FAIL]",0);--孵育者發出一陣類似訕笑的聲音，慢慢的回到自己崗位上。
				_ctrlBossInitial=true;--停止戰鬥 Boss 初始
				break;
			end 
			--計時
			sleep(10);
			_timer=_timer+1;
			_countDown._7SecCD=_countDown._7SecCD-1;
			_countDown._30SecCD=_countDown._30SecCD-1;
			--Boss緩速判斷
			if _ctrlBossSlow==true then
				_countDown._BossSlowNum=_countDown._BossSlowNum-2;
				CancelBuff(_Boss,624759);
				AddBuff(_Boss,624759,_countDown._BossSlowNum,-1);
				if _countDown._BossSlowNum<=0 then
					CancelBuff(_Boss,624759);
					_ctrlBossSlow=false;
					_countDown._BossSlowNum=49;
				end
			end
			--狂暴機制
			if(zone~=162)and(fury_course==false)then
				if(zone==160)and(_timer>=480)then
					fury_course=true;
				elseif(zone==161)and(_timer>=360)then
					fury_course=true;
				end
				if(fury_course==true)then
					AddBuff(_Boss,624344,0,-1);
					lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_FURY]",0);--孵育者感受到巢穴的低鳴，開始陷入某種瘋狂狀態！
				end
			end
			--7秒法術
			if _countDown._7SecCD==0 then
				castspell(_Boss,_Boss,851139);
				_countDown._7SecCD=7;
			end
			--30秒法術
			if _countDown._30SecCD==0 then
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_FATAL]",0);--孵育者開始蓄存能量，接下來這一擊的威力將無人能擋！
				castspell(_Boss,_Boss,851142);
				Sleep(60);
				_timer=_timer+6;
				local _BossHP= ReadRoleValue(_Boss,EM_RoleValue_HP);
				local _PlayerList=SearchRangePlayer(_Boss,300);
				for i=0,#_PlayerList-1,1 do
					local _Distance=GetDistance(_Boss,_PlayerList[ i ]);
					if _Distance<=120 then 
						if(_BossHP~=0) then SyscastspellLv( _Boss,_PlayerList[ i ],851143,1) end; 
					else
						if(_BossHP~=0) then SyscastspellLv( _Boss,_PlayerList[ i ],851149,1) end; 
					end;
				end
				SyscastspellLv( _Boss,_Boss,851145,1);--Boss反彈盾
				AddBuff(_Boss,624759,_countDown._BossSlowNum,-1);--緩速50
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_WEAK]",0);--雖然孵育者的速度受到適才這一擊的影響，但它很快就能恢復過來！
				_ctrlBossSlow=true;
				--判斷小怪狀態
				--local _MonsterID=103378;--103378  --100284
				local _MonsterID = _fellowGUID;--103378  --100284
				local _X,_Y,_Z,_Dir=DW_Location( _CtrlBox );
				local _CreateNum=0;
				for i=1,#_Monster,1 do
					if _Monster[ i ]==0 and _CreateNum<2 then
						local _RandomX=RandRange(50,160);
						local _RandomZ=RandRange(50,160);
						local _RandomDir=RandRange(1,360);
						_RandomX=(i%2~=0) and-_RandomX or _RandomX;
						_RandomZ=(i%2~=0) and-_RandomZ or _RandomZ;
						_Monster[ i ]=CreateObj(_MonsterID,_X+_RandomX,_Y,_Z+_RandomZ,_RandomDir,1);
						AddToPartition(_Monster[ i ],room);
						_CreateNum=_CreateNum+1;
					end
					SysCastSpellLv(_Monster[ i ],_Monster[ i ],492504,1);--小怪反彈盾	
				end
				_countDown._30SecCD=30;
			end
			--小怪血量判斷
			local _MonsterList={ };
			for i=1,#_Monster,1 do
				local _MonsterHP= ReadRoleValue(_Monster[ i ],EM_RoleValue_HP);
				if _MonsterHP<=0 then
					 _Monster[ i ]=0 ;
				else
					table.insert(_MonsterList,_Monster[ i ]);	
				end;
			end
			if(#_MonsterList==0)and(CheckBuff(_Boss,624733)==true)then
				CancelBuff_NoEvent(_Boss,624733);
				lua_28in_Boss5_broadcast(0,"[SC_28IN_BOSS2_CANCEL]",C_YELLOW);--音匠們帶來的護盾效果雖著他們的倒下而消失！
			end
			--判斷小怪讀秒與是否施放共鳴法術
			_countDown._5SecCD=(#_MonsterList>=2 ) and _countDown._5SecCD-1 or 5;
			if _countDown._5SecCD==0 then
				for i=1,#_MonsterList-1,1 do
					castspell(_Monster[ i ],_Monster[ i+1 ],851147);--共鳴法術影片
					castspell(_Monster[ i+1 ],_Monster[ i ],851147);--共鳴法術影片
					Sleep(5);	
					SyscastspellLv(_Monster[ i ],_Monster[ i+1 ],851148,1);--共鳴玩家傷害效果
					Sleep(5);
					SyscastspellLv(_Monster[ i+1 ],_Monster[ i ],851148,1);--共鳴玩家傷害效果
					SyscastspellLv(_Monster[ i ],_Monster[ i+1 ],492505,1);--共鳴BOSS效果
					Sleep(5);
					SyscastspellLv(_Monster[ i+1],_Monster[ i ],492505,1);--共鳴BOSS效果
					_timer=_timer+1.5;
				end
				_countDown._5SecCD=5;
			end
			--判斷Boss重設範圍
			local _BossLocation=GetDistance(_CtrlBox,_Boss);
			if _BossLocation>=380 then
				CancelBuff(_Boss,624759);
				DelFromPartition( _Boss ) ;
				--_ctrlBossReset=true;
				_ctrlBossInitial=true;
				break;
			end
		end
		--Boss重設
--[[
		if _ctrlBossReset==true then
			Sleep(50);
			local _X,_Y,_Z,_Dir=DW_Location(_CtrlBox);
			SetPos(_Boss,_X,_Y,_Z,_Dir);
			AddToPartition(_Boss,room);
			BY_28_RemoveAll(_CtrlBox,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);--刪除場景物件
		end
]]--
		--Boss初始
		if _ctrlBossInitial==true then
			CancelBuff(_Boss,624759);
			DelFromPartition( _Boss ) ;
			Sleep(20);
			--ReSetNPCInfo(_Boss);--131217 K.J. Aris
			Sleep(20);
			AddToPartition(_Boss,room);
			BY_28_RemoveAll( _CtrlBox , _Monster , _CtrlDoor_Entrance , 0);--刪除場景物件
			--WriteRoleValue( _Boss , EM_RoleValue_Register10 , _CtrlDoor_Exit );--紀錄後門ID
		else
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_END]",0);--在識破孵育者的技倆後，其弱點便完全曝露出來，這名幽羅終於不甘的倒下......
			BY_28_RemoveAll(_CtrlBox,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);--刪除場景物件
		end
	end
end --function BY_28_Init
--刪除場景物件
function BY_28_RemoveAll(_CtrlBox,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit)
	for i=1,#_Monster,1 do
		DelObj( _Monster[ i ] );	
	end
	DelObj(_CtrlDoor_Entrance);
	DelObj(_CtrlDoor_Exit);
	DelObj(_CtrlBox);
end
function BY_28_OnlyBoss()--只有boss有效
	local who=TargetID();
	if(ReadRoleValue(who,EM_RoleValue_SEX)>=3)then
		return true;
	else
		return false;
	end
end

function BY_28_Dead()
	local _backDoor = ReadRoleValue( OwnerID() , EM_RoleValue_Register10 );--後門ID	--140428
	DelObj( _backDoor );
	Cl_Resist_HackersBossDead();
end