--K.J. Aris
--13.07.10.10.28
--28 BOSS-3-靈魂容器

--SC  = Soul Container
--_28BOSS3_SC_7sec_Cycle_Action = false;
--
---------------------------Switch----------------------
--function KJ_28BOSS3_SC_SetInitStatus()
--	--初始狀態
--	local _bossID = OwnerID();
--	KJ_28BOSS_SetActive( _bossID , false );
--
--	Sleep( 30 );
--
--	CallPlot( _bossID ,"KJ_28BOSS3_SC_ACTION" );
--end
--
--
--function KJ_28BOSS3_SC_ACTION()--開始動作
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
--function KJ_28BOSS3_SC_CUT()--停止動作
--	_28BOSS3_SC_7sec_Cycle_Action = false;--中斷7秒循環
--	KJ_28BOSS_SetActive( _bossID , false );
--	DebugMsg( 0 , 0 , "  KJ_28BOSS3_SC_CUT " );
--end
---------------------------Switch-----------------------end
--
--function KJ_28BOSS3_SC_7sec_Cycle( _InputSkillID )
--	--靈魂容器每7秒會在周圍的地面浮現光輝傷害(75碼)，並且附帶4秒的DOT。
--	_28BOSS3_SC_7sec_Cycle_Action = true;--為了可以中斷動作
--
--	local _bossID = OwnerID();
--	local _delayer = 70;--每7秒施放
--
--	local _bossHP = ReadRoleValue(  _bossID , EM_RoleValue_HP );
--	local _skillDelayer = 30;--施放技能的延遲時間 3sec
--
--	while ( _bossHP > 0 ) AND _28BOSS3_SC_7sec_Cycle_Action == true do--當BOSS還活著時才執行
--		Sleep( _delayer );
--
--		CastSpell(  _bossID , _bossID , _InputSkillID ) ;--光輝傷害+DOT，持續時間4秒
--		DebugMsg( 0 , 0 , _bossID.."  光輝傷害+DOT，持續時間4秒" );
--
--		Sleep( _skillDelayer );
--	end
--	
--end--function KJ_28BOSS3_SC_7sec_Cycle

--108119
--靈魂容器
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