function bico_witch_ward_45_exskill()
	if CheckBuff( OwnerID() , 624310 ) == true then
	return false
	else
	return true
	end
end

function bico_witch_ward_45_exskill_BuffAi()
	if CheckBuff( OwnerID() , 622983 ) == false and CheckBuff( OwnerID() , 624310 ) == true and CheckBuff( OwnerID() , 622946 ) == false then
	SysCastSpellLv( OwnerID() , OwnerID() , 499999 , 0 )
	elseif CheckBuff( OwnerID() , 622983 ) == false and CheckBuff( OwnerID() , 624310 ) == false then
	SysCastSpellLv( OwnerID() , OwnerID() , 850318 , 0 )
	end
end

function bico_say_stastrValue()
	local OID = OwnerID()
	local baseStr = ReadRoleValue( OID, EM_RoleValue_BaseEQ_Str )	--str不算Buff的數值
	local baseSta = ReadRoleValue( OID, EM_RoleValue_BaseEQ_Sta )	--sta不算Buff的數值
	say( OID, "Str= "..baseStr )
	say( OID, "Sta= "..baseSta )
end

function lua_bico_Z29_stoneTest()
while true do
	sleep(10)
	DebugMsg(0,0,"Bico is handsome")
end
end


