
-- 702665

-- �S���d�w�ɶ]�@��
function lua_mika_musicpet_test()
	local OID = OwnerID()

	Beginplot(OID, "Hao_Pet_SetModeEx", 0 )
	while true do 
		Addbuff(OID, 503012, 0 , 5)
		sleep(150)
	end
end

function lua_mika_musicpet_01()	-- ���ũ�����
	local OID = OwnerID()
	local key = 546504  -- ���⩥���C�魫�mkey
	local buff  =  508368  -- buff �F�ʤ��� 

	if CheckFlag( OID, key ) == true then
		return false
	else
		Setflag( OID, key, 1 )   --   �����C��keyitem 
		AddBuff( OID, buff, 0,7200)  -- ���ĪGbuff  
	end
end


function lua_mika_musicpet_02()	-- ���ũ�����
	local OID = OwnerID()
	local key = 546505 -- �Ŧ⩥���C�魫�mkey
	local buff  =  508368  -- buff �F�ʤ��� 

	if CheckFlag( OID, key ) == true then
		return false
	else
		Setflag( OID, key, 1 )   --   �����C��keyitem 
		AddBuff( OID, buff, 0,7200)  -- ���ĪGbuff  
	end
end