function TPPill_203064()

	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("TPPILL_203064") , 0 );
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp , 100 );
	return true;
end

function TPPill_203065()

	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("TPPILL_203065") , 0 );
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp , 1000 );
	return true;
end

function TPPill_203066()

	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("TPPILL_203066") , 0 );
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp , 10000 );
	return true;
end

function TPPill_203067()

	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("TPPILL_203067") , 0 );
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp , 100000 );
	return true;
end

function TPPill_203580()

	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("TPPILL_203580") , 0 );
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp , 500 );
	return true;
end

--2010.03 德國活動用新增TP球
function TPPill_5000()
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[TPPILL_5000]" , C_SYSTEM ) --您獲得技能點數5000點！
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[TPPILL_5000]" , C_SYSTEM ) --您獲得技能點數5000點！
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp , 5000 );
	return true;
end


-- 2013.04 新增商城tp球
function TPPillPoint(Value)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[TPPILL_POINTS][$SETVAR1="..Value.."]" , C_SYSTEM ) --您獲得技能點數[$VAR1]點！
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[TPPILL_POINTS][$SETVAR1="..Value.."]" , C_SYSTEM ) --您獲得技能點數[$VAR1]點！
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp , Value );
	return true;
end