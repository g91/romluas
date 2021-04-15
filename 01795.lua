-----------------------------------------------------------------------------------------難度選擇用(進入區域顯示字串)
function star_Hard_EnterZone()	
	lua_spy_InitFromFunc();--植入監視物件
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_HARD_ENTERZONE]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_HARD_ENTERZONE]" , 0 )
end

function star_Normal_EnterZone()
	lua_spy_InitFromFunc();--植入監視物件
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_NORMAL_ENTERZONE]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_NORMAL_ENTERZONE]" , 0 )
end

function star_Easy_EnterZone()		
	lua_spy_InitFromFunc();--植入監視物件
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_EASY_ENTERZONE]" , 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_EASY_ENTERZONE]" , 0 )
end