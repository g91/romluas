--K.J. Aris
--13.07.10.10.28
--28 BOSS-3-�`������ߺ�-������--107966
-------------------------Switch----------------------
local KJ_28BOSS3_soulContainerList = nil;
function KJ_28BOSS3_Init()
	local _bossID = OwnerID();
	local _roomID=ReadRoleValue( _bossID ,EM_RoleValue_RoomID);
	local _backDoor =CreateObj( 106251 , 312.5 , 3542.1 , 856.1 , 80 , 1 );
	SetModeEx( _backDoor , EM_SetModeType_Obstruct , true );--����
	SetModeEx( _backDoor , EM_SetModeType_ShowRoleHead , false);
	SetModeEx( _backDoor , EM_SetModeType_Mark , false);
	DW_UnFight( _backDoor , true );
	local room = _roomID;

	AddToPartition( _backDoor , room );

	WriteRoleValue( _bossID , EM_RoleValue_Register10 , _backDoor );--�������ID
	--		table.insert( Gate , _backDoor );
	Cl_Resist_HackersBossNum();


	function KJ_28BOSS3_InCombat()--�}�l�ʧ@
		DebugMsg( 0 , 0 , "  ------KJ_28BOSS3_InCombat----140304-- " );
		--settings
		local _bossID = OwnerID();
		local _roomID=ReadRoleValue( _bossID ,EM_RoleValue_RoomID);
		local x,y,z,dir=DW_Location( _bossID );

		local _Ctrl=CreateObj( 110987 , x , y , z , dir , 1 );--���󱱨
		SetModeEx(_Ctrl,EM_SetModeType_Show,false);--
		SetModeEx(_Ctrl,EM_SetModeType_Mark,false);--
		SetModeEx(_Ctrl,EM_SetModeType_ShowRoleHead,false);
		AddToPartition( _Ctrl , _roomID );

		BeginPlot(_Ctrl,"KJ_28BOSS3_Ctrl",0);
		CallPlot(_Ctrl,"KJ_28BOSS3_tokenRULE",boss);
		Cl_Resist_HackersFightBegin()	--���b�Ⱦ���_�԰��}�l_BICO
	end--function KJ_28BOSS3_InCombat
	function KJ_28BOSS_ResetBoss( _InputCtrlID , _InputBossID , _InputRoomID , _InputBackDoor )
		--DW_UnFight(_InputBossID,false);
		DelObj( _InputCtrlID );
		SetModeEx( _InputBossID , EM_SetModeType_Searchenemy , false );--�j��
		SetModeEx( _InputBossID , EM_SetModeType_Strikback , false );--����
		SetModeEx( _InputBossID , EM_SetModeType_Fight , false );--����



		sleep( 10 );
		CancelBuff_NoEvent( _InputBossID , 624802 );--�C���W�jATK�BMATK�BDEF�BMDEF 5%
		CancelBuff_NoEvent( _InputBossID , 624817 );--�F��A_Xeston
		DelFromPartition( _InputBossID );
		--ReSetNPCInfo( _InputBossID );
		DebugMsg( 0 , 0 , _InputBossID.."  ------���b���]BOSS------ " );
		sleep( 50 );
		
		--DW_UnFight(_InputBossID,true);
		SetModeEx( _InputBossID , EM_SetModeType_Searchenemy , true );--�j��
		SetModeEx( _InputBossID , EM_SetModeType_Strikback , true );--����
		SetModeEx( _InputBossID , EM_SetModeType_Fight , true );--����
		SetPos( _InputBossID , 223 , 3539 , 1077 , 266.6 );
		AddToPartition( _InputBossID,_InputRoomID) ;--���m
		DelObj( _InputBackDoor );
		--BeginPlot( _InputBossID , "KJ_28BOSS3_InCombat", 0 );
	end--function KJ_28BOSS_ResetBoss


	function KJ_28BOSS3_Ctrl(  )--�����
		local Ctrl = OwnerID();
		local boss = TargetID();
		local _centralReferenceTarget = Ctrl;--�Ѧҥؼ�      --�YBOSS�W�L�d��  �N��w�W�X�Գ�   �h���m�y�{
		local _centralReferenceRange = 290;--�ؼаѦҶZ��
		local room = ReadRoleValue( boss , EM_RoleValue_RoomID );
		local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
		local _backDoor = ReadRoleValue( _bossID , EM_RoleValue_Register10 );--���ID	--140428
		DebugMsg( 0 , 0 , boss.."  start AI behavior" );
		--���ת�
		local Gate={};
		--for pos=1, 2, 1 do
	--		local x,y,z,dir=DW_Location(781331,pos);
			local d=CreateObj( 106251 , 178.2 , 3539.1 , 1346.9 , 260 , 1 );--�e��
			SetModeEx( d , EM_SetModeType_Obstruct , true );--����
			SetModeEx(d,EM_SetModeType_ShowRoleHead, false);
			SetModeEx(d,EM_SetModeType_Mark, false);
			DW_UnFight(d,true);
			AddToPartition(d,room);
			CallPlot(d,"KJ_28BOSS3_tokenRULE",boss);
			table.insert( Gate , d );
			
	--		d =CreateObj( 106251 , 312.5 , 3542.1 , 856.1 , 80 , 1 );--���
	--		SetModeEx( d , EM_SetModeType_Obstruct , true );--����
	--		SetModeEx(d,EM_SetModeType_ShowRoleHead, false);
	--		SetModeEx(d,EM_SetModeType_Mark, false);
	--		DW_UnFight(d,true);
	--		--SetModeEx(d,EM_SetModeType_ShowRoleHead, true);
	--		AddToPartition(d,room);
	--		CallPlot(d,"KJ_28BOSS3_tokenRULE",boss);
	--		table.insert( Gate , d );
		--end
		
		--�ɶ����
		-----------------
		local fury_course=false;
		--�֭p��
		local time=0;
		--�����
		local ori_countDOWN = {
					ranATK=7;      --�H���I��Gsingle or triple tap
					aeDot=11;     --AE+DOT
					collectSoul=17;    --�l���F��
					fatal=20;	--�j��
					container=7;	--�e���z
					bell_move=10;
								};
		
		local countDOWN = {
					ranATK=7;      --�H���I��Gsingle or triple tap
					aeDot=11;     --AE+DOT
					collectSoul=27;    --�l���F��
					fatal=20;	--�j��
					container=7;	--�e���z
					bell_move=0;
								};
		--�����
		local GCD=0;

		--���a���
		local PlayerList={};
		local HateList={};
		local totalplayer=0;

		local _currentPlayerSoul = 0;--�ثe�Ҧ����a���W���F��H��
		local _currentCollectedSoul = 0; --�ثeBOSS�һ`�����F��H��
		
		if(KJ_28BOSS3_soulContainerList==nil)then
			KJ_28BOSS3_soulContainerList={};
		end
		KJ_28BOSS3_soulContainerList[room]={};
		
		local x,y,z,dir=DW_Location(boss);

		--local _targetList = Lua_RandomPlayerFromHateList( _bossID , 3 , false );--�̦h3���F��e��
		local _targetList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );--�̦h3���F��e��
		local _maxSoulContainer = #_targetList;

		if ( #_targetList > 3 ) then
			_maxSoulContainer = 3;
		end

		for i=1,_maxSoulContainer,1 do
			local c=KJ_28BOSS3_CreateSingleSoulContainer( boss );
			KJ_28BOSS3_soulContainerList[room][i]=c;--this is a global var
			DebugMsg(0,0,"�F��e�� "..i.." ���͡I")
		end
					--�ƨ禡
				------------------------------------------------------------------------------
					local function rand_pick( _InputList ,  _InputNum )--�H���D��num�W���a
						local playertable={};--index�̧�value���aGUID
						local n = _InputNum;
						if( n >= #_InputList ) then n = #_InputList +1; end
						for i=1, n ,1 do
							table.insert( playertable , _InputList[ DW_Rand(#_InputList) ] );
							--DebugMsg( 0 , 0 , "�D�F "..i.." ��" );
						end
						
						return playertable;
					end

					local function rand_pick_FromZero( _InputList ,  _InputNum )--�H���D��num�W���a  --Table Index ��0�}�l
						local _maxLength = 0;
						local _tempList ={};
						for _qq = 0 , #_InputList , 1 do --�T�{��0�}�l��TABLE������  �ëإߥ�1�}�l��TABLE (�H��K����Τ@�ާ@)
							if( PlayerList[ _qq ] == -1 ) then break; end
							_maxLength = _maxLength + 1;
							table.insert( _tempList , PlayerList[ _qq ] );
						end

						_tempList = KJ_28BOSS3_SC_Hash_Shuffle( _tempList );--�إ�HASH��

						local _currentEfficaciousTargetList = {};--index�̧�value���aGUID
						local n = _InputNum;
						local _currentTargetID = 0;
						if( n >= _maxLength ) then n = _maxLength; end
						for i=1, n ,1 do
							--_currentTargetID = _InputList[ RandRange( 0 , _maxLength ) ];
							_currentTargetID = _tempList[ i ];
							table.insert( _currentEfficaciousTargetList , _currentTargetID );--DW_Rand
							--DebugMsg( 0 , 0 , "�D�F "..i.." �� --".._currentTargetID );
						end
						
						return _currentEfficaciousTargetList;
					end
				---------------------------------------------------------------------------
		--�԰��j��
		lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_START]",0);--�A���I�W�H��ݰ_�A�o�Ǭݦ��L�`���o����֩w���۵L�k�Q�����O�q�I
		local _resetOrNot = false;
		while true do




			--RESET
			HateList={};
			PlayerList={};
			_HateTargetList = {};
			_alivePlayerList = {};
			
			--KEEP
			sleep(10);
			--DebugMsg( 0 , 0 , boss.."  �԰��j����椤 " );
			-------------------------------------------------�԰���������
			if CheckID(boss)==false or ReadRoleValue(boss,EM_RoleValue_IsDead)==1 then -- boss ���`�ɤ��_�԰��j��
			
				CancelBuff_NoEvent( boss , 624802 );--�C���W�jATK�BMATK�BDEF�BMDEF 5%
				CancelBuff_NoEvent( boss , 624817 );--�F��A_Xeston
				KJ_28BOSS3_ClearAllBuff( _HateTargetList );--�T�O�Ҧ��H��BUFF�Q�M��(BOSS���ä[BUFF)
				KJ_28BOSS3_ClearAllBuff( PlayerList );--�T�O�Ҧ��H��BUFF�Q�M��(BOSS���ä[BUFF)
				table.insert( Gate , _backDoor );
				break;
			end
			-------------------------------------END---------�԰���������		

			--�ɶ����
			time = time + 1;
			if( GCD > 0 ) then GCD = GCD - 1; end
			for __ , cd in pairs( countDOWN ) do
				if( cd > 0 ) then
					countDOWN[ __ ] = cd - 1;
				end
			end
			
			--�������a���
			local player_InHate={};
			local _HateCounter = HateListCount( boss );
			local _totalAlivePlayer = 0;
			totalplayer=0;
			for pos = 0 , _HateCounter - 1 , 1 do
				local id = HateListInfo( boss , pos , EM_HateListInfoType_GItemID );
				local point = HateListInfo( boss , pos , EM_HateListInfoType_HatePoint );
				--HateList(�Ҧ�����ؼ�)
				HateList[ id ]={
						pos=pos;
						point=point;
								};
				_HateTargetList[ pos ] = id;
				if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
					table.insert(player_InHate,id);
				end
			end
			--�L����W��
			if(#player_InHate==0)then
				_resetOrNot=true;
				CancelBuff_NoEvent( boss , 624802 );--�C���W�jATK�BMATK�BDEF�BMDEF 5%
				CancelBuff_NoEvent( boss , 624817 );--�F��A_Xeston
				break;
			end
			PlayerList = SearchRangePlayer( _centralReferenceTarget , _centralReferenceRange );--�j�M�Ѧҽd�򤺪����a

			for _qq = 0 , 100 , 1 do--�p���`���a   �P    ���Ī��a(�s�����a)
				local _currentPlayerID = PlayerList[ _qq ] ;
				if( _currentPlayerID == -1 ) then break; end

				if( ReadRoleValue( _currentPlayerID , EM_RoleValue_IsDead )==0 )then--���a�|�s�ɤ~�@��
					table.insert( _alivePlayerList , _currentPlayerID );
					_totalAlivePlayer = _totalAlivePlayer + 1;
				end
				totalplayer = totalplayer + 1;
			end
			if(#_alivePlayerList==0)then
				_resetOrNot=true;
				CancelBuff_NoEvent( boss , 624802 );--�C���W�jATK�BMATK�BDEF�BMDEF 5%
				CancelBuff_NoEvent( boss , 624817 );--�F��A_Xeston
				break;
			end
			-------------------------------------------------�԰���������2
			if ( GetDistance( _centralReferenceTarget , boss ) > _centralReferenceRange ) --boss �W�X�d��ɭ��m
			OR ( _totalAlivePlayer <= 0 AND _HateCounter <= 0 )	then--�ΨS�����󦳮Ī��a
				DebugMsg( 0 , 0 , boss.."  �w�W�L���Ľd�� ---�w�ƭ��]BOSS " );
				--DebugMsg( 0 , 0 , boss.."  " );
				_resetOrNot = true;

				break;
			end
			-----------------------------------END-----------�԰���������2
			--DebugMsg( 0 , 0 , totalplayer.." enemies in sight !! " );
			--if(totalplayer<=0)then break;end
			--�g�ɾ���
			if(zone~=162)and(fury_course==false)then
				if(zone==160)and(time>=480)then
					fury_course=true;
				elseif(zone==161)and(time>=360)then
					fury_course=true;
				end
				if(fury_course==true)then
					AddBuff(boss,624344,0,-1);
					lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FURY]",0);--[107966]�P����_�ު��C��A�}�l���J�Y�غƨg���A�I
				end
			end		
			--�t�����ͦ@��(per 20 sec)
			if(countDOWN.fatal==0)then
				countDOWN.fatal=rawget(ori_countDOWN,"fatal");
				--�C20��b���a���W�[�@��"�F��H��"��DEBUFF
				--DebugMsg( 0 , 0 , boss.."  ���n�T�_��~~Boss��F�` " );
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_PER20]",0);--[107966]�u�N���v�F�@�n

				------------------------boss actions
				PlayMotion( boss , ruFUSION_ACTORSTATE_BUFF_SP01 );

				SetModeEx( boss , EM_SetModeType_Searchenemy , false );--�j��
				SetModeEx( boss , EM_SetModeType_Strikback , false );--����
				--DW_UnFight(boss,false);
				sleep( 20 );
				time=time+2;
				--DW_UnFight(boss,true);
				SetModeEx( boss , EM_SetModeType_Searchenemy , true );--�j��
				SetModeEx( boss , EM_SetModeType_Strikback , true );--����


				AddBuff( boss , 624802 , 0 , -1 );--�C���W�jATK�BMATK�BDEF�BMDEF 5%
				DebugMsg( 0 , 0 , "Boss Increse Level-------"..KJ_28BOSS3_CheckTargetBuffLevel( boss , 624802 ) );
				------------------------boss actions
				

				------------------------------soul containers actions
				--for _qq , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
				local _soulSaturation = false;
				for _qq = _maxSoulContainer , 1 , -1 do
					local _SCID = KJ_28BOSS3_soulContainerList[room][ _qq ];
					--DebugMsg( 0 , 0 , "  �F��e�� : ".._SCID );

					if( _SCID ~= nil and CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 )then--���F��e���|�s�ɤ~�@��
						for i,player in pairs(_alivePlayerList)do
							if(GetDistance(_SCID,player)<=75)then
								SysCastSpellLv(player,_SCID,851169,1);--�S��
							end
						end
						if(KJ_28BOSS3_CheckTargetBuffLevel(_SCID,624779)>=5)then
							CancelBuff_NoEvent(_SCID,624779);
							_soulSaturation = true;
						end
						DebugMsg( 0 , 0 , _SCID.."  �F��e���l���ͩR " );
					else
						------------------------------�F��e������
						DebugMsg( 0 , 0 , _qq.."  �F��e������ " );
						KJ_28BOSS3_soulContainerList[room][_qq]=KJ_28BOSS3_CreateSingleSoulContainer( boss );
						------------------------------�F��e������
					end
					
				end

				if ( _soulSaturation == true ) then--���F��e�����M�� �I�� ����A�G
					lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_LV5]",C_Red);--[107966]�q�������M���F��e���̱o��A�G�J�I�̪���q
					
					--SysCastSpellLv(boss,boss,851140,0);
					CastSpell(boss,boss,851140);

					GCD = 6;
					countDOWN.aeDot = ori_countDOWN.aeDot;
				end

				------------------------------soul containers actions


				------------------------players
				--�b���a���W�[�W�F��H��BUFF
				for _Index,_ID in pairs( _alivePlayerList ) do
					if( ReadRoleValue( _ID , EM_RoleValue_IsDead ) == 0 )then--�����~����BUFF   --�קK�ɶ��t  �A���@���ˬd
						AddBuff(  _ID , 624774 , 0 , -1);--�t���A�G
						AddBuff(  _ID , 624758 , 0 , -1);--�F��H��BUFF
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
			-----------------------------------END---------�t�����ͦ@��(per 20 sec)
--			--�l�v
--			if(countDOWN.bell_move==0)and(#_alivePlayerList>0)then
--				countDOWN.bell_move=rawget(ori_countDOWN,"bell_move");
--				for i=1,_maxSoulContainer,1 do
--					if(CheckID(KJ_28BOSS3_soulContainerList[room][i])==true)and(ReadRoleValue(KJ_28BOSS3_soulContainerList[room][i],EM_RoleValue_IsDead)==0)then
--						local r=DW_Rand(#_alivePlayerList);
--						SetFollow(KJ_28BOSS3_soulContainerList[room][i],_alivePlayerList[r]);
--					end
--				end
--			end

			--�F��e���t���ˮ`(Per 7 sec)
			if(countDOWN.container==0)then
				countDOWN.container=rawget(ori_countDOWN,"container");
				for _qq , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
					if CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 then
						SysCastSpellLv( _SCID , _SCID , 851164 , 0 );--�F��e���t���ˮ` + DOT
						DebugMsg( 0 , 0 , _SCID.."  �F��e���t���ˮ` + DOT " );
					end
				end
			end
			----------------------------------END----------�F��e���t���ˮ`(Per 7 sec)


			--Boss attackings
			---------------------------------�H�������ۦ�
			for i=1,1,1 do
				if(GCD~=0)then break;end
				if(countDOWN.ranATK~=0)then break;end
				if( totalplayer <= 0 )then break;end
				GCD = 2;
				countDOWN.ranATK = ori_countDOWN.ranATK;

				-----------actions
				--DebugMsg( 0 , 0 , boss.."  ���H�� !! " );
				if RandRange( 1 , 2 ) == 1 then --random ���
					CallPlot( boss , "KJ_28BOSS3_SingleTap" , 851144 , rand_pick_FromZero( _alivePlayerList , 1 ) );--�H�����@
				else												
					--CallPlot( boss , "KJ_28BOSS3_TripleTap" , 851144 , rand_pick_FromZero( _alivePlayerList , 3 ) );--�H�����T
					CastSpell(boss,boss,851281);
				end
				-----------actions
			end
			---------------------END--------�H�������ۦ�


			--------------------------------aeDot
			for __=1,1,1 do
				if(GCD~=0)then break;end
				if(countDOWN.aeDot~=0)then break;end
				if( totalplayer <= 0 )then break;end
				GCD = 3;
				countDOWN.aeDot = ori_countDOWN.aeDot;
			
				-----------actions
				CastSpell(  boss , boss , 851140 ) ;--AE+DOT�A�A�G�A����ɶ�8��
				Sleep( 20 );
				time=time+2;
				--ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP
				--DebugMsg( 0 , 0 , boss.."  AE+DOT�A�A�G�A����ɶ�8�� " );
				-----------actions
			end
			-----------------------END------aeDot



			--------------------------------�`���F��H��
			for __=1,1,1 do
				if(GCD~=0)then break;end
				if(countDOWN.collectSoul~=0)then break;end
				if( totalplayer <= 0 )then break;end
				GCD = 4;--�`�NGCD����(dead lock)
				countDOWN.collectSoul = ori_countDOWN.collectSoul;
			
				-----------actions
				--PlayMotion( boss , ruFUSION_ACTORSTATE_CAST_SP01 );
				--DebugMsg( 0 , 0 , boss.."  �`���F��H�� " );
				SetModeEx( boss , EM_SetModeType_Searchenemy , false );--�j��
				SetModeEx( boss , EM_SetModeType_Strikback , false );--����
				sleep(10);
				CastSpell(  boss , boss , 851162 ) ;
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_GAINSOUL]",0);--[107966]�ʰ�[108119]���O�q�A�F��Q�Z�ʪ��A�P�췥�׵h�W�I

				--DW_UnFight(boss,false);
				sleep( 30 );
				time=time+4;
				--DW_UnFight(boss,true);
				SetModeEx( boss , EM_SetModeType_Searchenemy , true );--�j��
				SetModeEx( boss , EM_SetModeType_Strikback , true );--����
				-----------actions
				
				-----------Players actions
				for _Index,_ID in pairs( _alivePlayerList ) do
					if(ReadRoleValue(_ID,EM_RoleValue_IsDead)==0)then--�����~����BUFF  --�קK�ɶ��t  �A���@���ˬd
						local _buffLevel = KJ_28BOSS3_CheckTargetBuffLevel( _ID , 624758 );--�������a���W�F��H���ƶq--624758�F��H��
						CancelBuff_NoEvent(  _ID , 624758 );--�F��H��BUFF  --�Q�l�� --�����H��BUFF
						--Say( _ID , "my soul has been taken !!"  );
						for _qq , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
							SysCastSpellLv( _ID , _SCID , 851163 , 0 );--�����F��H���Q�l���S��
							
							for i = 1 , _buffLevel , 1 do
								AddBuff( _SCID , 624803 , 0 , -1 );--624803�F��A_�e��   --�⪱�a���F��h���|�W�h
								AddBuff( boss , 624817 , 0 , -1 );--624817�F��A_Xeston  --��e�����F��h���|�W�h
							end
							--DebugMsg( 0 , 0 , _ID.."  �`���F��H���l���S�� ".._SCID );
--							if( ReadRoleValue( _SCID , EM_RoleValue_IsDead ) == 0 ) then--���K�N�w�����e���簣
--								table.remove( KJ_28BOSS3_soulContainerList[room] , _qq );
--							end
						end
						
					end
				end

				_currentCollectedSoul = _currentCollectedSoul + _currentPlayerSoul;--�`�����a�F��	
				--Say( boss , "I have ".._currentCollectedSoul.." souls , ".._currentPlayerSoul.." more !!" );								
				_currentPlayerSoul = 0;--�Q�`�����k�s
				-----------Players actions

			end

			----���F��e�������� �NBOSS ���W���|�[�ĪG���� 140225
			local _deadCounter = 0;
			for _index , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
				if _SCID ~= nil and CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 1 then
					_deadCounter = _deadCounter + 1;
				end

				if ( _deadCounter >= #KJ_28BOSS3_soulContainerList[room] ) then
					CancelBuff( boss , 624817 );--���F��e�������� �NBOSS ���W���|�[�ĪG���� 140225
				end
			end
			---------------------END--------�`���F��H��
		end--while--�԰��j��
		---���X�԰��j���
		DebugMsg( 0 , 0 , boss.."  �����԰��j�� " );

		--�Ѱ����ת�
		for pos=1,#Gate,1 do
			DelObj(Gate[pos]);
		end

		--------------�R���F��e��
--		for _qq = 1 , #KJ_28BOSS3_soulContainerList[room] , 1 do
--				DelObj( KJ_28BOSS3_soulContainerList[room][ _qq ] );--�R���F��e��
--		end
		for _index , _containerID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
				DelObj( _containerID );--�R���F��e��
		end
		KJ_28BOSS3_soulContainerList[room] = nil;
		---------------�R���F��e��
		--�T�{���`�άO���}�԰�
		KJ_28BOSS3_isUnderCombat = false;	
		if _resetOrNot==false then
			
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_END]",0);--[107966]�ˤU��A����Y�ҥ������A�~���������A�A���F��w���k��@�B�A�驻����Ƴ������o��
			DelObj(Ctrl);
			DelObj( _backDoor );
			return;
		else
			--���}�԰�
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FAIL]",0);--[107966]��ڳ�ڪ��A���G�b���g�A�j�j�F������A�@�ƫD�`���N���ҼˡC
			DebugMsg( 0 , 0 , boss.." ----�Ұʭ��m�y�{------" );
			
			CallPlot( boss , "KJ_28BOSS_ResetBoss", Ctrl , boss , room , _backDoor );
			--KJ_28BOSS_ResetBoss( Ctrl , boss , room );
		end
		DelObj(Ctrl);
	end--function KJ_28BOSS3_Ctrl
	
end--function KJ_28BOSS3_Init
-----------------------------------------------------------------------






----------------------sub actions--------------------------���������ʧ@
	function KJ_28BOSS3_SingleTap(  _InputSkillID , _InputEnemyList )--�������
		
		--75 yard
		local _effectRange = 75; --�j�M�d�� & �����Z��
		local _bossID = OwnerID();
		local _skillID = _InputSkillID;--850811;--for temporary

		local _enemyList = _InputEnemyList;--SearchRangePlayer( _bossID , _effectRange );--�j�M�M��
		local _enemyAround = false;
		
		local _currentEnemy;		

		--DebugMsg( 0 , 0 , _bossID.."  KJ_28BOSS3_SingleTap " );
		
			for i = 1 , #_enemyList , 1 do
				_currentEnemy = _enemyList[ i ];
				if ( ReadRoleValue(  _currentEnemy , EM_RoleValue_HP ) > 0 ) then--�T�{���a�ͦs���A
					_enemyAround = true;
					SetAttack( _bossID , _currentEnemy );
					CastSpell( _bossID , _currentEnemy , _SkillID ) ;
					--WriteRoleValue( _currentEnemy , EM_RoleValue_HP , 0 );
					--WriteRoleValue( _currentEnemy , EM_RoleValue_IsDead , 1 );
					--Say( _bossID , "attacking  "..i.." _  ".._currentEnemy );
					break;
				end--�Y���a�w���`�h�~��j�M�U�@�ӥؼ�
			end--for

			if _enemyAround == false then--��Ĥ@���S������H��
				--�ҥ~�B�z
				--���쪱�a�s || ���s�j�M���a�M��
			end

	end--function 28BOSS3_SingleTap


	function KJ_28BOSS3_TripleTap( _InputSkillID , _InputEnemyList )--�H�����T�H
		local _effectRange = 500; --�j�M�d�� & �����Z��
		local _bossID = OwnerID();
		local _skillID = _InputSkillID;--851117;--for temporary
		
		local _maxTarget = 3;--�̦h���I�T��
		local _enemyList = _InputEnemyList;--SearchRangePlayer( _bossID , _effectRange );--�j�M�M��
		local _enemyAround = false;
		
		local _currentEfficaciousTargetCount = 0;--�ثe���ĥؼЭp��
		local _currentEnemy;
		DebugMsg( 0 , 0 , _bossID.."  KJ_28BOSS3_TripleTap " );
		
		
		for i = 1 , #_enemyList  , 1 do
			_currentEnemy = _enemyList[ i ];

				if _currentEfficaciousTargetCount < _maxTarget then--
					
					if ( ReadRoleValue(  _currentEnemy , EM_RoleValue_HP ) > 0 ) then--���a�s��  �~��@���Ī�������H
						_enemyAround = true;
						_currentEfficaciousTargetCount = _currentEfficaciousTargetCount+1;
						--CastSpell( _bossID , _enemyList[ i ] , _SkillID ) ;
						SetAttack( _bossID , _currentEnemy );
						SysCastSpellLv( _bossID , _currentEnemy , _SkillID , 100 );
						--�I��ۦ�
						--Say( _bossID , "triple attacking  ".._currentEfficaciousTargetCount.." _  ".._currentEnemy );
					end--

				else
					break;	--�h�l�W���h���_
				end

		end--end for


--		if _currentEfficaciousTargetCount <= 0 then
--			Say( _bossID , "there's no one survive !! ha ha ha ha......" );
--		end

		if _enemyAround == false then--��Ĥ@���S������H��
			--�ҥ~�B�z
			--���쪱�a�s || ���s�j�M���a�M��
		end
		
	end--function 28BOSS3_TripleTap
----------------------sub actions--------------------------
-------------------------------------------------END------------------���������ʧ@



-----------------------------------------------------------------------�F��e���ʧ@


	function KJ_28BOSS3_CreateSingleSoulContainer( _InputReferenceTargetID )
		DebugMsg(0,0,"����KJ_28BOSS3_CreateSingleSoulContainer");
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

		local _objectID = _fellowsGUIDs[ _difficulty ];--�F��e��

		local _targetList = Lua_RandomPlayerFromHateList( _InputReferenceTargetID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
		local _targetID = _targetList[ 1 ];
		local x,y,z,dir = DW_Location( _targetID );

		local _currentMonster = CreateObj(  _objectID , x , y , z , dir , 1 );

		SetModeEx( _currentMonster , EM_SetModeType_Searchenemy , true );--�j��
		SetModeEx( _currentMonster , EM_SetModeType_Strikback , false );--����
		MoveToFlagEnabled( _currentMonster , false );--�������޲���	

		AddToPartition( _currentMonster , _roomID );
		AddBuff( _currentMonster , 505653 , 0 , -1 );--505653���^��
		CallPlot( _currentMonster ,"KJ_28BOSS3_tokenRULE", _InputReferenceTargetID );--auto destroy

		return _currentMonster;
	end

-----------------------------------------------END------------�F��e���ʧ@










--------------------------------------------------------------------------------------------public tools
---------------------------�۰ʧR������
function KJ_28BOSS3_tokenRULE(Ctrl)--�l�ͪ��W�h�A�H�D�ʦs��
	local token = OwnerID();
	if not Ctrl then
		return false;
	end
	while CheckID(Ctrl) and ReadRoleValue(Ctrl,EM_RoleValue_IsDead)==0 do	
		sleep(20);
	end
	DelObj(token);
end
---------------------------�۰ʧR������



function KJ_28BOSS3_ClearAllBuff( _InputList )--�M����HBUFF (�`�N���m���A)
	for _Index,_ID in pairs( _InputList ) do
		CancelBuff_NoEvent(  _ID , 624758 );--�F��H��BUFF
		CancelBuff_NoEvent(  _ID , 624732 );--28BOSS3_SingleTap_Debuff
		CancelBuff_NoEvent(  _ID , 624774 );--�t���A�G
		--DebugMsg( 0 , 0 , _ID.."  �M��BUFF " );
	end
end


function KJ_28BOSS3_CheckTargetBuffLevel( _InputTargetID , _InputBuffID )--�ˬd�ؼШ��W��BUFF����(�|�[�ż�)   �Y�䤣��h�^��-1    
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


function KJ_28BOSS3_ShootTargetScript()--�@�����3�ӥؼ�
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
--	���B�ק�
--	���`�@��
---------------------------------------------------------------------
function npc_107966_dead()
	local _backDoor = ReadRoleValue( OwnerID() , EM_RoleValue_Register10 );--���ID	--140428
	DelObj( _backDoor );

--	�����ٸ�
	sasa_ZoneDungeon_title_01(530927)
--	���b�Ѱ�
	Cl_Resist_HackersBossDead()
end