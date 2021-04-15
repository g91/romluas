function LuaI_Official_Notice()
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) > 999 then
		return 
	else
		while 1 do
			if GetSystime( 2 ) == 0 or GetSystime( 2 ) == 30 then
				if( GetServerDataLanguage() == "enus" or GetServerDataLanguage() == "de"  or GetServerDataLanguage() == "eneu" ) then 
					RunningMsg( OwnerID() , 2 , "[SC_OFFICIAL_NOTICE_001]" ) 	
				end
			end
			sleep( 310 )
		end
	end
end