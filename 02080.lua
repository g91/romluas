--�x�W��J���~�@��
----2011-0210 �x�W�H�S�Ժ���J����
--2011-0106 �x�W�s��Ծs��J����
--2010-1119 �x�W�ɭ��N���~��J����
--2010_1022 �x�W�Ȫe�Ѱ��J����
--2010-0923 �x�W�N����J����

--serverscript 2080
---------------------------------------------

--------------- �N���J���ʨt�C
Function LuaI_208317() --�N�����C�򩯹B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208317]][$SETVAR3=[206941]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 206941,1 } --
		        , 5 ,""	, {202929 ,2 } --
		       , 8 ,""	, {201139 ,5 } --
		       , 13 ,""	, {201086 ,1 } --
		       , 21 ,""	, {201141 ,5 } --
	                     , 38 ,"" 	, {202903 ,40 } --
 		       , 56 ,"" 	, {202904 ,20 } --
		       , 78 ,"" 	, {201609 ,2} --
		       , 100 ,"" 	, {201617 ,2}} --

	local itemset2 = {  50 ,""	, { 208321,1 }}--���o���~���J�߸H��					
							
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_208318() --�C����ȭ��m�驯�B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208318]][$SETVAR3=[202434]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 202434,5 } --
		        , 6 ,""	, {202434 ,1 } --
		       , 10 ,""	, {206963 ,1 } --
		       , 14 ,""	, {206964 ,2 } --
		       , 20 ,""	, {206965 ,2 } --
	                     , 38 ,"" 	, {201445 ,50 } --
 		       , 56 ,"" 	, {202435 ,10 } --
		       , 78 ,"" 	, {203784 ,10} --
		       , 100 ,"" 	, {202904 ,5}} --

	local itemset2 = {  10 ,""	, { 208321,1 }}--���o���~���J�߸H��					
							
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_208319() --�L�婯�B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208319]][$SETVAR3=[207147]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 207147, 1 } --�L�庲�ѥ�(5)�]
		        , 6 ,""	, { 202881,1 } --�L�庲�ѥ�
		       , 10 ,""	, { 206963,1 } --�i���t���Z����
		       , 14 ,""	, { 206964,2 } --�i���t���˳ƥ�
		       , 20 ,""	, { 206965,2 } --�i���t��������
	                     , 38 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
 		       , 56 ,"" 	, { 202435,10 } --�a������
 		       , 78 ,"" 	, { 203784,10 } --���|�����ǰe��
		       , 100 ,"" 	, { 202904,5 }} --�ǰe���Ť�

	local itemset2 = {  10 ,""	, { 208321,1 }}--���o���~���J�߸H��					
							
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end


Function LuaI_208320() --�j�v�������B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208320]][$SETVAR3=[203576]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 203576, 5 } --�j�v�����ײz��
		        , 6 ,""	, { 203576,1 } --�j�v�����ײz��
		       , 10 ,""	, { 206963,1 } --�i���t���Z����
		       , 14 ,""	, { 206964,2 } --�i���t���˳ƥ�
		       , 20 ,""	, { 206965,2 } --�i���t��������
	                     , 38 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
 		       , 56 ,"" 	, { 202435,10 } --�a������
 		       , 78 ,"" 	, { 203784,10 } --���|�����ǰe��
		       , 100 ,"" 	, { 202904,5 }} --�ǰe���Ť�

	local itemset2 = {  10 ,""	, { 208321,1 }}--���o���~���J�߸H��					
							
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end


