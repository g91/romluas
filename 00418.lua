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

--2010.03 �w�ꬡ�ʥηs�WTP�y
function TPPill_5000()
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[TPPILL_5000]" , C_SYSTEM ) --�z��o�ޯ��I��5000�I�I
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[TPPILL_5000]" , C_SYSTEM ) --�z��o�ޯ��I��5000�I�I
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp , 5000 );
	return true;
end


-- 2013.04 �s�W�ӫ�tp�y
function TPPillPoint(Value)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[TPPILL_POINTS][$SETVAR1="..Value.."]" , C_SYSTEM ) --�z��o�ޯ��I��[$VAR1]�I�I
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[TPPILL_POINTS][$SETVAR1="..Value.."]" , C_SYSTEM ) --�z��o�ޯ��I��[$VAR1]�I�I
	AddRoleValue( OwnerID() , EM_RoleValue_TpExp , Value );
	return true;
end