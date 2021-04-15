--K.J. Aris
--13.07.10.10.28
--28 BOSS-3-亡魂撫慰之冥管-雪斯敦--107966
-------------------------Switch----------------------
local KJ_28BOSS3_soulContainerList = nil;
function KJ_28BOSS3_Init()
	local _bossID = OwnerID();
	local _roomID=ReadRoleValue( _bossID ,EM_RoleValue_RoomID);
	local _backDoor =CreateObj( 106251 , 312.5 , 3542.1 , 856.1 , 80 , 1 );
	SetModeEx( _backDoor , EM_SetModeType_Obstruct , true );--阻擋
	SetModeEx( _backDoor , EM_SetModeType_ShowRoleHead , false);
	SetModeEx( _backDoor , EM_SetModeType_Mark , false);
	DW_UnFight( _backDoor , true );
	local room = _roomID;

	AddToPartition( _backDoor , room );

	WriteRoleValue( _bossID , EM_RoleValue_Register10 , _backDoor );--紀錄後門ID
	--		table.insert( Gate , _backDoor );
	Cl_Resist_HackersBossNum();


	function KJ_28BOSS3_InCombat()--開始動作
		DebugMsg( 0 , 0 , "  ------KJ_28BOSS3_InCombat----140304-- " );
		--settings
		local _bossID = OwnerID();
		local _roomID=ReadRoleValue( _bossID ,EM_RoleValue_RoomID);
		local x,y,z,dir=DW_Location( _bossID );

		local _Ctrl=CreateObj( 110987 , x , y , z , dir , 1 );--物件控制器
		SetModeEx(_Ctrl,EM_SetModeType_Show,false);--
		SetModeEx(_Ctrl,EM_SetModeType_Mark,false);--
		SetModeEx(_Ctrl,EM_SetModeType_ShowRoleHead,false);
		AddToPartition( _Ctrl , _roomID );

		BeginPlot(_Ctrl,"KJ_28BOSS3_Ctrl",0);
		CallPlot(_Ctrl,"KJ_28BOSS3_tokenRULE",boss);
		Cl_Resist_HackersFightBegin()	--防駭客機制_戰鬥開始_BICO
	end--function KJ_28BOSS3_InCombat
	function KJ_28BOSS_ResetBoss( _InputCtrlID , _InputBossID , _InputRoomID , _InputBackDoor )
		--DW_UnFight(_InputBossID,false);
		DelObj( _InputCtrlID );
		SetModeEx( _InputBossID , EM_SetModeType_Searchenemy , false );--搜敵
		SetModeEx( _InputBossID , EM_SetModeType_Strikback , false );--反擊
		SetModeEx( _InputBossID , EM_SetModeType_Fight , false );--阻擋



		sleep( 10 );
		CancelBuff_NoEvent( _InputBossID , 624802 );--每次增強ATK、MATK、DEF、MDEF 5%
		CancelBuff_NoEvent( _InputBossID , 624817 );--靈魂狀態_Xeston
		DelFromPartition( _InputBossID );
		--ReSetNPCInfo( _InputBossID );
		DebugMsg( 0 , 0 , _InputBossID.."  ------正在重設BOSS------ " );
		sleep( 50 );
		
		--DW_UnFight(_InputBossID,true);
		SetModeEx( _InputBossID , EM_SetModeType_Searchenemy , true );--搜敵
		SetModeEx( _InputBossID , EM_SetModeType_Strikback , true );--反擊
		SetModeEx( _InputBossID , EM_SetModeType_Fight , true );--阻擋
		SetPos( _InputBossID , 223 , 3539 , 1077 , 266.6 );
		AddToPartition( _InputBossID,_InputRoomID) ;--重置
		DelObj( _InputBackDoor );
		--BeginPlot( _InputBossID , "KJ_28BOSS3_InCombat", 0 );
	end--function KJ_28BOSS_ResetBoss


	function KJ_28BOSS3_Ctrl(  )--王控制器
		local Ctrl = OwnerID();
		local boss = TargetID();
		local _centralReferenceTarget = Ctrl;--參考目標      --若BOSS超過範圍  代表已超出戰場   則重置流程
		local _centralReferenceRange = 290;--目標參考距離
		local room = ReadRoleValue( boss , EM_RoleValue_RoomID );
		local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
		local _backDoor = ReadRoleValue( _bossID , EM_RoleValue_Register10 );--後門ID	--140428
		DebugMsg( 0 , 0 , boss.."  start AI behavior" );
		--阻擋門
		local Gate={};
		--for pos=1, 2, 1 do
	--		local x,y,z,dir=DW_Location(781331,pos);
			local d=CreateObj( 106251 , 178.2 , 3539.1 , 1346.9 , 260 , 1 );--前門
			SetModeEx( d , EM_SetModeType_Obstruct , true );--阻擋
			SetModeEx(d,EM_SetModeType_ShowRoleHead, false);
			SetModeEx(d,EM_SetModeType_Mark, false);
			DW_UnFight(d,true);
			AddToPartition(d,room);
			CallPlot(d,"KJ_28BOSS3_tokenRULE",boss);
			table.insert( Gate , d );
			
	--		d =CreateObj( 106251 , 312.5 , 3542.1 , 856.1 , 80 , 1 );--後門
	--		SetModeEx( d , EM_SetModeType_Obstruct , true );--阻擋
	--		SetModeEx(d,EM_SetModeType_ShowRoleHead, false);
	--		SetModeEx(d,EM_SetModeType_Mark, false);
	--		DW_UnFight(d,true);
	--		--SetModeEx(d,EM_SetModeType_ShowRoleHead, true);
	--		AddToPartition(d,room);
	--		CallPlot(d,"KJ_28BOSS3_tokenRULE",boss);
	--		table.insert( Gate , d );
		--end
		
		--時間資料
		-----------------
		local fury_course=false;
		--累計值
		local time=0;
		--遞減值
		local ori_countDOWN = {
					ranATK=7;      --隨機施放：single or triple tap
					aeDot=11;     --AE+DOT
					collectSoul=17;    --吸收靈魂
					fatal=20;	--大絕
					container=7;	--容器爆
					bell_move=10;
								};
		
		local countDOWN = {
					ranATK=7;      --隨機施放：single or triple tap
					aeDot=11;     --AE+DOT
					collectSoul=27;    --吸收靈魂
					fatal=20;	--大絕
					container=7;	--容器爆
					bell_move=0;
								};
		--遞減值
		local GCD=0;

		--玩家資料
		local PlayerList={};
		local HateList={};
		local totalplayer=0;

		local _currentPlayerSoul = 0;--目前所有玩家身上的靈魂碎片
		local _currentCollectedSoul = 0; --目前BOSS所蒐集的靈魂碎片
		
		if(KJ_28BOSS3_soulContainerList==nil)then
			KJ_28BOSS3_soulContainerList={};
		end
		KJ_28BOSS3_soulContainerList[room]={};
		
		local x,y,z,dir=DW_Location(boss);

		--local _targetList = Lua_RandomPlayerFromHateList( _bossID , 3 , false );--最多3個靈魂容器
		local _targetList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );--最多3個靈魂容器
		local _maxSoulContainer = #_targetList;

		if ( #_targetList > 3 ) then
			_maxSoulContainer = 3;
		end

		for i=1,_maxSoulContainer,1 do
			local c=KJ_28BOSS3_CreateSingleSoulContainer( boss );
			KJ_28BOSS3_soulContainerList[room][i]=c;--this is a global var
			DebugMsg(0,0,"靈魂容器 "..i.." 產生！")
		end
					--副函式
				------------------------------------------------------------------------------
					local function rand_pick( _InputList ,  _InputNum )--隨機挑選num名玩家
						local playertable={};--index依序value玩家GUID
						local n = _InputNum;
						if( n >= #_InputList ) then n = #_InputList +1; end
						for i=1, n ,1 do
							table.insert( playertable , _InputList[ DW_Rand(#_InputList) ] );
							--DebugMsg( 0 , 0 , "挑了 "..i.." 個" );
						end
						
						return playertable;
					end

					local function rand_pick_FromZero( _InputList ,  _InputNum )--隨機挑選num名玩家  --Table Index 由0開始
						local _maxLength = 0;
						local _tempList ={};
						for _qq = 0 , #_InputList , 1 do --確認由0開始的TABLE的長度  並建立由1開始的TABLE (以方便後續統一操作)
							if( PlayerList[ _qq ] == -1 ) then break; end
							_maxLength = _maxLength + 1;
							table.insert( _tempList , PlayerList[ _qq ] );
						end

						_tempList = KJ_28BOSS3_SC_Hash_Shuffle( _tempList );--建立HASH表

						local _currentEfficaciousTargetList = {};--index依序value玩家GUID
						local n = _InputNum;
						local _currentTargetID = 0;
						if( n >= _maxLength ) then n = _maxLength; end
						for i=1, n ,1 do
							--_currentTargetID = _InputList[ RandRange( 0 , _maxLength ) ];
							_currentTargetID = _tempList[ i ];
							table.insert( _currentEfficaciousTargetList , _currentTargetID );--DW_Rand
							--DebugMsg( 0 , 0 , "挑了 "..i.." 個 --".._currentTargetID );
						end
						
						return _currentEfficaciousTargetList;
					end
				---------------------------------------------------------------------------
		--戰鬥迴圈
		lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_START]",0);--你的背上寒毛豎起，這些看似無害的發光體肯定有著無法想像的力量！
		local _resetOrNot = false;
		while true do




			--RESET
			HateList={};
			PlayerList={};
			_HateTargetList = {};
			_alivePlayerList = {};
			
			--KEEP
			sleep(10);
			--DebugMsg( 0 , 0 , boss.."  戰鬥迴圈執行中 " );
			-------------------------------------------------戰鬥結束條件
			if CheckID(boss)==false or ReadRoleValue(boss,EM_RoleValue_IsDead)==1 then -- boss 死亡時中斷戰鬥迴圈
			
				CancelBuff_NoEvent( boss , 624802 );--每次增強ATK、MATK、DEF、MDEF 5%
				CancelBuff_NoEvent( boss , 624817 );--靈魂狀態_Xeston
				KJ_28BOSS3_ClearAllBuff( _HateTargetList );--確保所有人的BUFF被清空(BOSS有永久BUFF)
				KJ_28BOSS3_ClearAllBuff( PlayerList );--確保所有人的BUFF被清空(BOSS有永久BUFF)
				table.insert( Gate , _backDoor );
				break;
			end
			-------------------------------------END---------戰鬥結束條件		

			--時間資料
			time = time + 1;
			if( GCD > 0 ) then GCD = GCD - 1; end
			for __ , cd in pairs( countDOWN ) do
				if( cd > 0 ) then
					countDOWN[ __ ] = cd - 1;
				end
			end
			
			--維持玩家資料
			local player_InHate={};
			local _HateCounter = HateListCount( boss );
			local _totalAlivePlayer = 0;
			totalplayer=0;
			for pos = 0 , _HateCounter - 1 , 1 do
				local id = HateListInfo( boss , pos , EM_HateListInfoType_GItemID );
				local point = HateListInfo( boss , pos , EM_HateListInfoType_HatePoint );
				--HateList(所有仇恨目標)
				HateList[ id ]={
						pos=pos;
						point=point;
								};
				_HateTargetList[ pos ] = id;
				if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
					table.insert(player_InHate,id);
				end
			end
			--無仇恨名單
			if(#player_InHate==0)then
				_resetOrNot=true;
				CancelBuff_NoEvent( boss , 624802 );--每次增強ATK、MATK、DEF、MDEF 5%
				CancelBuff_NoEvent( boss , 624817 );--靈魂狀態_Xeston
				break;
			end
			PlayerList = SearchRangePlayer( _centralReferenceTarget , _centralReferenceRange );--搜尋參考範圍內的玩家

			for _qq = 0 , 100 , 1 do--計數總玩家   與    有效玩家(存活玩家)
				local _currentPlayerID = PlayerList[ _qq ] ;
				if( _currentPlayerID == -1 ) then break; end

				if( ReadRoleValue( _currentPlayerID , EM_RoleValue_IsDead )==0 )then--當玩家尚存時才作動
					table.insert( _alivePlayerList , _currentPlayerID );
					_totalAlivePlayer = _totalAlivePlayer + 1;
				end
				totalplayer = totalplayer + 1;
			end
			if(#_alivePlayerList==0)then
				_resetOrNot=true;
				CancelBuff_NoEvent( boss , 624802 );--每次增強ATK、MATK、DEF、MDEF 5%
				CancelBuff_NoEvent( boss , 624817 );--靈魂狀態_Xeston
				break;
			end
			-------------------------------------------------戰鬥結束條件2
			if ( GetDistance( _centralReferenceTarget , boss ) > _centralReferenceRange ) --boss 超出範圍時重置
			OR ( _totalAlivePlayer <= 0 AND _HateCounter <= 0 )	then--或沒有任何有效玩家
				DebugMsg( 0 , 0 , boss.."  已超過有效範圍 ---預備重設BOSS " );
				--DebugMsg( 0 , 0 , boss.."  " );
				_resetOrNot = true;

				break;
			end
			-----------------------------------END-----------戰鬥結束條件2
			--DebugMsg( 0 , 0 , totalplayer.." enemies in sight !! " );
			--if(totalplayer<=0)then break;end
			--狂暴機制
			if(zone~=162)and(fury_course==false)then
				if(zone==160)and(time>=480)then
					fury_course=true;
				elseif(zone==161)and(time>=360)then
					fury_course=true;
				end
				if(fury_course==true)then
					AddBuff(boss,624344,0,-1);
					lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FURY]",0);--[107966]感受到巢穴的低鳴，開始陷入某種瘋狂狀態！
				end
			end		
			--聖鐘產生共鳴(per 20 sec)
			if(countDOWN.fatal==0)then
				countDOWN.fatal=rawget(ori_countDOWN,"fatal");
				--每20秒在玩家身上加一個"靈魂碎片"的DEBUFF
				--DebugMsg( 0 , 0 , boss.."  鐘聲響起來~~Boss更厲害 " );
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_PER20]",0);--[107966]「冷笑」了一聲

				------------------------boss actions
				PlayMotion( boss , ruFUSION_ACTORSTATE_BUFF_SP01 );

				SetModeEx( boss , EM_SetModeType_Searchenemy , false );--搜敵
				SetModeEx( boss , EM_SetModeType_Strikback , false );--反擊
				--DW_UnFight(boss,false);
				sleep( 20 );
				time=time+2;
				--DW_UnFight(boss,true);
				SetModeEx( boss , EM_SetModeType_Searchenemy , true );--搜敵
				SetModeEx( boss , EM_SetModeType_Strikback , true );--反擊


				AddBuff( boss , 624802 , 0 , -1 );--每次增強ATK、MATK、DEF、MDEF 5%
				DebugMsg( 0 , 0 , "Boss Increse Level-------"..KJ_28BOSS3_CheckTargetBuffLevel( boss , 624802 ) );
				------------------------boss actions
				

				------------------------------soul containers actions
				--for _qq , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
				local _soulSaturation = false;
				for _qq = _maxSoulContainer , 1 , -1 do
					local _SCID = KJ_28BOSS3_soulContainerList[room][ _qq ];
					--DebugMsg( 0 , 0 , "  靈魂容器 : ".._SCID );

					if( _SCID ~= nil and CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 )then--當靈魂容器尚存時才作動
						for i,player in pairs(_alivePlayerList)do
							if(GetDistance(_SCID,player)<=75)then
								SysCastSpellLv(player,_SCID,851169,1);--特效
							end
						end
						if(KJ_28BOSS3_CheckTargetBuffLevel(_SCID,624779)>=5)then
							CancelBuff_NoEvent(_SCID,624779);
							_soulSaturation = true;
						end
						DebugMsg( 0 , 0 , _SCID.."  靈魂容器吸取生命 " );
					else
						------------------------------靈魂容器重生
						DebugMsg( 0 , 0 , _qq.."  靈魂容器重生 " );
						KJ_28BOSS3_soulContainerList[room][_qq]=KJ_28BOSS3_CreateSingleSoulContainer( boss );
						------------------------------靈魂容器重生
					end
					
				end

				if ( _soulSaturation == true ) then--當靈魂容器飽和時 施放 噬魂詛咒
					lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_LV5]",C_Red);--[107966]從完全飽和的靈魂容器裡得到詛咒入侵者的能量
					
					--SysCastSpellLv(boss,boss,851140,0);
					CastSpell(boss,boss,851140);

					GCD = 6;
					countDOWN.aeDot = ori_countDOWN.aeDot;
				end

				------------------------------soul containers actions


				------------------------players
				--在玩家身上加上靈魂碎片BUFF
				for _Index,_ID in pairs( _alivePlayerList ) do
					if( ReadRoleValue( _ID , EM_RoleValue_IsDead ) == 0 )then--未死才紀錄BUFF   --避免時間差  再做一次檢查
						AddBuff(  _ID , 624774 , 0 , -1);--聖鐘詛咒
						AddBuff(  _ID , 624758 , 0 , -1);--靈魂碎片BUFF
						_currentPlayerSoul = _currentPlayerSoul + 1;
					end
				end
				------------------------players
			end
			for i=#_alivePlayerList,1,-1 do
				if(CheckID(_alivePlayerList[i])==false)or(ReadRoleValue(_alivePlayerList[i],EM_RoleValue_IsDead)==1)then
					table.remove(_alivePlayerList,i);
				end
			end
			-----------------------------------END---------聖鐘產生共鳴(per 20 sec)
--			--追逐
--			if(countDOWN.bell_move==0)and(#_alivePlayerList>0)then
--				countDOWN.bell_move=rawget(ori_countDOWN,"bell_move");
--				for i=1,_maxSoulContainer,1 do
--					if(CheckID(KJ_28BOSS3_soulContainerList[room][i])==true)and(ReadRoleValue(KJ_28BOSS3_soulContainerList[room][i],EM_RoleValue_IsDead)==0)then
--						local r=DW_Rand(#_alivePlayerList);
--						SetFollow(KJ_28BOSS3_soulContainerList[room][i],_alivePlayerList[r]);
--					end
--				end
--			end

			--靈魂容器聖光傷害(Per 7 sec)
			if(countDOWN.container==0)then
				countDOWN.container=rawget(ori_countDOWN,"container");
				for _qq , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
					if CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 then
						SysCastSpellLv( _SCID , _SCID , 851164 , 0 );--靈魂容器聖光傷害 + DOT
						DebugMsg( 0 , 0 , _SCID.."  靈魂容器聖光傷害 + DOT " );
					end
				end
			end
			----------------------------------END----------靈魂容器聖光傷害(Per 7 sec)


			--Boss attackings
			---------------------------------隨機攻擊招式
			for i=1,1,1 do
				if(GCD~=0)then break;end
				if(countDOWN.ranATK~=0)then break;end
				if( totalplayer <= 0 )then break;end
				GCD = 2;
				countDOWN.ranATK = ori_countDOWN.ranATK;

				-----------actions
				--DebugMsg( 0 , 0 , boss.."  打人拉 !! " );
				if RandRange( 1 , 2 ) == 1 then --random 兩招
					CallPlot( boss , "KJ_28BOSS3_SingleTap" , 851144 , rand_pick_FromZero( _alivePlayerList , 1 ) );--隨機打一
				else												
					--CallPlot( boss , "KJ_28BOSS3_TripleTap" , 851144 , rand_pick_FromZero( _alivePlayerList , 3 ) );--隨機打三
					CastSpell(boss,boss,851281);
				end
				-----------actions
			end
			---------------------END--------隨機攻擊招式


			--------------------------------aeDot
			for __=1,1,1 do
				if(GCD~=0)then break;end
				if(countDOWN.aeDot~=0)then break;end
				if( totalplayer <= 0 )then break;end
				GCD = 3;
				countDOWN.aeDot = ori_countDOWN.aeDot;
			
				-----------actions
				CastSpell(  boss , boss , 851140 ) ;--AE+DOT，詛咒，持續時間8秒
				Sleep( 20 );
				time=time+2;
				--ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP
				--DebugMsg( 0 , 0 , boss.."  AE+DOT，詛咒，持續時間8秒 " );
				-----------actions
			end
			-----------------------END------aeDot



			--------------------------------蒐集靈魂碎片
			for __=1,1,1 do
				if(GCD~=0)then break;end
				if(countDOWN.collectSoul~=0)then break;end
				if( totalplayer <= 0 )then break;end
				GCD = 4;--注意GCD打結(dead lock)
				countDOWN.collectSoul = ori_countDOWN.collectSoul;
			
				-----------actions
				--PlayMotion( boss , ruFUSION_ACTORSTATE_CAST_SP01 );
				--DebugMsg( 0 , 0 , boss.."  蒐集靈魂碎片 " );
				SetModeEx( boss , EM_SetModeType_Searchenemy , false );--搜敵
				SetModeEx( boss , EM_SetModeType_Strikback , false );--反擊
				sleep(10);
				CastSpell(  boss , boss , 851162 ) ;
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_GAINSOUL]",0);--[107966]催動[108119]的力量，靈魂被擾動的你感到極度痛苦！

				--DW_UnFight(boss,false);
				sleep( 30 );
				time=time+4;
				--DW_UnFight(boss,true);
				SetModeEx( boss , EM_SetModeType_Searchenemy , true );--搜敵
				SetModeEx( boss , EM_SetModeType_Strikback , true );--反擊
				-----------actions
				
				-----------Players actions
				for _Index,_ID in pairs( _alivePlayerList ) do
					if(ReadRoleValue(_ID,EM_RoleValue_IsDead)==0)then--未死才紀錄BUFF  --避免時間差  再做一次檢查
						local _buffLevel = KJ_28BOSS3_CheckTargetBuffLevel( _ID , 624758 );--紀錄玩家身上靈魂碎片數量--624758靈魂碎片
						CancelBuff_NoEvent(  _ID , 624758 );--靈魂碎片BUFF  --被吸走 --取消碎片BUFF
						--Say( _ID , "my soul has been taken !!"  );
						for _qq , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
							SysCastSpellLv( _ID , _SCID , 851163 , 0 );--播放靈魂碎片被吸收特效
							
							for i = 1 , _buffLevel , 1 do
								AddBuff( _SCID , 624803 , 0 , -1 );--624803靈魂狀態_容器   --把玩家的靈魂層數疊上去
								AddBuff( boss , 624817 , 0 , -1 );--624817靈魂狀態_Xeston  --把容器的靈魂層數疊上去
							end
							--DebugMsg( 0 , 0 , _ID.."  蒐集靈魂碎片吸收特效 ".._SCID );
--							if( ReadRoleValue( _SCID , EM_RoleValue_IsDead ) == 0 ) then--順便將已死的容器剔除
--								table.remove( KJ_28BOSS3_soulContainerList[room] , _qq );
--							end
						end
						
					end
				end

				_currentCollectedSoul = _currentCollectedSoul + _currentPlayerSoul;--蒐集玩家靈魂	
				--Say( boss , "I have ".._currentCollectedSoul.." souls , ".._currentPlayerSoul.." more !!" );								
				_currentPlayerSoul = 0;--被蒐集後歸零
				-----------Players actions

			end

			----當靈魂容器全毀時 將BOSS 身上的疊加效果移除 140225
			local _deadCounter = 0;
			for _index , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
				if _SCID ~= nil and CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 1 then
					_deadCounter = _deadCounter + 1;
				end

				if ( _deadCounter >= #KJ_28BOSS3_soulContainerList[room] ) then
					CancelBuff( boss , 624817 );--當靈魂容器全毀時 將BOSS 身上的疊加效果移除 140225
				end
			end
			---------------------END--------蒐集靈魂碎片
		end--while--戰鬥迴圈
		---跳出戰鬥迴圈後
		DebugMsg( 0 , 0 , boss.."  結束戰鬥迴圈 " );

		--解除阻擋門
		for pos=1,#Gate,1 do
			DelObj(Gate[pos]);
		end

		--------------刪除靈魂容器
--		for _qq = 1 , #KJ_28BOSS3_soulContainerList[room] , 1 do
--				DelObj( KJ_28BOSS3_soulContainerList[room][ _qq ] );--刪除靈魂容器
--		end
		for _index , _containerID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
				DelObj( _containerID );--刪除靈魂容器
		end
		KJ_28BOSS3_soulContainerList[room] = nil;
		---------------刪除靈魂容器
		--確認死亡或是離開戰鬥
		KJ_28BOSS3_isUnderCombat = false;	
		if _resetOrNot==false then
			
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_END]",0);--[107966]倒下後，那恍若所失的不適才漸漸消失，你的靈魂已重歸於一處，仿彿什麼事都不曾發生
			DelObj(Ctrl);
			DelObj( _backDoor );
			return;
		else
			--離開戰鬥
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FAIL]",0);--[107966]喳巴喳巴的，似乎在稱讚你強大靈魂的美味，一副非常滿意的模樣。
			DebugMsg( 0 , 0 , boss.." ----啟動重置流程------" );
			
			CallPlot( boss , "KJ_28BOSS_ResetBoss", Ctrl , boss , room , _backDoor );
			--KJ_28BOSS_ResetBoss( Ctrl , boss , room );
		end
		DelObj(Ctrl);
	end--function KJ_28BOSS3_Ctrl
	
end--function KJ_28BOSS3_Init
-----------------------------------------------------------------------






----------------------sub actions--------------------------王的攻擊動作
	function KJ_28BOSS3_SingleTap(  _InputSkillID , _InputEnemyList )--單體攻擊
		
		--75 yard
		local _effectRange = 75; --搜尋範圍 & 攻擊距離
		local _bossID = OwnerID();
		local _skillID = _InputSkillID;--850811;--for temporary

		local _enemyList = _InputEnemyList;--SearchRangePlayer( _bossID , _effectRange );--搜尋清單
		local _enemyAround = false;
		
		local _currentEnemy;		

		--DebugMsg( 0 , 0 , _bossID.."  KJ_28BOSS3_SingleTap " );
		
			for i = 1 , #_enemyList , 1 do
				_currentEnemy = _enemyList[ i ];
				if ( ReadRoleValue(  _currentEnemy , EM_RoleValue_HP ) > 0 ) then--確認玩家生存狀態
					_enemyAround = true;
					SetAttack( _bossID , _currentEnemy );
					CastSpell( _bossID , _currentEnemy , _SkillID ) ;
					--WriteRoleValue( _currentEnemy , EM_RoleValue_HP , 0 );
					--WriteRoleValue( _currentEnemy , EM_RoleValue_IsDead , 1 );
					--Say( _bossID , "attacking  "..i.." _  ".._currentEnemy );
					break;
				end--若玩家已死亡則繼續搜尋下一個目標
			end--for

			if _enemyAround == false then--當第一輪沒有找到對象時
				--例外處理
				--走到玩家群 || 重新搜尋玩家清單
			end

	end--function 28BOSS3_SingleTap


	function KJ_28BOSS3_TripleTap( _InputSkillID , _InputEnemyList )--隨機打三人
		local _effectRange = 500; --搜尋範圍 & 攻擊距離
		local _bossID = OwnerID();
		local _skillID = _InputSkillID;--851117;--for temporary
		
		local _maxTarget = 3;--最多應付三個
		local _enemyList = _InputEnemyList;--SearchRangePlayer( _bossID , _effectRange );--搜尋清單
		local _enemyAround = false;
		
		local _currentEfficaciousTargetCount = 0;--目前有效目標計數
		local _currentEnemy;
		DebugMsg( 0 , 0 , _bossID.."  KJ_28BOSS3_TripleTap " );
		
		
		for i = 1 , #_enemyList  , 1 do
			_currentEnemy = _enemyList[ i ];

				if _currentEfficaciousTargetCount < _maxTarget then--
					
					if ( ReadRoleValue(  _currentEnemy , EM_RoleValue_HP ) > 0 ) then--當玩家存活  才當作有效的攻擊對象
						_enemyAround = true;
						_currentEfficaciousTargetCount = _currentEfficaciousTargetCount+1;
						--CastSpell( _bossID , _enemyList[ i ] , _SkillID ) ;
						SetAttack( _bossID , _currentEnemy );
						SysCastSpellLv( _bossID , _currentEnemy , _SkillID , 100 );
						--施放招式
						--Say( _bossID , "triple attacking  ".._currentEfficaciousTargetCount.." _  ".._currentEnemy );
					end--

				else
					break;	--多餘上限則中斷
				end

		end--end for


--		if _currentEfficaciousTargetCount <= 0 then
--			Say( _bossID , "there's no one survive !! ha ha ha ha......" );
--		end

		if _enemyAround == false then--當第一輪沒有找到對象時
			--例外處理
			--走到玩家群 || 重新搜尋玩家清單
		end
		
	end--function 28BOSS3_TripleTap
----------------------sub actions--------------------------
-------------------------------------------------END------------------王的攻擊動作



-----------------------------------------------------------------------靈魂容器動作


	function KJ_28BOSS3_CreateSingleSoulContainer( _InputReferenceTargetID )
		DebugMsg(0,0,"執行KJ_28BOSS3_CreateSingleSoulContainer");
		local _roomID = ReadRoleValue( _InputReferenceTargetID , EM_RoleValue_RoomID );
		local _zoneID = ReadRoleValue( _InputReferenceTargetID , EM_RoleValue_ZoneID );
		local _difficulty = 1;--Z160 default
		local _fellowsGUIDs = {108119 , 108299 , 108300 };

		if ( _zoneID == 161 ) then
			_difficulty = 2;
		end

		if ( _zoneID == 162 ) then
			_difficulty = 3;
		end

		local _objectID = _fellowsGUIDs[ _difficulty ];--靈魂容器

		local _targetList = Lua_RandomPlayerFromHateList( _InputReferenceTargetID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦
		local _targetID = _targetList[ 1 ];
		local x,y,z,dir = DW_Location( _targetID );

		local _currentMonster = CreateObj(  _objectID , x , y , z , dir , 1 );

		SetModeEx( _currentMonster , EM_SetModeType_Searchenemy , true );--搜敵
		SetModeEx( _currentMonster , EM_SetModeType_Strikback , false );--反擊
		MoveToFlagEnabled( _currentMonster , false );--關閉巡邏移動	

		AddToPartition( _currentMonster , _roomID );
		AddBuff( _currentMonster , 505653 , 0 , -1 );--505653不回血
		CallPlot( _currentMonster ,"KJ_28BOSS3_tokenRULE", _InputReferenceTargetID );--auto destroy

		return _currentMonster;
	end

-----------------------------------------------END------------靈魂容器動作










--------------------------------------------------------------------------------------------public tools
---------------------------自動刪除物件
function KJ_28BOSS3_tokenRULE(Ctrl)--衍生物規則，隨主動存活
	local token = OwnerID();
	if not Ctrl then
		return false;
	end
	while CheckID(Ctrl) and ReadRoleValue(Ctrl,EM_RoleValue_IsDead)==0 do	
		sleep(20);
	end
	DelObj(token);
end
---------------------------自動刪除物件



function KJ_28BOSS3_ClearAllBuff( _InputList )--清除對象BUFF (注意重置狀態)
	for _Index,_ID in pairs( _InputList ) do
		CancelBuff_NoEvent(  _ID , 624758 );--靈魂碎片BUFF
		CancelBuff_NoEvent(  _ID , 624732 );--28BOSS3_SingleTap_Debuff
		CancelBuff_NoEvent(  _ID , 624774 );--聖鐘詛咒
		--DebugMsg( 0 , 0 , _ID.."  清除BUFF " );
	end
end


function KJ_28BOSS3_CheckTargetBuffLevel( _InputTargetID , _InputBuffID )--檢查目標身上的BUFF等級(疊加級數)   若找不到則回傳-1    
	local _buffLevel = -1;
	--DebugMsg( 0 , 0 , _InputTargetID.."-------------" );
	if CheckBuff( _InputTargetID , _InputBuffID ) == true then
		DebugMsg( 0 , 0 , _InputTargetID.."  has buff ".._InputBuffID.." is true." );
		local _totalBuff = BuffCount( _InputTargetID );
		for i = 0 , _totalBuff - 1 , 1 do
			if BuffInfo( _InputTargetID , i , EM_BuffInfoType_BuffID ) ==  _InputBuffID then
				_buffLevel = BuffInfo( _InputTargetID , i , EM_BuffInfoType_Power ) + 1;
				break;
			end
		end
	end
	return _buffLevel;
end

function KJ_28BOSS3_SC_Hash_Shuffle( _InputList )
	local _randomIndex = 0;
	local _tempCache = 0;

	for i = 1 , #_InputList , 1 do
		_randomIndex = RandRange( 1 , #_InputList );
		_tempCache = _InputList[ _randomIndex ];
		 _InputList[ _randomIndex ] = _InputList[ i ];
		_InputList[ i ] = _tempCache;
	end
	return _InputList;
end


function KJ_28BOSS3_ShootTargetScript()--劇情選取3個目標
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local list={};
	for pos=0,HateListCount(boss)-1,1 do
		local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
		if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)and(ReadRoleValue(id,EM_RoleValue_IsDead)==0)then
			table.insert(list,id);
		end
	end
	local n=3;
	if(n<#list)then
		n=#list;
	end
	for i=n,1,-1 do
		if(#list==0)then break;end
		local r=table.remove(list,DW_Rand(#list));
		DebugMsg(0,0,r.." & "..#list)
		PushMagicShootTarget(r);
	end
end
----------------------------------------------------------------END-------------------------public tools

---------------------------------------------------------------------
--	蝌蚪修改
--	死亡劇情
---------------------------------------------------------------------
function npc_107966_dead()
	local _backDoor = ReadRoleValue( OwnerID() , EM_RoleValue_Register10 );--後門ID	--140428
	DelObj( _backDoor );

--	給予稱號
	sasa_ZoneDungeon_title_01(530927)
--	防駭解除
	Cl_Resist_HackersBossDead()
end