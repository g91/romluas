function LuaS_BattleFeild_TESTA()
	LoadQuestOption( OwnerID() );  
	AddSpeakOption( OwnerID(), TargetID(), "請讓我加入白方", "Lua_BattleFeild_A",0 )		
end

function LuaS_BattleFeild_TESTB()
	LoadQuestOption( OwnerID() );  	
	AddSpeakOption( OwnerID(), TargetID(), "請讓我加入黑方", "Lua_BattleFeild_B",0 )	
end

function Lua_BattleFeild_A()
	CloseSpeak( OwnerID() );
	local Obj = Role:new( OwnerID() )
	if SetRoleCamp( OwnerID() , "CAMPA" ) then
		Obj:SetEq( EM_EQWearPos_Back , 220836 );
--		ChangeZone( OwnerID() , 15 , 0, 5525, 53, -3074, 52) --Go To Camp Point
	end
end

function Lua_BattleFeild_B()
	CloseSpeak( OwnerID() );
	local Obj = Role:new( OwnerID() )
	if SetRoleCamp( OwnerID() , "CAMPB" ) then
		Obj:SetEq( EM_EQWearPos_Back , 220837 );
--		ChangeZone( OwnerID() , 15 , 0, 5525, 53, -3074, 52) --Go To Camp Point
	end
end