
-- 裝備切換欄擴充券 701595

function lua_mika_eqexchange_check()
	local OID = OwnerID()
	local key3 = 540032  -- 擴充3

	if Checkflag(OID, key3 ) == true then
		ScriptMessage( OID , OID , 1 , "[SC_EQEXCHANGE_MSG2]" , 0 )
		return false			
	--	可擴充的裝備切換欄位已達上限，無法再擴充
	end
end

function lua_mika_eqexchange_item()
	local OID = OwnerID()
--	local key1 = 540029  -- 第三職業的

	local key1 = 540030  -- 擴充1
	local key2 = 540031  -- 擴充2
	local key3 = 540032  -- 擴充3

	if Checkflag(OID, key1 ) == false then
		Setflag(OID, key1 , 1 )
		ScriptMessage( OID , OID , 1 , "[SC_EQEXCHANGE_MSG1][$SETVAR1=2]" , C_SYSTEM )			
	--	裝備切換欄位已成功擴充1組，剩餘可擴充欄位組數為：[$VAR1]
	elseif Checkflag(OID, key2 ) == false then
		Setflag(OID, key2 , 1 )
		ScriptMessage( OID , OID , 1 , "[SC_EQEXCHANGE_MSG1][$SETVAR1=1]" , C_SYSTEM )			
	--	裝備切換欄位已成功擴充1組，剩餘可擴充欄位組數為：[$VAR1]
	elseif Checkflag(OID, key3 ) == false then
		Setflag(OID, key3 , 1 )
		ScriptMessage( OID , OID , 1 , "[SC_EQEXCHANGE_MSG3]" , C_SYSTEM )			
	--	裝備切換欄位已成功擴充1組，已擴充至最大上限欄位數
	end

end

-- 測試用指令
function lua_mika_eqexchange_test01()
	local OID = OwnerID()
	local keylist = { 540029, 540030, 540031, 540032 }
	for i = 1, 4 do
		Setflag(OID, keylist[i], 1 )
	end
	Say(OID, "GIVE all eqexchange slot. ")
end

function lua_mika_eqexchange_test02()
	local OID = OwnerID()
	local keylist = { 540029, 540030, 540031, 540032 }
	for i = 1, 4 do
		Setflag(OID, keylist[i], 0 )
	end
	Say(OID, "DELETE all eqexchange slot. ")

end


