Function LuaI_207042() --package mount 1

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 206275,1 , 202929 , 1 } --�ä[���I���M�B�]���_����q50�I 
		        } 

	return BaseTressureProc(   itemset , 2  )
end

Function LuaI_207043() --package mount 2

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 203676,1 , 202929 , 1 } --�ä[�W���~���M �B�]���_����q50�I 
		        } 

	return BaseTressureProc(   itemset , 2  )
end

Function LuaI_207044() --Package 1

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 201086,1 , 202434 , 1 , 201139 , 1 , 202506 , 1 , 201088 , 1} --�����ޯ୫�m�ۡB�C����ȭ��m��B�j�ѨϪ��Į��B�����ײz��B�i���Z�����վ�
		        } 

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_207045() --Winner PvP

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 201161,1 , 201141 , 1 , 202506 , 1 , 201450 , 10 , 201457 , 10} --30�Ѥp���H�d���J�B�ᥧ�J������ū�B�����ײz��B���@�Z���ۡB���@�˳ƥ�
		        } 

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_207046() --Runner up PvP

	local RoleName = GetName( OwnerID() ) 

	local itemset = { 100 ,""	, { 201161,1 , 201141 , 1 , 202506 , 1 , 201450 , 5 , 201457 , 5} --30�Ѥp���H�d���J�B�ᥧ�J������ū�B�����ײz��B���@�Z���ۡB���@�˳ƥ�
		        } 

	return BaseTressureProc(   itemset , 5  )
end

