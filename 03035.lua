--K.J. Aris
--13.07.10.10.28
--28 BOSS-3-�F��e��

--SC  = Soul Container
--_28BOSS3_SC_7sec_Cycle_Action = false;
--
---------------------------Switch----------------------
--function KJ_28BOSS3_SC_SetInitStatus()
--	--��l���A
--	local _bossID = OwnerID();
--	KJ_28BOSS_SetActive( _bossID , false );
--
--	Sleep( 30 );
--
--	CallPlot( _bossID ,"KJ_28BOSS3_SC_ACTION" );
--end
--
--
--function KJ_28BOSS3_SC_ACTION()--�}�l�ʧ@
--	--settings
--	local _bossID = OwnerID();
--
--	--7sec_Cycle skill
--	local _7sec_CycleSkillID = 851140;
--	KJ_28BOSS_SetActive( _bossID , true );
--
--	--settings
--	CallPlot( _bossID , "KJ_28BOSS3_SC_HP_Absorb" );
--	CallPlot( _bossID , "KJ_28BOSS3_SC_7sec_Cycle" , _7sec_CycleSkillID );
--
--end
--
--function KJ_28BOSS3_SC_CUT()--����ʧ@
--	_28BOSS3_SC_7sec_Cycle_Action = false;--���_7��`��
--	KJ_28BOSS_SetActive( _bossID , false );
--	DebugMsg( 0 , 0 , "  KJ_28BOSS3_SC_CUT " );
--end
---------------------------Switch-----------------------end
--
--function KJ_28BOSS3_SC_7sec_Cycle( _InputSkillID )
--	--�F��e���C7��|�b�P�򪺦a���B�{�����ˮ`(75�X)�A�åB���a4��DOT�C
--	_28BOSS3_SC_7sec_Cycle_Action = true;--���F�i�H���_�ʧ@
--
--	local _bossID = OwnerID();
--	local _delayer = 70;--�C7��I��
--
--	local _bossHP = ReadRoleValue(  _bossID , EM_RoleValue_HP );
--	local _skillDelayer = 30;--�I��ޯ઺����ɶ� 3sec
--
--	while ( _bossHP > 0 ) AND _28BOSS3_SC_7sec_Cycle_Action == true do--��BOSS�٬��ۮɤ~����
--		Sleep( _delayer );
--
--		CastSpell(  _bossID , _bossID , _InputSkillID ) ;--�����ˮ`+DOT�A����ɶ�4��
--		DebugMsg( 0 , 0 , _bossID.."  �����ˮ`+DOT�A����ɶ�4��" );
--
--		Sleep( _skillDelayer );
--	end
--	
--end--function KJ_28BOSS3_SC_7sec_Cycle

--108119
--�F��e��
--804240







--function KJ_28BOSS3_SC_RandomPicOneFromList( _InputList )
--	local totalplayer = 0;
--	for _qq = 0 , 100 , 1 do
--		if( PlayerList[ _qq ] == -1 ) then break; end
--		totalplayer = totalplayer + 1;
--	end
--
--	local _randomIndex = RandRange( 0 , totalplayer - 1 );
--	return _InputList[ _randomIndex ];
--end
--
--