Function LuaI_206543() --�Ѱ���߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206543]][$SETVAR3=[206283]]"
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206543]][$SETVAR3=[202929]]"
 
	local itemset = { 4 , Prize1Str	, { 206283,1 }
		        , 7 , Prize2Str	, { 202929,1 }
		       , 13 ,""	, { 222926,1 }
	                       , 20 ,""	, { 222925,1 }
		       , 40 ,""	, { 202903,40 } 
		       , 60 ,"" 	, { 202435,40 }
		       , 80 ,"" 	, { 201609,2 } 
		       , 100,""	, { 201617,2 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206544() --�¤Ѱ���߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206544]][$SETVAR3=[206289]]"
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206544]][$SETVAR3=[202929]]"

	local itemset = { 4 ,Prize1Str	, { 206289,1 }
                         	        , 7 ,Prize2Str	, { 202929,1 }
		      , 13 ,""	, { 222926,1 }
		      , 20 ,""	, { 222925,1 }
		      , 40 ,""	, { 202903,40 } 
		      , 60 ,"" 	, { 202435,40 }
		      , 80 ,"" 	, { 201609,2 } 
		     , 100,""	, { 201617,2 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206545() --�C����ȭ��m��^�X�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206545]][$SETVAR3=[202434]x5]"
	
	local itemset = { 3 ,Prize1Str	, { 202434,5 }
		        , 8 ,""	, { 202434,1 }
		      , 16 ,""	, { 201450,5 }
		      , 26 ,""	, { 203042,10 }
		      , 36 ,""	, { 201457,10 } 
		      , 56 ,"" 	, { 201141,1 }
		      , 78 ,"" 	, { 202435,10 } 
		    , 100,""	, { 202904,5 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206546() --�L��^�X�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206546]][$SETVAR3=[202881]x5]"

	local itemset = { 3 ,Prize1Str	, { 202881,1 , 202881,1 , 202881,1 , 202881,1 , 202881,1}
		        , 8 ,""	, { 202881,1 }
		      , 16 ,""	, { 201450,5 }
		      , 26 ,""	, { 203042,10 }
		      , 36 ,""	, { 201457,10 } 
		      , 56 ,"" 	, { 201141,1 }
		      , 78 ,"" 	, { 202435,10 } 
		     , 100,""	, { 202904,5 } }

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_206547() --���I��߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206547]][$SETVAR3=[206275]]"
	
	local itemset = { 4 ,Prize1Str	, { 206275,1 }
                                       , 7 ,""	, { 203576,1 }
		     , 10 ,""	, { 201139,5 }
		     , 15 ,""	, { 201141,5 }
		     , 21 ,""	, { 201086,1 }
		     , 28 ,""	, { 201607,5 } 
		     , 44 ,""	, { 202903,40 } 
		     , 60 ,"" 	, { 202435,40 }
		     , 80 ,"" 	, { 201609,2 } 
		    , 100,""	, { 201617,2 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206910() --��v���I��߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206910]][$SETVAR3=[206284]]"
	
	local itemset = { 4 ,Prize1Str	, { 206284,1 }
		        , 7 ,""	, { 203576,1 }
		      , 10 ,""	, { 201139,5 }
		      , 15 ,""	, { 201141,5 }
		      , 21 ,""	, { 201086,1 }
		      , 28 ,""	, { 201607,5 } 
		      , 44 ,""	, { 202903,40 } 
		      , 60 ,"" 	, { 202435,40 }
		      , 80 ,"" 	, { 201609,2 } 
		     , 100,""	, { 201617,2 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206998() --�g�b�r����߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206998]][$SETVAR3=[206196]]"


	local itemset = { 4 ,Prize1Str	, { 206196,1 } --�ä[�g�b�r�����M
			, 7 ,""		, { 202506,5 } --�����ײz��
			, 10 ,""	, { 201139,5 } --�j�ѨϪ��Į�
			, 12 ,""	, { 206546,10 } --�L��^�X�J
			, 19 ,""	, { 201607,5 } --�ĦX�֤�
			, 30 ,"" 	, { 201141,10 } --�ᥧ�J������ū
			, 45 ,"" 	, { 202904,20 } --�ǰe���Ť�
			, 60 ,"" 	, { 202322,3 } --���ĩ��B�ľ�
			, 80 ,"" 	, { 201609,2 } --���ĸg���ľ�
			, 100,""	, { 201617,2 } } --�M�a�ޯ��ľ�

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206999() --�ʹ��먤�R����߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206999]][$SETVAR3=[204965]]"


	local itemset = { 4 ,Prize1Str	, { 204965,1 } --�ä[�ʹ��먤�R�����M
			, 7 ,""		, { 202506,5 } --�����ײz��
			, 10 ,""	, { 201139,5 } --�j�ѨϪ��Į�
			, 12 ,""	, { 206546,10 } --�L��^�X�J
			, 19 ,""	, { 201607,5 } --�ĦX�֤�
			, 30 ,"" 	, { 201141,10 } --�ᥧ�J������ū
			, 45 ,"" 	, { 202904,20 } --�ǰe���Ť�
			, 60 ,"" 	, { 202322,3 } --���ĩ��B�ľ�
			, 80 ,"" 	, { 201609,2 } --���ĸg���ľ�
			, 100,""	, { 201617,2 } } --�M�a�ޯ��ľ�

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_207000() --�¦�먤�R����߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[207000]][$SETVAR3=[204277]]"


	local itemset = { 4 ,Prize1Str	, { 204277,1 } --�ä[�¦�먤�R�����M
			, 7 ,""		, { 202506,5 } --�����ײz��
			, 10 ,""	, { 201139,5 } --�j�ѨϪ��Į�
			, 12 ,""	, { 206546,10 } --�L��^�X�J
			, 19 ,""	, { 201607,5 } --�ĦX�֤�
			, 30 ,"" 	, { 201141,10 } --�ᥧ�J������ū
			, 45 ,"" 	, { 202904,20 } --�ǰe���Ť�
			, 60 ,"" 	, { 202322,3 } --���ĩ��B�ľ�
			, 80 ,"" 	, { 201609,2 } --���ĸg���ľ�
			, 100,""	, { 201617,2 } } --�M�a�ޯ��ľ�

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_207001() --�C����ȭ��m����߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[207001]][$SETVAR3=[202434]x5]"


	local itemset = { 3 ,Prize1Str	, { 202434,5 } --�C����ȭ��m��
			, 8 ,""		, { 202434,1 } --�C����ȭ��m��
			, 16 ,""	, { 201458,3 } --�t���Z����
			, 26 ,""	, { 203043,5 } --�t��������
			, 36 ,""	, { 201459,5 } --�t���˳ƥ�
			, 58 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
			, 78 ,"" 	, { 202435,10 } --�a������
			, 100,""	, { 202904,5 } } --�ǰe���Ť�

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_207002() --�L����߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[207002]][$SETVAR3=[202881]x5]"


	local itemset = { 3 ,Prize1Str	, { 202881,1 , 202881,1 , 202881,1 , 202881,1 , 202881,1}
			, 8 ,""		, { 202881,1 } --�L�庲�ѥ�
			, 16 ,""	, { 201458,3 } --�t���Z����
			, 26 ,""	, { 203043,5 } --�t��������
			, 36 ,""	, { 201459,5 } --�t���˳ƥ�
			, 58 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
			, 78 ,"" 	, { 202435,10 } --�a������
			, 100,""	, { 202904,5 } } --�ǰe���Ť�

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_207003() --�j�v�����ײz��^�X�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[207003]][$SETVAR3=[203576]x5]"


	local itemset = { 3 ,Prize1Str	, { 203576,5 } --�j�v�����ײz��
		        , 8 ,""	, { 203576,1 } --�j�v�����ײz��
		       , 16 ,""	, { 201458,3 } --�t���Z����
		       , 26 ,""	, { 203043,5 } --�t��������
		       , 36 ,""	, { 201459,5 } --�t���˳ƥ�
	                       , 58 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
		       , 78 ,"" 	, { 202435,10 } --�a������
		     , 100,""	, { 202904,5 } } --�ǰe���Ť�

	return BaseTressureProc(   itemset , 1  )
