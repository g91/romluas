function bico_850878_ACDps()
	SysCastSpellLv( OwnerID(), OwnerID(), 850878, 0 )
end

function bico_850882_Cancel_621218()
--498562  --�޽ë��A�k�N���X
--621218  --���Buff�L�\��
--	CancelBuff( OwnerID(), 621218 )	--�����޽ë��A
	Lua_CDtime_set(OwnerID(),498562 ,7)
	SysCastSpellLv( OwnerID() , OwnerID(), 850883, 0 )
end

function Bico_850884_Check()--��ѫ��A(850884)
	local OID = OwnerID()

	if CheckBuff( OID, 624374 ) then
		CancelBuff( OID, 624377 )--�@�[��
		CancelBuff( OID, 624378 )--�@�[��
		--CancelBuff( OID, 621219 )--�O�I��
		--CancelBuff( OID, 621221 )--�O�I��

		CancelBuff( OID, 624374 )--��ܪ��A
		return false
	end
	Bico_850884_State()
	return true
end


function Bico_850884_State()--��ѧκA���A
	local OID = OwnerID()
	local baseSta = ReadRoleValue( OID, EM_RoleValue_BaseEQ_Sta )--sta����Buff���ƭ�
	local changeSta = KS_CheckBuffLV( OID, 624378 ) + KS_CheckBuffLV( OID, 624377 )*100		--���o���w���󨭤WBUFF����
	local rate = 0.8--���ūY��
	local compute = math.floor( baseSta*rate)--�ഫ��

	if BaseSta  == 0 or changeSta ~= compute then
		CancelBuff( OID, 624377 )--�ഫ100N	��ѧκA
		CancelBuff( OID, 624378 )--�ഫN	��ѧκA
		CancelBuff( OID, 621216 )--�ഫ100N	�޽ë��A
		CancelBuff( OID, 621217 )--�ഫN	�޽ë��A

		local x100 = math.floor(compute/100)
		if x100 > 0 then
			AddBuff( OID, 624377, x100-1, -1 )--�ഫ100N
		end

		local x1 = math.floor(compute%100)
		if x1 > 0 then
			AddBuff( OID, 624378 , x1-1, -1 )--�[�O
		end
		
	end
end

function bico_del624379( buff1,buff2 )
	--if CheckBuff( OwnerID() , buff1) == false then
	CancelBuff( OwnerID(), buff1 )
		CancelBuff( OwnerID(), buff2 )
	--end
end

function bico_850892_SkillLv4()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == 3 then
		return true
	else
		return false
	end
end

function bico_850892_SkillLv3()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == 2 then
		return true
	else
		return false
	end
end

function bico_850892_SkillLv2()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == 1 then
		return true
	else
		return false
	end
end

function bico_850892_SkillLv1()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == 0 then
		return true
	else
		return false
	end
end

function bico_850892_SkillLv0()
	local BuffLv=FN_CountBuffLevel(TargetID(),624395)
	if BuffLv == -1 then
		return true
	else
		return false
	end
end


function bico_850892_CancelBuff()
	if CheckBuff( TargetID() , 624395 ) == true then
	CancelBuff( TargetID(), 624395 )
	end
end


function bico_624370_621167_Buff()	--�p�G���W����y�ĪG�A������y�ĪG
	if CheckBuff( OwnerID(), 621167 ) == true then		--�D¾498524
		CancelBuff( OwnerID(), 621167 )
	elseif CheckBuff( OwnerID(), 621251 ) == true then	--�D¾���s���X��498590
		CancelBuff( OwnerID(), 621251 )
	elseif CheckBuff( OwnerID(), 621302 ) == true then	--���F498598
		CancelBuff( OwnerID(), 621302 )
	elseif CheckBuff( OwnerID(), 622184 ) == true then	--�żv850050	   
		CancelBuff( OwnerID(), 622184 )
	end	
end

function bico_624370fix()	--�p�G���W���Ԧu����ĪG�A�����Ԧu����
	if CheckBuff( OwnerID(), 624369 ) == true then
		AddBuff( OwnerID(), 624318, 0, 300 )
	end
end

function bico_621167fix()
	if CheckBuff( OwnerID(), 621167 ) == true then		--�D¾498524
		AddBuff( OwnerID(), 624318, 0, 300 )
	elseif CheckBuff( OwnerID(), 621251 ) == true then	--�D¾���s���X��498590
		AddBuff( OwnerID(), 624318, 0, 300 )
	elseif CheckBuff( OwnerID(), 621302 ) == true then	--���F498598
		AddBuff( OwnerID(), 624318, 0, 300 )
	elseif CheckBuff( OwnerID(), 622184 ) == true then	--�żv850050	   
		AddBuff( OwnerID(), 624318, 0, 300 )
	end	
end

function bico_621303_621168()
	if CheckBuff( OwnerID(), 624369 ) == true then
		SysCastSpellLv( OwnerID(), OwnerID(), 850881, 0 )
	end
end