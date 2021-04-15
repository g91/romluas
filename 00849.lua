function Bomb_01()
	--PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	local Bomb = CreateMonsterByBOSSBatch( 100912 , OwnerID() , 0 , 0 )
	SetPlot( Bomb ,"Dead" , "Bomb_01_DEAD" , 0 )
	--BeginPlot( Bomb, "Bomb_01_USE" , 0 )
	--PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_END )
end

function Bomb_01_DEAD()
	BeginPlot( OwnerID() , "Bomb_01_USE" , 0 )
	return false
end

function Bomb_01_USE()
	--Say( OwnerID() , "BOMB!!")
	CastSpell( OwnerID() , OwnerID() , 491283 )
	Sleep( 10 )
	Delobj( OwnerID() )
end