end



Function LuaI_207112() --�]����L�]�ۧ�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207112]][$SETVAR3=[206564]]"


	local itemset = { 4 ,Prize1Str	, { 206564,1 } --�ä[�]����L���M
		       , 6 ,""	, { 202506,10 } --�����ײz��
		       , 8 ,""	, { 201139,5 } --�j�ѨϪ��Į�
		       , 11 ,""	, { 203784,40 } --���|�����ǰe��
	                     , 14 ,"" 	, { 203062,1 } --�j�v�Ũ��㥴�ը�
 		       , 29 ,"" 	, { 201141,10 } --�ᥧ�J������ū
		       , 45 ,"" 	, { 202904,20 } --�ǰe���Ť�
		       , 60 ,"" 	, { 202322,3 } --���ĩ��B�ľ�
		       , 78 ,"" 	, { 201609,2 } --���ĸg���ľ�
		     , 100,""	, { 201617,2} } --�M�a�ޯ��ľ�

	return BaseTressureProc(   itemset , 1  )
end



Function LuaI_207113() --�`�W���L�]�ۧ�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207113]][$SETVAR3=[206567]]"


	local itemset = { 4 ,Prize1Str	, { 206567,1 } --�ä[�`�W���L���M
		       , 6 ,""	, { 202506,10 } --�����ײz��
		       , 8 ,""	, { 201139,5 } --�j�ѨϪ��Į�
		       , 11 ,""	, { 203784,40 } --���|�����ǰe��
	                     , 14 ,"" 	, { 203062,1 } --�j�v�Ũ��㥴�ը�
 		       , 29 ,"" 	, { 201141,10 } --�ᥧ�J������ū
		       , 45 ,"" 	, { 202904,20 } --�ǰe���Ť�
		       , 60 ,"" 	, { 202322,3 } --���ĩ��B�ľ�
		       , 80 ,"" 	, { 201609,2 } --���ĸg���ľ�
		     , 100,""	, { 201617,2} } --�M�a�ޯ��ľ�

	return BaseTressureProc(   itemset , 1  )
end


