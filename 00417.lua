function ExpBall_LV1()

	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EXP_BALL_LV1")  , 0 );
	AddRoleValue( OwnerID() , EM_RoleValue_EXP , 200 );
	return true;

end

function ExpBall_LV2()

	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EXP_BALL_LV2"), 0 );
	AddRoleValue( OwnerID() , EM_RoleValue_EXP , 500 );
	return true;

end

--2010.03 �w�ꬡ�ʥηs�WEXP�y
function ExpPill_50000()
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[EXPPILL_50000]" , C_SYSTEM ) --�z��o�g���50000�I�I
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[EXPPILL_50000]" , C_SYSTEM ) --�z��o�g���50000�I�I
	AddEXP( OwnerID() , 50000 );
	return true;
end