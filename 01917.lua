Function LuaI_207143() --������߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207143]][$SETVAR3=[206946]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 206946,1 } --�ä[�ů���L���M
		        , 6 ,""	, { 203058,2 } --�M�a�ŪZ�����ը�
		       , 9 ,""	, { 201139,5 } --�j�ѨϪ��Į�
		       , 14 ,""	, { 201141,5 } --�ᥧ�J������ū
		       , 20 ,""	, { 201086,1 } --�����ޯ୫�m��
	                     , 28 ,"" 	, { 201607,5 } --�ĦX�֤�
 		       , 44 ,"" 	, { 202903,40 } --�ǰe�̲Ť�
		       , 60 ,"" 	, { 202904,20 } --�ǰe���Ť�
		       , 80 ,"" 	, { 201609,2 } --���ĩ��B�ľ�
		       , 100 ,"" 	, { 201617,2 }} --�M�a�ޯ��ľ�

	local itemset2 = {  50 ,""	, { 205684,1 }}--�{ģ���~���J�߸H��					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end



Function LuaI_207144() --�C����ȭ��m����߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207144]][$SETVAR3=[202434]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 202434,5 } --�C����ȭ��m��
		        , 8 ,""	, { 202434,1 } --�C����ȭ��m��
		       , 16 ,""	, { 201458,3 } --�t���Z����
		       , 26 ,""	, { 203043,5 } --�t��������
		       , 36 ,""	, { 201459,5 } --�t���˳ƥ�
	                     , 56 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
 		       , 78 ,"" 	, { 203784,10 } --���|�����ǰe��
		       , 100 ,"" 	, { 202904,5 }} --�ǰe���Ť�

	local itemset2 = {  10 ,""	, { 205684,1 }}--�{ģ���~���J�߸H��					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end



Function LuaI_207145() --�L����߳J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207145]][$SETVAR3=[207147]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 207147, 1 } --�L�庲�ѥ�(5)�]
		        , 8 ,""	, { 202881,1 } --�L�庲�ѥ�
		       , 16 ,""	, { 201458,3 } --�t���Z����
		       , 26 ,""	, { 203043,5 } --�t��������
		       , 36 ,""	, { 201459,5 } --�t���˳ƥ�
	                     , 58 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
 		       , 78 ,"" 	, { 202435,10 } --�a������
		       , 100 ,"" 	, { 202904,5 }} --�ǰe���Ť�

	local itemset2 = {  10 ,""	, { 205684,1 }}--�{ģ���~���J�߸H��					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end



Function LuaI_207146() --�j�v�����ײz��^�X�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207146]][$SETVAR3=[203576]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 203576, 5 } --�j�v�����ײz��
		        , 8 ,""	, { 203576,1 } --�j�v�����ײz��
		       , 16 ,""	, { 201458,3 } --�t���Z����
		       , 26 ,""	, { 203043,5 } --�t��������
		       , 36 ,""	, { 201459,5 } --�t���˳ƥ�
	                     , 58 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
 		       , 78 ,"" 	, { 202435,10 } --�a������
		       , 100 ,"" 	, { 202904,5 }} --�ǰe���Ť�

	local itemset2 = {  10 ,""	, { 205684,1 }}--�{ģ���~���J�߸H��					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end


function LuaS_bluewing_na_01()

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --�ˬdNPC�P���a���Z��

	SetSpeakDetail( OwnerID(), "[SC_BLUEWING_01]" ) --�A�b�ʶR����J���A�O�_���o��Q�n���F��O�H...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BLUEWING_02]", "LuaS_bluewing_na_02",0 )--�ڷQ�I�����Ŧ��l

end


function LuaS_bluewing_na_02()
	
	local X =CountBodyItem( OwnerID(), 205684) --�ˬd���a���W���J�߸H���ƶq
	
	if X>=5 then
		DelBodyItem( OwnerID(), 205684, 5)
		GiveBodyItem( OwnerID(), 226295,1)
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_BLUEWING_03]" , C_SYSTEM )  --���ߧA�o��F<CS>���Ŧ��l</CS>�C
		CloseSpeak ( OwnerID())

	elseif X == 0 then
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_BLUEWING_04]" , C_SYSTEM ) --�A���W�èS������{ģ���~���J�߸H���C 
		CloseSpeak ( OwnerID())
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_BLUEWING_05]" , C_SYSTEM )  --�A���W�S�����H�I�����y���{ģ���~���J�߸H���C
		CloseSpeak ( OwnerID()) 
	end
end

