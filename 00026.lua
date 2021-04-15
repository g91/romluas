function NPC_MoveToFlag( ObjID , FlagObjID , FlagID,Range )

 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	return WaitMoveTo( ObjID , X , Y  , Z )

end

function LuaFunc_MoveToFlag( ObjID , FlagObjID , FlagID,Range )

 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	return WaitMoveTo( ObjID , X , Y  , Z );
end

function LuaFunc_MoveToFlagandWait( ObjID , FlagObjID , FlagID,Range )
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )
	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1
	return LuaFunc_WaitMoveTo( ObjID , X , Y  , Z );
end