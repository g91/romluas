--K.J. Aris
--13.07.10.10.28


--_28BOSS3_SBell = 0;--聖鐘
--_28BOSS3_BOSS = 0;--BOSSID
--_28BOSS3_SoulContainer = {};--靈魂容器物件ID

function KJ_28BOSS3_Test(  )
	
	local _ObjID = 107966;--108145;--108131;
	
	--local _currentMaster = OwnerID();
	--local _currentMasterLocX = ReadRoleValue( _currentMaster , EM_RoleValue_X );
	--local _currentMasterLocY = ReadRoleValue( _currentMaster , EM_RoleValue_Y );
	--local _currentMasterLocZ = ReadRoleValue( _currentMaster , EM_RoleValue_Z );
	
	local _currentMonster;
		
		
		--_currentMonster = CreateObj(  _ObjID , _currentMasterLocX , _currentMasterLocY , _currentMasterLocZ , 90 , 1 );
		_currentMonster = CreateObj(  _ObjID  , 223 , 3539 , 1077 , 266.6 , 1 );
		--SetPos( _InputBossID , 255 , 3539 , 1087 , 166.3 );
		AddToPartition( _currentMonster , 0 );
		--SetFollow( _CurrentMonster , _currentMaster );
		say( _currentMonster , "KJ_28BOSS3_Test" );
		--WriteRoleValue( _currentMonster , EM_RoleValue_LiveTime , 150 )
		
		--CallPlot( _currentMonster ,"KJ_28BOSS3_SetInitStatus" );
		--CallPlot( _currentMonster ,"KJ_28BOSS3_InCombat" );
		
end