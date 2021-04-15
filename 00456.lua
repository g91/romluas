function LuaM_Bank_10_check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_BankCount ) <=90 then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_BANKADD_10"), C_SYSTEM );--畫面中間訊息：銀行已擴增10格欄位
                return true
	else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_BANKMAX_100"), C_DEFAULT);--擴增失敗！銀行上限為100個欄位
			--還給玩家物品
		return false
	end	
end

function LuaM_Bank_10_Effect()
	AddRoleValue( OwnerID() , EM_RoleValue_BankCount , 10 )
end