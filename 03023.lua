--K.J. Aris
--13.07.03.11.54
--_currentPetList = {};

function lua_kj_skilltest()
	say( OwnerID() , "Raise and Play" );
	--say( ownerid() , ownerid() );
	--lua_kj_AddObj();
	CallPlot( OwnerID() ,"lua_kj_SatrtSkillTest", 6 );
end

function lua_kj_SatrtSkillTest( _InputMax )

	local _ObjID = 104126;--122772;
	local _SkillID = 851117;--851112
	local _CurrentMonster;
	local _Monster = {};

	local _currentMaster = OwnerID();
	local _currentMasterLocX = ReadRoleValue( _currentMaster , EM_RoleValue_X );
	local _currentMasterLocY = ReadRoleValue( _currentMaster , EM_RoleValue_Y );
	local _currentMasterLocZ = ReadRoleValue( _currentMaster , EM_RoleValue_Z );
	
	for i=1 , _InputMax , 1 do
		_CurrentMonster = _Monster[ i ];
	 	--_CurrentMonster = CreateObj(  _ObjID , 100 , -257 , 100*i , 90*i , 1 );
		
		_CurrentMonster = CreateObj(  _ObjID , _currentMasterLocX + RandRange( 20, 40 )*i , _currentMasterLocY , _currentMasterLocZ + RandRange( 20 , 40 )*i , 90*i , 1 );
		AddToPartition( _CurrentMonster , 0 );
	--	SetFollow( _CurrentMonster , _currentMaster );
		say( _CurrentMonster , "I'll Play" );
		--CallPlot( _CurrentMonster ,"onTimesUp", OwnerID() );
		--CallPlot( _CurrentMonster ,"combatHelper", _currentMaster );
		table.insert( _Monster , _CurrentMonster );
		
	end

	for i , _content in ipairs( _Monster ) do
		_CurrentMonster = _Monster[ i ];
		say( _CurrentMonster , "I'll do "..i );
		if ( table.maxn( _Monster ) == 1 ) then
			say( _CurrentMonster , "Only One" );
			CastSpell( _CurrentMonster , _currentMaster , _SkillID ) ;
		elseif ( i >= table.maxn( _Monster ) AND i ~= 1 ) then
			say( _CurrentMonster , i.." Attack 1" );
			CastSpell( _CurrentMonster , _Monster[ 1 ] , _SkillID ) ;
		else
			say( _CurrentMonster , i.." Attack "..i+1 );
			CastSpell( _CurrentMonster , _Monster[ i + 1 ] , _SkillID ) ;
		end
		--WriteRoleValue( _CurrentMonster , EM_RoleValue_livetime , 15 );
		WriteRoleValue( _CurrentMonster , EM_RoleValue_LiveTime , 15 );
	end

		
	--	sleep( 150 );

--	for j , _content in ipairs( _Monster ) do
--		DelObj( _Monster[ j ] );
--	end	

	
end


