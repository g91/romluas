function Lua_ObjCanBeTouch( Obj ) --���l��X�Ӫ����󤣷|�Q�I��
	SetModeEx(  Obj  , EM_SetModeType_Mark, True) 
	SetModeEx(  Obj  , EM_SetModeType_HideName, False) 
	SetModeEx(  Obj  , EM_SetModeType_ShowRoleHead, True) 
	SetModeEx(  Obj  , EM_SetModeType_NotShowHPMP, True )	
	return obj
end