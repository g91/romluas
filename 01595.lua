
-- �˳Ƥ������X�R�� 701595

function lua_mika_eqexchange_check()
	local OID = OwnerID()
	local key3 = 540032  -- �X�R3

	if Checkflag(OID, key3 ) == true then
		ScriptMessage( OID , OID , 1 , "[SC_EQEXCHANGE_MSG2]" , 0 )
		return false			
	--	�i�X�R���˳Ƥ������w�F�W���A�L�k�A�X�R
	end
end

function lua_mika_eqexchange_item()
	local OID = OwnerID()
--	local key1 = 540029  -- �ĤT¾�~��

	local key1 = 540030  -- �X�R1
	local key2 = 540031  -- �X�R2
	local key3 = 540032  -- �X�R3

	if Checkflag(OID, key1 ) == false then
		Setflag(OID, key1 , 1 )
		ScriptMessage( OID , OID , 1 , "[SC_EQEXCHANGE_MSG1][$SETVAR1=2]" , C_SYSTEM )			
	--	�˳Ƥ������w���\�X�R1�աA�Ѿl�i�X�R���ռƬ��G[$VAR1]
	elseif Checkflag(OID, key2 ) == false then
		Setflag(OID, key2 , 1 )
		ScriptMessage( OID , OID , 1 , "[SC_EQEXCHANGE_MSG1][$SETVAR1=1]" , C_SYSTEM )			
	--	�˳Ƥ������w���\�X�R1�աA�Ѿl�i�X�R���ռƬ��G[$VAR1]
	elseif Checkflag(OID, key3 ) == false then
		Setflag(OID, key3 , 1 )
		ScriptMessage( OID , OID , 1 , "[SC_EQEXCHANGE_MSG3]" , C_SYSTEM )			
	--	�˳Ƥ������w���\�X�R1�աA�w�X�R�̤ܳj�W������
	end

end

-- ���եΫ��O
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


