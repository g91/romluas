--�x�W��J���~�@��
----2011-0310 �������_��J


--serverscript 2219

-----------2011-0310 �x�W�������_��J����
function LuaI_209172()  --�ä[�������_�~��B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209172]][$SETVAR3=[207527]]"  --207527 �ä[�������_���M

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 207527 , 1 } --�ä[�������_���M
			, 5 ,""		, { 202929 , 2 } --�]���_����q50�I
			, 8 ,""		, { 201139 , 5 } --�j�ѨϪ��Į�
			, 13 ,""		, { 201086 , 1 }  --�����ޯ୫�m��
			, 21 ,"" 		, { 201141 , 5 }  --�ᥧ�J������ū
			, 38 ,"" 		, { 202903 , 40 }  --�ǰe�̲Ť�
			, 56 ,""		, { 202904 , 20 }  --�ǰe���Ť�
			, 78 ,""		, { 201609 , 2 } -- ���ĸg���ľ�
			, 100 ,""	, { 201617 , 2 } 	} --�M�a�ޯ��ľ�
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --�C���]��

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	
	return true
end



function LuaI_209173()  --������B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209173]][$SETVAR3=[203525]x5]"  --202434 �C����ȭ��m��x5

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 203525 , 5 }
			, 6 ,""		, { 203525 , 1 }
			, 10 ,""		, { 206963 , 1 }
			, 14 ,""		, { 206964 , 2 } 
			, 20 ,"" 		, { 206965 , 2 }
			, 34 ,"" 		, { 201619 , 5 } 
			, 56 ,""		, { 201445 , 50 } 
			, 78 ,""		, { 203784 , 10 } 
			, 100 ,""	, { 202904 , 5 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --�C���]��

	BaseTressureProc( itemset1 , 1 )
	BaseTressureProc( itemset2 , 1 )
	
	return true
end



function LuaI_209174() --�L����B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[209174]][$SETVAR3=[207147]]"
	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset1 = { 3, Prize1Str  , {207147, 1 } --�p���L��§�]
			, 6 , ""	        , {202881, 1 } --�L�庲�ѥ�
			,10,""             , {206963, 1 } --�i���t���Z����
			,14,""             , {206964, 2 } --�i���t���˳ƥ�
			,20,""             , {206965, 2 } --�i���t��������
			,34,""             , {201619, 5 } --���B�ľ�
			,56,""             , {202435, 10 } --�a���o��
			,78,""             , {203784, 10 } --���|�����ǰe��
			,100,""           , {202904, 5 } } --�ǰe���Ť�

	local itemset2 = {  1 ,""	, { 202846 ,1 }}--�C���]��

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )

	return true
end



function LuaI_209175()  --�j�v������B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209175]][$SETVAR3=[203576]x5]"  --203576 �j�v�����ײz��

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 203576 , 5 }
			, 6 ,""		, { 203576 , 1 }
			, 10 ,""		, { 206963 , 1 }
			, 14 ,""		, { 206964 , 2 } 
			, 20 ,"" 		, { 206965 , 2 }
			, 34 ,"" 		, { 201619 , 5 } 
			, 56 ,""		, { 202435 , 10 } 
			, 78 ,""		, { 203784 , 10 } 
			, 100 ,""		, { 202904 , 5 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --�C���]��

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	
	return true
end