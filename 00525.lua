function INORI_Crystal()

	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("INORI_CRYSTAL_1") , 0 )	-- |cffffffff�A��ۤ����y��ë�I|r

	local RND = Rand( 99 ) + 1	-- ���� 1~100 ���ü�

	    if ( RND > 0 and RND <= 30 ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("INORI_CRYSTAL_2") , 0 )	-- ( ���v 30/100 )	-- |cffffffff�����y�o�X���~�A�A�� |cffff0000HP|cffffffff ��_�F�I|r
		local PotionListHP = { 491039 , 491040 , 491041 , 491042 , 491043 , 491044 , 491045 , 491046 , 491047 , 491048 }
		local PotionHP = PotionListHP [ Rand( 10 ) + 1 ]
		--PotionHP = 491036 	-- ��¦������
		CastSpell(OwnerID() , OwnerID() , PotionHP )
	elseif ( RND > 30 and RND <= 60 ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("INORI_CRYSTAL_3") , 0 )	-- ( ���v 30/100 )	-- |cffffffff�����y�o�X���~�A�A�� |cff0000ffMP|cffffffff ��_�F�I|r
		local PotionListMP = { 491049 , 491050 , 491051 , 491052 , 491053 , 491054 , 491055 , 491056 , 491057 , 491058 }
		local PotionMP = PotionListMP [ Rand( 10 ) + 1 ]
		--PotionMP = 491037	-- ��¦�F�P�Ĥ�
		CastSpell(OwnerID() , OwnerID() , PotionMP )
	elseif ( RND > 60 and RND <= 90 ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("INORI_CRYSTAL_4")  , 0 )	-- ( ���v 30/100 )	-- |cffffffff�����y�S������^���K|r
	elseif ( RND > 90 and RND <= 100 ) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("INORI_CRYSTAL_5")  , 0 )	-- ( ���v 10/100 )	-- |cffffffff�����y�H���F�I�I�I|r
		DelBodyItem ( OwnerID() , 201481 , 1 )
		CastSpell(OwnerID() , OwnerID() , 491059 )
	end

	return true
end