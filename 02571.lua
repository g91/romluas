
function DW_Dragon_TakeOff()
	local Obj = OwnerID()
	SetModeEx(Obj,EM_SetModeType_Drag,true) 
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	PlayMotion(Obj,ruFUSION_ACTORSTATE_FLY_BEGIN)
end

function DW_Dragon_HeavyRiseOrDown()
	local Obj = OwnerID()
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_FLY_LOOP , ruFUSION_ACTORSTATE_FLY_LOOP)
	SetDefIdleMotion(Obj,ruFUSION_MIME_FLY_LOOP)
	SetModeEx(Obj,EM_SetModeType_Drag,true) 
end


function DW_Dragon_LightRiseOrDown()
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_MIME_SPIRAL_LOOP)
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_SPIRAL_LOOP , ruFUSION_ACTORSTATE_SPIRAL_LOOP)
	SetModeEx(Obj,EM_SetModeType_Drag,false);
end

function DW_Dragon_LevelOut()
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_MIME_SPIRAL_LOOP)
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_SPIRAL_LOOP , ruFUSION_ACTORSTATE_SPIRAL_LOOP)
	SetModeEx(Obj,EM_SetModeType_Drag,false) 
end


function DW_Dragon_Landing()
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_STAND_02)
	PlayMotionEX(Obj, ruFUSION_ACTORSTATE_FLY_END, ruFUSION_ACTORSTATE_NORMAL)
	SetModeEx(Obj,EM_SetModeType_Drag,true) 
end


function DW_Dragon_Initial()
	local Obj = OwnerID()
	SetModeEx(Obj,EM_SetModeType_Drag,true) 
	AddBuff(Obj,508176,20,-1)
	Hide(Obj)
	WriteRoleValue(Obj,EM_RoleValue_IsWalk,0)
	Show(Obj,0)
end