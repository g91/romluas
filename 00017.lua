function Init_Role_ModeValue()
	Def_Mode_Show 		= Hex( "0x00000001" )  	-- �q�X(���רq�X������, �аO/�P��)
	Def_Mode_Mark	    	= Hex( "0x00000002" )  	-- �i�аO/�I��(�i�H�����a�I��)
	Def_Mode_Obstruct    	= Hex( "0x00000004" )	-- �|����(���ר�L������)
	Def_Mode_Gravity	                = Hex( "0x00000008" )	-- �����O(�a�ߤޤO, �p�⪫��P�a�����I��,�_�h�̷� Client �e�Ӫ��y��, ���|�̦a�����ק��� y)
	Def_Mode_Save	    	= Hex( "0x00000010" )	-- ������O�_�n�x�s
	Def_Mode_Drag                      = Hex( "0x00000020" )    -- �����O��

	Def_Mode_Trade		= Hex( "0x00000100" )	-- �i���
	Def_Mode_Sell		= Hex( "0x00000200" )	-- �i�R��
	Def_Mode_Logoutdel	= Hex( "0x00000400" )	-- ���u����
	Def_Mode_Expense		= Hex( "0x00000800" )	-- ����
	Def_Mode_Coloring	= Hex( "0x00001000" )	-- �i�V��
	Def_Mode_GuildMark	= Hex( "0x00002000" )	-- ���|��
	Def_Mode_EQSoulBound      = Hex( "0x00004000" )	-- �˳ƸT��

	Def_Mode_Strikback	= Hex( "0x00010000" )	-- ����
	Def_Mode_Move		= Hex( "0x00020000" )	-- ����
	Def_Mode_Searchenemy	= Hex( "0x00040000" )	-- �j�M�ĤH
	Def_Mode_Revive		= Hex( "0x00080000" )	-- �i����(�i�� SERVER, �}�Ҧ��X�Ъ�����ݭn����, ���ͮɶ��d�� Revive)
	Def_Mode_Fight		= Hex( "0x00100000" )	-- �i�������(�}�Ҧ��X�Ъ�����i�H�Q���)
	Def_Mode_Escape		= Hex( "0x00200000" )	-- �k�]
	Def_Mode_SearchIgnore	= Hex( "0x00400000" )	-- �����󤣷|�Q�j�M��
end