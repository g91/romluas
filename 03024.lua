

_TabE={ };
_MyTeam={ };
_My=0;

function BY_AddEnemy(  )
--	Sleep(100);
	_My=OwnerID();
	local _EID=105898;--105898;
	_TabE[1]=CreateObj(_EID,100,-257,110,110,1);
	AddToPartition(_TabE[1],0);
	--CallPlot( _TabE[1] ,"By_CheckStatus", OwnerID() );
	
	local _ObjID=107977;--122770
	local _x,_y,_z,_dir=DW_Location(TargetID());
	local _Num;
	for i=1,10,1 do
		if i<=5 then
			_MyTeam[i]=CreateObj(_ObjID,_x,_y,_z+i*30,_dir,1);	
		else
			_Num=i-5;
			_MyTeam[i]=CreateObj(_ObjID,_x,_y,_z-_Num*30,_dir,1);	
		end
		WriteRoleValue( _MyTeam[ i ] , EM_RoleValue_LiveTime , 30 );
		AddToPartition(_MyTeam[ i ],0);
		SetModeEx( _MyTeam[ i ], EM_SetModeType_Searchenemy , false );
		SetModeEx( _MyTeam[ i ] , EM_SetModeType_Fight , false );
		SetModeEx( _MyTeam[ i ], EM_SetModeType_Strikback , false );
	end

	BY_CheckPlayer();
--	ScriptMessage(_My,-1,2,"123456789",0);
--	By_CheckStatus( _My );
--	BY_SetTimer(20,3,BY_SettingFollow);
--	CallPlot( _My , "BY_SetTimer" ,0, 10,2,"BY_PlaySkills" );
--	CallPlot( _My , "BY_SetTimer" ,0, 20,3,"BY_SettingFollow" );
End

function BY_CheckPlayer()
	local _PlyTable = SearchRangePlayer ( _TabE[1] , 500 );
		DebugMsg(0,0,#_PlyTable);
	for j=0,#_PlyTable-1,1 do
		DebugMsg(0,0,_PlyTable[ j ]);
	end
end

function By_CheckStatus( InputTarget   )
	local _currentAttackingTarget = ReadRoleValue( InputTarget , EM_RoleValue_AttackTargetID );
	while true do
		if  _currentAttackingTarget ~= 0 then
			DebugMsg(0,0,"Atk");
			BY_SettingAtk(_currentAttackingTarget);
		else
			DebugMsg(0,0,"Follow");
			BY_SettingFollow();
		end
		_currentAttackingTarget = ReadRoleValue( InputTarget, EM_RoleValue_AttackTargetID );
		sleep( 10 );
	end
end

function BY_SettingAtk( _currentAttackingTarget )
	local _Len=#_MyTeam;
	for i=1,_Len,1 do
		castspell(_MyTeam[i],_currentAttackingTarget,851112);
	--	SetAttack(  _MyTeam[i] ,_currentAttackingTarget );
	end
end
function BY_SettingFollow(  )
	local _Len=#_MyTeam;
	for i=1,_Len,1 do
	--	castspell(_MyTeam[i],_Monster[1],851112);
	--	SetFollow(  _MyTeam[i] ,_My );
		castspell(_MyTeam[i],_TabE[1],851112);
	end

end

function BY_PlaySkills(  )
	DebugMsg(0,0,"123456789");
end

--_TimerNum=0;
function BY_SetTimer( _TimerNum,_Timer,_StopTimer,_FunctionName)
	Sleep(_Timer);
	DebugMsg(0,0,_TimerNum);
--	DebugMsg(0,0,_FunctionName);
	if _TimerNum==_StopTimer then
	--	_FunctionName();
		CallPlot( _My , _FunctionName );
		_TimerNum=0;
		BY_SetTimer( 0,_Timer,_StopTimer,_FunctionName );
	else
		_TimerNum=_TimerNum+1;
		BY_SetTimer( _TimerNum,_Timer,_StopTimer,_FunctionName );
	end
end