--------------- �Ȫe�Ѱ��J�t�C
Function LuaI_208296() --�ä[�Ȫe�Ѱ��n�B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208296]][$SETVAR3=[206710]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset = { 3 ,Prize1Str	, { 206710,1 } --
		        , 6 ,""	, {202929 ,2 } --
		       ,  10 ,""	, {201139 ,5 } --
		       , 14 ,""	, {201086 ,1 } --
		       , 20 ,""	, {201141 ,5 } --
	                     , 34 ,"" 	, {202903 ,40 } --
 		       , 56 ,"" 	, {202904 ,20 } --
		       , 78 ,"" 	, {201609 ,2} --
		       , 100 ,"" 	, {201617 ,2}} --
	local itemset2 = {  50 ,""	, { 208300 ,1 }}--�Ȫe������������									
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	return true;
end

Function LuaI_208297() --����n�B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208297]][$SETVAR3=[203525]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset = { 3 ,Prize1Str	, { 203525,5 } --
		        , 6 ,""	, {203525 ,1 } --
		       ,  10 ,""	, {206963 ,1 } --
		       , 14 ,""	, {206964 ,2 } --
		       , 20 ,""	, {206965 ,2 } --
	                     , 34 ,"" 	, {201619 ,5 } --
 		       , 56 ,"" 	, {201445 ,50 } --
		       , 78 ,"" 	, {203784 ,10} --
		       , 100 ,"" 	, {202904 ,5}} --
	local itemset2 = {  9 ,""	, { 208300 ,1 }}--�Ȫe������������									
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	return true;
end

Function LuaI_208298() --�L��n�B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208298]][$SETVAR3=[207147]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset = { 3 ,Prize1Str	, { 207147,1 } --
		        , 6 ,""	, {202881 ,1 } --
		       ,  10 ,""	, {206963 ,1 } --
		       , 14 ,""	, {206964 ,2 } --
		       , 20 ,""	, {206965 ,2 } --
	                     , 34 ,"" 	, {201619 ,5 } --
 		       , 56 ,"" 	, {201445 ,50 } --
		       , 78 ,"" 	, {203784 ,10} --
		       , 100 ,"" 	, {202904 ,5}} --
	local itemset2 = {  9 ,""	, { 208300 ,1 }}--�Ȫe������������									
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	return true;
end

Function LuaI_208299() --�j�v�����n�B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208299]][$SETVAR3=[203576]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset = { 3 ,Prize1Str	, { 203576,5 } --
		        , 6 ,""	, {203576 ,1 } --
		       ,  10 ,""	, {206963 ,1 } --
		       , 14 ,""	, {206964 ,2 } --
		       , 20 ,""	, {206965 ,2 } --
	                     , 34 ,"" 	, {201619 ,5 } --
 		       , 56 ,"" 	, {201445 ,50 } --
		       , 78 ,"" 	, {203784 ,10} --
		       , 100 ,"" 	, {202904 ,5}} --
	local itemset2 = {  9 ,""	, { 208300 ,1 }}--�Ȫe������������									
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	return true;
end

-----------2010-1119 �x�W�ɭ��N���~��J����
Function LuaI_208523()  --�ä[�ɭ��N���~��B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208523]][$SETVAR3=[206936]]"  --206936 �ä[�ɭ��N���~���M

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 206936 , 1 }
			, 5 ,""		, { 202929 , 2 }
			, 8 ,""		, { 201139 , 5 }
			, 13 ,""		, { 201086 , 1 } 
			, 21 ,"" 		, { 201141 , 5 }
			, 38 ,"" 		, { 202903 , 40 } 
			, 56 ,""		, { 202904 , 20 } 
			, 78 ,""		, { 201609 , 2 } 
			, 100 ,""	, { 201617 , 2 } 	}
							
	local itemset2 = {   5 ,""	, { 202846 , 1 }	}  --�C���]��

	local itemset3 = {   50 ,"" , { 208334 , 1 }	}  --�Ƹ����N���~�Ф�

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_208524()  --�C����ȭ��m����B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208524]][$SETVAR3=[202434]x5]"  --202434 �C����ȭ��m��x5

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 202434 , 5 }
			, 6 ,""		, { 202434 , 1 }
			, 10 ,""		, { 206963 , 1 }
			, 14 ,""		, { 206964 , 2 } 
			, 20 ,"" 		, { 206965 , 2 }
			, 34 ,"" 		, { 201619 , 5 } 
			, 56 ,""		, { 202435 , 10 } 
			, 78 ,""		, { 203784 , 10 } 
			, 100 ,""	, { 202904 , 5 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --�C���]��

	local itemset3 = {   9 ,"" , { 208334 , 1 }	}  --�Ƹ����N���~�Ф�

	BaseTressureProc( itemset1 , 1 )
	BaseTressureProc( itemset2 , 1 )
	BaseTressureProc( itemset3 , 1 )
	
	return true
end

function LuaI_208525() --�L����B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208525]][$SETVAR3=[207147]]"
	if Check_Bag_Space( OwnerID() , 3 ) == false then
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
	local itemset3 = { 9 ,""    , { 208334 ,1 }}--�Ƹ����N���~�Ф�

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_208526()  --�j�v������B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208526]][$SETVAR3=[203576]x5]"  --203576 �j�v�����ײz��

	if Check_Bag_Space( OwnerID() , 3 ) == false then
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

	local itemset3 = {   9 ,"" , { 208334 , 1 }	}  --�Ƹ����N���~�Ф�

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end


