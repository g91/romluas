
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
	--�X�f���ת�
	local _X,_Y,_Z,_Dir=1143.6,3545,1640.8,258.7;
	local _CtrlDoor_Exit=CreateObj(106247,_X,_Y,_Z,_Dir,1);
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_HideName , true );	--����ܦW��
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _CtrlDoor_Exit , EM_SetModeType_Obstruct , true );	--�����׮ĪG
	LockHP( _CtrlDoor_Exit , 100 , "" );--�קK���Q����
	AddToPartition(_CtrlDoor_Exit,room);
	Lua_702951_DelDuplicateDoor( _CtrlDoor_Exit , 106247 );--�קK������
	Cl_Resist_HackersBossNum();
	WriteRoleValue( _Boss , EM_RoleValue_Register10 , _CtrlDoor_Exit );--�������ID

	function BY_28_CreateAll()
		local _Boss=OwnerID( );
		local room=ReadRoleValue(_Boss,EM_RoleValue_RoomID);
		--�J�f���ת�
		local _X,_Y,_Z,_Dir=1335.8,3544.5,917.3,74;--74
		local _CtrlDoor_Entrance=CreateObj(106247,_X,_Y,_Z,_Dir,1);--106249
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Mark , false );	--���i�I��
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_HideName , true );	--����ܦW��
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Strikback , false );	--���|����
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Move , false );	--���|����
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Fight , false );	--���i����
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Searchenemy , false );	--���|����
		SetModeEx( _CtrlDoor_Entrance , EM_SetModeType_Obstruct , true );	--�����׮ĪG
		LockHP( _CtrlDoor_Entrance , 100 , "" );--�קK���Q����
		AddToPartition(_CtrlDoor_Entrance,room);
		Lua_702951_DelDuplicateDoor( _CtrlDoor_Entrance , 106247 );--�קK������
		local _CtrlDoor_Exit = ReadRoleValue( _Boss , EM_RoleValue_Register10 );--�������ID
--		--�X�f���ת�
--		local _X,_Y,_Z,_Dir=1143.6,3545,1640.8,258.7;
--		local _CtrlDoor_Exit=CreateObj(106247,_X,_Y,_Z,_Dir,1);
--		SetModeEx(_CtrlDoor_Exit,EM_SetModeType_Obstruct,true);--�|����(���ר�L������)
--		SetModeEx( _CtrlDoor_Exit, EM_SetModeType_Mark, false );
--		SetModeEx( _CtrlDoor_Exit, EM_SetModeType_Searchenemy , false );
--		SetModeEx(_CtrlDoor_Exit, EM_SetModeType_Fight , false );
--		SetModeEx( _CtrlDoor_Exit, EM_SetModeType_Strikback , false );
--		AddToPartition(_CtrlDoor_Exit,room);
		--���������
		local _X,_Y,_Z,_Dir = 1247.2 , 3541.5 , 1256.1 , 74;
		local _CtrlBox=CreateObj(110987,_X,_Y,_Z,_Dir,1);
		SetModeEx( _CtrlBox, EM_SetModeType_Show , false );
	--	SetModeEx( _CtrlBox, EM_SetModeType_Fight , false );
		AddToPartition(_CtrlBox,room);
		--�p��
		local _Monster={ };
		local _MonsterNum=6;--�p�ǰ���
		for i=1,_MonsterNum,1 do
			_Monster[ i ]=0;
		end
		--����ʧ@
		CallPlot(_CtrlBox,"BY_28_BossCtrl",_CtrlBox,_Boss,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);
		Cl_Resist_HackersFightBegin()	--���b�Ⱦ���_�԰��}�l_BICO
	end
	function BY_28_BossCtrl( _CtrlBox,_Boss,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit)
		local room=ReadRoleValue(_Boss,EM_RoleValue_RoomID);
		local zone=ReadRoleValue(_Boss,EM_RoleValue_ZoneID);
		local _timer=0;
		local _countDown ={ 
					_7SecCD=7;--Boss7��I�k
					_30SecCD=30;--Boss30��I�k
					_5SecCD=5;--�p��5��I�k
					_BossSlowNum=49;--Boss�w�t�k�N����
					}
		local fury_course=false;--�g�ɼҦ�
		local _ctrlBossSlow=false;--Boss�w�t����
		--local _ctrlBossReset=false;--Boss���]����
		local _ctrlBossInitial=false;--Boss��l����
		lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_START]",0);--��|�̪��i�Ƥ覡��M�M��L��ù���P�A�����ƪ������֩w������סI

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

		--�԰��j��
		while true  do
			--Boss���s�b �R�������W�Ҧ��F�� ����԰�
			if CheckID(_Boss)==false or ReadRoleValue(_Boss,EM_RoleValue_IsDead)==1 then 
				BY_28_RemoveAll(_CtrlBox,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);--�R����������
				break ;
			end
			--�P�_�԰����A
			local _BossHateListNum=HateListCount(_Boss);--���o����C������ƶq
			if _BossHateListNum~=0 then 
				--SetModeEx(_CtrlDoor_Entrance,EM_SetModeType_Obstruct,true); --�԰��}�l �����J�f��
			else
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_FAIL]",0);--��|�̵o�X�@�}�����S�����n���A�C�C���^��ۤv�^��W�C
				_ctrlBossInitial=true;--����԰� Boss ��l
				break;
			end 
			--�p��
			sleep(10);
			_timer=_timer+1;
			_countDown._7SecCD=_countDown._7SecCD-1;
			_countDown._30SecCD=_countDown._30SecCD-1;
			--Boss�w�t�P�_
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
			--�g�ɾ���
			if(zone~=162)and(fury_course==false)then
				if(zone==160)and(_timer>=480)then
					fury_course=true;
				elseif(zone==161)and(_timer>=360)then
					fury_course=true;
				end
				if(fury_course==true)then
					AddBuff(_Boss,624344,0,-1);
					lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_FURY]",0);--��|�̷P����_�ު��C��A�}�l���J�Y�غƨg���A�I
				end
			end
			--7��k�N
			if _countDown._7SecCD==0 then
				castspell(_Boss,_Boss,851139);
				_countDown._7SecCD=7;
			end
			--30��k�N
			if _countDown._30SecCD==0 then
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_FATAL]",0);--��|�̶}�l�W�s��q�A���U�ӳo�@�����¤O�N�L�H��סI
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
				SyscastspellLv( _Boss,_Boss,851145,1);--Boss�ϼu��
				AddBuff(_Boss,624759,_countDown._BossSlowNum,-1);--�w�t50
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_WEAK]",0);--���M��|�̪��t�ר���A�~�o�@�����v�T�A�����ܧִN���_�L�ӡI
				_ctrlBossSlow=true;
				--�P�_�p�Ǫ��A
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
					SysCastSpellLv(_Monster[ i ],_Monster[ i ],492504,1);--�p�Ǥϼu��	
				end
				_countDown._30SecCD=30;
			end
			--�p�Ǧ�q�P�_
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
				lua_28in_Boss5_broadcast(0,"[SC_28IN_BOSS2_CANCEL]",C_YELLOW);--���K�̱a�Ӫ��@�ޮĪG���ۥL�̪��ˤU�Ӯ����I
			end
			--�P�_�p��Ū��P�O�_�I��@��k�N
			_countDown._5SecCD=(#_MonsterList>=2 ) and _countDown._5SecCD-1 or 5;
			if _countDown._5SecCD==0 then
				for i=1,#_MonsterList-1,1 do
					castspell(_Monster[ i ],_Monster[ i+1 ],851147);--�@��k�N�v��
					castspell(_Monster[ i+1 ],_Monster[ i ],851147);--�@��k�N�v��
					Sleep(5);	
					SyscastspellLv(_Monster[ i ],_Monster[ i+1 ],851148,1);--�@�缾�a�ˮ`�ĪG
					Sleep(5);
					SyscastspellLv(_Monster[ i+1 ],_Monster[ i ],851148,1);--�@�缾�a�ˮ`�ĪG
					SyscastspellLv(_Monster[ i ],_Monster[ i+1 ],492505,1);--�@��BOSS�ĪG
					Sleep(5);
					SyscastspellLv(_Monster[ i+1],_Monster[ i ],492505,1);--�@��BOSS�ĪG
					_timer=_timer+1.5;
				end
				_countDown._5SecCD=5;
			end
			--�P�_Boss���]�d��
			local _BossLocation=GetDistance(_CtrlBox,_Boss);
			if _BossLocation>=380 then
				CancelBuff(_Boss,624759);
				DelFromPartition( _Boss ) ;
				--_ctrlBossReset=true;
				_ctrlBossInitial=true;
				break;
			end
		end
		--Boss���]
