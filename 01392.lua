--時間租用
--TimeFlagID 要租用的類型 EX:EM_TimeFlagEffect_BagPage3
--Time       要租用的時間(秒)
function LuaM_TimeLet( TimeFlagID , Time )

	AddRoleValue( OwnerID() , EM_RoleValue_TimeFlag + TimeFlagID , Time );

	return true;
end