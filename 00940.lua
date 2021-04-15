
--邪染魔影
function LuaS_101048_0()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 101218, TargetID() )	
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	SetAttack(SpellCaster,TargetID())
	BeginPlot(SpellCaster,"LuaS_101048_1",0)
end

function LuaS_101048_1()
	sleep(120)
	DelObj(OwnerID())
end

--黑角沉寂者

function LuaS_101053_0()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local SpellCaster = LuaFunc_CreateObjByObj ( 101438, TargetID() )
	SetModeEx( SpellCaster   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( SpellCaster   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( SpellCaster   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( SpellCaster   , EM_SetModeType_Mark, false )--標記
	SetModeEx( SpellCaster   , EM_SetModeType_Move, false )--移動
	SetModeEx( SpellCaster   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( SpellCaster   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( SpellCaster   , EM_SetModeType_HideName, false )--名稱
	DelFromPartition( SpellCaster )
	AddToPartition( SpellCaster ,    RoomID )	--加進舞台
	SetAttack(SpellCaster,TargetID())
	BeginPlot(SpellCaster,"LuaS_101053_1",0)
	return true
end

function LuaS_101053_1()
	sleep(100)
	Delobj(OwnerID())
end