--[[
		if _ctrlBossReset==true then
			Sleep(50);
			local _X,_Y,_Z,_Dir=DW_Location(_CtrlBox);
			SetPos(_Boss,_X,_Y,_Z,_Dir);
			AddToPartition(_Boss,room);
			BY_28_RemoveAll(_CtrlBox,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);--�R����������
		end
]]--
		--Boss��l
		if _ctrlBossInitial==true then
			CancelBuff(_Boss,624759);
			DelFromPartition( _Boss ) ;
			Sleep(20);
			--ReSetNPCInfo(_Boss);--131217 K.J. Aris
			Sleep(20);
			AddToPartition(_Boss,room);
			BY_28_RemoveAll( _CtrlBox , _Monster , _CtrlDoor_Entrance , 0);--�R����������
			--WriteRoleValue( _Boss , EM_RoleValue_Register10 , _CtrlDoor_Exit );--�������ID
		else
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS2_END]",0);--�b�ѯ}��|�̪��ޭǫ�A��z�I�K�����n�S�X�ӡA�o�W��ù�ש󤣥̪��ˤU......
			BY_28_RemoveAll(_CtrlBox,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit);--�R����������
		end
	end
end --function BY_28_Init
--�R����������
function BY_28_RemoveAll(_CtrlBox,_Monster,_CtrlDoor_Entrance,_CtrlDoor_Exit)
	for i=1,#_Monster,1 do
		DelObj( _Monster[ i ] );	
	end
	DelObj(_CtrlDoor_Entrance);
	DelObj(_CtrlDoor_Exit);
	DelObj(_CtrlBox);
end
function BY_28_OnlyBoss()--�u��boss����
	local who=TargetID();
	if(ReadRoleValue(who,EM_RoleValue_SEX)>=3)then
		return true;
	else
		return false;
	end
end

function BY_28_Dead()
	local _backDoor = ReadRoleValue( OwnerID() , EM_RoleValue_Register10 );--���ID	--140428
	DelObj( _backDoor );
	Cl_Resist_HackersBossDead();
end