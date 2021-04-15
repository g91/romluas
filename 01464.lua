----------------------- 任務 422551 ------------------------
function LuaM_493625_Check()
	if CheckAcceptQuest( OwnerID() , 422551 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_493625_0]" , 0 ) --你目前不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_493625_0]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102259 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_493625_1]" , 0 ) --目標不是[102259]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_493625_1]" , 0 )
		return false
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_493625_2]" , 0 ) --目標已死亡
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_493625_2]" , 0 )
			return false
		end

	end
	return true
end

function LuaM_503965_0()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102259 then
		BeginPlot( TargetID() , "LuaM_503965_1" , 0 )
	end
end

function LuaM_503965_1()
	SetStopAttack( OwnerID() )
	Lua_CancelAllBuff( OwnerID() )
	local Deer = LuaFunc_CreateObjByObj( 113205 , OwnerID() )
	if DW_Rand( 100 ) > 20 then
		WriteRoleValue( Deer , EM_RoleValue_PID , DW_Rand(5) + 1 )
	else
		WriteRoleValue( Deer , EM_RoleValue_PID , -999 )
	end
	BeginPlot( Deer , "LuaM_503965_2" , 0 )
	Hide( OwnerID() )
	while 1 do
		if CheckID( Deer ) == false or ReadRoleValue( Deer , EM_RoleValue_OrgID ) ~= 113205 then
			break
		end
		sleep( 50 )
	end
	LuaFunc_ResetObj( OwnerID() ) 
end

function LuaM_503965_2()
	PlayMotionEX(  OwnerID()  ,  ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep( 300 )
	Delobj( OwnerID() )
end

function LuaQ_422551_BeforClick()
	if ReadRoleValue(TargetID() , EM_RoleValue_PID ) < 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_493625_3]" , 0 ) --這頭鹿是公的！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_493625_3]" , 0 )
		Delobj( TargetID() )
		return -1
	end
	if ReadRoleValue(TargetID() , EM_RoleValue_PID ) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_493625_4]" , 0 ) --這頭鹿已經沒有奶水了。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_493625_4]" , 0 )
		Delobj( TargetID() )
		return -1
	end
	return 1
end

function LuaQ_422551_AfterClick()
	AddRoleValue( TargetID() , EM_RoleValue_PID , -1 )
	return 1
end

----------------------- 任務 422554 ------------------------
function LuaQ_422554_BeforClick()
	if CountBodyItem( OwnerID() ,205424) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422554_0]" , 0 ) --你已經有一個[205424]了
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422554_0]" , 0 ) --你已經有一個[205424]了
		return -1
	else
		return 1
	end
end
--------------------- 任務 422565 --------------------------
function LuaI_102219_0() --放在 102219 巨猿王身上的初始劇情
	while 1 do
		if HateListCount( OwnerID() ) == 0 and ReadRoleValue(OwnerID() , EM_RoleValue_Register ) > 0 then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0) 
		end
		sleep(10)
	end
end
function LuaM_493626_Check() --放在法術集合 493626 對猿殺傷炸藥上的檢查劇情
	if CheckAcceptQuest( OwnerID() , 422565 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_0]" , 0 ) --你目前不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_0]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102219 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_1]" , 0 ) --目標不是[102219]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_1]" , 0 )
		return false
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_2]" , 0 ) --目標已死亡
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_2]" , 0 )
			return false
		end

	end
	return true
end
function LuaM_503966_Check() --放在基本法術 503966 炸翻巨猿王上的檢查劇情，讓巨猿王同一場戰鬥只能被炸一次
	if ReadRoleValue(TargetID() , EM_RoleValue_Register ) > 0 then
		BeginPlot( TargetID() , "LuaM_503966_2" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_3]" , 0 ) --[102219]靈活的閃避開來，看來牠還記得炸藥的危險
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_3]" , 0 )
		return false
	end
	return true
end
function LuaM_503966_0() --放在基本法術 503966 炸翻巨猿王上的觸發劇情
	BeginPlot( TargetID() , "LuaM_503966_1" , 0 )
end

function LuaM_503966_1() --巨猿王中炸彈後撥放的動作
	sleep(10)
	local MaxHP = ReadRoleValue( OwnerID(), EM_RoleValue_MaxHP )
	if ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) <= MaxHP/2 then
		WriteRoleValue( OwnerID() , EM_RoleValue_HP , 1 )
	else
		AddRoleValue(  OwnerID() , EM_RoleValue_HP , -MaxHP/2 )
	end 
	WriteRoleValue(OwnerID(), EM_RoleValue_Register , 100 )
	AddBuff( OwnerID() , 503605 , 1 , 5 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
	SetAttack( OwnerID() , TargetID() )
end

function LuaM_503966_2() --巨猿王閃避炸彈後撥放的動作
	sleep(10)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DODGE )
end