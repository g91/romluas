
--�����ݰ򥻪k�N--

function sasa_addbufftest(BuffID)
	AddBuff( OwnerID() , BuffID , 0 , -1 )
end

--���ե�--���ߺ���--

function sasa_CatFullBlood()
	SysCastSpellLv( OwnerID() , OwnerID() , 491064 , 0 )--�߫}�W��
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 492744 , 0 )--����N
end

--���ե�--�L���_���^���]�P��--

function sasa_ReturnTheBear()
	SysCastSpellLv( OwnerID() , OwnerID() , 497461 , 0 )--�L���_���N
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 498390 , 0 )--HP�PMP100%�^��
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 498392 , 0 )--�^��O�M�`�ԷN
	sleep(1)
	addbuff( OwnerID() , 624769 , 0 , -1 )--�����ܨ�
end

--���ե�--�d�����YBUFF--

function sasa_RelationshipBuff()
	GiveBodyItem( OwnerID() , 203576 , 100 )--�j�v�����ײz��
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 499873 , 0 )--�R���Ԫ������R��
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 498388 , 0 )--�^���W���~���
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 496730 , 0 )--�⨬���`
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 496731 , 0 )--�ⱡ�ۮ�
	sleep(1)
	SysCastSpellLv( OwnerID() , OwnerID() , 496732 , 0 )--���w�ר�
	sleep(1)
	star_PetBuff()
end

function star_PetBuff()
	local buff  = 503463
	for i =1 , 8 do
		addbuff( OwnerID() , buff+i-1 , 4 , -1 )
		sleep(1)
	end
end
