--�ɶ�����
--TimeFlagID �n���Ϊ����� EX:EM_TimeFlagEffect_BagPage3
--Time       �n���Ϊ��ɶ�(��)
function LuaM_TimeLet( TimeFlagID , Time )

	AddRoleValue( OwnerID() , EM_RoleValue_TimeFlag + TimeFlagID , Time );

	return true;
end