Function LuaI_207978() --���ѱ������B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207978]][$SETVAR3=[206278]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 206278,1 } --�ä[���R����999���M
		        , 5 ,""	, { 202929,2 } --�]���_����q50�I
		       , 8 ,""	, { 201139,5 } --�j�ѨϪ��Į�
		       , 15 ,""	, { 201141,5 } --�ᥧ�J������ū
		       , 25 ,""	, { 202903,40 } --�ǰe�̲Ť�
	                     , 50 ,"" 	, { 202904,20 } --�ǰe���Ť�
 		       , 75 ,"" 	, { 201609,2 } --���ĸg���ľ�
		       , 100 ,"" 	, { 201617,2 }} --�M�a�ޯ��ľ�

	local itemset2 = {  50 ,""	, { 207979,1 }}--������A���J�߸H��					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_207980() --���穯�B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207980]][$SETVAR3=[203525]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 203525,5 } --����ū�o��x5
		        , 5 ,""	, { 203525,1 } --����ū�o��x1
		       , 8 ,""	, { 201458,3 } --�t���Z����
		       , 15 ,""	, { 203043,5 } --�t��������
		       , 25 ,""	, { 201459,5 } --�t���˳ƥ�
	                     , 50 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
 		       , 75 ,"" 	, { 203784,10 } --���|�����ǰe��
		       , 100 ,"" 	, { 202904,5 }} --�ǰe���Ť�

	local itemset2 = {  9 ,""	, { 207979,1 }}--������A���J�߸H��					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_208177() --�L�婯�B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208177]][$SETVAR3=[207147]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 207147,1 } --�L��x5
		        , 5 ,""	, { 202881,1 } --�L��x1
		       , 8 ,""	, { 201458,3 } --�t���Z����
		       , 15 ,""	, { 203043,5 } --�t��������
		       , 25 ,""	, { 201459,5 } --�t���˳ƥ�
	                     , 50 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
 		       , 75 ,"" 	, { 203784,10 } --���|�����ǰe��
		       , 100 ,"" 	, { 202904,5 }} --�ǰe���Ť�

	local itemset2 = {  9 ,""	, { 207979,1 }}--������A���J�߸H��					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_208178() --�j�v�������B�J

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208178]][$SETVAR3=[203576]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 203576,5 } --����ū�o��x5
		        , 5 ,""	, { 203576,1 } --����ū�o��x1
		       , 8 ,""	, { 201458,3 } --�t���Z����
		       , 15 ,""	, { 203043,5 } --�t��������
		       , 25 ,""	, { 201459,5 } --�t���˳ƥ�
	                     , 50 ,"" 	, { 201445,50 } --�@���W�D�۸ܻ�
 		       , 75 ,"" 	, { 203784,10 } --���|�����ǰe��
		       , 100 ,"" 	, { 202904,5 }} --�ǰe���Ť�

	local itemset2 = {  9 ,""	, { 207979,1 }}--������A���J�߸H��					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

function Lua_FN_GAMANIA_20100819_1()
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
	--BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --�ˬdNPC�P���a���Z��
	SetSpeakDetail( OwnerID(), "[FN_GAMANIA_20100819_0]" ) --�A�b�ʶR����J���A�O�_���o��Q�n���F��O�H...
	AddSpeakOption( OwnerID(), TargetID(), "[FN_GAMANIA_20100819_1]", "Lua_FN_GAMANIA_20100819_2",0 )--�ڷQ�I�����Ŧ��l

end


function Lua_FN_GAMANIA_20100819_2()
	
	local X =CountBodyItem( OwnerID(), 207979) --�ˬd���a���W���J�߸H���ƶq
	
	if X>=5 then
		DelBodyItem( OwnerID(), 207979, 5)
		GiveBodyItem( OwnerID(), 202844,1)
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[FN_GAMANIA_20100819_2]" , C_SYSTEM )  --���ߧA�o��F<CS>[202844]</CS>
		CloseSpeak ( OwnerID())

	elseif X < 5 then
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[FN_GAMANIA_20100819_3]" , C_SYSTEM ) --�z���W�èS��������[207979]�� 
		CloseSpeak ( OwnerID())
	end
end
