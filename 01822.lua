function Lua_ObjCanBeTouch( Obj ) --讓召喚出來的物件不會被點到
	SetModeEx(  Obj  , EM_SetModeType_Mark, True) 
	SetModeEx(  Obj  , EM_SetModeType_HideName, False) 
	SetModeEx(  Obj  , EM_SetModeType_ShowRoleHead, True) 
	SetModeEx(  Obj  , EM_SetModeType_NotShowHPMP, True )	
	return obj
end