-----------2011-0106 �x�W�s��Ծs��J����
Function LuaI_208673()  --�ä[�s��Ծs��B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208673]][$SETVAR3=[206707]]"  --206936 �ä[�s��Ծs���M

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 206707 , 1 }
			, 5 ,""		, { 202929 , 2 }
			, 8 ,""		, { 201139 , 5 }
			, 13 ,""		, { 201086 , 1 } 
			, 21 ,"" 		, { 201141 , 5 }
			, 38 ,"" 		, { 202903 , 40 } 
			, 56 ,""		, { 202904 , 20 } 
			, 78 ,""		, { 201609 , 2 } 
			, 100 ,""	, { 201617 , 2 } 	}
							
	local itemset2 = {   5 ,""	, { 202846 , 1 }	}  --�C���]��

	local itemset3 = {   50 ,"" , { 208672 , 1 }	}  --��w���s��Ծs����

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_208674()  --������B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208674]][$SETVAR3=[203525]x5]"  --202434 �C����ȭ��m��x5

	if Check_Bag_Space( OwnerID() , 3 ) == false then
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

	local itemset3 = {   9 ,"" , { 208672 , 1 }	}  --��w���s��Ծs����

	BaseTressureProc( itemset1 , 1 )
	BaseTressureProc( itemset2 , 1 )
	BaseTressureProc( itemset3 , 1 )
	
	return true
end

function LuaI_208675() --�L����B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208675]][$SETVAR3=[207147]]"
	if Check_Bag_Space( OwnerID() , 3 ) == false then
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

	local itemset3 = { 9 ,""    , { 208672 ,1 }}--��w���s��Ծs����

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_208676()  --�j�v������B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208676]][$SETVAR3=[203576]x5]"  --203576 �j�v�����ײz��

	if Check_Bag_Space( OwnerID() , 3 ) == false then
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

	local itemset3 = {   9 ,"" , { 208672 , 1 }	}  --��w���s��Ծs����

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end


-----------2011-0211 �x�W�H�S�Ժ���J����
Function LuaI_209168()  --�ä[�H�S�Ժ���B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209168]][$SETVAR3=[207503]]"  --206936 �ä[�H�S�Ժ����M

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 207503 , 1 }
			, 5 ,""		, { 202929 , 2 }
			, 8 ,""		, { 201139 , 5 }
			, 13 ,""		, { 201086 , 1 } 
			, 21 ,"" 		, { 201141 , 5 }
			, 38 ,"" 		, { 202903 , 40 } 
			, 56 ,""		, { 202904 , 20 } 
			, 78 ,""		, { 201609 , 2 } 
			, 100 ,""	, { 201617 , 2 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --�C���]��

	local itemset3 = {   50 ,"" , { 209167 , 1 }	}  --���W���H�S�Ժ�����

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_209169()  --�C����ȭ��m����B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209169]][$SETVAR3=[202434]x5]"  --202434 �C����ȭ��m��x5

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 202434 , 5 }
			, 6 ,""		, { 202434 , 1 }
			, 10 ,""		, { 206963 , 1 }
			, 14 ,""		, { 206964 , 2 } 
			, 20 ,"" 		, { 206965 , 2 }
			, 34 ,"" 		, { 201619 , 5 } 
			, 56 ,""		, { 202435 , 10 } 
			, 78 ,""		, { 203784 , 10 } 
			, 100 ,""	, { 202904 , 5 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --�C���]��
	local itemset3 = {   50 ,"" , { 209167 , 1 }	}  --���W���H�S�Ժ�����

	BaseTressureProc( itemset1 , 1 )
	BaseTressureProc( itemset2 , 1 )
	BaseTressureProc( itemset3 , 1 )
	
	return true
end

function LuaI_209170() --�L����B�J
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[209170]][$SETVAR3=[207147]]"
	if Check_Bag_Space( OwnerID() , 3 ) == false then
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
	local itemset3 = {   50 ,"" , { 209167 , 1 }	}  --���W���H�S�Ժ�����

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_209171()  --�j�v������B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209171]][$SETVAR3=[203576]x5]"  --203576 �j�v�����ײz��

	if Check_Bag_Space( OwnerID() , 3 ) == false then
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
	local itemset3 = {   50 ,"" , { 209167 , 1 }	}  --���W���H�S�Ժ�����

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end
