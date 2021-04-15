--K.J. Aris
--13.07.03.11.54
--_currentPetList = {};

function lua_kj_npcTest()
	say( OwnerID() , "Rock" );
	CallPlot( OwnerID() ,"lua_kj_CallNpcSkill" );
end

function lua_kj_CallNpcSkill(  )
--	for i , _content in ipairs( _currentPetList )
--		delobj( _content );
--	end

	local _skillID = 851136;
	local _CurrentMonster;
	local _Monster = {};
	local _lifeTime = 180;

	local _currentMaster = OwnerID();

	CastSpell( _currentMaster , _currentMaster , _skillID ) ;

end