function Lua_SafeArea_Loop()
	local AreaTable = {}
	local CountryTable = {"kr"} --�[�J�ݭn�\�઺��a�y�t�]�Hserver�]�w���ǡ^
	local ServerCheck = "NO"
	------�N�U�ϰ�ŧi���@��table--------------
	for i = 1 , 12 , 1 do
		AreaTable[i] = {}
	end
	------��J�U�ϰ�ݭn�\�઺�p��--------------
	AreaTable[1] =	{ 3 , 10  }
	AreaTable[2] =	{ 54 }
	AreaTable[3] =	{ 107 }
	AreaTable[4] =	{ 159 , 158 }
	AreaTable[5] =	{ 207 , 208 , 210}
	AreaTable[6] =	{ 261 , 263 , 265 }
	AreaTable[7] =	{ 564 , 571 , 557 }
	AreaTable[8] =	{ 669 }
	AreaTable[9] =	{ 714 , 715 }
	AreaTable[10] ={ 464 , 465 , 466 }	
	AreaTable[11] ={ 507 , 508 , 509 , 510 }
	AreaTable[12] ={ 602 , 605 }
	--------------------------------------------------------
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local ZoneID = Lua_ExGetZone( OwnerID() )

	for pry , obj in pairs(CountryTable) do
		if GetServerDataLanguage() == obj then
			ServerCheck = "OK"
			break
		end 
	end 

	if ServerCheck == "NO" then

		return
	end
	while 1 do
		local PPL = SetSearchAllPlayer(RoomID)
		for i = 1 , PPL , 1 do 
			local BuffCheck = "NO"
			local ID = GetSearchResult()
			for pry , obj in pairs(AreaTable[ZoneID]) do
				if Lua_ObjAreaCheck(ID , obj ) == true then
					BuffCheck = "OK"
					break
				end
			end
			if BuffCheck == "OK" then
				if ( CheckBuff( ID, 505578 ) == false ) then

					ScriptMessage( ID , ID , 1 , "|off00ff00" .."[SC_NOPK_SAFE_01]".. "|r" , C_SYSTEM ) --�A�{�b�B��w�����A�A�����j��PK�I�ǡC
					ScriptMessage( ID , ID , 0 , "|off00ff00" .."[SC_NOPK_SAFE_01]".. "|r" , C_SYSTEM ) --
				end
				AddBuff( ID , 505578 , 0 , 30 )		--PK�O�@BUFF

			else
				if ( CheckBuff( ID, 505578 ) == true ) then --�j���ϰ�PK�O�@��BUFF

					CancelBuff( ID, 505578 )

					ScriptMessage( ID , ID , 1 , "|off00ff00" .."[SC_NOPK_SAFE_02]".. "|r" , C_SYSTEM ) --�A�w���}PK�O�@���w���ϰ�C
					ScriptMessage( ID , ID , 0 , "|off00ff00" .."[SC_NOPK_SAFE_02]".. "|r" , C_SYSTEM ) 
				end
			end
		end
		sleep( 100 )
	end

end

