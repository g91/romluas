function ExpPill_10000()
	AddEXP( OwnerID() , 10000 );
	return true;
end

function ExpPill_100000()
	AddEXP( OwnerID() , 100000 );
	return true;
end

function ExpPill_1000000()
	AddEXP( OwnerID() , 1000000 );
	return true;
end

function ExpPill_10000000()
	AddEXP( OwnerID() , 10000000 );
	return true;
end

function Lua_ExpOrbUse_checkLv() --經驗類物品檢查玩家使用等級 
	local Owner = OwnerID()
	local MaxLv = ReadRoleValue( Owner , EM_RoleValue_MaxLv) --當前SERVER等級上限
	local PlayerLv = ReadRoleValue( Owner , EM_RoleValue_LV) --玩家當前等級		
--	Say( Owner , "MaxLv = "..MaxLv)
--	Say( Owner , "PlayerLv = "..PlayerLv)

	if PlayerLv == MaxLv then
		ScriptMessage( Owner , Owner , 1 , "[SC_EXPORB_REACHLV]" , 0 )	
		return false
	else
		return true
	end
end


-- 2013.04 新增商城EXP球
function EXPPillPoint(Value)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[EXPPILL_POINTS][$SETVAR1="..Value.."]" , C_SYSTEM ) --您獲得經驗點數[$VAR1]點！
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[EXPPILL_POINTS][$SETVAR1="..Value.."]" , C_SYSTEM ) --您獲得經驗點數[$VAR1]點！
	AddEXP( OwnerID() , Value );
	return true;
end