function LuaI_201367() --�K�u�q���i§�]

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 202322 , 1 , 202264 , 1 , 202320 , 1 , 201139 , 1 , 203576 , 1 , 203047 , 2 , 203048 , 2 , 206277 , 1} }	
	-- ���ĩ��B�ľ��B�@�Ѹg���ľ��B�@�ѧޯ��ľ��B�j�ѨϪ��Į��B�j�v�����ײz��B�����@���Z���� 203047 X2�B�����@���˳ƥ� 203048 X2 �B30�ѳ��I���M 206277 (���W��)

	return BaseTressureProc(   itemset , 8 )
end