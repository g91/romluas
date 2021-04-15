--K.J. Aris
--13.07.03.11.54
--_currentPetList = {};

function lua_kj_test()
	say( OwnerID() , "Raise and follow" );
	--say( ownerid() , ownerid() );
	--lua_kj_AddObj();
	CallPlot( OwnerID() ,"lua_kj_AddObj", 1 );
end

function lua_kj_AddObj( _InputMax )
--	for i , _content in ipairs( _currentPetList )
--		delobj( _content );
--	end

	local _ObjID = 108430;
	local _CurrentMonster;
	local _Monster = {};

	local _currentMaster = OwnerID();
	local _currentMasterLocX = ReadRoleValue( _currentMaster , EM_RoleValue_X );
	local _currentMasterLocY = ReadRoleValue( _currentMaster , EM_RoleValue_Y );
	local _currentMasterLocZ = ReadRoleValue( _currentMaster , EM_RoleValue_Z );
	
	for i=1 , _InputMax , 1 do
		_CurrentMonster = _Monster[ i ];
	 	--_CurrentMonster = CreateObj(  _ObjID , 100 , -257 , 100*i , 90*i , 1 );
		_CurrentMonster = CreateObj(  _ObjID , _currentMasterLocX , _currentMasterLocY , _currentMasterLocZ , 90*i , 1 );
		AddToPartition( _CurrentMonster , 0 );
		SetFollow( _CurrentMonster , _currentMaster );
		say( _CurrentMonster , "I'll follow for 150 sec" );

		SetModeEx( _CurrentMonster , EM_SetModeType_Revive , false );
		WriteRoleValue( _CurrentMonster , EM_RoleValue_LiveTime , 150 );

		--CallPlot( _CurrentMonster ,"onTimesUp", OwnerID() );
		CallPlot( _CurrentMonster ,"combatHelper", _currentMaster );
		--table.insert( _currentPetList , _CurrentMonster );
	end
end


function combatHelper(  _InputTarget  )
	local _currentMaster = AddyPlayer:new( _InputTarget );
	local _currentHelper = AddyNpc:new(OwnerID());
	local _currentAttackingTarget = ReadRoleValue( _currentMaster.GUID , EM_RoleValue_AttackTargetID );
	while true do
		if  _currentAttackingTarget ~= 0 then
			--say( _currentHelper , "I'll help " .. _currentAttackingTarget );
			--_currentHelper:say( "I'll help " .._currentAttackingTarget );
			SetAttack( _currentHelper.GUID , _currentAttackingTarget );
		else
			SetFollow( _currentHelper.GUID  , _currentMaster.GUID  );
		end
		_currentAttackingTarget = ReadRoleValue( _currentMaster.GUID , EM_RoleValue_AttackTargetID );
		--say( _currentHelper.GUID ,  _currentAttackingTarget );
		--_currentHelper:say( _currentAttackingTarget );
		sleep( 10 );
	end
end





function onTimesUp(  _InputTarget  )
--	while true do
--		if( ( GetDistance( _InputTarget, OwnerID() ) ) < 30 )then
--				local _Lyric = OwnerID() .. " I got you !!";
--				say( OwnerID() , _Lyric );
--				delobj( OwnerID() );			
--			break;
--		end
--		sleep( 10 );
--	end

	local target = AddyPlayer:new(_InputTarget)
	local girl = AddyNpc:new(OwnerID())
	while true do
		if girl:distanceTo(target) < 30 then
			girl:say(girl.GUID .. " I got you!!")
			girl:delete()
		end
		sleep( 10 );
	end
end