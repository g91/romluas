function LuaM_Bank_10_check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_BankCount ) <=90 then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_BANKADD_10"), C_SYSTEM );--�e�������T���G�Ȧ�w�X�W10�����
                return true
	else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_BANKMAX_100"), C_DEFAULT);--�X�W���ѡI�Ȧ�W����100�����
			--�ٵ����a���~
		return false
	end	
end

function LuaM_Bank_10_Effect()
	AddRoleValue( OwnerID() , EM_RoleValue_BankCount , 10 )
end