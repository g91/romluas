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

function Lua_ExpOrbUse_checkLv() --�g�������~�ˬd���a�ϥε��� 
	local Owner = OwnerID()
	local MaxLv = ReadRoleValue( Owner , EM_RoleValue_MaxLv) --��eSERVER���ŤW��
	local PlayerLv = ReadRoleValue( Owner , EM_RoleValue_LV) --���a��e����		
--	Say( Owner , "MaxLv = "..MaxLv)
--	Say( Owner , "PlayerLv = "..PlayerLv)

	if PlayerLv == MaxLv then
		ScriptMessage( Owner , Owner , 1 , "[SC_EXPORB_REACHLV]" , 0 )	
		return false
	else
		return true
	end
end


-- 2013.04 �s�W�ӫ�EXP�y
function EXPPillPoint(Value)
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[EXPPILL_POINTS][$SETVAR1="..Value.."]" , C_SYSTEM ) --�z��o�g���I��[$VAR1]�I�I
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[EXPPILL_POINTS][$SETVAR1="..Value.."]" , C_SYSTEM ) --�z��o�g���I��[$VAR1]�I�I
	AddEXP( OwnerID() , Value );
	return true;
end