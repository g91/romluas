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

--2010.03 德國活動用新增EXP球
function ExpPill_50000()
--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[EXPPILL_50000]" , C_SYSTEM ) --您獲得經驗值50000點！
--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[EXPPILL_50000]" , C_SYSTEM ) --您獲得經驗值50000點！
	AddEXP( OwnerID() , 50000 );
	return true;
end