Function LuaP_ShowAttack()
	while true do
	
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
		Sleep( 10 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_2H , ruFUSION_ACTORSTATE_NORMAL )
		Sleep( 10 )
		Sleep( rand( 100 ) )
	end
end

Function LuaP_ShowAttack2()
	while true do
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_UNARMED , ruFUSION_ACTORSTATE_NORMAL )
		Sleep( 10 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_2H , ruFUSION_ACTORSTATE_NORMAL )
		Sleep( 10 )
		Sleep( rand( 100 ) )
	end
end
--小動物初始劇情
function DW_LittlePuppy()
	local obj= OwnerID()
	DW_UnFight(Obj,false)
	SetModeEx(Obj,EM_SetModeType_HideName,true) 
	SetModeEx(Obj,EM_SetModeType_Mark,true) 
	SetModeEx(Obj,EM_SetModeType_ShowRoleHead,true) 
end