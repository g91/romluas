function Have_Buff_NoUse( BuffID , WarningString )
	if ( CheckBuff( OwnerID() , BuffID ) == true ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString(WarningString) , C_DEFAULT )
		return false
	else
		return true
	end

end

function Have_PhoenixBuff_NoUse()
	if ( CheckBuff( OwnerID() , 501617 ) == true ) then	-- ¸T¨î
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PHOENIXBUFF_1") , C_DEFAULT )
		return false
	elseif ( CheckBuff( OwnerID() , 501389 ) == true ) then	-- ±ÏÅ«
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_PHOENIXBUFF_2") , C_SYSTEM )
		return false
	else
		return true
	end
end